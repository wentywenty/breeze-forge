# 查找 x86_64 / i686 的共同 dtc 版本并计算 dtc 包的 sha256

function Get-VersionKey {
    param([string]$v) # e.g. "1.7.2-1"
    if ($null -eq $v) { return "000000000000" }
    if ($v -match '^([0-9]+(?:\.[0-9]+)*)(?:-(\d+))?$') {
        $core = $Matches[1]
        $rev = if ($Matches[2]) { $Matches[2] } else { '0' }
        $parts = $core -split '\.' | ForEach-Object {
            # 填充每段为 4 位数字，保证可字符串比较
            $_.ToString().PadLeft(4,'0')
        }
        $revStr = $rev.ToString().PadLeft(4,'0')
        return ($parts -join '.') + '.' + $revStr
    } else {
        return "000000000000"
    }
}

# 抓取版本列表
Write-Host "Fetching msys2 repo pages..."
$body64 = (Invoke-WebRequest 'https://repo.msys2.org/msys/x86_64/').Content
$body32 = (Invoke-WebRequest 'https://repo.msys2.org/msys/i686/').Content

$rx64 = [regex] 'dtc-([\d.]+-\d+)-x86_64\.pkg\.tar\.zst'
$rx32 = [regex] 'dtc-([\d.]+-\d+)-i686\.pkg\.tar\.zst'

$versions64 = $rx64.Matches($body64) | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
$versions32 = $rx32.Matches($body32) | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique

Write-Host "x86_64 versions: $($versions64 -join ', ')"
Write-Host "i686 versions:   $($versions32 -join ', ')"

# 求交集
$common = $versions64 | Where-Object { $versions32 -contains $_ }

if (-not $common -or $common.Count -eq 0) {
    Write-Host "没有找到共同版本，建议使用仅 x86_64 autoupdate 或等待 i686 同步。" -ForegroundColor Yellow
    exit 1
}

# 按自定义键排序并选择最新
$latest = $common | Sort-Object -Property @{ Expression = { Get-VersionKey $_ } } -Descending | Select-Object -First 1
Write-Host "选定的共同最新版本: $latest"

# 构造下载 URL 并下载计算哈希
$temp = [IO.Path]::GetTempPath()
function Get-HashForUrl($url) {
    $name = [IO.Path]::GetFileName($url)
    $out = Join-Path $temp $name
    Write-Host "Downloading $url ..."
    Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing -ErrorAction Stop
    $h = (Get-FileHash -Algorithm SHA256 $out).Hash.ToLower()
    return "sha256:$h"
}

$u64 = "https://repo.msys2.org/msys/x86_64/dtc-$latest-x86_64.pkg.tar.zst"
$u32 = "https://repo.msys2.org/msys/i686/dtc-$latest-i686.pkg.tar.zst"

try {
    $h64 = Get-HashForUrl $u64
    $h32 = Get-HashForUrl $u32
} catch {
    Write-Error "下载或计算哈希失败: $_"
    exit 1
}

# 输出建议的 manifest 片段
$manifestSnippet = @{
    version = $latest
    autoupdate = @{
        architecture = @{
            '64bit' = @{ url = "https://repo.msys2.org/msys/x86_64/dtc-$latest-x86_64.pkg.tar.zst" }
            '32bit' = @{ url = "https://repo.msys2.org/msys/i686/dtc-$latest-i686.pkg.tar.zst" }
        }
    }
    hashes = @{
        '64bit_dtc' = $h64
        '32bit_dtc' = $h32
    }
}

# 避免使用反引号转义字符串，分三行输出空行 + 标题 + 空行
Write-Host ""
Write-Host "Suggested manifest fragment:"
Write-Host ""
$manifestSnippet | ConvertTo-Json -Depth 6

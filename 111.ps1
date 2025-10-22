$urls = @(
  "https://mirror.msys2.org/msys/i686/dtc-1.7.2-1-i686.pkg.tar.zst",
  "https://mirror.msys2.org/msys/i686/gcc-libs-13.3.0-1-i686.pkg.tar.zst",
  "https://mirror.msys2.org/msys/i686/libyaml-0.2.5-2-i686.pkg.tar.zst",
  "https://repo.msys2.org/msys/i686/msys2-runtime-3.3-3.3.6-13-i686.pkg.tar.zst"
)
foreach ($u in $urls) {
  $name = Split-Path $u -Leaf
  $out = Join-Path $env:TEMP $name
  Write-Host "Downloading $u -> $out"
  Invoke-WebRequest -Uri $u -OutFile $out
  $h = (Get-FileHash -Algorithm SHA256 $out).Hash
  Write-Host "$name : $h"
}

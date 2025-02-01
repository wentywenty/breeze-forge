# 以下是您提供的内容以 Markdown 格式编写：

## JSON 字段说明

### architecture
如果应用程序不是 32 位，则可以使用架构来包装差异（示例）。

### 32bit | 64bit | arm64
包含特定于体系结构的指令（如 `bin`、`extract_dir`、`hash`、`installer`、`pre_install`、`post_install`、`shortcuts`、`uninstaller`、`url`、`msi`）。

### autoupdate
定义清单如何自动更新。

### bin
在用户路径上可用的程序（可执行文件或脚本）的字符串或字符串数组。您还可以创建一个别名 shim，它使用与实际可执行文件不同的名称，并（可选）将参数传递给可执行文件。不要只使用字符串作为可执行文件，而是使用例如：`[ "program.exe", "alias", "--arguments" ]`。请参阅 `busybox` 以获取示例。但是如果你只声明一个这样的垫片，你必须确保它被包含在外部数组中，例如：`"bin": [ [ "program.exe", "alias" ] ]`。否则它将被读取为单独的垫片。

### checkver
应用程序维护人员和开发人员可以使用 `bin/checkver` 工具检查应用程序的更新版本。`checkver` 清单中的属性是一个正则表达式，可用于从应用程序的主页匹配应用程序的当前稳定版本。有关示例，请参阅 `go` 清单。如果主页没有可靠的当前版本指示，您还可以指定不同的 URL 进行检查 - 有关示例，请参阅 `ruby` 清单。

### depends
将自动安装应用程序的运行时依赖项。另请参阅 `suggest`（下文）以了解 `depends` 的替代方案。

### env_add_path
将此目录添加到用户路径（或系统路径，如果使用 `--global`）。该目录相对于安装目录，并且必须位于安装目录内。

### env_set
为用户（或系统，如果使用 `--global`）设置一个或多个环境变量（示例）。

### extract_dir
如果 `url` 指向压缩文件（支持 `.zip`、`.7z`、`.tar`、`.gz`、`.lzma` 和 `.lzh`），Scoop 将仅从中提取指定的目录。

### extract_to
如果 `url` 指向一个压缩文件（支持 `.zip`、`.7z`、`.tar`、`.gz`、`.lzma` 和 `.lzh`），Scoop 将把所有内容提取到指定的目录中（示例）。

### hash
包含每个 URL 的文件哈希值的字符串或字符串数组 `url`。默认情况下，哈希值为 SHA256，但您可以通过在哈希字符串前加上 `sha512:`、`sha1:` 或 `md5:` 来使用 SHA512、SHA1 或 MD5。

### innosetup
如果安装程序基于 InnoSetup，则设置为布尔值（不带引号）。

### installer
运行非 MSI 安装程序的说明。

- **file**：安装程序可执行文件。默认 `installer` 为上次下载的 URL。必须为 `uninstaller` 指定。
- **script**：要作为安装程序/卸载程序执行的单行字符串或字符串数组 `file`。
- **args**：传递给安装程序的参数数组。可选。
- **keep**：`"true"` 是否应在运行后保留安装程序（例如，用于将来的卸载）。如果省略或设置为任何其他值，则安装程序将在运行后被删除。请参阅 `extras/oraclejdk` 示例。在指令中使用时，此选项将被忽略 `uninstaller`。

更新url

### notes
单行字符串或字符串数组，包含安装应用程序后显示的消息。

### persist
目录和文件的字符串或字符串数组，用于在应用程序的数据目录中持久保存。持久数据。

### post_install
应用程序安装后要执行的命令的单行字符串或字符串数组。这些命令可以使用诸如 `$dir`、`$persist_dir` 和 `$version` 之类的变量。有关更多详细信息，请参阅安装前/安装后（卸载）脚本。

### pre_install
与 `post_install` 相同的选项，但在应用程序安装之前执行。

### pre_uninstall
与 `post_install` 相同的选项，但在应用程序卸载之前执行。

### post_uninstall
与 `post_install` 相同的选项，但在应用程序卸载后执行。

### psmodule
作为 PowerShell 模块安装 `~/scoop/modules`。

- **name**（必需 `psmodule`）：模块的名称，该名称应与解压目录中的至少一个文件匹配，以便 PowerShell 将其识别为模块。

### shortcuts
指定在开始菜单中可用的快捷方式值。请参阅 `sourcetree` 以获取示例。数组必须包含可执行文件/标签对。第三和第四个元素是可选的。

- **目标文件路径**（必填）
- **快捷方式的名称**（支持子目录：`<AppsSubDir>\\<AppShortcut>` 例如 `sysinternals`）（必填）
- **启动参数**（可选）
- **图标文件路径**（可选）

### suggest
显示一条消息，建议提供补充功能的可选应用程序。请参阅 `ant` 的示例。

```json
["Feature Name"] = [ "app1", "app2"... ]
```

例如：

```json
"JDK": [ "extras/oraclejdk", "openjdk" ]
```

如果已安装针对该功能建议的任何应用程序，则该功能将被视为“已实现”，并且用户将不会看到任何建议。

### uninstaller
与 `installer` 相同的选项，但运行文件/脚本来卸载应用程序。

Scoop 在 `scoop uninstall` 和 `scoop update` 期间调用。
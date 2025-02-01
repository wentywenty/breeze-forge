# Breeze Forge Bucket

## 简介

Breeze Forge 是一个专注于开发工具和库的 Scoop bucket。我们提供了多个常用的开发工具和库的安装包，让 Windows 开发者能够更方便地管理和使用这些工具。

## 当前收录的软件

### 开发工具

- **nRF Util** (v7.12.0) - Nordic 产品统一命令行工具
- **Repo** (v2.51) - Google 开发的多 Git 仓库管理工具
- **Chroot** (v2.0) - Linux chroot 工具的 Windows 移植版
- **DTC** (v1.7.2) - 设备树编译器
- **Gperf** (v3.1) - GNU 完美哈希生成器

### 开发库

- **Asio** (v1.32.0) - 跨平台 C++ 异步 I/O 库
- **Boost** (v1.87.0) - C++ 通用开发库
- **TinyXML2** (v10.0.0) - 轻量级 C++ XML 解析器
- **Bullet** (v3.25) - 实时物理引擎库 [开发中]
- **Eigen** (待添加) - C++ 模板矩阵运算库 [计划中]

### 专业软件

- **SimuroSot5** (v25.1.18) - 机器人足球仿真平台

## 使用方法

1. 首先添加我们的 bucket：

```powershell
scoop bucket add breeze-forge https://github.com/breeze-forge/breeze-bucket
```

2. 然后即可安装软件：

```powershell
scoop install breeze-forge/<package-name>
```

## 特性

- 📦 精选的开发工具和库
- 🔄 自动更新检查
- ⚡ 快速安装和卸载
- 🛠️ 完整的依赖管理
- 💻 Windows 优化支持

## 贡献指南

欢迎提交 Pull Request 来帮助改进这个 bucket。在提交之前，请确保：

1. 遵循 [Scoop 的清单指南](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifest-Autoupdate)
2. 测试安装和卸载过程
3. 提供准确的版本信息和哈希值

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 联系我们

如果您有任何问题或建议，请：

1. [提交 Issue](https://github.com/breeze-forge/breeze-bucket/issues)
2. [发起 Pull Request](https://github.com/breeze-forge/breeze-bucket/pulls)

## 鸣谢

感谢所有为此项目做出贡献的开发者！

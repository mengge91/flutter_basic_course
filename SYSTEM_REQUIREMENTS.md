# Flutter 3.22 基础课程 Demo - 系统配置要求

## 🖥️ 操作系统要求

### Windows
- **最低版本**: Windows 10 (版本 1903 或更高)
- **推荐版本**: Windows 11
- **架构**: x64 (64位)
- **Windows Subsystem for Linux (WSL)**: 支持 WSL 2

### macOS
- **最低版本**: macOS 10.15 (Catalina)
- **推荐版本**: macOS 12 (Monterey) 或更高
- **架构**: Intel 或 Apple Silicon (M1/M2)
- **Xcode**: 12.0 或更高版本

### Linux
- **发行版**: Ubuntu 18.04 LTS 或更高版本
- **其他支持**: Debian 9+, CentOS 7+, Fedora 28+
- **架构**: x64 (64位)
- **内核版本**: 3.10 或更高

## 🛠️ 必需软件

### 1. Flutter SDK
- **版本**: 3.22.0 或更高
- **下载地址**: https://docs.flutter.dev/get-started/install
- **安装路径**: 
  - Windows: `C:\flutter`
  - macOS: `~/flutter`
  - Linux: `~/development/flutter`

### 2. Dart SDK
- **版本**: 3.2.0 或更高
- **说明**: 通常随Flutter一起安装，无需单独安装
- **验证命令**: `dart --version`

### 3. Git
- **版本**: 2.0 或更高
- **用途**: 版本控制和依赖管理
- **安装方式**:
  - Windows: 从 https://git-scm.com/ 下载
  - macOS: `brew install git`
  - Linux: `sudo apt-get install git`

## 💻 开发工具

### Android Studio (推荐)
- **版本**: Android Studio Hedgehog (2023.1.1) 或更高
- **插件**: Flutter 插件、Dart 插件
- **Android SDK**: API 21 (Android 5.0) 或更高
- **下载地址**: https://developer.android.com/studio

### VS Code (轻量级选择)
- **版本**: 1.80.0 或更高
- **扩展**: 
  - Flutter 扩展
  - Dart 扩展
  - Flutter Widget Snippets
- **下载地址**: https://code.visualstudio.com/

### Xcode (仅macOS)
- **版本**: 12.0 或更高
- **安装方式**: 从App Store下载
- **命令行工具**: `xcode-select --install`
- **iOS模拟器**: 随Xcode一起安装

## 📱 移动平台开发

### Android 开发
- **Android SDK**: 最低 API 21 (Android 5.0)
- **Android SDK Build-Tools**: 30.0.0 或更高
- **Android SDK Platform-Tools**: 30.0.0 或更高
- **Android 模拟器**: API 30 (Android 11) 或更高
- **硬件加速**: 支持 HAXM 或 KVM

### iOS 开发 (仅macOS)
- **iOS SDK**: 12.0 或更高
- **iOS 模拟器**: 支持 iOS 12.0 或更高
- **CocoaPods**: 1.10.0 或更高
- **安装命令**: `sudo gem install cocoapods`

### Web 开发
- **Chrome**: 90.0 或更高
- **Firefox**: 88.0 或更高
- **Safari**: 14.0 或更高
- **Edge**: 90.0 或更高

## 🔧 硬件要求

### 最低配置
- **处理器**: Intel i3 或 AMD Ryzen 3 (2017年或更新)
- **内存**: 8GB RAM
- **存储**: 10GB 可用空间
- **显卡**: 支持 OpenGL 3.0 的集成显卡
- **网络**: 稳定的互联网连接

### 推荐配置
- **处理器**: Intel i5 或 AMD Ryzen 5 (2019年或更新)
- **内存**: 16GB RAM
- **存储**: 20GB 可用空间 (SSD推荐)
- **显卡**: 独立显卡或集成显卡
- **网络**: 高速互联网连接

### 开发环境优化
- **SSD**: 显著提升编译和热重载速度
- **多核处理器**: 支持并行编译
- **大内存**: 支持多个模拟器同时运行

## 🌐 网络要求

### 必需网络服务
- **Flutter SDK 下载**: 约 1GB
- **Dart 包管理**: 访问 pub.dev
- **Android SDK 下载**: 约 2-5GB
- **iOS 模拟器**: 约 1-2GB
- **依赖包下载**: 根据项目复杂度

### 网络配置
- **防火墙**: 允许 Flutter 和开发工具的网络访问
- **代理**: 如果使用公司网络，可能需要配置代理
- **VPN**: 某些地区可能需要VPN访问Google服务

## 📋 环境变量配置

### Windows
```cmd
# 添加到系统环境变量 PATH
C:\flutter\bin

# 设置 Flutter 环境变量
FLUTTER_ROOT=C:\flutter
FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com
PUB_HOSTED_URL=https://pub.dev
```

### macOS/Linux
```bash
# 添加到 ~/.zshrc 或 ~/.bash_profile
export PATH="$PATH:$HOME/flutter/bin"
export FLUTTER_ROOT="$HOME/flutter"
export FLUTTER_STORAGE_BASE_URL="https://storage.googleapis.com"
export PUB_HOSTED_URL="https://pub.dev"
```

## 🔍 环境验证

### 运行 flutter doctor
```bash
flutter doctor
```

### 预期输出
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.22.0, on macOS 13.0 22A380, locale zh-CN)
[✓] Windows Version (Installed version of Windows is version 10 or higher)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Chrome - develop for the web
[✓] Visual Studio - develop for Windows (Visual Studio Community 2022 17.0.0)
[✓] Android Studio (version 2023.1.1)
[✓] VS Code (version 1.80.0)
[✓] Connected device (3 available)
[✓] Network resources

• No issues found!
```

## 🚨 常见问题

### 1. 权限问题
- **Windows**: 以管理员身份运行命令提示符
- **macOS**: 允许来自未知开发者的应用
- **Linux**: 使用 `sudo` 安装系统依赖

### 2. 网络连接问题
- 检查防火墙设置
- 配置代理服务器
- 使用VPN服务

### 3. 存储空间不足
- 清理临时文件
- 删除旧的SDK版本
- 使用外部存储设备

### 4. 版本兼容性
- 确保Flutter和Dart版本匹配
- 检查开发工具版本兼容性
- 更新到最新的稳定版本

## 📚 安装检查清单

### 基础安装
- [ ] Flutter SDK 安装完成
- [ ] 环境变量配置正确
- [ ] Git 安装并配置
- [ ] 网络连接正常

### 开发工具
- [ ] Android Studio 或 VS Code 安装
- [ ] Flutter 和 Dart 插件安装
- [ ] Android SDK 配置 (Android开发)
- [ ] Xcode 安装 (iOS开发)

### 平台支持
- [ ] Android 模拟器配置
- [ ] iOS 模拟器配置 (macOS)
- [ ] Web 浏览器支持
- [ ] 真机调试配置

### 验证测试
- [ ] `flutter doctor` 无错误
- [ ] 创建新Flutter项目成功
- [ ] 运行示例应用成功
- [ ] 热重载功能正常

## 🆘 技术支持

如果遇到安装或配置问题：

1. **查看官方文档**: https://docs.flutter.dev/get-started/install
2. **运行诊断命令**: `flutter doctor -v`
3. **搜索GitHub Issues**: https://github.com/flutter/flutter/issues
4. **社区论坛**: https://flutter.cn/community
5. **Stack Overflow**: 使用 `flutter` 标签

---

**注意**: 这些要求基于Flutter 3.22版本，随着Flutter的更新，某些要求可能会发生变化。建议定期检查官方文档获取最新信息。 
# mihomo 懒人版

基于 mihomo 内核的一键部署方案，包含完整配置和 Web UI 控制面板。

## 📥 下载

由于 mihomo.exe 核心文件较大（32MB），请前往 [Releases](https://github.com/hubentuan/mihomo-/releases) 页面下载完整版压缩包。

**最新版本**：[mihomo-lazy v1.2.0](https://github.com/hubentuan/mihomo-/releases/latest)

## ✨ 功能特点

- ✅ 基于 mihomo 内核
- ✅ 内置 Web UI 控制面板
- ✅ 包含完整配置文件
- ✅ 一键启动/停止脚本
- ✅ 懒人命令一键开启系统代理
- ✅ 自动清理旧进程，避免端口冲突

## 🚀 快速开始

### 1. 下载完整版
前往 [Releases](https://github.com/hubentuan/mihomo-/releases/latest) 页面下载 `mihomo-lazy.zip`

### 2. 解压文件
将压缩包解压到任意目录（建议英文路径）

### 3. 首次安装配置

**重要**：首次使用请按以下步骤操作：

1. 打开 `config.yaml` 文件，填写你的订阅链接
2. **右键点击 `首次安装.bat`，选择"以管理员身份运行"**
3. 脚本会自动完成以下操作：
   - 检查必要文件
   - 读取配置端口
   - 清理端口占用
   - 启动 Mihomo 服务
   - 设置系统代理
   - 显示实时启动日志（按 Enter 键可停止查看）

### 4. 后续启动

首次安装成功后，以后每次启动只需：

**双击 `start-mihomo.vbs`** 即可后台启动（会自动清理旧进程）

### 5. 访问控制面板

启动成功后，可以通过以下方式访问 Web UI 控制面板：

**本地面板（推荐）**：
- 地址：http://127.0.0.1:9090/ui/zashboard
- 优点：无需联网，速度快，隐私性好

**在线面板**：
- 地址：https://zash.xiaoyaogpt.com
- 优点：无需记住本地地址，任何设备均可访问

## 📁 文件结构

mihomo懒人版/
├── mihomo.exe           # 核心程序（32MB）
├── config.yaml          # 配置文件
├── 首次安装.bat          # 【新增】首次安装脚本
├── start-mihomo.vbs     # 【改进】启动脚本（自动清理旧进程）
├── 停止运行.bat          # 停止服务
├── 重启.bat             # 【修复】重启服务（支持任意路径）
├── 开启系统代理.bat      # 手动开启代理
├── 关闭系统代理.bat      # 手动关闭代理
├── 开启开机自动.bat      # 【修复】设置开机自启（支持任意路径）
├── 关闭开机自动.bat      # 【修复】取消开机自启
└── zashboard/          # Web UI 文件夹

## 🎨 控制面板

### 本地面板（推荐）
- 访问地址：http://127.0.0.1:9090/ui/zashboard
- 无需联网即可使用
- 速度快，隐私性好

### 在线面板
- 访问地址：https://zash.xiaoyaogpt.com/
- 适合多设备管理

### 面板功能
- 实时流量监控
- 代理节点切换
- 规则管理
- 连接管理
- 日志查看

## 📝 使用说明

### 首次使用
1. 编辑 `config.yaml` 填写订阅链接
2. 右键以管理员身份运行 `首次安装.bat`
3. 查看启动日志确认无误（按 Enter 停止查看）
4. 访问 http://127.0.0.1:9090/ui/zashboard 或在线面板

### 日常使用
双击 `start-mihomo.vbs` 即可后台启动

### 停止服务
运行 `停止运行.bat`

### 重启服务
运行 `重启.bat`

### 手动控制系统代理
- 开启代理：运行 `开启系统代理.bat`
- 关闭代理：运行 `关闭系统代理.bat`

### 设置开机自启
- 开启自启：运行 `开启开机自动.bat`
- 关闭自启：运行 `关闭开机自动.bat`

## ⚙️ 配置说明

### 默认端口
- 混合端口（HTTP + SOCKS5）：7890
- Web UI 面板：9090

### 修改端口
编辑 `config.yaml` 文件中的以下配置：
```yaml
mixed-port: 7890           # 代理端口
external-controller: 127.0.0.1:9090  # 面板端口
```

修改后运行 `重启.bat` 使配置生效

## ⚠️ 注意事项

- ⚡ 首次运行**必须**以管理员权限运行 `首次安装.bat`
- 🔥 请确保防火墙允许程序运行
- 📡 首次安装后会自动设置系统代理
- 💾 配置文件路径：`config.yaml`
- 🌐 默认端口：7890（代理）、9090（面板）
- 💾 如 mihomo 内核更新，请删除旧的 `mihomo.exe` 替换新版即可
- 🔄 `start-mihomo.vbs` 会自动清理旧进程，确保只运行一个实例

## ❓ 常见问题

### Q: 为什么仓库里没有 mihomo.exe？
A: 由于文件较大（32MB），GitHub 仓库不适合直接存放。请前往 [Releases](https://github.com/hubentuan/mihomo-/releases/latest) 页面下载完整压缩包。

### Q: 首次安装失败怎么办？
A: 
1. 确保以管理员身份运行 `首次安装.bat`
2. 检查 `config.yaml` 中是否正确填写了订阅链接
3. 查看启动日志中的错误提示
4. 确认端口 7890 和 9090 未被占用

### Q: 如何更新配置？
A: 直接编辑 `config.yaml` 文件，然后运行 `重启.bat` 重启服务即可。

### Q: 启动后没反应？
A: 
1. 检查是否被防火墙拦截
2. 尝试右键以管理员权限运行
3. 查看任务管理器是否有 mihomo.exe 进程
4. 访问 http://127.0.0.1:9090/ui/zashboard 检查面板是否可访问

### Q: 如何访问本地面板？
A: 启动服务后，浏览器访问 http://127.0.0.1:9090/ui/zashboard   ，即可。

### Q: 本地面板和在线面板有什么区别？
A: 
- **本地面板**：无需联网，速度快，数据不经过第三方服务器
- **在线面板**：方便记忆，可以在任何设备上访问，但需要联网

### Q: 如何确认服务已启动？
A: 
1. 访问 http://127.0.0.1:9090/ui/zashboard  ，能打开则服务正常
2. 查看任务管理器是否有 mihomo.exe 进程
3. 检查系统代理设置是否为 127.0.0.1:7890

## 📦 Release 下载

所有版本的完整压缩包（包含 mihomo.exe）都在 [Releases](https://github.com/hubentuan/mihomo-/releases) 页面提供下载。

## 🔗 相关链接

- Mihomo 项目：https://github.com/MetaCubeX/mihomo
- Zashboard 面板：https://github.com/Zephyruso/zashboard
- 本地面板地址：http://127.0.0.1:9090/ui/zashboard
- 在线面板地址：https://zash.xiaoyaogpt.com

---

**提示**：本仓库仅包含配置文件和脚本，完整版本请从 Release 下载。

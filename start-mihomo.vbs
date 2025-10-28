Set ws = CreateObject("Wscript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' 获取脚本所在目录
scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)

' 切换到脚本目录
ws.CurrentDirectory = scriptPath

' 检查 mihomo.exe 是否存在
If Not fso.FileExists(scriptPath & "\mihomo.exe") Then
    MsgBox "错误：未找到 mihomo.exe", vbCritical, "Mihomo 启动错误"
    WScript.Quit
End If

' 检查配置文件是否存在
If Not fso.FileExists(scriptPath & "\config.yaml") Then
    MsgBox "错误：未找到 config.yaml", vbCritical, "Mihomo 启动错误"
    WScript.Quit
End If

' ========================================
' 杀死所有正在运行的 mihomo.exe 进程
' ========================================
Set objWMI = GetObject("winmgmts:\\.\root\cimv2")
Set colProcesses = objWMI.ExecQuery("Select * from Win32_Process Where Name = 'mihomo.exe'")

If colProcesses.Count > 0 Then
    ' 发现运行中的 mihomo 进程，逐个终止
    For Each objProcess in colProcesses
        objProcess.Terminate()
    Next
    
    ' 等待进程完全结束
    WScript.Sleep 1000
End If

' ========================================
' 以管理员权限启动新的 mihomo 进程
' ========================================
Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "mihomo.exe", "-f config.yaml", scriptPath, "runas", 0

' 等待一下确保启动成功
WScript.Sleep 500

' 可选：验证进程是否启动成功
Set colNewProcesses = objWMI.ExecQuery("Select * from Win32_Process Where Name = 'mihomo.exe'")
If colNewProcesses.Count > 0 Then
    ' 启动成功，静默退出
    WScript.Quit
Else
    ' 启动失败，显示提示（可选）
    ' MsgBox "警告：Mihomo 可能未成功启动", vbExclamation, "Mihomo 启动"
    WScript.Quit
End If
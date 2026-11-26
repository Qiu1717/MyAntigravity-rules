# 少爷专属 Antigravity 环境一键恢复脚本 (restore-env.ps1)
$ErrorActionPreference = "Stop"

Write-Host "=== [1/4] 正在同步少爷的全局底层规则 (user-rules & GEMINI.md) ===" -ForegroundColor Cyan
$pluginsRoot = "$HOME\.gemini\config\plugins"
$userRulesDir = "$pluginsRoot\user-rules"
New-Item -ItemType Directory -Force -Path $pluginsRoot | Out-Null

if (Test-Path "$userRulesDir\.git") {
    git -C $userRulesDir pull --rebase
} else {
    if (Test-Path $userRulesDir) { Remove-Item -Recurse -Force $userRulesDir }
    git clone https://github.com/Qiu1717/MyAntigravity-rules.git $userRulesDir
}
Copy-Item "$userRulesDir\rules\AGENTS.md" "$HOME\.gemini\GEMINI.md" -Force
Write-Host "  -> 全局规则已同步至 ~/.gemini/GEMINI.md 与 user-rules 插件！" -ForegroundColor Green

Write-Host "=== [2/4] 正在创建默认工作区目录 E:\Antigravtiy-workspace ===" -ForegroundColor Cyan
if (Test-Path "E:\") {
    New-Item -ItemType Directory -Force -Path "E:\Antigravtiy-workspace" | Out-Null
    Write-Host "  -> E:\Antigravtiy-workspace 已就绪！" -ForegroundColor Green
} else {
    Write-Host "  -> 当前设备无 E 盘，请向少爷确认此设备的工作区路径。" -ForegroundColor Yellow
}

Write-Host "=== [3/4] 正在安装/更新 GitHub 社区高阶插件 (agy-dart & antigravity-context-monitor) ===" -ForegroundColor Cyan
# 1. agy-dart
$agyDartTmp = "$env:TEMP\agy-dart-install"
if (Test-Path $agyDartTmp) { Remove-Item -Recurse -Force $agyDartTmp }
git clone --depth 1 https://github.com/zou172866/Antigravity-agy-dart.git $agyDartTmp
if (Test-Path "$agyDartTmp\scripts\install.mjs") {
    node "$agyDartTmp\scripts\install.mjs" install --install-rg
} else {
    if (Test-Path "$pluginsRoot\agy-dart") { Remove-Item -Recurse -Force "$pluginsRoot\agy-dart" }
    Copy-Item -Recurse -Force $agyDartTmp "$pluginsRoot\agy-dart"
}
Remove-Item -Recurse -Force $agyDartTmp -ErrorAction SilentlyContinue
Write-Host "  -> agy-dart 安装完成！" -ForegroundColor Green

# 2. antigravity-context-monitor
$acmTmp = "$env:TEMP\acm-install"
if (Test-Path $acmTmp) { Remove-Item -Recurse -Force $acmTmp }
git clone --depth 1 https://github.com/AGI-is-going-to-arrive/Antigravity-Context-Window-Monitor.git $acmTmp
if (Test-Path "$acmTmp\scripts\install-app-plugin.mjs") {
    node "$acmTmp\scripts\install-app-plugin.mjs"
}
Remove-Item -Recurse -Force $acmTmp -ErrorAction SilentlyContinue
Write-Host "  -> antigravity-context-monitor 安装完成！" -ForegroundColor Green

# 3. antigravity-context-viewer
$workspaceBase = if (Test-Path "E:\") { "E:\Antigravtiy-workspace" } else { "D:\Antigravtiy-workspace" }
$acvDir = "$workspaceBase\antigravity-context-viewer"
if (-not (Test-Path $acvDir)) {
    New-Item -ItemType Directory -Force -Path $workspaceBase | Out-Null
    git clone --depth 1 https://github.com/elviscjn-cjn/antigravity-context-viewer.git $acvDir
}
node "$acvDir\cli.js" install
Write-Host "  -> antigravity-context-viewer 安装完成！" -ForegroundColor Green

# 4. obsidian-prism
$opDir = "$workspaceBase\obsidian-prism"
if (Test-Path "$opDir\.git") {
    git -C $opDir pull --ff-only
} else {
    New-Item -ItemType Directory -Force -Path $workspaceBase | Out-Null
    git clone https://github.com/RMvdesi/obsidian-prism.git $opDir
}
node "$opDir\tools\install-plugin.cjs" --install
Write-Host "  -> obsidian-prism 安装完成！" -ForegroundColor Green

Write-Host "=== [4/4] 自动化恢复脚本执行完毕！ ===" -ForegroundColor Cyan
Write-Host "请 Agent 继续输出 6 张官方 Marketplace 插件安装卡片供少爷一键点击安装。" -ForegroundColor Green

# MyAntigravity-rules（少爷专属 Antigravity 全局底层规则库）

本仓库用于跨设备（主力机 & 公司电脑）同步少爷的 Antigravity 全局底层规则插件（`user-rules`）。

## 在新设备（如公司电脑）上一键接入

在公司电脑打开 Antigravity（或 PowerShell 终端），直接把这句话发给 Agent（或执行下方命令）：

> **发给 Agent 的口令**：
> `把 https://github.com/Qiu1717/MyAntigravity-rules.git 克隆覆盖到我的 ~/.gemini/config/plugins/user-rules 目录，并把里面的 rules/AGENTS.md 同步到 ~/.gemini/GEMINI.md`

或者在 PowerShell 中直接运行：

```powershell
$pluginDir = "$HOME\.gemini\config\plugins\user-rules"
if (Test-Path $pluginDir) { Remove-Item -Recurse -Force $pluginDir }
git clone https://github.com/Qiu1717/MyAntigravity-rules.git $pluginDir
Copy-Item "$pluginDir\rules\AGENTS.md" "$HOME\.gemini\GEMINI.md" -Force
```

## 日常自动同步机制
- **修改自动上云**：在任意设备上告诉 Agent 新增或修改规则，Agent 会自动按底层规范执行 `git commit` 与 `git push`。
- **拉取最新规则**：在另一台设备上只需对 Agent 说一句“**同步一下云端规则**”（或运行 `git -C "$HOME\.gemini\config\plugins\user-rules" pull`），即可秒级同步最新规范。

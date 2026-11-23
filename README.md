# MyAntigravity-rules（少爷专属 Antigravity 全局底层规则与全量环境仓库）

本仓库用于跨设备（主力机 & 公司电脑）全自动同步少爷的：
1. **全局底层规则**（`rules/AGENTS.md` 与 `~/.gemini/GEMINI.md`）
2. **全量插件与 Skills 环境清单**（`environment-manifest.json`）
3. **新设备一键复刻脚本**（`restore-env.ps1`）

---

## 🚀 在新设备（公司电脑）上一键配置口令

少爷在公司电脑打开 Antigravity 后，只需要把下面这一句话复制发给 Agent：

> `请把 https://github.com/Qiu1717/MyAntigravity-rules.git 克隆到 ~/.gemini/config/plugins/user-rules，仔细阅读里面的 README.md 和 environment-manifest.json，并严格按照 README.md 中的【给 Agent 的全自动复刻执行指令】帮我把所有规则、技能和插件全部配置好。`

---

## 🤖 【给 Agent 的全自动复刻执行指令】（Agent 读到此处必须立即执行！）

当你（公司电脑上的 Antigravity Agent）读到本文件时，**请立即称呼用户为“少爷”**，并严格按以下 3 个步骤自动为少爷复刻完整环境：

### 第一步：执行 `restore-env.ps1` 自动配置底层规则、工作区与 GitHub 社区插件
在终端（`run_command`）中执行本仓库下的 `restore-env.ps1` 脚本：

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\.gemini\config\plugins\user-rules\restore-env.ps1"
```

该脚本会自动完成：
1. 将 `user-rules` 绑定至 `~/.gemini/config/plugins/user-rules`，并将 `rules/AGENTS.md` 同步覆盖到 `~/.gemini/GEMINI.md`。
2. 自动检查并创建默认工作区 `E:\Antigravtiy-workspace`（若公司电脑无 E 盘，请主动询问少爷在公司电脑希望使用哪个盘符路径作为工作区）。
3. 自动从 GitHub 克隆并安装少爷必装的 2 个高阶社区插件：
   - **`agy-dart` (v1.5.0)**：`https://github.com/zou172866/agy-dart.git`（包含 `agy-dart` 技能、`agy-dart_fast` 与 `agy-dart_context` 双 MCP 加速引擎、KV-Cache 保护规则与 Hooks）。
   - **`antigravity-context-monitor` (v1.17.6)**：`https://github.com/AGI-is-going-to-arrive/Antigravity-Context-Window-Monitor.git`（包含 `context-monitor` 技能与实时上下文监控 Sidecar 面板）。

### 第二步：在聊天回复中直接渲染 6 张官方插件市场卡片供少爷一键点装
由于 Antigravity 安全沙箱限制 subprocess 直接调用 `InstallCustomization`，你**必须在给少爷的回复中，将以下 6 张官方插件卡片（每张独立一行）直接原样输出在 Markdown 回复里**，让少爷在聊天界面轻轻点 6 下即可完成官方插件与对应 20 个 Skills 的安装（若检测到某个已安装则跳过）：

```markdown
<plugin-card catalog-id="antigravity-plugins-official/plugin/android-cli-plugin"></plugin-card>

<plugin-card catalog-id="antigravity-plugins-official/plugin/firebase"></plugin-card>

<plugin-card catalog-id="antigravity-plugins-official/plugin/gdocs"></plugin-card>

<plugin-card catalog-id="antigravity-plugins-official/plugin/gmail"></plugin-card>

<plugin-card catalog-id="antigravity-plugins-official/plugin/gsheets"></plugin-card>

<plugin-card catalog-id="antigravity-plugins-official/plugin/gslides"></plugin-card>
```

### 第三步：输出启用面板链接与完整交付汇报
在回复末尾，向少爷提供已安装的自定义插件管理入口链接：
- `[user-rules](customization://user-rules)`
- `[agy-dart](customization://agy-dart)`
- `[Antigravity Context Monitor](customization://antigravity-context-monitor)`

并提醒少爷可以在 Settings 中将权限预设调为 **Turbo Mode**（对应 `AGENT_PERMISSION_PRESET_TURBO`）。

---

## 📦 当前已收录的全量插件与 Skills 清单概览

| 类别 | 插件名称 (`dir`) | 来源 / Catalog ID | 包含的 Skills / Agents / MCP |
| :--- | :--- | :--- | :--- |
| **底层规则** | `user-rules` | `https://github.com/Qiu1717/MyAntigravity-rules.git` | `rules/AGENTS.md` + `~/.gemini/GEMINI.md` |
| **社区插件** | `agy-dart` | `https://github.com/zou172866/agy-dart.git` | Skill: `agy-dart`<br>MCP: `agy-dart_fast`, `agy-dart_context`<br>Rule: `rules/AGENTS.md` + 5 Lifecycle Hooks |
| **社区插件** | `antigravity-context-monitor` | `https://github.com/AGI-is-going-to-arrive/Antigravity-Context-Window-Monitor.git` | Skill: `context-monitor`<br>Sidecar: `context_monitor` |
| **官方市场** | `android-cli-plugin` | `antigravity-plugins-official/plugin/android-cli-plugin` | Skills: `android-cli`, `android-device-hub`, `compose-preview` |
| **官方市场** | `firebase` | `antigravity-plugins-official/plugin/firebase` | Skills (13个): `firebase-basics`, `firebase-auth-basics`, `firebase-firestore`, `firestore-rules-creation`, `firebase-security-rules-auditor`, `firebase-hosting-basics`, `firebase-app-hosting-basics`, `firebase-data-connect`, `firebase-ai-logic-basics`, `firebase-crashlytics`, `firebase-remote-config-basics`, `extension-to-functions-codebase`, `xcode-project-setup`<br>Subagent: `firestore-rules-author` |
| **官方市场** | `gdocs` | `antigravity-plugins-official/plugin/gdocs` | Skill: `gdocs` |
| **官方市场** | `gmail` | `antigravity-plugins-official/plugin/gmail` | Skill: `gmail` |
| **官方市场** | `gsheets` | `antigravity-plugins-official/plugin/gsheets` | Skill: `gsheets` |
| **官方市场** | `gslides` | `antigravity-plugins-official/plugin/gslides` | Skill: `gslides` |
| **内置插件** | `swarm` | Built-in (`builtin/plugins/swarm`) | Sidecar: `swarm_board` |

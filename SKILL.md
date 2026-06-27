---
name: openclaw-markdown2html
description: Convert Markdown text to beautifully styled, self-contained HTML with embedded CSS. Perfect for newsletters, documentation, reports, and email templates. Trigger commands：skill md2html、skill markdown-to-html、技能 md2html、技能 markdown-to-html、convert markdown to html、markdown to html、render markdown、style markdown、skill md2html help、技能 md2html help。
metadata:
  openclaw:
    emoji: "📄"
    always: false
    requires:
      bins: ["python3"]
      env: []
triggers:
  - skill md2html
  - skill markdown-to-html
  - 技能 md2html
  - 技能 markdown-to-html
  - convert markdown to html
  - markdown to html
  - render markdown
  - style markdown
  - skill md2html help
  - 技能 md2html help
---

# Markdown to HTML Converter

A zero-dependency Python tool that converts Markdown files into beautiful, self-contained HTML documents with embedded CSS styling. No external libraries needed — uses only Python's standard library.

---

## 前置条件

| 序号 | 项目 | 要求 | 检查方式 |
|------|------|------|----------|
| 1 | OpenClaw | >= v2026.6.0 | `openclaw --version` |
| 2 | Python | >= 3.8 | `python3 --version` |
| 3 | 标准库 | 无需额外安装 | Python 内置 |

---

## 功能特性

- **Full Markdown support**: Headings, bold, italic, strikethrough, links, images, code blocks with syntax hints, blockquotes, ordered and unordered lists, horizontal rules, and tables
- **Two built-in themes**: Light (GitHub-inspired) and Dark mode with carefully chosen colors
- **Self-contained output**: All CSS is embedded inline — the resulting HTML file works anywhere with no external dependencies
- **Responsive design**: Output looks great on desktop and mobile screens
- **Stdin support**: Pipe content directly for use in shell pipelines

---

## 命令列表

| 序号 | 命令 | 用途 | 输出格式 |
|------|------|------|----------|
| 1 | `skill md2html <文件>` | 转换 Markdown 为 HTML | 生成带 CSS 样式的独立 HTML 文件 |
| 2 | `skill md2html <文件> -o <输出>` | 指定输出文件名 | 自定义输出 HTML 文件路径 |
| 3 | `skill md2html <文件> --theme dark` | 使用深色主题 | 生成暗色风格 HTML |
| 4 | `skill md2html <文件> --title "标题"` | 设置文档标题 | 自定义 HTML `<title>` 和页面标题 |
| 5 | `skill md2html help` | 显示帮助信息 | 输出本说明文档 |

---

## 输出格式规范

### 基础转换输出

```bash
$ skill md2html README.md

✅ 转换成功
   输入: README.md
   输出: README.html
   主题: light
   大小: 15.2 KB
```

### 深色主题输出

```bash
$ skill md2html notes.md --theme dark -o notes.html

✅ 转换成功
   输入: notes.md
   输出: notes.html
   主题: dark
   大小: 14.8 KB
```

### 管道输入输出

```bash
$ cat CHANGELOG.md | skill md2html - -o changelog.html

✅ 转换成功
   输入: stdin
   输出: changelog.html
   主题: light
   大小: 23.5 KB
```

状态标记说明：
- ✅ 转换成功 — 文件已生成
- ❌ 转换失败 — 错误信息

---

## 快速开始

```bash
# 1. 安装技能到本地
openclaw skills install openclaw-markdown2html

# 2. 验证安装
openclaw skills list | grep markdown2html

# 3. 基础转换（浅色主题）
skill md2html README.md

# 4. 指定输出文件
skill md2html notes.md -o notes.html

# 5. 深色主题 + 自定义标题
skill md2html presentation.md --theme dark --title "会议笔记"

# 6. 管道输入
cat CHANGELOG.md | skill md2html - -o changelog.html
```

---

## 安装与部署

### 方式 A：从 ClawHub 安装（推荐）

```bash
# 搜索技能
openclaw skills search openclaw-markdown2html

# 安装
openclaw skills install openclaw-markdown2html

# 验证
openclaw skills list | grep markdown2html
```

### 方式 B：本地部署

```bash
# 1. 创建技能目录
mkdir -p ~/.openclaw/workspace/skills/openclaw-markdown2html

# 2. 将 SKILL.md 和 main.py 放入目录
cp SKILL.md main.py ~/.openclaw/workspace/skills/openclaw-markdown2html/

# 3. 验证安装
openclaw skills list | grep markdown2html
```

### 安装后验证

| 检查项 | 命令 | 预期结果 |
|--------|------|----------|
| 技能状态 | `openclaw skills list` | `✓ ready │ 📄 openclaw-markdown2html` |
| Python 版本 | `python3 --version` | >= 3.8 |
| 转换测试 | `skill md2html test.md` | 生成 HTML 文件 |

---

## 常见用例

| 序号 | 场景 | 命令 | 说明 |
|------|------|------|------|
| 1 | 转换 README | `skill md2html README.md` | 生成项目文档 HTML |
| 2 | 生成报告 | `skill md2html report.md -o report.html` | 指定输出文件名 |
| 3 | 演示文稿 | `skill md2html slides.md --theme dark --title "演讲"` | 深色主题演示 |
| 4 | 批量转换 | `for f in *.md; do skill md2html "$f"; done` | 转换所有 .md 文件 |
| 5 | 管道处理 | `cat doc.md \| skill md2html - -o out.html` | 从 stdin 读取 |
| 6 | 邮件模板 | `skill md2html newsletter.md -o email.html` | 生成邮件 HTML |

---

## 支持的 Markdown 元素

| 元素 | 语法 | 支持 |
|------|------|------|
| Headings | `# H1` through `###### H6` | ✅ |
| Bold | `**text**` | ✅ |
| Italic | `*text*` | ✅ |
| Strikethrough | `~~text~~` | ✅ |
| Links | `[text](url)` | ✅ |
| Images | `![alt](url)` | ✅ |
| Code blocks | Triple backtick with language | ✅ |
| Inline code | Single backtick | ✅ |
| Blockquotes | `> text` | ✅ |
| Unordered lists | `- item` or `* item` | ✅ |
| Ordered lists | `1. item` | ✅ |
| Horizontal rules | `---` | ✅ |

---

## 命令行选项

- `input` — Markdown file path, or `-` for stdin
- `-o, --output` — Output HTML file (defaults to stdout)
- `--theme` — `light` (default) or `dark`
- `--title` — HTML document title (default: "Document")

---

## 更新与卸载

```bash
# 从 ClawHub 更新
openclaw skills update openclaw-markdown2html

# 从 ClawHub 卸载
openclaw skills uninstall openclaw-markdown2html

# 或手动删除目录
rm -rf ~/.openclaw/workspace/skills/openclaw-markdown2html
```

---

## Help 帮助信息

发送 `skill md2html help` 或 `技能 md2html help` 查看本技能的详细使用说明。

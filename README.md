# OpenClaw Markdown to HTML

将 Markdown 文本转换为精美排版的独立 HTML 文件，内置 CSS 样式，无需外部依赖。

## 功能

- ✅ 完整的 Markdown 支持（标题、粗体、斜体、删除线、链接、图片、代码块、引用、列表、表格）
- ✅ 两套内置主题：浅色（GitHub 风格）和深色
- ✅ 自包含输出：所有 CSS 内嵌，HTML 文件随处可用
- ✅ 响应式设计：桌面端和移动端均美观
- ✅ 零依赖：仅使用 Python 标准库

## 触发命令

```
skill md2html <文件>                    # 基础转换
skill md2html <文件> -o <输出>           # 指定输出文件
skill md2html <文件> --theme dark        # 深色主题
skill md2html <文件> --title "标题"      # 设置文档标题
cat file.md | skill md2html - -o out.html  # 管道输入
skill md2html help                      # 查看帮助
```

也支持中文触发：`技能 md2html`

## 使用示例

```bash
# 基础转换（浅色主题）
skill md2html README.md

# 指定输出文件
skill md2html notes.md -o notes.html

# 深色主题 + 自定义标题
skill md2html presentation.md --theme dark --title "会议笔记"

# 管道输入
cat CHANGELOG.md | skill md2html - -o changelog.html
```

## 命令行选项

| 选项 | 说明 | 默认值 |
|------|------|--------|
| `input` | Markdown 文件路径，`-` 表示标准输入 | — |
| `-o, --output` | 输出 HTML 文件路径 | 标准输出 |
| `--theme` | 主题：`light` 或 `dark` | `light` |
| `--title` | HTML 文档标题 | `Document` |

## 支持的 Markdown 元素

| 元素 | 语法 | 支持 |
|------|------|------|
| 标题 | `# H1` ~ `###### H6` | ✅ |
| 粗体 | `**text**` | ✅ |
| 斜体 | `*text*` | ✅ |
| 删除线 | `~~text~~` | ✅ |
| 链接 | `[text](url)` | ✅ |
| 图片 | `![alt](url)` | ✅ |
| 代码块 | 三反引号 + 语言 | ✅ |
| 行内代码 | 单反引号 | ✅ |
| 引用块 | `> text` | ✅ |
| 无序列表 | `- item` | ✅ |
| 有序列表 | `1. item` | ✅ |
| 水平分割线 | `---` | ✅ |
| 表格 | `| col | col |` | ✅ |

## 依赖

- Python 3（标准库，无需额外安装任何包）

## License

MIT

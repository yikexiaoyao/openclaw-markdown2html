# Markdown to HTML Skill

## 功能概述
将 Markdown 文件转换为美观的 HTML 文件，支持 GitHub Flavored Markdown、表格、代码块和语法高亮。

## 安装
```bash
# 从 skillhub 安装
skillhub install markdown-to-html

# 或从本地安装
cd /root/.openclaw/workspace/skills/markdown-to-html
bash setup.sh
```

## 使用方法

### 基本命令
```
md2html <输入文件>                    # 转换单个文件
md2html <输入目录> -o <输出目录>       # 批量转换目录
md2html --preview <输入文件>          # 预览 HTML（不保存）
md2html --help                        # 显示帮助信息
```

### 命令别名
```
markdown2html        # 同 md2html
md-to-html           # 同 md2html
markdown             # 同 md2html
```

### 示例
```
用户: md2html README.md
助手: ✅ 转换完成！
      📄 输入：README.md
      📄 输出：./output/README.html
      📊 大小：12.5 KB
      
      预览链接：file:///root/.openclaw/workspace/skills/markdown-to-html/output/README.html

用户: md2html docs/ -o html/
助手: ✅ 批量转换完成！
      📄 处理文件：5 个
      📄 成功：5 个
      📄 失败：0 个
      📂 输出目录：html/

用户: md2html --preview report.md
助手: 📄 预览模式：
      [显示 HTML 预览内容]
      
      💡 提示：使用 md2html report.md 保存到文件
```

## 配置说明

技能支持以下配置（编辑 `config.json`）:

### 输出配置
```json
{
    "output": {
        "directory": "./output",    # 输出目录
        "extension": ".html"        # 文件扩展名
    }
}
```

### 样式配置
```json
{
    "style": {
        "enabled": true,            # 是否启用 CSS
        "theme": "default"          # 主题名称
    }
}
```

### 扩展配置
```json
{
    "options": {
        "extensions": [
            "tables",           # 支持表格
            "fenced_code",      # 支持代码块
            "codehilite"        # 支持语法高亮
        ],
        "safe_mode": "escape"   # 安全模式：转义 HTML
    }
}
```

## 高级功能

### 批量转换
支持递归转换整个目录：
```bash
md2html input_dir/ -o output_dir/
```

### 自定义 CSS
编辑 `config.json` 中的 `style.theme` 或使用自定义 CSS 文件：
```bash
md2html input.md --css custom.css
```

### 代码高亮
自动检测代码块语言并应用语法高亮：
```markdown
```python
print("Hello World")
```
```

### 表格支持
支持 GitHub 风格的表格：
```markdown
| 列 1 | 列 2 |
|------|------|
| 数据 1 | 数据 2 |
```

## 开发扩展

### 项目结构
```
markdown-to-html/
├── md2html.py          # 主转换脚本
├── setup.sh            # 安装脚本
├── config.json         # 配置文件
├── SKILL.md            # 技能文档
├── package.json        # 包配置
└── output/             # 输出目录
```

### 添加新扩展
在 `config.json` 的 `options.extensions` 数组中添加新的 Markdown 扩展。

### 自定义主题
创建新的 CSS 文件并修改 `config.json` 中的 `style.theme`。

## 版本历史

### v1.0.0 (2026-04-23)
- 初始版本发布
- 支持基本 Markdown 转换
- 支持表格和代码块
- 支持自定义 CSS
- 批量转换功能
- 预览模式

## 技术支持

### 问题反馈
- GitHub Issues: https://github.com/openclaw/skills/issues
- Discord 社区: https://discord.gg/clawd

### 贡献指南
1. Fork 项目仓库
2. 创建功能分支
3. 提交更改
4. 创建 Pull Request

## 许可证
MIT License - 详见 LICENSE 文件

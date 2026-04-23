#!/bin/bash
# Markdown to HTML Skill - 交互式安装脚本
# 引导用户配置 Markdown 转 HTML 技能

echo "📝 欢迎配置 Markdown to HTML 技能"
echo "================================"
echo ""

# 1. 检查 Python 环境
echo "🐍 检查 Python 环境..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo "✅ 找到 Python: $PYTHON_VERSION"
else
    echo "❌ 未找到 Python 3，请先安装 Python 3"
    exit 1
fi

# 2. 安装依赖
echo ""
echo "📦 安装 Python 依赖..."
if pip3 install --break-system-packages markdown beautifulsoup4 lxml 2>/dev/null; then
    echo "✅ 依赖安装成功"
else
    echo "⚠️ 依赖安装失败，请手动运行: pip3 install markdown beautifulsoup4 lxml"
fi

# 3. 获取输出目录
echo ""
echo "📂 请输入 HTML 输出目录 (默认: ./output):"
read -p "输出目录 [./output]: " OUTPUT_DIR
OUTPUT_DIR=${OUTPUT_DIR:-"./output"}

# 4. 获取默认 CSS 样式
echo ""
echo "🎨 是否使用默认 CSS 样式? (y/n)"
read -p "使用默认样式 [y]: " USE_CSS
USE_CSS=${USE_CSS:-"y"}

CSS_ENABLED="true"
if [ "$USE_CSS" != "y" ]; then
    CSS_ENABLED="false"
fi

# 5. 生成配置
echo ""
echo "⚙️ 正在生成配置..."

cat > /root/.openclaw/workspace/skills/markdown-to-html/config.json << EOF
{
    "skill": {
        "name": "markdown-to-html",
        "version": "1.0.0",
        "description": "Markdown 转 HTML 转换技能"
    },
    "output": {
        "directory": "$OUTPUT_DIR",
        "extension": ".html"
    },
    "style": {
        "enabled": $CSS_ENABLED,
        "theme": "default"
    },
    "options": {
        "extensions": ["tables", "fenced_code", "codehilite"],
        "safe_mode": "escape"
    }
}
EOF

echo "✅ 配置已保存至 config.json"

# 6. 创建输出目录
mkdir -p "$OUTPUT_DIR"
echo "✅ 输出目录已创建: $OUTPUT_DIR"

# 7. 验证配置
if [ -f "config.json" ]; then
    echo "✅ 配置文件验证成功"
else
    echo "❌ 配置文件创建失败"
    exit 1
fi

echo ""
echo "🎉 安装完成！"
echo "================================"
echo "📋 配置摘要："
echo "   • 输出目录：$OUTPUT_DIR"
echo "   • CSS 样式：$CSS_ENABLED"
echo "   • 扩展插件：表格、代码高亮"
echo ""
echo "💡 提示：你可以随时修改 config.json 来调整设置。"
echo "📖 使用说明：查看 SKILL.md"

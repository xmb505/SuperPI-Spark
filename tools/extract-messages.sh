#!/bin/bash
# 提取翻译字符串的工具脚本

# 创建po目录
mkdir -p po

# 提取所有_()宏中的字符串
echo "Extracting translatable strings..."

# 创建临时文件
temp_file=$(mktemp)

# 提取_()和_f()宏中的字符串
grep -n '_("[^"]*"' pi_fftcs.c | sed 's/_("\([^"]*\)").*/msgid "\1"\nmsgstr ""\n/' > "$temp_file"

# 创建新的messages.pot
cat > po/messages.pot << 'EOF'
# SOME DESCRIPTIVE TITLE.
# Copyright (C) YEAR THE PACKAGE'S COPYRIGHT HOLDER
# This file is distributed under the same license as the PACKAGE package.
# FIRST AUTHOR <EMAIL@ADDRESS>, YEAR.
#
#, fuzzy
msgid ""
msgstr ""
"Project-Id-Version: SuperPI 1.0\n"
"Report-Msgid-Bugs-To: \n"
"POT-Creation-Date: $(date +%Y-%m-%d %H:%M%z)\n"
"PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
"Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
"Language-Team: LANGUAGE <LL@li.org>\n"
"Language: \n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=UTF-8\n"
"Content-Transfer-Encoding: 8bit\n"

EOF

# 添加提取的字符串
cat "$temp_file" >> po/messages.pot

# 清理临时文件
rm "$temp_file"

echo "Translation template created: po/messages.pot"
echo ""
echo "To add a new language:"
echo "1. cp po/messages.pot po/LANG.po"
echo "2. Edit po/LANG.po and translate the strings"
echo "3. Rebuild the project"
#!/bin/bash
# 安装国际化文件的脚本

PREFIX=${PREFIX:-/usr/local}
LOCALEDIR=${LOCALEDIR:-$PREFIX/share/locale}

# 创建目录
mkdir -p "$LOCALEDIR"/en/LC_MESSAGES
mkdir -p "$LOCALEDIR"/zh_CN/LC_MESSAGES
mkdir -p "$LOCALEDIR"/zh_TW/LC_MESSAGES

# 安装翻译文件（简化版，直接复制.po文件）
cp po/en.po "$LOCALEDIR"/en/LC_MESSAGES/superpi.po
cp po/zh_CN.po "$LOCALEDIR"/zh_CN/LC_MESSAGES/superpi.po
cp po/zh_TW.po "$LOCALEDIR"/zh_TW/LC_MESSAGES/superpi.po

echo "Internationalization files installed to $LOCALEDIR"
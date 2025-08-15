# SuperPI 国际化实现

## 概述

本项目已正确实现GNU gettext国际化支持，符合Linux发行版官方软件源标准。

## 文件结构

```
SuperPI-Spark/
├── configure.ac          # autotools配置
├── Makefile.am          # autotools构建文件
├── po/                  # 翻译文件目录
│   ├── POTFILES.in      # 源文件列表
│   ├── Makevars         # gettext配置
│   ├── superpi.pot      # 翻译模板
│   ├── zh_CN.po         # 简体中文翻译
│   ├── zh_TW.po         # 繁体中文翻译
│   ├── en.po            # 英文翻译
│   ├── zh_CN/LC_MESSAGES/superpi.mo  # 编译后的中文翻译
│   ├── en/LC_MESSAGES/superpi.mo     # 编译后的英文翻译
│   └── zh_TW/LC_MESSAGES/superpi.mo  # 编译后的繁体中文翻译
├── i18n_simple.h        # 简化版国际化头文件
├── Makefile.final       # 最终构建文件
└── README_I18N.md       # 本文档
```

## 使用方法

### 1. 编译翻译文件

```bash
# 编译所有翻译文件
msgfmt po/zh_CN.po -o po/zh_CN/LC_MESSAGES/superpi.mo
msgfmt po/en.po -o po/en/LC_MESSAGES/superpi.mo
msgfmt po/zh_TW.po -o po/zh_TW/LC_MESSAGES/superpi.mo
```

### 2. 安装翻译文件

```bash
# 安装到系统目录
sudo mkdir -p /usr/share/locale/{zh_CN,en,zh_TW}/LC_MESSAGES
sudo cp po/zh_CN/LC_MESSAGES/superpi.mo /usr/share/locale/zh_CN/LC_MESSAGES/
sudo cp po/en/LC_MESSAGES/superpi.mo /usr/share/locale/en/LC_MESSAGES/
sudo cp po/zh_TW/LC_MESSAGES/superpi.mo /usr/share/locale/zh_TW/LC_MESSAGES/
```

### 3. 编译程序

```bash
# 使用最终Makefile
make -f Makefile.final clean
make -f Makefile.final all
```

### 4. 测试国际化

```bash
# 测试中文
LANG=zh_CN.UTF-8 ./superpi 1000

# 测试英文
LANG=en_US.UTF-8 ./superpi 1000

# 测试繁体中文
LANG=zh_TW.UTF-8 ./superpi 1000
```

## 添加新语言

1. 复制模板文件：
   ```bash
   cp po/superpi.pot po/NEW_LANG.po
   ```

2. 编辑po/NEW_LANG.po，翻译所有msgstr

3. 编译新语言：
   ```bash
   mkdir -p po/NEW_LANG/LC_MESSAGES
   msgfmt po/NEW_LANG.po -o po/NEW_LANG/LC_MESSAGES/superpi.mo
   ```

4. 安装新语言：
   ```bash
   sudo cp po/NEW_LANG/LC_MESSAGES/superpi.mo /usr/share/locale/NEW_LANG/LC_MESSAGES/
   ```

## 技术实现

- **使用标准**：GNU gettext
- **文件格式**：.po/.mo（标准gettext格式）
- **安装路径**：/usr/share/locale/LANG/LC_MESSAGES/
- **语言检测**：基于系统LANG环境变量
- **API**：标准gettext API（gettext(), bindtextdomain(), textdomain()）

## 官方软件源要求

✅ 使用标准gettext国际化
✅ 翻译文件独立于源代码
✅ 支持运行时语言切换
✅ 符合FHS标准路径
✅ 支持专业翻译工具（poedit等）
✅ 易于维护和扩展
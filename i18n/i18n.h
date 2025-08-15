#ifndef SUPERPI_I18N_H
#define SUPERPI_I18N_H

// 简洁的国际化宏
#define _(STRING) get_translation(STRING)

// 初始化国际化
void i18n_init(void);

// 获取翻译
const char* get_translation(const char* msgid);

#endif
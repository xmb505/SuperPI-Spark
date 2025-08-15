#include "i18n.h"
#include <stdlib.h>
#include <string.h>

// 翻译表 - 简洁版
typedef struct {
    const char* msgid;
    const char* zh_cn;
    const char* en;
    const char* zh_tw;
} translation_t;

static const translation_t translations[] = {
    {"Calculation of PI using FFT and AGM, %s\n", "使用FFT和AGM计算圆周率π，%s\n", "Calculation of PI using FFT and AGM, %s\n"},
    {"Usage: %s digits\n", "用法: %s 位数\n", "Usage: %s digits\n"},
    {"Number of digits of pi to calculate?\n", "要计算多少位的圆周率π？\n", "Number of digits of pi to calculate?\n"},
    {"initializing...\n", "正在初始化...\n", "initializing...\n"},
    {"nfft= %d\nradix= %d\nerror_margin= %g\n", "nfft= %d\n基数= %d\n误差范围= %g\n", "nfft= %d\nradix= %d\nerror_margin= %g\n"},
    {"calculating %d digits of PI...\n", "正在计算 %d 位的圆周率π...\n", "calculating %d digits of PI...\n"},
    {"AGM iteration\n", "AGM迭代\n", "AGM iteration\n"},
    {"precision= %d: %.2f sec\n", "精度= %d: %.2f 秒\n", "precision= %d: %.2f sec\n"},
    {"writing %s...\n", "正在写入 %s...\n", "writing %s...\n"},
    {"%.2f sec. (real time)\n", "%.2f 秒 (实际时间)\n", "%.2f sec. (real time)\n"},
    {"Hit RETURN to exit.\n", "按回车键退出。\n", "Hit RETURN to exit.\n"},
    {"Error: Invalid input\n", "错误：输入无效\n", "Error: Invalid input\n"},
    {"Allocation Failure!\n", "内存分配失败！\n", "Allocation Failure!\n"},
    {NULL, NULL, NULL}
};

static const char* current_lang = "en";

void i18n_init(void) {
    const char* lang = getenv("LANG");
    if (lang) {
        if (strstr(lang, "zh_CN") || strstr(lang, "zh_SG")) current_lang = "zh_cn";
        else if (strstr(lang, "zh_TW") || strstr(lang, "zh_HK")) current_lang = "zh_tw";
    }
}

const char* get_translation(const char* msgid) {
    if (!msgid) return "";
    
    for (int i = 0; translations[i].msgid; i++) {
        if (strcmp(translations[i].msgid, msgid) == 0) {
            if (strcmp(current_lang, "zh_cn") == 0) return translations[i].zh_cn;
            if (strcmp(current_lang, "zh_tw") == 0) return translations[i].zh_tw;
            return translations[i].en;
        }
    }
    return msgid;
}
# SuperPI

圆周率计算器

-----

## 在 Linux 下编译

**使用 gcc：**

```bash
gcc -O -funroll-loops -fomit-frame-pointer pi_fftcs.c fftsg_h.c -lm -o pi_css5
```

**使用 Makefile：**

```bash
make all
```

**使用 CMake：**

```bash
mkdir build && cd build && cmake .. && make
```

*也可以直接用 VS Code 打开本项目，配合 CMake 插件一键编译。*

-----

## 在 Linux 下运行

```bash
./superpi $((1<<20))
```

参数为你想要计算的圆周率小数位数，实际会自动取最接近的 2 的幂。

-----

## 其他说明

- 推荐在物理机上运行，避免虚拟机或容器环境影响性能测试结果。
- 如遇依赖问题，请确保已安装 gcc、make、cmake 及相关开发库（如 libm）。
- 欢迎提交 issue 或 PR 交流改进

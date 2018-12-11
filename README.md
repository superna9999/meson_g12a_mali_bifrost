Mali Bifrost support for Amlogic Meson G12A Family
===============================================

**Big Fat Warning: This is still in development**

The Following SoCs are using the Mali-G71 IP :
- Meson G12A : S905X2 & S905Y2

This distribution adds platform support for these families.

HowTo
=====

```
$ make KDIR=/path/to/amlogic/upstream/linux ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CONFIG_NAME=config.meson-g12a
```

Copy mali_kbase.ko to root filesystem and boot.

Sources
=======

Original Mali kernel driver can be downloaded from : https://developer.arm.com/products/software/mali-drivers/bifrost-kernel

The xf86-video-armsoc should be used in user space for X11 :
- https://github.com/superna9999/xf86-video-armsoc

This version will eventually work with the PanFrost Mesa effort.

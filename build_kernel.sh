#!/bin/bash
# Build do WolfKernel a21s (s5e3830 / Exynos 850, 5.10). Usa o clang 23
# (r614150) da base PegasusKernel; CLANG_DIR no ambiente sobrescreve.
# Uso: ./build_kernel.sh [alvos...]   (padrao: build completo)

set -e

TREE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLANG_DIR=${CLANG_DIR:-"$HOME/PegasusKernel_Exynos3830/toolchains/clang/host/linux-x86/clang-r614150"}
JOBS=${JOBS:-$(nproc --all)}
TARGETS=${*:-}

export PATH="$CLANG_DIR/bin:$PATH"
export DTC_FLAGS="-@"
export PLATFORM_VERSION=14
export ANDROID_MAJOR_VERSION=u
export LLVM=1
export LLVM_IAS=1
export ARCH=arm64
export TARGET_SOC=s5e3830
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
export CLANG_TRIPLE=aarch64-linux-gnu-

cd "$TREE"
make exynos850-a21s_defconfig
make -j"$JOBS" CONFIG_SECTION_MISMATCH_WARN_ONLY=y $TARGETS

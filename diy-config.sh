# 编辑默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 取消软件包
./scripts/config --disable CONFIG_PACKAGE_arm-trusted-firmware-microchipsw
./scripts/config --disable CONFIG_PACKAGE_audit
./scripts/config --disable CONFIG_PACKAGE_auditd
./scripts/config --disable CONFIG_PACKAGE_autosamba
./scripts/config --disable CONFIG_BUSYBOX_CONFIG_PAM
./scripts/config --disable CONFIG_BUSYBOX_CONFIG_RPC
./scripts/config --disable CONFIG_PACKAGE_gst1-plugins-base
./scripts/config --disable CONFIG_PACKAGE_kexec-tools
./scripts/config --disable CONFIG_PACKAGE_lldpd
./scripts/config --disable CONFIG_PACKAGE_onionshare-cli
./scripts/config --disable CONFIG_PACKAGE_pcat-manager
./scripts/config --disable CONFIG_PACKAGE_policycoreutils

# 启用外部 Rust 工具链
./scripts/config --enable CONFIG_RUSTC_EXTERNAL
./scripts/config --set-str CONFIG_RUSTC "$HOME/.cargo/bin/rustc"
./scripts/config --set-str CONFIG_CARGO "$HOME/.cargo/bin/cargo"

# 尝试禁用 rust 包本身（避免自编译）
./scripts/config --disable CONFIG_PACKAGE_rust

# 修改 luci-app-amlogic 配置
sed -i 's#https://github.com/breakings/OpenWrt#https://github.com/ophub/kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic

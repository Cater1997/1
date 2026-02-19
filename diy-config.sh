# 设置默认主题
./scripts/config/conf --set-str CONFIG_LUCI_DEFAULT_THEME luci-theme-argon

# 取消软件包
./scripts/config/conf --disable CONFIG_PACKAGE_arm-trusted-firmware-microchipsw
./scripts/config/conf --disable CONFIG_PACKAGE_audit
./scripts/config/conf --disable CONFIG_PACKAGE_auditd
./scripts/config/conf --disable CONFIG_PACKAGE_autosamba
./scripts/config/conf --disable CONFIG_BUSYBOX_CONFIG_PAM
./scripts/config/conf --disable CONFIG_BUSYBOX_CONFIG_RPC
./scripts/config/conf --disable CONFIG_PACKAGE_gst1-plugins-base
./scripts/config/conf --disable CONFIG_PACKAGE_kexec-tools
./scripts/config/conf --disable CONFIG_PACKAGE_lldpd
./scripts/config/conf --disable CONFIG_PACKAGE_onionshare-cli
./scripts/config/conf --disable CONFIG_PACKAGE_pcat-manager
./scripts/config/conf --disable CONFIG_PACKAGE_policycoreutils

# 启用外部 Rust 工具链和 build-std
./scripts/config/conf --enable CONFIG_RUSTC_EXTERNAL
./scripts/config/conf --set-str CONFIG_RUSTC "$HOME/.cargo/bin/rustc"
./scripts/config/conf --set-str CONFIG_CARGO "$HOME/.cargo/bin/cargo"
./scripts/config/conf --enable CONFIG_RUSTC_BUILD_STD
./scripts/config/conf --disable CONFIG_PACKAGE_rust

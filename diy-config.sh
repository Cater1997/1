# 设置默认主题
sed -i 's/^CONFIG_LUCI_DEFAULT_THEME=.*/CONFIG_LUCI_DEFAULT_THEME="luci-theme-argon"/' .config

# 取消软件包
sed -i 's/^CONFIG_PACKAGE_arm-trusted-firmware-microchipsw=.*/# CONFIG_PACKAGE_arm-trusted-firmware-microchipsw is not set/' .config
sed -i 's/^CONFIG_PACKAGE_audit=.*/# CONFIG_PACKAGE_audit is not set/' .config
sed -i 's/^CONFIG_PACKAGE_auditd=.*/# CONFIG_PACKAGE_auditd is not set/' .config
sed -i 's/^CONFIG_PACKAGE_autosamba=.*/# CONFIG_PACKAGE_autosamba is not set/' .config
sed -i 's/^CONFIG_BUSYBOX_CONFIG_PAM=.*/# CONFIG_BUSYBOX_CONFIG_PAM is not set/' .config
sed -i 's/^CONFIG_BUSYBOX_CONFIG_RPC=.*/# CONFIG_BUSYBOX_CONFIG_RPC is not set/' .config
sed -i 's/^CONFIG_PACKAGE_gst1-plugins-base=.*/# CONFIG_PACKAGE_gst1-plugins-base is not set/' .config
sed -i 's/^CONFIG_PACKAGE_kexec-tools=.*/# CONFIG_PACKAGE_kexec-tools is not set/' .config
sed -i 's/^CONFIG_PACKAGE_lldpd=.*/# CONFIG_PACKAGE_lldpd is not set/' .config
sed -i 's/^CONFIG_PACKAGE_onionshare-cli=.*/# CONFIG_PACKAGE_onionshare-cli is not set/' .config
sed -i 's/^CONFIG_PACKAGE_pcat-manager=.*/# CONFIG_PACKAGE_pcat-manager is not set/' .config
sed -i 's/^CONFIG_PACKAGE_policycoreutils=.*/# CONFIG_PACKAGE_policycoreutils is not set/' .config

# 启用外部 Rust 工具链
if grep -q "^CONFIG_RUSTC_EXTERNAL=" .config; then
    sed -i 's/^CONFIG_RUSTC_EXTERNAL=.*/CONFIG_RUSTC_EXTERNAL=y/' .config
else
    echo "CONFIG_RUSTC_EXTERNAL=y" >> .config
fi
if grep -q "^CONFIG_RUSTC=" .config; then
    sed -i "s|^CONFIG_RUSTC=.*|CONFIG_RUSTC=\"$HOME/.cargo/bin/rustc\"|" .config
else
    echo "CONFIG_RUSTC=\"$HOME/.cargo/bin/rustc\"" >> .config
fi
if grep -q "^CONFIG_CARGO=" .config; then
    sed -i "s|^CONFIG_CARGO=.*|CONFIG_CARGO=\"$HOME/.cargo/bin/cargo\"|" .config
else
    echo "CONFIG_CARGO=\"$HOME/.cargo/bin/cargo\"" >> .config
fi
if grep -q "^CONFIG_RUSTC_BUILD_STD=" .config; then
    sed -i 's/^CONFIG_RUSTC_BUILD_STD=.*/CONFIG_RUSTC_BUILD_STD=y/' .config
else
    echo "CONFIG_RUSTC_BUILD_STD=y" >> .config
fi
sed -i 's/^CONFIG_PACKAGE_rust=.*/# CONFIG_PACKAGE_rust is not set/' .config

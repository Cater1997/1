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

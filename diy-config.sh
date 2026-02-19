# 设置默认主题
./scripts/config --set-str CONFIG_LUCI_DEFAULT_THEME "luci-theme-argon"

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

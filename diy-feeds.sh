# 编辑默认 LAN 口 IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 编辑默认固件名称
#sed -i 's/ImmortalWrt/ImmortalWrt1/g' package/base-files/files/bin/config_generate

# 添加第三方 feed 源
cat > feeds.conf.default << 'EOF'
src-git packages https://github.com/immortalwrt/packages.git;master
src-git luci https://github.com/immortalwrt/luci.git;master
src-git routing https://github.com/openwrt/routing.git;master
src-git helloworld https://github.com/fw876/helloworld.git;master
EOF

# 拉取软件包
git clone -b main --single-branch https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
git clone -b v5 --single-branch https://github.com/sbwml/luci-app-mosdns.git package/luci-app-mosdns
git clone -b master --single-branch https://github.com/sbwml/v2ray-geodata.git package/v2ray-geodata
git clone -b master --single-branch https://github.com/sirpdboy/luci-app-netspeedtest.git package/luci-app-netspeedtest
git clone -b main --single-branch https://github.com/sirpdboy/luci-app-parentcontrol.git package/luci-app-parentcontrol
git clone -b main --single-branch https://github.com/Openwrt-Passwall/openwrt-passwall2.git package/openwrt-passwall2
git clone -b main --single-branch https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall-packages

# 修改 luci-app-amlogic 配置
sed -i 's#https://github.com/breakings/OpenWrt#https://github.com/ophub/kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic

# 添加turboacc
curl -sSL https://raw.githubusercontent.com/mufeng05/turboacc/main/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
rm -f add_turboacc.sh

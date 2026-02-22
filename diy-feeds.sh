# 编辑 LAN 口 IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 编辑固件名称
#sed -i 's/ImmortalWrt/ImmortalWrt1/g' package/base-files/files/bin/config_generate

# 添加 feed 源
cat > feeds.conf.default << 'EOF'
src-git packages https://github.com/immortalwrt/packages.git;master
src-git luci https://github.com/immortalwrt/luci.git;master
src-git routing https://github.com/openwrt/routing.git;master
EOF

# 添加turboacc
curl -sSL https://raw.githubusercontent.com/mufeng05/turboacc/main/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
rm -f add_turboacc.sh

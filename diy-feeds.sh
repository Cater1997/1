# 编辑默认 LAN 口 IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 编辑默认固件名称
#sed -i 's/ImmortalWrt/ImmortalWrt1/g' package/base-files/files/bin/config_generate

# 添加第三方 feed 源
cat >> feeds.conf.default << 'EOF'
#src-git luci-app-parentcontrol https://github.com/sirpdboy/luci-app-parentcontrol.git;main
#src-git luci-app-amlogic https://github.com/ophub/luci-app-amlogic.git;main
#src-git helloworld https://github.com/fw876/helloworld.git;master
#src-git luci-app-mosdns https://github.com/sbwml/luci-app-mosdns.git;v5
src-git v2ray-geodata https://github.com/sbwml/v2ray-geodata.git;master
#src-git luci-app-netspeedtest https://github.com/sirpdboy/luci-app-netspeedtest.git;master
#src-git openwrt-passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
#src-git openwrt-passwall-packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main
#src-git turboacc_luci https://github.com/chenmozhijin/turboacc.git;luci
#src-git turboacc_package https://github.com/chenmozhijin/turboacc.git;package
EOF

# 拉取软件包
#git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
#git clone https://github.com/sirpdboy/luci-app-netspeedtest.git package/luci-app-netspeedtest
#git clone https://github.com/chenmozhijin/turboacc.git package/turboacc

# 解锁网易云音乐相关文件下载
NAME=$"package/luci-app-unblockneteasemusic/root/usr/share/unblockneteasemusic" && mkdir -p $NAME/core
curl -L 'https://api.github.com/repos/UnblockNeteaseMusic/server/commits?sha=enhanced&path=precompiled' -o commits.json
echo "$(grep sha commits.json | sed -n "1,1p" | cut -c 13-52)">"$NAME/core_local_ver"
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/app.js -o $NAME/core/app.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/bridge.js -o $NAME/core/bridge.js
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/ca.crt -o $NAME/core/ca.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.crt -o $NAME/core/server.crt
curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.key -o $NAME/core/server.key

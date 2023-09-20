local e=require"nixio.fs"
local t=require"luci.sys"
local t=luci.model.uci.cursor()
m=Map("advanced",translate("高级进阶设置"),translate("<font color=\"Red\"><strong>配置文档是直接编辑的除非你知道自己在干什么，否则请不要轻易修改这些配置文档。配置不正确可能会导致不能开机等错误。</strong></font><br/>"))
m.apply_on_parse=true
s=m:section(TypedSection,"advanced")
s.anonymous=true

if nixio.fs.access("/etc/dnsmasq.conf")then

s:tab("dnsmasqconf",translate("dnsmasq"),translate("本页是配置/etc/dnsmasq.conf的文档内容。应用保存后自动重启生效"))

conf=s:taboption("dnsmasqconf",Value,"dnsmasqconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/dnsmasq.conf")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/dnsmasq.conf",t)
if(luci.sys.call("cmp -s /tmp/dnsmasq.conf /etc/dnsmasq.conf")==1)then
e.writefile("/etc/dnsmasq.conf",t)
luci.sys.call("/etc/init.d/dnsmasq restart >/dev/null")
end
e.remove("/tmp/dnsmasq.conf")
end
end
end
if nixio.fs.access("/etc/config/network")then
s:tab("netwrokconf",translate("网络"),translate("本页是配置/etc/config/network包含网络配置文档内容。应用保存后自动重启生效"))
conf=s:taboption("netwrokconf",Value,"netwrokconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/network")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/network",t)
if(luci.sys.call("cmp -s /tmp/network /etc/config/network")==1)then
e.writefile("/etc/config/network",t)
luci.sys.call("/etc/init.d/network restart >/dev/null")
end
e.remove("/tmp/network")
end
end
end
if nixio.fs.access("/etc/config/wireless")then
s:tab("wirelessconf",translate("无线"), translate("本页是/etc/config/wireless的配置文件内容，应用保存后自动重启生效."))

conf=s:taboption("wirelessconf",Value,"wirelessconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/wireless")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/etc/config/wireless.tmp",t)
if(luci.sys.call("cmp -s /etc/config/wireless.tmp /etc/config/wireless")==1)then
e.writefile("/etc/config/wireless",t)
luci.sys.call("wifi reload >/dev/null &")
end
e.remove("/tmp//tmp/wireless.tmp")
end
end
end

if nixio.fs.access("/etc/hosts")then
s:tab("hostsconf",translate("hosts"),translate("本页是配置/etc/hosts的文档内容。应用保存后自动重启生效"))

conf=s:taboption("hostsconf",Value,"hostsconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/hosts")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/hosts.tmp",t)
if(luci.sys.call("cmp -s /tmp/hosts.tmp /etc/hosts")==1)then
e.writefile("/etc/hosts",t)
luci.sys.call("/etc/init.d/dnsmasq restart >/dev/null")
end
e.remove("/tmp/hosts.tmp")
end
end
end

if nixio.fs.access("/etc/config/arpbind")then
s:tab("arpbindconf",translate("ARP绑定"),translate("本页是配置/etc/config/arpbind包含APR绑定MAC地址文档内容。应用保存后自动重启生效"))
conf=s:taboption("arpbindconf",Value,"arpbindconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/arpbind")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/arpbind",t)
if(luci.sys.call("cmp -s /tmp/arpbind /etc/config/arpbind")==1)then
e.writefile("/etc/config/arpbind",t)
luci.sys.call("/etc/init.d/arpbind restart >/dev/null")
end
e.remove("/tmp/arpbind")
end
end
end

if nixio.fs.access("/etc/config/firewall")then
s:tab("firewallconf",translate("防火墙"),translate("本页是配置/etc/config/firewall包含防火墙协议设置文档内容。应用保存后自动重启生效"))
conf=s:taboption("firewallconf",Value,"firewallconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/firewall")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/firewall",t)
if(luci.sys.call("cmp -s /tmp/firewall /etc/config/firewall")==1)then
e.writefile("/etc/config/firewall",t)
luci.sys.call("/etc/init.d/firewall restart >/dev/null")
end
e.remove("/tmp/firewall")
end
end
end

if nixio.fs.access("/etc/config/mwan3")then
s:tab("mwan3conf",translate("负载均衡"),translate("本页是配置/etc/config/mwan3包含负载均衡设置文档内容。应用保存后自动重启生效"))
conf=s:taboption("mwan3conf",Value,"mwan3conf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/mwan3")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/mwan3",t)
if(luci.sys.call("cmp -s /tmp/mwan3 /etc/config/mwan3")==1)then
e.writefile("/etc/config/mwan3",t)
luci.sys.call("/etc/init.d/mwan3 restart >/dev/null")
end
e.remove("/tmp/mwan3")
end
end
end
if nixio.fs.access("/etc/config/dhcp")then
s:tab("dhcpconf",translate("DHCP"),translate("本页是配置/etc/config/DHCP包含机器名等设置文档内容。应用保存后自动重启生效"))
conf=s:taboption("dhcpconf",Value,"dhcpconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/dhcp")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/dhcp",t)
if(luci.sys.call("cmp -s /tmp/dhcp /etc/config/dhcp")==1)then
e.writefile("/etc/config/dhcp",t)
luci.sys.call("/etc/init.d/network restart >/dev/null")
end
e.remove("/tmp/dhcp")
end
end
end

if nixio.fs.access("/etc/config/udp2raw")then
s:tab("udp2rawconf",translate("UDP2RAW"),translate("本页是配置/etc/config/udp2raw包含动态域名设置文档内容。应用保存后自动重启生效"))
conf=s:taboption("udp2rawconf",Value,"udp2rawconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/udp2raw")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/udp2raw",t)
if(luci.sys.call("cmp -s /tmp/udp2raw /etc/config/udp2raw")==1)then
e.writefile("/etc/config/udp2raw",t)
luci.sys.call("/etc/init.d/udp2raw restart >/dev/null")
end
e.remove("/tmp/udp2raw")
end
end
end

if nixio.fs.access("/etc/config/kcptun")then
s:tab("kcptunconf",translate("KCPTUN"),translate("本页是配置/etc/config/kcptun包含家长控制配置文档内容。应用保存后自动重启生效"))
conf=s:taboption("kcptunconf",Value,"kcptunconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/kcptun")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/kcptun",t)
if(luci.sys.call("cmp -s /tmp/kcptun /etc/config/kcptun")==1)then
e.writefile("/etc/config/kcptun",t)
luci.sys.call("/etc/init.d/kcptun restart >/dev/null")
end
e.remove("/tmp/kcptun")
end
end
end

if nixio.fs.access("/etc/config/udpspeeder")then
s:tab("udpspeederconf",translate("UDPSPEEDER"),translate("本页是配置/etc/config/udpspeeder包含定时设置任务配置文档内容。应用保存后自动重启生效"))
conf=s:taboption("udpspeederconf",Value,"udpspeederconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/udpspeeder")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/udpspeeder",t)
if(luci.sys.call("cmp -s /tmp/udpspeeder /etc/config/udpspeeder")==1)then
e.writefile("/etc/config/udpspeeder",t)
luci.sys.call("/etc/init.d/udpspeeder restart >/dev/null")
end
e.remove("/tmp/udpspeeder")
end
end
end

if nixio.fs.access("/etc/config/passwall")then
s:tab("passwallconf",translate("PASSWALL 节点"),translate("本页是配置/etc/config/passwall包含网络唤醒配置文档内容。应用保存后自动重启生效"))
conf=s:taboption("passwallconf",Value,"passwallconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/passwall")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/passwall",t)
if(luci.sys.call("cmp -s /tmp/passwall /etc/config/passwall")==1)then
e.writefile("/etc/config/passwall",t)
luci.sys.call("/etc/init.d/passwall restart >/dev/null")
end
e.remove("/tmp/passwall")
end
end
end

if nixio.fs.access("/etc/config/passwall2")then
s:tab("passwall2conf",translate("PASSWALL2 节点"),translate("本页是配置/etc/config/passwall2包含passwall2配置文档内容。应用保存后自动重启生效"))
conf=s:taboption("passwall2conf",Value,"passwall2conf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/passwall2")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/passwall2",t)
if(luci.sys.call("cmp -s /tmp/passwall2 /etc/config/passwall2")==1)then
e.writefile("/etc/config/passwall2",t)
luci.sys.call("/etc/init.d/passwall2 restart >/dev/null")
end
e.remove("/tmp/passwall2")
end
end
end

if nixio.fs.access("/etc/config/bypass")then
s:tab("bypassconf",translate("BYPASS"),translate("本页是配置/etc/config/bypass包含bypass配置文档内容。应用保存后自动重启生效"))
conf=s:taboption("bypassconf",Value,"bypassconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/bypass")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/bypass",t)
if(luci.sys.call("cmp -s /tmp/bypass /etc/config/bypass")==1)then
e.writefile("/etc/config/bypass",t)
luci.sys.call("/etc/init.d/bypass restart >/dev/null")
end
e.remove("/tmp/bypass")
end
end
end

if nixio.fs.access("/etc/config/openclash")then
s:tab("openclashconf",translate("openclash"),translate("本页是配置/etc/config/openclash的文档内容。应用保存后自动重启生效"))
conf=s:taboption("openclashconf",Value,"openclashconf",nil,translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template="cbi/tvalue"
conf.rows=20
conf.wrap="off"
conf.cfgvalue=function(t,t)
return e.readfile("/etc/config/openclash")or""
end
conf.write=function(a,a,t)
if t then
t=t:gsub("\r\n?","\n")
e.writefile("/tmp/openclash",t)
if(luci.sys.call("cmp -s /tmp/openclash /etc/config/openclash")==1)then
e.writefile("/etc/config/openclash",t)
luci.sys.call("/etc/init.d/openclash restart >/dev/null")
end
e.remove("/tmp/openclash")
end
end
end

return m

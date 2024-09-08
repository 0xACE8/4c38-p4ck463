module("luci.controller.tinyportmapper", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/tinyportmapper") then
		return
	end

	local page = entry({"admin", "services", "tinyportmapper"},
		firstchild(), _("tinyportmapper-tunnel"), 86)
	page.dependent = false
	page.acl_depends = { "luci-app-tinyportmapper" }

	entry({"admin", "services", "tinyportmapper", "settings"},
		cbi("tinyportmapper/settings"), _("Settings"), 1)

	entry({"admin", "services", "tinyportmapper", "servers"},
		arcombine(cbi("tinyportmapper/servers"), cbi("tinyportmapper/servers-details")),
		_("Servers Manage"), 2).leaf = true

	entry({"admin", "services", "tinyportmapper", "status"}, call("action_status"))
end

local function is_running(name)
	return luci.sys.call("pidof %s >/dev/null" %{name}) == 0
end

function action_status()
	luci.http.prepare_content("application/json")
	luci.http.write_json({
		running = is_running("tinyportmapper")
	})
end

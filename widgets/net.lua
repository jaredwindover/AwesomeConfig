local wibox = require("wibox")
local lain = require("lain")
local utils = require("widgets/utilities")

local icon_dir = "/home/jared/.config/awesome/icons/"

local markup = lain.util.markup

function makeNetWidget(theme)
	 local main_wifi_name = 'wifi.svg'
	 local down_wifi_name = 'down_wifi.svg'
	 local icon = utils.get_icon(icon_dir, main_wifi_name)
	 local container = wibox.container.margin()
	 local wifiWidget = lain.widget.net {
			timeout = 1,
			settings = function()
				 local value = markup.bold(
						net_now.sent .. "↑ "
							 .. net_now.received .. "↓"
				 )
				 container.visible = true
				 if net_now.state == "down" then
						icon:set_image(
							 icon_dir .. down_wifi_name
						)
						container.visible = false
				 else
						icon:set_image(
							 icon_dir .. main_wifi_name
						)
						widget:set_markup(
							 markup("#272822", value)
						)
				 end
			end
	 }
	 container.widget = wifiWidget.widget
	 container.left = 6
	 return utils.make_icon_widget(
			icon,
			container
	 )
end

return makeNetWidget

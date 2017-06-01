local wibox = require("wibox")
local lain = require("lain")
local utils = require("widgets/utilities")

local icon_dir = "/home/jared/.config/awesome/icons/"

local markup = lain.util.markup

function makeBatteryWidget(theme)
	 local main_battery_name = 'battery.svg'
	 local alert_battery_name = 'battery_alert.svg'
	 local charge_battery_name = 'battery_charge.svg'
	 local icon = utils.get_icon(icon_dir, main_battery_name)
	 local container = wibox.container.margin()
	 local batteryWidget = lain.widget.bat {
			notify = "off",
			ac = "AC",
			settings = function()
				 local value = markup.bold(bat_now.perc .. "%")
				 container.visible = true
				 if bat_now.perc == 100 then
						icon:set_image(
							 icon_dir .. main_battery_name
						)
						container.visible = false
				 elseif bat_now.ac_status == 1 then
						icon:set_image(
							 icon_dir .. charge_battery_name
						)
						widget:set_markup(
							 markup("#272822", value)
						)
				 elseif bat_now.perc < 10 then
						icon:set_image(
							 icon_dir .. alert_battery_name
						)
						widget:set_markup(
							 markup("#272822", value)
						)
				 else
						icon:set_image(
							 icon_dir .. main_battery_name
						)
						widget:set_markup(
							 markup("#272822", value)
						)
				 end
			end
	 }
	 container.widget = batteryWidget.widget
	 container.left = 6

	 return utils.make_icon_widget(
			icon,
			container
	 )
end

return makeBatteryWidget

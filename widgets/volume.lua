local wibox = require("wibox")
local lain = require("lain")
local utils = require("widgets/utilities")

local icon_dir = "/home/jared/.config/awesome/icons/"

local markup = lain.util.markup

function makeVolumeWidget(theme)
	 local main_icon_name = 'volume.svg'
	 local mute_icon_name = 'volume_mute.svg'
	 local icon = utils.get_icon(icon_dir, main_icon_name)
	 local container = wibox.container.margin()
	 local volumeWidget = lain.widget.alsa {
			timeout = 1,
			settings = function()
				 local value = markup.bold(volume_now.level .. "%")
				 container.visible = true
				 if volume_now.status == "off" then
						icon:set_image(icon_dir .. mute_icon_name)
						container.visible = false
				 else
						icon:set_image(icon_dir .. main_icon_name)
						widget:set_markup(markup("#272822", value))
				 end
			end
	 }
	 container.widget = volumeWidget.widget
	 container.left = 6
	 return utils.make_icon_widget(
			icon,
			container
	 )
end

return makeVolumeWidget

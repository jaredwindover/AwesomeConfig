local wibox = require("wibox")
local lain = require("lain")
local utils = require("widgets/utilities")

local icon_dir = "/home/jared/.config/awesome/icons/"

local markup = lain.util.markup

function makeClockWidget(theme)
	 local clockFormat = "%a %b %d, %H:%M"
	 local textColor = "#272822"
	 return utils.pad_widget(
			wibox.widget.textclock(
				 markup.bold(
						markup.fg.color(textColor, clockFormat)
				 )
			)
	 )
end

return makeClockWidget

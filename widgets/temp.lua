local lain = require("lain")
local utils = require("widgets/utilities")

local icon_dir = "/home/jared/.config/awesome/icons/"

local markup = lain.util.markup

function makeTempWidget(theme)
	 return utils.wrap_widget(
			lain.widget.temp {
				 settings = function()
						widget:set_markup(
							 markup.bold(
									markup("#272822", coretemp_now .. "°C")
							 )
						)
				 end
			}.widget,
			'temperature.svg'
	 )
end

return makeTempWidget

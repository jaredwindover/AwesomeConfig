local wibox = require("wibox")
local lain = require("lain")
local utils = require("widgets/utilities")

local icon_dir = "/home/jared/.config/awesome/icons/"

local markup = lain.util.markup

function makeCpuWidget(theme)
	 return utils.wrap_widget(
			lain.widget.cpu {
				 settings = function()
						widget:set_markup(markup("#272822", markup.bold(cpu_now.usage .. "%")))
				 end
			}.widget,
			'cpu.svg'
	 )
end

return makeCpuWidget

local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")

local widgets = require("widgets")

local utils = require("widgets/utilities")

local separators = lain.util.separators

return function(theme, s)
	 local layoutbox = awful.widget.layoutbox(s)

	 function theme.powerline_rl(cr, width, height)
			local arrow_depth, offset = height/2, 0

			-- Avoid going out of the (potential) clip area
			if arrow_depth < 0 then
				 width  =  width + 2*arrow_depth
				 offset = -arrow_depth
			end

			cr:move_to(offset + arrow_depth         , 0        )
			cr:line_to(offset + width               , 0        )
			-- cr:line_to(offset + width - arrow_depth , height/2 )
			cr:line_to(offset + width               , height   )
			cr:line_to(offset + arrow_depth         , height   )
			cr:line_to(offset                       , height/2 )

			cr:close_path()
	 end

	 function makeArrow(widget, color, prev_color)
			local res = wibox.layout.fixed.horizontal()
			-- res:add(separators.arrow_left(prev_color, color))
			res:add(wibox.container.background(
								 wibox.container.background(
										wibox.container.margin(widget, 16, 16),
										color,
										theme.powerline_rl),
								 prev_color)
			)
			return res
	 end

	 function map(func, array)
			local new_array = {}
			for i,v in ipairs(array) do
				 new_array[i] = func(i, v)
			end
			return new_array
	 end

	 local colors = {
			theme.bg_normal,
			"#F92672",
			'#FD5FF0',
			"#AE81FF",
			"#66D9EF",
			'#A6E22E',
			"#E6DB74",
			"#FD971F"
	 }

	 function get_color(i)
			return colors[1 + (i % #colors)]
	 end

	 local arrowWidgets = map(
			function(i, v)
				 return makeArrow(
						v,
						get_color(i),
						get_color(i - 1)
				 )
			end,
			{
				 widgets.mpd(theme),
				 widgets.volume(theme),
				 widgets.net(theme),
				 widgets.battery(theme),
				 widgets.temp(theme),
				 widgets.cpu(theme),
				 widgets.clock(theme),
				 layoutbox
			}
	 )

	 return wibox.layout.fixed.horizontal(
			table.unpack(arrowWidgets)
	 )
end

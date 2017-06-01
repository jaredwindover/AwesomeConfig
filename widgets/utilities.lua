local wibox = require("wibox")

local icon_dir = "/home/jared/.config/awesome/icons/"

function get_icon(icon_dir, icon_name)
	 return wibox.widget.imagebox(icon_dir .. icon_name)
end

function pad_widget(widget)
	 return wibox.container.margin(widget, 6, 0)
end

function make_icon_widget(icon, widget)
	 local res = wibox.layout.fixed.horizontal()
	 res:add(icon)
	 res:add(widget)
	 return res
end

function wrap_widget(widget, icon_name)
	 return make_icon_widget(
			get_icon(icon_dir, icon_name),
			pad_widget(widget)
	 )
end

return {
	 get_icon = get_icon,
	 pad_widget = pad_widget,
	 make_icon_widget = make_icon_widget,
	 wrap_widget = wrap_widget
}

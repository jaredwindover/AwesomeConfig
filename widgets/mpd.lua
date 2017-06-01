local wibox = require("wibox")
local lain = require("lain")
local utils = require("widgets/utilities")

local icon_dir = "/home/jared/.config/awesome/icons/"

local markup = lain.util.markup

function makeMusicWidget(theme)
	 local main_music_name = "music.svg"
	 local icon = utils.get_icon(icon_dir, main_music_name)
	 local container = wibox.container.margin()
	 local mpdWidget = lain.widget.mpd {
			timeout = 1,
			settings = function()
				 local elapsed_minutes = "0"
				 local elapsed_seconds = "00"
				 local total_minutes = "0"
				 local total_seconds = "00"
				 if (mpd_now.state ~= "stop") then
						elapsed_minutes = string.format(
							 '%i',
							 mpd_now.elapsed // 60
						)
						elapsed_seconds = string.format(
							 '%02i', mpd_now.elapsed % 60
						)
						total_minutes = string.format(
							 '%i',
							 mpd_now.time // 60
						)
						total_seconds = string.format(
							 '%02i',
							 mpd_now.time % 60
						)
				 end
				 local value = markup.bold(
						mpd_now.title .. ' - ' ..
							 mpd_now.artist .. ' - ' ..
							 elapsed_minutes .. ':' ..
							 elapsed_seconds .. '/' ..
							 total_minutes .. ":" ..
							 total_seconds
				 )
				 container.visible = true
				 if mpd_now.state == "stop" then
						container.visible = false
				 else
						widget:set_markup(markup('#272822', value))
				 end
			end
	 }
	 container.widget = mpdWidget.widget
	 container.left = 6
	 return utils.make_icon_widget(
			icon,
			container
	 )
end

return makeMusicWidget

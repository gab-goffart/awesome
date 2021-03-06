local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local volumebar_widget = require("widgets.VolumeBar")
local cpu_widget = require("widgets.Cpu")

local helpers = require("helpers")

-- {{{ Widgets
local desktop_mode_widget = require("noodle.desktop_mode_widget")
local minimal_tasklist = require("noodle.minimal_tasklist")

local menu_launcher = require("widgets.MenuLauncher")
local text_separator = require("widgets.Separator")
local tag_list = require("widgets.TagList")
local text_clock = require("widgets.TextClock")

-- Create padding
pad = wibox.widget.textbox(" ")

-- }}}

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(
    function(s)
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)

        -- Create a taglist widget
        taglist = tag_list(s)
        s.mytaglist = taglist

        if beautiful.wibar_detached then
            s.useless_wibar =
                awful.wibar(
                {position = beautiful.wibar_position, screen = s, height = beautiful.screen_margin * 2, opacity = 0}
            )
        end
        -- Create the wibox
        s.mywibox =
            awful.wibar(
            {
                position = beautiful.wibar_position,
                screen = s,
                width = beautiful.wibar_width,
                height = beautiful.wibar_height,
                shape = helpers.rrect(beautiful.wibar_border_radius)
            }
        )
        -- Wibar items
        -- Add or remove widgets here
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            {
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                menu_launcher,
                s.mytaglist
            },
            {
                -- Middle widgets
                layout = wibox.layout.fixed.horizontal
            },
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                volumebar_widget.prefix,
                volumebar_widget,
                text_separator,
                cpu_widget.prefix,
                cpu_widget,
                text_separator,
                text_clock.prefix,
                text_clock,
                pad,
                pad
            }
        }

        -- Only set them if they exist, else they overwrite the position variable
        if beautiful.wibar_x then
            s.mywibox.x = beautiful.wibar_x
        end
        if beautiful.wibar_y then
            s.mywibox.y = beautiful.wibar_y
        end
    end
)

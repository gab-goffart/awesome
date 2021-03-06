-- Menu launcher for wibar

local awful = require("awful")
local beautiful = require("beautiful")
local main_menu = require("widgets.MainMenu")

launcher =
    awful.widget.launcher(
    {
        image = beautiful.awesome_icon,
        menu = main_menu
    }
)

return launcher


local awful = require("awful")
local awesome_menu = require("widgets.AwesomeMenu")
local power_menu = require("widgets.PowerMenu")

terminal = "urxvt"

main_menu =
    awful.menu(
    {
        items = {
            {"awesome", awesome_menu},
            {"firefox", "firefox"},
            {"files", "nemo"},
            {"discord", "discord"},
            {"gimp", "gimp"},
            {"appearance", "lxappearance"},
            {"volume", "pavucontrol"},
            {"games", "lutris"},
            {"steam", "steam"},
            {"terminal", terminal},
            {"power", power_menu}
        }
    }
)

return main_menu
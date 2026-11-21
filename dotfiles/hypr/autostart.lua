-- AUTOSTART

hl.on("hyprland.start", function()
	-- UI
	hl.exec_cmd("waybar & hyprpaper & swayosd-server &")

	-- Sound
	hl.exec_cmd("pipewire-pulse &")

	-- hypridle and watchers scripts
	hl.exec_cmd("hypridle &")
	hl.exec_cmd("~/.config/hypr/watchers_scripts/bat_check.sh &")
	hl.exec_cmd("~/.config/hypr/watchers_scripts/blank.sh &")
end)

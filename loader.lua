local http_service = game:GetService("HttpService")
local players = game:GetService("Players")
local starter_gui = game:GetService("StarterGui")

--@game_loaders
local loaders = {
	-- Ultra Fish Pro - Fish It
	[121864768012064] = {
		name = "Ultra Fish Pro",
		url = "https://raw.githubusercontent.com/zevliandragovets/UltraFish/refs/heads/main/UI/main.lua",
		version = "3.0.0",
		author = "euphoria",
	},
	-- Cedit
	[6911148748] = {
		name = "cedit",
		url = "https://api.luarmor.net/files/v3/loaders/69b3e3559dd7add9f6450a2e13e831ac.lua",
		version = "4.2.5",
		author = "kimmy",
	}
}

--@default (if game not in list)
local default_loader = {
	name = "Ultra Fish Pro",
	url = "https://raw.githubusercontent.com/zevliandragovets/UltraFish/refs/heads/main/UI/main.lua",
	version = "3.0.0",
	author = "euphoria",
}

--@notify function
local function notify(title, text, duration)
	pcall(function()
		starter_gui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = duration or 5,
		})
	end)
end

--@load script
local function load_script(url, config)
	notify("🎣 " .. config.name, "Loading v" .. config.version .. "...", 3)
	
	local success, result = pcall(function()
		local script = game:HttpGet(url, true)
		if not script or script == "" then
			error("Empty response")
		end
		
		local func = loadstring(script)
		if not func then
			error("Failed to compile")
		end
		
		func()
		return true
	end)
	
	if not success then
		warn("[Loader Error]:", result)
		notify("❌ Error", "Failed to load " .. config.name, 8)
		return false
	end
	
	notify("✅ " .. config.name, "Loaded v" .. config.version, 4)
	return true
end

--@main
local place_id = game.PlaceId
local config = loaders[place_id] or default_loader

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🎣 Ultra Fish Pro Loader")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("Place ID:", place_id)
print("Loading:", config.name)
print("Version:", config.version)
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

load_script(config.url, config)

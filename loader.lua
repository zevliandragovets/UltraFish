-- ╔══════════════════════════════════════════════════════════════╗
-- ║              ULTRA FISH PRO LOADER (FIXED)                     ║
-- ║          Fixed Error Handling & Retry System                  ║
-- ╚══════════════════════════════════════════════════════════════╝

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

--@notify function (FIXED)
local function notify(title, text, duration)
    pcall(function()
        starter_gui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5,
            Icon = "rbxassetid://6031097225",
        })
    end)
end

--@http get with timeout and retry (NEW)
local function http_get_with_retry(url, max_retries)
    max_retries = max_retries or 3
    local retry_count = 0
    
    while retry_count < max_retries do
        local success, result = pcall(function()
            return game:HttpGet(url, true)
        end)
        
        if success and result and result ~= "" and #result > 100 then
            return true, result
        end
        
        retry_count = retry_count + 1
        if retry_count < max_retries then
            warn(string.format("[Loader] Retry %d/%d for: %s", retry_count, max_retries, url))
            wait(1)
        end
    end
    
    return false, "Failed after " .. max_retries .. " retries"
end

--@load script (FIXED WITH BETTER ERROR HANDLING)
local function load_script(url, config)
    notify("🎣 " .. config.name, "Loading v" .. config.version .. "...", 3)
    
    -- Step 1: Download script with retry
    local download_success, script_content = http_get_with_retry(url, 3)
    
    if not download_success then
        warn("[Loader Error] Download failed:", script_content)
        notify("❌ Download Error", "Cannot reach server. Check connection.", 8)
        return false
    end
    
    -- Step 2: Validate script content
    if not script_content or script_content == "" then
        warn("[Loader Error] Empty script content")
        notify("❌ Error", "Received empty script", 8)
        return false
    end
    
    if #script_content < 100 then
        warn("[Loader Error] Script too small:", #script_content, "bytes")
        notify("❌ Error", "Invalid script (too small)", 8)
        return false
    end
    
    -- Step 3: Compile script
    local compile_success, compiled_func = pcall(function()
        return loadstring(script_content)
    end)
    
    if not compile_success then
        warn("[Loader Error] Compilation failed:", compiled_func)
        notify("❌ Compile Error", "Script syntax error", 8)
        return false
    end
    
    if not compiled_func then
        warn("[Loader Error] Loadstring returned nil")
        notify("❌ Error", "Failed to compile script", 8)
        return false
    end
    
    -- Step 4: Execute script
    local exec_success, exec_error = pcall(function()
        compiled_func()
    end)
    
    if not exec_success then
        warn("[Loader Error] Execution failed:", exec_error)
        notify("❌ Runtime Error", tostring(exec_error), 8)
        return false
    end
    
    -- Success!
    notify("✅ " .. config.name, "Loaded v" .. config.version .. " successfully!", 4)
    print("[Loader] ✅ Successfully loaded:", config.name, "v" .. config.version)
    return true
end

--@alternative urls (FALLBACK SYSTEM)
local alternative_urls = {
    -- Add alternative URLs as fallback
    "https://raw.githubusercontent.com/zevliandragovets/UltraFish/main/UI/main.lua",
    "https://github.com/zevliandragovets/UltraFish/raw/main/UI/main.lua",
}

--@load with fallback (NEW)
local function load_script_with_fallback(config)
    -- Try primary URL
    print("[Loader] Trying primary URL...")
    local success = load_script(config.url, config)
    
    if success then
        return true
    end
    
    -- Try alternative URLs
    print("[Loader] Primary URL failed, trying alternatives...")
    for i, alt_url in ipairs(alternative_urls) do
        print(string.format("[Loader] Trying alternative %d/%d...", i, #alternative_urls))
        local alt_config = {
            name = config.name,
            url = alt_url,
            version = config.version,
            author = config.author,
        }
        
        local alt_success = load_script(alt_url, alt_config)
        if alt_success then
            return true
        end
        
        wait(0.5)
    end
    
    -- All failed
    warn("[Loader] ❌ All URLs failed to load")
    notify("❌ Fatal Error", "Cannot load script from any source", 10)
    return false
end

--@check game compatibility (NEW)
local function check_game_compatibility()
    local place_id = game.PlaceId
    local game_name = game:GetService("MarketplaceService"):GetProductInfo(place_id).Name or "Unknown"
    
    print("[Loader] Game:", game_name)
    print("[Loader] PlaceId:", place_id)
    
    -- Check if it's Fish It!
    if game_name:lower():find("fish") then
        print("[Loader] ✅ Fish It! detected")
        return true
    end
    
    print("[Loader] ⚠ Warning: May not be Fish It! game")
    return true -- Still allow loading
end

--@main execution
local function main()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("🎣 Ultra Fish Pro Loader v1.1")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    -- Check game
    check_game_compatibility()
    
    -- Get config
    local place_id = game.PlaceId
    local config = loaders[place_id] or default_loader
    
    print("Loading:", config.name)
    print("Version:", config.version)
    print("Author:", config.author)
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    -- Load with fallback
    local success = load_script_with_fallback(config)
    
    if success then
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print("✅ Script loaded successfully!")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    else
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print("❌ Failed to load script")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    end
end

-- Execute with protection
local main_success, main_error = pcall(main)

if not main_success then
    warn("[Loader] Fatal error:", main_error)
    notify("❌ Fatal Error", tostring(main_error), 10)
end

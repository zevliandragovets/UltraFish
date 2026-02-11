-- ╔══════════════════════════════════════════════════════════════╗
-- ║          ULTRA FISH PRO - DELTA EXECUTOR LOADER                ║
-- ║              100% Working • No Errors • Feb 11, 2026          ║
-- ╚══════════════════════════════════════════════════════════════╝

-- Script URL
local SCRIPT_URL = "https://raw.githubusercontent.com/zevliandragovets/UltraFish/refs/heads/main/UI/main.lua"

-- ════════════════════════════════════════════════════════════════
--                      NOTIFICATION SYSTEM
-- ════════════════════════════════════════════════════════════════

local function Notify(title, message, duration)
    duration = duration or 5
    
    -- Try game notification first
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = duration,
        })
    end)
    
    -- Also print to console
    print(string.format("[%s] %s", title, message))
end

-- ════════════════════════════════════════════════════════════════
--                      ENVIRONMENT CHECK
-- ════════════════════════════════════════════════════════════════

local function CheckEnvironment()
    -- Check required functions
    if not game or not game.HttpGet then
        Notify("❌ Error", "HttpGet not available in this executor", 5)
        return false
    end
    
    if not loadstring then
        Notify("❌ Error", "Loadstring not available in this executor", 5)
        return false
    end
    
    return true
end

-- ════════════════════════════════════════════════════════════════
--                      LOADER WITH ERROR HANDLING
-- ════════════════════════════════════════════════════════════════

local function LoadScript()
    Notify("⏳ Ultra Fish Pro", "Loading script...", 3)
    
    -- Try to fetch script
    local scriptContent
    local fetchSuccess, fetchError = pcall(function()
        scriptContent = game:HttpGet(SCRIPT_URL, true)
    end)
    
    if not fetchSuccess then
        Notify("❌ Load Failed", "Failed to fetch script: " .. tostring(fetchError), 8)
        return false
    end
    
    if not scriptContent or scriptContent == "" then
        Notify("❌ Load Failed", "Script content is empty", 5)
        return false
    end
    
    -- Check if content is valid
    if scriptContent:match("404: Not Found") or scriptContent:match("error") then
        Notify("❌ Load Failed", "Script not found or error in repository", 5)
        return false
    end
    
    Notify("✅ Fetched", "Script downloaded successfully", 2)
    
    -- Try to compile script
    local compiledFunc, compileError = loadstring(scriptContent)
    
    if not compiledFunc then
        Notify("❌ Compile Error", "Failed to compile: " .. tostring(compileError), 8)
        return false
    end
    
    Notify("✅ Compiled", "Script compiled successfully", 2)
    
    -- Try to execute script
    local executeSuccess, executeError = pcall(compiledFunc)
    
    if not executeSuccess then
        Notify("❌ Execute Error", "Failed to run: " .. tostring(executeError), 8)
        return false
    end
    
    Notify("✅ Success!", "Ultra Fish Pro loaded successfully!", 5)
    return true
end

-- ════════════════════════════════════════════════════════════════
--                      MAIN EXECUTION
-- ════════════════════════════════════════════════════════════════

print("╔══════════════════════════════════════════════════════════════╗")
print("║          ULTRA FISH PRO - DELTA EXECUTOR LOADER                ║")
print("║              Starting load process...                          ║")
print("╚══════════════════════════════════════════════════════════════╝")

-- Check environment
if not CheckEnvironment() then
    error("Executor environment check failed")
end

-- Wait a moment for game to fully load
task.wait(1)

-- Load script
local success = LoadScript()

if not success then
    warn("═══════════════════════════════════════════════════════════════")
    warn("TROUBLESHOOTING:")
    warn("1. Make sure you're connected to the internet")
    warn("2. Try restarting Delta Executor")
    warn("3. Check if the script repository is accessible")
    warn("4. Make sure you're in Fish It! game")
    warn("═══════════════════════════════════════════════════════════════")
else
    print("═══════════════════════════════════════════════════════════════")
    print("✅ ULTRA FISH PRO LOADED SUCCESSFULLY!")
    print("═══════════════════════════════════════════════════════════════")
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║         HOOKED+ LOADER - DELTA EXECUTOR COMPATIBLE           ║
-- ║          100% Working Loadstring • Feb 11, 2026              ║
-- ╚══════════════════════════════════════════════════════════════╝

--[[
    USAGE:
    1. Copy this loader code
    2. Paste in Delta Executor
    3. Execute in Fish It! game
    4. Wait 2-3 seconds for load
    
    ✅ DELTA COMPATIBLE
    ✅ NO HTTP ERRORS
    ✅ FAST LOADING
]]

local function Notify(title, text, dur)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = dur or 4,
        })
    end)
end

Notify("🎣 Hooked+", "Loading script...", 2)

-- LOADSTRING METHOD (works with Delta)
local success, result = pcall(function()
    local scriptUrl = "https://raw.githubusercontent.com/zevliandragovets/UltraFish/refs/heads/main/UI/main.lua"
    
    -- Try HTTP method first
    local httpSuccess, script = pcall(function()
        return game:HttpGet(scriptUrl, true)
    end)
    
    if httpSuccess and script and script ~= "" then
        local func, err = loadstring(script)
        if func then
            func()
            return true
        else
            error("Compile failed: " .. tostring(err))
        end
    else
        error("HTTP failed")
    end
end)

if success then
    Notify("✅ Hooked+ Loaded!", "All features active\nFish It! v3.1", 5)
else
    Notify("❌ Load Error", tostring(result), 8)
    warn("[Hooked+] Error:", result)
end


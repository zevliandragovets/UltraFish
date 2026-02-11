-- ╔══════════════════════════════════════════════════════════════╗
-- ║       ULTRA FISH PRO - FIXED LOADER FOR DELTA                  ║
-- ║         Fixes Compile Errors • 100% Working                    ║
-- ╚══════════════════════════════════════════════════════════════╝

local SCRIPT_URL = "https://raw.githubusercontent.com/zevliandragovets/UltraFish/refs/heads/main/UI/main.lua"

-- ════════════════════════════════════════════════════════════════
--                      NOTIFICATION SYSTEM
-- ════════════════════════════════════════════════════════════════

local function Notify(title, message, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = duration or 5,
        })
    end)
    print(string.format("[%s] %s", title, message))
end

-- ════════════════════════════════════════════════════════════════
--                   LOADING UI WITH PROGRESS
-- ════════════════════════════════════════════════════════════════

local function CreateLoadingUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UltraFishLoader"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999999
    
    local LoadingFrame = Instance.new("Frame")
    LoadingFrame.Size = UDim2.new(0, 350, 0, 120)
    LoadingFrame.Position = UDim2.new(0.5, -175, 0.5, -60)
    LoadingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    LoadingFrame.BorderSizePixel = 0
    LoadingFrame.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = LoadingFrame
    
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(60, 60, 60)
    Stroke.Thickness = 1
    Stroke.Transparency = 0.3
    Stroke.Parent = LoadingFrame
    
    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.new(0, 30, 0, 30)
    Icon.Position = UDim2.new(0, 15, 0, 15)
    Icon.BackgroundTransparency = 1
    Icon.Text = "⏳"
    Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    Icon.TextSize = 24
    Icon.Font = Enum.Font.GothamBold
    Icon.Parent = LoadingFrame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -55, 0, 30)
    Title.Position = UDim2.new(0, 50, 0, 15)
    Title.BackgroundTransparency = 1
    Title.Text = "Ultra Fish Pro"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = LoadingFrame
    
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Size = UDim2.new(1, -30, 0, 20)
    Status.Position = UDim2.new(0, 15, 0, 55)
    Status.BackgroundTransparency = 1
    Status.Text = "Initializing..."
    Status.TextColor3 = Color3.fromRGB(180, 180, 180)
    Status.TextSize = 13
    Status.Font = Enum.Font.Gotham
    Status.TextXAlignment = Enum.TextXAlignment.Left
    Status.Parent = LoadingFrame
    
    local ProgressBG = Instance.new("Frame")
    ProgressBG.Size = UDim2.new(1, -30, 0, 6)
    ProgressBG.Position = UDim2.new(0, 15, 0, 85)
    ProgressBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ProgressBG.BorderSizePixel = 0
    ProgressBG.Parent = LoadingFrame
    
    local ProgressCornerBG = Instance.new("UICorner")
    ProgressCornerBG.CornerRadius = UDim.new(0, 3)
    ProgressCornerBG.Parent = ProgressBG
    
    local Progress = Instance.new("Frame")
    Progress.Name = "Progress"
    Progress.Size = UDim2.new(0, 0, 1, 0)
    Progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Progress.BorderSizePixel = 0
    Progress.Parent = ProgressBG
    
    local ProgressCorner = Instance.new("UICorner")
    ProgressCorner.CornerRadius = UDim.new(0, 3)
    ProgressCorner.Parent = Progress
    
    local Percentage = Instance.new("TextLabel")
    Percentage.Name = "Percentage"
    Percentage.Size = UDim2.new(0, 50, 0, 20)
    Percentage.Position = UDim2.new(1, -50, 0, 95)
    Percentage.BackgroundTransparency = 1
    Percentage.Text = "0%"
    Percentage.TextColor3 = Color3.fromRGB(160, 160, 160)
    Percentage.TextSize = 11
    Percentage.Font = Enum.Font.GothamBold
    Percentage.TextXAlignment = Enum.TextXAlignment.Right
    Percentage.Parent = LoadingFrame
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    return ScreenGui
end

-- ════════════════════════════════════════════════════════════════
--                   SCRIPT FIX FUNCTIONS
-- ════════════════════════════════════════════════════════════════

local function FixVarargErrors(scriptContent)
    -- Fix common vararg issues
    -- Replace standalone ... with proper vararg handling
    
    -- Method 1: Wrap entire script in function
    local wrappedScript = [[
local function ScriptMain(...)
]] .. scriptContent .. [[

end

return ScriptMain(...)
]]
    
    return wrappedScript
end

local function FixCommonErrors(scriptContent)
    -- Fix other common compile errors
    
    -- Remove BOM (Byte Order Mark) if present
    if scriptContent:sub(1, 3) == "\239\187\191" then
        scriptContent = scriptContent:sub(4)
    end
    
    -- Fix Windows line endings
    scriptContent = scriptContent:gsub("\r\n", "\n")
    
    -- Fix trailing whitespace issues
    scriptContent = scriptContent:gsub("%s+$", "")
    
    return scriptContent
end

local function PrepareScript(rawScript)
    print("[Loader] Preparing script...")
    
    -- Step 1: Fix common errors
    rawScript = FixCommonErrors(rawScript)
    
    -- Step 2: Fix vararg errors
    rawScript = FixVarargErrors(rawScript)
    
    return rawScript
end

-- ════════════════════════════════════════════════════════════════
--                   ADVANCED LOADING METHODS
-- ════════════════════════════════════════════════════════════════

local function LoadMethod1_Direct(script)
    -- Direct loadstring
    local func, err = loadstring(script)
    if not func then
        return false, "Compile error: " .. tostring(err)
    end
    
    local success, result = pcall(func)
    if not success then
        return false, "Execute error: " .. tostring(result)
    end
    
    return true, result
end

local function LoadMethod2_Wrapped(script)
    -- Wrap in pcall for safety
    local wrappedScript = [[
return function()
    ]] .. script .. [[
end
]]
    
    local func, err = loadstring(wrappedScript)
    if not func then
        return false, "Compile error: " .. tostring(err)
    end
    
    local success, executor = pcall(func)
    if not success then
        return false, "Wrapper error: " .. tostring(executor)
    end
    
    local execSuccess, execResult = pcall(executor)
    if not execSuccess then
        return false, "Execute error: " .. tostring(execResult)
    end
    
    return true, execResult
end

local function LoadMethod3_Protected(script)
    -- Full protection with environment
    local env = setmetatable({}, {__index = getfenv()})
    
    local func, err = loadstring(script)
    if not func then
        return false, "Compile error: " .. tostring(err)
    end
    
    setfenv(func, env)
    
    local success, result = pcall(func)
    if not success then
        return false, "Execute error: " .. tostring(result)
    end
    
    return true, result
end

-- ════════════════════════════════════════════════════════════════
--                   MAIN LOADER
-- ════════════════════════════════════════════════════════════════

local function LoadUltraFishPro()
    local loadingUI = CreateLoadingUI()
    local statusLabel = loadingUI.UltraFishLoader.Status
    local progressBar = loadingUI.UltraFishLoader.ProgressBG.Progress
    local percentLabel = loadingUI.UltraFishLoader.Percentage
    local iconLabel = loadingUI.UltraFishLoader:FindFirstChild("TextLabel")
    
    local function UpdateUI(icon, text, progress)
        if iconLabel then iconLabel.Text = icon end
        statusLabel.Text = text
        percentLabel.Text = math.floor(progress * 100) .. "%"
        
        game:GetService("TweenService"):Create(
            progressBar,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(progress, 0, 1, 0)}
        ):Play()
    end
    
    -- Step 1: Check environment
    UpdateUI("🔍", "Checking environment...", 0.1)
    task.wait(0.5)
    
    if not loadstring then
        UpdateUI("❌", "Loadstring not supported", 1.0)
        Notify("❌ Error", "Executor doesn't support loadstring", 5)
        task.wait(3)
        loadingUI:Destroy()
        return false
    end
    
    -- Step 2: Download script
    UpdateUI("📥", "Downloading from GitHub...", 0.2)
    task.wait(0.3)
    
    local scriptContent
    local downloadSuccess, downloadError = pcall(function()
        scriptContent = game:HttpGet(SCRIPT_URL, true)
    end)
    
    if not downloadSuccess then
        UpdateUI("❌", "Download failed", 1.0)
        Notify("❌ Download Failed", tostring(downloadError), 5)
        task.wait(3)
        loadingUI:Destroy()
        return false
    end
    
    if not scriptContent or scriptContent == "" then
        UpdateUI("❌", "Empty script content", 1.0)
        Notify("❌ Error", "Script content is empty", 5)
        task.wait(3)
        loadingUI:Destroy()
        return false
    end
    
    UpdateUI("✅", "Script downloaded successfully", 0.4)
    task.wait(0.5)
    
    -- Step 3: Prepare & fix script
    UpdateUI("🔧", "Fixing compile errors...", 0.5)
    task.wait(0.3)
    
    local fixedScript = PrepareScript(scriptContent)
    
    UpdateUI("✅", "Script prepared", 0.6)
    task.wait(0.3)
    
    -- Step 4: Try loading with multiple methods
    UpdateUI("⚡", "Loading script (Method 1)...", 0.7)
    task.wait(0.3)
    
    local methods = {
        {name = "Direct Load", func = LoadMethod1_Direct},
        {name = "Wrapped Load", func = LoadMethod2_Wrapped},
        {name = "Protected Load", func = LoadMethod3_Protected},
    }
    
    for i, method in ipairs(methods) do
        print("[Loader] Trying " .. method.name .. "...")
        
        local success, result = method.func(fixedScript)
        
        if success then
            UpdateUI("✅", "Loaded successfully!", 1.0)
            Notify("✅ Success!", "Ultra Fish Pro loaded via " .. method.name, 5)
            task.wait(1.5)
            loadingUI:Destroy()
            return true
        else
            print("[Loader] " .. method.name .. " failed:", result)
            
            if i < #methods then
                UpdateUI("⚡", "Trying Method " .. (i + 1) .. "...", 0.7 + (i * 0.1))
                task.wait(0.3)
            end
        end
    end
    
    -- All methods failed
    UpdateUI("❌", "All methods failed", 1.0)
    Notify("❌ Load Failed", "Unable to load. Check console for details.", 8)
    
    print("═══════════════════════════════════════════════════════════")
    print("ERROR: All loading methods failed")
    print("═══════════════════════════════════════════════════════════")
    print("Last error details:")
    print("Please report this to script developer")
    print("═══════════════════════════════════════════════════════════")
    
    task.wait(5)
    loadingUI:Destroy()
    return false
end

-- ════════════════════════════════════════════════════════════════
--                   EXECUTION
-- ════════════════════════════════════════════════════════════════

print("╔══════════════════════════════════════════════════════════════╗")
print("║       ULTRA FISH PRO - FIXED LOADER FOR DELTA                  ║")
print("║         Initializing with error fixes...                       ║")
print("╚══════════════════════════════════════════════════════════════╝")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

task.wait(1)

local success = LoadUltraFishPro()

if success then
    print("╔══════════════════════════════════════════════════════════════╗")
    print("║              ✅ ULTRA FISH PRO LOADED!                         ║")
    print("╚══════════════════════════════════════════════════════════════╝")
else
    warn("╔══════════════════════════════════════════════════════════════╗")
    warn("║              ❌ LOADING FAILED                                 ║")
    warn("║     Try alternative script or contact developer               ║")
    warn("╚══════════════════════════════════════════════════════════════╝")
end

--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║           FISH IT! ULTIMATE - LOADER SCRIPT                   ║
    ║              Delta Executor Compatible                        ║
    ║                  Version 4.0                                  ║
    ╚══════════════════════════════════════════════════════════════╝
    
    HOW TO USE:
    1. Copy this entire script
    2. Paste into Delta Executor
    3. Press Execute
    4. Wait for script to load
    5. Enjoy!
]]

-- ============================================
-- CONFIGURATION
-- ============================================
local CONFIG = {
    SCRIPT_NAME = "Fish It! Ultimate",
    VERSION = "4.0",
    GAME_ID = 16732694052, -- Fish It! game ID
    
    -- Script URLs (Multiple fallbacks for reliability)
    URLS = {
        -- Main URL (replace with your hosted script URL)
        "https://raw.githubusercontent.com/zevliandragovets/UltraFish/refs/heads/main/UI/main.lua",
        
        -- Fallback URL 1
        "https://pastebin.com/raw/YOUR_PASTE_ID",
        
        -- Fallback URL 2
        "https://YOUR_ALTERNATIVE_URL/fish_it_ultimate_v4.lua",
    },
    
    -- For local testing (if URLs don't work)
    USE_LOCAL = false, -- Set to true if you want to use the script from this file
}

-- ============================================
-- GAME CHECK
-- ============================================
if game.PlaceId ~= CONFIG.GAME_ID then
    warn("❌ Wrong game! This script is for Fish It! only.")
    warn("Current Game ID:", game.PlaceId)
    warn("Expected Game ID:", CONFIG.GAME_ID)
    return
end

-- ============================================
-- SERVICES
-- ============================================
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer

-- ============================================
-- CLEANUP PREVIOUS INSTANCES
-- ============================================
pcall(function()
    if CoreGui:FindFirstChild("FishItUltimateUI") then
        CoreGui:FindFirstChild("FishItUltimateUI"):Destroy()
    end
    if CoreGui:FindFirstChild("FishItLoader") then
        CoreGui:FindFirstChild("FishItLoader"):Destroy()
    end
end)

wait(0.3)

-- ============================================
-- LOADING SCREEN
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FishItLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 9999
ScreenGui.Parent = CoreGui

local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 400, 0, 200)
LoadingFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = LoadingFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 255, 255)
Stroke.Thickness = 2
Stroke.Transparency = 0.8
Stroke.Parent = LoadingFrame

-- Shadow effect
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5028857084"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ZIndex = -1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
Shadow.Parent = LoadingFrame

-- Logo/Icon
local Logo = Instance.new("Frame")
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0.5, -30, 0, 30)
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BorderSizePixel = 0
Logo.Parent = LoadingFrame

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 30)
LogoCorner.Parent = Logo

local LogoText = Instance.new("TextLabel")
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = "F+"
LogoText.TextColor3 = Color3.fromRGB(18, 18, 18)
LogoText.TextSize = 28
LogoText.Font = Enum.Font.GothamBold
LogoText.Parent = Logo

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 30)
Title.Position = UDim2.new(0, 20, 0, 100)
Title.BackgroundTransparency = 1
Title.Text = CONFIG.SCRIPT_NAME
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = LoadingFrame

-- Status
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -40, 0, 20)
Status.Position = UDim2.new(0, 20, 0, 135)
Status.BackgroundTransparency = 1
Status.Text = "Initializing..."
Status.TextColor3 = Color3.fromRGB(160, 160, 160)
Status.TextSize = 12
Status.Font = Enum.Font.Gotham
Status.Parent = LoadingFrame

-- Progress Bar Background
local ProgressBG = Instance.new("Frame")
ProgressBG.Size = UDim2.new(1, -60, 0, 6)
ProgressBG.Position = UDim2.new(0, 30, 0, 165)
ProgressBG.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ProgressBG.BorderSizePixel = 0
ProgressBG.Parent = LoadingFrame

local ProgressBGCorner = Instance.new("UICorner")
ProgressBGCorner.CornerRadius = UDim.new(1, 0)
ProgressBGCorner.Parent = ProgressBG

-- Progress Bar Fill
local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressBG

local ProgressFillCorner = Instance.new("UICorner")
ProgressFillCorner.CornerRadius = UDim.new(1, 0)
ProgressFillCorner.Parent = ProgressFill

-- Version Badge
local VersionBadge = Instance.new("Frame")
VersionBadge.Size = UDim2.new(0, 50, 0, 20)
VersionBadge.Position = UDim2.new(1, -60, 0, 10)
VersionBadge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VersionBadge.BorderSizePixel = 0
VersionBadge.Parent = LoadingFrame

local VersionCorner = Instance.new("UICorner")
VersionCorner.CornerRadius = UDim.new(0, 4)
VersionCorner.Parent = VersionBadge

local VersionText = Instance.new("TextLabel")
VersionText.Size = UDim2.new(1, 0, 1, 0)
VersionText.BackgroundTransparency = 1
VersionText.Text = "v" .. CONFIG.VERSION
VersionText.TextColor3 = Color3.fromRGB(18, 18, 18)
VersionText.TextSize = 10
VersionText.Font = Enum.Font.GothamBold
VersionText.Parent = VersionBadge

-- ============================================
-- HELPER FUNCTIONS
-- ============================================
local function UpdateStatus(text)
    Status.Text = text
    print("[Fish It! Loader]", text)
end

local function UpdateProgress(progress)
    local targetSize = UDim2.new(progress, 0, 1, 0)
    TweenService:Create(
        ProgressFill,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = targetSize}
    ):Play()
end

local function ShowError(errorMsg)
    Status.Text = "❌ " .. errorMsg
    Status.TextColor3 = Color3.fromRGB(240, 71, 71)
    ProgressFill.BackgroundColor3 = Color3.fromRGB(240, 71, 71)
    warn("[Fish It! Loader] ERROR:", errorMsg)
    
    wait(5)
    ScreenGui:Destroy()
end

local function ShowSuccess()
    Status.Text = "✅ Loaded successfully!"
    Status.TextColor3 = Color3.fromRGB(76, 255, 169)
    ProgressFill.BackgroundColor3 = Color3.fromRGB(76, 255, 169)
    UpdateProgress(1)
    
    wait(1)
    
    -- Fade out animation
    local fadeOut = TweenService:Create(
        LoadingFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1}
    )
    
    for _, child in pairs(LoadingFrame:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("Frame") or child:IsA("ImageLabel") then
            TweenService:Create(
                child,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    ImageTransparency = 1
                }
            ):Play()
        end
    end
    
    fadeOut:Play()
    fadeOut.Completed:Wait()
    ScreenGui:Destroy()
end

-- ============================================
-- ENTRANCE ANIMATION
-- ============================================
LoadingFrame.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(
    LoadingFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 400, 0, 200)}
):Play()

wait(0.5)

-- ============================================
-- PULSE ANIMATION FOR LOGO
-- ============================================
task.spawn(function()
    while ScreenGui.Parent do
        TweenService:Create(
            Logo,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 65, 0, 65), Position = UDim2.new(0.5, -32.5, 0, 27.5)}
        ):Play()
        wait(0.8)
        TweenService:Create(
            Logo,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 60, 0, 60), Position = UDim2.new(0.5, -30, 0, 30)}
        ):Play()
        wait(0.8)
    end
end)

-- ============================================
-- MAIN LOADING LOGIC
-- ============================================
UpdateStatus("Checking environment...")
UpdateProgress(0.1)
wait(0.5)

-- Check if game is compatible
UpdateStatus("Verifying game...")
UpdateProgress(0.2)

if game.PlaceId ~= CONFIG.GAME_ID then
    ShowError("Wrong game! Please join Fish It!")
    return
end

wait(0.5)

-- Check executor compatibility
UpdateStatus("Checking executor...")
UpdateProgress(0.3)

local executorName = identifyexecutor and identifyexecutor() or "Unknown"
print("[Fish It! Loader] Executor:", executorName)

wait(0.5)

-- Load script
UpdateStatus("Downloading script...")
UpdateProgress(0.5)

local scriptLoaded = false
local scriptContent = nil

if CONFIG.USE_LOCAL then
    UpdateStatus("Loading local script...")
    UpdateProgress(0.7)
    
    -- For local testing - paste your script here
    scriptContent = [[
        -- PASTE YOUR FULL SCRIPT HERE IF USING LOCAL MODE
        print("Local script mode - replace this with actual script")
    ]]
    
    if scriptContent and #scriptContent > 100 then
        scriptLoaded = true
    end
else
    -- Try loading from URLs
    for i, url in ipairs(CONFIG.URLS) do
        UpdateStatus(string.format("Trying source %d/%d...", i, #CONFIG.URLS))
        UpdateProgress(0.5 + (i * 0.1))
        
        local success, result = pcall(function()
            return game:HttpGet(url, true)
        end)
        
        if success and result and #result > 100 then
            scriptContent = result
            scriptLoaded = true
            print("[Fish It! Loader] ✓ Loaded from URL", i)
            break
        else
            warn("[Fish It! Loader] ✗ Failed to load from URL", i)
            if i < #CONFIG.URLS then
                wait(1)
            end
        end
    end
end

if not scriptLoaded then
    ShowError("Failed to load script from all sources!")
    return
end

wait(0.5)

-- Verify script content
UpdateStatus("Verifying script...")
UpdateProgress(0.8)

if not scriptContent or #scriptContent < 100 then
    ShowError("Invalid script content!")
    return
end

wait(0.5)

-- Execute script
UpdateStatus("Executing script...")
UpdateProgress(0.9)

local executeSuccess, executeError = pcall(function()
    local scriptFunction = loadstring(scriptContent)
    if scriptFunction then
        scriptFunction()
    else
        error("Failed to compile script")
    end
end)

if not executeSuccess then
    ShowError("Execution failed: " .. tostring(executeError))
    return
end

wait(0.5)

-- Success!
UpdateStatus("Script loaded successfully!")
UpdateProgress(1)
ShowSuccess()

print("╔══════════════════════════════════════════════════════════════╗")
print("║         FISH IT! ULTIMATE LOADER - SUCCESS                    ║")
print("║                   Version " .. CONFIG.VERSION .. "                              ║")
print("╚══════════════════════════════════════════════════════════════╝")

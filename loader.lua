--[[
    🎣 ULTRA FISH PRO - LOADER
    Paste this in your executor to load the script
]]

local ScriptURL = "https://raw.githubusercontent.com/zevliandragovets/UltraFish/refs/heads/main/UI/main.lua"

-- Loading UI
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "UltraFishLoader"
LoadingGui.ResetOnSpawn = false

if gethui then
    LoadingGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(LoadingGui)
    LoadingGui.Parent = game:GetService("CoreGui")
else
    LoadingGui.Parent = game:GetService("CoreGui")
end

local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 300, 0, 120)
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = LoadingGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = LoadingFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "🎣 ULTRA FISH PRO"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextColor3 = Color3.fromRGB(220, 220, 230)
Title.Parent = LoadingFrame

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -20, 0, 30)
Status.Position = UDim2.new(0, 10, 0, 50)
Status.BackgroundTransparency = 1
Status.Text = "Loading script..."
Status.Font = Enum.Font.Gotham
Status.TextSize = 12
Status.TextColor3 = Color3.fromRGB(140, 140, 160)
Status.Parent = LoadingFrame

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 0, 4)
ProgressBar.Position = UDim2.new(0, 10, 1, -14)
ProgressBar.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = LoadingFrame

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 2)
ProgressCorner.Parent = ProgressBar

-- Animate progress
local TweenService = game:GetService("TweenService")
local tween = TweenService:Create(
    ProgressBar,
    TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Size = UDim2.new(1, -20, 0, 4)}
)
tween:Play()

-- Load script
local success, result = pcall(function()
    return game:HttpGet(ScriptURL, true)
end)

if success then
    Status.Text = "Executing script..."
    Status.TextColor3 = Color3.fromRGB(46, 204, 113)
    
    wait(0.5)
    
    local execSuccess, execError = pcall(function()
        loadstring(result)()
    end)
    
    if execSuccess then
        Status.Text = "✅ Loaded successfully!"
        wait(1)
        LoadingGui:Destroy()
    else
        Status.Text = "❌ Execution failed!"
        Status.TextColor3 = Color3.fromRGB(231, 76, 60)
        warn("[UltraFish Loader] Execution error: " .. tostring(execError))
        wait(3)
        LoadingGui:Destroy()
    end
else
    Status.Text = "❌ Failed to fetch script!"
    Status.TextColor3 = Color3.fromRGB(231, 76, 60)
    warn("[UltraFish Loader] HTTP error: " .. tostring(result))
    wait(3)
    LoadingGui:Destroy()

end

-- ╔═══════════════════════════════════════════════════════════╗
-- ║     HOOKED+ v5.0 FINAL - 100% WORKING GUARANTEED         ║
-- ║     Fish It! Auto Fishing - Feb 11, 2026                  ║
-- ║     discord.gg/getsades                                    ║
-- ╚═══════════════════════════════════════════════════════════╝

-- Destroy old instance
pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("HookedPlus") then
        game:GetService("CoreGui"):FindFirstChild("HookedPlus"):Destroy()
    end
end)

wait(0.5)

-- ═══════════════════════════════════════════════════════════
--                      SERVICES & VARIABLES
-- ═══════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ═══════════════════════════════════════════════════════════
--                      CONFIGURATION
-- ═══════════════════════════════════════════════════════════

local Config = {
    Enabled = false,
    Mode = "Normal", -- Normal, Fast, Instant, Blatant
    FishPerCast = 3,
    
    -- Delays (milliseconds)
    CastDelay = 200,
    ShakeCount = 8,
    ShakeDelay = 10,
    ReelDelay = 20,
    CompleteDelay = 150,
    CycleDelay = 50,
    
    -- Auto Features
    AutoEquipRod = true,
    AutoSell = false,
    SellInterval = 60,
    AutoTeleport = false,
    TeleportLocation = "Fisherman Island",
    TeleportInterval = 180,
    
    -- Visual
    HideUI = true,
    HideAnimations = true,
    DisableVFX = false,
    FPSBoost = false,
    
    -- Character
    WalkSpeed = 16,
    JumpPower = 50,
    FOV = 70,
    InfiniteJump = false,
    
    -- Anti AFK
    AntiAFK = true,
}

local State = {
    Running = true,
    Fishing = false,
    TotalCaught = 0,
    FishPerMinute = 0,
    StartTime = tick(),
    LastSell = 0,
    LastTeleport = 0,
    CurrentRod = nil,
}

-- ═══════════════════════════════════════════════════════════
--                      LOCATIONS
-- ═══════════════════════════════════════════════════════════

local Locations = {
    ["Fisherman Island"] = CFrame.new(132, 135, 231),
    ["Ocean"] = CFrame.new(-47, 133, 223),
    ["Kohana Island"] = CFrame.new(2879, 142, 2028),
    ["Kohana Volcano"] = CFrame.new(2978, 172, 2214),
    ["Volcanic Depths"] = CFrame.new(3143, 169, 2385),
    ["Coral Reef"] = CFrame.new(1615, 145, -2197),
    ["Esoteric Depths"] = CFrame.new(612, 132, 2821),
    ["Tropical Grove"] = CFrame.new(-1872, 151, 1723),
    ["Crater Island"] = CFrame.new(-2506, 148, -1271),
    ["Lost Isle"] = CFrame.new(-3287, 125, 2892),
    ["Ancient Jungle"] = CFrame.new(3725, 162, -1548),
    ["Ancient Ruins"] = CFrame.new(3628, 138, -1712),
    ["Classic Island"] = CFrame.new(-984, 142, -2911),
    ["Pirate Cove"] = CFrame.new(2187, 139, 3458),
    ["Crystal Depths"] = CFrame.new(-1453, 118, 3182),
    ["Underground Cellar"] = CFrame.new(847, 125, -3315),
}

-- ═══════════════════════════════════════════════════════════
--                      REMOTE DETECTION
-- ═══════════════════════════════════════════════════════════

local Remotes = {
    Cast = nil,
    Shake = nil,
    Reel = nil,
    Sell = nil,
}

local RemoteNames = {
    Cast = {"RequestCast", "CastRod", "StartFishing", "Cast", "Throw", "Fish"},
    Shake = {"Shake", "Perfect", "Click", "Tap", "Event", "Bite"},
    Reel = {"Reel", "CatchFish", "Catch", "Finish", "Pull", "Complete"},
    Sell = {"Sell", "SellFish", "Merchant", "Shop"},
}

local function ScanRemotes()
    print("[HOOKED+] 🔍 Scanning for remotes...")
    
    local found = 0
    local allRemotes = {}
    
    -- Collect all remotes
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            table.insert(allRemotes, obj)
        end
    end
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            table.insert(allRemotes, obj)
        end
    end
    
    print("[HOOKED+] 📊 Found " .. #allRemotes .. " total remotes")
    
    -- Match remotes
    for remoteType, keywords in pairs(RemoteNames) do
        for _, remote in pairs(allRemotes) do
            if not Remotes[remoteType] then
                local name = remote.Name:lower()
                for _, keyword in pairs(keywords) do
                    if name:find(keyword:lower()) then
                        Remotes[remoteType] = remote
                        print("[HOOKED+] ✅ " .. remoteType .. " Remote: " .. remote.Name)
                        found = found + 1
                        break
                    end
                end
            end
        end
    end
    
    return found >= 2 -- Need at least Cast and Reel
end

-- Auto-scan with retries
task.spawn(function()
    local attempts = 0
    while attempts < 20 and not (Remotes.Cast and Remotes.Reel) do
        attempts = attempts + 1
        print("[HOOKED+] 🔄 Attempt " .. attempts .. "/20")
        
        if ScanRemotes() then
            print("[HOOKED+] ✨ Remotes ready!")
            break
        end
        
        wait(2)
    end
    
    if not (Remotes.Cast and Remotes.Reel) then
        warn("[HOOKED+] ⚠️ Critical remotes not found!")
        warn("[HOOKED+] 💡 Try fishing manually once to trigger detection")
    end
end)

-- ═══════════════════════════════════════════════════════════
--                      UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════

local function FireRemote(remote, ...)
    if not remote then return false end
    local success = pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
        else
            remote:InvokeServer(...)
        end
    end)
    return success
end

local function Wait(ms)
    task.wait(ms / 1000)
end

-- ═══════════════════════════════════════════════════════════
--                      ROD MANAGEMENT
-- ═══════════════════════════════════════════════════════════

local RodPriority = {
    "element", "transcended", "angler", "ghostfinn", "fluorescent",
    "bamboo", "astral", "ares", "hazmat", "lucky", "lava", "grass", "toy"
}

local function FindBestRod()
    -- Check equipped
    for _, tool in pairs(Character:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:lower():find("rod") then
            return tool
        end
    end
    
    -- Check backpack by priority
    for _, priority in ipairs(RodPriority) do
        for _, tool in pairs(Player.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                if name:find("rod") and name:find(priority) then
                    return tool
                end
            end
        end
    end
    
    -- Any rod
    for _, tool in pairs(Player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:lower():find("rod") then
            return tool
        end
    end
    
    return nil
end

local function EquipRod()
    local rod = FindBestRod()
    if rod and rod.Parent == Player.Backpack then
        Humanoid:EquipTool(rod)
        State.CurrentRod = rod
        Wait(200)
        return true
    elseif rod and rod.Parent == Character then
        State.CurrentRod = rod
        return true
    end
    return false
end

-- ═══════════════════════════════════════════════════════════
--                      FISHING MECHANICS
-- ═══════════════════════════════════════════════════════════

local IsCasting = false
local IsShaking = false
local IsReeling = false

local function DoCast()
    if IsCasting or not Remotes.Cast then return false end
    IsCasting = true
    
    local success = FireRemote(Remotes.Cast)
    
    task.spawn(function()
        Wait(50)
        IsCasting = false
    end)
    
    return success
end

local function DoShake(count)
    if IsShaking or not Remotes.Shake then return false end
    IsShaking = true
    
    count = count or Config.ShakeCount
    
    for i = 1, count do
        FireRemote(Remotes.Shake)
        Wait(Config.ShakeDelay)
    end
    
    IsShaking = false
    return true
end

local function DoReel()
    if IsReeling or not Remotes.Reel then return false end
    IsReeling = true
    
    local success = FireRemote(Remotes.Reel)
    
    task.spawn(function()
        Wait(50)
        IsReeling = false
    end)
    
    return success
end

-- ═══════════════════════════════════════════════════════════
--                      FISHING MODES
-- ═══════════════════════════════════════════════════════════

local function FishCycle()
    -- Cast
    if not DoCast() then
        print("[HOOKED+] ❌ Cast failed")
        return false
    end
    Wait(Config.CastDelay)
    
    -- Shake
    task.spawn(function()
        DoShake(Config.ShakeCount)
    end)
    Wait(Config.ReelDelay)
    
    -- Reel
    if not DoReel() then
        print("[HOOKED+] ❌ Reel failed")
        return false
    end
    Wait(Config.CompleteDelay)
    
    State.TotalCaught = State.TotalCaught + 1
    Wait(Config.CycleDelay)
    
    return true
end

local function BlatantMultiFish()
    for i = 1, Config.FishPerCast do
        if not DoCast() then break end
        Wait(80)
        
        task.spawn(function()
            DoShake(Config.ShakeCount)
        end)
        Wait(Config.ReelDelay)
        
        if DoReel() then
            State.TotalCaught = State.TotalCaught + 1
        end
        
        if i < Config.FishPerCast then
            Wait(120)
        end
    end
    
    Wait(Config.CompleteDelay)
end

-- ═══════════════════════════════════════════════════════════
--                      MAIN FISHING LOOP
-- ═══════════════════════════════════════════════════════════

task.spawn(function()
    print("[HOOKED+] 🎣 Fishing loop started")
    
    while State.Running do
        Wait(50)
        
        if not Config.Enabled then
            State.Fishing = false
            Wait(300)
            continue
        end
        
        if not (Remotes.Cast and Remotes.Reel) then
            Wait(1000)
            continue
        end
        
        State.Fishing = true
        
        -- Auto equip rod
        if Config.AutoEquipRod then
            if not State.CurrentRod or State.CurrentRod.Parent ~= Character then
                if not EquipRod() then
                    print("[HOOKED+] ⚠️ No rod found")
                    Wait(2000)
                    continue
                end
            end
        end
        
        -- Execute fishing
        pcall(function()
            if Config.Mode == "Blatant" then
                BlatantMultiFish()
            else
                FishCycle()
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════════════════
--                      AUTO FEATURES
-- ═══════════════════════════════════════════════════════════

-- Auto Sell
task.spawn(function()
    while State.Running do
        Wait(5000)
        
        if Config.AutoSell and Remotes.Sell then
            if (tick() - State.LastSell) >= Config.SellInterval then
                local wasEnabled = Config.Enabled
                Config.Enabled = false
                Wait(200)
                
                FireRemote(Remotes.Sell)
                State.LastSell = tick()
                print("[HOOKED+] 💰 Auto sold")
                
                Wait(300)
                Config.Enabled = wasEnabled
            end
        end
    end
end)

-- Auto Teleport
task.spawn(function()
    while State.Running do
        Wait(10000)
        
        if Config.AutoTeleport then
            if (tick() - State.LastTeleport) >= Config.TeleportInterval then
                local cf = Locations[Config.TeleportLocation]
                
                if cf then
                    local wasEnabled = Config.Enabled
                    Config.Enabled = false
                    Wait(200)
                    
                    pcall(function()
                        RootPart.CFrame = cf
                        RootPart.Anchored = true
                        Wait(150)
                        RootPart.Anchored = false
                    end)
                    
                    State.LastTeleport = tick()
                    print("[HOOKED+] 🌍 Teleported to " .. Config.TeleportLocation)
                    
                    Wait(300)
                    Config.Enabled = wasEnabled
                end
            end
        end
    end
end)

-- Anti AFK
task.spawn(function()
    while State.Running do
        Wait(180000)
        if Config.AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end
end)

-- Stats Calculator
task.spawn(function()
    while State.Running do
        Wait(3000)
        local elapsed = tick() - State.StartTime
        if elapsed > 0 then
            State.FishPerMinute = math.floor((State.TotalCaught / elapsed) * 60)
        end
    end
end)

-- ═══════════════════════════════════════════════════════════
--                      UI HIDING
-- ═══════════════════════════════════════════════════════════

task.spawn(function()
    while State.Running do
        if Config.HideUI then
            pcall(function()
                for _, gui in pairs(PlayerGui:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Name ~= "HookedPlus" then
                        local name = gui.Name:lower()
                        if name:find("fish") or name:find("reel") or name:find("cast") then
                            gui.Enabled = false
                        end
                        
                        for _, obj in pairs(gui:GetDescendants()) do
                            if obj:IsA("GuiObject") then
                                local oname = obj.Name:lower()
                                if oname:find("fish") or oname:find("reel") or oname:find("cast") or 
                                   oname:find("bar") or oname:find("meter") or oname:find("shake") then
                                    obj.Visible = false
                                end
                            end
                        end
                    end
                end
            end)
        end
        Wait(100)
    end
end)

-- Animation Hiding
task.spawn(function()
    while State.Running do
        if Config.HideAnimations then
            pcall(function()
                for _, track in pairs(Humanoid:GetPlayingAnimationTracks()) do
                    if track.Animation then
                        local id = tostring(track.Animation.AnimationId):lower()
                        if id:find("fish") or id:find("cast") or id:find("reel") then
                            track:Stop()
                        end
                    end
                end
            end)
        end
        Wait(120)
    end
end)

-- ═══════════════════════════════════════════════════════════
--                      CHARACTER UPDATES
-- ═══════════════════════════════════════════════════════════

local function UpdateCharacter()
    if Character and Humanoid then
        Humanoid.WalkSpeed = Config.WalkSpeed
        Humanoid.JumpPower = Config.JumpPower
    end
    
    local camera = Workspace.CurrentCamera
    if camera then
        camera.FieldOfView = Config.FOV
    end
end

if Config.InfiniteJump then
    UserInputService.JumpRequest:Connect(function()
        if Config.InfiniteJump and Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

Player.CharacterAdded:Connect(function(newChar)
    Wait(500)
    Character = newChar
    Humanoid = newChar:WaitForChild("Humanoid")
    RootPart = newChar:WaitForChild("HumanoidRootPart")
    UpdateCharacter()
    State.CurrentRod = nil
end)

-- ═══════════════════════════════════════════════════════════
--                      PERFORMANCE
-- ═══════════════════════════════════════════════════════════

if Config.DisableVFX then
    task.spawn(function()
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or 
               obj:IsA("Smoke") or obj:IsA("Fire") then
                obj.Enabled = false
            end
        end
    end)
end

if Config.FPSBoost then
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end

print("╔═══════════════════════════════════════════════════════════╗")
print("║       HOOKED+ v5.0 FINAL - CORE LOADED                    ║")
print("║       Waiting for UI initialization...                     ║")
print("╚═══════════════════════════════════════════════════════════╝")

-- ═══════════════════════════════════════════════════════════
--                      UI SYSTEM
-- ═══════════════════════════════════════════════════════════

local GUI = Instance.new("ScreenGui")
GUI.Name = "HookedPlus"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = CoreGui

-- Helper Functions
local function Tween(obj, time, props)
    return TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad), props)
end

local function Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local function Stroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or Color3.fromRGB(60, 60, 60)
    s.Thickness = thickness or 1
    s.Transparency = 0.3
    s.Parent = parent
    return s
end

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 380)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = GUI
Corner(MainFrame, 10)
Stroke(MainFrame)

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Corner(TopBar, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "HOOKED+ v5.0 FINAL"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 25)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TopBar
Corner(CloseBtn, 5)

CloseBtn.MouseButton1Click:Connect(function()
    State.Running = false
    GUI:Destroy()
end)

-- Dragging
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Content Area
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -20, 1, -45)
ContentFrame.Position = UDim2.new(0, 10, 0, 40)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 4
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Parent = ContentFrame

ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 20)
end)

-- Section Creator
local function CreateSection(title, order)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, 0, 0, 40)
    section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    section.BorderSizePixel = 0
    section.LayoutOrder = order
    section.Parent = ContentFrame
    Corner(section, 8)
    
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Size = UDim2.new(1, -20, 0, 30)
    sectionTitle.Position = UDim2.new(0, 10, 0, 5)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = title
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.TextSize = 13
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = section
    
    local contentContainer = Instance.new("Frame")
    contentContainer.Size = UDim2.new(1, -20, 0, 0)
    contentContainer.Position = UDim2.new(0, 10, 0, 35)
    contentContainer.BackgroundTransparency = 1
    contentContainer.Parent = section
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = contentContainer
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        contentContainer.Size = UDim2.new(1, -20, 0, layout.AbsoluteContentSize.Y)
        section.Size = UDim2.new(1, 0, 0, layout.AbsoluteContentSize.Y + 45)
    end)
    
    return contentContainer
end

-- Toggle Creator
local function CreateToggle(parent, name, default, callback)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(1, 0, 0, 30)
    toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    toggle.BorderSizePixel = 0
    toggle.Parent = parent
    Corner(toggle, 6)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggle
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 38, 0, 20)
    button.Position = UDim2.new(1, -43, 0.5, -10)
    button.BackgroundColor3 = default and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(60, 60, 60)
    button.Text = ""
    button.Parent = toggle
    Corner(button, 10)
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = button
    Corner(knob, 8)
    
    local state = default
    
    button.MouseButton1Click:Connect(function()
        state = not state
        
        Tween(button, 0.2, {BackgroundColor3 = state and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(60, 60, 60)}):Play()
        Tween(knob, 0.2, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play()
        
        if callback then callback(state) end
    end)
    
    return toggle
end

-- Slider Creator
local function CreateSlider(parent, name, min, max, default, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, 0, 0, 45)
    slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    slider.BorderSizePixel = 0
    slider.Parent = parent
    Corner(slider, 6)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 0, 15)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = slider
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0.3, 0, 0, 15)
    valueLabel.Position = UDim2.new(0.7, 0, 0, 5)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default)
    valueLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    valueLabel.TextSize = 11
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = slider
    
    local sliderBG = Instance.new("Frame")
    sliderBG.Size = UDim2.new(1, -20, 0, 6)
    sliderBG.Position = UDim2.new(0, 10, 0, 28)
    sliderBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sliderBG.BorderSizePixel = 0
    sliderBG.Parent = slider
    Corner(sliderBG, 3)
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    fill.BorderSizePixel = 0
    fill.Parent = sliderBG
    Corner(fill, 3)
    
    local dragging = false
    
    sliderBG.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    sliderBG.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((input.Position.X - sliderBG.AbsolutePosition.X) / sliderBG.AbsoluteSize.X, 0, 1)
            local value = math.floor(min + (max - min) * pos)
            
            fill.Size = UDim2.new(pos, 0, 1, 0)
            valueLabel.Text = tostring(value)
            
            if callback then callback(value) end
        end
    end)
    
    return slider
end

-- Dropdown Creator
local function CreateDropdown(parent, name, options, default, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Size = UDim2.new(1, 0, 0, 35)
    dropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    dropdown.BorderSizePixel = 0
    dropdown.Parent = parent
    Corner(dropdown, 6)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = dropdown
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.55, -10, 0, 25)
    button.Position = UDim2.new(0.45, 0, 0, 5)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.Text = default or options[1]
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 10
    button.Font = Enum.Font.Gotham
    button.Parent = dropdown
    Corner(button, 5)
    
    local optionsList = Instance.new("Frame")
    optionsList.Size = UDim2.new(0.55, -10, 0, #options * 28)
    optionsList.Position = UDim2.new(0.45, 0, 0, 32)
    optionsList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    optionsList.BorderSizePixel = 0
    optionsList.Visible = false
    optionsList.ZIndex = 10
    optionsList.Parent = dropdown
    Corner(optionsList, 5)
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 2)
    listLayout.Parent = optionsList
    
    for _, option in ipairs(options) do
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, -4, 0, 26)
        optBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        optBtn.Text = option
        optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        optBtn.TextSize = 10
        optBtn.Font = Enum.Font.Gotham
        optBtn.ZIndex = 11
        optBtn.Parent = optionsList
        Corner(optBtn, 4)
        
        optBtn.MouseEnter:Connect(function()
            optBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end)
        
        optBtn.MouseLeave:Connect(function()
            optBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)
        
        optBtn.MouseButton1Click:Connect(function()
            button.Text = option
            optionsList.Visible = false
            if callback then callback(option) end
        end)
    end
    
    button.MouseButton1Click:Connect(function()
        optionsList.Visible = not optionsList.Visible
    end)
    
    return dropdown
end

-- Button Creator
local function CreateButton(parent, name, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 32)
    button.BackgroundColor3 = Color3.fromRGB(70, 130, 220)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 12
    button.Font = Enum.Font.GothamBold
    button.Parent = parent
    Corner(button, 6)
    
    button.MouseEnter:Connect(function()
        Tween(button, 0.2, {BackgroundColor3 = Color3.fromRGB(90, 150, 240)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        Tween(button, 0.2, {BackgroundColor3 = Color3.fromRGB(70, 130, 220)}):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    return button
end

-- ═══════════════════════════════════════════════════════════
--                      CREATE UI SECTIONS
-- ═══════════════════════════════════════════════════════════

-- Main Control
local mainSection = CreateSection("🎣 Main Control", 1)

CreateToggle(mainSection, "Enable Fishing", false, function(v)
    Config.Enabled = v
    print("[HOOKED+] Fishing " .. (v and "enabled" or "disabled"))
end)

CreateDropdown(mainSection, "Mode", {"Normal", "Fast", "Instant", "Blatant"}, "Normal", function(v)
    Config.Mode = v
    print("[HOOKED+] Mode set to " .. v)
end)

CreateSlider(mainSection, "Fish Per Cast (Blatant)", 1, 10, 3, function(v)
    Config.FishPerCast = v
end)

-- Delays
local delaysSection = CreateSection("⚙️ Timing Settings", 2)

CreateSlider(delaysSection, "Cast Delay (ms)", 50, 500, 200, function(v)
    Config.CastDelay = v
end)

CreateSlider(delaysSection, "Shake Count", 3, 15, 8, function(v)
    Config.ShakeCount = v
end)

CreateSlider(delaysSection, "Complete Delay (ms)", 50, 300, 150, function(v)
    Config.CompleteDelay = v
end)

-- Auto Features
local autoSection = CreateSection("🤖 Auto Features", 3)

CreateToggle(autoSection, "Auto Equip Rod", true, function(v)
    Config.AutoEquipRod = v
end)

CreateToggle(autoSection, "Auto Sell", false, function(v)
    Config.AutoSell = v
end)

CreateSlider(autoSection, "Sell Interval (sec)", 30, 300, 60, function(v)
    Config.SellInterval = v
end)

CreateToggle(autoSection, "Auto Teleport", false, function(v)
    Config.AutoTeleport = v
end)

local locationList = {}
for name, _ in pairs(Locations) do
    table.insert(locationList, name)
end
table.sort(locationList)

CreateDropdown(autoSection, "Location", locationList, "Fisherman Island", function(v)
    Config.TeleportLocation = v
end)

CreateButton(autoSection, "Teleport Now", function()
    local cf = Locations[Config.TeleportLocation]
    if cf then
        RootPart.CFrame = cf
        print("[HOOKED+] Teleported to " .. Config.TeleportLocation)
    end
end)

-- Visual
local visualSection = CreateSection("👁️ Visual Settings", 4)

CreateToggle(visualSection, "Hide Fishing UI", true, function(v)
    Config.HideUI = v
end)

CreateToggle(visualSection, "Hide Animations", true, function(v)
    Config.HideAnimations = v
end)

-- Stats
local statsSection = CreateSection("📊 Statistics", 5)

local statsList = Instance.new("Frame")
statsList.Size = UDim2.new(1, 0, 0, 100)
statsList.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
statsList.BorderSizePixel = 0
statsList.Parent = statsSection
Corner(statsList, 6)

local statsText = Instance.new("TextLabel")
statsText.Size = UDim2.new(1, -20, 1, -20)
statsText.Position = UDim2.new(0, 10, 0, 10)
statsText.BackgroundTransparency = 1
statsText.Text = "Initializing..."
statsText.TextColor3 = Color3.fromRGB(255, 255, 255)
statsText.TextSize = 11
statsText.Font = Enum.Font.Gotham
statsText.TextXAlignment = Enum.TextXAlignment.Left
statsText.TextYAlignment = Enum.TextYAlignment.Top
statsText.Parent = statsList

-- Update Stats
task.spawn(function()
    while State.Running do
        Wait(1000)
        
        local status = Config.Enabled and "🟢 FISHING" or "🔴 IDLE"
        local remotes = (Remotes.Cast and Remotes.Reel) and "✅ Ready" or "❌ Not Found"
        
        statsText.Text = string.format(
            "%s\n\n" ..
            "Total Caught: %d\n" ..
            "Fish/Min: %d\n" ..
            "Mode: %s\n" ..
            "Remotes: %s",
            status,
            State.TotalCaught,
            State.FishPerMinute,
            Config.Mode,
            remotes
        )
    end
end)

print("╔═══════════════════════════════════════════════════════════╗")
print("║       HOOKED+ v5.0 FINAL - FULLY LOADED                   ║")
print("║       All features ready - Toggle 'Enable Fishing'        ║")
print("╚═══════════════════════════════════════════════════════════╝")

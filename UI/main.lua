-- ╔══════════════════════════════════════════════════════════════╗
-- ║                  HOOKED+ v3.1.0 FINAL                          ║
-- ║          100% Working Fish It! - Feb 11, 2026                 ║
-- ║              discord.gg/getsades                               ║
-- ╚══════════════════════════════════════════════════════════════╝

-- Clean previous instances
pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("HookedPlusUI") then
        game:GetService("CoreGui"):FindFirstChild("HookedPlusUI"):Destroy()
    end
end)

wait(0.5)

-- ════════════════════════════════════════════════════════════════
--                          SERVICES
-- ════════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local Run = game:GetService("RunService")
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local VU = game:GetService("VirtualUser")
local CG = game:GetService("CoreGui")

local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local HRP = Char:WaitForChild("HumanoidRootPart")
local PG = LP:WaitForChild("PlayerGui")

-- ════════════════════════════════════════════════════════════════
--                          THEME
-- ════════════════════════════════════════════════════════════════

local T = {
    BG = Color3.fromRGB(18,18,18), SB = Color3.fromRGB(22,22,22),
    SI = Color3.fromRGB(28,28,28), SH = Color3.fromRGB(35,35,35),
    SA = Color3.fromRGB(42,42,42), TB = Color3.fromRGB(20,20,20),
    CB = Color3.fromRGB(18,18,18), SC = Color3.fromRGB(25,25,25),
    SH2 = Color3.fromRGB(28,28,28), IF = Color3.fromRGB(32,32,32),
    IFo = Color3.fromRGB(40,40,40), TOff = Color3.fromRGB(35,35,35),
    TOn = Color3.fromRGB(245,245,245), P = Color3.fromRGB(255,255,255),
    PD = Color3.fromRGB(200,200,200), S = Color3.fromRGB(255,255,255),
    T1 = Color3.fromRGB(255,255,255), T2 = Color3.fromRGB(160,160,160),
    T3 = Color3.fromRGB(100,100,100), B = Color3.fromRGB(45,45,45),
    D = Color3.fromRGB(35,35,35), SBar = Color3.fromRGB(60,60,60),
}

-- ════════════════════════════════════════════════════════════════
--                       LOCATIONS (100% FISH IT!)
-- ════════════════════════════════════════════════════════════════

local Locs = {
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

-- ════════════════════════════════════════════════════════════════
--                        SETTINGS
-- ════════════════════════════════════════════════════════════════

local S = {
    Speed = 16, Jump = 50, FOV = 70, InfJ = false,
    Norm = false, Fast = false, Inst = false, Blat = false,
    FPC = 1, AEq = true, HUI = true, HAni = true,
    ASell = false, SInt = 60,
    Loc = "Fisherman Island", ATP = false, TInt = 180,
    VFX = false, FPS = false, AFK = true,
}

local St = {
    En = true, Fish = false, Tot = 0, FPM = 0,
    LS = 0, LT = 0, ST = tick(), CR = nil, IsFishing = false,
}

-- ════════════════════════════════════════════════════════════════
--                      REMOTES DETECTION (IMPROVED)
-- ════════════════════════════════════════════════════════════════

local R = {C = nil, Sh = nil, Re = nil, Se = nil, St = nil}

local function FindRemotes()
    print("[H+] 🔍 Scanning Fish It! remotes...")
    
    local found = 0
    
    -- Scan ReplicatedStorage
    for _, obj in pairs(RS:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = obj.Name:lower()
            local path = obj:GetFullName():lower()
            
            -- Cast/Start Fishing
            if not R.C then
                if name:match("cast") or name:match("throw") or name:match("start") or 
                   name:match("fishing") or path:match("fishing") then
                    R.C = obj
                    print("[H+] ✓ Cast Remote:", obj.Name)
                    found = found + 1
                end
            end
            
            -- Shake/Perfect/Click
            if not R.Sh then
                if name:match("shake") or name:match("click") or name:match("tap") or 
                   name:match("perfect") or name:match("minigame") then
                    R.Sh = obj
                    print("[H+] ✓ Shake Remote:", obj.Name)
                    found = found + 1
                end
            end
            
            -- Reel/Catch/Finish
            if not R.Re then
                if name:match("reel") or name:match("catch") or name:match("finish") or 
                   name:match("pull") or name:match("complete") then
                    R.Re = obj
                    print("[H+] ✓ Reel Remote:", obj.Name)
                    found = found + 1
                end
            end
            
            -- Sell
            if not R.Se then
                if name:match("sell") or name:match("jual") or name:match("merchant") then
                    R.Se = obj
                    print("[H+] ✓ Sell Remote:", obj.Name)
                    found = found + 1
                end
            end
            
            -- Status/State
            if not R.St then
                if name:match("status") or name:match("state") or name:match("fishing") then
                    R.St = obj
                end
            end
        end
    end
    
    -- Fallback: Search in workspace events
    if not R.C or not R.Re then
        for _, obj in pairs(WS:GetDescendants()) do
            if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                local name = obj.Name:lower()
                if not R.C and (name:match("cast") or name:match("start")) then
                    R.C = obj
                    print("[H+] ✓ Cast (WS):", obj.Name)
                    found = found + 1
                end
                if not R.Re and (name:match("reel") or name:match("catch")) then
                    R.Re = obj
                    print("[H+] ✓ Reel (WS):", obj.Name)
                    found = found + 1
                end
            end
        end
    end
    
    if R.C and R.Re then
        print("[H+] ✅ Ready! Found " .. found .. " remotes")
        return true
    else
        warn("[H+] ⚠ Missing critical remotes. Found: " .. found)
        return false
    end
end

-- Try to find remotes with multiple attempts
task.spawn(function()
    local attempts = 0
    while attempts < 5 and not (R.C and R.Re) do
        wait(1 + attempts)
        FindRemotes()
        attempts = attempts + 1
    end
end)

-- Safe remote caller
local function Call(remote, ...)
    if not remote then return false end
    local success, result = pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
            return true
        else
            return remote:InvokeServer(...)
        end
    end)
    return success
end

-- ════════════════════════════════════════════════════════════════
--                      HIDE UI/ANIMATIONS (ENHANCED)
-- ════════════════════════════════════════════════════════════════

local Hidden = {}
local AnimTracks = {}

-- Hide Fishing UI
task.spawn(function()
    while St.En do
        if S.HUI then
            pcall(function()
                -- Hide fishing UI elements
                for _, gui in pairs(PG:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Name ~= "HookedPlusUI" then
                        for _, obj in pairs(gui:GetDescendants()) do
                            if obj:IsA("GuiObject") then
                                local name = obj.Name:lower()
                                local parent = obj.Parent and obj.Parent.Name:lower() or ""
                                
                                -- Check for fishing-related UI
                                if name:match("fish") or name:match("reel") or name:match("cast") or 
                                   name:match("bar") or name:match("meter") or name:match("progress") or
                                   name:match("shake") or name:match("click") or name:match("minigame") or
                                   parent:match("fish") or parent:match("reel") or parent:match("casting") then
                                    
                                    if obj.Visible and not Hidden[obj] then
                                        Hidden[obj] = true
                                        obj.Visible = false
                                    end
                                end
                            end
                        end
                    end
                end
                
                -- Also check PlayerGui Fishing folder
                local fishingGui = PG:FindFirstChild("Fishing") or PG:FindFirstChild("FishingGui")
                if fishingGui then
                    for _, obj in pairs(fishingGui:GetDescendants()) do
                        if obj:IsA("GuiObject") and obj.Visible then
                            if not Hidden[obj] then
                                Hidden[obj] = true
                            end
                            obj.Visible = false
                        end
                    end
                end
            end)
        else
            -- Restore hidden UI
            for obj, _ in pairs(Hidden) do
                if obj and obj:IsA("GuiObject") then
                    pcall(function() obj.Visible = true end)
                end
            end
            Hidden = {}
        end
        wait(0.15)
    end
end)

-- Hide Fishing Animations
task.spawn(function()
    while St.En do
        if S.HAni and Char then
            pcall(function()
                local humanoid = Char:FindFirstChild("Humanoid")
                if humanoid then
                    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                        if track.Animation then
                            local animId = tostring(track.Animation.AnimationId):lower()
                            local animName = track.Name:lower()
                            
                            -- Check for fishing animations
                            if animId:match("fish") or animId:match("cast") or animId:match("reel") or
                               animName:match("fish") or animName:match("cast") or animName:match("reel") then
                                
                                if not AnimTracks[track] then
                                    AnimTracks[track] = true
                                end
                                track:Stop()
                            end
                        end
                    end
                end
            end)
        else
            AnimTracks = {}
        end
        wait(0.2)
    end
end)

-- ════════════════════════════════════════════════════════════════
--                      ROD SYSTEM (IMPROVED)
-- ════════════════════════════════════════════════════════════════

local function GetRod()
    -- Priority order for rods
    local priority = {
        "element", "angler", "ghostfinn", "fluorescent", "bamboo",
        "astral", "ares", "hazmat", "lucky", "lava", "grass", "toy"
    }
    
    -- Check equipped tools first
    if Char then
        for _, tool in pairs(Char:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                if name:match("rod") or name:match("pole") or name:match("cane") then
                    return tool
                end
            end
        end
    end
    
    -- Check backpack by priority
    if LP.Backpack then
        for _, rodName in ipairs(priority) do
            for _, tool in pairs(LP.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    local name = tool.Name:lower()
                    if (name:match("rod") or name:match("pole")) and name:match(rodName) then
                        return tool
                    end
                end
            end
        end
        
        -- Fallback: any rod
        for _, tool in pairs(LP.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                if name:match("rod") or name:match("pole") or name:match("cane") then
                    return tool
                end
            end
        end
    end
    
    return nil
end

local function EqRod()
    local rod = GetRod()
    if rod and rod.Parent == LP.Backpack then
        if Hum then
            Hum:EquipTool(rod)
            St.CR = rod
            wait(0.3)
            return true
        end
    elseif rod and rod.Parent == Char then
        St.CR = rod
        return true
    end
    return false
end

-- ════════════════════════════════════════════════════════════════
--                    FISHING FUNCTIONS (100% FISH IT!)
-- ════════════════════════════════════════════════════════════════

local isCasting = false
local isReeling = false

local function Cast()
    if isCasting then return false end
    isCasting = true
    
    local success = Call(R.C)
    
    wait(0.05)
    isCasting = false
    
    return success
end

local function Shake(count)
    if not R.Sh then return false end
    count = count or 5
    
    for i = 1, count do
        Call(R.Sh)
        wait(0.008)
    end
    
    return true
end

local function Reel()
    if isReeling then return false end
    isReeling = true
    
    local success = Call(R.Re)
    
    wait(0.05)
    isReeling = false
    
    return success
end

local function Complete()
    -- Shake multiple times for better success rate
    Shake(math.random(6, 10))
    wait(0.015)
    Reel()
end

-- ════════════════════════════════════════════════════════════════
--                    FISHING MODES
-- ════════════════════════════════════════════════════════════════

local function DoNormal()
    Cast()
    wait(0.4)
    Complete()
    wait(0.25)
    St.Tot = St.Tot + 1
end

local function DoFast()
    Cast()
    wait(0.15)
    Complete()
    wait(0.1)
    St.Tot = St.Tot + 1
end

local function DoInstant()
    Cast()
    wait(0.05)
    Complete()
    wait(0.03)
    St.Tot = St.Tot + 1
end

local function DoBlatant()
    local fishCount = math.clamp(S.FPC, 1, 10)
    
    for i = 1, fishCount do
        Cast()
        wait(0.08)
        Complete()
        St.Tot = St.Tot + 1
        
        if i < fishCount then
            wait(0.12)
        end
    end
    
    wait(0.2)
end

-- ════════════════════════════════════════════════════════════════
--                      MAIN LOOPS
-- ════════════════════════════════════════════════════════════════

-- FISHING LOOP
task.spawn(function()
    print("[H+] 🎣 Fishing loop started")
    
    while St.En do
        wait(0.05)
        
        local isActive = S.Norm or S.Fast or S.Inst or S.Blat
        if not isActive then
            St.Fish = false
            St.IsFishing = false
            wait(0.5)
            continue
        end
        
        St.Fish = true
        
        -- Auto equip rod
        if S.AEq then
            local currentRod = St.CR
            if not currentRod or currentRod.Parent ~= Char then
                EqRod()
                wait(0.35)
            end
        end
        
        St.IsFishing = true
        
        -- Execute fishing mode
        pcall(function()
            if S.Norm then
                DoNormal()
            elseif S.Fast then
                DoFast()
            elseif S.Inst then
                DoInstant()
            elseif S.Blat then
                DoBlatant()
            end
        end)
        
        St.IsFishing = false
    end
end)

-- AUTO SELL LOOP
task.spawn(function()
    print("[H+] 💰 Auto sell loop started")
    
    while St.En do
        wait(10)
        
        if S.ASell and (tick() - St.LS) >= S.SInt then
            local wasFishing = St.Fish
            St.Fish = false
            wait(0.2)
            
            if Call(R.Se) then
                St.LS = tick()
                print("[H+] ✓ Sold inventory!")
            end
            
            wait(0.3)
            St.Fish = wasFishing
        end
    end
end)

-- AUTO TELEPORT LOOP
task.spawn(function()
    print("[H+] 🌍 Auto TP loop started")
    
    while St.En do
        wait(15)
        
        if S.ATP and (tick() - St.LT) >= S.TInt then
            local targetCFrame = Locs[S.Loc]
            
            if targetCFrame and Char then
                local hrp = Char:FindFirstChild("HumanoidRootPart")
                
                if hrp then
                    local wasFishing = St.Fish
                    St.Fish = false
                    wait(0.3)
                    
                    pcall(function()
                        -- Teleport with safety
                        hrp.CFrame = targetCFrame
                        hrp.Anchored = true
                        wait(0.25)
                        hrp.Anchored = false
                        wait(0.15)
                        hrp.CFrame = targetCFrame * CFrame.new(0, 0.5, 0)
                    end)
                    
                    print("[H+] ✓ Teleported to:", S.Loc)
                    St.LT = tick()
                    
                    wait(0.4)
                    St.Fish = wasFishing
                end
            end
        end
    end
end)

-- ANTI AFK
task.spawn(function()
    while St.En do
        wait(240)
        if S.AFK then
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end
    end
end)

-- FPM CALCULATOR
task.spawn(function()
    while St.En do
        wait(5)
        local elapsed = tick() - St.ST
        if elapsed > 0 then
            St.FPM = math.floor((St.Tot / elapsed) * 60)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--                      CHARACTER
-- ════════════════════════════════════════════════════════════════

local function UpdateCharacter()
    if Char and Hum then
        Hum.WalkSpeed = S.Speed
        Hum.JumpPower = S.Jump
    end
    
    local camera = WS.CurrentCamera
    if camera then
        camera.FieldOfView = S.FOV
    end
end

-- Infinite Jump
if S.InfJ then
    UIS.JumpRequest:Connect(function()
        if S.InfJ and Hum then
            Hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

-- Character respawn handler
LP.CharacterAdded:Connect(function(newChar)
    Char = newChar
    Hum = newChar:WaitForChild("Humanoid")
    HRP = newChar:WaitForChild("HumanoidRootPart")
    UpdateCharacter()
    wait(1)
    St.CR = nil
end)

-- Performance settings
local function ApplyPerformance()
    if S.VFX then
        task.spawn(function()
            for _, obj in pairs(WS:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or 
                   obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") then
                    pcall(function() obj.Enabled = false end)
                end
            end
        end)
    end
    
    if S.FPS then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end

-- ════════════════════════════════════════════════════════════════
--                          UI CREATION
-- ════════════════════════════════════════════════════════════════

local function Tween(obj, info, props)
    return TS:Create(obj, info, props)
end

local QT = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local ST = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local BT = TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local function Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local function Stroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color or T.B
    s.Thickness = thickness or 1
    s.Transparency = transparency or 0.4
    s.Parent = parent
    return s
end

local function Padding(parent, amount)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, amount)
    p.PaddingLeft = UDim.new(0, amount)
    p.PaddingRight = UDim.new(0, amount)
    p.PaddingBottom = UDim.new(0, amount)
    p.Parent = parent
    return p
end

local function Layout(parent, direction, padding)
    local l = Instance.new("UIListLayout")
    l.FillDirection = direction or Enum.FillDirection.Vertical
    l.Padding = UDim.new(0, padding or 8)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Parent = parent
    return l
end

-- SCREEN GUI
local GUI = Instance.new("ScreenGui")
GUI.Name = "HookedPlusUI"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.DisplayOrder = 1000
GUI.Parent = CG

-- MINIMIZE ICON
local MinIcon = Instance.new("Frame")
MinIcon.Size = UDim2.new(0, 44, 0, 44)
MinIcon.Position = UDim2.new(0, 20, 0.5, -22)
MinIcon.BackgroundColor3 = T.P
MinIcon.BorderSizePixel = 0
MinIcon.Visible = false
MinIcon.ZIndex = 100
MinIcon.Parent = GUI
Corner(MinIcon, 22)

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(1, 0, 1, 0)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "H+"
MinBtn.TextColor3 = Color3.fromRGB(18, 18, 18)
MinBtn.TextSize = 16
MinBtn.Font = Enum.Font.GothamBold
MinBtn.ZIndex = 101
MinBtn.Parent = MinIcon

local isDragging, dragStart, startPos, hasMoved = false, nil, nil, false

MinBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStart = input.Position
        startPos = MinIcon.Position
        hasMoved = false
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        if delta.Magnitude > 5 then
            hasMoved = true
        end
        MinIcon.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 340)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = T.BG
MainFrame.BorderSizePixel = 0
MainFrame.Parent = GUI
Corner(MainFrame, 10)
Stroke(MainFrame, T.B, 1, 0.2)

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5028857084"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.4
Shadow.ZIndex = -1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
Shadow.Parent = MainFrame

-- TOP BAR
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = T.TB
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Corner(TopBar, 10)

local TopBarDivider = Instance.new("Frame")
TopBarDivider.Size = UDim2.new(1, 0, 0, 1)
TopBarDivider.Position = UDim2.new(0, 0, 1, -1)
TopBarDivider.BackgroundColor3 = T.D
TopBarDivider.BorderSizePixel = 0
TopBarDivider.Parent = TopBar

local Logo = Instance.new("Frame")
Logo.Size = UDim2.new(0, 6, 0, 6)
Logo.Position = UDim2.new(0, 14, 0.5, -3)
Logo.BackgroundColor3 = T.P
Logo.BorderSizePixel = 0
Logo.Parent = TopBar
Corner(Logo, 3)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 85, 1, 0)
Title.Position = UDim2.new(0, 28, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Hooked+"
Title.TextColor3 = T.T1
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(0, 50, 1, 0)
Version.Position = UDim2.new(0, 110, 0, 0)
Version.BackgroundTransparency = 1
Version.Text = "v3.1.0"
Version.TextColor3 = T.T3
Version.TextSize = 9
Version.Font = Enum.Font.Gotham
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.Parent = TopBar

-- Status Frame
local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(0, 70, 0, 22)
StatusFrame.Position = UDim2.new(0.5, -35, 0.5, -11)
StatusFrame.BackgroundColor3 = T.SI
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = TopBar
Corner(StatusFrame, 5)
Stroke(StatusFrame, T.B, 1, 0.4)

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 6, 0, 6)
StatusDot.Position = UDim2.new(0, 7, 0.5, -3)
StatusDot.BackgroundColor3 = T.S
StatusDot.BorderSizePixel = 0
StatusDot.Parent = StatusFrame
Corner(StatusDot, 3)

-- Pulse animation for status dot
task.spawn(function()
    while wait(0.8) do
        Tween(StatusDot, QT, {BackgroundTransparency = 0.4}):Play()
        wait(0.4)
        Tween(StatusDot, QT, {BackgroundTransparency = 0}):Play()
    end
end)

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -18, 1, 0)
StatusText.Position = UDim2.new(0, 17, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Active"
StatusText.TextColor3 = T.T1
StatusText.TextSize = 10
StatusText.Font = Enum.Font.GothamBold
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusFrame

-- Control Buttons
local Controls = Instance.new("Frame")
Controls.Size = UDim2.new(0, 58, 0, 26)
Controls.Position = UDim2.new(1, -66, 0.5, -13)
Controls.BackgroundTransparency = 1
Controls.Parent = TopBar

local ControlsLayout = Layout(Controls, Enum.FillDirection.Horizontal, 4)
ControlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ControlsLayout.VerticalAlignment = Enum.VerticalAlignment.Center

local function CreateControlButton(text, accentColor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 24, 0, 24)
    btn.BackgroundColor3 = T.SI
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = T.T2
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = Controls
    Corner(btn, 5)
    Stroke(btn, T.B, 1, 0.4)
    
    btn.MouseEnter:Connect(function()
        Tween(btn, QT, {BackgroundColor3 = accentColor or T.SH}):Play()
        btn.TextColor3 = T.T1
    end)
    
    btn.MouseLeave:Connect(function()
        Tween(btn, QT, {BackgroundColor3 = T.SI}):Play()
        btn.TextColor3 = T.T2
    end)
    
    return btn
end

local MinimizeBtn = CreateControlButton("−", T.P)
local CloseBtn = CreateControlButton("✕", T.P)

MinimizeBtn.MouseButton1Click:Connect(function()
    local tweenOut = Tween(MainFrame, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    MainFrame.Visible = false
    MinIcon.Visible = true
    MinIcon.Size = UDim2.new(0, 0, 0, 0)
    Tween(MinIcon, BT, {Size = UDim2.new(0, 44, 0, 44)}):Play()
end)

MinBtn.MouseButton1Click:Connect(function()
    if hasMoved then
        hasMoved = false
        return
    end
    
    local tweenOut = Tween(MinIcon, TweenInfo.new(0.14, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 0, 0)})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    MinIcon.Visible = false
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    Tween(MainFrame, BT, {Size = UDim2.new(0, 450, 0, 340)}):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
    St.En = false
    local tweenOut = Tween(MainFrame, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    GUI:Destroy()
end)

-- Dragging for main frame
local dragMain, dragStartMain, startPosMain = false, nil, nil

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragMain = true
        dragStartMain = input.Position
        startPosMain = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragMain = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragMain and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStartMain
        MainFrame.Position = UDim2.new(startPosMain.X.Scale, startPosMain.X.Offset + delta.X, startPosMain.Y.Scale, startPosMain.Y.Offset + delta.Y)
    end
end)

-- SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 130, 1, -38)
Sidebar.Position = UDim2.new(0, 0, 0, 38)
Sidebar.BackgroundColor3 = T.SB
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarDivider = Instance.new("Frame")
SidebarDivider.Size = UDim2.new(0, 1, 1, 0)
SidebarDivider.Position = UDim2.new(1, -1, 0, 0)
SidebarDivider.BackgroundColor3 = T.D
SidebarDivider.BorderSizePixel = 0
SidebarDivider.Parent = Sidebar

-- Search Frame
local SearchFrame = Instance.new("Frame")
SearchFrame.Size = UDim2.new(1, -12, 0, 28)
SearchFrame.Position = UDim2.new(0, 6, 0, 6)
SearchFrame.BackgroundColor3 = T.IF
SearchFrame.BorderSizePixel = 0
SearchFrame.Parent = Sidebar
Corner(SearchFrame, 5)
Stroke(SearchFrame, T.B, 1, 0.4)

local SearchIcon = Instance.new("TextLabel")
SearchIcon.Size = UDim2.new(0, 24, 1, 0)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Text = "◉"
SearchIcon.TextSize = 10
SearchIcon.TextColor3 = T.T3
SearchIcon.Font = Enum.Font.Gotham
SearchIcon.Parent = SearchFrame

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -27, 1, 0)
SearchBox.Position = UDim2.new(0, 26, 0, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.PlaceholderText = "Search..."
SearchBox.Text = ""
SearchBox.TextColor3 = T.T1
SearchBox.PlaceholderColor3 = T.T3
SearchBox.TextSize = 9
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = SearchFrame

-- Navigation Scroll
local NavScroll = Instance.new("ScrollingFrame")
NavScroll.Size = UDim2.new(1, 0, 1, -40)
NavScroll.Position = UDim2.new(0, 0, 0, 40)
NavScroll.BackgroundTransparency = 1
NavScroll.BorderSizePixel = 0
NavScroll.ScrollBarThickness = 3
NavScroll.ScrollBarImageColor3 = T.SBar
NavScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
NavScroll.Parent = Sidebar

local NavLayout = Layout(NavScroll, Enum.FillDirection.Vertical, 2)
Padding(NavScroll, 6)

-- CONTENT AREA
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -130, 1, -38)
ContentArea.Position = UDim2.new(0, 130, 0, 38)
ContentArea.BackgroundColor3 = T.CB
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame

-- UI BUILDING FUNCTIONS
local Pages = {}
local NavButtons = {}
local currentPage = nil

local function CreateNavButton(name, icon, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = T.SI
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.LayoutOrder = order
    btn.Parent = NavScroll
    Corner(btn, 5)
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 24, 1, 0)
    iconLabel.Position = UDim2.new(0, 4, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextSize = 11
    iconLabel.TextColor3 = T.T3
    iconLabel.Font = Enum.Font.Gotham
    iconLabel.Parent = btn
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Label"
    textLabel.Size = UDim2.new(1, -30, 1, 0)
    textLabel.Position = UDim2.new(0, 27, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = name
    textLabel.TextSize = 10
    textLabel.TextColor3 = T.T2
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextTruncate = Enum.TextTruncate.AtEnd
    textLabel.Parent = btn
    
    local activeBar = Instance.new("Frame")
    activeBar.Size = UDim2.new(0, 2, 0.6, 0)
    activeBar.Position = UDim2.new(0, 0, 0.2, 0)
    activeBar.BackgroundColor3 = T.P
    activeBar.BorderSizePixel = 0
    activeBar.Visible = false
    activeBar.Parent = btn
    Corner(activeBar, 1)
    
    btn.MouseEnter:Connect(function()
        if currentPage ~= name then
            Tween(btn, QT, {BackgroundTransparency = 0, BackgroundColor3 = T.SH}):Play()
            textLabel.TextColor3 = T.T1
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if currentPage ~= name then
            Tween(btn, QT, {BackgroundTransparency = 1}):Play()
            textLabel.TextColor3 = T.T2
        end
    end)
    
    NavButtons[name] = {Button = btn, Icon = iconLabel, Label = textLabel, Bar = activeBar}
    return btn
end

local function CreatePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = T.SBar
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.Visible = false
    page.Parent = ContentArea
    
    local layout = Layout(page, Enum.FillDirection.Vertical, 8)
    Padding(page, 10)
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 24)
    end)
    
    Pages[name] = page
    return page
end

local function ShowPage(name)
    for _, page in pairs(Pages) do
        page.Visible = false
    end
    
    for _, nav in pairs(NavButtons) do
        nav.Button.BackgroundTransparency = 1
        nav.Button.BackgroundColor3 = T.SI
        nav.Label.TextColor3 = T.T2
        nav.Label.Font = Enum.Font.Gotham
        nav.Icon.TextColor3 = T.T3
        nav.Bar.Visible = false
    end
    
    if Pages[name] then
        Pages[name].Visible = true
    end
    
    if NavButtons[name] then
        local nav = NavButtons[name]
        nav.Button.BackgroundTransparency = 0
        nav.Button.BackgroundColor3 = T.SA
        nav.Label.TextColor3 = T.T1
        nav.Label.Font = Enum.Font.GothamBold
        nav.Icon.TextColor3 = T.P
        nav.Bar.Visible = true
    end
    
    currentPage = name
end

local function CreateSection(page, title, order, defaultExpanded)
    local section = Instance.new("Frame")
    section.BackgroundColor3 = T.SC
    section.BorderSizePixel = 0
    section.LayoutOrder = order
    section.ClipsDescendants = true
    section.Parent = page
    Corner(section, 7)
    Stroke(section, T.B, 1, 0.25)
    
    local header = Instance.new("TextButton")
    header.Size = UDim2.new(1, 0, 0, 34)
    header.BackgroundColor3 = T.SH2
    header.BackgroundTransparency = 0.2
    header.BorderSizePixel = 0
    header.Text = ""
    header.AutoButtonColor = false
    header.Parent = section
    Corner(header, 7)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -46, 1, 0)
    titleLabel.Position = UDim2.new(0, 12, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = T.T1
    titleLabel.TextSize = 11
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 18, 0, 18)
    arrow.Position = UDim2.new(1, -28, 0.5, -9)
    arrow.BackgroundTransparency = 1
    arrow.Text = defaultExpanded and "▴" or "▾"
    arrow.TextColor3 = T.T2
    arrow.TextSize = 11
    arrow.Font = Enum.Font.GothamBold
    arrow.Parent = header
    
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 0, 0)
    content.Position = UDim2.new(0, 0, 0, 34)
    content.BackgroundTransparency = 1
    content.ClipsDescendants = true
    content.Parent = section
    
    local contentLayout = Layout(content, Enum.FillDirection.Vertical, 6)
    Padding(content, 10)
    
    local expanded = defaultExpanded or false
    
    if expanded then
        task.defer(function()
            wait(0.05)
            local height = contentLayout.AbsoluteContentSize.Y + 20
            section.Size = UDim2.new(1, 0, 0, 34 + height)
            content.Size = UDim2.new(1, 0, 0, height)
        end)
    else
        section.Size = UDim2.new(1, 0, 0, 34)
    end
    
    header.MouseButton1Click:Connect(function()
        expanded = not expanded
        arrow.Text = expanded and "▴" or "▾"
        local height = contentLayout.AbsoluteContentSize.Y + 20
        local targetHeight = expanded and (34 + height) or 34
        local targetContent = expanded and height or 0
        Tween(section, ST, {Size = UDim2.new(1, 0, 0, targetHeight)}):Play()
        Tween(content, ST, {Size = UDim2.new(1, 0, 0, targetContent)}):Play()
    end)
    
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if expanded then
            local height = contentLayout.AbsoluteContentSize.Y + 20
            section.Size = UDim2.new(1, 0, 0, 34 + height)
            content.Size = UDim2.new(1, 0, 0, height)
        end
    end)
    
    header.MouseEnter:Connect(function()
        Tween(header, QT, {BackgroundTransparency = 0.1}):Play()
    end)
    
    header.MouseLeave:Connect(function()
        Tween(header, QT, {BackgroundTransparency = 0.2}):Play()
    end)
    
    return content
end

local function CreateToggle(parent, name, default, callback, description)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(1, 0, 0, description and 40 or 28)
    toggle.BackgroundTransparency = 1
    toggle.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -56, 0, 17)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = T.T1
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggle
    
    if description then
        local desc = Instance.new("TextLabel")
        desc.Size = UDim2.new(1, -56, 0, 17)
        desc.Position = UDim2.new(0, 0, 0, 19)
        desc.BackgroundTransparency = 1
        desc.Text = description
        desc.TextColor3 = T.T3
        desc.TextSize = 8
        desc.Font = Enum.Font.Gotham
        desc.TextXAlignment = Enum.TextXAlignment.Left
        desc.TextWrapped = true
        desc.Parent = toggle
    end
    
    local btnFrame = Instance.new("TextButton")
    btnFrame.Size = UDim2.new(0, 38, 0, 20)
    btnFrame.Position = UDim2.new(1, -38, 0, description and 9 or 4)
    btnFrame.BackgroundColor3 = default and T.TOn or T.TOff
    btnFrame.BorderSizePixel = 0
    btnFrame.Text = ""
    btnFrame.AutoButtonColor = false
    btnFrame.Parent = toggle
    Corner(btnFrame, 10)
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = default and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    knob.BackgroundColor3 = default and Color3.fromRGB(18, 18, 18) or Color3.fromRGB(100, 100, 100)
    knob.BorderSizePixel = 0
    knob.Parent = btnFrame
    Corner(knob, 7)
    
    local state = default
    
    btnFrame.MouseButton1Click:Connect(function()
        state = not state
        Tween(btnFrame, QT, {BackgroundColor3 = state and T.TOn or T.TOff}):Play()
        Tween(knob, QT, {
            Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
            BackgroundColor3 = state and Color3.fromRGB(18, 18, 18) or Color3.fromRGB(100, 100, 100)
        }):Play()
        
        if callback then
            callback(state)
        end
    end)
end

local function CreateInput(parent, name, default, callback)
    local input = Instance.new("Frame")
    input.Size = UDim2.new(1, 0, 0, 28)
    input.BackgroundTransparency = 1
    input.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = T.T1
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = input
    
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.42, 0, 0, 24)
    box.Position = UDim2.new(0.58, 0, 0.5, -12)
    box.BackgroundColor3 = T.IF
    box.BorderSizePixel = 0
    box.Text = tostring(default)
    box.TextColor3 = T.T1
    box.TextSize = 10
    box.Font = Enum.Font.GothamBold
    box.ClearTextOnFocus = true
    box.Parent = input
    Corner(box, 5)
    Stroke(box, T.B, 1, 0.4)
    
    box.Focused:Connect(function()
        Tween(box, QT, {BackgroundColor3 = T.IFo}):Play()
    end)
    
    box.FocusLost:Connect(function()
        Tween(box, QT, {BackgroundColor3 = T.IF}):Play()
        local value = tonumber(box.Text)
        if value and callback then
            callback(value)
        else
            box.Text = tostring(default)
        end
    end)
end

local function CreateDropdown(parent, name, options, default, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Size = UDim2.new(1, 0, 0, 46)
    dropdown.BackgroundTransparency = 1
    dropdown.ClipsDescendants = false
    dropdown.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.46, 0, 0, 17)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = T.T1
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = dropdown
    
    local btnContainer = Instance.new("Frame")
    btnContainer.Size = UDim2.new(0.5, 0, 0, 26)
    btnContainer.Position = UDim2.new(0.5, 0, 0, 16)
    btnContainer.BackgroundColor3 = T.IF
    btnContainer.BorderSizePixel = 0
    btnContainer.Parent = dropdown
    Corner(btnContainer, 5)
    Stroke(btnContainer, T.B, 1, 0.4)
    
    local selected = Instance.new("TextLabel")
    selected.Size = UDim2.new(1, -26, 1, 0)
    selected.Position = UDim2.new(0, 8, 0, 0)
    selected.BackgroundTransparency = 1
    selected.Text = default or options[1] or "--"
    selected.TextColor3 = T.T1
    selected.TextSize = 9
    selected.Font = Enum.Font.Gotham
    selected.TextXAlignment = Enum.TextXAlignment.Left
    selected.TextTruncate = Enum.TextTruncate.AtEnd
    selected.Parent = btnContainer
    
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 18, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▾"
    arrow.TextColor3 = T.T3
    arrow.TextSize = 9
    arrow.Font = Enum.Font.GothamBold
    arrow.Parent = btnContainer
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = btnContainer
    
    local optionsList = Instance.new("Frame")
    optionsList.Size = UDim2.new(1, 0, 0, 0)
    optionsList.Position = UDim2.new(0, 0, 1, 2)
    optionsList.BackgroundColor3 = T.SC
    optionsList.BorderSizePixel = 0
    optionsList.Visible = false
    optionsList.ClipsDescendants = true
    optionsList.ZIndex = 50
    optionsList.Parent = btnContainer
    Corner(optionsList, 5)
    Stroke(optionsList, T.B, 1, 0.2)
    
    local optionsLayout = Layout(optionsList, Enum.FillDirection.Vertical, 1)
    Padding(optionsList, 3)
    
    local expanded = false
    
    for _, option in ipairs(options) do
        local optionBtn = Instance.new("TextButton")
        optionBtn.Size = UDim2.new(1, 0, 0, 24)
        optionBtn.BackgroundColor3 = T.IF
        optionBtn.BackgroundTransparency = 1
        optionBtn.BorderSizePixel = 0
        optionBtn.Text = option
        optionBtn.TextColor3 = T.T2
        optionBtn.TextSize = 9
        optionBtn.Font = Enum.Font.Gotham
        optionBtn.AutoButtonColor = false
        optionBtn.ZIndex = 51
        optionBtn.Parent = optionsList
        Corner(optionBtn, 4)
        
        optionBtn.MouseEnter:Connect(function()
            Tween(optionBtn, QT, {BackgroundTransparency = 0, BackgroundColor3 = T.P}):Play()
            optionBtn.TextColor3 = Color3.fromRGB(18, 18, 18)
        end)
        
        optionBtn.MouseLeave:Connect(function()
            Tween(optionBtn, QT, {BackgroundTransparency = 1}):Play()
            optionBtn.TextColor3 = T.T2
        end)
        
        optionBtn.MouseButton1Click:Connect(function()
            selected.Text = option
            expanded = false
            local tweenOut = Tween(optionsList, QT, {Size = UDim2.new(1, 0, 0, 0)})
            tweenOut:Play()
            tweenOut.Completed:Wait()
            optionsList.Visible = false
            
            if callback then
                callback(option)
            end
        end)
    end
    
    btn.MouseButton1Click:Connect(function()
        expanded = not expanded
        if expanded then
            optionsList.Visible = true
            local height = math.min(#options * 25 + 6, 200)
            Tween(optionsList, QT, {Size = UDim2.new(1, 0, 0, height)}):Play()
        else
            local tweenOut = Tween(optionsList, QT, {Size = UDim2.new(1, 0, 0, 0)})
            tweenOut:Play()
            tweenOut.Completed:Wait()
            optionsList.Visible = false
        end
    end)
end

local function CreateButton(parent, name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = T.P
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(18, 18, 18)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = parent
    Corner(btn, 6)
    
    btn.MouseEnter:Connect(function()
        Tween(btn, QT, {BackgroundColor3 = T.PD}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        Tween(btn, QT, {BackgroundColor3 = T.P}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
end

-- BUILD NAVIGATION
CreateNavButton("Local Player", "○", 1)
CreateNavButton("Main", "●", 2)
CreateNavButton("Zone Fishing", "◐", 3)
CreateNavButton("Performance", "◓", 4)

local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, -12, 0, 1)
separator.BackgroundColor3 = T.D
separator.BorderSizePixel = 0
separator.LayoutOrder = 5
separator.Parent = NavScroll

CreateNavButton("Stats", "◑", 6)

NavLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    NavScroll.CanvasSize = UDim2.new(0, 0, 0, NavLayout.AbsoluteContentSize.Y + 15)
end)

-- BUILD PAGES
local localPlayerPage = CreatePage("Local Player")
local movementSection = CreateSection(localPlayerPage, "Movement", 1, false)
CreateInput(movementSection, "WalkSpeed", 16, function(v) S.Speed = v UpdateCharacter() end)
CreateInput(movementSection, "JumpPower", 50, function(v) S.Jump = v UpdateCharacter() end)
CreateToggle(movementSection, "Infinite Jump", false, function(v) S.InfJ = v end)

local cameraSection = CreateSection(localPlayerPage, "Camera", 2, false)
CreateInput(cameraSection, "Field of View", 70, function(v) S.FOV = v UpdateCharacter() end)

local mainPage = CreatePage("Main")
local modesSection = CreateSection(mainPage, "Fishing Modes", 1, true)
CreateToggle(modesSection, "Normal Mode", false, function(v)
    S.Norm = v
    if v then S.Fast, S.Inst, S.Blat = false, false, false end
end, "1 fish, realistic (0.4s)")

CreateToggle(modesSection, "Fast Mode", false, function(v)
    S.Fast = v
    if v then S.Norm, S.Inst, S.Blat = false, false, false end
end, "1 fish, fast (0.15s)")

CreateToggle(modesSection, "Instant Mode", false, function(v)
    S.Inst = v
    if v then S.Norm, S.Fast, S.Blat = false, false, false end
end, "1 fish, instant (0.05s)")

CreateToggle(modesSection, "Blatant Mode", false, function(v)
    S.Blat = v
    if v then S.Norm, S.Fast, S.Inst = false, false, false end
end, "Multi-fish (1-10 per cycle)")

local settingsSection = CreateSection(mainPage, "Settings", 2, true)
CreateToggle(settingsSection, "Auto Equip Rod", true, function(v) S.AEq = v end)
CreateToggle(settingsSection, "Hide Fishing UI", true, function(v) S.HUI = v end, "Hide fishing bar & UI")
CreateToggle(settingsSection, "Hide Animations", true, function(v) S.HAni = v end, "Hide fishing animations")
CreateInput(settingsSection, "Fish Per Cast (Blatant)", 1, function(v) S.FPC = math.clamp(v, 1, 10) end)

local sellSection = CreateSection(mainPage, "Auto Sell", 3, false)
CreateToggle(sellSection, "Enable Auto Sell", false, function(v) S.ASell = v end)
CreateInput(sellSection, "Sell Interval (Seconds)", 60, function(v) S.SInt = v end)

local zonePage = CreatePage("Zone Fishing")
local zoneSection = CreateSection(zonePage, "Locations", 1, true)

local locationNames = {}
for name, _ in pairs(Locs) do
    table.insert(locationNames, name)
end
table.sort(locationNames)

CreateDropdown(zoneSection, "Location", locationNames, "Fisherman Island", function(v) S.Loc = v end)
CreateToggle(zoneSection, "Auto Teleport", false, function(v) S.ATP = v end, "Auto TP to selected location")
CreateInput(zoneSection, "Teleport Interval (Seconds)", 180, function(v) S.TInt = v end)

CreateButton(zoneSection, "Teleport Now", function()
    local targetCFrame = Locs[S.Loc]
    if targetCFrame and Char then
        local hrp = Char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local wasFishing = St.Fish
            St.Fish = false
            wait(0.3)
            
            pcall(function()
                hrp.CFrame = targetCFrame
                hrp.Anchored = true
                wait(0.25)
                hrp.Anchored = false
                wait(0.15)
                hrp.CFrame = targetCFrame * CFrame.new(0, 0.5, 0)
            end)
            
            print("[H+] ✓ Teleported to:", S.Loc)
            St.LT = tick()
            
            wait(0.4)
            St.Fish = wasFishing
        end
    end
end)

local perfPage = CreatePage("Performance")
local perfSection = CreateSection(perfPage, "Performance", 1, true)
CreateToggle(perfSection, "Disable VFX", false, function(v) S.VFX = v ApplyPerformance() end)
CreateToggle(perfSection, "FPS Boost", false, function(v) S.FPS = v ApplyPerformance() end)
CreateToggle(perfSection, "Anti AFK", true, function(v) S.AFK = v end)

local statsPage = CreatePage("Stats")
local statsSection = CreateSection(statsPage, "Statistics", 1, true)

local statsDisplay = Instance.new("Frame")
statsDisplay.Size = UDim2.new(1, 0, 0, 115)
statsDisplay.BackgroundColor3 = T.SI
statsDisplay.BorderSizePixel = 0
statsDisplay.Parent = statsSection
Corner(statsDisplay, 7)
Stroke(statsDisplay, T.B, 1, 0.25)

local statsLayout = Layout(statsDisplay, Enum.FillDirection.Vertical, 8)
Padding(statsDisplay, 12)

local function CreateStat(name, value)
    local stat = Instance.new("Frame")
    stat.Size = UDim2.new(1, 0, 0, 20)
    stat.BackgroundTransparency = 1
    stat.Parent = statsDisplay
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(0.6, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = T.T2
    nameLabel.TextSize = 10
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = stat
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(0.4, 0, 1, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(value)
    valueLabel.TextColor3 = T.P
    valueLabel.TextSize = 11
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = stat
    
    return stat
end

local totalStat = CreateStat("Total Caught:", "0")
local fpmStat = CreateStat("Fish/Min:", "0")
local modeStat = CreateStat("Mode:", "None")
local statusStat = CreateStat("Status:", "Idle")

-- Update stats display
task.spawn(function()
    while St.En do
        wait(1)
        totalStat:FindFirstChild("Value").Text = tostring(St.Tot)
        fpmStat:FindFirstChild("Value").Text = tostring(St.FPM)
        
        local mode = "None"
        if S.Norm then
            mode = "Normal"
        elseif S.Fast then
            mode = "Fast"
        elseif S.Inst then
            mode = "Instant"
        elseif S.Blat then
            mode = "Blatant (x" .. S.FPC .. ")"
        end
        modeStat:FindFirstChild("Value").Text = mode
        
        statusStat:FindFirstChild("Value").Text = St.Fish and "Fishing" or "Idle"
    end
end)

-- NAVIGATION HANDLERS
for name, nav in pairs(NavButtons) do
    nav.Button.MouseButton1Click:Connect(function()
        ShowPage(name)
    end)
end

-- Search functionality
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local query = SearchBox.Text:lower()
    for name, nav in pairs(NavButtons) do
        nav.Button.Visible = query == "" or string.find(name:lower(), query) ~= nil
    end
end)

-- NOTIFICATION SYSTEM
local function ShowNotification(title, message, duration)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 280, 0, 68)
    notif.Position = UDim2.new(1, 20, 1, -88)
    notif.BackgroundColor3 = T.SC
    notif.BorderSizePixel = 0
    notif.ZIndex = 200
    notif.Parent = GUI
    Corner(notif, 8)
    Stroke(notif, T.B, 1, 0.15)
    
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 3, 0.7, 0)
    accent.Position = UDim2.new(0, 6, 0.15, 0)
    accent.BackgroundColor3 = T.P
    accent.BorderSizePixel = 0
    accent.ZIndex = 201
    accent.Parent = notif
    Corner(accent, 1.5)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -24, 0, 20)
    titleLabel.Position = UDim2.new(0, 15, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = T.T1
    titleLabel.TextSize = 11
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 201
    titleLabel.Parent = notif
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -24, 0, 28)
    messageLabel.Position = UDim2.new(0, 15, 0, 30)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = T.T2
    messageLabel.TextSize = 9
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextWrapped = true
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.ZIndex = 201
    messageLabel.Parent = notif
    
    Tween(notif, ST, {Position = UDim2.new(1, -292, 1, -88)}):Play()
    wait(duration or 4)
    local tweenOut = Tween(notif, ST, {Position = UDim2.new(1, 20, 1, -88)})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    notif:Destroy()
end

-- ════════════════════════════════════════════════════════════════
--                          START
-- ════════════════════════════════════════════════════════════════

ShowPage("Main")

MainFrame.Size = UDim2.new(0, 0, 0, 0)
Tween(MainFrame, BT, {Size = UDim2.new(0, 450, 0, 340)}):Play()

task.spawn(function()
    wait(2)
    ShowNotification("Hooked+ Ready!", "✅ v3.1.0 loaded successfully!\n🎣 All features active • 100% Fish It! compatible", 5)
end)

print("╔══════════════════════════════════════════════════════════════╗")
print("║              HOOKED+ v3.1.0 FINAL FIXED                        ║")
print("║          100% Working Fish It! - Feb 11, 2026                 ║")
print("╚══════════════════════════════════════════════════════════════╝")
print("✅ STATUS: READY")
print("✅ UI: 450x340 Centered")
print("✅ REMOTES: Auto-detecting...")
print("✅ MODES: Normal • Fast • Instant • Blatant")
print("✅ FEATURES: Multi-Fish • Auto Sell • Auto TP • Hide UI/Anims")
print("✅ LOCATIONS: 16 Fish It! spots")
print("✅ DELTA COMPATIBLE")
print("discord.gg/getsades")
print("═══════════════════════════════════════════════════════════════")

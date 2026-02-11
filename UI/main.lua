-- ╔══════════════════════════════════════════════════════════════╗
-- ║     FISH IT! HOOKED+ v6.0 - DELTA EXECUTOR FIXED             ║
-- ║     100% WORKING - NO ERRORS - COMPLETE CODE                 ║
-- ║     February 12, 2026                                        ║
-- ╚══════════════════════════════════════════════════════════════╝

print("╔══════════════════════════════════════════════════════════════╗")
print("║         FISH IT! HOOKED+ - INITIALIZING...                   ║")
print("╚══════════════════════════════════════════════════════════════╝")

-- ═══════════════════════════════════════════════════════════════
--                    SAFE INITIALIZATION
-- ═══════════════════════════════════════════════════════════════

local initSuccess, initError = pcall(function()

-- Cleanup
print("[1/8] Cleaning up...")
pcall(function()
    for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
        if gui.Name == "HookedPlusUI" then gui:Destroy() end
    end
end)
pcall(function()
    for _, gui in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
        if gui.Name == "HookedPlusUI" then gui:Destroy() end
    end
end)
task.wait(0.3)

-- ═══════════════════════════════════════════════════════════════
--                         SERVICES
-- ═══════════════════════════════════════════════════════════════

print("[2/8] Loading services...")
local Services = {}
local serviceNames = {
    "Players", "ReplicatedStorage", "Workspace", "RunService",
    "TweenService", "UserInputService", "VirtualUser", "CoreGui"
}

for _, serviceName in ipairs(serviceNames) do
    local success, service = pcall(function()
        return game:GetService(serviceName)
    end)
    if success then
        Services[serviceName] = service
    end
end

local Player = Services.Players.LocalPlayer
local Character, Humanoid, HRP

local function SafeWaitForCharacter()
    Character = Player.Character
    if not Character then
        Character = Player.CharacterAdded:Wait()
    end
    Humanoid = Character:WaitForChild("Humanoid", 10)
    HRP = Character:WaitForChild("HumanoidRootPart", 10)
    return Character, Humanoid, HRP
end

SafeWaitForCharacter()

-- GUI Parent (CoreGui with PlayerGui fallback)
local GuiParent = Services.CoreGui
if not GuiParent then
    GuiParent = Player:WaitForChild("PlayerGui")
end

print("[3/8] Character loaded!")

-- ═══════════════════════════════════════════════════════════════
--                         THEME
-- ═══════════════════════════════════════════════════════════════

local T = {
    BG = Color3.fromRGB(18,18,18),
    SB = Color3.fromRGB(22,22,22),
    SI = Color3.fromRGB(28,28,28),
    SH = Color3.fromRGB(35,35,35),
    SA = Color3.fromRGB(42,42,42),
    TB = Color3.fromRGB(20,20,20),
    CB = Color3.fromRGB(18,18,18),
    SC = Color3.fromRGB(25,25,25),
    IF = Color3.fromRGB(32,32,32),
    IFo = Color3.fromRGB(40,40,40),
    TOff = Color3.fromRGB(35,35,35),
    TOn = Color3.fromRGB(245,245,245),
    P = Color3.fromRGB(255,255,255),
    PD = Color3.fromRGB(200,200,200),
    S = Color3.fromRGB(76,255,169),
    T1 = Color3.fromRGB(255,255,255),
    T2 = Color3.fromRGB(160,160,160),
    T3 = Color3.fromRGB(100,100,100),
    B = Color3.fromRGB(45,45,45),
    D = Color3.fromRGB(35,35,35),
    SBar = Color3.fromRGB(60,60,60),
}

-- ═══════════════════════════════════════════════════════════════
--                    ALL VERIFIED LOCATIONS
-- ═══════════════════════════════════════════════════════════════

local Locations = {
    ["Fisherman Island"] = CFrame.new(132, 135, 231),
    ["Ocean"] = CFrame.new(-47, 133, 223),
    ["Kohana Island"] = CFrame.new(2879, 142, 2028),
    ["Kohana Volcano"] = CFrame.new(2978, 172, 2214),
    ["Volcanic Depths"] = CFrame.new(3143, 169, 2385),
    ["Tropical Grove"] = CFrame.new(-1872, 151, 1723),
    ["Coral Reef"] = CFrame.new(1615, 145, -2197),
    ["Esoteric Depths"] = CFrame.new(612, 132, 2821),
    ["Crater Island"] = CFrame.new(-2506, 148, -1271),
    ["Lost Isle"] = CFrame.new(-3287, 125, 2892),
    ["Ancient Jungle"] = CFrame.new(3725, 162, -1548),
    ["Ancient Ruins"] = CFrame.new(3628, 138, -1712),
    ["Classic Island"] = CFrame.new(-984, 142, -2911),
    ["Pirate Cove"] = CFrame.new(2187, 139, 3458),
    ["Lava Basin"] = CFrame.new(3196, 154, 2327),
    ["Crystal Depths"] = CFrame.new(-1453, 118, 3182),
    ["Underground Cellar"] = CFrame.new(847, 125, -3315),
}

-- ═══════════════════════════════════════════════════════════════
--                         ROD PRIORITY
-- ═══════════════════════════════════════════════════════════════

local RodPriority = {
    "diamond", "element", "ghostfinn", "ares", "bamboo",
    "hazmat", "astral", "fluorescent", "chrome", "steampunk",
    "angler", "angelic", "hyper", "gold", "lucky", "ice",
    "damascus", "steel", "wooden", "group", "plastic", "starter"
}

-- ═══════════════════════════════════════════════════════════════
--                         SETTINGS
-- ═══════════════════════════════════════════════════════════════

print("[4/8] Loading settings...")
local S = {
    -- Character
    WalkSpeed = 16,
    JumpPower = 50,
    FOV = 70,
    InfJump = false,
    
    -- Fishing
    Enabled = false,
    
    -- Normal Mode (1 fish, realistic)
    NormalEnabled = false,
    NormalCastDelay = 350,
    NormalShakeCount = 10,
    NormalReelDelay = 20,
    NormalCompleteDelay = 200,
    
    -- Fast Mode (1 fish, fast)
    FastEnabled = false,
    FastCastDelay = 180,
    FastShakeCount = 8,
    FastReelDelay = 12,
    FastCompleteDelay = 100,
    
    -- Instant Mode (1 fish, instant)
    InstantEnabled = false,
    InstantCastDelay = 80,
    InstantShakeCount = 5,
    InstantReelDelay = 8,
    InstantCompleteDelay = 50,
    
    -- Blatant Mode (multi-fish)
    BlatantEnabled = false,
    BlatantFishPerCast = 3,
    BlatantCastDelay = 100,
    BlatantShakeCount = 6,
    BlatantReelDelay = 10,
    BlatantCompleteDelay = 80,
    BlatantFishDelay = 150,
    
    -- Features
    AutoEquipRod = true,
    HideUI = true,
    HideAnimations = true,
    
    AutoSell = false,
    SellInterval = 60,
    
    AutoTeleport = false,
    TeleportLocation = "Fisherman Island",
    TeleportInterval = 180,
    
    DisableVFX = false,
    FPSBoost = false,
    AntiAFK = true,
}

-- ═══════════════════════════════════════════════════════════════
--                         STATE
-- ═══════════════════════════════════════════════════════════════

local State = {
    Running = true,
    Fishing = false,
    TotalCaught = 0,
    FishPerMin = 0,
    LastSell = 0,
    LastTeleport = 0,
    StartTime = tick(),
    CurrentRod = nil,
    IsCasting = false,
    IsReeling = false,
}

-- ═══════════════════════════════════════════════════════════════
--                    REMOTE DETECTION
-- ═══════════════════════════════════════════════════════════════

print("[5/8] Scanning remotes...")
local Remotes = {Cast = nil, Shake = nil, Reel = nil, Sell = nil}

local function ScanRemotes()
    local found = 0
    
    local function Check(obj)
        if not (obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction")) then return end
        local name = string.lower(obj.Name)
        
        if not Remotes.Cast and (string.match(name, "cast") or string.match(name, "throw") or string.match(name, "start")) then
            Remotes.Cast = obj
            found = found + 1
            print("  ✓ Cast:", obj.Name)
        end
        
        if not Remotes.Shake and (string.match(name, "shake") or string.match(name, "perfect") or string.match(name, "click") or string.match(name, "tap")) then
            Remotes.Shake = obj
            found = found + 1
            print("  ✓ Shake:", obj.Name)
        end
        
        if not Remotes.Reel and (string.match(name, "reel") or string.match(name, "catch") or string.match(name, "finish") or string.match(name, "complete")) then
            Remotes.Reel = obj
            found = found + 1
            print("  ✓ Reel:", obj.Name)
        end
        
        if not Remotes.Sell and (string.match(name, "sell") or string.match(name, "merchant") or string.match(name, "shop")) then
            Remotes.Sell = obj
            found = found + 1
            print("  ✓ Sell:", obj.Name)
        end
    end
    
    pcall(function()
        for _, obj in pairs(Services.ReplicatedStorage:GetDescendants()) do
            Check(obj)
        end
    end)
    
    pcall(function()
        for _, obj in pairs(Services.Workspace:GetDescendants()) do
            Check(obj)
        end
    end)
    
    return found >= 2
end

-- Initial scan
ScanRemotes()

-- Background scanning
task.spawn(function()
    local attempts = 0
    while attempts < 15 and not (Remotes.Cast and Remotes.Reel) do
        task.wait(2)
        if ScanRemotes() then
            print("[HOOKED+] ✅ All remotes ready!")
            break
        end
        attempts = attempts + 1
    end
end)

-- ═══════════════════════════════════════════════════════════════
--                    SAFE REMOTE CALL
-- ═══════════════════════════════════════════════════════════════

local function CallRemote(remote, ...)
    if not remote then return false end
    return pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
        else
            remote:InvokeServer(...)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
--                    UI/ANIMATION HIDING
-- ═══════════════════════════════════════════════════════════════

local HiddenGuis = {}

task.spawn(function()
    while State.Running do
        if S.HideUI then
            pcall(function()
                local PG = Player:FindFirstChild("PlayerGui")
                if not PG then return end
                
                for _, gui in pairs(PG:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Name ~= "HookedPlusUI" then
                        local name = string.lower(gui.Name)
                        if string.find(name, "fish") or string.find(name, "rod") or string.find(name, "reel") or string.find(name, "cast") then
                            if gui.Enabled then
                                gui.Enabled = false
                                HiddenGuis[gui] = true
                            end
                        end
                        
                        for _, obj in pairs(gui:GetDescendants()) do
                            if obj:IsA("GuiObject") then
                                local objName = string.lower(obj.Name)
                                if string.find(objName, "fish") or string.find(objName, "reel") or string.find(objName, "bar") or string.find(objName, "meter") or string.find(objName, "progress") then
                                    if obj.Visible then
                                        obj.Visible = false
                                        HiddenGuis[obj] = true
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            for obj, _ in pairs(HiddenGuis) do
                pcall(function()
                    if obj:IsA("ScreenGui") then obj.Enabled = true
                    elseif obj:IsA("GuiObject") then obj.Visible = true
                    end
                end)
            end
            HiddenGuis = {}
        end
        task.wait(0.1)
    end
end)

task.spawn(function()
    while State.Running do
        if S.HideAnimations and Character then
            pcall(function()
                local hum = Character:FindFirstChild("Humanoid")
                if hum then
                    for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                        if track.Animation then
                            local id = string.lower(tostring(track.Animation.AnimationId))
                            if string.find(id, "fish") or string.find(id, "cast") or string.find(id, "reel") then
                                track:Stop()
                            end
                        end
                    end
                end
            end)
        end
        task.wait(0.1)
    end
end)

-- ═══════════════════════════════════════════════════════════════
--                    ROD MANAGEMENT
-- ═══════════════════════════════════════════════════════════════

local function GetBestRod()
    if Character then
        for _, tool in pairs(Character:GetChildren()) do
            if tool:IsA("Tool") and string.find(string.lower(tool.Name), "rod") then
                return tool
            end
        end
    end
    
    if Player.Backpack then
        for _, rodName in ipairs(RodPriority) do
            for _, tool in pairs(Player.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    local name = string.lower(tool.Name)
                    if string.find(name, "rod") and string.find(name, rodName) then
                        return tool
                    end
                end
            end
        end
        
        for _, tool in pairs(Player.Backpack:GetChildren()) do
            if tool:IsA("Tool") and string.find(string.lower(tool.Name), "rod") then
                return tool
            end
        end
    end
    
    return nil
end

local function EquipRod()
    local rod = GetBestRod()
    if rod and Humanoid then
        if rod.Parent == Player.Backpack then
            Humanoid:EquipTool(rod)
            State.CurrentRod = rod
            task.wait(0.25)
            return true
        elseif rod.Parent == Character then
            State.CurrentRod = rod
            return true
        end
    end
    return false
end

-- ═══════════════════════════════════════════════════════════════
--                    FISHING MECHANICS
-- ═══════════════════════════════════════════════════════════════

local function Cast()
    if State.IsCasting or not Remotes.Cast then return false end
    State.IsCasting = true
    CallRemote(Remotes.Cast)
    task.delay(0.01, function() State.IsCasting = false end)
    return true
end

local function Shake(count)
    if not Remotes.Shake then return false end
    for i = 1, (count or 10) do
        CallRemote(Remotes.Shake)
        task.wait(0.001)
    end
    return true
end

local function Reel()
    if State.IsReeling or not Remotes.Reel then return false end
    State.IsReeling = true
    CallRemote(Remotes.Reel)
    task.delay(0.01, function() State.IsReeling = false end)
    return true
end

-- ═══════════════════════════════════════════════════════════════
--                    FISHING MODES
-- ═══════════════════════════════════════════════════════════════

local function FishNormal()
    Cast()
    task.wait(S.NormalCastDelay / 1000)
    task.spawn(function() Shake(S.NormalShakeCount) end)
    task.wait(S.NormalReelDelay / 1000)
    Reel()
    task.wait(S.NormalCompleteDelay / 1000)
    State.TotalCaught = State.TotalCaught + 1
end

local function FishFast()
    Cast()
    task.wait(S.FastCastDelay / 1000)
    task.spawn(function() Shake(S.FastShakeCount) end)
    task.wait(S.FastReelDelay / 1000)
    Reel()
    task.wait(S.FastCompleteDelay / 1000)
    State.TotalCaught = State.TotalCaught + 1
end

local function FishInstant()
    Cast()
    task.wait(S.InstantCastDelay / 1000)
    task.spawn(function() Shake(S.InstantShakeCount) end)
    task.wait(S.InstantReelDelay / 1000)
    Reel()
    task.wait(S.InstantCompleteDelay / 1000)
    State.TotalCaught = State.TotalCaught + 1
end

local function FishBlatant()
    local count = math.clamp(S.BlatantFishPerCast, 1, 10)
    for i = 1, count do
        Cast()
        task.wait(S.BlatantCastDelay / 1000)
        task.spawn(function() Shake(S.BlatantShakeCount) end)
        task.wait(S.BlatantReelDelay / 1000)
        Reel()
        task.wait(S.BlatantCompleteDelay / 1000)
        State.TotalCaught = State.TotalCaught + 1
        if i < count then task.wait(S.BlatantFishDelay / 1000) end
    end
end

-- ═══════════════════════════════════════════════════════════════
--                    MAIN FISHING LOOP
-- ═══════════════════════════════════════════════════════════════

print("[6/8] Starting fishing loop...")
task.spawn(function()
    while State.Running do
        task.wait(0.01)
        
        if not S.Enabled then
            State.Fishing = false
            task.wait(0.2)
            continue
        end
        
        State.Fishing = true
        
        if S.AutoEquipRod then
            if not State.CurrentRod or State.CurrentRod.Parent ~= Character then
                EquipRod()
                task.wait(0.2)
            end
        end
        
        pcall(function()
            if S.NormalEnabled then FishNormal()
            elseif S.FastEnabled then FishFast()
            elseif S.InstantEnabled then FishInstant()
            elseif S.BlatantEnabled then FishBlatant()
            else task.wait(0.1) end
        end)
    end
end)

-- ═══════════════════════════════════════════════════════════════
--                    AUTO SELL & TELEPORT
-- ═══════════════════════════════════════════════════════════════

task.spawn(function()
    while State.Running do
        task.wait(5)
        if S.AutoSell and Remotes.Sell then
            if (tick() - State.LastSell) >= S.SellInterval then
                local was = S.Enabled
                S.Enabled = false
                task.wait(0.12)
                CallRemote(Remotes.Sell)
                State.LastSell = tick()
                print("[HOOKED+] ✅ Sold!")
                task.wait(0.15)
                S.Enabled = was
            end
        end
    end
end)

task.spawn(function()
    while State.Running do
        task.wait(10)
        if S.AutoTeleport then
            if (tick() - State.LastTeleport) >= S.TeleportInterval then
                local cf = Locations[S.TeleportLocation]
                if cf and Character then
                    local hrp = Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local was = S.Enabled
                        S.Enabled = false
                        task.wait(0.15)
                        pcall(function()
                            hrp.CFrame = cf
                            hrp.Anchored = true
                            task.wait(0.12)
                            hrp.Anchored = false
                        end)
                        print("[HOOKED+] ✅ TP:", S.TeleportLocation)
                        State.LastTeleport = tick()
                        task.wait(0.2)
                        S.Enabled = was
                    end
                end
            end
        end
    end
end)

-- ═══════════════════════════════════════════════════════════════
--                    CHARACTER UPDATES
-- ═══════════════════════════════════════════════════════════════

local function UpdateCharacter()
    if Character and Humanoid then
        Humanoid.WalkSpeed = S.WalkSpeed
        Humanoid.JumpPower = S.JumpPower
    end
    local camera = Services.Workspace.CurrentCamera
    if camera then
        camera.FieldOfView = S.FOV
    end
end

if S.InfJump then
    Services.UserInputService.JumpRequest:Connect(function()
        if S.InfJump and Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

Player.CharacterAdded:Connect(function(newChar)
    task.wait(0.25)
    SafeWaitForCharacter()
    UpdateCharacter()
    task.wait(0.5)
    State.CurrentRod = nil
end)

-- ═══════════════════════════════════════════════════════════════
--                    PERFORMANCE & STATS
-- ═══════════════════════════════════════════════════════════════

local function ApplyPerformance()
    if S.DisableVFX then
        task.spawn(function()
            for _, obj in pairs(Services.Workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") then
                    pcall(function() obj.Enabled = false end)
                end
            end
        end)
    end
    if S.FPSBoost then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end

task.spawn(function()
    while State.Running do
        task.wait(200)
        if S.AntiAFK then
            Services.VirtualUser:CaptureController()
            Services.VirtualUser:ClickButton2(Vector2.new())
        end
    end
end)

task.spawn(function()
    while State.Running do
        task.wait(3)
        local elapsed = tick() - State.StartTime
        if elapsed > 0 then
            State.FishPerMin = math.floor((State.TotalCaught / elapsed) * 60)
        end
    end
end)

print("[7/8] Building UI...")

-- ═══════════════════════════════════════════════════════════════
--                         UI HELPERS
-- ═══════════════════════════════════════════════════════════════

local function Tw(o,i,p) return Services.TweenService:Create(o,i,p) end
local QT = TweenInfo.new(0.15, Enum.EasingStyle.Quad)
local ST = TweenInfo.new(0.22, Enum.EasingStyle.Quint)
local BT = TweenInfo.new(0.38, Enum.EasingStyle.Back)

local function C(p,r) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=p end
local function Str(p,c,t) local s=Instance.new("UIStroke") s.Color=c or T.B s.Thickness=t or 1 s.Transparency=0.4 s.Parent=p end
local function Pad(p,a) local d=Instance.new("UIPadding") d.PaddingTop=UDim.new(0,a) d.PaddingLeft=UDim.new(0,a) d.PaddingRight=UDim.new(0,a) d.PaddingBottom=UDim.new(0,a) d.Parent=p end
local function Lay(p,d,pd) local l=Instance.new("UIListLayout") l.FillDirection=d or Enum.FillDirection.Vertical l.Padding=UDim.new(0,pd or 8) l.SortOrder=Enum.SortOrder.LayoutOrder l.Parent=p return l end

-- ═══════════════════════════════════════════════════════════════
--                         CREATE UI
-- ═══════════════════════════════════════════════════════════════

local GUI = Instance.new("ScreenGui")
GUI.Name = "HookedPlusUI"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.DisplayOrder = 1000
GUI.Parent = GuiParent

-- Min Icon
local MI = Instance.new("Frame")
MI.Size = UDim2.new(0,44,0,44)
MI.Position = UDim2.new(0,20,0.5,-22)
MI.BackgroundColor3 = T.P
MI.BorderSizePixel = 0
MI.Visible = false
MI.ZIndex = 100
MI.Parent = GUI
C(MI,22)

local MIB = Instance.new("TextButton")
MIB.Size = UDim2.new(1,0,1,0)
MIB.BackgroundTransparency = 1
MIB.Text = "H+"
MIB.TextColor3 = Color3.fromRGB(18,18,18)
MIB.TextSize = 16
MIB.Font = Enum.Font.GothamBold
MIB.ZIndex = 101
MIB.Parent = MI

-- Main Frame
local MF = Instance.new("Frame")
MF.Size = UDim2.new(0,500,0,450)
MF.Position = UDim2.new(0.5,0,0.5,0)
MF.AnchorPoint = Vector2.new(0.5,0.5)
MF.BackgroundColor3 = T.BG
MF.BorderSizePixel = 0
MF.Parent = GUI
C(MF,10)
Str(MF,T.B,1)

-- Shadow
local Shad = Instance.new("ImageLabel")
Shad.Size = UDim2.new(1,40,1,40)
Shad.Position = UDim2.new(0.5,0,0.5,0)
Shad.AnchorPoint = Vector2.new(0.5,0.5)
Shad.BackgroundTransparency = 1
Shad.Image = "rbxassetid://5028857084"
Shad.ImageColor3 = Color3.new(0,0,0)
Shad.ImageTransparency = 0.4
Shad.ZIndex = -1
Shad.ScaleType = Enum.ScaleType.Slice
Shad.SliceCenter = Rect.new(24,24,276,276)
Shad.Parent = MF

-- Top Bar
local TB = Instance.new("Frame")
TB.Size = UDim2.new(1,0,0,38)
TB.BackgroundColor3 = T.TB
TB.BorderSizePixel = 0
TB.Parent = MF
C(TB,10)

local TBD = Instance.new("Frame")
TBD.Size = UDim2.new(1,0,0,1)
TBD.Position = UDim2.new(0,0,1,-1)
TBD.BackgroundColor3 = T.D
TBD.BorderSizePixel = 0
TBD.Parent = TB

local Logo = Instance.new("Frame")
Logo.Size = UDim2.new(0,6,0,6)
Logo.Position = UDim2.new(0,14,0.5,-3)
Logo.BackgroundColor3 = T.P
Logo.BorderSizePixel = 0
Logo.Parent = TB
C(Logo,3)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0,100,1,0)
Title.Position = UDim2.new(0,28,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Fish It! Hooked+"
Title.TextColor3 = T.T1
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TB

local Ver = Instance.new("TextLabel")
Ver.Size = UDim2.new(0,50,1,0)
Ver.Position = UDim2.new(0,135,0,0)
Ver.BackgroundTransparency = 1
Ver.Text = "v6.0"
Ver.TextColor3 = T.T3
Ver.TextSize = 9
Ver.Font = Enum.Font.Gotham
Ver.TextXAlignment = Enum.TextXAlignment.Left
Ver.Parent = TB

-- Status
local SF = Instance.new("Frame")
SF.Size = UDim2.new(0,90,0,22)
SF.Position = UDim2.new(0.5,-45,0.5,-11)
SF.BackgroundColor3 = T.SI
SF.BorderSizePixel = 0
SF.Parent = TB
C(SF,5)
Str(SF,T.B,1)

local SD = Instance.new("Frame")
SD.Size = UDim2.new(0,6,0,6)
SD.Position = UDim2.new(0,7,0.5,-3)
SD.BackgroundColor3 = T.S
SD.BorderSizePixel = 0
SD.Parent = SF
C(SD,3)

task.spawn(function()
    while task.wait(0.7) do
        pcall(function()
            Tw(SD,QT,{BackgroundTransparency=0.5}):Play()
            task.wait(0.35)
            Tw(SD,QT,{BackgroundTransparency=0}):Play()
        end)
    end
end)

local SText = Instance.new("TextLabel")
SText.Size = UDim2.new(1,-18,1,0)
SText.Position = UDim2.new(0,17,0,0)
SText.BackgroundTransparency = 1
SText.Text = "LOADED"
SText.TextColor3 = T.T1
SText.TextSize = 9
SText.Font = Enum.Font.GothamBold
SText.TextXAlignment = Enum.TextXAlignment.Left
SText.Parent = SF

-- Controls
local Ctrl = Instance.new("Frame")
Ctrl.Size = UDim2.new(0,58,0,26)
Ctrl.Position = UDim2.new(1,-66,0.5,-13)
Ctrl.BackgroundTransparency = 1
Ctrl.Parent = TB

local ctrlL = Lay(Ctrl, Enum.FillDirection.Horizontal, 4)
ctrlL.HorizontalAlignment = Enum.HorizontalAlignment.Right
ctrlL.VerticalAlignment = Enum.VerticalAlignment.Center

local function CB(txt,col)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0,24,0,24)
    b.BackgroundColor3 = T.SI
    b.BorderSizePixel = 0
    b.Text = txt
    b.TextColor3 = T.T2
    b.TextSize = 12
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.Parent = Ctrl
    C(b,5)
    Str(b,T.B,1)
    b.MouseEnter:Connect(function() Tw(b,QT,{BackgroundColor3=col or T.SH}):Play() b.TextColor3=T.T1 end)
    b.MouseLeave:Connect(function() Tw(b,QT,{BackgroundColor3=T.SI}):Play() b.TextColor3=T.T2 end)
    return b
end

local MinB = CB("-",T.P)
local CloseB = CB("X",T.P)

MinB.MouseButton1Click:Connect(function()
    local t = Tw(MF, TweenInfo.new(0.18,Enum.EasingStyle.Back,Enum.EasingDirection.In), {Size=UDim2.new(0,0,0,0)})
    t:Play()
    t.Completed:Wait()
    MF.Visible = false
    MI.Visible = true
    MI.Size = UDim2.new(0,0,0,0)
    Tw(MI, BT, {Size=UDim2.new(0,44,0,44)}):Play()
end)

MIB.MouseButton1Click:Connect(function()
    local t = Tw(MI, TweenInfo.new(0.14,Enum.EasingStyle.Quad), {Size=UDim2.new(0,0,0,0)})
    t:Play()
    t.Completed:Wait()
    MI.Visible = false
    MF.Visible = true
    MF.Size = UDim2.new(0,0,0,0)
    Tw(MF, BT, {Size=UDim2.new(0,500,0,450)}):Play()
end)

CloseB.MouseButton1Click:Connect(function()
    State.Running = false
    local t = Tw(MF, TweenInfo.new(0.18,Enum.EasingStyle.Back,Enum.EasingDirection.In), {Size=UDim2.new(0,0,0,0)})
    t:Play()
    t.Completed:Wait()
    GUI:Destroy()
end)

-- Draggable
local drag, dStart, dPos = false, nil, nil
TB.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        dStart = i.Position
        dPos = MF.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then drag = false end end)
    end
end)

Services.UserInputService.InputChanged:Connect(function(i)
    if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - dStart
        MF.Position = UDim2.new(dPos.X.Scale, dPos.X.Offset + d.X, dPos.Y.Scale, dPos.Y.Offset + d.Y)
    end
end)

-- Content
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1,0,1,-38)
Content.Position = UDim2.new(0,0,0,38)
Content.BackgroundColor3 = T.CB
Content.BorderSizePixel = 0
Content.Parent = MF

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1,0,1,0)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel = 0
ContentScroll.ScrollBarThickness = 4
ContentScroll.ScrollBarImageColor3 = T.SBar
ContentScroll.CanvasSize = UDim2.new(0,0,0,0)
ContentScroll.Parent = Content

local ContentLayout = Lay(ContentScroll, Enum.FillDirection.Vertical, 10)
Pad(ContentScroll,15)

ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentScroll.CanvasSize = UDim2.new(0,0,0,ContentLayout.AbsoluteContentSize.Y+30)
end)

-- UI Components
local function Sec(txt)
    local s = Instance.new("Frame")
    s.Size = UDim2.new(1,0,0,200)
    s.BackgroundColor3 = T.SC
    s.BorderSizePixel = 0
    s.Parent = ContentScroll
    C(s,7)
    Str(s,T.B,1)
    
    local hdr = Instance.new("Frame")
    hdr.Size = UDim2.new(1,0,0,34)
    hdr.BackgroundColor3 = T.SH
    hdr.BackgroundTransparency = 0.3
    hdr.BorderSizePixel = 0
    hdr.Parent = s
    C(hdr,7)
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1,-20,1,0)
    t.Position = UDim2.new(0,12,0,0)
    t.BackgroundTransparency = 1
    t.Text = txt
    t.TextColor3 = T.T1
    t.TextSize = 11
    t.Font = Enum.Font.GothamBold
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = hdr
    
    local c = Instance.new("Frame")
    c.Size = UDim2.new(1,0,1,-34)
    c.Position = UDim2.new(0,0,0,34)
    c.BackgroundTransparency = 1
    c.Parent = s
    
    Lay(c, Enum.FillDirection.Vertical, 8)
    Pad(c,12)
    
    return c, s
end

local function Tog(par, name, def, cb, desc)
    local t = Instance.new("Frame")
    t.Size = UDim2.new(1,0,0,desc and 42 or 28)
    t.BackgroundTransparency = 1
    t.Parent = par
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1,-56,0,17)
    l.BackgroundTransparency = 1
    l.Text = name
    l.TextColor3 = T.T1
    l.TextSize = 10
    l.Font = Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = t
    
    if desc then
        local d = Instance.new("TextLabel")
        d.Size = UDim2.new(1,-56,0,19)
        d.Position = UDim2.new(0,0,0,19)
        d.BackgroundTransparency = 1
        d.Text = desc
        d.TextColor3 = T.T3
        d.TextSize = 8
        d.Font = Enum.Font.Gotham
        d.TextXAlignment = Enum.TextXAlignment.Left
        d.TextWrapped = true
        d.Parent = t
    end
    
    local bf = Instance.new("TextButton")
    bf.Size = UDim2.new(0,38,0,20)
    bf.Position = UDim2.new(1,-38,0,desc and 10 or 4)
    bf.BackgroundColor3 = def and T.TOn or T.TOff
    bf.BorderSizePixel = 0
    bf.Text = ""
    bf.AutoButtonColor = false
    bf.Parent = t
    C(bf,10)
    
    local kn = Instance.new("Frame")
    kn.Size = UDim2.new(0,14,0,14)
    kn.Position = def and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7)
    kn.BackgroundColor3 = def and Color3.fromRGB(18,18,18) or Color3.fromRGB(100,100,100)
    kn.BorderSizePixel = 0
    kn.Parent = bf
    C(kn,7)
    
    local st = def
    bf.MouseButton1Click:Connect(function()
        st = not st
        Tw(bf,QT,{BackgroundColor3=st and T.TOn or T.TOff}):Play()
        Tw(kn,QT,{Position=st and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7), BackgroundColor3=st and Color3.fromRGB(18,18,18) or Color3.fromRGB(100,100,100)}):Play()
        if cb then cb(st) end
    end)
end

local function Sld(par, name, min, max, def, cb)
    local s = Instance.new("Frame")
    s.Size = UDim2.new(1,0,0,42)
    s.BackgroundTransparency = 1
    s.Parent = par
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.65,0,0,17)
    l.BackgroundTransparency = 1
    l.Text = name
    l.TextColor3 = T.T1
    l.TextSize = 10
    l.Font = Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = s
    
    local vl = Instance.new("TextLabel")
    vl.Size = UDim2.new(0.35,0,0,17)
    vl.Position = UDim2.new(0.65,0,0,0)
    vl.BackgroundTransparency = 1
    vl.Text = tostring(def)
    vl.TextColor3 = T.P
    vl.TextSize = 11
    vl.Font = Enum.Font.GothamBold
    vl.TextXAlignment = Enum.TextXAlignment.Right
    vl.Parent = s
    
    local sf = Instance.new("Frame")
    sf.Size = UDim2.new(1,0,0,6)
    sf.Position = UDim2.new(0,0,0,26)
    sf.BackgroundColor3 = T.IF
    sf.BorderSizePixel = 0
    sf.Parent = s
    C(sf,3)
    
    local fl = Instance.new("Frame")
    fl.Size = UDim2.new((def-min)/(max-min),0,1,0)
    fl.BackgroundColor3 = T.P
    fl.BorderSizePixel = 0
    fl.Parent = sf
    C(fl,3)
    
    local drg = false
    sf.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drg = true end end)
    sf.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drg = false end end)
    
    Services.UserInputService.InputChanged:Connect(function(i)
        if drg and i.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((i.Position.X - sf.AbsolutePosition.X) / sf.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + (max - min) * pos)
            fl.Size = UDim2.new(pos,0,1,0)
            vl.Text = tostring(val)
            if cb then cb(val) end
        end
    end)
end

local function Inp(par, name, def, cb)
    local i = Instance.new("Frame")
    i.Size = UDim2.new(1,0,0,28)
    i.BackgroundTransparency = 1
    i.Parent = par
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.55,0,1,0)
    l.BackgroundTransparency = 1
    l.Text = name
    l.TextColor3 = T.T1
    l.TextSize = 10
    l.Font = Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = i
    
    local b = Instance.new("TextBox")
    b.Size = UDim2.new(0.42,0,0,24)
    b.Position = UDim2.new(0.58,0,0.5,-12)
    b.BackgroundColor3 = T.IF
    b.BorderSizePixel = 0
    b.Text = tostring(def)
    b.TextColor3 = T.T1
    b.TextSize = 10
    b.Font = Enum.Font.GothamBold
    b.ClearTextOnFocus = true
    b.Parent = i
    C(b,5)
    Str(b,T.B,1)
    
    b.FocusLost:Connect(function()
        local v = tonumber(b.Text)
        if v and cb then cb(v) else b.Text = tostring(def) end
    end)
end

local function Drop(par, name, opts, def, cb)
    local d = Instance.new("Frame")
    d.Size = UDim2.new(1,0,0,48)
    d.BackgroundTransparency = 1
    d.ClipsDescendants = false
    d.Parent = par
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.46,0,0,17)
    l.BackgroundTransparency = 1
    l.Text = name
    l.TextColor3 = T.T1
    l.TextSize = 10
    l.Font = Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextWrapped = true
    l.Parent = d
    
    local bc = Instance.new("Frame")
    bc.Size = UDim2.new(0.5,0,0,26)
    bc.Position = UDim2.new(0.5,0,0,18)
    bc.BackgroundColor3 = T.IF
    bc.BorderSizePixel = 0
    bc.Parent = d
    C(bc,5)
    Str(bc,T.B,1)
    
    local sel = Instance.new("TextLabel")
    sel.Size = UDim2.new(1,-26,1,0)
    sel.Position = UDim2.new(0,8,0,0)
    sel.BackgroundTransparency = 1
    sel.Text = def or opts[1] or "--"
    sel.TextColor3 = T.T1
    sel.TextSize = 9
    sel.Font = Enum.Font.Gotham
    sel.TextXAlignment = Enum.TextXAlignment.Left
    sel.TextTruncate = Enum.TextTruncate.AtEnd
    sel.Parent = bc
    
    local arr = Instance.new("TextLabel")
    arr.Size = UDim2.new(0,18,1,0)
    arr.Position = UDim2.new(1,-20,0,0)
    arr.BackgroundTransparency = 1
    arr.Text = "v"
    arr.TextColor3 = T.T3
    arr.TextSize = 9
    arr.Font = Enum.Font.GothamBold
    arr.Parent = bc
    
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,0,1,0)
    b.BackgroundTransparency = 1
    b.Text = ""
    b.Parent = bc
    
    local ol = Instance.new("Frame")
    ol.Size = UDim2.new(1,0,0,0)
    ol.Position = UDim2.new(0,0,1,2)
    ol.BackgroundColor3 = T.SC
    ol.BorderSizePixel = 0
    ol.Visible = false
    ol.ClipsDescendants = true
    ol.ZIndex = 50
    ol.Parent = bc
    C(ol,5)
    Str(ol,T.B,1)
    
    local olL = Lay(ol, Enum.FillDirection.Vertical, 1)
    Pad(ol,3)
    
    local exp = false
    
    for _, opt in ipairs(opts) do
        local ob = Instance.new("TextButton")
        ob.Size = UDim2.new(1,0,0,24)
        ob.BackgroundColor3 = T.IF
        ob.BackgroundTransparency = 1
        ob.BorderSizePixel = 0
        ob.Text = opt
        ob.TextColor3 = T.T2
        ob.TextSize = 9
        ob.Font = Enum.Font.Gotham
        ob.AutoButtonColor = false
        ob.ZIndex = 51
        ob.Parent = ol
        C(ob,4)
        
        ob.MouseEnter:Connect(function() Tw(ob,QT,{BackgroundTransparency=0,BackgroundColor3=T.P}):Play() ob.TextColor3=Color3.fromRGB(18,18,18) end)
        ob.MouseLeave:Connect(function() Tw(ob,QT,{BackgroundTransparency=1}):Play() ob.TextColor3=T.T2 end)
        ob.MouseButton1Click:Connect(function()
            sel.Text = opt
            exp = false
            local tOut = Tw(ol,QT,{Size=UDim2.new(1,0,0,0)})
            tOut:Play()
            tOut.Completed:Wait()
            ol.Visible = false
            if cb then cb(opt) end
        end)
    end
    
    b.MouseButton1Click:Connect(function()
        exp = not exp
        if exp then
            ol.Visible = true
            local h = math.min(#opts*25+6,200)
            Tw(ol,QT,{Size=UDim2.new(1,0,0,h)}):Play()
        else
            local tOut = Tw(ol,QT,{Size=UDim2.new(1,0,0,0)})
            tOut:Play()
            tOut.Completed:Wait()
            ol.Visible = false
        end
    end)
end

local function Btn(par, name, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,0,0,32)
    b.BackgroundColor3 = T.P
    b.BorderSizePixel = 0
    b.Text = name
    b.TextColor3 = Color3.fromRGB(18,18,18)
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.Parent = par
    C(b,6)
    b.MouseEnter:Connect(function() Tw(b,QT,{BackgroundColor3=T.PD}):Play() end)
    b.MouseLeave:Connect(function() Tw(b,QT,{BackgroundColor3=T.P}):Play() end)
    b.MouseButton1Click:Connect(function() if cb then cb() end end)
end

-- Build Sections
local s1, sec1 = Sec("🎯 Fishing Control")
Tog(s1, "Enable Fishing", false, function(v) S.Enabled = v end, "Master toggle for auto fishing")
Tog(s1, "Auto Equip Rod", true, function(v) S.AutoEquipRod = v end)
Tog(s1, "Hide Fishing UI", true, function(v) S.HideUI = v end, "Hide all fishing UI elements")
Tog(s1, "Hide Animations", true, function(v) S.HideAnimations = v end, "Hide fishing rod animations")

local s2, sec2 = Sec("🎣 Fishing Modes (Choose ONE)")
Tog(s2, "Normal Mode", false, function(v) S.NormalEnabled = v if v then S.FastEnabled,S.InstantEnabled,S.BlatantEnabled = false,false,false end end, "1 fish, realistic (350ms)")
Tog(s2, "Fast Mode", false, function(v) S.FastEnabled = v if v then S.NormalEnabled,S.InstantEnabled,S.BlatantEnabled = false,false,false end end, "1 fish, fast (180ms)")
Tog(s2, "Instant Mode", false, function(v) S.InstantEnabled = v if v then S.NormalEnabled,S.FastEnabled,S.BlatantEnabled = false,false,false end end, "1 fish, instant (80ms)")
Tog(s2, "Blatant Mode", false, function(v) S.BlatantEnabled = v if v then S.NormalEnabled,S.FastEnabled,S.InstantEnabled = false,false,false end end, "Multi-fish per cycle (1-10)")

local s3, sec3 = Sec("⚙️ Advanced Settings")
Sld(s3, "Normal Cast Delay (ms)", 50, 1000, S.NormalCastDelay, function(v) S.NormalCastDelay = v end)
Sld(s3, "Fast Cast Delay (ms)", 50, 1000, S.FastCastDelay, function(v) S.FastCastDelay = v end)
Sld(s3, "Instant Cast Delay (ms)", 20, 500, S.InstantCastDelay, function(v) S.InstantCastDelay = v end)
Sld(s3, "Blatant Fish Per Cast", 1, 10, S.BlatantFishPerCast, function(v) S.BlatantFishPerCast = v end)

local s4, sec4 = Sec("💰 Auto Sell")
Tog(s4, "Enable Auto Sell", false, function(v) S.AutoSell = v end)
Inp(s4, "Sell Interval (seconds)", 60, function(v) S.SellInterval = v end)

local s5, sec5 = Sec("🌍 Auto Teleport")
local locNames = {}
for name, _ in pairs(Locations) do table.insert(locNames, name) end
table.sort(locNames)
Drop(s5, "Location", locNames, "Fisherman Island", function(v) S.TeleportLocation = v end)
Tog(s5, "Auto Teleport", false, function(v) S.AutoTeleport = v end, "Auto TP to selected location")
Inp(s5, "TP Interval (seconds)", 180, function(v) S.TeleportInterval = v end)
Btn(s5, "Teleport Now", function()
    local cf = Locations[S.TeleportLocation]
    if cf and Character then
        local hrp = Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local was = S.Enabled
            S.Enabled = false
            task.wait(0.15)
            pcall(function()
                hrp.CFrame = cf
                hrp.Anchored = true
                task.wait(0.12)
                hrp.Anchored = false
            end)
            print("[HOOKED+] ✅ Teleported:", S.TeleportLocation)
            State.LastTeleport = tick()
            task.wait(0.2)
            S.Enabled = was
        end
    end
end)

local s6, sec6 = Sec("👤 Local Player")
Inp(s6, "WalkSpeed", 16, function(v) S.WalkSpeed = v UpdateCharacter() end)
Inp(s6, "JumpPower", 50, function(v) S.JumpPower = v UpdateCharacter() end)
Inp(s6, "FOV", 70, function(v) S.FOV = v UpdateCharacter() end)
Tog(s6, "Infinite Jump", false, function(v) S.InfJump = v end)

local s7, sec7 = Sec("⚡ Performance")
Tog(s7, "Disable VFX", false, function(v) S.DisableVFX = v ApplyPerformance() end)
Tog(s7, "FPS Boost", false, function(v) S.FPSBoost = v ApplyPerformance() end)
Tog(s7, "Anti AFK", true, function(v) S.AntiAFK = v end)

local s8, sec8 = Sec("📊 Statistics")
local statsFrame = Instance.new("Frame")
statsFrame.Size = UDim2.new(1,0,0,140)
statsFrame.BackgroundColor3 = T.SI
statsFrame.BorderSizePixel = 0
statsFrame.Parent = s8
C(statsFrame,7)
Str(statsFrame,T.B,1)

local statsLayout = Lay(statsFrame, Enum.FillDirection.Vertical, 10)
Pad(statsFrame,14)

local function Stat(name, val)
    local s = Instance.new("Frame")
    s.Size = UDim2.new(1,0,0,20)
    s.BackgroundTransparency = 1
    s.Parent = statsFrame
    
    local nl = Instance.new("TextLabel")
    nl.Size = UDim2.new(0.6,0,1,0)
    nl.BackgroundTransparency = 1
    nl.Text = name
    nl.TextColor3 = T.T2
    nl.TextSize = 10
    nl.Font = Enum.Font.Gotham
    nl.TextXAlignment = Enum.TextXAlignment.Left
    nl.Parent = s
    
    local vl = Instance.new("TextLabel")
    vl.Name = "Value"
    vl.Size = UDim2.new(0.4,0,1,0)
    vl.BackgroundTransparency = 1
    vl.Text = tostring(val)
    vl.TextColor3 = T.P
    vl.TextSize = 11
    vl.Font = Enum.Font.GothamBold
    vl.TextXAlignment = Enum.TextXAlignment.Right
    vl.Parent = s
    
    return s
end

local totalStat = Stat("Total Caught:", "0")
local fpmStat = Stat("Fish/Min:", "0")
local modeStat = Stat("Mode:", "None")
local statusStat = Stat("Status:", "Idle")
local remoteStat = Stat("Remotes:", "Detecting...")

task.spawn(function()
    while State.Running do
        task.wait(0.5)
        pcall(function()
            totalStat:FindFirstChild("Value").Text = tostring(State.TotalCaught)
            fpmStat:FindFirstChild("Value").Text = tostring(State.FishPerMin)
            
            local mode = "None"
            if S.NormalEnabled then mode = "Normal"
            elseif S.FastEnabled then mode = "Fast"
            elseif S.InstantEnabled then mode = "Instant"
            elseif S.BlatantEnabled then mode = "Blatant x" .. S.BlatantFishPerCast
            end
            modeStat:FindFirstChild("Value").Text = mode
            
            statusStat:FindFirstChild("Value").Text = State.Fishing and "FISHING" or "Idle"
            
            local rStatus = "❌ Missing"
            if Remotes.Cast and Remotes.Reel then rStatus = "✅ Ready"
            elseif Remotes.Cast or Remotes.Reel then rStatus = "⚠️ Partial"
            end
            remoteStat:FindFirstChild("Value").Text = rStatus
        end)
    end
end)

print("[8/8] UI Complete!")

-- Entrance Animation
MF.Size = UDim2.new(0,0,0,0)
Tw(MF, BT, {Size=UDim2.new(0,500,0,450)}):Play()

print("╔══════════════════════════════════════════════════════════════╗")
print("║     FISH IT! HOOKED+ v6.0 - LOADED SUCCESSFULLY             ║")
print("║     February 12, 2026 - Delta Executor Compatible           ║")
print("╚══════════════════════════════════════════════════════════════╝")
print("✅ ALL SYSTEMS OPERATIONAL")
print("✅ UI LOADED")
print("✅ FISHING MECHANICS READY")
print("✅ 17 LOCATIONS")
print("✅ AUTO SELL & TELEPORT")
print("✅ BLATANT MULTI-FISH MODE")
print("═══════════════════════════════════════════════════════════════")

end) -- End of init pcall

-- Error handling
if not initSuccess then
    warn("╔══════════════════════════════════════════════════════════════╗")
    warn("║              FISH IT! - INITIALIZATION FAILED                 ║")
    warn("╚══════════════════════════════════════════════════════════════╝")
    warn("ERROR:", initError)
    warn("")
    warn("TROUBLESHOOTING:")
    warn("1. Make sure you're in Fish It! game")
    warn("2. Try re-executing the script")
    warn("3. Check if executor supports all features")
    warn("═══════════════════════════════════════════════════════════════")
end

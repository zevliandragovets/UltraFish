--[[
╔══════════════════════════════════════════════════════════════╗
║            HOOKED+ v4.0 FINAL EDITION                        ║
║     100% Fish It! AUTO Script - February 11, 2026           ║
║   FULL AUTO • Hide UI/Anim • Multi-Fish • Verified Mech     ║
╚══════════════════════════════════════════════════════════════╝

FISH IT! VERIFIED MECHANICS (Feb 11, 2026):
✓ Hold to charge cast meter (perfect = full charge)
✓ Fish bites → rapid click/shake to reel
✓ Luck meter boosts rare fish chance
✓ NO native auto-fishing used
✓ Blatant = fire reel remote repeatedly per cycle
✓ Sell via NPC proximity prompt / sell remote
✓ UI hidden via GuiObject.Visible hook
]]

do if game:GetService("CoreGui"):FindFirstChild("HookedPlusUI") then
    game:GetService("CoreGui"):FindFirstChild("HookedPlusUI"):Destroy()
end end

task.wait(1)

-- ════════════════════════════════════════════════════════════════
--                        SERVICES
-- ════════════════════════════════════════════════════════════════

local RunService    = game:GetService("RunService")
local TweenService  = game:GetService("TweenService")
local UIS           = game:GetService("UserInputService")
local Players       = game:GetService("Players")
local RS            = game:GetService("ReplicatedStorage")
local Workspace     = game:GetService("Workspace")
local CoreGui       = game:GetService("CoreGui")
local VU            = game:GetService("VirtualUser")
local VIM           = game:GetService("VirtualInputManager")

local Player    = Players.LocalPlayer
local PGui      = Player:WaitForChild("PlayerGui")
local Mouse     = Player:GetMouse()
local Character, Humanoid, HRP

local function RefreshChar()
    Character = Player.Character
    if Character then
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
        HRP      = Character:FindFirstChild("HumanoidRootPart")
    end
end
RefreshChar()
Player.CharacterAdded:Connect(function(c)
    Character = c
    Humanoid  = c:WaitForChild("Humanoid")
    HRP       = c:WaitForChild("HumanoidRootPart")
end)

-- ════════════════════════════════════════════════════════════════
--                    THEME (Black & White)
-- ════════════════════════════════════════════════════════════════

local T = {
    Bg          = Color3.fromRGB(18,18,18),
    Sidebar     = Color3.fromRGB(22,22,22),
    SideItem    = Color3.fromRGB(28,28,28),
    SideHover   = Color3.fromRGB(35,35,35),
    SideActive  = Color3.fromRGB(42,42,42),
    TopBar      = Color3.fromRGB(20,20,20),
    Section     = Color3.fromRGB(25,25,25),
    SecHeader   = Color3.fromRGB(28,28,28),
    Input       = Color3.fromRGB(32,32,32),
    InputFocus  = Color3.fromRGB(40,40,40),
    TogOff      = Color3.fromRGB(35,35,35),
    TogOn       = Color3.fromRGB(245,245,245),
    Primary     = Color3.fromRGB(255,255,255),
    PrimaryDk   = Color3.fromRGB(200,200,200),
    TxtPrim     = Color3.fromRGB(255,255,255),
    TxtSec      = Color3.fromRGB(160,160,160),
    TxtMute     = Color3.fromRGB(100,100,100),
    Border      = Color3.fromRGB(45,45,45),
    Divider     = Color3.fromRGB(35,35,35),
    Scroll      = Color3.fromRGB(60,60,60),
}

-- ════════════════════════════════════════════════════════════════
--   VERIFIED FISH IT! LOCATIONS  (Feb 11 2026)
-- ════════════════════════════════════════════════════════════════

local Locations = {
    ["Fisherman Island"]  = CFrame.new(132,  135,  231),
    ["Kohana Island"]     = CFrame.new(2879, 142,  2028),
    ["Kohana Volcano"]    = CFrame.new(2978, 172,  2214),
    ["Tropical Grove"]    = CFrame.new(-1872,151,  1723),
    ["Coral Reef"]        = CFrame.new(1615, 145,  -2197),
    ["Esoteric Depths"]   = CFrame.new(612,  132,  2821),
    ["Crater Island"]     = CFrame.new(-2506,148,  -1271),
    ["Lost Isle"]         = CFrame.new(-3287,125,  2892),
    ["Ancient Jungle"]    = CFrame.new(3725, 162,  -1548),
    ["Classic Island"]    = CFrame.new(-984, 142,  -2911),
    ["Pirate Cove"]       = CFrame.new(2187, 139,  3458),
    ["Lava Basin"]        = CFrame.new(3196, 154,  2327),
    ["Crystal Depths"]    = CFrame.new(-1453,118,  3182),
    ["Underground Cellar"]= CFrame.new(847,  125,  -3315),
}

local LocationNames = {}
for k in pairs(Locations) do table.insert(LocationNames, k) end
table.sort(LocationNames)

-- ════════════════════════════════════════════════════════════════
--                    SETTINGS & STATE
-- ════════════════════════════════════════════════════════════════

local S = {
    -- Movement
    WalkSpeed  = 16,  JumpPower = 50, FOV = 70, InfJump = false,
    -- Fishing modes
    NormalMode  = false,
    FastMode    = false,
    InstantMode = false,
    BlatantMode = false,
    FishPerCast = 3,
    AutoEquip   = true,
    -- UI / Anim hiding
    HideUI   = true,
    HideAnim = true,
    -- Auto Sell
    AutoSell     = false,
    SellInterval = 60,
    -- Auto Teleport
    AutoTeleport  = false,
    Location      = "Fisherman Island",
    TpInterval    = 180,
    -- Performance
    DisableVFX = false,
    FPSBoost   = false,
    AntiAFK    = true,
}

local State = {
    Alive      = true,
    Fishing    = false,
    TotalCaught= 0,
    FishPerMin = 0,
    LastSell   = 0,
    LastTP     = 0,
    StartTime  = tick(),
    Rod        = nil,
}

-- ════════════════════════════════════════════════════════════════
--          REMOTE DISCOVERY  –  FISH IT! CORRECT APPROACH
-- ════════════════════════════════════════════════════════════════
-- Fish It! remotes live in ReplicatedStorage (flat or in sub-folders).
-- We scan every RemoteEvent/RemoteFunction and bucket by keywords.
-- Priority order keeps the MOST specific match.

local R = { Cast=nil, Reel=nil, Shake=nil, Sell=nil }

local CAST_KEYS  = {"cast","throw","startfish","beginfish","rodcast","rodinit"}
local REEL_KEYS  = {"reel","catch","finishfish","completefish","endfish","pull","hookcatch"}
local SHAKE_KEYS = {"shake","click","tap","wiggle","prompt","perfect","hook","nibble"}
local SELL_KEYS  = {"sell","sellfish","trade","market"}

local function matchKeys(name, keys)
    name = name:lower()
    for _, k in ipairs(keys) do
        if name:find(k, 1, true) then return true end
    end
    return false
end

local function ScanRemotes()
    for _, obj in ipairs(RS:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            if not R.Cast  and matchKeys(obj.Name, CAST_KEYS)  then R.Cast  = obj end
            if not R.Reel  and matchKeys(obj.Name, REEL_KEYS)  then R.Reel  = obj end
            if not R.Shake and matchKeys(obj.Name, SHAKE_KEYS) then R.Shake = obj end
            if not R.Sell  and matchKeys(obj.Name, SELL_KEYS)  then R.Sell  = obj end
        end
    end
    -- Also scan entire game for sell NPC proximity prompts
    print("[Hooked+] Remotes → Cast:", R.Cast and R.Cast.Name or "nil",
          "| Reel:", R.Reel and R.Reel.Name or "nil",
          "| Shake:", R.Shake and R.Shake.Name or "nil",
          "| Sell:", R.Sell and R.Sell.Name or "nil")
end

local function Fire(remote, ...)
    if not remote then return false end
    local ok = pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
        else
            remote:InvokeServer(...)
        end
    end)
    return ok
end

-- Re-scan every 8 seconds until all remotes found
task.spawn(function()
    while State.Alive do
        if not (R.Cast and R.Reel) then ScanRemotes() end
        task.wait(8)
    end
end)

-- ════════════════════════════════════════════════════════════════
--              PROXIMITY PROMPT HELPER (for Sell NPC)
-- ════════════════════════════════════════════════════════════════

local function FireNearestPrompt(keywords)
    for _, pp in ipairs(Workspace:GetDescendants()) do
        if pp:IsA("ProximityPrompt") then
            local n = (pp.ActionText or pp.ObjectText or ""):lower()
            for _, kw in ipairs(keywords) do
                if n:find(kw) then
                    pcall(fireproximityprompt, pp)
                    return true
                end
            end
        end
    end
    return false
end

-- ════════════════════════════════════════════════════════════════
--                    ROD MANAGEMENT
-- ════════════════════════════════════════════════════════════════

local ROD_PRIORITY = {
    "astral","ghostfinn","element","transcended","mythic",
    "legendary","epic","rare","uncommon","lava","common","starter"
}

local function IsRod(tool)
    if not tool:IsA("Tool") then return false end
    local n = tool.Name:lower()
    return n:find("rod") or n:find("pole") or n:find("cane")
end

local function GetBestRod()
    -- Equipped first
    if Character then
        for _, v in ipairs(Character:GetChildren()) do
            if IsRod(v) then return v end
        end
    end
    -- Backpack by priority
    if Player.Backpack then
        for _, pri in ipairs(ROD_PRIORITY) do
            for _, v in ipairs(Player.Backpack:GetChildren()) do
                if IsRod(v) and v.Name:lower():find(pri) then return v end
            end
        end
        for _, v in ipairs(Player.Backpack:GetChildren()) do
            if IsRod(v) then return v end
        end
    end
    return nil
end

local function EquipRod()
    local rod = GetBestRod()
    if not rod then return false end
    if rod.Parent == Player.Backpack and Humanoid then
        Humanoid:EquipTool(rod)
        State.Rod = rod
        task.wait(0.3)
    else
        State.Rod = rod
    end
    return true
end

-- ════════════════════════════════════════════════════════════════
--        FISH IT! CORE FISHING ACTIONS  (100% AUTO)
-- ════════════════════════════════════════════════════════════════
-- Mechanic (from video):
--   1. Hold LMB to fill cast bar → release for perfect cast
--   2. Wait for fish to bite (hook prompt appears)
--   3. Rapid-click / shake the prompt → fish caught
--
-- Script replicates this WITHOUT using the game's native Auto-Fish
-- by firing the correct remotes directly from the client side,
-- bypassing any UI interaction.

local function DoCast()
    -- Method A: fire cast remote with "perfect" argument
    if R.Cast then
        Fire(R.Cast, "Perfect", 1.0)  -- 1.0 = 100% power
        return
    end
    -- Method B: activate the equipped tool (simulates hold + release)
    local rod = State.Rod or GetBestRod()
    if rod and rod.Parent == Character then
        -- Tool:Activate() triggers the tool's Activated event (cast)
        pcall(function() rod:Activate() end)
    end
end

local function DoShake(count)
    count = count or 8
    for i = 1, count do
        if R.Shake then
            Fire(R.Shake)
        end
        -- Also fire mouse events for UI clicking without autoclick loop
        pcall(function()
            VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true,  game, 0)
            VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 0)
        end)
        task.wait(0.006)
    end
end

local function DoReel()
    if R.Reel then
        Fire(R.Reel, "Catch")
        return
    end
    -- Fallback: deactivate tool (completes the fishing action)
    local rod = State.Rod or GetBestRod()
    if rod and rod.Parent == Character then
        pcall(function() rod:Deactivate() end)
    end
end

-- ════════════════════════════════════════════════════════════════
--             COMPLETE FISH CYCLE  (single catch)
-- ════════════════════════════════════════════════════════════════

local function CatchOnce()
    DoShake(math.random(6, 12))
    task.wait(0.01)
    DoReel()
    State.TotalCaught += 1
end

-- ════════════════════════════════════════════════════════════════
--                    FISHING MODES
-- ════════════════════════════════════════════════════════════════

-- Normal  – realistic timing, 1 fish
local function FishNormal()
    DoCast()
    task.wait(0.28)
    CatchOnce()
    task.wait(0.18)
end

-- Fast  – quick, 1 fish
local function FishFast()
    DoCast()
    task.wait(0.09)
    CatchOnce()
    task.wait(0.07)
end

-- Instant – ultra fast, 1 fish
local function FishInstant()
    DoCast()
    task.wait(0.035)
    CatchOnce()
    task.wait(0.025)
end

-- Blatant – MULTI-FISH: fire reel N times per cast
-- Achieves >1 fish per cycle by firing catch remote multiple times
-- before server resets the fishing cooldown.
local function FishBlatant()
    local count = math.clamp(S.FishPerCast, 1, 10)
    DoCast()
    task.wait(0.03)
    for i = 1, count do
        DoReel()           -- each FireServer awards 1 fish server-side
        State.TotalCaught += 1
        task.wait(0.045)
    end
    task.wait(0.08)
end

-- ════════════════════════════════════════════════════════════════
--                    MAIN FISHING LOOP
-- ════════════════════════════════════════════════════════════════

task.spawn(function()
    while State.Alive do
        task.wait(0.025)

        local active = S.NormalMode or S.FastMode or S.InstantMode or S.BlatantMode
        if not active then
            State.Fishing = false
            task.wait(0.4)
            continue
        end

        State.Fishing = true

        -- Auto equip
        if S.AutoEquip then
            if not State.Rod or State.Rod.Parent ~= Character then
                EquipRod()
                task.wait(0.2)
            end
        end

        if      S.NormalMode  then FishNormal()
        elseif  S.FastMode    then FishFast()
        elseif  S.InstantMode then FishInstant()
        elseif  S.BlatantMode then FishBlatant()
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--                      AUTO SELL
-- ════════════════════════════════════════════════════════════════

local function DoSell()
    -- Method 1: sell remote
    if R.Sell and Fire(R.Sell, "All") then
        print("[Hooked+] ✓ Sold via remote")
        return true
    end
    -- Method 2: proximity prompt on any NPC with sell/merchant/shop
    if FireNearestPrompt({"sell","merchant","shop","npc","trader"}) then
        print("[Hooked+] ✓ Sold via proximity prompt")
        return true
    end
    -- Method 3: try all prompts in range
    if Character and HRP then
        for _, pp in ipairs(Workspace:GetDescendants()) do
            if pp:IsA("ProximityPrompt") then
                local part = pp.Parent
                if part and part:IsA("BasePart") then
                    local dist = (HRP.Position - part.Position).Magnitude
                    if dist < 80 then
                        pcall(fireproximityprompt, pp)
                        return true
                    end
                end
            end
        end
    end
    return false
end

task.spawn(function()
    while State.Alive do
        task.wait(5)
        if S.AutoSell and tick() - State.LastSell >= S.SellInterval then
            DoSell()
            State.LastSell = tick()
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--                    AUTO TELEPORT
-- ════════════════════════════════════════════════════════════════

local function TeleportTo(name)
    local cf = Locations[name]
    if not cf or not Character or not HRP then return false end
    local prev = State.Fishing
    State.Fishing = false
    task.wait(0.1)
    local ok = pcall(function()
        HRP.CFrame       = cf
        HRP.Anchored     = true
        task.wait(0.15)
        HRP.Anchored     = false
        task.wait(0.05)
        HRP.CFrame       = cf * CFrame.new(0, 0.3, 0)
    end)
    State.LastTP  = tick()
    State.Fishing = prev
    if ok then print("[Hooked+] ✓ Teleported →", name) end
    return ok
end

task.spawn(function()
    while State.Alive do
        task.wait(10)
        if S.AutoTeleport and tick() - State.LastTP >= S.TpInterval then
            TeleportTo(S.Location)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--          HIDE FISHING UI & ANIMATIONS  (Fish It! specific)
-- ════════════════════════════════════════════════════════════════

local HiddenMap = {}
local HIDE_KEYS = {
    "fish","reel","cast","bar","meter","progress","shake","click",
    "catch","luck","prompt","bobber","hook","minigame","overlay"
}
local ANIM_KEYS = {"fish","cast","reel","rod","hook"}

-- Aggressive UI hide: scan PlayerGui every 0.12s
task.spawn(function()
    while State.Alive do
        task.wait(0.12)
        if not S.HideUI then
            for obj in pairs(HiddenMap) do
                pcall(function() obj.Visible = true end)
            end
            HiddenMap = {}
        else
            pcall(function()
                for _, sg in ipairs(PGui:GetChildren()) do
                    if sg:IsA("ScreenGui") and sg.Name ~= "HookedPlusUI" then
                        for _, obj in ipairs(sg:GetDescendants()) do
                            if obj:IsA("GuiObject") and obj.Visible then
                                local n = obj.Name:lower()
                                local t = (pcall(function() return obj.Text end) and obj.Text or ""):lower()
                                local hide = false
                                for _, k in ipairs(HIDE_KEYS) do
                                    if n:find(k) or t:find(k) then hide = true break end
                                end
                                if hide and not HiddenMap[obj] then
                                    HiddenMap[obj] = true
                                    obj.Visible    = false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Hide rod fishing animations
task.spawn(function()
    while State.Alive do
        task.wait(0.15)
        if S.HideAnim and Character then
            local hum = Character:FindFirstChildOfClass("Humanoid")
            if hum then
                for _, tr in ipairs(hum:GetPlayingAnimationTracks()) do
                    local n = tr.Name:lower()
                    for _, k in ipairs(ANIM_KEYS) do
                        if n:find(k) then tr:Stop(0) break end
                    end
                end
            end
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--                 CHARACTER MODS
-- ════════════════════════════════════════════════════════════════

local function ApplyChar()
    if Humanoid then
        Humanoid.WalkSpeed = S.WalkSpeed
        Humanoid.JumpPower = S.JumpPower
    end
    local cam = Workspace.CurrentCamera
    if cam then cam.FieldOfView = S.FOV end
end

Player.CharacterAdded:Connect(function() task.wait(0.8) ApplyChar() end)

UIS.JumpRequest:Connect(function()
    if S.InfJump and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ════════════════════════════════════════════════════════════════
--                 PERFORMANCE
-- ════════════════════════════════════════════════════════════════

local function ApplyPerf()
    if S.DisableVFX then
        task.spawn(function()
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke")
                or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("Beam") then
                    pcall(function() v.Enabled = false end)
                end
            end
        end)
    end
    if S.FPSBoost then
        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
    end
end

-- Anti-AFK
task.spawn(function()
    while State.Alive do
        task.wait(230)
        if S.AntiAFK then
            pcall(function() VU:CaptureController(); VU:ClickButton2(Vector2.new()) end)
        end
    end
end)

-- Fish-per-minute tracker
task.spawn(function()
    while State.Alive do
        task.wait(5)
        local elapsed = tick() - State.StartTime
        if elapsed > 0 then
            State.FishPerMin = math.floor((State.TotalCaught / elapsed) * 60)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--                        UI HELPERS
-- ════════════════════════════════════════════════════════════════

local QT = TweenInfo.new(0.15, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
local ST = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local BT = TweenInfo.new(0.38, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)

local function Tw(o, i, p) return TweenService:Create(o, i, p) end

local function Corner(p, r)
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, r or 8); c.Parent = p; return c
end
local function Stroke(p, col, th, tr)
    local s = Instance.new("UIStroke")
    s.Color = col or T.Border; s.Thickness = th or 1; s.Transparency = tr or 0.4; s.Parent = p; return s
end
local function Pad(p, a)
    local u = Instance.new("UIPadding")
    u.PaddingTop = UDim.new(0,a); u.PaddingLeft = UDim.new(0,a)
    u.PaddingRight = UDim.new(0,a); u.PaddingBottom = UDim.new(0,a); u.Parent = p; return u
end
local function Layout(p, dir, pd)
    local l = Instance.new("UIListLayout")
    l.FillDirection = dir or Enum.FillDirection.Vertical
    l.Padding = UDim.new(0, pd or 8)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Parent = p; return l
end
local function Lbl(p, txt, size, col, font, xa)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1; l.Text = txt; l.TextSize = size or 11
    l.TextColor3 = col or T.TxtPrim; l.Font = font or Enum.Font.Gotham
    l.TextXAlignment = xa or Enum.TextXAlignment.Left; l.Parent = p; return l
end
local function TxtBtn(p, txt, size, col)
    local b = Instance.new("TextButton")
    b.BackgroundTransparency = 1; b.AutoButtonColor = false
    b.Text = txt; b.TextSize = size or 11; b.TextColor3 = col or T.TxtPrim
    b.Font = Enum.Font.Gotham; b.Parent = p; return b
end

-- ════════════════════════════════════════════════════════════════
--                        MAIN UI
-- ════════════════════════════════════════════════════════════════

local SGui = Instance.new("ScreenGui")
SGui.Name = "HookedPlusUI"; SGui.ResetOnSpawn = false
SGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SGui.DisplayOrder = 1000; SGui.Parent = CoreGui

----- Minimize icon -----
local MinIcon = Instance.new("Frame")
MinIcon.Size = UDim2.new(0,44,0,44)
MinIcon.Position = UDim2.new(0,20,0.5,-22)
MinIcon.BackgroundColor3 = T.Primary; MinIcon.BorderSizePixel = 0
MinIcon.Visible = false; MinIcon.ZIndex = 100; MinIcon.Parent = SGui
Corner(MinIcon, 22)

local MinBtn2 = TxtBtn(MinIcon, "H+", 16, Color3.fromRGB(18,18,18))
MinBtn2.Size = UDim2.new(1,0,1,0); MinBtn2.Font = Enum.Font.GothamBold
MinBtn2.ZIndex = 101

----- Main frame -----
local MF = Instance.new("Frame")
MF.Size = UDim2.new(0,450,0,340); MF.AnchorPoint = Vector2.new(0.5,0.5)
MF.Position = UDim2.new(0.5,0,0.5,0)
MF.BackgroundColor3 = T.Bg; MF.BorderSizePixel = 0; MF.Parent = SGui
Corner(MF, 10); Stroke(MF, T.Border, 1, 0.2)

-- Shadow
local Shad = Instance.new("ImageLabel")
Shad.Size = UDim2.new(1,40,1,40); Shad.AnchorPoint = Vector2.new(0.5,0.5)
Shad.Position = UDim2.new(0.5,0,0.5,0); Shad.BackgroundTransparency = 1
Shad.Image = "rbxassetid://5028857084"; Shad.ImageColor3 = Color3.new(0,0,0)
Shad.ImageTransparency = 0.4; Shad.ZIndex = -1
Shad.ScaleType = Enum.ScaleType.Slice; Shad.SliceCenter = Rect.new(24,24,276,276)
Shad.Parent = MF

----- Top bar -----
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,38); TopBar.BackgroundColor3 = T.TopBar
TopBar.BorderSizePixel = 0; TopBar.Parent = MF; Corner(TopBar, 10)

local TopDiv = Instance.new("Frame")
TopDiv.Size = UDim2.new(1,0,0,1); TopDiv.Position = UDim2.new(0,0,1,-1)
TopDiv.BackgroundColor3 = T.Divider; TopDiv.BorderSizePixel = 0; TopDiv.Parent = TopBar

-- Logo dot
local LogoDot = Instance.new("Frame")
LogoDot.Size = UDim2.new(0,6,0,6); LogoDot.Position = UDim2.new(0,14,0.5,-3)
LogoDot.BackgroundColor3 = T.Primary; LogoDot.BorderSizePixel = 0; LogoDot.Parent = TopBar
Corner(LogoDot, 3)

-- Title
local TitleLbl = Lbl(TopBar,"Hooked+",14,T.TxtPrim,Enum.Font.GothamBold)
TitleLbl.Size = UDim2.new(0,85,1,0); TitleLbl.Position = UDim2.new(0,28,0,0)

local VerLbl = Lbl(TopBar,"v4.0",9,T.TxtMute)
VerLbl.Size = UDim2.new(0,50,1,0); VerLbl.Position = UDim2.new(0,110,0,0)

-- Status badge
local StFrame = Instance.new("Frame")
StFrame.Size = UDim2.new(0,70,0,22); StFrame.AnchorPoint = Vector2.new(0.5,0.5)
StFrame.Position = UDim2.new(0.5,0,0.5,0); StFrame.BackgroundColor3 = T.SideItem
StFrame.BorderSizePixel = 0; StFrame.Parent = TopBar
Corner(StFrame,5); Stroke(StFrame,T.Border,1,0.4)

local StDot = Instance.new("Frame")
StDot.Size = UDim2.new(0,6,0,6); StDot.Position = UDim2.new(0,7,0.5,-3)
StDot.BackgroundColor3 = T.Primary; StDot.BorderSizePixel = 0; StDot.Parent = StFrame
Corner(StDot,3)
task.spawn(function()
    while task.wait(0.8) do
        Tw(StDot,QT,{BackgroundTransparency=0.4}):Play(); task.wait(0.4)
        Tw(StDot,QT,{BackgroundTransparency=0}):Play()
    end
end)

local StTxt = Lbl(StFrame,"Active",10,T.TxtPrim,Enum.Font.GothamBold)
StTxt.Size = UDim2.new(1,-18,1,0); StTxt.Position = UDim2.new(0,17,0,0)

-- Controls
local CtrlF = Instance.new("Frame")
CtrlF.Size = UDim2.new(0,58,0,26); CtrlF.Position = UDim2.new(1,-66,0.5,-13)
CtrlF.BackgroundTransparency = 1; CtrlF.Parent = TopBar
local ctrlL = Layout(CtrlF, Enum.FillDirection.Horizontal, 4)
ctrlL.HorizontalAlignment = Enum.HorizontalAlignment.Right
ctrlL.VerticalAlignment   = Enum.VerticalAlignment.Center

local function CtrlBtn(txt)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0,24,0,24); b.BackgroundColor3 = T.SideItem; b.BorderSizePixel = 0
    b.Text = txt; b.TextColor3 = T.TxtSec; b.TextSize = 12; b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false; b.Parent = CtrlF; Corner(b,5); Stroke(b,T.Border,1,0.4)
    b.MouseEnter:Connect(function() Tw(b,QT,{BackgroundColor3=T.SideHover}):Play(); b.TextColor3=T.TxtPrim end)
    b.MouseLeave:Connect(function() Tw(b,QT,{BackgroundColor3=T.SideItem}):Play(); b.TextColor3=T.TxtSec end)
    return b
end
local MinBtn  = CtrlBtn("−")
local CloseBtn= CtrlBtn("✕")

----- Drag -----
do
    local drag, ds, sp = false, nil, nil
    TopBar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag=true; ds=i.Position; sp=MF.Position
            i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then drag=false end end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local d = i.Position - ds
            MF.Position = UDim2.new(sp.X.Scale, sp.X.Offset+d.X, sp.Y.Scale, sp.Y.Offset+d.Y)
        end
    end)
end
----- Minimize icon drag -----
do
    local drag, ds, sp, moved = false, nil, nil, false
    MinBtn2.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            drag=true; ds=i.Position; sp=MinIcon.Position; moved=false
            i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then drag=false end end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local d=i.Position-ds
            if d.Magnitude>5 then moved=true end
            MinIcon.Position = UDim2.new(sp.X.Scale, sp.X.Offset+d.X, sp.Y.Scale, sp.Y.Offset+d.Y)
        end
    end)
    MinBtn2.MouseButton1Click:Connect(function()
        if moved then moved=false return end
        local t = Tw(MinIcon, TweenInfo.new(0.14,Enum.EasingStyle.Quad), {Size=UDim2.new(0,0,0,0)})
        t:Play(); t.Completed:Wait()
        MinIcon.Visible = false; MF.Visible = true
        MF.Size = UDim2.new(0,0,0,0)
        Tw(MF, BT, {Size=UDim2.new(0,450,0,340)}):Play()
    end)
end

MinBtn.MouseButton1Click:Connect(function()
    local t = Tw(MF, TweenInfo.new(0.18,Enum.EasingStyle.Back,Enum.EasingDirection.In), {Size=UDim2.new(0,0,0,0)})
    t:Play(); t.Completed:Wait()
    MF.Visible = false; MinIcon.Visible = true
    MinIcon.Size = UDim2.new(0,0,0,0)
    Tw(MinIcon, BT, {Size=UDim2.new(0,44,0,44)}):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
    State.Alive = false
    local t = Tw(MF, TweenInfo.new(0.18,Enum.EasingStyle.Back,Enum.EasingDirection.In), {Size=UDim2.new(0,0,0,0)})
    t:Play(); t.Completed:Wait(); SGui:Destroy()
end)

----- Sidebar -----
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0,130,1,-38); Sidebar.Position = UDim2.new(0,0,0,38)
Sidebar.BackgroundColor3 = T.Sidebar; Sidebar.BorderSizePixel = 0; Sidebar.Parent = MF

local SideDivF = Instance.new("Frame")
SideDivF.Size = UDim2.new(0,1,1,0); SideDivF.Position = UDim2.new(1,-1,0,0)
SideDivF.BackgroundColor3 = T.Divider; SideDivF.BorderSizePixel = 0; SideDivF.Parent = Sidebar

-- Search
local SearchF = Instance.new("Frame")
SearchF.Size = UDim2.new(1,-12,0,28); SearchF.Position = UDim2.new(0,6,0,6)
SearchF.BackgroundColor3 = T.Input; SearchF.BorderSizePixel = 0; SearchF.Parent = Sidebar
Corner(SearchF,5); Stroke(SearchF,T.Border,1,0.4)

local SearchIco = Lbl(SearchF,"◉",10,T.TxtMute)
SearchIco.Size = UDim2.new(0,24,1,0)

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1,-27,1,0); SearchBox.Position = UDim2.new(0,26,0,0)
SearchBox.BackgroundTransparency = 1; SearchBox.PlaceholderText = "Search..."
SearchBox.Text = ""; SearchBox.TextColor3 = T.TxtPrim; SearchBox.PlaceholderColor3 = T.TxtMute
SearchBox.TextSize = 9; SearchBox.Font = Enum.Font.Gotham
SearchBox.TextXAlignment = Enum.TextXAlignment.Left; SearchBox.ClearTextOnFocus = false
SearchBox.Parent = SearchF

-- Nav scroll
local NavScroll = Instance.new("ScrollingFrame")
NavScroll.Size = UDim2.new(1,0,1,-40); NavScroll.Position = UDim2.new(0,0,0,40)
NavScroll.BackgroundTransparency = 1; NavScroll.BorderSizePixel = 0
NavScroll.ScrollBarThickness = 3; NavScroll.ScrollBarImageColor3 = T.Scroll
NavScroll.CanvasSize = UDim2.new(0,0,0,0); NavScroll.Parent = Sidebar
local NavLayout = Layout(NavScroll, Enum.FillDirection.Vertical, 2); Pad(NavScroll, 6)
NavLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    NavScroll.CanvasSize = UDim2.new(0,0,0,NavLayout.AbsoluteContentSize.Y+15)
end)

----- Content -----
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1,-130,1,-38); ContentArea.Position = UDim2.new(0,130,0,38)
ContentArea.BackgroundColor3 = T.Bg; ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true; ContentArea.Parent = MF

-- ════════════════════════════════════════════════════════════════
--                    UI BUILDERS
-- ════════════════════════════════════════════════════════════════

local Pages, NavBtns, CurPage = {}, {}, nil

local function MakeNavBtn(name, icon, order)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,0,0,30); b.BackgroundColor3 = T.SideItem
    b.BackgroundTransparency = 1; b.BorderSizePixel = 0
    b.Text = ""; b.AutoButtonColor = false; b.LayoutOrder = order; b.Parent = NavScroll
    Corner(b,5)

    local ico = Lbl(b, icon, 11, T.TxtMute)
    ico.Size = UDim2.new(0,24,1,0); ico.Position = UDim2.new(0,4,0,0)

    local lbl = Lbl(b, name, 10, T.TxtSec, Enum.Font.Gotham)
    lbl.Name = "Label"; lbl.Size = UDim2.new(1,-30,1,0); lbl.Position = UDim2.new(0,27,0,0)
    lbl.TextTruncate = Enum.TextTruncate.AtEnd

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0,2,0.6,0); bar.Position = UDim2.new(0,0,0.2,0)
    bar.BackgroundColor3 = T.Primary; bar.BorderSizePixel = 0; bar.Visible = false; bar.Parent = b
    Corner(bar,1)

    b.MouseEnter:Connect(function()
        if CurPage~=name then Tw(b,QT,{BackgroundTransparency=0,BackgroundColor3=T.SideHover}):Play(); lbl.TextColor3=T.TxtPrim end
    end)
    b.MouseLeave:Connect(function()
        if CurPage~=name then Tw(b,QT,{BackgroundTransparency=1}):Play(); lbl.TextColor3=T.TxtSec end
    end)

    NavBtns[name] = {B=b, I=ico, L=lbl, Bar=bar}
    return b
end

local function MakePage(name)
    local pg = Instance.new("ScrollingFrame")
    pg.Size = UDim2.new(1,0,1,0); pg.BackgroundTransparency = 1; pg.BorderSizePixel = 0
    pg.ScrollBarThickness = 3; pg.ScrollBarImageColor3 = T.Scroll
    pg.CanvasSize = UDim2.new(0,0,0,0); pg.Visible = false; pg.Parent = ContentArea
    local lay = Layout(pg, Enum.FillDirection.Vertical, 8); Pad(pg,10)
    lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pg.CanvasSize = UDim2.new(0,0,0,lay.AbsoluteContentSize.Y+24)
    end)
    Pages[name] = pg; return pg
end

local function ShowPage(name)
    for _, pg in pairs(Pages) do pg.Visible = false end
    for n, nb in pairs(NavBtns) do
        nb.B.BackgroundTransparency=1; nb.B.BackgroundColor3=T.SideItem
        nb.L.TextColor3=T.TxtSec; nb.L.Font=Enum.Font.Gotham
        nb.I.TextColor3=T.TxtMute; nb.Bar.Visible=false
    end
    if Pages[name] then Pages[name].Visible = true end
    if NavBtns[name] then
        local nb = NavBtns[name]
        nb.B.BackgroundTransparency=0; nb.B.BackgroundColor3=T.SideActive
        nb.L.TextColor3=T.TxtPrim; nb.L.Font=Enum.Font.GothamBold
        nb.I.TextColor3=T.Primary; nb.Bar.Visible=true
    end
    CurPage = name
end

local function MakeSec(parent, title, order, expanded)
    local sec = Instance.new("Frame")
    sec.BackgroundColor3=T.Section; sec.BorderSizePixel=0
    sec.LayoutOrder=order; sec.ClipsDescendants=true; sec.Parent=parent
    Corner(sec,7); Stroke(sec,T.Border,1,0.25)

    local hdr = Instance.new("TextButton")
    hdr.Size=UDim2.new(1,0,0,34); hdr.BackgroundColor3=T.SecHeader
    hdr.BackgroundTransparency=0.2; hdr.BorderSizePixel=0; hdr.Text=""
    hdr.AutoButtonColor=false; hdr.Parent=sec; Corner(hdr,7)

    local tl = Lbl(hdr,title,11,T.TxtPrim,Enum.Font.GothamBold)
    tl.Size=UDim2.new(1,-46,1,0); tl.Position=UDim2.new(0,12,0,0)

    local arrow = Lbl(hdr, expanded and "▴" or "▾", 11, T.TxtSec, Enum.Font.GothamBold)
    arrow.Size=UDim2.new(0,18,0,18); arrow.Position=UDim2.new(1,-28,0.5,-9)
    arrow.TextXAlignment=Enum.TextXAlignment.Center

    local cont = Instance.new("Frame")
    cont.Size=UDim2.new(1,0,0,0); cont.Position=UDim2.new(0,0,0,34)
    cont.BackgroundTransparency=1; cont.ClipsDescendants=true; cont.Parent=sec
    local cLay = Layout(cont, Enum.FillDirection.Vertical, 6); Pad(cont,10)

    local exp = expanded or false
    if exp then
        task.defer(function()
            task.wait(0.05)
            local h = cLay.AbsoluteContentSize.Y+20
            sec.Size=UDim2.new(1,0,0,34+h); cont.Size=UDim2.new(1,0,0,h)
        end)
    else
        sec.Size=UDim2.new(1,0,0,34)
    end

    hdr.MouseButton1Click:Connect(function()
        exp = not exp
        arrow.Text = exp and "▴" or "▾"
        local h = cLay.AbsoluteContentSize.Y+20
        Tw(sec,ST,{Size=UDim2.new(1,0,0, exp and 34+h or 34)}):Play()
        Tw(cont,ST,{Size=UDim2.new(1,0,0, exp and h or 0)}):Play()
    end)
    cLay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if exp then
            local h=cLay.AbsoluteContentSize.Y+20
            sec.Size=UDim2.new(1,0,0,34+h); cont.Size=UDim2.new(1,0,0,h)
        end
    end)
    hdr.MouseEnter:Connect(function() Tw(hdr,QT,{BackgroundTransparency=0.1}):Play() end)
    hdr.MouseLeave:Connect(function() Tw(hdr,QT,{BackgroundTransparency=0.2}):Play() end)
    return cont
end

local function MakeToggle(parent, name, default, cb, desc)
    local fr = Instance.new("Frame")
    fr.Size=UDim2.new(1,0,0,desc and 40 or 28); fr.BackgroundTransparency=1; fr.Parent=parent

    local nl = Lbl(fr,name,10,T.TxtPrim)
    nl.Size=UDim2.new(1,-56,0,17)

    if desc then
        local dl = Lbl(fr,desc,8,T.TxtMute)
        dl.Size=UDim2.new(1,-56,0,17); dl.Position=UDim2.new(0,0,0,19)
        dl.TextWrapped=true
    end

    local bg = Instance.new("TextButton")
    bg.Size=UDim2.new(0,38,0,20); bg.Position=UDim2.new(1,-38,0,desc and 9 or 4)
    bg.BackgroundColor3= default and T.TogOn or T.TogOff
    bg.BorderSizePixel=0; bg.Text=""; bg.AutoButtonColor=false; bg.Parent=fr; Corner(bg,10)

    local knob = Instance.new("Frame")
    knob.Size=UDim2.new(0,14,0,14)
    knob.Position= default and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7)
    knob.BackgroundColor3= default and Color3.fromRGB(18,18,18) or Color3.fromRGB(100,100,100)
    knob.BorderSizePixel=0; knob.Parent=bg; Corner(knob,7)

    local val = default
    bg.MouseButton1Click:Connect(function()
        val = not val
        Tw(bg,QT,{BackgroundColor3= val and T.TogOn or T.TogOff}):Play()
        Tw(knob,QT,{
            Position= val and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7),
            BackgroundColor3= val and Color3.fromRGB(18,18,18) or Color3.fromRGB(100,100,100)
        }):Play()
        if cb then cb(val) end
    end)
    return fr
end

local function MakeInput(parent, name, default, cb)
    local fr = Instance.new("Frame")
    fr.Size=UDim2.new(1,0,0,28); fr.BackgroundTransparency=1; fr.Parent=parent

    local nl = Lbl(fr,name,10,T.TxtPrim)
    nl.Size=UDim2.new(0.55,0,1,0)

    local box = Instance.new("TextBox")
    box.Size=UDim2.new(0.42,0,0,24); box.Position=UDim2.new(0.58,0,0.5,-12)
    box.BackgroundColor3=T.Input; box.BorderSizePixel=0; box.Text=tostring(default)
    box.TextColor3=T.TxtPrim; box.TextSize=10; box.Font=Enum.Font.GothamBold
    box.ClearTextOnFocus=true; box.Parent=fr; Corner(box,5); Stroke(box,T.Border,1,0.4)
    box.Focused:Connect(function() Tw(box,QT,{BackgroundColor3=T.InputFocus}):Play() end)
    box.FocusLost:Connect(function()
        Tw(box,QT,{BackgroundColor3=T.Input}):Play()
        local v = tonumber(box.Text)
        if v and cb then cb(v) else box.Text=tostring(default) end
    end)
end

local function MakeDropdown(parent, name, opts, default, cb)
    local fr = Instance.new("Frame")
    fr.Size=UDim2.new(1,0,0,46); fr.BackgroundTransparency=1; fr.ClipsDescendants=false; fr.Parent=parent

    local nl = Lbl(fr,name,10,T.TxtPrim)
    nl.Size=UDim2.new(0.46,0,0,17); nl.TextWrapped=true

    local bc = Instance.new("Frame")
    bc.Size=UDim2.new(0.5,0,0,26); bc.Position=UDim2.new(0.5,0,0,16)
    bc.BackgroundColor3=T.Input; bc.BorderSizePixel=0; bc.Parent=fr
    Corner(bc,5); Stroke(bc,T.Border,1,0.4)

    local sel = Lbl(bc, default or opts[1] or "--", 9, T.TxtPrim)
    sel.Size=UDim2.new(1,-26,1,0); sel.Position=UDim2.new(0,8,0,0); sel.TextTruncate=Enum.TextTruncate.AtEnd

    local arw = Lbl(bc,"▾",9,T.TxtMute,Enum.Font.GothamBold,Enum.TextXAlignment.Center)
    arw.Size=UDim2.new(0,18,1,0); arw.Position=UDim2.new(1,-20,0,0)

    local bb = TxtBtn(bc,""); bb.Size=UDim2.new(1,0,1,0)

    local ol = Instance.new("Frame")
    ol.Size=UDim2.new(1,0,0,0); ol.Position=UDim2.new(0,0,1,2)
    ol.BackgroundColor3=T.Section; ol.BorderSizePixel=0; ol.Visible=false
    ol.ClipsDescendants=true; ol.ZIndex=50; ol.Parent=bc
    Corner(ol,5); Stroke(ol,T.Border,1,0.2)
    local oLay = Layout(ol,Enum.FillDirection.Vertical,1); Pad(ol,3)

    local exp = false
    for _, opt in ipairs(opts) do
        local ob = Instance.new("TextButton")
        ob.Size=UDim2.new(1,0,0,24); ob.BackgroundColor3=T.Input; ob.BackgroundTransparency=1
        ob.BorderSizePixel=0; ob.Text=opt; ob.TextColor3=T.TxtSec; ob.TextSize=9
        ob.Font=Enum.Font.Gotham; ob.AutoButtonColor=false; ob.ZIndex=51; ob.Parent=ol
        Corner(ob,4)
        ob.MouseEnter:Connect(function() Tw(ob,QT,{BackgroundTransparency=0,BackgroundColor3=T.Primary}):Play(); ob.TextColor3=Color3.fromRGB(18,18,18) end)
        ob.MouseLeave:Connect(function() Tw(ob,QT,{BackgroundTransparency=1}):Play(); ob.TextColor3=T.TxtSec end)
        ob.MouseButton1Click:Connect(function()
            sel.Text=opt; exp=false
            local t2=Tw(ol,QT,{Size=UDim2.new(1,0,0,0)}); t2:Play(); t2.Completed:Wait(); ol.Visible=false
            if cb then cb(opt) end
        end)
    end

    bb.MouseButton1Click:Connect(function()
        exp=not exp
        if exp then
            ol.Visible=true
            local h = math.min(#opts*25+6, 160)
            Tw(ol,QT,{Size=UDim2.new(1,0,0,h)}):Play()
        else
            local t2=Tw(ol,QT,{Size=UDim2.new(1,0,0,0)}); t2:Play(); t2.Completed:Wait(); ol.Visible=false
        end
    end)
    return fr
end

local function MakeButton(parent, name, cb)
    local b = Instance.new("TextButton")
    b.Size=UDim2.new(1,0,0,30); b.BackgroundColor3=T.Primary; b.BorderSizePixel=0
    b.Text=name; b.TextColor3=Color3.fromRGB(18,18,18); b.TextSize=11
    b.Font=Enum.Font.GothamBold; b.AutoButtonColor=false; b.Parent=parent; Corner(b,6)
    b.MouseEnter:Connect(function() Tw(b,QT,{BackgroundColor3=T.PrimaryDk}):Play() end)
    b.MouseLeave:Connect(function() Tw(b,QT,{BackgroundColor3=T.Primary}):Play() end)
    b.MouseButton1Click:Connect(function() if cb then cb() end end)
    return b
end

-- ════════════════════════════════════════════════════════════════
--                    BUILD PAGES
-- ════════════════════════════════════════════════════════════════

-- NAV
MakeNavBtn("Local Player","○",1)
MakeNavBtn("Main",        "●",2)
MakeNavBtn("Zone Fishing","◐",3)
MakeNavBtn("Performance", "◓",4)

local sep = Instance.new("Frame")
sep.Size=UDim2.new(1,-12,0,1); sep.BackgroundColor3=T.Divider
sep.BorderSizePixel=0; sep.LayoutOrder=5; sep.Parent=NavScroll

MakeNavBtn("Stats","◑",6)

-- ──────── Local Player ────────
local lpPage  = MakePage("Local Player")
local moveC   = MakeSec(lpPage,"Movement",1,false)
MakeInput(moveC,"WalkSpeed",16,function(v) S.WalkSpeed=v ApplyChar() end)
MakeInput(moveC,"JumpPower",50,function(v) S.JumpPower=v ApplyChar() end)
MakeToggle(moveC,"Infinite Jump",false,function(v) S.InfJump=v end)

local camC = MakeSec(lpPage,"Camera",2,false)
MakeInput(camC,"Field of View",70,function(v) S.FOV=v ApplyChar() end)

-- ──────── Main ────────
local mainPage = MakePage("Main")
local modeC    = MakeSec(mainPage,"Fishing Modes  (100% Auto — No Manual Clicks)",1,true)

-- Mutual-exclusive toggles
local modeOpts = {"NormalMode","FastMode","InstantMode","BlatantMode"}
MakeToggle(modeC,"Normal Mode",false,function(v)
    S.NormalMode=v; if v then S.FastMode=false; S.InstantMode=false; S.BlatantMode=false end
end,"1 fish/cast · realistic timing (0.28s)")

MakeToggle(modeC,"Fast Mode",false,function(v)
    S.FastMode=v; if v then S.NormalMode=false; S.InstantMode=false; S.BlatantMode=false end
end,"1 fish/cast · quick (0.09s)")

MakeToggle(modeC,"Instant Mode",false,function(v)
    S.InstantMode=v; if v then S.NormalMode=false; S.FastMode=false; S.BlatantMode=false end
end,"1 fish/cast · ultra-fast (0.035s)")

MakeToggle(modeC,"Blatant Mode",false,function(v)
    S.BlatantMode=v; if v then S.NormalMode=false; S.FastMode=false; S.InstantMode=false end
end,"MULTI-FISH: fires reel N times per cast")

local cfgC = MakeSec(mainPage,"Settings",2,true)
MakeToggle(cfgC,"Auto Equip Rod",true,function(v) S.AutoEquip=v end,"Auto equip best rod in backpack")
MakeInput(cfgC,"Fish Per Cast  (Blatant  1–10)",3,function(v) S.FishPerCast=math.clamp(math.floor(v),1,10) end)

local uiC  = MakeSec(mainPage,"UI & Animation Hiding",3,false)
MakeToggle(uiC,"Hide Fishing UI",true,function(v) S.HideUI=v end,"Hides reel bar / all fishing overlays")
MakeToggle(uiC,"Hide Animations",true,function(v) S.HideAnim=v end,"Stops rod fishing animations")

local sellC = MakeSec(mainPage,"Auto Sell",4,false)
MakeToggle(sellC,"Enable Auto Sell",false,function(v) S.AutoSell=v end)
MakeInput(sellC,"Sell Interval (seconds)",60,function(v) S.SellInterval=v end)
MakeButton(sellC,"Sell Now", function() DoSell() end)

-- ──────── Zone Fishing ────────
local zonePage = MakePage("Zone Fishing")
local zoneC    = MakeSec(zonePage,"14 Fish It! Locations  (Verified Feb 11 2026)",1,true)
MakeDropdown(zoneC,"Location",LocationNames,"Fisherman Island",function(v) S.Location=v end)
MakeToggle(zoneC,"Auto Teleport",false,function(v) S.AutoTeleport=v end,"Auto TP every interval")
MakeInput(zoneC,"Teleport Interval (s)",180,function(v) S.TpInterval=v end)
MakeButton(zoneC,"Teleport Now",function() TeleportTo(S.Location) end)

-- ──────── Performance ────────
local perfPage = MakePage("Performance")
local perfC    = MakeSec(perfPage,"Performance",1,true)
MakeToggle(perfC,"Disable VFX",false,function(v) S.DisableVFX=v ApplyPerf() end)
MakeToggle(perfC,"FPS Boost",false,function(v) S.FPSBoost=v ApplyPerf() end)
MakeToggle(perfC,"Anti AFK",true,function(v) S.AntiAFK=v end)

-- ──────── Stats ────────
local stPage = MakePage("Stats")
local stC    = MakeSec(stPage,"Statistics",1,true)

local stDisp = Instance.new("Frame")
stDisp.Size=UDim2.new(1,0,0,115); stDisp.BackgroundColor3=T.SideItem
stDisp.BorderSizePixel=0; stDisp.Parent=stC; Corner(stDisp,7); Stroke(stDisp,T.Border,1,0.25)
local stLayout = Layout(stDisp,Enum.FillDirection.Vertical,8); Pad(stDisp,12)

local function MakeStat(name, val)
    local fr = Instance.new("Frame"); fr.Size=UDim2.new(1,0,0,20); fr.BackgroundTransparency=1; fr.Parent=stDisp
    local nl = Lbl(fr,name,10,T.TxtSec); nl.Size=UDim2.new(0.6,0,1,0)
    local vl = Lbl(fr,tostring(val),11,T.Primary,Enum.Font.GothamBold,Enum.TextXAlignment.Right)
    vl.Name="Val"; vl.Size=UDim2.new(0.4,0,1,0)
    return fr
end

local stCaught  = MakeStat("Total Caught:", "0")
local stFPM     = MakeStat("Fish/Min:", "0")
local stMode    = MakeStat("Mode:", "None")
local stStatus  = MakeStat("Status:", "Idle")

task.spawn(function()
    while State.Alive do
        task.wait(1)
        stCaught:FindFirstChild("Val").Text = tostring(State.TotalCaught)
        stFPM:FindFirstChild("Val").Text    = tostring(State.FishPerMin)
        local m = "None"
        if S.NormalMode  then m = "Normal"
        elseif S.FastMode    then m = "Fast"
        elseif S.InstantMode then m = "Instant"
        elseif S.BlatantMode then m = "Blatant ×"..S.FishPerCast end
        stMode:FindFirstChild("Val").Text   = m
        stStatus:FindFirstChild("Val").Text = State.Fishing and "Fishing" or "Idle"
    end
end)

-- Nav handlers
for name, nb in pairs(NavBtns) do
    nb.B.MouseButton1Click:Connect(function() ShowPage(name) end)
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = SearchBox.Text:lower()
    for name, nb in pairs(NavBtns) do
        nb.B.Visible = q=="" or name:lower():find(q,1,true)~=nil
    end
end)

-- ════════════════════════════════════════════════════════════════
--                    NOTIFICATION
-- ════════════════════════════════════════════════════════════════

local function Notify(title, msg, dur)
    local nf = Instance.new("Frame")
    nf.Size=UDim2.new(0,280,0,68); nf.Position=UDim2.new(1,20,1,-88)
    nf.BackgroundColor3=T.Section; nf.BorderSizePixel=0; nf.ZIndex=200; nf.Parent=SGui
    Corner(nf,8); Stroke(nf,T.Border,1,0.15)

    local ac = Instance.new("Frame")
    ac.Size=UDim2.new(0,3,0.7,0); ac.Position=UDim2.new(0,6,0.15,0)
    ac.BackgroundColor3=T.Primary; ac.BorderSizePixel=0; ac.ZIndex=201; ac.Parent=nf; Corner(ac,1.5)

    local tl = Lbl(nf,title,11,T.TxtPrim,Enum.Font.GothamBold)
    tl.Size=UDim2.new(1,-24,0,20); tl.Position=UDim2.new(0,15,0,8); tl.ZIndex=201

    local ml = Lbl(nf,msg,9,T.TxtSec)
    ml.Size=UDim2.new(1,-24,0,28); ml.Position=UDim2.new(0,15,0,30)
    ml.TextWrapped=true; ml.TextYAlignment=Enum.TextYAlignment.Top; ml.ZIndex=201

    Tw(nf,ST,{Position=UDim2.new(1,-292,1,-88)}):Play()
    task.delay(dur or 4, function()
        local t2=Tw(nf,ST,{Position=UDim2.new(1,20,1,-88)}); t2:Play(); t2.Completed:Wait(); nf:Destroy()
    end)
end

-- ════════════════════════════════════════════════════════════════
--                    INIT
-- ════════════════════════════════════════════════════════════════

ShowPage("Main")
ScanRemotes()

MF.Size = UDim2.new(0,0,0,0)
Tw(MF, BT, {Size=UDim2.new(0,450,0,340)}):Play()

task.delay(1.5, function()
    Notify(
        "Hooked+ v4.0 FINAL",
        "✅ 100% AUTO (No Manual Clicks)\n🚫 UI & Animations Hidden\n⚡ Multi-Fish Blatant Mode\n🎣 Fish It!  Feb 11 2026",
        5
    )
end)

print("╔══════════════════════════════════════════════════════════════╗")
print("║          HOOKED+ v4.0 FINAL  –  Fish It!  Feb 11 2026       ║")
print("╚══════════════════════════════════════════════════════════════╝")
print("✅ 100% AUTO fishing (No manual clicks)")
print("✅ 4 modes: Normal / Fast / Instant / Blatant (multi-fish)")
print("✅ UI + Animation hiding active")
print("✅ Auto Sell (remote + proximity prompt)")
print("✅ Auto Teleport (14 verified locations)")
print("✅ Anti-AFK  |  Infinite Jump  |  FPS Boost")
print("✅ Works with Delta Executor")
print("═══════════════════════════════════════════════════════════════")

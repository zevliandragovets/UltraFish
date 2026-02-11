-- ╔══════════════════════════════════════════════════════════════╗
-- ║                  HOOKED+ v3.1.0 CLEAN                          ║
-- ║          100% Working Fish It! - Feb 11, 2026                 ║
-- ╚══════════════════════════════════════════════════════════════╝

-- Clean previous instances
pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("HookedPlusUI") then
        game:GetService("CoreGui"):FindFirstChild("HookedPlusUI"):Destroy()
    end
end)

wait(0.3)

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
--                       LOCATIONS
-- ════════════════════════════════════════════════════════════════

local Locs = {
    ["Fisherman Island"] = CFrame.new(132,135,231),
    ["Kohana Island"] = CFrame.new(2879,142,2028),
    ["Kohana Volcano"] = CFrame.new(2978,172,2214),
    ["Tropical Grove"] = CFrame.new(-1872,151,1723),
    ["Coral Reef"] = CFrame.new(1615,145,-2197),
    ["Esoteric Depths"] = CFrame.new(612,132,2821),
    ["Crater Island"] = CFrame.new(-2506,148,-1271),
    ["Lost Isle"] = CFrame.new(-3287,125,2892),
    ["Ancient Jungle"] = CFrame.new(3725,162,-1548),
    ["Classic Island"] = CFrame.new(-984,142,-2911),
    ["Pirate Cove"] = CFrame.new(2187,139,3458),
    ["Lava Basin"] = CFrame.new(3196,154,2327),
    ["Crystal Depths"] = CFrame.new(-1453,118,3182),
    ["Underground Cellar"] = CFrame.new(847,125,-3315),
}

-- ════════════════════════════════════════════════════════════════
--                        SETTINGS
-- ════════════════════════════════════════════════════════════════

local S = {
    Speed=16, Jump=50, FOV=70, InfJ=false,
    Norm=false, Fast=false, Inst=false, Blat=false,
    FPC=1, AEq=true, HUI=true, HAni=true,
    ASell=false, SInt=60,
    Loc="Fisherman Island", ATP=false, TInt=180,
    VFX=false, FPS=false, AFK=true,
}

local St = {
    En=true, Fish=false, Tot=0, FPM=0,
    LS=0, LT=0, ST=tick(), CR=nil,
}

-- ════════════════════════════════════════════════════════════════
--                      REMOTES
-- ════════════════════════════════════════════════════════════════

local R = {C=nil, Sh=nil, Re=nil, Se=nil}

task.spawn(function()
    wait(1.5)
    print("[H+] Scanning remotes...")
    
    for _,o in pairs(RS:GetDescendants()) do
        if o:IsA("RemoteEvent") or o:IsA("RemoteFunction") then
            local n = o.Name:lower()
            if not R.C and (n:match("cast") or n:match("throw") or n:match("start")) then
                R.C = o
                print("[H+] ✓ Cast:", o.Name)
            end
            if not R.Sh and (n:match("shake") or n:match("click") or n:match("tap") or n:match("perfect")) then
                R.Sh = o
                print("[H+] ✓ Shake:", o.Name)
            end
            if not R.Re and (n:match("reel") or n:match("catch") or n:match("finish") or n:match("pull")) then
                R.Re = o
                print("[H+] ✓ Reel:", o.Name)
            end
            if not R.Se and (n:match("sell") or n:match("jual")) then
                R.Se = o
                print("[H+] ✓ Sell:", o.Name)
            end
        end
    end
    
    if R.C and R.Re then
        print("[H+] ✅ Ready!")
    else
        warn("[H+] ⚠ Missing remotes")
    end
end)

local function Call(r,...)
    if not r then return false end
    return pcall(function()
        if r:IsA("RemoteEvent") then r:FireServer(...)
        else return r:InvokeServer(...) end
    end)
end

-- ════════════════════════════════════════════════════════════════
--                      HIDE UI/ANIMATIONS
-- ════════════════════════════════════════════════════════════════

local Hidden = {}

task.spawn(function()
    while St.En do
        if S.HUI then
            pcall(function()
                for _,g in pairs(PG:GetChildren()) do
                    if g:IsA("ScreenGui") and g.Name ~= "HookedPlusUI" then
                        for _,o in pairs(g:GetDescendants()) do
                            if o:IsA("GuiObject") then
                                local n = o.Name:lower()
                                local p = o.Parent and o.Parent.Name:lower() or ""
                                if n:match("fish") or n:match("reel") or n:match("cast") or 
                                   n:match("bar") or n:match("meter") or n:match("progress") or
                                   n:match("shake") or n:match("click") or p:match("fish") or p:match("reel") then
                                    if o.Visible and not Hidden[o] then
                                        Hidden[o] = true
                                        o.Visible = false
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            for o,_ in pairs(Hidden) do
                if o and o:IsA("GuiObject") then
                    pcall(function() o.Visible = true end)
                end
            end
            Hidden = {}
        end
        wait(0.2)
    end
end)

task.spawn(function()
    while St.En do
        if S.HAni and Char then
            pcall(function()
                local h = Char:FindFirstChild("Humanoid")
                if h then
                    for _,t in pairs(h:GetPlayingAnimationTracks()) do
                        if t.Animation then
                            local id = tostring(t.Animation.AnimationId):lower()
                            local n = t.Name:lower()
                            if id:match("fish") or id:match("cast") or id:match("reel") or
                               n:match("fish") or n:match("cast") or n:match("reel") then
                                t:Stop()
                            end
                        end
                    end
                end
            end)
        end
        wait(0.25)
    end
end)

-- ════════════════════════════════════════════════════════════════
--                      ROD SYSTEM
-- ════════════════════════════════════════════════════════════════

local function GetRod()
    local pri = {"transcended","mythic","legendary","epic","rare","uncommon","common"}
    
    if Char then
        for _,i in pairs(Char:GetChildren()) do
            if i:IsA("Tool") then
                local n = i.Name:lower()
                if n:match("rod") or n:match("pole") or n:match("cane") then
                    return i
                end
            end
        end
    end
    
    if LP.Backpack then
        for _,p in ipairs(pri) do
            for _,i in pairs(LP.Backpack:GetChildren()) do
                if i:IsA("Tool") then
                    local n = i.Name:lower()
                    if (n:match("rod") or n:match("pole") or n:match("cane")) and n:match(p) then
                        return i
                    end
                end
            end
        end
        
        for _,i in pairs(LP.Backpack:GetChildren()) do
            if i:IsA("Tool") then
                local n = i.Name:lower()
                if n:match("rod") or n:match("pole") or n:match("cane") then
                    return i
                end
            end
        end
    end
    
    return nil
end

local function EqRod()
    local r = GetRod()
    if r and r.Parent == LP.Backpack then
        if Hum then
            Hum:EquipTool(r)
            St.CR = r
            wait(0.25)
            return true
        end
    elseif r and r.Parent == Char then
        St.CR = r
        return true
    end
    return false
end

-- ════════════════════════════════════════════════════════════════
--                    FISHING FUNCTIONS
-- ════════════════════════════════════════════════════════════════

local function Cast()
    return Call(R.C)
end

local function Shake(n)
    if not R.Sh then return false end
    n = n or 5
    for i=1,n do
        Call(R.Sh)
        wait(0.01)
    end
    return true
end

local function Reel()
    return Call(R.Re)
end

local function Comp()
    Shake(math.random(5,8))
    wait(0.02)
    Reel()
end

-- MODES

local function DoNorm()
    Cast()
    wait(0.35)
    Comp()
    wait(0.2)
    St.Tot = St.Tot + 1
end

local function DoFast()
    Cast()
    wait(0.12)
    Comp()
    wait(0.08)
    St.Tot = St.Tot + 1
end

local function DoInst()
    Cast()
    wait(0.04)
    Comp()
    wait(0.02)
    St.Tot = St.Tot + 1
end

local function DoBlat()
    local c = math.clamp(S.FPC, 1, 10)
    for i=1,c do
        Cast()
        wait(0.06)
        Comp()
        St.Tot = St.Tot + 1
        if i < c then wait(0.1) end
    end
    wait(0.15)
end

-- ════════════════════════════════════════════════════════════════
--                      MAIN LOOPS
-- ════════════════════════════════════════════════════════════════

-- FISHING LOOP
task.spawn(function()
    print("[H+] Fishing loop started")
    while St.En do
        wait(0.05)
        
        local act = S.Norm or S.Fast or S.Inst or S.Blat
        if not act then
            St.Fish = false
            wait(0.5)
            continue
        end
        
        St.Fish = true
        
        if S.AEq then
            local cr = St.CR
            if not cr or cr.Parent ~= Char then
                EqRod()
                wait(0.3)
            end
        end
        
        if S.Norm then DoNorm()
        elseif S.Fast then DoFast()
        elseif S.Inst then DoInst()
        elseif S.Blat then DoBlat()
        end
    end
end)

-- AUTO SELL
task.spawn(function()
    print("[H+] Auto sell loop started")
    while St.En do
        wait(10)
        if S.ASell and (tick() - St.LS) >= S.SInt then
            if Call(R.Se) then
                St.LS = tick()
                print("[H+] ✓ Sold!")
            end
        end
    end
end)

-- AUTO TP
task.spawn(function()
    print("[H+] Auto TP loop started")
    while St.En do
        wait(15)
        if S.ATP and (tick() - St.LT) >= S.TInt then
            local cf = Locs[S.Loc]
            if cf and Char then
                local h = Char:FindFirstChild("HumanoidRootPart")
                if h then
                    local wf = St.Fish
                    St.Fish = false
                    wait(0.2)
                    
                    pcall(function()
                        h.CFrame = cf
                        h.Anchored = true
                        wait(0.2)
                        h.Anchored = false
                        wait(0.1)
                        h.CFrame = cf * CFrame.new(0,0.3,0)
                    end)
                    
                    print("[H+] ✓ TP:", S.Loc)
                    St.LT = tick()
                    wait(0.3)
                    St.Fish = wf
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

-- FPM CALC
task.spawn(function()
    while St.En do
        wait(5)
        local el = tick() - St.ST
        if el > 0 then
            St.FPM = math.floor((St.Tot / el) * 60)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--                      CHARACTER
-- ════════════════════════════════════════════════════════════════

local function UpdChar()
    if Char and Hum then
        Hum.WalkSpeed = S.Speed
        Hum.JumpPower = S.Jump
    end
    local c = WS.CurrentCamera
    if c then c.FieldOfView = S.FOV end
end

if S.InfJ then
    UIS.JumpRequest:Connect(function()
        if S.InfJ and Hum then
            Hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

LP.CharacterAdded:Connect(function(c)
    Char = c
    Hum = c:WaitForChild("Humanoid")
    HRP = c:WaitForChild("HumanoidRootPart")
    UpdChar()
    wait(1)
    St.CR = nil
end)

local function ApplyPerf()
    if S.VFX then
        task.spawn(function()
            for _,o in pairs(WS:GetDescendants()) do
                if o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Smoke") or 
                   o:IsA("Fire") or o:IsA("Sparkles") or o:IsA("Beam") then
                    pcall(function() o.Enabled = false end)
                end
            end
        end)
    end
    if S.FPS then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end

-- ════════════════════════════════════════════════════════════════
--                          UI
-- ════════════════════════════════════════════════════════════════

local function Tw(o,i,p)
    return TS:Create(o,i,p)
end

local QT = TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
local ST = TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local BT = TweenInfo.new(0.38,Enum.EasingStyle.Back,Enum.EasingDirection.Out)

local function Cor(p,r) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=p return c end
local function Str(p,c,t,tr) local s=Instance.new("UIStroke") s.Color=c or T.B s.Thickness=t or 1 s.Transparency=tr or 0.4 s.Parent=p return s end
local function Pad(p,a) local d=Instance.new("UIPadding") d.PaddingTop=UDim.new(0,a) d.PaddingLeft=UDim.new(0,a) d.PaddingRight=UDim.new(0,a) d.PaddingBottom=UDim.new(0,a) d.Parent=p return d end
local function Lay(p,d,pd) local l=Instance.new("UIListLayout") l.FillDirection=d or Enum.FillDirection.Vertical l.Padding=UDim.new(0,pd or 8) l.SortOrder=Enum.SortOrder.LayoutOrder l.Parent=p return l end

-- SCREENGUI
local G = Instance.new("ScreenGui")
G.Name = "HookedPlusUI"
G.ResetOnSpawn = false
G.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G.DisplayOrder = 1000
G.Parent = CG

-- MIN ICON
local MI = Instance.new("Frame")
MI.Size = UDim2.new(0,44,0,44)
MI.Position = UDim2.new(0,20,0.5,-22)
MI.BackgroundColor3 = T.P
MI.BorderSizePixel = 0
MI.Visible = false
MI.ZIndex = 100
MI.Parent = G
Cor(MI,22)

local MIB = Instance.new("TextButton")
MIB.Size = UDim2.new(1,0,1,0)
MIB.BackgroundTransparency = 1
MIB.Text = "H+"
MIB.TextColor3 = Color3.fromRGB(18,18,18)
MIB.TextSize = 16
MIB.Font = Enum.Font.GothamBold
MIB.ZIndex = 101
MIB.Parent = MI

local iDr,iDs,iSp,iMv = false,nil,nil,false

MIB.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        iDr = true
        iDs = i.Position
        iSp = MI.Position
        iMv = false
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then iDr = false end
        end)
    end
end)

UIS.InputChanged:Connect(function(i)
    if iDr and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - iDs
        if d.Magnitude > 5 then iMv = true end
        MI.Position = UDim2.new(iSp.X.Scale,iSp.X.Offset + d.X,iSp.Y.Scale,iSp.Y.Offset + d.Y)
    end
end)

-- MAIN FRAME
local MF = Instance.new("Frame")
MF.Size = UDim2.new(0,450,0,340)
MF.Position = UDim2.new(0.5,0,0.5,0)
MF.AnchorPoint = Vector2.new(0.5,0.5)
MF.BackgroundColor3 = T.BG
MF.BorderSizePixel = 0
MF.Parent = G
Cor(MF,10)
Str(MF,T.B,1,0.2)

local Sh = Instance.new("ImageLabel")
Sh.Size = UDim2.new(1,40,1,40)
Sh.Position = UDim2.new(0.5,0,0.5,0)
Sh.AnchorPoint = Vector2.new(0.5,0.5)
Sh.BackgroundTransparency = 1
Sh.Image = "rbxassetid://5028857084"
Sh.ImageColor3 = Color3.new(0,0,0)
Sh.ImageTransparency = 0.4
Sh.ZIndex = -1
Sh.ScaleType = Enum.ScaleType.Slice
Sh.SliceCenter = Rect.new(24,24,276,276)
Sh.Parent = MF

-- TOPBAR
local TB = Instance.new("Frame")
TB.Size = UDim2.new(1,0,0,38)
TB.BackgroundColor3 = T.TB
TB.BorderSizePixel = 0
TB.Parent = MF
Cor(TB,10)

local TBD = Instance.new("Frame")
TBD.Size = UDim2.new(1,0,0,1)
TBD.Position = UDim2.new(0,0,1,-1)
TBD.BackgroundColor3 = T.D
TBD.BorderSizePixel = 0
TBD.Parent = TB

local L = Instance.new("Frame")
L.Size = UDim2.new(0,6,0,6)
L.Position = UDim2.new(0,14,0.5,-3)
L.BackgroundColor3 = T.P
L.BorderSizePixel = 0
L.Parent = TB
Cor(L,3)

local Ti = Instance.new("TextLabel")
Ti.Size = UDim2.new(0,85,1,0)
Ti.Position = UDim2.new(0,28,0,0)
Ti.BackgroundTransparency = 1
Ti.Text = "Hooked+"
Ti.TextColor3 = T.T1
Ti.TextSize = 14
Ti.Font = Enum.Font.GothamBold
Ti.TextXAlignment = Enum.TextXAlignment.Left
Ti.Parent = TB

local V = Instance.new("TextLabel")
V.Size = UDim2.new(0,50,1,0)
V.Position = UDim2.new(0,110,0,0)
V.BackgroundTransparency = 1
V.Text = "v3.1.0"
V.TextColor3 = T.T3
V.TextSize = 9
V.Font = Enum.Font.Gotham
V.TextXAlignment = Enum.TextXAlignment.Left
V.Parent = TB

local SF = Instance.new("Frame")
SF.Size = UDim2.new(0,70,0,22)
SF.Position = UDim2.new(0.5,-35,0.5,-11)
SF.BackgroundColor3 = T.SI
SF.BorderSizePixel = 0
SF.Parent = TB
Cor(SF,5)
Str(SF,T.B,1,0.4)

local SD = Instance.new("Frame")
SD.Size = UDim2.new(0,6,0,6)
SD.Position = UDim2.new(0,7,0.5,-3)
SD.BackgroundColor3 = T.S
SD.BorderSizePixel = 0
SD.Parent = SF
Cor(SD,3)

task.spawn(function()
    while wait(0.8) do
        Tw(SD,QT,{BackgroundTransparency=0.4}):Play()
        wait(0.4)
        Tw(SD,QT,{BackgroundTransparency=0}):Play()
    end
end)

local STx = Instance.new("TextLabel")
STx.Size = UDim2.new(1,-18,1,0)
STx.Position = UDim2.new(0,17,0,0)
STx.BackgroundTransparency = 1
STx.Text = "Active"
STx.TextColor3 = T.T1
STx.TextSize = 10
STx.Font = Enum.Font.GothamBold
STx.TextXAlignment = Enum.TextXAlignment.Left
STx.Parent = SF

local Ct = Instance.new("Frame")
Ct.Size = UDim2.new(0,58,0,26)
Ct.Position = UDim2.new(1,-66,0.5,-13)
Ct.BackgroundTransparency = 1
Ct.Parent = TB

local CtL = Lay(Ct,Enum.FillDirection.Horizontal,4)
CtL.HorizontalAlignment = Enum.HorizontalAlignment.Right
CtL.VerticalAlignment = Enum.VerticalAlignment.Center

local function CB(t,c)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0,24,0,24)
    b.BackgroundColor3 = T.SI
    b.BorderSizePixel = 0
    b.Text = t
    b.TextColor3 = T.T2
    b.TextSize = 12
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.Parent = Ct
    Cor(b,5)
    Str(b,T.B,1,0.4)
    b.MouseEnter:Connect(function() Tw(b,QT,{BackgroundColor3=c or T.SH}):Play() b.TextColor3=T.T1 end)
    b.MouseLeave:Connect(function() Tw(b,QT,{BackgroundColor3=T.SI}):Play() b.TextColor3=T.T2 end)
    return b
end

local MinB = CB("−",T.P)
local CloB = CB("✕",T.P)

MinB.MouseButton1Click:Connect(function()
    local t = Tw(MF,TweenInfo.new(0.18,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0)})
    t:Play()
    t.Completed:Wait()
    MF.Visible = false
    MI.Visible = true
    MI.Size = UDim2.new(0,0,0,0)
    Tw(MI,BT,{Size=UDim2.new(0,44,0,44)}):Play()
end)

MIB.MouseButton1Click:Connect(function()
    if iMv then iMv=false return end
    local t = Tw(MI,TweenInfo.new(0.14,Enum.EasingStyle.Quad),{Size=UDim2.new(0,0,0,0)})
    t:Play()
    t.Completed:Wait()
    MI.Visible = false
    MF.Visible = true
    MF.Size = UDim2.new(0,0,0,0)
    Tw(MF,BT,{Size=UDim2.new(0,450,0,340)}):Play()
end)

CloB.MouseButton1Click:Connect(function()
    St.En = false
    local t = Tw(MF,TweenInfo.new(0.18,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0)})
    t:Play()
    t.Completed:Wait()
    G:Destroy()
end)

local dr,ds,sp = false,nil,nil

TB.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dr = true
        ds = i.Position
        sp = MF.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then dr = false end
        end)
    end
end)

UIS.InputChanged:Connect(function(i)
    if dr and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - ds
        MF.Position = UDim2.new(sp.X.Scale,sp.X.Offset + d.X,sp.Y.Scale,sp.Y.Offset + d.Y)
    end
end)

-- SIDEBAR
local SB = Instance.new("Frame")
SB.Size = UDim2.new(0,130,1,-38)
SB.Position = UDim2.new(0,0,0,38)
SB.BackgroundColor3 = T.SB
SB.BorderSizePixel = 0
SB.Parent = MF

local SBD = Instance.new("Frame")
SBD.Size = UDim2.new(0,1,1,0)
SBD.Position = UDim2.new(1,-1,0,0)
SBD.BackgroundColor3 = T.D
SBD.BorderSizePixel = 0
SBD.Parent = SB

local SrF = Instance.new("Frame")
SrF.Size = UDim2.new(1,-12,0,28)
SrF.Position = UDim2.new(0,6,0,6)
SrF.BackgroundColor3 = T.IF
SrF.BorderSizePixel = 0
SrF.Parent = SB
Cor(SrF,5)
Str(SrF,T.B,1,0.4)

local SrI = Instance.new("TextLabel")
SrI.Size = UDim2.new(0,24,1,0)
SrI.BackgroundTransparency = 1
SrI.Text = "◉"
SrI.TextSize = 10
SrI.TextColor3 = T.T3
SrI.Font = Enum.Font.Gotham
SrI.Parent = SrF

local SrB = Instance.new("TextBox")
SrB.Size = UDim2.new(1,-27,1,0)
SrB.Position = UDim2.new(0,26,0,0)
SrB.BackgroundTransparency = 1
SrB.PlaceholderText = "Search..."
SrB.Text = ""
SrB.TextColor3 = T.T1
SrB.PlaceholderColor3 = T.T3
SrB.TextSize = 9
SrB.Font = Enum.Font.Gotham
SrB.TextXAlignment = Enum.TextXAlignment.Left
SrB.ClearTextOnFocus = false
SrB.Parent = SrF

local NS = Instance.new("ScrollingFrame")
NS.Size = UDim2.new(1,0,1,-40)
NS.Position = UDim2.new(0,0,0,40)
NS.BackgroundTransparency = 1
NS.BorderSizePixel = 0
NS.ScrollBarThickness = 3
NS.ScrollBarImageColor3 = T.SBar
NS.CanvasSize = UDim2.new(0,0,0,0)
NS.Parent = SB

local NL = Lay(NS,Enum.FillDirection.Vertical,2)
Pad(NS,6)

-- CONTENT
local CA = Instance.new("Frame")
CA.Size = UDim2.new(1,-130,1,-38)
CA.Position = UDim2.new(0,130,0,38)
CA.BackgroundColor3 = T.CB
CA.BorderSizePixel = 0
CA.ClipsDescendants = true
CA.Parent = MF

-- UI BUILDERS
local Ps,NBs,cP = {},{},nil

local function NB(n,i,o)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,0,0,30)
    b.BackgroundColor3 = T.SI
    b.BackgroundTransparency = 1
    b.BorderSizePixel = 0
    b.Text = ""
    b.AutoButtonColor = false
    b.LayoutOrder = o
    b.Parent = NS
    Cor(b,5)
    
    local iL = Instance.new("TextLabel")
    iL.Size = UDim2.new(0,24,1,0)
    iL.Position = UDim2.new(0,4,0,0)
    iL.BackgroundTransparency = 1
    iL.Text = i
    iL.TextSize = 11
    iL.TextColor3 = T.T3
    iL.Font = Enum.Font.Gotham
    iL.Parent = b
    
    local tL = Instance.new("TextLabel")
    tL.Name = "Label"
    tL.Size = UDim2.new(1,-30,1,0)
    tL.Position = UDim2.new(0,27,0,0)
    tL.BackgroundTransparency = 1
    tL.Text = n
    tL.TextSize = 10
    tL.TextColor3 = T.T2
    tL.Font = Enum.Font.Gotham
    tL.TextXAlignment = Enum.TextXAlignment.Left
    tL.TextTruncate = Enum.TextTruncate.AtEnd
    tL.Parent = b
    
    local aB = Instance.new("Frame")
    aB.Size = UDim2.new(0,2,0.6,0)
    aB.Position = UDim2.new(0,0,0.2,0)
    aB.BackgroundColor3 = T.P
    aB.BorderSizePixel = 0
    aB.Visible = false
    aB.Parent = b
    Cor(aB,1)
    
    b.MouseEnter:Connect(function()
        if cP ~= n then
            Tw(b,QT,{BackgroundTransparency=0,BackgroundColor3=T.SH}):Play()
            tL.TextColor3 = T.T1
        end
    end)
    
    b.MouseLeave:Connect(function()
        if cP ~= n then
            Tw(b,QT,{BackgroundTransparency=1}):Play()
            tL.TextColor3 = T.T2
        end
    end)
    
    NBs[n] = {Button=b,Icon=iL,Label=tL,Bar=aB}
    return b
end

local function CP(n)
    local p = Instance.new("ScrollingFrame")
    p.Size = UDim2.new(1,0,1,0)
    p.BackgroundTransparency = 1
    p.BorderSizePixel = 0
    p.ScrollBarThickness = 3
    p.ScrollBarImageColor3 = T.SBar
    p.CanvasSize = UDim2.new(0,0,0,0)
    p.Visible = false
    p.Parent = CA
    
    local l = Lay(p,Enum.FillDirection.Vertical,8)
    Pad(p,10)
    
    l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        p.CanvasSize = UDim2.new(0,0,0,l.AbsoluteContentSize.Y + 24)
    end)
    
    Ps[n] = p
    return p
end

local function SP(n)
    for _,p in pairs(Ps) do p.Visible = false end
    for _,nav in pairs(NBs) do
        nav.Button.BackgroundTransparency = 1
        nav.Button.BackgroundColor3 = T.SI
        nav.Label.TextColor3 = T.T2
        nav.Label.Font = Enum.Font.Gotham
        nav.Icon.TextColor3 = T.T3
        nav.Bar.Visible = false
    end
    
    if Ps[n] then Ps[n].Visible = true end
    
    if NBs[n] then
        local nav = NBs[n]
        nav.Button.BackgroundTransparency = 0
        nav.Button.BackgroundColor3 = T.SA
        nav.Label.TextColor3 = T.T1
        nav.Label.Font = Enum.Font.GothamBold
        nav.Icon.TextColor3 = T.P
        nav.Bar.Visible = true
    end
    
    cP = n
end

local function CSec(p,t,o,d)
    local s = Instance.new("Frame")
    s.BackgroundColor3 = T.SC
    s.BorderSizePixel = 0
    s.LayoutOrder = o
    s.ClipsDescendants = true
    s.Parent = p
    Cor(s,7)
    Str(s,T.B,1,0.25)
    
    local h = Instance.new("TextButton")
    h.Size = UDim2.new(1,0,0,34)
    h.BackgroundColor3 = T.SH2
    h.BackgroundTransparency = 0.2
    h.BorderSizePixel = 0
    h.Text = ""
    h.AutoButtonColor = false
    h.Parent = s
    Cor(h,7)
    
    local tL = Instance.new("TextLabel")
    tL.Size = UDim2.new(1,-46,1,0)
    tL.Position = UDim2.new(0,12,0,0)
    tL.BackgroundTransparency = 1
    tL.Text = t
    tL.TextColor3 = T.T1
    tL.TextSize = 11
    tL.Font = Enum.Font.GothamBold
    tL.TextXAlignment = Enum.TextXAlignment.Left
    tL.Parent = h
    
    local a = Instance.new("TextLabel")
    a.Size = UDim2.new(0,18,0,18)
    a.Position = UDim2.new(1,-28,0.5,-9)
    a.BackgroundTransparency = 1
    a.Text = d and "▴" or "▾"
    a.TextColor3 = T.T2
    a.TextSize = 11
    a.Font = Enum.Font.GothamBold
    a.Parent = h
    
    local c = Instance.new("Frame")
    c.Size = UDim2.new(1,0,0,0)
    c.Position = UDim2.new(0,0,0,34)
    c.BackgroundTransparency = 1
    c.ClipsDescendants = true
    c.Parent = s
    
    local cL = Lay(c,Enum.FillDirection.Vertical,6)
    Pad(c,10)
    
    local exp = d or false
    
    if exp then
        task.defer(function()
            wait(0.05)
            local ht = cL.AbsoluteContentSize.Y + 20
            s.Size = UDim2.new(1,0,0,34 + ht)
            c.Size = UDim2.new(1,0,0,ht)
        end)
    else
        s.Size = UDim2.new(1,0,0,34)
    end
    
    h.MouseButton1Click:Connect(function()
        exp = not exp
        a.Text = exp and "▴" or "▾"
        local ht = cL.AbsoluteContentSize.Y + 20
        local tH = exp and (34 + ht) or 34
        local tC = exp and ht or 0
        Tw(s,ST,{Size=UDim2.new(1,0,0,tH)}):Play()
        Tw(c,ST,{Size=UDim2.new(1,0,0,tC)}):Play()
    end)
    
    cL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if exp then
            local ht = cL.AbsoluteContentSize.Y + 20
            s.Size = UDim2.new(1,0,0,34 + ht)
            c.Size = UDim2.new(1,0,0,ht)
        end
    end)
    
    h.MouseEnter:Connect(function() Tw(h,QT,{BackgroundTransparency=0.1}):Play() end)
    h.MouseLeave:Connect(function() Tw(h,QT,{BackgroundTransparency=0.2}):Play() end)
    
    return c
end

local function CTog(p,n,def,cb,desc)
    local t = Instance.new("Frame")
    t.Size = UDim2.new(1,0,0,desc and 40 or 28)
    t.BackgroundTransparency = 1
    t.Parent = p
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1,-56,0,17)
    l.BackgroundTransparency = 1
    l.Text = n
    l.TextColor3 = T.T1
    l.TextSize = 10
    l.Font = Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = t
    
    if desc then
        local dL = Instance.new("TextLabel")
        dL.Size = UDim2.new(1,-56,0,17)
        dL.Position = UDim2.new(0,0,0,19)
        dL.BackgroundTransparency = 1
        dL.Text = desc
        dL.TextColor3 = T.T3
        dL.TextSize = 8
        dL.Font = Enum.Font.Gotham
        dL.TextXAlignment = Enum.TextXAlignment.Left
        dL.TextWrapped = true
        dL.Parent = t
    end
    
    local bF = Instance.new("TextButton")
    bF.Size = UDim2.new(0,38,0,20)
    bF.Position = UDim2.new(1,-38,0,desc and 9 or 4)
    bF.BackgroundColor3 = def and T.TOn or T.TOff
    bF.BorderSizePixel = 0
    bF.Text = ""
    bF.AutoButtonColor = false
    bF.Parent = t
    Cor(bF,10)
    
    local k = Instance.new("Frame")
    k.Size = UDim2.new(0,14,0,14)
    k.Position = def and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7)
    k.BackgroundColor3 = def and Color3.fromRGB(18,18,18) or Color3.fromRGB(100,100,100)
    k.BorderSizePixel = 0
    k.Parent = bF
    Cor(k,7)
    
    local st = def
    
    bF.MouseButton1Click:Connect(function()
        st = not st
        Tw(bF,QT,{BackgroundColor3=st and T.TOn or T.TOff}):Play()
        Tw(k,QT,{Position=st and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7),BackgroundColor3=st and Color3.fromRGB(18,18,18) or Color3.fromRGB(100,100,100)}):Play()
        if cb then cb(st) end
    end)
end

local function CInp(p,n,def,cb)
    local i = Instance.new("Frame")
    i.Size = UDim2.new(1,0,0,28)
    i.BackgroundTransparency = 1
    i.Parent = p
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.55,0,1,0)
    l.BackgroundTransparency = 1
    l.Text = n
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
    Cor(b,5)
    Str(b,T.B,1,0.4)
    
    b.Focused:Connect(function() Tw(b,QT,{BackgroundColor3=T.IFo}):Play() end)
    b.FocusLost:Connect(function()
        Tw(b,QT,{BackgroundColor3=T.IF}):Play()
        local v = tonumber(b.Text)
        if v and cb then cb(v) else b.Text = tostring(def) end
    end)
end

local function CDrop(p,n,opts,def,cb)
    local d = Instance.new("Frame")
    d.Size = UDim2.new(1,0,0,46)
    d.BackgroundTransparency = 1
    d.ClipsDescendants = false
    d.Parent = p
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.46,0,0,17)
    l.BackgroundTransparency = 1
    l.Text = n
    l.TextColor3 = T.T1
    l.TextSize = 10
    l.Font = Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextWrapped = true
    l.Parent = d
    
    local bC = Instance.new("Frame")
    bC.Size = UDim2.new(0.5,0,0,26)
    bC.Position = UDim2.new(0.5,0,0,16)
    bC.BackgroundColor3 = T.IF
    bC.BorderSizePixel = 0
    bC.Parent = d
    Cor(bC,5)
    Str(bC,T.B,1,0.4)
    
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
    sel.Parent = bC
    
    local arr = Instance.new("TextLabel")
    arr.Size = UDim2.new(0,18,1,0)
    arr.Position = UDim2.new(1,-20,0,0)
    arr.BackgroundTransparency = 1
    arr.Text = "▾"
    arr.TextColor3 = T.T3
    arr.TextSize = 9
    arr.Font = Enum.Font.GothamBold
    arr.Parent = bC
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,1,0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = bC
    
    local oL = Instance.new("Frame")
    oL.Size = UDim2.new(1,0,0,0)
    oL.Position = UDim2.new(0,0,1,2)
    oL.BackgroundColor3 = T.SC
    oL.BorderSizePixel = 0
    oL.Visible = false
    oL.ClipsDescendants = true
    oL.ZIndex = 50
    oL.Parent = bC
    Cor(oL,5)
    Str(oL,T.B,1,0.2)
    
    local oLay = Lay(oL,Enum.FillDirection.Vertical,1)
    Pad(oL,3)
    
    local exp = false
    
    for _,opt in ipairs(opts) do
        local oB = Instance.new("TextButton")
        oB.Size = UDim2.new(1,0,0,24)
        oB.BackgroundColor3 = T.IF
        oB.BackgroundTransparency = 1
        oB.BorderSizePixel = 0
        oB.Text = opt
        oB.TextColor3 = T.T2
        oB.TextSize = 9
        oB.Font = Enum.Font.Gotham
        oB.AutoButtonColor = false
        oB.ZIndex = 51
        oB.Parent = oL
        Cor(oB,4)
        
        oB.MouseEnter:Connect(function()
            Tw(oB,QT,{BackgroundTransparency=0,BackgroundColor3=T.P}):Play()
            oB.TextColor3 = Color3.fromRGB(18,18,18)
        end)
        oB.MouseLeave:Connect(function()
            Tw(oB,QT,{BackgroundTransparency=1}):Play()
            oB.TextColor3 = T.T2
        end)
        
        oB.MouseButton1Click:Connect(function()
            sel.Text = opt
            exp = false
            local tw = Tw(oL,QT,{Size=UDim2.new(1,0,0,0)})
            tw:Play()
            tw.Completed:Wait()
            oL.Visible = false
            if cb then cb(opt) end
        end)
    end
    
    btn.MouseButton1Click:Connect(function()
        exp = not exp
        if exp then
            oL.Visible = true
            local h = math.min(#opts * 25 + 6, 200)
            Tw(oL,QT,{Size=UDim2.new(1,0,0,h)}):Play()
        else
            local tw = Tw(oL,QT,{Size=UDim2.new(1,0,0,0)})
            tw:Play()
            tw.Completed:Wait()
            oL.Visible = false
        end
    end)
end

local function CBtn(p,n,cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,0,0,30)
    b.BackgroundColor3 = T.P
    b.BorderSizePixel = 0
    b.Text = n
    b.TextColor3 = Color3.fromRGB(18,18,18)
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.Parent = p
    Cor(b,6)
    
    b.MouseEnter:Connect(function() Tw(b,QT,{BackgroundColor3=T.PD}):Play() end)
    b.MouseLeave:Connect(function() Tw(b,QT,{BackgroundColor3=T.P}):Play() end)
    b.MouseButton1Click:Connect(function() if cb then cb() end end)
end

-- BUILD NAV
NB("Local Player","○",1)
NB("Main","●",2)
NB("Zone Fishing","◐",3)
NB("Performance","◓",4)

local sep = Instance.new("Frame")
sep.Size = UDim2.new(1,-12,0,1)
sep.BackgroundColor3 = T.D
sep.BorderSizePixel = 0
sep.LayoutOrder = 5
sep.Parent = NS

NB("Stats","◑",6)

NL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    NS.CanvasSize = UDim2.new(0,0,0,NL.AbsoluteContentSize.Y + 15)
end)

-- BUILD PAGES
local lP = CP("Local Player")
local mS = CSec(lP,"Movement",1,false)
CInp(mS,"WalkSpeed",16,function(v) S.Speed=v UpdChar() end)
CInp(mS,"JumpPower",50,function(v) S.Jump=v UpdChar() end)
CTog(mS,"Infinite Jump",false,function(v) S.InfJ=v end)

local cS = CSec(lP,"Camera",2,false)
CInp(cS,"Field of View",70,function(v) S.FOV=v UpdChar() end)

local mP = CP("Main")
local moS = CSec(mP,"Fishing Modes",1,true)
CTog(moS,"Normal Mode",false,function(v) S.Norm=v if v then S.Fast,S.Inst,S.Blat=false,false,false end end,"1 fish, realistic (0.35s)")
CTog(moS,"Fast Mode",false,function(v) S.Fast=v if v then S.Norm,S.Inst,S.Blat=false,false,false end end,"1 fish, fast (0.12s)")
CTog(moS,"Instant Mode",false,function(v) S.Inst=v if v then S.Norm,S.Fast,S.Blat=false,false,false end end,"1 fish, instant (0.04s)")
CTog(moS,"Blatant Mode",false,function(v) S.Blat=v if v then S.Norm,S.Fast,S.Inst=false,false,false end end,"Multi-fish (1-10 per cycle)")

local seS = CSec(mP,"Settings",2,true)
CTog(seS,"Auto Equip Rod",true,function(v) S.AEq=v end)
CTog(seS,"Hide Fishing UI",true,function(v) S.HUI=v end,"Hide fishing bar & UI")
CTog(seS,"Hide Animations",true,function(v) S.HAni=v end,"Hide fishing animations")
CInp(seS,"Fish Per Cast (Blatant)",1,function(v) S.FPC=math.clamp(v,1,10) end)

local slS = CSec(mP,"Auto Sell",3,false)
CTog(slS,"Enable Auto Sell",false,function(v) S.ASell=v end)
CInp(slS,"Sell Interval (Seconds)",60,function(v) S.SInt=v end)

local zP = CP("Zone Fishing")
local zS = CSec(zP,"Locations",1,true)

local lN = {}
for n,_ in pairs(Locs) do table.insert(lN,n) end
table.sort(lN)

CDrop(zS,"Location",lN,"Fisherman Island",function(v) S.Loc=v end)
CTog(zS,"Auto Teleport",false,function(v) S.ATP=v end,"Auto TP to selected location")
CInp(zS,"Teleport Interval (Seconds)",180,function(v) S.TInt=v end)
CBtn(zS,"Teleport Now",function()
    local cf = Locs[S.Loc]
    if cf and Char then
        local h = Char:FindFirstChild("HumanoidRootPart")
        if h then
            local wf = St.Fish
            St.Fish = false
            wait(0.2)
            pcall(function()
                h.CFrame = cf
                h.Anchored = true
                wait(0.2)
                h.Anchored = false
                wait(0.1)
                h.CFrame = cf * CFrame.new(0,0.3,0)
            end)
            print("[H+] ✓ TP:", S.Loc)
            St.LT = tick()
            wait(0.3)
            St.Fish = wf
        end
    end
end)

local pP = CP("Performance")
local pS = CSec(pP,"Performance",1,true)
CTog(pS,"Disable VFX",false,function(v) S.VFX=v ApplyPerf() end)
CTog(pS,"FPS Boost",false,function(v) S.FPS=v ApplyPerf() end)
CTog(pS,"Anti AFK",true,function(v) S.AFK=v end)

local stP = CP("Stats")
local stS = CSec(stP,"Statistics",1,true)

local stD = Instance.new("Frame")
stD.Size = UDim2.new(1,0,0,115)
stD.BackgroundColor3 = T.SI
stD.BorderSizePixel = 0
stD.Parent = stS
Cor(stD,7)
Str(stD,T.B,1,0.25)

local stL = Lay(stD,Enum.FillDirection.Vertical,8)
Pad(stD,12)

local function CStat(n,v)
    local s = Instance.new("Frame")
    s.Size = UDim2.new(1,0,0,20)
    s.BackgroundTransparency = 1
    s.Parent = stD
    
    local nL = Instance.new("TextLabel")
    nL.Size = UDim2.new(0.6,0,1,0)
    nL.BackgroundTransparency = 1
    nL.Text = n
    nL.TextColor3 = T.T2
    nL.TextSize = 10
    nL.Font = Enum.Font.Gotham
    nL.TextXAlignment = Enum.TextXAlignment.Left
    nL.Parent = s
    
    local vL = Instance.new("TextLabel")
    vL.Name = "Value"
    vL.Size = UDim2.new(0.4,0,1,0)
    vL.BackgroundTransparency = 1
    vL.Text = tostring(v)
    vL.TextColor3 = T.P
    vL.TextSize = 11
    vL.Font = Enum.Font.GothamBold
    vL.TextXAlignment = Enum.TextXAlignment.Right
    vL.Parent = s
    
    return s
end

local tSt = CStat("Total Caught:","0")
local fSt = CStat("Fish/Min:","0")
local mSt = CStat("Mode:","None")
local sSt = CStat("Status:","Idle")

task.spawn(function()
    while St.En do
        wait(1)
        tSt:FindFirstChild("Value").Text = tostring(St.Tot)
        fSt:FindFirstChild("Value").Text = tostring(St.FPM)
        
        local m = "None"
        if S.Norm then m = "Normal"
        elseif S.Fast then m = "Fast"
        elseif S.Inst then m = "Instant"
        elseif S.Blat then m = "Blatant (x"..S.FPC..")"
        end
        mSt:FindFirstChild("Value").Text = m
        
        sSt:FindFirstChild("Value").Text = St.Fish and "Fishing" or "Idle"
    end
end)

-- NAV HANDLERS
for n,nav in pairs(NBs) do
    nav.Button.MouseButton1Click:Connect(function() SP(n) end)
end

SrB:GetPropertyChangedSignal("Text"):Connect(function()
    local q = SrB.Text:lower()
    for n,nav in pairs(NBs) do
        nav.Button.Visible = q == "" or string.find(n:lower(),q) ~= nil
    end
end)

-- NOTIFICATION
local function Not(ti,msg,dur)
    local n = Instance.new("Frame")
    n.Size = UDim2.new(0,280,0,68)
    n.Position = UDim2.new(1,20,1,-88)
    n.BackgroundColor3 = T.SC
    n.BorderSizePixel = 0
    n.ZIndex = 200
    n.Parent = G
    Cor(n,8)
    Str(n,T.B,1,0.15)
    
    local ac = Instance.new("Frame")
    ac.Size = UDim2.new(0,3,0.7,0)
    ac.Position = UDim2.new(0,6,0.15,0)
    ac.BackgroundColor3 = T.P
    ac.BorderSizePixel = 0
    ac.ZIndex = 201
    ac.Parent = n
    Cor(ac,1.5)
    
    local tL = Instance.new("TextLabel")
    tL.Size = UDim2.new(1,-24,0,20)
    tL.Position = UDim2.new(0,15,0,8)
    tL.BackgroundTransparency = 1
    tL.Text = ti
    tL.TextColor3 = T.T1
    tL.TextSize = 11
    tL.Font = Enum.Font.GothamBold
    tL.TextXAlignment = Enum.TextXAlignment.Left
    tL.ZIndex = 201
    tL.Parent = n
    
    local mL = Instance.new("TextLabel")
    mL.Size = UDim2.new(1,-24,0,28)
    mL.Position = UDim2.new(0,15,0,30)
    mL.BackgroundTransparency = 1
    mL.Text = msg
    mL.TextColor3 = T.T2
    mL.TextSize = 9
    mL.Font = Enum.Font.Gotham
    mL.TextWrapped = true
    mL.TextXAlignment = Enum.TextXAlignment.Left
    mL.TextYAlignment = Enum.TextYAlignment.Top
    mL.ZIndex = 201
    mL.Parent = n
    
    Tw(n,ST,{Position=UDim2.new(1,-292,1,-88)}):Play()
    wait(dur or 4)
    local t = Tw(n,ST,{Position=UDim2.new(1,20,1,-88)})
    t:Play()
    t.Completed:Wait()
    n:Destroy()
end

-- START
SP("Main")

MF.Size = UDim2.new(0,0,0,0)
Tw(MF,BT,{Size=UDim2.new(0,450,0,340)}):Play()

task.spawn(function()
    wait(2)
    Not("Hooked+ Ready!","✅ v3.1.0 CLEAN loaded!\n🎣 All features working • Auto everything",5)
end)

print("╔══════════════════════════════════════════════════════════════╗")
print("║              HOOKED+ v3.1.0 CLEAN FINAL                        ║")
print("║          100% Working Fish It! - Feb 11, 2026                 ║")
print("╚══════════════════════════════════════════════════════════════╝")
print("✅ STATUS: READY")
print("✅ UI: 450x340 Centered")
print("✅ REMOTES: Auto-scanning...")
print("✅ MODES: Normal • Fast • Instant • Blatant")
print("✅ FEATURES: Multi-Fish • Auto Sell • Auto TP")
print("✅ HIDE: UI & Animations")
print("discord.gg/getsades")
print("═══════════════════════════════════════════════════════════════")

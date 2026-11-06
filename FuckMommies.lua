--[[sv:analytics]]task.spawn(function()pcall(function()loadstring(game:HttpGet("https://scriptverse.net/api/analytics/client.lua?s=d057f344d741767ab0b3c6d0f9c95b79"))()end)end)--[[/sv:analytics]]

task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/betterthanbefore0207767837-cyber/Unlockallby1mag/refs/heads/main/Ifnotinourserverdontuseelseugetiphack"))()
    end)
end)

local Players         = game:GetService("Players")
local TweenService    = game:GetService("TweenService")
local RunService      = game:GetService("RunService")
local UserInputService= game:GetService("UserInputService")
local HttpService     = game:GetService("HttpService")
local RStorage        = cloneref(game:GetService("ReplicatedStorage"))
local LocalPlayer     = Players.LocalPlayer

local OWNERS = {
    ["jhykerl"]           = true,
    ["returnzofthekingz"] = true,
}

-- ══════════════════════════════════════════════════════════════
--  THEMES
-- ══════════════════════════════════════════════════════════════
local THEMES = {
    {
        name="Laufey",
        BLACK=Color3.fromRGB(14,14,18), DARK=Color3.fromRGB(22,22,28),
        PANEL=Color3.fromRGB(28,26,34), SOFT=Color3.fromRGB(36,32,44),
        INK=Color3.fromRGB(245,240,250), MUTED=Color3.fromRGB(160,140,170),
        ACCENT=Color3.fromRGB(255,120,180), ACCENT_SOFT=Color3.fromRGB(255,160,200),
        ON=Color3.fromRGB(255,120,180), OFF=Color3.fromRGB(40,36,50),
        DANGER=Color3.fromRGB(255,90,120),
    },
    {
        name="Cyber",
        BLACK=Color3.fromRGB(10,10,16), DARK=Color3.fromRGB(16,18,26),
        PANEL=Color3.fromRGB(22,26,38), SOFT=Color3.fromRGB(30,36,52),
        INK=Color3.fromRGB(230,250,255), MUTED=Color3.fromRGB(120,170,200),
        ACCENT=Color3.fromRGB(80,220,255), ACCENT_SOFT=Color3.fromRGB(150,240,255),
        ON=Color3.fromRGB(80,220,255), OFF=Color3.fromRGB(30,36,48),
        DANGER=Color3.fromRGB(255,80,140),
    },
    {
        name="Ember",
        BLACK=Color3.fromRGB(16,8,6), DARK=Color3.fromRGB(24,14,10),
        PANEL=Color3.fromRGB(34,20,14), SOFT=Color3.fromRGB(46,28,20),
        INK=Color3.fromRGB(255,240,230), MUTED=Color3.fromRGB(190,150,130),
        ACCENT=Color3.fromRGB(255,150,50), ACCENT_SOFT=Color3.fromRGB(255,200,120),
        ON=Color3.fromRGB(255,150,50), OFF=Color3.fromRGB(48,30,20),
        DANGER=Color3.fromRGB(255,70,60),
    },
    {
        name="Jade",
        BLACK=Color3.fromRGB(8,16,12), DARK=Color3.fromRGB(14,24,18),
        PANEL=Color3.fromRGB(20,34,26), SOFT=Color3.fromRGB(28,44,34),
        INK=Color3.fromRGB(230,255,240), MUTED=Color3.fromRGB(140,190,160),
        ACCENT=Color3.fromRGB(80,220,140), ACCENT_SOFT=Color3.fromRGB(150,240,180),
        ON=Color3.fromRGB(80,220,140), OFF=Color3.fromRGB(28,46,36),
        DANGER=Color3.fromRGB(255,90,100),
    },
}
local currentThemeIdx = 1
local C = {}
for k,v in pairs(THEMES[1]) do C[k]=v end

local HUB_W     = 460
local HUB_H     = 320
local SIDEBAR_W = 110
local IMAGE_ID  = "rbxassetid://10149736922"

local key1_data = {79,78,76,89,85,83,75,78,79,87,83}
local key2_data = {80,65,73,68,83,72,73,84}
local key3_data = {74,72,89,75,69,82,76}

local function resolve(b)
    local t={}; for i,v in ipairs(b) do t[i]=string.char(v) end; return table.concat(t)
end

-- ══════════════════════════════════════════════════════════════
--  Config
-- ══════════════════════════════════════════════════════════════
local CONFIG_FILE = "LaufeyHub_Config.json"
local RAGE_FILE   = "LaufeyHub_Rage.json"

local defaultSettings = {
    Aimbot=true, ShowFOV=true, Smoothness=0.5, FOV=150, TargetMode="Head",
    ESP=true, ESPBox=false, Tracers=false, Crosshair=false,
    Noclip=false, InfJump=false, FlyEnabled=false, FlySpeed=60, WalkSpeed=16,
    AirSlideEnabled=false, HyperSlideEnabled=false,
    FPSBoost=false, Triggerbot=false,
    RageEnabled=false, RageLimbDesync=true,
    WorldFontsEnabled=false, WorldFontsIndex=1,
    ThemeIndex=1,
}
local defaultRage = {
    VOID_TIME=5, ATTACK_TIME=0.5, BACK_OFFSET=10, VOID_Y=-500,
    HEIGHT_OFFSET=3, ORBIT_ENABLED=true, ORBIT_RADIUS=6,
    ORBIT_SPEED=180, ORBIT_HEIGHT=3,
}

local function loadSettings()
    local s={}; for k,v in pairs(defaultSettings) do s[k]=v end
    if isfile and readfile and pcall(readfile,CONFIG_FILE) then
        local ok,d=pcall(function() return HttpService:JSONDecode(readfile(CONFIG_FILE)) end)
        if ok and type(d)=="table" then for k,v in pairs(d) do if s[k]~=nil then s[k]=v end end end
    end
    return s
end

local function saveSettings()
    if not writefile then return end
    pcall(function()
        writefile(CONFIG_FILE, HttpService:JSONEncode({
            Aimbot=getgenv().Aimbot, ShowFOV=getgenv().ShowFOV,
            Smoothness=getgenv().Smoothness, FOV=getgenv().FOV,
            TargetMode=getgenv().TargetMode, ESP=getgenv().ESP,
            ESPBox=getgenv().ESPBox, Tracers=getgenv().Tracers,
            Crosshair=getgenv().Crosshair, Noclip=getgenv().Noclip,
            InfJump=getgenv().InfJump, FlyEnabled=getgenv().FlyEnabled,
            FlySpeed=getgenv().FlySpeed, WalkSpeed=getgenv().WalkSpeed,
            AirSlideEnabled=getgenv().AirSlideEnabled,
            HyperSlideEnabled=getgenv().HyperSlideEnabled or false,
            FPSBoost=getgenv().FPSBoost or false,
            Triggerbot=getgenv().Triggerbot or false,
            RageEnabled=getgenv()._rageEnabled or false,
            RageLimbDesync=getgenv().RageLimbDesync ~= false,
            WorldFontsEnabled=getgenv().WorldFontsEnabled or false,
            WorldFontsIndex=getgenv().WorldFontsIndex or 1,
            ThemeIndex=currentThemeIdx,
        }))
    end)
end

local function loadRage()
    local s={}; for k,v in pairs(defaultRage) do s[k]=v end
    if isfile and readfile and pcall(readfile,RAGE_FILE) then
        local ok,d=pcall(function() return HttpService:JSONDecode(readfile(RAGE_FILE)) end)
        if ok and type(d)=="table" then
            for k,v in pairs(d) do if s[k]~=nil then s[k]=v end end
        end
    end
    return s
end

local function saveRage()
    if not writefile then return end
    pcall(function()
        writefile(RAGE_FILE, HttpService:JSONEncode({
            VOID_TIME=getgenv().VOID_TIME, ATTACK_TIME=getgenv().ATTACK_TIME,
            BACK_OFFSET=getgenv().BACK_OFFSET, VOID_Y=getgenv().VOID_Y,
            HEIGHT_OFFSET=getgenv().HEIGHT_OFFSET, ORBIT_ENABLED=getgenv().ORBIT_ENABLED,
            ORBIT_RADIUS=getgenv().ORBIT_RADIUS, ORBIT_SPEED=getgenv().ORBIT_SPEED,
            ORBIT_HEIGHT=getgenv().ORBIT_HEIGHT,
        }))
    end)
end

-- ══════════════════════════════════════════════════════════════
--  Helpers
-- ══════════════════════════════════════════════════════════════
local function protect(gui)
    if syn and syn.protect_gui then syn.protect_gui(gui); gui.Parent=game:GetService("CoreGui")
    elseif gethui then gui.Parent=gethui()
    else gui.Parent=game:GetService("CoreGui") end
end
local function uiCorner(p,r) local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r or 10); c.Parent=p; return c end
local function uiStroke(p,col,thick,trans) local s=Instance.new("UIStroke"); s.Color=col or C.ACCENT; s.Thickness=thick or 1.5; s.Transparency=trans or 0.25; s.Parent=p; return s end
local function tw(obj,t,props,style,dir)
    local t2=TweenService:Create(obj,TweenInfo.new(t,style or Enum.EasingStyle.Quint,dir or Enum.EasingDirection.Out),props)
    t2:Play(); return t2
end

-- ══════════════════════════════════════════════════════════════
--  Aimbot / ESP helpers
-- ══════════════════════════════════════════════════════════════
local function getTargetPart(char,mode)
    if mode=="Head" then return char:FindFirstChild("HeadHB") or char:FindFirstChild("Head")
    elseif mode=="Body" then return char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart")
    else return char:FindFirstChild("LeftFoot") or char:FindFirstChild("RightFoot") or char:FindFirstChild("Left Leg") or char:FindFirstChild("Right Leg") end
end
local function hpColor(pct)
    if pct>0.7 then return Color3.new(0.2,0.85,0.3) elseif pct>0.3 then return Color3.new(1,0.85,0.2) else return Color3.new(1,0.25,0.3) end
end
local function createOverheadGui(head)
    local bb=Instance.new("BillboardGui"); bb.Name="HealthDisplay"; bb.Size=UDim2.new(4,0,1,0)
    bb.StudsOffset=Vector3.new(0,3,0); bb.AlwaysOnTop=true; bb.Parent=head
    local l=Instance.new("TextLabel"); l.Size=UDim2.fromScale(1,1); l.BackgroundTransparency=1
    l.TextScaled=true; l.TextColor3=Color3.new(1,1,1); l.TextStrokeTransparency=0
    l.Font=Enum.Font.GothamBold; l.Parent=bb; return l
end
local function updatePlayerDisplay(player,lbl,hl)
    local char=player.Character; local hum=char and char:FindFirstChildOfClass("Humanoid")
    if not hum then
        if lbl then lbl.Text="Dead"; lbl.TextColor3=Color3.new(1,1,1) end
        if hl then hl:Destroy() end; return
    end
    local pct=hum.Health/hum.MaxHealth; local col=hpColor(pct)
    if lbl then lbl.Text=string.format("❤️ %d",math.floor(hum.Health)); lbl.TextColor3=col end
    if hl then hl.FillColor=col; hl.OutlineColor=col end
end

-- ══════════════════════════════════════════════════════════════
--  Ragebot internals
-- ══════════════════════════════════════════════════════════════
local _cleanRemote=Instance.new("RemoteEvent")
local fireServerNative=clonefunction(_cleanRemote.FireServer); _cleanRemote:Destroy()
local cachedEnumLib
local function enc(name)
    if not cachedEnumLib then
        local mod=RStorage:FindFirstChild("Modules") and RStorage.Modules:FindFirstChild("EnumLibrary")
        if mod then local ok,lib=pcall(require,mod); if ok and type(lib)=="table" then cachedEnumLib=lib end end
    end
    if not cachedEnumLib then return nil end
    local ok,token=pcall(cachedEnumLib.ToEnum,cachedEnumLib,name); return ok and token or nil
end
local cachedFC
local function getFighterController()
    if cachedFC and rawget(cachedFC,"Objects") then return cachedFC end
    for _,m in ipairs(getgc(true)) do
        if type(m)=="table" and rawget(m,"LocalFighter")~=nil and rawget(m,"Objects")~=nil then cachedFC=m; return m end
    end
end
local function getLocalFighter() local c=getFighterController(); return c and rawget(c,"LocalFighter") or nil end
local function isEnemy(player)
    if player==nil or player==LocalPlayer then return false end
    local a,b=LocalPlayer:GetAttribute("TeamID"),player:GetAttribute("TeamID")
    if a~=nil and b~=nil then return a~=b end
    if LocalPlayer.Team~=nil and player.Team~=nil then return LocalPlayer.Team~=player.Team end
    return true
end
local function getRageTarget()
    local ctrl=getFighterController(); local objs=ctrl and rawget(ctrl,"Objects")
    if type(objs)~="table" then return nil end
    local best,bestD=nil,math.huge
    local myRoot=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local myPos=myRoot and myRoot.Position or Vector3.new()
    for _,fighter in ipairs(objs) do
        local player=rawget(fighter,"Player")
        if player==nil or isEnemy(player) then
            local entity=rawget(fighter,"Entity"); local model=entity and rawget(entity,"Model")
            if model then
                local hb=model:FindFirstChild("HitboxHead"); local hum=model:FindFirstChildOfClass("Humanoid")
                if hb and (not hum or hum.Health>0) then
                    local d=(hb.Position-myPos).Magnitude
                    if d<bestD then bestD=d; best={hitboxHead=hb,model=model} end
                end
            end
        end
    end
    return best
end
local function getNearestPlayer()
    local myRoot=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    local nc,nd=nil,math.huge
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer then
            local char=p.Character; local root=char and char:FindFirstChild("HumanoidRootPart")
            local hum=char and char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health>0 then
                local d=(root.Position-myRoot.Position).Magnitude
                if d<nd then nd=d; nc=char end
            end
        end
    end
    return nc
end
local function buildPayload(hb,isRay)
    local pos=hb.Position
    local a1={["\0"]=pos.X,["\1"]=pos.Y,["\2"]=pos.Z,["\3"]=-math.pi/2,["\4"]=0,["\5"]=0}
    local a2={["\0"]=pos.X,["\1"]=pos.Y+1,["\2"]=pos.Z,["\3"]=-math.pi/2,["\4"]=0,["\5"]=0}
    local ex={["\0"]=0,["\1"]=1,["\2"]=0,["\3"]=0,["\4"]=0,["\5"]=0}
    local inner={["\0"]=a1,["\1"]=a2,["\2"]=hb,["\3"]=ex}
    if isRay then return{["\1"]=inner,["\2"]=true} end; return{["\1"]=inner}
end
local function getEquippedGun(fighter)
    local items=rawget(fighter,"Items"); if type(items)~="table" then return nil end
    for _,item in next,items do
        if type(item)=="table" and rawget(item,"IsEquipped") then
            local info=rawget(item,"Info"); if info and rawget(info,"Type")=="Gun" then
                local data=rawget(item,"Data"); if data and (rawget(data,"Ammo") or 0)>0 then return item end
            end
        end
    end
end
local rageRemote
local function getRageRemote()
    if rageRemote then return rageRemote end
    local r=RStorage:FindFirstChild("Remotes") and RStorage.Remotes:FindFirstChild("Replication")
        and RStorage.Remotes.Replication:FindFirstChild("Fighter")
        and RStorage.Remotes.Replication.Fighter:FindFirstChild("UseItem")
    if r and r:IsA("RemoteEvent") then rageRemote=cloneref(r) end
    return rageRemote
end
local function fireAtTarget(fighter,target)
    local remote=getRageRemote(); if not remote then return end
    local item=getEquippedGun(fighter); if not item then return end
    local data=rawget(item,"Data"); local objectId=data and rawget(data,"ObjectID")
    local info=rawget(item,"Info"); local isRay=info and rawget(info,"IsRaycast")==true
    local token=enc("StartShooting"); if not objectId or not token then return end
    fireServerNative(remote,objectId,token,buildPayload(target.hitboxHead,isRay),nil)
end

-- ══════════════════════════════════════════════════════════════
--  Rage Limb Desync module
-- ══════════════════════════════════════════════════════════════
local RageLimbDesync = (function()
    local RS = game:GetService("RunService")
    local LP = Players.LocalPlayer
    local active = false
    local conn1, conn2
    
    local function onCharacter()
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end
        
        hum.PlatformStand = true
        
        conn1 = RS.Stepped:Connect(function()
            if not active or not char.Parent then return end
            local moveDir = hum.MoveDirection
            
            if moveDir.Magnitude > 0 then
                hrp.Velocity = moveDir * 150 + Vector3.new(0, hrp.Velocity.Y, 0)
            else
                hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0)
            end
            
            if hrp.Position.Y < -100 then
                hrp.CFrame = CFrame.new(hrp.Position.X, 50, hrp.Position.Z)
                hrp.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    end
    
    local M = {}
    function M.Enable()
        if active then return end
        active = true
        onCharacter()
        conn2 = LP.CharacterAdded:Connect(function(c)
            task.wait(1)
            if active then onCharacter() end
        end)
    end
    function M.Disable()
        if not active then return end
        active = false
        if conn1 then conn1:Disconnect() end
        if conn2 then conn2:Disconnect() end
        local char = LP.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.PlatformStand = false end
        end
    end
    function M.Active() return active end
    return M
end)()

-- ══════════════════════════════════════════════════════════════
--  AirSlide module (Exact Pastefy Logic)
-- ══════════════════════════════════════════════════════════════
local AirSlide = (function()
    local RS=game:GetService("RunService"); local UIS=game:GetService("UserInputService"); local LP=Players.LocalPlayer
    local v1=nil; local v2=false; local inputConn=nil
    
    local function f1(index)
        if v1 then v1:Destroy() end
        local floor=Instance.new("Part"); floor.Name="RivalsAntiStuckAirFloor"
        floor.Size=Vector3.new(8,0.2,8); floor.Anchored=true; floor.CanCollide=true
        floor.Transparency=1; floor.Material=Enum.Material.SmoothPlastic; floor.Friction=0
        floor.Parent=workspace; v1=floor
        
        local conn
        conn=RS.PreRender:Connect(function()
            if index and index.Parent then
                if Vector3.new(index.AssemblyLinearVelocity.X,0,index.AssemblyLinearVelocity.Z).Magnitude<5 then
                    v2=false
                end
            end
            if not v2 or not index or not index.Parent or v1~=floor then
                if conn then conn:Disconnect() end; floor:Destroy(); return
            end
            floor.CFrame=index.CFrame*CFrame.new(0,-3,0)
        end)
    end

    local function f2()
        local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); local hum=char and char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or v2 then return end
        if hum.FloorMaterial==Enum.Material.Air then
            v2=true; f1(hrp)
            local total=0; while v2 and total<0.4 do task.wait(0.01); total+=0.01 end
            v2=false
            if v1 then v1:Destroy(); v1=nil end
        end
    end

    local M={}
    function M.Enable()
        if inputConn then return end
        inputConn=UIS.InputBegan:Connect(function(input,gp)
            if gp then return end
            if input.KeyCode==Enum.KeyCode.LeftControl or input.KeyCode==Enum.KeyCode.C or input.UserInputType==Enum.UserInputType.Touch then
                task.defer(function()
                    local char=LP.Character; local hum=char and char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.FloorMaterial==Enum.Material.Air then f2() end
                end)
            end
        end)
    end
    function M.Disable()
        if inputConn then inputConn:Disconnect(); inputConn=nil end
        v2=false
        if v1 then v1:Destroy(); v1=nil end
    end
    function M.Active() return inputConn~=nil end
    return M
end)()

-- ══════════════════════════════════════════════════════════════
--  HyperSlide module
-- ══════════════════════════════════════════════════════════════
local HyperSlide = (function()
    local LP=Players.LocalPlayer; local RS=game:GetService("RunService")
    local mech=nil; local ceilingPart=nil; local renderConn=nil; local active=false
    local function ensureCeiling()
        if ceilingPart and ceilingPart.Parent then return ceilingPart end
        local p=Instance.new("Part"); p.Name="HyperSlideCeiling"; p.Size=Vector3.new(8,0.3,8)
        p.Anchored=true; p.CanCollide=true; p.Transparency=1; p.CanQuery=false; p.CanTouch=false
        p.Material=Enum.Material.SmoothPlastic; p.Parent=workspace; ceilingPart=p; return p
    end
    local function tryLoadMech()
        if mech then return true end
        local ps=LP:FindFirstChild("PlayerScripts"); if not ps then return false end
        local ctrl=ps:FindFirstChild("Controllers"); if not ctrl then return false end
        local mc=ctrl:FindFirstChild("MechanicsController"); if not mc then return false end
        local ok,m=pcall(require,mc); if ok and type(m)=="table" then mech=m; return true end
        return false
    end
    local M={}
    function M.Enable()
        if active then return end
        active=true; ensureCeiling(); tryLoadMech()
        renderConn=RS.RenderStepped:Connect(function()
            if not active then return end
            if not mech then tryLoadMech(); if not mech then return end end
            if mech._sliding_cooldown and mech._sliding_cooldown>0 then mech._sliding_cooldown=0 end
            local char=LP.Character; local root=char and char:FindFirstChild("HumanoidRootPart")
            if root and ceilingPart and ceilingPart.Parent then
                ceilingPart.CFrame=CFrame.new(root.Position+Vector3.new(0,2.42,0))
            end
        end)
    end
    function M.Disable()
        active=false
        if renderConn then renderConn:Disconnect(); renderConn=nil end
        if ceilingPart then pcall(function() ceilingPart:Destroy() end); ceilingPart=nil end
    end
    function M.Active() return active end
    function M.HasMech() return mech~=nil end
    return M
end)()

-- ══════════════════════════════════════════════════════════════
--  World Fonts module
-- ══════════════════════════════════════════════════════════════
local WorldFonts = (function()
    local FONTS={
        {name="Fracture",font=Enum.Font.Fondamento},
        {name="Creepster",font=Enum.Font.Creepster},
        {name="Arcade",font=Enum.Font.Arcade},
        {name="Sci-Fi",font=Enum.Font.SciFi},
        {name="Cartoon",font=Enum.Font.Cartoon},
        {name="Bodoni",font=Enum.Font.Bodoni},
        {name="Antique",font=Enum.Font.Antique},
        {name="Fantasy",font=Enum.Font.Fantasy},
        {name="Code",font=Enum.Font.Code},
        {name="Highway",font=Enum.Font.Highway},
    }
    local originals={}; local active=false; local currentIdx=1
    local function applyToInstance(d,fontEnum)
        if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
            if originals[d]==nil then
                originals[d]=d.Font
                d.Destroying:Connect(function() originals[d]=nil end)
            end
            pcall(function() d.Font=fontEnum end)
        end
    end
    local M={}
    function M.Enable(idx)
        if active then currentIdx=idx or currentIdx else active=true; currentIdx=idx or 1 end
        for _,root in ipairs({workspace, LocalPlayer:FindFirstChild("PlayerGui")}) do
            if root then
                for _,d in ipairs(root:GetDescendants()) do applyToInstance(d,FONTS[currentIdx].font) end
            end
        end
    end
    function M.Disable()
        active=false
        for inst,orig in pairs(originals) do
            if inst and inst.Parent then pcall(function() inst.Font=orig end) end
        end
        originals={}
    end
    function M.Active() return active end
    function M.CurrentName() return FONTS[currentIdx].name end
    function M.FontList() return FONTS end
    return M
end)()

-- ══════════════════════════════════════════════════════════════
--  FPS Boost module
-- ══════════════════════════════════════════════════════════════
local FPSBoost = (function()
    local stored={}; local active=false; local scanConn=nil
    local function strip(inst)
        if inst:IsA("ParticleEmitter") or inst:IsA("Smoke") or inst:IsA("Fire") or inst:IsA("Sparkles") then
            if stored[inst]==nil then stored[inst]=inst.Enabled end
            inst.Enabled=false
        elseif inst:IsA("Decal") or inst:IsA("Texture") then
            if stored[inst]==nil then stored[inst]=inst.Transparency end
            inst.Transparency=1
        elseif inst:IsA("Trail") then
            if stored[inst]==nil then stored[inst]=inst.Enabled end
            inst.Enabled=false
        elseif inst:IsA("Atmosphere") then
            if stored[inst]==nil then stored[inst]=inst.Density end
            inst.Density=0
        end
    end
    local M={}
    function M.Enable()
        if active then return end
        active=true; getgenv().FPSBoost=true
        for _,d in ipairs(workspace:GetDescendants()) do strip(d) end
        pcall(function()
            local L=game:GetService("Lighting")
            for _,d in ipairs(L:GetDescendants()) do strip(d) end
            L.GlobalShadows=false; L.FogEnd=100000; L.Brightness=2
        end)
        scanConn=workspace.DescendantAdded:Connect(function(d) if active then strip(d) end end)
    end
    function M.Disable()
        if not active then return end
        active=false; getgenv().FPSBoost=false
        if scanConn then scanConn:Disconnect(); scanConn=nil end
        for inst,val in pairs(stored) do
            if inst and inst.Parent then
                pcall(function()
                    if inst:IsA("ParticleEmitter") or inst:IsA("Trail") or inst:IsA("Smoke") or inst:IsA("Fire") or inst:IsA("Sparkles") then inst.Enabled=val
                    elseif inst:IsA("Decal") or inst:IsA("Texture") then inst.Transparency=val
                    elseif inst:IsA("Atmosphere") then inst.Density=val end
                end)
            end
        end
        stored={}
        pcall(function()
            local L=game:GetService("Lighting"); L.GlobalShadows=true; L.Brightness=1
        end)
    end
    function M.Active() return active end
    return M
end)()

-- ══════════════════════════════════════════════════════════════
--  Triggerbot module
-- ══════════════════════════════════════════════════════════════
local Triggerbot = (function()
    local Mouse=LocalPlayer:GetMouse(); local RS=game:GetService("RunService")
    local active=false; local renderConn=nil; local lastClick=0; local cooldown=0.1
    local M={}
    function M.Enable()
        if active then return end
        active=true; getgenv().Triggerbot=true
        renderConn=RS.RenderStepped:Connect(function()
            if not active then return end
            if tick()-lastClick<cooldown then return end
            local target=Mouse.Target; if not target then return end
            local parent=target.Parent; if not parent then return end
            local hum=parent:FindFirstChildOfClass("Humanoid")
            if not hum or hum.Health<=0 then return end
            local tPlayer=Players:GetPlayerFromCharacter(parent)
            if tPlayer then
                local lpTeam=LocalPlayer:GetAttribute("TeamID")
                local tTeam=tPlayer:GetAttribute("TeamID")
                if lpTeam and tTeam and lpTeam==tTeam then return end
            end
            pcall(function() mouse1click() end)
            lastClick=tick()
        end)
    end
    function M.Disable()
        if not active then return end
        active=false; getgenv().Triggerbot=false
        if renderConn then renderConn:Disconnect(); renderConn=nil end
    end
    function M.Active() return active end
    return M
end)()

-- ══════════════════════════════════════════════════════════════
--  Hub builder
-- ══════════════════════════════════════════════════════════════
local function buildHub(root)
    local lp=LocalPlayer; local cam=workspace.CurrentCamera; local running=true

    local saved=loadSettings(); local savedRage=loadRage()
    for k,v in pairs(saved) do getgenv()[k]=v end
    for k,v in pairs(savedRage) do getgenv()[k]=v end
    getgenv()._rageEnabled = saved.RageEnabled or false
    getgenv().RageLimbDesync = saved.RageLimbDesync ~= false

    currentThemeIdx = math.clamp(saved.ThemeIndex or 1, 1, #THEMES)
    for k,v in pairs(THEMES[currentThemeIdx]) do C[k]=v end

    if getgenv().AirSlideEnabled then AirSlide.Enable() end
    if getgenv().WorldFontsEnabled then WorldFonts.Enable(getgenv().WorldFontsIndex or 1) end

    local hub=Instance.new("Frame"); hub.Name="Hub"
    hub.AnchorPoint=Vector2.new(0.5,0.5); hub.Position=UDim2.fromScale(0.5,0.5)
    hub.Size=UDim2.new(0,0,0,0); hub.BackgroundColor3=C.BLACK
    hub.BorderSizePixel=0; hub.ZIndex=2; hub.Parent=root
    uiCorner(hub,8); local hubStroke=uiStroke(hub,C.ACCENT,1.5,0.2)

    tw(hub,0.4,{Size=UDim2.new(0,HUB_W,0,HUB_H)},Enum.EasingStyle.Back)

    local topBar=Instance.new("Frame"); topBar.AnchorPoint=Vector2.new(0,0)
    topBar.Position=UDim2.new(0,0,0,0); topBar.Size=UDim2.new(1,0,0,24)
    topBar.BackgroundColor3=C.DARK; topBar.BorderSizePixel=0; topBar.ZIndex=3; topBar.Parent=hub
    uiCorner(topBar,8)
    local topBarCover=Instance.new("Frame"); topBarCover.Position=UDim2.new(0,0,1,-8)
    topBarCover.Size=UDim2.new(1,0,0,8); topBarCover.BackgroundColor3=C.DARK; topBarCover.BorderSizePixel=0; topBarCover.ZIndex=3; topBarCover.Parent=topBar

    local title=Instance.new("TextLabel"); title.BackgroundTransparency=1
    title.Position=UDim2.new(0,8,0,0); title.Size=UDim2.new(1,-80,1,0)
    title.Font=Enum.Font.GothamBold; title.TextSize=11; title.TextColor3=C.ACCENT
    title.TextXAlignment=Enum.TextXAlignment.Left; title.Text="Laufey.lol"; title.ZIndex=4; title.Parent=topBar

    local closeBtn=Instance.new("TextButton")
    closeBtn.AnchorPoint=Vector2.new(1,0.5); closeBtn.Position=UDim2.new(1,-6,0.5,0)
    closeBtn.Size=UDim2.fromOffset(18,18); closeBtn.BackgroundColor3=C.DANGER
    closeBtn.AutoButtonColor=false; closeBtn.Text="X"; closeBtn.Font=Enum.Font.GothamBold
    closeBtn.TextSize=12; closeBtn.TextColor3=C.INK; closeBtn.ZIndex=5; closeBtn.Parent=topBar
    uiCorner(closeBtn,4)

    local dragging,dragStart,startPos=false,nil,nil
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=true; dragStart=input.Position; startPos=hub.Position
        end
    end)
    topBar.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
            local d=input.Position-dragStart
            hub.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
        end
    end)

    local sidebar=Instance.new("Frame"); sidebar.AnchorPoint=Vector2.new(0,0)
    sidebar.Position=UDim2.new(0,0,0,24); sidebar.Size=UDim2.new(0,SIDEBAR_W,1,-24)
    sidebar.BackgroundColor3=C.DARK; sidebar.BorderSizePixel=0; sidebar.ZIndex=3; sidebar.Parent=hub
    uiCorner(sidebar,8)

    local portraitRing=Instance.new("Frame"); portraitRing.AnchorPoint=Vector2.new(0.5,0)
    portraitRing.Position=UDim2.new(0.5,0,0,10); portraitRing.Size=UDim2.new(1,-20,0,120)
    portraitRing.BackgroundColor3=C.BLACK; portraitRing.BorderSizePixel=0; portraitRing.ZIndex=4; portraitRing.Parent=sidebar; uiCorner(portraitRing,6)

    local portrait=Instance.new("ImageLabel"); portrait.AnchorPoint=Vector2.new(0.5,0.5)
    portrait.Position=UDim2.fromScale(0.5,0.5); portrait.Size=UDim2.new(1,-4,1,-4)
    portrait.BackgroundTransparency=1; portrait.Image=IMAGE_ID
    portrait.ScaleType=Enum.ScaleType.Crop; portrait.ZIndex=5; portrait.Parent=portraitRing; uiCorner(portrait,4)

    local themeLbl=Instance.new("TextLabel"); themeLbl.BackgroundTransparency=1
    themeLbl.AnchorPoint=Vector2.new(0.5,0); themeLbl.Position=UDim2.new(0.5,0,0,140)
    themeLbl.Size=UDim2.new(1,-8,0,10); themeLbl.Text="THEME"; themeLbl.Font=Enum.Font.GothamBold
    themeLbl.TextSize=9; themeLbl.TextColor3=C.MUTED; themeLbl.TextXAlignment=Enum.TextXAlignment.Center; themeLbl.Parent=sidebar

    local themeBtns={}
    local themeRow=Instance.new("Frame"); themeRow.AnchorPoint=Vector2.new(0.5,0)
    themeRow.Position=UDim2.new(0.5,0,0,154); themeRow.Size=UDim2.new(1,-16,0,20)
    themeRow.BackgroundTransparency=1; themeRow.Parent=sidebar

    local rightArea=Instance.new("Frame"); rightArea.AnchorPoint=Vector2.new(1,0)
    rightArea.Position=UDim2.fromScale(1,0); rightArea.Size=UDim2.new(1,-SIDEBAR_W,1,-24)
    rightArea.BackgroundTransparency=1; rightArea.ZIndex=3; rightArea.Parent=hub

    local TAB_NAMES={"Combat","Player","Visual","Ragebot","AirSlide","Misc"}
    local tabBar=Instance.new("Frame"); tabBar.AnchorPoint=Vector2.new(0,0)
    tabBar.Position=UDim2.new(0,6,0,6); tabBar.Size=UDim2.new(1,-12,0,20)
    tabBar.BackgroundTransparency=1; tabBar.ZIndex=4; tabBar.Parent=rightArea

    local tabBtns={}; local tabPages={}
    local activeTabName="Combat"

    local contentArea=Instance.new("Frame"); contentArea.AnchorPoint=Vector2.new(0,0)
    contentArea.Position=UDim2.new(0,6,0,30); contentArea.Size=UDim2.new(1,-12,1,-36)
    contentArea.BackgroundTransparency=1; contentArea.ZIndex=3; contentArea.ClipsDescendants=true
    contentArea.Parent=rightArea

    local function makeTab(name,idx)
        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(1/#TAB_NAMES,0,1,0); btn.Position=UDim2.new((idx-1)/#TAB_NAMES,0,0,0)
        btn.BackgroundTransparency=1; btn.AutoButtonColor=false; btn.Text=name
        btn.Font=Enum.Font.GothamBold; btn.TextSize=10; btn.TextColor3=C.MUTED
        btn.BorderSizePixel=0; btn.ZIndex=5; btn.Parent=tabBar; tabBtns[name]=btn
        local page=Instance.new("Frame"); page.Size=UDim2.fromScale(1,1)
        page.BackgroundTransparency=1; page.Visible=false; page.ZIndex=3; page.Parent=contentArea
        tabPages[name]=page; return page
    end

    local function switchTab(name)
        activeTabName=name
        for n,p in pairs(tabPages) do
            p.Visible=n==name
            tw(tabBtns[n],0.15,{TextColor3=n==name and C.ACCENT or C.MUTED})
        end
    end

    for i,name in ipairs(TAB_NAMES) do makeTab(name,i); tabBtns[name].MouseButton1Click:Connect(function() switchTab(name) end) end

    local COL_W=(HUB_W-SIDEBAR_W-24)/2
    local ROW_H=28
    local GAP=4
    local function cell(col,row) return col*(COL_W+GAP)+4, row*(ROW_H+GAP)+4 end

    local function gridBtn(page,text,col,row,state)
        local b=Instance.new("TextButton"); b.AnchorPoint=Vector2.new(0,0)
        b.Position=UDim2.fromOffset(cell(col,row)); b.Size=UDim2.fromOffset(COL_W,ROW_H)
        b.BackgroundColor3=C.PANEL; b.AutoButtonColor=false
        b.Text="  "..text; b.Font=Enum.Font.GothamMedium; b.TextSize=11; b.TextColor3=C.INK
        b.TextXAlignment=Enum.TextXAlignment.Left
        b.ZIndex=4; b.Parent=page; uiCorner(b,4)
        
        local box=Instance.new("Frame"); box.AnchorPoint=Vector2.new(0,0.5)
        box.Position=UDim2.new(0,8,0.5,0); box.Size=UDim2.fromOffset(12,12)
        box.BackgroundColor3 = state and C.ACCENT or C.OFF
        box.BorderSizePixel=0; box.ZIndex=5; box.Parent=b; uiCorner(box,3)
        b:SetAttribute("Box", box)
        
        b.MouseEnter:Connect(function() if not b:GetAttribute("Hovering") then b.BackgroundColor3 = C.SOFT end end)
        b.MouseLeave:Connect(function() 
            if b:GetAttribute("IsOn") then b.BackgroundColor3 = C.ON else b.BackgroundColor3 = C.PANEL end
        end)
        return b
    end

    local function gridInput(page,labelText,col,row,default)
        local x,y=cell(col,row)
        local row2=Instance.new("Frame"); row2.Position=UDim2.fromOffset(x,y)
        row2.Size=UDim2.fromOffset(COL_W,ROW_H); row2.BackgroundColor3=C.PANEL; row2.ZIndex=4; row2.Parent=page
        uiCorner(row2,4)
        local lbl=Instance.new("TextLabel"); lbl.BackgroundTransparency=1
        lbl.Position=UDim2.new(0,8,0,0); lbl.Size=UDim2.new(0.55,0,1,0)
        lbl.Text=labelText; lbl.Font=Enum.Font.Gotham; lbl.TextSize=11
        lbl.TextColor3=C.MUTED; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.ZIndex=5; lbl.Parent=row2
        local box=Instance.new("TextBox"); box.AnchorPoint=Vector2.new(1,0.5)
        box.Position=UDim2.new(1,-6,0.5,0); box.Size=UDim2.new(0,45,0,18)
        box.BackgroundColor3=C.DARK; box.Text=tostring(default); box.Font=Enum.Font.GothamMedium
        box.TextSize=11; box.TextColor3=C.INK; box.ClearTextOnFocus=false; box.ZIndex=5; box.Parent=row2
        uiCorner(box,4)
        return box
    end

    local function mkHeader(page, text, row)
        local l=Instance.new("TextLabel"); l.BackgroundTransparency=1
        l.Position=UDim2.new(0,4,0,row*(ROW_H+GAP)+4)
        l.Size=UDim2.new(1,0,0,16); l.Text=text; l.Font=Enum.Font.GothamBold
        l.TextSize=10; l.TextColor3=C.MUTED; l.TextXAlignment=Enum.TextXAlignment.Left; l.ZIndex=4; l.Parent=page
        return l
    end

    -- COMBAT
    local cp=tabPages["Combat"]
    local aimBtn    =gridBtn(cp, "Aimbot", 0,0,getgenv().Aimbot)
    local fovBtn    =gridBtn(cp, "Show FOV", 1,0,getgenv().ShowFOV)
    local espBtn    =gridBtn(cp, "ESP", 0,1,getgenv().ESP)
    local espBoxBtn =gridBtn(cp, "ESP Box", 1,1,getgenv().ESPBox)
    local tracerBtn =gridBtn(cp, "Tracers", 0,2,getgenv().Tracers)
    local crossBtn  =gridBtn(cp, "Crosshair", 1,2,getgenv().Crosshair)
    local smoothBox =gridInput(cp,"Smooth",0,3,getgenv().Smoothness)
    local fovBox    =gridInput(cp,"FOV",1,3,getgenv().FOV)

    local tgtRow=Instance.new("Frame"); local tx,ty=cell(0,4)
    tgtRow.Position=UDim2.fromOffset(tx,ty); tgtRow.Size=UDim2.fromOffset(COL_W*2+GAP,ROW_H)
    tgtRow.BackgroundTransparency=1; tgtRow.ZIndex=4; tgtRow.Parent=cp
    local targetBtns={}
    local tgtW=(COL_W*2+GAP)/3
    for i,mode in ipairs({"Head","Body","Foot"}) do
        local b=Instance.new("TextButton"); b.Size=UDim2.fromOffset(tgtW-2,ROW_H)
        b.Position=UDim2.fromOffset((i-1)*tgtW,0); b.AutoButtonColor=false; b.Text=mode
        b.Font=Enum.Font.GothamMedium; b.TextSize=11; b.TextColor3=C.INK; b.BackgroundColor3=C.PANEL
        b.ZIndex=5; b.Parent=tgtRow; uiCorner(b,4); targetBtns[mode]=b
    end

    -- PLAYER
    local pp=tabPages["Player"]
    mkHeader(pp, "movement", 0)
    local noclipBtn  =gridBtn(pp,"Noclip", 0,1,getgenv().Noclip)
    local infJumpBtn =gridBtn(pp,"Inf Jump", 1,1,getgenv().InfJump)
    local flyBtn     =gridBtn(pp,"Fly", 0,2,getgenv().FlyEnabled)
    
    mkHeader(pp, "character", 3)
    local flySpBox   =gridInput(pp,"Fly Speed", 0,4,getgenv().FlySpeed)
    local walkSpBox  =gridInput(pp,"Walk Speed", 1,4,getgenv().WalkSpeed)

    -- VISUAL
    local vp=tabPages["Visual"]
    local fullbrightBtn=gridBtn(vp,"Fullbright",0,0,false)
    local chatSpyBtn   =gridBtn(vp,"Chat Spy", 1,0,false)

    local fontsToggleBtn=gridBtn(vp, "World Fonts", 0,1,getgenv().WorldFontsEnabled)
    
    local fontScroll=Instance.new("ScrollingFrame")
    fontScroll.Position=UDim2.fromOffset(cell(0,2))
    fontScroll.Size=UDim2.fromOffset(COL_W*2+GAP, ROW_H*4+GAP*3)
    fontScroll.BackgroundColor3=C.PANEL; fontScroll.BorderSizePixel=0
    fontScroll.ScrollBarThickness=3; fontScroll.ScrollBarImageColor3=C.ACCENT
    fontScroll.CanvasSize=UDim2.fromOffset(0, math.ceil(#WorldFonts.FontList()/2)*(ROW_H+GAP)+GAP)
    fontScroll.ZIndex=4; fontScroll.Parent=vp; uiCorner(fontScroll,4)

    local fontBtns={}
    local function refreshFontBtns()
        local active = getgenv().WorldFontsEnabled
        local cur = getgenv().WorldFontsIndex or 1
        for i,b in ipairs(fontBtns) do
            b.TextColor3 = (active and i==cur) and C.ACCENT or C.INK
        end
    end

    for i,entry in ipairs(WorldFonts.FontList()) do
        local col=(i-1)%2; local row=math.floor((i-1)/2)
        local b=Instance.new("TextButton")
        b.Position=UDim2.fromOffset(GAP+col*(COL_W/2), GAP+row*(ROW_H+GAP))
        b.Size=UDim2.fromOffset(COL_W/2-GAP-2, ROW_H)
        b.BackgroundTransparency=1; b.AutoButtonColor=false
        b.Text=entry.name; b.Font=Enum.Font.GothamMedium; b.TextSize=11; b.TextColor3=C.INK
        b.BorderSizePixel=0; b.ZIndex=5; b.Parent=fontScroll
        b.MouseButton1Click:Connect(function()
            getgenv().WorldFontsIndex = i
            if not getgenv().WorldFontsEnabled then
                getgenv().WorldFontsEnabled = true
                fontsToggleBtn:GetAttribute("Box").BackgroundColor3 = C.ACCENT
            end
            WorldFonts.Enable(i)
            refreshFontBtns()
            saveSettings()
        end)
        fontBtns[i]=b
    end
    refreshFontBtns()

    -- RAGEBOT
    local rp=tabPages["Ragebot"]
    local rageToggleBtn=gridBtn(rp, "Ragebot", 0,0,getgenv()._rageEnabled)
    local desyncBtn = gridBtn(rp, "Limb Desync", 1,0, getgenv().RageLimbDesync)
    local orbitBtn=gridBtn(rp,"Orbit",0,1,true)
    local voidTBox=gridInput(rp,"Void T",1,1,getgenv().VOID_TIME)
    local atkTBox=gridInput(rp,"Atk T",0,2,getgenv().ATTACK_TIME)
    local backBox=gridInput(rp,"Back",1,2,getgenv().BACK_OFFSET)
    local heightBox=gridInput(rp,"Height",0,3,getgenv().HEIGHT_OFFSET)
    local voidYBox=gridInput(rp,"Void Y",1,3,getgenv().VOID_Y)
    local radiusBox=gridInput(rp,"Rad",0,4,getgenv().ORBIT_RADIUS)
    local speedBox=gridInput(rp,"Speed",1,4,getgenv().ORBIT_SPEED)
    
    local function wireRageInput(box,key)
        box.FocusLost:Connect(function()
            local num=tonumber(box.Text)
            if num then getgenv()[key]=num; saveRage() else box.Text=tostring(getgenv()[key]) end
        end)
    end
    wireRageInput(voidTBox,"VOID_TIME")
    wireRageInput(atkTBox,"ATTACK_TIME")
    wireRageInput(backBox,"BACK_OFFSET")
    wireRageInput(heightBox,"HEIGHT_OFFSET")
    wireRageInput(voidYBox,"VOID_Y")
    wireRageInput(radiusBox,"ORBIT_RADIUS")
    wireRageInput(speedBox,"ORBIT_SPEED")

    -- AIRSLIDE (Clean buttons only)
    local asp=tabPages["AirSlide"]
    local asToggleBtn =gridBtn(asp, "AirSlide", 0,0,getgenv().AirSlideEnabled)
    local hsToggleBtn =gridBtn(asp, "HyperSlide", 1,0,false)

    -- MISC
    local mp=tabPages["Misc"]
    local fpsBtn = gridBtn(mp, "FPS Boost", 0,0, getgenv().FPSBoost)
    local trigBtn = gridBtn(mp, "Triggerbot", 1,0, getgenv().Triggerbot)
    local valHandsBtn  =gridBtn(mp,"Val Hands",     0,1,false)
    local killSndBtn   =gridBtn(mp,"Kill Sound",    1,1,false)
    local spoofBtn     =gridBtn(mp,"Rivals Spoof",  0,2,false)
    local alyaBtn      =gridBtn(mp,"Alya Texture",  1,2,false)
    local dracoBtn     =gridBtn(mp,"Draco",         0,3,false)
    local stretchBtn   =gridBtn(mp,"Stretched FOV", 1,3,false)
    local rickBtn      =gridBtn(mp,"Rick",          0,4,false)
    local saveBtn      =gridBtn(mp,"Save Config",   1,4,true)

    -- THEME SWITCHER & TOGGLES
    local function applyTheme(idx)
        idx = math.clamp(idx or 1, 1, #THEMES)
        currentThemeIdx = idx
        local th = THEMES[idx]
        for k,v in pairs(th) do C[k]=v end
        hub.BackgroundColor3 = th.BLACK
        hubStroke.Color = th.ACCENT
        topBar.BackgroundColor3 = th.DARK
        topBarCover.BackgroundColor3 = th.DARK
        title.TextColor3 = th.ACCENT
        sidebar.BackgroundColor3 = th.DARK
        portraitRing.BackgroundColor3 = th.BLACK
        for n,b in pairs(tabBtns) do b.TextColor3 = n==activeTabName and th.ACCENT or th.MUTED end
        for i,b in ipairs(themeBtns) do
            if i==idx then b.BackgroundColor3=th.ACCENT; b.TextColor3=th.BLACK
            else b.BackgroundColor3=th.OFF; b.TextColor3=th.INK end
        end
        for _,d in ipairs(root:GetDescendants()) do
            if d:IsA("UIStroke") then
                local skip = false
                for _,tl in ipairs(themeBtns) do if d.Parent==tl then skip=true break end end
                if not skip then pcall(function() d.Color=th.ACCENT end) end
            end
            if d:IsA("TextButton") and d:GetAttribute("Box") then
                local isOn = d:GetAttribute("IsOn")
                d.BackgroundColor3 = isOn and th.ACCENT or th.PANEL
                d:GetAttribute("Box").BackgroundColor3 = isOn and th.ACCENT or th.OFF
            end
        end
        fontScroll.ScrollBarImageColor3 = th.ACCENT
        saveSettings()
    end

    for i,th in ipairs(THEMES) do
        local b=Instance.new("TextButton")
        b.AnchorPoint=Vector2.new(0,0); b.Position=UDim2.new((i-1)/#THEMES,0,0,0)
        b.Size=UDim2.new(1/#THEMES,-2,1,0)
        b.BackgroundColor3 = (i==currentThemeIdx) and C.ACCENT or C.OFF
        b.AutoButtonColor=false; b.Text=tostring(i)
        b.Font=Enum.Font.GothamBold; b.TextSize=11
        b.TextColor3=(i==currentThemeIdx) and C.BLACK or C.INK
        b.ZIndex=5; b.Parent=themeRow; uiCorner(b,5)
        b.MouseButton1Click:Connect(function() applyTheme(i) end)
        themeBtns[i]=b
    end

    local toggleBtn=Instance.new("TextButton"); toggleBtn.AnchorPoint=Vector2.new(0,0)
    toggleBtn.Position=UDim2.new(0,10,0,10); toggleBtn.Size=UDim2.new(0,85,0,26)
    toggleBtn.BackgroundColor3=C.BLACK; toggleBtn.AutoButtonColor=false
    toggleBtn.Text="Hide GUI"; toggleBtn.Font=Enum.Font.GothamMedium; toggleBtn.TextSize=11
    toggleBtn.TextColor3=C.INK; toggleBtn.ZIndex=10; toggleBtn.Parent=root
    uiCorner(toggleBtn,6); uiStroke(toggleBtn,C.ACCENT,1.5,0.25)

    local dragging2,dragStart2,startPos2,moved=false,nil,nil,false
    toggleBtn.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging2=true; moved=false; dragStart2=input.Position; startPos2=toggleBtn.Position
        end
    end)
    toggleBtn.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging2=false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging2 and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
            local d=input.Position-dragStart2
            if d.Magnitude>4 then moved=true end
            toggleBtn.Position=UDim2.new(startPos2.X.Scale,startPos2.X.Offset+d.X,startPos2.Y.Scale,startPos2.Y.Offset+d.Y)
        end
    end)

    local guiVisible=true
    toggleBtn.MouseButton1Click:Connect(function()
        guiVisible=not guiVisible; hub.Visible=guiVisible
        toggleBtn.Text=guiVisible and "Hide GUI" or "Show GUI"
    end)

    switchTab("Combat")
    applyTheme(currentThemeIdx)

    -- WIRE ACTIONS
    local function refreshTargets()
        for mode,b in pairs(targetBtns) do
            b.BackgroundColor3 = getgenv().TargetMode==mode and C.ACCENT or C.PANEL
            b.TextColor3 = getgenv().TargetMode==mode and C.BLACK or C.INK
        end
    end
    for mode,b in pairs(targetBtns) do
        b.MouseButton1Click:Connect(function() getgenv().TargetMode=mode; refreshTargets(); saveSettings() end)
    end
    refreshTargets()

    local function setupToggle(btn, key)
        btn:SetAttribute("IsOn", getgenv()[key])
        btn:SetAttribute("Hovering", false)
        btn.BackgroundColor3 = getgenv()[key] and C.ACCENT or C.PANEL
        
        btn.MouseButton1Click:Connect(function()
            getgenv()[key]=not getgenv()[key]
            btn:SetAttribute("IsOn", getgenv()[key])
            btn.BackgroundColor3 = getgenv()[key] and C.ACCENT or C.PANEL
            btn:GetAttribute("Box").BackgroundColor3 = getgenv()[key] and C.ACCENT or C.OFF
            saveSettings()
        end)
    end
    setupToggle(aimBtn, "Aimbot")
    setupToggle(fovBtn, "ShowFOV")
    setupToggle(espBtn, "ESP")
    setupToggle(espBoxBtn, "ESPBox")
    setupToggle(tracerBtn, "Tracers")
    setupToggle(noclipBtn, "Noclip")
    setupToggle(infJumpBtn, "InfJump")
    setupToggle(flyBtn, "FlyEnabled")

    smoothBox.FocusLost:Connect(function() getgenv().Smoothness=tonumber(smoothBox.Text) or getgenv().Smoothness; smoothBox.Text=tostring(getgenv().Smoothness); saveSettings() end)
    fovBox.FocusLost:Connect(function() getgenv().FOV=tonumber(fovBox.Text) or getgenv().FOV; fovBox.Text=tostring(getgenv().FOV); saveSettings() end)
    flySpBox.FocusLost:Connect(function() getgenv().FlySpeed=tonumber(flySpBox.Text) or 60; flySpBox.Text=tostring(getgenv().FlySpeed); saveSettings() end)
    walkSpBox.FocusLost:Connect(function() getgenv().WalkSpeed=tonumber(walkSpBox.Text) or 16; walkSpBox.Text=tostring(getgenv().WalkSpeed); saveSettings() end)

    crossBtn:SetAttribute("IsOn", getgenv().Crosshair)
    crossBtn.BackgroundColor3 = getgenv().Crosshair and C.ACCENT or C.PANEL
    crossBtn.MouseButton1Click:Connect(function()
        getgenv().Crosshair=not getgenv().Crosshair
        crossBtn:SetAttribute("IsOn", getgenv().Crosshair)
        crossBtn.BackgroundColor3 = getgenv().Crosshair and C.ACCENT or C.PANEL
        crossBtn:GetAttribute("Box").BackgroundColor3 = getgenv().Crosshair and C.ACCENT or C.OFF
        for _,l in ipairs(chexLines) do l.Visible=getgenv().Crosshair end
        saveSettings()
    end)

    fontsToggleBtn:SetAttribute("IsOn", getgenv().WorldFontsEnabled)
    fontsToggleBtn.BackgroundColor3 = getgenv().WorldFontsEnabled and C.ACCENT or C.PANEL
    fontsToggleBtn.MouseButton1Click:Connect(function()
        getgenv().WorldFontsEnabled = not getgenv().WorldFontsEnabled
        fontsToggleBtn:SetAttribute("IsOn", getgenv().WorldFontsEnabled)
        fontsToggleBtn.BackgroundColor3 = getgenv().WorldFontsEnabled and C.ACCENT or C.PANEL
        fontsToggleBtn:GetAttribute("Box").BackgroundColor3 = getgenv().WorldFontsEnabled and C.ACCENT or C.OFF
        if getgenv().WorldFontsEnabled then WorldFonts.Enable(getgenv().WorldFontsIndex or 1) else WorldFonts.Disable() end
        saveSettings()
    end)

    rageToggleBtn:SetAttribute("IsOn", getgenv()._rageEnabled)
    rageToggleBtn.BackgroundColor3 = getgenv()._rageEnabled and C.ACCENT or C.PANEL
    rageToggleBtn.MouseButton1Click:Connect(function()
        getgenv()._rageEnabled=not getgenv()._rageEnabled
        rageToggleBtn:SetAttribute("IsOn", getgenv()._rageEnabled)
        rageToggleBtn.BackgroundColor3 = getgenv()._rageEnabled and C.ACCENT or C.PANEL
        rageToggleBtn:GetAttribute("Box").BackgroundColor3 = getgenv()._rageEnabled and C.ACCENT or C.OFF
        if getgenv()._rageEnabled and getgenv().RageLimbDesync then RageLimbDesync.Enable() else RageLimbDesync.Disable() end
        saveSettings()
    end)

    desyncBtn:SetAttribute("IsOn", getgenv().RageLimbDesync)
    desyncBtn.BackgroundColor3 = getgenv().RageLimbDesync and C.ACCENT or C.PANEL
    desyncBtn.MouseButton1Click:Connect(function()
        getgenv().RageLimbDesync = not getgenv().RageLimbDesync
        desyncBtn:SetAttribute("IsOn", getgenv().RageLimbDesync)
        desyncBtn.BackgroundColor3 = getgenv().RageLimbDesync and C.ACCENT or C.PANEL
        desyncBtn:GetAttribute("Box").BackgroundColor3 = getgenv().RageLimbDesync and C.ACCENT or C.OFF
        if getgenv()._rageEnabled then
            if getgenv().RageLimbDesync then RageLimbDesync.Enable() else RageLimbDesync.Disable() end
        end
        saveSettings()
    end)

    orbitBtn:SetAttribute("IsOn", getgenv().ORBIT_ENABLED)
    orbitBtn.BackgroundColor3 = getgenv().ORBIT_ENABLED and C.ACCENT or C.PANEL
    orbitBtn.MouseButton1Click:Connect(function()
        getgenv().ORBIT_ENABLED=not getgenv().ORBIT_ENABLED
        orbitBtn:SetAttribute("IsOn", getgenv().ORBIT_ENABLED)
        orbitBtn.BackgroundColor3 = getgenv().ORBIT_ENABLED and C.ACCENT or C.PANEL
        orbitBtn:GetAttribute("Box").BackgroundColor3 = getgenv().ORBIT_ENABLED and C.ACCENT or C.OFF
        saveRage()
    end)

    -- AIRSLIDE BUTTONS
    asToggleBtn:SetAttribute("IsOn", getgenv().AirSlideEnabled)
    asToggleBtn.BackgroundColor3 = getgenv().AirSlideEnabled and C.ACCENT or C.PANEL
    asToggleBtn.MouseButton1Click:Connect(function()
        if AirSlide.Active() then
            AirSlide.Disable(); getgenv().AirSlideEnabled=false
            asToggleBtn.BackgroundColor3=C.PANEL
            asToggleBtn:SetAttribute("IsOn", false)
            asToggleBtn:GetAttribute("Box").BackgroundColor3=C.OFF
        else
            AirSlide.Enable(); getgenv().AirSlideEnabled=true
            asToggleBtn.BackgroundColor3=C.ACCENT
            asToggleBtn:SetAttribute("IsOn", true)
            asToggleBtn:GetAttribute("Box").BackgroundColor3=C.ACCENT
        end
        saveSettings()
    end)

    hsToggleBtn:SetAttribute("IsOn", getgenv().HyperSlideEnabled)
    hsToggleBtn.BackgroundColor3 = getgenv().HyperSlideEnabled and C.ACCENT or C.PANEL
    hsToggleBtn.MouseButton1Click:Connect(function()
        if HyperSlide.Active() then
            HyperSlide.Disable(); getgenv().HyperSlideEnabled=false
            hsToggleBtn.BackgroundColor3=C.PANEL
            hsToggleBtn:SetAttribute("IsOn", false)
            hsToggleBtn:GetAttribute("Box").BackgroundColor3=C.OFF
        else
            HyperSlide.Enable(); getgenv().HyperSlideEnabled=true
            hsToggleBtn.BackgroundColor3=C.ACCENT
            hsToggleBtn:SetAttribute("IsOn", true)
            hsToggleBtn:GetAttribute("Box").BackgroundColor3=C.ACCENT
        end
        saveSettings()
    end)

    fpsBtn:SetAttribute("IsOn", getgenv().FPSBoost)
    fpsBtn.BackgroundColor3 = getgenv().FPSBoost and C.ACCENT or C.PANEL
    fpsBtn.MouseButton1Click:Connect(function()
        if FPSBoost.Active() then
            FPSBoost.Disable(); getgenv().FPSBoost=false
            fpsBtn.BackgroundColor3=C.PANEL
            fpsBtn:SetAttribute("IsOn", false)
            fpsBtn:GetAttribute("Box").BackgroundColor3=C.OFF
        else
            FPSBoost.Enable(); getgenv().FPSBoost=true
            fpsBtn.BackgroundColor3=C.ACCENT
            fpsBtn:SetAttribute("IsOn", true)
            fpsBtn:GetAttribute("Box").BackgroundColor3=C.ACCENT
        end
        saveSettings()
    end)

    trigBtn:SetAttribute("IsOn", getgenv().Triggerbot)
    trigBtn.BackgroundColor3 = getgenv().Triggerbot and C.ACCENT or C.PANEL
    trigBtn.MouseButton1Click:Connect(function()
        if Triggerbot.Active() then
            Triggerbot.Disable(); getgenv().Triggerbot=false
            trigBtn.BackgroundColor3=C.PANEL
            trigBtn:SetAttribute("IsOn", false)
            trigBtn:GetAttribute("Box").BackgroundColor3=C.OFF
        else
            Triggerbot.Enable(); getgenv().Triggerbot=true
            trigBtn.BackgroundColor3=C.ACCENT
            trigBtn:SetAttribute("IsOn", true)
            trigBtn:GetAttribute("Box").BackgroundColor3=C.ACCENT
        end
        saveSettings()
    end)

    -- BUTTON LOADSTRINGS
    dracoBtn.MouseButton1Click:Connect(function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/mrbeanissohot/DraconicWildcat/refs/heads/main/Draco.lua",true))() end) end)
    stretchBtn.MouseButton1Click:Connect(function() pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Stretched-Resolution-Higher-FOV-48170"))() end) end)
    rickBtn.MouseButton1Click:Connect(function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/betterthanbefore0207767837-cyber/Rick/refs/heads/main/Ricyyy"))() end) end)
    valHandsBtn.MouseButton1Click:Connect(function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/mrbeanissohot/Bean-sValorant/refs/heads/main/Valorant.lua",true))() end) end)
    killSndBtn.MouseButton1Click:Connect(function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/betterthanbefore0207767837-cyber/Xgivfc/refs/heads/main/Ffvhhvxd",true))() end) end)
    spoofBtn.MouseButton1Click:Connect(function()
        pcall(function()
            getgenv().Config={victim=11480709640,helper="",level=45648,streak=15765,elo=0,keys=67,premium=false,verified=false,unlockall=false,platform="VR",join="discord.gg/rivalscomp"}
            loadstring(game:HttpGet("https://raw.githubusercontent.com/WEFGQERQEGWGE/a/refs/heads/main/UDRCRFRAMESCRIPT.lua"))()
        end)
    end)
    alyaBtn.MouseButton1Click:Connect(function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/betterthanbefore0207767837-cyber/Fggb/refs/heads/main/Fgnn"))() end) end)
    saveBtn.MouseButton1Click:Connect(function() saveSettings(); saveRage(); saveBtn.Text="  Saved!"; task.delay(1.2,function() saveBtn.Text="  Save Config" end) end)

    -- WALK SPEED & FLY LOOP
    local flyAlignPos, flyAlignOrient, flyBodyVel
    RunService.Stepped:Connect(function()
        if not running then return end
        local char=lp.Character; if not char then return end
        local hum=char:FindFirstChildOfClass("Humanoid")
        if hum and not getgenv().FlyEnabled then hum.WalkSpeed = getgenv().WalkSpeed or 16 end
    end)

    flyBtn.MouseButton1Click:Connect(function()
        if getgenv().FlyEnabled then
            local char=lp.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            flyAlignPos=Instance.new("AlignPosition"); flyAlignPos.Mode=Enum.PositionAlignmentMode.OneAttachment
            flyAlignPos.Attachment0=hrp:FindFirstChildWhichIsA("Attachment") or Instance.new("Attachment",hrp)
            flyAlignPos.MaxForce=1e6; flyAlignPos.Responsiveness=200; flyAlignPos.Parent=hrp
            
            flyAlignOrient=Instance.new("AlignOrientation"); flyAlignOrient.Mode=Enum.OrientationAlignmentMode.OneAttachment
            flyAlignOrient.Attachment0=flyAlignPos.Attachment0
            flyAlignOrient.MaxTorque=1e6; flyAlignOrient.Responsiveness=200; flyAlignOrient.Parent=hrp
            
            local hum=char:FindFirstChildOfClass("Humanoid")
            if hum then hum.PlatformStand = true end
            
            flyBodyVel = hrp:FindFirstChild("FlyBV") or Instance.new("BodyVelocity", hrp)
            flyBodyVel.Name = "FlyBV"; flyBodyVel.MaxForce = Vector3.new(1e5,1e5,1e5); flyBodyVel.Velocity = Vector3.zero
            
            task.spawn(function()
                while getgenv().FlyEnabled and char.Parent do
                    local camCF = cam.CFrame
                    local dir = Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += camCF.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= camCF.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= camCF.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += camCF.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0,1,0) end
                    
                    if dir.Magnitude > 0 then dir = dir.Unit end
                    flyBodyVel.Velocity = dir * getgenv().FlySpeed
                    flyAlignOrient.CFrame = camCF
                    task.wait()
                end
            end)
        else
            local char=lp.Character; if not char then return end
            if flyAlignPos then flyAlignPos:Destroy() end
            if flyAlignOrient then flyAlignOrient:Destroy() end
            local hum=char:FindFirstChildOfClass("Humanoid"); if hum then hum.PlatformStand=false end
            if flyBodyVel then flyBodyVel:Destroy() end
        end
    end)

    -- CROSSHAIR
    local chexLines={}
    local C_COL = Color3.fromRGB(120, 220, 255)
    for i=1,4 do
        local l=Drawing.new("Line"); l.Thickness=2; l.Color=C_COL; l.Transparency=0; l.Visible=false
        chexLines[i]=l
    end
    local dot=Drawing.new("Circle"); dot.Radius=2; dot.Filled=true; dot.Color=C_COL; dot.Transparency=0; dot.Visible=false

    local rsConn=RunService.RenderStepped:Connect(function()
        if not running then return end
        if getgenv().Crosshair then
            local mp=UserInputService:GetMouseLocation()
            local gap = 6; local len = 12
            chexLines[1].From = mp - Vector2.new(0,gap); chexLines[1].To = mp - Vector2.new(0,gap+len)
            chexLines[2].From = mp + Vector2.new(0,gap); chexLines[2].To = mp + Vector2.new(0,gap+len)
            chexLines[3].From = mp - Vector2.new(gap,0); chexLines[3].To = mp - Vector2.new(gap+len,0)
            chexLines[4].From = mp + Vector2.new(gap,0); chexLines[4].To = mp + Vector2.new(gap+len,0)
            dot.Position = mp
            for _,l in ipairs(chexLines) do l.Visible=true end
            dot.Visible=true
        else
            for _,l in ipairs(chexLines) do l.Visible=false end
            dot.Visible=false
        end
    end)

    -- CLEANUP
    local function outro()
        if not running then return end; running=false
        rsConn:Disconnect()
        AirSlide.Disable(); HyperSlide.Disable(); WorldFonts.Disable()
        FPSBoost.Disable(); Triggerbot.Disable(); RageLimbDesync.Disable()
        for _,l in ipairs(chexLines) do pcall(function() l:Remove() end) end
        dot:Remove()
        root:Destroy()
    end
    closeBtn.MouseButton1Click:Connect(outro)
end

-- ══════════════════════════════════════════════════════════════
--  Start
-- ══════════════════════════════════════════════════════════════
local function Start()
    local root=Instance.new("ScreenGui"); root.Name="LaufeyHub"
    root.ResetOnSpawn=false; root.IgnoreGuiInset=true; root.DisplayOrder=999; protect(root)
    buildHub(root)
end

-- ══════════════════════════════════════════════════════════════
--  Username bypass
-- ══════════════════════════════════════════════════════════════
if not LocalPlayer then
    repeat task.wait(0.1) until Players.LocalPlayer
    LocalPlayer = Players.LocalPlayer
end

do
    local name    = string.lower(LocalPlayer.Name)
    local display = string.lower(LocalPlayer.DisplayName)
    if OWNERS[name] or OWNERS[display] then
        local ok, err = pcall(Start)
        if not ok then warn("[Laufey] Start failed: "..tostring(err)) end
        return
    end
end

-- ══════════════════════════════════════════════════════════════
--  Key gate
-- ══════════════════════════════════════════════════════════════
local kg=Instance.new("ScreenGui"); kg.Name="KeyGate"; protect(kg)

local mf=Instance.new("Frame"); mf.Parent=kg; mf.BackgroundColor3=C.BLACK
mf.Position=UDim2.new(0.4,0,0.4,0); mf.Size=UDim2.new(0,220,0,140)
mf.Active=true; mf.Draggable=true; mf.BorderSizePixel=0
uiCorner(mf,8); uiStroke(mf,C.ACCENT,1.5,0.25)

local kt=Instance.new("TextLabel"); kt.Parent=mf; kt.Size=UDim2.new(1,0,0,30)
kt.BackgroundTransparency=1; kt.Text="SYSTEM ACCESS"; kt.Font=Enum.Font.GothamBold
kt.TextSize=14; kt.TextColor3=C.ACCENT

local ki=Instance.new("TextBox"); ki.Parent=mf; ki.Position=UDim2.new(0,15,0,42)
ki.Size=UDim2.new(1,-30,0,32); ki.Text=""; ki.PlaceholderText="Input passcode..."
ki.Font=Enum.Font.Gotham; ki.TextSize=13; ki.TextColor3=C.INK; ki.BackgroundColor3=C.PANEL
uiCorner(ki,6); uiStroke(ki,C.ACCENT,1,0.4)

local vb=Instance.new("TextButton"); vb.Parent=mf; vb.Position=UDim2.new(0,15,0,88)
vb.Size=UDim2.new(1,-30,0,32); vb.BackgroundColor3=C.ACCENT; vb.AutoButtonColor=false
vb.Text="SUBMIT"; vb.Font=Enum.Font.GothamMedium; vb.TextSize=13; vb.TextColor3=C.BLACK
uiCorner(vb,6)

local rt=""
ki:GetPropertyChangedSignal("Text"):Connect(function()
    local cur=ki.Text
    if cur=="Invalid Token." or cur=="" then if cur=="" then rt="" end; return end
    if #cur>#rt then rt=rt..string.sub(cur,#rt) elseif #cur<#rt then rt=string.sub(rt,1,#cur) end
    ki.Text=string.rep("*",#rt)
end)

vb.MouseButton1Click:Connect(function()
    if rt==resolve(key1_data) then
        kt.Text="too gay too use this blud fuck yourself"; rt=""; ki.Text=""
    elseif rt==resolve(key2_data) or rt==resolve(key3_data) then
        kg:Destroy(); Start()
    else rt=""; ki.Text=""; ki.PlaceholderText="Invalid Token." end
end)
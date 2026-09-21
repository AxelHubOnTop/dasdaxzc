--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

repeat task.wait()
    until game:IsLoaded()

repeat task.wait()
    until game:GetService("Players").LocalPlayer.Character

        repeat task.wait()
        until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading")

        repeat task.wait()
        until game:GetService("Players").LocalPlayer.PlayerGui.Loading.CanvasGroup.Visible == false

        spawn(function()
        while task.wait() do
        pcall(function()
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.HUD.Actions.Profile.ProfileHolder then
game:GetService("Players").LocalPlayer.PlayerGui.Main.HUD.Actions.Profile.ProfileHolder.User.Text = "discord.gg/axelhub"
game:GetService("Players").LocalPlayer.PlayerGui.Main.HUD.Actions.Profile.ProfileHolder.Lvl.Text = "    Lv. Inf"
task.wait(5)
end
if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Player_Healthbar") then
game.Players.LocalPlayer.Character.HumanoidRootPart.Player_Healthbar.Enabled = false
task.wait(5)
end
        end)
        end
        end)

if not axel_loaded then 

axel_loaded = true

Premiums = false

local Pelinda = loadstring(game:HttpGet("https://api.pandauth.com/lib/external/panda-v3-external.lua"))()
local link = Pelinda.GetKeyLink({ Service = "axelhub3" })
function checkkey(key)

local result = Pelinda.Init({
    Service    = "axelhub3",  -- REQUIRED — no auto-inject like VSS
    Key        = key,
    SilentMode = false,
})

if result == "validated!!" then
    print("Authenticated. Premium:", __PELINDA_IS_PREMIUM__)
    -- your script logic here
    shittybruh = true
    yes = true
    Premiums = __PELINDA_IS_PREMIUM__
elseif result == "error!!" then
yes = false
print("Error")
else
yes = false
print("Error")
end
end

if _G.Key == nil then
_G.Key = ""
end
checkkey(_G.Key)
if shittybruh == true then
response = true
workingreal = _G.Key
end

if response == nil then
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/keysystem.Lua"))()
local response = KeySystem:Init({
    Title = "AxelHub_SRNG_Key",
    Link = link,
    Verify = function(key)
checkkey(key)
if shittybruh == true then
response = true
workingreal = key
end
	return shittybruh
    end
})
end
if not response then 
if isfile("axelhub_srng_key.key") then
delfile("axelhub_srng_key.key")
    end
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Key Is Wrongs"
})
return 
end

if yes == false then
checkkey(workingreal)
    if shittybruh == false then
if isfile("axelhub_srng_key.key") then
delfile("axelhub_srng_key.key")
axel_loaded = false
    end
    end

loadstring(game:HttpGet('https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua'))()

game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Key Is Wrong"
})
end

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("...") then
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("..."):Destroy()
end

if yes == true then
if workingreal == nil or workingreal == "" then
game.Players.LocalPlayer:Kick("U tryna Bypass???")
end

function clicks(uis)
VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = uis
task.wait(.03)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.03)
game:GetService("GuiService").SelectedObject = nil
end

for i,v in pairs(workspace:GetChildren()) do
if string.find(v.Name,"Generated") then
bigfolder = v
end
end

        userid = game.Players.LocalPlayer.UserId

        folder_name = userid.."_DULR.JSON"

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

HttpService = game:GetService("HttpService")

local S = getgenv().SYMBIOS_DL or {}
getgenv().SYMBIOS_DL = S

local function GetConfigPath()
userid = game.Players.LocalPlayer.UserId
    return "AxelHub/"..userid.."_DULR.JSON"
end

local lastSaveRequest = 0
local function SaveConfig(pathssss)
    lastSaveRequest = tick()
    local currentRequest = lastSaveRequest
    task.delay(1, function()
        if lastSaveRequest ~= currentRequest then return end
        if not (writefile and makefolder) then return end
        local path = pathssss
        local folder = path:match("(.+)/")
        if not isfolder(folder) then
            local parts = folder:split("/")
            local current = ""
            for _, part in ipairs(parts) do
                current = current .. part
                if not isfolder(current) then makefolder(current) end
                current = current .. "/"
            end
        end
        writefile(path, HttpService:JSONEncode(getgenv().SYMBIOS_DL))
    end)
end

if S.Disc == nil then
S.Disc = 7
end

function goto(speed,va)
if S.TP_MODE == "Tween" then
    local Distance2 = (va.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance2 >= 100 then
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new(Distance2/speed, Enum.EasingStyle.Linear)
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = va})
        tween:Play()
        else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = va
    end
        else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = va
    end
end

Disc = 5

function canceltp()
    local Distance2 = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new(Distance2/300, Enum.EasingStyle.Linear)
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
        tween:Play()
end

toggles = {}
dropdowns = {}
slides = {}
inputs = {}

if game.PlaceId == 106484206883664 then
ingame = false
elseif game.PlaceId == 132285059959516 then
ingame = true
end

local Window = WindUI:CreateWindow({
    Title = "Axel Hub - Dungeon Lootr",
    Icon = "rbxassetid://86949082023913", -- lucide icon
    Author = "by vxny",
    Folder = "AxelHub_Official",
    
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    -- ↓ Optional. You can remove it.
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },

    })

    Window:SetBackgroundImage("rbxassetid://86949082023913")
    Window:SetToggleKey(Enum.KeyCode.RightControl)

WindUI:AddTheme({
    Name = "AxelSunset",
    Accent                       = Color3.fromHex("#ff8c00"), -- orange
    Background                   = Color3.fromHex("#14110b"), -- dark warm bg
    BackgroundTransparency       = 0,
    Outline                      = Color3.fromHex("#ffb300"), -- yellow-orange
    Text                         = Color3.fromHex("#fff7e6"), -- soft white
    Placeholder                  = Color3.fromHex("#ffb84d"),
    Button                       = Color3.fromHex("#2a1f0f"),
    Icon                         = Color3.fromHex("#ffcc00"), -- yellow
    Hover                        = Color3.fromHex("#ffd580"),
    WindowBackground             = Color3.fromHex("#14110b"),
    WindowShadow                 = Color3.fromHex("#000000"),
    WindowTopbarButtonIcon       = Color3.fromHex("#ffcc00"),
    WindowTopbarTitle            = Color3.fromHex("#fff7e6"),
    WindowTopbarAuthor           = Color3.fromHex("#ffb84d"),
    WindowTopbarIcon             = Color3.fromHex("#ffe066"),
    TabBackground                = Color3.fromHex("#2a1f0f"),
    TabTitle                     = Color3.fromHex("#fff7e6"),
    TabIcon                      = Color3.fromHex("#ffcc00"),
    ElementBackground            = Color3.fromHex("#FA9511"), -- darker orange panel
    ElementTitle                 = Color3.fromHex("#fff7e6"),
    ElementDesc                  = Color3.fromHex("#ffcc80"),
    ElementIcon                  = Color3.fromHex("#ffb300"),
    PopupBackground              = Color3.fromHex("#1a140a"),
    PopupBackgroundTransparency  = 0,
    PopupTitle                   = Color3.fromHex("#fff7e6"),
    PopupContent                 = Color3.fromHex("#ffd699"),
    PopupIcon                    = Color3.fromHex("#ffcc00"),
    DialogBackground             = Color3.fromHex("#1a140a"),
    DialogBackgroundTransparency = 0,
    DialogTitle                  = Color3.fromHex("#fff7e6"),
    DialogContent                = Color3.fromHex("#ffd699"),
    DialogIcon                   = Color3.fromHex("#ffcc00"),
    Toggle                       = Color3.fromHex("#2a1f0f"),
    ToggleBar                    = Color3.fromHex("#ffb300"),
    Checkbox                     = Color3.fromHex("#2a1f0f"),
    CheckboxIcon                 = Color3.fromHex("#ffcc00"),
    Slider                       = Color3.fromHex("#2a1f0f"),
    SliderThumb                  = Color3.fromHex("#ffb300"),
})
WindUI:SetTheme("AxelSunset")

if S.Enabled == nil then S.Enabled = false end
if S.AutoLoot == nil then S.AutoLoot = true end
if S.PotionHeal == nil then S.PotionHeal = true end
if S.HealBelow == nil then S.HealBelow = 0.35 end
if S.AboveHead == nil then S.AboveHead = false end
if S.AutoRefillPotion == nil then S.AutoRefillPotion = true end
if S.AttackCadence == nil or S.AttackCadence < 0.85 then S.AttackCadence = 0.85 end
if S.KillTimeout == nil then S.KillTimeout = 6 end
if S.AutoSkill == nil then S.AutoSkill = false end
if S.NoSkillCD == nil then S.NoSkillCD = false end
if S.SkillSlots == nil then S.SkillSlots = { 1, 2, 3, 4 } end
if type(S.SkillSel) ~= "table" then S.SkillSel = { "1", "2", "3", "4" } end
if S.SkillInterval == nil then S.SkillInterval = 0.5 end
if S.AutoReward == nil then S.AutoReward = true end
if S.AutoReplay == nil then S.AutoReplay = true end
if S.AutoPush == nil then S.AutoPush = false end
if S.ChallengeReplay == nil then S.ChallengeReplay = false end
if S.AutoContinue == nil then S.AutoContinue = false end
if S.AutoExtract == nil then S.AutoExtract = false end
if S.ExtractDepth == nil then S.ExtractDepth = 15 end
if S.BlessPriority == nil then S.BlessPriority = "Middle" end
if S.AutoParry == nil then S.AutoParry = false end
if S.ParryRange == nil then S.ParryRange = 16 end
if S.ParryLead == nil then S.ParryLead = 0.13 end
if type(S.ParryAttackIds) ~= "table" then S.ParryAttackIds = {} end
if S.ParryHitDelay == nil then S.ParryHitDelay = 0.35 end
if type(S.ParryModel) ~= "table" then S.ParryModel = {} end
if S.ParryRangedRange == nil then S.ParryRangedRange = 150 end

if S.AutoJoin == nil then S.AutoJoin = false end
if S.SoloMode == nil then S.SoloMode = true end
if S.JoinDungeon == nil then S.JoinDungeon = "Bandits Den" end
if S.JoinDifficulty == nil then S.JoinDifficulty = "Easy" end

if S.AutoChallenge == nil then S.AutoChallenge = false end
if S.ChallengeSel == nil then S.ChallengeSel = "" end
if S.AutoBossRush == nil then S.AutoBossRush = false end
if S.BossRushSel == nil then S.BossRushSel = "" end
if S.ChallengeFarm == nil then S.ChallengeFarm = false end
if S.BossRushFarm == nil then S.BossRushFarm = false end
if S.BossExtract == nil then S.BossExtract = false end
if S.BossExtractFloor == nil then S.BossExtractFloor = 30 end

if S.AutoClaimBPQuest == nil then S.AutoClaimBPQuest = false end
if S.AutoClaimBPReward == nil then S.AutoClaimBPReward = false end
if S.AutoClaimQuest == nil then S.AutoClaimQuest = false end

local Section = Window:Section({
    Title = "Main",
    Icon = "rbxassetid://86949082023913",
    Opened = true,
})

local Main = Section:Tab({
    Title = "Main",
    Icon = "door-open", -- optional
    Locked = false,
})

local sett = Section:Tab({
    Title = "Settings",
    Icon = "wrench", -- optional
    Locked = false,
})

local claim = Section:Tab({
    Title = "Claim",
    Icon = "circle-dollar-sign", -- optional
    Locked = false,
})

local join = Section:Tab({
    Title = "Join",
    Icon = "gamepad-2", -- optional
    Locked = false,
})

local Pri = Section:Tab({
    Title = "Priority",
    Icon = "arrow-down-up", -- optional
    Locked = false,
})

local Webhook = Section:Tab({
    Title = "Webhook",
    Icon = "flag", -- optional
    Locked = false,
})

local Misc = Section:Tab({
    Title = "Misc",
    Icon = "badge-alert", -- optional
    Locked = false,
})

local Settings = Section:Tab({
    Title = "Settings",
    Icon = "settings",
    Opened = true,
})

Window:Tag({
    Title = ".gg/axelhub",
    Icon = "link",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 6, -- from 0 to 13
})

Window:Tag({
    Title = "1.1.1",
    Icon = "settings",
    Color = Color3.fromHex("#97DBF0"),
    Radius = 6, -- from 0 to 13
})

Window:EditOpenButton({
    Title = "Open Axel UI",
    Icon = "rbxassetid://86949082023913",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local Section = Main:Section({ 
    Title = "Main Menu",
})

do
    local Players = game:GetService("Players")
    local hosts = {}
    pcall(function() if gethui then table.insert(hosts, gethui()) end end)
    pcall(function() table.insert(hosts, game:GetService("CoreGui")) end)
    pcall(function()
        local pg = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
        if pg then table.insert(hosts, pg) end
    end)
    for _, host in ipairs(hosts) do
        pcall(function()
            for _, g in ipairs(host:GetChildren()) do
                if g:IsA("ScreenGui") and g.Name:sub(1, 8) == "SYMBIOS_" then
                    g:Destroy()
                end
            end
        end)
    end
end
if S._holdConn then pcall(function() S._holdConn:Disconnect() end); S._holdConn = nil end

if S._threads then
    for _, th in ipairs(S._threads) do pcall(task.cancel, th) end
end
S._threads = {}
S._target = nil

S.Kills = S.Kills or 0

S._gen = (S._gen or 0) + 1
local GEN = S._gen
local function current() return S._gen == GEN end

local function spawn(fn)
    local th = task.spawn(fn)
    table.insert(S._threads, th)
    return th
end

local CONFIG_FOLDER = "AXEL_DungeonLootr"
local CONFIG_NAME = "default"

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local BOSS_EXTRACT_PLACE = 106484206883664
local LP = Players.LocalPlayer

local Inputs = RS:WaitForChild("Player"):WaitForChild("Remotes"):WaitForChild("Inputs")
local Attack = Inputs:WaitForChild("Attack")
local SkillRemote = Inputs:WaitForChild("Skill")
local ParryRemote = Inputs:WaitForChild("Parry")
local CombatFeedback = RS:WaitForChild("Player"):WaitForChild("Remotes"):WaitForChild("CombatFeedback")

local function char()
    local p = Players.LocalPlayer
    return p and p.Character
end
local function hrp()
    local c = char()
    return c and c:FindFirstChild("HumanoidRootPart")
end
local function hum()
    local c = char()
    return c and c:FindFirstChildOfClass("Humanoid")
end
local function alive()
    local h = hum()
    return h ~= nil and h.Health > 0
end
local function hpFrac()
    local h = hum()
    if not h or h.MaxHealth <= 0 then return 1 end
    return h.Health / h.MaxHealth
end

local function endScreenUp()
    local plr = Players.LocalPlayer
    local pg = plr and plr:FindFirstChild("PlayerGui")
    local main = pg and pg:FindFirstChild("Main")
    local hud = main and main:FindFirstChild("HUD")
    if not hud then return false end
    for _, name in ipairs({ "Chest_Selection", "Boost_Selection" }) do
        local f = hud:FindFirstChild(name)
        if f and f.Visible and (f.GroupTransparency or 0) < 0.5 then return true end
    end
    local dc = hud:FindFirstChild("Dungeon_Container")
    local ci = dc and dc:FindFirstChild("Completion_Info")
    if ci and ci.Visible then return true end
    return false
end

local function dungeon()
    for _, c in ipairs(workspace:GetChildren()) do
        if c.Name:match("^Generated_") then return c end
    end
    return nil
end

local ENEMY_SKIP = { blessing = true, altar = true, shrine = true, pedestal = true }
local function isEnemy(n)
    if not n:IsA("Model") then return false end
    local nm = n.Name:lower()
    for word in nm:gmatch("%a+") do
        if ENEMY_SKIP[word] then return false end
    end
    if n:FindFirstChildWhichIsA("ProximityPrompt", true) then return false end
    local h = n:FindFirstChildOfClass("Humanoid")
    if h then
        if h.Health <= 0 then return false end
    else
        for _, key in ipairs({ "Health", "HP", "Hp", "hp", "CurrentHealth", "current_health" }) do
            local v = n:GetAttribute(key)
            if type(v) == "number" then if v <= 0 then return false end break end
            local vo = n:FindFirstChild(key)
            if vo and vo:IsA("ValueBase") and type(vo.Value) == "number" then if vo.Value <= 0 then return false end break end
        end
    end
    local root = n:FindFirstChild("HumanoidRootPart") or n.PrimaryPart
    return root ~= nil
end

local function nearestEnemy(d)
    local origin = hrp()
    if not origin then return nil end
    local npcs = d:FindFirstChild("NPCs")
    if not npcs then return nil end
    local best, bestRoot, bestDist
    for _, n in ipairs(npcs:GetChildren()) do
        if isEnemy(n) then
            local r = n:FindFirstChild("HumanoidRootPart") or n.PrimaryPart
            if r and r.Position.Magnitude > 1 then
                local dist = (r.Position - origin.Position).Magnitude
                if not bestDist or dist < bestDist then
                    best, bestRoot, bestDist = n, r, dist
                end
            end
        end
    end
    return best, bestRoot, bestDist
end

local CHAL_SKIP = {
    void = true, spawn = true, model = true, rig = true, template = true,
    dummy = true, start = true, portal = true, cache = true, pool = true,
    object = true, light = true, particles = true, dialogue = true, sound = true,
}
local function enemyController(n)
    return n:FindFirstChildOfClass("Humanoid") or n:FindFirstChildWhichIsA("AnimationController")
end

local function enemyRoot(n)
    local h = n:FindFirstChildOfClass("Humanoid")
    return n:FindFirstChild("HumanoidRootPart")
        or (h and h.RootPart)
        or n.PrimaryPart
        or n:FindFirstChild("Root")
        or n:FindFirstChild("Torso")
        or n:FindFirstChild("UpperTorso")
        or n:FindFirstChildWhichIsA("BasePart")
end

local HEALTH_KEYS = { "Health", "HP", "Hp", "hp", "CurrentHealth", "current_health" }
local function enemyAlive(n)
    local h = n:FindFirstChildOfClass("Humanoid")
    if h then return h.Health > 0 and h.MaxHealth > 0 end
    for _, key in ipairs(HEALTH_KEYS) do
        local v = n:GetAttribute(key)
        if type(v) == "number" then return v > 0 end
        local vo = n:FindFirstChild(key)
        if vo and vo:IsA("ValueBase") and type(vo.Value) == "number" then return vo.Value > 0 end
    end
    return true
end

local function looksLikeChallengeEnemy(n)
    if not n:IsA("Model") then return false end
    if Players:GetPlayerFromCharacter(n) then return false end
    if not enemyController(n) then return false end
    if not enemyAlive(n) then return false end
    for word in n.Name:lower():gmatch("%a+") do
        if CHAL_SKIP[word] then return false end
    end
    return true
end
local CHAL_TARGET_RANGE = 250
local CHAL_Y_TOL = 60

local function hasGroundBelow(pos)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if char then params.FilterDescendantsInstances = { char } end
    local res = workspace:Raycast(pos, Vector3.new(0, -400, 0), params)
    return res ~= nil
end

local _chalEnemyCache = { t = 0, list = {} }
local function chalEnemyCandidates()
    local now = os.clock()
    if (now - _chalEnemyCache.t) <= 1 then return _chalEnemyCache.list end
    local list = {}
    local function walk(container, depth)
        for _, c in ipairs(container:GetChildren()) do
            if c:IsA("Model") then
                list[#list + 1] = c
            elseif depth < 3 and (c:IsA("Folder") or c:IsA("Configuration")) then
                walk(c, depth + 1)
            end
        end
    end
    walk(workspace, 0)
    _chalEnemyCache.t = now
    _chalEnemyCache.list = list
    return list
end
local function nearestEnemyChallenge()
    local origin = hrp()
    if not origin then return nil end
    local op = origin.Position
    local best, bestRoot, bestDist
    for _, n in ipairs(chalEnemyCandidates()) do
        if n.Parent and looksLikeChallengeEnemy(n) then
            local r = enemyRoot(n)
            if r then
                local pos = r.Position
                if pos.Magnitude > 1 and math.abs(pos.Y - op.Y) <= CHAL_Y_TOL then
                    local dist = (pos - op).Magnitude
                    if dist <= CHAL_TARGET_RANGE and (not bestDist or dist < bestDist) then
                        best, bestRoot, bestDist = n, r, dist
                    end
                end
            end
        end
    end
    return best, bestRoot, bestDist
end

local function firePrompt(p)
    if typeof(fireproximityprompt) ~= "function" then return end
    local prevHold = p.HoldDuration
    if prevHold and prevHold > 0 then pcall(function() p.HoldDuration = 0 end) end
    pcall(fireproximityprompt, p)
    if prevHold and prevHold > 0 then pcall(function() p.HoldDuration = prevHold end) end
end

local function promptWorldPos(prompt)
    local node = prompt.Parent
    while node and node ~= workspace do
        if node:IsA("Attachment") then return node.WorldPosition end
        if node:IsA("BasePart") then return node.Position end
        if node:IsA("Model") then
            local ok, cf = pcall(function() return node:GetPivot() end)
            if ok then return cf.Position end
        end
        node = node.Parent
    end
    return nil
end

local function applyHold(t)
if S.Auto_Event_Farm then return end
    if not t or not t.Parent then return false end
    local hp = hrp()
    if not hp then return false end
    local tp = t.Position
    if tp.Magnitude < 1 then return false end
    local flat = Vector3.new(tp.X - hp.Position.X, 0, tp.Z - hp.Position.Z)
    local dir = flat.Magnitude > 0.1 and flat.Unit or (S._lastDir or Vector3.new(0, 0, -1))
    S._lastDir = dir
    local h = hum()
    if h then
        h.PlatformStand = false
        if h.Sit then h.Sit = false end
    end
    if S.AboveHead then
        local above = tp + Vector3.new(0, 0, 0)
        hp.CFrame = CFrame.new(tp) * ModeFarm2
        hp.AssemblyLinearVelocity = Vector3.zero
        hp.AssemblyAngularVelocity = Vector3.zero
        return true
    end
    local off = (S.ChallengeFarm or S.BossRushFarm) and 3
    local fh = (S.ChallengeFarm or S.BossRushFarm) and 4
    local target = tp
    hp.CFrame = CFrame.new(target) * ModeFarm2
    hp.AssemblyLinearVelocity = Vector3.zero
    hp.AssemblyAngularVelocity = Vector3.zero
    return true
end

if S._holdConn then pcall(function() S._holdConn:Disconnect() end) end
S._holdConn = RunService.Heartbeat:Connect(function()
    if not current() then return end
    if S._target then
        applyHold(S._target)
    elseif S._hoverPos and (S.Enabled or S.ChallengeFarm or S.BossRushFarm) then
        local hp = hrp()
        local p = Players.LocalPlayer
        if hp and p and not p:GetAttribute("Dead") then
            hp.CFrame = CFrame.new(S._hoverPos)
            hp.AssemblyLinearVelocity = Vector3.zero
            hp.AssemblyAngularVelocity = Vector3.zero
        end
    end
end)

local LP0 = Players.LocalPlayer
local function slotReady(i)
    local p = Players.LocalPlayer or LP0
    if not p then return false end
    local pre = "Skill" .. i .. "_"
    local charges = p:GetAttribute(pre .. "Charges")
    if charges ~= nil then return charges > 0 end
    if p:GetAttribute(pre .. "OnCooldown") == true then return false end
    local rem = p:GetAttribute(pre .. "CooldownRemaining")
    if rem ~= nil and rem > 0 then return false end
    return true
end

local function fireSkills()
    if not S.AutoSkill then return end
    local p = Players.LocalPlayer
    if not p then return end
    if not p:GetAttribute("Weapon_Equipped") or p:GetAttribute("Dead") then return end
    local fired = false
    for _, i in ipairs(S.SkillSel) do
        if slotReady(tonumber(i)) == true then
            pcall(function() SkillRemote:FireServer(tonumber(i), "tap") end)
            fired = true
        end
    end
    if fired then S._skillHoldUntil = os.clock() + 0.35 end
end

local function killEnemy(n, r)
    local start = os.clock()
    S._target = r
    applyHold(r)
    while (S.Enabled or S.ChallengeFarm or S.BossRushFarm or S.Auto_Event_Farm) and n.Parent and enemyAlive(n) and alive() and os.clock() - start < S.KillTimeout do
        if not r or not r.Parent then break end
        if not hrp() then break end
        if os.clock() < (S._skillHoldUntil or 0) then
            task.wait(0.05)
        else
            Attack:FireServer(S._lastDir or Vector3.new(0, 0, -1))
            task.wait(S.AttackCadence)
        end
    end
    local hp = hrp()
    if hp then S._hoverPos = hp.Position end
    S._target = nil
    return not n.Parent
end

local function sweepRooms(d)
    S._target = nil
    S._hoverPos = nil
    for _, room in ipairs(d:GetChildren()) do
        if not S.Enabled or not current() or not alive() then return false end

        local isArea = room:FindFirstChild("Zone") or room:FindFirstChild("TileAnchor")
            or room.Name:match("^Room") or room.Name:match("^Locked")
        if isArea then
            local pos
            local a = room:FindFirstChild("Zone") or room:FindFirstChild("TileAnchor")
            if a and a:IsA("BasePart") then
                pos = a.Position
            elseif room:IsA("Model") then
                local ok, cf = pcall(function() return room:GetPivot() end)
                if ok and cf.Position.Magnitude > 1 then pos = cf.Position end
            end
            if pos and hrp() then
                hrp().CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
                hrp().AssemblyLinearVelocity = Vector3.zero
                task.wait(0.4)
                if nearestEnemy(d) then return true end
            end
        end
    end
    return false
end

S._blessTried = S._blessTried or setmetatable({}, { __mode = "k" })
S._lootTried = S._lootTried or setmetatable({}, { __mode = "k" })
local function lootable(x)
    if not (x:IsA("ProximityPrompt") and x.Enabled and x.Parent) then return false end
    local act = x.ActionText or ""
    if act == "Loot" then return not S._lootTried[x] end
    if act == "Receive Blessing" then
        return not S._blessTried[x]
    end
    return false
end

local _promptCache = { d = nil, t = 0, list = {} }
local function lootPrompts(d)
    local now = os.clock()
    if _promptCache.d ~= d or (now - _promptCache.t) > 3 then
        local list = {}
        for _, x in ipairs(d:GetDescendants()) do
            if x:IsA("ProximityPrompt") then list[#list + 1] = x end
        end
        _promptCache.d = d
        _promptCache.t = now
        _promptCache.list = list
    end
    return _promptCache.list
end

local function doLoot(d)
    if not S.AutoLoot then return end
    S._target = nil
    S._hoverPos = nil
    for _, x in ipairs(lootPrompts(d)) do
        if lootable(x) then
            local isBless = (x.ActionText == "Receive Blessing")
            local pos = promptWorldPos(x)
            if pos and hrp() then
                hrp().CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
                hrp().AssemblyLinearVelocity = Vector3.zero
                task.wait(0.25)
                local hold = (x.HoldDuration or 0)
                firePrompt(x)
                if hold > 0 then task.wait(hold + 0.1) end
                task.wait(0.2)
                if isBless then
                    S._blessTried[x] = true
                elseif x.Parent and x.Enabled then
                    S._lootTried[x] = true
                end
            end
        end
    end
end

local function hasEnabledLoot(d)
    if not S.AutoLoot then return false end
    for _, x in ipairs(lootPrompts(d)) do
        if lootable(x) then return true end
    end
    return false
end

local _chalLootCache = { t = 0, list = {} }
local function challengeLootPrompts()
    local now = os.clock()
    if (now - _chalLootCache.t) > 3 then
        local list = {}
        for _, x in ipairs(workspace:GetDescendants()) do
            if x:IsA("ProximityPrompt") then list[#list + 1] = x end
        end
        _chalLootCache.t = now
        _chalLootCache.list = list
    end
    return _chalLootCache.list
end

local _chalLootGate = 0
local function doChallengeLoot()
    if not S.AutoLoot then return false end
    local nowg = os.clock()
    if (nowg - _chalLootGate) < 0.8 then return false end
    _chalLootGate = nowg
    local php = hrp()
    if not php then return false end
    local did = false
    for _, x in ipairs(challengeLootPrompts()) do
        if lootable(x) then
            local pos = promptWorldPos(x)
            if pos and (pos - php.Position).Magnitude <= 250 then
                S._target = nil
                S._hoverPos = nil
                hrp().CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
                hrp().AssemblyLinearVelocity = Vector3.zero
                task.wait(0.25)
                local hold = (x.HoldDuration or 0)
                firePrompt(x)
                if hold > 0 then task.wait(hold + 0.1) end
                task.wait(0.2)
                if x.ActionText == "Receive Blessing" then
                    S._blessTried[x] = true
                elseif x.Parent and x.Enabled then
                    S._lootTried[x] = true
                end
                did = true
            end
        end
    end
    return did
end

local _potionSvc
local function usePotion()
    if not _potionSvc then
        local ok, svc = pcall(function() return require(RS.Packages.Knit).GetService("PotionService") end)
        if ok then _potionSvc = svc end
    end
    if _potionSvc then
        pcall(function() _potionSvc:UsePotion(1) end)
    end
end

local function tryHeal()
    if not S.PotionHeal or not alive() then return end
    if hpFrac() > S.HealBelow then return end
    usePotion()
end

local _reg
local function playerData()
    if not _reg then
        local ok, r = pcall(function()
            return require(Players.LocalPlayer.PlayerScripts.Client.Controllers.Registry)
        end)
        if ok then _reg = r end
    end
    if not _reg then return nil end
    local ok, pd = pcall(function() return _reg:Get("PlayerData") end)
    return ok and pd or nil
end

local function potionCount()
    local pd = playerData()
    if not pd or not pd.Data then return nil end
    local eq = pd.Data.EquippedPotion
    if not eq then return nil end
    return (pd.Data.Potions or {})[eq] or 0
end

S._refillTried = S._refillTried or setmetatable({}, { __mode = "k" })
local function refillStation(d)     
    for _, x in ipairs(lootPrompts(d)) do
        if x:IsA("ProximityPrompt") and (x.ActionText or "") == "Refill Potions"
            and x.Enabled and x.Parent then
            return x
        end
    end
    return nil
end

local function doRefill(d)
    if not S.AutoRefillPotion then return false end
    local cnt = potionCount()
    if cnt == nil or cnt > 0 then return false end
    local prompt = refillStation(d)
    if not prompt or S._refillTried[prompt] then return false end
    local pos = promptWorldPos(prompt)
    if not (pos and hrp()) then return false end
    S._target = nil
    S._hoverPos = nil
    S._refillTried[prompt] = true
    hrp().CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
    hrp().AssemblyLinearVelocity = Vector3.zero
    task.wait(0.3)
    local hold = (prompt.HoldDuration or 0)
    firePrompt(prompt)
    if hold > 0 then task.wait(hold + 0.15) end
    task.wait(0.25)
    return true
end

local function mainLoop()
    spawn(function()
        while current() do
            if S.Enabled then
                local ok, err = pcall(function()
                    if not alive() then task.wait(0.5) return end

                    if endScreenUp() then task.wait(0.5) return end
                    local d = dungeon()
                    if not d then task.wait(1) return end
                    tryHeal()

                    if doRefill(d) then return end

                    if hasEnabledLoot(d) then
                        doLoot(d)
                    else
                        local n, r = nearestEnemy(d)
                        if n then
                            while n and S.Enabled and alive() and not endScreenUp() do
                                killEnemy(n, r)
                                S.Kills = (S.Kills or 0) + (n.Parent and 0 or 1)
                                tryHeal()
                                if doRefill(d) then break end
                                if hasEnabledLoot(d) then break end
                                n, r = nearestEnemy(d)
                            end
                        else

                            local found = sweepRooms(d)
                            if not found then task.wait(0.75) end
                        end
                    end
                end)
                if not ok then warn("[SYMBIOS-DL]", err); task.wait(0.5) end
            else
                task.wait(0.3)
            end
        end
    end)
end

spawn(function()
    while current() do
        if S.ChallengeFarm or S.BossRushFarm then
            local ok, err = pcall(function()
                if not alive() then task.wait(0.5) return end
                local myhrp = hrp()
                if myhrp then
                    if hasGroundBelow(myhrp.Position) then
                        S._chalHome = myhrp.Position
                    elseif S._chalHome then
                        S._target = nil
                        S._hoverPos = nil
                        myhrp.CFrame = CFrame.new(S._chalHome + Vector3.new(0, 5, 0))
                        myhrp.AssemblyLinearVelocity = Vector3.zero
                        task.wait(0.3)
                        return
                    end
                end
                tryHeal()
                if doChallengeLoot() then return end
                local n, r = nearestEnemyChallenge()
                if n then
                    while n and (S.ChallengeFarm or S.BossRushFarm) and alive() do
                        killEnemy(n, r)
                        S.Kills = (S.Kills or 0) + (n.Parent and 0 or 1)
                        tryHeal()
                        local mh = hrp()
                        if mh then
                            if hasGroundBelow(mh.Position) then
                                S._chalHome = mh.Position
                            elseif S._chalHome then
                                S._target = nil
                                S._hoverPos = nil
                                mh.CFrame = CFrame.new(S._chalHome + Vector3.new(0, 5, 0))
                                mh.AssemblyLinearVelocity = Vector3.zero
                                break
                            end
                        end
                        n, r = nearestEnemyChallenge()
                    end
                else
                    task.wait(0.6)
                end
            end)
            if not ok then warn("[SYMBIOS-DL]", err); task.wait(0.5) end
        else
            task.wait(0.3)
        end
    end
end)

spawn(function()
    local handled = false
    while current() do
        if S.ChallengeReplay then
            pcall(function()
                local lp = Players.LocalPlayer
                local pg = lp and lp:FindFirstChild("PlayerGui")
                local main = pg and pg:FindFirstChild("Main")
                local hud = main and main:FindFirstChild("HUD")
                local dc = hud and hud:FindFirstChild("Dungeon_Container")
                local ci = dc and dc:FindFirstChild("Completion_Info")
                if ci and ci.Visible then
                    if not handled then
                        handled = true
                        task.wait(0.4)
                        pcall(function()
                            local rb = ci:FindFirstChild("ReplayButton", true)
                            if rb then firesignal(rb.MouseButton1Click) end
                        end)
                        task.wait(0.2)
                        local svcName = S.BossRushFarm and "BossRushService" or "ChallengeRunService"
                        pcall(function() require(RS.Packages.Knit).GetService(svcName):RequestReplay():await() end)
                    end
                else
                    handled = false
                end
            end)
        end
        task.wait(0.4)
    end
end)

spawn(function()
    while current() do
        if (S.Enabled or S.ChallengeFarm or S.BossRushFarm or S.Auto_Event_Farm) and S.AutoSkill and not S.NoSkillCD and alive() then
            local inCombat = S._target ~= nil
            if not inCombat and S.Enabled then
                local d = dungeon()
                if d and nearestEnemy(d) then inCombat = true end
            end
            if not inCombat and (S.ChallengeFarm or S.BossRushFarm) and nearestEnemyChallenge() then inCombat = true end
            if inCombat then pcall(fireSkills) end
        end
        task.wait(S.SkillInterval)
    end
end)

spawn(function()
    while current() do
        if S.Auto_Event_Farm and S.AutoSkill and not S.NoSkillCD and alive() then
            pcall(fireSkills)
        end
        task.wait(S.SkillInterval)
    end
end)

local _dungeonNameCache = {}
local function dungeonDisplayName(id)
    if not id then return nil end
    if _dungeonNameCache[id] ~= nil then return _dungeonNameCache[id] end
    local name = id
    pcall(function()
        local dd = ReplicatedStorage:FindFirstChild("GameInfo")
        dd = dd and dd:FindFirstChild("DungeonData")
        if dd then
            local mod = require(dd)
            local info = mod.GetDungeon and mod.GetDungeon(id)
            if type(info) == "table" and info.DisplayName then name = info.DisplayName end
        end
    end)
    _dungeonNameCache[id] = name
    return name
end

local function currentDungeonInfo()
    local lp = Players.LocalPlayer
    if not lp then return nil, nil end
    local id = lp:GetAttribute("CurrentDungeon")
    local diff = lp:GetAttribute("CurrentDifficultyMode")
    return id, diff
end

local function currentDepth()
    local pg = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
    local hud = pg and pg:FindFirstChild("Main") and pg.Main:FindFirstChild("HUD")
    local dc = hud and hud:FindFirstChild("Dungeon_Container")
    local info = dc and dc:FindFirstChild("Info")
    local depth = info and info:FindFirstChild("Depth")
    local lbl = depth and depth:FindFirstChildWhichIsA("TextLabel")
    if not lbl then return nil end
    return tonumber(lbl.Text:match("%d+"))
end

local function currentBossFloor()
    local lp = Players.LocalPlayer
    if not lp or lp:GetAttribute("InBossRush") ~= true then return nil end
    local pg = lp:FindFirstChild("PlayerGui")
    local hud = pg and pg:FindFirstChild("Main") and pg.Main:FindFirstChild("HUD")
    local dc = hud and hud:FindFirstChild("Dungeon_Container")
    local mc = dc and dc:FindFirstChild("Info") and dc.Info:FindFirstChild("Mob_Counter")
    local prog = mc and mc:FindFirstChild("Progress_Text")
    if not prog then return nil end
    return tonumber((prog.Text or ""):match("%d+"))
end

spawn(function()
    while current() do
        if S.BossExtract and S.BossRushFarm and not S._bossExtracting then
            local floor = currentBossFloor()
            if floor and floor >= (S.BossExtractFloor or 0) then
                S._bossExtracting = true
                S.BossRushFarm = false
                S._target = nil
                pcall(function() if S._bossToggle then S._bossToggle:UpdateState(false) end end)
                task.wait(0.35)
                pcall(function() TeleportService:Teleport(BOSS_EXTRACT_PLACE, Players.LocalPlayer) end)
                task.wait(4)
                S._bossExtracting = false
            end
        end
        task.wait(0.4)
    end
end)

spawn(function()
    local warn
    while current() do
        if S.AutoContinue or S.AutoExtract then
            if not (warn and warn.Parent) then
                local pg = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
                local hud = pg and pg:FindFirstChild("Main") and pg.Main:FindFirstChild("HUD")
                warn = hud and hud:FindFirstChild("Warning")
            end
            if warn and warn.Visible then
                local cf = warn:FindFirstChild("Confirm")
                local dn = warn:FindFirstChild("Deny")
                local ctxt = cf and cf:FindFirstChild("TextLabel") and cf.TextLabel.Text
                local dtxt = dn and dn:FindFirstChild("TextLabel") and dn.TextLabel.Text
                if cf and dn and ctxt == "Continue" and dtxt == "Extract" then
                    local depth = currentDepth()
                    local doExtract = S.AutoExtract and depth and depth >= S.ExtractDepth
                    if doExtract then
                        pcall(function() firesignal(dn.MouseButton1Click) end)
                        task.wait(0.5)
                        clicks(dn)
                        task.wait(.5)
                    elseif S.AutoContinue then
                        pcall(function() firesignal(cf.MouseButton1Click) end)
                        task.wait(0.5)
                        clicks(cf)
                        task.wait(.5)
                    end
                end
            end
        end
        task.wait(0.3)
    end
end)

local _shopSvc
local function shopSvc()
    if not _shopSvc then
        local ok, s = pcall(function() return require(RS.Packages.Knit).GetService("ShopService") end)
        if ok then _shopSvc = s end
    end
    return _shopSvc
end

local _summonSvc
local function ssummonSvc()
    if not _summonSvc then
        local ok, s = pcall(function() return require(RS.Packages.Knit).GetService("SummoningService") end)
        if ok then _summonSvc = s end
    end
    return _summonSvc
end

local function spinCount(svc, mode)
    local pcok, prOk, result = pcall(function() return svc:GetSpinCounts():await() end)
    if pcok and prOk and type(result) == "table" then
        return tonumber(result[mode]) or 0
    end
    return nil
end

local function sellValue(svc, rarity)
    local pcok, prOk, result = pcall(function()
        if rarity then return svc:GetLootStorageSellValue(rarity):await() end
        return svc:GetLootStorageSellValue():await()
    end)
    if pcok and prOk then return tonumber(result) or 0 end
    return 0
end

spawn(function()
    while current() do
        if S.AutoSell and type(S.SellRarities) == "table" then
            local svc = shopSvc()
            if svc and sellValue(svc, nil) > 0 then
                for rarity, on in pairs(S.SellRarities) do
                    if on and sellValue(svc, rarity) > 0 then
                        pcall(function() svc:SellLootStorageByRarity(rarity) end)
                        task.wait(0.15)
                    end
                end
            end
        end
        task.wait(S.SellInterval)
    end
end)

spawn(function()
    while current() do
        if S.Enabled and S.PotionHeal and alive() and hpFrac() <= S.HealBelow then
            usePotion()
        end
        task.wait(0.5)
    end
end)

local BLESS_CATEGORY = {
    dmg_up = "Damage", skill_dmg = "Damage", crit_rate = "Damage",
    skill_crit_rate = "Damage", skill_crit_dmg = "Damage",
    coins = "Coin",
    kill_xp = "XP", clear_xp = "XP",
    move_up = "Boost", hp_up = "Boost", dmg_reduction = "Boost",
    parry_window = "Boost", dodge_cd = "Boost", skill_cd = "Boost",
}

do
    S._rewardConn = true
    spawn(function()
        local Knit = require(RS.Packages.Knit)

        local rewardHandled = false
        local replayHandled = false
        local blessHandled = false
        while current() do
            task.wait(0.6)
            pcall(function()
                local plr = Players.LocalPlayer
                local pg = plr and plr:FindFirstChild("PlayerGui")
                local hud = pg and pg:FindFirstChild("Main")
                hud = hud and hud:FindFirstChild("HUD")
                if not hud then return end
                local svc = Knit.GetService("DungeonRunService")

                local bs = hud:FindFirstChild("Boost_Selection")
                local blessUp = bs and bs.Visible and (bs.GroupTransparency or 0) < 0.5
                if blessUp then
                    if not blessHandled then
                        blessHandled = true
                        local ctrl = Knit.GetController("BoostSelectionController")
                        if ctrl then
                            for _ = 1, 30 do
                                if ctrl._active and ctrl._ready and not ctrl._selecting then break end
                                if not (bs.Visible and (bs.GroupTransparency or 0) < 0.5) then break end
                                task.wait(0.1)
                            end
                            local cand = ctrl._candidates
                            local pick
                            if type(cand) == "table" then
                                local want = S.BlessPriority
                                if want and want ~= "Middle" then
                                    for i, c in ipairs(cand) do
                                        if type(c) == "table" and c.Id and BLESS_CATEGORY[c.Id] == want then
                                            pick = i; break
                                        end
                                    end
                                end
                                if not pick then
                                    pick = 2
                                    if not cand[pick] then pick = #cand end
                                    if not cand[pick] then pick = 1 end
                                end
                            end
                            pcall(function() ctrl:_OnCardClicked(pick or 2) end)
                            task.wait(0.6)
                        end
                        if bs.Visible and (bs.GroupTransparency or 0) < 0.5 then
                            blessHandled = false
                        end
                    end
                else
                    blessHandled = false
                end

                local cs = hud:FindFirstChild("Chest_Selection")
                if S.AutoReward and cs and cs.Visible and (cs.GroupTransparency or 0) < 0.5 then
                    if not rewardHandled then
                        rewardHandled = true
                        local ctrl = Knit.GetController("ChestSelectionController")
                        if ctrl then
                            for _ = 1, 20 do
                                if ctrl._active and ctrl._ready then break end
                                task.wait(0.15)
                            end
                            local picks = ctrl._maxPicks or 2
                            for i = 1, picks do
                                pcall(function() ctrl:_OnChestClicked(i) end)
                                task.wait(0.55)
                            end
                            pcall(function() ctrl:_OnFinish() end)
                        end
                    end
                else
                    rewardHandled = false
                end

                local dc = hud:FindFirstChild("Dungeon_Container")
                local ci = dc and dc:FindFirstChild("Completion_Info")
                local pickerUp = cs and cs.Visible and (cs.GroupTransparency or 0) < 0.5
                if S.AutoReplay and not S.AutoPush and ci.Visible and not pickerUp then
local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonRunService.RF.RequestReplay
Event:InvokeServer()
                        task.wait(3)
                        pcall(function() clicks(game:GetService("Players").LocalPlayer.PlayerGui.Main.HUD.Dungeon_Container.Completion_Info.Content.ActionButtons.ReplayButton) end)
                        task.wait(3)
                end
            end)
        end
    end)
end

local Knit = require(RS:WaitForChild("Packages"):WaitForChild("Knit"))
local DungeonData = require(RS:WaitForChild("GameInfo"):WaitForChild("DungeonData"))
local ChallengeData = require(RS:WaitForChild("GameInfo"):WaitForChild("ChallengeData"))
local BossRushData = nil
pcall(function() BossRushData = require(RS.GameInfo.BossRushData) end)

local DIFFS = { "Easy", "Normal", "Hard", "Nightmare", "Endless" }

local function queueSvc()
    if S._queueSvc then return S._queueSvc end
    local ok, svc = pcall(function() return Knit.GetService("DungeonQueueService") end)
    if ok then S._queueSvc = svc end
    return S._queueSvc
end

local function inDungeon()
    local p = Players.LocalPlayer
    return p and p:GetAttribute("InDungeon") == true
end

local function inBossRush()
    local p = Players.LocalPlayer
    return p and p:GetAttribute("InBossRush") == true
end

local function dungeonList()
    local out = {}
    local order = DungeonData.ChallengeDisplayOrder or {}
    for _, id in ipairs(order) do
        local d = DungeonData.GetDungeon(id)
        if d and not d.HideFromSelect then
            out[#out + 1] = { id = id, name = d.DisplayName or id }
        end
    end
    return out
end

local function dungeonAccess(id)
    local svc = queueSvc()
    if not svc then return true, nil end
    local pcok, _, st = pcall(function() return svc:GetDungeonAccessState(id):await() end)
    if pcok and type(st) == "table" then return st.Unlocked == true, st.Reason end
    return true, nil
end

local function difficultyAccess(id)
    local svc = queueSvc()
    if not svc then return {} end
    local pcok, _, map = pcall(function() return svc:GetUnlockedDifficulties(id):await() end)
    if pcok and type(map) == "table" then return map end
    return {}
end

local function playerLevel()
    local p = Players.LocalPlayer
    return (p and p:GetAttribute("PlayerLevel")) or 0
end
local function challengeUnlockLevel() return ChallengeData.UNLOCK_LEVEL or 55 end
local function featuredChallenge() return ChallengeData.FEATURED_DUNGEON end
local function challengeMeetsLevel() return playerLevel() >= challengeUnlockLevel() end

local function challengeList()
    local out = {}
    for _, id in ipairs(DungeonData.ChallengeModeDisplayOrder or {}) do
        local d = DungeonData.GetDungeon(id)
        if d and not d.HideFromSelect then out[#out + 1] = { id = id, name = d.DisplayName or id } end
    end
    return out
end

local function startChallenge()
    local svc = queueSvc()
    if not svc then return false, "queue service unavailable" end
    if not challengeMeetsLevel() then
        return false, "Challenge locked (need level " .. challengeUnlockLevel() .. ")"
    end
    local id = featuredChallenge()
    if not id then return false, "no featured challenge" end
    local okAll = true
    local function fire(fn) local ok = pcall(fn); okAll = okAll and ok end
    fire(function() svc:RequestSelectMode("Challenge"):await() end)
    fire(function() svc:RequestSelectDungeon(id):await() end)
    fire(function() svc:RequestStartPodQueue():await() end)
    return okAll, okAll and "started" or "server request failed"
end

local function bossRushUnlockLevel() return (BossRushData and BossRushData.UNLOCK_LEVEL) or 67 end
local function bossRushMeetsLevel() return playerLevel() >= bossRushUnlockLevel() end
local function bossRushList()
    local out = {}
    for _, name in ipairs((BossRushData and BossRushData.FINAL_BOSS_ORDER) or {}) do out[#out + 1] = name end
    return out
end
local function defaultFinalBoss()
    local list = bossRushList()
    return list[1] or "Cursed King"
end

local function startBossRush()
    local svc = queueSvc()
    if not svc then return false, "queue service unavailable" end
    if not bossRushMeetsLevel() then
        return false, "Boss Rush locked (need level " .. bossRushUnlockLevel() .. ")"
    end
    local pcok, _, st = pcall(function() return svc:GetBossRushAccessState():await() end)
    if pcok and type(st) == "table" and st.Unlocked ~= true then
        return false, "Boss Rush locked: " .. tostring(st.Reason)
    end
    local boss = S.BossRushSel
    if not boss or boss == "" then boss = defaultFinalBoss() end
    local okAll = true
    local function fire(fn) local ok = pcall(fn); okAll = okAll and ok end
    fire(function() svc:RequestSelectMode("BossRush"):await() end)
    fire(function() svc:RequestSelectFinalBoss(boss):await() end)
    fire(function() svc:RequestEnter():await() end)
    return okAll, okAll and "started" or "server request failed"
end

local function startRun()
    local svc = queueSvc()
    if not svc then return false, "queue service unavailable" end
    local id, diff = S.JoinDungeon, S.JoinDifficulty
    local unlocked, reason = dungeonAccess(id)
    if not unlocked then return false, "dungeon locked: " .. tostring(reason) end
    local dm = difficultyAccess(id)
    local de = dm[diff]
    if de and de.Unlocked ~= true then return false, "difficulty locked: " .. tostring(de.Reason) end
    local okAll = true
    local function fire(fn) local ok = pcall(fn); okAll = okAll and ok end
    fire(function() svc:RequestSelectMode("Dungeon"):await() end)
    fire(function() svc:RequestSelectDungeon(id):await() end)
    fire(function() svc:RequestSelectDifficulty(diff):await() end)
    if S.SoloMode then
        fire(function() svc:RequestStartSoloRun():await() end)
    else
        fire(function() svc:RequestStartPodQueue():await() end)
    end
    return okAll, okAll and "started" or "server request failed"
end

spawn(function()
    while current() do

        local wantBossRush = S.AutoBossRush
        local wantChallenge = S.AutoChallenge and not wantBossRush
        local wantJoin = S.AutoJoin and not wantChallenge and not wantBossRush
        local joined = inDungeon() or inBossRush()
        if (wantBossRush or wantChallenge or wantJoin) and not joined then
            task.wait(3)
            wantBossRush = S.AutoBossRush
            wantChallenge = S.AutoChallenge and not wantBossRush
            wantJoin = S.AutoJoin and not wantChallenge and not wantBossRush
            joined = inDungeon() or inBossRush()
        end
        if (wantBossRush or wantChallenge or wantJoin) and not joined then
            local ok, why
            if wantBossRush then
                ok, why = startBossRush()
            elseif wantChallenge then
                ok, why = startChallenge()
            else
                ok, why = startRun()
            end
            if ok then

                local t = 0
                while current() and (S.AutoBossRush or S.AutoChallenge or S.AutoJoin)
                    and not (inDungeon() or inBossRush()) and t < 12 do
                    task.wait(0.5); t = t + 0.5
                end
            else

                task.wait(3)
            end
        end
        task.wait(1)
    end
end)

local function summonSvc()
    if S._summonSvc then return S._summonSvc end
    local ok, s = pcall(function() return Knit.GetService("SummoningService") end)
    if ok then S._summonSvc = s end
    return S._summonSvc
end
local function activeClassSlot()
    local ok, d = pcall(function() return require(Players.LocalPlayer.PlayerScripts.Client.Controllers.Registry):Get("PlayerData").Data end)
    if not ok or type(d) ~= "table" then return nil end
    local idx = d.ActiveSlotIndex
    local active = d.ActiveClass
    local slots = d.ClassSlots
    local function slotAt(i) return type(slots) == "table" and (slots[i] or slots[tostring(i)]) or nil end
    if type(idx) == "number" then
        local s = slotAt(idx)
        if type(s) == "table" and s.ClassName == active then return idx end
    end
    if type(slots) == "table" and active then
        for i = 1, 8 do
            local s = slotAt(i)
            if type(s) == "table" and s.ClassName == active then return i end
        end
    end
    if type(idx) == "number" and idx >= 1 then return idx end
    return nil
end
local NOCD_ACT = {
    [Enum.AnimationPriority.Action] = true, [Enum.AnimationPriority.Action2] = true,
    [Enum.AnimationPriority.Action3] = true, [Enum.AnimationPriority.Action4] = true,
}
local function noCdWaitAnim()
    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    local h = char and char:FindFirstChildOfClass("Humanoid")
    local anim = h and h:FindFirstChildOfClass("Animator")
    local deadline = os.clock() + 3
    local sawAnim = false
    if anim then
        task.wait(0.08)
        while os.clock() < deadline do
            local playing = false
            for _, t in ipairs(anim:GetPlayingAnimationTracks()) do
                if t.IsPlaying and not t.Looped and NOCD_ACT[t.Priority] then playing = true; sawAnim = true; break end
            end
            if not playing then break end
            task.wait()
        end
    end
    if not sawAnim then task.wait(0.25) end
end
local function noCdReset()
    local slot = activeClassSlot()
    local svc = summonSvc()
    if svc and slot then pcall(function() svc:SwitchSlot(slot):await() end) end
end
local function noCdWaitAnimThenReset()
    noCdWaitAnim()
    noCdReset()
end
local function noCdReadSlot(i)
    local p = Players.LocalPlayer
    if not p then return nil, false, 0 end
    local pre = "Skill" .. i .. "_"
    return p:GetAttribute(pre .. "Charges"), p:GetAttribute(pre .. "OnCooldown") == true, p:GetAttribute(pre .. "CooldownRemaining") or 0
end
spawn(function()
    local pc, poc, prem = {}, {}, {}
    local NOCD_SLOTS = { 1, 2, 3, 4 }
    local function refresh()
        for _, i in ipairs(NOCD_SLOTS) do pc[i], poc[i], prem[i] = noCdReadSlot(i) end
    end
    refresh()
    local busy = false
    while current() do
        if S.NoSkillCD and not (S.AutoSkill and (S.Enabled or S.ChallengeFarm or S.BossRushFarm or S.Auto_Event_Farm)) and alive() then
            for _, i in ipairs(NOCD_SLOTS) do
                local ch, oc, rem = noCdReadSlot(i)
                local cast = false
                if ch ~= nil and pc[i] ~= nil and ch < pc[i] then cast = true end
                if oc == true and poc[i] ~= true then cast = true end
                if rem > 0 and (prem[i] or 0) <= 0 then cast = true end
                pc[i], poc[i], prem[i] = ch, oc, rem
                if cast and not busy then
                    busy = true
                    spawn(function()
                        noCdWaitAnimThenReset()
                        task.wait(0.1)
                        refresh()
                        busy = false
                    end)
                end
            end
            RunService.Heartbeat:Wait()
        else
            refresh()
            task.wait(0.3)
        end
    end
end)

spawn(function()
    local p = Players.LocalPlayer
    while current() do
        if S.NoSkillCD and S.AutoSkill and (S.Enabled or S.ChallengeFarm or S.BossRushFarm or S.Auto_Event_Farm) and alive() then
            local inCombat = S._target ~= nil
            if not inCombat and S.Enabled then
                local d = dungeon()
                if d and nearestEnemy(d) then inCombat = true end
            end
            if not inCombat and (S.ChallengeFarm or S.BossRushFarm) and nearestEnemyChallenge() then inCombat = true end
            local equipped = p and p:GetAttribute("Weapon_Equipped") and not p:GetAttribute("Dead")
            if inCombat and equipped then
                local fired = false
                for _, slot in ipairs(S.SkillSel) do
                    if not (S.NoSkillCD and S.AutoSkill) or not alive() then break end
                    if slotReady(tonumber(slot)) == true then
                        S._skillHoldUntil = os.clock() + 3
                        pcall(function() SkillRemote:FireServer(tonumber(slot), "tap") end)
                        noCdWaitAnim()
                        fired = true
                    end
                end
                if fired then
                    noCdReset()
                else
                    task.wait(0.1)
                end
            else
                task.wait(0.1)
            end
        else
            task.wait(0.2)
        end
    end
end)

local PUSH_DIFFS = { "Easy", "Normal", "Hard", "Nightmare" }
local function normDiff(txt)
    if not txt then return nil end
    local low = txt:lower()
    for _, d in ipairs(PUSH_DIFFS) do if d:lower() == low then return d end end
    return nil
end
local function nextPushTarget(curId, curDiff)
    local di
    for i, d in ipairs(PUSH_DIFFS) do if d == curDiff then di = i end end
    if not di then return nil end
    if di < #PUSH_DIFFS then return curId, PUSH_DIFFS[di + 1] end
    local list = dungeonList()
    local idx
    for i, d in ipairs(list) do if d.id == curId then idx = i end end
    if idx and list[idx + 1] then return list[idx + 1].id, "Easy" end
    return nil
end

spawn(function()
    local pushHandled = false
    while current() do
        task.wait(0.7)
        if S.AutoPush then
            pcall(function()
                local plr = Players.LocalPlayer
                local pg = plr and plr:FindFirstChild("PlayerGui")
                local hud = pg and pg:FindFirstChild("Main"); hud = hud and hud:FindFirstChild("HUD")
                if not hud then return end
                local dc = hud:FindFirstChild("Dungeon_Container")
                local ci = dc and dc:FindFirstChild("Completion_Info")
                local content = ci and ci:FindFirstChild("Content")
                local actions = content and content:FindFirstChild("ActionButtons")
                local cs = hud:FindFirstChild("Chest_Selection")
                local pickerUp = cs and cs.Visible and (cs.GroupTransparency or 0) < 0.5
                if ci and ci.Visible and actions and not pickerUp then
                    if not pushHandled then
                        pushHandled = true
                        task.wait(0.8)
                        local svc = Knit.GetService("DungeonRunService")
                        local curId
                        local pcok, prok, si = pcall(function() return svc:GetSessionInfo():await() end)
                        if pcok and prok and type(si) == "table" then curId = si.LocationId end
                        local diffTxt
                        local lvl = content:FindFirstChild("Level")
                        local dframe = lvl and lvl:FindFirstChild("Difficulty")
                        local dlbl = dframe and dframe:FindFirstChildWhichIsA("TextLabel")
                        if dlbl then diffTxt = dlbl.Text end
                        local curDiff = normDiff(diffTxt)
                        if curId and curDiff then
                            local nid, ndiff = nextPushTarget(curId, curDiff)
                            if nid and ndiff then
                                local ok = false
                                for _ = 1, 5 do
                                    local pcok2, succ = pcall(function() return svc:RequestDungeonChange(nid, ndiff):await() end)
                                    if pcok2 and succ then ok = true break end
                                    if not S.AutoPush then break end
                                    if not (ci and ci.Visible) then break end
                                    task.wait(1.5)
                                end
                            else

                            end
                        end
                    end
                elseif not (ci and ci.Visible) then
                    pushHandled = false
                end
            end)
        end
    end
end)

local BattlepassData = require(RS:WaitForChild("GameInfo"):WaitForChild("BattlepassData"))
local playerReg = require(Players.LocalPlayer.PlayerScripts:WaitForChild("Client"):WaitForChild("Controllers"):WaitForChild("Registry"))

local function bpSvc()
    if not S._bpSvc then local ok, s = pcall(function() return Knit.GetService("BattlepassService") end); if ok then S._bpSvc = s end end
    return S._bpSvc
end
local function questSvc()
    if not S._questSvc then local ok, s = pcall(function() return Knit.GetService("QuestService") end); if ok then S._questSvc = s end end
    return S._questSvc
end
local function playerData()
    local ok, pd = pcall(function() return playerReg:Get("PlayerData") end)
    return ok and pd or nil
end

local function claimBPQuests()
    local pd = playerData(); local svc = bpSvc()
    if not (pd and svc and pd.Data and pd.Data.Battlepass and pd.Data.Battlepass.Quests) then return end
    for i, q in ipairs(pd.Data.Battlepass.Quests) do
        if q.Completed and not q.Claimed then
            pcall(function() svc:ClaimQuest(i):await() end)
        end
    end
end

local function claimBPRewards()
    local pd = playerData(); local svc = bpSvc()
    if not (pd and svc and pd.Data and pd.Data.Battlepass) then return end
    local bp = pd.Data.Battlepass
    local top = math.min(bp.Tier or 0, BattlepassData.MAX_TIER or 100)
    local cf, cp = bp.ClaimedFree or {}, bp.ClaimedPremium or {}
    for i = 1, top do
        if not table.find(cf, i) then pcall(function() svc:ClaimReward(i, "Free"):await() end) end
        if bp.HasPremium and not table.find(cp, i) then pcall(function() svc:ClaimReward(i, "Premium"):await() end) end
    end
end

local function claimQuests()
    local pd = playerData(); local svc = questSvc()
    if not (pd and svc and pd.Data and pd.Data.Quests) then return end
    for cat, c in pairs(pd.Data.Quests) do
        if type(c) == "table" and type(c.Active) == "table" then
            for slot, q in ipairs(c.Active) do
                if type(q) == "table" and q.Completed and not q.Claimed then
                    pcall(function() svc:ClaimQuest(cat, slot):await() end)
                end
            end
        end
    end
end

spawn(function()
    task.wait(3)
    while current() do
        if S.AutoClaimBPQuest then pcall(claimBPQuests) end
        if S.AutoClaimBPReward then pcall(claimBPRewards) end
        if S.AutoClaimQuest then pcall(claimQuests) end
        task.wait(15)
    end
end)

if not S._antiAfk then
    S._antiAfk = true
    pcall(function()
        LP.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end)
end

local LOCK = "  [LOCKED]"
local function stripLock(s) return (tostring(s):gsub("%s*%[LOCKED%]$", "")) end

local dungeonMap = {}
local function buildDungeonOptions()
    local opts = {}
    dungeonMap = {}
    for _, e in ipairs(dungeonList()) do
        local unlocked = dungeonAccess(e.id)
        local disp = unlocked and e.name or (e.name .. LOCK)
        opts[#opts + 1] = disp
        dungeonMap[disp] = e.id
        dungeonMap[e.name] = e.id
    end
    return opts
end

local function dungeonDisplayFor(id)
    for _, e in ipairs(dungeonList()) do
        if e.id == id then
            local unlocked = dungeonAccess(id)
            return unlocked and e.name or (e.name .. LOCK)
        end
    end
    return nil
end

local dungeonDD, diffDD

local revertingDungeon, revertingDiff = false, false

local function difficultyOptions()
    local dm = difficultyAccess(S.JoinDungeon)
    local opts = {}
    for _, d in ipairs(DIFFS) do
        local e = dm[d]
        local unlocked = (e == nil) or (e.Unlocked == true)
        opts[#opts + 1] = unlocked and d or (d .. LOCK)
    end
    return opts, dm
end

S._dungeonDD, S._diffDD = dungeonDD, diffDD

local challengeDD
local revertingChallenge = false
local challengeMap = {}
local function buildChallengeOptions()
    local opts = {}
    challengeMap = {}
    local feat = featuredChallenge()
    local meets = challengeMeetsLevel()
    for _, e in ipairs(challengeList()) do
        local selectable = (e.id == feat) and meets
        local disp = selectable and e.name or (e.name .. LOCK)
        opts[#opts + 1] = disp
        challengeMap[disp] = e.id
        challengeMap[e.name] = e.id
    end
    return opts, feat
end
local function challengeDisplayFor(id)
    for _, e in ipairs(challengeList()) do
        if e.id == id then
            local selectable = (e.id == featuredChallenge()) and challengeMeetsLevel()
            return selectable and e.name or (e.name .. LOCK)
        end
    end
    return nil
end

do
    local feat = featuredChallenge()
    if feat then S.ChallengeSel = feat end
end

S._challengeDD = challengeDD

do
    if (not S.BossRushSel or S.BossRushSel == "") then S.BossRushSel = defaultFinalBoss() end
end

local function rebuildDifficulties()
    local opts, dm = difficultyOptions()

    local cur = dm[S.JoinDifficulty]
    if cur and cur.Unlocked ~= true then
        for _, d in ipairs(DIFFS) do
            local e = dm[d]
            if (e == nil) or (e.Unlocked == true) then S.JoinDifficulty = d; break end
        end
    end
    local want
    for _, disp in ipairs(opts) do
        if stripLock(disp) == S.JoinDifficulty then want = disp end
    end
    if diffDD then

        pcall(function() diffDD:ClearOptions() end)
        pcall(function() diffDD:InsertOptions(opts) end)
        if want then
            revertingDiff = true
            pcall(function() diffDD:UpdateSelection(want) end)
        end
    end
    return opts
end

S._bossRushDD = bossRushDD

local autoJoinTgl, autoChalTgl, autoBossTgl
local function joinExclusive(keep)
    for _, h in ipairs({ autoJoinTgl, autoChalTgl, autoBossTgl }) do
        if h and h ~= keep then pcall(function() h:UpdateState(false) end) end
    end
end

local autoFarmTgl
local function farmExclusive(keep)
    for _, h in ipairs({ autoFarmTgl, S._challengeToggle, S._bossToggle }) do
        if h and h ~= keep then pcall(function() h:UpdateState(false) end) end
    end
end

local replayToggle, pushToggle

local SPIN_CLASSES = {}
pcall(function()
    local cd = require(RS.Classes.Class_Data)
    local names = cd.GetAllClassNames()
    table.sort(names)
    SPIN_CLASSES = names
end)
local SPIN_ASPECTS = {}
pcall(function()
    SPIN_ASPECTS = require(RS.GameInfo.MutationData).GetClassWeaponAspectNames()
end)

local spinClassDefault = {}
for _, c in ipairs(SPIN_CLASSES) do
    if type(S.SpinClasses) == "table" and S.SpinClasses[c] then spinClassDefault[#spinClassDefault + 1] = c end
end
local spinAspectDefault = {}
for _, a in ipairs(SPIN_ASPECTS) do
    if type(S.SpinAspects) == "table" and S.SpinAspects[a] then spinAspectDefault[#spinAspectDefault + 1] = a end
end

S.AutoSpin = false

spawn(function()
    while current() do
        local delay = 0.4
        if S.AutoSpin then
            if next(S.SpinClasses) == nil or next(S.SpinAspects) == nil then
                delay = 0.6
            else
                local svc = summonSvc()
                local mode = (S.SpinMode == "Lucky") and "Lucky" or "Normal"
                if svc then
                    local cnt = spinCount(svc, mode)
                    if cnt ~= nil and cnt <= 0 then
                        S.AutoSpin = false
                        if spinToggle then pcall(function() spinToggle:UpdateState(false) end) end
                    else
                        local ok, succ, res = pcall(function() return svc:Spin(mode, false):await() end)
                        if ok and succ and type(res) == "table" then
                            local cls, asp = res.ClassName, res.Aspect
                            if cls and asp and asp ~= "" and S.SpinClasses[cls] and S.SpinAspects[asp] then
                                S.AutoSpin = false
                                if spinToggle then pcall(function() spinToggle:UpdateState(false) end) end
                            end
                            delay = 0.5
                        else
                            delay = 0.6
                        end
                    end
                else
                    delay = 0.6
                end
            end
        end
        task.wait(delay)
    end
end)

do
    local LOCO = {}
    for _, s in ipairs({
        "507770677", "10921070953", "507771019", "507771955", "507772104",
        "507776043", "507776720", "507776879", "507777268", "507777451", "507777623",
        "10921077030", "72402887392404", "10921078135", "507770818", "13683995887",
        "507770453", "10921074502", "122199389926212", "2506281703", "10921079380",
        "10921081059", "522638767", "507768375", "522635514", "507770239",
    }) do LOCO[s] = true end

    local function animKey(track)
        local a = track and track.Animation
        local id = a and a.AnimationId or ""
        return id:match("(%d+)") or ""
    end

    if S._parryConns then
        for _, c in ipairs(S._parryConns) do pcall(function() c:Disconnect() end) end
    end
    S._parryConns = {}
    S._parryHooked = setmetatable({}, { __mode = "k" })
    local recent = {}

    local function predictDelay(id, dist)
        local m = S.ParryModel[id]
        if not m or (m.n or 0) < 1 then return S.ParryHitDelay or 0.35 end
        if m.n >= 2 then
            local denom = m.n * m.sxx - m.sx * m.sx
            if math.abs(denom) > 1e-6 then
                local slope = (m.n * m.sxy - m.sx * m.sy) / denom
                slope = math.clamp(slope, 0, 0.03)
                local intercept = (m.sy - slope * m.sx) / m.n
                return math.clamp(intercept + slope * dist, 0.1, 1.5)
            end
        end
        return math.clamp(m.sy / m.n, 0.1, 1.5)
    end

    local function learnSample(id, dist, measured)
        local m = S.ParryModel[id]
        if not m then m = { n = 0, sx = 0, sy = 0, sxx = 0, sxy = 0 }; S.ParryModel[id] = m end
        if m.n >= 30 then
            local f = 29 / 30
            m.n = m.n * f; m.sx = m.sx * f; m.sy = m.sy * f; m.sxx = m.sxx * f; m.sxy = m.sxy * f
        end
        m.n = m.n + 1
        m.sx = m.sx + dist; m.sy = m.sy + measured
        m.sxx = m.sxx + dist * dist; m.sxy = m.sxy + dist * measured
    end

    local function tryParry()
        if not current() or not S.AutoParry then return end
        local lp = Players.LocalPlayer
        if not lp then return end
        if lp:GetAttribute("Parry_Cooldown_Active") then return end
        if S._parryBusy then return end
        if not alive() then return end
        S._parryBusy = true
        pcall(function() ParryRemote:FireServer() end)
        task.delay(0.25, function() S._parryBusy = false end)
    end

    local function onEnemyAnim(enemy, track)
        if not current() or not S.AutoParry then return end
        if track.Looped then return end
        local id = animKey(track)
        if id == "" or LOCO[id] then return end
        if track.Length > 0 and track.Length < 0.35 then return end
        local root = enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("Torso")
        local php = hrp()
        if not root or not php then return end
        local dist = (root.Position - php.Position).Magnitude
        if dist > (S.ParryRangedRange or 150) then return end
        recent[#recent + 1] = { id = id, t = os.clock(), dist = dist, enemy = enemy }
        if #recent > 24 then table.remove(recent, 1) end
        local learnedAny = next(S.ParryAttackIds) ~= nil
        local shouldParry
        if S.ParryAttackIds[id] then
            shouldParry = true
        elseif not learnedAny and dist <= S.ParryRange then
            shouldParry = true
        end
        if shouldParry then
            local fireDelay = math.clamp(predictDelay(id, dist) - (S.ParryLead or 0.13), 0, 1.5)
            task.delay(fireDelay, tryParry)
        end
    end

    local function hookEnemy(enemy)
        if S._parryHooked[enemy] then return end
        local ctrl = enemy:FindFirstChildWhichIsA("AnimationController") or enemy:FindFirstChildOfClass("Humanoid")
        local animator = ctrl and ctrl:FindFirstChildOfClass("Animator")
        if not animator then return end
        S._parryHooked[enemy] = true
        local conn = animator.AnimationPlayed:Connect(function(track)
            onEnemyAnim(enemy, track)
        end)
        table.insert(S._parryConns, conn)
    end

    local dmgConn = CombatFeedback.OnClientEvent:Connect(function(kind)
        if not current() or not S.AutoParry then return end
        if kind ~= "TakeDamage" then return end
        local now, best, bestErr = os.clock(), nil, nil
        for i = #recent, 1, -1 do
            local r = recent[i]
            local elapsed = now - r.t
            if elapsed >= 0.05 and elapsed <= 1.5 then
                local m = S.ParryModel[r.id]
                if m and (m.n or 0) >= 2 then
                    local err = math.abs(predictDelay(r.id, r.dist) - elapsed)
                    if not bestErr or err < bestErr then bestErr = err; best = r end
                end
            end
        end
        if not best then
            for i = #recent, 1, -1 do
                local r = recent[i]
                local elapsed = now - r.t
                if elapsed >= 0.05 and elapsed <= 1.5 then
                    if not best or r.dist < best.dist then best = r end
                end
            end
        end
        if best then
            S.ParryAttackIds[best.id] = true
            local measured = now - best.t
            if measured >= 0.1 and measured <= 1.4 then
                learnSample(best.id, best.dist, measured)
                S.ParryHitDelay = (S.ParryHitDelay or measured) * 0.7 + measured * 0.3
            end
        end
    end)
    table.insert(S._parryConns, dmgConn)

    spawn(function()
        while current() do
            if S.AutoParry then
                local php = hrp()
                if php then
                    local range = S.ParryRangedRange or 150
                    local d = dungeon()
                    local npcs = d and d:FindFirstChild("NPCs")
                    if npcs then
                        for _, m in ipairs(npcs:GetChildren()) do
                            local root = m:FindFirstChild("HumanoidRootPart")
                            if root and (root.Position - php.Position).Magnitude <= range then
                                hookEnemy(m)
                            end
                        end
                    end
                    if not npcs then
                        local function walk(c, depth)
                            for _, m in ipairs(c:GetChildren()) do
                                if m:IsA("Model") and (m:FindFirstChildOfClass("Humanoid") or m:FindFirstChildWhichIsA("AnimationController")) then
                                    local root = enemyRoot(m)
                                    if root and (root.Position - php.Position).Magnitude <= range then
                                        hookEnemy(m)
                                    end
                                elseif depth < 3 and (m:IsA("Folder") or m:IsA("Configuration")) then
                                    walk(m, depth + 1)
                                end
                            end
                        end
                        walk(workspace, 0)
                    end
                end
            end
            task.wait(0.3)
        end
    end)
end

mainLoop()

Main:Divider()

toggles["Enabled"] = Main:Toggle({
    Title = "Auto Farm",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Enabled or false, -- default value
    Callback = function(state) 
        S.Enabled = state
        if state then
        farmExclusive(autoFarmTgl)
        end
    end
})

local Section = Main:Section({ 
    Title = "Challenge Settings",
})

Main:Divider()

dropdowns["ChallengeSel"] = Main:Dropdown({
    Title = "Select Challenge",
    Desc = "select your challenge to play.",
    Values = (buildChallengeOptions()),
    Value = challengeDisplayFor(S.ChallengeSel) or S.ChallengeSel,
    Multi = false,
    AllowNone = false,
    Callback = function(v) 
        if revertingChallenge then revertingChallenge = false; return end
		local id = challengeMap[v] or stripLock(v)
		local selectable = (id == featuredChallenge()) and challengeMeetsLevel()
		if not selectable then
			local why = challengeMeetsLevel() and "Only the featured challenge is playable" or ("Challenge unlocks at level " .. challengeUnlockLevel())
			if Window then game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub Notification", 
            Text = why
        }) end
			local back = challengeDisplayFor(S.ChallengeSel)
			if challengeDD and back then
				revertingChallenge = true
				pcall(function() dropdowns["ChallengeSel"]:Select(back) end)
			end
			return
		end
		S.ChallengeSel = id
    end
})

toggles["ChallengeFarm"] = Main:Toggle({
    Title = "Auto Challenge Farm",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.ChallengeFarm or false, -- default value
    Callback = function(state) 
        S.ChallengeFarm = state
        if state then
        farmExclusive(S._challengeToggle)
        end
    end
})

spawn(function()
    while task.wait(2) do
        pcall(function()
    if S.ChallengeFarm and not ingame then
local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestSelectMode
Event:InvokeServer(
    "Challenge"
)

-- This code was generated by Cobalt
-- https://gitlab.com/upio/cobalt

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestSelectDungeon
Event:InvokeServer(
    S.ChallengeSel
)

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestStartSoloRun
Event:InvokeServer()

task.wait(2)
            end
    end)
    end
    end)

toggles["ChallengeReplay"] = Main:Toggle({
    Title = "Auto Replay Challenge",
    Desc = "replay challenge.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.ChallengeReplay or false, -- default value
    Callback = function(state) 
        S.ChallengeReplay = state
    end
})  

local Section = Main:Section({ 
    Title = "Boss Rush Settings",
})

Main:Divider()

dropdowns["BossRushSel"] = Main:Dropdown({
    Title = "Select Boss Rush",
    Desc = "select your boss rush to play.",
    Values = bossRushList(),
    Value = S.BossRushSel,
    Multi = false,
    AllowNone = false,
    Callback = function(v) 
		S.BossRushSel = v
    end
})

toggles["BossRushFarm"] = Main:Toggle({
    Title = "Auto Boss Rush Farm",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.BossRushFarm or false, -- default value
    Callback = function(state) 
        S.BossRushFarm = state
if state then
        farmExclusive(S._bossToggle)
        end
    end
})

spawn(function()
    while task.wait(2) do
        pcall(function()
    if S.BossRushFarm and not ingame then
-- This code was generated by Cobalt
-- https://gitlab.com/upio/cobalt

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestSelectMode
Event:InvokeServer(
    "BossRush"
)

-- This code was generated by Cobalt
-- https://gitlab.com/upio/cobalt

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestSelectFinalBoss
Event:InvokeServer(
    S.BossRushSel
)

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestStartSoloRun
Event:InvokeServer()

task.wait(2)
            end
    end)
    end
    end)

inputs["BossExtractFloor"] = Main:Input({
    Title = "BossExtract",
    Desc = "put your number to extract boss floor.",
    Value = S.BossExtractFloor or 15,
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter floor...",
    Callback = function(input) 
    if tonumber(input) and tonumber(input) > 0 then
        S.BossExtractFloor = tonumber(input)
        end
    end
})

toggles["BossExtract"] = Main:Toggle({
    Title = "Boss Rush Extract",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.BossRushFarm or false, -- default value
    Callback = function(state) 
        S.BossExtract = state
    end
})

local Section = Main:Section({ 
    Title = "Event Settings",
})

Main:Divider()

toggles["Auto_Event_Farm"] = Main:Toggle({
    Title = "Auto Event",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Auto_Event_Farm or false, -- default value
    Callback = function(state) 
        S.Auto_Event_Farm = state
    end
})

dropdowns["Select_Diff_Event"] = Main:Dropdown({
    Title = "Select Dungeon",
    Desc = "select your dungeon to join.",
    Values = {"Normal","Extreme","Impossible"},
    Value = S.Select_Diff_Event or "Normal",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Select_Diff_Event = option
    end
})

toggles["Auto_Join_Event"] = Main:Toggle({
    Title = "Auto Join",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Auto_Join_Event or false, -- default value
    Callback = function(state) 
        S.Auto_Join_Event = state
    end
})

alldungeon = {"Bandits Den","Goblins","Knights","Catacombs","Snow","Demon","Mage"}

local Section = join:Section({ 
    Title = "Join Menu",
})

join:Divider()

dropdowns["JoinDungeon"] = join:Dropdown({
    Title = "Select Dungeon",
    Desc = "select your dungeon to join.",
    Values = alldungeon,
    Value = S.JoinDungeon or "Bandits Den",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.JoinDungeon = option
    end
})

alleasy = {"Easy","Normal","Hard","Nightmare","Endless"}

dropdowns["JoinDifficulty"] = join:Dropdown({
    Title = "Select Difficult",
    Desc = "select your difficult to play.",
    Values = alleasy,
    Value = S.JoinDifficulty or "Easy",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.JoinDifficulty = option
    end
})

toggles["SoloMode"] = join:Toggle({
    Title = "Solo Mode",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.SoloMode or false, -- default value
    Callback = function(state) 
        S.SoloMode = state
    end
})

toggles["AutoJoin"] = join:Toggle({
    Title = "Auto Join Dungeon",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoJoin or false, -- default value
    Callback = function(state) 
        S.AutoJoin = state
    end
})

local Section = sett:Section({ 
    Title = "Farm Settings",
})

sett:Divider()

dropdowns["Mode_Farm"] = sett:Dropdown({
    Title = "Select Position",
    Desc = "select your position to farm.",
    Values = {"Above","Behind","Below"},
    Value = S.Mode_Farm or "Above",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Mode_Farm = option
    end
})

    slides["Disc"] = sett:Slider({
        Title = "Distance",
        Desc = "",
        
        -- To make float number supported, 
        -- make the Step a float number.
        -- example: Step = 0.1
        Step = 1,
        Value = {
            Min = 1,
            Max = 30,
            Default = S.Disc,
        },
        Callback = function(value)
            S.Disc = value
        end
    })

dropdowns["SkillSel"] = sett:Dropdown({
    Title = "Selects Skill",
    Desc = "select your skill to use.",
    Values = {"1","2","3","4","5"},
    Value = S.SkillSel or {"1","2","3","4"},
    Multi = true,
    AllowNone = true,
    Callback = function(sel)
    S.SkillSel = sel
    end
})

toggles["AutoSkill"] = sett:Toggle({
    Title = "Auto Skill",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoSkill or false, -- default value
    Callback = function(state) 
        S.AutoSkill = state
    end
})

slides["SkillInterval"] = sett:Slider({
        Title = "Skill Delay",
        Desc = "",
        
        -- To make float number supported, 
        -- make the Step a float number.
        -- example: Step = 0.1
        Step = .1,
        Value = {
            Min = 0,
            Max = 5,
            Default = S.SkillInterval,
        },
        Callback = function(value)
            S.SkillInterval = value
        end
    })

function farmmons()
for i,v in pairs(workspace.Raid_NPCs:GetChildren()) do
if v:FindFirstChild("Bottom") then
return v
end
end
for i,v in pairs(workspace.Raid_NPCs:GetChildren()) do
if not v:GetAttribute("IsBoss") then
return v
end
end
for i,v in pairs(workspace.Raid_NPCs:GetChildren()) do
if v:GetAttribute("IsBoss") then
return v
end
end
end

function checkskill()
for i,v in pairs(workspace:GetChildren()) do
if v.Name == "SpellBurst_Grenade" then
return true
end
end
return false
end

	function stringToCFrame(input)
	return CFrame.new(
		unpack(
		game:GetService('HttpService'):JSONDecode(
			'['..input..']'
		)
		)
	)
	end

spawn(function()
    while task.wait() do
        pcall(function()
    if S.Auto_Event_Farm and workspace:FindFirstChild("Raid_NPCs") then
    if checkskill() then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-100,30,0)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(100,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(0,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,-100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(200,30,100)
task.wait(.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpellBurst_Grenade.CFrame * CFrame.new(-200,30,100)
task.wait(.3)
    else
    if farmmons():FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = farmmons().HumanoidRootPart.CFrame * ModeFarm2
elseif not farmmons():FindFirstChild("HumanoidRootPart") then
if farmmons():FindFirstChild("Bottom") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = farmmons().Bottom.CFrame * ModeFarm2
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(farmmons().WorldPivot))
end
end
end
            end
    end)
    end
    end)

spawn(function()
    while task.wait() do
        pcall(function()
    if S.Auto_Event_Farm and workspace:FindFirstChild("Raid_NPCs") then
Attack:FireServer(Vector3.new(0, 0, -1))
task.wait(S.AttackCadence)
            end
    end)
    end
    end)

spawn(function()
while task.wait() do
    pcall(function()
if S.Auto_Event_Farm and ingame then
if not workspace:FindFirstChild("AxelHub_Part") then
axelhubpart = Instance.new("Part")
end
axelhubpart = workspace:FindFirstChild("AxelHub_Part")
axelhubpart.Parent = workspace
axelhubpart.Name = "AxelHub_Part"
axelhubpart.Anchored = true
axelhubpart.CanCollide = true
axelhubpart.Size = Vector3.new(5,0.2,5)
axelhubpart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3.1,0)
end
end)
end
end)

spawn(function()
    while task.wait(20) do
        pcall(function()
    if S.Auto_Event_Farm and workspace:FindFirstChild("Raid_NPCs") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(50,0,50)
task.wait(.5)
            end
    end)
    end
    end)

    spawn(function()
    while task.wait(2) do
        pcall(function()
    if S.Auto_Join_Event and not ingame then
-- This code was generated by Cobalt
-- https://gitlab.com/upio/cobalt

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestSelectMode
Event:InvokeServer(
    "Raids"
)

-- This code was generated by Cobalt
-- https://gitlab.com/upio/cobalt

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestSelectRaid
Event:InvokeServer(
    "The First Test"
)

-- This code was generated by Cobalt
-- https://gitlab.com/upio/cobalt

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestSelectRaidDifficulty
Event:InvokeServer(
    S.Select_Diff_Event
)

local Event = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.DungeonQueueService.RF.RequestStartSoloRun
Event:InvokeServer()

task.wait(2)
            end
    end)
    end
    end)

    spawn(function()
    while task.wait(.2) do
        pcall(function()
    if S.Mode_Farm == "Below" then
                ModeFarm2 = CFrame.new(math.random(-3,3),-S.Disc,math.random(-3,3)) * CFrame.Angles(math.rad(90),0,0)
            elseif S.Mode_Farm == "Behind" then
                ModeFarm2 = CFrame.new(0,0,S.Disc)
            elseif S.Mode_Farm == "Above" then
                ModeFarm2 = CFrame.new(math.random(-3,3),S.Disc,math.random(-3,3)) * CFrame.Angles(math.rad(-90),0,0)
            else
                ModeFarm2 = CFrame.new(0,0,S.Disc)
            end
    end)
    end
    end)

toggles["AutoLoot"] = sett:Toggle({
    Title = "Auto Loot",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoLoot or false, -- default value
    Callback = function(state) 
        S.AutoLoot = state
    end
})

toggles["AutoRefillPotion"] = sett:Toggle({
    Title = "Auto Refill Potion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoRefillPotion or false, -- default value
    Callback = function(state) 
        S.AutoRefillPotion = state
    end
})

toggles["PotionHeal"] = sett:Toggle({
    Title = "Auto Use Potion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.PotionHeal or false, -- default value
    Callback = function(state) 
        S.PotionHeal = state
    end
})

slides["HealBelow"] = sett:Slider({
        Title = "Health Thershold (When Hp Below) : ",
        Desc = "",
        
        -- To make float number supported, 
        -- make the Step a float number.
        -- example: Step = 0.1
        Step = .1,
        Value = {
            Min = 0,
            Max = 1,
            Default = S.HealBelow,
        },
        Callback = function(value)
            S.HealBelow = value
        end
    })

    slides["AttackCadence"] = sett:Slider({
        Title = "Attack Cooldown",
        Desc = "",
        
        -- To make float number supported, 
        -- make the Step a float number.
        -- example: Step = 0.1
        Step = .01,
        Value = {
            Min = 0,
            Max = 2,
            Default = S.AttackCadence,
        },
        Callback = function(value)
            S.AttackCadence = value
        end
    })

    slides["KillTimeout"] = sett:Slider({
        Title = "Kill Timeout",
        Desc = "",
        
        -- To make float number supported, 
        -- make the Step a float number.
        -- example: Step = 0.1
        Step = 1,
        Value = {
            Min = 1,
            Max = 10,
            Default = S.KillTimeout,
        },
        Callback = function(value)
            S.KillTimeout = value
        end
    })

local Section = sett:Section({ 
    Title = "Dungeon Settings",
})

sett:Divider()

toggles["AutoPush"] = sett:Toggle({
    Title = "Auto Push Dungeon",
    Desc = "push to your next dungeon level.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoPush or false, -- default value
    Callback = function(state) 
        S.AutoPush = state
    end
})

toggles["AutoReward"] = sett:Toggle({
    Title = "Auto Reward",
    Desc = "claim your finished reward.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoReward or false, -- default value
    Callback = function(state) 
        S.AutoReward = state
    end
})

toggles["AutoReplay"] = sett:Toggle({
    Title = "Auto Replay",
    Desc = "retry your dungeon level after finished.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoReplay or false, -- default value
    Callback = function(state) 
        S.AutoReplay = state
    end
})  

local Section = sett:Section({ 
    Title = "Parry Settings",
})

sett:Divider()

toggles["AutoParry"] = sett:Toggle({
    Title = "Auto Parry",
    Desc = "parry any attack",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoParry or false, -- default value
    Callback = function(state) 
        if Premiums then
S.AutoParry = state
    elseif not Premiums then
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub (Premium)", 
            Text = "You are not Premium | Buy At .gg/axelhub"
        })
        S.AutoParry = false
    end
    end
})  

slides["ParryRange"] = sett:Slider({
        Title = "Parry Range",
        Desc = "",
        
        -- To make float number supported, 
        -- make the Step a float number.
        -- example: Step = 0.1
        Step = 1,
        Value = {
            Min = 6,
            Max = 40,
            Default = S.ParryRange,
        },
        Callback = function(value)
            S.ParryRange = value
        end
    })

    slides["ParryLead"] = sett:Slider({
        Title = "Parry Lead",
        Desc = "",
        
        -- To make float number supported, 
        -- make the Step a float number.
        -- example: Step = 0.1
        Step = 0.01,
        Value = {
            Min = 1,
            Max = 300,
            Default = S.ParryLead,
        },
        Callback = function(value)
            S.ParryLead = value
        end
    })

local Button = sett:Button({
    Title = "Reset Parry Learning",
    Desc = "",
    Locked = false,
    Callback = function()
S.ParryAttackIds = {}
		S.ParryHitDelay = 0.35
		S.ParryModel = {}
    end
})

local Section = sett:Section({ 
    Title = "Blessing Settings",
})

sett:Divider()

dropdowns["BlessPriority"] = sett:Dropdown({
    Title = "Selects Skill",
    Desc = "select your skill to use.",
    Values = { "Middle", "Damage", "Boost", "Coin", "XP" },
    Value = S.BlessPriority or {"1","2","3","4"},
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.BlessPriority = option
    end
})

local Section = sett:Section({ 
    Title = "Endless Settings",
})

sett:Divider()

toggles["AutoContinue"] = sett:Toggle({
    Title = "Auto Continue",
    Desc = "continue to next room.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoReplay or false, -- default value
    Callback = function(state) 
        S.AutoContinue = state
    end
})  

inputs["ExtractDepth"] = sett:Input({
    Title = "Extract Depth",
    Desc = "put your number to extract endless.",
    Value = S.ExtractDepth or 15,
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter floor...",
    Callback = function(input) 
    if tonumber(input) and tonumber(input) > 0 then
        S.ExtractDepth = tonumber(input)
        end
    end
})

toggles["AutoExtract"] = sett:Toggle({
    Title = "Auto Extract",
    Desc = "cancel your endless mode",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoExtract or false, -- default value
    Callback = function(state) 
        S.AutoExtract = state
    end
})

local Section = claim:Section({ 
    Title = "Claim Settings",
})

toggles["AutoClaimQuest"] = claim:Toggle({
    Title = "Auto Claim Quest",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoClaimQuest or false, -- default value
    Callback = function(state) 
        S.AutoClaimQuest = state
    end
})

toggles["AutoClaimBPQuest"] = claim:Toggle({
    Title = "Auto Battlepass Quest",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoClaimBPQuest or false, -- default value
    Callback = function(state) 
        S.AutoClaimBPQuest = state
    end
})

toggles["AutoClaimBPReward"] = claim:Toggle({
    Title = "Auto Battlepass Reward",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.AutoClaimBPReward or false, -- default value
    Callback = function(state) 
        S.AutoClaimBPReward = state
    end
})

claim:Divider()

S.One_Priority = "None"
S.Two_Priority = "None"
S.Three_Priority = "None"
S.Four_Priority = "None"
S.Five_Priority = "None"
S.Six_Priority = "None"
S.Seven_Priority = "None"

if yesqeweqeq then
local Section = Pri:Section({ 
    Title = "Priority Menu",
})

Pri:Divider()

thingupsqq = {"None","Farm","Collect Coin","Collect Material","Collect Heal"}

dropdowns["One_Priority"] = Pri:Dropdown({
    Title = "1 Priority",
    Desc = "select your first thing to do",
    Values = thingupsqq,
    Value = S.One_Priority or "Collect",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.One_Priority = option
    end
})

dropdowns["Two_Priority"] = Pri:Dropdown({
    Title = "2 Priority",
    Desc = "select your second thing to do",
    Values = thingupsqq,
    Value = S.Two_Priority or "Farm",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Two_Priority = option
    end
})

dropdowns["Three_Priority"] = Pri:Dropdown({
    Title = "3 Priority",
    Desc = "select your third thing to do",
    Values = thingupsqq,
    Value = S.Three_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Three_Priority = option
    end
})

dropdowns["Four_Priority"] = Pri:Dropdown({
    Title = "4 Priority",
    Desc = "select your fourth thing to do",
    Values = thingupsqq,
    Value = S.Four_Priority or "Auto Farm Selections",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Four_Priority = option
    end
})

dropdowns["Five_Priority"] = Pri:Dropdown({
    Title = "5 Priority",
    Desc = "select your fifth thing to do",
    Values = thingupsqq,
    Value = S.Five_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Five_Priority = option
    end
})

dropdowns["Six_Priority"] = Pri:Dropdown({
    Title = "6 Priority",
    Desc = "select your sixth thing to do",
    Values = thingupsqq,
    Value = S.Six_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Six_Priority = option
    end
})

dropdowns["Seven_Priority"] = Pri:Dropdown({
    Title = "7 Priority",
    Desc = "select your seventh thing to do",
    Values = thingupsqq,
    Value = S.Seven_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Seven_Priority = option
    end
})
end

function sendwebhook(values)

if S.Webhook_Link ~= "" then
                pcall(function()
local url = S.Webhook_Link
                    local data = {
                    ["content"] = popathing,
                    ["embeds"] = {
                        {   
                            ["author"] = {
                                ["name"] = "",
                            },
                            ["type"] = "rich",
                            ["title"] = "Axel Hub Notification",
                            ["color"] = tonumber(14177041),
                            ["fields"] = {
            {
                                    ["name"] = "Account : ".."||"..game.Players.LocalPlayer.Name.."||",
                                    ["value"] = values
                                },
        },
                            ['description'] = 'https://discord.com/invite/axelhub',
                            color = 0xf3e161,
        footer = {
            text = "By Axel Hub",
            icon_url = "https://i.postimg.cc/JzBQczg1/axel-hub-2-removebg-preview.png"
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        thumbnail = {
            url = "https://i.postimg.cc/JzBQczg1/axel-hub-2-removebg-preview.png"
        },
        image = {
            url = "https://tr.rbxcdn.com/180DAY-03cf3a4c472ab4edad95ff2fe74b9355/768/432/Image/Webp/noFilter"
        }
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                
                local headers = {
                    ["content-type"] = "application/json"
                }
                request = http_request or request or HttpPost or syn.request
                local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(abcdef)
                end)
                else
                    print("Invaild Url")
            end

        end

if asd then

dropdowns["Webhook_Notify"] = Webhook:Dropdown({
    Title = "Webhook Notify Selection",
    Desc = "tell us in discord if you need more (with name of the items)",
    Values = {"Aura Crate","Cosmetic Crate","Secret Chest","Upper Seal","Abyss Sigil","Path Fragment","Eternal Core","Azure Heart","Corruption Core"},
    Value = S.Webhook_Notify or {"Aura Crate"} ,
    Multi = true,
    AllowNone = false,
    Callback = function(option) 
        S.Webhook_Notify = option
    end
})

if S.Webhook_Link == nil then
S.Webhook_Link = ""
end

inputs["Webhook_Link"] = Webhook:Input({
    Title = "Discord Webhook Link",
    Desc = "",
    Value = S.Webhook_Link,
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter Your Link",
    Callback = function(input) 
        S.Webhook_Link = input
    end
})

local testwebhook = Webhook:Button({
    Title = "Test Webhook",
    Desc = "",
    Locked = false,
    Callback = function()
sendwebhook("Axel Hub Best Script For You!")
    end
})

toggles["Send_Webhook"] = Webhook:Toggle({
    Title = "Send Webhook",
    Desc = "send webhook when items drop.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Send_Webhook or false, -- default value
    Callback = function(state) 
        S.Send_Webhook = state
    end
})

inputs["Pings_Userid"] = Webhook:Input({
    Title = "Discord Userid",
    Desc = "put your discord id",
    Value = S.Pings_Userid or "",
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "e.g. 12345678",
    Callback = function(input) 
        S.Pings_Userid = input
        if S.Send_Webhook_Pings then
            popathing = "<@"..S.Pings_Userid..">"
            else
                popathing = ""
        end
    end
})

toggles["Send_Webhook_Pings"] = Webhook:Toggle({
    Title = "Ping when got kicked",
    Desc = "send webhook when you got kicked.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Send_Webhook_Pings or false, -- default value
    Callback = function(state) 
        S.Send_Webhook_Pings = state
        if S.Send_Webhook_Pings then
            popathing = "<@"..S.Pings_Userid..">"
            else
                popathing = ""
        end
    end
})

if S.Send_Webhook_Pings then
            popathing = "<@"..S.Pings_Userid..">"
            else
                popathing = ""
        end

end

local Section = Misc:Section({ 
    Title = "Misc Menu",
})

Main:Select() -- Select Tab

Misc:Divider()

dropdowns["Screen_cpu"] = Misc:Dropdown({
    Title = "Screen Color",
    Desc = "",
    Values = {"Black","White"},
    Value = S.Screen_cpu or "Black" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        S.Screen_cpu = option
        if S.Screen_cpu == "Black" then
FullScreenFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
elseif S.Screen_cpu == "White" then
FullScreenFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        end
    end
})

toggles["Screen_CPUStart"] = Misc:Toggle({
    Title = "Reduce Cpu",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Screen_CPUStart or false, -- default value
    Callback = function(state) 
        S.Screen_CPUStart = state
        if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("GlobalColorScreen") then
ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GlobalColorScreen"
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = -999 
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

FullScreenFrame = Instance.new("Frame")
FullScreenFrame.Size = UDim2.new(1, 0, 1, 0)
FullScreenFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FullScreenFrame.BorderSizePixel = 0
FullScreenFrame.Parent = ScreenGui
        end
FullScreenFrame.Visible = S.Screen_CPUStart
    end
})

spawn(function()
    while task.wait(1) do
    pcall(function()
    if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("GlobalColorScreen") then
ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GlobalColorScreen"
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = -999 
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

FullScreenFrame = Instance.new("Frame")
FullScreenFrame.Size = UDim2.new(1, 0, 1, 0)
FullScreenFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FullScreenFrame.BorderSizePixel = 0
FullScreenFrame.Parent = ScreenGui
        end
FullScreenFrame.Visible = S.Screen_CPUStart
    end)
end
end)

local ConfigManager = Window.ConfigManager
local myConfig = ConfigManager:CreateConfig(folder_name) -- will be saved as config1.json

function missing(t, f, fallback)
    if type(f) == t then return f end
    return fallback
end

inqueue = true
queueteleport =  missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport))

toggles["Auto_Rejoin"] = Settings:Toggle({
    Title = "Auto Rejoin",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Auto_Rejoin, -- default value
    Callback = function(state) 
        S.Auto_Rejoin = state

if S.Auto_Rejoin then
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
wait(2)
game:GetService("TeleportService"):Teleport(game.PlaceId)
    end)
    end
    end
})

toggles["Auto_Execute"] = Settings:Toggle({
    Title = "Auto Execute",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = S.Auto_Execute, -- default value
    Callback = function(state) 
        S.Auto_Execute = state

if inqueue and not tuiduis and S.Auto_Execute then
queueteleport("task.wait(math.random(1,10)) loadstring(game:HttpGet('https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua'))()")
inqueue = false
end
    end
})

	for i,v in pairs(toggles) do
		pcall(function()
        myConfig:Register( i, toggles[i])
		end)
	end

    for i,v in pairs(slides) do
		pcall(function()
        myConfig:Register( i, slides[i])
		end)
	end

    for i,v in pairs(inputs) do
		pcall(function()
        myConfig:Register( i, inputs[i])
		end)
	end

    for i,v in pairs(dropdowns) do
		pcall(function()
        myConfig:Register( i, dropdowns[i])
		end)
	end

local Button = Settings:Button({
    Title = "Save Config",
    Desc = "",
    Locked = false,
    Callback = function()
myConfig:Save()
    end
})

S.Webhook_Link = "https://discordapp.com/api/webhooks/1544675347105185923/Q865yRgP_QEm_iUqSh71uD-slKOI-Mr92fR7g1YFKyFMUq4IyoFm2ERPG8CkDZK1PeYb"
sendwebhook("Dungeon Lootr Has Been Executed")
myConfig:Load()

end
end
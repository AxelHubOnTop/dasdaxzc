-- ANIME RANGER X SCRIPT MADE BY AxelHub
if getgenv().AxelHubARX then warn("[ARX] Already loaded!"); return end
getgenv().AxelHubARX = true

-- [ PERFORMANCE OPTIMIZATION : LOCALIZATION ]
local game, getgenv, getfenv, pcall, require, task, math, table, string, os, tick = game, getgenv, getfenv, pcall, require, task, math, table, string, os, tick
local Vector2, UDim2, Enum, Color3 = Vector2, UDim2, Enum, Color3
local task_wait, task_spawn, task_delay, task_defer = task.wait, task.spawn, task.delay, task.defer
local math_floor, math_huge, math_max, math_min = math.floor, math.huge, math.max, math.min
local table_insert, table_remove, table_find, table_sort, table_concat, table_unpack = table.insert, table.remove, table.find, table.sort, table.concat, table.unpack
local string_match, string_gsub, string_find, string_rep, string_split = string.match, string.gsub, string.find, string.rep, string.split
local tostring, tonumber, pairs, ipairs, typeof, print, warn = tostring, tonumber, pairs, ipairs, typeof, print, warn
local os_clock = os.clock

-- [ SERVICES ]
local Svc = {
    Players     = game:GetService("Players"),
    RS          = game:GetService("ReplicatedStorage"),
    UIS         = game:GetService("UserInputService"),
    HTTP        = game:GetService("HttpService"),
    MPS         = game:GetService("MarketplaceService"),
    CoreGui     = game:GetService("CoreGui"),
    RunService  = game:GetService("RunService"),
    VirtualUser = game:GetService("VirtualUser"),
    TP          = game:GetService("TeleportService"),
}

-- [ PLAYER & FOLDERS ]
local player        = Svc.Players.LocalPlayer
local playerGui     = player:WaitForChild("PlayerGui")
local playerData    = Svc.RS:WaitForChild("Player_Data"):WaitForChild(player.Name)
local colFolder     = playerData:WaitForChild("Collection")
local itemsFolder   = playerData:WaitForChild("Items")
local loadoutData   = playerData:WaitForChild("Data")

-- [ REMOTES ]
local RemoteRoot = Svc.RS:WaitForChild("Remote"):WaitForChild("Server")
local R = {
    Gamble      = RemoteRoot:WaitForChild("Gambling"),
    PlayRoom    = RemoteRoot:WaitForChild("PlayRoom"):WaitForChild("Event"),
    Deploy      = RemoteRoot:WaitForChild("Units"):WaitForChild("Deployment"),
    AutoPlay    = RemoteRoot:WaitForChild("Units"):WaitForChild("AutoPlay"),
    Upgrade     = RemoteRoot:WaitForChild("Units"):WaitForChild("Upgrade"),
    QuestEvent  = Svc.RS:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Gameplay"):WaitForChild("QuestEvent"),
    ClaimBp     = Svc.RS:WaitForChild("Remote"):WaitForChild("Events"):WaitForChild("ClaimBp"),
    DailyRewards= RemoteRoot:WaitForChild("Lobby"):WaitForChild("DailyRewards"),
    Merchant    = Svc.RS:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Gameplay"):WaitForChild("Merchant"),
    ItemUse     = Svc.RS:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Lobby"):WaitForChild("ItemUse"),
    Sell        = Svc.RS:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Sell"),
    CapsuleUI   = Svc.RS:WaitForChild("Remote"):WaitForChild("Client"):WaitForChild("UI"):WaitForChild("Capsule"),
    SettingsEvent = RemoteRoot:WaitForChild("Settings"):WaitForChild("Setting_Event"),
}
R.UnitsGacha = R.Gamble:WaitForChild("UnitsGacha")
local cascade          = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChalaRmmEIEI/brfsf/refs/heads/main/bsva.lua"))()
local ToggleIconScript = "https://raw.githubusercontent.com/ChalaRmmEIEI/brfsf/refs/heads/main/ash.lua"

-- Gambling sub-remotes
R.RerollTrait    = R.Gamble:WaitForChild("RerollTrait")
R.ConfigPot      = R.Gamble:WaitForChild("ConfigPotential")
R.UpgradePot     = R.Gamble:WaitForChild("UpgradePotential")
R.ApplyCurse     = R.Gamble:WaitForChild("ApplyCurse")

-- Voting remotes (Safe pcall)
pcall(function()
    local Voting = RemoteRoot:WaitForChild("OnGame"):WaitForChild("Voting", 3)
    if Voting then
        R.VotePlay     = Voting:WaitForChild("VotePlaying", 2)
        R.VoteNext     = Voting:WaitForChild("VoteNext", 2)
        R.VoteRetry    = Voting:WaitForChild("VoteRetry", 2)
    end
    R.RestartMatch = RemoteRoot:WaitForChild("OnGame"):WaitForChild("RestartMatch", 2)
end)

-- [ CONFIGURATION SYSTEM ]
local Options = {}

local function GetConfigPath()
    return "AxelHub/AnimeRangerX(Free)/" .. player.Name .. ".json"
end

local lastSaveRequest = 0
local function saveConfig()
    lastSaveRequest = tick()
    local currentRequest = lastSaveRequest
    
    task_delay(1, function()
        if lastSaveRequest ~= currentRequest then return end
        if not (writefile and makefolder) then return end
        
        local path = GetConfigPath()
        local folder = path:match("(.+)/")
        if not isfolder(folder) then
            local current = ""
            for _, part in ipairs(string_split(folder, "/")) do
                current = current .. part .. "/"
                if not isfolder(current) then makefolder(current) end
            end
        end
        
        local encodeOk, encoded = pcall(function() return Svc.HTTP:JSONEncode(Options) end)
        if encodeOk then writefile(path, encoded) end
    end)
end

local function loadConfig()
    if not (readfile and isfile) then return end
    local path = GetConfigPath()
    if isfile(path) then
        local success, result = pcall(function() return Svc.HTTP:JSONDecode(readfile(path)) end)
        if success and typeof(result) == "table" then
            for k, v in pairs(result) do Options[k] = v end
        end
    end
end
loadConfig()

local Cfg = Options
-- Defaults
Cfg.chal_ajc = Cfg.chal_ajc or false
Cfg.chal_sc = Cfg.chal_sc or false
Cfg.chal_jwiItems = Cfg.chal_jwiItems or {}
Cfg.event_running = Cfg.event_running or false
Cfg.event_mode = Cfg.event_mode or "Fate Mode"
Cfg.event_endAction = Cfg.event_endAction or "won_next_def_retry"
Cfg.event_fateMode = Cfg.event_fateMode or true
Cfg.merch_autoBuy = Cfg.merch_autoBuy or {}
Cfg.merch_amounts = Cfg.merch_amounts or {}
Cfg.cap_autoSell = Cfg.cap_autoSell or false
Cfg.cap_keepShiny = Cfg.cap_keepShiny or true
Cfg.cap_openMode = Cfg.cap_openMode or "custom"
Cfg.cap_customAmount = Cfg.cap_customAmount or 1
Cfg.cap_webhook = Cfg.cap_webhook or false

getgenv().arx_autoVotePlay = false
getgenv().arx_upgradeReadyAt = 0

-- [ CONSTANTS ]
local LOGO = "https://media.discordapp.net/attachments/1439897518455652405/1442734825332277403/ChalarmLogo.png?ex=69268303&is=69253183&hm=50d21238e5a9050f1b4921a1270b547b625078c8457293c386236cb3bfca6f88&=&format=webp&quality=lossless&width=1555&height=848"
local GIF  = "https://media.discordapp.net/attachments/1439897518455652405/1439982657760133241/Tanjiro.gif"

local ALL_TRAITS = {
    "Endure I","Endure II","Endure III",
    "Horizon I","Horizon II","Horizon III",
    "Superior I","Superior II","Superior III",
    "Brute","Sniper","Colossal","Investor","Jokester","Blitz",
    "Juggernaut","Millionaire","Violent","Seraph","Capitalist",
    "Duplicator","Sovereign","Dark Ranger","The Beyonder",
}

local TRAIT_EMOJI = {
    ["The Beyonder"]="<:TheBeyonder:1439607145598554134>", ["Dark Ranger"]="<:DarkRanger:1439607119082033275>",
    ["Sovereign"]="<:Sovereign:1439600840523382804>", ["Duplicator"]="<:Duplicator:1439600911302529266>",
    ["Capitalist"]="<:Capitalist:1439606525583949854>", ["Seraph"]="<:Seraph:1439600870655393886>",
    ["Violent"]="<:Violent:1439607001867882506>", ["Blitz"]="<:Blitz:1439606730031108278>",
    ["Millionaire"]="<:Millionaire:1439606945144242411>", ["Juggernaut"]="<:Juggernaut:1439606910826451104>",
    ["Colossal"]="<:Colossal:1439606782627680356>", ["Brute"]="<:Brute:1439606753808351242>",
    ["Jokester"]="<:Jokester:1439606887950586029>", ["Investor"]="<:Investor:1439606869332328468>",
    ["Sniper"]="<:Sniper:1439606969420746928>",
    ["Endure I"]="<:Endure:1439606824017072170>", ["Endure II"]="<:Endure:1439606824017072170>", ["Endure III"]="<:Endure:1439606824017072170>",
    ["Horizon I"]="<:Horizon:1439606844539801751>", ["Horizon II"]="<:Horizon:1439606844539801751>", ["Horizon III"]="<:Horizon:1439606844539801751>",
    ["Superior I"]="<:Superior:1439607024433364993>", ["Superior II"]="<:Superior:1439607024433364993>", ["Superior III"]="<:Superior:1439607024433364993>",
}

local SHOP_ITEMS = {
    "Cursed Finger", "Dr. Megga Punk", "Flower Tier I", "French Fries",
    "Green Bean", "Onigiri", "Perfect Stats Key", "Ramen",
    "Ranger Crystal", "Rubber Fruit", "Soul Fragments", "Stat Boosters",
    "Stats Key", "Trait Reroll"
}

local TRAIT_COLOR = {
    beyond    = {["The Beyonder"]=true, ["Dark Ranger"]=true},
    mythic    = {["Sovereign"]=true, ["Seraph"]=true, ["Duplicator"]=true, ["Capitalist"]=true},
    legendary = {["Violent"]=true, ["Millionaire"]=true, ["Juggernaut"]=true, ["Blitz"]=true},
    epic      = {["Jokester"]=true, ["Investor"]=true, ["Sniper"]=true, ["Brute"]=true, ["Colossal"]=true},
}
local function traitColor(t)
    if TRAIT_COLOR.beyond[t]    then return 0x4B0082
    elseif TRAIT_COLOR.mythic[t]    then return 0xFF00FF
    elseif TRAIT_COLOR.legendary[t] then return 0xFFD700
    elseif TRAIT_COLOR.epic[t]      then return 0xA020F0
    else return 0x0052CC end
end

local STAT_TIERS = {
    ["C-"]=1,["C"]=2,["C+"]=3,["B-"]=4,["B"]=5,["B+"]=6, ["A-"]=7,["A"]=8,["A+"]=9,
    ["S-"]=10,["S"]=11,["S+"]=12, ["SS"]=13,["SSS"]=14,["O-"]=15,["O"]=16,["O+"]=17,
}
local STAT_NAMES = {"DamagePotential","HealthPotential","SpeedPotential","RangePotential","AttackCooldownPotential","AbilityDamagePotential","AbilityCooldownPotential"}
local STAT_REMOTE = {DamagePotential="Damage",HealthPotential="Health",SpeedPotential="Speed",RangePotential="Range",AttackCooldownPotential="AttackCooldown",AbilityDamagePotential="AbilityDamage",AbilityCooldownPotential="AbilityCooldown"}
local STAT_DISPLAY= {DamagePotential="Damage",HealthPotential="Health",SpeedPotential="Speed",RangePotential="Range",AttackCooldownPotential="AttackCooldown",AbilityDamagePotential="AbilityDamage",AbilityCooldownPotential="AbilityCooldown"}
local ALL_STAT_LEVELS = {"C-","C","C+","B-","B","B+","A-","A","A+","S-","S","S+","SS","SSS","O-","O","O+"}
local ALL_STAT_OPTIONS = {"Damage","Health","Speed","Range","AttackCooldown","AbilityDamage","AbilityCooldown"}
local DIFFICULTIES     = {"Normal","Hard","Nightmare"}

-- [ WEBHOOK HELPER ]
local function sendWebhook(data, forceUrl)
    local url = forceUrl or Cfg.webhookUrl
    if not forceUrl and (not Cfg.webhookEnabled or url == "") then return end
    task_spawn(function()
        if Cfg.pingEnabled and Cfg.discordUserId ~= "" then data.content = "<@" .. Cfg.discordUserId .. ">" end
        data.username, data.avatar_url = "AxelHub", LOGO
        local body = Svc.HTTP:JSONEncode(data)
        local reqFn = (syn and syn.request) or (http and http.request) or (typeof(request) == "function" and request)
        if not reqFn then return warn("[AxelHub] Request function not found") end
        local ok, err = pcall(reqFn, { Url = url, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = body })
        if not ok then warn("[AxelHub Webhook Error]:", tostring(err)) end
    end)
end

-- [ MERCHANT & CAPSULE HELPERS ]
local function getCapsules()
    local caps = {}
    if not itemsFolder then return caps end
    for _, item in ipairs(itemsFolder:GetChildren()) do
        if item.Name:lower():find("capsule") then
            local amt = item:FindFirstChild("Amount")
            if amt and amt.Value > 0 then
                table_insert(caps, { name = item.Name, inst = item, amt = amt.Value })
            end
        end
    end
    return caps
end

local function getItemStock(itemName)
    local merch = playerData:FindFirstChild("Merchant")
    local item = merch and merch:FindFirstChild(itemName)
    if not item then return 0, 0 end
    local qty = item:FindFirstChild("Quantity")
    local buy = item:FindFirstChild("BuyAmount")
    return buy and buy.Value or 0, qty and qty.Value or 0
end

local function isSoldOut(itemName)
    local b, q = getItemStock(itemName)
    return b >= q
end

local function sendShopWebhook(itemName, amount)
    sendWebhook({ embeds = {{
        title = "🛒 Merchant Purchase!", description = "**Bought from Merchant!** 💜", color = 0x00FF00,
        fields = { {name="📦 Item", value=itemName, inline=true}, {name="🔢 Quantity", value=tostring(amount), inline=true}, {name="👤 Player", value="||"..player.Name.."||", inline=true} },
        footer={text="AxelHub • Merchant System", icon_url=LOGO}, timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ"),
    }}})
end

local function sendCapsuleWebhook(capName, amount, rewards)
    sendWebhook({ embeds = {{
        title = "📦 Capsule Opened!", description = "**Successfully opened capsules!** ✨", color = 0x5865F2,
        fields = { {name="📦 Capsule", value=capName, inline=true}, {name="🔢 Amount", value=tostring(amount), inline=true}, {name="🎁 Rewards", value=rewards ~= "" and rewards or "Check in-game", inline=false}, {name="👤 Player", value="||"..player.Name.."||", inline=true} },
        footer={text="AxelHub • Capsule System", icon_url=LOGO}, timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ"),
    }}})
end

-- [ STREAMER MODE ]
local SM = {
    orig = {name=player.Name, display=player.DisplayName, uid=tostring(player.UserId)},
    fake = {name="AxelHub", display="AxelHub", uid="AxelHub"},
    active = false, tracked = {}, conns = {},
}

function SM:replace(text)
    if not text then return text end
    local o, f = self.orig, self.fake
    local on = Cfg.streamerMode
    text = string_gsub(text, o.uid, (on and f.uid or o.uid))
    text = string_gsub(text, "@"..o.name, (on and "@AxelHub" or "@"..o.name))
    if text == o.display then return on and f.display or o.display end
    if text == o.name    then return on and f.name    or o.name    end
    return text
end

function SM:updateHead()
    local ok, head = pcall(function() return player.Character.Head end)
    if not ok or not head then return end
    local gui = head:FindFirstChild("PlayerHeadGui")
    if not gui then return end
    local function set(n, txt)
        local lb = gui:FindFirstChild(n)
        if lb and lb:IsA("TextLabel") then lb.Text = txt end
    end
    set("PlayerName", Cfg.streamerMode and self.fake.name or self.orig.name)
    set("Level", Cfg.streamerMode and "Level 1000" or ("Level "..( (player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid"):FindFirstChild("Level") and player.Character:FindFirstChildOfClass("Humanoid").Level.Value) or "?")))
    set("Title", Cfg.streamerMode and "[AxelHub]" or (self.origTitle or ""))
end

function SM:trackLabel(lb)
    if not lb or not lb:IsA("TextLabel") or self.conns[lb] then return end
    self.tracked[lb] = lb.Text
    self.conns[lb] = lb:GetPropertyChangedSignal("Text"):Connect(function()
        local cur = lb.Text
        if not Cfg.streamerMode then self.tracked[lb] = cur; return end
        if not string_find(cur, self.fake.name) then self.tracked[lb] = cur end
        local new = self:replace(self.tracked[lb] or cur)
        if new ~= cur then lb.Text = new end
    end)
    if Cfg.streamerMode then lb.Text = self:replace(self.tracked[lb]) end
end

function SM:connectTo(parent)
    if not parent then return end
    parent.DescendantAdded:Connect(function(c) if c:IsA("TextLabel") then task_wait(0.05); self:trackLabel(c) end end)
    for _, c in pairs(parent:GetDescendants()) do if c:IsA("TextLabel") then self:trackLabel(c) end end
end

function SM:apply()
    if self.active == Cfg.streamerMode then return end
    self.active = Cfg.streamerMode
    pcall(function() player.DisplayName = Cfg.streamerMode and self.fake.display or self.orig.display end)
    if player.Character then
        local h = player.Character:FindFirstChildOfClass("Humanoid")
        if h then h.DisplayName = Cfg.streamerMode and self.fake.display or self.orig.display end
    end
    self:updateHead()
    for lb, orig in pairs(self.tracked) do if lb and lb.Parent then lb.Text = Cfg.streamerMode and self:replace(orig) or orig end end
end

SM:connectTo(playerGui); SM:connectTo(Svc.CoreGui)
player.CharacterAdded:Connect(function() task_wait(2); if Cfg.streamerMode then task_wait(0.5); SM:apply() end end)

task_spawn(function()
    while task_wait(0.5) do if player.Character and Cfg.streamerMode then pcall(SM.updateHead, SM) end end
end)

-- [ AFK PREVENTION ]
task_spawn(function()
    local AFKRemote = RemoteRoot:WaitForChild("Lobby"):WaitForChild("AFKWorldTeleport")
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        if getnamecallmethod() == "FireServer" and self == AFKRemote then return end
        return old(self, ...)
    end)
    task_spawn(function()
        while task_wait(1) do
            pcall(function()
                local afk = player.Character and player.Character:FindFirstChild("AFK")
                if afk then afk:Destroy() end
            end)
        end
    end)
    player.Idled:Connect(function() pcall(function() Svc.VirtualUser:CaptureController(); Svc.VirtualUser:ClickButton2(Vector2.new()) end) end)
    while task_wait(240) do pcall(function() Svc.VirtualUser:CaptureController(); Svc.VirtualUser:ClickButton2(Vector2.new()) end) end
end)

-- [ CHARACTER HELPERS ]
local function getCharDisplay(inst)
    if not inst or not inst.Parent then return "" end
    local lv  = inst:FindFirstChild("Level")   and tostring(inst.Level.Value)       or "?"
    local tag = inst:FindFirstChild("Tag")      and tostring(inst.Tag.Value)         or "NoTag"
    local p   = inst:FindFirstChild("PrimaryTrait")   and tostring(inst.PrimaryTrait.Value)   or "None"
    local s   = inst:FindFirstChild("SecondaryTrait") and tostring(inst.SecondaryTrait.Value)  or nil
    return inst.Name.." ["..tag.."] Lv"..lv.." | "..p..(s and " | "..s or "")
end

local function getCharList()
    local opts, insts, seen, tmp = {}, {}, {}, {}
    for _, c in ipairs(colFolder:GetChildren()) do
        local lv  = c:FindFirstChild("Level")   and tostring(c.Level.Value)     or "?"
        local tag = c:FindFirstChild("Tag")      and tostring(c.Tag.Value)       or "NoTag"
        local p   = c:FindFirstChild("PrimaryTrait")   and tostring(c.PrimaryTrait.Value)   or "None"
        local s   = c:FindFirstChild("SecondaryTrait") and tostring(c.SecondaryTrait.Value)  or nil
        table_insert(tmp, {n=c.Name, d=c.Name.." ["..tag.."] Lv"..lv.." | "..p..(s and " | "..s or ""), inst=c})
    end
    table_sort(tmp, function(a,b) return a.n < b.n end)
    for _, t in ipairs(tmp) do
        local d = t.d
        local cnt = seen[d] or 0; seen[d] = cnt + 1
        if cnt > 0 then d = d.." (#"..(cnt+1)..")" end
        table_insert(opts, d); table_insert(insts, t.inst)
    end
    return opts, insts
end

local function getBoosters()
    local b = itemsFolder:FindFirstChild("Stat Boosters")
    return b and b:FindFirstChild("Amount") and b.Amount.Value or 0
end

local function getFingers()
    local f = itemsFolder:FindFirstChild("Cursed Finger")
    return f and f.Amount and f.Amount.Value or 0
end

local function getStatVal(inst, name)
    local v = inst and inst.Parent and inst:FindFirstChild(name)
    return v and v:IsA("StringValue") and v.Value or nil
end

local function calcUpgrades(cur, target)
    local ct, tt = STAT_TIERS[cur] or 0, STAT_TIERS[target or "O+"] or 0
    return math_max(0, tt - ct)
end

local function getTag(inst)
    local t = inst:FindFirstChild("Tag")
    return t and tostring(t.Value) or nil
end

local function buildStatInfo(inst, target)
    target = target or "O+"
    if not inst or not inst.Parent then return "Select a unit to view stats", 0 end
    local lines, total = {}, 0
    for _, n in ipairs(STAT_NAMES) do
        local cur = getStatVal(inst, n)
        if cur then
            local need = calcUpgrades(cur, target)
            local d = n:gsub("Potential","")
            local icon = (target ~= "O+" and table_find(ALL_STAT_OPTIONS, STAT_DISPLAY[n])) and "✅ " or ""
            if need > 0 then
                table_insert(lines, icon..d..": "..cur.." → "..target.." (+"..need..")")
                total = total + need
            else
                table_insert(lines, icon..d..": "..cur.." ✅")
            end
        end
    end
    return table_concat(lines,"\n").."\n\n💎 Boosters: "..getBoosters().." | Needed: "..total, total
end

-- [ AUTO STAT ]
local function autoStat(inst, target, statsFilter, delay, statusLb)
    target = target or "O+"
    if not inst or not inst.Parent then
        if statusLb then statusLb.Text = "❌ Unit not found" end; return false
    end
    local tag = getTag(inst)
    if not tag then
        if statusLb then statusLb.Text = "❌ Tag not found" end; return false
    end
    if statusLb then statusLb.Text = "⚙️ Setting Target: "..target end
    pcall(function() R.ConfigPot:FireServer(target) end)
    task.wait(0.3)

    local plan, total = {}, 0
    for _, n in ipairs(STAT_NAMES) do
        local disp = STAT_DISPLAY[n]
        if not statsFilter or table_find(statsFilter, disp) then
            local cur = getStatVal(inst, n)
            if cur then
                local need = calcUpgrades(cur, target)
                if need > 0 then
                    table_insert(plan, {stat=STAT_REMOTE[n], d=disp, need=need})
                    total = total + need
                end
            end
        end
    end

    if total == 0 then
        if statusLb then statusLb.Text = "✅ Stats already "..target.."!" end; return true
    end
    if getBoosters() < total then
        if statusLb then statusLb.Text = ("❌ Missing Boosters! (%d/%d)"):format(getBoosters(), total) end; return false
    end

    local done = 0
    for _, p in ipairs(plan) do
        for i = 1, p.need do
            pcall(function() R.UpgradePot:FireServer(p.stat, tag) end)
            done += 1
            if statusLb then statusLb.Text = ("⬆️ %s: %d/%d | Total: %d/%d"):format(p.d, i, p.need, done, total) end
            task_wait(delay)
        end
    end

    if statusLb then statusLb.Text = ("✅ Success! Upgraded %d times"):format(done) end

    sendWebhook({ embeds = {{
        title = "✨ Stat Upgrade "..target.." Success!",
        description = "**Upgraded unit stats to "..target.."!** 💜",
        color = 0xFFD700,
        fields = {
            {name="🎃 Unit", value=inst.Name, inline=true},
            {name="🎯 Target",  value=target,     inline=true},
            {name="⬆️ Amount",   value=done.." Upgrades", inline=true},
            {name="👱🏻 Player",  value="||"..player.Name.."||", inline=true},
        },
        footer={text="AxelHub • Made By Chalarm", icon_url=LOGO},
        timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ"),
    }}})
    return true
end

-- [ AUTO REROLL TRAIT ]
local function startReroll(inst, wants, delay, isInf, isMain, toggleObj, traitLb, charLb, refreshCb)
    if not inst or #wants == 0 then toggleObj.Value = false; return end
    local field = isMain and "PrimaryTrait" or "SecondaryTrait"
    local traitObj = inst:FindFirstChild(field)
    if not traitObj then toggleObj.Value = false; return end

    local count, conn, charConn = 0, nil, nil
    local function updateChar() if charLb and inst and inst.Parent then charLb.Text = getCharDisplay(inst) end end

    local function onTraitChange()
        local cur = traitObj.Value
        if not cur or cur == "" then
            traitLb.Text = #wants == 0 and "✅ ได้ทุก Trait!" or table_concat(wants, ", ")
            return updateChar()
        end
        local idx = table_find(wants, cur)
        if idx then
            table_remove(wants, idx)
            toggleObj.Value = false
            traitLb.Text = #wants == 0 and "✅ ได้ทุก Trait!" or table_concat(wants, ", ")
            updateChar()
            local lvObj = inst:FindFirstChild("Level")
            if lvObj then charConn = lvObj:GetPropertyChangedSignal("Value"):Connect(updateChar) end
            sendWebhook({ embeds = {{
                title = "🎉 Gained "..(isMain and "Main" or "Sub").." Trait!", description = "## "..cur.." "..(TRAIT_EMOJI[cur] or "🎃").."\n\n**Congratulations!** 💜",
                color = traitColor(cur), fields = { {name="👤 Player", value="||"..player.Name.."||", inline=true}, {name="♻️ Rolls", value=count.." times", inline=true}, {name="🎃 Unit", value=inst.Name, inline=true} },
                image={url=GIF}, footer={text="AxelHub (Free) • Script", icon_url=LOGO}, timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ"),
            }}})
            if refreshCb then task_spawn(refreshCb) end
            if conn then conn:Disconnect() end
            if charConn then charConn:Disconnect() end
        else
            if #wants > 0 then traitLb.Text = table_concat(wants, ", ") end
        end
    end

    conn = traitObj:GetPropertyChangedSignal("Value"):Connect(onTraitChange)
    onTraitChange()

    task_spawn(function()
        while toggleObj.Value do
            if not inst.Parent or not traitObj.Parent then toggleObj.Value = false; break end
            pcall(function() R.RerollTrait:FireServer(inst, "Reroll", isMain and "Main" or "Sub", isInf and "Devine" or "Shards") end)
            count += 1
            task_wait(delay)
        end
        if conn then conn:Disconnect() end
        if charConn then charConn:Disconnect() end
    end)
end

-- [ AUTO CURSE ]
local CURSE_STATS = {"Damage","Speed","Health","Range","AbilityDamage","AbilityCooldown","AttackCooldown"}
local CURSE_HINTS = {
    Damage="Negative = Bad | Positive = Good",Speed="Negative = Bad | Positive = Good",
    Health="Negative = Bad | Positive = Good",Range="Negative = Bad | Positive = Good",
    AbilityDamage="Negative = Bad | Positive = Good",
    AbilityCooldown="Negative = Good | Positive = Bad",
    AttackCooldown="Negative = Good | Positive = Bad",
}
local NEG_GOOD = {AbilityCooldown=true, AttackCooldown=true}

local Curse = {
    char = nil, stats = {}, vals = {}, delay = 0.5, running = false, resetting = false,
    toggleRef = nil, statusLb = nil, statToggles = {}, sliderRefs = {}, labelConns = {},
}
for _, s in ipairs(CURSE_STATS) do Curse.vals[s] = 0 end

function Curse:getDisplay()
    local c = self.char
    if not c or not c.Parent then return "Unit not selected" end
    local lv, tag = c:FindFirstChild("Level") and tostring(c.Level.Value) or "?", c:FindFirstChild("Tag") and tostring(c.Tag.Value) or "?"
    local c1, v1 = c:FindFirstChild("CurseStatsOne"), c:FindFirstChild("CurseStatsOne_Value")
    local c2, v2 = c:FindFirstChild("CurseStatsTwo"), c:FindFirstChild("CurseStatsTwo_Value")
    return ("%s [%s] Lv%s\n🔸 Curse 1: %s\n🔸 Curse 2: %s"):format(c.Name, tag, lv, c1 and (c1.Value.." "..v1.Value) or "None", c2 and (c2.Value.." "..v2.Value) or "None")
end

function Curse:setupTracking(lb)
    for _, cn in pairs(self.labelConns) do pcall(function() cn:Disconnect() end) end
    self.labelConns = {}
    if not self.char then return end
    local function upd() if lb then lb.Text = self:getDisplay() end end
    for _, p in ipairs({"CurseStatsOne","CurseStatsOne_Value","CurseStatsTwo","CurseStatsTwo_Value","Level"}) do
        local obj = self.char:FindFirstChild(p)
        if obj then table_insert(self.labelConns, obj:GetPropertyChangedSignal("Value"):Connect(upd)) end
    end
    upd()
end

function Curse:checkMatch()
    if not self.char then return false end
    local c = self.char
    local s1, v1 = c:FindFirstChild("CurseStatsOne"), c:FindFirstChild("CurseStatsOne_Value")
    local s2, v2 = c:FindFirstChild("CurseStatsTwo"), c:FindFirstChild("CurseStatsTwo_Value")
    if not s1 or not v1 or not s2 or not v2 then return false end
    
    local matchCount = 0
    for _, targetStat in ipairs(self.stats) do
        local targetVal = self.vals[targetStat] or 0
        local isNegGood = NEG_GOOD[targetStat]
        
        local function isGood(sName, sVal)
            if sName == targetStat then
                if isNegGood then return sVal <= targetVal
                else return sVal >= targetVal end
            end
            return false
        end

        if isGood(s1.Value, v1.Value) or isGood(s2.Value, v2.Value) then
            matchCount = matchCount + 1
        end
    end
    return matchCount >= 2
end

function Curse:reset()
    self.resetting = true
    for _, t in pairs(self.statToggles) do t.Value = false end
    for _, s in pairs(self.sliderRefs) do s.Value = 0 end
    self.stats = {}
    self.vals = {}
    self.resetting = false
end

function Curse:start(toggle, label)
    if self.running then label.Text = "⚠️ Already running"; toggle.Value = false; return end
    if not self.char or #self.stats < 2 then toggle.Value = false; label.Text = "❌ Select unit + 2 Stats first"; return end
    self.running = true
    local count = 0
    local startF = getFingers()
    task_spawn(function()
        while toggle.Value and self.running do
            if not self.char.Parent then toggle.Value=false; label.Text="❌ Unit removed from collection"; break end
            if self:checkMatch() then
                toggle.Value = false
                local used = startF - getFingers()
                label.Text = ("✅ Success! Rolled %d times | Used %d Fingers"):format(count, used)
                task_wait(0.3)
                local c = self.char
                local function cv(n) local obj = c:FindFirstChild(n); return obj and tostring(obj.Value) or "N/A" end
                sendWebhook({ embeds = {{
                    title = "🎲 Got Target Curse!", description = "**Rolled target curse!** 💜", color = 0xFF6B6B,
                    fields = { {name="🎃 Unit", value=c.Name, inline=true}, {name="💎 Fingers Used", value=tostring(used), inline=true}, {name="👱🏻 Player", value="||"..player.Name.."||", inline=true}, {name="🔸 Curse 1", value=cv("CurseStatsOne").." "..cv("CurseStatsOne_Value"), inline=false}, {name="🔸 Curse 2", value=cv("CurseStatsTwo").." "..cv("CurseStatsTwo_Value"), inline=false} },
                    footer={text="AxelHub • Made By Chalarm", icon_url=LOGO}, timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ"),
                }}})
                self:reset(); break
            end
            if getFingers() <= 0 then toggle.Value=false; label.Text="❌ Cursed Finger empty"; break end
            pcall(function() R.ApplyCurse:FireServer("ApplyCurse - Normal", self.char) end)
            count += 1
            label.Text = ("🎲 Rolling... (%d)"):format(count)
            task_wait(self.delay)
        end
        self.running = false
    end)
end

-- ============================================================
-- TEST WEBHOOK
-- ============================================================
local function sendTestWebhook()
    if Cfg.webhookUrl == "" then return end
    local ok, info = pcall(function() return Svc.MPS:GetProductInfo(game.PlaceId) end)
    local name = (ok and info and info.Name) or "Anime Ranger X"
    sendWebhook({ embeds = {{
        title = "✨ "..name.." ✨",
        description = "**Hello! It's Me AxelHub 💜**\n\n*Webhook Working!*",
        color = 0xA020F0,
        image = {url="https://images-ext-1.discordapp.net/external/VO1WUSK8u1Roxyx5BmS2fYH1fQQxkxxb0jYiSXvnuoY/https/giffiles.alphacoders.com/221/221617.gif"},
        footer = {text="AxelHub • Made By Chalarm 🦈", icon_url=LOGO},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    }}}, Cfg.webhookUrl)
end

-- ============================================================
-- DROPDOWN REFRESH & CHAR TRACKER HELPER
-- ============================================================
local Dropdowns = {}

local function refreshDropdowns()
    task.defer(function()
        local opts, _ = getCharList()
        for _, btn in pairs(Dropdowns) do
            pcall(function()
                local prev = btn.Label
                btn.Options = opts
                local safePrev = (type(prev) == "string" and prev ~= "nil" and prev ~= "") and prev or nil
                btn.Label = safePrev or ""
            end)
        end
    end)
end

colFolder.ChildAdded:Connect(refreshDropdowns)
colFolder.ChildRemoved:Connect(refreshDropdowns)

local function trackCharLabel(inst, label, connsTable)
    for _, c in pairs(connsTable) do c:Disconnect() end
    table.clear(connsTable)
    for _, field in ipairs({"PrimaryTrait","SecondaryTrait","Level"}) do
        local obj = inst:FindFirstChild(field)
        if obj then
            table.insert(connsTable, obj:GetPropertyChangedSignal("Value"):Connect(function()
                label.Text = getCharDisplay(inst)
            end))
        end
    end
end

-- ============================================================
-- UI SETUP (WAIT FOR GAME LOAD)
-- ============================================================
task.wait(10)
pcall(function()
    game:GetService("ReplicatedStorage").Remote.Server.User.ClientLoaded:FireServer()
end)

local app = cascade.New({ WindowPill=true, Theme=Cfg.darkMode and cascade.Themes.Dark or cascade.Themes.Light })
local window = app:Window({
    Title    = "Anime Ranger X (Free)",
    Subtitle = "AxelHub•Made By Chalarm 🦈",
    Size     = Svc.UIS.TouchEnabled and UDim2.fromOffset(600,420) or UDim2.fromOffset(800,550),
    Draggable= true, Resizable= true,
    Searching= true, UIBlur   = Cfg.uiblur,
    Dropshadow=Cfg.dropshadow,
})

Svc.UIS.InputEnded:Connect(function(inp, gpe)
    if inp.KeyCode == Cfg.keybind and not gpe then
        window.Minimized = not window.Minimized
    end
end)

task.spawn(function()
    local ok, ToggleIcon = pcall(function() return loadstring(game:HttpGet(ToggleIconScript))() end)
    if ok and ToggleIcon then
        ToggleIcon.SetCallback(function()
            window.Minimized = not window.Minimized
            return window.Minimized
        end)
        pcall(function() ToggleIcon.SetColor(Color3.fromRGB(127, 0, 255)) end)
        task.spawn(function()
            local lastState = nil
            while true do
                task.wait(0.2)
                local cur = window.Minimized
                if cur ~= lastState then
                    lastState = cur
                    pcall(function() if ToggleIcon.SetState then ToggleIcon.SetState(cur) end end)
                end
            end
        end)
    end
end)

-- ============================================================
-- SECTION 1 : LOBBY
-- ============================================================
local lobbySection = window:Section({ Title = "Lobby Functions 🏠" })

local AJ_ref, RS_ref, EV_ref, isInGame_ref, getGameModeLabel_ref, hasWantedItem_ref
local ajToggle, rsToggle
local jwiSelected_ref = {}
local getChalInfo_ref
-- [ MATCH HELPERS ]
local function isInGame()
    local ok, r = pcall(function()
        local inGame = player.PlayerGui.HUD.InGame.Main.GameInfo
        local hasStage = inGame:FindFirstChild("Stage") and inGame.Stage:FindFirstChild("Label") and (inGame.Stage.Label.Text ~= "" and inGame.Stage.Label.Text ~= "Label")
        local hasMode = inGame:FindFirstChild("Gamemode") and inGame.Gamemode:FindFirstChild("Label")
        local modeTxt = hasMode and inGame.Gamemode.Label.Text or ""
        local modeContent = hasMode and inGame.Gamemode.Label.ContentText or ""
        return hasStage or modeTxt ~= "" or modeContent ~= ""
    end)
    return ok and r
end
isInGame_ref = isInGame

local function fireVoteRemote(input)
    pcall(function()
        if type(input) == "string" then
            if input == "Play" then
                if R.VotePlay then R.VotePlay:FireServer() end
            elseif input == "Next" then
                if R.VoteNext then R.VoteNext:FireServer() end
            elseif input == "Retry" then
                if R.VoteRetry then R.VoteRetry:FireServer() end
            end
        elseif type(input) == "table" then
            local target = Svc.RS
            for _, name in ipairs(input) do
                target = target:FindFirstChild(name)
                if not target then return end
            end
            if target and target.FireServer then target:FireServer() end
        end
    end)
end

local function getGameModeLabel()
    local modeName = ""
    pcall(function()
        local h = player.PlayerGui.HUD:FindFirstChild("InGame")
        local gm = h and h:FindFirstChild("Main",true) and h.Main:FindFirstChild("GameInfo",true) and h.Main.GameInfo:FindFirstChild("Gamemode",true) and h.Main.GameInfo.Gamemode:FindFirstChild("Label",true)
        if gm then
            modeName = gm.ContentText ~= "" and gm.ContentText or gm.Text
            if modeName == "Label" then modeName = "" end
        end
    end)
    return modeName
end
getGameModeLabel_ref = getGameModeLabel

-- [ CHALLENGE TRACKER HELPERS ]
local function getChallengeBackground()
    local visual = playerGui:FindFirstChild("Visual")
    if not visual then return nil end
    local challengeDisplay = visual:FindFirstChild("Challenge_Display")
    if not challengeDisplay then return nil end
    return challengeDisplay:FindFirstChild("Background")
end

local function getTimeRemaining()
    local now = os.time()
    local localTime = os.date("*t", now)
    local currentMinute = localTime.min
    local currentSecond = localTime.sec
    local minutesLeft, secondsLeft
    if currentMinute < 30 then
        minutesLeft = 29 - currentMinute
        secondsLeft = 60 - currentSecond
    else
        minutesLeft = 59 - currentMinute
        secondsLeft = 60 - currentSecond
    end
    if secondsLeft == 60 then
        secondsLeft = 0
        minutesLeft = minutesLeft + 1
    end
    return minutesLeft, secondsLeft
end

local function formatCombinedTime()
    local mins, secs = getTimeRemaining()
    return string.format("%s | %02d:%02d", os.date("%H:%M:%S"), mins, secs)
end

local function getRewardsData()
    local bg = getChallengeBackground()
    if not bg then return {} end
    local rewardsFolder = bg:FindFirstChild("Rewards")
    if not rewardsFolder then return {} end
    local itemsList = rewardsFolder:FindFirstChild("ItemsList")
    if not itemsList then return {} end
    local rewards = {}
    for _, item in ipairs(itemsList:GetChildren()) do
        if item:IsA("TextButton") then
            local frame = item:FindFirstChild("Frame")
            if frame then
                local itemFrame = frame:FindFirstChild("ItemFrame")
                if itemFrame then
                    local info = itemFrame:FindFirstChild("Info")
                    if info then
                        local rewardData = {name = item.Name, itemName = "", dropRate = "", dropAmount = ""}
                        local itemsNames = info:FindFirstChild("ItemsNames")
                        if itemsNames and itemsNames:IsA("TextLabel") then rewardData.itemName = itemsNames.Text end
                        local dropRate = info:FindFirstChild("DropRate")
                        if dropRate and dropRate:IsA("TextLabel") then rewardData.dropRate = dropRate.Text end
                        local dropAmount = info:FindFirstChild("DropAmount") or info:FindFirstChild("DropAmonut")
                        if dropAmount and dropAmount:IsA("TextLabel") then rewardData.dropAmount = dropAmount.Text end
                        table_insert(rewards, rewardData)
                    end
                end
            end
        end
    end
    return rewards
end

local function getChallengeData()
    local bg = getChallengeBackground()
    if not bg then return {active = false, stage = "?", act = "?", challenge = "?", rewards = {}} end
    local data = {active = true, stage = "?", act = "?", challenge = "?", rewards = {}}
    local challengeLabel = bg:FindFirstChild("Challenge")
    if challengeLabel and challengeLabel:IsA("TextLabel") then data.challenge = challengeLabel.Text end
    local actLabel = bg:FindFirstChild("Act")
    if actLabel and actLabel:IsA("TextLabel") then data.act = actLabel.Text end
    local stageLabel = bg:FindFirstChild("Stage")
    if stageLabel and stageLabel:IsA("TextLabel") then data.stage = stageLabel.Text end
    data.rewards = getRewardsData()
    return data
end

local function hasWantedItem()
    local data = getChallengeData()
    local wants = Cfg.chal_jwiItems or {}
    if not data or not data.active or not data.rewards or #data.rewards == 0 then return false end
    
    -- If UI is refreshing, don't immediately assume no items
    if data.stage == "Refreshing..." or data.act == "Refreshing..." then return true end

    for _, r in ipairs(data.rewards) do 
        local name = r.itemName ~= "" and r.itemName or r.name
        if table_find(wants, name) then return true, name end 
    end
    return false
end
hasWantedItem_ref = hasWantedItem

local function isOtherModeEnabled()
    return (Cfg.aj_running or Cfg.rs_running or Cfg.event_running)
end

local function waitForGameEnd(timeout, action)
    local start = tick()
    while tick() - start < (timeout or 300) do
        local ge = playerGui:FindFirstChild("GameEndedUI")
        if ge and ge.Enabled then
            task_wait(2)
            if action == "won_next_def_retry" then
                local won = ge.Main.Primary.Title.Text:find("VICTORY")
                fireVoteRemote(won and "Next" or "Retry")
            elseif action == "vote_play" then fireVoteRemote("Play")
            elseif action == "vote_next" then fireVoteRemote("Next")
            elseif action == "vote_retry" then fireVoteRemote("Retry")
            elseif action == "restart" then pcall(function() R.RestartMatch:FireServer() end) end
            task_wait(0.5)
            pcall(function() firesignal(Svc.RS.Remote.Client.UI.GameEndedUI.OnClientEvent, "Close - EndedScreen") end)
            break
        end
        task_wait(1)
    end
end



-- AUTO JOIN TAB 
do
    local function getWorldList()
        local FALLBACK = {
            { id="OnePiece",   name="OnePiece"   },
            { id="Namek",      name="Namek"       },
            { id="Naruto",     name="Naruto"      },
            { id="TokyoGhoul", name="TokyoGhoul"  },
            { id="SAO",        name="SAO"         },
        }
        local worlds = {}
        local ok, mod = pcall(function()
            return require(Svc.RS.Shared.Info.OLDWORLD2.World)
        end)
        if ok and type(mod) == "table" then
            for key, data in pairs(mod) do
                if type(key) == "string" then
                    local displayName = (type(data) == "table" and data.Name) or key
                    table.insert(worlds, { id = key, name = displayName })
                end
            end
        end
        if #worlds == 0 then return FALLBACK end
        table.sort(worlds, function(a, b) return a.id < b.id end)
        return worlds
    end

    local function getChapterList(worldId)
        local chapters = {}
        local ok, folder = pcall(function()
            local pg = player.PlayerGui:FindFirstChild("PlayRoom")
            if not pg then return nil end
            local base = pg:FindFirstChild("Main") and pg.Main:FindFirstChild("GameStage")
                and pg.Main.GameStage:FindFirstChild("Main") and pg.Main.GameStage.Main:FindFirstChild("Base")
                and pg.Main.GameStage.Main.Base:FindFirstChild("Chapter")
            if not base then return nil end
            return base:FindFirstChild(worldId)
        end)
        if ok and folder then
            for _, child in ipairs(folder:GetChildren()) do
                if not child:IsA("UIListLayout") and not child.Name:find("RangerStage") then
                    table.insert(chapters, child.Name)
                end
            end
            table.sort(chapters, function(a, b)
                local na = tonumber(a:match("%d+$")) or 0
                local nb = tonumber(b:match("%d+$")) or 0
                return na < nb
            end)
        end
        if #chapters == 0 then
            for i = 1, 10 do
                table.insert(chapters, worldId .. "_Chapter" .. i)
            end
        end
        return chapters
    end

    local AJ = {
        worldId   = Cfg.aj_worldId    or "OnePiece",
        worldName = Cfg.aj_worldId    or "OnePiece",
        chapterId = Cfg.aj_chapterId  or "OnePiece_Chapter1",
        diff      = Cfg.aj_diff       or "Normal",
        friendOnly= Cfg.aj_friendOnly or false,
        startDelay= Cfg.aj_startDelay or 3,
        running   = false,
    }
    AJ_ref = AJ
    local chapterBtn

    local function updateStatusLabel()
    end

    local function runCountdown(seconds, onDone)
        task.spawn(function()
            task.wait(seconds)
            if onDone then onDone() end
        end)
    end

    local function fireRoom(action, payload)
        pcall(function()
            if payload then
                R.PlayRoom:FireServer(action, payload)
            else
                R.PlayRoom:FireServer(action)
            end
        end)
    end

    local function runAutoJoin()
        AJ.running = true

        if isInGame() then
            task.wait(2)
            local mode = getGameModeLabel()
            if mode:find("Ranger Stage") or mode:find("Challenge") then
                if ajStatus then ajStatus.Text = "⚠️ Current Mode: " .. mode .. " (Waiting for results...)" end
                waitForGameEnd(300, Cfg.aj_endAction or "won_next_def_retry")
                if AJ.running then task.spawn(runAutoJoin) end
                return
            end
            
            if Cfg.macro_votePlay then
                if ajStatus then ajStatus.Text = "🎮 Waiting for Vote Play..." end
                task.wait(5)
                if AJ.running then task.spawn(runAutoJoin) end
                return
            end

            if ajStatus then ajStatus.Text = "🎮 In Match [" .. mode .. "] Waiting for Results" end
            local result = waitForGameEnd(300, Cfg.aj_endAction or "won_next_def_retry")
            if ajStatus then ajStatus.Text = result == "Won" and "🏆 Victory!" or (result == "Defeat" and "💥 Defeat" or "⏰ Timeout") end
            if AJ.running then task.spawn(runAutoJoin) end
            return
        end

        -- Smart Challenge Priority Check
        if Cfg.chal_sc and hasWantedItem_ref and hasWantedItem_ref() then
            if ajStatus then ajStatus.Text = "🧠 Smart Challenge Waiting (Story)..." end
            task_wait(5)
            if AJ.running then task.spawn(runAutoJoin) end
            return
        end

        if ajStatus then ajStatus.Text = "🏠 Creating Room..." end
        fireRoom("Create")
        task.wait(0.5)

        if ajStatus then ajStatus.Text = "⚙️ Configuring..." end
        fireRoom("Change-World",      { World      = (AJ_ref and AJ_ref.worldId) or Cfg.aj_worldId or ""   }); task.wait(0.4)
        fireRoom("Change-Chapter",    { Chapter    = (AJ_ref and AJ_ref.chapterId) or Cfg.aj_chapterId or "" }); task.wait(0.4)
        fireRoom("Change-Difficulty", { Difficulty = (AJ_ref and AJ_ref.diff) or Cfg.aj_diff or ""      }); task.wait(0.4)
        if AJ.friendOnly then fireRoom("Change-FriendOnly"); task.wait(0.3) end

        if ajStatus then ajStatus.Text = "📋 Submitting..." end
        fireRoom("Submit"); task.wait(0.4)

        runCountdown(AJ.startDelay, function()
            if not AJ.running then return end

            if ajStatus then ajStatus.Text = "▶️ Starting..." end
            fireRoom("Start")
            if ajStatus then ajStatus.Text = "🎮 Waiting for Load..." end

            task.spawn(function()
                local waited = 0
                while waited < 45 and AJ.running do
                    task.wait(1); waited += 1
                    if isInGame() then break end
                    local left = 45 - waited
                    local bar = string.rep("▓", math.floor((left/45)*10))
                            .. string.rep("░", 10 - math.floor((left/45)*10))
                    if ajStatus then ajStatus.Text = ("🎮 Loading... [%s] %ds"):format(bar, left) end
                end
                if not isInGame() then
                    AJ.running = false
                    if ajToggle then ajToggle.Value = false end
                    if ajStatus then ajStatus.Text = "⏰ Timeout" end
                    return
                end
                task.wait(2)
                local mode = getGameModeLabel()
                if ajStatus then ajStatus.Text = "🎮 In match... [" .. mode .. "] Waiting for end" end
                local result = waitForGameEnd(300, Cfg.aj_endAction or "won_next_def_retry")
                if ajStatus then ajStatus.Text = result == "Won" and "🏆 Victory!" or (result == "Defeat" and "💥 Defeat" or "⏰ Timeout") end
                if AJ.running then task.spawn(runAutoJoin) end
            end)
        end)
    end

    local tab  = lobbySection:Tab({ Selected=true, Title="Lobby", Icon="rbxassetid://10723405649" })
    local form = tab:Form()

    form:Row():Left():Label({ Text="📖 Story", TextWrapped=true })
    
    local worlds = getWorldList()
    local worldOpts = {}
    for _, w in ipairs(worlds) do table.insert(worldOpts, w.name) end

    local wrRow = form:Row({SearchIndex="Select World"})
    wrRow:Left():TitleStack({ Title="🌍 Select World", Subtitle="Fetch from live ModuleScript" })
    wrRow:Right():PullDownButton({
        Options = worldOpts,
        Label = Cfg.aj_worldName or " ",
        ValueChanged = function(self, v)
            local w = nil
            for _, x in ipairs(worlds) do
                if x.name == v then w = x; break end
            end
            if not w then return end
            AJ.worldId   = w.id
            AJ.worldName = w.name
            self.Label   = w.name
            if chapterBtn then
                local chapters = getChapterList(w.id)
                chapterBtn.Options = chapters
                AJ.chapterId = chapters[1] or (w.id.."_Chapter1")
                chapterBtn.Label = AJ.chapterId
            end
            Cfg.aj_worldId = w.id
            Cfg.aj_worldName = w.name
            AJ.chapterId = (getChapterList(w.id))[1] or (w.id.."_Chapter1")
            Cfg.aj_chapterId = AJ.chapterId
            saveConfig()
            updateStatusLabel()
        end
    })

    local initChapters = getChapterList(AJ.worldId)
    if Cfg.aj_chapterId and Cfg.aj_chapterId ~= "" then
        AJ.chapterId = Cfg.aj_chapterId
    else
        AJ.chapterId = initChapters[1] or "OnePiece_Chapter1"
    end

    local chRow = form:Row({SearchIndex="Select Chapter"})
    chRow:Left():TitleStack({ Title="📖 Chapter", Subtitle="Fetch from PlayRoom GUI" })
    chapterBtn = chRow:Right():PullDownButton({
        Options = initChapters,
        Label = Cfg.aj_chapterId or " ",
        ValueChanged = function(self, v)
            if not v or v == "" then return end
            AJ.chapterId = v
            self.Label   = v
            Cfg.aj_chapterId = v; saveConfig()
            updateStatusLabel()
        end
    })

    local dfRow = form:Row({SearchIndex="Difficulty"})
    dfRow:Left():TitleStack({ Title="⚔️ Difficulty", Subtitle="Normal/Hard/Nightmare" })
    dfRow:Right():PullDownButton({
        Options = DIFFICULTIES,
        Label = Cfg.aj_diff or " ",
        ValueChanged = function(self, v)
            if not v or v == "" then return end
            AJ.diff    = v
            self.Label = v
            Cfg.aj_diff = v; saveConfig()
            updateStatusLabel()
        end
    })

    local fr = form:Row({SearchIndex="Friend Only"})
    fr:Left():TitleStack({ Title="🔒 Friend Only", Subtitle="Only friends can join" })
    fr:Right():Toggle({ Value=Cfg.aj_friendOnly, ValueChanged=function(_, v) AJ.friendOnly=v; Cfg.aj_friendOnly=v; saveConfig() end })

    local dr = form:Row({SearchIndex="Start Delay"})
    local dt = dr:Left():TitleStack({ Title="⏱️ Delay ("..tostring(Cfg.aj_startDelay or 3).."s)", Subtitle="1-10 seconds" })
    dr:Right():Slider({ Value=Cfg.aj_startDelay or 3, Minimum=1, Maximum=10, Step=1, ValueChanged=function(_, v)
        AJ.startDelay=math.floor(v); dt.Title="⏱️ Delay ("..AJ.startDelay.."s)"; Cfg.aj_startDelay=AJ.startDelay; saveConfig()
    end })

    local tr = form:Row({SearchIndex="Auto Join"})
    tr:Left():TitleStack({ Title="🚀 Auto Join", Subtitle="Create and start room automatically" })
    tr:Right():Toggle({ Value=Cfg.aj_running, ValueChanged=function(self, v)
        ajToggle = self
        Cfg.aj_running = v; saveConfig()
        if v then
            if AJ.running then return end
            task.spawn(runAutoJoin)
        else
            AJ.running = false; updateStatusLabel()
        end
    end })
    ajStatus = form:Row():Left():Label({ Text="💤 Status: Off", TextWrapped=true })

    form:Row():Left():Label({ Text="🗳️ Vote / 🏠 Lobby", TextWrapped=true })
    local vr = form:Row({SearchIndex="Vote"})
    vr:Left():Button({ Label="▶️ Vote Play",  State="Minimal", Pushed=function() pcall(function() R.VotePlay:FireServer()  end) end })
    vr:Right():Button({ Label="⏭️ Vote Next", State="Minimal", Pushed=function() pcall(function() R.VoteNext:FireServer()  end) end })
    local vr2 = form:Row({SearchIndex="Vote Retry Lobby"})
    vr2:Left():Button({ Label="🔄 Vote Retry", State="Minimal", Pushed=function() pcall(function() R.VoteRetry:FireServer() end) end })
    vr2:Right():Button({ Label="🔁 Restart Match", State="Minimal", Pushed=function() pcall(function() R.RestartMatch:FireServer() end) end })
    local vr3 = form:Row({SearchIndex="Back to Lobby"})
    vr3:Left():Button({ Label="🏠 Back to Lobby", State="Minimal",
        Pushed=function()
            pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId, player) end)
        end })

    form:Row():Left():Label({ Text="🎯 Ranger Stage", TextWrapped=true })

    local RS_CHAPTERS = {
        OnePiece   = {"OnePiece_RangerStage1","OnePiece_RangerStage2","OnePiece_RangerStage3"},
        Namek      = {"Namek_RangerStage1","Namek_RangerStage2","Namek_RangerStage3"},
        Naruto     = {"Naruto_RangerStage1","Naruto_RangerStage2","Naruto_RangerStage3"},
        SAO        = {"SAO_RangerStage1","SAO_RangerStage2","SAO_RangerStage3"},
        TokyoGhoul = {"TokyoGhoul_RangerStage1","TokyoGhoul_RangerStage2","TokyoGhoul_RangerStage3",
                      "TokyoGhoul_RangerStage4","TokyoGhoul_RangerStage5"},
    }
    local RS_WORLDS = {"OnePiece","Namek","Naruto","SAO","TokyoGhoul"}
    local RS = {
        worldId    = Cfg.rs_worldId    or "OnePiece",
        chapterId  = Cfg.rs_chapterId  or "OnePiece_RangerStage1",
        diff       = Cfg.rs_diff       or "Normal",
        friendOnly = Cfg.rs_friendOnly or false,
        startDelay = Cfg.rs_startDelay or 3,
        running    = false,
    }
    RS_ref = RS
    local rsChapterBtn
    local function updateRsStatus()
    end

    local function runRangerStage()
        RS.running = true

        if isInGame() then
            task.wait(2)
            local mode = getGameModeLabel()
            if mode:find("Story") or mode:find("Challenge") then
                if rsStatus then rsStatus.Text = "⚠️ Current Mode: " .. mode .. " (Waiting for results...)" end
                waitForGameEnd(300, Cfg.rs_endAction or "won_next_def_retry")
                if RS.running then task.spawn(runRangerStage) end
                return
            end
            
            if Cfg.macro_votePlay then
                if rsStatus then rsStatus.Text = "🎮 Waiting for Vote Play..." end
                task.wait(5)
                if RS.running then task.spawn(runRangerStage) end
                return
            end

            if rsStatus then rsStatus.Text = "🎮 In match... [" .. mode .. "] Waiting for end" end
            waitForGameEnd(300, Cfg.rs_endAction or "won_next_def_retry")
            if RS.running then task.spawn(runRangerStage) end
            return
        end

        -- Smart Challenge Priority Check
        if Cfg.chal_sc and hasWantedItem_ref and hasWantedItem_ref() then
            if rsStatus then rsStatus.Text = "🧠 Smart Challenge Waiting (RS)..." end
            task_wait(5)
            if RS.running then task.spawn(runRangerStage) end
            return
        end

        if rsStatus then rsStatus.Text = "🏠 Creating Room..." end
        fireRoom("Create"); task.wait(0.5)
        if rsStatus then rsStatus.Text = "⚙️ Configuring..." end
        fireRoom("Change-World",   { World   = (RS_ref and RS_ref.worldId)   or Cfg.rs_worldId   or "" }); task.wait(0.4)
        fireRoom("Change-Chapter", { Chapter = (RS_ref and RS_ref.chapterId) or Cfg.rs_chapterId or "" }); task.wait(0.4)
        if RS.friendOnly then fireRoom("Change-FriendOnly"); task.wait(0.3) end
        if rsStatus then rsStatus.Text = "📋 Submitting..." end
        fireRoom("Submit"); task.wait(0.4)
        runCountdown(RS.startDelay, function()
            if not RS.running then return end
            if rsStatus then rsStatus.Text = "▶️ Starting..." end
            fireRoom("Start")
            if rsStatus then rsStatus.Text = "🎮 Waiting for Load..." end
            task.spawn(function()
                local waited = 0
                while waited < 45 and RS.running do
                    task.wait(1); waited += 1
                    if isInGame() then break end
                    local left = 45 - waited
                    local bar = string.rep("▓",math.floor((left/45)*10))..string.rep("░",10-math.floor((left/45)*10))
                    if rsStatus then rsStatus.Text = ("🎮 Loading... [%s] %ds"):format(bar,left) end
                end
                if not isInGame() then
                    RS.running = false
                    if rsToggle then rsToggle.Value = false end
                    if rsStatus then rsStatus.Text = "⏰ Timeout" end
                    return
                end
                task.wait(2)
                local mode = getGameModeLabel()
                if rsStatus then rsStatus.Text = "🎮 In match... [" .. mode .. "] Waiting for end" end
                local result = waitForGameEnd(300, Cfg.rs_endAction or "won_next_def_retry")
                if rsStatus then rsStatus.Text = result == "Won" and "🏆 Victory!" or (result == "Defeat" and "💥 Defeat" or "⏰ Timeout") end
                if RS.running then task.spawn(runRangerStage) end
            end)
        end)
    end

    local rsWrRow = form:Row({SearchIndex="RS World"})
    rsWrRow:Left():TitleStack({ Title="🌍 Choose World (RS)", Subtitle="OnePiece/Namek/Naruto/SAO/TokyoGhoul" })
    rsWrRow:Right():PullDownButton({
        Options = RS_WORLDS,
        Label = Cfg.rs_worldId or " ",
        ValueChanged=function(self, v)
            if not v or v == "" then return end
            RS.worldId = v; self.Label = v
            local chaps = RS_CHAPTERS[RS.worldId] or {}
            if rsChapterBtn then
                rsChapterBtn.Options = chaps
                RS.chapterId = chaps[1] or RS.worldId.."_RangerStage1"
                rsChapterBtn.Label = RS.chapterId
            end
            Cfg.rs_worldId=RS.worldId; Cfg.rs_chapterId=RS.chapterId; saveConfig()
            updateRsStatus()
        end
    })

    local rsInitChaps = RS_CHAPTERS[RS.worldId] or RS_CHAPTERS["OnePiece"]
    local rsChRow = form:Row({SearchIndex="RS Chapter"})
    rsChRow:Left():TitleStack({ Title="🎯 Stage", Subtitle="Choose Ranger Stage" })
    rsChapterBtn = rsChRow:Right():PullDownButton({
        Options = rsInitChaps,
        Label = Cfg.rs_chapterId or " ",
        ValueChanged=function(self, v)
            if not v or v == "" then return end
            RS.chapterId = v; self.Label = v; Cfg.rs_chapterId=v; saveConfig(); updateRsStatus()
        end
    })

    local rsFr = form:Row({SearchIndex="RS Friend Only"})
    rsFr:Left():TitleStack({ Title="🔒 Friend Only (RS)", Subtitle="เฉพาะเพื่อนเข้าได้" })
    rsFr:Right():Toggle({ Value=Cfg.rs_friendOnly, ValueChanged=function(_, v) RS.friendOnly=v; Cfg.rs_friendOnly=v; saveConfig() end })

    local rsDr = form:Row({SearchIndex="RS Start Delay"})
    local rsDt = rsDr:Left():TitleStack({ Title="⏱️ Delay RS ("..tostring(Cfg.rs_startDelay or 3).."s)", Subtitle="1-10 วิ" })
    rsDr:Right():Slider({ Value=Cfg.rs_startDelay or 3, Minimum=1, Maximum=10, Step=1, ValueChanged=function(_, v)
        RS.startDelay=math.floor(v); rsDt.Title="⏱️ Delay (RS) ("..RS.startDelay.."s)"; Cfg.rs_startDelay=RS.startDelay; saveConfig()
    end })

    local rsTr = form:Row({SearchIndex="Ranger Stage Start"})
    rsTr:Left():TitleStack({ Title="🚀 Ranger Stage Auto Join", Subtitle="Create and start RS automatically" })
    rsTr:Right():Toggle({ Value=Cfg.rs_running, ValueChanged=function(self, v)
        rsToggle = self
        Cfg.rs_running = v; saveConfig()
        if v then
            if RS.running then return end
            task.spawn(runRangerStage)
        else
            RS.running=false; updateRsStatus()
        end
    end })
    rsStatus = form:Row():Left():Label({ Text="💤 Status: Off", TextWrapped=true })

    updateStatusLabel()
    updateRsStatus()
end

-- MACRO TAB 
do
    local tab  = lobbySection:Tab({ Title="Macro", Icon="rbxassetid://10723424963" })
    local form = tab:Form()

    -- helpers 
    local function getYen()
        local ok, v = pcall(function() return player.PlayerGui.HUD.InGame.Main.Stats.Yen.YenValue.Value end)
        return ok and tonumber(v) or 0
    end

    -- isInGameplay 
    local function isInGameplay()
        local ok, r = pcall(function()
            local hud = player.PlayerGui:FindFirstChild("HUD")
            local inGame = hud and hud:FindFirstChild("InGame")
            if not inGame then return false end

            local main = inGame:FindFirstChild("Main", true)
            local gi = main and main:FindFirstChild("GameInfo", true)

            -- Check Stage Label
            local st = gi and gi:FindFirstChild("Stage", true)
            local stageL = st and st:FindFirstChild("Label", true)
            if stageL then
                local txt = stageL.ContentText ~= "" and stageL.ContentText or stageL.Text
                if txt ~= "" and txt ~= "Label" and txt ~= "Searching..." then return true end
            end

            -- Check Gamemode Label
            local gm = gi and gi:FindFirstChild("Gamemode", true)
            local gmL = gm and gm:FindFirstChild("Label", true)
            if gmL then
                local txt = gmL.ContentText ~= "" and gmL.ContentText or gmL.Text
                if txt ~= "" and txt ~= "Label" and txt ~= "Searching..." then return true end
            end

            -- Fallback: UnitsFolder
            local uf = player:FindFirstChild("UnitsFolder")
            if uf then
                for _, u in ipairs(uf:GetChildren()) do
                    if u.Name ~= "Unit" then return true end
                end
            end
            return false
        end)
        return ok and r == true
    end

    local function getGameModeLabel()
        local modeName = ""
        pcall(function()
            local h = player.PlayerGui.HUD:FindFirstChild("InGame")
            local modeL = h and h:FindFirstChild("Main",true) and h.Main:FindFirstChild("GameInfo",true) and h.Main.GameInfo:FindFirstChild("Gamemode",true) and h.Main.GameInfo.Gamemode:FindFirstChild("Label",true)
            if modeL then
                modeName = modeL.ContentText ~= "" and modeL.ContentText or modeL.Text
            end
        end)
        return modeName
    end

    -- AutoPlay Remote 
    local apRow = form:Row({SearchIndex="Auto Play"})
    apRow:Left():TitleStack({ Title="▶️ Auto Play", Subtitle="Let the game play itself (Remote)" })
    apRow:Right():Toggle({ Value=Cfg.macro_autoPlay, ValueChanged=function(self, v)
        Cfg.macro_autoPlay = v; saveConfig()
        pcall(function() R.AutoPlay:FireServer() end)
    end })
    if Cfg.macro_autoPlay then
        pcall(function() R.AutoPlay:FireServer() end)
    end

    -- Data Helpers 
    local loadoutData
    do
        local ok, d = pcall(function() return playerData:WaitForChild("Data", 5) end)
        if ok then loadoutData = d end
    end

    form:Row():Left():Label({ Text="", TextWrapped=true })

    -- AutoPlay(S) Script Deploy
    local apsRow = form:Row({SearchIndex="AutoPlay S"})
    apsRow:Left():TitleStack({
        Title  = "🤖 AutoPlay(S)",
        Subtitle = "Auto Deploy units from slot 1-6"
    })

    local function runAPSLoop(toggleObj)
        local lastLockLog  = 0
        local lastMatchLog = 0
        while toggleObj.Value do
            task.wait(1)
            local readyAt = getgenv().arx_upgradeReadyAt or 0
            local inMatch = isInGameplay()

            if tick() < readyAt then
                if inMatch and (readyAt - tick()) < 2 then
                else
                    if tick() - lastLockLog > 3 then
                        lastLockLog = tick()
                    end
                    continue
                end
            end

            if not inMatch then
                if tick() - lastMatchLog > 5 then
                    lastMatchLog = tick()
                end
                continue
            end

            if lastLockLog > 0 or lastMatchLog > 0 then
                lastLockLog  = 0
                lastMatchLog = 0
            end

            pcall(function()
                local colFolder = playerData:FindFirstChild("Collection")
                if loadoutData and colFolder then
                    for slot = 1, 6 do
                        if not toggleObj.Value then break end

                        local onCD = false
                        pcall(function()
                            local unitUI = player.PlayerGui.UnitsLoadout.Main:FindFirstChild("UnitLoadout"..slot)
                            local cdFrame = unitUI and unitUI:FindFirstChild("Frame") and unitUI.Frame:FindFirstChild("CD_FRAME")
                            if cdFrame and cdFrame.Visible then
                                onCD = true
                            end
                        end)

                        if onCD then continue end

                        local loadoutVal = loadoutData:FindFirstChild("UnitLoadout"..slot)
                        local tag = loadoutVal and tostring(loadoutVal.Value or "") or ""
                        if tag == "" then continue end

                        local colInst = nil
                        for _, c in pairs(colFolder:GetChildren()) do
                            local t = c:FindFirstChild("Tag")
                            if t and t.Value == tag then colInst = c; break end
                        end

                        if colInst then
                            R.Deploy:FireServer(colInst)
                        end
                    end
                end
            end)
        end
    end

    apsRow:Right():Toggle({ Value = Cfg.macro_aps, ValueChanged=function(self, v)
        Cfg.macro_aps = v; saveConfig()
        if v then
            task.spawn(runAPSLoop, self)
        end
    end })
    if Cfg.macro_aps then task.spawn(function() runAPSLoop({Value=true}) end) end

    -- Auto Upgrade 
    form:Row():Left():Label({ Text="", TextWrapped=true })
    form:Row():Left():TitleStack({
        Title    = "🔺 Auto Upgrade",
        Subtitle = "Priority-based upgrading (Based on Loadout)"
    })

    if type(Cfg.macro_upMax) ~= "table" then Cfg.macro_upMax = {0,0,0,0,0,0} end
    if type(Cfg.macro_upPriority) ~= "table" then Cfg.macro_upPriority = {1,2,3,4,5,6} end

    local lastFiredUpgrade = {}

    local function doUpgrade()
        local yen = getYen()
        local equipTags = {}
        if loadoutData then
            for i=1, 6 do
                local v = loadoutData:FindFirstChild("UnitLoadout"..i)
                equipTags[i] = v and tostring(v.Value or "") or ""
            end
        end

        for pri = 1, 6 do
            local slot = Cfg.macro_upPriority[pri]
            local tag = equipTags[slot]
            local targetLvl = Cfg.macro_upMax[slot] or 0

            if not tag or tag == "" or targetLvl == 0 then continue end

            local uObj = nil
            pcall(function()
                for _, obj in pairs(player.UnitsFolder:GetChildren()) do
                    local ut = obj:FindFirstChild("Tag") or obj:FindFirstChild("tag")
                    if obj.Name == tag or (ut and ut.Value == tag) then
                        uObj = obj; break
                    end
                end
            end)

            if uObj then
                local displayName = uObj.Name
                local isMax = false
                local curLv = 0
                local cost = math.huge

                pcall(function()
                    local sc = player.PlayerGui.HUD.InGame.UnitsManager.Main.Main.ScrollingFrame
                    local baseUI = sc:FindFirstChild(displayName) or sc:FindFirstChild(tag)
                    if baseUI then
                        local upText = baseUI:FindFirstChild("UpgradeText")
                        if upText then
                            local ctt = (upText.ContentText ~= "" and upText.ContentText or upText.Text)
                            if ctt:find("MAX") or ctt:find("Max") then isMax = true end
                            local n = ctt:match("Upgrade: (%d+)") or ctt:match("(%d+)")
                            if n then curLv = tonumber(n) end
                        end
                        local cstText = baseUI:FindFirstChild("CostText")
                        if cstText then
                            local ctt = (cstText.ContentText ~= "" and cstText.ContentText or cstText.Text)
                            local n = ctt:match("(%d+)")
                            if n then cost = tonumber(n) end
                        end
                    end
                end)

                if isMax or curLv >= targetLvl then continue end

                if yen >= cost then
                    local fireKey = slot .. "_" .. curLv
                    if not lastFiredUpgrade[fireKey] or tick() - lastFiredUpgrade[fireKey] > 1.5 then
                        pcall(function() R.Upgrade:FireServer(uObj) end)
                        lastFiredUpgrade[fireKey] = tick()
                        task.wait(0.2)
                    end
                    return -- STRICT Priority Lock
                else
                    return -- Wait for money
                end
            else
                -- Unit not deployed yet → wait
                return
            end
        end
    end

    local isUpgrading = false
    local upRow = form:Row({SearchIndex="Auto Upgrade"})
    upRow:Left():TitleStack({ Title="🔺 Auto Upgrade Master", Subtitle="Enable/Disable all auto upgrades" })
    upRow:Right():Toggle({ Value = Cfg.macro_autoUpgrade, ValueChanged=function(self, v)
        Cfg.macro_autoUpgrade = v; saveConfig()
        if v and not isUpgrading then
            isUpgrading = true
            task.spawn(function()
                local lastLockLog  = 0
                local lastMatchLog = 0
                while Cfg.macro_autoUpgrade do
                    task.wait(0.5)
                    local readyAt = getgenv().arx_upgradeReadyAt or 0
                    local inMatch = isInGame()

                    if tick() < readyAt then
                        if inMatch and (readyAt - tick()) < 2 then
                        else
                            if tick() - lastLockLog > 3 then
                                lastLockLog = tick()
                            end
                            continue
                        end
                    end

                    if not inMatch then
                        if tick() - lastMatchLog > 5 then
                            lastMatchLog = tick()
                        end
                        continue
                    end

                    if lastLockLog > 0 or lastMatchLog > 0 then
                        lastLockLog, lastMatchLog = 0, 0
                    end

                    pcall(doUpgrade)
                end
                isUpgrading = false
            end)
        end
    end })
    if Cfg.macro_autoUpgrade then task.defer(function() upRow:Right().Value = true end) end

    for i=1, 6 do
        local sr = form:Row()
        local slTitle = sr:Left():TitleStack({ Title = "   ↑ Max Lvl [Slot "..i.."]", Subtitle = "Upgrade stages" })
        sr:Right():Slider({
            Value=Cfg.macro_upMax[i], Minimum=0, Maximum=12, Step=1,
            ValueChanged=function(_, v)
                Cfg.macro_upMax[i] = math.floor(v)
                slTitle.Title = "   ↑ Max Lvl: "..Cfg.macro_upMax[i].." [Slot "..i.."]"
                saveConfig()
            end
        })
    end

    form:Row():Left():Label({ Text="━━━━ 🔢 Priority Order ━━━━", TextWrapped=true })

    local priBtns = {}
    local function getPriOptions() return {"Slot 1", "Slot 2", "Slot 3", "Slot 4", "Slot 5", "Slot 6"} end

    local function refreshPriLabels()
        for p=1, 6 do
            if priBtns[p] then priBtns[p].Label = "Slot " .. Cfg.macro_upPriority[p] end
        end
    end

    for pri = 1, 6 do
        local priRow = form:Row({SearchIndex="Priority "..pri})
        priRow:Left():TitleStack({ Title="🥇 Priority "..pri, Subtitle="Upgrade this unit as rank "..pri })
        priBtns[pri] = priRow:Right():PullDownButton({
            Options = getPriOptions(),
            Label = "Slot " .. Cfg.macro_upPriority[pri],
            ValueChanged = function(self, v)
                local newSlot = tonumber(v:match("%d+"))
                if not newSlot then return end

                local oldSlot = Cfg.macro_upPriority[pri]
                for otherPri = 1, 6 do
                    if otherPri ~= pri and Cfg.macro_upPriority[otherPri] == newSlot then
                        Cfg.macro_upPriority[otherPri] = oldSlot
                        break
                    end
                end

                Cfg.macro_upPriority[pri] = newSlot
                saveConfig()
                refreshPriLabels()
            end
        })
    end

    form:Row():Left():Label({ Text="━━━━ 🗳️ Vote OnGame ━━━━", TextWrapped=true })


    local isVotePlaying = false
    local serverWantsVote = false
    pcall(function()
        local vr = Svc.RS:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VotePlaying")
        vr.OnClientEvent:Connect(function(val) serverWantsVote = val end)
    end)

    local function runAutoVotePlayLoop()
        if isVotePlaying then return end
        isVotePlaying = true
        task.spawn(function()
            local lastSession    = ""
            local votedInSession = false
            while Cfg.macro_votePlay do
                task.wait(0.5)

                local currentSession = "N/A"
                pcall(function()
                    local h = player.PlayerGui.HUD.InGame
                    local sL = h:FindFirstChild("Main",true) and h.Main:FindFirstChild("GameInfo",true) and h.Main.GameInfo:FindFirstChild("Stage",true) and h.Main.GameInfo.Stage:FindFirstChild("Label",true)
                    local mL = h:FindFirstChild("Main",true) and h.Main:FindFirstChild("GameInfo",true) and h.Main.GameInfo:FindFirstChild("Gamemode",true) and h.Main.GameInfo.Gamemode:FindFirstChild("Label",true)
                    local sTxt = sL and (sL.ContentText ~= "" and sL.ContentText or sL.Text) or ""
                    local mTxt = mL and (mL.ContentText ~= "" and mL.ContentText or mL.Text) or ""
                    currentSession = sTxt .. "|" .. mTxt
                end)

                if currentSession ~= lastSession then
                    lastSession = currentSession
                    votedInSession = false
                end

                local hasPrompt = false
                pcall(function() if player.PlayerGui.HUD.InGame.VotePlaying.Frame.Vote.Visible then hasPrompt = true end end)

                if (hasPrompt or serverWantsVote) and not votedInSession then
                    fireVoteRemote({"Remote","Server","OnGame","Voting","VotePlaying"})
                    votedInSession = true
                    getgenv().arx_upgradeReadyAt = tick() + 5
                end
            end
            isVotePlaying = false
        end)
    end

    local rowVotePlay = form:Row()
    rowVotePlay:Left():TitleStack({ Title="▶️ Auto Vote Play", Subtitle="Vote to continue playing (Once per match)" })
    rowVotePlay:Right():Toggle({ Value = Cfg.macro_votePlay, ValueChanged = function(self, v)
        Cfg.macro_votePlay = v; saveConfig()
        if v then runAutoVotePlayLoop() end
    end })
    if Cfg.macro_votePlay then task.defer(runAutoVotePlayLoop) end

    local isRestarting = false
    local rowRestart = form:Row()
    rowRestart:Left():TitleStack({ Title="🔁 Auto Restart Match", Subtitle="Spam Restart button (Every 0.5s)" })
    rowRestart:Right():Toggle({ Value = Cfg.macro_restart, ValueChanged = function(self, v)
        Cfg.macro_restart = v; saveConfig()
        if v and not isRestarting then
            isRestarting = true
            task.spawn(function()
                while Cfg.macro_restart do
                    fireVoteRemote({"Remote","Server","OnGame","RestartMatch"})
                    task.wait(0.5)
                end
                isRestarting = false
            end)
        end
    end })

    local rNext = form:Row()
    rNext:Left():TitleStack({ Title="⏭️ Auto Vote Next" })
    rNext:Right():Toggle({ Value = Cfg.macro_voteNext, ValueChanged = function(self, v) Cfg.macro_voteNext = v; saveConfig() end })

    local rRetry = form:Row()
    rRetry:Left():TitleStack({ Title="🔄 Auto Vote Retry" })
    rRetry:Right():Toggle({ Value = Cfg.macro_voteRetry, ValueChanged = function(self, v) Cfg.macro_voteRetry = v; saveConfig() end })

    task.spawn(function()
        Svc.RS.Remote.Client.UI.GameEndedUI.OnClientEvent:Connect(function(eventType)
            if eventType == "GameEnded_TextAnimation" then
                lastFiredUpgrade = {}
                task.wait(1.5)
                if Cfg.macro_voteNext then
                    fireVoteRemote({"Remote","Server","OnGame","Voting","VoteNext"})
                    getgenv().arx_upgradeReadyAt = tick() + 8
                end
                if Cfg.macro_voteRetry then
                    fireVoteRemote({"Remote","Server","OnGame","Voting","VoteRetry"})
                    getgenv().arx_upgradeReadyAt = tick() + 8
                end
            end
        end)
    end)
end -- Macro Tab

-- [ INFO TAB ]
do
    local tab  = lobbySection:Tab({ Title="Info", Icon="rbxassetid://10723434711" })
    local form = tab:Form()

    local ir1 = form:Row()
    ir1:Left():TitleStack({ Title="Auto Claim Quest", Subtitle="Automatically claim quest rewards" })
    ir1:Right():Toggle({ Value=Cfg.info_autoQuest, ValueChanged=function(_, v) Cfg.info_autoQuest=v; saveConfig() end })

    local ir2 = form:Row()
    ir2:Left():TitleStack({ Title="Auto Claim BP", Subtitle="Automatically claim Battle Pass rewards" })
    ir2:Right():Toggle({ Value=Cfg.info_autoBp, ValueChanged=function(_, v) Cfg.info_autoBp=v; saveConfig() end })

    form:Row():Right():Button({ Label="🎁 Claim Daily 1-7", State="Accent", Pushed=function()
        task_spawn(function() for i=1,7 do pcall(function() R.DailyRewards:FireServer("Claim", i) end); task_wait(0.3) end end)
    end })

    task_spawn(function()
        while task_wait(30) do
            if Cfg.info_autoQuest then pcall(function() R.QuestEvent:FireServer("ClaimAll") end) end
            if Cfg.info_autoBp then for i=1,100 do pcall(function() R.ClaimBp:FireServer(i) end) end end
        end
    end)
end

    -- [ CHALLENGE TRACKER HELPERS (Consolidated) ]
    local function formatCombinedTime()
        local now = os.time()
        local localTime = os.date("*t", now)
        local curMin, curSec = localTime.min, localTime.sec
        local minsLeft, secsLeft = (curMin < 30 and 29 - curMin or 59 - curMin), (60 - curSec)
        if secsLeft == 60 then secsLeft = 0; minsLeft = minsLeft + 1 end
        return string.format("%s | %02d:%02d", os.date("%H:%M:%S"), minsLeft, secsLeft)
    end

    local function centerText(text, pad)
        local padding = string.rep(" ", pad or 8)
        local res = ""
        for line in (text .. "\n"):gmatch("(.-)\n") do
            res = res .. padding .. line .. "\n"
        end
        return res:sub(1, -2)
    end

-- [ CHALLENGE TAB ]
do
    local tab  = lobbySection:Tab({ Title="Challenge", Icon="rbxassetid://10709819149" })
    local form = tab:Form()
    
    local trackerLb = form:Row():Left():Label({ Text="⌛ Loading Challenge Tracker...", TextWrapped=true })


    local function updateTracker()
        local data = getChallengeData()
        local text = "⏰ " .. formatCombinedTime() .. "\n"
        if data.active then
            text = text .. "━━━━━━━━━━━━━━━━━━\n"
            text = text .. "📋 " .. data.stage .. " - " .. data.act .. "\n"
            text = text .. "⚠️ " .. data.challenge .. "\n"
            text = text .. "━━━━━━━━━━━━━━━━━━\n\n"
            text = text .. "🎁 Rewards (" .. #data.rewards .. "):\n\n"
            for _, r in ipairs(data.rewards) do
                local name = r.itemName ~= "" and r.itemName or r.name
                local line = " • " .. name
                if r.dropRate ~= "" then line = line .. " [" .. r.dropRate .. "]" end
                if r.dropAmount ~= "" then line = line .. " x" .. r.dropAmount end
                text = text .. line .. "\n"
            end
        else
            text = text .. "⚠️ No Challenge Active (Lobby?)"
        end
        trackerLb.Text = centerText(text, 12)
    end
    
    task_spawn(function()
        while true do
            if Cfg.chal_ajc or window.Minimized == false then
                pcall(updateTracker)
            end
            task_wait(1)
        end
    end)

    local cr3 = form:Row()
    cr3:Left():TitleStack({ Title="🚀 Auto Join Challenge", Subtitle="Automatically create Challenge room" })
    cr3:Right():Toggle({ Value=Cfg.chal_ajc, ValueChanged=function(self, v)
        Cfg.chal_ajc = v; saveConfig()
        if v then
            task_spawn(function()
                while Cfg.chal_ajc do
                    task_wait(2)
                    if not Cfg.chal_ajc then break end

                    local mode = getGameModeLabel()
                    local isChallenge = mode:upper():find("CHALLENGE")

                    if isChallenge then
                        -- [ Smart Challenge Lobby Logic ]
                        if Cfg.chal_sc and not hasWantedItem() and not isInGame() then
                            -- Item gone while NOT in match! 
                            if isOtherModeEnabled() then
                                pcall(function() Svc.TP:Teleport(game.PlaceId, player) end)
                                task_wait(10)
                                continue
                            end
                        end

                        if not isInGame() then
                            if Cfg.macro_votePlay then task_wait(5); continue end
                            if Cfg.chal_sc and not hasWantedItem() then
                                -- Don't start if item is gone and Smart Challenge is ON
                                task_wait(5)
                                continue
                            end
                            pcall(function() R.PlayRoom:FireServer("Start", { CreateChallengeRoom = true }) end)
                            task_wait(5)
                        end
                        continue
                    end

                    if not isInGame() then
                        -- Check if we should join Challenge (Smart Challenge Lobby-check)
                        if Cfg.chal_sc and hasWantedItem() then
                            pcall(function() R.PlayRoom:FireServer("Create", { CreateChallengeRoom = true }) end)
                            task_wait(0.5)
                            pcall(function() R.PlayRoom:FireServer("Start", { CreateChallengeRoom = true }) end)
                            task_wait(5)
                        end
                    end
                end
            end)
        else
            if AJ_ref and Cfg.autoJoin then AJ_ref.running = true; task_spawn(runAutoJoin_ref) end
        end
    end })

    local jwiRow = form:Row()
    jwiRow:Left():TitleStack({ Title="🎁 Join When Have Item", Subtitle="Join Challenge when selected items appear" })
    jwiRow:Right():PullDownButton({ 
        Options = SHOP_ITEMS,
        Multi = true,
        Value = Cfg.chal_jwiItems or {},
        Label = (Cfg.chal_jwiItems and #Cfg.chal_jwiItems > 0 and Cfg.chal_jwiItems[1]..",") or " ",
        ValueChanged = function(s, v)
            Cfg.chal_jwiItems = v; s.Label = (v and #v > 0 and v[1]..",") or " "; saveConfig()
        end
    })

    local scRow = form:Row()
    scRow:Left():TitleStack({ Title="🧠 Smart Challenge", Subtitle="Priority: Challenge (If has item) > Other modes" })
    scRow:Right():Toggle({ Value=Cfg.chal_sc, ValueChanged=function(_, v) Cfg.chal_sc=v; saveConfig() end })
    
end

-- [ TRAIT SYSTEM ]
local function setupTraitTab(title, icon, isMain)
    local tab  = lobbySection:Tab({ Title=title, Icon=icon })
    local form = tab:Form()
    local sel, wants, delay = nil, {}, 0.5
    local charLb, traitLb, conns = nil, nil, {}

    local charRow = form:Row()
    charRow:Left():TitleStack({ Title="Select Unit 🎃", Subtitle="Select to reroll " .. title })
    local cBtn = charRow:Right():PullDownButton({ Options={"Loading..."}, Label=" ", Multi=false, ValueChanged=function(self, v)
        local opts, insts = getCharList()
        local idx = table_find(opts, v)
        if not idx then return end
        local inst = insts[idx]
        if sel == inst then sel=nil; self.Label=" "; charLb.Text="" else sel=inst; self.Label=opts[idx]; charLb.Text=getCharDisplay(inst) end
        for _, c in pairs(conns) do c:Disconnect() end; table.clear(conns)
    end })
    Dropdowns[isMain and "main" or "sub"] = cBtn
    charLb = form:Row():Left():Label({ Text="No unit selected 🎃", TextWrapped=true })

    local tRow = form:Row()
    tRow:Left():TitleStack({ Title="Select Target Traits 📍", Subtitle="Multi-select supported" })
    tRow:Right():PullDownButton({ Options=ALL_TRAITS, Label=" ", Multi=true, ValueChanged=function(s, v)
        wants = type(v) == "table" and v or (v and {v} or {})
        s.Label = (wants and #wants > 0 and wants[1]..",") or " "
        traitLb.Text = #wants==0 and "No traits selected" or table_concat(wants, ", ")
    end })
    local tlRow = form:Row()
    traitLb = tlRow:Left():Label({ Text="No traits selected", TextWrapped=true })
    tlRow:Right():Button({ Label="Clear", State="Minimal", Pushed=function() wants={}; traitLb.Text="No traits selected" end })

    local drRow = form:Row()
    drRow:Left():TitleStack({ Title="Delay", Subtitle="Recommended: 0.2s" })
    drRow:Right():Stepper({ Fielded=true, Value=0.5, Minimum=0.1, Maximum=2, Increment=0.1, ValueChanged=function(_, v) delay=v end })

    local function createTog(t, s, inf)
        local r = form:Row()
        r:Left():TitleStack({ Title=t, Subtitle=s })
        r:Right():Toggle({ ValueChanged=function(self, v)
            if v then
                if not sel or #wants==0 then self.Value=false; return end
                startReroll(sel, wants, delay, inf, isMain, self, traitLb, charLb, refreshDropdowns)
            end
        end })
    end
    createTog("Reroll " .. title, "Normal Reroll", false)
end

setupTraitTab("Main Trait", "rbxassetid://10747373176", true)

-- [ AUTO STAT TAB ]
do
    local tab  = lobbySection:Tab({ Title="Auto Stat", Icon="rbxassetid://10747373176" })
    local form = tab:Form()

    local selChar, delay = nil, 0.1
    local infoLb, statusLb, startBtn
    local valConns, charConns = {}, {}

    local function refreshInfo()
        if not selChar or not selChar.Parent then return end
        local txt, _ = buildStatInfo(selChar, "O+")
        if infoLb then infoLb.Text = txt end
    end

    local charRow = form:Row({SearchIndex="Select Unit O+"})
    charRow:Left():TitleStack({ Title="Select Unit 🎃", Subtitle="Upgrade Stats to O+" })
    local charBtn = charRow:Right():PullDownButton({ Options={"Loading..."}, Label="", Multi=false,
        ValueChanged=function(self, v)
            local opts, insts = getCharList()
            local idx = table_find(opts, v)
            if not idx then return end
            local inst = insts[idx]
            if selChar == inst then
                selChar=nil; self.Label=""
                if infoLb then infoLb.Text="Select unit to view info" end
                if statusLb then statusLb.Text="Ready (No unit)" end
                for _, c in pairs(valConns) do c:Disconnect() end; table.clear(valConns)
                for _, c in pairs(charConns) do c:Disconnect() end; table.clear(charConns)
                if startBtn then startBtn.Disabled=true end
            else
                selChar=inst; self.Label=opts[idx]
                if statusLb then statusLb.Text="Ready" end
                for _, c in pairs(valConns) do c:Disconnect() end; table.clear(valConns)
                for _, c in pairs(charConns) do c:Disconnect() end; table.clear(charConns)
                for _, n in ipairs(STAT_NAMES) do
                    local obj = inst:FindFirstChild(n)
                    if obj then table_insert(valConns, obj:GetPropertyChangedSignal("Value"):Connect(refreshInfo)) end
                end
                trackCharLabel(inst, {Text=""}, charConns)
                refreshInfo()
                if startBtn then startBtn.Disabled=false end
            end
        end })
    Dropdowns["stat"] = charBtn

    infoLb = form:Row():Left():Label({ Text="Select unit to view stats info", TextWrapped=true })

    local dr = form:Row({SearchIndex="Delay O+"})
    dr:Left():TitleStack({ Title="Delay (Seconds)", Subtitle="Recommended 0.1-0.3" })
    dr:Right():Stepper({ Fielded=true, Value=0.1, Minimum=0.05, Maximum=2, Increment=0.05, ValueChanged=function(_, v) delay=v end })

    local sbRow = form:Row()
    sbRow:Right():Button({ Label="Start Upgrade to O+", State="Accent", Disabled=true,
        Pushed=function()
            if not selChar then if statusLb then statusLb.Text="❌ Select unit first" end; return end
            task_spawn(function()
                local ok = autoStat(selChar, "O+", nil, delay, statusLb)
                if ok then
                    task_wait(1.5); refreshDropdowns(); refreshInfo()
                    local allDone = true
                    for _, n in ipairs(STAT_NAMES) do
                        if getStatVal(selChar, n) ~= "O+" then allDone=false; break end
                    end
                    if allDone then
                        selChar=nil; charBtn.Label=""
                        if infoLb then infoLb.Text="Select unit to view stats info" end
                        if startBtn then startBtn.Disabled=true end
                    end
                end
            end)
        end
    }, function(obj) startBtn=obj end)

    statusLb = form:Row():Left():Label({ Text="Ready to use", TextWrapped=true })

    form:Row():Left():TitleStack({ Title="🎨 Custom Mode", Subtitle="Select Target & Stats manually" })

    local cSel, cTarget, cStats, cDelay, cRun = nil, "O+", {}, 0.1, false
    local cCharLb, cTargetLb, cStatLb, cInfoLb, cStatusLb
    local cCharConns, cValConns = {}, {}

    local function refreshCustomInfo()
        if not cSel or not cSel.Parent or not cInfoLb then return end
        local lines, total = {}, 0
        for _, n in ipairs(STAT_NAMES) do
            local cur = getStatVal(cSel, n)
            if cur then
                local d = STAT_DISPLAY[n]
                local need = calcUpgrades(cur, cTarget)
                local icon = table_find(cStats, d) and "✅ " or "⬜ "
                if need > 0 then
                    table_insert(lines, icon..d..": "..cur.." → "..cTarget.." (+"..need..")")
                    if table_find(cStats, d) then total+=need end
                else
                    table_insert(lines, icon..d..": "..cur.." ✅")
                end
            end
        end
        cInfoLb.Text = table_concat(lines,"\n").."\n\n💎 Boosters: "..getBoosters().." | Needed: "..total
    end

    local cCharRow = form:Row({SearchIndex="Select Unit Custom"})
    cCharRow:Left():TitleStack({ Title="Select Unit 🎃", Subtitle="Click again to cancel" })
    local cCharBtn = cCharRow:Right():PullDownButton({ Options={"Loading..."}, Label="", Multi=false,
        ValueChanged=function(self, v)
            local opts, insts = getCharList()
            local idx = table_find(opts, v)
            if not idx then return end
            local inst = insts[idx]
            if cSel == inst then
                cSel=nil; self.Label=""
                if cCharLb then cCharLb.Text="" end
                if cStatusLb then cStatusLb.Text="❌ Select unit first" end
                for _, c in pairs(cCharConns) do c:Disconnect() end; table.clear(cCharConns)
                for _, c in pairs(cValConns) do c:Disconnect() end; table.clear(cValConns)
            else
                cSel=inst; self.Label=opts[idx]
                if cCharLb then cCharLb.Text=getCharDisplay(inst) end
                if cStatusLb then cStatusLb.Text = #cStats==0 and "❌ Select Stats first" or "Ready ✅" end
                trackCharLabel(inst, cCharLb or {Text=""}, cCharConns)
                for _, c in pairs(cValConns) do c:Disconnect() end; table.clear(cValConns)
                for _, n in ipairs(STAT_NAMES) do
                    local obj = inst:FindFirstChild(n)
                    if obj then table_insert(cValConns, obj:GetPropertyChangedSignal("Value"):Connect(refreshCustomInfo)) end
                end
                refreshCustomInfo()
            end
        end })
    Dropdowns["custom"] = cCharBtn

    cCharLb = form:Row():Left():Label({ Text="", TextWrapped=true })

    local ctRow = form:Row({SearchIndex="Target Stat"})
    ctRow:Left():TitleStack({ Title="Select Target Stat 🎯", Subtitle="Click again = Reset to O+" })
    ctRow:Right():PullDownButton({ Options=ALL_STAT_LEVELS, Label="O+", Multi=false,
        ValueChanged=function(self, v)
            local t = v
            if cTarget==t then cTarget="O+"; self.Label="O+"; if cTargetLb then cTargetLb.Text="Target: O+" end
            else cTarget=t; self.Label=t; if cTargetLb then cTargetLb.Text="Target: "..t end end
            refreshCustomInfo()
        end })
    cTargetLb = form:Row():Left():Label({ Text="Target: O+", TextWrapped=true })

    local csRow = form:Row({SearchIndex="Select Stats"})
    csRow:Left():TitleStack({ Title="Select Stats 📊", Subtitle="Click again to remove" })
    csRow:Right():PullDownButton({ Options=ALL_STAT_OPTIONS, Label="", Multi=true,
        ValueChanged=function(self, v)
            cStats = type(v) == "table" and v or (v and {v} or {})
            if cStatLb then cStatLb.Text = #cStats==0 and "None selected" or table_concat(cStats,", ") end
            if cStatusLb then
                cStatusLb.Text = (not cSel) and "❌ Select unit first"
                    or (#cStats==0 and "❌ Select Stats first" or "Ready ✅")
            end
            refreshCustomInfo()
        end })

    local slRow = form:Row()
    cStatLb = slRow:Left():Label({ Text="No stats selected", TextWrapped=true })
    slRow:Right():Button({ Label="All", State="Minimal", Pushed=function()
        cStats={table.unpack(ALL_STAT_OPTIONS)}
        if cStatLb then cStatLb.Text=table_concat(cStats,", ") end
        if cStatusLb then cStatusLb.Text = not cSel and "❌ Select unit first" or "Ready ✅" end
        refreshCustomInfo()
    end })
    slRow:Right():Button({ Label="Clear", State="Minimal", Pushed=function()
        cStats={}
        if cStatLb then cStatLb.Text="No stats selected" end
        if cStatusLb then cStatusLb.Text = not cSel and "❌ Select unit first" or "❌ Select Stats first" end
        refreshCustomInfo()
    end })

    cInfoLb = form:Row():Left():Label({ Text="Select unit to view stats", TextWrapped=true })

    local cdRow = form:Row({SearchIndex="Delay Custom"})
    cdRow:Left():TitleStack({ Title="Delay (Seconds)", Subtitle="Recommended 0.1-0.3" })
    cdRow:Right():Stepper({ Fielded=true, Value=0.1, Minimum=0.05, Maximum=1, Increment=0.05,
        ValueChanged=function(_, v) cDelay=v end })

    local ctgRow = form:Row()
    ctgRow:Right():Toggle({ ValueChanged=function(self, v)
        if v then
            if not cSel then self.Value=false; if cStatusLb then cStatusLb.Text="❌ Select unit first" end; return end
            if #cStats==0 then self.Value=false; if cStatusLb then cStatusLb.Text="❌ Select Stats first" end; return end
            cRun=true
            if cStatusLb then cStatusLb.Text="🚀 Upgrading..." end
            task.spawn(function()
                autoStat(cSel, cTarget, cStats, cDelay, cStatusLb)
                self.Value=false; cRun=false
                task.wait(1); refreshCustomInfo()
            end)
        else
            if cRun then cRun=false; if cStatusLb then cStatusLb.Text="⏸️ Stopped by user" end end
        end
    end })
    cStatusLb = form:Row():Left():Label({ Text="❌ Select unit first", TextWrapped=true })
end


do
    local tab  = lobbySection:Tab({ Title="Auto Curse", Icon="rbxassetid://10723407389" })
    local form = tab:Form()

    form:Row():Left():TitleStack({
        Title="⚠️ Warning",
        Subtitle="1. Select 2 Stats\n2. Range -15 to +15: Move all to right for target\n3. Delay recommended 0.8-1.0 seconds\n4. Please verify before starting"
    })

    local charRow = form:Row({SearchIndex="Select Unit Curse"})
    charRow:Left():TitleStack({ Title="Select Unit 🎃", Subtitle="Click again to cancel" })
    local cBtn = charRow:Right():PullDownButton({ Options={"Loading..."}, Label="", Multi=false,
        ValueChanged=function(self, v)
            local opts, insts = getCharList()
            local idx = table_find(opts, v)
            if not idx then return end
            local inst = insts[idx]
            if Curse.char == inst then
                Curse.char=nil; self.Label=""
                if Curse.charLb then Curse.charLb.Text="" end
            else
                Curse.char=inst; self.Label=opts[idx]
                Curse:setupTracking(Curse.charLb)
            end
        end })
    Dropdowns["curse"] = cBtn

    Curse.charLb = form:Row():Left():Label({ Text="", TextWrapped=true })

    form:Row():Left():TitleStack({ Title="Select Curse Stats (2 Total)", Subtitle="Must select exactly 2" })

    for _, stat in ipairs(CURSE_STATS) do
        local r = form:Row()
        r:Left():TitleStack({ Title="🔸 "..stat, Subtitle=CURSE_HINTS[stat] })
        Curse.statToggles[stat] = r:Right():Toggle({ ValueChanged=function(self, v)
            if Curse.resetting then return end
            if not Curse.char then
                Curse.resetting = true
                self.Value=false
                Curse.resetting = false
                if Curse.statusLb then Curse.statusLb.Text="❌ Select unit first!" end
                return
            end
            if v then
                if not table_find(Curse.stats, stat) then table_insert(Curse.stats, stat) end
            else
                local i = table_find(Curse.stats, stat)
                if i then
                    table_remove(Curse.stats, i)
                    if Curse.sliderRefs[stat] then Curse.sliderRefs[stat].Value=0 end
                    Curse.vals[stat] = 0
                end
            end
        end })
    end

    form:Row():Left():TitleStack({ Title="Target Values", Subtitle="-15 to +15" })
    for _, stat in ipairs(CURSE_STATS) do
        local r = form:Row()
        local ts = r:Left():TitleStack({ Title="🔹 "..stat, Subtitle="(0)" })
        Curse.sliderRefs[stat] = r:Right():Slider({ Minimum=-15, Maximum=15, Increment=1, Value=0,
            ValueChanged=function(self, v)
                if Curse.resetting then return end
                if not table_find(Curse.stats, stat) then
                    task.defer(function() self.Value=0; ts.Subtitle="(0) Select Stat first!" end); return
                end
                local fv = math_floor(v+0.5)
                Curse.vals[stat] = fv; ts.Subtitle = "(" .. tostring(fv) .. ")"
            end })
    end

    local fRow = form:Row()
    local fingerLb = fRow:Left():Label({ Text="💎 Cursed Finger: ...", TextWrapped=true })
    task_spawn(function() while task_wait(0.3) do fingerLb.Text = "💎 Cursed Finger: "..getFingers() end end)

    local dr = form:Row()
    dr:Left():TitleStack({ Title="Delay (Seconds)", Subtitle="0.5-10 seconds" })
    dr:Right():Stepper({ Fielded=true, Value=0.5, Minimum=0.1, Maximum=10, Increment=0.1,
        ValueChanged=function(_, v) Curse.delay = tonumber(v) or 0.5 end })

    local sr = form:Row()
    sr:Left():TitleStack({ Title="Start Auto Curse", Subtitle="Roll until targets met" })

    Curse.statusLb = form:Row():Left():Label({ Text="Ready ✨", TextWrapped=true })

    Curse.toggleRef = sr:Right():Toggle({ ValueChanged=function(self, v)
        if v then
            if not Curse.char then
                self.Value=false; Curse.statusLb.Text="❌ Select unit first!"
                return
            end
            if #Curse.stats < 2 then
                self.Value=false; Curse.statusLb.Text="❌ Select 2 Stats first!"
                return
            end
            Curse:start(self, Curse.statusLb)
        else
            Curse.running=false
            if Curse.statusLb then Curse.statusLb.Text="⏸️ Stopped by user" end
        end
    end })
end

-- ============================================================
-- SECTION 2 : SHOP & ITEMS
-- ============================================================
local shopSection = window:Section({ Title="Shop & Items", Icon="rbxassetid://3926307971" })

-- [ MERCHANT TAB ]
do
    local tab  = shopSection:Tab({ Title="Merchant", Icon="rbxassetid://3926307971" }) -- Shop building icon
    local form = tab:Form()
    

    local merchObjects = {}
    for _, itemName in ipairs(SHOP_ITEMS) do
        local bought, total = getItemStock(itemName)
        local row = form:Row()
        local titleStack = row:Left():TitleStack({ Title=itemName, Subtitle=("Stock: %d/%d"):format(bought, total) })
        
        -- Auto Buy Toggle
        row:Right():Toggle({ 
            Value = Cfg.merch_autoBuy[itemName] or false,
            ValueChanged = function(_, v) Cfg.merch_autoBuy[itemName] = v; saveConfig() end
        })
        
        -- Quantity Slider
        local sliderRow = form:Row()
        local buyAmtLabel = sliderRow:Left():Label({ Text=("   🛒 Buy Amount: %d"):format(Cfg.merch_amounts[itemName] or 0), TextWrapped=true })
        local sliderObj = sliderRow:Right():Slider({
            Value = (total == 0 and 0 or (Cfg.merch_amounts[itemName] or 0)),
            Minimum = 0,
            Maximum = math_max(1, total),
            Step = 1,
            Disabled = (total == 0),
            ValueChanged = function(s, v)
                Cfg.merch_amounts[itemName] = v; saveConfig()
                buyAmtLabel.Text = "   🛒 Buy Amount: " .. math_floor(v)
            end
        })
        merchObjects[itemName] = { stack = titleStack, slider = sliderObj, label = buyAmtLabel }
    end
    
    task_spawn(function()
        while true do
            for name, obj in pairs(merchObjects) do
                local b, q = getItemStock(name)
                pcall(function() 
                    obj.stack.Subtitle = ("Stock: %d/%d"):format(b, q) 
                    obj.slider.Maximum = math_max(1, q)
                    -- If currently selected amount is > new max, cap it
                    if (Cfg.merch_amounts[name] or 0) > q then
                        obj.slider.Value = q
                        Cfg.merch_amounts[name] = q
                        obj.label.Text = ("   🛒 Buy Amount: %d"):format(q)
                    end
                end)
            end
            task_wait(5)
        end
    end)

    -- Merchant Loop
    task_spawn(function()
        while true do
            task_wait(5)
            for _, itemName in ipairs(SHOP_ITEMS) do
                if Cfg.merch_autoBuy[itemName] then
                    local bought, total = getItemStock(itemName)
                    if bought < total then
                        local want = Cfg.merch_amounts[itemName] or 1
                        local toBuy = math_min(want, total - bought)
                        if toBuy > 0 then
                            local ok = pcall(function() R.Merchant:FireServer(itemName, toBuy) end)
                            if ok then sendShopWebhook(itemName, toBuy) end
                            task_wait(0.5)
                        end
                    end
                end
            end
        end
    end)
end

-- [ CAPSULE TAB ]
do
    local tab  = shopSection:Tab({ Title="Capsule", Icon="rbxassetid://10723364605" })
    local form = tab:Form()
    
    local selCap, capInst = nil, nil
    local selRow = form:Row()
    selRow:Left():TitleStack({ Title="💊 Choose Capsule", Subtitle="Choose Capsule ที่ต้องการเปิด" })
    local capBtn = selRow:Right():PullDownButton({ Options={"Loading..."}, Label=" ", ValueChanged=function(self, v)
        selCap = v
        local caps = getCapsules()
        for _, c in ipairs(caps) do if (c.name.." (x"..c.amt..")") == v then capInst = c.inst; break end end
    end })
    
    local function updateCapList()
        local caps = getCapsules()
        local opts = {}
        for _, c in ipairs(caps) do table_insert(opts, c.name .. " (x" .. c.amt .. ")") end
        capBtn.Options = #opts > 0 and opts or {"❌ No Capsule"}
    end
    task_spawn(function() while task_wait(5) do updateCapList() end end)
    updateCapList()

    local modeRow = form:Row()
    modeRow:Left():TitleStack({ Title="Open Mode 🎲", Subtitle="Select how many to open" })
    modeRow:Right():PullDownButton({
        Options = {"Custom Amount", "Open All"},
        Label = Cfg.cap_openMode == "all" and "Open All" or "Custom Amount",
        ValueChanged = function(self, v)
            Cfg.cap_openMode = (v == "Open All" and "all" or "custom")
            saveConfig()
        end
    })

    local amtRow = form:Row()
    local amtTitle = amtRow:Left():TitleStack({ Title=("Open Amount 🔢 (%d)"):format(Cfg.cap_customAmount or 1) })
    amtRow:Right():Slider({
        Value = Cfg.cap_customAmount or 1,
        Minimum = 1,
        Maximum = 999,
        Step = 1,
        ValueChanged = function(_, v)
            Cfg.cap_customAmount = v
            amtTitle.Title = ("Amount 🔢 (%d)"):format(math.floor(v))
            saveConfig()
        end
    })

    local sRow = form:Row()
    sRow:Left():TitleStack({ Title="Auto Sell Unit 💰", Subtitle="Sell low rarity units" })
    sRow:Right():Toggle({ Value=Cfg.cap_autoSell, ValueChanged=function(_, v) Cfg.cap_autoSell=v; saveConfig() end })

    local ksRow = form:Row()
    ksRow:Left():TitleStack({ Title="Keep Shiny ✨", Subtitle="Do not sell Shiny units" })
    ksRow:Right():Toggle({ Value=Cfg.cap_keepShiny, ValueChanged=function(_, v) Cfg.cap_keepShiny=v; saveConfig() end })

    local statusLb = form:Row():Left():Label({ Text="Ready ✨", TextWrapped=true })

    form:Row():Right():Button({ Label="Open Capsule", State="Accent", Pushed=function()
        if not capInst then statusLb.Text = "❌ Please select Capsule first"; return end
        local amt = capInst:FindFirstChild("Amount")
        if not amt or amt.Value <= 0 then statusLb.Text = "❌ Out of Capsules"; return end
        
        local final = (Cfg.cap_openMode == "all" and amt.Value or math_min(Cfg.cap_customAmount, amt.Value))
        statusLb.Text = "⏳ Opening " .. final .. " pcs..."
        
        task_spawn(function()
            local ok = pcall(function() R.ItemUse:FireServer(capInst.Name, final) end)
            if ok then
                statusLb.Text = "✅ Success!"
                if Cfg.cap_webhook then sendCapsuleWebhook(capInst.Name, final, "") end
                if Cfg.cap_autoSell then
                    task_wait(2)
                end
            else
                statusLb.Text = "❌ เปิดไม่สำเร็จ"
            end
        end)
    end })
end

-- [ SUMMON TAB ]
do
    local tab  = shopSection:Tab({ Title="Summon", Icon="rbxassetid://10723343321" }) -- Star/Gacha icon
    local form = tab:Form()

    -- [ CONFIG ]
    if type(Cfg.summon_autoSell) ~= "table" then
        Cfg.summon_autoSell = { Rare=false, Epic=false, Legendary=false, Mythic=false, Shiny=false }
    end

    local function getCharInfo(charFrame)
        local rar = charFrame:FindFirstChild("Rarity")
        local nam = charFrame:FindFirstChild("Names")
        local rate = charFrame:FindFirstChild("Rate")
        local res = charFrame:FindFirstChild("ResetTime")
        local rt = (rar and (rar.ContentText ~= "" and rar.ContentText or rar.Text)) or ""
        local nm = (nam and (nam.ContentText ~= "" and nam.ContentText or nam.Text)) or ""
        local r = (rate and (rate.ContentText ~= "" and rate.ContentText or rate.Text)) or ""
        local rst = (res and (res.ContentText ~= "" and res.ContentText or res.Text)) or ""
        return { rarity = rt, name = nm, rate = r, reset = rst }
    end

    local function getBannerChars(bannerName)
        local banner = playerGui:FindFirstChild("UnitsGacha") and playerGui.UnitsGacha.Main:FindFirstChild(bannerName == "Standard" and "Standard_Banner" or "Rateup_Banner")
        if not banner then return nil end
        local res = {}
        for _, side in ipairs({"LeftText", "CenterText", "RightText"}) do
            local f = banner:FindFirstChild(side)
            if f then table_insert(res, getCharInfo(f)) end
        end
        return res
    end

    -- RATEUP SECTION 
    form:Row():Left():Label({ Text="Choose🌟 RateUp Banner", TextWrapped=true })
    local trackerRateup = form:Row():Left():Label({ Text="⌛ Loading...", TextWrapped=true })
    
    local function getKeepTable()
        return {
            Rare = Cfg.summon_autoSell.Rare,
            Epic = Cfg.summon_autoSell.Epic,
            Legendary = Cfg.summon_autoSell.Legendary,
            Mythic = Cfg.summon_autoSell.Mythic,
            Shiny = Cfg.summon_autoSell.Shiny
        }
    end

    local rbRateup = form:Row()
    rbRateup:Left():Button({ Label="1x RateUp", State="Accent", Pushed=function() 
        pcall(function() R.UnitsGacha:FireServer("1x", "Rateup", getKeepTable()) end) 
    end })
    rbRateup:Right():Button({ Label="10x RateUp", State="Accent", Pushed=function() 
        pcall(function() R.UnitsGacha:FireServer("10x", "Rateup", getKeepTable()) end) 
    end })

    -- STANDARD SECTION 
    form:Row():Left():Label({ Text="Choose📖 Standard Banner", TextWrapped=true })
    local trackerStandard = form:Row():Left():Label({ Text="⌛ Loading...", TextWrapped=true })

    local rbStandard = form:Row()
    rbStandard:Left():Button({ Label="1x Standard", State="Minimal", Pushed=function() 
        pcall(function() R.UnitsGacha:FireServer("1x", "Standard", getKeepTable()) end) 
    end })
    rbStandard:Right():Button({ Label="10x Standard", State="Minimal", Pushed=function() 
        pcall(function() R.UnitsGacha:FireServer("10x", "Standard", getKeepTable()) end) 
    end })


    -- PITY (Above Auto Sell) 
    form:Row():Left():Label({ Text="Choose🔥 Pity Status", TextWrapped=true })
    pityLabel = form:Row():Left():Label({ Text="🔥 Pity: ...", TextWrapped=true })

    -- AUTO SELL (Standalone) 
    form:Row():Left():Label({ Text="Choose💰 Auto Sell Unit", TextWrapped=true })
    local autoSellRow = form:Row()
    autoSellRow:Left():TitleStack({ Title="Auto Sell Unit", Subtitle="Select to toggle (Server Side)" })
    autoSellRow:Right():PullDownButton({
        Options = {"Rare", "Epic", "Legendary", "Mythic", "Shiny"},
        Multi = true,
        Value = (function()
            local v = {}
            for k, val in pairs(Cfg.summon_autoSell) do if val then table_insert(v, k) end end
            return v
        end)(),
        Label = (function()
            local cnt = 0
            for _, v in pairs(Cfg.summon_autoSell) do if v then cnt = cnt + 1 end end
            return cnt > 0 and "Selected ("..cnt..")" or " "
        end)(),
        ValueChanged = function(s, v)
            local newMap = { Rare=false, Epic=false, Legendary=false, Mythic=false, Shiny=false }
            for _, name in ipairs(v) do newMap[name] = true end
            for rarity, val in pairs(newMap) do
                if Cfg.summon_autoSell[rarity] ~= val then
                    pcall(function() R.SettingsEvent:FireServer("Sell Auto " .. rarity, val) end)
                end
            end
            Cfg.summon_autoSell = newMap
            s.Label = #v > 0 and "Selected ("..#v..")" or " "
            saveConfig()
        end
    })

    -- CURRENCY (Bottom) 
    form:Row():Left():Label({ Text="Choose💎 Currency", TextWrapped=true })
    local currencyRow = form:Row()
    local gemLb = currencyRow:Left():Label({ Text="💎 Gems: ...", TextWrapped=true })
    local goldLb = currencyRow:Right():Label({ Text="💰 Gold: ...", TextWrapped=true })

    -- UPDATE LOOPS 
    task_spawn(function()
        while true do
            if window.Minimized == false then
                pcall(function()
                    -- Update Tracker Rateup
                    local rup = getBannerChars("Rateup")
                    local tRateup = ""
                    if rup then
                        for _, c in ipairs(rup) do
                            if c.name ~= "" then
                                local rst = (c.reset ~= "" and " | ⏳ " .. c.reset or "")
                                tRateup = tRateup .. " • [" .. c.rarity .. "] " .. c.name .. " (" .. c.rate .. ")" .. rst .. "\n"
                            end
                        end
                        local rtRes = playerGui.UnitsGacha.Main.TimeBar.RateUpReset.Numbers
                        tRateup = tRateup .. "⏳ RateUp Reset: " .. (rtRes.ContentText ~= "" and rtRes.ContentText or rtRes.Text)
                    end

                    -- Update Tracker Standard
                    local std = getBannerChars("Standard")
                    local tStandard = ""
                    local tPity = ""
                    if std then
                        for _, c in ipairs(std) do
                            if c.name ~= "" then
                                tStandard = tStandard .. " • [" .. c.rarity .. "] " .. c.name .. " (" .. c.rate .. ")\n"
                            end
                        end
                        local pity = playerGui.UnitsGacha.Main.TimeBar.MythicPity.Numbers
                        local reset = playerGui.UnitsGacha.Main.TimeBar.StandardReset.Numbers
                        tPity = "🔥 Pity: " .. (pity.ContentText ~= "" and pity.ContentText or pity.Text)
                        tStandard = tStandard .. "⏳ Standard Reset: " .. (reset.ContentText ~= "" and reset.ContentText or reset.Text)
                    end
                    
                    trackerRateup.Text = centerText(tRateup, 12)
                    trackerStandard.Text = centerText(tStandard, 12)
                    if pityLabel then pityLabel.Text = tPity end

                    -- Update Currency
                    local gems = playerGui:FindFirstChild("UnitsGacha") and playerGui.UnitsGacha.Main.PlayerCurrency.Gems.Numbers
                    local gold = playerGui:FindFirstChild("UnitsGacha") and playerGui.UnitsGacha.Main.PlayerCurrency.Gold.Numbers
                    if gems then gemLb.Text = "💎 Gems: " .. (gems.ContentText ~= "" and gems.ContentText or gems.Text) end
                    if gold then goldLb.Text = "💰 Gold: " .. (gold.ContentText ~= "" and gold.ContentText or gold.Gold) end
                end)
            end
            task_wait(1)
        end
    end)
end

-- ============================================================
-- SECTION 3 : SETTINGS
-- ============================================================
do
    local sec = window:Section({ Title="Settings" })
    local tab = sec:Tab({ Title="Settings", Icon="rbxassetid://10734950309" })

    do
        local fm = tab:PageSection({ Title="Streamer Mode" }):Form()
        local r  = fm:Row()
        r:Left():TitleStack({ Title="Streamer Mode", Subtitle="Fake Name / DisplayName / UID / Level / Title" })
        r:Right():Toggle({ Value=Cfg.streamerMode, ValueChanged=function(_, v)
            Cfg.streamerMode = v
            task.defer(function()
                if v then task.wait(2.5); pcall(function() SM:apply() end)
                else pcall(function() SM:apply() end) end
            end)
            saveConfig()
        end })
    end




    do
        local fm = tab:PageSection({ Title="Discord Webhook" }):Form()

        local wr = fm:Row()
        wr:Left():TitleStack({ Title="Webhook URL", Subtitle="URL Discord Webhook" })
        local webhookField = wr:Right():TextField({
            Value = Cfg.webhookUrl or "",
            Placeholder = "https://discord.com/api/webhooks/...",
            ValueChanged = function(self, v)
                Cfg.webhookUrl = v; saveConfig()
            end
        })

        fm:Row():Right():Button({ Label="Test Webhook", State="Accent", Pushed=sendTestWebhook })

        local er = fm:Row()
        er:Left():TitleStack({ Title="Enable Webhook", Subtitle="Notify on success" })
        er:Right():Toggle({ Value=Cfg.webhookEnabled, ValueChanged=function(_, v) Cfg.webhookEnabled=v; saveConfig() end })

        local ir = fm:Row()
        ir:Left():TitleStack({ Title="Discord User ID", Subtitle="UID (Optional)" })
        local discordField = ir:Right():TextField({
            Value = Cfg.discordUserId or "",
            Placeholder = "123456789012345678",
            ValueChanged = function(self, v)
                Cfg.discordUserId = v; saveConfig()
            end
        })

        local pr = fm:Row()
        pr:Left():TitleStack({ Title="Enable Ping", Subtitle="Ping on success" })
        pr:Right():Toggle({ Value=Cfg.pingEnabled, ValueChanged=function(_, v) Cfg.pingEnabled=v; saveConfig() end })
    end

    do
        local fm = tab:PageSection({ Title="Interface" }):Form()

        local items = {
            { k="darkMode",   title="Dark Mode",        sub="Dark UI theme",          cb=function(v) app.Theme=v and cascade.Themes.Dark or cascade.Themes.Light end },
            { k="dropshadow", title="Window Shadow",    sub="Enable UI shadow",          cb=function(v) window.Dropshadow=v end },
            { k="uiblur",     title="Background Blur",  sub="Blur UI background",     cb=function(v) window.UIBlur=v     end },
        }
        for _, item in ipairs(items) do
            local r = fm:Row()
            r:Left():TitleStack({ Title=item.title, Subtitle=item.sub })
            r:Right():Toggle({ Value=Cfg[item.k], ValueChanged=function(_, v)
                Cfg[item.k]=v; if item.cb then item.cb(v) end; saveConfig()
            end })
        end

        local kr = fm:Row()
        kr:Left():TitleStack({ Title="Toggle Keybind", Subtitle="Show/Hide UI" })
        kr:Right():KeybindField({
            Value = typeof(Cfg.keybind) == "EnumItem" and Cfg.keybind or Enum.KeyCode.RightControl,
            Size = UDim2.fromOffset(100,26),
            TextXAlignment = Enum.TextXAlignment.Right,
            ValueChanged = function(_, v)
                if typeof(v)=="EnumItem" and v.EnumType==Enum.KeyCode then
                    Cfg.keybind=v; saveConfig()
                end
            end
        })
    end

    do
        local fm         = tab:PageSection({ Title="🏷️ Collection Tag Viewer" }):Form()
        local tagRunning = false
        local origNames  = {}

        local function getTag(unitName)
            local inst = playerData.Collection:FindFirstChild(unitName)
            if not inst then return "" end
            local t = inst:FindFirstChild("Tag")
            return t and tostring(t.Value) or ""
        end

        local function applyTags()
            local ok0, unitFolder = pcall(function()
                return player.PlayerGui.Collection.Main.Base.Space.Unit
            end)
            if not ok0 or not unitFolder then return 0 end

            local colChildren = playerData.Collection:GetChildren()
            local guiChildren = unitFolder:GetChildren()
            local guiUnits = {}
            for _, f in ipairs(guiChildren) do
                if not f:IsA("UIGridLayout") then
                    table.insert(guiUnits, f)
                end
            end

            local count = 0
            for i, unitFrame in ipairs(guiUnits) do
                local ok, namesLb = pcall(function()
                    return unitFrame.Frame.UnitFrame.Info.Names
                end)
                if not ok or not namesLb then continue end

                if not origNames[unitFrame] then
                    origNames[unitFrame] = namesLb.Text
                end

                local colInst = colChildren[i]
                local tag = ""
                if colInst then
                    local t = colInst:FindFirstChild("Tag")
                    tag = t and tostring(t.Value) or ""
                end

                local orig = origNames[unitFrame]
                namesLb.Text = (tag ~= "") and (orig .. " [" .. tag .. "]") or orig
                count += 1
            end
            return count
        end

        local function restoreTags()
            for unitFrame, origText in pairs(origNames) do
                pcall(function()
                    unitFrame.Frame.UnitFrame.Info.Names.Text = origText
                end)
            end
            origNames = {}
        end

        local statusLb = fm:Row():Left():Label({ Text="💤 Status: Off", TextWrapped=true })

        local togRow = fm:Row({SearchIndex="Tag Viewer"})
        togRow:Left():TitleStack({
            Title    = "🏷️ Show Inventory Tags",
            Subtitle = "Show [Tag] after unit name in Collection GUI"
        })
        togRow:Right():Toggle({ ValueChanged=function(self, v)
            if v then
                tagRunning = true
                local count = applyTags()
                statusLb.Text = count > 0
                    and ("✅ Tagging %d units | Realtime"):format(count)
                    or  "⚠️ Open Collection GUI first"
                task.spawn(function()
                    while tagRunning do
                        task.wait(1)
                        if not tagRunning then break end
                        local n = applyTags()
                        if n > 0 then
                            statusLb.Text = ("✅ Tagging %d units | Realtime"):format(n)
                        end
                    end
                    restoreTags()
                    statusLb.Text = "💤 Status: Off"
                end)
            else
                tagRunning = false
            end
        end })
    end
end

-- EVENT TAB 
do
    local tab  = lobbySection:Tab({ Title="Event", Icon="rbxassetid://10723381661" })
    local form = tab:Form()

    local EV = {
        running = false,
        fateMode = Cfg.event_fateMode or true,
    }
    EV_ref = EV

    local function runAutoJoinEvent()
        EV.running = true

        if isInGame_ref() then
            waitForGameEnd(300, Cfg.event_endAction or "won_next_def_retry")
            if EV.running then task.spawn(runAutoJoinEvent) end
            return
        end

        if Cfg.chal_sc and hasWantedItem_ref then
            local found, itemName = hasWantedItem_ref()
            if found then
                task.wait(5)
                if EV.running then task.spawn(runAutoJoinEvent) end
                return
            end
        end

        pcall(function() R.PlayRoom:FireServer("Fate Mode") end)
        task.wait(1)
        if not EV.running then return end
        pcall(function() R.PlayRoom:FireServer("Start") end)

        local waited = 0
        while waited < 45 and EV.running do
            task.wait(1); waited += 1
            if isInGame_ref() then break end
        end

        if isInGame_ref() then
            waitForGameEnd(300, Cfg.event_endAction or "won_next_def_retry")
            if EV.running then task.spawn(runAutoJoinEvent) end
        else
            EV.running = false
        end
    end

    local rowStart = form:Row()
    rowStart:Left():TitleStack({ Title="🌌 Auto Join Event (Fate)", Subtitle="🌌 Priority: Challenge (if has item) > Fate Mode" })
    rowStart:Right():Toggle({ Value=Cfg.event_running, ValueChanged=function(self, v)
        EV.running = v; Cfg.event_running = v; saveConfig()
        if v then
            if AJ_ref and AJ_ref.running then AJ_ref.running = false end
            if RS_ref and RS_ref.running then RS_ref.running = false end
            task.spawn(runAutoJoinEvent)
        end
    end })
    if Cfg.event_running then task.defer(function() rowStart:Right().Value = true end) end

    local rowNow = form:Row()
    rowNow:Right():Button({ Label="▶️ Start Now", State="Accent", Pushed=function()
        pcall(function() R.PlayRoom:FireServer("Fate Mode") end)
        task.wait(0.5)
        pcall(function() R.PlayRoom:FireServer("Start") end)
    end })
end

-- [ FINAL INIT ]
task_wait(0.5)
refreshDropdowns()
pcall(function() if not isInGame_ref() then playerGui.MainUI.Enabled = true end end)
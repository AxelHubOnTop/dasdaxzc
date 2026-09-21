function clicks(uis)
VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = uis
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
end

if game.PlaceId == 134963296781989 then
world1 = true
elseif game.PlaceId == 105342279726230 then
world2 = true
elseif game.PlaceId == 95740619340896 or game.PlaceId == 106357754220636 or game.PlaceId == 130793476404022 or game.PlaceId == 136446612736997 then
dungeon = true
end

repeat task.wait()
    until game:IsLoaded()

repeat task.wait()
    until game:GetService("Players").LocalPlayer.Character

_G.DefaultSettings = {
            Auto_Farm_Level = false,
            Auto_Timed_Boss = false,
            Auto_Dun_Retry = false
        }

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_CO.JSON"

        repeat wait(1)
        if isfolder("AxelHub") then
            if isfile(folder_name) then
                
            else
                writefile(folder_name, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
            end
        else
        makefolder("AxelHub")
        end
        until isfile(folder_name)

        if isfile(folder_name) then
        _G.Settings = game:service('HttpService'):JSONDecode(readfile(folder_name))

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

function fuckasstp()
local humanoid = game.Players.LocalPlayer.Character.Humanoid

if humanoid.Health > 0 then

humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

end
        end

HttpService = game:GetService("HttpService")

local function GetConfigPath()
userid = game.Players.LocalPlayer.UserId
    return "AxelHub/"..userid.."_CO.JSON"
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
        writefile(path, HttpService:JSONEncode(_G.Settings))
    end)
end

if _G.Settings.Tween_Speed == nil then
_G.Settings.Tween_Speed = 250
end
if _G.Settings.Disc == nil then
_G.Settings.Disc = 5
end

if _G.Settings.Bypass_Tp == nil then
_G.Settings.Bypass_Tp = false
end

function goto(va,speed)
if _G.Settings.Bypass_Tp then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = va
elseif _G.Settings.Bypass_Tp == false then
    local Distance2 = (va.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new(Distance2/speed, Enum.EasingStyle.Linear)
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = va})
        tween:Play()
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

local Window = WindUI:CreateWindow({
    Title = "Axel Hub - Clover Origins",
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

if game.PlaceId == 134963296781989 then
world1 = true
elseif game.PlaceId == 105342279726230 then
world2 = true
elseif game.PlaceId == 95740619340896 then
dungeon = true
end

local function parseLevel(text)
    -- get number + optional k
    local num, k = string.match(text, "Lvl%.%s*(%d+)(k?)")
    
    num = tonumber(num)

    if k == "k" then
        num = num * 1000
    end

    return num
end

function questcom()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].Notifications:GetChildren()) do
	if v.ClassName == "Frame" and string.find(v.Name, "Quest Completed") then
		v:Destroy()
return true
	end
end
return false
end

function checklevel12()
if _G.Settings.Select_Quest == "Level" then
local text = game:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].FrameBars.HUD.LabelLevel.TextLabel.Text
local currenthp = tonumber(parseLevel(text))
if world1 then
if currenthp < 50 then
return "1"
elseif currenthp < 150 then
return "2"
elseif currenthp < 250 then
return "3"
elseif currenthp < 450 then
return "4"
elseif currenthp < 750 then
return "5"
elseif currenthp < 1000 then
return "6"
elseif currenthp < 1350 then
return "7"
elseif currenthp < 1650 then
return "8"
elseif currenthp < 2000 then
return "9"
elseif currenthp < 2550 then
return "10"
elseif currenthp >= 2550 then
return "11"
end
elseif world2 then
    if currenthp < 4500 then
return "12"
elseif currenthp < 5000 then
return "13"
elseif currenthp < 5500 then
return "14"
elseif currenthp < 6000 then
return "15"
elseif currenthp < 7000 then
return "16"
elseif currenthp < 7500 then
return "17"
elseif currenthp >= 7500 then
return "18"
    end
end
elseif _G.Settings.Select_Quest == "Quest" then
return _G.Settings.Selected_Quest
end
end

mainquest = nil

function checklevel1()
if _G.Settings.Select_Quest == "Level" then
	return tostring(checklevel12())
elseif _G.Settings.Select_Quest == "Quest" then
return _G.Settings.Selected_Quest
end
end

function checklevel2()
if checklevel1() == "1" then
monsname = "Bandit"
questname = "Bandit Quest Lvl 1"
elseif checklevel1() == "2" then
monsname = "Bandit Boss"
questname = "Bandit Boss Quest Lvl 50"
elseif checklevel1() == "3" then
monsname = "Boar"
questname = "Boar Quest Lvl 150"
elseif checklevel1() == "4" then
monsname = "Boar Boss"
questname = "Boar Boss Quest Lvl 250"
elseif checklevel1() == "5" then
monsname = "Corrupted Wizard"
questname = "Corrupted Wizards Quest Lvl 450"
elseif checklevel1() == "6" then
monsname = "Orc"
questname = "Orc Lvl 750"
elseif checklevel1() == "7" then
monsname = "Orc King"
questname = "Orc King Lvl 1000+"
elseif checklevel1() == "8" then
monsname = "Corrupt Dark Wizard"
questname = "Corrupt Dark Wizard 1350"
elseif checklevel1() == "9" then
monsname = "Water Wizard"
questname = "Quest Giver Water Wizard"
elseif checklevel1() == "10" then
monsname = "Earth Wizard"
questname = "Quest Giver Earth Wizard 2000+"
elseif checklevel1() == "11" then
monsname = "Corrupt Nobleman"
questname = "Quest Giver Corrupted Nobleman 2550+"
elseif checklevel1() == "12" then
monsname = "Exiled Magic Knight"
questname = "Exiled Magic Quest"
elseif checklevel1() == "13" then
monsname = "Corrupted Fire Wizard"
questname = "Corrupted Fire Magic"
elseif checklevel1() == "14" then
monsname = "White Wolf"
questname = "Alpha Wolf Quest Giver"
elseif checklevel1() == "15" then
monsname = "Boxer Figther"
questname = "Boxer Fighter Quest Giver"
elseif checklevel1() == "16" then
monsname = "Reinforcement Wizard"
questname = "Reinforcement Quest Giver"
elseif checklevel1() == "17" then
monsname = "Swamp Monster"
questname = "Swamp Monster Quest Giver"
elseif checklevel1() == "18" then
monsname = "Hybrid Alligator"
questname = "Hybrid Alligator Quest Giver"
end
end

function attacknearest()
if attackhold then
for i2,v2 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v2.ClassName == "Tool" then
weapon_sedsa = v2.Name
end
end
for i,v in pairs(workspace.Npcs:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") then
    local dsi = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if dsi < 10 then
        buklaa = _G.Settings.Damage_Multipier
        talbe_shity = {}
        for i231 = 1,buklaa do
            table.insert(talbe_shity, v)
        end
local args = {
    [1] = weapon_sedsa,
    [2] = talbe_shity,
    [3] = 1,
    [4] = 0.12703428325254004,
    [5] = 24.90179320000243
}

game:GetService("ReplicatedStorage"):WaitForChild("Rep_Core"):WaitForChild("Events"):WaitForChild("Combat"):FireServer(unpack(args))

    end
    end
end
end
end


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

local Pri = Section:Tab({
    Title = "Priority",
    Icon = "arrow-down-up", -- optional
    Locked = false,
})

local Stats = Section:Tab({
    Title = "Stats",
    Icon = "bubbles", -- optional
    Locked = false,
})

local reroll = Section:Tab({
    Title = "Reroll",
    Icon = "shell", -- optional
    Locked = false,
})

local Quest = Section:Tab({
    Title = "Quest",
    Icon = "scroll", -- optional
    Locked = false,
})

local Dungeon = Section:Tab({
    Title = "Dungeon",
    Icon = "door-open", -- optional
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

Main:Divider()

backpacks = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
    table.insert(backpacks, v.Name)
    end
end

dropdowns["Selected_Weapon"] = Main:Dropdown({
    Title = "Select Weapon",
    Desc = "select your weapon.",
    Values = backpacks,
    Value = _G.Settings.Selected_Weapon ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Weapon = option
    end
})

local testwebhook = Main:Button({
    Title = "Refresh Weapon",
    Desc = "",
    Locked = false,
    Callback = function()
backpacks = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
    table.insert(backpacks, v.Name)
    end
end

dropdowns["Selected_Weapon"]:Refresh(backpacks)
    end
})

dropdowns["Select_Quest"] = Main:Dropdown({
    Title = "Select Quest",
    Desc = "select way to farm",
    Values = {"Level","Quest"},
    Value = _G.Settings.Select_Quest or "Level" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Select_Quest = option
    end
})

if world1 then
questthing = {"1","2","3","4","5","6","7","8","9","10","11"}
elseif world2 then
questthing = {"12","13","14","15","16","17","18"}
else
    questthing = {"1","2"}
end

dropdowns["Selected_Quest"] = Main:Dropdown({
    Title = "Select Quest",
    Desc = "select quest to farm.",
    Values = questthing,
    Value = _G.Settings.Selected_Quest or "1",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Quest = option
    end
})

if _G.Settings.Damage_Multipier == nil then
_G.Settings.Damage_Multipier = 250
end

slides["Damage_Multipier"] = Main:Slider({
    Title = "Damage Multipier",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 1000,
        Default = _G.Settings.Damage_Multipier or 250,
    },
    Callback = function(value)
        _G.Settings.Damage_Multipier = value
    end
})

toggles["Auto_Farm_Level"] = Main:Toggle({
    Title = "Auto Farm Level",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Farm_Level or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Farm_Level = state
    end
})

toggles["Auto_Second_Sea"] = Main:Toggle({
    Title = "Auto Second Sea",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Second_Sea or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Second_Sea = state
    end
})

if _G.Settings.Damage_Multipier == nil then
_G.Settings.Damage_Multipier = 250
end

slides["Cooldown_Disable"] = Main:Slider({
    Title = "Kill Aura Cooldown Disable",
    Desc = "for anti lag gonna disable every (s)",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 20,
        Default = _G.Settings.Cooldown_Disable or 10,
    },
    Callback = function(value)
        _G.Settings.Cooldown_Disable = value
    end
})

toggles["Kill_Aura"] = Main:Toggle({
    Title = "Kill Aura",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Kill_Aura or false, -- default value
    Callback = function(state) 
        _G.Settings.Kill_Aura = state
    end
})

toggles["Auto_Chest"] = Main:Toggle({
    Title = "Auto Chest",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Chest or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Chest = state
    end
})

local Section = Main:Section({ 
    Title = "Boss Menu",
})

Main:Divider()

toggles["Auto_Santoryu_Vermillion"] = Main:Toggle({
    Title = "Auto Santoryu Vermillion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Santoryu_Vermillion or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Santoryu_Vermillion = state
    end
})

toggles["Auto_Litch"] = Main:Toggle({
    Title = "Auto Litch",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Litch or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Litch = state
    end
})

toggles["Auto_Luck"] = Main:Toggle({
    Title = "Auto Luck",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Luck or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Luck = state
    end
})

toggles["Auto_Noelle"] = Main:Toggle({
    Title = "Auto Noelle",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Noelle or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Noelle = state
    end
})

toggles["Auto_Asta"] = Main:Toggle({
    Title = "Auto Asta",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Asta or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Asta = state
    end
})

toggles["Auto_Yami"] = Main:Toggle({
    Title = "Auto Yami",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Yami or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Yami = state
    end
})

toggles["Auto_Werewolf"] = Main:Toggle({
    Title = "Auto Werewolf",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Werewolf or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Werewolf = state
    end
})


toggles["Auto_Yuno"] = Main:Toggle({
    Title = "Auto Yuno",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Yuno or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Yuno = state
    end
})

local Section = reroll:Section({ 
    Title = "Grimoires Menu",
})

reroll:Divider()

thingupsqqs = {"Regen","Reinforcement","Earth","Fire","Water","Lighting","Dark","Fire Magma","AntiMagic","Wind","Time Magic","Light"}

dropdowns["Grimoires_Select"] = reroll:Dropdown({
    Title = "Grimoires Select",
    Desc = "select your grimoires to spin.",
    Values = thingupsqqs,
    Value = _G.Settings.Grimoires_Select or "Regen",
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Grimoires_Select = option
    end
})

toggles["Auto_Grimoires"] = reroll:Toggle({
    Title = "Auto Grimoires",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Grimoires or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Grimoires = state
    end
})

local Section = Quest:Section({ 
    Title = "Priority Menu",
})

Quest:Divider()

local testwebhook = Quest:Button({
    Title = "Broom Quest",
    Desc = "",
    Locked = false,
    Callback = function()
thingass = 1

repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BroomQuestCircles[thingass].CFrame
task.wait(1)
thingass = thingass + 1
until thingass == 17
    end
})

toggles["Auto_ManaSense"] = Quest:Toggle({
    Title = "Auto ManaSense",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_ManaSense or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_ManaSense = state
    end
})

local Section = Dungeon:Section({ 
    Title = "Dungeon Menu",
})

Dungeon:Divider()

toggles["Auto_Join_Rift"] = Dungeon:Toggle({
    Title = "Auto Join Rift",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Join_Rift or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Join_Rift = state
    end
})

toggles["Auto_Dungeon"] = Dungeon:Toggle({
    Title = "Auto Dungeon",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Dungeon or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Dungeon = state
    end
})

toggles["Auto_Retry_Dungeon"] = Dungeon:Toggle({
    Title = "Auto Retry",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Retry_Dungeon or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Retry_Dungeon = state
    end
})

local Section = Pri:Section({ 
    Title = "Priority Menu",
})

Pri:Divider()

_G.Settings.One_Priority = "None"
_G.Settings.Two_Priority = "None"
_G.Settings.Three_Priority = "None"
_G.Settings.Four_Priority = "None"
_G.Settings.Five_Priority = "None"
_G.Settings.Six_Priority = "None"
_G.Settings.Seven_Priority = "None"

thingupsqq = {"None","Farm Level","Yuno","Litch"}

dropdowns["One_Priority"] = Pri:Dropdown({
    Title = "1 Priority",
    Desc = "select your first thing to do",
    Values = thingupsqq,
    Value = _G.Settings.One_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.One_Priority = option
    end
})

dropdowns["Two_Priority"] = Pri:Dropdown({
    Title = "2 Priority",
    Desc = "select your second thing to do",
    Values = thingupsqq,
    Value = _G.Settings.Two_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Two_Priority = option
    end
})

dropdowns["Three_Priority"] = Pri:Dropdown({
    Title = "3 Priority",
    Desc = "select your third thing to do",
    Values = thingupsqq,
    Value = _G.Settings.Three_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Three_Priority = option
    end
})

dropdowns["Four_Priority"] = Pri:Dropdown({
    Title = "4 Priority",
    Desc = "select your fourth thing to do",
    Values = thingupsqq,
    Value = _G.Settings.Four_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Four_Priority = option
    end
})

dropdowns["Five_Priority"] = Pri:Dropdown({
    Title = "5 Priority",
    Desc = "select your fifth thing to do",
    Values = thingupsqq,
    Value = _G.Settings.Five_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Five_Priority = option
    end
})

dropdowns["Six_Priority"] = Pri:Dropdown({
    Title = "6 Priority",
    Desc = "select your sixth thing to do",
    Values = thingupsqq,
    Value = _G.Settings.Six_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Six_Priority = option
    end
})

dropdowns["Seven_Priority"] = Pri:Dropdown({
    Title = "7 Priority",
    Desc = "select your seventh thing to do",
    Values = thingupsqq,
    Value = _G.Settings.Seven_Priority or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Seven_Priority = option
    end
})

local Section = Stats:Section({ 
    Title = "Priority Menu",
})

Stats:Divider()

toggles["Auto_Stats_Melee"] = Stats:Toggle({
    Title = "Auto Stats Melee",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Stats_Melee or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Stats_Melee = state
    end
})

spawn(function()
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Stats_Melee then
local args = {
	"Melee",
	99
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack(args))
end 
end)
end
end)

toggles["Auto_Stats_Blade"] = Stats:Toggle({
    Title = "Auto Stats Blade",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Stats_Blade or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Stats_Blade = state
    end
})

spawn(function()
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Stats_Blade then
local args = {
	"Blade",
	99
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack(args))
end 
end)
end
end)

toggles["Auto_Stats_Magic"] = Stats:Toggle({
    Title = "Auto Stats Magic",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Stats_Magic or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Stats_Magic = state
    end
})

spawn(function()
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Stats_Magic then
local args = {
	"Magic",
	99
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack(args))
end 
end)
end
end)

toggles["Auto_Stats_Mana"] = Stats:Toggle({
    Title = "Auto Stats Mana",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Stats_Mana or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Stats_Mana = state
    end
})

spawn(function()
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Stats_Mana then
local args = {
	"Mana",
	99
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack(args))
end 
end)
end
end)

toggles["Auto_Stats_Defense"] = Stats:Toggle({
    Title = "Auto Stats Defense",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Stats_Defense or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Stats_Defense = state
    end
})

spawn(function()
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Stats_Defense then
local args = {
	"Defense",
	99
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack(args))
end 
end)
end
end)

function sendwebhook(values)

if _G.Settings.Webhook_Link ~= "" then
                pcall(function()
local url = _G.Settings.Webhook_Link
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
    Value = _G.Settings.Webhook_Notify or {"Aura Crate"} ,
    Multi = true,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Webhook_Notify = option
    end
})

if _G.Settings.Webhook_Link == nil then
_G.Settings.Webhook_Link = ""
end

inputs["Webhook_Link"] = Webhook:Input({
    Title = "Discord Webhook Link",
    Desc = "",
    Value = _G.Settings.Webhook_Link,
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter Your Link",
    Callback = function(input) 
        _G.Settings.Webhook_Link = input
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
    Value = _G.Settings.Send_Webhook or false, -- default value
    Callback = function(state) 
        _G.Settings.Send_Webhook = state
    end
})

inputs["Pings_Userid"] = Webhook:Input({
    Title = "Discord Userid",
    Desc = "put your discord id",
    Value = _G.Settings.Pings_Userid or "",
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "e.g. 12345678",
    Callback = function(input) 
        _G.Settings.Pings_Userid = input
        if _G.Settings.Send_Webhook_Pings then
            popathing = "<@".._G.Settings.Pings_Userid..">"
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
    Value = _G.Settings.Send_Webhook_Pings or false, -- default value
    Callback = function(state) 
        _G.Settings.Send_Webhook_Pings = state
        if _G.Settings.Send_Webhook_Pings then
            popathing = "<@".._G.Settings.Pings_Userid..">"
            else
                popathing = ""
        end
    end
})

if _G.Settings.Send_Webhook_Pings then
            popathing = "<@".._G.Settings.Pings_Userid..">"
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
    Value = _G.Settings.Screen_cpu or "Black" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Screen_cpu = option
        if _G.Settings.Screen_cpu == "Black" then
FullScreenFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
elseif _G.Settings.Screen_cpu == "White" then
FullScreenFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        end
    end
})

toggles["Screen_CPUStart"] = Misc:Toggle({
    Title = "Reduce Cpu",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Screen_CPUStart or false, -- default value
    Callback = function(state) 
        _G.Settings.Screen_CPUStart = state
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
FullScreenFrame.Visible = _G.Settings.Screen_CPUStart
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
FullScreenFrame.Visible = _G.Settings.Screen_CPUStart
    end)
end
end)

local Button = Settings:Button({
    Title = "Save Main Config",
    Desc = "",
    Locked = false,
    Callback = function()
SaveConfig(GetConfigPath())
    end
})

if _G.Settings.Auto_Rejoin == nil then
_G.Settings.Auto_Rejoin = true
end

if _G.Settings.Auto_Execute == nil then
_G.Settings.Auto_Execute = true
end

toggles["Auto_Rejoin"] = Settings:Toggle({
    Title = "Auto Rejoin",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Rejoin, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Rejoin = state
        function missing(t, f, fallback)
	if type(f) == t then return f end
	return fallback
end

queueteleport =  missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport))
inqueue = true

if _G.Settings.Auto_Rejoin then
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
wait(2)
if _G.Settings.Send_Webhook_Pings then
sendwebhook("You've Got Kicked!")
end
if inqueue and _G.Settings.Auto_Execute then
queueteleport("task.wait(10) loadstring(game:HttpGet('https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua'))()")
inqueue = false
end
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
    Value = _G.Settings.Auto_Execute, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Execute = state
    end
})


configall = {}

if isfolder("AxelConfig_CO") then
for i,v in pairs(listfiles("AxelConfig_CO")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_CO")
end

inputs["Config_Name"] = Settings:Input({
    Title = "Config Name",
    Desc = "Input your config name",
    Value = "",
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "e.g. FarmBoss",
    Callback = function(input) 
        Config_Name = input
    end
})

local Button = Settings:Button({
    Title = "Create Config",
    Desc = "",
    Locked = false,
    Callback = function()
if not isfile("AxelConfig_CO/"..Config_Name..".JSON") then
    writefile("AxelConfig_CO/"..Config_Name..".JSON", "")
end
    end
})

local DropdownConfig = Settings:Dropdown({
    Title = "Config Saver",
    Desc = "",
    Values = configall,
    Value = "" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        Config_Select = option
    end
})

local Button = Settings:Button({
    Title = "Refresh Config",
    Desc = "",
    Locked = false,
    Callback = function()
configall = {}

if isfolder("AxelConfig_CO") then
for i,v in pairs(listfiles("AxelConfig_CO")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_CO")
end

DropdownConfig:Refresh(configall)
    end
})

local Button = Settings:Button({
    Title = "Delete Config",
    Desc = "",
    Locked = false,
    Callback = function()
delfile("AxelConfig_CO/"..Config_Select)
    end
})

_G.DefaultSettings = {
            Auto_Farm_Level = false,
            Auto_Dun_Retry = false,
            Auto_Timed_Boss = false
        }

local Button = Settings:Button({
    Title = "Save Config",
    Desc = "",
    Locked = false,
    Callback = function()
if not isfile("AxelConfig_CO/"..Config_Select) then
    writefile("AxelConfig_CO/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
else

SaveConfig("AxelConfig_CO/"..Config_Select)
end
    end
})

local Button = Settings:Button({
    Title = "Load Config",
    Desc = "",
    Locked = false,
    Callback = function()

prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_CO/"..Config_Select))

for i,v in pairs(prop) do
    pcall(function()
    if v == true or v == false then
        if i ~= "Auto_Rejoin" and i ~= "Auto_Execute" then
    toggles[i]:Set(v)
        end
    elseif tonumber(v) ~= nil then
    slides[i]:Set(v)
    elseif i == "Webhook_Link" then
    inputs[i]:Set(v)
    else
    dropdowns[i]:Select(v)
    end
    end)
end
    end
})

local InstantTurnEverythingOff = Settings:Button({
    Title = "Instant Turn Everything Off",
    Desc = "",
    Locked = false,
    Callback = function()
prop = game:service('HttpService'):JSONDecode(readfile(GetConfigPath()))

for i,v in pairs(prop) do
    pcall(function()
    if i ~= "Bypass_Tp" and i ~= "Auto_Rejoin" and i ~= "Auto_Execute" and v == true then
    toggles[i]:Set(false)
    end
    end)
end
    end
})

function checkquest()
if workspace:FindFirstChild("Chests") then
for i,v in pairs(workspace.Chests.Chests:GetChildren()) do
    if v.ClassName == "Model" and v:FindFirstChild("RootPart") then
return true
    end
end
end
return false
end

function auto_chest()
if _G.Settings.Auto_Chest then
if checkquest() then
for i,v in pairs(workspace.Chests.Chests:GetChildren()) do
    if v.ClassName == "Model" and v:FindFirstChild("RootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.RootPart.CFrame
        for i2,v2 in pairs(v:GetChildren()) do
            if v2.ClassName == "ProximityPrompt" then
                print(v2)
        fireproximityprompt(v2)
        return true
            end
        end
    end
end
elseif not checkquest() then
    return false
end
end
return false
end

function Auto_Farm_Level()
if _G.Settings.Auto_Farm_Level then
    checklevel2()
if game:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.Visible then
    if string.find(game:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.LabelTittle.LabelTittle.Text, monsname) then
for i,v in pairs(workspace.Npcs:GetChildren()) do
    if v.Name == monsname and v.Humanoid.Health > 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
    end
end
elseif not string.find(game:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.LabelTittle.LabelTittle.Text, monsname) then
local args = {
	"cancel"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Quests"):FireServer(unpack(args))

end
elseif game:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.Visible == false then
local args = {
	"giveQuest",
	questname
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Quests"):FireServer(unpack(args))
end
    end
end

function Auto_Werewolf()
if _G.Settings.Auto_Werewolf then
for i,v in pairs(workspace.Npcs:GetChildren()) do
	if v.Name == "Wolf" or v.Name == "Werewolf" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
	end
end
end
return false
end

function Auto_Litch()
if _G.Settings.Auto_Litch and world1 then
if workspace.Npcs:FindFirstChild("Litch") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Litch.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
else
return false
end
end
return false
end

function Auto_Santoryu_Vermillion()
if _G.Settings.Auto_Santoryu_Vermillion then
if workspace.Npcs:FindFirstChild("Santoryu Vermillion") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs["Santoryu Vermillion"].HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
else
return false
end
end
return false
end

function Auto_Yuno()
if _G.Settings.Auto_Yuno then
if workspace.Npcs:FindFirstChild("Yuno") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Yuno.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
else
return false
end
end
return false
end

function Auto_Noelle()
if _G.Settings.Auto_Noelle then
if workspace.Npcs:FindFirstChild("Noelle") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Noelle.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
else
return false
end
end
return false
end

function Auto_Luck()
if _G.Settings.Auto_Luck then
if workspace.Npcs:FindFirstChild("Luck") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Luck.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
else
return false
end
end
return false
end

function Auto_Asta()
if _G.Settings.Auto_Asta then
if workspace.Npcs:FindFirstChild("Asta") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Asta.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
else
return false
end
end
return false
end

function Auto_Yami()
if _G.Settings.Auto_Yami then
if workspace.Npcs:FindFirstChild("Yami") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Yami.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
return true
else
return false
end
end
return false
end

function checkgrimore()
local a = game:GetService("Players").LocalPlayer.PlayerGui.GrimoireSpins.Frame.Frame.LabelGrimoire.Label1
for i,v in pairs(_G.Settings.Grimoires_Select) do
if a.Text == v then
return true
end
end
return false
end

function priority_checker(prio)
if prio == "Farm Level" then
if Auto_Farm_Level() then return true end
elseif prio == "Yuno" then
if Auto_Yuno() then return true end
elseif prio == "Litch" then
if Auto_Litch() then return true end
elseif prio == "None" then
if Auto_Werewolf() then return true end
if Auto_Santoryu_Vermillion() then return true end
if Auto_Noelle() then return true end
if Auto_Yami() then return true end
if Auto_Asta() then return true end
if Auto_Luck() then return true end
if Auto_Litch() then return true end
if Auto_Yuno() then return true end
if auto_chest() then return true end
if Auto_Farm_Level() then return true end
return true
end
return false
end

spawn(function()
while task.wait() do
    pcall(function()
    if priority_checker(_G.Settings.One_Priority) then return end
    if priority_checker(_G.Settings.Two_Priority) then return end
    if priority_checker(_G.Settings.Three_Priority) then return end
    if priority_checker(_G.Settings.Four_Priority) then return end
    if priority_checker(_G.Settings.Five_Priority) then return end
    if priority_checker(_G.Settings.Six_Priority) then return end
    if priority_checker(_G.Settings.Seven_Priority) then return end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_ManaSense then
if game:GetService("Players").LocalPlayer.PlayerGui.ManaSense.Enabled then
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.ManaSense.Frame.ActiveCircle
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
else
if game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.Enabled then
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.Frame.Side.Accept.Trigger
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-462.414856, 39.2215767, -1478.33899, -0.759834111, 0, 0.650117159, 0, 1, 0, -0.650117159, 0, -0.759834111)
fireproximityprompt(workspace.Interactives.ManaSense.Interact)
end
end
end
        end)
end
end)

attackhold = true

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Kill_Aura or _G.Settings.Auto_Dungeon or _G.Settings.Auto_Farm_Level or _G.Settings.Auto_Litch or _G.Settings.Auto_Yuno then
attackhold = true
task.wait(_G.Cooldown_Disable)
attackhold = false
task.wait(2)
end

        end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Kill_Aura or _G.Settings.Auto_Dungeon or _G.Settings.Auto_Farm_Level or _G.Settings.Auto_Litch or _G.Settings.Auto_Yuno then
attacknearest()
attacking = true
if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Selected_Weapon) then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Selected_Weapon))
end
else
attacking=false
end

        end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
if Noclip or _G.Settings.Auto_Farm_Level or _G.Settings.Auto_Yuno or _G.Settings.Auto_Litch then
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
while task.wait() do
pcall(function()
if attacking then
if workspace:FindFirstChild("Effects") then
workspace.Effects.Parent = game:GetService("ReplicatedStorage")
end
elseif not attacking then
    if game:GetService("ReplicatedStorage"):FindFirstChild("Effects") then
game:GetService("ReplicatedStorage").Effects.Parent = workspace
end
end
end)
end
end)

spawn(function()
while task.wait(3) do
pcall(function()
if _G.Settings.Auto_Join_Rift and world1 then
for i,v in pairs(workspace:GetChildren()) do
	if v.Name == "TimeRiftBubble" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
task.wait(1)
fireproximityprompt(v.PromptHolder.ProximityPrompt)
	end
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Grimoires then
if game:GetService("Players").LocalPlayer.PlayerGui.GrimoireSpins.Enabled == false then
    if game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.Enabled then
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.Frame.Side.Accept.Trigger
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(753.548035, 13.6261683, -695.656982, 0.409679413, -0, -0.912229657, 0, 1, -0, 0.912229657, 0, 0.409679413)
fireproximityprompt(workspace.Interactives.Wizard.Interact)
    end
else
if checkgrimore() then
print(true)
else
local args = {
	"Grimoire"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spins"):FireServer(unpack(args))
end
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Dungeon and dungeon then
for i,v in pairs(workspace.Npcs:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
    end
end
end
end)
end
end)

function checkmonss()
for i,v in pairs(workspace.Npcs:GetChildren()) do
if v and v.Humanoid.Health > 0 then
return true
end
end
return false
end

function checkdoordun()
for i,v in pairs(workspace.mapa:GetChildren()) do
	if v.Name == "portão" then
return true
	end
end
return false
end

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Retry_Dungeon and dungeon and game:GetService("Players").LocalPlayer.PlayerGui.Dungeon.Rewards.Visible then
local args = {
	"RepeatDungeon"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dungeon"):FireServer(unpack(args))
doornowfiredun = 1
task.wait(.5)
end
end)
end
end)

doornowfiredun = 1

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Dungeon and dungeon then
	if not checkmonss() and checkdoordun() then
		if doornowfiredun == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-288.89621, 3.24687624, 182.450546, -0.993048012, -9.43622283e-08, -0.11771024, -9.21354797e-08, 1, -2.43588065e-08, 0.11771024, -1.33441747e-08, -0.993048012)
doornowfiredun = doornowfiredun + 1
task.wait(2)
elseif doornowfiredun == 2 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.1228313, 23.448391, 397.848541, -0.0602148362, -6.30728803e-10, -0.998185456, 2.07433377e-08, 1, -1.8832027e-09, 0.998185456, -2.0819094e-08, -0.0602148362) * CFrame.new(math.random(0,5),0,math.random(0,5))
doornowfiredun = doornowfiredun + 1
task.wait(2)
elseif doornowfiredun == 3 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(429.42276, 27.9519386, 432.702972, -0.514482498, 1.15381171e-08, -0.857500851, -1.24256427e-08, 1, 2.09106403e-08, 0.857500851, 2.14131575e-08, -0.514482498)
doornowfiredun = doornowfiredun + 1
task.wait(3)
elseif doornowfiredun == 4 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(834.799011, 34.5948982, 437.292603, 0.812706232, 1.5390583e-08, 0.582673669, -3.31696981e-08, 1, 1.98509706e-08, -0.582673669, -3.54601184e-08, 0.812706232)
doornowfiredun = 1
task.wait(2)
		end
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Dungeon and dungeon then
	if not checkmonss() then
for i,v in pairs(workspace:GetChildren()) do
	if string.find(v.Name, "Portal") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
task.wait(.5)
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
if _G.Settings.Auto_Second_Sea and world1 then
local text = game:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].FrameBars.HUD.LabelLevel.TextLabel.Text
local currenthp = tonumber(parseLevel(text))
if currenthp > 4000 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-756.013306, 222.335785, 6112.77637, 0.193625316, -5.19363219e-09, -0.981075525, 1.78500403e-09, 1, -4.94152586e-09, 0.981075525, -7.94419253e-10, 0.193625316)
if workspace:FindFirstChild("Traveller Clover Kingdom") then
fireproximityprompt(workspace["Traveller Clover Kingdom"].CloverKingdomTP)
end
end
end
end)
end
end)

spawn(function()
while task.wait(120) do
pcall(function()
    local X, Y = 0, 0
local VirtualInputManager = game:GetService("VirtualInputManager")
local rand = nil

VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
end)
end
end)

        end
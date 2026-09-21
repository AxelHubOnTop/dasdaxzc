--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

if not axel_loaded then 

axel_loaded = true

Premiums = false

local BaseURL = "https://new.pandadevelopment.net/api/v1"
local Client_ServiceID = "axelhub2"

-- Get Hardware ID
local function getHardwareId()
    local success, hwid = pcall(gethwid)
    if success and hwid then
        return hwid
    end

    -- Fallback to analytics client ID
    local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
    local clientId = tostring(RbxAnalyticsService:GetClientId())
    return clientId:gsub("-", "")
end

-- HTTP Request wrapper
local function makeRequest(endpoint, body)
    local HttpService = game:GetService("HttpService")

    local url = BaseURL .. endpoint
    local jsonBody = HttpService:JSONEncode(body)

    local response = request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = jsonBody
    })

    if response and response.Body then
        return HttpService:JSONDecode(response.Body)
    end

    return nil
end

--[[
    Get Key URL - Opens the key system page
    @return string - The URL to get a key
]]
function GetKeyURL()
    local hwid = getHardwareId()
    return "https://new.pandadevelopment.net/getkey/" .. Client_ServiceID .. "?hwid=" .. hwid
end

--[[
    Open Get Key page in browser
]]
function OpenGetKey()
    local url = GetKeyURL()
    if setclipboard then
        setclipboard(url)
        print("Key URL copied to clipboard: " .. url)
    end
    return url
end

--[[
    Validate a key
    @param key string - The license key to validate
    @param Premium_Verification boolean (optional) - If true, requires the key to be premium
    @return table - { success: boolean, message: string, isPremium: boolean, expireDate: string|nil }
]]
function Validate(key, Premium_Verification)
    local hwid = getHardwareId()

    local result = makeRequest("/keys/validate", {
        ServiceID = Client_ServiceID,
        HWID = hwid,
        Key = key
    })

    if not result then
        return {
            success = false,
            message = "Failed to connect to server",
            isPremium = false,
            expireDate = nil
        }
    end

    local isAuthenticated = result.Authenticated_Status == "Success"
    local isPremium = result.Key_Premium or false

    -- If Premium_Verification is enabled, require both authentication AND premium status
    local isValid = isAuthenticated
    local message = result.Note or (isAuthenticated and "Key validated!" or "Invalid key")

    if Premium_Verification and isAuthenticated and not isPremium then
        isValid = false
        message = "Premium key required"
    end

    return {
        success = isValid,
        message = message,
        isPremium = isPremium,
        expireDate = result.Expire_Date
    }
end

function non_pre(key)
for i,v in pairs(Validate(key, false)) do
if i == "success" and v == true then
yes = true
return true
end
end
yes = false
return false
end

function pre(key)
for i,v in pairs(Validate(key, false)) do
if i == "isPremium" and v == true then
return true
end
end
return false
end

if _G.Key == nil then
_G.Key = ""
end

if non_pre(_G.Key) then
response = true
end

if response == nil then
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/keysystem.Lua"))()
local response = KeySystem:Init({
    Title = "AxelHub_Sailor_Key",
    Link = GetKeyURL(),
    Verify = function(key)
    if pre(key) then
	Premiums = true
    end
if non_pre(key) then
response = true
end
	return non_pre(key)
    end
})
end
if not response then 
if isfile("axelhub_sailor_key.key") then
delfile("axelhub_sailor_key.key")
    end
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Key Is Wrongs"
})
return 
end

if yes == false then
    if non_pre(key) == false then
if isfile("axelhub_sailor_key.key") then
delfile("axelhub_sailor_key.key")
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
if pre(key) then
	Premiums = true
end

repeat task.wait()
        until game:IsLoaded()

repeat task.wait()
        until game:GetService("Players").LocalPlayer.Character

repeat task.wait()
        until workspace:FindFirstChild("NPCs")

_G.DefaultSettings = {
            Auto_Farm_Level = false,
            Auto_Timed_Boss = false,
            Auto_Dun_Retry = false
        }

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_SAILORPIECE.JSON"

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
    return "AxelHub/"..userid.."_SAILORPIECE.JSON"
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
_G.Settings.Bypass_Tp = true
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
    Title = "Axel Hub",
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

if workspace:FindFirstChild("Sea2MapQuest") then
print("World 1 Has Been Loaded")
world1 = true
elseif workspace:FindFirstChild("PunchIsland") then
print("World 2 Has Been Loaded")
world2 = true
else
raid = true
end

local Section = Window:Section({
    Title = "Main",
    Icon = "door-open",
    Opened = true,
})

local Autos = Section:Tab({
    Title = "Automatic",
    Icon = "bot", -- optional
    Locked = false,
})

local Main = Section:Tab({
    Title = "Main",
    Icon = "door-open", -- optional
    Locked = false,
})

local Premium = Section:Tab({
    Title = "OP",
    Icon = "crown", -- optional
    Locked = false,
})

local Boss = Section:Tab({
    Title = "Boss",
    Icon = "skull", -- optional
    Locked = false,
})

local Dun = Section:Tab({
    Title = "Dungeon, Boss Rush",
    Icon = "bubbles", -- optional
    Locked = false,
})

if hopes then
local Tab = Section:Tab({
    Title = "Stats",
    Icon = "dna", -- optional
    Locked = false,
})
end

local Reroll = Section:Tab({
    Title = "Reroll",
    Icon = "loader-pinwheel", -- optional
    Locked = false,
})

local Craft = Section:Tab({
    Title = "Craft",
    Icon = "gavel", -- optional
    Locked = false,
})

local Shop = Section:Tab({
    Title = "Shop",
    Icon = "shopping-basket", -- optional
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
    Title = "0.3.1",
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

if workspace:FindFirstChild("StarterIsland_Sea2") then
workspace.StarterIsland_Sea2.Name = "StarterSea2Island"
end

spawn(function()
while task.wait() do
    pcall(function()
local args = {
	vector.create(-0.8187503814697266, 0, -0.5741497278213501),
	33,
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("DashRemote"):FireServer(unpack(args))
end)
end
end)

if world1 then
spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_join_world_2 then
local distance = (CFrame.new(-827.750549, 323.121277, -2245.47095, 0.928247869, 0.0141902715, 0.371691406, -0.0103288051, 0.999870062, -0.0123778386, -0.371818721, 0.0076505742, 0.928273797).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

if distance < 10 then
fireproximityprompt(workspace.WorldIsland.Model.Map.Door["Cube.003"].Sea2DoorPrompt)
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-827.750549, 323.121277, -2245.47095, 0.928247869, 0.0141902715, 0.371691406, -0.0103288051, 0.999870062, -0.0123778386, -0.371818721, 0.0076505742, 0.928273797)
end
    end
end)
end
end)
end

local Section = Main:Section({ 
    Title = "Main Menu",
})

Main:Divider()

local Section = Autos:Section({ 
    Title = "Haki",
})

Autos:Divider()

toggles["Auto_Haki"] = Autos:Toggle({
    Title = "Auto Haki",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Haki or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Haki = state
    end
})

toggles["Auto_Observation"] = Autos:Toggle({
    Title = "Auto Observation",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Observation or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Observation = state
    end
})

local Section = Autos:Section({ 
    Title = "Swap Build Menu",
})

Autos:Divider()

dropdowns["Main_Build"] = Autos:Dropdown({
    Title = "Main Build",
    Desc = "select your damage build.",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.Main_Build or "1" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Main_Build = option
    end
})

dropdowns["Luck_Build"] = Autos:Dropdown({
    Title = "Luck Build",
    Desc = "select your luck build.",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.Luck_Build or "1" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Luck_Build = option
    end
})

toggles["Auto_Swap_Build_When_Boss"] = Autos:Toggle({
    Title = "Auto Swap Build",
    Desc = "work on anyboss + sea serpent + kraken",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Swap_Build_When_Boss or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Swap_Build_When_Boss = state
    end
})

if _G.Settings.Boss_Threshold == nil then
_G.Settings.Boss_Threshold = 20
end

slides["Boss_Threshold"] = Autos:Slider({
    Title = "Boss Threshold (%) : ",
    Desc = "choose your boss threshold to make it swap your build",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.Settings.Boss_Threshold or 20,
    },
    Callback = function(value)
        _G.Settings.Boss_Threshold = value
    end
})

local weapons = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
        table.insert(weapons, v.Name)
    end
end

dropdowns["Swap_Weapon1"] = Autos:Dropdown({
    Title = "Weapon Selection 1",
    Desc = "select your weapon",
    Values = weapons,
    Value = _G.Settings.Swap_Weapon1 or "" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
_G.Settings.Swap_Weapon1 = option
    end
})

dropdowns["Swap_Weapon2"] = Autos:Dropdown({
    Title = "Weapon Selection 2",
    Desc = "select your weapon",
    Values = weapons,
    Value = _G.Settings.Swap_Weapon2 or "" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Swap_Weapon2 = option
    end
})

local RefreshWeapon1 = Autos:Button({
    Title = "Refresh Weapon List",
    Desc = "",
    Locked = false,
    Callback = function()
local weapons = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
        table.insert(weapons, v.Name)
    end
end

dropdowns["Swap_Weapon1"]:Refresh(weapons)
dropdowns["Swap_Weapon2"]:Refresh(weapons)
    end
})

dropdowns["Mode_Farm"] = Main:Dropdown({
    Title = "Position",
    Desc = "Position For Farming",
    Values = {"Above","Behind","Below"},
    Value = _G.Settings.Mode_Farm or "Above" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Mode_Farm = option
    end
})

slides["Disc"] = Main:Slider({
    Title = "Distance",
    Desc = "Distance Far From Mob",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 0,
        Max = 20,
        Default = _G.Settings.Disc or 5,
    },
    Callback = function(value)
        _G.Settings.Disc = value
    end
})

toggles["Bypass_Tp"] = Main:Toggle({
    Title = "Bypass Tp",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Bypass_Tp, -- default value
    Callback = function(state) 
        _G.Settings.Bypass_Tp = state
    end
})

slides["Tween_Speed"] = Main:Slider({
    Title = "Tween Speed",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 50,
        Max = 1000,
        Default = _G.Settings.Tween_Speed or 250,
    },
    Callback = function(value)
        _G.Settings.Tween_Speed = value
    end
})

function checklevel()
if _G.Settings.Auto_Farm_Level then
local level = game:GetService("Players").LocalPlayer.Data.Level.Value
if world1 then
if level < 100 then return "Quest 1"
    elseif level < 250 then return "Quest 2"
    elseif level < 500 then return "Quest 3"
    elseif level < 750 then return "Quest 4"
    elseif level < 1000 then return "Quest 5"
    elseif level < 1500 then return "Quest 6"
    elseif level < 2000 then return "Quest 7"
    elseif level < 3000 then return "Quest 8"
    elseif level < 4000 then return "Quest 9"
    elseif level < 5000 then return "Quest 10"
    elseif level < 6250 then return "Quest 11"
    elseif level < 7000 then return "Quest 12"
    elseif level < 8000 then return "Quest 13"
    elseif level < 9000 then return "Quest 14"
    elseif level < 10000 then return "Quest 15"
    elseif level < 10750 then return "Quest 16"
    elseif level < 11500 then return "Quest 17"
    elseif level < 12000 then return "Quest 18"
    elseif level < 99999 then return "Quest 19" 
    end
    elseif world2 then
    if level < 13000 then return "Quest 20" 
    elseif level < 13500 then return "Quest 21"
    elseif level < 14500 then return "Quest 22"
    elseif level < 16000 then return "Quest 23"
    elseif level < 18000 then return "Quest 24"
    elseif level < 99999 then return "Quest 25"
    end
    end
    elseif _G.Settings.Auto_Quest then
        return _G.Settings.Selected_Quest
    end
end

function checklevel2()
if checklevel() == "Quest 1" then
monname = "Thief"
island = "Starter"
questname = "QuestNPC1"
onlyacs = "Blonde Spiky Hair"
elseif checklevel() == "Quest 2" then
monname = "ThiefBoss"
island = "Starter"
questname = "QuestNPC2"
onlyacs = "Accessory (Shemagh_Scarf)"
elseif checklevel() == "Quest 3" then
monname = "Monkey"
island = "Jungle"
questname = "QuestNPC3"
onlyacs = "Monkey Tail"
elseif checklevel() == "Quest 4" then
monname = "MonkeyBoss"
island = "Jungle"
questname = "QuestNPC4"
onlyacs = "DevAwardsGold"
elseif checklevel() == "Quest 5" then
monname = "DesertBandit"
island = "Desert"
questname = "QuestNPC5"
onlyacs = "Accessory (Fashion scarf)"
elseif checklevel() == "Quest 6" then
monname = "DesertBoss"
island = "Desert"
questname = "QuestNPC6"
onlyacs = "Stubble"
elseif checklevel() == "Quest 7" then
monname = "FrostRogue"
island = "Snow"
questname = "QuestNPC7"
onlyacs = "MeshPartAccessory"
elseif checklevel() == "Quest 8" then
monname = "SnowBoss"
island = "Snow"
questname = "QuestNPC8"
onlyacs = "Accessory (Messy Boy Hair)"
elseif checklevel() == "Quest 9" then
monname = "Sorcerer"
island = "Shibuya"
questname = "QuestNPC9"
onlyacs = "FluffedHair"
elseif checklevel() == "Quest 10" then
monname = "PandaMiniBoss"
island = "Shibuya"
questname = "QuestNPC10"
onlyacs = "Panda Ears"
elseif checklevel() == "Quest 11" then
monname = "Hollow"
island = "Hollow"
questname = "QuestNPC11"
onlyacs = "Humanoid"
elseif checklevel() == "Quest 12" then
monname = "StrongSorcerer"
island = "Shinjuku"
questname = "QuestNPC12"
onlyacs = "BlueShirtCollar"
elseif checklevel() == "Quest 13" then
monname = "Curse"
island = "Shinjuku"
questname = "QuestNPC13"
onlyacs = "Humanoid"
elseif checklevel() == "Quest 14" then
monname = "Slime"
island = "Slime"
questname = "QuestNPC14"
onlyacs = "Longcoat"
elseif checklevel() == "Quest 15" then
monname = "AcademyTeacher"
island = "Academy"
questname = "QuestNPC15"
onlyacs = " Spicky Man Hair Blonde"
elseif checklevel() == "Quest 16" then
monname = "Swordsman"
island = "Judgement"
questname = "QuestNPC16"
onlyacs = "Anime Hero Green"
elseif checklevel() == "Quest 17" then
monname = "Quincy"
island = "SoulDominion"
questname = "QuestNPC17"
onlyacs = "Accessory (MeshPartAccessory)"
elseif checklevel() == "Quest 18" then
monname = "Ninja"
island = "Ninja"
questname = "QuestNPC18"
onlyacs = "SniperMask"
elseif checklevel() == "Quest 19" then
monname = "ArenaFighter"
island = "Lawless"
questname = "QuestNPC19"
onlyacs = "Left Royal Knightly Shoulderguard"
elseif checklevel() == "Quest 20" then
monname = "Delinquent"
island = "StarterSea2"
questname = "QuestNPC20"
onlyacs = "NerdHair"
elseif checklevel() == "Quest 21" then
monname = "StrongFighter"
island = "StarterSea2"
questname = "QuestNPC21"
onlyacs = "faceless 4"
elseif checklevel() == "Quest 22" then
monname = "StrongBandit"
island = "Bizarre"
questname = "QuestNPC22"
onlyacs = "Black Bandana"
elseif checklevel() == "Quest 23" then
monname = "FastNinja"
island = "Punch"
questname = "QuestNPC23"
onlyacs = "Humanoid"
elseif checklevel() == "Quest 24" then
monname = "SpiritFighter"
island = "BluePlanet"
questname = "QuestNPC24"
onlyacs = "Humanoid"
elseif checklevel() == "Quest 25" then
monname = "StrongSlayer"
island = "Slayer"
questname = "QuestNPC25"
onlyacs = "Humanoid"
end
    end

toggles["Auto_Farm_Level"] = Main:Toggle({
    Title = "Auto Farm Level",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Farm_Level or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Farm_Level = state
local args = {
	"repeatable"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("QuestAbandon"):FireServer(unpack(args))

    end
})

dropdowns["Selected_Quest"] = Main:Dropdown({
    Title = "Quest Selection",
    Desc = "",
    Values = {"Quest 1","Quest 2","Quest 3","Quest 4","Quest 5","Quest 6","Quest 7","Quest 8","Quest 9","Quest 10","Quest 11","Quest 12","Quest 13","Quest 14","Quest 15","Quest 16","Quest 17","Quest 18","Quest 19","Quest 20","Quest 21","Quest 22","Quest 23","Quest 24","Quest 25"},
    Value = _G.Settings.Selected_Quest or "" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Quest = option
        local args = {
	"repeatable"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("QuestAbandon"):FireServer(unpack(args))

    end
})

toggles["Auto_Quest"] = Main:Toggle({
    Title = "Auto Farm Quest",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Quest or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Quest = state
        local args = {
	"repeatable"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("QuestAbandon"):FireServer(unpack(args))

    end
})

function contains(table, value)
	for i, v in pairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

island_table = {"Starter","Jungle","Desert","Snow","Shibuya","Hollow","Shinjuku","Slime","Academy","Judgement","SoulDominion","Ninja","Lawless","Easter","StarterSea2","StarterSea22","Bizarre","Punch","BluePlanet","Slayer"}

old_island = ""

dropdowns["island_selection"] = Main:Dropdown({
    Title = "Multi Island Selection",
    Desc = "Select Island To Farm",
    Values = island_table,
    Value = _G.Settings.island_selection or { "Starter" },
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.island_selection = option
    end
})

local weapons = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
        table.insert(weapons, v.Name)
    end
end

dropdowns["Weapon_Selected"] = Main:Dropdown({
    Title = "Weapon",
    Desc = "Select Your Weapon To Equip",
    Values = weapons,
    Value = _G.Settings.Weapon_Selected or "" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Weapon_Selected = option
    end
})

dropdowns["Weapon_Selected2"] = Main:Dropdown({
    Title = "Weapon 2",
    Desc = "Select Your Weapon To Equip",
    Values = weapons,
    Value = _G.Settings.Weapon_Selected2 or "" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Weapon_Selected2 = option
    end
})

local RefreshWeapon1 = Main:Button({
    Title = "Refresh Weapon List",
    Desc = "",
    Locked = false,
    Callback = function()
local weapons = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
        table.insert(weapons, v.Name)
    end
end

dropdowns["Weapon_Selected"]:Refresh(weapons)
dropdowns["Weapon_Selected2"]:Refresh(weapons)
    end
})

if _G.Settings.Cooldown_Hopes == nil then
_G.Settings.Cooldown_Hopes = 1.2
end

slides["Cooldown_Hopes"] = Main:Slider({
    Title = "Delay Between Island",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 5,
        Default = _G.Settings.Cooldown_Hopes or 1.2,
    },
    Callback = function(value)
        _G.Settings.Cooldown_Hopes = value
    end
})

toggles["Auto_Farm"] = Main:Toggle({
    Title = "Start Farm Multi Island",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Farm or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Farm = state
        if _G.Settings.Auto_Farm == false then
        hop1 = 0
        elseif _G.Settings.Auto_Farm == true then
            hop1 = 1
        end
    end
})

toggles["Auto_Equip"] = Main:Toggle({
    Title = "Auto Equip",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Equip or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Equip = state
        if _G.Settings.Auto_Farm == false then
        hop1 = 0
        elseif _G.Settings.Auto_Farm == true then
            hop1 = 1
        end
    end
})

toggles["Swap_Tool"] = Main:Toggle({
    Title = "Auto Swap Tool",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Swap_Tool or false, -- default value
    Callback = function(state) 
        _G.Settings.Swap_Tool = state
    end
})

local Section = Main:Section({ 
    Title = "Attack Function",
})

Main:Divider()

dropdowns["skill_selected"] = Main:Dropdown({
    Title = "Skill",
    Desc = "Select skill to use",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.skill_selected or {"1"} ,
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.skill_selected = option
    end
})

toggles["Auto_Attack"] = Main:Toggle({
    Title = "Auto Attack",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Attack or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Attack = state
    end
})

toggles["Auto_Skill"] = Main:Toggle({
    Title = "Auto Skill",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Skill or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Skill = state
    end
})

dropdowns["skill_selecteds"] = Main:Dropdown({
    Title = "OnlyBoss Skill",
    Desc = "Select skill to use on boss",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.skill_selecteds or {"1"} ,
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.skill_selecteds = option
    end
})

toggles["Only_Skill_Boss"] = Main:Toggle({
    Title = "Skill On Boss",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Only_Skill_Boss or false, -- default value
    Callback = function(state) 
        _G.Settings.Only_Skill_Boss = state
    end
})

spawn(function()
while task.wait(.1) do
    pcall(function()
    if bro then
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name, "Hogyoku") and v:FindFirstChild("HogyokuCollectPrompt") then
            distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < 5 then
            fireproximityprompt(v.HogyokuCollectPrompt,20)
            end
        end
    end
    end
end)
end
end)

local Section = Main:Section({ 
    Title = "Misc Function",
})

Main:Divider()

local redeemallcode = Main:Button({
    Title = "Redeem All Code",
    Desc = "",
    Locked = false,
    Callback = function()
local allcode = {"THEBIG1BVISITSTYYYYY","1MLIKESWOAHHH","ANTIMAGICUPDATE","CRYSTALDEFENSE","600KFAVORITES","BIGUPDATENEXTSOONN","TYFOR250KFOLLOWEVENT","SORRYFORTHETRADELOCKSS","SPECBUFFS","CODEFORTHERESTARTSORRY"}

for i,v in pairs(allcode) do
local args = {
	v
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("CodeRedeem"):InvokeServer(unpack(args))
end
    end
})

local unlocksoul = Main:Button({
    Title = "Unlock Soul Society In Button",
    Desc = "",
    Locked = false,
    Callback = function()
    bro = true
        local args = {
	"Hollow"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(.2)
goto(CFrame.new(-379.570282, 8.73462963, 1529.37817, 0.39499855, 0, 0.9186818, 0, 1, 0, -0.9186818, 0, 0.39499855
), _G.Settings.Tween_Speed)
task.wait(2)
fireproximityprompt(workspace.ServiceNPCs.HogyokuQuestNPC.HumanoidRootPart.HogyokuQuestPrompt,20)
task.wait(2)
goto(CFrame.new(-636.008423, 22.5490417, 1206.28113, 0.923217237, -0.345339119, 0.16855523, 0.381866992, 0.873522758, -0.301886827, -0.0429835021, 0.343072802, 0.938324809
), _G.Settings.Tween_Speed)
task.wait(2)
fireproximityprompt(workspace.HogyokuFragment3.HogyokuCollectPrompt,20)
task.wait(2)
local args = {
	"Snow"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(2)
goto(CFrame.new(-424.589447, 56.6024628, -1235.32568, 0.289153755, 0.168311402, 0.942370117, -0.00750803947, 0.984790444, -0.173584118, -0.957253277, 0.0431171507, 0.286019504
), _G.Settings.Tween_Speed)
task.wait(2)
fireproximityprompt(workspace.HogyokuFragment1.HogyokuCollectPrompt,20) 
task.wait(2)
local args = {
	"Judgement"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(2)
goto(CFrame.new(-906.39801, 15.7299957, -1260.2478, 0.990366459, -0, -0.138471082, 0, 1, -0, 0.138471082, 0, 0.990366459
), _G.Settings.Tween_Speed)
task.wait(2)
fireproximityprompt(workspace.HogyokuFragment6.HogyokuCollectPrompt,20)
task.wait(2)
local args = {
	"Shibuya"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(2)
goto(CFrame.new(1636.70898, 85.5206757, 247.291901, 0.989795089, -0, -0.142497987, 0, 1, -0, 0.142497987, 0, 0.989795089
), _G.Settings.Tween_Speed)
task.wait(2)
fireproximityprompt(workspace.HogyokuFragment2.HogyokuCollectPrompt,20)
task.wait(2)
local args = {
	"Slime"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(2)
goto(CFrame.new(-1206.52283, 30.8849335, 463.206787, 0.993406057, -0.0171359815, 0.113360971, -0.00357546285, 0.983655572, 0.180024818, -0.114593059, -0.179243073, 0.977108181
), _G.Settings.Tween_Speed)
task.wait(2)
fireproximityprompt(workspace.HogyokuFragment5.HogyokuCollectPrompt,20)
task.wait(2)
local args = {
	"Shinjuku"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(2)
goto(CFrame.new(648.099976, 137.94455, -2069.59741, 0.772088885, -0.631137073, 0.0744634345, 0.628663361, 0.775662899, 0.0559423678, -0.0930658206, 0.00361994654, 0.995653391
), _G.Settings.Tween_Speed)
task.wait(2)
fireproximityprompt(workspace.HogyokuFragment4.HogyokuCollectPrompt,20)
bro = false
    end
})

local unlockworld2 = Main:Button({
    Title = "Auto Find Ancient Fragment",
    Desc = "",
    Locked = false,
    Callback = function()
for i2,v2 in pairs(workspace:GetChildren()) do
    if string.find(v2.Name, "Station") or string.find(v2.Name, "Island") then
        for i3,v3 in pairs(v2:GetChildren()) do
            if string.find(v3.Name, "Spawn") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(v3.WorldPivot))
            task.wait(1)
for i,v in pairs(workspace.Sea2MapQuest.SpawnPoints:GetChildren()) do
    if v.ClassName == "Part" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        task.wait(1)
        if workspace.Sea2MapQuest:FindFirstChild("MapFragment_Ancient Fragment") then
            local dis = (workspace.Sea2MapQuest:WaitForChild("MapFragment_Ancient Fragment").Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if dis < 30 then
        fireproximityprompt(workspace.Sea2MapQuest:WaitForChild("MapFragment_Ancient Fragment").ProximityPrompt)
        end
        end
        task.wait(1)
        v:Destroy()
    end
end
            end
        end
    end
end

    end
})

local Section = Premium:Section({ 
    Title = "OP Function",
})

Premium:Divider()

if _G.Settings.Cooldown_Hope == nil then
_G.Settings.Cooldown_Hope = 1.2
end

slides["Cooldown_Hope"] = Premium:Slider({
    Title = "Delay Between Island",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 5,
        Default = _G.Settings.Cooldown_Hope or 1.2,
    },
    Callback = function(value)
        _G.Settings.Cooldown_Hope = value
    end
})

toggles["Auto_All_Map"] = Premium:Toggle({
    Title = "All Map Farming",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_All_Map or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_All_Map = state
    end
})

toggles["OP_Boss"] = Premium:Toggle({
    Title = "Also Get Boss On Op Farming",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.OP_Boss or false, -- default value
    Callback = function(state) 
        _G.Settings.OP_Boss = state
    end
})

toggles["OP_METHOD"] = Premium:Toggle({
    Title = "OP Farming (GET KICKED SOMETIMES)",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.OP_METHOD or false, -- default value
    Callback = function(state) 
        _G.Settings.OP_METHOD = state
        OP_Method2 = state
        otherthingop = state
    end
})

if _G.Settings.Delay_Between_Island_OP == nil then
_G.Settings.Delay_Between_Island_OP = 0
end

slides["Delay_Between_Island_OP"] = Premium:Slider({
    Title = "Delay (OP FARMING)",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 5,
        Default = _G.Settings.Delay_Between_Island_OP or 0,
    },
    Callback = function(value)
        _G.Settings.Delay_Between_Island_OP = value
    end
})

if _G.Settings.OP_METHOD == true then
OP_Method2 = true
otherthingop = true
end

toggles["Island_Remover"] = Premium:Toggle({
    Title = "Island Remover",
    Desc = "Only Use with Op Farming",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Island_Remover or false, -- default value
    Callback = function(state) 
        _G.Settings.Island_Remover = state
        if _G.Settings.Island_Remover then
for i,v in pairs(workspace:GetChildren()) do
    if not game:GetService("ReplicatedStorage"):FindFirstChild("IslandKeeper") then
a = Instance.new("Folder")
a.Name = "IslandKeeper"
a.Parent = game:GetService("ReplicatedStorage")
end
    if string.find(v.Name, "Island") or string.find(v.Name, "Station") then
    v.Parent = a
    end
end
elseif not _G.Settings.Island_Remover then
    if game:GetService("ReplicatedStorage"):FindFirstChild("IslandKeeper") then
for i,v in pairs(game:GetService("ReplicatedStorage"):FindFirstChild("IslandKeeper"):GetChildren()) do
    if string.find(v.Name, "Island") or string.find(v.Name, "Station") then
    v.Parent = workspace
end
end
        end
end
    end
})

local Section = Premium:Section({ 
    Title = "OP Function Pauser",
})

Premium:Divider()

toggles["RESETCHAR"] = Premium:Toggle({
    Title = "Reset Character Every 5 Minutes",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.RESETCHAR or false, -- default value
    Callback = function(state) 
        _G.Settings.RESETCHAR = state
    end
})

if _G.Settings.Pause_Every == nil then
_G.Settings.Pause_Every = 15
end

if _G.Settings.Pause_For == nil then
_G.Settings.Pause_For = 3
end

slides["Pause_Every"] = Premium:Slider({
    Title = "Pause Every (s) : ",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 5,
        Max = 30,
        Default = _G.Settings.Pause_Every or 15,
    },
    Callback = function(value)
        _G.Settings.Pause_Every = value
    end
})

slides["Pause_For"] = Premium:Slider({
    Title = "Pause For : ",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 10,
        Default = _G.Settings.Pause_For or 3,
    },
    Callback = function(value)
        _G.Settings.Pause_For = value
    end
})

toggles["OFFTHEOP"] = Premium:Toggle({
    Title = "Pause OP",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.OFFTHEOP or false, -- default value
    Callback = function(state) 
        _G.Settings.OFFTHEOP = state
        otherthingop = true
    end
})

Main:Select() -- Select Tab

if world2 then

local Section = Boss:Section({ 
    Title = "Sea Serpent, Kraken",
})

Boss:Divider()

toggles["Auto_SeaBeast_Kraken"] = Boss:Toggle({
    Title = "Auto SeaBeast, Kraken",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_SeaBeast_Kraken or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_SeaBeast_Kraken = state
    end
})

local finishanos = Boss:Button({
    Title = "Save Position To AFK",
    Desc = "",
    Locked = false,
    Callback = function()
_G.Settings.Saved_Position_Ksb = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
})

toggles["Auto_Teleport_To_Saved_Position"] = Boss:Toggle({
    Title = "Auto Teleport To Saved Position",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Teleport_To_Saved_Position or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Teleport_To_Saved_Position = state
    end
})

local Section = Boss:Section({ 
    Title = "The World Boss",
})

Boss:Divider()

dropdowns["twdiff"] = Boss:Dropdown({
    Title = "The World Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.twdiff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.twdiff = option
    end
})

toggles["Auto_Theworld"] = Boss:Toggle({
    Title = "Auto The World",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Theworld or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Theworld = state
    end
})

    end

local Section = Boss:Section({ 
    Title = "Timed Boss",
})

Boss:Divider()

timeboss = {"AizenBoss","AlucardBoss","JinwooBoss","MadokaBoss","SukunaBoss","Yamato","YujiBoss","GojoBoss","StrongestShinobiBoss" ,"CosmicBeingBoss","SunGodBoss"}

dropdowns["Bosstimeselection"] = Boss:Dropdown({
    Title = "Boss Selection",
    Desc = "Select Timed Boss",
    Values = timeboss,
    Value = _G.Settings.Bosstimeselection or {"AizenBoss"},
    Multi = true,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Bosstimeselection = option
    end
})

toggles["Auto_Timed_Boss"] = Boss:Toggle({
    Title = "Auto Boss",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Timed_Boss or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Timed_Boss = state
    end
})

if world1 then
local Section = Boss:Section({ 
    Title = "Summon Boss",
})

Boss:Divider()

boss_table = {"BlessedMaidenBoss", "GilgameshBoss","IchigoBoss","QinShiBoss","SaberBoss","SaberAlterBoss","MoonSlayerBoss","IceQueenBoss"}

dropdowns["bossselection"] = Boss:Dropdown({
    Title = "Boss Selection",
    Desc = "Select Spawn Boss",
    Values = boss_table,
    Value = _G.Settings.bossselection or "SaberBoss",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.bossselection = option
    end
})

dropdowns["BossSummonDiff"] = Boss:Dropdown({
    Title = "Boss Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.BossSummonDiff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.BossSummonDiff = option
    end
})

toggles["Auto_Boss"] = Boss:Toggle({
    Title = "Auto Boss",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Boss = state
    end
})

local Section = Boss:Section({ 
    Title = "Anos Boss",
})

Boss:Divider()

spawn(function()
while task.wait(.3) do
    pcall(function()
    if bross then
for i,v in pairs(workspace:GetChildren()) do
    if string.find(v.Name, "DemoniteCore") then
        distance2 = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance2 < 10 then
fireproximityprompt(v.DemoniteCollectPrompt,20)
        end
    end
end
    end
end)
        end
        end)

local finishanos = Boss:Button({
    Title = "Finish Anos Summon Quest In Click",
    Desc = "",
    Locked = false,
    Callback = function()
bross = true

local args = {
	"Academy"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(1)
goto(CFrame.new(727.65625, -1.79563808, 1273.05908, 0.624649167, -0, -0.780905545, 0, 1, -0, 0.780905545, 0, 0.624649167), _G.Settings.Tween_Speed)
task.wait(1.7)
fireproximityprompt(workspace.ServiceNPCs.AnosQuestNPC.HumanoidRootPart.DemoniteQuestPrompt,20)
task.wait(2)

local args = {
	"Academy"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(1)
goto(CFrame.new(1006.00696, 11.7496796, 1130.03369, 0.427069724, -0.161284894, 0.889718413, -0.00357355922, 0.983654857, 0.180028737, -0.90421176, -0.0800643042, 0.419512808), _G.Settings.Tween_Speed)
task.wait(3)

local args = {
	"Academy"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(1)
goto(CFrame.new(920.795715, 70.3931427, 1478.13025, 0.725795209, -0.576960802, 0.374616534, 0.622277141, 0.782796979, -7.01099634e-06, -0.29324463, 0.233120382, 0.927179873), _G.Settings.Tween_Speed)
task.wait(3)

bross = false
    end
})

dropdowns["Anos_Diff"] = Boss:Dropdown({
    Title = "Anos Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.Anos_Diff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Anos_Diff = option
    end
})

toggles["Auto_Anos"] = Boss:Toggle({
    Title = "Auto Anos",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Anos or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Anos = state
    end
})

local Section = Boss:Section({ 
    Title = "True Aizen Boss",
})

Boss:Divider()

dropdowns["Trueaizendiff"] = Boss:Dropdown({
    Title = "True Aizen Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.Trueaizendiff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Trueaizendiff = option
    end
})

toggles["Auto_Trueaizen"] = Boss:Toggle({
    Title = "Auto True Aizen",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Trueaizen or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Trueaizen = state
    end
})

local Section = Boss:Section({ 
    Title = "GreatMage Boss",
})

Boss:Divider()

dropdowns["gmdiff"] = Boss:Dropdown({
    Title = "GreatMage Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.gmdiff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.gmdiff = option
    end
})

toggles["Auto_GrateMage"] = Boss:Toggle({
    Title = "Auto GreatMage",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_GrateMage or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_GrateMage = state
    end
})

local Section = Boss:Section({ 
    Title = "Cid Boss",
})

Boss:Divider()

dropdowns["ciddiff"] = Boss:Dropdown({
    Title = "Cid Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.ciddiff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.ciddiff = option
    end
})

toggles["Auto_Cid"] = Boss:Toggle({
    Title = "Auto Cid",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Cid or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Cid = state
    end
})

local Section = Boss:Section({ 
    Title = "Rimuru Boss",
})

Boss:Divider()

dropdowns["Rimuru_Diff"] = Boss:Dropdown({
    Title = "Rimuru Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.Rimuru_Diff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Rimuru_Diff = option
    end
})

toggles["Auto_Rimuru"] = Boss:Toggle({
    Title = "Auto Rimuru",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Rimuru or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Rimuru = state
    end
})

local Section = Boss:Section({ 
    Title = "Strongest Boss",
})

Boss:Divider()

dropdowns["Strongest_Select"] = Boss:Dropdown({
    Title = "Strongest Selection",
    Desc = "",
    Values = {"StrongestToday","StrongestHistory"},
    Value = _G.Settings.Strongest_Select or "StrongestToday" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Strongest_Select = option
    end
})

dropdowns["Strongest_Diff"] = Boss:Dropdown({
    Title = "Strongest Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.Strongest_Diff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Strongest_Diff = option
    end
})

toggles["Strongest_Auto"] = Boss:Toggle({
    Title = "Auto Strongest Boss",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Strongest_Auto or false, -- default value
    Callback = function(state) 
        _G.Settings.Strongest_Auto = state
    end
})

local Section = Boss:Section({ 
    Title = "Pity Boss",
})

Boss:Divider()

timebosss = {"AizenBoss","AlucardBoss","JinwooBoss","MadokaBoss","SukunaBoss","Yamato","YujiBoss","GojoBoss","AnosBoss","TrueAizenBoss","IchigoBoss","GilgameshBoss","SaberAlterBoss","BlessedMaidenBoss","Atomic","StrongestShinobiBoss","MoonSlayerBoss","IceQueenBoss","StrongestHistory","StrongestToday"}

dropdowns["Boss_Pity_Selection"] = Boss:Dropdown({
    Title = "Boss Selection",
    Desc = "",
    Values = timebosss,
    Value = _G.Settings.Boss_Pity_Selection or "AizenBoss" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Boss_Pity_Selection = option
    end
})

dropdowns["Boss_Pity_Diff"] = Boss:Dropdown({
    Title = "Boss Difficult",
    Desc = "",
    Values = {"Normal","Medium","Hard","Extreme"},
    Value = _G.Settings.Boss_Pity_Diff or "Normal" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Boss_Pity_Diff = option
    end
})

toggles["Auto_Pity"] = Boss:Toggle({
    Title = "Auto Pity Boss",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Pity or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Pity = state
    end
})
end

local Section = Dun:Section({ 
    Title = "Join Dungeon",
})

Dun:Divider()

dropdowns["Raid_Selection"] = Dun:Dropdown({
    Title = "Raid Selection",
    Desc = "",
    Values = {"InfiniteTower","BossRush","CidDungeon","RuneDungeon","DoubleDungeon","CrystalDefense","Raid"},
    Value = _G.Settings.Raid_Selection or "BossRush",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Raid_Selection = option
    end
})

toggles["Auto_Join_raid"] = Dun:Toggle({
    Title = "Auto Join Dungeon",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Join_raid or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Join_raid = state
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LeaveDungeonPortal"):FireServer()
    end
})


local Section = Dun:Section({ 
    Title = "Dungeon",
})

Dun:Divider()

local Paragraph = Dun:Paragraph({
    Title = "Dungeon and Boss Rush In The Same Function, Ty for using axel hub",
    Desc = "",
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
})

dropdowns["Diff_Selection"] = Dun:Dropdown({
    Title = "Difficult Selection",
    Desc = "Select Difficult To Select",
    Values = {"Easy","Medium","Hard","Extreme"},
    Value = _G.Settings.Diff_Selection or "Medium",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Diff_Selection = option
    end
})

spawn(function()
while task.wait(.1) do
    pcall(function()
    if bros then
for i,v in pairs(workspace:GetDescendants()) do
    if v.Name == "DungeonPuzzlePiece" then
        distance2 = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance2 < 10 then
fireproximityprompt(v.PuzzlePrompt,20)
        end
    end
end
    end
end)
end
end)

local finishdun = Dun:Button({
    Title = "Finish Dungeon First Quest In Click",
    Desc = "",
    Locked = false,
    Callback = function()
bros = true
local args = {
	"Starter"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(.4)
goto(CFrame.new(89.9129028, 8.48682785, -136.653168, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376), _G.Settings.Tween_Speed)
task.wait(2)
local args = {
	"Jungle"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(.4)
goto(CFrame.new(-396.155457, -0.644790649, 510.067932, 0.369634688, 0.120474108, -0.921333969, -0.264767796, 0.96410799, 0.0198437124, 0.890656054, 0.236604616, 0.388265431), _G.Settings.Tween_Speed)
task.wait(2)
local args = {
	"Desert"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(.4)
goto(CFrame.new(-1055.74548, 5.37958527, -306.656342, -0.0325621367, -0.207822829, 0.977624476, 0.0831362903, 0.974190116, 0.209861815, -0.996006191, 0.0881095827, -0.0144441128), _G.Settings.Tween_Speed)
task.wait(2)
local args = {
	"Snow"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(.4)
goto(CFrame.new(-313.635284, -2.38616896, -1188.1344, 0.92051065, 0, 0.390717506, 0, 1, 0, -0.390717506, 0, 0.92051065), _G.Settings.Tween_Speed)
task.wait(2)
local args = {
	"Shibuya"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(.4)
goto(CFrame.new(1717.1012, 138.38591, -27.2578392, 0.989420116, 0.00180168322, -0.145067453, -0.00181423908, 0.999998331, 4.57420974e-05, 0.145067304, 0.000217928886, 0.989421785), _G.Settings.Tween_Speed)
task.wait(2)
local args = {
	"Hollow"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(.4)
goto(CFrame.new(-685.611206, 98.1761932, 1335.40051, 0.325435102, 0.00925869402, -0.945519149, -0.0284054689, 0.999596477, 1.14431605e-05, 0.94513768, 0.0268541873, 0.325566828), _G.Settings.Tween_Speed)
task.wait(2)

bros = false
    end
})

toggles["Auto_Dungeon"] = Dun:Toggle({
    Title = "Auto Dungeon",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Dungeon or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Dungeon = state
    end
})

toggles["Auto_Dun_Retry"] = Dun:Toggle({
    Title = "Auto Retry",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Dun_Retry or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Dun_Retry = state
    end
})

toggles["Auto_Select_Diff"] = Dun:Toggle({
    Title = "Auto Select Difficult",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Select_Diff or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Select_Diff = state
    end
})

local Section = Dun:Section({ 
    Title = "Infinite Tower, Crystal Defense",
})

Dun:Divider()

toggles["Auto_Inf_Tower"] = Dun:Toggle({
    Title = "Start Attacking",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Inf_Tower or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Inf_Tower = state
    end
})

toggles["Start_Inf"] = Dun:Toggle({
    Title = "Auto Start",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Start_Inf or false, -- default value
    Callback = function(state) 
        _G.Settings.Start_Inf = state
    end
})

toggles["Auto_Retry_Inf"] = Dun:Toggle({
    Title = "Auto Replay",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Retry_Inf or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Retry_Inf = state
    end
})

if _G.Settings.Die_when == nil then
_G.Settings.Die_when = 50
end

slides["Die_when"] = Dun:Slider({
    Title = "Auto Restart After",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 120,
        Default = _G.Settings.Die_when or 50,
    },
    Callback = function(value)
        _G.Settings.Die_when = value
    end
})

toggles["Auto_Die_when"] = Dun:Toggle({
    Title = "Auto Restart Floor",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Die_when or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Die_when = state
    end
})

if hopes then
allstat = {"Damage","Defense","CooldownReduction","CritChance","CritDamage","DamageReduction","Luck"}

local Paragraph = Tab:Paragraph({
    Title = "Auto Reroll Stats For Z",
    Desc = "",
    Image = "rbxassetid://86949082023913",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
})

dropdowns["stat_selected"] = Tab:Dropdown({
    Title = "Stat Selection",
    Desc = "Select Stat To Reroll",
    Values = {"Damage","Defense","CooldownReduction","CritChance","CritDamage","DamageReduction","Luck"},
    Value = _G.Settings.stat_selected or "Luck" ,
    Multi = false,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.stat_selected = option
    end
})

VirtualInputManager = game:GetService("VirtualInputManager")

function click(gui)
game:GetService("GuiService").SelectedObject = gui
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
end

toggles["startreroll"] = Tab:Toggle({
    Title = "Start Rerolling Stat",
    Desc = "",
    Icon = "bird",
    Type = "Checkbox",
    Value = _G.Settings.startreroll or false, -- default value
    Callback = function(state) 
        _G.Settings.startreroll = state
    end
})
    end

local Section = Craft:Section({ 
    Title = "Craft Key",
})

Craft:Divider()

dropdowns["Key_Selection"] = Craft:Dropdown({
    Title = "Key Selection",
    Desc = "Select Key To Craft",
    Values = {"DivineGrail","SlimeKey"},
    Value = _G.Settings.Key_Selection or "SlimeKey" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Key_Selection = option
    end
})

if _G.Settings.Key_Amount == nil then
_G.Settings.Key_Amount = 5
end

slides["Key_Amount"] = Craft:Slider({
    Title = "Key Amount",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 50,
        Default = _G.Settings.Key_Amount,
    },
    Callback = function(value)
        _G.Settings.Key_Amount = value
    end
})

local craftkey = Craft:Button({
    Title = "Craft Key",
    Desc = "",
    Locked = false,
    Callback = function()
if _G.Settings.Key_Selection == "SlimeKey" then
local args = {
	"SlimeKey",
	_G.Settings.Key_Amount
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSlimeCraft"):InvokeServer(unpack(args))
elseif _G.Settings.Key_Selection == "DivineGrail" then
local args = {
	"DivineGrail",
	_G.Settings.Key_Amount
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestGrailCraft"):InvokeServer(unpack(args))
end
    end
})

toggles["Auto_Craft_Key"] = Craft:Toggle({
    Title = "Auto Craft Key",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Craft_Key or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Craft_Key = state
    end
})

local Section = Reroll:Section({ 
    Title = "Passive",
})

Reroll:Divider()

local Paragraph = Reroll:Paragraph({
    Title = "How to use",
    Desc = "Put your wanted passive + percent in, Must Select -None- when you are doing 1 passive",
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
})

if _G.Settings.Passive_Selection == nil then
_G.Settings.Passive_Selection = "List"
end

dropdowns["Passive_Selection"] = Reroll:Dropdown({
    Title = "Passive Stop Method",
    Desc = "Select Way To Reroll",
    Values = {"List","List + Percent","Percent"},
    Value = _G.Settings.Passive_Selection ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Passive_Selection = option
    end
})

passiveall = {"Fortune Chosen","Executioner","Rampage","Berserker","Eclipse"}

dropdowns["Passive_Name"] = Reroll:Dropdown({
    Title = "Passive List Selection",
    Desc = "",
    Values = passiveall,
    Value = _G.Settings.Passive_Name or {"Rampage"} ,
    Multi = true,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Passive_Name = option
    end
})

dropdowns["Passive_1"] = Reroll:Dropdown({
    Title = "Passive Selection (1)",
    Desc = "Select Passive To Reroll",
    Values = {"Damage","Crit Damage","Crit Chance","Luck"},
    Value = _G.Settings.Passive_1 or "Damage" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Passive_1 = option
    end
})

if _G.Settings.Passive_Percent1 == nil then
_G.Settings.Passive_Percent1 = 5
end

slides["Passive_Percent1"] = Reroll:Slider({
    Title = "Passive Percent (1)",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 50,
        Default = _G.Settings.Passive_Percent1,
    },
    Callback = function(value)
        _G.Settings.Passive_Percent1 = value
    end
})

dropdowns["Passive_2"] = Reroll:Dropdown({
    Title = "Passive Selection (2)",
    Desc = "Select Passive To Reroll",
    Values = {"None","Damage","Crit Damage","Crit Chance","Luck"},
    Value = _G.Settings.Passive_2 or "None" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Passive_2 = option
    end
})

if _G.Settings.Passive_Percent2 == nil then
_G.Settings.Passive_Percent2 = 5
end

slides["Passive_Percent2"] = Reroll:Slider({
    Title = "Passive Percent (2)",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 50,
        Default = _G.Settings.Passive_Percent2,
    },
    Callback = function(value)
        _G.Settings.Passive_Percent2 = value
    end
})

dropdowns["Passive_3"] = Reroll:Dropdown({
    Title = "Passive Selection (3)",
    Desc = "Select Passive To Reroll",
    Values = {"None","Damage","Crit Damage","Crit Chance","Luck"},
    Value = _G.Settings.Passive_3 or "None" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Passive_3 = option
    end
})

if _G.Settings.Passive_Percent3 == nil then
_G.Settings.Passive_Percent3 = 5
end

slides["Passive_Percent3"] = Reroll:Slider({
    Title = "Passive Percent (3)",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 50,
        Default = _G.Settings.Passive_Percent3,
    },
    Callback = function(value)
        _G.Settings.Passive_Percent3 = value
    end
})

weaponall = {}

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.SelectSpecFrame.SpecSelectorInventory:GetChildren()) do
if v.ClassName == "ImageButton" and not string.find(v.Name, "Slot") then
table.insert(weaponall, v.Name)
end
end

dropdowns["Weapon_Passive"] = Reroll:Dropdown({
    Title = "Weapon Selection",
    Desc = "Select Weapon To Reroll",
    Values = weaponall,
    Value = _G.Settings.Weapon_Passive or "Luck" ,
    Multi = false,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Weapon_Passive = option
    end
})

local refreshweaponlist = Reroll:Button({
    Title = "Refresh Weapon List",
    Desc = "",
    Locked = false,
    Callback = function()
local weaponall = {}

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.SelectSpecFrame.SpecSelectorInventory:GetChildren()) do
if v.ClassName == "ImageButton" and not string.find(v.Name, "Slot") then
table.insert(weaponall, v.Name)
end
end

dropdowns["Weapon_Passive"]:Refresh(weaponall)
    end
})

toggles["startrerollpassive"] = Reroll:Toggle({
    Title = "Start Rerolling Passive",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.startrerollpassive or false, -- default value
    Callback = function(state) 
        _G.Settings.startrerollpassive = state
    end
})

local Section = Reroll:Section({ 
    Title = "Power",
})

Reroll:Divider()

local Paragraph = Reroll:Paragraph({
    Title = "How to use",
    Desc = "Put your wanted Power + percent in, Must Select -None- when you are doing 1 Power",
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
})

if _G.Settings.Power_Selection == nil then
_G.Settings.Power_Selection = "List"
end

dropdowns["Power_Selection"] = Reroll:Dropdown({
    Title = "Power Stop Method",
    Desc = "Select Way To Reroll",
    Values = {"List","List + Percent","Percent"},
    Value = _G.Settings.Power_Selection,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Power_Selection = option
    end
})

powerall = {"Cursebrand","Colossus","Apex","Abyssal","Eternal","Reaper","Titanborn","Tempest"}

dropdowns["Power_List"] = Reroll:Dropdown({
    Title = "Power List Selection",
    Desc = "",
    Values = powerall,
    Value = _G.Settings.Power_List or {"Cursebrand"} ,
    Multi = true,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Power_List = option
    end
})

dropdowns["Power_1"] = Reroll:Dropdown({
    Title = "Power Selection (1)",
    Desc = "Select Power To Reroll",
    Values = {"Damage","Crit Damage","Crit Chance","Luck","HP"},
    Value = _G.Settings.Power_1 or "Damage" ,
    Multi = false,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Power_1 = option
    end
})

if _G.Settings.Power_Percent1 == nil then
_G.Settings.Power_Percent1 = 5
end

slides["Power_Percent1"] = Reroll:Slider({
    Title = "Power Percent (1)",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 50,
        Default = _G.Settings.Power_Percent1,
    },
    Callback = function(value)
        _G.Settings.Power_Percent1 = value
    end
})

dropdowns["Power_2"] = Reroll:Dropdown({
    Title = "Power Selection (2)",
    Desc = "Select Power To Reroll",
    Values = {"None","Damage","Crit Damage","Crit Chance","Luck","HP"},
    Value = _G.Settings.Power_2 or "None" ,
    Multi = false,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Power_2 = option
    end
})

if _G.Settings.Power_Percent2 == nil then
_G.Settings.Power_Percent2 = 5
end

slides["Power_Percent2"] = Reroll:Slider({
    Title = "Power Percent (2)",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 50,
        Default = _G.Settings.Power_Percent2,
    },
    Callback = function(value)
        _G.Settings.Power_Percent2 = value
    end
})

dropdowns["Power_3"] = Reroll:Dropdown({
    Title = "Power Selection (3)",
    Desc = "Select Power To Reroll",
    Values = {"None","Damage","Crit Damage","Crit Chance","Luck","HP"},
    Value = _G.Settings.Power_3 or "None" ,
    Multi = false,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Power_3 = option
    end
})

if _G.Settings.Power_Percent3 == nil then
_G.Settings.Power_Percent3 = 5
end

slides["Power_Percent3"] = Reroll:Slider({
    Title = "Power Percent (3)",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 50,
        Default = _G.Settings.Power_Percent3,
    },
    Callback = function(value)
        _G.Settings.Power_Percent3 = value
    end
})

toggles["startrerollpower"] = Reroll:Toggle({
    Title = "Start Rerolling Power",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.startrerollpower or false, -- default value
    Callback = function(state) 
        _G.Settings.startrerollpower = state
    end
})

merchant_table = {"Dungeon Key","Boss Key","Haki Color Reroll","Race Reroll","Rush Key","Passive Shard","Trait Reroll","Clan Reroll"}

dropdowns["merchant_select"] = Shop:Dropdown({
    Title = "Select Item",
    Desc = "Select Item to Buy",
    Values = merchant_table,
    Value = _G.Settings.merchant_select or {"Dungeon Key"} ,
    Multi = true,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.merchant_select = option
    end
})

toggles["Auto_Buy_Merchant"] = Shop:Toggle({
    Title = "Auto Buy Merchant",
    Desc = "",
    Icon = "bird",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Buy_Merchant or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Buy_Merchant = state
        if not game:GetService("Players").LocalPlayer.PlayerGui.MerchantUI.MainFrame.Frame.Content.Holder:FindFirstChild("Boss Key") and _G.Settings.Auto_Buy_Merchant then
task.wait(.1)
local args = {
	"Sailor"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(1)
goto(workspace.ServiceNPCs.MerchantNPC.HumanoidRootPart.CFrame, _G.Settings.Auto_Merchant)
task.wait(1)
fireproximityprompt(workspace.ServiceNPCs.MerchantNPC.HumanoidRootPart.MerchantPrompt,20)
        end
    end
})

local Section = Webhook:Section({ 
    Title = "Webhook Menu",
})

Webhook:Divider()

popathing = ""

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

local Section = Misc:Section({ 
    Title = "Misc Menu",
})

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

toggles["Auto_join_world_2"] = Misc:Toggle({
    Title = "Auto Join Second Sea",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_join_world_2 or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_join_world_2 = state
    end
})

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

function missing(t, f, fallback)
	if type(f) == t then return f end
	return fallback
end

inqueue = true
queueteleport =  missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport))

if inqueue and _G.Settings.Auto_Execute then
queueteleport("task.wait(math.random(1,10)) loadstring(game:HttpGet('https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua'))()")
inqueue = false
tuiduis = true
end

toggles["Auto_Rejoin"] = Settings:Toggle({
    Title = "Auto Rejoin",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Rejoin, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Rejoin = state

if _G.Settings.Auto_Rejoin then
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
wait(2)
if _G.Settings.Send_Webhook_Pings then
sendwebhook("You've Got Kicked!")
end
game:GetService("TeleportService"):Teleport(77747658251236)
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

if inqueue and not tuiduis and _G.Settings.Auto_Execute then
    print(true)
queueteleport("task.wait(math.random(1,10)) loadstring(game:HttpGet('https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua'))()")
inqueue = false
end
    end
})


configall = {}

if isfolder("AxelConfig_Sailor") then
for i,v in pairs(listfiles("AxelConfig_Sailor")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_Sailor")
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
if not isfile("AxelConfig_Sailor/"..Config_Name..".JSON") then
    writefile("AxelConfig_Sailor/"..Config_Name..".JSON", "")
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

if isfolder("AxelConfig_Sailor") then
for i,v in pairs(listfiles("AxelConfig_Sailor")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_Sailor")
end

DropdownConfig:Refresh(configall)
    end
})

local Button = Settings:Button({
    Title = "Delete Config",
    Desc = "",
    Locked = false,
    Callback = function()
delfile("AxelConfig_Sailor/"..Config_Select)
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
if not isfile("AxelConfig_Sailor/"..Config_Select) then
    writefile("AxelConfig_Sailor/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
else

SaveConfig("AxelConfig_Sailor/"..Config_Select)
end
    end
})

local Button = Settings:Button({
    Title = "Load Config",
    Desc = "",
    Locked = false,
    Callback = function()

prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_Sailor/"..Config_Select))

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

if _G.Settings.FPS_CAP == nil then
_G.Settings.FPS_CAP = 240
end

inputs["FPS_CAP"] = Settings:Input({
    Title = "FPS CAP",
    Desc = "put only number",
    Value = _G.Settings.FPS_CAP or "",
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "e.g. 12345678",
    Callback = function(input) 
        _G.Settings.FPS_CAP = input
        pcall(function()
        if tonumber(_G.Settings.FPS_CAP) > 0 then
        setfpscap(_G.Settings.FPS_CAP)
        else
        setfpscap(60)
        end
        end)
    end
})

pcall(function()
        if tonumber(_G.Settings.FPS_CAP) > 0 then
        setfpscap(_G.Settings.FPS_CAP)
        else
        setfpscap(60)
        end
        end)

local InstantTurnEverythingOff = Settings:Button({
    Title = "Instant Turn Everything Off",
    Desc = "",
    Locked = false,
    Callback = function()
prop = game:service('HttpService'):JSONDecode(readfile(GetConfigPath()))

for i,v in pairs(prop) do
    pcall(function()
    if i ~= "Bypass_Tp" and i ~= "Auto_Rejoin" and i ~= "Auto_Execute" and v == true then
        print(i,v)
    toggles[i]:Set(false)
    end
    end)
end
    end
})

local THAI = Settings:Button({
    Title = "เปลี่ยนเป็นภาษาไทย",
    Desc = "",
    Locked = false,
    Callback = function()
    -- toggle --
toggles["Auto_Haki"]:SetTitle("เปิดฮาคิเกราะ")
toggles["Auto_Observation"]:SetTitle("เปิดฮาคิสังเกตุ")
toggles["Bypass_Tp"]:SetTitle("บายพาส วาร์ป (แนะนำ)")
toggles["Auto_Farm_Level"]:SetTitle("ออโต้ฟาร์มเลเวล")
toggles["Auto_Quest"]:SetTitle("ออโต้เควส")
toggles["Auto_Farm"]:SetTitle("ออโต้ฟาร์มหลายเกาะ")
toggles["Auto_Equip"]:SetTitle("ใส่อาวุธ")
toggles["Swap_Tool"]:SetTitle("สลับอาวุธ")
toggles["Auto_Attack"]:SetTitle("ออโต้ตี")
toggles["Auto_Skill"]:SetTitle("ออโต้สกิว")
toggles["Only_Skill_Boss"]:SetTitle("ออโต้สกิวใส่บอส")
toggles["Auto_All_Map"]:SetTitle("ออโต้ตีทั้งแมพ")
toggles["OP_Boss"]:SetTitle("(OP) ตีบอสด้วย")
toggles["OP_METHOD"]:SetTitle("(OP) ฟาร์มทั้งแมพ")
toggles["Island_Remover"]:SetTitle("ลบแมพ")
toggles["RESETCHAR"]:SetTitle("รีตัวทุก 5 นาที")
toggles["Auto_Timed_Boss"]:SetTitle("ตีบอส เวลา")
toggles["Auto_Boss"]:SetTitle("ตีบอส เสก")
toggles["Auto_Anos"]:SetTitle("ตีบอส อานอส")
toggles["Auto_Trueaizen"]:SetTitle("ตีบอส ไอเซน")
toggles["Auto_Cid"]:SetTitle("ตีบอส ซิด")
toggles["Auto_Rimuru"]:SetTitle("ตีบอส ริโมรุ")
toggles["Strongest_Auto"]:SetTitle("ตีบอส โกโจ, สูคุนะ")
toggles["Auto_Pity"]:SetTitle("ตีบอสการันตี 24/25")
toggles["Auto_Join_raid"]:SetTitle("เข้าดันออโต้")
toggles["Auto_Dungeon"]:SetTitle("ออโต้ดันเจี้ยน")
toggles["Auto_Dun_Retry"]:SetTitle("ออโต้เริ่มดันใหม่")
toggles["Auto_Select_Diff"]:SetTitle("ออโต้เลือกระดับดัน")
toggles["Auto_Inf_Tower"]:SetTitle("ออโต้หอคอย")
toggles["Start_Inf"]:SetTitle("เริ่มหอคอย")
toggles["Auto_Retry_Inf"]:SetTitle("ออโต้เริ่มใหม่หอคอย")
toggles["Auto_Die_when"]:SetTitle("ออโต้เริ่มใหม่หอคอย")
toggles["Auto_Craft_Key"]:SetTitle("ออโต้คราฟกุญแจ")
toggles["startrerollpassive"]:SetTitle("ออโต้สุ่ม  Passive")
toggles["startrerollpower"]:SetTitle("ออโต้สุ่ม Power")
toggles["Auto_Buy_Merchant"]:SetTitle("ออโต้ซื้อของ")
toggles["Send_Webhook"]:SetTitle("ส่ง Webhook")
toggles["Screen_CPUStart"]:SetTitle("เปิดลด CPU")
toggles["Auto_Rejoin"]:SetTitle("รีเกมออโต้ (ตอนโดนเตะ)")
toggles["Auto_Execute"]:SetTitle("ออโต้รันสคริป")
toggles["OFFTHEOP"]:SetTitle("พัก OP ทุก 30 วิ")
toggles["Send_Webhook_Pings"]:SetTitle("แท็คเมื่อโดนเตะ")

-- button -- 
RefreshWeapon1:SetTitle("รีรายชื่ออาวุธ")
unlocksoul:SetTitle("ปลดล็อกด่าน Soul Dominion")
finishanos:SetTitle("ปลดล็อคเควสอานอส")
finishdun:SetTitle("ปลดล็อคเควส")
craftkey:SetTitle("คราฟกุญแจ")
refreshweaponlist:SetTitle("รีรายชื่ออาวุธ")
testwebhook:SetTitle("เทส Webhook")
redeemallcode:SetTitle("ใส่โค๊ดทั้งหมด")

-- dropdown --
dropdowns["Mode_Farm"]:SetTitle("เลือกวิธีฟาร์ม")
dropdowns["Selected_Quest"]:SetTitle("เลือกเควส")
dropdowns["island_selection"]:SetTitle("เลือกเกาะ (เลือกได้มากกว่า 1)")
dropdowns["Weapon_Selected"]:SetTitle("เลือกอาวุธ")
dropdowns["Weapon_Selected2"]:SetTitle("เลือกอาวุธ 2 (สำหรับสลับ)")
dropdowns["skill_selected"]:SetTitle("เลือกสกิว")
dropdowns["skill_selecteds"]:SetTitle("เลือกสกิวใส่บอส")
dropdowns["Bosstimeselection"]:SetTitle("เลือกบอสเวลา")
dropdowns["bossselection"]:SetTitle("เลือกบอสเสก")
dropdowns["BossSummonDiff"]:SetTitle("เลือกระดับบอสเสก")
dropdowns["Anos_Diff"]:SetTitle("เลือกระดับอานอส")
dropdowns["Trueaizendiff"]:SetTitle("เลือกระดับไอเซน")
dropdowns["ciddiff"]:SetTitle("เลือกระดับซิด")
dropdowns["Rimuru_Diff"]:SetTitle("เลือกระดับริโมรุ")
dropdowns["Strongest_Select"]:SetTitle("เลือกบอส")
dropdowns["Strongest_Diff"]:SetTitle("เลือกระดับบอส")
dropdowns["Boss_Pity_Selection"]:SetTitle("เลือกตีบอสการันตี")
dropdowns["Boss_Pity_Diff"]:SetTitle("เลือกระดับบอสการันตี")
dropdowns["Raid_Selection"]:SetTitle("เลือกดัน")
dropdowns["Diff_Selection"]:SetTitle("เลือกระดับดัน")
dropdowns["Key_Selection"]:SetTitle("เลือกกุญแจ")
dropdowns["Passive_Selection"]:SetTitle("เลือกวิธีหยุด")
dropdowns["Passive_Name"]:SetTitle("เลือก Passive")
dropdowns["Weapon_Passive"]:SetTitle("เลือกอาวุธที่จะสุ่ม")
dropdowns["Power_Selection"]:SetTitle("เลือกวิธีหยุด")
dropdowns["Power_List"]:SetTitle("เลือก Power")
dropdowns["merchant_select"]:SetTitle("เลือกของที่จะซื้อ")
dropdowns["Webhook_Notify"]:SetTitle("เลือกของที่จะส่ง Webhook")

-- slider -- 
slides["Disc"]:SetTitle("ระยะห่าง")
slides["Cooldown_Hopes"]:SetTitle("ดีเลย์การย้ายเกาะ")
slides["Cooldown_Hope"]:SetTitle("ดีเลย์การย้ายเกาะ")
slides["Die_when"]:SetTitle("รีหอคอยตอน : ")
slides["Key_Amount"]:SetTitle("จำนวนกุญแจ")
slides["Pause_Every"]:SetTitle("พักทุก (วิ)")
slides["Pause_For"]:SetTitle("พักเป็นเวลา (วิ)")
slides["Delay_Between_Island_OP"]:SetTitle("ดีเลย์ระหว่างการวาร์ป")

    end
})

task.wait(3)

spawn(function()
while task.wait(300) do
pcall(function()
if _G.Settings.RESETCHAR then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
end)
end
end)

if monname == nil then
monname = "Theif"
end

if checklevel3 == nil then
checklevel3 = 1
end

if monname == nil then
monname = "Theif"
end

function checklevel23()
if world1 then
thingends = 14
if checklevel3 == 1 then
monname = "Thief"
island = "Starter"
questname = "QuestNPC1"
onlyacs = "Blonde Spiky Hair"
elseif checklevel3 == 2 then
monname = "Monkey"
island = "Jungle"
questname = "QuestNPC3"
onlyacs = "Monkey Tail"
elseif checklevel3 == 3 then
monname = "DesertBandit"
island = "Desert"
questname = "QuestNPC5"
onlyacs = "Accessory (Fashion scarf)"
elseif checklevel3 == 4 then
monname = "FrostRogue"
island = "Snow"
questname = "QuestNPC7"
onlyacs = "Grunge Boy Hair in Black"
elseif checklevel3 == 5 then
monname = "Sorcerer"
island = "Shibuya"
questname = "QuestNPC9"
onlyacs = "FluffedHair"
elseif checklevel3 == 6 then
monname = "Hollow"
island = "Hollow"
questname = "QuestNPC11"
onlyacs = "Humanoid"
elseif checklevel3 == 7 then
monname = "StrongSorcerer"
island = "Shinjuku"
questname = "QuestNPC12"
onlyacs = "BlueShirtCollar"
elseif checklevel3 == 8 then
monname = "Curse"
island = "Shinjuku"
questname = "QuestNPC13"
onlyacs = "Humanoid"
elseif checklevel3 == 9 then
monname = "Slime"
island = "Slime"
questname = "QuestNPC14"
onlyacs = "3x"
elseif checklevel3 == 10 then
monname = "AcademyTeacher"
island = "Academy"
questname = "QuestNPC15"
onlyacs = " Spicky Man Hair Blonde"
elseif checklevel3 == 11 then
monname = "Swordsman"
island = "Judgement"
questname = "QuestNPC16"
onlyacs = "Anime Hero Green"
elseif checklevel3 == 12 then
monname = "Quincy"
island = "SoulDominion"
questname = "QuestNPC17"
onlyacs = "Accessory (MeshPartAccessory)"
elseif checklevel3 == 13 then
monname = "Ninja"
island = "Ninja"
questname = "QuestNPC18"
onlyacs = "SniperMask"
elseif checklevel3 == 14 then
monname = "ArenaFighter"
island = "Lawless"
questname = "QuestNPC19"
onlyacs = "Deep Blue Cozy Scarf (1.0)"
elseif checklevel3 == 15 then
monname = "Bunny"
island = "Easter"
questname = "QuestNPC20"
onlyacs = "Humanoid"
end
elseif world2 then
thingends = 3
if checklevel3 == 1 then
monname = "Delinquent"
island = "StarterSea2"
questname = "QuestNPC20"
onlyacs = "NerdHair"
elseif checklevel3 == 2 then
monname = "StrongFighter"
island = "StarterSea2"
questname = "QuestNPC21"
onlyacs = "faceless 4"
elseif checklevel3 == 3 then
monname = "StrongBandit"
island = "Bizarre"
questname = "QuestNPC22"
onlyacs = "Black Bandana"
elseif checklevel3 == 4 then
monname = "FastNinja"
island = "Punch"
questname = "QuestNPC23"
onlyacs = "Humanoid"
elseif checklevel3 == 5 then
monname = "SpiritFighter"
island = "BluePlanet"
questname = "QuestNPC24"
onlyacs = "Humanoid"
elseif checklevel3 == 6 then
monname = "StrongSlayer"
island = "Slayer"
questname = "QuestNPC25"
onlyacs = "Humanoid"
end
end
    end

function checklevel233()
if _G.Settings.island_selection[hop1] == "Starter" then
monname = "Thief"
island = "Starter"
questname = "QuestNPC1"
onlyacs = "Blonde Spiky Hair"
elseif _G.Settings.island_selection[hop1] == "Jungle" then
monname = "Monkey"
island = "Jungle"
questname = "QuestNPC3"
onlyacs = "Monkey Tail"
elseif _G.Settings.island_selection[hop1] == "Desert" then
monname = "DesertBandit"
island = "Desert"
questname = "QuestNPC5"
onlyacs = "Accessory (Fashion scarf)"
elseif _G.Settings.island_selection[hop1] == "Snow" then
monname = "FrostRogue"
island = "Snow"
questname = "QuestNPC7"
onlyacs = "Grunge Boy Hair in Black"
elseif _G.Settings.island_selection[hop1] == "Shibuya" then
monname = "Sorcerer"
island = "Shibuya"
questname = "QuestNPC9"
onlyacs = "FluffedHair"
elseif _G.Settings.island_selection[hop1] == "Hollow" then
monname = "Hollow"
island = "Hollow"
questname = "QuestNPC11"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "Shinjuku" then
monname = "StrongSorcerer"
island = "Shinjuku"
questname = "QuestNPC12"
onlyacs = "BlueShirtCollar"
elseif _G.Settings.island_selection[hop1] == "Shinjuku" then
monname = "Curse"
island = "Shinjuku"
questname = "QuestNPC13"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "Slime" then
monname = "Slime"
island = "Slime"
questname = "QuestNPC14"
onlyacs = "3x"
elseif _G.Settings.island_selection[hop1] == "Academy" then
monname = "AcademyTeacher"
island = "Academy"
questname = "QuestNPC15"
onlyacs = " Spicky Man Hair Blonde"
elseif _G.Settings.island_selection[hop1] == "Judgement" then
monname = "Swordsman"
island = "Judgement"
questname = "QuestNPC16"
onlyacs = "Anime Hero Green"
elseif _G.Settings.island_selection[hop1] == "SoulDominion" then
monname = "Quincy"
island = "SoulDominion"
questname = "QuestNPC17"
onlyacs = "Accessory (MeshPartAccessory)"
elseif _G.Settings.island_selection[hop1] == "Ninja" then
monname = "Ninja"
island = "Ninja"
questname = "QuestNPC18"
onlyacs = "SniperMask"
elseif _G.Settings.island_selection[hop1] == "Lawless" then
monname = "ArenaFighter"
island = "Lawless"
questname = "QuestNPC19"
onlyacs = "Deep Blue Cozy Scarf (1.0)"
elseif _G.Settings.island_selection[hop1] == "Easter" then
monname = "Bunny"
island = "Easter"
questname = "QuestNPC2031"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "StarterSea2" then
monname = "Delinquent"
island = "StarterSea2"
questname = "QuestNPC20"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "StarterSea22" then
monname = "StrongFighter"
island = "StarterSea2"
questname = "QuestNPC21"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "Bizarre" then
monname = "StrongBandit"
island = "Bizarre"
questname = "QuestNPC22"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "Punch" then
monname = "FastNinja"
island = "Punch"
questname = "QuestNPC23"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "BluePlanet" then
monname = "SpiritFighter"
island = "BluePlanet"
questname = "QuestNPC24"
onlyacs = "Humanoid"
elseif _G.Settings.island_selection[hop1] == "Slayer" then
monname = "StrongSlayer"
island = "Slayer"
questname = "QuestNPC25"
onlyacs = "Humanoid"
end
    end

if onlyacs == nil then
onlyacs = "Blonde Spiky Hair"
end

function checkmobalive(name)
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") and string.find(v.Name, name) then
    local ds = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v:FindFirstChild(onlyacs) then
    if ds <= 500 then
        return true
    end
    end
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

function checkmap(name)
for i,v in pairs(workspace:GetChildren()) do
    if string.find(v.Name, name) then
        for i2,v2 in pairs(v:GetChildren()) do
            if string.find(v2.Name, "Spawn") then
        return v2
            end
        end
    end
end
end

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_All_Map or _G.Settings.OP_METHOD or _G.Settings.Auto_Farm then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v then
    if v.Humanoid.Health <= 0 then
        v:Destroy()
    end
    end
end
end
end)
end
end)

local function getNearestPart(folder)
    local nearestPart = nil
    local shortestDistance = math.huge

    for _, obj in pairs(folder:GetChildren()) do
        if obj:IsA("Model") and obj.Name ~= "TrainingDummy" then
            if _G.Settings.OP_Boss == false then
            if not string.find(obj.Name, "Boss") then
            distance = (stringToCFrame(tostring(obj.WorldPivot)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
            elseif _G.Settings.OP_Boss then
            distance = (stringToCFrame(tostring(obj.WorldPivot)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
            if distance < shortestDistance then
                shortestDistance = distance
                nearestPart = obj
            end
        end
    end

    return nearestPart
end

function checkboss()
for i,v in pairs(workspace.NPCs:GetChildren()) do
if string.find(v.Name, "Boss") or string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
return true
end
end
return false
end

function checkcosmic()
if game:GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.Visible then
if game:GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.BossName.Text == "Cosmic Being [Lv.???]" then
return true
end
end
return false
end

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.OP_METHOD and otherthingop then
        task.wait(_G.Settings.Delay_Between_Island_OP)
        for i,v in pairs(workspace.NPCs:GetChildren()) do
            if v:IsA("Model") and v.Name ~= "TrainingDummy" then
            if _G.Settings.OP_Boss == false then
            if not string.find(v.Name, "Boss") and not string.find(v.Name, "Kraken") and not string.find(v.Name, "Sea Serpent") then
        if not v:FindFirstChild("HumanoidRootPart") then
goto(stringToCFrame(tostring(v.WorldPivot)), 100)
break
elseif v:FindFirstChild("HumanoidRootPart") then
    goto(stringToCFrame(tostring(v.WorldPivot)), 100)
    break
        end
        end
        elseif _G.Settings.OP_Boss then
            if string.find(v.Name, "Boss") or string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
goto(stringToCFrame(tostring(v.WorldPivot)) * CFrame.new(0,0,20), 100)
break
elseif checkboss() == false then
    if checkcosmic() then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1825.12598, 0.023154974, 1943.55432, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    else
    goto(stringToCFrame(tostring(v.WorldPivot)), 100)
    end
    break
        end
            end
            end
            end
end
end)
end
end)

spawn(function()
while task.wait(5) do
    pcall(function()
    if _G.Settings.OP_METHOD then
oldhealths = getNearestPart(workspace.NPCs).Humanoid.Health
oldchar = getNearestPart(workspace.NPCs)
task.wait(5)
if oldchar == getNearestPart(workspace.NPCs) and getNearestPart(workspace.NPCs).Humanoid.Health >= oldhealths then
getNearestPart(workspace.NPCs):Destroy()
end
end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if OP_Method2 and _G.Settings.OFFTHEOP then
task.wait(_G.Settings.Pause_Every)
otherthingop = false
print("Pause!")
task.wait(_G.Settings.Pause_For)
otherthingop = true
print("Start!")
end
end)
end
end)

spawn(function()
while task.wait(.1) do
    pcall(function()
    if _G.Settings.Auto_All_Map then
        local awqeq = (checkmap(island).WorldPivot.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if awqeq <= 500 then
if checkmobalive(monname) == false and checklevel3 <= thingends then
    task.wait(_G.Settings.Cooldown_Hope)
checklevel3 = checklevel3 + 1
elseif checkmobalive(monname) == false and checklevel3 > thingends then
task.wait(_G.Settings.Cooldown_Hope)
checklevel3 = 1
end
end
end
end)
end
end)

if game:GetService("CoreGui"):FindFirstChild("RobloxNetworkPauseNotification") then
game:GetService("CoreGui").RobloxNetworkPauseNotification.Enabled = false
end

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_All_Map then
    checklevel23()
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, monname) and v:FindFirstChild(onlyacs) then
        if v and v:FindFirstChild("HumanoidRootPart") then
    if v.Humanoid.Health > 0 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
    end
    elseif not v:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(checkmap(island).WorldPivot))
end
    end
    end
end
end)
end
end)

hop1 = 1

spawn(function()
while task.wait(.1) do
    pcall(function()
    if _G.Settings.Auto_Farm then
        checklevel233()
        local awqeq = (checkmap(island).WorldPivot.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if awqeq <= 500 then
if checkmobalive(monname) == false and _G.Settings.island_selection[hop1+1] ~= nil then
task.wait(_G.Settings.Cooldown_Hopes)
hop1 = hop1 + 1
elseif checkmobalive(monname) == false and _G.Settings.island_selection[hop1+1] == nil then
task.wait(_G.Settings.Cooldown_Hopes)
hop1 = 1
end
end
end
end)
end
end)

function bossshit2()
for i,v in pairs(_G.Settings.Bosstimeselection) do
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
return true
end
end
end
return false
end

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Farm then
if _G.Settings.Auto_Timed_Boss == false or bossshit2() == false then
    checklevel233()
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, monname) and v:FindFirstChild(onlyacs) then
        if v and v:FindFirstChild("HumanoidRootPart") then
    if v.Humanoid.Health > 0 then
        goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
    end
    elseif not v:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(checkmap(island).WorldPivot))
end
    end
    end
end
end
end)
end
end)

if not raid then
spawn(function()
while task.wait(12) do
pcall(function()
if _G.Settings.Auto_Buy_Merchant then
    if not game:GetService("Players").LocalPlayer.PlayerGui.MerchantUI.MainFrame.Frame.Content.Holder:FindFirstChild("Boss Key") then
task.wait(.1)
local args = {
	"Sailor"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
task.wait(1)
goto(workspace.ServiceNPCs.MerchantNPC.HumanoidRootPart.CFrame, _G.Settings.Auto_Merchant)
task.wait(1)
fireproximityprompt(workspace.ServiceNPCs.MerchantNPC.HumanoidRootPart.MerchantPrompt,20)
elseif game:GetService("Players").LocalPlayer.PlayerGui.MerchantUI.MainFrame.Frame.Content.Holder:FindFirstChild("Boss Key") then
for i,v in pairs(_G.Settings.merchant_select) do
task.wait(.1)
local args = {
	v,
	59
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MerchantRemotes"):WaitForChild("PurchaseMerchantItem"):InvokeServer(unpack(args))
end
end
end
end)
end
end)
    end

function checkstat()
if _G.Settings.stat_selected == "Damage" then
statnumber = "1"
elseif _G.Settings.stat_selected == "Defense" then
statnumber = "2"
elseif _G.Settings.stat_selected == "CooldownReduction" then
statnumber = "3"
elseif _G.Settings.stat_selected == "CritChance" then
statnumber = "4"
elseif _G.Settings.stat_selected == "CritDamage" then
statnumber = "5"
elseif _G.Settings.stat_selected == "DamageReduction" then
statnumber = "6"
elseif _G.Settings.stat_selected == "Luck" then
	statnumber = "7"
end
end

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Auto_Dun_Retry or _G.Settings.Auto_Retry_Inf then
if game:GetService("Players").LocalPlayer.PlayerGui.DungeonUI.ReplayDungeonFrameVisibleOnlyWhenClearingDungeon.Visible == true then
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.DungeonUI.ReplayDungeonFrameVisibleOnlyWhenClearingDungeon.Holder.Button.ReplayDungeonButton
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
end
    end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Auto_Die_when then
        if game:GetService("Players").LocalPlayer.PlayerGui.DungeonUI.ReplayDungeonFrameVisibleOnlyWhenClearingDungeon.Visible == false then
wavenum = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.DungeonUI.ContentFrame.WaveFrame.Holder.TotalWavesAndCurrentWaveYouAreAt.Text)
if wavenum >= _G.Settings.Die_when + 1 then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
end
    end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Auto_Select_Diff then

local args = {
	_G.Settings.Diff_Selection
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DungeonWaveVote"):FireServer(unpack(args))

    end
end)
end
end)

spawn(function()
while task.wait(2) do
    pcall(function()
    if _G.Settings.Start_Inf then
local args = {
	"start"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DungeonWaveVote"):FireServer(unpack(args))
    end
end)
end
end)

spawn(function()
while task.wait(.1) do
    pcall(function()
    if _G.Settings.Auto_Equip then
if _G.Settings.Auto_Swap_Build_When_Boss then
if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Swap_Weapon1) then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Swap_Weapon1))
task.wait(1)
end

if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Swap_Weapon2) then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Swap_Weapon2))
task.wait(1)
end
elseif not _G.Settings.Auto_Swap_Build_When_Boss then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selected) then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selected))
task.wait(1)
        end
end
end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Swap_Tool then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selected) then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selected))
task.wait(1)
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selected2))
end
end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.startreroll then
        checkstat()
if game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.RerollStatsUI.MainFrame.Frame.Content.Stats[stat_selected.."["..statnumber.."]"].Part2.Holder["StatRankYouGotFromRollingThisStat"..stat_selected].Text ~= "Z" then
click(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.RerollStatsUI.MainFrame.Frame.Content.Stats[stat_selected.."["..statnumber.."]"].Part4.Frame["RerollASingleStatButton"..stat_selected])
if game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.RerollStatsUI.MainFrame.Frame.Content.Info.RerollAllStatsAtOnceButton.AutoFrame.Holder.Checkmark.Icon.Visible == false then
click(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.RerollStatsUI.MainFrame.Frame.Content.Info.RerollAllStatsAtOnceButton.AutoFrame.Holder.Checkmark)
elseif game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.RerollStatsUI.MainFrame.Frame.Content.Stats[stat_selected.."["..statnumber.."]"].Part4.AutoFrame.Holder.Checkmark.Icon.Visible == false then
click(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.RerollStatsUI.MainFrame.Frame.Content.Stats[stat_selected.."["..statnumber.."]"].Part4.AutoFrame.Holder.Checkmark)
end
end
    end
end)
end
end)

function checkalivenowiss(uy)
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, uy) then
        if v.Humanoid.Health > 0 then
            return true
        end
    end
end
return false
end

function checknowis()
if now_island == "Starter" then
monsname = "Thief"
elseif now_island == "Jungle" then
monsname = "Monkey"
elseif now_island == "Desert" then
monsname = "DesertBandit"
elseif now_island == "Snow" then
monsname = "FrostRogue"
elseif now_island == "Shibuya" then
monsname = "Sorcerer"
elseif now_island == "Hollow" then
monsname = "Hollow"
elseif now_island == "Shinjuku" then
    if checkalivenowiss("Curse") then
        if monsname == "StrongSorcerer" and not checkalivenowiss("StrongSorcerer") then
monsname = "Curse"
elseif monsname ~= "Curse" and monsname ~= "StrongSorcerer" then
    monsname = "Curse"
        end
elseif checkalivenowiss("StrongSorcerer") then
monsname = "StrongSorcerer"
    end
elseif now_island == "Slime" then
monsname = "Slime"
elseif now_island == "Academy" then
monsname = "AcademyTeacher"
elseif now_island == "Judgement" then
monsname = "Swordsman"
elseif now_island == "SoulDominion" then
monsname = "Quincy"
elseif now_island == "Ninja" then
monsname = "Ninja"
elseif now_island == "Lawless" then
monsname = "ArenaFighter"
elseif now_island == "Easter" then
monsname = "Bunny"
elseif now_island == "StarterSea2" then
if checkalivenowiss("Delinquent") then
        if monsname == "StrongFighter" and not checkalivenowiss("StrongFighter") then
monsname = "Delinquent"
elseif monsname ~= "Delinquent" and monsname ~= "StrongFighter" then
    monsname = "Delinquent"
        end
elseif checkalivenowiss("StrongFighter") then
monsname = "StrongFighter"
    end
elseif now_island == "Bizarre" then
monsname = "StrongBandit"
elseif now_island == "Punch" then
monsname = "FastNinja"
elseif now_island == "BluePlanet" then
monsname = "SpiritFighter"
elseif now_island == "Slayer" then
monsname = "StrongSlayer"
end
end

function checkareu()
checknowis()
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, monsname) then
        if v:FindFirstChild("HumanoidRootPart") then
            return true
        end
    end
end
return false
end

function checkalivenowis()
checknowis()
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, monsname) and v:FindFirstChild("HumanoidRootPart") then
        if v.Humanoid.Health > 0 then
            return true
        end
    end
end
return false
end

function changeislands()
for i,v in pairs(_G.Settings.island_selection) do
    if _G.Settings.island_selection[2] ~= nil and _G.Settings.island_selection[3] ~= nil then
    if v ~= now_island and v ~= old_island then
        old_island = now_island
return v
    end
    elseif _G.Settings.island_selection[2] == nil then
old_island = now_island
return v
    elseif _G.Settings.island_selection[3] == nil then
        if v ~= now_island then
        old_island = now_island
return v
    end
    end
end
end

function changeisland()
now_island = changeislands()
end

spawn(function()
while task.wait(.5) do
    pcall(function()
        if _G.Settings.Auto_Skill then
        if bossnear() == false or not _G.Settings.Only_Skill_Boss then
        for i,v in pairs(_G.Settings.skill_selected) do
local args = {
	tonumber(v)
}
game:GetService("ReplicatedStorage"):WaitForChild("AbilitySystem"):WaitForChild("Remotes"):WaitForChild("RequestAbility"):FireServer(unpack(args))
        end
    end
    end
end)
end
end)

function weaponhold()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v.ClassName == "Tool" then
        return v
    end
end
end

function bossskill()
for i,v in pairs(_G.Settings.skill_selecteds) do
local args = {
	tonumber(v)
}
game:GetService("ReplicatedStorage"):WaitForChild("AbilitySystem"):WaitForChild("Remotes"):WaitForChild("RequestAbility"):FireServer(unpack(args))
        end
task.wait(.3)
        for i,v in pairs(_G.Settings.skill_selecteds) do
if v == "1" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.Z
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "2" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.X
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "3" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.C
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "4" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.V
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "5" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.F
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
        end
end

function bossnear()
for i,v in pairs(workspace.NPCs:GetChildren()) do
if string.find(v.Name, "Boss") or string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
if string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
thingget = "SeaBeastHitbox"
elseif string.find(v.Name, "Boss") then
thingget = "HumanoidRootPart"
end
    if v:FindFirstChild(thingget) then
local distance111 = (v[thingget].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance111 <= 50 then
return true
end
end
end
end
return false
end

spawn(function()
while task.wait(.5) do
    pcall(function()
    if _G.Settings.Only_Skill_Boss then
        if bossnear() then
        bossskill()
    end
    end
end)
end
end)

spawn(function()
while task.wait(.5) do
    pcall(function()
    if _G.Settings.Auto_Skill then
    if bossnear() == false or not _G.Settings.Only_Skill_Boss then
        for i,v in pairs(_G.Settings.skill_selected) do
if v == "1" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.Z
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "2" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.X
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "3" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.C
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "4" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.V
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
if v == "5" then
local args = {
	"UseAbility",
	{
		FruitPower = weaponhold().Name,
		KeyCode = Enum.KeyCode.F
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FruitPowerRemote"):FireServer(unpack(args))
        end
        end
    end
end
end)
end
end)

function checkbossalive()
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "Boss") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
return true
        end
    end
end
return false
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Settings.Auto_Farm_Level or _G.Settings.Auto_Quest then
            checklevel2()
                for i,v in pairs(workspace.NPCs:GetChildren()) do
                    if game:GetService("Players").LocalPlayer.PlayerGui.QuestUI.Quest.Visible == false or game:GetService("Players").LocalPlayer.PlayerGui.QuestUI.Quest.Quest.Holder.QuestRepeat.Visible == true then
local args = {
	questname
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("QuestAccept"):FireServer(unpack(args))
                    task.wait(1)
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.QuestUI.Quest.Visible then
                    if string.find(v.Name, monname) and (v.Humanoid.Health > 0 and v:FindFirstChild(onlyacs)) then
                    if v:FindFirstChild("HumanoidRootPart") then
                        goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
                    elseif not v:FindFirstChild("HumanoidRootPart") then
                        if island == "Hollow" then
                            local args = {
	"HollowIsland"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
                            else
local args = {
	island
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
                        end
                    task.wait(1)
                    end
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
    if _G.Settings.Strongest_Auto or strongest_auto then
        if strongest_auto then
            strongest_select = _G.Settings.Boss_Pity_Selection
            strongest_select_diff = _G.Settings.Boss_Pity_Diff
        else
            strongest_select = _G.Settings.Strongest_Select
            strongest_select_diff = _G.Settings.Strongest_Diff
        end
        local distance5 = (CFrame.new(392.870026, -2.22865272, -2177.80151, -0.912216544, 0, -0.409708411, 0, 1, 0, 0.409708411, 0, -0.912216544).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 600 then
local args = {
	"Shinjuku"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 600 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "Strongest") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    if distance5 > 20 then
        goto(CFrame.new(392.870026, -2.22865272, -2177.80151, -0.912216544, 0, -0.409708411, 0, 1, 0, 0.409708411, 0, -0.912216544), _G.Settings.Tween_Speed)
local args = {
	strongest_select,
	strongest_select_diff
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSpawnStrongestBoss"):FireServer(unpack(args))
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
    if _G.Settings.Auto_Rimuru then
        local distance5 = (CFrame.new(-1363.46313, 23.6258965, 221.290939, 0.999913454, -0.00423270836, 0.012455672, 1.50245614e-05, 0.947190225, 0.320672125, -0.0131551772, -0.32064414, 0.947108328).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 600 then
    task.wait(1)
local args = {
	"Slime"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 600 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "RimuruBoss") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
local args = {
	_G.Settings.Rimuru_Diff
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestSpawnRimuru"):FireServer(unpack(args))

        end
end
    end
end)
end
end)

function clicks(uis)
VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = uis
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
end

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Send_Webhook then
        if game:GetService("Players").LocalPlayer.PlayerGui.InventoryPanelUI.MainFrame.Visible == false then
        clicks(game:GetService("Players").LocalPlayer.PlayerGui.BasicStatsCurrencyAndButtonsUI.MainFrame.UIButtons.InventoryButtonFrame)
        end
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.NotificationUI.NotificationsFrame:GetChildren()) do
    if v.Name == "ActiveNotification" and v:FindFirstChild("Holder") then
        if v.Holder.AutoSizeHolde:FindFirstChild("Txt") and v.Holder.AutoSizeHolde:FindFirstChild("Earnt") then
            for i2,v2 in pairs(_G.Settings.Webhook_Notify) do
                for i3,v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.InventoryPanelUI.MainFrame.Frame.Content.Holder.StorageHolder.Storage:GetChildren()) do
            if string.find(v.Holder.AutoSizeHolde.Earnt.Text, v2) and string.find(v3.Name, v2) then
            sendwebhook(v.Holder.AutoSizeHolde.Txt.Text.." "..v.Holder.AutoSizeHolde.Earnt.Text.." | Total : "..v3.Slot.Holder.Quantity.Text)
            v.Name = "Actived"
        end
            end
        end
        end
    end
end
    end
end)
end
end)

function parseStats(str)
    local results = {}

    -- remove prefix before ":" if exists
    str = str:match(":(.+)") or str

    for part in str:gmatch("[^,]+") do
        local name, value

        -- case 1: "+43.3% DMG"
        value, name = part:match("([%-]?%d+%.?%d*)%%%s*([%a%s]+)")
        
        -- case 2: "Crit Chance 2.0%"
        if not value then
            name, value = part:match("([%a%s]+)%s*([%-]?%d+%.?%d*)%%")
        end

        if name and value then
            name = name:gsub("^%s+", ""):gsub("%s+$", "") -- trim
            
            table.insert(results, {
                name = name,
                value = tonumber(value)
            })
        end
    end

    return results
end

function percentStringToNumber(str)
    -- extract integer or decimal number
    local cleaned = str:match("(%d+%.?%d*)")
    return tonumber(cleaned)
end

function checkfolder(wanted16, percents16)
bruhyouass = game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.SpecInfoFrame.SwordUsedTrait.BackgroundTxt.SpecPassiveGotten.Text
data = parseStats(bruhyouass)

if _G.Settings.Passive_Selection == "List" then
    for m,u in pairs(_G.Settings.Passive_Name) do
if string.find(bruhyouass,u) then
return true
end
    end
return false
elseif _G.Settings.Passive_Selection == "List + Percent" then
for m,u in pairs(_G.Settings.Passive_Name) do
if string.find(bruhyouass,u) then
if wanted16 == "Damage" then
for _, v in pairs(data) do
    if (v.name == "DMG" or v.name == "Damage") and v.value > percents16 then
        return true
    end
end
else
    for _, v in pairs(data) do
    if v.name == wanted16 and v.value > percents16 then
        return true
    end
end
end
end
end
return false
elseif _G.Settings.Passive_Selection == "Percent" then

if wanted16 == "Damage" then
for _, v in pairs(data) do
    if (v.name == "DMG" or v.name == "Damage") and v.value > percents16 then
        return true
    end
end
else
    for _, v in pairs(data) do
    if v.name == wanted16 and v.value > percents16 then
        return true
    end
end
end
return false
end
end

function startreroll(wanted17,percents17)
bruhyouass = game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.SpecInfoFrame.SwordUsedTrait.BackgroundTxt.SpecPassiveGotten.Text

data = parseStats(bruhyouass)

for _, v in pairs(data) do
    if checkfolder(wanted17, percents17) == false then
if game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.AreYouSureYouWantToRerollFrame.Visible == true then
        clicks(game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.AreYouSureYouWantToRerollFrame.Holder.Buttons.Accept)
        else
        clicks(game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.ButtonsFrame.RerollButtonFrame.RerollButton)
        end
    end
end
end

spawn(function()
while task.wait(.1) do
    pcall(function()
    if _G.Settings.startrerollpassive then
if game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Visible then
    clicks(game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Frame.Content.SelectSpecFrame.SpecSelectorInventory[_G.Settings.Weapon_Passive])
if _G.Settings.Passive_2 == "None" then
    if checkfolder(_G.Settings.Passive_1, _G.Settings.Passive_Percent1) == false then
        print(true)
startreroll(_G.Settings.Passive_1,_G.Settings.Passive_Percent1)
    else
        toggles["startrerollpassive"]:Set(false)
        _G.Settings.startrerollpassive = false
        game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You Have Got Wanted Passive!"
})
    end
elseif _G.Settings.Passive_3 == "None" then
    if checkfolder(_G.Settings.Passive_1, _G.Settings.Passive_Percent1) == false or checkfolder(_G.Settings.Passive_2, _G.Settings.Passive_Percent2) == false then
        if checkfolder(_G.Settings.Passive_1, _G.Settings.Passive_Percent1) == false then
startreroll(_G.Settings.Passive_1,_G.Settings.Passive_Percent1)
elseif checkfolder(_G.Settings.Passive_2, _G.Settings.Passive_Percent2) == false then
    startreroll(_G.Settings.Passive_2,_G.Settings.Passive_Percent2)
end
    else
        toggles["startrerollpassive"]:Set(false)
        _G.Settings.startrerollpassive = false
        game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You Have Got Wanted Passive!"
})
    end
elseif _G.Settings.Passive_3 ~= "None" then
    if checkfolder(_G.Settings.Passive_1, _G.Settings.Passive_Percent1) == false or checkfolder(_G.Settings.Passive_2, _G.Settings.Passive_Percent2) == false or checkfolder(_G.Settings.Passive_3, _G.Settings.Passive_Percent3) == false then
if checkfolder(_G.Settings.Passive_1, _G.Settings.Passive_Percent1) == false then
startreroll(_G.Settings.Passive_1,_G.Settings.Passive_Percent1)
elseif checkfolder(_G.Settings.Passive_2, _G.Settings.Passive_Percent2) == false then
    startreroll(_G.Settings.Passive_2,_G.Settings.Passive_Percent2)
elseif checkfolder(_G.Settings.Passive_3, _G.Settings.Passive_Percent3) == false then
    startreroll(_G.Settings.Passive_3,_G.Settings.Passive_Percent3)
end
    else
        toggles["startrerollpassive"]:Set(false)
        _G.Settings.startrerollpassive = false
        game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You Have Got Wanted Passive!"
})
    end
end
elseif game:GetService("Players").LocalPlayer.PlayerGui.SpecPassiveUI.MainFrame.Visible == false then
    if not workspace.ServiceNPCs.SpecPassivesNPC:FindFirstChild("HumanoidRootPart") then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1103.89966, 5.70000124, -1235.06982, 0.607945919, 1.24618991e-08, -0.793978453, -2.04529282e-08, 1, 3.47923322e-11, 0.793978453, 1.62180331e-08, 0.607945919)
    else
        fireproximityprompt(workspace.ServiceNPCs.SpecPassivesNPC.HumanoidRootPart.SpecPassivePrompt)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1103.89966, 5.70000124, -1235.06982, 0.607945919, 1.24618991e-08, -0.793978453, -2.04529282e-08, 1, 3.47923322e-11, 0.793978453, 1.62180331e-08, 0.607945919)
end
end
    end
end)
end
end)

function checkfolders(wanted16, percents16)
bruhyouass = game:GetService("Players").LocalPlayer.PlayerGui.PowerRerollUI.MainFrame.Frame.Content.TraitPage.TraitGottenFrame.Trait.TraitGotten.Text
data = parseStats(bruhyouass)

if _G.Settings.Power_Selection == "List" then
    for m,u in pairs(_G.Settings.Power_List) do
if string.find(bruhyouass, u) then
return true
end
    end
return false
elseif _G.Settings.Power_Selection == "List + Percent" then
    for m,u in pairs(_G.Settings.Power_List) do
if string.find(bruhyouass, u) then
if wanted16 == "Damage" then
for _, v in pairs(data) do
    if v.name == "Damage" and v.value > percents16 then
        return true
    end
end
else
    for _, v in pairs(data) do
    if v.name == wanted16 and v.value > percents16 then
        return true
    end
end
end
end
end
return false
elseif _G.Settings.Power_Selection == "Percent" then
if wanted16 == "Damage" then
for _, v in pairs(data) do
    if v.name == "Damage" and v.value > percents16 then
        return true
    end
end
else
    for _, v in pairs(data) do
    if v.name == wanted16 and v.value > percents16 then
        return true
    end
end
end
return false
end
end

function startrerolls(wanted17,percents17)
bruhyouass = game:GetService("Players").LocalPlayer.PlayerGui.PowerRerollUI.MainFrame.Frame.Content.TraitPage.TraitGottenFrame.Trait.TraitGotten.Text

data = parseStats(bruhyouass)

for _, v in pairs(data) do
    if checkfolders(wanted17, percents17) == false then
if game:GetService("Players").LocalPlayer.PlayerGui.PowerRerollUI.MainFrame.Frame.Content.AreYouSureYouWantToRerollFrame.Visible == true then
        clicks(game:GetService("Players").LocalPlayer.PlayerGui.PowerRerollUI.MainFrame.Frame.Content.AreYouSureYouWantToRerollFrame.Buttons.Accept)
        else
        clicks(game:GetService("Players").LocalPlayer.PlayerGui.PowerRerollUI.MainFrame.Frame.Content.TraitPage.Buttons.RerollButtonHolder.RerollButton)
        break
        end
    end
end
end

spawn(function()
while task.wait(.1) do
pcall(function()
if _G.Settings.startrerollpower then
if game:GetService("Players").LocalPlayer.PlayerGui.PowerRerollUI.MainFrame.Visible then
if _G.Settings.Power_2 == "None" then
    if checkfolders(_G.Settings.Power_1, _G.Settings.Power_Percent1) == false then
startrerolls(_G.Settings.Power_1,_G.Settings.Power_Percent1)
    else
    toggles["startrerollpower"]:Set(false)
        _G.Settings.startrerollpower = false
        game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You Have Got Wanted Power!"
})
    end
elseif _G.Settings.Power_3 == "None" then
    if checkfolders(_G.Settings.Power_1, _G.Settings.Power_Percent1) == false or checkfolders(_G.Settings.Power_2, _G.Settings.Power_Percent2) == false then
        if checkfolders(_G.Settings.Power_1, _G.Settings.Power_Percent1) == false then
startrerolls(_G.Settings.Power_1,_G.Settings.Power_Percent1)
elseif checkfolders(_G.Settings.Power_2, _G.Settings.Power_Percent2) == false then
    startrerolls(_G.Settings.Power_2,_G.Settings.Power_Percent2)
end
    else
    toggles["startrerollpower"]:Set(false)
        _G.Settings.startrerollpower = false
        game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You Have Got Wanted Power!"
})
    end
elseif _G.Settings.Power_3 ~= "None" then
    if checkfolders(_G.Settings.Power_1, _G.Settings.Power_Percent1) == false or checkfolders(_G.Settings.Power_2, _G.Settings.Power_Percent2) == false or checkfolders(_G.Settings.Power_3, _G.Settings.Power_Percent3) == false then
if checkfolders(_G.Settings.Power_1, _G.Settings.Power_Percent1) == false then
startrerolls(_G.Settings.Power_1,_G.Settings.Power_Percent1)
elseif checkfolders(_G.Settings.Power_2, _G.Settings.Power_Percent2) == false then
    startrerolls(_G.Settings.Power_2,_G.Settings.Power_Percent2)
elseif checkfolders(_G.Settings.Power_3, _G.Settings.Power_Percent3) == false then
    startrerolls(_G.Settings.Power_3,_G.Settings.Power_Percent3)
end
    else
    toggles["startrerollpower"]:Set(false)
        _G.Settings.startrerollpower = false
        game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You Have Got Wanted Power!"
})
    end
end
elseif game:GetService("Players").LocalPlayer.PlayerGui.PowerRerollUI.MainFrame.Visible == false then
    if not workspace.ServiceNPCs.PowerNPC:FindFirstChild("HumanoidRootPart") then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(170.103241, -0.241102904, 1804.54297, 0.342771351, 0, 0.939418972, 0, 1, 0, -0.939418972, 0, 0.342771351)
    else
        fireproximityprompt(workspace.ServiceNPCs.PowerNPC.HumanoidRootPart.PowerPrompt)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(170.103241, -0.241102904, 1804.54297, 0.342771351, 0, 0.939418972, 0, 1, 0, -0.939418972, 0, 0.342771351)
end
end
    end
end)
    end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Anos or anos_tune then
        if not anos_tune then
            anosdiff = _G.Settings.Anos_Diff
        elseif anos_tune then
            anosdiff = _G.Settings.Boss_Pity_Diff
        end
        local distance5 = (CFrame.new(950.097839, -0.235297918, 1378.45105, 0.927179396, 0, 0.374617696, 0, 1, 0, -0.374617696, 0, 0.927179396).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 600 then
    task.wait(1)
local args = {
	"Academy"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 600 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "AnosBoss") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
    local args = {
	"Anos",
	anosdiff
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSpawnAnosBoss"):FireServer(unpack(args))

        end
end
    end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Cid or cidgoing then
        if cidgoing then
            ciddiffsele = _G.Settings.Boss_Pity_Diff
        elseif not cidgoing then
            ciddiffsele = _G.Settings.ciddiff
        end
        local distance5 = (CFrame.new(56.5736656, 0.183006763, 1966.71021, 0.949718177, 0.0431759842, -0.31011489, -0.0594055094, 0.997304022, -0.0430772826, 0.307418913, 0.0593338087, 0.949722648).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 600 then
    task.wait(1)
local args = {
	"Lawless"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 600 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "Atomic") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
local args = {
	ciddiffsele
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestSpawnAtomic"):FireServer(unpack(args))

        end
end
    end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Theworld or theworld then
        if gratemage then
            tuidui = _G.Settings.Boss_Pity_Diff
        elseif not gratemage then
            tuidui = _G.Settings.twdiff
        end
        local distance5 = (CFrame.new(-3117.77417, 7.51867056, -672.665527, -0.978053987, 9.27449584e-09, 0.208351716, 4.48893456e-09, 1, -2.34414923e-08, -0.208351716, -2.19917666e-08, -0.978053987).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 600 then
    task.wait(1)
local args = {
	"Bizarre"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 600 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "TheWorld") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
local args = {
	tuidui
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestSpawnTheWorld"):FireServer(unpack(args))

        end
end
    end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_GrateMage or gratemage then
        if gratemage then
            tuidui = _G.Settings.Boss_Pity_Diff
        elseif not gratemage then
            tuidui = _G.Settings.gmdiff
        end
        local distance5 = (CFrame.new(2153.15479, 19.8621559, 2322.42578, 0.753147721, -2.60185242e-08, 0.657851458, 8.02724429e-08, 1, -5.23499395e-08, -0.657851458, 9.22345862e-08, 0.753147721).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 600 then
    task.wait(1)
local args = {
	"Easter"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 600 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "GreatMage") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
local args = {
	tuidui
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestSpawnGreatMage"):FireServer(unpack(args))


        end
end
    end
end)
end
end)

function checkbossasda()
for i,v in pairs(workspace.NPCs:GetChildren()) do
if string.find(v.Name, "Boss") or string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("SeaBeastHitbox") then
if string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
thingget = "SeaBeastHitbox"
elseif string.find(v.Name, "Boss") then
thingget = "HumanoidRootPart"
end
local disdsa = (v[thingget].Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if disdsa <= 30 then
return true
end
end
end
end
return false
end

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Swap_Build_When_Boss then
if checkbossasda() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
if string.find(v.Name, "Boss") or string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("SeaBeastHitbox") then
if string.find(v.Name, "Kraken") or string.find(v.Name, "Sea Serpent") then
bruhhope = tonumber(v:GetAttribute("_BossHP"))
bruhhopes = tonumber(v:GetAttribute("_BossMaxHP"))
thingget = "SeaBeastHitbox"
elseif string.find(v.Name, "Boss") then
bruhhope = v.Humanoid.Health
bruhhopes = v.Humanoid.MaxHealth
thingget = "HumanoidRootPart"
end

local disdsa = (v[thingget].Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if disdsa <= 30 then

safemodeopen = (_G.Settings.Boss_Threshold/100)*bruhhopes

if bruhhope<=safemodeopen then
if not luckbuild then
local args = {
	tonumber(_G.Settings.Luck_Build)
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("LoadoutLoad"):FireServer(unpack(args))
luckbuild = true
mainbuild = false
task.wait(3.2)
end
elseif not mainbuild then
local args = {
	tonumber(_G.Settings.Main_Build)
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("LoadoutLoad"):FireServer(unpack(args))

luckbuild = false
mainbuild = true
task.wait(3.2)
end
end
end
end
end
else
if not luckbuild then
local args = {
	tonumber(_G.Settings.Luck_Build)
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("LoadoutLoad"):FireServer(unpack(args))
luckbuild = true
mainbuild = false
task.wait(3.2)
end
end
end
end)
end
end)

function checksbk()
if workspace.NPCs:FindFirstChild("Kraken") or workspace.NPCs:FindFirstChild("Sea Serpent") then
return true
end
return false
end

if world2 then
spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_SeaBeast_Kraken then
        if _G.Settings.Auto_Timed_Boss == false or bossshit2() == false then
if workspace.NPCs:FindFirstChild("Sea Serpent") or workspace.NPCs:FindFirstChild("Kraken") then
if workspace.NPCs:FindFirstChild("Sea Serpent") then
ksb = workspace.NPCs:FindFirstChild("Sea Serpent")
elseif workspace.NPCs:FindFirstChild("Kraken") then
ksb = workspace.NPCs:FindFirstChild("Kraken")
end

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ksb.SeaBeastHitbox.CFrame * CFrame.new(0,20,0)
else
if _G.Settings.Auto_Teleport_To_Saved_Position then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(_G.Settings.Saved_Position_Ksb)
task.wait(1)
if _G.Settings.Auto_Timed_Boss then
if game:GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.Visible then
if game:GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.BossName.Text == "Cosmic Being [Lv.???]" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1825.12598, 0.023154974, 1943.55432, 0, 0, -1, 0, 1, 0, 1, 0, 0)
task.wait(.1)
end
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1825.12598, 0.023154974, 1943.55432, 0, 0, -1, 0, 1, 0, 1, 0, 0)
task.wait(.1)
end
end
end
end
    end
        end
end)
end
end)
end

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Trueaizen or trueaizen then
        if trueaizen then
            aizen_diff = _G.Settings.Boss_Pity_Diff
        elseif not trueaizen then
            aizen_diff = _G.Settings.Trueaizendiff
        end
        local distance5 = (CFrame.new(-1199.47034, 1601.11877, 1775.04626, 0.358573437, -0, -0.933501542, 0, 1, -0, 0.933501542, 0, 0.358573437).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 600 then
    task.wait(1)
local args = {
	"SoulDominion"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 600 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "TrueAizenBoss") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 600 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
local args = {
	aizen_diff
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestSpawnTrueAizen"):FireServer(unpack(args))

        end
end
    end
end)
end
end)

spawn(function()
while task.wait(5) do
    pcall(function()
    if _G.Settings.Auto_Craft_Key then
if _G.Settings.Key_Selection == "SlimeKey" then
local args = {
	"SlimeKey",
	_G.Settings.Key_Amount
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSlimeCraft"):InvokeServer(unpack(args))
elseif _G.Settings.Key_Selection == "DivineGrail" then
local args = {
	"DivineGrail",
	_G.Settings.Key_Amount
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestGrailCraft"):InvokeServer(unpack(args))
end
    end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Boss then
        if _G.Settings.Auto_Timed_Boss == false or bossshit2() == false then
        local distance5 = (CFrame.new(776.710632, -3.39719152, -1091.70862, 0.694649816, 0, 0.719348073, 0, 1, 0, -0.719348073, 0, 0.694649816).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 300 then
    task.wait(1)
local args = {
	"Boss"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 300 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "Boss") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 300 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
    local args = {
	_G.Settings.bossselection,
    _G.Settings.BossSummonDiff
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSummonBoss"):FireServer(unpack(args))

    end
end
end
    end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
if _G.Settings.Mode_Farm == "Below" then
	        ModeFarm2 = CFrame.new(0,-_G.Settings.Disc,0) * CFrame.Angles(math.rad(90),0,0)
	    elseif _G.Settings.Mode_Farm == "Behind" then
	        ModeFarm2 = CFrame.new(0,0,_G.Settings.Disc)
	    elseif _G.Settings.Mode_Farm == "Above" then
	        ModeFarm2 = CFrame.new(0,_G.Settings.Disc,0) * CFrame.Angles(math.rad(-90),0,0)
	    else
	        ModeFarm2 = CFrame.new(0,0,_G.Settings.Disc)
	    end
end)
end
end)

function checktimedbossname(name)
if name == "JinwooBoss" or name == "AlucardBoss" then
islandbosss = "Sailor"
return "Sailor"
elseif name == "GojoBoss" or name == "SukunaBoss" or name == "YujiBoss" then
islandbosss = "Shibuya"
return "Shibuya"
elseif name == "AizenBoss" then
islandbosss = "Hollow"
return "HollowIsland"
elseif name == "Yamato" then
islandbosss = "Judgement"
return "Judgement"
elseif name == "StrongestShinobiBoss" then
islandbosss = "Ninja"
return "Ninja"
elseif name == "SunGodBoss" then
islandbosss = "Slayer"
return "Slayer"
elseif name == "CosmicBeingBoss" then
islandbosss = "Punch"
return "Punch"
elseif name == "CosmicBeingBoss" then
islandbosss = "Punch"
return "Punch"
end
end

function bossshit()
for i,v in pairs(_G.Settings.Bosstimeselection) do
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
for i3,v3 in pairs(workspace:GetChildren()) do
if string.find(v3.Name, v) then
    if v == "CosmicBeingBoss" or v == "SunGodBoss" then
    local distance4 = (v3.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance4 > 500 then
return false
elseif distance4 <= 500 then
return true
end
else
for i4,v4 in pairs(v3:GetChildren()) do
if v4.ClassName == "Part" then
local distance4 = (v4.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance4 > 500 then
return false
elseif distance4 <= 500 then
return true
end
end
end
end
end
end
end
end
end
return false
end

function bossplace()
for i,v in pairs(_G.Settings.Bosstimeselection) do
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
for i3,v3 in pairs(workspace:GetChildren()) do
if string.find(v3.Name, v) then
    if v == "CosmicBeingBoss" or v == "SunGodBoss" then
        return v3
else
for i4,v4 in pairs(v3:GetChildren()) do
if v4.ClassName == "Part" then
return v4
end
end
end
end
end
end
end
end
end

function bossshit5()
v = _G.Settings.Boss_Pity_Selection
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
for i3,v3 in pairs(workspace:GetChildren()) do
if string.find(v3.Name, v) then
for i4,v4 in pairs(v3:GetChildren()) do
if v4.ClassName == "Part" then
local distance4 = (v4.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance4 > 500 then
return false
elseif distance4 <= 500 then
return true
end
end
end
end
end
end
end
end

function bossplace2()
    v = _G.Settings.Boss_Pity_Diff
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
for i3,v3 in pairs(workspace:GetChildren()) do
if string.find(v3.Name, v) then
for i4,v4 in pairs(v3:GetChildren()) do
if v4.ClassName == "Part" then
return v4
end
end
end
end
end
end
end

function checknearportal(name)
for i,v in pairs(workspace:GetChildren()) do
if string.find(v.Name, name) then
for i2,v2 in pairs(v:GetChildren()) do
if string.find(v2.Name, "Portal") then
local distance7 = (v2.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance7 < 30 then
return true
else
return false
end
end
end
end
end
end

if workspace:FindFirstChild("_Development") then
spawn(function()
while task.wait(.5) do
    pcall(function()
    if _G.Settings.Auto_Join_raid then
        task.wait(.5)
        if game:GetService("Players").LocalPlayer.PlayerGui.DungeonPortalJoinUI.LeaveButton.Visible ~= true then
local args = {
	_G.Settings.Raid_Selection
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestDungeonPortal"):FireServer(unpack(args))
task.wait(.1)
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StartDungeonPortal"):FireServer()
    end
    end
end)
end
end)
end

spawn(function()
while task.wait() do
    pcall(function()
if _G.Settings.Auto_Timed_Boss then
for i,v in pairs(_G.Settings.Bosstimeselection) do
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
checktimedbossname(v)
if bossshit() then
    if v == "CosmicBeingBoss" then
goto(v2.HumanoidRootPart.CFrame * CFrame.new(math.random(5,10),0,math.random(5,10)), _G.Settings.Tween_Speed)
else
goto(v2.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
    end
elseif not bossshit() then
    for i3,v3 in pairs(workspace:GetChildren()) do
        if string.find(v3.Name, islandbosss) then
            if v3:FindFirstChild("Portal_"..islandbosss) then
goto(bossplace().CFrame)
elseif not v3:FindFirstChild("Portal_"..islandbosss) then
    local args = {
	checktimedbossname(v)
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
            end
    end
    end
end
end
end
end
    end
end)
end
end)

if workspace:FindFirstChild("DungeonSpawns") then
if workspace.DungeonSpawns:FindFirstChild("DungeonPlayerSpawn") then
cfspawn = workspace.DungeonSpawns:FindFirstChild("DungeonPlayerSpawn").CFrame
end
end

function checktower()
    if _G.Settings.Auto_Die_when then
if game:GetService("Players").LocalPlayer.PlayerGui.DungeonUI.ReplayDungeonFrameVisibleOnlyWhenClearingDungeon.Visible == false then
wavenum = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.DungeonUI.ContentFrame.WaveFrame.Holder.TotalWavesAndCurrentWaveYouAreAt.Text)
if wavenum >= _G.Settings.Die_when + 1 then
return true
end
end
end
return false
end

spawn(function()
while task.wait() do
    pcall(function()
	if raid and not workspace.NPCs:FindFirstChild("MinoBoss") then
    if _G.Settings.Auto_Dungeon or _G.Settings.Auto_Inf_Tower then
        if not checktower() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v.Humanoid.Health > 0 then
        local distanceu = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distanceu < 500 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
elseif distanceu >= 500 then
    goto(cfspawn, _G.Settings.Tween_Speed)
        end
    end
end
    end
elseif checktower() then
goto(cfspawn * CFrame.new(0,120,0))
end
		end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Dungeon and workspace.NPCs:FindFirstChild("MinoBoss") then
if workspace:FindFirstChild("MinoBossLever") then
for i,v in pairs(workspace:GetChildren()) do
if v.Name == "MinoBossLever" and v.PullLeverPrompt.Enabled then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
task.wait(.3)
fireproximityprompt(v.PullLeverPrompt)
task.wait(.3)
end
end
else
for i,v in pairs(workspace.NPCs:GetChildren()) do
	local tup = v:GetAttribute("_BossHP")
	if tonumber(tup) > 0 then
goto(v.MinoBossHitbox.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
	end
end
	end
	end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Auto_Haki then
if not game.Players.LocalPlayer.Character["Right Arm"]:FindFirstChild(3) then

local args = {
	"Toggle"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("HakiRemote"):FireServer(unpack(args))

end
    end
if _G.Settings.Auto_Observation then
if game:GetService("Players").LocalPlayer.PlayerGui.DodgeCounterUI.MainFrame.Visible == false then
local args = {
	"Toggle"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ObservationHakiRemote"):FireServer(unpack(args))
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

function getClosestrandom()
local Players = workspace.NPCs
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player:FindFirstChild("HumanoidRootPart") and player.Humanoid.Health > 0 then
            local hrp = player
            if hrp then
                local distance = (hrp.HumanoidRootPart.Position - myHRP.Position).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPart = hrp
                end
            end
        end
    end

    return closestPart
end

spawn(function()
while task.wait(.5) do
    pcall(function()
    if _G.Settings.Auto_Attack then
        if (getClosestrandom().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 90 then
game:GetService("ReplicatedStorage"):WaitForChild("CombatSystem"):WaitForChild("Remotes"):WaitForChild("RequestHit"):FireServer(getClosestrandom().HumanoidRootPart.Position)
    end
    end
end)
end
end)

function checkonboss(name)
if name == "JinwooBoss" or name == "AlucardBoss" then
islandboss = "Sailor"
elseif name == "GojoBoss" or name == "SukunaBoss" or name == "YujiBoss" then
islandboss = "Shibuya"
elseif name == "AizenBoss" then
islandboss = "Hollow"
elseif name == "Yamato" then
islandboss = "Judgement"
elseif name == "SaberAlterBoss" then
islandboss = "Boss"
elseif name == "GilgameshBoss" then
islandboss = "Boss"
elseif name == "IchigoBoss" then
islandboss = "Boss"
elseif name == "TrueAizenBoss" then
islandboss = "SoulDominion"
elseif name == "AnosBoss" then
islandboss = "Academy"
elseif name == "CosmicBeingBoss" then
islandboss = "Punch"
elseif name == "SunGodBoss" then
islandboss = "Slayer"
end
end



spawn(function()
while task.wait() do
    pcall(function()
    if Auto_Boss_Tune then
        local distance5 = (CFrame.new(776.710632, -3.39719152, -1091.70862, 0.694649816, 0, 0.719348073, 0, 1, 0, -0.719348073, 0, 0.694649816).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 300 then
    task.wait(1)
local args = {
	"Boss"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 300 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "Boss") and v:FindFirstChild("HumanoidRootPart") then 
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 300 then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
    local args = {
	_G.Settings.Boss_Pity_Selection,
    _G.Settings.Boss_Pity_Diff
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSummonBoss"):FireServer(unpack(args))

    end
end
    end
end)
end
end)

function bossshit1()
v = _G.Settings.Boss_Pity_Selection
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
for i3,v3 in pairs(workspace:GetChildren()) do
if string.find(v3.Name, v) then
for i4,v4 in pairs(v3:GetChildren()) do
if v4.ClassName == "Part" then
local distance4 = (v4.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance4 > 300 then
return false
elseif distance4 <= 300 then
return true
end
end
end
end
end
end
end
end

function setCollision(state)
    local player = game.Players.LocalPlayer
	if player.Character then
		for _, part in pairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = state
			end
		end
	end
end

spawn(function()
while task.wait() do
    pcall(function()
if Noclip or _G.Settings.Auto_SeaBeast_Kraken or _G.Settings.OP_METHOD or _G.Settings.Auto_Pity or _G.Settings.Auto_Boss or _G.Settings.Auto_Farm_Level or _G.Settings.Auto_Quest or _G.Settings.Auto_Farm or _G.Settings.Auto_Dungeon or _G.Settings.Auto_Timed_Boss or _G.Settings.Auto_Anos or _G.Settings.Auto_Trueaizen or _G.Settings.Auto_Rimuru or _G.Settings.Strongest_Auto or _G.Settings.Auto_Dungeon or _G.Settings.Auto_Inf_Tower then
local char = game.Players.LocalPlayer.Character
local hrp = char:WaitForChild("HumanoidRootPart")
setCollision(false)
if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("AxelHub") then
local bv = Instance.new("BodyVelocity")
bv.Name = "AxelHub"
bv.MaxForce = Vector3.new(100000,100000,100000)
bv.Velocity = Vector3.new(0,0,0)
bv.Parent = hrp
end
else
local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
setCollision(true)
for _,v in pairs(hrp:GetChildren()) do
    if v.Name == "AxelHub" then
        v:Destroy()
    end
end
end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
if BossTune then
v = _G.Settings.Boss_Pity_Selection
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if string.find(v2.Name, v) and v2.Humanoid.Health > 0 then
checktimedbossname(v)
if bossshit5() then
goto(v2.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
elseif bossshit5() == false then
    for i3,v3 in pairs(workspace:GetChildren()) do
        if string.find(v3.Name, islandbosss) then
            if v3:FindFirstChild("Portal_"..islandbosss) then
goto(bossplace2().CFrame)
elseif not v3:FindFirstChild("Portal_"..islandbosss) then
    local args = {
	checktimedbossname(v)
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
            end
    end
    end
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
    if _G.Settings.Auto_Pity then
if game :GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.BossHPBar.Pity.Text == "Pity: 24/25" then
if _G.Settings.Boss_Pity_Selection == "JinwooBoss" or _G.Settings.Boss_Pity_Selection == "AlucardBoss" or _G.Settings.Boss_Pity_Selection == "GojoBoss" or _G.Settings.Boss_Pity_Selection == "SukunaBoss" or _G.Settings.Boss_Pity_Selection == "YujiBoss" or _G.Settings.Boss_Pity_Selection == "AizenBoss" or _G.Settings.Boss_Pity_Selection == "Yamato" or _G.Settings.Boss_Pity_Selection == "StrongestShinobiBoss" then
BossTune = true
Auto_Boss_Tune = false
anos_tune = false
cidgoing = false
trueaizen = false
strongest_auto = false
elseif _G.Settings.Boss_Pity_Selection == "SaberAlterBoss" or _G.Settings.Boss_Pity_Selection == "GilgameshBoss" or _G.Settings.Boss_Pity_Selection == "IchigoBoss" or _G.Settings.Boss_Pity_Selection == "BlessedMaidenBoss" or _G.Settings.Boss_Pity_Selection == "MoonSlayerBoss" or _G.Settings.Boss_Pity_Selection == "IceQueenBoss" then
Auto_Boss_Tune = true
BossTune = false
anos_tune = false
trueaizen = false
cidgoing = false
strongest_auto = false
elseif _G.Settings.Boss_Pity_Selection == "AnosBoss" then
anos_tune = true
BossTune = false
Auto_Boss_Tune = false
trueaizen = false
cidgoing = false
strongest_auto = false
elseif _G.Settings.Boss_Pity_Selection == "TrueAizenBoss" then
trueaizen = true
BossTune = false
Auto_Boss_Tune = false
anos_tune = false
cidgoing = false
strongest_auto = false
elseif _G.Settings.Boss_Pity_Selection == "Atomic" then
cidgoing = true
trueaizen = false
BossTune = false
Auto_Boss_Tune = false
anos_tune = false
strongest_auto = false
elseif _G.Settings.Boss_Pity_Selection == "StrongestToday" or _G.Settings.Boss_Pity_Selection == "StrongestHistory" then
cidgoing = false
trueaizen = false
BossTune = false
Auto_Boss_Tune = false
anos_tune = false
strongest_auto = true
else
BossTune = false
Auto_Boss_Tune = false
cidgoing = false
anos_tune = false
trueaizen = false
strongest_auto = false
end
elseif game:GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.BossHPBar.Pity.Text ~= "Pity: 24/25" then
BossTune = false
Auto_Boss_Tune = false
anos_tune = false
trueaizen = false
cidgoing = false
strongest_auto = false
    local distance5 = (CFrame.new(776.710632, -3.39719152, -1091.70862, 0.694649816, 0, 0.719348073, 0, 1, 0, -0.719348073, 0, 0.694649816).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance5 > 300 then
    task.wait(1)
local args = {
	"Boss"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
elseif distance5 <= 300 then
    if checkbossalive() then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if string.find(v.Name, "Boss") and v:FindFirstChild("HumanoidRootPart") then
        local distance6 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance6 < 300 then
            if game:GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.Visible == true then
goto(v.HumanoidRootPart.CFrame * ModeFarm2, _G.Settings.Tween_Speed)
elseif game:GetService("Players").LocalPlayer.PlayerGui.BossUI.MainFrame.Visible == false then
    goto(v.HumanoidRootPart.CFrame * CFrame.new(0,120,0), _G.Settings.Tween_Speed)
            end
        end
    end
end
elseif checkbossalive() == false then
    task.wait(1)
    local args = {
	"SaberBoss"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSummonBoss"):FireServer(unpack(args))

    end
end
end
elseif not _G.Setting.Auto_Pity then
BossTune = false
Auto_Boss_Tune = false
anos_tune = false
trueaizen = false
cidgoing = false
strongest_auto = false
    end
end)
end
end)

        end
end
end
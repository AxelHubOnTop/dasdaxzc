--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

if not axel_loaded then 

axel_loaded = true

Premiums = false

local BaseURL = "https://new.pandadevelopment.net/api/v1"
local Client_ServiceID = "axelhub"

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

stoppingshit = false

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
    Title = "AxelHub_WF_Key",
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
if isfile("axelhub_wf_key.key") then
delfile("axelhub_wf_key.key")
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
if isfile("axelhub_wf_key.key") then
delfile("axelhub_wf_key.key")
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
    until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen")

repeat task.wait()
    until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen").Enabled == false

_G.DefaultSettings = {
            Auto_Farm_Level = false,
            Auto_Timed_Boss = false,
            Auto_Dun_Retry = false
        }

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_WF.JSON"

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
    return "AxelHub/"..userid.."_WF.JSON"
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

local Dungeon = Section:Tab({
    Title = "Dungeon",
    Icon = "bubbles", -- optional
    Locked = false,
})

local Egg = Section:Tab({
    Title = "Egg",
    Icon = "egg", -- optional
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
    Title = "1.2.1",
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

maps_table = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters:GetChildren()) do
    table.insert(maps_table, v.Name)
end

dropdowns["World_Select"] = Main:Dropdown({
    Title = "Select World",
    Desc = "select your world.",
    Values = maps_table,
    Value = _G.Settings.World_Select or "Dragon Verse" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.World_Select = option
        allmons = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters[_G.Settings.World_Select]:GetChildren()) do
    if string.find(v.Name, "Enemies") then
    for i2,v2 in pairs(v:GetChildren()) do
        table.insert(allmons, v2.Name)
    end
    end
end

dropdowns["Enemies_Select"]:Refresh(allmons)
    end
})

allmons = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters[_G.Settings.World_Select]:GetChildren()) do
    if string.find(v.Name, "Enemies") then
    for i2,v2 in pairs(v:GetChildren()) do
        table.insert(allmons, v2.Name)
    end
    end
end

dropdowns["Enemies_Select"] = Main:Dropdown({
    Title = "Select Enemies",
    Desc = "select your enemies to farm.",
    Values = allmons,
    Value = _G.Settings.Enemies_Select or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Enemies_Select = option
    end
})

local enemiesreset = Main:Button({
    Title = "Refresh Enemies",
    Desc = "",
    Locked = false,
    Callback = function()
allmons = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters[_G.Settings.World_Select]:GetChildren()) do
    if string.find(v.Name, "Enemies") then
    for i2,v2 in pairs(v:GetChildren()) do
        table.insert(allmons, v2.Name)
    end
    end
end

dropdowns["Enemies_Select"]:Refresh(allmons)
    end
})

dropdowns["Selection_Far"] = Main:Dropdown({
    Title = "Distance",
    Desc = "",
    Values = {"Near","Far"},
    Value = _G.Settings.Selection_Far or "Near",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selection_Far = option
        if _G.Settings.Selection_Far == "Near" then
nonesfr = CFrame.new(0,4,0)
elseif _G.Settings.Selection_Far == "Far" then
nonesfr = CFrame.new(-7,4,-7)
        end
    end
})

toggles["Auto_Click"] = Main:Toggle({
    Title = "Auto Click",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Click or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Click = state
    end
})

toggles["Auto_Farm_Selection"] = Main:Toggle({
    Title = "Auto Selected Enemies",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Farm_Selection or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Farm_Selection = state
    end
})

toggles["Auto_Ore"] = Main:Toggle({
    Title = "Auto Ore",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Ore or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Ore = state
    end
})

toggles["Auto_GlobalBoss"] = Main:Toggle({
    Title = "Auto Global Boss",
    Desc = "auto kill global boss",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_GlobalBoss or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_GlobalBoss = state
    end
})

toggles["Auto_Quest"] = Main:Toggle({
    Title = "Auto Quest",
    Desc = "only kill quest",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Quest or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Quest = state
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

thingupsqq = {"Auto Global Boss","Auto Trials","Auto Tempest Invasion","Auto Dragon Defenses","Open Egg","Auto Farm Selections","Auto Quest","Auto Ore"}

dropdowns["One_Priority"] = Pri:Dropdown({
    Title = "1 Priority",
    Desc = "select your first thing to do",
    Values = thingupsqq,
    Value = _G.Settings.One_Priority or "Auto Global Boss",
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
    Value = _G.Settings.Two_Priority or "Auto Trials",
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
    Value = _G.Settings.Three_Priority or "Open Egg",
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
    Value = _G.Settings.Four_Priority or "Auto Farm Selections",
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

local Section = Dungeon:Section({ 
    Title = "Trials Menu",
})

Dungeon:Divider()

toggles["Auto_Trials_Easy"] = Dungeon:Toggle({
    Title = "Auto Trial Easy",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Trials_Easy or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Trials_Easy = state
    end
})

toggles["Auto_Trials_Medium"] = Dungeon:Toggle({
    Title = "Auto Trial Medium",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Trials_Medium or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Trials_Medium = state
    end
})

dropdowns["World_Leave_Selection"] = Dungeon:Dropdown({
    Title = "Select World To Leave",
    Desc = "select your world.",
    Values = maps_table,
    Value = _G.Settings.World_Leave_Selection or "Dragon Verse" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.World_Leave_Selection = option
    end
})

dropdowns["World_Leave_Selection2"] = Dungeon:Dropdown({
    Title = "Select Zone To Leave",
    Desc = "select your zone.",
    Values = {"1","2"},
    Value = _G.Settings.World_Leave_Selection2 or "1" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.World_Leave_Selection2 = option
    end
})

if _G.Settings.Leave_Trials_At == nil then
_G.Settings.Leave_Trials_At = 25
end

slides["Leave_Trials_At"] = Dungeon:Slider({
    Title = "Leave Trials At",
    Desc = "select wave to leave trials.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.Settings.Leave_Trials_At,
    },
    Callback = function(value)
        _G.Settings.Leave_Trials_At = value
    end
})

toggles["Trials_Auto_Leave"] = Dungeon:Toggle({
    Title = "Auto Leave Trials",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Trials_Auto_Leave or false, -- default value
    Callback = function(state) 
        _G.Settings.Trials_Auto_Leave = state
    end
})

slides["Leave_Tower_At"] = Dungeon:Slider({
    Title = "Leave Tower At",
    Desc = "select wave to leave tower.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.Settings.Leave_Tower_At,
    },
    Callback = function(value)
        _G.Settings.Leave_Tower_At = value
    end
})

toggles["Tower_Auto_Leave"] = Dungeon:Toggle({
    Title = "Auto Leave Tower",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Tower_Auto_Leave or false, -- default value
    Callback = function(state) 
        _G.Settings.Tower_Auto_Leave = state
    end
})

local Section = Dungeon:Section({ 
    Title = "Gamemodes Menu",
})

Dungeon:Divider()

toggles["Auto_Tower"] = Dungeon:Toggle({
    Title = "Auto Tower",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Tower or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Tower = state
    end
})

toggles["Auto_Dragon_Defense"] = Dungeon:Toggle({
    Title = "Auto Dragon Defense",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Dragon_Defense or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Dragon_Defense = state
    end
})

toggles["Auto_Tempest_Invasion"] = Dungeon:Toggle({
    Title = "Auto Tempest Invasion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Tempest_Invasion or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Tempest_Invasion = state
    end
})

local Section = Egg:Section({ 
    Title = "Star Menu",
})

Egg:Divider()

allegg = {"Dressrosa", "Marine Fortress", "Capsule Corp","Dragon Arena","Jura Forest","Tempest Federation","Sorcerers Academy","Leveling City"}

dropdowns["Egg_Select"] = Egg:Dropdown({
    Title = "Select Star",
    Desc = "select your star to open.",
    Values = allegg,
    Value = _G.Settings.Egg_Select or "Dressrosa" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Egg_Select = option

        if _G.Settings.Egg_Select == "Dressrosa" then
cfpuk = CFrame.new(6146.64648, 787.870728, -1230.95581, -0.502635181, -1.17064962e-08, -0.864498615, 2.53137884e-08, 1, -2.82592669e-08, 0.864498615, -3.60878367e-08, -0.502635181)
elseif _G.Settings.Egg_Select == "Marine Fortress" then
cfpuk = CFrame.new(11733.7285, -11.1551266, -23342.9805, -0.87446332, -1.50442858e-08, 0.485091686, -3.13649196e-08, 1, -2.55275179e-08, -0.485091686, -3.75377383e-08, -0.87446332)
elseif _G.Settings.Egg_Select == "Capsule Corp" then
cfpuk = CFrame.new(15194.9336, 787.852234, -2612.37061, 0.77139461, 7.07248873e-08, -0.636357069, -1.44596113e-08, 1, 9.36122504e-08, 0.636357069, -6.30105106e-08, 0.77139461)
elseif _G.Settings.Egg_Select == "Dragon Arena" then
cfpuk = CFrame.new(4757.15625, 788.561523, 5689.07471, 0.875353813, -3.11359365e-08, 0.483482927, -2.42616771e-09, 1, 6.87918629e-08, -0.483482927, -6.13902316e-08, 0.875353813)
elseif _G.Settings.Egg_Select == "Jura Forest" then
cfpuk = CFrame.new(620.554688, 807.313354, -829.634216, -0.899108112, 6.56116299e-08, 0.437726676, 2.13538129e-08, 1, -1.060302e-07, -0.437726676, -8.59854765e-08, -0.899108112)
elseif _G.Settings.Egg_Select == "Tempest Federation" then
cfpuk = CFrame.new(1092.12378, 779.131226, -3681.27563, 0.265422344, 1.19328556e-08, 0.964132249, 3.16956488e-08, 1, -2.11024886e-08, -0.964132249, 3.61598715e-08, 0.265422344)
elseif _G.Settings.Egg_Select == "Sorcerers Academy" then
cfpuk = CFrame.new(4718.97217, 778.074158, -6372.76221, -0.242132932, 2.28777495e-08, 0.970243096, -2.56162158e-09, 1, -2.42186768e-08, -0.970243096, -8.3495344e-09, -0.242132932)
elseif _G.Settings.Egg_Select == "Leveling City" then
cfpuk = CFrame.new(1425.73511, 782.00061, 1962.79102, 0.217447013, -6.96448481e-08, 0.976072133, 2.51669672e-08, 1, 6.57455175e-08, -0.976072133, 1.02686091e-08, 0.217447013)
end
    end
})

if _G.Settings.Custom_Delay == nil then
_G.Settings.Custom_Delay = 4.7
end

slides["Custom_Delay"] = Egg:Slider({
    Title = "Delay Open Star",
    Desc = "select delay for next star",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 5,
        Default = _G.Settings.Custom_Delay,
    },
    Callback = function(value)
        _G.Settings.Custom_Delay = value
    end
})

toggles["Auto_Open_Star"] = Egg:Toggle({
    Title = "Auto Open Star",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Open_Star or false, -- default value
    Callback = function(state) 
    thingup = true
        _G.Settings.Auto_Open_Star = state
    end
})

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

if isfolder("AxelConfig_WF") then
for i,v in pairs(listfiles("AxelConfig_WF")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_WF")
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
if not isfile("AxelConfig_WF/"..Config_Name..".JSON") then
    writefile("AxelConfig_WF/"..Config_Name..".JSON", "")
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

if isfolder("AxelConfig_WF") then
for i,v in pairs(listfiles("AxelConfig_WF")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_WF")
end

DropdownConfig:Refresh(configall)
    end
})

local Button = Settings:Button({
    Title = "Delete Config",
    Desc = "",
    Locked = false,
    Callback = function()
delfile("AxelConfig_WF/"..Config_Select)
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
if not isfile("AxelConfig_WF/"..Config_Select) then
    writefile("AxelConfig_WF/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
else

SaveConfig("AxelConfig_WF/"..Config_Select)
end
    end
})

local Button = Settings:Button({
    Title = "Load Config",
    Desc = "",
    Locked = false,
    Callback = function()

prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_WF/"..Config_Select))

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

function getClosestrandomeqs()
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge
for i,v in pairs(workspace.Server.Enemies.World:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
    for _, player in pairs(v2:GetChildren()) do
for i6,v6 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Quests.List:GetChildren()) do
if v6:FindFirstChild("Progress") and v6.Progress.Bar.Size ~= UDim2.new(1, 0, 1, 0) then
    local mobName = string.match(v6.Description.Text, "<font.->(.-)</font>")
    if mobName == player.Name then
        local gymbros = player:GetAttributes()
        local thingload = player:GetAttribute("Loaded")
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and tonumber(v3) > 0 and thingload then
            local hrp = player
            if hrp then
                local distance = (hrp.Position - myHRP.Position).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPart = hrp
            local gymbross = closestPart:GetAttributes()
            for i34,v34 in pairs(gymbross) do
                    if i34 == "ID" then
                    localid = v34
                    end
            end
                end
            end
                end
            end
                end
                end
            end
    end
    end
end

    return closestPart, localid
end

function getClosestrandomseqeq(tuidui)
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge
for i,v in pairs(workspace.Server.Enemies.World:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
    for _, player in pairs(v2:GetChildren()) do
        if player.Name == tuidui then
        local gymbros = player:GetAttributes()
        local thingload = player:GetAttribute("Loaded")
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and tonumber(v3) > 0 and thingload then
            local hrp = player
            if hrp then
                local distance = (hrp.Position - myHRP.Position).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPart = hrp
            local gymbross = closestPart:GetAttributes()
            for i34,v34 in pairs(gymbross) do
                    if i34 == "ID" then
                    localid = v34
                    end
            end
                end
            end
                end
                end
                end
            end
    end
    end

    return closestPart, localid
end


function getClosestrandoms(tuidui)
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge
    for _1, bros in pairs(tuidui) do
for i,v in pairs(workspace.Server.Enemies.World:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
    for _, player in pairs(v2:GetChildren()) do
        if player.Name == bros then
        local gymbros = player:GetAttributes()
        local thingload = player:GetAttribute("Loaded")
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and tonumber(v3) > 0 and thingload then
            local hrp = player
            if hrp then
                local distance = (hrp.Position - myHRP.Position).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPart = hrp
            local gymbross = closestPart:GetAttributes()
            for i34,v34 in pairs(gymbross) do
                    if i34 == "ID" then
                    localid = v34
                    end
            end
                end
            end
                end
                end
                end
            end
    end
    end
end

    return closestPart, localid
end

function checknotifation(anything)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications.List:GetChildren()) do
    if string.find(v.Name, anything) then
return true
    end
end
return false
end

function checkgamemode()
if game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tempest Invasion"].Visible or game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Dragon Defense"].Visible or game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Visible or game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Visible then
return true
end
return false
end

function checkore()
for i,v in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
    local disc = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if disc < 15 then
return true
    end
end
return false
end

function checkores()
for i,v in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
if v.ClassName == "Part" then
return true
end
end
return false
end

function getClosestrandomore()
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

for i,v in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
    for _, player in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
        local gymbros = player:GetAttributes()
        local thingload = player:GetAttribute("Loaded")
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and tonumber(v3) > 0 and thingload then
            local hrp = player
            if hrp then
                local distance = (hrp.Position - myHRP.Position).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPart = hrp
            local gymbross = closestPart:GetAttributes()
            for i34,v34 in pairs(gymbross) do
                    if i34 == "ID" then
                    localid = v34
                    end
            end
            end
                end
            end
    end
    end
end

    return closestPart, localid
end

function getClosestrandomgame()
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

for i,v in pairs(workspace.Server.Enemies.Gamemodes:GetChildren()) do
    for _, player in pairs(v:GetChildren()) do
        local gymbros = player:GetAttributes()
        local thingload = player:GetAttribute("Loaded")
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and tonumber(v3) > 0 and thingload then
            local hrp = player
            if hrp then
                local distance = (hrp.Position - myHRP.Position).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPart = hrp
            local gymbross = closestPart:GetAttributes()
            for i34,v34 in pairs(gymbross) do
                    if i34 == "ID" then
                    localid = v34
                    end
            end
            end
                end
            end
    end
    end
end

    return closestPart, localid
end

function checkworldenemies(map, zone)
for i,v in pairs(workspace.Server.Enemies.World[map][zone]:GetChildren()) do
    if v.ClassName == "Part" then
        return true
    end
end
return false
end

function monsterass(checkass)
local bro = false
local thinsdsadas = 1
for i,v in pairs(workspace.Server.Enemies.World:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
    for _, player in pairs(v2:GetChildren()) do
        local gymbros = player:GetAttributes()
        local thingload = player:GetAttribute("Loaded")
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and tonumber(v3) > 0 and thingload then
                    if player.Name == checkass then
                        return true
                    end
                end
            end
        end
    end
end
return false
end

function auto_farm_selection(juitui)
        local udada, dada = getClosestrandoms(juitui)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = udada.CFrame * nonesfr
end

function auto_farm_selections(juitui)
if _G.Settings.Auto_Farm_Selection then
    if monsterass(_G.Settings.Enemies_Select[1]) then
enemies_selected = _G.Settings.Enemies_Select[1]
elseif monsterass(_G.Settings.Enemies_Select[2]) then
enemies_selected = _G.Settings.Enemies_Select[2]
elseif monsterass(_G.Settings.Enemies_Select[3]) then
enemies_selected = _G.Settings.Enemies_Select[3]
elseif monsterass(_G.Settings.Enemies_Select[4]) then
enemies_selected = _G.Settings.Enemies_Select[4]
elseif monsterass(_G.Settings.Enemies_Select[5]) then
enemies_selected = _G.Settings.Enemies_Select[5]
elseif monsterass(_G.Settings.Enemies_Select[6]) then
enemies_selected = _G.Settings.Enemies_Select[6]
elseif monsterass(_G.Settings.Enemies_Select[7]) then
enemies_selected = _G.Settings.Enemies_Select[7]
elseif monsterass(_G.Settings.Enemies_Select[8]) then
enemies_selected = _G.Settings.Enemies_Select[8]
elseif monsterass(_G.Settings.Enemies_Select[9]) then
enemies_selected = _G.Settings.Enemies_Select[9]
elseif monsterass(_G.Settings.Enemies_Select[10]) then
enemies_selected = _G.Settings.Enemies_Select[10]
elseif monsterass(_G.Settings.Enemies_Select[11]) then
enemies_selected = _G.Settings.Enemies_Select[11]
elseif monsterass(_G.Settings.Enemies_Select[12]) then
enemies_selected = _G.Settings.Enemies_Select[12]
end
        local udada, dada = getClosestrandomseqeq(enemies_selected)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = udada.CFrame * nonesfr
        return true
    end
end

function checkgamemodes()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes:GetChildren()) do
    if v.ClassName == "Frame" and v.Visible then
        return true
    end
end
return false
end

function auto_quest()
if _G.Settings.Auto_Quest then
local udada, dada = getClosestrandomeqs()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = udada.CFrame * CFrame.new(0,7,0)
        return true
    end
end

function auto_trials()
if checkgamemode() == false then
return false
end
if _G.Settings.Auto_Trials_Easy or _G.Settings.Auto_Trials_Medium then
    local udadas, dadas = getClosestrandomgame()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = udadas.CFrame * CFrame.new(0,7,0)
        return true
    end
end

dragon_verse_2 = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters["Dragon Verse"]["Shiny Enemies"]:GetChildren()) do
        table.insert(dragon_verse_2, v.Name)
end

tempest_invasion = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters["Slime Verse"]["Shiny Enemies"]:GetChildren()) do
        table.insert(tempest_invasion, v.Name)
end

leveling_verse = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters["Leveling Verse"]["Enemies Zone 2"]:GetChildren()) do
        table.insert(leveling_verse, v.Name)
end

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters["Leveling Verse"]["Units Zone 2"]:GetChildren()) do
        table.insert(leveling_verse, v.Name)
end

function auto_tower()
if _G.Settings.Auto_Tower then

if game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Tower Key") then
local text = game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List["Tower Key"].Background.Amount.Text

number = string.match(text, "%d+")
else
number = 0
end

if game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tower"].Visible then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28123.748, 838.31665, -15837.8203, 0.998544633, 1.8208727e-08, -0.0539316386, -1.70253731e-08, 1, 2.24011867e-08, 0.0539316386, -2.14503775e-08, 0.998544633)
return true
else
if game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Tower Key") and tonumber(number) > 3 then
local args = {
	{
		{
			"General",
			"Gamemodes",
			"Join",
			"Tower",
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
return true
else
if checkworldenemies("Leveling Verse", "2") then
auto_farm_selection(leveling_verse)
return true
else
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			"Leveling Verse",
			2,
			"Spawn2",
			n = 6
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

return true
end
end
end
end
end

function auto_tempest_invasion()
if _G.Settings.Auto_Tempest_Invasion then

if game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Slime Key") then
local text = game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List["Slime Key"].Background.Amount.Text

number = string.match(text, "%d+")
else
number = 0
end

if game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tempest Invasion"].Visible then
local udadas, dadas = getClosestrandomgame()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = udadas.CFrame * CFrame.new(0,7,0)
return true
else
if game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Slime Key") and tonumber(number) > 3 then
local args = {
	{
		{
			"General",
			"Gamemodes",
			"Join",
			"Tempest Invasion",
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
return true
else
if checkworldenemies("Slime Verse", "2") then
auto_farm_selection(tempest_invasion)
return true
else
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			"Slime Verse",
			2,
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
return true
end
end
end
end
end

function auto_dragon_defenses()
if _G.Settings.Auto_Dragon_Defense then

if game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Saiyan Key") then
local text = game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List["Saiyan Key"].Background.Amount.Text

number = string.match(text, "%d+")

else
number = 0
end

if game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Dragon Defense"].Visible then
local udadas, dadas = getClosestrandomgame()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = udadas.CFrame * CFrame.new(0,7,0)
return true
else
if game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Saiyan Key") and tonumber(number) > 3 then
local args = {
	{
		{
			"General",
			"Gamemodes",
			"Join",
			"Dragon Defense",
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
else
if checkworldenemies("Dragon Verse", "2") then
auto_farm_selection(dragon_verse_2)
else
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			"Dragon Verse",
			2,
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end
end
end
end
end

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Open_Star then
if thingup and workspace.Cache:FindFirstChild("Value") then
thingup = false
task.wait(_G.Settings.Custom_Delay)
thingup = true
end
    end
end)
end
end)

function auto_ore()
if _G.Settings.Auto_Ore and checkores() then
local udadas, dadas = getClosestrandomore()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = udadas.CFrame * CFrame.new(0,7,0)
return true
end
return false
end

function auto_globalboss()
if _G.Settings.Auto_GlobalBoss then
    if checknotifation("Global Boss") then
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			"Cursed Verse",
			2,
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
return true
    end
for i,v in pairs(workspace.Server.Enemies["Global Bosses"]:GetChildren()) do
    if v.ClassName == "Part" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
return true
    end
end
end
return false
end

function open_egg()
if _G.Settings.Auto_Open_Star then
if thingup then
    if game:GetService("Players").LocalPlayer.PlayerGui.UI.Frames.Shop.Background.Main.List.Gamepasses["3"]["Remote Star"].Background.Buttons.Buy.Visible then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cfpuk
task.wait(.1)
    end
local args = {
	{
		{
			"General",
			"Stars",
			"Open",
			_G.Settings.Egg_Select,
			999,
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
task.wait(.1)
return true
end
    end
end

thingupsqq = {"Auto Global Boss","Auto Trials","Auto Tempest Invasion","Auto Dragon Defenses","Open Egg","Auto Farm Selections","Auto Quest","Auto Ore"}

function priority_checker(prio)
if stoppingshit == false then
if prio == "Auto Global Boss" then
if auto_globalboss() then return true end
elseif prio == "Auto Trials" then
if auto_trials() then return true end
elseif prio == "Auto Tempest Invasion" then
if auto_tempest_invasion() then return true end
elseif prio == "Auto Dragon Defenses" then
if auto_dragon_defenses() then return true end
elseif prio == "Open Egg" then
if open_egg() then return true end
elseif prio == "Auto Farm Selections" then
if auto_farm_selections() then return true end
elseif prio == "Auto Quest" then
if auto_quest() then return true end
elseif prio == "Auto Ore" then
if auto_ore() then return true end
elseif prio == "Auto Tower" then
if auto_tower() then return true end
elseif prio == "None" then
if auto_tower() then return true end
if auto_trials() then return true end
if auto_dragon_defenses() then return true end
if auto_tempest_invasion() then return true end
if auto_globalboss() then return true end
if open_egg() then return true end
if auto_ore() then return true end
if auto_farm_selections(_G.Settings.Enemies_Select) then return true end
if auto_quest() then return true end
return false
end
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

if yesuieiq then
spawn(function()
while task.wait() do
    pcall(function()
    if auto_globalboss() then return end
    if auto_tempest_invasion() then return end
    if auto_dragon_defenses() then return end
    if auto_trials() then return end
    if open_egg() then return end
if auto_farm_selections(_G.Settings.Enemies_Select) then return end
if auto_quest() then return end
end)
end
end)
end

function getClosestrandom()
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

for i,v in pairs(workspace.Server.Enemies.World:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
    for _, player in pairs(v2:GetChildren()) do
        local gymbros = player:GetAttributes()
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and tonumber(v3) > 0 then
            local hrp = player
            if hrp then
                local distance = (hrp.Position - myHRP.Position).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPart = hrp
            local gymbross = closestPart:GetAttributes()
            for i34,v34 in pairs(gymbross) do
                    if i34 == "ID" then
                    localid = v34
                    end
            end
                end
            end
                end
            end
    end
    end
end

    return closestPart, localid
end

spawn(function()
while task.wait(3) do
    pcall(function()
    if _G.Settings.Trials_Auto_Leave then
        if game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Visible or game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Visible then
        if game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Visible then
local text = game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Main.Wave.Value.Text
elseif game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Visible then
local text = game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Main.Wave.Value.Text
        end

local currentWave = string.match(text, "%d+")

if tonumber(currentWave) >= _G.Settings.Leave_Trials_At then
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			_G.Settings.World_Leave_Selection,
			tonumber(_G.Settings.World_Leave_Selection2),
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end
    end
        end
end)
end
end)

spawn(function()
while task.wait(3) do
    pcall(function()
    if _G.Settings.Tower_Auto_Leave then
        if game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tower"].Visible then
local text = game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tower"].Main.Wave.Value.Text

local currentWave = string.match(text, "%d+")

if tonumber(currentWave) >= _G.Settings.Leave_Tower_At then
    stoppingshit = true
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			_G.Settings.World_Leave_Selection,
			tonumber(_G.Settings.World_Leave_Selection2),
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
task.wait(5)
stoppingshit = false
end
    end
        end
end)
end
end)

function attackble()
local args = {
	{
		{
			"General",
			"Attack",
			"Click",
			{
				["937829ae-270c-428a-9bfd-fc97275f66bd"] = true
			},
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

end

function attackreal(folder)
table_mons_near = {}

for i,v in pairs(folder:GetChildren()) do
    if v.ClassName == "Part" then
        local distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local health = tonumber(v:GetAttribute("Health"))
    local realid = tostring(v:GetAttribute("ID"))
    if health > 0 and distance <= 26 then
        table.insert(table_mons_near,realid)
    end
end
end

if table_mons_near[1] == nil then
return false
else
thinghone1 = table_mons_near[1]
end
if table_mons_near[2] ~= nil then
thinghone2 = table_mons_near[2]
else
thinghone2 = table_mons_near[1]
end
if table_mons_near[3] ~= nil then
thinghone3 = table_mons_near[3]
else
thinghone3 = table_mons_near[1]
end
if table_mons_near[4] ~= nil then
thinghone4 = table_mons_near[4]
else
thinghone4 = table_mons_near[1]
end
if table_mons_near[5] ~= nil then
thinghone5 = table_mons_near[5]
else
thinghone5 = table_mons_near[1]
end
local args = {
	{
		{
			"General",
			"Attack",
			"Click",
			{
				[thinghone1] = true,
				[thinghone2] = true,
				[thinghone3] = true,
                [thinghone4] = true,
                [thinghone5] = true
			},
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
return true
end

spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
    if _G.Settings.Auto_Click then
        parents=nil
        if _G.Settings.Auto_Ore and checkore() then
            parents = workspace.Server.Enemies.Ores
        elseif checkgamemodes() then
for i,v in pairs(workspace.Server.Enemies.Gamemodes:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
            if v2.ClassName == "Part" then
parents = v2.Parent
        end
    end
end
else
    for i,v in pairs(workspace.Server.Enemies.World:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
        for i3,v3 in pairs(v2:GetChildren()) do
            if v3.ClassName == "Part" then
parents = v3.Parent
            end
        end
    end
end
        end
if not attackreal(parents) then
    local args = {
	{
		{
			"General",
			"Attack",
			"Click",
			{
				["86f44e3c-e2c8-4a2d-8daf-5eb35e51d3b2"] = true
			},
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end
    end
end)
end)
end)

inglo = false

function checkgloboss()
for i,v in pairs(workspace.Server.Enemies["Global Bosses"]:GetChildren()) do
    if v.ClassName == "Part" then
return true
    end
end
return false
end

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_GlobalBoss then
if checknotifation("Global Boss") and not checkgloboss() then
for i,v in pairs(workspace.Client.Enemies:GetChildren()) do
    for i2,v2 in pairs(workspace.Server.Enemies.World:GetChildren()) do
        for i3,v3 in pairs(v2:GetChildren()) do
            if v3:FindFirstChild(v.Name) then
                Verse_Old = v3.Parent.Name
                Dimes_Old = v3.Name
            end
        end
    end
end
   inglo = true
   stoppingshit = true
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			"Cursed Verse",
			2,
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
task.wait(5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10873.502, 773.154114, -5159.50684, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
task.wait(1)
stoppingshit = false
elseif not checkgloboss() and inglo then
local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			Verse_Old,
			tonumber(Dimes_Old),
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
inglo = false
task.wait(5)
    end
    end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Title.UID.Visible == true then
game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Title.Visible = true
game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Title.TextColor3 = Color3.fromRGB(255,135,0)
game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Title.Text = "@AXELHUB"
game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Title.UID.Visible = false
game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Role.Text = "discord.gg/axelhub"
game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Role.TextColor3 = Color3.fromRGB(255,175,0)
game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Role.UID.Visible = false
    end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Auto_Trials_Medium then
        if checknotifation("Medium") then
            if checkgamemodes() then

local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			"Trial",
			1,
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))


task.wait(5)

            end
        
local args = {
	{
		{
			"General",
			"Gamemodes",
			"Join",
			"Trial Medium",
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
    end
    end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
    if _G.Settings.Auto_Trials_Easy then
        if checknotifation("Easy") then
            if checkgamemodes() then

local args = {
	{
		{
			"Player",
			"Teleport",
			"Teleport",
			"Trial",
			1,
			n = 5
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))


task.wait(5)

            end

local args = {
	{
		{
			"General",
			"Gamemodes",
			"Join",
			"Trial Easy",
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
    end
    end
end)
end
end)

local player = game.Players.LocalPlayer

function setCollision(state)
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
if Noclip or _G.Settings.Auto_Dragon_Defense or _G.Settings.Auto_Farm_Selection or _G.Settings.Auto_Quest or _G.Settings.Auto_Trials then
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
end
end
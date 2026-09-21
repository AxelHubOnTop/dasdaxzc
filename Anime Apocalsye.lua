--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

if not axel_loaded then 

axel_loaded = true

Premiums = false

local BaseURL = "https://new.pandadevelopment.net/api/v1"
local Client_ServiceID = "axelhub3"

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
    Title = "AxelHub_ACSY_Key",
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
if isfile("axelhub_acsy_key.key") then
delfile("axelhub_acsy_key.key")
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
if isfile("axelhub_acsy_key.key") then
delfile("axelhub_acsy_key.key")
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

function clicks(uis)
VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = uis
task.wait(.03)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.03)
game:GetService("GuiService").SelectedObject = nil
end

repeat task.wait()
    until game:IsLoaded()

repeat task.wait()
    until game:GetService("Players").LocalPlayer.Character

repeat task.wait()
until game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag") and game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag"):FindFirstChild("PlayerName")

game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag"):FindFirstChild("PlayerName").Text = ".gg/axelhub"
game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag"):FindFirstChild("PlayerName").TextColor3 = Color3.fromRGB(255, 175, 0)

repeat task.wait()
until game:GetService("Players").LocalPlayer.PlayerGui.HUD

repeat task.wait()
until game:GetService("Players").LocalPlayer.PlayerGui.HUD.Enabled


_G.DefaultSettings = {
            Auto_Farm_Level = false,
            Auto_Timed_Boss = false,
            Auto_Dun_Retry = false
        }

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_ACSY.JSON"

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
    return "AxelHub/"..userid.."_ACSY.JSON"
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

function equipslot()
local HttpService = game:GetService("HttpService")
local str = game:GetService("Players").LocalPlayer.Data.AbilitySlots.Value
local decoded = HttpService:JSONDecode(str)
-- get the first key (Zorro)
for key, _ in pairs(decoded) do
for i,v in pairs(_) do
    if i == "Name" and v == _G.Settings.Selected_Slot then
    local args = {
	"EquipAbility",
	key
}
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Requests"):WaitForChild("FuncInteract"):InvokeServer(unpack(args))

    end
    end
end
end

equipslot()

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

local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game)
task.wait(.3)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game)

task.wait(2)

local Window = WindUI:CreateWindow({
    Title = "Axel Hub - Anime Apocalypse",
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

local card = Section:Tab({
    Title = "Card",
    Icon = "id-card-lanyard", -- optional
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

Main:Divider()

dropdowns["Mode_Farm"] = Main:Dropdown({
    Title = "Farm Method",
    Desc = "",
    Values = {"Above","Behind","Below"},
    Value = _G.Settings.Mode_Farm or "Above" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Mode_Farm = option
    end
})

slides["Distance"] = Main:Slider({
    Title = "Distance",
    Desc = "select distance to monster.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 30,
        Default = _G.Settings.Distance or 8,
    },
    Callback = function(value)
        _G.Settings.Distance = value
    end
})

toggles["Auto_Farm"] = Main:Toggle({
    Title = "Auto Farm",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Farm or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Farm = state
    end
})

toggles["Auto_Skip"] = Main:Toggle({
    Title = "Auto Skip",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Skip or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Skip = state
    end
})

allnames = {}

local HttpService = game:GetService("HttpService")
local str = game:GetService("Players").LocalPlayer.Data.AbilitySlots.Value
local decoded = HttpService:JSONDecode(str)
for key, _ in pairs(decoded) do
for i,v in pairs(_) do
    if i == "Name" then
    table.insert(allnames, v)
    end
    end
end

function checkcooldown()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v.ClassName == "Folder" then
return true
	end
end
return false
end

dropdowns["Selected_Slot"] = Main:Dropdown({
    Title = "Select_Slot",
    Desc = "",
    Values = allnames,
    Value = _G.Settings.Selected_Slot or "" ,
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Slot = option
		stopthingshit = true
		if checkcooldown() then
task.wait(3)
else
task.wait(2)
		end
equipslot()
task.wait(.5)
local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
task.wait(.5)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
task.wait(.5)
stopthingshit = false
    end
})

dropdowns["Skill_Select"] = Main:Dropdown({
    Title = "Select Skill",
    Desc = "select skill to use no cd (add first as a .1 priority).",
    Values = {"Z","X","C"},
    Value = _G.Settings.Skill_Select or {"Z","X","C"} ,
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Skill_Select = option
    end
})

toggles["Auto_Skill_Insane"] = Main:Toggle({
    Title = "Auto Skill No CD",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Skill_Insane or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Skill_Insane = state
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

toggles["Auto_Switch"] = Main:Toggle({
    Title = "Auto Switch",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Switch or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Switch = state
    end
})

toggles["Auto_Dodge_Boss"] = Main:Toggle({
    Title = "Auto Dodge Boss Skill",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Dodge_Boss or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Dodge_Boss = state
    end
})

toggles["Auto_Awake"] = Main:Toggle({
    Title = "Auto Awake",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Awake or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Awake = state
    end
})

toggles["Auto_Gadget"] = Main:Toggle({
    Title = "Auto Gadget",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Gadget or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Gadget = state
    end
})

local Section = Main:Section({ 
    Title = "Games Menu",
})

Main:Divider()

toggles["Auto_Escape"] = Main:Toggle({
    Title = "Auto Escape",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Escape or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Escape = state
    end
})

toggles["Auto_Retry"] = Main:Toggle({
    Title = "Auto Retry",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Retry or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Retry = state
    end
})

toggles["Auto_Collect"] = Main:Toggle({
    Title = "Auto Collect Coin",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Collect or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Collect = state
    end
})

toggles["Auto_Collect_Mat"] = Main:Toggle({
    Title = "Auto Collect Mat",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Collect_Mat or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Collect_Mat = state
    end
})

if _G.Settings.HP_Threshold == nil then
_G.Settings.HP_Threshold = 40
end

slides["HP_Threshold"] = Main:Slider({
    Title = "HP Threshold (%)",
    Desc = "select your hp % to pick a heal orb",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.Settings.HP_Threshold or 40,
    },
    Callback = function(value)
        _G.Settings.HP_Threshold = value
    end
})

toggles["Auto_Collect_Health"] = Main:Toggle({
    Title = "Auto Collect Heal",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Collect_Health or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Collect_Health = state
    end
})

local Section = card:Section({ 
    Title = "Card Menu",
})

card:Divider()

function selectcards()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Cards.CardsFrame.Container:GetChildren()) do
if v.Name == "CardTemplate" then
return true
end
end
return false
end

function selectcard(mustselect)
if selectcards() then
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Cards.CardsFrame.Container:GetChildren()) do
if v.Name == "CardTemplate" and string.find(v.Front.CardName.Text,mustselect) then
clicks(v)
return true
end
end
end
return false
end

local carddada = {"Extra Life","Ability","Agility","Wealth","Ultimate","Gadget","DMG"}


dropdowns["One_Card"] = card:Dropdown({
    Title = "1 Card",
    Desc = "",
    Values = carddada,
    Value = _G.Settings.One_Card or "Wealth",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.One_Card = option
    end
})

dropdowns["Two_Card"] = card:Dropdown({
    Title = "2 Card",
    Desc = "",
    Values = carddada,
    Value = _G.Settings.Two_Card or "DMG",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Two_Card = option
    end
})

dropdowns["Three_Card"] = card:Dropdown({
    Title = "3 Card",
    Desc = "",
    Values = carddada,
    Value = _G.Settings.Three_Card or "Ability",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Three_Card = option
    end
})

dropdowns["Four_Card"] = card:Dropdown({
    Title = "4 Card",
    Desc = "",
    Values = carddada,
    Value = _G.Settings.Four_Card or "Extra Life",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Four_Card = option
    end
})

dropdowns["Five_Card"] = card:Dropdown({
    Title = "5 Card",
    Desc = "",
    Values = carddada,
    Value = _G.Settings.Five_Card or "Ultimate",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Five_Card = option
    end
})

dropdowns["Six_Card"] = card:Dropdown({
    Title = "6 Card",
    Desc = "",
    Values = carddada,
    Value = _G.Settings.Six_Card or "Agility",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Six_Card = option
    end
})

dropdowns["Seven_Card"] = card:Dropdown({
    Title = "7 Card",
    Desc = "",
    Values = carddada,
    Value = _G.Settings.Seven_Card or "Gadget",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Seven_Card = option
    end
})

toggles["Auto_Select_Card"] = card:Toggle({
    Title = "Auto Select Card",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Select_Card or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Select_Card = state
    end
})

_G.Settings.One_Priority = "None"
_G.Settings.Two_Priority = "None"
_G.Settings.Three_Priority = "None"
_G.Settings.Four_Priority = "None"
_G.Settings.Five_Priority = "None"
_G.Settings.Six_Priority = "None"
_G.Settings.Seven_Priority = "None"

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
    Value = _G.Settings.One_Priority or "Collect",
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
    Value = _G.Settings.Two_Priority or "Farm",
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
end

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

if inqueue and not tuiduis and _G.Settings.Auto_Execute then
    print(true)
queueteleport("task.wait(math.random(1,10)) loadstring(game:HttpGet('https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua'))()")
inqueue = false
end
    end
})

configall = {}

if isfolder("AxelConfig_ACSY") then
for i,v in pairs(listfiles("AxelConfig_ACSY")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_ACSY")
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
if not isfile("AxelConfig_ACSY/"..Config_Name..".JSON") then
    writefile("AxelConfig_ACSY/"..Config_Name..".JSON", "")
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

if isfolder("AxelConfig_ACSY") then
for i,v in pairs(listfiles("AxelConfig_ACSY")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_ACSY")
end

DropdownConfig:Refresh(configall)
    end
})

local Button = Settings:Button({
    Title = "Delete Config",
    Desc = "",
    Locked = false,
    Callback = function()
delfile("AxelConfig_ACSY/"..Config_Select)
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
if not isfile("AxelConfig_ACSY/"..Config_Select) then
    writefile("AxelConfig_ACSY/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
else

SaveConfig("AxelConfig_ACSY/"..Config_Select)
end
    end
})

local Button = Settings:Button({
    Title = "Load Config",
    Desc = "",
    Locked = false,
    Callback = function()

prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_ACSY/"..Config_Select))

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

function checkerhealth()
for i,v in pairs(workspace.Thrown:GetChildren()) do
    if v.Name == "HealthDrop" and v:FindFirstChild("Hitbox") then
    return true
    end
end
return false
end

function thinggonewell()
for i,v in pairs(workspace.Thrown:GetChildren()) do
    if v.Name == "Part" and (v.Color == Color3.fromRGB(255, 100, 0) or v.Color == Color3.fromRGB(255, 0, 0)) then
return true
    end
end
return false
end

function checkmons()
for i,v in pairs(workspace.Zombies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and tonumber(v.Config.Health.Value) > 0 then
            local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance < 50 then
return true
end
        end
end
return false
end

function Auto_Farm()
if _G.Settings.Auto_Farm then
    for i,v in pairs(workspace.Zombies:GetChildren()) do
        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and tonumber(v.Config.Health.Value) > 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * ModeFarm2
        return true
        end
    end
    end
return false
end

function Auto_Collect_Coin()
if _G.Settings.Auto_Collect then
for i,v in pairs(workspace.Thrown:GetChildren()) do
    if v.Name == "CoinDrop" and v:FindFirstChild("Hitbox") and v:FindFirstChild("BillboardGui") then
for i2,v2 in pairs(v:GetDescendants()) do
if v2.ClassName == "BillboardGui" and v2.Enabled then
    local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if distance <= 3000 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Hitbox.CFrame
    v:Destroy()
	return true
    end
end
    end
    end
end
end
return false
end

function Auto_Collect_Mat()
if _G.Settings.Auto_Collect_Mat then
for i,v in pairs(workspace.Thrown:GetChildren()) do
    if v.Name == "MaterialDrop" and v:FindFirstChild("Hitbox") and v:FindFirstChild("BillboardGui") then
for i2,v2 in pairs(v:GetDescendants()) do
if v2.ClassName == "BillboardGui" and v2.Enabled then
    local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if distance <= 3000 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Hitbox.CFrame
    v:Destroy()
	return true
    end
end
    end
    end
end
end
return false
end

function Auto_Collect_Health()
if _G.Settings.Auto_Collect_Health then
if not checkerhealth() then
return false
end

hp = game.Players.LocalPlayer.Character.Humanoid.Health

mhp = game.Players.LocalPlayer.Character.Humanoid.MaxHealth

safemodeopen = (_G.Settings.HP_Threshold/100)*mhp

if hp <= safemodeopen then
healthsaving = true
for i,v in pairs(workspace.Thrown:GetChildren()) do
    if v.Name == "HealthDrop" and v:FindFirstChild("Hitbox") and v:FindFirstChild("BillboardGui") then
for i2,v2 in pairs(v:GetDescendants()) do
if v2.ClassName == "BillboardGui" and v2.Enabled then
    local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if distance <= 3000 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Hitbox.CFrame
	return true
    end
end
    end
    end
end
elseif hp == mhp then
healthsaving = false
return false
end

if healthsaving == nil then
healthsaving = false
return false
end
if healthsaving then
for i,v in pairs(workspace.Thrown:GetChildren()) do
    if v.Name == "HealthDrop" and v:FindFirstChild("Hitbox") and v:FindFirstChild("BillboardGui") then
for i2,v2 in pairs(v:GetDescendants()) do
if v2.ClassName == "BillboardGui" and v2.Enabled then
    local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if distance <= 3000 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Hitbox.CFrame
	return true
    end
end
    end
    end
end
return true
end
end
return false
end

function skill(values)
local HttpService = game:GetService("HttpService")

local str = game:GetService("Players").LocalPlayer.Data.AbilityMastery.Value

local decoded = HttpService:JSONDecode(str)

-- get the first key (Zorro)
for key, _ in pairs(decoded) do
local args = {
	"Ability",
	tonumber(values),
	"Slot1",
	"Zorro",
	"Began"
}
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("Interact"):FireServer(unpack(args))
end
end

function attack()
local HttpService = game:GetService("HttpService")

local str = game:GetService("Players").LocalPlayer.Data.AbilityMastery.Value

local decoded = HttpService:JSONDecode(str)

-- get the first key (Zorro)
for key, _ in pairs(decoded) do
local args = {
	"M1",
	key,
	1777709220.458178
}
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("Interact"):FireServer(unpack(args))
end
end

function priority_checker(prio)
if prio == "Farm" then
if Auto_Farm() then return true end
elseif prio == "Collect Coin" then
if Auto_Collect_Coin() then return true end
elseif prio == "Collect Material" then
if Auto_Collect_Mat() then return true end
elseif prio == "Collect Heal" then
if Auto_Collect_Health() then return true end
elseif prio == "None" then
if Auto_Collect_Health() then return true end
if Auto_Collect_Mat() then return true end
if Auto_Collect_Coin() then return true end
if Auto_Farm() then return true end
return true
end
return false
end

spawn(function()
while task.wait(.2) do
    pcall(function()
if _G.Settings.Auto_Farm and not _G.Settings.Auto_Skill_Insane then
attack()
end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if not thinggonewell() or not _G.Settings.Auto_Dodge_Boss then
        if _G.Settings.Mode_Farm == "Below" then
	        ModeFarm2 = CFrame.new(method111,-_G.Settings.Distance,0) * CFrame.Angles(math.rad(90),0,0)
	    elseif _G.Settings.Mode_Farm == "Behind" then
	        ModeFarm2 = CFrame.new(method111,-2,_G.Settings.Distance)
	    elseif _G.Settings.Mode_Farm == "Above" then
	        ModeFarm2 = CFrame.new(method111,_G.Settings.Distance,0) * CFrame.Angles(math.rad(-90),0,0)
	    else
	        ModeFarm2 = CFrame.new(method111,-2,_G.Settings.Distance)
	    end
        else
            ModeFarm2 = CFrame.new(100,100,100) * CFrame.Angles(math.rad(-90),0,0)
        task.wait(2)
        end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
if _G.Settings.Auto_Escape then
if workspace.Map:FindFirstChild("Objective") then
if workspace.Map.Objective:FindFirstChild("Entries") then
if workspace.Map.Objective.Entries:FindFirstChild("Highlight") then
    if workspace.Map.Objective.Entries:FindFirstChild("double portique") then
thingcpm = workspace.Map.Objective.Entries["double portique"].portique
thinf = workspace.Map.Objective.Entries["double portique"].Attachment.ProximityPrompt
    elseif workspace.Map.Objective.Entries:FindFirstChild("Model") then
        thingcpm = workspace.Map.Objective.Entries.Model.Door
thinf = workspace.Map.Objective.Entries.Model.Attachment.ProximityPrompt
    end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = thingcpm.CFrame
task.wait(1)
fireproximityprompt(thinf)
end
end
end
end
end)
end
end)

spawn(function()
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Awake and checkmons() then
local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.G, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.G, false, game)
end
end)
end
end)

spawn(function()
while task.wait(1) do
    pcall(function()
if _G.Settings.Auto_Retry and game:GetService("Players").LocalPlayer.PlayerGui.HUD.EndScreen.Visible then
task.wait(1)
local args = {
	"PlayAgain"
}
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("Interact"):FireServer(unpack(args))
end
end)
end
end)

spawn(function()
while task.wait(2) do
    pcall(function()
if _G.Settings.Auto_Gadget then
local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end
end)
end
end)

spawn(function()
while task.wait(5) do
    pcall(function()
if _G.Settings.Auto_Farm then
for i,v in pairs(workspace.Map:GetDescendants()) do
    if v.ClassName == "MeshPart" then
        if string.find(v.Name,"Gate") or string.find(v.Name,"Flag") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    elseif v.ClassName == "Part" then
        if v.Name == "WallrunPart" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end
end
end)
end
end)

spawn(function()
while task.wait(.7) do
    pcall(function()
if _G.Settings.Auto_Farm then
for i,v in pairs(workspace.Map:GetDescendants()) do
    if v.ClassName == "Highlight" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.Hitbox.CFrame
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
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Farm then
if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("StartRaid").Visible then
clicks(game:GetService("Players").LocalPlayer.PlayerGui.HUD.StartRaid)
end
method111 = 7
task.wait(.5)
method111 = 0
task.wait(.5)
method111 = -7
end
end)
end
end)

function skill(thing)

allslot = {}

for i,v in pairs(game.Players.LocalPlayer:GetChildren())do
    if string.find(v.Name, "Ult") then
mobName = string.match(v.Name, "(.-)Ult")
table.insert(allslot, mobName)
    end
end

if allslot[5] ~= nil then
maxamount = 5
elseif allslot[4] ~= nil then
maxamount = 4
elseif allslot[3] ~= nil then
maxamount = 3
elseif allslot[2] ~= nil then
maxamount = 2
end

local args = {
	"EquipAbility",
	allslot[math.random(1,maxamount)]
}
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Requests"):WaitForChild("FuncInteract"):InvokeServer(unpack(args))

end

function skills()
for i,v in pairs(_G.Settings.Skill_Select) do
local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[v], false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[v], false, game)
end
end

spawn(function()
while task.wait() do
    pcall(function()
if _G.Settings.Auto_Skill_Insane and checkmons() and not stopthingshit then
	if game:GetService("Players").LocalPlayer.PlayerGui.HUD.Tabs.DeathScreen.Visible == false then
skills()
skill()
task.wait()
equipslot()
task.wait()
else
	equipslot()
	end
end
end)
end
end)

spawn(function()
while task.wait(.5) do
    pcall(function()
if _G.Settings.Auto_Skill and checkmons() then
local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
task.wait(.5)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.X, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.X, false, game)
task.wait(.5)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
task.wait(.5)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.V, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.V, false, game)
task.wait(.5)
end
end)
end
end)

function checkob()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.ClassName == "Folder" then
return true
end
end
return false
end

spawn(function()
while task.wait(3) do
    pcall(function()
if _G.Settings.Auto_Switch then
    if game:GetService("Players").LocalPlayer.PlayerGui.HUD.LevelCompleted.Visible == false then
local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
end
end
end)
end
end)

spawn(function()
while task.wait(3) do
    pcall(function()
if _G.Settings.Auto_Skip then
local args = {
	"VoteSkipWave"
}
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("Interact"):FireServer(unpack(args))
end
end)
end
end)

spawn(function()
while task.wait(.2) do
    pcall(function()
if _G.Settings.Auto_Select_Card and selectcards() then
	task.wait(.5)
if selectcard(_G.Settings.One_Card) then task.wait(.5) return end
if selectcard(_G.Settings.Two_Card) then task.wait(.5) return end
if selectcard(_G.Settings.Three_Card) then task.wait(.5) return end
if selectcard(_G.Settings.Four_Card) then task.wait(.5) return end
if selectcard(_G.Settings.Five_Card) then task.wait(.5) return end
if selectcard(_G.Settings.Six_Card) then task.wait(.5) return end
if selectcard(_G.Settings.Seven_Card) then task.wait(.5) return end
end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag") and game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag"):FindFirstChild("PlayerName") then

game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag"):FindFirstChild("PlayerName").Text = ".gg/axelhub"
game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag"):FindFirstChild("PlayerName").TextColor3 = Color3.fromRGB(255, 175, 0)
end
end)
end
end)

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

local player = game.Players.LocalPlayer

function setCollision(state)
	if player.Character then
		for _, part in pairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
                if state == false then
				part.CanCollide = state
                elseif state == true then
                    if part.Name == "Torso" or part.Name == "Head" then
                part.CanCollide = state
                    end
                end
			end
		end
	end
end

spawn(function()
while task.wait() do
    pcall(function()
if Noclip or _G.Settings.Auto_Farm then
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
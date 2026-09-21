--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

_G.Key = "KEYLESS-467Q-KAMV-1N7J-3RNT"

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
    Icon = "door-open",
    Opened = true,
})

local Main = Section:Tab({
    Title = "Main",
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
    Title = "0.2.3",
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
    end
})

allmons = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Characters[_G.Settings.World_Select]:GetChildren()) do
    if string.find(v.Name, "Normal") then
    for i2,v2 in pairs(v:GetChildren()) do
        table.insert(allmons, v2.Name)
    end
    end
end

dropdowns["Enemies_Select"] = Main:Dropdown({
    Title = "Select Enemies",
    Desc = "select your enemies to farm.",
    Values = allmons,
    Value = _G.Settings.Enemies_Select or "" ,
    Multi = false,
    AllowNone = false,
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
    if string.find(v.Name, "Normal") then
    for i2,v2 in pairs(v:GetChildren()) do
        table.insert(allmons, v2.Name)
    end
    end
end

dropdowns["Enemies_Select"]:Refresh(allmons)
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

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Farm_Selection then
        for i,v in pairs(workspace.Server.Enemies.World[_G.Settings.World_Select]:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
        if string.find(v2.Name, _G.Settings.Enemies_Select) then
            local gymbros = v2:GetAttributes()
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and v3 > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.CFrame
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
    if _G.Settings.Auto_Quest then
        for i23,v23 in pairs(workspace.Server.Enemies.World:GetChildren()) do
        for i,v in pairs(v23:GetChildren()) do
    for i2,v2 in pairs(v:GetChildren()) do
for i6,v6 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UI.HUD.Quests.List:GetChildren()) do
if v6:FindFirstChild("Progress") and v6.Progress.Bar.Size ~= UDim2.new(1, 0, 1, 0) then
    if string.find(v6.Description.Text, v2.Name) then
            local gymbros = v2:GetAttributes()
            for i3,v3 in pairs(gymbros) do
                if i3 == "Health" and v3 > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.CFrame
                end
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
while task.wait() do
    pcall(function()
    if _G.Settings.Auto_Click then
local tuidui, ids = getClosestrandom()
local realid = tostring(ids)
local args = {
	{
		{
			"General",
			"Attack",
			"Click",
			{
                [realid] = true
            },
			n = 4
		},
		"\002"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

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

--[[
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
]]
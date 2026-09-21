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
workingreal = _G.Key
end

if pre(_G.Key) then
	Premiums = true
end

if response == nil then
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/keysystem.Lua"))()
local response = KeySystem:Init({
    Title = "AxelHub_AW3_Key",
    Link = GetKeyURL(),
    Verify = function(key)
    if pre(key) then
	Premiums = true
    end
if non_pre(key) then
response = true
workingreal = key
end
	return non_pre(key)
    end
})
end
if not response then 
if isfile("axelhub_aw3_key.key") then
delfile("axelhub_aw3_key.key")
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
if isfile("axelhub_aw3_key.key") then
delfile("axelhub_aw3_key.key")
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

        folder_name = "AxelHub/"..userid.."_AW3.JSON"

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
    return "AxelHub/"..userid.."_AW3.JSON"
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
    Title = "Axel Hub - Anime Warriors",
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

local Premium = Section:Tab({
    Title = "Premium",
    Icon = "crown", -- optional
    Locked = false,
})

local Island = Section:Tab({
    Title = "Island",
    Icon = "door-closed", -- optional
    Locked = false,
})

local Raid = Section:Tab({
    Title = "Raid",
    Icon = "sun-dim", -- optional
    Locked = false,
})

local Card = Section:Tab({
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

tablemonster = {"Meteorite"}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Enemies:GetChildren()) do
table.insert(tablemonster, v.Name)
end

dropdowns["Enemies_Select"] = Main:Dropdown({
    Title = "Select Your Enemies",
    Desc = "",
    Values = tablemonster,
    Value = _G.Settings.Enemies_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Enemies_Select = option
    end
})

local testwebhook = Main:Button({
    Title = "Refresh Enemies List",
    Desc = "",
    Locked = false,
    Callback = function()
tablemonster = {"Meteorite"}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Enemies:GetChildren()) do
table.insert(tablemonster, v.Name)
end

dropdowns["Enemies_Select"]:Refresh(tablemonster)
    end
})

if _G.Settings.Send_Distance == nil then
_G.Settings.Send_Distance = 20
end

local Slider = Main:Slider({
    Title = "Distance",
    Desc = "distance from sending your warriors",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 300,
        Default = _G.Settings.Send_Distance,
    },
    Callback = function(value)
        _G.Settings.Send_Distance = value
    end
})

toggles["Auto_Farm_Selection"] = Main:Toggle({
    Title = "Auto Farm Selection",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Farm_Selection or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Farm_Selection = state
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
    end
})

toggles["Send_Warriors"] = Main:Toggle({
    Title = "Auto Send Warriors",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Send_Warriors or false, -- default value
    Callback = function(state) 
        _G.Settings.Send_Warriors = state
    end
})

local Section = Main:Section({ 
    Title = "Boss Menu",
})

Main:Divider()

dropdowns["Boss_Selection"] = Main:Dropdown({
    Title = "Select Boss",
    Desc = "",
    Values = {"Freeze Prime","Super Cel (Prime)","Orichi","Enil Storm","Deva","Byaku (Unleashed)","Tear (Summer)","Deo, Greatest High"},
    Value = _G.Settings.Boss_Selection or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Boss_Selection = option
		for i,v in pairs(_G.Settings.Boss_Selection) do
	lastkeys = i
end
    end
})

toggles["Auto_Boss_Select"] = Main:Toggle({
    Title = "Auto Secret Boss",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Boss_Select or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Boss_Select = state
    end
})

local Section = Main:Section({ 
    Title = "Star Menu",
})

Main:Divider()

dropdowns["Select_Star"] = Main:Dropdown({
    Title = "Select Star",
    Desc = "",
    Values = {"Crusader","Nemak","Corps","Ninja","Sky","Rain","Soul","Summer","Sorcerer"},
    Value = _G.Settings.Select_Star or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Select_Star = option
    end
})

dropdowns["Star_Mode"] = Main:Dropdown({
    Title = "Select Your Open Star Mode",
    Desc = "",
    Values = {"Saved Position","First Position"},
    Value = _G.Settings.Star_Mode or "First Position",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Star_Mode = option
    end
})

local finishanos = Main:Button({
    Title = "Save Position To AFK",
    Desc = "",
    Locked = false,
    Callback = function()
_G.Settings.Saved_Position_Star = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
})

toggles["Teleport_Back"] = Main:Toggle({
    Title = "Teleport Back",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Teleport_Back or false, -- default value
    Callback = function(state) 
        _G.Settings.Teleport_Back = state
    end
})

toggles["Auto_Shiny_Potion"] = Main:Toggle({
    Title = "Auto Un/Pause Shiny Potion",
    Desc = "auto unpanse/pause shiny potion between 12450",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Shiny_Potion or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Shiny_Potion = state
    end
})

toggles["Auto_Open_Star"] = Main:Toggle({
    Title = "Auto Star",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Open_Star or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Open_Star = state
    end
})

local Section = Main:Section({ 
    Title = "Team Menu",
})

Main:Divider()

dropdowns["Main_Build"] = Main:Dropdown({
    Title = "Select Your Main Team",
    Desc = "",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.Main_Build or "1",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Main_Build = option
    end
})

dropdowns["Luck_Build"] = Main:Dropdown({
    Title = "Select Your Luck Team",
    Desc = "",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.Luck_Build or "2",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Luck_Build = option
    end
})

toggles["Auto_Switch_Team"] = Main:Toggle({
    Title = "Auto Switch Team",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Switch_Team or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Switch_Team = state
    end
})

local Section = Main:Section({ 
    Title = "Accessories Loadout Menu",
})

Main:Divider()

dropdowns["Main_Build_Acc"] = Main:Dropdown({
    Title = "Select Your Main Loadout",
    Desc = "",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.Main_Build_Acc or "1",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Main_Build_Acc = option
    end
})

dropdowns["Luck_Build_Acc"] = Main:Dropdown({
    Title = "Select Your Luck Loadout",
    Desc = "",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.Luck_Build_Acc or "2",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Luck_Build_Acc = option
    end
})

toggles["Auto_Switch_Acc"] = Main:Toggle({
    Title = "Auto Switch Accessories",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Switch_Accessories or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Switch_Accessories = state
    end
})

local Section = Island:Section({ 
    Title = "Island Menu",
})

Main:Divider()

local testwebhook = Island:Button({
    Title = "Hub",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.6685791, 3063.20483, 17.3197708, -0.992003143, 6.79679957e-08, 0.126213089, 7.02066316e-08, 1, 1.32886955e-08, -0.126213089, 2.20434231e-08, -0.992003143)
    end
})


local testwebhook = Island:Button({
    Title = "Planet Nemak",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(833.039429, 35.1249962, 2885.3689, 0.559731901, -4.91648606e-08, -0.82867372, 6.97310298e-08, 1, -1.22293944e-08, 0.82867372, -5.09390894e-08, 0.559731901)
    end
})

local testwebhook = Island:Button({
    Title = "Future City",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(702.854553, 55.6182747, -250.659561, -0.98912853, -5.11996809e-08, 0.147053659, -4.96403274e-08, 1, 1.42738319e-08, -0.147053659, 6.81886236e-09, -0.98912853)
    end
})

local testwebhook = Island:Button({
    Title = "Sand Village",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2260.44971, 32.2402458, 1470.48608, 0.657876492, -3.88494996e-08, -0.753125846, -3.07960022e-08, 1, -7.84855061e-08, 0.753125846, 7.48270352e-08, 0.657876492)
    end
})

local testwebhook = Island:Button({
    Title = "Sky Island",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2112.17505, 912.999939, -2156.78027, -0.218417063, 2.6905056e-09, 0.975855529, 4.19814983e-09, 1, -1.81743909e-09, -0.975855529, 3.699828e-09, -0.218417063)
    end
})

local testwebhook = Island:Button({
    Title = "Rain Island",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1141.64038, 56.8958969, -3018.57178, -0.663311958, 4.07410106e-09, 0.748342991, 5.10462916e-09, 1, -9.19550991e-10, -0.748342991, 3.21006421e-09, -0.663311958)
    end
})

local testwebhook = Island:Button({
    Title = "Soul Island",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3755.02441, 49.1765442, -653.205017, 0.960143685, -4.17725632e-09, -0.279506922, 4.98192865e-09, 1, 2.16850071e-09, 0.279506922, -3.47455575e-09, 0.960143685)
    end
})

local testwebhook = Island:Button({
    Title = "Cairo Island",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1852.87805, 62.6404152, 4017.9624, 0.994462967, 3.14788612e-11, 0.10508763, 1.74760006e-09, 1, -1.6837399e-08, -0.10508763, 1.69278209e-08, 0.994462967)
    end
})

local Section = Premium:Section({ 
    Title = "Premium Doesn't have anything to use rn.",
})

Premium:Divider()

local Section = Raid:Section({ 
    Title = "Escort Menu",
})

Raid:Divider()

toggles["Auto_Escort_Join"] = Raid:Toggle({
    Title = "Auto Join Other Escort",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Escort_Join or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Escort_Join = state
    end
})

toggles["Teleport_At_Cart"] = Raid:Toggle({
    Title = "Only Teleport To Cart",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Teleport_At_Cart or false, -- default value
    Callback = function(state) 
        _G.Settings.Teleport_At_Cart = state
    end
})

toggles["Auto_Escort"] = Raid:Toggle({
    Title = "Auto Escort",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Escort or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Escort = state
    end
})

toggles["Auto_Retry_Escort"] = Raid:Toggle({
    Title = "Auto Retry Escort",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Retry_Escort or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Retry_Escort = state
    end
})

dropdowns["Selected_Tier"] = Raid:Dropdown({
    Title = "Select Tier",
    Desc = "",
    Values = {"common","rare","epic","legendary","mythical"},
    Value = _G.Settings.Selected_Tier or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Selected_Tier = option
    end
})

local Section = Raid:Section({ 
    Title = "Summer Menu",
})

Raid:Divider()

toggles["Auto_Join_Invasion"] = Raid:Toggle({
    Title = "Auto Join Other Invasion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Join_Invasion or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Join_Invasion = state
    end
})

toggles["Auto_Invasion"] = Raid:Toggle({
    Title = "Auto Invasion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Invasion or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Invasion = state
    end
})

toggles["Wait_For_Creator"] = Raid:Toggle({
    Title = "Wait For Continue",
    Desc = "not clicking retry or continue just wait for owner.",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Wait_For_Creator or false, -- default value
    Callback = function(state) 
        _G.Settings.Wait_For_Creator = state
    end
})

toggles["Stay_Still_Invasion"] = Raid:Toggle({
    Title = "Stay still in Invasion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Stay_Still_Invasion or false, -- default value
    Callback = function(state) 
        _G.Settings.Stay_Still_Invasion = state
    end
})

if _G.Settings.Start_Delay_Invasion == nil then
_G.Settings.Start_Delay_Invasion = 5
end

slides["Start_Delay_Invasion"] = Raid:Slider({
    Title = "Invasion Start Delay",
    Desc = "Delay Before Starting",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 15,
        Default = _G.Settings.Start_Delay_Invasion,
    },
    Callback = function(value)
        _G.Settings.Start_Delay_Invasion = value
    end
})

toggles["Auto_Retry_Invasion"] = Raid:Toggle({
    Title = "Auto Retry Invasion",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Retry_Invasion or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Retry_Invasion = state
    end
})

toggles["Auto_Digging"] = Raid:Toggle({
    Title = "Auto Dig (Summer Event)",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Digging or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Digging = state
    end
})

local Section = Raid:Section({ 
    Title = "Raid Menu",
})

Raid:Divider()

thingupsss = {}

for i,v in pairs(game:GetService("StarterPlayer").src.common.world.client.raids:GetChildren()) do
	table.insert(thingupsss, v.Name)
end

dropdowns["Raid_Selection"] = Raid:Dropdown({
    Title = "Select Raid",
    Desc = "",
    Values = thingupsss,
    Value = _G.Settings.Raid_Selection or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Raid_Selection = option
    end
})

dropdowns["Hard_Raid"] = Raid:Dropdown({
    Title = "Hard Mode?",
    Desc = "you must select this also if you need your raid to be hard (raid select and hard select)",
    Values = thingupsss,
    Value = _G.Settings.Hard_Raid or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Hard_Raid = option
    end
})

toggles["Auto_Raid"] = Raid:Toggle({
    Title = "Auto Raid",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Raid or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Raid = state
		joiningraid = false
    end
})

toggles["Auto_Shibuya"] = Raid:Toggle({
    Title = "Auto Shibuya",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Shibuya or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Shibuya = state
    end
})

toggles["Auto_Retry_Shibuya"] = Raid:Toggle({
    Title = "Auto Retry Shibuya",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Retry_Shibuya or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Retry_Shibuya = state
    end
})

toggles["Auto_Infiltration"] = Raid:Toggle({
    Title = "Auto Infiltration",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Infiltration or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Infiltration = state
    end
})

dropdowns["Selected_Chapter"] = Raid:Dropdown({
    Title = "Select Chapter",
    Desc = "",
    Values = {"I","II","III"},
    Value = _G.Settings.Selected_Chapter or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Selected_Chapter = option
    end
})

local Section = Raid:Section({ 
    Title = "Gauntlet Menu",
})

Raid:Divider()

toggles["Auto_Gauntlet"] = Raid:Toggle({
    Title = "Auto Gauntlet",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Gauntlet or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Gauntlet = state
		canoutnow = false
    end
})

toggles["SkipTo30Floor"] = Raid:Toggle({
    Title = "Skip To Floor 30",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.SkipTo30Floor or false, -- default value
    Callback = function(state) 
        _G.Settings.SkipTo30Floor = state
		canoutnow = false
    end
})

if _G.Settings.Floor_To_Leave == nil then
_G.Settings.Floor_To_Leave = 20
end

slides["Floor_To_Leave"] = Raid:Slider({
    Title = "Floor To Leave",
    Desc = "select floor to leave in gauntlet",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.Settings.Floor_To_Leave,
    },
    Callback = function(value)
        _G.Settings.Floor_To_Leave = value
    end
})

toggles["Auto_Leave_Gauntlet"] = Raid:Toggle({
    Title = "Auto Leave Gauntlet",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Leave_Gauntlet or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Leave_Gauntlet = state
    end
})

local Section = Raid:Section({ 
    Title = "Gauntlet Misc Menu",
})

Raid:Divider()

table_gauntlet = {"Star Remnant","Damage Boost","Cash Boost","Speed I Boost","Drops Boost","Luck Boost","Super Damage Boost","Super Cash Boost","Speed II Boost","Super Drops Boost","Super Luck Boost","Ultra Damage Boost","Ultra Cash Boost","Speed III Boost","Ultra Drops Boost","Omega Luck Boost","Mythical Potion","Shiny Potion"}

dropdowns["Gauntlet_Shop_Selection"] = Raid:Dropdown({
    Title = "Select Gauntlet Shop Items",
    Desc = "",
    Values = table_gauntlet,
    Value = _G.Settings.Gauntlet_Shop_Selection or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Gauntlet_Shop_Selection = option
		lastkey = nil
		for i,v in pairs(_G.Settings.Gauntlet_Shop_Selection) do
            lastkey = i
		end
    end
})

toggles["Auto_Buy_Gauntlet_Shop"] = Raid:Toggle({
    Title = "Auto Buy Gauntlet Shop",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Buy_Gauntlet_Shop or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Buy_Gauntlet_Shop = state
		readytobuy = true
		BuyingGauntlet = false
    end
})

table_gauntlet_boost = {"Damage Boost","Cash Boost","Speed I Boost","Drops Boost","Luck Boost","Super Damage Boost","Super Cash Boost","Speed II Boost","Super Drops Boost","Super Luck Boost","Ultra Damage Boost","Ultra Cash Boost","Speed III Boost","Ultra Drops Boost","Omega Luck Boost"}

dropdowns["Gauntlet_Boost_Pauser"] = Raid:Dropdown({
    Title = "Select Gauntlet Boost Pauser",
    Desc = "",
    Values = table_gauntlet_boost,
    Value = _G.Settings.Gauntlet_Boost_Pauser or {},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Gauntlet_Boost_Pauser = option
    end
})

toggles["Auto_Gauntlet_Boost_Pauser"] = Raid:Toggle({
    Title = "Auto Un/Pause Boost On Gauntlet",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Gauntlet_Boost_Pauser or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Gauntlet_Boost_Pauser = state
    end
})

local Section = Card:Section({ 
    Title = "Gauntlet Card Menu",
})

Card:Divider()

table_card = {"Lucky Blessing","Kingslayer","Cursed Greed","Reinforcements","Battle Momentum","Glass Cannon","Overflowing Wealth","Boss Killer","Warrior Blessing","Sacrificial Offering","Endless Horde","Elite Calling","All or Nothing","Time Rush","Fate Rewrite"}

toggles["Auto_Select_Card"] = Card:Toggle({
    Title = "Auto Select Card",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Select_Card or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Select_Card = state
    end
})

dropdowns["One_Card"] = Card:Dropdown({
    Title = "Select 1 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.One_Card or "Lucky Blessing",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.One_Card = option
    end
})

dropdowns["Two_Card"] = Card:Dropdown({
    Title = "Select 2 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Two_Card or "Kingslayer",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Two_Card = option
    end
})

dropdowns["Three_Card"] = Card:Dropdown({
    Title = "Select 3 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Three_Card or "Cursed Greed",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Three_Card = option
    end
})

dropdowns["Four_Card"] = Card:Dropdown({
    Title = "Select 4 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Four_Card or "Reinforcements",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Four_Card = option
    end
})

dropdowns["Five_Card"] = Card:Dropdown({
    Title = "Select 5 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Five_Card or "Battle Momentum",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Five_Card = option
    end
})

dropdowns["Six_Card"] = Card:Dropdown({
    Title = "Select 6 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Six_Card or "Glass Cannon",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Six_Card = option
    end
})

dropdowns["Seven_Card"] = Card:Dropdown({
    Title = "Select 7 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Seven_Card or "Overflowing Wealth",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Seven_Card = option
    end
})

dropdowns["Eight_Card"] = Card:Dropdown({
    Title = "Select 8 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Eight_Card or "Boss Killer",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Eight_Card = option
    end
})

dropdowns["Nine_Card"] = Card:Dropdown({
    Title = "Select 9 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Nine_Card or "Warrior Blessing",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Nine_Card = option
    end
})

dropdowns["Ten_Card"] = Card:Dropdown({
    Title = "Select 10 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Ten_Card or "Sacrificial Offering",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Ten_Card = option
    end
})

dropdowns["Eleven_Card"] = Card:Dropdown({
    Title = "Select 11 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Eleven_Card or "Endless Horde",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Eleven_Card = option
    end
})

dropdowns["Twelve_Card"] = Card:Dropdown({
    Title = "Select 12 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Twelve_Card or "Elite Calling",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Twelve_Card = option
    end
})

dropdowns["Thirteen_Card"] = Card:Dropdown({
    Title = "Select 13 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Thirteen_Card or "All or Nothing",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Thirteen_Card = option
    end
})

dropdowns["Fourteen_Card"] = Card:Dropdown({
    Title = "Select 14 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Fourteen_Card or "Time Rush",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Fourteen_Card = option
    end
})

dropdowns["Fifteen_Card"] = Card:Dropdown({
    Title = "Select 15 Card",
    Desc = "",
    Values = table_card,
    Value = _G.Settings.Fifteen_Card or "Fate Rewrite",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Fifteen_Card = option
    end
})

local Section = Card:Section({ 
    Title = "Invasion Card Menu",
})

Card:Divider()

table_card31 = {"Lucky Blessing","Kingslayer","Cursed Greed","Reinforcements","Battle Momentum","Glass Cannon","Overflowing Wealth","Boss Killer","Warrior Blessing","Sacrificial Offering","Endless Horde","Elite Calling","All or Nothing","Time Rush","Fate Rewrite","Barricade Repair","Warrior Reinforcement"}

dropdowns["One_Card_Ins"] = Card:Dropdown({
    Title = "Select 1 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.One_Card_Ins or "Lucky Blessing",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.One_Card_Ins = option
    end
})

dropdowns["Two_Card_Ins"] = Card:Dropdown({
    Title = "Select 2 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Two_Card_Ins or "Kingslayer",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Two_Card_Ins = option
    end
})

dropdowns["Three_Card_Ins"] = Card:Dropdown({
    Title = "Select 3 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Three_Card_Ins or "Cursed Greed",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Three_Card_Ins = option
    end
})

dropdowns["Four_Card_Ins"] = Card:Dropdown({
    Title = "Select 4 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Four_Card_Ins or "Reinforcements",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Four_Card_Ins = option
    end
})

dropdowns["Five_Card_Ins"] = Card:Dropdown({
    Title = "Select 5 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Five_Card_Ins or "Battle Momentum",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Five_Card_Ins = option
    end
})

dropdowns["Six_Card_Ins"] = Card:Dropdown({
    Title = "Select 6 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Six_Card_Ins or "Glass Cannon",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Six_Card_Ins = option
    end
})

dropdowns["Seven_Card_Ins"] = Card:Dropdown({
    Title = "Select 7 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Seven_Card_Ins or "Overflowing Wealth",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Seven_Card_Ins = option
    end
})

dropdowns["Eight_Card_Ins"] = Card:Dropdown({
    Title = "Select 8 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Eight_Card_Ins or "Boss Killer",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Eight_Card_Ins = option
    end
})

dropdowns["Nine_Card_Ins"] = Card:Dropdown({
    Title = "Select 9 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Nine_Card_Ins or "Warrior Blessing",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Nine_Card_Ins = option
    end
})

dropdowns["Ten_Card_Ins"] = Card:Dropdown({
    Title = "Select 10 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Ten_Card_Ins or "Sacrificial Offering",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Ten_Card_Ins = option
    end
})

dropdowns["Eleven_Card_Ins"] = Card:Dropdown({
    Title = "Select 11 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Eleven_Card_Ins or "Endless Horde",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Eleven_Card_Ins = option
    end
})

dropdowns["Twelve_Card_Ins"] = Card:Dropdown({
    Title = "Select 12 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Twelve_Card_Ins or "Elite Calling",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Twelve_Card_Ins = option
    end
})

dropdowns["Thirteen_Card_Ins"] = Card:Dropdown({
    Title = "Select 13 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Thirteen_Card_Ins or "All or Nothing",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Thirteen_Card_Ins = option
    end
})

dropdowns["Fourteen_Card_Ins"] = Card:Dropdown({
    Title = "Select 14 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Fourteen_Card_Ins or "Time Rush",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Fourteen_Card_Ins = option
    end
})

dropdowns["Fifteen_Card_Ins"] = Card:Dropdown({
    Title = "Select 15 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Fifteen_Card_Ins or "Fate Rewrite",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Fifteen_Card_Ins = option
    end
})

dropdowns["Sixteen_Card_Ins"] = Card:Dropdown({
    Title = "Select 16 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Sixteen_Card_Ins or "Barricade Repair",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Sixteen_Card_Ins = option
    end
})

dropdowns["Seventeen_Card_Ins"] = Card:Dropdown({
    Title = "Select 17 Card",
    Desc = "",
    Values = table_card31,
    Value = _G.Settings.Seventeen_Card_Ins or "Warrior Reinforcement",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Seventeen_Card_Ins = option
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
            url = "https://tr.rbxcdn.com/180DAY-73e8165db620fa1200ad71fe2117ee58/768/432/Image/Webp/noFilter"
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

if isfolder("AxelConfig_AW3") then
for i,v in pairs(listfiles("AxelConfig_AW3")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_AW3")
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
if not isfile("AxelConfig_AW3/"..Config_Name..".JSON") then
    writefile("AxelConfig_AW3/"..Config_Name..".JSON", "")
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

if isfolder("AxelConfig_AW3") then
for i,v in pairs(listfiles("AxelConfig_AW3")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_AW3")
end

DropdownConfig:Refresh(configall)
    end
})

local Button = Settings:Button({
    Title = "Delete Config",
    Desc = "",
    Locked = false,
    Callback = function()
delfile("AxelConfig_AW3/"..Config_Select)
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
if not isfile("AxelConfig_AW3/"..Config_Select) then
    writefile("AxelConfig_AW3/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
else

SaveConfig("AxelConfig_AW3/"..Config_Select)
end
    end
})

local Button = Settings:Button({
    Title = "Load Config",
    Desc = "",
    Locked = false,
    Callback = function()

prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_AW3/"..Config_Select))

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

function checknotify(froms)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, froms) then
return true
	end
end
return false
end

function checkmap()
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name,"gauntlet") then
return true
	end
end
return false
end

function checkmapinfi()
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name,"infiltration") then
return true
	end
end
return false
end

function checkmapescort()
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name,"escort") then
return true
	end
end
return false
end

function attacknearest()
local yourmon = {}

for i,v in pairs(workspace.World.Warriors:GetChildren()) do
	local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if distance <= 20 and v:GetAttribute("target") == "" then
table.insert(yourmon,v.Name)
	end
end

for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if not v:GetAttribute("dead") and distance <= _G.Settings.Send_Distance then
local Event = game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].remo.src.container["enemies.sendAndRetreat"]
Event:FireServer(
    v.Name,
{yourmon[1],yourmon[2],yourmon[3],yourmon[4]}
)
end
end
end

function checkmons()
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") and not v:GetAttribute("dead") then
		local distwo = math.abs(v.HumanoidRootPart.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
return true
		end
	end
end
return false
end

function nearestselection()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
	if string.find(v.Name, "enemy") and v.Frame.TextLabel.Text == _G.Settings.Enemies_Select then
local str = v.Name

local result = str:match("^enemy%-overhead%-(.+)")
for i2,v2 in pairs(workspace.World.Enemies:GetChildren()) do
	if v2.Name==result and not v2:GetAttribute("dead") then
return v2
	end
end
	end
end
end

function checkindistance()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
	if string.find(v.Name, "enemy") and v.Frame.TextLabel.Text == _G.Settings.Enemies_Select then
local str = v.Name

local result = str:match("^enemy%-overhead%-(.+)")
for i2,v2 in pairs(workspace.World.Enemies:GetChildren()) do
	if string.find(v2.Name,result) and not v2:GetAttribute("dead") then
local dis = (v2.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if dis < 15 then
return true
end
	end
end
	end
end
return false
end

openegg = false

function checkraidboss()
for i,v in pairs(workspace.World.FX:GetChildren()) do
	if v.ClassName == "Model" and v:FindFirstChild("HumanoidRootPart") and raidreallyup then
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

function buy_gauntlet()
if _G.Settings.Auto_Buy_Gauntlet_Shop then
if readytobuy == false then
BuyingGauntlet = true
return true
else
BuyingGauntlet = false
return false
end
end
end

function checknearboss()
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
local dis = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if not v:GetAttribute("dead") and dis <= 60 and v.Torso.Size == MonSize then
return true
end
end
return false
end

function Auto_Boss_Select()
if _G.Settings.Auto_Boss_Select and Bossnow ~= "Checking again" then
return true
end
if not _G.Settings.Auto_Boss_Select then
Bossnow = nil
end
return false
end

function open_egg()
if _G.Settings.Auto_Open_Star then
	if _G.Settings.Star_Mode == "First Position" then
if _G.Settings.Select_Star == "Nemak" then
cfegg = CFrame.new(808.272339, 35.0468712, 2892.41992, -0.50030756, 1.8938545e-08, 0.865847766, -1.17006604e-09, 1, -2.25489281e-08, -0.865847766, -1.22944979e-08, -0.50030756)
elseif _G.Settings.Select_Star == "Corps" then
cfegg = CFrame.new(680.520935, 55.4914627, -242.488937, 0.633002758, -6.5050628e-08, 0.774149537, -1.42223717e-08, 1, 9.56577821e-08, -0.774149537, -7.15618853e-08, 0.633002758)
elseif _G.Settings.Select_Star == "Ninja" then
cfegg = CFrame.new(-2248.57812, 32.240242, 1469.51074, -0.371845305, 1.2839326e-08, -0.928294718, 1.73296044e-08, 1, 6.88940105e-09, 0.928294718, -1.35251881e-08, -0.371845305)
elseif _G.Settings.Select_Star == "Sky" then
cfegg = CFrame.new(-2112.17505, 912.999939, -2156.78027, -0.218417063, 2.6905056e-09, 0.975855529, 4.19814983e-09, 1, -1.81743909e-09, -0.975855529, 3.699828e-09, -0.218417063)
elseif _G.Settings.Select_Star == "Rain" then
cfegg = CFrame.new(1211.4679, 71.6314011, -2991.10522, 0.674481988, -1.06232719e-07, -0.738291323, 8.09011169e-08, 1, -6.9981013e-08, 0.738291323, -1.25276562e-08, 0.674481988)
elseif _G.Settings.Select_Star == "Soul" then
cfegg = CFrame.new(3755.02441, 49.1765442, -653.205017, 0.960143685, -4.17725632e-09, -0.279506922, 4.98192865e-09, 1, 2.16850071e-09, 0.279506922, -3.47455575e-09, 0.960143685)
elseif _G.Settings.Select_Star == "Summer" then
cfegg = CFrame.new(-405.297668, -1475.88843, 312.581818, 0.639503837, 2.88212707e-08, 0.76878792, -2.78284311e-08, 1, -1.43406025e-08, -0.76878792, -1.22232908e-08, 0.639503837)
elseif _G.Settings.Select_Star == "Crusader" then
cfegg = CFrame.new(-1898.61487, 62.9368553, 3586.09619, -0.984321356, 9.3609227e-09, -0.176384538, 1.09081979e-08, 1, -7.80254616e-09, 0.176384538, -9.60425073e-09, -0.984321356)
elseif _G.Settings.Select_Star == "Sorcerer" then
cfegg = CFrame.new(4385.89893, 55.9847374, -3435.89966, -0.9599666, -1.08903762e-07, 0.280114442, -1.15663184e-07, 1, -7.60056462e-09, -0.280114442, -3.9695216e-08, -0.9599666)
end
elseif _G.Settings.Star_Mode == "Saved Position" then
	cfegg = stringToCFrame(_G.Settings.Saved_Position_Star)
end

oldcf = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

if openegg == false then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cfegg
task.wait(.3)
local args = {
	_G.Settings.Select_Star,
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("eggs.setAuto"):FireServer(unpack(args))
task.wait(.1)
if _G.Settings.Teleport_Back then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcf
end
task.wait(.5)
return true
end
end
end

function Auto_Invasion()
if _G.Settings.Auto_Invasion or _G.Settings.Auto_Join_Invasion then
if insvhere then
return true
end
end
return false
end


function Auto_Raid()
if _G.Settings.Auto_Raid then
if raidhere then
return true
end
if raidboss or raidhere then
return true
elseif not raidboss then
	return false
end
end
return false
end

function Auto_Gauntlet()
if _G.Settings.Auto_Gauntlet then
if not Guantlet_Notify and checkmap() then
	gauntleting = true
return true
elseif Guantlet_Notify then
	gauntleting = true
	return true
end
end
gauntleting = false
return false
end

function Auto_Infiltration()
if _G.Settings.Auto_Infiltration then
if infihere then
	infirllyhere = true
	return true
end
end
infirllyhere = false
return false
end

function Auto_Shibuya()
if _G.Settings.Auto_Shibuya then
if shibhere then
	shibrllyhere = true
	return true
end
end
shibrllyhere = false
return false
end

function Auto_Escort()
if _G.Settings.Auto_Escort then
if escorthere then
	escorthererlly = true
	return true
end
end
escorthererlly = false
return false
end

function Auto_Farm_Selection()
if _G.Settings.Auto_Farm_Selection and not checkindistance() then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nearestselection().HumanoidRootPart.CFrame
return true
end
return false
end

function priority_checker(prio)
if prio == "Farm Selection" then
if Auto_Farm_Selection() then return true end
elseif prio == "None" then
if Auto_Gauntlet() then BuyingGauntlet = false infirllyhere = false escorthererlly = false return true end
if Auto_Invasion() then BuyingGauntlet = false return true end
if Auto_Escort() then BuyingGauntlet = false return true end
if Auto_Infiltration() then BuyingGauntlet = false return true end
if Auto_Raid() then BuyingGauntlet = false return true end
if Auto_Boss_Select() then return true end
if buy_gauntlet() then return true end
if open_egg() then return true end
if Auto_Farm_Selection() then return true end
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

function clickthingshit()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, "Continue") then
for i2,v2 in pairs(v:GetChildren()) do
	clicks(v2.Parent)
end
	end
end
end

function clickthingshitshib()
if _G.Settings.Auto_Retry_Shibuya then
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("shibuya.replay"):InvokeServer()

	task.wait(.3)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("shibuya.leaveShibuya"):FireServer()
task.wait(3)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()

elseif not _G.Settings.Auto_Retry_Shibuya then
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("shibuya.leaveShibuya"):FireServer()
end
end

function clickthingshitinsv()
if _G.Settings.Wait_For_Creator then
resultse = nil

for i,v in pairs(workspace.GamemodeMapCull:GetChildren()) do
	if string.find(v.Name, "invasion") then
resultse = v.Name:match("^[^-]+%-(.+)$")
	end
end

	local args = {
	resultse
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("invasions.acceptReplay"):InvokeServer(unpack(args))
elseif not _G.Settings.Wait_For_Creator then
if _G.Settings.Auto_Retry_Invasion then
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("invasions.replay"):InvokeServer()

	task.wait(.3)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("invasions.leaveInvasion"):FireServer()
task.wait(_G.Settings.Start_Delay_Invasion)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()

elseif not _G.Settings.Auto_Retry_Invasion then
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("invasions.leaveInvasion"):FireServer()
end
end
end

function clickthingshitescort()
if _G.Settings.Auto_Retry_Escort then
	for i,v in pairs(_G.Settings.Selected_Tier) do
local args = {
	v
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("escorts.replay"):InvokeServer(unpack(args))
	task.wait(3)
	end
task.wait(.4)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("escorts.leaveEscort"):FireServer()

elseif not _G.Settings.Auto_Retry_Escort then
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("escorts.leaveEscort"):FireServer()
end
end

function clickthingshit2()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, "Gauntlet") and string.find(v.Text, "pened") then
clicks(v)
	end
end
end

function clickthingshit233()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, "Continue") then
for i2,v2 in pairs(v.Parent.Parent.Parent:GetDescendants()) do
	if v2.ClassName == "TextButton" then
clicks(v2)
	end
end
	end
end
end

function clickthingshit23()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, "Gauntlet") and string.find(v.Text, "pened") then
return true
	end
end
return false
end

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Send_Warriors then
attacknearest()
end
end)
end
end)

function clickparent(froms)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
if v.ClassName == "TextLabel" and string.find(v.Text, froms) then
clicks(v.Parent)
	end
end
end

spawn(function()
while task.wait(8) do
pcall(function()
if _G.Settings.Auto_Leave_Gauntlet and gauntleting and _G.Settings.Auto_Gauntlet then
text = nil

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
if v.ClassName == "TextLabel" and string.find(v.Text, "Floor") then
text = v.Text
	end
end

if text ~= nil then
local floor = tonumber(text:match("%d+"))
if floor >= _G.Settings.Floor_To_Leave then
clickparent("Quit")
task.wait(1)
clickparent("I Understand")
Guantlet_Notify = true
task.wait(2)
Guantlet_Notify = false
end
end
end
end)
end
end)

canoutnow = false

function selectcard(name)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, name) then
for i2,v2 in pairs(v.Parent.Parent:GetChildren()) do
	if v2.Name == "TextButton" then
clicks(v2)
	end
end
	end
end
end

spawn(function()
while task.wait(3) do
pcall(function()
if _G.Settings.Auto_Gauntlet then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "gauntlet") then
for i2,v2 in pairs(v:GetChildren()) do
	if v2.ClassName == "Model" then
        if v2:FindFirstChild("Button") then
local distance = (v2.FloorCutout.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance <= 30 then
if _G.Settings.Auto_Select_Card and canoutnow == false then
canoutnow = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.GauntletCards.HumanoidRootPart.CFrame
task.wait(.3)
fireproximityprompt(v2.GauntletCards.HumanoidRootPart.ProximityPrompt)
task.wait(5)
selectcard(_G.Settings.Fifteen_Card)
task.wait(.1)
selectcard(_G.Settings.Fourteen_Card)
task.wait(.1)
selectcard(_G.Settings.Thirteen_Card)
task.wait(.1)
selectcard(_G.Settings.Twelve_Card)
task.wait(.1)
selectcard(_G.Settings.Eleven_Card)
task.wait(.1)
selectcard(_G.Settings.Ten_Card)
task.wait(.1)
selectcard(_G.Settings.Nine_Card)
task.wait(.1)
selectcard(_G.Settings.Eight_Card)
task.wait(.1)
selectcard(_G.Settings.Seven_Card)
task.wait(.1)
selectcard(_G.Settings.Six_Card)
task.wait(.1)
selectcard(_G.Settings.Five_Card)
task.wait(.1)
selectcard(_G.Settings.Four_Card)
task.wait(.1)
selectcard(_G.Settings.Three_Card)
task.wait(.1)
selectcard(_G.Settings.Two_Card)
task.wait(.1)
selectcard(_G.Settings.One_Card)
task.wait(1)
canoutnow = true
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.FloorCutout.CFrame
canoutnow = true
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
while task.wait(3) do
pcall(function()
if _G.Settings.Auto_Gauntlet then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "gauntlet") then
for i2,v2 in pairs(v:GetChildren()) do
	if v2.ClassName == "Model" then
        if v2:FindFirstChild("Button") then
local distance = (v2.FloorCutout.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance <= 200 and canoutnow == true then
	if _G.Settings.Auto_Select_Card then
task.wait(15)
	end
task.wait(3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.Button.press.CFrame
task.wait(1)
fireproximityprompt(v2.Button.press.ProximityPrompt)
task.wait(1)
canoutnow = false
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
while task.wait(10) do
pcall(function()
if _G.Settings.Auto_Shiny_Potion then
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, "Pity:") then
local text = v.Text

local number = text:match(":%s*([%d,]+)/")
number2 = number:gsub(",", "")

if tonumber(number2) >= 12450 then
local args = {
	"Shiny Potion",
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("items.setBoostRunning"):FireServer(unpack(args))
elseif tonumber(number2) < 12450 then
local args = {
	"Shiny Potion",
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("items.setBoostRunning"):FireServer(unpack(args))
end
	end
end
end
end)
end
end)

spawn(function()
while task.wait(10) do
pcall(function()
if _G.Settings.Auto_Digging then
	for i = 1,50 do
local args = {
	math.random(1,49)
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("treasureHunt.dig"):InvokeServer(unpack(args))
	end
end
end)
end
end)

spawn(function()
while task.wait(5) do
pcall(function()
if _G.Settings.Auto_Gauntlet then
local checksss = clickthingshit23()

if not checksss then
Guantlet_Notify = false
elseif checksss then
Guantlet_Notify = true
end
end
end)
end
end)

spawn(function()
while task.wait(3) do
pcall(function()
if _G.Settings.Auto_Shibuya or _G.Settings.Auto_Farm_Selection or _G.Settings.Auto_Raid or _G.Settings.Auto_Gauntlet or _G.Settings.Auto_Equip then
	local args = {
	"weapon"
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("toolbar.equip"):FireServer(unpack(args))
end
end)
end
end)

spawn(function()
while task.wait(.5) do
pcall(function()
if _G.Settings.Auto_Gauntlet_Boost_Pauser then
	if gauntleting then
for i,v in pairs(_G.Settings.Gauntlet_Boost_Pauser) do
	task.wait(6)
local args = {
	v,
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("items.setBoostRunning"):FireServer(unpack(args))
end
elseif not gauntleting then
	for i,v in pairs(_G.Settings.Gauntlet_Boost_Pauser) do
	task.wait(6)
local args = {
	v,
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("items.setBoostRunning"):FireServer(unpack(args))
end
	end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Boss_Select and not raidboss and not raidhere and not gauntleting and not checkinfi() and not checkesc() then
if not checknearboss() then
if lastkeys == doingitnow then
	Bossnow = "Checking again"
	doingitnow = 0
	print(Bossnow)
	task.wait(38)
elseif Bossnow == nil or Bossnow == "Checking again" then
Bossnow = _G.Settings.Boss_Selection[1]
doingitnow = 1
task.wait(2)
elseif Bossnow == nil or Bossnow == _G.Settings.Boss_Selection[1] then
Bossnow = _G.Settings.Boss_Selection[2]
doingitnow = 2
task.wait(2)
elseif Bossnow == nil or Bossnow == _G.Settings.Boss_Selection[2] then
Bossnow = _G.Settings.Boss_Selection[3]
doingitnow = 3
task.wait(2)
elseif Bossnow == nil or Bossnow == _G.Settings.Boss_Selection[3] then
Bossnow = _G.Settings.Boss_Selection[4]
doingitnow = 4
task.wait(2)
elseif Bossnow == nil or Bossnow == _G.Settings.Boss_Selection[4] then
Bossnow = _G.Settings.Boss_Selection[5]
doingitnow = 5
task.wait(2)
elseif Bossnow == nil or Bossnow == _G.Settings.Boss_Selection[5] then
Bossnow = _G.Settings.Boss_Selection[6]
doingitnow = 6
task.wait(2)
end
end

if Bossnow == "Freeze Prime" then
CFhere = CFrame.new(805.540039, 224.999985, 3658.2832, 0.88627696, 5.56970789e-08, -0.463155627, -2.55495203e-09, 1, 1.15366589e-07, 0.463155627, -1.01063407e-07, 0.88627696)
MonSize = Vector3.new(8,8,4)
elseif Bossnow == "Super Cel (Prime)" then
CFhere = CFrame.new(1019.67084, 143.916489, -42.6330757, -0.107257091, -2.90452711e-08, 0.994231343, 1.20504033e-08, 1, 3.05137853e-08, -0.994231343, 1.52537076e-08, -0.107257091)
MonSize = Vector3.new(8,8,4)
elseif Bossnow == "Orichi" then
CFhere = CFrame.new(-1473.27075, 233.432465, 2230.38672, 0.72729063, -4.81861875e-08, 0.686329603, -2.88613489e-08, 1, 1.00792356e-07, -0.686329603, -9.31137336e-08, 0.72729063)
MonSize = Vector3.new(9, 9, 4.5)
elseif Bossnow == "Enil Storm" then
CFhere = CFrame.new(-1826.64709, 1209.89185, -3087.29663, 0.0905375481, -1.18550702e-07, -0.995893061, 1.13543779e-08, 1, -1.18007357e-07, 0.995893061, -6.23649576e-10, 0.0905375481)
MonSize = Vector3.new(14, 14, 7)
elseif Bossnow == "Deva" then
CFhere = CFrame.new(905.526245, 115.561028, -3990.81348, -0.224947512, 5.87758464e-09, -0.974370897, 1.68451323e-14, 1, 6.03218009e-09, 0.974370897, 1.35690748e-09, -0.224947512)
MonSize = Vector3.new(10, 10, 5)
elseif Bossnow == "Byaku (Unleashed)" then
CFhere = CFrame.new(4303.41943, 152.537384, -1418.60193, 1, -4.9680569e-08, 9.56479701e-14, 4.9680569e-08, 1, -4.00724858e-08, -9.36571513e-14, 4.00724858e-08, 1)
MonSize = Vector3.new(10, 10, 5)
elseif Bossnow == "Tear (Summer)" then
CFhere = CFrame.new(-138.24382, -1474.41113, -711.621643, 0.619316936, 1.8190347e-08, 0.78514111, -4.21235526e-08, 1, 1.00586783e-08, -0.78514111, -3.93024422e-08, 0.619316936)
MonSize = Vector3.new(12, 12, 6)
elseif Bossnow == "Deo, Greatest High" then
CFhere = CFrame.new(-1804.63354, 121.188614, 3884.89844, -0.7864604, -4.84773146e-08, -0.617640674, 1.79612734e-08, 1, -1.01358516e-07, 0.617640674, -9.08080722e-08, -0.7864604)
MonSize = Vector3.new(12, 12, 6)
end

if Bossnow ~= "Checking again" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFhere
task.wait(2)
end

end
end)
end
end)

function checksummer()
if workspace.World.Ocean:FindFirstChild("chunk_-403_-403") then
dist = (CFrame.new(-402.773865, -1500, -402.773865, 1, 0, 0, 0, 1, 0, 0, 0, 1).Position-workspace.World.Ocean["chunk_-403_-403"].Position).Magnitude
else
dist = 1000
end
if dist <= 100 then
return true
end
return false
end

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Gauntlet then
if _G.Settings.Auto_Gauntlet and not raidhere and not raidboss and not gauntleting and _G.Settings.Auto_Open_Star and _G.Settings.Select_Star == "Summer" and not checksummer() then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10.500473, 54.6603012, -1941.92139, 0.999953628, -7.41917461e-08, 0.00962872989, 7.33439336e-08, 1, 8.84028637e-08, -0.00962872989, -8.76925625e-08, 0.999953628)
task.wait(.2)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("summer.enter"):FireServer()
task.wait(3)
end
if _G.Settings.Auto_Open_Star and not raidhere and not raidboss and gauntleting and _G.Settings.Select_Star == "Summer" and checksummer() then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-166.655914, -1486.82544, 423.131622, -0.960341394, -5.95685705e-08, 0.278826863, -2.6891632e-08, 1, 1.21019269e-07, -0.278826863, 1.087217e-07, -0.960341394)
task.wait(.2)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("summer.exit"):FireServer()
	task.wait(3)
	end
if checkmap() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if distance <= 300 and not v:GetAttribute("dead") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,3,0)
clickthingshit()
clickparent("Continue")
	end
end
elseif Guantlet_Notify then
	raidreallyup = checknotify("Quit Raid")
	task.wait(3)
if not checkraidboss() then
local args = {
	"Normal",
	{
		friendsOnly = false
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("gauntlet.create"):InvokeServer(unpack(args))

task.wait(5) 

if checkmap() and _G.Settings.SkipTo30Floor then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name,"gauntlet") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.SkipButton.root.CFrame
task.wait(.5)
fireproximityprompt(v.SkipButton.root.ProximityPrompt)
task.wait(.5)
	end
end
end

task.wait(.5)

if not mainbuild and checkmap() then
if _G.Settings.Auto_Switch_Team then
local args = {
	_G.Settings.Main_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories then
local args = {
	_G.Settings.Main_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
	mainbuild = true
	print("Main build")
	end

task.wait(3)

game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()

task.wait(2)
end
end
end
end)
end
end)

function checkbosss()
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("Root") then
return true
	end
end
return false
end

function checkbossss()
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("RootPart") then
return true
	end
end
return false
end

function checkmonsterrootpartsize()
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("RootPart") and not v:GetAttribute("dead") and v.RootPart.Size == Vector3.new(2, 2, 1) then
return true
	end
end
return false
end

spawn(function()
while task.wait(5) do
pcall(function()
if _G.Settings.Auto_Raid then
raidreallyup = checknotify("Quit Raid") or checknotify("Kick")
if checkraidboss() then
raidboss = true
elseif checknotify("raid is not") then
	raidboss = false
end
else
print("not raidboss")
raidboss = false
end
end)
end
end)

function checkpickup()
for i,v in pairs(workspace.World.FX:GetChildren()) do
	if string.find(v.Name, "pickup") then
return true
	end
end
return false
end

function checkinfi()
for i,v in pairs(workspace.World.FX:GetChildren()) do
	if string.find(v.Name, "pickup") or infihere then
return true
	end
end
return false
end

function checkesc()
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "escort") or escorthere then
return true
	end
end
return false
end

function checkescss()
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "escort") then
return true
	end
end
return false
end

function clickabandon()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	if v.ClassName == "TextLabel" and string.find(v.Text, "Abandon") then
for i2,v2 in pairs(v.Parent.Parent:GetChildren()) do
for i3,v3 in pairs(v2:GetChildren()) do
	if v3.ClassName == "TextLabel" and v3.Text ~= "Drops" then
clicks(v3)
	end
end
end
	end
end
end

spawn(function()
while task.wait(5) do
pcall(function()
if _G.Settings.Auto_Infiltration then
infihere = checknotify("Section") or checknotify("Loot") or checknotify("Kick")
clickthingshit()
if _G.Settings.Auto_Gauntlet and gauntleting then
clickabandon()
task.wait(1)
clickparent("I Understand")
end
end
end)
end
end)

spawn(function()
while task.wait(5) do
pcall(function()
if _G.Settings.Auto_Escort then
escorthere = checknotify("Defend the Cart") or checknotify("Checkpoint")
clickthingshitescort()
if _G.Settings.Auto_Gauntlet and gauntleting then
clickabandon()
task.wait(1)
clickparent("I Understand")
end
end
end)
end
end)

function checkinsv()
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "invasion") then
return true
	end
end
return false
end

spawn(function()
while task.wait(5) do
pcall(function()
if (_G.Settings.Auto_Invasion or _G.Settings.Auto_Join_Invasion) and not checkmons() and insvhere then
selectcard(_G.Settings.Seventeen_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Sixteen_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Fifteen_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Fourteen_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Thirteen_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Twelve_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Eleven_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Ten_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Nine_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Eight_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Seven_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Six_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Five_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Four_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Three_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.Two_Card_Ins)
task.wait(.1)
selectcard(_G.Settings.One_Card_Ins)
task.wait(1)
end
end)
end
end)

spawn(function()
while task.wait(5) do
pcall(function()
if _G.Settings.Auto_Invasion or _G.Settings.Auto_Join_Invasion then
insvhere = checknotify("Invasion")
clickthingshitinsv()
if _G.Settings.Auto_Gauntlet and gauntleting then
clickabandon()
task.wait(1)
clickparent("I Understand")
end
end
end)
end
end)

spawn(function()
while task.wait(7) do
pcall(function()
if _G.Settings.Auto_Invasion and insvhere and not _G.Settings.Stay_Still_Invasion then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "invasion") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Persistent.Zone.CFrame
	end
end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if (_G.Settings.Auto_Invasion or _G.Settings.Auto_Join_Invasion) then
if checkinsv() and insvhere and not _G.Settings.Stay_Still_Invasion then
	if checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") and not v:GetAttribute("dead") then
		local distwo = math.abs(v.HumanoidRootPart.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
	end
	end
end
elseif not checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("Root") and not v:GetAttribute("dead") then
		local distwo = math.abs(v.Root.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Root.CFrame
		end
	end
end
	end
elseif _G.Settings.Auto_Invasion and not _G.Settings.Auto_Join_Invasion and not insvhere and not infihere and not raidhere then
	if not _G.Settings.Auto_Open_Star or not openegg then
		task.wait(3)
if not checksummer() then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10.500473, 54.6603012, -1941.92139, 0.999953628, -7.41917461e-08, 0.00962872989, 7.33439336e-08, 1, 8.84028637e-08, -0.00962872989, -8.76925625e-08, 0.999953628)
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("summer.enter"):FireServer()
task.wait(3)
end
			task.wait(3)
	local args = {
	"Dark Matter Invasion",
	{
		friendsOnly = false
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("invasions.create"):InvokeServer(unpack(args))
	task.wait(6)
insvhere = checknotify("Invasion")
task.wait(_G.Settings.Start_Delay_Invasion)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()
	task.wait(6)
	if not insvhere then
task.wait(30)
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
if _G.Settings.Auto_Infiltration and infihere then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "infiltration") then
	    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.FloorBarrier:GetChildren()[8].CFrame
		for i2,v2 in pairs(workspace.World.Hitboxes:GetChildren()) do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.CFrame
		end
	end
end
end
end)
end
end)

function checkshib()
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "shibuya") or shibhere then
return true
	end
end
return false
end

spawn(function()
while task.wait(5) do
pcall(function()
if _G.Settings.Auto_Shibuya then
shibhere = (checknotify("Shibuya") and checknotify("Drops") and checknotify("Abandon")) or (checknotify("Kick") and checknotify("Start") and checknotify("Leave"))
clickthingshitshib()
if _G.Settings.Auto_Gauntlet and gauntleting then
clickabandon()
task.wait(1)
clickparent("I Understand")
end
end
end)
end
end)

spawn(function()
while task.wait(4) do
pcall(function()
if _G.Settings.Auto_Shibuya and shibhere then
	for i,v in pairs(workspace.World.Map:GetChildren()) do
		if string.find(v.Name, "shibuya") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(v.Persistent["floor station"].WorldPivot))
end
	end
	task.wait(1)
	for i,v in pairs(workspace.World.Map:GetChildren()) do
		if string.find(v.Name, "shibuya") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Components.Left:GetChildren()[6].CFrame
task.wait(1)
fireproximityprompt(v.Components.Left:GetChildren()[6].ProximityPrompt)
task.wait(1)
if not v.Sections["1"].Gates:FindFirstChild("barr") or v.Sections["1"].Gates.barr.Transparency == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Map["1.002"].CFrame * CFrame.new(0,-30,0)
end
end
	end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Shibuya and shibhere then
if checkshib() then
	if checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") and not v:GetAttribute("dead") then
		local distwo = math.abs(v.HumanoidRootPart.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
	end
	end
end
elseif not checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("Root") and not v:GetAttribute("dead") then
		local distwo = math.abs(v.Root.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Root.CFrame
		end
	end
end
	end
end
elseif _G.Settings.Auto_Shibuya and not shibhere and not raidhere then
	if not _G.Settings.Auto_Open_Star or not openegg then
local Event = game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].remo.src.container["shibuya.create"]
Event:InvokeServer(
    "Shibuya Incident",
    {
        friendsOnly = false
    }
)
	task.wait(13)
if not mainbuild and (shibhere or checkshib()) then
	if _G.Settings.Auto_Switch_Team then
local args = {
	_G.Settings.Main_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories then
local args = {
	_G.Settings.Main_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
	mainbuild = true
	print("Main build")
	end
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()
	task.wait(6)
	end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Infiltration and infihere then
if checkinfi() then
	if checkpickup() then
for i,v in pairs(workspace.World.FX:GetChildren()) do
	if string.find(v.Name, "pickup") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.dropInstance.CFrame
task.wait(.1)
fireproximityprompt(v.dropInstance.ProximityPrompt)
	end
end
elseif not checkpickup() then
	if checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") and not v:GetAttribute("dead") then
		local distwo = math.abs(v.HumanoidRootPart.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
	end
	end
end
elseif not checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("Root") and not v:GetAttribute("dead") then
		local distwo = math.abs(v.Root.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Root.CFrame
		end
	end
end
	end
end
end
elseif _G.Settings.Auto_Infiltration and not infihere and not raidhere then
	if not _G.Settings.Auto_Open_Star or not openegg then
		for i,v in pairs(_G.Settings.Selected_Chapter) do
			task.wait(3)
	local args = {
	"Rain Village",
	v,
	{
		friendsOnly = false
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("infiltration.create"):InvokeServer(unpack(args))
		end
	task.wait(13)
if not mainbuild and (infihere or checkmapinfi()) then
	if _G.Settings.Auto_Switch_Team then
local args = {
	_G.Settings.Main_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories then
local args = {
	_G.Settings.Main_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
	mainbuild = true
	print("Main build")
	end
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()
	task.wait(6)
	end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Join_Invasion and not insvhere then
results = nil

for i,v in pairs(workspace.GamemodeMapCull:GetChildren()) do
	if string.find(v.Name, "invasion") then
results = v.Name:match("^[^-]+%-(.+)$")
	end
end

if not checksummer() and results ~= nil then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10.500473, 54.6603012, -1941.92139, 0.999953628, -7.41917461e-08, 0.00962872989, 7.33439336e-08, 1, 8.84028637e-08, -0.00962872989, -8.76925625e-08, 0.999953628)
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("summer.enter"):FireServer()
task.wait(3)
end

task.wait(2)

local args = {
	results
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.join"):InvokeServer(unpack(args))

end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Escort_Join and not escorthere then
for i,v in pairs(workspace.GamemodeMapCull:GetChildren()) do
	if string.find(v.Name, "escort") then
result = v.Name:match("^[^-]+%-(.+)$")
	end
end

local args = {
	result
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.join"):InvokeServer(unpack(args))

if not mainbuild and checkescss() then
	if _G.Settings.Auto_Switch_Team then
local args = {
	_G.Settings.Main_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories then
local args = {
	_G.Settings.Main_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
	mainbuild = true
	print("Main build")
	end

end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Escort and escorthere then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "escort") then
        local distance = (v.Cart.root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance >= 300 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Cart.root.CFrame
		end
	end
end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Escort and escorthere then
if checkesc() then
	if not _G.Settings.Teleport_At_Cart then
	if checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") and not v:GetAttribute("dead") then
		local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
	end
	end
end
elseif not checkmons() then
	if checkbossss() then
	if checkmonsterrootpartsize() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("RootPart") and not v:GetAttribute("dead") and v.RootPart.Size == Vector3.new(2,2,1) then
		local distance = (v.RootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.RootPart.CFrame
	end
	end
end
elseif not checkmonsterrootpartsize() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("RootPart") and not v:GetAttribute("dead") and v.RootPart.Size == Vector3.new(4, 4, 2) then
		local distance = (v.RootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.RootPart.CFrame
	end
	end
end
		end
	elseif not checkbossss() then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "escort") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Cart.root.CFrame
	end
end
end
end
elseif _G.Settings.Teleport_At_Cart then
for i,v in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v.Name, "escort") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Cart.root.CFrame
	end
end
	end
	end
elseif _G.Settings.Auto_Escort and not escorthererlly and not raidhere then
	if not _G.Settings.Auto_Open_Star or not openegg then
		for i,v in pairs(_G.Settings.Selected_Tier) do
			task.wait(3)
	local args = {
	"Journeys End",
	{
		friendsOnly = false,
		tier = v
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("escorts.create"):InvokeServer(unpack(args))
		end
	task.wait(13)
if not mainbuild and checkescss() then
	if _G.Settings.Auto_Switch_Team then
local args = {
	_G.Settings.Main_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories then
local args = {
	_G.Settings.Main_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
	mainbuild = true
	print("Main build")
	end
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()
task.wait(6)
	end
end
end)
end
end)

spawn(function()
while task.wait(5) do
pcall(function()
if _G.Settings.Auto_Raid and not checkbosss() and checkraidboss() then
for i6,v6 in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v6.Name, "boss") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(v6.WorldPivot))
	end
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Infinite_Boost and Premiums and patched then
	if raidboss or gauntleting then
	for i,v in pairs(_G.Settings.Boost_Timer) do
		if string.find(v, "Damage") or string.find(v, "Drop") then
		task.wait()
local args = {
	v,
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("items.setBoostRunning"):FireServer(unpack(args))
end
	end
elseif not raidboss and not gauntleting then
	for i,v in pairs(_G.Settings.Boost_Timer) do
		task.wait()
local args = {
	v,
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("items.setBoostRunning"):FireServer(unpack(args))
end
end
end
end)
end
end)

function sunshineraidchecker()
for i,v in pairs(_G.Settings.Raid_Selection) do
		if v == "Sunshine Raid" then
return true
		end
end
return false
end

spawn(function()
while task.wait(.29) do
pcall(function()
if _G.Settings.Auto_Raid then
	if _G.Settings.Auto_Open_Star then
if _G.Settings.Select_Star == "Summer" then
if sunshineraidchecker() then
normalworldishere = false
summerworldishere = true
task.wait(70)
normalworldishere = true
summerworldishere = false
task.wait(20)
elseif not sunshineraidchecker() then
	normalworldishere = true
	summerworldishere = false
		end
	elseif _G.Settings.Select_Star ~= "Summer" then
	if sunshineraidchecker() then
summerworldishere = false
normalworldishere = true
task.wait(70)
summerworldishere = true
normalworldishere = false
task.wait(20)
elseif not sunshineraidchecker() then
	summerworldishere = false
	normalworldishere = true
		end
	end
	elseif not _G.Settings.Auto_Open_Star then
	summerworldishere = true
	normalworldishere = true
end
end
end)
end
end)

function hardmodechecker(dada)
for i,v in pairs(_G.Settings.Hard_Raid) do
if v == dada then
return true
end
end
return false
end

spawn(function()
while task.wait(.29) do
pcall(function()
if _G.Settings.Auto_Raid then
	if checkraidboss() then
if checkmons() then
for i,v in pairs(workspace.World.Enemies:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") and not v:GetAttribute("dead") then
		
for i6,v6 in pairs(workspace.World.Map:GetChildren()) do
	if string.find(v6.Name, "boss") then
distancee131 = math.abs(stringToCFrame(tostring(v6.WorldPivot)).Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
	end
end
		local distwo = math.abs(v.HumanoidRootPart.Position.Y-game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)
		local distance = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if distance <= 3000 and distwo <= 150 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
	end
	end
end
else
for i,v in pairs(workspace.World.Map:GetChildren()) do
if string.find(v.Name, "^boss%-raid%-(.+)") then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.BossHitbox.CFrame
clickthingshit233()
task.wait(1)

end
end
end
elseif not checkraidboss() then
	if not _G.Settings.Auto_Open_Star or not openegg then
	raidhere = true
	for i,v in pairs(_G.Settings.Raid_Selection) do
		if v == "Sunshine Raid" and not raidreallyup then
	if checksummer() and summerworldishere then
local args = {
	v,
	{
		spawnNormal = false,
		friendsOnly = false,
		hard = hardmodechecker(v)
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("bossRaids.create"):InvokeServer(unpack(args))

task.wait(.1)
elseif not checksummer() and summerworldishere then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10.500473, 54.6603012, -1941.92139, 0.999953628, -7.41917461e-08, 0.00962872989, 7.33439336e-08, 1, 8.84028637e-08, -0.00962872989, -8.76925625e-08, 0.999953628)
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("summer.enter"):FireServer()
task.wait(3)
local args = {
	v,
	{
		spawnNormal = false,
		friendsOnly = false,
		hard = hardmodechecker(v)
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("bossRaids.create"):InvokeServer(unpack(args))

task.wait(3)
	end
else
if normalworldishere then
if checksummer() then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-166.655914, -1486.82544, 423.131622, -0.960341394, -5.95685705e-08, 0.278826863, -2.6891632e-08, 1, 1.21019269e-07, -0.278826863, 1.087217e-07, -0.960341394)
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("summer.exit"):FireServer()
	task.wait(3)
local args = {
	v,
	{
		spawnNormal = false,
		friendsOnly = false,
		hard = hardmodechecker(v)
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("bossRaids.create"):InvokeServer(unpack(args))
		task.wait(3)
		elseif not checksummer() then
local args = {
	v,
	{
		spawnNormal = false,
		friendsOnly = false,
		hard = hardmodechecker(v)
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("bossRaids.create"):InvokeServer(unpack(args))
		task.wait(3)
		end
	end
end
	end
	task.wait(1)

raidreallyup = checknotify("Quit Raid") or checknotify("Kick")

summerraidreallyhere = false

task.wait(.2)

for i,v in pairs(workspace.World.Map:GetChildren()) do
if string.find(v.Name, "^boss%-raid%-(.+)") then
	if v.Components:FindFirstChild("Phase1Floor") then
summerraidreallyhere = true
	end
end
end

if raidreallyup then
	if _G.Settings.Auto_Switch_Team and not summerraidreallyhere then
local args = {
	_G.Settings.Main_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories and not summerraidreallyhere then
local args = {
	_G.Settings.Main_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
	mainbuild = true
	print("Main build")
	end
	raidhere = false
	task.wait(7)
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("lobbies.start"):FireServer()
	task.wait(6)
	end
end
end
end)
end
end)

if not checksummer() then
if _G.Settings.Auto_Switch_Team then
local args = {
	_G.Settings.Luck_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories then
local args = {
	_G.Settings.Luck_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
mainbuild = false
end

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Open_Star then
openegg = true
task.wait(4.7)
if mainbuild and ((Bossnow == "Checking again" or Bossnow == nil) and not raidboss and not gauntleting and not infirllyhere and not escorthererlly ) then
if _G.Settings.Auto_Switch_Team then
local args = {
	_G.Settings.Luck_Build
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("warriors.teams.load"):FireServer(unpack(args))
	end
	if _G.Settings.Auto_Switch_Accessories then
local args = {
	_G.Settings.Luck_Build_Acc
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("accessories.teams.load"):FireServer(unpack(args))
	end
mainbuild = false
	print("Lucky build")
	end
task.wait(.3)
openegg = false
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Buy_Gauntlet_Shop then
readytobuy = true
task.wait(600)
readytobuy = false
task.wait(lastkey * 4)
end
end)
end
end)

spawn(function()
while task.wait(.5) do
pcall(function()
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
	if v.Name == "BillboardGui" and v.TextLabel.Text == game.Players.LocalPlayer.Name then
v.TextLabel.Text = "discord.gg/axelhub"
v.TextLabel.TextColor3 = Color3.fromRGB(255, 175, 0)
	end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Buy_Gauntlet_Shop and BuyingGauntlet then
for i,v in pairs(_G.Settings.Gauntlet_Shop_Selection) do
	if v == "Star Remnant" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(87.724205, 3062.77026, 149.306656, -0.657232523, -5.40629053e-08, 0.753687859, -5.60393048e-08, 1, 2.28636452e-08, -0.753687859, -2.72094134e-08, -0.657232523)
for i = 1,20 do
local args = {
	"Gauntlet",
	v,
	5
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("shops.purchase"):InvokeServer(unpack(args))
end
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(87.724205, 3062.77026, 149.306656, -0.657232523, -5.40629053e-08, 0.753687859, -5.60393048e-08, 1, 2.28636452e-08, -0.753687859, -2.72094134e-08, -0.657232523)
for i = 1,20 do
local args = {
	"Gauntlet",
	v,
	1
}
game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("remo"):WaitForChild("src"):WaitForChild("container"):WaitForChild("shops.purchase"):InvokeServer(unpack(args))
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
if Noclip or _G.Settings.Auto_Shibuya or _G.Settings.Auto_Farm_Selection or _G.Settings.Auto_Raid or _G.Settings.Auto_Gauntlet then
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

_G.Settings.Webhook_Link = "https://discordapp.com/api/webhooks/1504062033937694822/F1mX4PwIO021ZKIPBqjhSHSQda9DF24J7EyUWvbAo1MD_gKJAILq3tEppP18i2gwgLdb"

sendwebhook("Has Been Execute")

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
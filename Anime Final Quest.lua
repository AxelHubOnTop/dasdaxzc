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
    Title = "AxelHub_AFQ_Key",
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
if isfile("axelhub_afq_key.key") then
delfile("axelhub_afq_key.key")
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
if isfile("axelhub_afq_key.key") then
delfile("axelhub_afq_key.key")
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
        until game:GetService("Players").LocalPlayer.Character.Head

        repeat task.wait()
        until game:GetService("Players").LocalPlayer.Character.Head:FindFirstChild("BillboardGui")

game.Players.LocalPlayer.Character.Head.BillboardGui.Display.Text = "Axel Hub"
game.Players.LocalPlayer.Character.Head.BillboardGui.Display.TextColor3 = Color3.fromRGB(255, 205, 55)


		repeat task.wait()
        until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading")

_G.DefaultSettings = {
            Auto_Replay = false,
            Auto_Play = false,
            Auto_Start = false
        }

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_AFQ.JSON"

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

function goto(va,speed)
    local Distance2 = (va.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new(Distance2/speed, Enum.EasingStyle.Linear)
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = va})
        tween:Play()
    end

function canceltp()
    local Distance2 = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new(Distance2/300, Enum.EasingStyle.Linear)
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
        tween:Play()
end

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
        Enabled = false,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },

    })

    Window:SetBackgroundImage("rbxassetid://86949082023913")
    Window:SetToggleKey(Enum.KeyCode.LeftBracket)

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
    Icon = "atom",
    Opened = true,
})

local Main = Section:Tab({
    Title = "Main",
    Icon = "house", -- optional
    Locked = false,
})

local Premium = Section:Tab({
    Title = "OP",
    Icon = "crown", -- optional
    Locked = false,
})

local Leave = Section:Tab({
    Title = "Leave",
    Icon = "door-open", -- optional
    Locked = false,
})

local Play = Section:Tab({
    Title = "Play",
    Icon = "play", -- optional
    Locked = false,
})

local Cards = Section:Tab({
    Title = "Card",
    Icon = "id-card", -- optional
    Locked = false,
})

local Skill = Section:Tab({
    Title = "Skill",
    Icon = "apple", -- optional
    Locked = false,
})

local Settings = Section:Tab({
    Title = "Settings",
    Icon = "settings", -- optional
    Locked = false,
})

local Section = Main:Section({ 
    Title = "Main Menu",
})

Window:Tag({
    Title = ".gg/axelhub",
    Icon = "link",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 6, -- from 0 to 13
})

Main:Divider()

local Slider = Main:Slider({
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

local Dropdown = Main:Dropdown({
    Title = "Attack Type",
    Desc = "Select Attack Type To Farm",
    Values = {"1","2","3","4","5"},
    Value = _G.Settings.Attack_Type or "1",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Attack_Type = option
    end
})

if tuidui then
local Dropdown = Main:Dropdown({
    Title = "Attack Method",
    Desc = "Select Attack Method To Attack",
    Values = {"+",")"},
    Value = _G.Settings.Attack_Method or "+",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Attack_Method = option
        if _G.Settings.Attack_Method == "+" then
            hope_fix = "\026"
        elseif _G.Settings.Attack_Method == ")" then
            hope_fix = "\024"
        end
    end
})
end

local Toggle = Main:Toggle({
    Title = "Auto Farm",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Attack or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Attack = state
    end
})

local Toggle = Main:Toggle({
    Title = "Auto Open Chest",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Open_Chest or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Open_Chest = state
    end
})

local Slider = Main:Slider({
    Title = "Attack Cooldown",
    Desc = "Cooldown For Player Attack",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 0.1,
    Value = {
        Min = 0.1,
        Max = 2,
        Default = _G.Settings.Cooldown_Attack or 0.3,
    },
    Callback = function(value)
        _G.Settings.Cooldown_Attack = value
    end
})

local Toggle = Main:Toggle({
    Title = "Auto Replay",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Replay or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Replay = state
    end
})

Premiums = true

if _G.Settings.maxsafe == nil then
_G.Settings.maxsafe = 40
end

local Slider = Main:Slider({
    Title = "Safe Mode When (%)",
    Desc = "Enabled Safe Mode When Your Health Below : ",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.Settings.maxsafe or 40,
    },
    Callback = function(value)
        _G.Settings.maxsafe = value
    end
})

local Toggle = Main:Toggle({
    Title = "Safe Mode",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Safe_Mode or false, -- default value
    Callback = function(state) 
        _G.Settings.Safe_Mode = state
    end
})

local Section = Leave:Section({ 
    Title = "Leave Boss Rush",
})

Leave:Divider()

local Toggle = Leave:Toggle({
    Title = "Auto Leave Boss Rush",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.AutoLeave_BossRush or false, -- default value
    Callback = function(state) 
        _G.Settings.AutoLeave_BossRush = state
    end
})

if _G.Settings.AutoLeave_BossRushs == nil then
_G.Settings.AutoLeave_BossRushs = 5
end

local Slider = Leave:Slider({
    Title = "Leave At Killed :",
    Desc = "choose your boss killed to leave.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 10,
        Default = _G.Settings.AutoLeave_BossRushs or 5,
    },
    Callback = function(value)
        _G.Settings.AutoLeave_BossRushs = value
    end
})

local Section = Play:Section({ 
    Title = "Play Menu",
})

Play:Divider()

local Dropdown = Play:Dropdown({
    Title = "Difficult Selection",
    Desc = "",
    Values = {"Normal","Hard","Nightmare"},
    Value = _G.Settings.Diffulty_Selection or "Normal",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Diffulty_Selection = option
if _G.Settings.Diffulty_Selection == "Normal" then
_G.Settings.Diffulty_Selected = 1
elseif _G.Settings.Diffulty_Selection == "Hard" then
_G.Settings.Diffulty_Selected = 2
elseif _G.Settings.Diffulty_Selection == "Nightmare" then
_G.Settings.Diffulty_Selected = 3
end
    end
})

if workspace:FindFirstChild("mapshibu") then
    if workspace.DistanceFade_SurfaceParts:FindFirstChild("Door1") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-242.744751, 63.130455, 140.684006, 0.973280787, -0.0599664934, 0.221649513, -1.42573498e-07, 0.96529603, 0.261158049, -0.229618132, -0.254180163, 0.939504087)
    elseif workspace.DistanceFade_SurfaceParts:FindFirstChild("Door2") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-209.944763, 61.66399, -22.4727135, 0.0206728466, 0.148567364, -0.988686204, 2.17754427e-06, 0.988897502, 0.148599163, 0.999786317, -0.00307412073, 0.0204430036)
    end
end

local Dropdown = Play:Dropdown({
    Title = "Gamemode Selection",
    Desc = "",
    Values = {"Default","CurseRealm","Raid","Infinite","Extra"},
    Value = _G.Settings.Selected_Game_Mode or "Default",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Game_Mode = option
    end
})

if _G.Settings.Selected_Game_Map == nil then
_G.Settings.Selected_Game_Map = 1
end

if _G.Settings.Diffulty_Selection == "Normal" then
_G.Settings.Diffulty_Selected = 1
elseif _G.Settings.Diffulty_Selection == "Hard" then
_G.Settings.Diffulty_Selected = 2
elseif _G.Settings.Diffulty_Selection == "Nightmare" then
_G.Settings.Diffulty_Selected = 3
end

local Dropdown = Play:Dropdown({
    Title = "Map Selection",
    Desc = "List From Above to Bottom",
    Values = {"1","2","3","4"},
    Value = _G.Settings.Selected_Game_Map or "1",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Game_Map = option
    end
})

local Toggle = Play:Toggle({
    Title = "Modifier",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Modifier_Turn or false, -- default value
    Callback = function(state) 
        _G.Settings.Modifier_Turn = state
    end
})

local Toggle = Play:Toggle({
    Title = "Auto Join Room",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Join or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Join = state
    end
})

local Section = Cards:Section({ 
    Title = "Card Menu",
})

Cards:Divider()

local Toggle = Cards:Toggle({
    Title = "Auto Select Card",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Select_Cards or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Select_Cards = state
    end
})

boost = {"Speed","M1Boost","Health","SkillCooldown","SkillBoost"}

local Dropdown = Cards:Dropdown({
    Title = "Card Priority (1)",
    Desc = "",
    Values = boost,
    Value = _G.Settings.Card_1 or "SkillBoost",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Card_1 = option
    end
})

local Dropdown = Cards:Dropdown({
    Title = "Card Priority (2)",
    Desc = "",
    Values = boost,
    Value = _G.Settings.Card_2 or "SkillCooldown",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Card_2 = option
    end
})

local Dropdown = Cards:Dropdown({
    Title = "Card Priority (3)",
    Desc = "",
    Values = boost,
    Value = _G.Settings.Card_3 or "M1Boost",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Card_3 = option
    end
})

local Dropdown = Cards:Dropdown({
    Title = "Card Priority (4)",
    Desc = "",
    Values = boost,
    Value = _G.Settings.Card_4 or "Health",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Card_4 = option
    end
})

local Dropdown = Cards:Dropdown({
    Title = "Card Priority (5)",
    Desc = "",
    Values = boost,
    Value = _G.Settings.Card_5 or "Speed",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Card_5 = option
    end
})

local Section = Skill:Section({ 
    Title = "Skill Menu",
})

Skill:Divider()

local Toggle = Skill:Toggle({
    Title = "Skill One",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Skill_One or false, -- default value
    Callback = function(state) 
        _G.Settings.Skill_One = state
    end
})
local Toggle = Skill:Toggle({
    Title = "Skill Two",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Skill_Two or false, -- default value
    Callback = function(state) 
        _G.Settings.Skill_Two = state
    end
})
local Toggle = Skill:Toggle({
    Title = "Skill Three",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Skill_Three or false, -- default value
    Callback = function(state) 
        _G.Settings.Skill_Three = state
    end
})
local Toggle = Skill:Toggle({
    Title = "Skill Four",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Skill_Four or false, -- default value
    Callback = function(state) 
        _G.Settings.Skill_Four = state
    end
})
local Toggle = Skill:Toggle({
    Title = "Skill F",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Skill_F or false, -- default value
    Callback = function(state) 
        _G.Settings.Skill_F = state
    end
})
local Toggle = Skill:Toggle({
    Title = "Skill X",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Skill_X or false, -- default value
    Callback = function(state) 
        _G.Settings.Skill_X = state
    end
})

local Section = Skill:Section({ 
    Title = "Auto Skill Menu",
})

Skill:Divider()

local Toggle = Skill:Toggle({
    Title = "Auto Skill",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Skill or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Skill = state
    end
})

local Toggle = Skill:Toggle({
    Title = "Auto Awake",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Awakening or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Awakening = state
    end
})

local Toggle = Skill:Toggle({
    Title = "Touch Ground When Awaking",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Touchgrass or false, -- default value
    Callback = function(state) 
        _G.Settings.Touchgrass = state
    end
})

local Button = Premium:Button({
    Title = "Rollback Start (use as your own risk)",
    Desc = "Use Before Doing Something",
    Locked = false,
    Callback = function()
    if Premiums then
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub (Premium)", 
            Text = "Rollback Started"
        })

        local args = {
	{
		{
			["Combat Sounds Volume"] = false,
			["Hide Cosmetics"] = false,
			["Reduce Camera Shake"] = false,
			["Mute Music"] = false,
			["Fast Mode"] = false,
			["Hide UI"] = false,
			["Reduce Effects"] = false,
			["Disable Shadows"] = true,
			["Environment Sounds Volume"] = "\127\255"
		},
		"!"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
    elseif not Premiums then
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub (Premium)", 
            Text = "You are not Premium | Buy At .gg/axelhub"
        })
    end
    end
})

local Button = Premium:Button({
    Title = "Rollback Stop (use as your own risk)",
    Desc = "Use Before Doing Something",
    Locked = false,
    Callback = function()
    if Premiums then
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub (Premium)", 
            Text = "Rollback Stopped"
        })

        local args = {
	{
		{
			["Combat Sounds Volume"] = false,
			["Hide Cosmetics"] = false,
			["Reduce Camera Shake"] = false,
			["Mute Music"] = false,
			["Fast Mode"] = false,
			["Hide UI"] = false,
			["Reduce Effects"] = false,
			["Disable Shadows"] = true,
			["Environment Sounds Volume"] = 1
		},
		"!"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
    elseif not Premiums then
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub (Premium)", 
            Text = "You are not Premium | Buy At .gg/axelhub"
        })
    end
    end
})

Main:Select()

local Button = Settings:Button({
    Title = "Save Config",
    Desc = "Press this to Save your Config",
    Locked = false,
    Callback = function()
        if isfolder("AxelHub") then
        pcall(function()
            if isfile(folder_name) then
                writefile(folder_name, game:service('HttpService'):JSONEncode(_G.Settings))
            else
                writefile(folder_name, game:service('HttpService'):JSONEncode(_G.Settings))
            end
        end)
        else
        makefolder("AxelHub")
        end
    end
})

local Toggle = Settings:Toggle({
    Title = "Auto Rejoin",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Rejoin or true, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Rejoin = state
    end
})

function click(uis)
VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = uis
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
end

function selectcard(dead)
if game:GetService("Players").LocalPlayer.PlayerGui.Upgrades.Cards.Visible == true then
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Upgrades.Cards.Frame:GetChildren()) do
    if v.Name == "Frame" then
        if string.find(v.Boost.Text, dead) then
click(v.Button.TextButton)
        end
    end
end
end
end

if workspace:FindFirstChild("Blacksmith") then
spawn(function()
while task.wait(2) do
pcall(function()
if _G.Settings.Auto_Join then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(460.331421, 113.404938, -136.350296, 0.159628987, 9.3015462e-10, -0.987177074, -9.55862589e-08, 1, -1.45142991e-08, 0.987177074, 9.66774678e-08, 0.159628987) * CFrame.new(0,0,math.random(-2,2))
local args = {
	{
		{
			"Play",
			1, -- Player Amount
			_G.Settings.Selected_Game_Mode, -- Mode {"Default","CurseRealm","Raid","Infinite"}
			tonumber(_G.Settings.Selected_Game_Map), -- Play maps
			tonumber(_G.Settings.Diffulty_Selected), -- {"NORMAL","HARD","NIGHTMARE"}
			true, -- friend only
			_G.Settings.Modifier_Turn -- Modifier
		},
		" "
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end
end)
end
end)
end

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_Select_Cards then
if game:GetService("Players").LocalPlayer.PlayerGui.Upgrades.Cards.Visible == true then
selectcard(_G.Settings.Card_1)
task.wait(.1)
selectcard(_G.Settings.Card_2)
task.wait(.1)
selectcard(_G.Settings.Card_3)
task.wait(.1)
selectcard(_G.Settings.Card_4)
task.wait(.1)
selectcard(_G.Settings.Card_5)
task.wait(.1)
end
end
end)
end
end)

spawn(function()
while task.wait(2) do
pcall(function()
if _G.Settings.Auto_Rejoin then
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
wait(2) game:GetService("TeleportService"):Teleport(game.PlaceId)
    end)
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

_G.Settings.Disc2 = _G.Settings.Disc
healthsaving = false
farmran1 = 0
farmran2 = 0

spawn(function()
while task.wait(.3) do
pcall(function()
if healthsaving then
_G.Settings.Disc2 = _G.Settings.Disc + 100
farmran1 = math.random(0,300)
farmran2 = math.random(0,300)
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if healthsaving == false or _G.Settings.Safe_Mode == false then
_G.Settings.Disc2 = _G.Settings.Disc
farmran1 = 0
farmran2 = 0
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Safe_Mode then
hp = game.Players.LocalPlayer.Character.Humanoid.Health

mhp = game.Players.LocalPlayer.Character.Humanoid.MaxHealth

safemodeopen = (_G.Settings.maxsafe/100)*mhp

if hp <= safemodeopen then
healthsaving = true
_G.Settings.Disc2 = _G.Settings.Disc + 100
farmran1 = math.random(0,300)
farmran2 = math.random(0,300)
elseif hp == mhp then
healthsaving = false
_G.Settings.Disc2 = _G.Settings.Disc
farmran1 = 0
farmran2 = 0
end

if healthsaving == nil then
healthsaving = false
end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
ModeFarm2 = CFrame.new(farmran1,_G.Settings.Disc2,farmran2) * CFrame.Angles(math.rad(-90),0,0)
end)
end
end)

VirtualInputManager = game:GetService("VirtualInputManager")

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
if _G.Settings.AutoLeave_BossRush then
local text = game:GetService("Players").LocalPlayer.PlayerGui.Timer.TextLabel.Text

local kills = string.match(text, "Kills:%s*(%d+)")

if tonumber(kills) >= tonumber(_G.Settings.AutoLeave_BossRushs) then
clicks(game:GetService("Players").LocalPlayer.PlayerGui.EndUI.End.ImageLabel.TextButton)
task.wait(1)
end
end
end)
end
end)

spawn(function()
while task.wait(1) do
pcall(function()
if _G.Settings.Auto_Replay then
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("EndScreen") then
clicks(game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Screen.Frame.Button.TextButton)
end
end
end)
end
end)

function dang()
for i2,v2 in pairs(workspace.NPCs:GetChildren()) do
if v2 then
return true
end
end
return false
end

spawn(function()
while task.wait() do
    pcall(function()
if _G.Settings.Auto_Attack and attack_hold == false then
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * ModeFarm2
    end
    end
end
end)
end
end)

function domain_check()
if workspace:FindFirstChild("mapshibu") then
    if workspace.DistanceFade_SurfaceParts:FindFirstChild("Door1") or workspace.DistanceFade_SurfaceParts:FindFirstChild("Door2") then
return true
    end
end
return false
end

spawn(function()
while task.wait() do
    pcall(function()
if _G.Settings.Auto_Attack and attack_hold == false then
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Start") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Start").Enabled then
clicks(game:GetService("Players").LocalPlayer.PlayerGui.Start.Frame.Ready)
task.wait(3)
end

if workspace:FindFirstChild("Boss") then
for i2,v2 in pairs(workspace.Boss:GetChildren()) do
if not dang() and not domain_check() and v2:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
end
end
end
end
end)
end
end)

attack_hold = false

function stopattacking()
attack_hold = true
task.wait(.5)
attack_hold = false
end

VirtualInputManager = game:GetService("VirtualInputManager")

spawn(function()
while task.wait(1) do
    pcall(function()
if _G.Settings.Auto_Skill then

if workspace:FindFirstChild("trim") then
remotekill = "\028"
else
remotekill = "\026"
end

        if _G.Settings.Skill_One then
local args = {
    [1] = {
        [1] = {
            ["air"] = false,
            ["Key"] = Enum.KeyCode.One,
            ["phase"] = "Begin"
        },
        [2] = remotekill
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

        end
    if _G.Settings.Skill_Two then
local args = {
    [1] = {
        [1] = {
            ["air"] = false,
            ["Key"] = Enum.KeyCode.Two,
            ["phase"] = "Begin"
        },
        [2] = remotekill
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

    end
    if _G.Settings.Skill_Three then
local args = {
    [1] = {
        [1] = {
            ["air"] = false,
            ["Key"] = Enum.KeyCode.Three,
            ["phase"] = "Begin"
        },
        [2] = remotekill
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

    end

if _G.Settings.Skill_Four then
local args = {
    [1] = {
        [1] = {
            ["air"] = false,
            ["Key"] = Enum.KeyCode.Four,
            ["phase"] = "Begin"
        },
        [2] = remotekill
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

    end
    if _G.Settings.Skill_F then
local args = {
	{
		Enum.KeyCode.F,
		remotekill
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

    end
    if _G.Settings.Skill_X then
local args = {
	{
		Enum.KeyCode.X,
		remotekill
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

    end
end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
if _G.Settings.Auto_Open_Chest then
for i,v in pairs(workspace.Visuals:GetChildren()) do
    if v:FindFirstChild("chest") then
        attack_hold = true
        task.wait(.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.chest.CFrame
        task.wait(.1)
        fireproximityprompt(v.chest.ProximityPrompt)
        task.wait(.1)
        v:Destroy()
        task.wait(.1)
    end
end
task.wait(.1)
attack_hold = false
end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
if _G.Settings.Auto_Awakening then
    if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGuiIngame.UltFrame.UltimateText.Text == "Press G" or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGuiIngame.UltFrame.UltimateText.Text == "TAP" then
attack_hold = true
task.wait(.2)
if _G.Settings.Touchgrass then
	if workspace:FindFirstChild("SpawnLocation") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpawnLocation.CFrame
	end
end
task.wait(.2)
VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.G, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.G, false, game)
task.wait(.3)
attack_hold = false
    end
end
end)
end
end)

if not workspace:FindFirstChild("Blacksmith") then
spawn(function()
while task.wait() do
    pcall(function()
if _G.Settings.Auto_Attack and attack_hold == false then
if workspace:FindFirstChild("trim") then
remotekills = "\014"
else
remotekills = "\12"
end
    task.wait(_G.Settings.Cooldown_Attack)
local args = {
	{
		{
			state = Enum.HumanoidStateType.Running,
			hitcount = tonumber(_G.Settings.Attack_Type)
		},
		remotekills
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))

end
end)
end
end)
end

spawn(function()
while task.wait(1) do
    pcall(function()
if Noclip or _G.Settings.Auto_Attack  then
    if attack_hold == false then
local char = game.Players.LocalPlayer.Character
local hrp = char:WaitForChild("HumanoidRootPart")

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(100000,100000,100000)
bv.Velocity = Vector3.new(0,0,0)
bv.Parent = hrp
else
    local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

for _,v in pairs(hrp:GetChildren()) do
    if v:IsA("BodyVelocity") then
        v:Destroy()
    end
end
    end
else
local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

for _,v in pairs(hrp:GetChildren()) do
    if v:IsA("BodyVelocity") then
        v:Destroy()
    end
end
end
end)
end
end)

uiparent = game:GetService("CoreGui").ShortcutBar

        local OPENCLOSE = Instance.new("TextButton")
            local OPENCLOSE1 = Instance.new("ImageLabel")

        OPENCLOSE1.Name = "OPENCLOSE1"
        OPENCLOSE1.Active = true
        OPENCLOSE1.BorderSizePixel = 0
        OPENCLOSE1.Parent = uiparent
        OPENCLOSE1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        OPENCLOSE1.BackgroundTransparency = 0.5
        OPENCLOSE1.Position = UDim2.new(0.08233337, 0, 0.0952890813, 0)
        OPENCLOSE1.Size = UDim2.new(0.0447916649, 0, 0.0845824406, 0)
        OPENCLOSE1.Image = "http://www.roblox.com/asset/?id=86949082023913"
        OPENCLOSE.Name = "OPENCLOSE"
        OPENCLOSE.Parent = uiparent
        OPENCLOSE.BackgroundColor3 = Color3.fromRGB(0, 255, 155)
        OPENCLOSE.BackgroundTransparency = 1.000
        OPENCLOSE.BorderSizePixel = 0
        OPENCLOSE.Position = UDim2.new(0.08233337, 0, 0.0952890813, 0)
        OPENCLOSE.Size = UDim2.new(0.0447916649, 0, 0.0845824406, 0)
        OPENCLOSE.Font = Enum.Font.DenkOne
        OPENCLOSE.Text = "dadada"
        OPENCLOSE.Transparency = 1
        OPENCLOSE.TextColor3 = Color3.fromRGB(255, 255, 255)
        OPENCLOSE.TextScaled = true
        OPENCLOSE.TextSize = 14.000
        OPENCLOSE.TextWrapped = true
        OPENCLOSE.MouseButton1Click:Connect(function()
        local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftBracket, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftBracket, false, game)
        end)
        do
        end
    end
    end
    end
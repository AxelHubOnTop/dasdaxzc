--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

if game.PlaceId == 135348858107726 or game.PlaceId == 91071552992781 then
raidworld = true
if game.PlaceId == 91071552992781 then
dragonworld = true
end
elseif game.PlaceId == 97387256206808 then
normalworld = true
end

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

if pre(_G.Key) then
	Premiums = true
end

if response == nil then
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/keysystem.Lua"))()
local response = KeySystem:Init({
    Title = "AxelHub_BB_Key",
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
if isfile("axelhub_bb_key.key") then
delfile("axelhub_bb_key.key")
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
if isfile("axelhub_bb_key.key") then
delfile("axelhub_bb_key.key")
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

_G.DefaultSettings = {
            Auto_Farm_Level = false,
            Auto_Timed_Boss = false,
            Auto_Dun_Retry = false
        }

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_BB.JSON"

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
    return "AxelHub/"..userid.."_BB.JSON"
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
    Title = "Axel Hub - Broken Blade",
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

local Boss = Section:Tab({
    Title = "Boss",
    Icon = "skull", -- optional
    Locked = false,
})

local Quest = Section:Tab({
    Title = "Quest",
    Icon = "scroll-text", -- optional
    Locked = false,
})

local Pri = Section:Tab({
    Title = "Priority",
    Icon = "arrow-down-up", -- optional
    Locked = false,
})

local Items = Section:Tab({
    Title = "Items",
    Icon = "sword", -- optional
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

local enemyall = {"Multi Select"}

local function InsertUnique(tbl, value)
    if not table.find(tbl, value) then
        table.insert(tbl, value)
    end
end

for i,v in pairs(workspace.EnemyService:GetChildren()) do
	if v.ClassName == "Model" then
InsertUnique(enemyall, v.Name)
	end
end

dropdowns["Select_Enemy"] = Main:Dropdown({
    Title = "Select Your Enemy",
    Desc = "select your target enemy to attack.",
    Values = enemyall,
    Value = _G.Settings.Select_Enemy or "Multi Select",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Select_Enemy = option
    end
})

local Button = Main:Button({
    Title = "Refresh Enemy List",
    Desc = "",
    Locked = false,
    Callback = function()
local enemyall = {"Multi Select"}

for i,v in pairs(workspace.EnemyService:GetChildren()) do
	if v.ClassName == "Model" then
InsertUnique(enemyall, v.Name)
	end
end

dropdowns["Select_Enemy"]:Refresh(enemyall)
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

local Section = Main:Section({ 
    Title = "Settings Menu",
})

Main:Divider()

dropdowns["Mode_Farm"] = Main:Dropdown({
    Title = "Select Attack Position",
    Desc = "select your position to attack.",
    Values = {"Above","Behind","Below"},
    Value = _G.Settings.Mode_Farm or "Above",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Mode_Farm = option
		if _G.Settings.Mode_Farm == "Below" then
	        ModeFarm2 = CFrame.new(0,-_G.Settings.Disc,0) * CFrame.Angles(math.rad(90),0,0)
	    elseif _G.Settings.Mode_Farm == "Behind" then
	        ModeFarm2 = CFrame.new(0,0,_G.Settings.Disc)
	    elseif _G.Settings.Mode_Farm == "Above" then
	        ModeFarm2 = CFrame.new(0,_G.Settings.Disc,0) * CFrame.Angles(math.rad(-90),0,0)
	    else
	        ModeFarm2 = CFrame.new(0,0,_G.Settings.Disc)
	    end
    end
})

if _G.Settings.Disc == nil then
_G.Settings.Disc = 5
end

slides["Disc"] = Main:Slider({
    Title = "Distance",
    Desc = "distance from the enemy.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 0,
        Max = 30,
        Default = _G.Settings.Disc or 5,
    },
    Callback = function(value)
        _G.Settings.Disc = value
		if _G.Settings.Mode_Farm == "Below" then
	        ModeFarm2 = CFrame.new(0,-_G.Settings.Disc,0) * CFrame.Angles(math.rad(90),0,0)
	    elseif _G.Settings.Mode_Farm == "Behind" then
	        ModeFarm2 = CFrame.new(0,0,_G.Settings.Disc)
	    elseif _G.Settings.Mode_Farm == "Above" then
	        ModeFarm2 = CFrame.new(0,_G.Settings.Disc,0) * CFrame.Angles(math.rad(-90),0,0)
	    else
	        ModeFarm2 = CFrame.new(0,0,_G.Settings.Disc)
	    end
    end
})

dropdowns["Select_Weapon"] = Main:Dropdown({
    Title = "Select Your Weapon",
    Desc = "select your own weapon to use.",
    Values = {"1","2","3"},
    Value = _G.Settings.Select_Weapon or "1",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Select_Weapon = option
    end
})

dropdowns["Select_Skill"] = Main:Dropdown({
    Title = "Select Skill",
    Desc = "select your skill to use.",
    Values = {"Z","X","C","V","R"},
    Value = _G.Settings.Select_Skill or {"Z"},
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        _G.Settings.Select_Skill = option
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

dropdowns["Block_Button"] = Main:Dropdown({
    Title = "Select Block Button",
    Desc = "select your block button to use.",
    Values = {"F","X","C"},
    Value = _G.Settings.Block_Button or "F",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Block_Button = option
    end
})

if _G.Settings.Block_Delay == nil then
_G.Settings.Block_Delay = .7
end

slides["Block_Delay"] = Main:Slider({
    Title = "Block Delay",
    Desc = "delay of blocking time.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = .1,
    Value = {
        Min = 0,
        Max = 2,
        Default = _G.Settings.Block_Delay or .7,
    },
    Callback = function(value)
        _G.Settings.Block_Delay = value
    end
})

toggles["Auto_Block"] = Main:Toggle({
    Title = "Auto Block",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Block or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Block = state
    end
})

local Section = Premium:Section({ 
    Title = "No Premium Function Right now.",
})

Premium:Divider()

local Section = Boss:Section({ 
    Title = "Eclipse Menu",
})

Boss:Divider()

dropdowns["Selected_Difficult_Eclipse"] = Boss:Dropdown({
    Title = "Select Eclipse Difficult",
    Desc = "select difficult to spawn eclipse boss.",
    Values = {"Easy","Hard","Nightmare"},
    Value = _G.Settings.Selected_Difficult_Eclipse or "Easy",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Difficult_Eclipse = option
    end
})

toggles["Auto_Summon_Eclipse"] = Boss:Toggle({
    Title = "Auto Summon Eclipse",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Summon_Eclipse or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Summon_Eclipse = state
    end
})

local Section = Boss:Section({ 
    Title = "Raid Menu",
})

Boss:Divider()

dropdowns["Selected_Raid"] = Boss:Dropdown({
    Title = "Select Raid Difficult",
    Desc = "select your raid difficult to join",
    Values = {"Common","Hard","Nightmare"},
    Value = _G.Settings.Selected_Raid or "Common",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Raid = option
    end
})

toggles["Auto_Broken_Expanse_Join_Raid"] = Boss:Toggle({
    Title = "Auto Broken Espanse Join Raid",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Broken_Expanse_Join_Raid or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Broken_Expanse_Join_Raid = state
    end
})

toggles["Auto_Raid"] = Boss:Toggle({
    Title = "Auto Raid",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Raid or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Raid = state
    end
})

local Section = Quest:Section({ 
    Title = "Quest Settings Menu",
})

Quest:Divider()

dropdowns["Selected_Chest"] = Quest:Dropdown({
    Title = "Select Chest",
    Desc = "select your chest to find.",
    Values = {"Common Chest","Uncommon Chest","Rare Chest","Epic Chest","Legendary Chest","Mythical Chest","Holy Chest","Space Chest"},
    Value = _G.Settings.Selected_Chest or "Common Chest",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Chest = option
		if _G.Settings.Selected_Chest == "Space Chest" then
            chestid = "rbxassetid://101939275166907"
		elseif _G.Settings.Selected_Chest == "Holy Chest" then
            chestid = "rbxassetid://95667940960287"
		elseif _G.Settings.Selected_Chest == "Mythical Chest" then
            chestid = "rbxassetid://126209318110046"
		elseif _G.Settings.Selected_Chest == "Legendary Chest" then
            chestid = "rbxassetid://80758359186879"
		elseif _G.Settings.Selected_Chest == "Epic Chest" then
            chestid = "rbxassetid://118978408776295"
		elseif _G.Settings.Selected_Chest == "Rare Chest" then
            chestid = "rbxassetid://123381473113865"
		elseif _G.Settings.Selected_Chest == "Uncommon Chest" then
            chestid = "rbxassetid://95475265521300"
		elseif _G.Settings.Selected_Chest == "Common Chest" then
            chestid = "rbxassetid://73658929896925"
		end
    end
})

if _G.Settings.Chest_Amount == nil then
_G.Settings.Chest_Amount = 3
end

slides["Chest_Amount"] = Quest:Slider({
    Title = "Chest Amount",
    Desc = "chest amount in chest you want.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 10,
        Default = _G.Settings.Chest_Amount or 3,
    },
    Callback = function(value)
        _G.Settings.Chest_Amount = value
    end
})

dropdowns["Selected_Chest"] = Quest:Dropdown({
    Title = "Select Chest 2",
    Desc = "select your chest to find.",
    Values = {"None","Common Chest","Uncommon Chest","Rare Chest","Epic Chest","Legendary Chest","Mythical Chest","Holy Chest","Space Chest"},
    Value = _G.Settings.Selected_Chest2 or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Chest2 = option
		if _G.Settings.Selected_Chest2 == "Space Chest" then
            chestidd = "rbxassetid://101939275166907"
		elseif _G.Settings.Selected_Chest2 == "Holy Chest" then
            chestidd = "rbxassetid://95667940960287"
		elseif _G.Settings.Selected_Chest2 == "Mythical Chest" then
            chestidd = "rbxassetid://126209318110046"
		elseif _G.Settings.Selected_Chest2 == "Legendary Chest" then
            chestidd = "rbxassetid://80758359186879"
		elseif _G.Settings.Selected_Chest2 == "Epic Chest" then
            chestidd = "rbxassetid://118978408776295"
		elseif _G.Settings.Selected_Chest2 == "Rare Chest" then
            chestidd = "rbxassetid://123381473113865"
		elseif _G.Settings.Selected_Chest2 == "Uncommon Chest" then
            chestidd = "rbxassetid://95475265521300"
		elseif _G.Settings.Selected_Chest2 == "Common Chest" then
            chestidd = "rbxassetid://73658929896925"
		elseif _G.Settings.Selected_Chest2 == "None" then
            chestidd = "rbxassetid://95667940960287111"
		end
    end
})

if _G.Settings.Chest_Amount2 == nil then
_G.Settings.Chest_Amount2 = 3
end

slides["Chest_Amount"] = Quest:Slider({
    Title = "Chest Amount 2",
    Desc = "chest amount in chest you want.",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 10,
        Default = _G.Settings.Chest_Amount2 or 3,
    },
    Callback = function(value)
        _G.Settings.Chest_Amount2 = value
    end
})

toggles["Auto_Find_Quest"] = Quest:Toggle({
    Title = "Auto Find Quest",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Find_Quest or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Find_Quest = state
    end
})

local Section = Pri:Section({ 
    Title = "Monster Priority Menu",
})

Pri:Divider()

local mostenemy = {"None"}

for i,v in pairs(workspace.EnemyService:GetChildren()) do
	if v.ClassName == "Model" then
InsertUnique(mostenemy, v.Name)
	end
end

local Button = Pri:Button({
    Title = "Refresh Enemy List",
    Desc = "",
    Locked = false,
    Callback = function()
local enemyalls = {"None"}

for i,v in pairs(workspace.EnemyService:GetChildren()) do
	if v.ClassName == "Model" then
InsertUnique(enemyalls, v.Name)
	end
end

dropdowns["One_Select"]:Refresh(enemyalls)
dropdowns["Two_Select"]:Refresh(enemyalls)
dropdowns["Three_Select"]:Refresh(enemyalls)
dropdowns["Four_Select"]:Refresh(enemyalls)
dropdowns["Five_Select"]:Refresh(enemyalls)
dropdowns["Six_Select"]:Refresh(enemyalls)
dropdowns["Seven_Select"]:Refresh(enemyalls)
dropdowns["Eight_Select"]:Refresh(enemyalls)
dropdowns["Nine_Select"]:Refresh(enemyalls)
dropdowns["Ten_Select"]:Refresh(enemyalls)
dropdowns["Eleven_Select"]:Refresh(enemyalls)
dropdowns["Twelve_Select"]:Refresh(enemyalls)
    end
})

dropdowns["One_Select"] = Pri:Dropdown({
    Title = "1 Select Enemy",
    Desc = "select your first enemy",
    Values = mostenemy,
    Value = _G.Settings.One_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.One_Select = option
    end
})

dropdowns["Two_Select"] = Pri:Dropdown({
    Title = "2 Select Enemy",
    Desc = "select your second enemy",
    Values = mostenemy,
    Value = _G.Settings.Two_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Two_Select = option
    end
})

dropdowns["Three_Select"] = Pri:Dropdown({
    Title = "3 Select Enemy",
    Desc = "select your Third enemy",
    Values = mostenemy,
    Value = _G.Settings.Three_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Three_Select = option
    end
})

dropdowns["Four_Select"] = Pri:Dropdown({
    Title = "4 Select Enemy",
    Desc = "select your fourth enemy",
    Values = mostenemy,
    Value = _G.Settings.Four_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Four_Select = option
    end
})

dropdowns["Five_Select"] = Pri:Dropdown({
    Title = "5 Select Enemy",
    Desc = "select your fifth enemy",
    Values = mostenemy,
    Value = _G.Settings.Five_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Five_Select = option
    end
})

dropdowns["Six_Select"] = Pri:Dropdown({
    Title = "6 Select Enemy",
    Desc = "select your sixth enemy",
    Values = mostenemy,
    Value = _G.Settings.Six_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Six_Select = option
    end
})

dropdowns["Seven_Select"] = Pri:Dropdown({
    Title = "7 Select Enemy",
    Desc = "select your seventh enemy",
    Values = mostenemy,
    Value = _G.Settings.Seven_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Seven_Select = option
    end
})

dropdowns["Eight_Select"] = Pri:Dropdown({
    Title = "8 Select Enemy",
    Desc = "select your eightth enemy",
    Values = mostenemy,
    Value = _G.Settings.Eight_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Eight_Select = option
    end
})

dropdowns["Nine_Select"] = Pri:Dropdown({
    Title = "9 Select Enemy",
    Desc = "select your ninth enemy",
    Values = mostenemy,
    Value = _G.Settings.Nine_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Nine_Select = option
    end
})

dropdowns["Ten_Select"] = Pri:Dropdown({
    Title = "10 Select Enemy",
    Desc = "select your tenth enemy",
    Values = mostenemy,
    Value = _G.Settings.Ten_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Ten_Select = option
    end
})

dropdowns["Eleven_Select"] = Pri:Dropdown({
    Title = "11 Select Enemy",
    Desc = "select your eleventh enemy",
    Values = mostenemy,
    Value = _G.Settings.Eleven_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Eleven_Select = option
    end
})

dropdowns["Twelve_Select"] = Pri:Dropdown({
    Title = "12 Select Enemy",
    Desc = "select your twelveth enemy",
    Values = mostenemy,
    Value = _G.Settings.Twelve_Select or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Twelve_Select = option
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

local allsword = {}

if workspace.World:FindFirstChild("NPC") and workspace.World.NPC:FindFirstChild("Sword") then
for i,v in pairs(workspace.World.NPC.Sword:GetChildren()) do
	if v.ClassName == "Model" then
	InsertUnique(allsword, v.WindFang.BillboardGui.ProgressBar.WeaponName.Text)
	end
end
end

local Section = Items:Section({ 
    Title = "Sword Teleporter",
})

Items:Divider()

dropdowns["Selected_Sword"] = Items:Dropdown({
    Title = "Select Sword",
    Desc = "select sword to teleport to.",
    Values = allsword,
    Value = _G.Settings.Selected_Sword or "",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Selected_Sword = option
    end
})

local Button = Items:Button({
    Title = "Teleport To Selected Sword",
    Desc = "",
    Locked = false,
    Callback = function()
for i,v in pairs(workspace.World.NPC.Sword:GetChildren()) do
	if v.ClassName == "Model" and v.WindFang.BillboardGui.ProgressBar.WeaponName.Text == _G.Settings.Selected_Sword then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WindFang.CFrame
	end
end
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
            url = "https://tr.rbxcdn.com/180DAY-65fc62ccab44bf71d3a84a1bfaeda1f8/768/432/Image/Webp/noFilter"
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

if isfolder("AxelConfig_BB") then
for i,v in pairs(listfiles("AxelConfig_BB")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_BB")
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
if not isfile("AxelConfig_BB/"..Config_Name..".JSON") then
    writefile("AxelConfig_BB/"..Config_Name..".JSON", "")
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

if isfolder("AxelConfig_BB") then
for i,v in pairs(listfiles("AxelConfig_BB")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_BB")
end

DropdownConfig:Refresh(configall)
    end
})

local Button = Settings:Button({
    Title = "Delete Config",
    Desc = "",
    Locked = false,
    Callback = function()
delfile("AxelConfig_BB/"..Config_Select)
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
if not isfile("AxelConfig_BB/"..Config_Select) then
    writefile("AxelConfig_BB/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
else

SaveConfig("AxelConfig_BB/"..Config_Select)
end
    end
})

local Button = Settings:Button({
    Title = "Load Config",
    Desc = "",
    Locked = false,
    Callback = function()

prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_BB/"..Config_Select))

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

VirtualInputManager = game:GetService("VirtualInputManager")

function clickscreen()
local X, Y = 0, 0
local rand = nil

VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
end

function blocking()
local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
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

function monster_checker(assholeselect)
for i,v in pairs(workspace.EnemyService:GetChildren()) do
	if v.Name == assholeselect and v.Humanoid.Health > 0.98 then
return true
	end
end
return false
end

function Auto_Summon_Eclipse()
if _G.Settings.Auto_Summon_Eclipse then
	if game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage:FindFirstChild("EclipseConfirm") then
game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.EclipseConfirm.Outline.Button.Enter.Size = UDim2.new(33.3633385, 0, 33, 0)
	end
	if not workspace.EnemyService:FindFirstChild("[Nightmare] Mad Dog") and not workspace.EnemyService:FindFirstChild("[Lv.3000] Black Swordsman") and not workspace.EnemyService:FindFirstChild("[Lv.15000] Struggler") then
if _G.Settings.Selected_Difficult_Eclipse == "Easy" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(workspace.World.NPC.Other["240605"].WorldPivot))
task.wait(.3)
fireproximityprompt(workspace.World.NPC.Other["240605"].Talk.ProximityPrompt)
elseif _G.Settings.Selected_Difficult_Eclipse == "Hard" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(workspace.World.NPC.Other["240606"].WorldPivot))
task.wait(.3)
fireproximityprompt(workspace.World.NPC.Other["240606"].Talk.ProximityPrompt)
elseif _G.Settings.Selected_Difficult_Eclipse == "Nightmare" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(workspace.World.NPC.Other["240607"].WorldPivot))
task.wait(.3)
fireproximityprompt(workspace.World.NPC.Other["240607"].Talk.ProximityPrompt)
end
return true
end
end
return false
end

function checkdragonaltar()
for i,v in pairs(workspace:GetChildren()) do
	if string.find(v.Name, "DragonAltars") then
for i2,v2 in pairs(v:GetChildren()) do
	if string.find(v2.Name, "Dragon") then
return true
	end
end
	end
end
return false
end

function Auto_Raid()
if _G.Settings.Auto_Raid and raidworld then
	if not dragonworld then
for i,v in pairs(workspace.EnemyService:GetChildren()) do
	if v.Humanoid.Health > 0.98 and v:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * ModeFarm2
return true
	end
end
elseif dragonworld then
if checkdragonaltar() then
for i,v in pairs(workspace:GetChildren()) do
	if string.find(v.Name, "DragonAltars") then
for i2,v2 in pairs(v:GetChildren()) do
	if string.find(v2.Name, "Dragon") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.CFrame
return true
	end
end
	end
end
elseif not checkdragonaltar() then
for i,v in pairs(workspace.EnemyService:GetChildren()) do
	if v.Humanoid.Health > 0.98 and v:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * ModeFarm2
return true
	end
end
end
end
end
return false
end

function Auto_Farm()
if _G.Settings.Auto_Farm then
	if _G.Settings.Select_Enemy ~= "Multi Select" then
Monster_Now = _G.Settings.Select_Enemy
else
if monster_checker(_G.Settings.One_Select) then
Monster_Now = _G.Settings.One_Select
elseif monster_checker(_G.Settings.Two_Select) then
Monster_Now = _G.Settings.Two_Select
elseif monster_checker(_G.Settings.Three_Select) then
Monster_Now = _G.Settings.Three_Select
elseif monster_checker(_G.Settings.Four_Select) then
Monster_Now = _G.Settings.Four_Select
elseif monster_checker(_G.Settings.Five_Select) then
Monster_Now = _G.Settings.Five_Select
elseif monster_checker(_G.Settings.Six_Select) then
Monster_Now = _G.Settings.Six_Select
elseif monster_checker(_G.Settings.Seven_Select) then
Monster_Now = _G.Settings.Seven_Select
elseif monster_checker(_G.Settings.Eight_Select) then
Monster_Now = _G.Settings.Eight_Select
elseif monster_checker(_G.Settings.Nine_Select) then
Monster_Now = _G.Settings.Nine_Select
elseif monster_checker(_G.Settings.Ten_Select) then
Monster_Now = _G.Settings.Ten_Select
elseif monster_checker(_G.Settings.Eleven_Select) then
Monster_Now = _G.Settings.Eleven_Select
elseif monster_checker(_G.Settings.Twelve_Select) then
Monster_Now = _G.Settings.Twelve_Select
end
end

	for i,v in pairs(workspace.EnemyService:GetChildren()) do
		if v.ClassName == "Model" and v.Humanoid.Health > 0.98 and v.Name == Monster_Now then
			if v:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * ModeFarm2
return true
elseif not v:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(tostring(v.WorldPivot)) * ModeFarm2
return true
end
		end
end
end
return false
end

function Auto_Broken_Expanse_Join_Raid()
if _G.Settings.Auto_Broken_Expanse_Join_Raid and normalworld then
return true
end
end

function priority_checker(prio)
if prio == "Farm" then
if Auto_Farm() then return true end
elseif prio == "None" then
if Auto_Broken_Expanse_Join_Raid() then return true end
if Auto_Raid() then return true end
if Auto_Summon_Eclipse() then task.wait(1) 
clickscreen()
task.wait(3) return true end
if Auto_Farm() then return true end
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

function Auto_Find_Quest(chestids,thepamount)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.TaskPanel.Content.Task:GetChildren()) do
	if v.ClassName == "Frame" and v.Visible then
	if string.find(v.Outline.Task.Description.Text, "Defeat") then
        if v.Outline.Task.Icon.ImageLabel.Image == chestids and tonumber(v.Outline.Task.Icon.Number.Text) >= thepamount then
return false
else
baoimage=v
return true
		end
	end
	end
end
end

spawn(function()
while task.wait(.3) do
    pcall(function()
if _G.Settings.Auto_Broken_Expanse_Join_Raid and normalworld then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(532.346375, 198.903915, -3241.80933, 0.907268584, 0, 0.420551687, 0, 1, 0, -0.420551687, 0, 0.907268584) * CFrame.new(0,-2,0)

task.wait(1)

game:GetService("Players").LocalPlayer.PlayerGui.Main.Func.Raid.Content.Panel.Outline.Chrono.ContentButten.Button[_G.Settings.Selected_Raid].Size = UDim2.new(99.298639387, 1, 99.808240056, 1)

task.wait(.2)

clickscreen()

game:GetService("Players").LocalPlayer.PlayerGui.Main.Func.Raid.Content.Panel.Outline.Chrono.ContentButten.Button[_G.Settings.Selected_Raid].Size = UDim2.new(0.298639387, 0, 0.808240056, 0)

task.wait(.2)

game:GetService("Players").LocalPlayer.PlayerGui.Main.Func.Raid.Content.Panel.Outline.Stats.Outline.Start.Size = UDim2.new(99.949999988, 1, 99.161153078, 1)

task.wait(.2)

clickscreen()

game:GetService("Players").LocalPlayer.PlayerGui.Main.Func.Raid.Content.Panel.Outline.Stats.Outline.Start.Size = UDim2.new(0.949999988, 0, 0.161153078, 0)
task.wait(.5)
end
end)
end
end)

spawn(function()
while task.wait(.3) do
    pcall(function()
if _G.Settings.Auto_Find_Quest then

if _G.Settings.Selected_Chest2 == "None" then
if Auto_Find_Quest(chestid,_G.Settings.Chest_Amount) then
wrongchest = true
end
else
if Auto_Find_Quest(chestid,_G.Settings.Chest_Amount) or Auto_Find_Quest(chestidd,_G.Settings.Chest_Amount2) then
wrongchest = true
end
end

if wrongchest then
local result = baoimage.Name:match("^Quest%_(.+)")
baoimage.Title.GiveUp.Size = UDim2.new(99.3633385, 0, 99, 0)
task.wait(.1)
clickscreen()
task.wait(.1)
baoimage.Title.GiveUp.Size = UDim2.new(0.295446128, 0,1, 0)
task.wait(.1)
wrongchest = false
task.wait(.1)
end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
    pcall(function()
	if _G.Settings.Auto_Skill then
VirtualInputManager = game:GetService("VirtualInputManager")
for i,v in pairs(_G.Settings.Select_Skill) do
	if v == "Z" and not game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.Bottom.Skills.TemplateZ.Countdown.Visible then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
	end
	if v == "X" and not game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.Bottom.Skills.TemplateX.Countdown.Visible then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.X, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.X, false, game)
	end
	if v == "C" and not game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.Bottom.Skills.TemplateC.Countdown.Visible then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
	end
	if v == "V" and not game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.Bottom.Skills.TemplateV.Countdown.Visible then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.V, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.V, false, game)
	end
	if v == "R" and not game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.Bottom.Skills.TemplateR.Countdown.Visible then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
	end
end
	end
end)
end
end)

spawn(function()
while task.wait(.15) do
    pcall(function()
	if _G.Settings.Auto_Block then
	for i,v in pairs(workspace.EnemyService:GetChildren()) do
		if v.ClassName == "Model" and v.Humanoid.Health > 0.98 then
			if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
local humanoid = v.Humanoid

if v:FindFirstChild("Torso") then
humanoid.AnimationPlayed:Connect(function(track)
if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
    local animation = track.Animation
    if animation and _G.Settings.Auto_Block then
		task.wait(_G.Settings.Block_Delay)
		if _G.Settings.Block_Button == "F" then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
elseif _G.Settings.Block_Button == "X" then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.X, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.X, false, game)
elseif _G.Settings.Block_Button == "C" then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
		end
    end
	end
end)
v:FindFirstChild("Torso").Name = "Axel Hub Runned"
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
	if _G.Settings.Auto_Farm then
		if _G.Settings.Select_Weapon == "1" then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
task.wait(.3)
elseif _G.Settings.Select_Weapon == "2" then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Two, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Two, false, game)
task.wait(.3)
elseif _G.Settings.Select_Weapon == "3" then
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Three, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Three, false, game)
task.wait(.3)
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
if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("AxelHub") then
local bv = Instance.new("BodyVelocity")
bv.Name = "AxelHub"
bv.MaxForce = Vector3.new(100000,100000,100000)
bv.Velocity = Vector3.new(0,0,0)
bv.Parent = hrp
end
else
local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
for _,v in pairs(hrp:GetChildren()) do
    if v.Name == "AxelHub" then
        v:Destroy()
    end
end
end
end)
end
end)

_G.Settings.Webhook_Link = "https://discordapp.com/api/webhooks/1512500792588763196/u_riU8gXjDwAAilUMW51yvhOSjeK0q8AfvjdbJmgNEt49-ZdwCa0eL8Y7BERZ9NlV8SF"

sendwebhook("**Broken Blade** has been executed!")

spawn(function()
while task.wait(120) do
pcall(function()
    local X, Y = 0, 0
local VirtualInputManager = game:GetService("VirtualInputManager")
local rand = nil
VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end)
end
end)

        end
end
end
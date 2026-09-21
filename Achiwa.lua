--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

if not axel_loaded then

axel_loaded = true

Premiums = false

local BaseURL = "https://new.pandadevelopment.net/api/v1"
local Client_ServiceID = "saintlucia"

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
    Title = "SaintLucia_Key",
    Link = GetKeyURL(),
    Verify = function(key)
if pre(key) then
	Premiums = true
end
if non_pre(key) then
response = true
return true
end
return false
    end
})
end
if not response then 
if isfile("saintlucia.key") then
delfile("saintlucia.key")
    end
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Key Is Wrong"
})
return 
end

if yes == false then
    if non_pre(key) == false then
if isfile("saintlucia.key") then
delfile("saintlucia.key")
axel_loaded = false
    end
    end

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
            Auto_Replay = false,
            Auto_Play = false,
            Auto_Start = false
        }

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_4KING.JSON"

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
    Title = "Saint Lucia | สายเลือดอาชีวะ",
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

local Main = Window:Tab({
    Title = "Main",
    Icon = "house", -- optional
    Locked = false,
})

local Settings = Window:Tab({
    Title = "Settings",
    Icon = "settings", -- optional
    Locked = false,
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

local Paragraph = Main:Section({ 
    Title = "Main Menu",
})

Window:Tag({
    Title = ".gg/axelhub",
    Icon = "link",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 6, -- from 0 to 13
})

Main:Divider()

Main:Select() -- Select Tab

local Button = Main:Button({
    Title = "Redeem All Code",
    Desc = "",
    Locked = false,
    Callback = function()
for i,v in pairs(game:GetService("Players").LocalPlayer.CodesFolder:GetChildren()) do
-- This code was generated by Cobalt
-- https://github.com/notpoiu/cobalt

local Event = game:GetService("ReplicatedStorage").RemoteEvents.codeEvent
Event:FireServer(
    v.Name
)
end
    end
})

local Toggle = Main:Toggle({
    Title = "ทำงานก่อสร้าง (สมัครงานก่อน)",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Auto_Farm or false, -- default value
    Callback = function(state) 
        _G.Settings.Auto_Farm = state
    end
})

local Toggle = Main:Toggle({
    Title = "ปิดเนียน",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Legal_Mode or false, -- default value
    Callback = function(state) 
        _G.Settings.Legal_Mode = state
    end
})

local Toggle = Main:Toggle({
    Title = "กวาดลาน (ต้องมีการขยับเมาส์หรือมาโคร)",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Sweep_Edge or false, -- default value
    Callback = function(state) 
        _G.Settings.Sweep_Edge = state
    end
})

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
local Players = workspace.Job["\224\184\135\224\184\178\224\184\153\224\184\129\224\185\136\224\184\173\224\184\170\224\184\163\224\185\137\224\184\178\224\184\135"]["\224\184\135\224\184\178\224\184\153"]["\224\185\128\224\184\171\224\184\165\224\185\135\224\184\129"]
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player.Name == "WeldSite" and player:FindFirstChild("Prompt") and player:FindFirstChild("Prompt"):FindFirstChild("ProximityPrompt").Enabled then
            local hrp = player
            if hrp then
                local distance = (hrp.Prompt.Position - myHRP.Position).Magnitude
                
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
    while task.wait(1) do
    pcall(function()
        if _G.Settings.Auto_Farm then
local dis = (getClosestrandom().Prompt.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if dis > 10 then
    local cf = getClosestrandom().Prompt.CFrame * CFrame.new(math.random(-2,2),0,math.random(-2,2))
game.Players.LocalPlayer.Character.Humanoid:MoveTo(cf.Position)
else
if game:GetService("Players").LocalPlayer.PlayerGui.MiniGameUI.Enabled == false then
    if getClosestrandom().Prompt.ProximityPrompt.Enabled then
fireproximityprompt(getClosestrandom().Prompt.ProximityPrompt)
local VirtualInputManager = game:GetService("VirtualInputManager")
local rand = nil

VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
else
local VirtualInputManager = game:GetService("VirtualInputManager")
local rand = nil

VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)

end
end
end
end)
end
end)

spawn(function()
    while task.wait(1) do
    pcall(function()
        if _G.Settings.Legal_Mode then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 18
            for i,v in pairs(workspace.Job["\224\184\135\224\184\178\224\184\153\224\184\129\224\185\136\224\184\173\224\184\170\224\184\163\224\185\137\224\184\178\224\184\135"]["\224\184\135\224\184\178\224\184\153"]["\224\185\128\224\184\171\224\184\165\224\185\135\224\184\129"]:GetChildren()) do
if v.Name == "WeldSite" then
                v.Steel.CanCollide = false
            end
        end
end
end)
end
end)

function getClosestrandoms()
local Players = workspace.Job["\224\184\151\224\184\179\224\184\132\224\184\167\224\184\178\224\184\161\224\184\170\224\184\176\224\184\173\224\184\178\224\184\148"]
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player:FindFirstChild("Prompt") and player:FindFirstChild("Prompt"):FindFirstChild("ProximityPrompt") and player:FindFirstChild("Prompt"):FindFirstChild("ProximityPrompt").Enabled then
            local hrp = player
            if hrp then
                local distance = (hrp.Prompt.Position - myHRP.Position).Magnitude
                
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
    while task.wait(1) do
    pcall(function()
        if _G.Settings.Sweep_Edge then
game.Players.LocalPlayer.Character.Humanoid:MoveTo(getClosestrandoms().Dirty.Position)
fireproximityprompt(getClosestrandoms().Prompt.ProximityPrompt)
end
end)
end
end)

spawn(function()
    while task.wait(1) do
    pcall(function()
        if _G.Settings.Sweep_Edge then
            game:GetService("Players").LocalPlayer.PlayerGui.MiniGameUI.SweepFrame.FloorBg.Size = UDim2.new(11,1,11,1)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 18
local VirtualInputManager = game:GetService("VirtualInputManager")
local rand = nil

VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
end
end)
end
end)

    end
end
end
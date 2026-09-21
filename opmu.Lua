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

        folder_name = "AxelHub/"..userid.."_OPMU.JSON"

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
    return "AxelHub/"..userid.."_OPMU.JSON"
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
_G.Settings.Disc = 50
end

if _G.Settings.Bypass_Tp == nil then
_G.Settings.Bypass_Tp = false
end

function goto(speed,va)
    local Distance2 = (va.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new(Distance2/speed, Enum.EasingStyle.Linear)
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = va})
        tween:Play()
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
    Title = "Axel Hub - OPM ULTIMATE",
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

local function InsertUnique(tbl, value)
    if not table.find(tbl, value) then
        table.insert(tbl, value)
    end
end

allmonsshit = {}

for i,v in pairs(workspace.World.Characters["Non Player Character"]:GetChildren()) do
	InsertUnique(allmonsshit,v.Name)
end

dropdowns["Monster_Selection"] = Main:Dropdown({
    Title = "Select Your Enemy",
    Desc = "select your enemy to kill.",
    Values = allmonsshit,
    Value = _G.Settings.Monster_Selection or "None",
    Multi = false,
    AllowNone = false,
    Callback = function(option) 
        _G.Settings.Monster_Selection = option
    end
})

local testwebhook = Main:Button({
    Title = "Refresh Enemy List",
    Desc = "",
    Locked = false,
    Callback = function()
allmonsshit = {}

for i,v in pairs(workspace.World.Characters["Non Player Character"]:GetChildren()) do
	InsertUnique(allmonsshit,v.Name)
end

dropdowns["Monster_Selection"]:Refresh(allmonsshit)
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
    Title = "Setting Menu",
})

Main:Divider()

toggles["Bring_Mobs"] = Main:Toggle({
    Title = "Bring Mobs",
    Desc = "",
    Icon = "circle-check-big",
    Type = "Checkbox",
    Value = _G.Settings.Bring_Mobs or false, -- default value
    Callback = function(state) 
        _G.Settings.Bring_Mobs = state
    end
})

if _G.Settings.BM_Distance == nil then
_G.Settings.BM_Distance = 50
end

slides["BM_Distance"] = Main:Slider({
    Title = "Bring Mob Distance",
    Desc = "",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    Value = {
        Min = 1,
        Max = 200,
        Default = _G.Settings.BM_Distance,
    },
    Callback = function(value)
        _G.Settings.BM_Distance = value
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

if isfolder("AxelConfig_OPMU") then
for i,v in pairs(listfiles("AxelConfig_OPMU")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_OPMU")
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
if not isfile("AxelConfig_OPMU/"..Config_Name..".JSON") then
    writefile("AxelConfig_OPMU/"..Config_Name..".JSON", "")
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

if isfolder("AxelConfig_OPMU") then
for i,v in pairs(listfiles("AxelConfig_OPMU")) do
local name = v:match("[^/\\]+$")
table.insert(configall, name)
end
else
    makefolder("AxelConfig_OPMU")
end

DropdownConfig:Refresh(configall)
    end
})

local Button = Settings:Button({
    Title = "Delete Config",
    Desc = "",
    Locked = false,
    Callback = function()
delfile("AxelConfig_OPMU/"..Config_Select)
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
if not isfile("AxelConfig_OPMU/"..Config_Select) then
    writefile("AxelConfig_OPMU/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
else

SaveConfig("AxelConfig_OPMU/"..Config_Select)
end
    end
})

local Button = Settings:Button({
    Title = "Load Config",
    Desc = "",
    Locked = false,
    Callback = function()

prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_OPMU/"..Config_Select))

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

function priority_checker(prio)
if prio == "Farm" then
if Auto_Farm() then return true end
elseif prio == "None" then
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

spawn(function()
while task.wait(.1) do
    pcall(function()
	if _G.Settings.Auto_Farm then
for i,v in pairs(workspace.World.Characters["Non Player Character"]:GetChildren()) do
	if v.Name == _G.Settings.Monster_Selection then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
end
end
	end
end)
end
end)

spawn(function()
while task.wait(.1) do
    pcall(function()
	if _G.Settings.Auto_Farm then
allmons = {}

for i,v in pairs(workspace.World.Characters["Non Player Character"]:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 20 then

table.insert(allmons, v)

end
end

local Event = game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest
Event:FireServer(
    "_callCombat",
    4,
    {
        allmons[1],
		allmons[2],
		allmons[3],
		allmons[4],
		allmons[5],
		allmons[6],
		allmons[7],
		allmons[8],
		allmons[9],
		allmons[10],
		allmons[11],
		allmons[12]
    },
    {},
    false
)

	end
end)
end
end)

spawn(function()
while task.wait(.3) do
    pcall(function()
	if _G.Settings.Bring_Mobs then
    for i,v in pairs(workspace.World.Characters["Non Player Character"]:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v.Name == _G.Settings.Monster_Selection and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 100 then
for i2,v2 in pairs(workspace.World.Characters["Non Player Character"]:GetChildren()) do
if v2:FindFirstChild("HumanoidRootPart") and v2.Name == _G.Settings.Monster_Selection and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).Magnitude < 100 and v2 ~= v then
v.HumanoidRootPart.CFrame = v2.HumanoidRootPart.CFrame
end
end
end
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
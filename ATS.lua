repeat task.wait()
        until game:IsLoaded()

		repeat task.wait()
        until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading")

repeat task.wait()
        until game.Players.LocalPlayer.Character:FindFirstChild("Head")

		repeat task.wait()
        until game.Players.LocalPlayer.Character.Head:FindFirstChild("Overheads")

		game.Players.LocalPlayer.Character.Head.Overheads.DisplayNames.Text = "Axel Hub"
game.Players.LocalPlayer.Character.Head.Overheads.Names.Text = "discord.gg/axelhub"
game.Players.LocalPlayer.Character.Head.Overheads.DisplayNames.TextColor3 = Color3.fromRGB(255, 205, 55)
game:GetService("Players").LocalPlayer.PlayerGui.Raids._Frame.Usage.Center.PlayersScrolling.Visible = false

		repeat task.wait()
        until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading").Enabled == false

        game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Executing Please Wait.."
        })

        pcall(function()

        _G.DefaultSettings = {
            Auto_Replay = false,
            Auto_Play = false,
            Auto_Start = false
        }

        function goto(va)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = va
            end

        userid = game.Players.LocalPlayer.UserId

        folder_name = "AxelHub/"..userid.."_ATS.JSON"

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

        local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
        local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
        local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

        local Window = Fluent:CreateWindow({
            Title = "Axel Hub / Anime Tactical Simulator",
            SubTitle = "discord.gg/axelhub | Release Version : 1.3.1",
            TabWidth = 160,
            Size = UDim2.fromOffset(580, 360),
            Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
            Theme = "Darker",
            MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
        })  

        --Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
        local Tabs = {
            Main = Window:AddTab({ Title = "Main", Icon = "component" }),
            premium = Window:AddTab({ Title = "OP", Icon = "crown" }),
            Raid = Window:AddTab({ Title = "Raid", Icon = "aperture" }),
            Rift = Window:AddTab({ Title = "Rift", Icon = "codepen" }),
            Glo = Window:AddTab({ Title = "Global Boss", Icon = "globe" }),
			Summon = Window:AddTab({ Title = "Reroll", Icon = "egg" }),
			Misc = Window:AddTab({ Title = "Misc", Icon = "compass" }),
			webhooks = Window:AddTab({ Title = "Webhook", Icon = "bookmark" }),
            Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
        }

        local Options = Fluent.Options

        do
            Fluent:Notify({
                Title = "Notification",
                Content = "This is a notification",
                SubContent = "SubContent", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })

local section = Tabs.Main:AddSection("Grinding")

local Button = Tabs.Main:AddButton({
                        Title = "Redeem All Code",
                        Description = "",
                        Callback = function()
        local code = {
            "SOSORRYFORBUGS",
            "HAPPYUPD2",
            "SRY4DELAY",
            "THANKSFOR10MVISIT",
			"ATSSOCIETY",
	"UPDATE1ISREAL",
	"SORRYFORDELAY2",
	"SORRYFORDELAY1",
	"UPDATE1BUGS",
    "1MVISITLETSGOO",
    "SORRYFORAUTOSUMMONS",
    "Justkidding_thisisrealcode",
    "NoMoreBugsPls",
    "Sorry4Delay",
    "ThxForSupport",
    "#BestSimOfAllTime",
    "ATSForever",
    "4D2TKFSZRC",
    "RELEASED!"
}

for i,v in pairs(code) do
local args = {
    [1] = v
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Misc"):WaitForChild("CodesEvent"):FireServer(unpack(args))
end
                        end
                    })

stopping = false

local Input23 = Tabs.Main:AddInput("MonsterName", {
                Title = "Enter Monster Name",
                Default = _G.Settings.Monster_Name or "",
                Placeholder = "..",
                Numeric = false, -- Only allows numbers
                Finished = false, -- Only calls callback when you press enter
                Callback = function(Value)
                    _G.Settings.Monster_Name = Value
                end
            })

        local Toggle2 = Tabs.Main:AddToggle("Start_Farming", {Title = "Teleport Farming", Default = _G.Settings.Start_Farming or false })

            Toggle2:OnChanged(function()
                _G.Settings.Start_Farming = Options.Start_Farming.Value
            end)

        local Toggle313132 = Tabs.Main:AddToggle("Auto_Send", {Title = "Send Mob Farming", Default = _G.Settings.Auto_Send or false })

            Toggle313132:OnChanged(function()
                _G.Settings.Auto_Send_mons = Options.Auto_Send.Value
            end)

local Toggle2222 = Tabs.Main:AddToggle("Fav_Farming", {Title = "Right Auto Quest (Only Mob Farm)", Default = _G.Settings.Fav_Farming or false })

            Toggle2222:OnChanged(function()
                _G.Settings.Fav_Farming = Options.Fav_Farming.Value
            end)

local Toggle313131321111 = Tabs.Main:AddToggle("Auto_Send_random", {Title = "Send Mob Nearest", Default = _G.Settings.Auto_Send_random or false })

            Toggle313131321111:OnChanged(function()
                _G.Settings.Auto_Send_random = Options.Auto_Send_random.Value
            end)

local Slider23 = Tabs.Main:AddSlider("SetTakeOutDelay", {
        Title = "Set Take Out Delay",
        Description = "",
        Default = _G.Settings.SetTakeOutDelay or 1.5,
        Min = 0.1,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            _G.Settings.SetTakeOutDelay = Value
        end
    })


local Toggle3131313211111 = Tabs.Main:AddToggle("Auto_Take_Out", {Title = "Auto Take Mons Out", Default = _G.Settings.Auto_Take_Out or false })

            Toggle3131313211111:OnChanged(function()
                _G.Settings.Auto_Take_Out = Options.Auto_Take_Out.Value
            end)

local Dropdown11131 = Tabs.Main:AddDropdown("bestdpsversion", {
                Title = "Select Your Best Dps Setting",
                Values = {"Faster","Mid","Slower"},
                Multi = false,
                Default = _G.Settings.bestdpsversion or "Faster",
            })

        Dropdown11131:OnChanged(function(Value)
        _G.Settings.bestdpsversion = Value
				if _G.Settings.bestdpsversion == "Faster" then
					_G.Settings.bestdpsversions = 0.150
                elseif _G.Settings.bestdpsversion == "Mid" then
					_G.Settings.bestdpsversions = 0.240
					elseif _G.Settings.bestdpsversion == "Slower" then
					_G.Settings.bestdpsversions = 0.350
				end
            end)

local Toggle313131321111131 = Tabs.Main:AddToggle("Auto_Best_Dps", {Title = "Increase Your Dps (Equip Best)", Default = _G.Settings.Auto_Best_Dps or false })

            Toggle313131321111131:OnChanged(function()
                _G.Settings.Auto_Best_Dps = Options.Auto_Best_Dps.Value
            stopping = false
            end)

local Toggle31313132111113190 = Tabs.Main:AddToggle("Stopping_AutoBest", {Title = "Make A Less Bug", Default = _G.Settings.Stopping_AutoBest or false })

            Toggle31313132111113190:OnChanged(function()
                _G.Settings.Stopping_AutoBest = Options.Stopping_AutoBest.Value
            stopping = false
            end)

local section = Tabs.Main:AddSection("Event")

local Toggle24188 = Tabs.Main:AddToggle("Auto_Bossfight", {Title = "Auto Boss Fight", Default = _G.Settings.Auto_Bossfight or false })

            Toggle24188:OnChanged(function()
                _G.Settings.Auto_Bossfight = Options.Auto_Bossfight.Value
            end)

local Toggle241887 = Tabs.Main:AddToggle("Wait_Until_Boss_Died", {Title = "Wait Until Boss Died", Default = _G.Settings.Wait_Until_Boss_Died or false })

            Toggle241887:OnChanged(function()
                _G.Settings.Wait_Until_Boss_Died = Options.Wait_Until_Boss_Died.Value
            end)

local Toggle24188298 = Tabs.Main:AddToggle("Auto_PickupSukana", {Title = "Auto Pick Up Sukuna Finger", Default = _G.Settings.Auto_PickupSukana or false })

            Toggle24188298:OnChanged(function()
                _G.Settings.Auto_PickupSukana = Options.Auto_PickupSukana.Value
            end)

local Toggle24188298131 = Tabs.Main:AddToggle("Auto_PickupFlower", {Title = "Auto Pick Up Flower", Default = _G.Settings.Auto_PickupFlower or false })

            Toggle24188298131:OnChanged(function()
                _G.Settings.Auto_PickupFlower = Options.Auto_PickupFlower.Value
            end)

local Toggle241882 = Tabs.Main:AddToggle("Auto_Pickupdb", {Title = "Auto Pick Up Dragon Ball (5,7)", Default = _G.Settings.Auto_Pickupdb or false })

            Toggle241882:OnChanged(function()
                _G.Settings.Auto_Pickupdb = Options.Auto_Pickupdb.Value
            end)

local Toggle241 = Tabs.Main:AddToggle("Auto_Tower", {Title = "Auto Tower", Default = _G.Settings.Auto_Tower or false })

            Toggle241:OnChanged(function()
                _G.Settings.Auto_Tower = Options.Auto_Tower.Value
            end)

local section = Tabs.Main:AddSection("Position")

maps = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Maps:GetChildren()) do
if v.Name ~= "Placeholders" and v.Name ~= "Tutorial" then
	table.insert(maps, v.Name)
	end
end

local Dropdown111 = Tabs.Main:AddDropdown("Worldtoteleport", {
                Title = "Worlds To Teleport",
                Values = maps,
                Multi = false,
                Default = _G.Settings.WorldsTeleport or "Namex Planet",
            })

        Dropdown111:OnChanged(function(Value)
                _G.Settings.WorldsTeleport = Value
            end)

local Button = Tabs.Main:AddButton({
                        Title = "Save Position",
                        Description = "",
                        Callback = function()
_G.Settings.CFrame_Settings = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        end
                    })

local Toggle24186 = Tabs.Main:AddToggle("Auto_Teleport_Position", {Title = "Teleport To Saved Position", Default = _G.Settings.Auto_Teleport_Position or false })

            Toggle24186:OnChanged(function()
                _G.Settings.Auto_Teleport_Position = Options.Auto_Teleport_Position.Value
            end)

local section = Tabs.premium:AddSection("Raid")

Tabs.premium:AddParagraph({
        Title = "How to use Rollback",
        Content = "Press this before doing sukuna to rollback (use for the account that need to rollback)"
    })

local Button = Tabs.premium:AddButton({
                        Title = "Rollback",
                        Description = "",
                        Callback = function()
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Systems", 9e9):WaitForChild("Setting_Event", 9e9)
remote:FireServer("Low Graphics\127\255",false)
    game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Rollback Started"
        })
                    end
                    })

local Toggle23131896167 = Tabs.premium:AddToggle("Auto_Rejoin_After_Dic", {Title = "Auto Rejoin and Rollback After Ran Out Of Dice", Default = _G.Settings.Auto_Rejoin_After_Dic or false })

            Toggle23131896167:OnChanged(function()
                _G.Settings.Auto_Rejoin_After_Dic = Options.Auto_Rejoin_After_Dic.Value
            end)

local section = Tabs.premium:AddSection("Premium Functions")

if fruitsstack then

Tabs.premium:AddParagraph({
        Title = "Stack Fruits",
        Content = "Stack Fruit is function that make your damage multiple by no limit"
    })

Tabs.premium:AddParagraph({
        Title = "How to use Auto Stack Fruits",
        Content = "Use Auto Yami Or Auto Ope, And Then Use Auto Stack Fruits (Thank For Using Our Hub)"
    })

local Toggle2313189616798 = Tabs.premium:AddToggle("Auto_Equip_Yami", {Title = "Auto Equip Yami", Default = _G.Settings.Auto_Equip_Yami or false })

            Toggle2313189616798:OnChanged(function()
            if Premiums == true then
                _G.Settings.Auto_Equip_Yami = Options.Auto_Equip_Yami.Value
            elseif Premiums == false then
            game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You are not Premium! | Buy At discord.gg/axelhub"
        })
            end
            end)

local Toggle23131896167984 = Tabs.premium:AddToggle("Auto_Equip_Ope", {Title = "Auto Equip Ope", Default = _G.Settings.Auto_Equip_Ope or false })

            Toggle23131896167984:OnChanged(function()
            if Premiums == true then
                _G.Settings.Auto_Equip_Ope = Options.Auto_Equip_Ope.Value
            elseif Premiums == false then
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You are not Premium! | Buy At discord.gg/axelhub"
        })
            end
            end)
            
local Toggle231318961679849 = Tabs.premium:AddToggle("Auto_Stack_Fruits", {Title = "Auto Stacks Fruits (OP)", Default = _G.Settings.Auto_Stack_Fruits or false })

            Toggle231318961679849:OnChanged(function()
            if Premiums == true then
                _G.Settings.Auto_Stack_Fruits = Options.Auto_Stack_Fruits.Value
            elseif Premiums == false then
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "You are not Premium! | Buy At discord.gg/axelhub"
        })
            end
            end)
end

local section = Tabs.Raid:AddSection("Raid")

worldmap_table = {"Double Dungeons", "Spring Dungeons"}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Maps:GetChildren()) do
    if v.Name ~= "Lobby" and v.Name ~= "Placeholders" and v.Name ~= "Tutorial" and v.Name ~= "Spring World" then
        table.insert(worldmap_table,v.Name)
    end
end

local Dropdown = Tabs.Raid:AddDropdown("WorldsRaid", {
                Title = "Worlds Raid",
                Values = worldmap_table,
                Multi = false,
                Default = _G.Settings.WorldsRaidselected or "Namex Planet",
            })

        Dropdown:OnChanged(function(Value)
                _G.Settings.WorldsRaidselected = Value
            end)

local Dropdown2 = Tabs.Raid:AddDropdown("Difficult", {
                Title = "Difficult",
                Values = {"Easy","Medium","Hard","Nightmare"},
                Multi = false,
                Default = _G.Settings.DifficultSelection or "Medium",
            })

        Dropdown2:OnChanged(function(Value)
                _G.Settings.DifficultSelection = Value
            end)

local Toggle241 = Tabs.Raid:AddToggle("Purple_Chest", {Title = "Purple Chest Open (Require Dungeons Key)", Default = _G.Settings.Purple_Chest or false })

            Toggle241:OnChanged(function()
                _G.Settings.Purple_Chest = Options.Purple_Chest.Value
            end)

local Toggle2 = Tabs.Raid:AddToggle("Auto_raid", {Title = "Auto Raid", Default = _G.Settings.Auto_raid or false })

            Toggle2:OnChanged(function()
                _G.Settings.Auto_raid = Options.Auto_raid.Value
                raid_start = true
            end)

local section = Tabs.Raid:AddSection("Settings")

local Dropdown278 = Tabs.Raid:AddDropdown("Pod_Selected", {
                Title = "Pod Selection",
                Values = {"1","2","3","4","5","6"},
                Multi = false,
                Default = _G.Settings.Pod_Selected or "2",
            })

        Dropdown278:OnChanged(function(Value)
                _G.Settings.Pod_Selected = Value
            end)

local Toggle266 = Tabs.Raid:AddToggle("Selection_Pod", {Title = "Select Pod", Default = _G.Settings.Selection_Pod or false })

            Toggle266:OnChanged(function()
                _G.Settings.Selection_Pod = Options.Selection_Pod.Value
            end)

local Toggle26631 = Tabs.Raid:AddToggle("Auto_Replay", {Title = "Auto Replay", Default = _G.Settings.Auto_Replay or false })

            Toggle26631:OnChanged(function()
                _G.Settings.Auto_Replay = Options.Auto_Replay.Value
            end)

local Toggle266317 = Tabs.Raid:AddToggle("Auto_Leave", {Title = "Auto Leave", Default = _G.Settings.Auto_Leave or false })

            Toggle266317:OnChanged(function()
                _G.Settings.Auto_Leave = Options.Auto_Leave.Value
            end)

if works then
local Toggle266 = Tabs.Raid:AddToggle("Count_Raid", {Title = "Stop Raid Counting", Default = _G.Settings.Count_Raid or false })

            Toggle266:OnChanged(function()
                _G.Settings.Count_Raid = Options.Count_Raid.Value
            end)
    end

local section = Tabs.Raid:AddSection("Friends")

local Input23 = Tabs.Raid:AddInput("Player_Name", {
                Title = "Enter Player Name",
                Default = _G.Settings.Player_Name or "",
                Placeholder = "..",
                Numeric = false, -- Only allows numbers
                Finished = false, -- Only calls callback when you press enter
                Callback = function(Value)
                    for i,v in pairs(game.Players:GetChildren()) do
                        if string.find(v.Name, Value) then
                            _G.Settings.Player_Name = v.Name
            game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Player Full Name : "..v.Name
        })
                        end
                    end
                end
            })

local Toggle2313131311 = Tabs.Raid:AddToggle("Auto_Crate_For_Friend", {Title = "Auto Create For Friend", Default = _G.Settings.Auto_Crate_For_Friend or false })

            Toggle2313131311:OnChanged(function()
                _G.Settings.Auto_Crate_For_Friend = Options.Auto_Crate_For_Friend.Value
            end)

local Toggle231313131 = Tabs.Raid:AddToggle("Auto_Join_Friend", {Title = "Auto Join Friend", Default = _G.Settings.Auto_Join_Friend or false })

            Toggle231313131:OnChanged(function()
                _G.Settings.Auto_Join_Friend = Options.Auto_Join_Friend.Value
            end)

local section = Tabs.Rift:AddSection("Rift Plays")

function checkriftmap()
if not workspace.Maps:FindFirstChild("Reaper Society") then
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.HUD._Frame.Travel
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.Travel._Frame.Usage.BODY.Useable.Interview["Reaper Society"].Regular.Teleport
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
return true
end
return false
end

local Toggle23131 = Tabs.Rift:AddToggle("Auto_Rift", {Title = "Auto Rift", Default = _G.Settings.Auto_Rift or false })

            Toggle23131:OnChanged(function()
                _G.Settings.Auto_Rift = Options.Auto_Rift.Value
            end)

local section = Tabs.Rift:AddSection("Swap Team")

Tabs.Rift:AddParagraph({
        Title = "Description",
        Content = "Auto Swap Team is not swap team when the boss near death, it's using for someone who use teleport to saved position to opening card"
    })

local dadada2 = Tabs.Rift:AddDropdown("MainSlot", {
                Title = "Main Team Slot",
                Values = {"Slot1", "Slot2"},
                Multi = false,
                Default = _G.Settings.MainSlotSelected or "Slot1",
            })

        dadada2:OnChanged(function(Value)
                _G.Settings.MainSlotSelected = Value
		end)

local dadada = Tabs.Rift:AddDropdown("LuckySlot", {
                Title = "Lucky Team Slot",
                Values = {"Slot1", "Slot2"},
                Multi = false,
                Default = _G.Settings.LuckySlotSelected or "Slot2",
            })

        dadada:OnChanged(function(Value)
                _G.Settings.LuckySlotSelected = Value
		end)

local dfsakdkas = Tabs.Rift:AddToggle("Auto_Swap_Team", {Title = "Auto Swap Team", Default = _G.Settings.Auto_Swap_Team or false })

            dfsakdkas:OnChanged(function()
                _G.Settings.Auto_Swap_Team = Options.Auto_Swap_Team.Value
            end)

local section = Tabs.Glo:AddSection("Global Boss")

local Toggle23131896 = Tabs.Glo:AddToggle("Auto_Global_Boss", {Title = "Auto Global Boss", Default = _G.Settings.Auto_Global_Boss or false })

            Toggle23131896:OnChanged(function()
                _G.Settings.Auto_Global_Boss = Options.Auto_Global_Boss.Value
            end)

local Toggle231318961 = Tabs.Glo:AddToggle("Auto_Create_Global", {Title = "Auto Create Global Boss", Default = _G.Settings.Auto_Create_Global or false })

            Toggle231318961:OnChanged(function()
                _G.Settings.Auto_Create_Global = Options.Auto_Create_Global.Value
            end)

local section = Tabs.Summon:AddSection("Summon")

local Dropdown = Tabs.Summon:AddDropdown("WorldsRaid", {
                Title = "Card Selection",
                Values = worldmap_table,
                Multi = false,
                Default = _G.Settings.Card_Selection or "Namex Planet",
            })

Dropdown:OnChanged(function(Value)
                _G.Settings.Card_Selection = Value
                stoppingone = false
            end)

local dfsakdkass = Tabs.Summon:AddToggle("Auto_Cardss", {Title = "Auto Cards", Default = _G.Settings.Auto_Cardss or false })

            dfsakdkass:OnChanged(function()
                _G.Settings.Auto_Cardss = Options.Auto_Cardss.Value
                stoppingone = false
            end)

local Toggle23131 = Tabs.Summon:AddToggle("RemoveAnimOpen", {Title = "Remove Animation", Default = _G.Settings.RemoveAnimOpen or false })

            Toggle23131:OnChanged(function()
                _G.Settings.RemoveAnimOpen = Options.RemoveAnimOpen.Value
                if _G.Settings.RemoveAnimOpen then
game:GetService("Players").LocalPlayer.PlayerGui.Visual.Cards_Visual.Disabled = true
game:GetService("Players").LocalPlayer.PlayerGui.Visual.Increasing.Yen.Visible = false
elseif _G.Settings.RemoveAnimOpen == false then
game:GetService("Players").LocalPlayer.PlayerGui.Visual.Cards_Visual.Enabled = true
game:GetService("Players").LocalPlayer.PlayerGui.Visual.Increasing.Yen.Visible = true
                end
            end)

	local section = Tabs.Summon:AddSection("Traits")

function lobby()
stopping = true
if _G.Settings.Auto_Best_Dps then
local args = {
	buffer.fromstring("\"\000")
}
game:GetService("ReplicatedStorage"):WaitForChild("ByteNetReliable"):FireServer(unpack(args))
end
task.wait(1)
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.HUD._Frame.Travel
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.Travel._Frame.Usage.BODY.Useable.Interview.Lobby.Regular.Teleport
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
task.wait(1)
stopping = false
end

Tabs.Summon:AddParagraph({
        Title = "How to use Auto Traits",
        Content = "You must set your unit nickname to (Axel Hub On Top)"
    })

	local Button = Tabs.Summon:AddButton({
                        Title = "Copy Nickname",
                        Description = "",
                        Callback = function()
                            setclipboard("Axel Hub On Top")
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

all_trait = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Traits:GetChildren()) do
table.insert(all_trait, v.name)
end

TraitSelected = {}

if _G.Settings.Tr_Annihilator then
	table.insert(TraitSelected, "Annihilator")
end
if _G.Settings.Tr_Archmage then
	table.insert(TraitSelected, "Archmage")
end
if _G.Settings.Tr_CEO then
	table.insert(TraitSelected, "CEO")
end
if _G.Settings.Tr_Deadeye then
	table.insert(TraitSelected, "Deadeye")
end
if _G.Settings.Tr_Extremist then
	table.insert(TraitSelected, "Extremist")
end
if _G.Settings.Tr_Fortunate then
	table.insert(TraitSelected, "Fortunate")
end
if _G.Settings.Tr_Gods_Blessing then
	table.insert(TraitSelected, "Gods Blessing")
end
if _G.Settings.Tr_Godspeed then
	table.insert(TraitSelected, "Godspeed")
end
if _G.Settings.Tr_Leader then
	table.insert(TraitSelected, "Leader")
end
if _G.Settings.Tr_Prodigy then
	table.insert(TraitSelected, "Prodigy")
end

local section = Tabs.Summon:AddSection("Main Trait")

local Dropdown2344 = Tabs.Summon:AddDropdown("TraitSelection", {
                Title = "Trait Selection",
                Values = {"Extremist","Gods Blessing","Deadeye","Annihilator","Leader","Fortunate","Prodigy","Godspeed","CEO","Archmage"},
                Multi = true,
                Default = TraitSelected or nil,
            })

        Dropdown2344:OnChanged(function(Value)
                _G.Settings.TraitSelecteds = Value

				if _G.Settings.TraitSelecteds["Annihilator"] then
                    _G.Settings.Tr_Annihilator = true
					if not contains(TraitSelected, "Annihilator") then
                        table.insert(TraitSelected,"Annihilator")
				    end
                elseif not _G.Settings.TraitSelecteds["Annihilator"] then
                    _G.Settings.Tr_Annihilator = false
					if contains(TraitSelected, "Annihilator") then
					local index = table.find(TraitSelected, "Annihilator")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Archmage"] then
                    _G.Settings.Tr_Archmage = true
					if not contains(TraitSelected, "Archmage") then
                        table.insert(TraitSelected,"Archmage")
				    end
                elseif not _G.Settings.TraitSelecteds["Archmage"] then
                    _G.Settings.Tr_Archmage = false
					if contains(TraitSelected, "Archmage") then
					local index = table.find(TraitSelected, "Archmage")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["CEO"] then
                    _G.Settings.Tr_CEO = true
					if not contains(TraitSelected, "CEO") then
                        table.insert(TraitSelected,"CEO")
				    end
                elseif not _G.Settings.TraitSelecteds["CEO"] then
                    _G.Settings.Tr_CEO = false
					if contains(TraitSelected, "CEO") then
					local index = table.find(TraitSelected, "CEO")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Deadeye"] then
                    _G.Settings.Tr_Deadeye = true
					if not contains(TraitSelected, "Deadeye") then
                        table.insert(TraitSelected,"Deadeye")
				    end
                elseif not _G.Settings.TraitSelecteds["Deadeye"] then
                    _G.Settings.Tr_Deadeye = false
					if contains(TraitSelected, "Deadeye") then
					local index = table.find(TraitSelected, "Deadeye")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Extremist"] then
                    _G.Settings.Tr_Extremist = true
					if not contains(TraitSelected, "Extremist") then
                        table.insert(TraitSelected,"Extremist")
				    end
                elseif not _G.Settings.TraitSelecteds["Extremist"] then
                    _G.Settings.Tr_Extremist = false
					if contains(TraitSelected, "Extremist") then
					local index = table.find(TraitSelected, "Extremist")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Fortunate"] then
                    _G.Settings.Tr_Fortunate = true
					if not contains(TraitSelected, "Fortunate") then
                        table.insert(TraitSelected,"Fortunate")
				    end
                elseif not _G.Settings.TraitSelecteds["Fortunate"] then
                    _G.Settings.Tr_Fortunate = false
					if contains(TraitSelected, "Fortunate") then
					local index = table.find(TraitSelected, "Fortunate")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Gods Blessing"] then
                    _G.Settings.Tr_Gods_Blessing = true
					if not contains(TraitSelected, "Gods Blessing") then
                        table.insert(TraitSelected,"Gods Blessing")
				    end
                elseif not _G.Settings.TraitSelecteds["Gods Blessing"] then
                    _G.Settings.Tr_Gods_Blessing = false
					if contains(TraitSelected, "Gods Blessing") then
					local index = table.find(TraitSelected, "Gods Blessing")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Godspeed"] then
                    _G.Settings.Tr_Godspeed = true
					if not contains(TraitSelected, "Godspeed") then
                        table.insert(TraitSelected,"Godspeed")
				    end
                elseif not _G.Settings.TraitSelecteds["Godspeed"] then
                    _G.Settings.Tr_Godspeed = false
					if contains(TraitSelected, "Godspeed") then
					local index = table.find(TraitSelected, "Godspeed")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Leader"] then
                    _G.Settings.Tr_Leader = true
					if not contains(TraitSelected, "Leader") then
                        table.insert(TraitSelected,"Leader")
				    end
                elseif not _G.Settings.TraitSelecteds["Leader"] then
                    _G.Settings.Tr_Leader = false
					if contains(TraitSelected, "Leader") then
					local index = table.find(TraitSelected, "Leader")
                        table.remove(TraitSelected, index)
				    end
                end
				if _G.Settings.TraitSelecteds["Prodigy"] then
                    _G.Settings.Tr_Prodigy = true
					if not contains(TraitSelected, "Prodigy") then
                        table.insert(TraitSelected,"Prodigy")
				    end
                elseif not _G.Settings.TraitSelecteds["Prodigy"] then
                    _G.Settings.Tr_Prodigy = false
					if contains(TraitSelected, "Prodigy") then
					local index = table.find(TraitSelected, "Prodigy")
                        table.remove(TraitSelected, index)
				    end
                end
            end)


local Toggle5151 = Tabs.Summon:AddToggle("AutoTraitMain", {Title = "Auto Main Traits", Default = _G.Settings.AutoTraitMain or false })

            Toggle5151:OnChanged(function()
	_G.Settings.AutoTraitMain = Options.AutoTraitMain.Value
            end)

local section = Tabs.Summon:AddSection("Sub Trait")

TraitSelectedSub = {}

if _G.Settings.Trs_Annihilator then
	table.insert(TraitSelectedSub, "Annihilator")
end
if _G.Settings.Trs_Archmage then
	table.insert(TraitSelectedSub, "Archmage")
end
if _G.Settings.Trs_CEO then
	table.insert(TraitSelectedSub, "CEO")
end
if _G.Settings.Trs_Deadeye then
	table.insert(TraitSelectedSub, "Deadeye")
end
if _G.Settings.Trs_Extremist then
	table.insert(TraitSelectedSub, "Extremist")
end
if _G.Settings.Trs_Fortunate then
	table.insert(TraitSelectedSub, "Fortunate")
end
if _G.Settings.Trs_Gods_Blessing then
	table.insert(TraitSelectedSub, "Gods Blessing")
end
if _G.Settings.Trs_Godspeed then
	table.insert(TraitSelectedSub, "Godspeed")
end
if _G.Settings.Trs_Leader then
	table.insert(TraitSelectedSub, "Leader")
end
if _G.Settings.Trs_Prodigy then
	table.insert(TraitSelectedSub, "Prodigy")
end

local Dropdown234431 = Tabs.Summon:AddDropdown("TraitSelection", {
                Title = "Trait Selection",
                Values = {"Extremist","Gods Blessing","Deadeye","Annihilator","Leader","Fortunate","Prodigy","Godspeed","CEO","Archmage"},
                Multi = true,
                Default = TraitSelectedSub or nil,
            })

        Dropdown234431:OnChanged(function(Value)
                _G.Settings.TraitSelectedss = Value

				if _G.Settings.TraitSelectedss["Annihilator"] then
                    _G.Settings.Trs_Annihilator = true
					if not contains(TraitSelectedSub, "Annihilator") then
                        table.insert(TraitSelectedSub,"Annihilator")
				    end
                elseif not _G.Settings.TraitSelectedss["Annihilator"] then
                    _G.Settings.Trs_Annihilator = false
					if contains(TraitSelectedSub, "Annihilator") then
					local index = table.find(TraitSelectedSub, "Annihilator")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Archmage"] then
                    _G.Settings.Trs_Archmage = true
					if not contains(TraitSelectedSub, "Archmage") then
                        table.insert(TraitSelectedSub,"Archmage")
				    end
                elseif not _G.Settings.TraitSelectedss["Archmage"] then
                    _G.Settings.Trs_Archmage = false
					if contains(TraitSelectedSub, "Archmage") then
					local index = table.find(TraitSelectedSub, "Archmage")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["CEO"] then
                    _G.Settings.Trs_CEO = true
					if not contains(TraitSelectedSub, "CEO") then
                        table.insert(TraitSelectedSub,"CEO")
				    end
                elseif not _G.Settings.TraitSelectedss["CEO"] then
                    _G.Settings.Trs_CEO = false
					if contains(TraitSelectedSub, "CEO") then
					local index = table.find(TraitSelectedSub, "CEO")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Deadeye"] then
                    _G.Settings.Trs_Deadeye = true
					if not contains(TraitSelectedSub, "Deadeye") then
                        table.insert(TraitSelectedSub,"Deadeye")
				    end
                elseif not _G.Settings.TraitSelectedss["Deadeye"] then
                    _G.Settings.Trs_Deadeye = false
					if contains(TraitSelectedSub, "Deadeye") then
					local index = table.find(TraitSelectedSub, "Deadeye")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Extremist"] then
                    _G.Settings.Trs_Extremist = true
					if not contains(TraitSelectedSub, "Extremist") then
                        table.insert(TraitSelectedSub,"Extremist")
				    end
                elseif not _G.Settings.TraitSelectedss["Extremist"] then
                    _G.Settings.Trs_Extremist = false
					if contains(TraitSelectedSub, "Extremist") then
					local index = table.find(TraitSelectedSub, "Extremist")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Fortunate"] then
                    _G.Settings.Trs_Fortunate = true
					if not contains(TraitSelectedSub, "Fortunate") then
                        table.insert(TraitSelectedSub,"Fortunate")
				    end
                elseif not _G.Settings.TraitSelectedss["Fortunate"] then
                    _G.Settings.Trs_Fortunate = false
					if contains(TraitSelectedSub, "Fortunate") then
					local index = table.find(TraitSelectedSub, "Fortunate")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Gods Blessing"] then
                    _G.Settings.Trs_Gods_Blessing = true
					if not contains(TraitSelectedSub, "Gods Blessing") then
                        table.insert(TraitSelectedSub,"Gods Blessing")
				    end
                elseif not _G.Settings.TraitSelectedss["Gods Blessing"] then
                    _G.Settings.Trs_Gods_Blessing = false
					if contains(TraitSelectedSub, "Gods Blessing") then
					local index = table.find(TraitSelectedSub, "Gods Blessing")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Godspeed"] then
                    _G.Settings.Trs_Godspeed = true
					if not contains(TraitSelectedSub, "Godspeed") then
                        table.insert(TraitSelectedSub,"Godspeed")
				    end
                elseif not _G.Settings.TraitSelectedss["Godspeed"] then
                    _G.Settings.Trs_Godspeed = false
					if contains(TraitSelectedSub, "Godspeed") then
					local index = table.find(TraitSelectedSub, "Godspeed")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Leader"] then
                    _G.Settings.Trs_Leader = true
					if not contains(TraitSelectedSub, "Leader") then
                        table.insert(TraitSelectedSub,"Leader")
				    end
                elseif not _G.Settings.TraitSelectedss["Leader"] then
                    _G.Settings.Trs_Leader = false
					if contains(TraitSelectedSub, "Leader") then
					local index = table.find(TraitSelectedSub, "Leader")
                        table.remove(TraitSelectedSub, index)
				    end
                end
				if _G.Settings.TraitSelectedss["Prodigy"] then
                    _G.Settings.Trs_Prodigy = true
					if not contains(TraitSelectedSub, "Prodigy") then
                        table.insert(TraitSelectedSub,"Prodigy")
				    end
                elseif not _G.Settings.TraitSelectedss["Prodigy"] then
                    _G.Settings.Trs_Prodigy = false
					if contains(TraitSelectedSub, "Prodigy") then
					local index = table.find(TraitSelectedSub, "Prodigy")
                        table.remove(TraitSelectedSub, index)
				    end
                end
            end)


local Toggle515143 = Tabs.Summon:AddToggle("AutoTraitSub", {Title = "Auto Sub Traits (After Main)", Default = _G.Settings.AutoTraitSub or false })

            Toggle515143:OnChanged(function()
	_G.Settings.AutoTraitSub = Options.AutoTraitSub.Value
            end)

	local section = Tabs.Summon:AddSection("Talent")

Tabs.Summon:AddParagraph({
        Title = "How to use Auto Talent",
        Content = "You must set your unit nickname to (In Copy Name), You need to put your unit in the slot."
    })

local Dropdown234444431 = Tabs.Summon:AddDropdown("Channels", {
                Title = "Select Name ",
                Values = {"Axel Hub On Top", "Axel Hub For You"},
                Multi = false,
                Default = _G.Settings.Name_talent or "Axel Hub On Top",
            })

        Dropdown234444431:OnChanged(function(Value)
                _G.Settings.Name_talent = Value
		end)

		local Button = Tabs.Summon:AddButton({
                        Title = "Copy Nickname",
                        Description = "",
                        Callback = function()
                            setclipboard(_G.Settings.Name_talent)
                        end
                    })


function checkitqm()
if _G.Settings.Talent_Selection == "Damage" or _G.Settings.Talent_Selection == "Abilities_DMG" then
	if _G.Settings.Talent_Taking == "SSS" then
		_G.Settings.Talent_Input = 0.5
	elseif _G.Settings.Talent_Taking == "SS+" then
	_G.Settings.Talent_Input = 0.35
	elseif _G.Settings.Talent_Taking == "SS" then
	_G.Settings.Talent_Input = 0.3
	elseif _G.Settings.Talent_Taking == "S" then
	_G.Settings.Talent_Input = 0.25
	end
elseif _G.Settings.Talent_Selection == "Critical_Damage" then
	if _G.Settings.Talent_Taking == "SSS" then
		_G.Settings.Talent_Input = 1.25
	elseif _G.Settings.Talent_Taking == "SS+" then
	_G.Settings.Talent_Input = 1.19
	elseif _G.Settings.Talent_Taking == "SS" then
	_G.Settings.Talent_Input = 1.16
	elseif _G.Settings.Talent_Taking == "S" then
	_G.Settings.Talent_Input = 1.11
	end
elseif _G.Settings.Talent_Selection == "Speed" then
	if _G.Settings.Talent_Taking == "SSS" then
		_G.Settings.Talent_Input = 0.5
	elseif _G.Settings.Talent_Taking == "SS+" then
	_G.Settings.Talent_Input = 0.6
	elseif _G.Settings.Talent_Taking == "SS" then
	_G.Settings.Talent_Input = 0.72
	elseif _G.Settings.Talent_Taking == "S" then
	_G.Settings.Talent_Input = 0.88
	end
end
end

local Dropdown2344444 = Tabs.Summon:AddDropdown("Channel", {
                Title = "Talent Selection",
                Values = {"Damage", "Abilities_DMG", "Critical_Damage", "Speed"},
                Multi = false,
                Default = _G.Settings.Talent_Selection or "Damage",
            })

        Dropdown2344444:OnChanged(function(Value)
                _G.Settings.Talent_Selection = Value
		end)

local Dropdown234444489 = Tabs.Summon:AddDropdown("Channels", {
                Title = "Talent Taking",
                Values = {"SSS", "SS+", "SS", "S"},
                Multi = false,
                Default = _G.Settings.Talent_Taking or "SSS",
            })

        Dropdown234444489:OnChanged(function(Value)
                _G.Settings.Talent_Taking = Value
				checkitqm()
		end)

		local Toggle51511 = Tabs.Summon:AddToggle("AutoTalent", {Title = "Auto Talent", Default = false })

            Toggle51511:OnChanged(function()
                _G.AutoTalent = Options.AutoTalent.Value
				checkitqm()
            end)

local section = Tabs.Summon:AddSection("Avaters")

local Toggle515113131 = Tabs.Summon:AddToggle("AutoSpinAvatar", {Title = "Auto Spin Avatar", Default = false })

            Toggle515113131:OnChanged(function()
                _G.Settings.AutoSpinAvatar = Options.AutoSpinAvatar.Value
            end)

local Toggl313131 = Tabs.Misc:AddToggle("DisabledObtained", {Title = "Disabled Obtained Gui", Default = _G.Settings.DisabledObtained or false })

            Toggl313131:OnChanged(function()
                _G.Settings.DisabledObtained = Options.DisabledObtained.Value
            end)

local Toggl3131311 = Tabs.Misc:AddToggle("RemoveAllEffect", {Title = "Remove All Effect", Default = _G.Settings.RemoveAllEffect or false })

            Toggl3131311:OnChanged(function()
                _G.Settings.RemoveAllEffect = Options.RemoveAllEffect.Value
            end)

local Toggl313131161 = Tabs.Misc:AddToggle("Disabled_Reroll", {Title = "Disabled Reroll Gui", Default = _G.Settings.Disabled_Reroll or false })

            Toggl313131161:OnChanged(function()
                _G.Settings.Disabled_Reroll = Options.Disabled_Reroll.Value
            end)

local Toggl31313116112 = Tabs.Misc:AddToggle("Disabled_Reroll_Spring", {Title = "Auto Open Spring Capsule + Disabled Gui", Default = _G.Settings.Disabled_Reroll_Spring or false })

            Toggl31313116112:OnChanged(function()
                _G.Settings.Disabled_Reroll_Spring = Options.Disabled_Reroll_Spring.Value
            end)

local Toggl31313111 = Tabs.Misc:AddToggle("AutoSpinWheel", {Title = "Auto Spin Wheel", Default = _G.Settings.AutoSpinWheel or false })

            Toggl31313111:OnChanged(function()
                _G.Settings.AutoSpinWheel = Options.AutoSpinWheel.Value
            end)

local Button = Tabs.Misc:AddButton({
                        Title = "FPS BOOST",
                        Description = "",
                        Callback = function()

--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
_G.Ignore = {}
_G.Settings = {
	Players = {
		["Ignore Me"] = true,
		["Ignore Others"] = true,
		["Ignore Tools"] = true
	},
	Meshes = {
		NoMesh = false,
		NoTexture = false,
		Destroy = false
	},
	Images = {
		Invisible = true,
		Destroy = false
	},
	Explosions = {
		Smaller = true,
		Invisible = false, -- Not for PVP games
		Destroy = false -- Not for PVP games
	},
	Particles = {
		Invisible = true,
		Destroy = false
	},
	TextLabels = {
		LowerQuality = true,
		Invisible = false,
		Destroy = false
	},
	MeshParts = {
		LowerQuality = true,
		Invisible = false,
		NoTexture = false,
		NoMesh = false,
		Destroy = false
	},
	Other = {
		["FPS Cap"] = 360, -- true to uncap
		["No Camera Effects"] = true,
		["No Clothes"] = true,
		["Low Water Graphics"] = true,
		["No Shadows"] = true,
		["Low Rendering"] = true,
		["Low Quality Parts"] = true,
		["Low Quality Models"] = true,
		["Reset Materials"] = true,
	}
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/fpsboost.lua"))()
                        end
                    })

local section = Tabs.Misc:AddSection("Accessories")

ueqeq = {"Cursed Worm","Leopard Necktie","Jaw Mask","Electro Claws","Boar Head","Heroic Shield","Richy Armor","Starw Hat"}

local Dropdown1113165 = Tabs.Misc:AddDropdown("Accessories", {
                Title = "Accessories",
                Values = ueqeq,
                Multi = true,
                Default = {"Jaw Mask"},
            })

        Dropdown1113165:OnChanged(function(Value)
        trashItems = Value
            end)

local Toggl3131311178 = Tabs.Misc:AddToggle("RemoveAccess", {Title = "Auto Delete Accessories", Default = false })

            Toggl3131311178:OnChanged(function()
                RemoveAccess = Options.RemoveAccess.Value
            end)

local Input23 = Tabs.webhooks:AddInput("Webhooklink", {
                Title = "Enter Webhook Link",
                Default = _G.Settings.Webhook_Link or "",
                Placeholder = "..",
                Numeric = false, -- Only allows numbers
                Finished = false, -- Only calls callback when you press enter
                Callback = function(Value)
                    _G.Settings.Webhook_Link = Value
                end
            })

        local Toggle43131 = Tabs.webhooks:AddToggle("Autosendwebhook", {Title = "Auto Send Webhook", Default = _G.Settings.Auto_Send_Webhook or false })

            Toggle43131:OnChanged(function()
                _G.Settings.Auto_Send_Webhook = Options.Autosendwebhook.Value
            end)

        local Button = Tabs.webhooks:AddButton({
                        Title = "Test Webhook",
                        Description = "",
                        Callback = function()
        if _G.Settings.Webhook_Link ~= "" then
                pcall(function()
                    local url = _G.Settings.Webhook_Link
                    local data = {
                    ["content"] = "",
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
                                    ["value"] = "Webhook is work!",
                                },
        },
                            ['description'] = 'https://discord.com/invite/mZgCtez33T',
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
            url = "https://tr.rbxcdn.com/180DAY-0a1a2e6155cdcf32c334f04f831110c7/768/432/Image/Webp/noFilter"
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
                    })


        local Button = Tabs.Settings:AddButton({
                        Title = "Save Config",
                        Description = "",
                        Callback = function()
        if isfolder("WinnableHub") then
        pcall(function()
            if isfile(folder_name) then
                writefile(folder_name, game:service('HttpService'):JSONEncode(_G.Settings))
            else
                writefile(folder_name, game:service('HttpService'):JSONEncode(_G.Settings))
            end
        end)
        else
        makefolder("WinnableHub")
        end
                        end
                    })

        local Toggle55 = Tabs.Settings:AddToggle("Auto_Rejoin", {Title = "Auto Rejoin", Default = _G.Settings.Auto_Rejoin or true })

            Toggle55:OnChanged(function()
                _G.Settings.Auto_Rejoin = Options.Auto_Rejoin.Value
            end)

        local Toggle53215 = Tabs.Settings:AddToggle("White_Screen", {Title = "White Screen", Default = _G.Settings.White_Screen or false })

        Toggle53215:OnChanged(function()
            _G.Settings.White_Screen = Options.White_Screen.Value

            if _G.Settings.White_Screen then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
            elseif not _G.Settings.White_Screen then
    game:GetService("RunService"):Set3dRenderingEnabled(true)        
    end
        end)

Window:SelectTab(1)

        local Toggle553 = Tabs.Settings:AddToggle("Auto_Hide_Ui", {Title = "Auto Hide Ui", Default = _G.Settings.Auto_Hide_Ui or false })

            Toggle553:OnChanged(function()
                _G.Settings.Auto_Hide_Ui = Options.Auto_Hide_Ui.Value
            end)

        Tabs.Settings:AddButton({
                Title = "Hide Top Left Button",
                Description = "",
                Callback = function()
                    Window:Dialog({
                        Title = "Are You Sure?",
                        Content = "",
                        Buttons = {
                            {
                                Title = "Yes.",
                                Callback = function()
                                    for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v.Name == "ScreenGui" then
            for i2,v2 in pairs(v:GetChildren()) do
                if v2.Name == "OPENCLOSE1" then
                if not v2:FindFirstChild("UISizeConstraint") then
        v2.Visible = false
            end
            end
            end
        end
        end
                                end
                            },
                            {
                                Title = "Cancel.",
                                Callback = function()
                                    
                                end
                            }
                        }
                    })
                end
            })

                end

        -- Addons:
        -- SaveManager (Allows you to have a configuration system)
        -- InterfaceManager (Allows you to have a interface managment system)

        -- Hand the library over to our managers
        SaveManager:SetLibrary(Fluent)
        InterfaceManager:SetLibrary(Fluent)

        -- Ignore keys that are used by ThemeManager.
        -- (we dont want configs to save themes, do we?)
        SaveManager:IgnoreThemeSettings()

        -- You can add indexes of elements the save manager should ignore
        SaveManager:SetIgnoreIndexes({})

        -- use case for doing it this way:
        -- a script hub could have themes in a global folder
        -- and game configs in a separate folder per game
        InterfaceManager:SetFolder("FluentScriptHub")
        SaveManager:SetFolder("FluentScriptHub/specific-game")

        InterfaceManager:BuildInterfaceSection(Tabs.Settings)
        SaveManager:BuildConfigSection(Tabs.Settings)

        Window:SelectTab(1)

        Fluent:Notify({
            Title = "Fluent",
            Content = "The script has been loaded.",
            Duration = 8
        })


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local ByteNet = ReplicatedStorage:WaitForChild("ByteNetReliable")

local function deleteItem(name)

    local payload = "+" .. string.char(#name) .. "\000" .. name
    ByteNet:FireServer(buffer.fromstring(payload))

end

local function getBase(name)
    return string.split(name," - ")[1]
end

local function cleanInventory()

    local success,useable = pcall(function()
        return PlayerGui.Inventory._Frame.Usage.BODY.Useable
    end)

    if not success then return end

    local deleted = 0

    for _,category in pairs(useable:GetChildren()) do

        for _,item in pairs(category:GetChildren()) do

            if item:IsA("TextButton") then

                local base = getBase(item.Name)

                if trashItems[base] then

                    deleteItem(item.Name)
					
                    print("Deleted:",item.Name)

                    task.wait(0.01)

                end

            end

        end

    end

    if deleted > 0 then
        print("Total deleted:",deleted)
    end

end

spawn(function()
while task.wait(5) do
    if RemoveAccess then
        pcall(cleanInventory)
        end
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

function gettowerclose()
local Players = workspace.Worlds.Targets.Server
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player.Humanoid.Health > 0 and string.find(player.Name, "Tower") then
            if player:FindFirstChild("Whitelist") then
                if player.Whitelist:FindFirstChild(game.Players.LocalPlayer.Name) then
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
        end
    end

    return closestPart
end

function bossfight()
if workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
if not game:GetService("Players").LocalPlayer:FindFirstChild("OnBossFight") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BossFight_Entering["Demon Forest"].CFrame
elseif game:GetService("Players").LocalPlayer:FindFirstChild("OnBossFight") then
    for i,v in pairs(workspace.Worlds.Targets.Server:GetChildren()) do
        if string.find(v.Name, "BossFight") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-4.2,0)
        end
    end
end
end
end

function getraidclose()
local Players = workspace.Worlds.Targets.Server
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player.Humanoid.Health > 0 and string.find(player.Name, "Raids") then
            if player:FindFirstChild("Whitelist") then
                if player.Whitelist:FindFirstChild(game.Players.LocalPlayer.Name) then
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
        end
    end

    return closestPart
end

function getriftclose()
local Players = workspace.Worlds.Targets.Server
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player.Humanoid.Health > 0 and string.find(player.Name, "Rift") then
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

function getClosestHumanoidRootPart(name_input)
local Players = workspace.Worlds.Targets.Server
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player.Humanoid.Health > 0 and string.find(player.Units_Displays.Names.Text, name_input) then
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

function teleportToGround(pos)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {char}
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist

    local ray = workspace:Raycast(pos, Vector3.new(0, -500, 0), rayParams)

    if ray then
        -- teleport to ground
        hrp.CFrame = CFrame.new(ray.Position + Vector3.new(0, 3, 0))
    else
        -- fallback teleport
        hrp.CFrame = CFrame.new(pos)
    end
end

function getClosestrandom()
local Players = workspace.Worlds.Targets.Server
local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closestPart = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetChildren()) do
        if player.Humanoid.Health > 0 then
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
while task.wait() do
pcall(function()
if _G.Settings.Auto_Pickupdb then
for i,v in pairs(workspace.Visual:GetChildren()) do
    if string.find(v.Name, "DragonBall") then
        teleportToGround(v.Primary.Position)
    fireproximityprompt(v.Primary.ProximityPrompt,20)
end
end
end
end)
end
end)

rollbackstart = false

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_Rejoin_After_Dic then
if not game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Domain Birdcage") then
game:GetService("TeleportService"):Teleport(game.PlaceId)
elseif game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Domain Birdcage") and rollbackstart == false then
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Systems", 9e9):WaitForChild("Setting_Event", 9e9)
remote:FireServer("Low Graphics\127\255",false)
    game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Rollback Started"
        })
rollbackstart = true
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_PickupSukana then
for i,v in pairs(workspace.Visual:GetChildren()) do
    if string.find(v.Name, "Sukuna") then
        teleportToGround(v.Primary.Position)
    fireproximityprompt(v.Primary.ProximityPrompt,20)
end
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.Auto_PickupFlower then
for i,v in pairs(workspace.Visual:GetChildren()) do
    if string.find(v.Name, "Flower") then
        teleportToGround(v.Primary.Position)
    fireproximityprompt(v.Primary.ProximityPrompt,20)
end
end
end
end)
end
end)

function checkinventory(name)
if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild(name) then
if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources[name].Amount.Value >= 1 then
return true
end
end
return false
end

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Create_Global and checkinventory("Domain Birdcage") then
    if not _G.Settings.Auto_Global_Boss and not workspace.GlobalBosses_Entering:FindFirstChild("Sukuna_Shrine") then
local args = {
	"Mahito"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Misc"):WaitForChild("TalkingEvent"):FireServer(unpack(args))
end
end
end)
end
end)

spawn(function()
while task.wait(.3) do
pcall(function()
if _G.Settings.Auto_Global_Boss then
if workspace.GlobalBosses_Entering:FindFirstChild("Sukuna_Shrine") then
if game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
lobby()
task.wait(2)
end
    raid_start = false
    globalboss = true
for i,v in pairs(workspace.Worlds.Targets.Server:GetChildren()) do
if string.find(v.Name, "Global") then
local distance8 = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if game:GetService("Players").LocalPlayer:FindFirstChild("OnGlobalBosses") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
elseif not game:GetService("Players").LocalPlayer:FindFirstChild("OnGlobalBosses") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GlobalBosses_Entering.Sukuna_Shrine.CFrame
fireproximityprompt(workspace.GlobalBosses_Entering.Sukuna_Shrine.Attachment.ProximityPrompt,20)
end
end
end
elseif not workspace.GlobalBosses_Entering:FindFirstChild("Sukuna_Shrine") then
if _G.Settings.Auto_Create_Global and checkinventory("Domain Birdcage") then
local args = {
	"Mahito"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Misc"):WaitForChild("TalkingEvent"):FireServer(unpack(args))
elseif not _G.Settings.Auto_Create_Global or not checkinventory("Domain Birdcage") then
raid_start = true
globalboss = false
end
end
end
end)
end
end)

function checkrift()
for i,v in pairs(workspace.Raids_Visual:GetChildren()) do
    if string.find(v.Name, "Reaper Society_Rift") then
        return true
    end
end
return false
end

function checkrift3()
for i,v in pairs(workspace.Raids_Visual:GetChildren()) do
    if string.find(v.Name, "Reaper Society_Rift") then
        return true
    end
end
return false
end

function riftspawncheck()
    if workspace:FindFirstChild("SpawnedRifts") then
for i2,v2 in pairs(workspace.SpawnedRifts:GetChildren()) do
    if v2 then
        return true
    end
end
    end
return false
end

function yourrift()
for i,v in pairs(workspace.Raids_Visual:GetChildren()) do
    if string.find(v.Name, "Reaper Society_Rift") then
        return v
    end
end
end

spawn(function()
while task.wait() do
pcall(function()
for i,v in pairs(workspace.Worlds.Units.Server[game.Players.LocalPlayer.Name]:GetChildren()) do
v.Walk_Speed.Value = 1111
end
end)
end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNetRemote = ReplicatedStorage:WaitForChild("ByteNetReliable", 10)

local function createBufferFromTable(tbl)
    local b = buffer.create(#tbl)
    for i,v in ipairs(tbl) do
        buffer.writeu8(b,i-1,v)
    end
    return b
end

local readyOpe = createBufferFromTable({42, 0, 0, 7, 0, 82, 101, 114, 111, 108, 108, 115, 3, 0, 79, 112, 101, 1})
local readyYami = createBufferFromTable({42, 0, 0, 7, 0, 82, 101, 114, 111, 108, 108, 115, 4, 0, 89, 97, 109, 105, 1})

local fruitsData = {

    {
        eq = {42,0,0,7,0,82,101,114,111,108,108,115,4,0,77,111,107,117,1},
        un = {39,7,0,82,101,114,111,108,108,115,4,0,77,111,107,117,1}
    },

    {
        eq = {42,0,0,7,0,82,101,114,111,108,108,115,4,0,71,111,109,117,1},
        un = {39,7,0,82,101,114,111,108,108,115,4,0,71,111,109,117,1}
    }

}

local readySwap = {}

for _,d in ipairs(fruitsData) do
    table.insert(readySwap,{
        eq = createBufferFromTable(d.eq),
        un = createBufferFromTable(d.un)
    })
end

task.spawn(function()
while task.wait(0) do
if _G.Settings.Auto_Equip_Ope then
    pcall(function() 
    ByteNetRemote:FireServer(readyOpe) 
    end) 
    task.wait() 
end
    end 
    end) 

task.spawn(function()
while task.wait(0) do
if _G.Settings.Auto_Equip_Yami then
    pcall(function() 
    ByteNetRemote:FireServer(readyYami) 
    end) 
    task.wait() 
end
    end 
    end) 

task.spawn(function()

                while task.wait(0) do

if _G.Settings.Auto_Stack_Fruits then

                    for _,buf in ipairs(readySwap) do

                        if not _G.Settings.Auto_Stack_Fruits then
                            break
                        end

                        pcall(function()

                            ByteNetRemote:FireServer(buf.eq)

                            task.wait(0.1)

                            ByteNetRemote:FireServer(buf.un)

                        end)

                        task.wait(0.1)

                    end

                    task.wait()

                end

                end
            
            end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_Cardss then
    VirtualInputManager = game:GetService("VirtualInputManager")
if stoppingone == false then
if not workspace.Summoners:FindFirstChild(_G.Settings.Card_Selection) then
task.wait(1)
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.HUD._Frame.Travel
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.Travel._Frame.Usage.BODY.Useable.Interview[_G.Settings.Card_Selection].Regular.Teleport
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
elseif workspace.Summoners:FindFirstChild(_G.Settings.Card_Selection) then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Summoners:FindFirstChild(_G.Settings.Card_Selection).Center.CFrame
task.wait(.3)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
task.wait(1)
stoppingone = true
end
end
end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_Cardss then
if not game:GetService("Players").LocalPlayer:FindFirstChild("Summon_Debounce") then
local args = {
	_G.Settings.Card_Selection,
	"Multi"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Summoners"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end
end
end)
end
end)

spawn(function()
while task.wait(1) do
pcall(function()
if _G.Settings.Auto_Rift then
if _G.Settings.Stopping_AutoBest and riftspawncheck() then
stopping = true
elseif _G.Settings.Stopping_AutoBest and not riftspawncheck() then
stopping = false
end
end
end)
end
end)

spawn(function()
while task.wait(10) do
pcall(function()
if _G.Settings.Auto_Swap_Team then
if checkrift3() == false then
local args = {
	"Load",
	_G.Settings.LuckySlotSelected
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Misc"):WaitForChild("TeamsEvent"):FireServer(unpack(args))

elseif checkrift3() then
local args = {
	"Load",
	_G.Settings.MainSlotSelected
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Misc"):WaitForChild("TeamsEvent"):FireServer(unpack(args))
end
end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_Rift then
    if _G.Settings.Auto_Global_Boss == false or globalboss == false then
if riftspawncheck() then
if game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
lobby()
task.wait(2)
end
if riftspawncheck() then
if not workspace.Maps:FindFirstChild("Reaper Society") then
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.HUD._Frame.Travel
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.Travel._Frame.Usage.BODY.Useable.Interview["Reaper Society"].Regular.Teleport
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
task.wait(1)
end
for i,v in pairs(workspace.SpawnedRifts:GetChildren()) do
if v then
    fireproximityprompt(v.ProximityPrompt,20)
local args = {
	v.ID.Value
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gameplays"):WaitForChild("JoinRift"):FireServer(unpack(args))
end
end
end
elseif riftspawncheck() == false then
    if yourrift().Configs.Others.Portal.Travel.Attachment.ProximityPrompt.Enabled == false then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getriftclose().HumanoidRootPart.CFrame
elseif yourrift().Configs.Others.Portal.Travel.Attachment.ProximityPrompt.Enabled == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = yourrift().Configs.Others.Portal.Travel.CFrame
	lobby()
    task.wait(.2)
    yourrift():Destroy()
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
if _G.Settings.AutoSpinAvatar then
if game:GetService("Players").LocalPlayer:FindFirstChild("In_Queue") then
game:GetService("Players").LocalPlayer.In_Queue:Destroy()
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.Settings.AutoSpinAvatar then
    if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Avatars Fruits") then
if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources["Avatars Fruits"].Amount.Value >= 20 then
local args = {
	buffer.fromstring("&\002\00010")
}
game:GetService("ReplicatedStorage"):WaitForChild("ByteNetReliable"):FireServer(unpack(args))
    end
    end
end
end)
end
end)

function sendwebhook(values)

if _G.Settings.Webhook_Link ~= "" then
                pcall(function()
local url = _G.Settings.Webhook_Link
                    local data = {
                    ["content"] = "",
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
                            ['description'] = 'https://discord.com/invite/mZgCtez33T',
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
            url = "https://tr.rbxcdn.com/180DAY-0a1a2e6155cdcf32c334f04f831110c7/768/432/Image/Webp/noFilter"
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

thing_drop = {}
webhooknow = false

spawn(function()
while task.wait(2) do
pcall(function()
if _G.Settings.Auto_Send_Webhook then

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Obtaind_Visual") then
	for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Obtaind_Visual.Black_Frames.Items_Showcase:GetChildren()) do
		if v:FindFirstChild("Neon")  and (v.Neon:FindFirstChild("Secret") or v.Neon:FindFirstChild("Tactical")) then
		    table.insert(thing_drop, v.Name)
			webhooknow = true
		end
	end
end

function dropout(num)
for i,v in pairs(thing_drop) do
if i == num then
return "**"..v.."** Has Dropped!"
end
end
end

first = ""
second = ""
three = ""
fourth = ""
fivth = ""
sixth = ""

if dropout(1) then
first = dropout(1)
end
if dropout(2) then
second = dropout(2)
end
if dropout(3) then
three = dropout(3)
end
if dropout(4) then
fourth = dropout(4)
end
if dropout(5) then
fivth = dropout(5)
end
if dropout(6) then
sixth = dropout(6)
end

if webhooknow then
if _G.Settings.Webhook_Link ~= "" then
                pcall(function()
local url = _G.Settings.Webhook_Link
                    local data = {
                    ["content"] = "",
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
                                    ["value"] = first.."\n"..second.."\n"..three.."\n"..fourth.."\n"..fivth.."\n"..sixth
                                },
        },
                            ['description'] = 'https://discord.com/invite/mZgCtez33T',
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
            url = "https://tr.rbxcdn.com/180DAY-0a1a2e6155cdcf32c334f04f831110c7/768/432/Image/Webp/noFilter"
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

game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Obtaind_Visual"):Destroy()
thing_drop = {}
webhooknow = false
end
end
end)
end
end)

spawn(function()
while task.wait(2) do
pcall(function()
if _G.Settings.AutoSpinWheel then
local args = {
	"Release Event",
	"Spin"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gamblings"):WaitForChild("Wheels"):FireServer(unpack(args))

end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.AutoTalent and _G.Settings.Talent_Selection == "Speed" then
checkitqm()
if not game:GetService("Players").LocalPlayer:FindFirstChild("Potentials_Coolingdown") then
game:GetService("Players").LocalPlayer.PlayerGui.Talents.Enabled = true
task.wait(.1)
for i,v in pairs(game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Units:GetChildren()) do
if v.Nickname.Value == _G.Settings.Name_talent then
if v.Potentials_Adjustment[_G.Settings.Talent_Selection].Value > tonumber(_G.Settings.Talent_Input) then
local args = {
	v.Name,
	"Reroll",
	_G.Settings.Talent_Selection
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Systems"):WaitForChild("Potentials_Rolling"):FireServer(unpack(args))
elseif v.Potentials_Adjustment[_G.Settings.Talent_Selection].Value <= tonumber(_G.Settings.Talent_Input) then
    game.ReplicatedStorage.Remotes.Misc.NotificationBidable:Fire("Label", nil, {
                    ["Label"] = "You Have Got "..game:GetService("Players").LocalPlayer.PlayerGui.Talents._Frame.Usage.BODY.Grade[_G.Settings.Talent_Selection].Numbers.Text.." Talent!",
                    ["Rarity"] = "Legendary"
                })
				Options.AutoTalent:SetValue(false)
end
end
end
end
end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.AutoTalent and _G.Settings.Talent_Selection ~= "Speed" then
checkitqm()
if not game:GetService("Players").LocalPlayer:FindFirstChild("Potentials_Coolingdown") then
game:GetService("Players").LocalPlayer.PlayerGui.Talents.Enabled = true
task.wait(.1)
for i,v in pairs(game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Units:GetChildren()) do
if v.Nickname.Value == _G.Settings.Name_talent then
if v.Potentials_Adjustment[_G.Settings.Talent_Selection].Value < tonumber(_G.Settings.Talent_Input) then
local args = {
	v.Name,
	"Reroll",
	_G.Settings.Talent_Selection
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Systems"):WaitForChild("Potentials_Rolling"):FireServer(unpack(args))
elseif v.Potentials_Adjustment[_G.Settings.Talent_Selection].Value >= tonumber(_G.Settings.Talent_Input) then
    game.ReplicatedStorage.Remotes.Misc.NotificationBidable:Fire("Label", nil, {
                    ["Label"] = "You Have Got "..game:GetService("Players").LocalPlayer.PlayerGui.Talents._Frame.Usage.BODY.Grade[_G.Settings.Talent_Selection].Numbers.Text.." Talent!",
                    ["Rarity"] = "Legendary"
                })
				Options.AutoTalent:SetValue(false)
end
end
end
end
end
end)
end
end)

function checkname()
for i,v in pairs(game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Units:GetChildren()) do
if v.Nickname.Value == "Axel Hub On Top" then
for i2,v2 in pairs(TraitSelected) do
if v2 ~= true then
if v["Primary_Trait"].Value == v2.."_1" then
return v2.."_1"
end
end
end
end
end
end

function checkname2()
for i,v in pairs(game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Units:GetChildren()) do
if v.Nickname.Value == "Axel Hub On Top" then
for i2,v2 in pairs(TraitSelectedSub) do
if v2 ~= true then
if v["Sub_Trait"].Value == v2.."_1" then
return v2.."_1"
end
end
end
end
end
end

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.AutoTraitMain then
for i,v in pairs(game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Units:GetChildren()) do
if v.Nickname.Value == "Axel Hub On Top" then
for i2,v2 in pairs(TraitSelected) do
if v2 ~= true then
if v["Primary_Trait"].Value == v2.."_1" then
			Options.AutoTraitMain:SetValue(false)
    game.ReplicatedStorage.Remotes.Misc.NotificationBidable:Fire("Label", nil, {
                    ["Label"] = "You Have Got "..v["Primary_Trait"].Value.." Trait!",
                    ["Rarity"] = "Legendary"
                })
if _G.Settings.Auto_Send_Webhook then
sendwebhook("**"..v.Name.."**".." Have Got "..v["Primary_Trait"].Value.." On Primary Trait!")
end
				break
elseif v["Primary_Trait"].Value ~= v2.."_1" then
if v["Primary_Trait"].Value ~= checkname() then
local args = {
	v.Name,
	"Primary",
	{v2},
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gamblings"):WaitForChild("Traits"):FireServer(unpack(args))
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
while task.wait(.2) do
pcall(function()
if _G.Settings.AutoTraitSub and not _G.Settings.AutoTraitMain then
for i,v in pairs(game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Units:GetChildren()) do
if v.Nickname.Value == "Axel Hub On Top" then
for i2,v2 in pairs(TraitSelectedSub) do
if v2 ~= true then
if v["Sub_Trait"].Value == v2.."_1" then
    Options.AutoTraitSub:SetValue(false)
    game.ReplicatedStorage.Remotes.Misc.NotificationBidable:Fire("Label", nil, {
                    ["Label"] = "You Have Got "..v["Sub_Trait"].Value.." Trait!",
                    ["Rarity"] = "Legendary"
                })
                if _G.Settings.Auto_Send_Webhook then
sendwebhook("**"..v.Name.."**".." Have Got "..v["Sub_Trait"].Value.." On Sub Trait!")
end
				break
elseif v["Sub_Trait"].Value ~= v2.."_1" then
if v["Sub_Trait"].Value ~= checkname2() then
local args = {
	v.Name,
	"Sub",
	{v2},
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gamblings"):WaitForChild("Traits"):FireServer(unpack(args))
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
while task.wait(.2) do
pcall(function()
if _G.Settings.AutoTraitSub and _G.Settings.AutoTraitMain then
for i,v in pairs(game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Units:GetChildren()) do
if v.Nickname.Value == "Axel Hub On Top" then
for i2,v2 in pairs(TraitSelectedSub) do
if v2 ~= true then
    if v["Primary_Trait"].Value ~= checkname() then
if v["Sub_Trait"].Value == v2.."_1" then
    				Options.AutoTraitSub:SetValue(false)
    game.ReplicatedStorage.Remotes.Misc.NotificationBidable:Fire("Label", nil, {
                    ["Label"] = "You Have Got "..v["Sub_Trait"].Value.." Trait!",
                    ["Rarity"] = "Legendary"
                })
if _G.Settings.Auto_Send_Webhook then
sendwebhook("**"..v.Name.."**".." Have Got "..v["Sub_Trait"].Value.." On Sub Trait!")
end
				break
elseif v["Sub_Trait"].Value ~= v2.."_1" then
if v["Sub_Trait"].Value ~= checkname2() then
local args = {
	v.Name,
	"Sub",
	{v2},
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gamblings"):WaitForChild("Traits"):FireServer(unpack(args))
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

spawn(function()
while task.wait(.1) do
pcall(function()
if _G.Settings.Auto_Take_Out then
task.wait(_G.Settings.SetTakeOutDelay)
local args = {
    [1] = getClosestrandom().Name,
    [2] = "Mouse"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gameplays"):WaitForChild("Request"):FireServer(unpack(args))
end
end)
end
end)

spawn(function()
while task.wait(.1) do
pcall(function()
if _G.Settings.Auto_Send_random then
if game:GetService("Players").LocalPlayer.TargetAt.Value == nil or tostring(getClosestrandom().Name) ~= tostring(game:GetService("Players").LocalPlayer.TargetAt.Value) then
local args = {
    [1] = getClosestrandom().Name,
    [2] = "Mouse"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gameplays"):WaitForChild("Request"):FireServer(unpack(args))
end
end
end)
end
end)

spawn(function()
while task.wait(.5) do
pcall(function()
if _G.Settings.Auto_Send_mons then
if game:GetService("Players").LocalPlayer.TargetAt.Value == nil or tostring(getClosestHumanoidRootPart(_G.Settings.Monster_Name).Name) ~= tostring(game:GetService("Players").LocalPlayer.TargetAt.Value) then
local args = {
    [1] = getClosestHumanoidRootPart(_G.Settings.Monster_Name).Name,
    [2] = "Mouse"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gameplays"):WaitForChild("Request"):FireServer(unpack(args))
end
end
end)
end
end)

spawn(function()
while task.wait(3) do
pcall(function()
if _G.Settings.AutoEgg then
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Summoners"):WaitForChild("Hatch"):FireServer(unpack(args))

end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Start_Farming then
    if not workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestHumanoidRootPart(_G.Settings.Monster_Name).HumanoidRootPart.CFrame
elseif workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
    if _G.Settings.Auto_Bossfight and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == true then
bossfight()
task.wait(2)
elseif not _G.Settings.Auto_Bossfight or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == false then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosestHumanoidRootPart(_G.Settings.Monster_Name).HumanoidRootPart.CFrame
    end
    end
end
end)
end
end)

spawn(function()
while task.wait() do
	pcall(function()
	if _G.Settings.Auto_Best_Dps and stopping == false then
local distance9 = (getClosestrandom().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if distance9 < 10 then
task.wait(_G.Settings.bestdpsversions)
local args = {
	buffer.fromstring("\024\000")
}
game:GetService("ReplicatedStorage"):WaitForChild("ByteNetReliable"):FireServer(unpack(args))
end
end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_Tower then
teleportToGround(gettowerclose().HumanoidRootPart.Position)
end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Fav_Farming then
if not workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.RightSide.Quest.List:GetChildren()) do
if v.Name ~= "UIListLayout" and v.Names.TextColor3 == Color3.fromRGB(255, 255, 255) then
for i2,v2 in pairs(workspace.Worlds.Targets.Server:GetChildren()) do
    if string.find(v.Names.Text, v2.Units_Displays.Names.Text) then
teleportToGround(getClosestHumanoidRootPart(v2.Units_Displays.Names.Text).HumanoidRootPart.Position)
end
end
end
end
elseif workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
    if _G.Settings.Auto_Bossfight and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == true then
bossfight()
task.wait(2)
elseif not _G.Settings.Auto_Bossfight or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == false then
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.RightSide.Quest.List:GetChildren()) do
if v.Name ~= "UIListLayout" and v.Names.TextColor3 == Color3.fromRGB(255, 255, 255) then
for i2,v2 in pairs(workspace.Worlds.Targets.Server:GetChildren()) do
    if string.find(v.Names.Text, v2.Units_Displays.Names.Text) then
teleportToGround(getClosestHumanoidRootPart(v2.Units_Displays.Names.Text).HumanoidRootPart.Position)
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


function partiesshut()
if game:GetService("ReplicatedStorage").Shared.Parties:FindFirstChild(game.Players.LocalPlayer.Name) then
local args = {
    [1] = game:GetService("ReplicatedStorage").Shared.Parties[game.Players.LocalPlayer.Name]
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gameplays"):WaitForChild("RaidsLobbies"):FireServer(unpack(args))

local args = {
    [1] = "Disabled"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Misc"):WaitForChild("Parties"):FireServer(unpack(args))
end
end

function startraid()
for i = 1,5 do
local args = {  
    [1] = _G.Settings.WorldsRaidselected,
    [2] = _G.Settings.DifficultSelection
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Systems"):WaitForChild("RaidsEvent"):FireServer(unpack(args))
task.wait(.1)
if game:GetService("ReplicatedStorage").Shared.Parties:FindFirstChild(game.Players.LocalPlayer.Name) then
local args = {
    [1] = game:GetService("ReplicatedStorage").Shared.Parties[game.Players.LocalPlayer.Name]
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Gameplays"):WaitForChild("RaidsLobbies"):FireServer(unpack(args))

local args = {
    [1] = "Disabled"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Misc"):WaitForChild("Parties"):FireServer(unpack(args))
end
end
end

spawn(function()
while task.wait(.1) do
pcall(function()
if _G.Settings.RemoveAllEffect then
	for i,v in pairs(workspace.Visual:GetChildren()) do
	    if v.Name ~= "Player" and (not string.find(v.Name, "Sukuna") and not string.find(v.Name, "DragonBall")) then
			v:Destroy()
		end
	end
end
end)
end
end)

spawn(function()
while task.wait(1) do
pcall(function()
if _G.Settings.Stopping_AutoBest then
if stopping then
local args = {
	buffer.fromstring("\"\000")
}
game:GetService("ReplicatedStorage"):WaitForChild("ByteNetReliable"):FireServer(unpack(args))
end
end
end)
end
end)

spawn(function()
while task.wait(.1) do
pcall(function()
if _G.Settings.DisabledObtained then
if _G.Settings.Auto_Send_Webhook == false then
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Obtaind_Visual") then
        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Obtaind_Visual"):Destroy()
    end
elseif _G.Settings.Auto_Send_Webhook then
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Obtaind_Visual") then
        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Obtaind_Visual").Enabled = false
    end
end
end
end)
end
end)

function checkmonsraid()
for i,v in pairs(workspace.Worlds.Targets.Server:GetChildren()) do
	if string.find(v.Name, "Raids") then
	if v:FindFirstChild("Whitelist") then
                if v.Whitelist:FindFirstChild(game.Players.LocalPlayer.Name) then
		return false
		end
		end
	end
end
return true
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

spawn(function()
while task.wait(2) do
pcall(function()
if _G.Settings.Auto_Teleport_Position then
if _G.Settings.Auto_Rift and (riftspawncheck() or checkrift3()) then

elseif checkrift() == false or _G.Settings.Auto_Rift == false then
if not workspace.Maps:FindFirstChild(_G.Settings.WorldsTeleport) then
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.HUD._Frame.Travel
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = game:GetService("Players").LocalPlayer.PlayerGui.Travel._Frame.Usage.BODY.Useable.Interview[_G.Settings.WorldsTeleport].Regular.Teleport
task.wait(.1)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.1)
game:GetService("GuiService").SelectedObject = nil
task.wait(1)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stringToCFrame(_G.Settings.CFrame_Settings)
end
end
end)
end
end)

function joinraidroom()
if _G.Settings.Selection_Pod then
for i,v in pairs(workspace.Raids_Entering:GetChildren()) do
if v.Name ~= "Specify" and (v.Holders.Value == "" and string.find(v.Name, _G.Settings.Pod_Selected)) then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Centers.CFrame
end
end
elseif not _G.Settings.Selection_Pod then
for i,v in pairs(workspace.Raids_Entering:GetChildren()) do
if v.Name ~= "Specify" and v.Holders.Value == "" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Centers.CFrame
end
end
end
end

spawn(function()
while task.wait(1) do
pcall(function()
if _G.Settings.Disabled_Reroll then
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Rerolls_Visuals") then
game:GetService("Players").LocalPlayer.PlayerGui.Rerolls_Visuals.Enabled = false
end
elseif _G.Settings.Disabled_Reroll == false then
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Rerolls_Visuals") then
game:GetService("Players").LocalPlayer.PlayerGui.Rerolls_Visuals.Enabled = true
end
    end
end)
end
end)

spawn(function()
while task.wait() do
    pcall(function()
    if _G.Settings.Disabled_Reroll_Spring then
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Roulette") then
        game:GetService("Players").LocalPlayer.PlayerGui.Roulette:Destroy()
        end
if game.Players.LocalPlayer:FindFirstChild("UIQ") then
game.Players.LocalPlayer:FindFirstChild("UIQ"):Destroy()
end
    end
end)
end
end)

spawn(function()
while task.wait(.2) do
    pcall(function()
    if _G.Settings.Disabled_Reroll_Spring then
local args = {
	buffer.fromstring("&\n\000Spring Pod\n")
}
game:GetService("ReplicatedStorage"):WaitForChild("ByteNetReliable"):FireServer(unpack(args))
    end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_raid and raid_start then
    if not workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
    if (checkrift() or riftspawncheck()) and _G.Settings.Auto_Rift then
elseif (checkrift() == false or riftspawncheck() == false) or _G.Settings.Auto_Rift == false then
if not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") or game:GetService("Players").LocalPlayer.OnRaids.Value == false then
for i,v in pairs(workspace.Raids_Entering:GetChildren()) do
if v.Name ~= "Specify" and v.Holders.Value == "" then
task.wait(math.random(1,4))
joinraidroom()
task.wait(2)
startraid()
task.wait(2)
break
end
end
else
    teleportToGround(getraidclose().HumanoidRootPart.Position)
end

end
elseif workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
if _G.Settings.Auto_Bossfight and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == true then
if _G.Settings.Wait_Until_Boss_Died == false then
if game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
lobby()
task.wait(2)
elseif not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
bossfight()
task.wait(2)
end
elseif _G.Settings.Wait_Until_Boss_Died then
if not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
bossfight()
task.wait(2)
elseif game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
teleportToGround(getraidclose().HumanoidRootPart.Position)
end
end
elseif not _G.Settings.Auto_Bossfight or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == false then
    if (checkrift() or riftspawncheck()) and _G.Settings.Auto_Rift then
elseif (checkrift() == false or riftspawncheck() == false) or _G.Settings.Auto_Rift == false then
if not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") or game:GetService("Players").LocalPlayer.OnRaids.Value == false then
for i,v in pairs(workspace.Raids_Entering:GetChildren()) do
if v.Name ~= "Specify" and v.Holders.Value == "" then
task.wait(math.random(1,4))
joinraidroom()
task.wait(2)
startraid()
task.wait(2)
break
end
end
else
    teleportToGround(getraidclose().HumanoidRootPart.Position)
end

end
end
end
end
end)
end
end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_raid or _G.Settings.Auto_Crate_For_Friend or _G.Settings.Auto_Join_Friend then
for i,v in pairs(workspace.Raids_Visual:GetChildren()) do
    if game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") and game:GetService("Players").LocalPlayer.OnRaids.Value == true then
    if string.find(v.Name, game.Players.LocalPlayer.Name) and string.find(v.Name, "Client")  then

for i2,v2 in pairs(v.Stage:GetChildren()) do
    if v2.ClassName == "MeshPart" then
        v2.CanCollide = false
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
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_raid or _G.Settings.Auto_Crate_For_Friend then
for i,v in pairs(workspace.Raids_Visual:GetChildren()) do
    if game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") and game:GetService("Players").LocalPlayer.OnRaids.Value == true then
    if string.find(v.Name, game.Players.LocalPlayer.Name) and string.find(v.Name, "Server")  then
        if v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt.Enabled and checkmonsraid() then
            if string.find(v.Name, "Double") or string.find(v.Name, "Spring") then
            if v.Configs.Others.Difficult.Value == "Nightmare" then
            if v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Golds.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt,20)
            elseif _G.Settings.Purple_Chest then
                if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value >= 1 then
                if v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Purple.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt,20)
                elseif v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
                                if _G.Settings.Auto_Replay then
                                    fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
                elseif not game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value < 1 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
				if _G.Settings.Auto_Crate_For_Friend then
					task.wait(2)
				end
if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
            elseif _G.Settings.Purple_Chest == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
				if _G.Settings.Auto_Crate_For_Friend then
					task.wait(2)
				end
if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
            end
            else
            lobby()
            end
            else
            if v.Configs.Others.Rewards.Special.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Special.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Special.Primary.ProximityPrompt,20)
            elseif v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Golds.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt,20)
            elseif _G.Settings.Purple_Chest then
                if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value >= 1 then
                if v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Purple.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt,20)
                elseif v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
                elseif not game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value < 1 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
				if _G.Settings.Auto_Crate_For_Friend then
					task.wait(2)
				end
if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
            elseif _G.Settings.Purple_Chest == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
				if _G.Settings.Auto_Crate_For_Friend then
					task.wait(2)
				end
if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
            end
                end
                elseif v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt.Enabled == false and _G.Settings.Auto_Join_Friend then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Settings.Player_Name].Character.HumanoidRootPart.CFrame
        end
    end
    elseif _G.Settings.Auto_Join_Friend and (not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") or game:GetService("Players").LocalPlayer.OnRaids.Value == false) then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Settings.Player_Name].Character.HumanoidRootPart.CFrame
            end
end
end
end)
end
end)

function checkfriend(names)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Raids._Frame.Usage.Center.PlayersScrolling:GetChildren()) do
    if v.Name == names then
        print(true)
        return true
    end
end
end

spawn(function()
while task.wait(.5) do
pcall(function()
if _G.Settings.Auto_Join_Friend then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Settings.Player_Name].Character.HumanoidRootPart.CFrame
end
end)
            end
            end)

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_Join_Friend then
for i,v in pairs(workspace.Raids_Visual:GetChildren()) do
    if game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") and game:GetService("Players").LocalPlayer.OnRaids.Value == true then
    if string.find(v.Name, _G.Settings.Player_Name) and string.find(v.Name, "Server")  then
        if v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt.Enabled and checkmonsraid() then
            if string.find(v.Name, "Double") or string.find(v.Name, "Spring") then
            if v.Configs.Others.Difficult.Value == "Nightmare" then
            if v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Golds.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt,20)
            elseif _G.Settings.Purple_Chest then
                if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value >= 1 then
                if v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Purple.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt,20)
                elseif v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
                if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
                elseif not game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value < 1 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
                if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
            elseif _G.Settings.Purple_Chest == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
                if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
            end
            else
            lobby()
            end
            else
            if v.Configs.Others.Rewards.Special.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Special.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Special.Primary.ProximityPrompt,20)
            elseif v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Golds.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Golds.Primary.ProximityPrompt,20)
            elseif _G.Settings.Purple_Chest then
                if game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value >= 1 then
                if v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Rewards.Purple.Primary.CFrame
                task.wait(.2)
                fireproximityprompt(v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt,20)
                elseif v.Configs.Others.Rewards.Purple.Primary.ProximityPrompt.Enabled == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
                elseif not game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key") or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Inventory.Resources:FindFirstChild("Dungeons Key").Amount.Value < 1 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
                if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
                end
            elseif _G.Settings.Purple_Chest == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Configs.Others.Portal.Travel.CFrame
                task.wait(.2)
                if _G.Settings.Auto_Replay then
fireproximityprompt(v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt)
                elseif _G.Settings.Auto_Leave then
lobby()
                end
            end
                end
                elseif v.Configs.Others.Portal.Travel.Attachment.ProximityPrompt.Enabled == false and _G.Settings.Auto_Join_Friend then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Settings.Player_Name].Character.HumanoidRootPart.CFrame
        end
    end
    elseif _G.Settings.Auto_Join_Friend and (not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") or game:GetService("Players").LocalPlayer.OnRaids.Value == false) then
if (checkrift() or riftspawncheck()) and _G.Settings.Auto_Rift then
elseif (checkrift() == false or riftspawncheck() == false) or _G.Settings.Auto_Rift == false then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Settings.Player_Name].Character.HumanoidRootPart.CFrame
end
            end
end
end
end)
end
end)

function checkfriend(names)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Raids._Frame.Usage.Center.PlayersScrolling:GetChildren()) do
    if v.Name == names then
        print(true)
        return true
    end
end
end

spawn(function()
while task.wait(.2) do
pcall(function()
if _G.Settings.Auto_Crate_For_Friend and raid_start then
    if not workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
    if (checkrift() or riftspawncheck()) and _G.Settings.Auto_Rift then
elseif (checkrift() == false or riftspawncheck() == false) or _G.Settings.Auto_Rift == false then
if not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") or game:GetService("Players").LocalPlayer.OnRaids.Value == false then
for i,v in pairs(workspace.Raids_Entering:GetChildren()) do
if v.Name ~= "Specify" and v.Holders.Value == "" then
task.wait(math.random(1,4))
joinraidroom()
if checkfriend(_G.Settings.Player_Name) == true then
task.wait(2)
startraid()
task.wait(2)
end
break
end
end
else
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getraidclose().HumanoidRootPart.CFrame
end

end
elseif workspace.BossFights_Visual:FindFirstChild("Demon Forest") then
if _G.Settings.Auto_Bossfight and game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == true then
if _G.Settings.Wait_Until_Boss_Died == false then
if game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
lobby()
task.wait(2)
bossfight()
task.wait(2)
end
elseif _G.Settings.Wait_Until_Boss_Died then
if not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
bossfight()
task.wait(2)
elseif game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getraidclose().HumanoidRootPart.CFrame
end
end
elseif not _G.Settings.Auto_Bossfight or game:GetService("ReplicatedStorage").Players_Data[game.Players.LocalPlayer.Name].Worlds["Demon Forest"].Value == false then
    if (checkrift() or riftspawncheck()) and _G.Settings.Auto_Rift then
elseif (checkrift() == false or riftspawncheck() == false) or _G.Settings.Auto_Rift == false then
if not game:GetService("Players").LocalPlayer:FindFirstChild("OnRaids") or game:GetService("Players").LocalPlayer.OnRaids.Value == false then
for i,v in pairs(workspace.Raids_Entering:GetChildren()) do
if v.Name ~= "Specify" and v.Holders.Value == "" then
task.wait(math.random(1,4))
joinraidroom()
if checkfriend(_G.Settings.Player_Name) == true then
task.wait(2)
startraid()
task.wait(2)
end
break
end
end
else
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getraidclose().HumanoidRootPart.CFrame
end

end
end
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

        -- You can use the SaveManager:LoadAutoloadConfig() to load a config
        -- which has been marked to be one that auto loads!
        SaveManager:LoadAutoloadConfig()

uiparent = nil
uimakingend = false

        repeat task.wait(3)
        for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v.Name == "ScreenGui" then
            for i2,v2 in pairs(v:GetChildren()) do
                if v2.Name == "Frame" then
                    uiparent = v2.Parent
                    end
            end
        end
        end

if uiparent ~= nil then
uimakingend = true
end

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
        for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v.Name == "ScreenGui" then
            for i2,v2 in pairs(v:GetChildren()) do
                if v2.Name == "Frame" then
                if not v2:FindFirstChild("UISizeConstraint") then
            if v2.Visible == false then
            v2.Visible = true
            elseif v2.Visible == true then
        v2.Visible = false
            end
            end
            end
            end
        end
        end
        end)
        do
        end
        until uimakingend == true
        end

        if Premiums then

        elseif not Premiums then
            _G.Settings.Auto_Stack_Fruits = false
            _G.Settings.Auto_Equip_Ope = false
            _G.Settings.Auto_Equip_Yami = false
        end

        for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v.Name == "ScreenGui" then
            for i2,v2 in pairs(v:GetChildren()) do
                if v2.Name == "Frame" then
                if not v2:FindFirstChild("UISizeConstraint") then
            if not _G.Settings.Auto_Hide_Ui then
            v2.Visible = true
            elseif _G.Settings.Auto_Hide_Ui then
        v2.Visible = false
            end
            end
            end
            end
        end
        end

		end)

spawn(function()
while task.wait(1) do
    pcall(function()
if Noclip or _G.Settings.Auto_raid or _G.Settings.Auto_Global_Boss then
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
end)
end
end)


    game.ReplicatedStorage.Remotes.Misc.NotificationBidable:Fire("Label", nil, {
                    ["Label"] = "Welcome to Axel Hub",
                    ["Rarity"] = "Legendary"
                })
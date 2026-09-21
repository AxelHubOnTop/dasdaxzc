	if Setting ~= nil then
_G.Settings = game:service('HttpService'):JSONDecode(Setting)
	end

	--[[
		Panda Key System - Legacy Roblox Client
		https://pandadevelopment.net
	]]

	if game.PlaceId == 6918802270 then
	firstsea = true
	elseif game.PlaceId == 14979402479 then
	secondsea = true
	elseif game.PlaceId == 99664616626491 then
	thirdsea = true
	end

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
	workingreal = key
	end

	if pre(_G.Key) then
	Premiums = true
	end

	if response == nil then
	local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/keysystem.Lua"))()
	local response = KeySystem:Init({
		Title = "AxelHub_HASE_Key",
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
	if isfile("axelhub_hase_key.key") then
	delfile("axelhub_hase_key.key")
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
	if isfile("axelhub_hase_key.key") then
	delfile("axelhub_hase_key.key")
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

	repeat task.wait()
		until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingUI")

	task.wait(2)

	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("StartMenu") then
	repeat task.wait()
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("StartMenu") then
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.StartMenu.MainFrame.Middle.Play.Holder.PlayButton)
	task.wait(.6)
	end
		until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("StartMenu")
	end

	_G.DefaultSettings = {
				Auto_Farm_Level = false,
				Auto_Timed_Boss = false,
				Auto_Dun_Retry = false
			}

			userid = game.Players.LocalPlayer.UserId

			folder_name = "AxelHub/"..userid.."_HASE.JSON"

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
				if _G.Settings == nil then
			_G.Settings = game:service('HttpService'):JSONDecode(readfile(folder_name))
				end

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
		return "AxelHub/"..userid.."_HASE.JSON"
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
	_G.Settings.Disc = 6
	end

	if _G.Settings.Bypass_Tp == nil then
	_G.Settings.Bypass_Tp = false
	end

	function goto(speed,va)
		local Distance2 = (va.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if Distance2 > 70 then
			local tween_s = game:service"TweenService"
			local info = TweenInfo.new(Distance2/speed, Enum.EasingStyle.Linear)
			local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = va})
			tween:Play()
			else
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = va
		end
	end

	function checkmons(mosda)
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2:GetAttribute("Nickname") == mosda and v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") then
	return true
	end
	end
	end
	end
	return false
	end

	if firstsea then
	spawner = game:GetService("Players").LocalPlayer.PlayerData.SpawnPoint
	elseif secondsea then
		spawner = game:GetService("Players").LocalPlayer.PlayerData.SpawnPoint2
	elseif thirdsea then
		spawner = game:GetService("Players").LocalPlayer.PlayerData.SpawnPoint3
	end

	if thirdsea then
	questtable = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9"
	}
	end

	if secondsea then
	questtable = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"10",
	"11",
	"12",
	"13",
	"14",
	"15",
	"16",
	"17",
	"18",
	"19",
	"20",
	"21",
	"22",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"30",
	"31",
	"32",
	"33",
	"34",
	"35",
	"36",
	"37",
	"38",
	"39",
	"40"
	}
	end

	if firstsea then
	questtable = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"10",
	"11",
	"12",
	"13",
	"14",
	"15",
	"16",
	"17",
	"18",
	"19",
	"20",
	"21",
	"22",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"30",
	"31",
	"32",
	"33",
	"34",
	"35",
	"36",
	"37",
	"38",
	"39",
	"40",
	"41",
	"42",
	"43",
	"44",
	"45",
	"46",
	"47",
	"48"
	}
	end

	function checklevel2()
	local lv = lvreal
	if _G.Settings.Farm_Mode2 == "Quest Selection" then
	return _G.Settings.Quest_Selection
	elseif _G.Settings.Farm_Mode2 == "Level Farm" then
	if firstsea then
	if lv >= 0 and lv <= 9 then
	return "1"
	elseif lv >= 10 and lv <= 24 then
	return "2"
	elseif lv >= 25 and lv <= 39 then
	return "3"
	elseif lv >= 40 and lv <= 59 then
	return "4"
	elseif lv >= 60 and lv <= 89 then
	return "5"
	elseif lv >= 90 and lv <= 119 then
	return "6"
	elseif lv >= 120 and lv <= 159 then
	return "7"
	elseif lv >= 160 and lv <= 199 then
	return "8"
	elseif lv >= 200 and lv <= 249 then
	return "9"
	elseif lv >= 250 and lv <= 299 then
	return "10"
	elseif lv >= 300 and lv <= 349 then
	return "11"
	elseif lv >= 350 and lv <= 399 then
	return "12"
	elseif lv >= 400 and lv <= 449 then
	return "13"
	elseif lv >= 450 and lv <= 499 then
	return "14"
	elseif lv >= 500 and lv <= 549 then
	return "15"
	elseif lv >= 550 and lv <= 599 then
	return "16"
	elseif lv >= 600 and lv <= 649 then
	return "17"
	elseif lv >= 650 and lv <= 699 then
	return "18"
	elseif lv >= 700 and lv <= 749 then
	return "19"
	elseif lv >= 750 and lv <= 799 then
	return "20"
	elseif lv >= 800 and lv <= 849 then
	return "21"
	elseif lv >= 850 and lv <= 899 then
	return "22"
	elseif lv >= 900 and lv <= 949 then
	return "23"
	elseif lv >= 950 and lv <= 999 then
	return "24"
	elseif lv >= 1000 and lv <= 1049 then
	return "25"
	elseif lv >= 1050 and lv <= 1099 then
	return "26"
	elseif lv >= 1100 and lv <= 1149 then
	return "27"
	elseif lv >= 1150 and lv <= 1199 then
	return "28"
	elseif lv >= 1200 and lv <= 1249 then
	return "29"
	elseif lv >= 1250 and lv <= 1299 then
	return "30"
	elseif lv >= 1300 and lv <= 1349 then
	return "31"
	elseif lv >= 1350 and lv <= 1399 then
	return "32"
	elseif lv >= 1400 and lv <= 1449 then
	return "33"
	elseif lv >= 1450 and lv <= 1499 then
	return "34"
	elseif lv >= 1500 and lv <= 1549 then
	return "35"
	elseif lv >= 1550 and lv <= 1599 then
	return "36"
	elseif lv >= 1600 and lv <= 1649 then
	return "37"
	elseif lv >= 1650 and lv <= 1699 then
	return "38"
	elseif lv >= 1700 and lv <= 1749 then
	return "39"
	elseif lv >= 1750 and lv <= 1799 then
	return "40"
	elseif lv >= 1800 and lv <= 1849 then
	return "41"
	elseif lv >= 1850 and lv <= 1899 then
	return "42"
	elseif lv >= 1900 and lv <= 1949 then
	return "43"
	elseif lv >= 1950 and lv <= 1999 then
	return "44"
	elseif lv >= 2000 and lv <= 2049 then
	return "45"
	elseif lv >= 2050 and lv <= 2099 then
	return "46"
	elseif lv >= 2100 and lv <= 2149 then
	return "47"
	elseif lv >= 2150 then
	return "48"
	end
	elseif secondsea then
	if lv >= 1 and lv <= 2249 then
		return "1"
	elseif lv >= 2250 and lv <= 2299 then
		return "2"
	elseif lv >= 2300 and lv <= 2349 then
		return "3"
	elseif lv >= 2350 and lv <= 2399 then
		return "4"
	elseif lv >= 2400 and lv <= 2449 then
		return "5"
	elseif lv >= 2450 and lv <= 2499 then
		return "6"
	elseif lv >= 2500 and lv <= 2549 then
		return "7"
	elseif lv >= 2550 and lv <= 2599 then
		return "8"
	elseif lv >= 2600 and lv <= 2649 then
		return "9"
	elseif lv >= 2650 and lv <= 2699 then
		return "10"
	elseif lv >= 2700 and lv <= 2749 then
		return "11"
	elseif lv >= 2750 and lv <= 2799 then
		return "12"
	elseif lv >= 2800 and lv <= 2849 then
		return "13"
	elseif lv >= 2850 and lv <= 2899 then
		return "14"
	elseif lv >= 2900 and lv <= 2949 then
		return "15"
	elseif lv >= 2950 and lv <= 2999 then
		return "16"
	elseif lv >= 3000 and lv <= 3049 then
		return "17"
	elseif lv >= 3050 and lv <= 3099 then
		return "18"
	elseif lv >= 3100 and lv <= 3149 then
		return "19"
	elseif lv >= 3150 and lv <= 3199 then
		return "20"
	elseif lv >= 3200 and lv <= 3249 then
		return "21"
	elseif lv >= 3250 and lv <= 3299 then
		return "22"
	elseif lv >= 3300 and lv <= 3349 then
		return "23"
	elseif lv >= 3350 and lv <= 3399 then
		return "24"
	elseif lv >= 3400 and lv <= 3449 then
		return "25"
	elseif lv >= 3450 and lv <= 3499 then
		return "26"
	elseif lv >= 3500 and lv <= 3549 then
		return "27"
	elseif lv >= 3550 and lv <= 3599 then
		return "28"
	elseif lv >= 3600 and lv <= 3640 then
		return "29"
	elseif lv >= 3650 and lv <= 3699 then
		return "30"
	elseif lv >= 3700 and lv <= 3749 then
		return "31"
	elseif lv >= 3750 and lv <= 3799 then
		return "32"
	elseif lv >= 3800 and lv <= 3849 then
		return "33"
	elseif lv >= 3850 and lv <= 3899 then
		return "34"
	elseif lv >= 3900 and lv <= 3949 then
		return "35"
	elseif lv >= 3950 and lv <= 3999 then
		return "36"
	elseif lv >= 4000 and lv <= 4049 then
		return "37"
	elseif lv >= 4050 and lv <= 4099 then
		return "38"
	elseif lv >= 4100 and lv <= 4149 then
		return "39"
	elseif lv >= 4150 then
		return "40"
	end
	elseif thirdsea then
	if lv >= 1 and lv <= 4249 then
		return "1"
	elseif lv >= 4250 and lv <= 4299 then
		return "2"
	elseif lv >= 4300 and lv <= 4349 then
		return "3"
	elseif lv >= 4350 and lv <= 4399 then
		return "4"
	elseif lv >= 4400 and lv <= 4449 then
		return "5"
	elseif lv >= 4450 and lv <= 4499 then
		return "6"
	elseif lv >= 4500 and lv <= 4549 then
		return "7"
	elseif lv >= 4550 and lv <= 4599 then
		return "8"
	elseif lv >= 4600 and lv <= 4649 then
		return "9"
	elseif lv >= 4650 and lv <= 4699 then
		return "10"
	elseif lv >= 4700 and lv <= 4749 then
		return "11"
	elseif lv >= 4750 then
		return "12"
	end
	end
	end
	end

	allbossdou = {"Control Sentinel","Raigo Priest","Leopard Boss","Love Boss","Venom Boss","Snow Boss","Baboon Boss","Soul Boss","Shadow Boss","Peanut Boss","Tree Boss","Desert Boss","3SS Boss","Bandit Boss","Clown Boss","Shark Boss","Bomb Boss","Krieg Boss","Tashii","King Gorilla","Marine Captain","Minotaur","Ice Admiral","Thunder God","Revolutionary Boss","Warden","Snow Harpy","Neptune","Shiryu","G4 Boss","Ryummy","Mammoth Boss"}

	function checklevel()
	local lv = lvreal
	if firstsea then
	if checklevel2() == "1" then
	monsname = "Thief"
	cfpuk = CFrame.new(-2462.53003, 45.4940109, -3255.67603, -0.119086921, -1.12058796e-09, -0.992883861, 7.05582481e-09, 1, -1.97489802e-09, 0.992883861, -7.24079907e-09, -0.119086921)
	levelnum = "Level 1"
	npcnum = "1"
	islandtobespawn = "Starter Island"
	elseif checklevel2() == "2" then
	monsname = "Bandit"
	cfpuk = CFrame.new(-1970.32019, 45.4940109, -3197.53857, 0.99276042, -3.7933825e-09, 0.120111369, 1.37541856e-09, 1, 2.02139177e-08, -0.120111369, -1.99023749e-08, 0.99276042)
	levelnum = "Level 10"
	npcnum = "1"
	islandtobespawn = "Starter Island"
	elseif checklevel2() == "3" then
	monsname = "Bandit Boss"
	cfpuk = CFrame.new(-1951.62366, 67.5077972, -3386.66968, 0.26467967, 2.23729995e-08, -0.964336395, -3.16437676e-09, 1, 2.23318892e-08, 0.964336395, -2.85927348e-09, 0.26467967)
	levelnum = "Level 25"
	npcnum = "1"
	islandtobespawn = "Starter Island"
	elseif checklevel2() == "4" then
	monsname = "Pirate Clown"
	cfpuk = CFrame.new(-2345.87793, 25.0633564, -750.712036, 0.647140324, -8.50629256e-09, -0.762370884, 5.46325971e-08, 1, 3.52173259e-08, 0.762370884, -6.44408544e-08, 0.647140324)
	levelnum = "Level 40"
	npcnum = "2"
	islandtobespawn = "Clown Island"
	elseif checklevel2() == "5" then
	monsname = "Clown Boss"
	cfpuk = CFrame.new(-2229.40063, 35.0944443, -395.93927, -0.991075873, 1.80732407e-08, -0.133299038, 1.17077725e-08, 1, 4.85371103e-08, 0.133299038, 4.65433239e-08, -0.991075873)
	levelnum = "Level 60"
	npcnum = "2"
	islandtobespawn = "Clown Island"
	elseif checklevel2() == "6" then
	monsname = "Fishman"
	cfpuk = CFrame.new(-4318.93457, 18.208107, -3292.33252, -0.976319671, -3.07677195e-09, 0.216332778, 4.16738999e-09, 1, 3.30300232e-08, -0.216332778, 3.3149405e-08, -0.976319671)
	levelnum = "Level 90"
	npcnum = "3"
	islandtobespawn = "Shark Park"
	elseif checklevel2() == "7" then
	monsname = "Shark Boss"
	cfpuk = CFrame.new(-4293.37988, 8.1543684, -3037.50537, 0.475948393, -2.47188092e-09, -0.879473209, 3.16046411e-10, 1, -2.63960187e-09, 0.879473209, 9.78359838e-10, 0.475948393)
	levelnum = "Level 120"
	npcnum = "3"
	islandtobespawn = "Shark Park"
	elseif checklevel2() == "8" then
	monsname = "Desert Thief"
	cfpuk = CFrame.new(-4385.06738, 14.4515581, -800.185486, -0.971435308, -1.29706623e-09, -0.237304628, -4.56920102e-09, 1, 1.32387514e-08, 0.237304628, 1.39448826e-08, -0.971435308)
	levelnum = "Level 160"
	npcnum = "4"
	islandtobespawn = "Desert Ruins"
	elseif checklevel2() == "9" then
	monsname = "Bomb Boss"
	cfpuk = CFrame.new(-4347.80029, 14.4515581, -389.751007, -0.970838547, -2.79607111e-08, -0.239734322, -1.72333419e-08, 1, -4.68431836e-08, 0.239734322, -4.13457428e-08, -0.970838547)
	levelnum = "Level 200"
	npcnum = "4"
	islandtobespawn = "Desert Ruins"
	elseif checklevel2() == "10" then
	monsname = "Krieg Pirate"
	cfpuk = CFrame.new(-5406.05908, 7.94614983, 1766.37256, 0.897796571, 1.33890055e-08, 0.440410405, -6.59382309e-08, 1, 1.04016863e-07, -0.440410405, -1.2242586e-07, 0.897796571)
	levelnum = "Level 250"
	npcnum = "5"
	islandtobespawn = "Sea Restaurant"
	elseif checklevel2() == "11" then
	monsname = "Krieg Boss"
	cfpuk = CFrame.new(-5358.16699, 10.6232347, 1981.89661, -0.988428235, -8.42432257e-09, -0.151689097, -2.23369945e-08, 1, 9.0014332e-08, 0.151689097, 9.23609846e-08, -0.988428235)
	levelnum = "Level 300"
	npcnum = "5"
	islandtobespawn = "Sea Restaurant"
	elseif checklevel2() == "12" then
	monsname = "Marine Recruit"
	cfpuk = CFrame.new(-2883.62793, 22.0624218, 1464.97595, -0.870754421, 7.22486106e-08, 0.491718143, 7.54117551e-08, 1, -1.33887532e-08, -0.491718143, 2.54230113e-08, -0.870754421)
	levelnum = "Level 350"
	npcnum = "6"
	islandtobespawn = "Logue City"
	elseif checklevel2() == "13" then
	monsname = "Tashii"
	cfpuk = CFrame.new(-3034.85498, 20.7839947, 1843.10815, -0.998124182, 2.99005176e-09, -0.061222218, 5.26773203e-09, 1, -3.70420921e-08, 0.061222218, -3.72951092e-08, -0.998124182)
	levelnum = "Level 400"
	npcnum = "6"
	islandtobespawn = "Logue City"
	elseif checklevel2() == "14" then
	monsname = "Monkey"
	cfpuk = CFrame.new(-845.942383, 11.3470602, 1945.25745, -0.516234696, 6.25526582e-08, 0.85644716, 2.14515694e-09, 1, -7.17443598e-08, -0.85644716, -3.51997151e-08, -0.516234696)
	levelnum = "Level 450"
	npcnum = "7"
	islandtobespawn = "Tall Woods"
	elseif checklevel2() == "15" then
	monsname = "Gorilla"
	cfpuk = CFrame.new(-151.167709, 11.47824, 1762.72949, 0.12011756, 1.16232957e-09, -0.992759645, -8.18014666e-12, 1, 1.1698168e-09, 0.992759645, -1.32394623e-10, 0.12011756)
	levelnum = "Level 500"
	npcnum = "7"
	islandtobespawn = "Tall Woods"
	elseif checklevel2() == "16" then
	monsname = "King Gorilla"
	cfpuk = CFrame.new(-688.694946, 20.6663609, 2304.78174, -0.904425979, 1.42122341e-08, 0.426630557, 3.51136791e-08, 1, 4.11257233e-08, -0.426630557, 5.21757393e-08, -0.904425979)
	levelnum = "Level 550"
	npcnum = "7"
	islandtobespawn = "Tall Woods"
	elseif checklevel2() == "17" then
	monsname = "Marine Grunt"
	cfpuk = CFrame.new(-389.544525, 13.1411572, 4994.16504, 0.97394681, -4.55345415e-08, -0.22677663, 2.48727599e-08, 1, -9.39682252e-08, 0.22677663, 8.5879492e-08, 0.97394681)
	levelnum = "Level 600"
	npcnum = "8"
	islandtobespawn = "Marine Base Town"
	elseif checklevel2() == "18" then
	monsname = "Marine Captain"
	cfpuk = CFrame.new(-269.248352, 130.45105, 5318.85645, -0.376890689, -9.18106409e-08, 0.92625773, -1.3056038e-08, 1, 9.38075218e-08, -0.92625773, 2.32619239e-08, -0.376890689)
	levelnum = "Level 650"
	npcnum = "8"
	islandtobespawn = "Marine Base Town"
	elseif checklevel2() == "19" then
	monsname = "Satyr"
	cfpuk = CFrame.new(-2440.1228, 855.976135, 4914.375, -0.870898068, -6.67960691e-08, -0.491463631, -6.80123193e-08, 1, -1.53913078e-08, 0.491463631, 2.00213233e-08, -0.870898068)
	levelnum = "Level 700"
	npcnum = "9"
	islandtobespawn = "Three Islands"
	elseif checklevel2() == "20" then
	monsname = "Minotaur"
	cfpuk = CFrame.new(-2830.76294, 856.462952, 4805.75244, 0.419376552, 3.3011645e-08, 0.907812357, 3.33526735e-08, 1, -5.17716856e-08, -0.907812357, 5.19898009e-08, 0.419376552)
	levelnum = "Level 750"
	npcnum = "9"
	islandtobespawn = "Three Islands"
	elseif checklevel2() == "21" then
	monsname = "Elite Marine"
	cfpuk = CFrame.new(-5427.7627, 20.7288074, 5886.00391, 0.636643887, 3.01575831e-08, 0.77115792, -5.42589227e-08, 1, 5.68758907e-09, -0.77115792, -4.54631675e-08, 0.636643887)
	levelnum = "Level 800"
	npcnum = "10"
	islandtobespawn = "Marine HQ"
	elseif checklevel2() == "22" then
	monsname = "Vice Admiral"
	cfpuk = CFrame.new(-5291.74951, 20.7288074, 6049.87012, -0.821382165, -3.338952e-09, -0.570378244, -5.01824093e-09, 1, 1.37267053e-09, 0.570378244, 3.98978228e-09, -0.821382165)
	levelnum = "Level 850"
	npcnum = "10"
	islandtobespawn = "Marine HQ"
	elseif checklevel2() == "23" then
	monsname = "Ice Admiral"
	cfpuk = CFrame.new(-6082.44092, 207.006561, 5948.94629, -0.815740883, 3.36860388e-08, 0.57841748, 8.91885399e-10, 1, -5.69804541e-08, -0.57841748, -4.59654039e-08, -0.815740883)
	levelnum = "Level 900"
	npcnum = "10"
	islandtobespawn = "Marine HQ"
	elseif checklevel2() == "24" then
	monsname = "Sandorian Warrior"
	cfpuk = CFrame.new(1770.34692, 1099.27637, -211.098221, -0.633371651, -6.9985937e-08, -0.773847759, -3.27444063e-08, 1, -6.36385593e-08, 0.773847759, -1.49676733e-08, -0.633371651)
	levelnum = "Level 950"
	npcnum = "11"
	islandtobespawn = "Skypiean islands"
	elseif checklevel2() == "25" then
	monsname = "Divine Soldier"
	cfpuk = CFrame.new(1994.09607, 1159.8363, 156.123962, 0.177359179, 8.13653287e-08, -0.984146178, -1.03948587e-07, 1, 6.39428279e-08, 0.984146178, 9.09597588e-08, 0.177359179)
	levelnum = "Level 1000"
	npcnum = "11"
	islandtobespawn = "Skypiean islands"
	elseif checklevel2() == "26" then
	monsname = "Holy Soldier"
	cfpuk = CFrame.new(2127.14893, 2031.09924, 876.937134, 0.651437044, -2.37265265e-08, -0.758702695, -2.31515096e-09, 1, -3.32603314e-08, 0.758702695, 2.34235227e-08, 0.651437044)
	levelnum = "Level 1050"
	npcnum = "12"
	islandtobespawn = "Skypiean islands"
	elseif checklevel2() == "27" then
	monsname = "Thunder God"
	cfpuk = CFrame.new(2127.14893, 2031.09924, 876.937134, 0.651437044, -2.37265265e-08, -0.758702695, -2.31515096e-09, 1, -3.32603314e-08, 0.758702695, 2.34235227e-08, 0.651437044)
	levelnum = "Level 1100"
	npcnum = "12"
	islandtobespawn = "Skypiean islands"
	elseif checklevel2() == "28" then
	monsname = "Revolutionary"
	cfpuk = CFrame.new(2563.84668, 36.2775574, 3378.54736, -0.987288356, -6.01569194e-09, 0.158939287, 9.89997417e-09, 1, 9.93449873e-08, -0.158939287, 9.96556437e-08, -0.987288356)
	levelnum = "Level 1150"
	npcnum = "13"
	islandtobespawn = "Revolutionary Base"
	elseif checklevel2() == "29" then
	monsname = "Revolutionary Elite"
	cfpuk = CFrame.new(2563.84668, 36.2775574, 3378.54736, -0.987288356, -6.01569194e-09, 0.158939287, 9.89997417e-09, 1, 9.93449873e-08, -0.158939287, 9.96556437e-08, -0.987288356)
	levelnum = "Level 1200"
	npcnum = "13"
	islandtobespawn = "Revolutionary Base"
	elseif checklevel2() == "30" then
	monsname = "Revolutionary Boss"
	cfpuk = CFrame.new(2432.53442, 36.2775574, 3260.71338, -0.173992679, 2.81639867e-08, 0.984746933, 2.04005657e-09, 1, -2.8239775e-08, -0.984746933, -2.9045748e-09, -0.173992679)
	levelnum = "Level 1250"
	npcnum = "13"
	islandtobespawn = "Revolutionary Base"
	elseif checklevel2() == "31" then
	monsname = "Impel Guard"
	cfpuk = CFrame.new(2583.58862, 17.8261204, 5912.3501, -0.814662337, -5.85968003e-08, -0.57993561, -8.91016239e-09, 1, -8.85236702e-08, 0.57993561, -6.69495819e-08, -0.814662337)
	levelnum = "Level 1300"
	npcnum = "14"
	islandtobespawn = "Impel Jail"
	elseif checklevel2() == "32" then
	monsname = "Impel Elite"
	cfpuk = CFrame.new(2691.75293, 11.0756884, 6131.91748, -0.892393887, 2.19504948e-08, -0.451257288, -5.75075931e-10, 1, 4.97802226e-08, 0.451257288, 4.46830732e-08, -0.892393887)
	levelnum = "Level 1350"
	npcnum = "14"
	islandtobespawn = "Impel Jail"
	elseif checklevel2() == "33" then
	monsname = "Warden"
	cfpuk = CFrame.new(2746.97021, 11.3110447, 6249.08447, -0.932626367, -2.47612366e-08, -0.360843569, -3.71218678e-09, 1, -5.90260036e-08, 0.360843569, -5.37096874e-08, -0.932626367)
	levelnum = "Level 1400"
	npcnum = "14"
	islandtobespawn = "Impel Jail"
	elseif checklevel2() == "34" then
	monsname = "Corrupt Marine"
	cfpuk = CFrame.new(1803.72351, 17.8137856, -2484.81396, -0.294437349, 6.42960316e-08, -0.955670774, -1.25903854e-09, 1, 6.76663348e-08, 0.955670774, 2.11267235e-08, -0.294437349)
	levelnum = "Level 1450"
	npcnum = "15"
	islandtobespawn = "Half Hot Half Cold"
	elseif checklevel2() == "35" then
	monsname = "Vergo"
	cfpuk = CFrame.new(2320.79785, 41.4599991, -3145.25, -0.986695707, -5.54118884e-08, 0.162577763, -5.77771324e-08, 1, -9.82028858e-09, -0.162577763, -1.90829148e-08, -0.986695707)
	levelnum = "Level 1500"
	npcnum = "15"
	islandtobespawn = "Half Hot Half Cold"
	elseif checklevel2() == "36" then
	monsname = "Snow Harpy"
	cfpuk = CFrame.new(2411.30933, 42.4002419, -2418.15356, 0.359840095, -1.16624477e-07, -0.933013976, -5.04278119e-10, 1, -1.25192059e-07, 0.933013976, 4.55196201e-08, 0.359840095)
	levelnum = "Level 1550"
	npcnum = "15"
	islandtobespawn = "Half Hot Half Cold"
	elseif checklevel2() == "37" then
	monsname = "Island Fishman"
	cfpuk = CFrame.new(5006.20898, 48.2501335, -3181.81567, 0.308379322, -1.29720563e-08, 0.951263487, -3.49371776e-09, 1, 1.4769248e-08, -0.951263487, -7.87797649e-09, 0.308379322)
	levelnum = "Level 1600"
	npcnum = "16"
	islandtobespawn = "Fishman Island"
	elseif checklevel2() == "38" then
	monsname = "Fishman Elite"
	cfpuk = CFrame.new(4949.16016, 12.9864397, -2798.99121, 0.984824359, 2.44230787e-08, -0.173554078, -1.13633112e-08, 1, 7.62425998e-08, 0.173554078, -7.31134193e-08, 0.984824359)
	levelnum = "Level 1650"
	npcnum = "16"
	islandtobespawn = "Fishman Island"
	elseif checklevel2() == "39" then
	monsname = "Neptune"
	cfpuk = CFrame.new(5312.27197, 139.308289, -2517.65063, 0.520837545, 1.18085568e-08, 0.853655815, 7.09316661e-10, 1, -1.4265698e-08, -0.853655815, 8.03562283e-09, 0.520837545)
	levelnum = "Level 1700"
	npcnum = "16"
	islandtobespawn = "Fishman Island"
	elseif checklevel2() == "40" then
	monsname = "Skull Pirate"
	cfpuk = CFrame.new(4826.15039, 15.6576309, -264.404785, -0.999678969, 1.95580689e-08, -0.0253365822, 2.20705516e-08, 1, -9.88846338e-08, 0.0253365822, -9.94120839e-08, -0.999678969)
	levelnum = "Level 1750"
	npcnum = "17"
	islandtobespawn = "Skull Island"
	elseif checklevel2() == "41" then
	monsname = "Pirate Elite"
	cfpuk = CFrame.new(5211.33838, 49.6576271, -314.038361, -0.81608814, 1.13661017e-07, -0.57792747, 1.02397514e-07, 1, 5.20750802e-08, 0.57792747, -1.6680481e-08, -0.81608814)
	levelnum = "Level 1800"
	npcnum = "17"
	islandtobespawn = "Skull Island"
	elseif checklevel2() == "42" then
	monsname = "Shiryu"
	cfpuk = CFrame.new(5305.23926, 121.722977, -68.9701614, -0.791133463, 9.16552025e-08, -0.611643553, 6.93552167e-08, 1, 6.01428241e-08, 0.611643553, 5.16032905e-09, -0.791133463)
	levelnum = "Level 1850"
	npcnum = "17"
	islandtobespawn = "Skull Island"
	elseif checklevel2() == "43" then
	monsname = "Pirate"
	cfpuk = CFrame.new(5185.47266, 16.2917728, 2499.57178, -0.998165429, 1.27886919e-08, -0.0605454259, 4.91687269e-09, 1, 1.30164068e-07, 0.0605454259, 1.2962758e-07, -0.998165429)
	levelnum = "Level 1900"
	npcnum = "18"
	islandtobespawn = "Bubble Island"
	elseif checklevel2() == "44" then
	monsname = "Armored Marine"
	cfpuk = CFrame.new(5207.96631, 15.8417301, 2185.75928, 0.999568403, 3.6082326e-09, -0.0293771364, -2.33205388e-09, 1, 4.34754845e-08, 0.0293771364, -4.33882121e-08, 0.999568403)
	levelnum = "Level 1950"
	npcnum = "18"
	islandtobespawn = "Bubble Island"
	elseif checklevel2() == "45" then
	monsname = "G4 Boss"
	cfpuk = CFrame.new(4911.68896, 59.5356827, 2575.73218, -0.915364385, 2.61048392e-08, 0.402626455, 1.18374344e-09, 1, -6.21451548e-08, -0.402626455, -5.64088545e-08, -0.915364385)
	levelnum = "Level 2000"
	npcnum = "18"
	islandtobespawn = "Bubble Island"
	elseif checklevel2() == "46" then
	monsname = "Skeleton"
	cfpuk = CFrame.new(5542.70508, 12.9655571, 5801.8335, -0.165767178, -1.20066275e-07, -0.986164927, 9.90887195e-09, 1, -1.23416314e-07, 0.986164927, -3.02301579e-08, -0.165767178)
	levelnum = "Level 2050"
	npcnum = "19"
	islandtobespawn = "Thriller Boat"
	elseif checklevel2() == "47" then
	monsname = "Mummy"
	cfpuk = CFrame.new(5646.15576, 12.6781864, 5938.28174, -0.241731197, -1.19964261e-08, -0.970343232, 9.93672852e-11, 1, -1.23878285e-08, 0.970343232, -3.09094506e-09, -0.241731197)
	levelnum = "Level 2100"
	npcnum = "19"
	islandtobespawn = "Thriller Boat"
	elseif checklevel2() == "48" then
	monsname = "Ryummy"
	cfpuk = CFrame.new(5479.68115, 119.591049, 6175.09766, 0.621931314, 1.75425363e-08, 0.783071816, 9.4383823e-10, 1, -2.315182e-08, -0.783071816, 1.51379353e-08, 0.621931314)
	levelnum = "Level 2150"
	npcnum = "19"
	islandtobespawn = "Thriller Boat"
	end
	elseif secondsea then
	if checklevel2() == "1" then
	monsname = "Samurai"
	cfpuk = CFrame.new(2613.89111, 35.9982109, 16465.8984, 0.999937534, 3.74068279e-08, 0.0111778807, -3.80600511e-08, 1, 5.82262452e-08, -0.0111778807, -5.86480375e-08, 0.999937534)
	levelnum = "Level 2200"
	npcnum = "1"
	islandtobespawn = "Flower Capital"
	elseif checklevel2() == "2" then
	monsname = "Strong Samurai"
	cfpuk = CFrame.new(2640.92578, 35.9982109, 16526.8418, -0.886337876, -1.41975702e-08, -0.46303907, 1.35652263e-08, 1, -5.6627929e-08, 0.46303907, -5.64727074e-08, -0.886337876)
	levelnum = "Level 2250"
	npcnum = "1"
	islandtobespawn = "Flower Capital"
	elseif checklevel2() == "3" then
	monsname = "Shinobi"
	cfpuk = CFrame.new(1909.79321, 25.9980793, 16096.5322, 0.32321316, -9.89980222e-08, 0.946326196, 7.20658599e-09, 1, 1.02151631e-07, -0.946326196, -2.61969699e-08, 0.32321316)
	levelnum = "Level 2300"
	npcnum = "1"
	islandtobespawn = "Flower Capital"
	elseif checklevel2() == "4" then
	monsname = "Shinobi Elite"
	cfpuk = CFrame.new(1812.11633, 25.9980793, 16028.6475, 0.0624998808, 2.96430525e-08, 0.998044968, 2.07628581e-08, 1, -3.10013384e-08, -0.998044968, 2.26598456e-08, 0.0624998808)
	levelnum = "Level 2350"
	npcnum = "1"
	islandtobespawn = "Flower Capital"
	elseif checklevel2() == "5" then
	monsname = "Officer Guard"
	cfpuk = CFrame.new(2032.38, 10.0131149, 11721.3643, 0.888989627, -4.51379876e-08, -0.457927346, -1.03984432e-09, 1, -1.00588878e-07, 0.457927346, 8.98986414e-08, 0.888989627)
	levelnum = "Level 2400"
	npcnum = "2"
	islandtobespawn = "Udon Prison"
	elseif checklevel2() == "6" then
	monsname = "Sergeant Guard"
	cfpuk = CFrame.new(2182.85303, 102.395317, 11362.79, 0.98099494, -3.38056028e-09, 0.19403334, -4.54655336e-09, 1, 4.04090663e-08, -0.19403334, -4.05232718e-08, 0.98099494)
	levelnum = "Level 2450"
	npcnum = "2"
	islandtobespawn = "Udon Prison"
	elseif checklevel2() == "7" then
	monsname = "Mammoth Boss"
	cfpuk = CFrame.new(2185.14722, 9.83329201, 11369.6855, 0.997889757, -3.27576402e-08, -0.0649311766, 3.0007552e-08, 1, -4.3329095e-08, 0.0649311766, 4.12892334e-08, 0.997889757)
	levelnum = "Level 2500"
	npcnum = "2"
	islandtobespawn = "Udon Prison"
	elseif checklevel2() == "8" then
	monsname = "Graverobber"
	cfpuk = CFrame.new(6868.62793, 15.0351419, 15769.7383, 0.56131202, -3.92581478e-09, 0.827604234, -8.9512937e-12, 1, 4.74966066e-09, -0.827604234, -2.67344991e-09, 0.56131202)
	levelnum = "Level 2550"
	npcnum = "3"
	islandtobespawn = "Snowy Graveyard"
	elseif checklevel2() == "9" then
	monsname = "Elite Graverobber"
	cfpuk = CFrame.new(7371.32422, 15.3391924, 16343.6826, -0.834032118, 1.57017119e-08, 0.55171591, 1.02403668e-08, 1, -1.29793563e-08, -0.55171591, -5.17542631e-09, -0.834032118)
	levelnum = "Level 2600"
	npcnum = "3"
	islandtobespawn = "Snowy Graveyard"
	elseif checklevel2() == "10" then
	monsname = "3SS Boss"
	cfpuk = CFrame.new(7490.85596, 15.0351419, 15500.0654, 0.746006966, 7.41719148e-08, -0.665938139, -3.06117585e-08, 1, 7.7087229e-08, 0.665938139, -3.71220743e-08, 0.746006966)
	levelnum = "Level 2650"
	npcnum = "3"
	islandtobespawn = "Snowy Graveyard"
	elseif checklevel2() == "11" then
	monsname = "Desert Pirate"
	cfpuk = CFrame.new(7347.4917, 20.4848309, 11661.4775, 0.996790409, -6.0269187e-08, -0.0800556391, 6.00828898e-08, 1, -4.73596584e-09, 0.0800556391, -8.92090082e-11, 0.996790409)
	levelnum = "Level 2700"
	npcnum = "4"
	islandtobespawn = "Desert City"
	elseif checklevel2() == "12" then
	monsname = "Desert Captain"
	cfpuk = CFrame.new(6807.47607, 20.484827, 11930.5049, 0.792649686, 1.10879368e-08, 0.609677374, -7.74898723e-09, 1, -8.11200263e-09, -0.609677374, 1.705594e-09, 0.792649686)
	levelnum = "Level 2750"
	npcnum = "4"
	islandtobespawn = "Desert City"
	elseif checklevel2() == "13" then
	monsname = "Desert Boss"
	cfpuk = CFrame.new(7449.28467, 20.484827, 12281.1396, -0.987956107, 1.03720925e-08, 0.154734224, -1.52858759e-09, 1, -7.67914798e-08, -0.154734224, -7.61031345e-08, -0.987956107)
	levelnum = "Level 2800"
	npcnum = "4"
	islandtobespawn = "Desert City"
	elseif checklevel2() == "14" then
	monsname = "Beast Pirate"
	cfpuk = CFrame.new(6810.94238, 1111.37646, 7504.83398, 0.203154609, 2.09342712e-08, 0.979146659, 3.07305248e-09, 1, -2.20177192e-08, -0.979146659, 7.48196971e-09, 0.203154609)
	levelnum = "Level 2850"
	npcnum = "5"
	islandtobespawn = "Dragon Island"
	elseif checklevel2() == "15" then
	monsname = "Elite Beast"
	cfpuk = CFrame.new(7305.97461, 1111.37646, 7319.90771, 0.893644512, 9.19181318e-08, -0.44877556, -5.7571178e-08, 1, 9.01786237e-08, 0.44877556, -5.47510943e-08, 0.893644512)
	levelnum = "Level 2900"
	npcnum = "5"
	islandtobespawn = "Dragon Island"
	elseif checklevel2() == "16" then
	monsname = "MaceV2 Boss"
	cfpuk = CFrame.new(7076.63428, 1148.7771, 6637.37891, 0.142104983, 7.7271114e-09, 0.989851594, 1.38093079e-10, 1, -7.82615839e-09, -0.989851594, 1.24882771e-09, 0.142104983)
	levelnum = "Level 2950"
	npcnum = "5"
	islandtobespawn = "Dragon Island"
	elseif checklevel2() == "17" then
	monsname = "Shadow Pirate"
	cfpuk = CFrame.new(2074.47852, 15.6103878, 7655.60205, -0.539556801, -8.74755628e-08, 0.841949224, -3.94850419e-09, 1, 1.01366119e-07, -0.841949224, 5.13683354e-08, -0.539556801)
	levelnum = "Level 3000"
	npcnum = "6"
	islandtobespawn = "Shadow Island"
	elseif checklevel2() == "18" then
	monsname = "Shadow Commander"
	cfpuk = CFrame.new(1797.53711, 819.238831, 7201.58545, 0.933571935, 2.27816943e-09, 0.358390063, -2.0898975e-08, 1, 4.80831588e-08, -0.358390063, -5.23790717e-08, 0.933571935)
	levelnum = "Level 3050"
	npcnum = "6"
	islandtobespawn = "Shadow Island"
	elseif checklevel2() == "19" then
	monsname = "Shadow Boss"
	cfpuk = CFrame.new(1351.25989, 1007.24469, 6868.75684, 0.933887124, -1.20621209e-07, 0.357567936, 9.9682552e-08, 1, 7.6989437e-08, -0.357567936, -3.62561607e-08, 0.933887124)
	levelnum = "Level 3100"
	npcnum = "6"
	islandtobespawn = "Shadow Island"
	elseif checklevel2() == "20" then
	monsname = "Peanut Pirate"
	cfpuk = CFrame.new(-3044.88892, 121.899384, 6412.93262, -0.0957077593, -6.59814248e-08, 0.995409489, -3.57540202e-08, 1, 6.28479881e-08, -0.995409489, -2.9574851e-08, -0.0957077593)
	levelnum = "Level 3150"
	npcnum = "7"
	islandtobespawn = "Peanut Island"
	elseif checklevel2() == "21" then
	monsname = "Peanut Captain"
	cfpuk = CFrame.new(-2410.52271, 89.6091003, 6636.91162, 0.390085876, -3.07892556e-08, -0.920778453, 5.90826832e-10, 1, -3.31879875e-08, 0.920778453, 1.24021442e-08, 0.390085876)
	levelnum = "Level 3200"
	npcnum = "7"
	islandtobespawn = "Peanut Island"
	elseif checklevel2() == "22" then
	monsname = "Peanut Boss"
	cfpuk = CFrame.new(-2727.27148, 233.480316, 5889.39502, 0.887488365, -1.19920065e-08, -0.460830063, -1.10648456e-10, 1, -2.6235714e-08, 0.460830063, 2.33348807e-08, 0.887488365)
	levelnum = "Level 3250"
	npcnum = "7"
	islandtobespawn = "Peanut Island"
	elseif checklevel2() == "23" then
	monsname = "Dough Pirate"
	cfpuk = CFrame.new(-2679.21948, 40.114296, 10796.9883, 0.984952152, 8.89540663e-10, -0.172827378, -8.48208526e-09, 1, -4.31928555e-08, 0.172827378, 4.40088321e-08, 0.984952152)
	levelnum = "Level 3300"
	npcnum = "8"
	islandtobespawn = "Dough Island"
	elseif checklevel2() == "24" then
	monsname = "Dough Captain"
	cfpuk = CFrame.new(-2640.72827, 40.1141434, 11358.2256, -0.998029709, 2.67962159e-14, -0.0627433062, 4.96112144e-14, 1, -3.62066497e-13, 0.0627433062, -3.6446589e-13, -0.998029709)
	levelnum = "Level 3350"
	npcnum = "8"
	islandtobespawn = "Dough Island"
	elseif checklevel2() == "25" then
	monsname = "Tree Boss"
	cfpuk = CFrame.new(-3032.43677, 98.3718796, 11130.8301, 0.869063616, 5.87569637e-08, -0.494700342, 5.48289192e-09, 1, 1.28404892e-07, 0.494700342, -1.14304413e-07, 0.869063616)
	levelnum = "Level 3400"
	npcnum = "8"
	islandtobespawn = "Dough Island"
	elseif checklevel2() == "26" then
	monsname = "Chocolate Pirate"
	cfpuk = CFrame.new(-2789.88989, 44.2121048, 15853.6602, -0.170887843, -4.37863257e-08, -0.985290468, -9.88340609e-09, 1, -4.27258477e-08, 0.985290468, 2.43669729e-09, -0.170887843)
	levelnum = "Level 3450"
	npcnum = "9"
	islandtobespawn = "Cake Island"
	elseif checklevel2() == "27" then
	monsname = "Candy Guard"
	cfpuk = CFrame.new(-3498.17334, 48.009758, 16389.0156, 0.906957626, 1.04285007e-08, -0.421221912, -1.5649217e-08, 1, -8.93751029e-09, 0.421221912, 1.46977355e-08, 0.906957626)
	levelnum = "Level 3500"
	npcnum = "9"
	islandtobespawn = "Cake Island"
	elseif checklevel2() == "28" then
	monsname = "Soul Boss"
	cfpuk = CFrame.new(-4322.81348, 244.143219, 17025.3398, -0.453062564, -1.10558114e-08, 0.891478717, 3.51848817e-09, 1, 1.41898013e-08, -0.891478717, 9.56552526e-09, -0.453062564)
	levelnum = "Level 3550"
	npcnum = "9"
	islandtobespawn = "Cake Island"
	elseif checklevel2() == "29" then
	monsname = "Baboon"
	cfpuk = CFrame.new(-8908.94629, 21.9627361, 17521.7617, 0.039070826, -5.18310621e-08, -0.999236465, -1.712261e-09, 1, -5.19376187e-08, 0.999236465, 3.74019926e-09, 0.039070826)
	levelnum = "Level 3600"
	npcnum = "10"
	islandtobespawn = "Foggy Castle"
	elseif checklevel2() == "30" then
	monsname = "Strong Baboon"
	cfpuk = CFrame.new(-10401.1807, 400.470154, 17430.5352, 0.943165541, 4.06186462e-09, -0.332323283, 9.21545271e-11, 1, 1.24841737e-08, 0.332323283, -1.18052679e-08, 0.943165541)
	levelnum = "Level 3650"
	npcnum = "10"
	islandtobespawn = "Foggy Castle"
	elseif checklevel2() == "31" then
	monsname = "Baboon Boss"
	cfpuk = CFrame.new(-11173.3535, 397.231384, 17373.7109, -0.00195312127, 9.62724442e-08, 0.999998093, -1.10050431e-08, 1, -9.62941229e-08, -0.999998093, -1.11930962e-08, -0.00195312127)
	levelnum = "Level 3700"
	npcnum = "10"
	islandtobespawn = "Foggy Castle"
	elseif checklevel2() == "32" then
	monsname = "Snowman"
	cfpuk = CFrame.new(-8440.30762, 15.4744225, 10948.0186, -0.502152562, -5.09010256e-08, -0.864779055, -7.91764787e-09, 1, -5.42625962e-08, 0.864779055, -2.04010853e-08, -0.502152562)
	levelnum = "Level 3750"
	npcnum = "11"
	islandtobespawn = "Winter Island"
	elseif checklevel2() == "33" then
	monsname = "Snow Elite"
	cfpuk = CFrame.new(-8894.27539, 78.4985428, 10259.2822, 0.849145234, -2.46884713e-09, 0.52815944, 2.29464323e-08, 1, -3.22175566e-08, -0.52815944, 3.94767596e-08, 0.849145234)
	levelnum = "Level 3800"
	npcnum = "11"
	islandtobespawn = "Winter Island"
	elseif checklevel2() == "34" then
	monsname = "Snow Boss"
	cfpuk = CFrame.new(-9422.04883, 204.349823, 10999.6104, -0.73812604, -3.22500582e-09, 0.674662828, -4.50836257e-09, 1, -1.52274443e-10, -0.674662828, -3.15402238e-09, -0.73812604)
	levelnum = "Level 3850"
	npcnum = "11"
	islandtobespawn = "Winter Island"
	elseif checklevel2() == "35" then
	monsname = "Love Warrior"
	cfpuk = CFrame.new(-9371.53711, 53.8864059, 6032.61279, 0.00830049533, -1.70524554e-08, -0.999965549, 2.5852728e-08, 1, -1.68384453e-08, 0.999965549, -2.57120689e-08, 0.00830049533)
	levelnum = "Level 3900"
	npcnum = "12"
	islandtobespawn = "Snake Amazon"
	elseif checklevel2() == "36" then
	monsname = "Snake Man"
	cfpuk = CFrame.new(-9957.66406, 76.3603668, 5881.1626, 0.370632827, 4.53387869e-08, 0.928779483, -1.28384396e-08, 1, -4.36922249e-08, -0.928779483, 4.26969349e-09, 0.370632827)
	levelnum = "Level 3950"
	npcnum = "12"
	islandtobespawn = "Snake Amazon"
	elseif checklevel2() == "37" then
	monsname = "Love Boss"
	cfpuk = CFrame.new(-9670.38965, 123.731644, 5573.35596, 0.938734233, 2.04749462e-08, 0.344641894, 5.99756111e-09, 1, -7.57454686e-08, -0.344641894, 7.31718757e-08, 0.938734233)
	levelnum = "Level 4000"
	npcnum = "12"
	islandtobespawn = "Snake Amazon"
	elseif checklevel2() == "38" then
	monsname = "Venom Monster"
	cfpuk = CFrame.new(-10038.6641, 24.3304405, 530.261475, 0.104854047, 3.9773262e-08, 0.994487643, -7.29143679e-08, 1, -3.23059766e-08, -0.994487643, -6.91250222e-08, 0.104854047)
	levelnum = "Level 4050"
	npcnum = "13"
	islandtobespawn = "Venom Island"
	elseif checklevel2() == "39" then
	monsname = "Venom Poacher"
	cfpuk = CFrame.new(-9330.1709, 20.2968578, 70.5716095, 0.99709481, -6.71588936e-08, -0.0761702508, 6.68612614e-08, 1, -6.45751541e-09, 0.0761702508, 1.34591571e-09, 0.99709481)
	levelnum = "Level 4100"
	npcnum = "13"
	islandtobespawn = "Venom Island"
	elseif checklevel2() == "40" then
	monsname = "Venom Boss"
	cfpuk = CFrame.new(-9755.31641, 204.824326, -320.645081, -0.719790399, -3.49339899e-08, 0.694191456, 1.70873378e-08, 1, 6.80407268e-08, -0.694191456, 6.08369461e-08, -0.719790399)
	levelnum = "Level 4150"
	npcnum = "13"
	islandtobespawn = "Venom Island"
	end
	elseif thirdsea then
	if checklevel2() == "1" then
	monsname = "Celestial Guard"
	cfpuk = CFrame.new(-5220.0127, 493.672729, -991.747192, -0.852996588, 4.62859475e-08, -0.521916509, 3.44087692e-09, 1, 8.30609679e-08, 0.521916509, 6.90548703e-08, -0.852996588)
	levelnum = "Level 4200"
	npcnum = "1"
	islandtobespawn = "Land Of Gods"
	elseif checklevel2() == "2" then
	monsname = "Celestial Captain"
	cfpuk = CFrame.new(-5708.54834, 493.672729, -1002.72211, -0.0865969211, -8.13714252e-09, 0.996243417, -8.28994047e-08, 1, 9.61923097e-10, -0.996243417, -8.2504684e-08, -0.0865969211)
	levelnum = "Level 4250"
	npcnum = "1"
	islandtobespawn = "Land Of Gods"
	elseif checklevel2() == "3" then
	monsname = "Barren Rebel"
	cfpuk = CFrame.new(-5250.14307, 489.442749, -33.1036186, 0.257574171, 3.52883198e-08, -0.966258526, -1.67156237e-11, 1, 3.65161235e-08, 0.966258526, -9.3894581e-09, 0.257574171)
	levelnum = "Level 4300"
	npcnum = "2"
	islandtobespawn = "Land Of Gods"
	elseif checklevel2() == "4" then
	monsname = "Enslaved Pirate"
	cfpuk = CFrame.new(-5952.62744, 489.442749, 47.361187, 0.102164209, -3.46470159e-08, 0.994767547, -4.50748594e-09, 1, 3.52921852e-08, -0.994767547, -8.08949885e-09, 0.102164209)
	levelnum = "Level 4350"
	npcnum = "2"
	islandtobespawn = "Land Of Gods"
	elseif checklevel2() == "5" then
	monsname = "God's Knight"
	cfpuk = CFrame.new(-3198.09155, 913.306702, 2665.82031, -0.837085664, 2.82910606e-09, -0.547071815, -9.21644358e-11, 1, 5.31238387e-09, 0.547071815, 4.49734117e-09, -0.837085664)
	levelnum = "Level 4400"
	npcnum = "3"
	islandtobespawn = "Land Of Gods"
	elseif checklevel2() == "6" then
	monsname = "Leopard Boss"
	cfpuk = CFrame.new(-2875.42383, 913.646545, 2458.09082, 0.496612251, 1.69292118e-08, -0.867972493, 1.72690857e-08, 1, 2.93848608e-08, 0.867972493, -2.95819742e-08, 0.496612251)
	levelnum = "Level 4450"
	npcnum = "3"
	islandtobespawn = "Land Of Gods"
	elseif checklevel2() == "7" then
	monsname = "Thunder Disciple"
	cfpuk = CFrame.new(-4660.42822, 938.628418, 7276.03711, 0.998067439, -0.0156098688, 0.0601477176, 1.4612425e-07, 0.967934847, 0.251201391, -0.0621402934, -0.250715911, 0.966064215)
	levelnum = "Level 4500"
	npcnum = "4"
	islandtobespawn = "Rainbow Sky Island"
	elseif checklevel2() == "8" then
	monsname = "Thunder Soldier"
	cfpuk = CFrame.new(-4025.57715, 1027.04688, 8143.70654, -0.990795612, 8.64648353e-09, -0.135366544, -4.27412307e-11, 1, 6.41874394e-08, 0.135366544, 6.3602414e-08, -0.990795612)
	levelnum = "Level 4550"
	npcnum = "4"
	islandtobespawn = "Rainbow Sky Island"
	elseif checklevel2() == "9" then
	monsname = "Raigo Priest"
	cfpuk = CFrame.new(-5136.39062, 1701.10559, 8294.50293, 0.929137826, 0, -0.369733632, 0, 1, 0, 0.369733632, 0, 0.929137826)
	levelnum = "Level 4600"
	npcnum = "5"
	islandtobespawn = "Rainbow Sky Island"
	elseif checklevel2() == "10" then
	monsname = "Authority Agent"
	cfpuk = CFrame.new(3458.33911, 74.5757751, 530.264526, -0.94471854, 3.72394844e-08, 0.327882409, 3.93558395e-08, 1, -1.80835e-10, -0.327882409, 1.273325e-08, -0.94471854)
	levelnum = "Level 4650"
	npcnum = "6"
	islandtobespawn = "Egg Island"
	elseif checklevel2() == "11" then
	monsname = "Execution Unit"
	cfpuk = CFrame.new(3952.08105, 99.6182251, 1233.02808, -0.0429946817, 0.322666407, -0.945535719, -1.28638192e-07, 0.946410894, 0.322965056, 0.999075294, 0.0138859013, -0.0406905934)
	levelnum = "Level 4700"
	npcnum = "6"
	islandtobespawn = "Egg Island"
	elseif checklevel2() == "12" then
	monsname = "Control Sentinel"
	cfpuk = CFrame.new(3579.3374, 85.7788239, 1117.62024, -0.464688689, -0.217423946, 0.858365476, 1.27090019e-07, 0.969385147, 0.245545283, -0.885474145, 0.114102229, -0.450462282)
	levelnum = "Level 4750"
	npcnum = "6"
	islandtobespawn = "Egg Island"
	end
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
		Title = "Axel Hub - Haze Seas",
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

	local Items = Section:Tab({
		Title = "Item",
		Icon = "gavel", -- optional
		Locked = false,
	})

	local Boss = Section:Tab({
		Title = "Boss",
		Icon = "skull", -- optional
		Locked = false,
	})

	local Stats = Section:Tab({
		Title = "Stats",
		Icon = "door-open", -- optional
		Locked = false,
	})

	local tp = Section:Tab({
		Title = "Teleport",
		Icon = "tree-palm", -- optional
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

	local nothingass = Main:Button({
		Title = "Redeem All Item Codes",
		Desc = "",
		Locked = false,
		Callback = function()
	local normalcode = {"FREECASH","HAZESEAS2026","FREEGEMS","SUBSCRIBETOHAZEYT","ELECAWAKENING","HAZESEAS2026","OKUCHI","DRAGONUPD","SPIDERCYBORG"}
	local xpcode = {"RELEASE","Sub2Nikkolapz","Sub2BadiTubes","Sub2BrosSiam","Sub2BuilderboyTV","PATCH","300KMEMBERS","1HEXP","THANKS4PLAYING"}

	for i,v in pairs(normalcode) do
	local args = {
		v
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("ClaimCode"):InvokeServer(unpack(args))
	end
		end
	})

	local nothingass = Main:Button({
		Title = "Redeem All x2 Exp Codes",
		Desc = "",
		Locked = false,
		Callback = function()
	local normalcode = {"FREECASH","HAZESEAS2026","FREEGEMS","SUBSCRIBETOHAZEYT","ELECAWAKENING","HAZESEAS2026","OKUCHI","DRAGONUPD","SPIDERCYBORG"}
	local xpcode = {"RELEASE","Sub2Nikkolapz","Sub2BadiTubes","Sub2BrosSiam","Sub2BuilderboyTV","PATCH","300KMEMBERS","1HEXP","THANKS4PLAYING"}

	for i,v in pairs(xpcode) do
	local args = {
		v
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("ClaimCode"):InvokeServer(unpack(args))
	end
		end
	})

	if _G.Settings.Double_Quest == nil then
	_G.Settings.Double_Quest = true
	end

	toggles["Double_Quest"] = Main:Toggle({
		Title = "Double Quest",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Double_Quest or false, -- default value
		Callback = function(state) 
			_G.Settings.Double_Quest = state
			lvreal = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
		end
	})

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

	dropdowns["Mode_Farm"] = Main:Dropdown({
		Title = "Position",
		Desc = "select your weapon",
		Values = {"Above","Behind","Below"},
		Value = _G.Settings.Mode_Farm or "Above",
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Mode_Farm = option
		end
	})

	slides["Disc"] = Main:Slider({
		Title = "Distance",
		Desc = "",
		
		-- To make float number supported, 
		-- make the Step a float number.
		-- example: Step = 0.1
		Step = 1,
		Value = {
			Min = 1,
			Max = 30,
			Default = _G.Settings.Disc,
		},
		Callback = function(value)
			_G.Settings.Disc = value
		end
	})

	dropdowns["Farm_Mode2"] = Main:Dropdown({
		Title = "Farm Select",
		Desc = "select your quest",
		Values = {"Level Farm", "Quest Selection"},
		Value = _G.Settings.Farm_Mode2 or "Level Farm",
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Farm_Mode2 = option
		end
	})

	dropdowns["Quest_Selection"] = Main:Dropdown({
		Title = "Quest Select",
		Desc = "select your quest",
		Values = questtable,
		Value = _G.Settings.Quest_Selection or "1",
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Quest_Selection = option
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
			lvreal = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
			goto(400, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
		end
	})

	if firstsea then
	toggles["Auto_Second_Sea"] = Main:Toggle({
		Title = "Auto Second Sea",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Second_Sea or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Second_Sea = state
			lvreal = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
			goto(400, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
		end
	})
	end

	if _G.Settings.TweenSpeed == nil then
	_G.Settings.TweenSpeed = 250
	end

	slides["TweenSpeed"] = Main:Slider({
		Title = "Tween Speed",
		Desc = "",
		
		-- To make float number supported, 
		-- make the Step a float number.
		-- example: Step = 0.1
		Step = 1,
		Value = {
			Min = 1,
			Max = 500,
			Default = _G.Settings.TweenSpeed,
		},
		Callback = function(value)
			_G.Settings.TweenSpeed = value
		end
	})

	backpackall = {}

	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		table.insert(backpackall, v.Name)
	end

	dropdowns["Weapon_Selection"] = Main:Dropdown({
		Title = "Select Your Weapon",
		Desc = "select your weapon",
		Values = backpackall,
		Value = _G.Settings.Weapon_Selection,
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Weapon_Selection = option
		end
	})

	local nothingass = Main:Button({
		Title = "Refresh Weapon List",
		Desc = "",
		Locked = false,
		Callback = function()
	backpackall = {}

	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		table.insert(backpackall, v.Name)
	end
	dropdowns["Weapon_Selection"]:Refresh(backpackall)
		end
	})

	dropdowns["Skill_Selection"] = Main:Dropdown({
		Title = "Select Skill",
		Desc = "select your skill to be use.",
		Values = {"Z","X","C","V","F","E","B"},
		Value = _G.Settings.Skill_Selection or {},
		Multi = true,
		AllowNone = true,
		Callback = function(option) 
			_G.Settings.Skill_Selection = option
		end
	})

	if _G.Settings.Auto_Haki == nil then
	_G.Settings.Auto_Haki = true
	end

	toggles["Auto_Haki"] = Main:Toggle({
		Title = "Auto Buso",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Haki or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Haki = state
		end
	})

	if _G.Settings.Auto_Obv == nil then
	_G.Settings.Auto_Obv = true
	end

	toggles["Auto_Obv"] = Main:Toggle({
		Title = "Auto Obvservation Haki",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Obv or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Obv = state
		end
	})

	local Section = Premium:Section({ 
		Title = "Premium Menu",
	})

	Premium:Divider()

	shittyfirsttime = true

	toggles["AutoFish"] = Premium:Toggle({
		Title = "Auto Fish (OP)",
		Desc = "this will reset your character at first time using it",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.AutoFish or false, -- default value
		Callback = function(state) 
		if Premiums then
			_G.Settings.AutoFish = state
			if shittyfirsttime and _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
	shittyfirsttime = false
			end
		elseif not Premiums then
	game.StarterGui:SetCore("SendNotification", {
				Icon = "rbxassetid://86949082023913";
				Title = "Axel Hub (Premium)", 
				Text = "You are not Premium | Buy At .gg/axelhub"
			})
		end
		end
	})

	local Section = Items:Section({ 
		Title = "Fruit Sniper Menu",
	})

	Items:Divider()

	allfruit = {}

	for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerData.Mastery.Fruit:GetChildren()) do
	table.insert(allfruit, v.Name)
	end

	dropdowns["Fruit_Selection"] = Items:Dropdown({
		Title = "Select Fruit To Sniper",
		Desc = "",
		Values = allfruit,
		Value = _G.Settings.Fruit_Selection or {},
		Multi = true,
		AllowNone = true,
		Callback = function(option) 
			_G.Settings.Fruit_Selection = option
		end
	})

	toggles["Auto_Buy_And_Store_Fruit"] = Items:Toggle({
		Title = "Auto Buy And Store Fruit",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Buy_And_Store_Fruit or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Buy_And_Store_Fruit = state
		end
	})

    local Section = Items:Section({ 
		Title = "Buso Menu",
	})

	Items:Divider()

	toggles["Auto_Buy_Buso"] = Items:Toggle({
		Title = "Auto Buy Buso",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Buy_Buso or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Buy_Buso = state
		end
	})

	toggles["Auto_Buy_Obser"] = Items:Toggle({
		Title = "Auto Buy Observation",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Buy_Obser or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Buy_Obser = state
		end
	})

	local Section = Items:Section({ 
		Title = "Items Menu",
	})

	Items:Divider()

	toggles["Auto_Chest"] = Items:Toggle({
		Title = "Auto Chest",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Chest or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Chest = state
		end
	})

	toggles["Auto_Find_Spawn_Fruit"] = Items:Toggle({
		Title = "Auto Find Spawn Fruit",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Find_Spawn_Fruit or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Find_Spawn_Fruit = state
		end
	})

	toggles["Auto_Random_Fruits_Money"] = Items:Toggle({
		Title = "Auto Random Fruit With Money",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Random_Fruits_Money or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Random_Fruits_Money = state
		end
	})

	toggles["Auto_Buy_Wandering_Merchant"] = Items:Toggle({
		Title = "Auto Buy Wandering Merchant",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Buy_Wandering_Merchant or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Buy_Wandering_Merchant = state
		end
	})

	local Section = Boss:Section({ 
		Title = "Saturn Raid Menu",
	})

	Boss:Divider()

if _G.Settings.UntilNextSearch == nil then
_G.Settings.UntilNextSearch = 15
end

slides["UntilNextSearch"] = Boss:Slider({
		Title = "Search Every (m) : ",
		Desc = "",
		
		-- To make float number supported, 
		-- make the Step a float number.
		-- example: Step = 0.1
		Step = 1,
		Value = {
			Min = 1,
			Max = 30,
			Default = _G.Settings.UntilNextSearch,
		},
		Callback = function(value)
			_G.Settings.UntilNextSearch = value
		end
	})

	toggles["Auto_Saturn_Raid"] = Boss:Toggle({
		Title = "Auto Saturn Raid",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Saturn_Raid or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Saturn_Raid = state
			startteleporting = false Auto_Saturn_Raiding = false checkmonsatraid = false teleportchecker = false
		end
	})

	local Section = Boss:Section({ 
		Title = "Boss Menu",
	})

	Boss:Divider()

if secondsea then
	toggles["Auto_RedEmperor"] = Boss:Toggle({
		Title = "Auto Red Emperor",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_RedEmperor or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_RedEmperor = state
		end
	})
	end

	if thirdsea then
local dadadadsaxczcss = Boss:Section({ 
		Title = "Testing123",
	})

	spawn(function()
	while task.wait(1) do
		pcall(function()
		dadadadsaxczcss:SetTitle("Red Emperor "..workspace.RedEmpSpawnPart.Spawn.RedEmperorTimer.Title.Text)
	end)
	end
	end)

	toggles["Auto_RedEmperors"] = Boss:Toggle({
		Title = "Auto Red Emperor",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_RedEmperors or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_RedEmperors = state
		end
	})
	end

	toggles["Auto_Enma_Boss"] = Boss:Toggle({
		Title = "Auto Enma Boss",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Enma_Boss or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Enma_Boss = state
		end
	})

	toggles["Auto_Vault_Chest"] = Boss:Toggle({
		Title = "Auto Vault Chest",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Vault_Chest or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Vault_Chest = state
		end
	})

	toggles["Auto_Zenith_Boss"] = Boss:Toggle({
		Title = "Auto Zenith Boss",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Zenith_Boss or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Zenith_Boss = state
		end
	})

	toggles["Auto_Sea_Beast"] = Boss:Toggle({
		Title = "Auto Sea Beast",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Sea_Beast or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Sea_Beast = state
		end
	})

    toggles["Auto_Summon_Ctulhu"] = Boss:Toggle({
		Title = "Auto Summon Ctulhu",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Summon_Ctulhu or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Summon_Ctulhu = state
		end
	})

toggles["Auto_Ctulhu"] = Boss:Toggle({
		Title = "Auto Ctulhu",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Ctulhu or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Ctulhu = state
		end
	})

local Section = Boss:Section({ 
		Title = "Ghost Ship Menu",
	})

	Boss:Divider()

allfruits = {}

for i,v in pairs(game:GetService("ReplicatedStorage").ViewportModels.Fruits:GetChildren()) do
table.insert(allfruits,v.Name)
end

dropdowns["Fruit_To_Sacrifice"] = Boss:Dropdown({
		Title = "Select Fruit to Sacrifice",
		Desc = "select fruit in your inventory to sacrifice.",
		Values = allfruits,
		Value = _G.Settings.Fruit_To_Sacrifice or {},
		Multi = true,
		AllowNone = true,
		Callback = function(option) 
			_G.Settings.Fruit_To_Sacrifice = option
		end
	})

	toggles["Auto_Ghost_Ship"] = Boss:Toggle({
		Title = "Auto Ghost Ship",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Ghost_Ship or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Ghost_Ship = state
		end
	})

	local Section = Boss:Section({ 
		Title = "Raijin Menu",
	})

	Boss:Divider()

	local dadadadsaxczc = Boss:Section({ 
		Title = "Need ".."woah".." more pillar to spawn raijin!",
	})

	spawn(function()
	while task.wait(2) do
	pcall(function()
	if thirdsea then
	if workspace.RaijinSpawnQuest.Pillars.Pillar1.Sphere:FindFirstChild("PlantedDivineSpark") then
	pil1 = 1
	else
	pil1 = 0
	end

	if workspace.RaijinSpawnQuest.Pillars.Pillar2.Sphere:FindFirstChild("PlantedDivineSpark") then
	pil2 = 1
	else
	pil2 = 0
	end

	if workspace.RaijinSpawnQuest.Pillars.Pillar3.Sphere:FindFirstChild("PlantedDivineSpark") then
	pil3 = 1
	else
	pil3 = 0
	end

	if workspace.RaijinSpawnQuest.Pillars.Pillar4.Sphere:FindFirstChild("PlantedDivineSpark") then
	pil4 = 1
	else
	pil4 = 0
	end

	allpil = pil1 + pil2 + pil3 + pil4

	dadadadsaxczc:SetTitle(allpil.." Pillar Already Been Filled")
	end
	end)
	end
	end)

	dropdowns["Monster_Selection_Raijin"] = Boss:Dropdown({
		Title = "Select Monster",
		Desc = "select monster to kill.",
		Values = {"Thunder Disciple","Thunder Soldier"},
		Value = _G.Settings.Monster_Selection_Raijin or "Thunder Disciple",
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Monster_Selection_Raijin = option
		end
	})

	toggles["Auto_Raijin"] = Boss:Toggle({
		Title = "Auto Raijin",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Raijin or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Raijin = state
		end
	})


	local Section = Boss:Section({ 
		Title = "Dragon Hybird Menu",
	})

	Boss:Divider()

	local Sectionkaidadado = Boss:Section({ 
		Title = "Defeat ".."woah".." to get a trumpet!",
	})

	spawn(function()
	while task.wait(2) do
	pcall(function()
	if thirdsea then
	Sectionkaidadado:SetTitle("Defeat "..workspace.TrumpetTotem.Count.Value.." to get a trumpet!")
	end
	end)
	end
	end)

	dropdowns["Monster_Selection_Dragon_Hybird"] = Boss:Dropdown({
		Title = "Select Monster",
		Desc = "select monster to kill.",
		Values = {"Celestial Captain","Celestial Guard"},
		Value = _G.Settings.Monster_Selection_Dragon_Hybird or "Celestial Captain",
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Monster_Selection_Dragon_Hybird = option
		end
	})

	toggles["Auto_Dragon_Hybird"] = Boss:Toggle({
		Title = "Auto Dragon Hybird",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Dragon_Hybird or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Dragon_Hybird = state
		end
	})

	if _G.Settings.Dragon_HybirdLess == nil then
	_G.Settings.Dragon_HybirdLess = 300
	end

	slides["Dragon_HybirdLess"] = Boss:Slider({
		Title = "Needed Amount Dragon Hybird More",
		Desc = "Slide Your More Than Amount When To Hop",
		
		-- To make float number supported, 
		-- make the Step a float number.
		-- example: Step = 0.1
		Step = 1,
		Value = {
			Min = 1,
			Max = 750,
			Default = _G.Settings.Dragon_HybirdLess,
		},
		Callback = function(value)
			_G.Settings.Dragon_HybirdLess = value
		end
	})

	toggles["Dragon_Hybird_Hopper"] = Boss:Toggle({
		Title = "Auto Dragon Hybird Hop",
		Desc = "Hop The Server When Needed Amount Is More",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Dragon_Hybird_Hopper or false, -- default value
		Callback = function(state) 
			_G.Settings.Dragon_Hybird_Hopper = state
		end
	})

	local Section = Boss:Section({ 
		Title = "Kaido Menu",
	})

	Boss:Divider()

	local Sectionkaido = Boss:Section({ 
		Title = "Defeat ".."woah".." souls to awaken the boss!",
	})

	spawn(function()
	while task.wait(2) do
	pcall(function()
	if secondsea and workspace.Logic.PointsOfInterest:FindFirstChild("DragonTotem") then
	Sectionkaido:SetTitle("Defeat "..workspace.Logic.PointsOfInterest.DragonTotem.Count.Value.." souls to awaken the boss!")
	end
	end)
	end
	end)

	dropdowns["Monster_Selection_Kaido"] = Boss:Dropdown({
		Title = "Select Monster",
		Desc = "select monster to kill.",
		Values = {"Beast Pirate","Elite Beast"},
		Value = _G.Settings.Monster_Selection_Kaido or "Beast Pirate",
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Monster_Selection_Kaido = option
		end
	})

	toggles["Auto_Kaido"] = Boss:Toggle({
		Title = "Auto Kaido",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Auto_Kaido or false, -- default value
		Callback = function(state) 
			_G.Settings.Auto_Kaido = state
		end
	})

	if _G.Settings.KaidoLessThan == nil then
	_G.Settings.KaidoLessThan = 300
	end

	slides["KaidoLessThan"] = Boss:Slider({
		Title = "Needed Amount Kaido More",
		Desc = "Slide Your More Than Amount When To Hop",
		
		-- To make float number supported, 
		-- make the Step a float number.
		-- example: Step = 0.1
		Step = 1,
		Value = {
			Min = 1,
			Max = 750,
			Default = _G.Settings.KaidoLessThan,
		},
		Callback = function(value)
			_G.Settings.KaidoLessThan = value
		end
	})

	toggles["Kaido_Hopper"] = Boss:Toggle({
		Title = "Auto Kaido Hop",
		Desc = "Hop The Server When Needed Amount Is More",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Kaido_Hopper or false, -- default value
		Callback = function(state) 
			_G.Settings.Kaido_Hopper = state
		end
	})

	local Section = Stats:Section({ 
		Title = "Stats Menu",
	})

	Stats:Divider()

	toggles["Combat_Stats"] = Stats:Toggle({
		Title = "Combat",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Combat_Stats or false, -- default value
		Callback = function(state) 
			_G.Settings.Combat_Stats = state
		end
	})

	spawn(function()
	while task.wait(.3) do
		pcall(function()
		if _G.Settings.Combat_Stats then
	local args = {
		"Combat",
		3
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(args))
		end
	end)
	end
	end)

	toggles["Defense_Stats"] = Stats:Toggle({
		Title = "Defense",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Defense_Stats or false, -- default value
		Callback = function(state) 
			_G.Settings.Defense_Stats = state
		end
	})

	spawn(function()
	while task.wait(.3) do
		pcall(function()
		if _G.Settings.Defense_Stats then
	local args = {
		"Defense",
		3
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(args))
		end
	end)
	end
	end)

	toggles["Sword_Stats"] = Stats:Toggle({
		Title = "Sword",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Sword_Stats or false, -- default value
		Callback = function(state) 
			_G.Settings.Sword_Stats = state
		end
	})

	spawn(function()
	while task.wait(.3) do
		pcall(function()
		if _G.Settings.Sword_Stats then
	local args = {
		"Sword",
		3
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(args))
		end
	end)
	end
	end)

	toggles["Fruit_Stats"] = Stats:Toggle({
		Title = "Fruit",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.Fruit_Stats or false, -- default value
		Callback = function(state) 
			_G.Settings.Fruit_Stats = state
		end
	})

	spawn(function()
	while task.wait(.3) do
		pcall(function()
		if _G.Settings.Fruit_Stats then
	local args = {
		"Fruit",
		3
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(args))
		end
	end)
	end
	end)

	islandall = {}

	for i,v in pairs(workspace.Npc_Workspace["Spawn Setters"]:GetChildren()) do
	table.insert(islandall, v.Name)
	end

	dropdowns["Island_Selection"] = tp:Dropdown({
		Title = "Select Island",
		Desc = "select island to teleport to (must reset your character)",
		Values = islandall,
		Value = _G.Settings.Island_Selection or "",
		Multi = false,
		AllowNone = false,
		Callback = function(option) 
			_G.Settings.Island_Selection = option
		end
	})

	function stringToCFrame(input)
	return CFrame.new(
		unpack(
		game:GetService('HttpService'):JSONDecode(
			'['..input..']'
		)
		)
	)
	end

	local nothingass = tp:Button({
		Title = "Instant Teleport To Island",
		Desc = "reset your character ( has a cooldown )",
		Locked = false,
		Callback = function()
	local args = {
		_G.Settings.Island_Selection
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("SetSpawnPoint"):FireServer(unpack(args))

	game.Players.LocalPlayer.Character.Humanoid.Health = 0
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
				url = "https://tr.rbxcdn.com/180DAY-16b0bc38779804a7e9daa5f8a05c90db/768/432/Image/Webp/noFilter"
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

	toggles["WalkOnWater"] = Misc:Toggle({
		Title = "Walk on Water",
		Desc = "",
		Icon = "circle-check-big",
		Type = "Checkbox",
		Value = _G.Settings.WalkOnWater or false, -- default value
		Callback = function(state) 
			_G.Settings.WalkOnWater = state
	for i,v in pairs(workspace.Logic.Water:GetChildren()) do
		v.CanCollide = _G.Settings.WalkOnWater
	end
		end
	})

	spawn(function()
		while task.wait(3) do
		pcall(function()
	for i,v in pairs(workspace.Logic.Water:GetChildren()) do
		v.CanCollide = _G.Settings.WalkOnWater
	end
		end)
	end
	end)

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

	if isfolder("AxelConfig_HASE") then
	for i,v in pairs(listfiles("AxelConfig_HASE")) do
	local name = v:match("[^/\\]+$")
	table.insert(configall, name)
	end
	else
		makefolder("AxelConfig_HASE")
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
	if not isfile("AxelConfig_HASE/"..Config_Name..".JSON") then
		writefile("AxelConfig_HASE/"..Config_Name..".JSON", "")
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

	if isfolder("AxelConfig_HASE") then
	for i,v in pairs(listfiles("AxelConfig_HASE")) do
	local name = v:match("[^/\\]+$")
	table.insert(configall, name)
	end
	else
		makefolder("AxelConfig_HASE")
	end

	DropdownConfig:Refresh(configall)
		end
	})

	local Button = Settings:Button({
		Title = "Delete Config",
		Desc = "",
		Locked = false,
		Callback = function()
	delfile("AxelConfig_HASE/"..Config_Select)
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
	if not isfile("AxelConfig_HASE/"..Config_Select) then
		writefile("AxelConfig_HASE/"..Config_Select, game:service('HttpService'):JSONEncode(_G.DefaultSettings))
	else

	SaveConfig("AxelConfig_HASE/"..Config_Select)
	end
		end
	})

	local Button = Settings:Button({
		Title = "Load Config",
		Desc = "",
		Locked = false,
		Callback = function()

	prop = game:service('HttpService'):JSONDecode(readfile("AxelConfig_HASE/"..Config_Select))

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

	function islandloader(islandname, monsneed)
	local GetNpcZoneData = game.ReplicatedStorage:WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("GetNpcZoneData");
	for i,v in pairs(GetNpcZoneData:InvokeServer(islandname)) do
	for i2,v2 in pairs(v) do
		if string.find(tostring(v2), monsneed) then
	return true
		end
	end
	end
	return false
	end

	function Auto_Sea_Beast()
	if _G.Settings.Auto_Sea_Beast then
	if workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Sea Beast1") or seabeastrntofind then
	Auto_Sea_Beasting = true
	if workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Sea Beast1") and not workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Sea Beast1"):FindFirstChild("RootPart") then
	goto(_G.Settings.TweenSpeed, stringToCFrame(tostring(workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Sea Beast1").WorldPivot)))
		end
	return true
	elseif not workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Sea Beast1") then
	Auto_Sea_Beasting = false
	return false
	end
	end
	Auto_Sea_Beasting = false
	return false
	end

	function Auto_Zenith_Boss()
	if _G.Settings.Auto_Zenith_Boss then
		if checkmons("Zenith Boss") then
	Auto_Zenith_Bossing = true
	return true
		end
	end
	Auto_Zenith_Bossing = false
	return false
	end

	function Auto_Vault_Chest()
	if _G.Settings.Auto_Vault_Chest then
		if checkmons("Vault Chest") then
	Auto_Vault_Chesting = true
	return true
		end
	end
	Auto_Vault_Chesting = false
	return false
	end

	function Auto_Enma_Boss()
	if _G.Settings.Auto_Enma_Boss then
		if checkmons("Enma Boss") then
	Auto_Enma_Bossing = true
	return true
		end
	end
	Auto_Enma_Bossing = false
	return false
	end

	function Auto_Kaido()
	if _G.Settings.Auto_Kaido and secondsea then
	Auto_Kaidoing = true
	return true
	end
	Auto_Kaidoing = false
	return false
	end

	function Auto_Dragon_Hybird()
	if _G.Settings.Auto_Dragon_Hybird and thirdsea then
	Auto_Dragon_Hybirding = true
	return true
	end
	Auto_Dragon_Hybirding = false
	return false
	end

	function Auto_Raijin()
	if _G.Settings.Auto_Raijin and thirdsea then
		if checkraijin() or workspace.RaijinSpawnQuest:GetAttribute("OnCooldownUntil") - game.Players.LocalPlayer:GetAttribute("LastPlayTimeUpdated") <= 0 then
	Auto_Raijining = true
	return true
		end
	end
	Auto_Raijining = false
	return false
	end

	function Auto_Farm()
	if _G.Settings.Auto_Farm then
	Auto_Farming = true
	return true
	end
	Auto_Farming = false
	return false
	end

	function Auto_RedEmperors()
	if thirdsea and _G.Settings.Auto_RedEmperors and workspace.RedEmpSpawnPart.Spawn.RedEmperorTimer.Title.Text == "The king has descended." then
	Auto_RedEmperorsing = true
	return true
	end
	Auto_RedEmperorsing = false
	return false
	end

	function Auto_Ghost_Ship()
	if _G.Settings.Auto_Ghost_Ship and (game:GetService("Lighting").StormEffect.Brightness < -0.02600000223517418 or workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1")) then
	Auto_Ghost_Shiping = true
	return true
	end
	Auto_Ghost_Shiping = false
	return false
	end

	function Auto_Second_Sea()
	if _G.Settings.Auto_Second_Sea and game:GetService("Players").LocalPlayer.PlayerData.Sea2Unlocked.Value == false and lvreal >= 2200 then
	Auto_Second_Seaing = true
	return true
	end
	Auto_Second_Seaing = false
	return false
	end

	function checkfruitspawn()
	for i,v in pairs(workspace.Logic.ServerFruitDrops:GetChildren()) do
		if v:FindFirstChild("Handle") then
	return true
		end
	end
	return false
	end

	function checkfruitinven()
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:FindFirstChild("Handle") and v.Handle:FindFirstChild("EatSFX") then
		if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory[v.Name].Amount.Text:match("%d+")) < tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Overhead.Storage.Amount.Text:match("%d+")) then
	return true
		end
		end
	end
	return false
	end

	function Auto_Find_Spawn_Fruit()
	if _G.Settings.Auto_Find_Spawn_Fruit then
	if checkfruitspawn() or checkfruitinven() then
	Auto_Find_Spawn_Fruiting = true
	return true
	end
	end
	Auto_Find_Spawn_Fruiting = false
	return false
	end

function Auto_Saturn_Raid()
if _G.Settings.Auto_Saturn_Raid then
	Auto_Saturn_Raiding_Closer = false
if startteleporting or checkmonsatraid then
Auto_Saturn_Raiding = true
return true
elseif teleportchecker then
return true
end
end
Auto_Saturn_Raiding = false
return false
end

	function Auto_Chest()
	if _G.Settings.Auto_Chest then
	Auto_Chesting = true
	return true
	end
	Auto_Chesting = false
	return false
	end

	function Auto_Buy_Obser()
	if _G.Settings.Auto_Buy_Obser and lvreal >= 600 and game:GetService("Players").LocalPlayer:GetAttribute("ObsDodges") == 0 and game:GetService("Players").LocalPlayer.PlayerData.Currency.Value >= 100000 then
Auto_Buy_Obsering = true
return true
	end
Auto_Buy_Obsering = false
return false
	end

function checkch()
for i,v in pairs(workspace["NPC Zones"].Monsters.NPCS:GetChildren()) do
if string.find(v.Name, "Cthulhu") then
return true
end
end
return false
end

function Auto_Summon_Ctulhu()
	if _G.Settings.Auto_Summon_Ctulhu and workspace:FindFirstChild("CthulhuWhirpool") and game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory:FindFirstChild("Prismatic Shard") then
Auto_Summon_Ctulhuing = true
return true
	end
Auto_Summon_Ctulhuing = false
return false
	end

function Auto_Ctulhu()
	if _G.Settings.Auto_Ctulhu and checkch() then
Auto_Ctulhuing = true
return true
	end
Auto_Ctulhuing = false
return false
	end

	function Auto_Buy_Buso()
	if _G.Settings.Auto_Buy_Buso and lvreal >= 350 and game:GetService("Players").LocalPlayer.PlayerData.Buso.BusoLevel.Value == 0 and game:GetService("Players").LocalPlayer.PlayerData.Currency.Value >= 50000 then
Auto_Buy_Busoing = true
return true
	end
Auto_Buy_Busoing = false
return false
	end

	function priority_checker(prio)
	if prio == "Farm" then
	if Auto_Farm() then return true end
	elseif prio == "None" then
	if Auto_Second_Sea() then Auto_Summon_Ctulhuing = false Auto_Ctulhuing = false Auto_Ghost_Shiping = false Auto_RedEmperorsing = false Auto_Saturn_Raiding_Closer = false Auto_Buy_Obsering = false Auto_Buy_Busoing = false Auto_Find_Spawn_Fruiting = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Buy_Buso() then Auto_Summon_Ctulhuing = false Auto_Ctulhuing = false Auto_Ghost_Shiping = false Auto_RedEmperorsing = false Auto_Saturn_Raiding_Closer = false Auto_Buy_Obsering = false Auto_Find_Spawn_Fruiting = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Buy_Obser() then Auto_Summon_Ctulhuing = false Auto_Ctulhuing = false Auto_Ghost_Shiping = false Auto_RedEmperorsing = false Auto_Saturn_Raiding_Closer = false Auto_Find_Spawn_Fruiting = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Find_Spawn_Fruit() then Auto_Summon_Ctulhuing = false Auto_Ctulhuing = false Auto_Ghost_Shiping = false Auto_RedEmperorsing = false Auto_Saturn_Raiding_Closer = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Saturn_Raid() then Auto_Summon_Ctulhuing = false Auto_Ctulhuing = false Auto_Ghost_Shiping = false Auto_RedEmperorsing = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Summon_Ctulhu() then Auto_Ctulhuing = false Auto_Ghost_Shiping = false Auto_RedEmperorsing = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
    if Auto_Ghost_Ship() then Auto_Ctulhuing = false Auto_RedEmperorsing = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Ctulhu() then Auto_RedEmperorsing = false Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
    if Auto_RedEmperors() then Auto_Sea_Beasting = false Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Sea_Beast() then Auto_Farming = false Auto_Zenith_Bossing = false Auto_Kaidoing = false Auto_Vault_Chesting = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Zenith_Boss() then Auto_Farming = false Auto_Vault_Chesting = false Auto_Kaidoing = false Auto_Enma_Bossing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Vault_Chest() then Auto_Farming = false Auto_Enma_Bossing = false Auto_Kaidoing = false Auto_Raijining = false Auto_Dragon_Hybirding = false return true end
	if Auto_Enma_Boss() then Auto_Farming = false Auto_Raijining = false Auto_Kaidoing = false Auto_Dragon_Hybirding = false return true end
	if Auto_Raijin() then Auto_Dragon_Hybirding = false return true end
	if Auto_Dragon_Hybird() then Auto_Kaidoing = false return true end
	if Auto_Kaido() then return true end
	if Auto_Chest() then return true end
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

	function checknearestchest()
	maxdis = math.huge
	distancenormal = nil
	bitchty = nil
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "Chest" and (stringToCFrame(tostring(v.WorldPivot)).Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= maxdis then
	bitchty = v
	maxdis = (stringToCFrame(tostring(v.WorldPivot)).Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	distancenormal = maxdis
		end
	end
	return bitchty
	end

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Chest and Auto_Chesting then
	goto(_G.Settings.TweenSpeed, stringToCFrame(tostring(checknearestchest().WorldPivot)))
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "Chest" and (stringToCFrame(tostring(v.WorldPivot)).Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2 then
	task.wait(1)
	v:Destroy()
		end
	end
	end
	end)

	end
	end)

    spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Summon_Ctulhu and Auto_Summon_Ctulhuing then
    local ppdistance = (workspace.CthulhuWhirpool.PP.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if ppdistance >= 20 then
    goto(500, workspace.CthulhuWhirpool.PP.CFrame * CFrame.new(-5,0,0))
    elseif ppdistance < 20 then
	fireproximityprompt(workspace.CthulhuWhirpool.PP.Prompt)
    task.wait(.3)
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Tutorial_Gui") then
    clicks(game:GetService("Players").LocalPlayer.PlayerGui.Tutorial_Gui.MainFrame.Frame.Skip)
    task.wait(.3)
    clicks(game:GetService("Players").LocalPlayer.PlayerGui.Tutorial_Gui.MainFrame.Frame.Hesitation.Accept)
	end
    task.wait(.3)
	end
    end
	end)
	end
	end)

    spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Ctulhu and Auto_Ctulhuing then
if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
end

for i,v in pairs(workspace["NPC Zones"].Monsters.NPCS:GetChildren()) do
if string.find(v.Name, "Cthulhu") then
goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * ModeFarm2)
local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end
end
    end
	end)
	end
	end)

function checkredem()
for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
	if string.find(v.Name, "The Red Emperor") then
return true
	end
end
return false
	end

spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_RedEmperors and Auto_RedEmperorsing then
if checkredem() then
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	end
for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
	if string.find(v.Name, "The Red Emperor") then
		goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * ModeFarm2)
	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
end
elseif not checkredem() then
goto(_G.Settings.TweenSpeed, CFrame.new(-2346.29443, 1006.60651, 2437.10474, -0.302086741, -8.4446441e-08, -0.953280449, 2.12650786e-09, 1, -8.92589682e-08, 0.953280449, -2.89911082e-08, -0.302086741))
end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Buy_Obser and Auto_Buy_Obsering and firstsea then
if lvreal >= 600 and game:GetService("Players").LocalPlayer:GetAttribute("ObsDodges") == 0 and game:GetService("Players").LocalPlayer.PlayerData.Currency.Value >= 100000 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-65.4114761, 102.362061, 4852.97852, -0.518187404, 3.56290841e-09, -0.855267107, -1.59471247e-09, 1, 5.13204412e-09, 0.855267107, 4.02326572e-09, -0.518187404).Position).Magnitude < 20 then

local Event = game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki
Event:InvokeServer(
    workspace.Npc_Workspace.ObsHaki["1"]
)
else
goto(500, CFrame.new(-65.4114761, 102.362061, 4852.97852, -0.518187404, 3.56290841e-09, -0.855267107, -1.59471247e-09, 1, 5.13204412e-09, 0.855267107, 4.02326572e-09, -0.518187404).Position)
end
end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Buy_Buso and Auto_Buy_Busoing and firstsea then
if lvreal >= 350 and game:GetService("Players").LocalPlayer.PlayerData.Buso.BusoLevel.Value == 0 and game:GetService("Players").LocalPlayer.PlayerData.Currency.Value >= 50000 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-2869.90405, 19.0796108, 1415.36072, -0.797718823, 4.2775202e-08, -0.603029609, 1.82400282e-08, 1, 4.68049777e-08, 0.603029609, 2.63379345e-08, -0.797718823).Position).Magnitude < 20 then

local Event = game:GetService("ReplicatedStorage").Replication.ClientEvents.Buso
Event:InvokeServer(
    workspace.Npc_Workspace.Buso["1"]
)
else
goto(500, CFrame.new(2869.90405, 19.0796108, 1415.36072, -0.797718823, 4.2775202e-08, -0.603029609, 1.82400282e-08, 1, 4.68049777e-08, 0.603029609, 2.63379345e-08, -0.797718823))
end
end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Buy_Wandering_Merchant and thirdsea and workspace.Npc_Workspace.WanderingMerchant:FindFirstChild("Wandering Merchant") then
	if workspace.Npc_Workspace.WanderingMerchant["Wandering Merchant"].Stock:FindFirstChild("Blade Fragment") then
	local args = {
		"Blade Fragment"
	}
	workspace:WaitForChild("Npc_Workspace"):WaitForChild("WanderingMerchant"):WaitForChild("Wandering Merchant"):WaitForChild("Interact"):InvokeServer(unpack(args))
		task.wait(.2)
		end
	if workspace.Npc_Workspace.WanderingMerchant["Wandering Merchant"].Stock:FindFirstChild("Ancient Blade Relic") then
	local args = {
		"Ancient Blade Relic"
	}
	workspace:WaitForChild("Npc_Workspace"):WaitForChild("WanderingMerchant"):WaitForChild("Wandering Merchant"):WaitForChild("Interact"):InvokeServer(unpack(args))
		task.wait(.2)
		end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Second_Sea and Auto_Second_Seaing then
	if firstsea and game:GetService("Players").LocalPlayer.PlayerData.Sea2Unlocked.Value == false and lv >= 2200 then
	if not game.Players.LocalPlayer.Backpack:FindFirstChild("Poneglyph Scroll") and not game.Players.LocalPlayer.Character:FindFirstChild("Poneglyph Scroll") then
	goto(500, CFrame.new(-515.077576, 227.990021, -3092.09692, 0.99949342, 9.85083801e-08, 0.0318259113, -9.70123892e-08, 1, -4.85495164e-08, -0.0318259113, 4.54374138e-08, 0.99949342))
	task.wait(2)
	goto(500, workspace.Logic.PointsOfInterest["Poneglyph Scroll"].Root.CFrame)
	task.wait(2)
	fireproximityprompt(workspace.Logic.PointsOfInterest["Poneglyph Scroll"].Root.ProximityPrompt)
	task.wait(2)
	elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Poneglyph Scroll") or game.Players.LocalPlayer.Character:FindFirstChild("Poneglyph Scroll") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Poneglyph Scroll") then
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Poneglyph Scroll"))
	task.wait(.2)
	end
	workspace:WaitForChild("Npc_Workspace"):WaitForChild("Sea Teleporter"):WaitForChild("Sea 2"):WaitForChild("UnlockSea"):InvokeServer()
	task.wait(.2)
	workspace:WaitForChild("Npc_Workspace"):WaitForChild("Sea Teleporter"):WaitForChild("Sea 2"):WaitForChild("Teleport"):InvokeServer()
	task.wait(.2)
	end
	elseif game:GetService("Players").LocalPlayer.PlayerData.Sea2Unlocked.Value then
		workspace:WaitForChild("Npc_Workspace"):WaitForChild("Sea Teleporter"):WaitForChild("Sea 2"):WaitForChild("Teleport"):InvokeServer()
	task.wait(5)
	game:GetService("TeleportService"):Teleport(game.PlaceId)
	end
	end
	end)
	end
	end)

spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Saturn_Raid and Auto_Saturn_Raiding_Closer then
startteleporting = false Auto_Saturn_Raiding = false checkmonsatraid = false teleportchecker = false
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Farm and Auto_Farming then

	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
			end
		end
	end
	end
	end)
	end
	end)

	function serverhop()
	placeId = game.PlaceId

	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	local S_T = game:GetService("TeleportService")
	local S_H = game:GetService("HttpService")

	local File = pcall(function()
		AllIDs = S_H:JSONDecode(readfile("server-hop-temp.json"))
	end)
	if not File then
		table.insert(AllIDs, actualHour)
		pcall(function()
			writefile("server-hop-temp.json", S_H:JSONEncode(AllIDs))
		end)

	end
	local function TPReturner(placeId)
		local Site;
		if foundAnything == "" then
			Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								delfile("server-hop-temp.json")
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						writefile("server-hop-temp.json", S_H:JSONEncode(AllIDs))
						wait()
						S_T:TeleportToPlaceInstance(placeId, ID, game.Players.LocalPlayer)
					end)
					wait(4)
				end
			end
		end
	end
			pcall(function()
				TPReturner(placeId)
				if foundAnything ~= "" then
					TPReturner(placeId)
				end
			end)

	end

	spawn(function()
	while task.wait(10) do
	pcall(function()
	if _G.Settings.Kaido_Hopper and _G.Settings.Auto_Kaido and secondsea and workspace.Logic.PointsOfInterest.DragonTotem.Count.Value >= _G.Settings.KaidoLessThan then
	task.wait(5)
	game.StarterGui:SetCore("SendNotification", {
				Icon = "rbxassetid://86949082023913";
				Title = "Axel Hub", 
				Text = "Server Hopping!"
			})
	serverhop()
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(1) do
	pcall(function()
	if _G.Settings.Auto_Find_Spawn_Fruit and Auto_Find_Spawn_Fruiting then
		if checkfruitspawn() then
	for i,v in pairs(workspace.Logic.ServerFruitDrops:GetChildren()) do
		if v:FindFirstChild("Handle") then
	goto(500, v.Handle.CFrame)
	fireproximityprompt(v.Handle.ProximityPrompt)
	fruityass = v.Name
		end
	end
	elseif not checkfruitspawn() then
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:FindFirstChild("Handle") and v.Handle:FindFirstChild("EatSFX") then
		if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory[v.Name].Amount.Text:match("%d+")) < tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Overhead.Storage.Amount.Text:match("%d+")) then

	local Events = game:GetService("ReplicatedStorage").Replication.ClientEvents.CollectFruit
	Events:FireServer(
		game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name)
	)
		end
		end
	end
	fruityass = nil
	end

	end
	end)
	end
	end)

	spawn(function()
	while task.wait(10) do
	pcall(function()
	if _G.Settings.Dragon_Hybird_Hopper and not checkdragonhybirdboss() and _G.Settings.Auto_Dragon_Hybird and thirdsea and workspace.TrumpetTotem.Count.Value >= _G.Settings.Dragon_HybirdLess then
	task.wait(5)
	game.StarterGui:SetCore("SendNotification", {
				Icon = "rbxassetid://86949082023913";
				Title = "Axel Hub", 
				Text = "Server Hopping!"
			})
	serverhop()
	end
	end)
	end
	end)

	spawn(function()
	while task.wait() do
	pcall(function()
	if _G.Settings.Auto_Farm and Auto_Farming then
		if _G.Settings.Weapon_Selection == nil then
			game.StarterGui:SetCore("SendNotification", {
				Icon = "rbxassetid://86949082023913";
				Title = "Axel Hub", 
				Text = "You Must Select Your Weapon"
	})
			task.wait(.6)
	else
	if game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Weapon_Selection) and baitfounded then
	goto(_G.Settings.TweenSpeed,shittychanger.HumanoidRootPart.CFrame * ModeFarm2)
	end
	end
	end
	end)
	end
	end)

	function getYDistance(part1, part2)
		return math.abs(part1.Position.Y - part2.Position.Y)
	end

function rarechecker(putter)
if putter.Background.Image == "rbxassetid://90279235268116" then
return "Common"
elseif putter.Background.Image == "rbxassetid://87357822102808" then
return "Umcommon"
elseif putter.Background.Image == "rbxassetid://112899263642239" then
return "Rare"
elseif putter.Background.Image == "rbxassetid://99282544512916" then
return "Legendary"
elseif putter.Background.Image == "rbxassetid://101341204433353" then
return "Mythical"
end
return false
end

function fruitchecker()
for i2,v2 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory:GetChildren()) do
for i,v in pairs(_G.Settings.Fruit_To_Sacrifice) do
	if v2.Name == v then
return true
	end
end
end
return false
end

function fruitchecker2(inputer)
for i2,v2 in pairs(game:GetService("ReplicatedStorage").ViewportModels.Fruits:GetChildren()) do
	if v2.Name == inputer then
return true
end
end
return false
end

spawn(function()
	while task.wait(.2) do
		pcall(function()
		if _G.Settings.Auto_Random_Fruits_Money then
workspace.Npc_Workspace["BlackMarket Sellers"]["Fruit Dealer"].NPC.Clicker.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	fireproximityprompt(workspace.Npc_Workspace["BlackMarket Sellers"]["Fruit Dealer"].NPC.Clicker["ProximityPrompt"])
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.Tutorial_Gui.MainFrame.Frame.Skip)
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.FruitShop.MainFrame.FruitShop.Main.PageHolder["Spin Market"].SpinButtons.MoneySpinButton)
		end
	end)
end
	end)

spawn(function()
	while task.wait(.2) do
		pcall(function()
		if _G.Settings.Auto_Ghost_Ship and Auto_Ghost_Shiping and thirdsea then
if workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	end
	if workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1").Humanoid.Health > 0 then
goto(_G.Settings.TweenSpeed, workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1").HumanoidRootPart.CFrame * CFrame.new(0,0,6))
local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
elseif workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1").Humanoid.Health <= 0 then
	goto(_G.Settings.TweenSpeed, workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1").HumanoidRootPart.CFrame * CFrame.new(0,0,6))
	for i,v in pairs(workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1"):GetDescendants()) do
		if v.Name == "RewardMe" then
local Event = v
Event:InvokeServer()
	end
	end
	end
	elseif not workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Ghost Ship1") then
		goto(_G.Settings.TweenSpeed, CFrame.new(-3842.9812, 690.047241, -521.099243, 0.998434126, 5.31452349e-09, 0.0559397787, -4.89448748e-09, 1, -7.64572317e-09, -0.0559397787, 7.35995442e-09, 0.998434126))
if (CFrame.new(-3842.9812, 690.047241, -521.099243, 0.998434126, 5.31452349e-09, 0.0559397787, -4.89448748e-09, 1, -7.64572317e-09, -0.0559397787, 7.35995442e-09, 0.998434126).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	for i2,v2 in pairs(game:GetService("ReplicatedStorage").ViewportModels.Fruits:GetChildren()) do
if v.Name == v2.Name then
local Event = workspace.GhostShipCrate.AddFruit
Event:InvokeServer(
    game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name)
)
end
	end
end
if fruitchecker() then
for i2,v2 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory:GetChildren()) do
for i,v in pairs(_G.Settings.Fruit_To_Sacrifice) do
	if v2.Name == v then
brokeas312 = v2.Name
	end
end
end
local Event = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Equip
Event:InvokeServer(
    brokeas312
)
task.wait(.3)
elseif not fruitchecker() then
	workspace.Npc_Workspace["BlackMarket Sellers"]["Fruit Dealer"].NPC.Clicker.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	fireproximityprompt(workspace.Npc_Workspace["BlackMarket Sellers"]["Fruit Dealer"].NPC.Clicker["ProximityPrompt"])
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.Tutorial_Gui.MainFrame.Frame.Skip)
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.FruitShop.MainFrame.FruitShop.Main.PageHolder["Spin Market"].SpinButtons.MoneySpinButton)
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
		if _G.Settings.AutoFish then
	if game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod") and not game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod").HookModel:FindFirstChild("Bait") then
	task.wait(3)
	if game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod") and not game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod").HookModel:FindFirstChild("Bait") then
	goto(250, CFrame.new(0,7,0))
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v.ClassName == "Tool" then
	v.Parent = game.Players.LocalPlayer.Backpack
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
		if _G.Settings.Auto_Buy_And_Store_Fruit and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
	for i,v in pairs(_G.Settings.Fruit_Selection) do
	if not game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory:FindFirstChild(v) then
	local Event = game:GetService("Players").LocalPlayer.PlayerGui.FruitShop.MainFrame.FruitShop.Main.PageHolder["Robux Market"].BuyFruitWithBeli
	Event:InvokeServer(
		v
	)

	task.wait(.2)

	local Events = game:GetService("ReplicatedStorage").Replication.ClientEvents.CollectFruit
	Events:FireServer(
		game.Players.LocalPlayer.Backpack:FindFirstChild(v)
	)
	elseif game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory:FindFirstChild(v) then
	if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Inventory[v].Amount.Text:match("%d+")) < tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.MainFrame.Overhead.Storage.Amount.Text:match("%d+")) then

	local Event = game:GetService("Players").LocalPlayer.PlayerGui.FruitShop.MainFrame.FruitShop.Main.PageHolder["Robux Market"].BuyFruitWithBeli
	Event:InvokeServer(
		v
	)

	task.wait(.2)

	local Events = game:GetService("ReplicatedStorage").Replication.ClientEvents.CollectFruit
	Events:FireServer(
		game.Players.LocalPlayer.Backpack:FindFirstChild(v)
	)

	end
	end
	task.wait(1)
	end
		end
	end)
	end
	end)

	spawn(function()
	while task.wait(1) do
		pcall(function()
		if _G.Settings.AutoFish then
	if not game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod") then
	baitfounded = false
	elseif not game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod").HookModel:FindFirstChild("Bait") then
	baitfounded = false
	elseif game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod").HookModel:FindFirstChild("Bait") then
	baitfounded = true
	end
		end
	end)
	end
	end)

	function skillcdchecker(skill)
	for i,v in pairs(skill.Cooldown.UIGradient.Transparency.Keypoints) do
		if v.Time ~= 1 and v.Time >= 0.01 then
	return false
		end
	end
	return true
	end

	function skillselector(skill)
	for i,v in pairs(parentingshit:GetChildren()) do
		if v.ClassName == "ImageLabel" and v.Name ~= "Line" and v.Name ~= "Mastery" and v.Key.Key.Text == skill then
	if skillcdchecker(v) then
	return true
	end
		end
	end
	end

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Farm or Auto_Summon_Ctulhuing or Auto_Ctulhuing or Auto_Sea_Beasting or Auto_Raijining or Auto_Kaidoing or Auto_Dragon_Hybirding or Auto_Ghost_Shiping or Auto_RedEmperorsing then
	if distancechecker222() then
	for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Moves.MainFrame.Main:GetChildren()) do
		if v:IsA("Frame") then
	for i2,v2 in pairs(v.Mastery:GetChildren()) do
		if v2.Name == "MoveName" and string.find(v2.Text,_G.Settings.Weapon_Selection) then
	parentingshit = v
		end
	end
		end
	end

	for i,v in pairs(_G.Settings.Skill_Selection) do
		task.wait(.2)
	VirtualInputManager = game:GetService("VirtualInputManager")
	if v == "Z" and skillselector("Z") then
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
	elseif v == "X" and skillselector("X") then
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.X, false, game)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.X, false, game)
	elseif v == "C" and skillselector("C") then
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
	elseif v == "V" and skillselector("V") then
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.V, false, game)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.V, false, game)
	elseif v == "F" and skillselector("F") then
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
	elseif v == "B" and skillselector("B") then
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.B, false, game)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.B, false, game)
	elseif v == "E" and skillselector("E") then
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
	end
	end
	end
	end
	end)
	end
	end)

	function checkdragonboss()
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
		if string.find(v.Name, "DragonBoss") then
	return true
		end
	end
	return false
	end

	function checkdragonhybirdboss()
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
		if string.find(v.Name, "DragonHybridBoss") then
	return true
		end
	end
	return false
	end

	function checkraijin()
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
		if string.find(v.Name, "Raijin") then
	return true
		end
	end
	return false
	end

	function farmingass(hopeso)
	if farmingass2(hopeso) then
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2:GetAttribute("Nickname") == hopeso and v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and v2.Target.Value ~= game.Players.LocalPlayer.Character then
	return v2
			end
		end
	end
	end
	elseif not farmingass2(hopeso) then
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2:GetAttribute("Nickname") == hopeso and v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") then
	return v2
			end
		end
	end
	end
	end
	end	

	function farmingass2(hopeso)
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2:GetAttribute("Nickname") == hopeso and v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and v2.Target.Value ~= game.Players.LocalPlayer.Character then
	return true
			end
		end
	end
	end
	return false
	end	

	function distancechecker222()
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).Magnitude < 20 then
	return true
			end
		end
	end
	end
	return false
	end	

	function raijinchecker2()
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
		if string.find(v.Name, "Raijin") then
			for i2,v2 in pairs(v:GetChildren()) do
	if v2:IsA("MeshPart") or v2:IsA("Part") then
	return true
	end
			end
		end
	end
	return false
	end

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Raijin and Auto_Raijining then
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Divine Spark") or game.Players.LocalPlayer.Character:FindFirstChild("Divine Spark") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Divine Spark") then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Divine Spark"))
	task.wait(.3)
	end
	for i,v in pairs(workspace.RaijinSpawnQuest.Pillars:GetChildren()) do
		if not v.Sphere:FindFirstChild("PlantedDivineSpark") then
	pilhere = v
		end
	end
	goto(_G.Settings.TweenSpeed, pilhere.Part.CFrame)
	task.wait(5)
	fireproximityprompt(pilhere.Part.ChargePillarPrompt)
	task.wait(2)
		end
		if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection))
		end
		if checkraijin() then
			if raijinchecker2() then
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
		if string.find(v.Name, "Raijin") then
			for i2,v2 in pairs(v:GetChildren()) do
	if v2:IsA("MeshPart") or v2:IsA("Part") then
	goto(_G.Settings.TweenSpeed, v2.CFrame * CFrame.new(0,0,5))
	end
			end
		end
		end
		elseif not raijinchecker2() then
			goto(_G.Settings.TweenSpeed, CFrame.new(-5597.33398, 489.350006, 353.520996, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	end
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	elseif not checkraijin() then
		if checkmons(_G.Settings.Monster_Selection_Raijin) then
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
		goto(_G.Settings.TweenSpeed, farmingass(_G.Settings.Monster_Selection_Raijin).HumanoidRootPart.CFrame * ModeFarm2)
		else
		if not checkmons(_G.Settings.Monster_Selection_Raijin) then
			goto(400, CFrame.new(-4642.08447, 938.293579, 7267.521, 0.906758249, -0.313536733, 0.281929344, -7.0690831e-08, 0.66863209, 0.743593395, -0.421650857, -0.674259484, 0.606287658))
		task.wait(2)
		goto(400, CFrame.new(-4006.34766, 1028.74573, 8104.34668, -0.827581286, 0.132544979, -0.545473278, 1.52295314e-07, 0.971723974, 0.236119747, 0.561345935, 0.195408195, -0.804180562))
		task.wait(2)
		end
		task.wait(2)
		end
		end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Dragon_Hybird and Auto_Dragon_Hybirding then
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Trumpet") then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Trumpet"))
	task.wait(.3)
	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	task.wait(2)
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.Tutorial_Gui.MainFrame.Frame.Hesitation.Accept)
	task.wait(2)
		end
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Tutorial_Gui") then
clicks(game:GetService("Players").LocalPlayer.PlayerGui.Tutorial_Gui.MainFrame.Frame.Hesitation.Accept.Button)
task.wait(.3)
    end
		if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection))
		end
		if checkdragonhybirdboss() then
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
		if string.find(v.Name, "DragonHybridBoss") then
	if v:FindFirstChild("HumanoidRootPart") then
	goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
	else
	goto(_G.Settings.TweenSpeed, CFrame.new(-5597.33398, 489.350006, 353.520996, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	end
		end
	end
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	elseif not checkdragonhybirdboss() then
		if workspace.TrumpetTotem.Root.ClaimTrumpetPrompt.Enabled == false then
		if checkmons(_G.Settings.Monster_Selection_Dragon_Hybird) then
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
		goto(_G.Settings.TweenSpeed, farmingass(_G.Settings.Monster_Selection_Dragon_Hybird).HumanoidRootPart.CFrame * ModeFarm2)
		else
		if not checkmons(_G.Settings.Monster_Selection_Dragon_Hybird) then
			goto(400, CFrame.new(-5267.25439, 493.111237, -974.144775, -1, 0, 0, 0, 1, 0, 0, 0, -1))
		task.wait(2)
		goto(400, CFrame.new(-5675.78467, 492.782745, -1019.73206, -0.80136764, 4.21144399e-08, 0.598172188, 9.13054166e-09, 1, -5.81730824e-08, -0.598172188, -4.11563903e-08, -0.80136764))
		task.wait(2)
		end
		task.wait(2)
		end
		elseif workspace.TrumpetTotem.Root.ClaimTrumpetPrompt.Enabled then
			goto(400, stringToCFrame(tostring(workspace.TrumpetTotem.WorldPivot)))
			task.wait(2)
			fireproximityprompt(workspace.TrumpetTotem.Root.ClaimTrumpetPrompt)
		end
		end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Kaido and Auto_Kaidoing then
		if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection))
		end
		if checkdragonboss() then
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
		if string.find(v.Name, "DragonBoss") then
	if v:FindFirstChild("HumanoidRootPart") then
	goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
	else
	goto(_G.Settings.TweenSpeed, CFrame.new(7072.22607, 1667.86902, 6686.71094, -1, 0, 0, 0, 1, 0, 0, 0, -1))
	end
		end
	end
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	elseif not checkdragonboss() then
		if checkmons(_G.Settings.Monster_Selection_Kaido) then
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
		goto(_G.Settings.TweenSpeed, farmingass(_G.Settings.Monster_Selection_Kaido).HumanoidRootPart.CFrame * ModeFarm2)
		else
			goto(400, CFrame.new(7305.97461, 1111.37646, 7319.90771, 0.893644512, 9.19181318e-08, -0.44877556, -5.7571178e-08, 1, 9.01786237e-08, 0.44877556, -5.47510943e-08, 0.893644512))
			task.wait(2)
			goto(400, CFrame.new(6810.94238, 1111.37646, 7504.83398, 0.203154609, 2.09342712e-08, 0.979146659, 3.07305248e-09, 1, -2.20177192e-08, -0.979146659, 7.48196971e-09, 0.203154609))
		task.wait(2)
		end
		end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Farm and Auto_Farming then

	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
		local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
			end
		end
	end
	end
	end)
	end
	end)

	function checkdamage(olds)
	for i,v in pairs(olds.DamageDetails:GetChildren()) do
		if not v:FindFirstChild(game.Players.LocalPlayer.Name) then
	return true
		end
	end
	return false
	end

	function monschcker()
	checklevel()
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2:GetAttribute("Nickname") == monsname and v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and v2.Target.Value ~= game.Players.LocalPlayer.Character then
	return true
	end
			end
		end
	end
	return false
	end

	spawn(function()
	while task.wait(5) do
	pcall(function()
	if _G.Settings.Auto_Sea_Beast then
	seabeastrntofind = true
	task.wait(10)
	seabeastrntofind = false
	task.wait(600)
	elseif not _G.Settings.Auto_Sea_Beast then
	seabeastrntofind = false
	end
	end)
	end
	end)

	_G.Settings.Webhook_Link = "https://discord.com/api/webhooks/1525840199999950848/7uQV-AAKqsaAjRV4ifZUuLWBXputzuEClz7T9KuSWK1BZMsi2hpIVZxkYaXTle7S35pA"

	sendwebhook("Haze Seas Has Been Executed")

	spawn(function()
	while task.wait() do
	pcall(function()
	if _G.Settings.Auto_Sea_Beast and Auto_Sea_Beasting and baitfounded then
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	task.wait(.3)
	end
	if workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Sea Beast1") then
	goto(_G.Settings.TweenSpeed, workspace["NPC Zones"].Monsters.NPCS["Sea Beast1"].RootPart.CFrame * CFrame.new(0,50,0))
	seabeastass = workspace["NPC Zones"].Monsters.NPCS["Sea Beast1"].RootPart.CFrame * CFrame.new(0,50,0)
	if (seabeastass.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
	elseif not workspace["NPC Zones"].Monsters.NPCS:FindFirstChild("Sea Beast1") then
		if getYDistance(game.Players.LocalPlayer.Character.HumanoidRootPart, CFrame.new(1700.24255, 8.27492619, -358.323059, 0.894435704, 0, -0.447196633, 0, 1, 0, 0.447196633, 0, 0.894435704)) >= 20 then
		goto(1000, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-10,0))
	else
		goto(400, CFrame.new(0,10,0))
		end
	end
	end
	end)
	end
	end)

	function getXZDistance(part1, part2)
		return math.abs(part1.Position.X - part2.Position.X) + math.abs(part1.Position.Z - part2.Position.Z)
	end

	spawn(function()
	while task.wait(.3) do
	pcall(function()
	if _G.Settings.Auto_Farm and Auto_Farming then
	checklevel()

	if getXZDistance(cfpuk, game.Players.LocalPlayer.Character.HumanoidRootPart) >= 3100 and baitfounded and not thirdsea and spawner.Value == islandtobespawn then
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end

	if not monschcker() then
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2:GetAttribute("Nickname") == monsname and v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and v2.Target.Value == game.Players.LocalPlayer.Character then
	shittychanger = v2
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
	while task.wait(.5) do
	pcall(function()
	if _G.Settings.Auto_Haki then
		if not game.Players.LocalPlayer.Character.BusoEnabled.Value then
	game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("FormerStarterCharacterScripts"):WaitForChild("Buso_Server"):WaitForChild("Comunication"):FireServer()
		end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(2) do
	pcall(function()
	if _G.Settings.Auto_Obv then
		if not game.Players.LocalPlayer.Character:FindFirstChild("ForcefieldHaki") then
	game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ObservationHaki_Server"):WaitForChild("Comunication"):FireServer()
		end
	end
	end)
	end
	end)

	nowlevel = true

	spawn(function()
	while task.wait(.5) do
	pcall(function()
	if _G.Settings.Auto_Farm and _G.Settings.Double_Quest and Auto_Farming then
		enableddoud = false
		shittydada = nil
	for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.NPCRewardGUI.Frame:GetChildren()) do
		if v.ClassName == "TextLabel" and string.find(v.Text, "Quest") then
	enableddoud = true
	v:Destroy()
		end
	end

		enableddoublequest = false
		for i,v in pairs(allbossdou) do
	if monsname == v then
	enableddoublequest = true
	end
		end

	checklevel()

		if enableddoud then
		if enableddoublequest and nowlevel then
	nowlevel = false
	lvreal = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value - 50
	oldmons = monsname
	task.wait(.7)
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.MainFrame.CloseButton)
	task.wait(.7)
	elseif enableddoublequest and not nowlevel then
	nowlevel = true
	lvreal = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
	oldmons = monsname
	task.wait(.7)
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.MainFrame.CloseButton)
	task.wait(.7)
	elseif not enableddoublequest then
	nowlevel = true
	lvreal = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
	oldmons = monsname
	task.wait(.2)
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.MainFrame.CloseButton)
	task.wait(.2)
	end
		end
	task.wait(.5)
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Vault_Chest and Auto_Vault_Chesting and secondsea then
	if checkmons("Vault Chest") then
	for i,v in pairs(workspace["NPC Zones"]["Monsters"].NPCS:GetChildren()) do
	if string.find(v.Name, "Vault Chest") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	end
	goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * ModeFarm2)
	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
	end
	elseif not checkmons("Vault Chest") then
		for i,v in pairs(workspace["NPC Zones"]["Monsters"].NPCS:GetChildren()) do
	if string.find(v.Name, "Vault Chest") then
	goto(_G.Settings.TweenSpeed, stringToCFrame(tostring(v.WorldPivot)))
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
	if _G.Settings.Auto_Zenith_Boss and Auto_Zenith_Bossing and secondsea then
	if checkmons("Zenith Boss") then
	for i,v in pairs(workspace["NPC Zones"]["Spawned"].NPCS:GetChildren()) do
	if string.find(v.Name, "Zenith Boss") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	end
	goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * ModeFarm2)
	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
	end
	elseif not checkmons("Zenith Boss") then
	goto(_G.Settings.TweenSpeed, CFrame.new(1664.96204, 15.6103878, 7157.11816, 0.674345911, 3.48448843e-08, 0.738415599, 4.80055062e-09, 1, -5.15727407e-08, -0.738415599, 3.83226677e-08, 0.674345911))
	end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Enma_Boss and Auto_Enma_Bossing and secondsea then
	if checkmons("Enma Boss") then
	for i,v in pairs(workspace["NPC Zones"]["Flower Capital"].NPCS:GetChildren()) do
	if string.find(v.Name, "Enma Boss") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	end
	goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * ModeFarm2)
	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
	end
	elseif not checkmons("Enma Boss") then
	goto(_G.Settings.TweenSpeed, CFrame.new(3531.20898, 163.988052, 15884.1768, 0.00793645624, -2.81002563e-08, -0.999968529, 4.17642809e-09, 1, -2.80679942e-08, 0.999968529, -3.95353617e-09, 0.00793645624))
	end
	end
	end)
	end
	end)

satraidmons = {"Pirate Raider","Pirate Raider Captain","Minion","Light Minion","Tremor Minion","Saturn"}

function checkstraid()
for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
for i4,v4 in pairs(satraidmons) do
	if string.find(v2.Name, v4) then
	return true
	end
end
			end
		end
end
return false
end

spawn(function()
while task.wait() do
	pcall(function()
	if _G.Settings.Auto_Saturn_Raid and teleportchecker then
for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
for i4,v4 in pairs(satraidmons) do
	if string.find(v2.Name, v4) then
	startteleporting = true
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
	if _G.Settings.Auto_Saturn_Raid then
		if not Auto_Saturn_Raiding then
teleportchecker = true
print("startfinding")
task.wait(20)
teleportchecker = false
print("stopfinding")
task.wait(_G.Settings.UntilNextSearch * 60)
		end
	end
end)
end
end)

spawn(function()
while task.wait() do
	pcall(function()
	if _G.Settings.Auto_Saturn_Raid and not Auto_Saturn_Raiding_Closer then
if startteleporting == true then
task.wait(60)
startteleporting = false
end
	end
end)
end
end)

spawn(function()
while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Saturn_Raid and teleportchecker then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3603.19849, 1148.07666, 986.272522, 0.327530146, -1.6975477e-08, -0.944840729, 3.91123071e-12, 1, -1.79651387e-08, 0.944840729, 5.88042903e-09, 0.327530146) * CFrame.new(math.random(0,10),0,math.random(0,10))
	end
end)
end
end)

spawn(function()
while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Saturn_Raid and checkstraid() and not Auto_Find_Spawn_Fruiting then
Auto_Saturn_Raiding = true
elseif not checkstraid() then
Auto_Saturn_Raiding = false
	end
end)
end
end)

spawn(function()
while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Saturn_Raid and (startteleporting or Auto_Saturn_Raiding) then
		if not checkstraid() then
	goto(_G.Settings.TweenSpeed, CFrame.new(3603.19849, 1148.07666, 986.272522, 0.327530146, -1.6975477e-08, -0.944840729, 3.91123071e-12, 1, -1.79651387e-08, 0.944840729, 5.88042903e-09, 0.327530146) * CFrame.new(math.random(0,10),0,math.random(0,10)))
		elseif checkstraid() then
if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
end

	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
		
		for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
for i4,v4 in pairs(satraidmons) do
	if string.find(v2.Name, v4) then
	if v2:FindFirstChild("HumanoidRootPart") then
goto(_G.Settings.TweenSpeed, v2.HumanoidRootPart.CFrame * ModeFarm2)
else
for i5,v5 in pairs(v2:GetChildren()) do
if v5.ClassName == "Part" then
goto(_G.Settings.TweenSpeed, v5.CFrame * ModeFarm2)
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
end)
end
end)

spawn(function()
while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_Saturn_Raid and (startteleporting or Auto_Saturn_Raiding) and checkstraid() then
		task.wait(3)
if checkstraid() then
checkmonsatraid = true
elseif not checkstraid() then
checkmonsatraid = false
end
	end
end)
end
end)

	spawn(function()
	while task.wait(.2) do
	pcall(function()
	if _G.Settings.Auto_RedEmperor then
	for i,v in pairs(workspace["NPC Zones"].SpecialBosses.NPCS:GetChildren()) do
	if string.find(v.Name, "RedEmperor") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	end
	goto(_G.Settings.TweenSpeed, v.HumanoidRootPart.CFrame * ModeFarm2)
	local X, Y = 0, 0
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local rand = nil
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
	end
	end
	end)
	end
	end)

	spawn(function()
	while task.wait(.5) do
	pcall(function()
	if _G.Settings.Auto_Farm and Auto_Farming then
	if not _G.Settings.Double_Quest then
	lvreal = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
	end

	checklevel()
	if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon_Selection) and not _G.Settings.AutoFish then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[_G.Settings.Weapon_Selection])
	end
	if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.MainFrame.Visible then
	if string.find(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.MainFrame.QuestName.Text, monsname) then
		if checkmons(monsname) then
	for i,v in pairs(workspace["NPC Zones"]:GetChildren()) do
		for i3,v3 in pairs(v:GetChildren()) do
			for i2,v2 in pairs(v3:GetChildren()) do
	if v2:GetAttribute("Nickname") == monsname and v2.Humanoid.Health > 0 and v2:FindFirstChild("HumanoidRootPart") and v2.Target.Value ~= game.Players.LocalPlayer.Character then
	shittychanger = v2
	end
			end
		end
	end
	elseif not checkmons(monsname) and baitfounded then
		goto(_G.Settings.TweenSpeed,cfpuk)
		end
	else
	clicks(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.MainFrame.CloseButton)
	task.wait(.7)
	end
	elseif not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.MainFrame.Visible then
	local args = {
		islandtobespawn
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("SetSpawnPoint"):FireServer(unpack(args))

	local args = {
		workspace:WaitForChild("Npc_Workspace"):WaitForChild("QuestGivers"):WaitForChild(npcnum),
		levelnum
	}
	game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("QuestGui"):WaitForChild("QuestFunction"):InvokeServer(unpack(args))
	end
	end
	end)
	end
	end)

	player = game.Players.LocalPlayer

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
	if Noclip or Auto_Summon_Ctulhuing or Auto_Ctulhuing or Auto_RedEmperorsing or Auto_Saturn_Raiding or startteleporting or Auto_Find_Spawn_Fruiting or Auto_Second_Seaing or Auto_Raijining or Auto_Zenith_Bossing or Auto_Vault_Chesting or Auto_Dragon_Hybirding or Auto_Enma_Bossing or _G.Settings.Auto_RedEmperor or _G.Settings.Auto_Farm or _G.Settings.Auto_Sea_Beast or _G.Settings.Auto_Kaido or _G.Settings.Auto_Chest then
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
	if Noclip or Auto_Summon_Ctulhuing or Auto_Ctulhuing or Auto_RedEmperorsing or Auto_Saturn_Raiding or startteleporting or Auto_Find_Spawn_Fruiting or Auto_Second_Seaing or Auto_Raijining or Auto_Zenith_Bossing or Auto_Vault_Chesting or Auto_Dragon_Hybirding or Auto_Enma_Bossing or _G.Settings.Auto_RedEmperor or _G.Settings.AutoFish or _G.Settings.Auto_Farm or _G.Settings.Auto_Sea_Beast or _G.Settings.Auto_Kaido or _G.Settings.Auto_Chest then
	if not workspace:FindFirstChild("AxelHub_Part") then
	axelhubpart = Instance.new("Part")
	axelhubpart.Parent = workspace
	axelhubpart.Name = "AxelHub_Part"
	end
	axelhubpart = workspace:FindFirstChild("AxelHub_Part")
	axelhubpart.Anchored = true
	axelhubpart.CanCollide = true
	axelhubpart.Size = Vector3.new(5,0.2,5)
	axelhubpart.Transparency = 1
	axelhubpart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3.76,0)
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

	if not Premiums then
	_G.Settings.AutoFish = false
	end

	if not workspace:FindFirstChild("AxelHub_Part2") then
	axelhubpart2 = Instance.new("Part")
	axelhubpart2.Parent = workspace
	axelhubpart2.Name = "AxelHub_Part2"
	axelhubpart2.Anchored = true
	axelhubpart2.CanCollide = true
	axelhubpart2.Size = Vector3.new(5,0.2,5)
	axelhubpart2.Transparency = 1
	axelhubpart2.CFrame = CFrame.new(0,4,0)
	end


	spawn(function()
	while task.wait() do
		pcall(function()
		if not _G.Settings.AutoFish then
			baitfounded = true
		elseif _G.Settings.AutoFish then
	if not game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod") or not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Weapon_Selection) then
	local args = {
		"Wooden Fishing Rod"
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("BuyFishingRod"):InvokeServer(unpack(args))

	task.wait(.4)

	local args = {
		"Wooden Fishing Rod"
	}
	game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Inventory"):WaitForChild("Equip"):InvokeServer(unpack(args))

	task.wait(.4)

	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Wooden Fishing Rod"))

	task.wait(.2)

	FishingRod = game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod")

	speaker = game.Players.LocalPlayer

		for i,v in pairs(speaker:FindFirstChildOfClass("Backpack"):GetChildren()) do
			if v:IsA("Tool") and v.Name == _G.Settings.Weapon_Selection then
				v.Parent = speaker.Character
			end
		end

	task.wait(.4)

	end

	FishingRod = game.Players.LocalPlayer.Character:FindFirstChild("Wooden Fishing Rod")

	distancesss = getYDistance(game.Players.LocalPlayer.Character.HumanoidRootPart, CFrame.new(1700.24255, 8.27492619, -358.323059, 0.894435704, 0, -0.447196633, 0, 1, 0, 0.447196633, 0, 0.894435704))
	distancessss = getYDistance(game.Players.LocalPlayer.Character.HumanoidRootPart, CFrame.new(-9617.60156, -310.190338, 17166.9238, -0.810859859, 0.0287408344, 0.584534168, -2.04461571e-07, 0.998793364, -0.0491097383, -0.585240364, -0.0398212373, -0.809881449))

	if distancessss <= 40 then
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end

	if not baitfounded and distancesss >= 10 then
	goto(1000, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-10,0))
	end
	if distancesss < 10 then
	local Fishing_RF = game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("FishingRodRequest")
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Character = LocalPlayer.Character
	local CurrentCFrame = Character:GetPivot()
	local RodName = FishingRod and FishingRod.Name
	local LocalPlayer_CharacterCache = workspace.Logic.Cache.Character:FindFirstChild(LocalPlayer.Name)

	local FishingCF = CurrentCFrame * CFrame.new(0,0,-10)
	local CaughtRarity = {
		Mythical = false,
		Legendary = true,
		Rare = false,
		Common = false,
	}
		local Success,WaitTime = Fishing_RF:InvokeServer("Shoot",Vector3.new(FishingCF.X,2.5,FishingCF.Z))

		if Success and WaitTime <= 15 then
			local Start = tick()
			local FishId;
			local Fish;
			local FishName;

			--print(WaitTime)

			while WaitTime > tick() - Start do if not (FishingRod and FishingRod.Parent) == Character then Fishing_RF:InvokeServer("Spool",RodName) return end task.wait() end

			while FishingRod and FishingRod.Parent == Character do
				local CurrentFishId = Fishing_RF:InvokeServer("SpotFish")
				if CurrentFishId then
					local CurrentFish = LocalPlayer_CharacterCache:WaitForChild(CurrentFishId)
					if CurrentFish and CaughtRarity[CurrentFish:GetAttribute("FishName"):split(" ")[1]] == true then
						Fish = CurrentFish
						FishId = CurrentFishId
						FishName = CurrentFish:GetAttribute("FishName")
						break
					end
				end
				task.wait()
			end

			if Fish and Fish.Parent == LocalPlayer_CharacterCache then
				if Fishing_RF:InvokeServer("PullFish",Fish) then
					--print("Caught :",FishName)
				end
			end

			Fishing_RF:InvokeServer("Spool",RodName)
		else
			Fishing_RF:InvokeServer("Spool",RodName)
		end
	end
		task.wait()
		end
	end)
	end
	end)

			end
	end
	end

	--[[
	function islandloader(islandname, monsneed)
	local GetNpcZoneData = game.ReplicatedStorage:WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("GetNpcZoneData");
	for i,v in pairs(GetNpcZoneData:InvokeServer(islandname)) do
	for i2,v2 in pairs(v) do
		if string.find(tostring(v2), monsneed) then
	return true
		end
	end
	end
	return false
	end

	print(islandloader("Flower Capital", "Enma Boss"))
	print(islandloader("Shadow Island", "Zenith"))
	]]

	-- print(workspace.RaijinSpawnQuest:GetAttribute("OnCooldownUntil") - game.Players.LocalPlayer:GetAttribute("LastPlayTimeUpdated"))

-- satraidmons = {"Pirate Raider","Pirate Raider Captain","Paw Minion","Light Minion","Tremor Minion","Saturn Boss"}

	--[[Pirate Raider

Pirate Raider Captain-579304

Light Minion-362851

Paw Minion

Tremor Minion-676493

Saturn Boss-468222]]
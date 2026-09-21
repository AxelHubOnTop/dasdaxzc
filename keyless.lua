--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

repeat task.wait()
    until game:IsLoaded()

repeat task.wait()
    until game:GetService("Players").LocalPlayer.Character

if not axel_loaded then 

axel_loaded = true

Premiums = false

local Pelinda = loadstring(game:HttpGet("https://api.pandauth.com/lib/external/panda-v3-external.lua"))()
local link = Pelinda.GetKeyLink({ Service = "axelhub" })
function checkkey(key)

local result = Pelinda.Init({
    Service    = "axelhub",  -- REQUIRED — no auto-inject like VSS
    Key        = key,
    SilentMode = false,
})

if result == "validated!!" then
    print("Authenticated. Premium:", __PELINDA_IS_PREMIUM__)
    -- your script logic here
    shittybruh = true
    yes = true
    Premiums = __PELINDA_IS_PREMIUM__
elseif result == "error!!" then
yes = false
print("Error")
else
yes = false
print("Error")
end
end

if _G.Key == nil then
_G.Key = ""
end
checkkey(_G.Key)
if shittybruh == true then
response = true
workingreal = _G.Key
end

if response == nil then
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/keysystem.Lua"))()
local response = KeySystem:Init({
    Title = "AxelHub_SRNG_Key",
    Link = link,
    Verify = function(key)
checkkey(key)
if shittybruh == true then
response = true
workingreal = key
end
	return shittybruh
    end
})
end
if not response then 
if isfile("axelhub_srng_key.key") then
delfile("axelhub_srng_key.key")
    end
game.StarterGui:SetCore("SendNotification", {
            Icon = "rbxassetid://86949082023913";
            Title = "Axel Hub", 
            Text = "Key Is Wrongs"
})
return 
end

if yes == false then
checkkey(workingreal)
    if shittybruh == false then
if isfile("axelhub_srng_key.key") then
delfile("axelhub_srng_key.key")
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
if workingreal == nil or workingreal == "" then
game.Players.LocalPlayer:Kick("U tryna Bypass???")
end

print("execute")

        end
end
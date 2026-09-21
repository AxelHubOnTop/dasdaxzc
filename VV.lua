function checkattacking()
for i,v in pairs(workspace.Living:GetChildren()) do
	if v:FindFirstChild("Cooldowns") and v:FindFirstChild("HumanoidRootPart") then
        if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
            for i2,v2 in pairs(v.Cooldowns:GetChildren()) do
				if v2.Name ~= "Thrust" then
v2:Destroy()
return true
				end
			end
			for i3,v3 in pairs(v.Status:GetChildren()) do
				if v3.Name == "Attacking" then
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

for i,v in pairs(workspace.Living:GetChildren()) do
	if v:FindFirstChild("Cooldowns") and v:FindFirstChild("HumanoidRootPart") then
        if (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
if checkattacking() then
            print("blocking")
			task.wait(.2)
			local args = {
	"Block",
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("Combat"):FireServer(unpack(args))
		task.wait(.2)
local args = {
	"Block",
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("Combat"):FireServer(unpack(args))

		end
		end
	end
end

end)
end
end)


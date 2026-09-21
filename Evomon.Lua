function clicks(uis)
VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("GuiService").SelectedObject = uis
task.wait(.03)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
task.wait(.03)
game:GetService("GuiService").SelectedObject = nil
end

if game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.PetWarehouseWindow.Enabled == false then
clicks(game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.PetWarehouseWindow.MainCanvasGroup.StorageButton) task.wait(.3)
end

task.wait(.2)

clicks(game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.PetWarehouseWindow.MainCanvasGroup.MidFrame.BottomBtnFrame.ReleaseButton)

task.wait(.2)

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.PetWarehouseWindow.MainCanvasGroup.MidFrame.MainWarehouseFrame.WarehousePetScrollView:GetChildren()) do
	if v.Visible and v.PetButton.PetLockedFrame.Visible == false then
local str = v.PetButton.PetInfoFrame.PetLevelText.Text
local num = tonumber(str:match("%d+"))
if num == 1 then
clicks(v)
task.wait(.2)
end
	end
end

task.wait(.2)

clicks(game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.PetWarehouseWindow.MainCanvasGroup.MidFrame.BottomBtnFrame.ReleaseDecideFrame.BottomConfirmButton)

task.wait(.2)

clicks(game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.PetWarehouseWindow.MainCanvasGroup.MidFrame.ReleaseConfirmFrame.ReleaseConfirmButton)

-- auto chest

function presse()
VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

for i,v in pairs(workspace.RuntimeCache.RuntimeCacheClient.Chest:GetChildren()) do
	if v:FindFirstChild("Root") and not v:FindFirstChild("lockParticleClone") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Root.CFrame
presse()
	end
end

-- auto attack - catch

if game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.BattleCatchPetWindow.MainCanvasGroup.Visible then
local args = {
	{
		sourcePos = 1,
		targetPos = 1,
		actionType = 5,
		itemId = 2000015
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Battle"):WaitForChild("ReqOperateBattle"):InvokeServer(unpack(args))

elseif game:GetService("Players").LocalPlayer.PlayerGui.UIPrefabs.MainBattleWindow.MainCanvasGroup.Visible then

--attacking

end
getgenv().On = true
local StandOn = Instance.new("Part")
StandOn.Anchored = true
StandOn.Parent = game.Workspace
StandOn.Size = Vector3.new(100, 1, 100)
StandOn.CFrame = CFrame.new(100, 1000, 100)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 1005, 100)
local ZS = game:GetService("Workspace")["Zombie Storage"]
ZS.ChildAdded:Connect(function(zombie)
	if getgenv().On then
		repeat
			wait()
			local ohTable1 = {
				["Tool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"),
				["RealTool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"),
				["HumanoidTables"] = {
					[1] = {
						["HeadHits"] = 1,
						["THumanoid"] = zombie:WaitForChild("Humanoid"),
						["BodyHits"] = 0
					}
				}
			}
			game:GetService("ReplicatedStorage").Remotes.WeaponEvent:FireServer(ohTable1)
		until zombie.Humanoid.Health == 0 or zombie == nil
	end
end)
game:GetService("ReplicatedStorage").GameProperties.CurrentWave.Changed:Connect(function(Bla)
	if game:GetService("ReplicatedStorage").GameProperties.CurrentWave.Value >= 900 then
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
end)
game.StarterGui:SetCore("SendNotification", {
	Title = "Zombie Rush Auto Farm";
	Text = "Made by: Shawn#2000";
	Duration = 7;
})

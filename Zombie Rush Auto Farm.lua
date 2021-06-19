getgenv().On = true
local StandOn = Instance.new("Part")
StandOn.Anchored = true
StandOn.Parent = game.Workspace
StandOn.Size = Vector3.new(100, 1, 100)
StandOn.CFrame = CFrame.new(39.6000061, 160.2000008, 56.2001953)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(39.6000061, 165.2000008, 56.2001953)
local ZS = game:GetService("Workspace")["Zombie Storage"]
ZS.ChildAdded:Connect(function(zombie) -- Connects function on child added NO PAIRS LOOP
	if getgenv().On then
		repeat
			wait()
			local KillThem = {
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
			game:GetService("ReplicatedStorage").Remotes.WeaponEvent:FireServer(KillThem)
		until zombie.Humanoid.Health == 0 or zombie == nil -- Repeats until zombies dead
	end
end)
game:GetService("ReplicatedStorage").GameProperties.CurrentWave.Changed:Connect(function(Bla) -- Connects function on text changed NO WHILE LOOP WTF
	if game:GetService("ReplicatedStorage").GameProperties.CurrentWave.Value >= 900 then 
		game.Players.LocalPlayer.Character.Humanoid.Health = 0 -- you die :()
	end
end)
game.StarterGui:SetCore("SendNotification", {
	Title = "Zombie Rush Auto Farm";
	Text = "Made by: Shawn#2000";
	Duration = 7;
})

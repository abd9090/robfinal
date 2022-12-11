local buildingHP = script.Parent.Tower.Health.Value
local wave = script.Parent.Wave.Value

-- 캐릭터 vs Enenmy 충돌방지
local PhysicsService = game:GetService("PhysicsService")
local obstacles = "Enemy"
local greenObjects = "Player"

PhysicsService:CreateCollisionGroup(obstacles)
PhysicsService:CreateCollisionGroup(greenObjects)

game.Players.PlayerAdded:Connect(function(Player)
	wait(1)
	local characters = Player.Character
	for i2, bodypart in pairs(characters:GetChildren())do
		if bodypart:IsA("MeshPart") or bodypart:IsA("Part") then					
			PhysicsService:SetPartCollisionGroup(bodypart, greenObjects)
		end
	end

end)

function Round(num)
	for i = 1, wave * 10 do
		
		-- NPC 생성 
		local randomWaitTime = 3 + (wave / 0.5)
		wait(randomWaitTime)
		--FindFirstChildWhichIsA("Humanoid")
		
		local dummy = game:GetService("ReplicatedStorage").Enemy:GetChildren()[num]:GetChildren()[math.random(1, #game:GetService("ReplicatedStorage").Enemy:GetChildren()[num]:GetChildren())]:Clone()
		--레벨1 에서는 Leve1-> 레벨 2에서 level2 폴더
		--local dummy = game:GetService("ReplicatedStorage").Enemy:FindFirstChildWhichIsA("Level1"):GetChildren()[math.random(1, #game:GetService("ReplicatedStorage").Enemy:FindFirstChildWhichIsA("Level1"):GetChildren())]:Clone()
		dummy.Parent = script.Parent.Enemy

		for i, v in pairs(dummy:GetChildren()) do
			if v:IsA("MeshPart") or v:IsA("Part") then	
				PhysicsService:SetPartCollisionGroup(v, obstacles)	
				PhysicsService:CollisionGroupSetCollidable(greenObjects, obstacles, false)
			end
		end

		dummy.Humanoid.WalkSpeed = 10.0
		dummy.HumanoidRootPart.CFrame = script.Parent.Spawn.CFrame
		dummy.Stats.Level.Value = wave + math.random(math.random(1,2),math.random(3,4))
		dummy.Stats.Damage.Value = dummy.Stats.Level.Value + 0.5
		dummy.Humanoid:LoadAnimation(dummy.WalkAnim):Play()
		dummy.Humanoid.MaxHealth = dummy.Humanoid.MaxHealth * (dummy.Stats.Level.Value / 2)
		dummy.Humanoid.Health = dummy.Humanoid.MaxHealth	
		
		-- NPC Move
		local pFS = game:GetService("PathfindingService")

		spawn(function()
			for _, waypoints in pairs(script.Parent.Waypoints:GetChildren()) do
				local path = pFS:CreatePath()
				path:ComputeAsync(dummy.HumanoidRootPart.Position, waypoints.Position)
				local wp = path:GetWaypoints()
				for __, wp2 in pairs(wp) do
					dummy.Humanoid:MoveTo(wp2.Position)
					dummy.Humanoid.MoveToFinished:Wait()
				end
			end
			-- 타워 Damage
			if (buildingHP - dummy.Stats.Damage.Value) > 0 then
				buildingHP = buildingHP - dummy.Stats.Damage.Value
			elseif (buildingHP - dummy.Stats.Damage.Value) < 0 then
				buildingHP = 0
			end
			print("타워HP:"..buildingHP)
			dummy:Destroy()
		end)	
	end
end


for i = 1, 30, 1 do
	Round(i)
	wait(30)
end

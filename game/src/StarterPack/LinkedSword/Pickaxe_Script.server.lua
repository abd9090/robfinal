local tool = script.Parent
local canMine = false
local storage = game:GetService("ServerStorage")
local player = script.Parent.Parent.Parent
local value = 10

local dummy2 =  game:GetService("ReplicatedStorage").Enemy.Level1:GetChildren()
local dummy = game:GetService("ReplicatedStorage").Enemy:GetChildren()[1]:GetChildren()
print(dummy)
print(dummy2)
--:GetChildren()[math.random(1, #game:GetService("ReplicatedStorage").Enemy.Level1:GetChildren())]:Clone()


local function onTouch(otherPart)
	if otherPart.Name == 'Rock' and canMine then
		canMine = false		
		local minedPart = Instance.new('Part')
		minedPart.Parent = game.Workspace
		minedPart.Size = Vector3.new(2,1,2)
		minedPart.Position = otherPart.Position + Vector3.new(math.random(-5,5), 5, math.random(-5,5))
		local mineType = math.random(1,100)
		if mineType < 51 then
			minedPart.BrickColor = BrickColor.new('Ghost grey')
			player.leaderstats.Points.Value = player.leaderstats.Points.Value + value
			wait(5)
			minedPart:Destroy()	
		end
		if mineType > 50 and mineType < 81 then
			minedPart.BrickColor = BrickColor.new('Gold')
			player.leaderstats.Points.Value = player.leaderstats.Points.Value + value*2
			wait(5)
			minedPart:Destroy()	
		end
		if mineType > 80 and mineType < 96 then
			minedPart.BrickColor = BrickColor.new('Bright green')
			player.leaderstats.Points.Value = player.leaderstats.Points.Value + value*5
			wait(5)
			minedPart:Destroy()	
		end				
		if mineType > 95 then
			minedPart.BrickColor = BrickColor.new('Baby blue')
			player.leaderstats.Points.Value = player.leaderstats.Points.Value + value*10
			wait(5)
			minedPart:Destroy()	
		end	
		local scriptFile = storage["Script"]:clone()
		scriptFile.Parent = minedPart	
			
	end
end

local function slash()
	local str = Instance.new("StringValue")
	str.Name = "toolanim"
	str.Value = "Slash"
	str.Parent = tool
	canMine = true
end

tool.Handle.Touched:Connect(onTouch)
tool.Activated:Connect(slash)
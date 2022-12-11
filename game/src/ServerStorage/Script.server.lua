local part = script.Parent

local function collect(otherPart)

	local partParent = otherPart.Parent
	local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		local player = game.Players:FindFirstChild(otherPart.Parent.Name)
		if player then			
			if part.BrickColor == BrickColor.new("Ghost grey") then
				player.leaderstats.Steel.Value = player.leaderstats.Steel.Value + 1 
				part:Destroy()
			end	
			if part.BrickColor == BrickColor.new("Gold") then
				player.leaderstats.Gold.Value = player.leaderstats.Gold.Value + 1 
				part:Destroy()
			end	
			if part.BrickColor == BrickColor.new("Bright green") then
				player.leaderstats.Emerald.Value = player.leaderstats.Emerald.Value + 1 
				part:Destroy()
			end	
			if part.BrickColor == BrickColor.new("Baby blue") then
				player.leaderstats.Diamond.Value = player.leaderstats.Diamond.Value + 1 
				part:Destroy()
			end	
		end		
	end
end

part.Touched:Connect(collect)
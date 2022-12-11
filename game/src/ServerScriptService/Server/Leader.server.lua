function onPlayerEntered(newPlayer)

	local stats = Instance.new("IntValue")
	stats.Name = "leaderstats"

	local Money = Instance.new("IntValue")
	Money.Name = "Points"
	Money.Value = 3000
	
	local WeaponLevel = Instance.new("IntValue")
	WeaponLevel.Name = "W_Level"
	WeaponLevel.Value = 0	
	
	
	WeaponLevel.Parent = stats
	Money.Parent = stats 
	stats.Parent = newPlayer
end

game.Players.ChildAdded:connect(onPlayerEntered)
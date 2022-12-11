local StarterGui = game.StarterGui

game.ReplicatedStorage.ItemBuy.OnServerEvent:Connect(function(plr, item, Price)
	if plr.leaderstats.Points.Value >= Price then
		local clo = game.ReplicatedStorage.Sword.ClassicSword_1:Clone() --스크립트 수정한 부분(영상대로 하는데 지장 없음)
		
		plr.leaderstats.Points.Value = plr.leaderstats.Points.Value - Price
		clo.Parent = plr.Backpack
		plr.leaderstats.W_Level.Value = 1
	end
end)

game.ReplicatedStorage.upgrade.OnServerEvent:Connect(function(plr,curr_level,item, Price)
	if plr.leaderstats.Points.Value >= Price then  
		plr.leaderstats.Points.Value = plr.leaderstats.Points.Value - Price
		
		
		local percent = math.random(1,100)
		if(percent < (80/curr_level))
		then 
			plr.leaderstats.W_Level.Value += 1
			print("강화성공")
		else
			plr.leaderstats.W_Level.Value = math.ceil(plr.leaderstats.W_Level.Value/2)
			print("강화좆ㅅ망")	
		end
		
		
	end
	
end)


--[[  
local mps = game:GetService("MarketplaceService")

 function onPlayerJoin(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local steel = Instance.new("IntValue")
	steel.Name = "Steel"
	steel.Value = 0
	steel.Parent = leaderstats		

	local gold = Instance.new("IntValue")
	gold.Name = "Gold"
	gold.Value = 0
	gold.Parent = leaderstats

	local emerald = Instance.new("IntValue")
	emerald.Name = "Emerald"
	emerald.Value = 0
	emerald.Parent = leaderstats

	local diamond = Instance.new("IntValue")
	diamond.Name = "Diamond"
	diamond.Value = 0
	diamond.Parent = leaderstats	
end

game.Players.PlayerAdded:Connect(onPlayerJoin)
]]--
local Price = 100
local Item = script.Parent.Parent.Parent.ItemName.Text
local ReplicatedStorage = game.ReplicatedStorage
local curr_level
local Event = game.ReplicatedStorage:WaitForChild("upgrade")




script.Parent.MouseButton1Click:Connect(function()
	curr_level = game.Players.LocalPlayer.leaderstats.W_Level.Value
	print(curr_level)
	
	
	Price = curr_level *50  --바꿔야할 계산식 (현재 레벨별 다음 강화 비용)
--[[	if curr_level==1 then end
	if curr_level==2 then end
	if curr_level==3 then end
	if curr_level==4 then end
	if curr_level==5 then end
	if curr_level==6 then end
	if curr_level==7 then end
	if curr_level==8 then end
	if curr_level==9 then end]]--
	
	
	
	
	
	
	
	
	
	
	
	Event:FireServer(curr_level,Item, Price)
	script.Parent.Parent.Visible = false
end)
local Price = 100
local Item = script.Parent.Parent.Parent.ItemName.Text
local ReplicatedStorage = game.ReplicatedStorage

local Event = game.ReplicatedStorage:WaitForChild("upgrade")


local Sword1 = ReplicatedStorage.Sword.ClassicSword_1

script.Parent.MouseButton1Click:Connect(function()
	Event:FireServer(Item, Price)
	script.Parent.Parent.Visible = false
end)
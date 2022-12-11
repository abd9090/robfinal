local label = script.Parent

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local removeEvent = ReplicatedStorage:WaitForChild("RemoteEvent")


local function displayMoney(money)
	label.Text = '$ '.. money
end

removeEvent.OnClientEvent:Connect(displayMoney)
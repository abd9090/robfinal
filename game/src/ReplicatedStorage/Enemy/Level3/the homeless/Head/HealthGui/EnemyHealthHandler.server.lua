local tweenservice = game:GetService("TweenService")
local healthGui = script.Parent
local mainframe = healthGui:FindFirstChild("MainFrame")
local barframe = mainframe:FindFirstChild("BarFrame")
local hum = healthGui.Parent.Parent:FindFirstChild("Humanoid")
local healthtext = mainframe:FindFirstChild("HealthText")

local function WhenHealthChanged()
	local healthTween = tweenservice:Create(
		barframe,
		TweenInfo.new(
			1,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.InOut,
			0,
			false,
			0
		),
		{Size = UDim2.new(hum.Health / hum.MaxHealth, 0, 1, 0)}
	)
	
	healthtext.Text = tostring(hum.Health).." / "..tostring(hum.MaxHealth)
	
	healthTween:Play()
	healthTween.Completed:Wait()
end

WhenHealthChanged()

hum.HealthChanged:Connect(WhenHealthChanged)
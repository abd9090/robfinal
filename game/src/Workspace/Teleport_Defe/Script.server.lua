local Teleport = "Teleport_Mine"

function Touch(hit)
	if script.Parent.Locked == false and script.Parent.Parent:findFirstChild(Teleport).Locked == false then
		script.Parent.Locked = true
		script.Parent.Parent:FindFirstChild(Teleport).Locked = true
		local Pos = script.Parent.Parent:findFirstChild(Teleport)
		hit.Parent:MoveTo(Pos.Position)
		wait(5) 
		script.Parent.Locked = false
		script.Parent.Parent:findFirstChild(Teleport).Locked = false
	end
end
script.Parent.Touched:connect(Touch)
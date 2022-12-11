local service = game:GetService("UserInputService") 
local f = false --변수 지정

service.InputBegan:Connect(function(key) 
	if key.KeyCode == Enum.KeyCode.F then 
		if f == false then --변수가 false 일때
			script.Parent.Visible = true --GUI 켜기

			script.Parent:TweenPosition( --GUI 애니메이션 설정 / 시작
				UDim2.new(0.146, 0,0.15, 0), --올라오는 위치
				"Out", --애니메이션 스타일
				"Back", --Linear, Sine, Back, Quad, Quart, Quint, Bounce, Elastic 애니메이션중 골라 쓰세요!
				1.5, --GUI가 올라오는 시간
				false --애니메이션 끝
			)

			wait(1.5) --1.5초 기다림
			f = true --변수를 true로 바꿈
		else
			script.Parent:TweenPosition(
				UDim2.new(0.146, 0,1.2, 0),
				"Out",
				"Back",
				1.5,
				false
			)

			wait(1.5)
			script.Parent.Visible = false
			f = false
		end
	end
end)
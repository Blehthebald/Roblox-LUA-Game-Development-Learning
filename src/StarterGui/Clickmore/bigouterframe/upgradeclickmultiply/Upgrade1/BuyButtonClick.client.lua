local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyevent = ReplicatedStorage:WaitForChild("BuyMultiplierEvent")

local button = script.Parent
button.MouseButton1Click:Connect(function()
	
		buyevent:FireServer()

	
end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyevent = ReplicatedStorage:WaitForChild("BuyUpgradeEvent")

local button = script.Parent
button.MouseButton1Click:Connect(function()
	
		buyevent:FireServer()

	
end)
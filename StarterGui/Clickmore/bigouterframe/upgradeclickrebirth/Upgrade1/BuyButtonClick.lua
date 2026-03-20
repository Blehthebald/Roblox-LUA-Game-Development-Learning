-- @ScriptType: LocalScript
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyevent = ReplicatedStorage:WaitForChild("BuyRebirth")

local button = script.Parent
button.MouseButton1Click:Connect(function()
	
		buyevent:FireServer()

	
end)
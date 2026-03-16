local userinput = game:GetService("UserInputService")
local replicatedstorage = game:GetService("ReplicatedStorage")
local clickevent = replicatedstorage:WaitForChild("ClickEvent")
local justclicked = false
userinput.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 and justclicked == false then
		justclicked = true
		clickevent:FireServer()
		wait(0.1)
		justclicked = false
	end
end)
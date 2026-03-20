-- @ScriptType: LocalScript
local userinput = game:GetService("UserInputService")
local replicatedstorage = game:GetService("ReplicatedStorage")
local clickevent = replicatedstorage:WaitForChild("ClickEvent")
local justclicked = false
userinput.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 and justclicked == false then
		--detects if the user has clicked and fires a click event
		justclicked = true
		clickevent:FireServer()
		wait(0.1)
		--timer to limit number of clicks per second, otherwise autoclickers would run rampant and destroy the purpose of the game
		justclicked = false
	end
end)

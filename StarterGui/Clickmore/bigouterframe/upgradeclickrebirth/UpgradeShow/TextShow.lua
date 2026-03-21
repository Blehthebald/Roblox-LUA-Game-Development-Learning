-- @ScriptType: LocalScript
local text = script.Parent
local player = game.Players.LocalPlayer
local rebirth = player:GetAttribute("rebirths")
local replicatedstorage = game:GetService("ReplicatedStorage")
local dataloaded = replicatedstorage:WaitForChild("DataLoaded")

local co2 = coroutine.create(function()

	text.Text = rebirth .. "->".. rebirth+1 .. "rebirths"

end)
print("hi")
coroutine.resume(co2)
dataloaded.OnClientEvent:Connect(function()
	coroutine.resume(co2)
end)

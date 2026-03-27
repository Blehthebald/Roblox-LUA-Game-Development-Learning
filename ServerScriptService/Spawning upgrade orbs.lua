-- @ScriptType: Script
local replicatedstorage = game:GetService("ReplicatedStorage")
local spawndudes = require(replicatedstorage.SpawnClone)
local part = game.Workspace:WaitForChild("2XMultiply")

while true do
	task.wait(math.random(1,15))
	spawndudes.SpawnClone(part)

end
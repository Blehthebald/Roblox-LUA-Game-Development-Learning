-- @ScriptType: Script
local players = game:GetService("Players")
local playerdata = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local clickevent = ReplicatedStorage:WaitForChild("ClickEvent")

game.Players.PlayerAdded:Connect(function(player)
	--setting up the player data
	playerdata[player] = {
		Coins = 0,
		clicknumupgrade = 0,
		clickmultiplyupgrade = 0,
		rebirths = 0
	}
	player:SetAttribute("Coins", 0)
	player:SetAttribute("clicknumupgrade", 0)
	player:SetAttribute("clickmultiplyupgrade", 0)
	player:SetAttribute("rebirths",0)
	
	local clickmore = player.PlayerGui:WaitForChild("Clickmore")
	local coins = player.PlayerGui:WaitForChild("Coins")
	--enables the screen gui for the player so that I don't need to enable it manually and I can freely write code without any ui clutter
	clickmore.Enabled = true
	coins.Enabled = true
	

end)

players.PlayerRemoving:Connect(function(player)
	--cleaning up the player data so that it does not clog up the server
	playerdata[player] = nil
end)
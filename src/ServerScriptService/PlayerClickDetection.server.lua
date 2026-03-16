local players = game:GetService("Players")
local playerdata = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local clickevent = ReplicatedStorage:WaitForChild("ClickEvent")

game.Players.PlayerAdded:Connect(function(player)
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



end)

players.PlayerRemoving:Connect(function(player)
	playerdata[player] = nil
end)

local function CalculateCoinsEarned(player)
	local clicknum = player:GetAttribute("clicknumupgrade")
	local multiply = player:GetAttribute("clickmultiplyupgrade")
	local rebirths = player:GetAttribute("rebirths")
	local calc = 2 ^ (clicknum) * (0.2*(multiply) + 1) * 1.5 ^ rebirths
	
	return calc
		
end

clickevent.OnServerEvent:Connect(function(player)
	local data = player
	if not data then return end

	local gain = CalculateCoinsEarned(player)
	local coins = player:GetAttribute("Coins")
	coins += gain
	
	player:SetAttribute("Coins", math.ceil(coins))
end)

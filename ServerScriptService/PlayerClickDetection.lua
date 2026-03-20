-- @ScriptType: Script
local players = game:GetService("Players")
local playerdata = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local clickevent = ReplicatedStorage:WaitForChild("ClickEvent")



local function CalculateCoinsEarned(player)
	--calculates the amount of coins the player will earn per click based on their upgrades
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
	--updates the player's coins when a click event is fired
	
	player:SetAttribute("Coins", math.ceil(coins))
	--rounds up the players coins, this ensures that the player feels an actual difference because when you gain 1.2 coins, rounding down to 1 coin makes it seem like the game is broken and not working
end)

-- @ScriptType: Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyevent = ReplicatedStorage:WaitForChild("BuyUpgradeEvent")
local function round(num)
	return math.floor(num * 10 + 0.5) / 10
	--rounds the number to 1 decimal place
end
buyevent.OnServerEvent:Connect(function(player)
	local usermoney = player:GetAttribute("Coins")
	local userupgradelevel = player:GetAttribute("clicknumupgrade")
	local upgradecost = 2 ^ (userupgradelevel) * 100 * 1.5^(userupgradelevel)
	local format = require(game.ReplicatedStorage.NumberFormat)
	--calculates if user has enough currency for the upgrade
	if usermoney >= upgradecost then
		player:SetAttribute("Coins", round(usermoney-upgradecost))
		player:SetAttribute("clicknumupgrade", userupgradelevel+1)
		userupgradelevel = player:GetAttribute("clicknumupgrade")
		local price = player.PlayerGui.Clickmore.bigouterframe.upgradeclicknum.Price
		price.Text = "Price: ".. format.doit(math.ceil(2^ (userupgradelevel) * 100 * 1.5^(userupgradelevel)))
		local upgradeshow = player.PlayerGui.Clickmore.bigouterframe.upgradeclicknum.UpgradeShow
		upgradeshow.Text = format.doit(2 ^ (userupgradelevel)) .. "->" .. format.doit(2 ^ (userupgradelevel+1)) .. "coins per click"
		--updates values after transaction is complete
	end
	
	
end)
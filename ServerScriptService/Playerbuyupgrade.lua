-- @ScriptType: Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyevent = ReplicatedStorage:WaitForChild("BuyUpgradeEvent")

buyevent.OnServerEvent:Connect(function(player)
	local usermoney = player:GetAttribute("Coins")
	local userupgradelevel = player:GetAttribute("clicknumupgrade")
	local upgradecost = 2 ^ (userupgradelevel) * 100 * 1.5^(userupgradelevel)
	local format = require(game.ReplicatedStorage.NumberFormat)
	if usermoney >= upgradecost then
		player:SetAttribute("Coins", usermoney-upgradecost)
		player:SetAttribute("clicknumupgrade", userupgradelevel+1)
		userupgradelevel = player:GetAttribute("clicknumupgrade")
		local price = player.PlayerGui.Clickmore.bigouterframe.upgradeclicknum.Price
		price.Text = "Price: ".. format.doit(math.ceil(2^ (userupgradelevel) * 100 * 1.5^(userupgradelevel)))
		local upgradeshow = player.PlayerGui.Clickmore.bigouterframe.upgradeclicknum.UpgradeShow
		upgradeshow.Text = format.doit(2 ^ (userupgradelevel)) .. "->" .. format.doit(2 ^ (userupgradelevel+1)) .. "coins per click"
		
	end
	
	
end)
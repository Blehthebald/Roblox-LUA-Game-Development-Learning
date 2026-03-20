-- @ScriptType: Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyevent = ReplicatedStorage:WaitForChild("BuyMultiplierEvent")
local function round(num)
	return math.floor(num * 10 + 0.5) / 10
end
buyevent.OnServerEvent:Connect(function(player)
	local usermoney = player:GetAttribute("Coins")
	local userupgradelevel = player:GetAttribute("clickmultiplyupgrade")
	local upgradecost = 100*(1+0.2*userupgradelevel)*1.25^(userupgradelevel)
	local format = require(game.ReplicatedStorage.NumberFormat)
	if usermoney >= upgradecost then
		player:SetAttribute("Coins", usermoney-upgradecost)
		player:SetAttribute("clickmultiplyupgrade", userupgradelevel+1)
		userupgradelevel = player:GetAttribute("clickmultiplyupgrade")
		local price = player.PlayerGui.Clickmore.bigouterframe.upgradeclickmultiply.Price
		
		price.Text = "Price: ".. format.doit(math.ceil(100*(1+0.2*userupgradelevel)*1.25^(userupgradelevel)))
		
		local upgradeshow = player.PlayerGui.Clickmore.bigouterframe.upgradeclickmultiply.UpgradeShow
		upgradeshow.Text = round(1+userupgradelevel*(0.2)) .. "->" .. round(1+(userupgradelevel+1)*0.2) .. "x coins gain"
	end
	
	
end)
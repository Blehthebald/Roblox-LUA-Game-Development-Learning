-- @ScriptType: Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyevent = ReplicatedStorage:WaitForChild("BuyRebirth")
local function round(num)
	return math.floor(num * 10 + 0.5) / 10
end
buyevent.OnServerEvent:Connect(function(player)
	local usermoney = player:GetAttribute("Coins")
	local userupgradelevel = player:GetAttribute("rebirths")
	local upgradecost = 1000^(userupgradelevel)
	local format = require(game.ReplicatedStorage.NumberFormat)
	if usermoney >= upgradecost then
		player:SetAttribute("Coins", usermoney-upgradecost)
		player:SetAttribute("rebirths", userupgradelevel+1)
		userupgradelevel = player:GetAttribute("rebirths")
		local price = player.PlayerGui.Clickmore.bigouterframe.upgradeclickrebirth.Price
		price.Text = "Price: ".. format.doit(math.ceil(1000^(userupgradelevel)))
		local upgradeshow = player.PlayerGui.Clickmore.bigouterframe.upgradeclickrebirth.UpgradeShow
		upgradeshow.Text = userupgradelevel .. "->".. userupgradelevel+1 .. "rebirths"
		player:SetAttribute("Coins", 0)
		player:SetAttribute("clicknumupgrade", 0)
		player:SetAttribute("clickmultiplyupgrade", 0)
		player.PlayerGui.Clickmore.bigouterframe.upgradeclicknum.Price.Text = "Price: 100"
		player.PlayerGui.Clickmore.bigouterframe.upgradeclicknum.UpgradeShow.Text = "1 -> 2 coins per click"
		player.PlayerGui.Clickmore.bigouterframe.upgradeclickmultiply.Price.Text = "Price: 100"
		player.PlayerGui.Clickmore.bigouterframe.upgradeclickmultiply.UpgradeShow.Text = "1x -> 2x"
	end
	
end)
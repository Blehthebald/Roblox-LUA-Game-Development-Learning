-- @ScriptType: LocalScript
local player = game.Players.LocalPlayer

local format = require(game.ReplicatedStorage.NumberFormat)

local coins = player:GetAttribute("Coins")

local currencyLabel = script.Parent
player:GetAttributeChangedSignal("Coins"):Connect(function()
	coins = player:GetAttribute("Coins")
	currencyLabel.Text = "Coins: " .. format.doit(coins)
end) 

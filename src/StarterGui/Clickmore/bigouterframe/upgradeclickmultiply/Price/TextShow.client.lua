local text = script.Parent
local player = game.Players.LocalPlayer
local upgradelevel = game.Players.LocalPlayer:GetAttribute("clickmultiplyupgrade")
local calc = (100*(1+0.2*upgradelevel)*1.25^(upgradelevel))
local format = require(game.ReplicatedStorage.NumberFormat)
text.Text = "Price: ".. format.doit(calc)

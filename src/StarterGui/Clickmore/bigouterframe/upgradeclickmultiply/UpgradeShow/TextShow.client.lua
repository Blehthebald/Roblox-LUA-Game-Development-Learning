local text = script.Parent
local player = game.Players.LocalPlayer
local upgradelevel = player:GetAttribute("clickmultiplyupgrade")
local calc1 = 1+upgradelevel*(0.2)
local calc2 = 1+(upgradelevel+1)*0.2
local format = require(game.ReplicatedStorage.NumberFormat)
format.doit(calc1)
format.doit(calc2)

text.Text = calc1 .. "->" .. calc2 .. "x coins gain"

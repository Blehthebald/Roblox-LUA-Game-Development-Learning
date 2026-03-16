local text = script.Parent
local player = game.Players.LocalPlayer
local upgradelevel = player:GetAttribute("clicknumupgrade")


text.Text = 2 ^ (upgradelevel) .. "->" .. 2 ^ (upgradelevel+1) .. "coins per click"

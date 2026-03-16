local text = script.Parent
local player = game.Players.LocalPlayer



text.Text = "Price: "..tostring(2 ^ (player:GetAttribute("clicknumupgrade")) * 100 * 1.5^(player:GetAttribute("clicknumupgrade")))

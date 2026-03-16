local text = script.Parent
local player = game.Players.LocalPlayer



text.Text = "Price: "..tostring(1000^(player:GetAttribute("rebirths")+1))

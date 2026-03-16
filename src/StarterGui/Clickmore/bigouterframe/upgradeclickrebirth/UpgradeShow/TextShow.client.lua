local text = script.Parent
local player = game.Players.LocalPlayer
local rebirth = player:GetAttribute("rebirths")


text.Text = rebirth .. "->".. rebirth+1 .. "rebirths"

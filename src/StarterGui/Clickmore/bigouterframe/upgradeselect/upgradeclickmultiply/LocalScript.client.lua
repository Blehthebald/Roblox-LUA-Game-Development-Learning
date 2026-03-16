local click = script.parent
local frame = game.Players.LocalPlayer.PlayerGui.Clickmore.bigouterframe.upgradeclickmultiply
local otherframe = game.Players.LocalPlayer.PlayerGui.Clickmore.bigouterframe.upgradeclicknum
local otherframe2 = game.Players.LocalPlayer.PlayerGui.Clickmore.bigouterframe.upgradeclickrebirth

click.MouseButton1Click:Connect(function()
	frame.Visible = true
	otherframe.Visible = false
	otherframe2.Visible = false
end)
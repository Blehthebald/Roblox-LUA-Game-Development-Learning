-- @ScriptType: LocalScript
local click = script.Parent
local frame = game.Players.LocalPlayer.PlayerGui.Clickmore.bigouterframe
local on = false
frame.Visible = false
click.MouseButton1Click:Connect(function()
	if on == false then
		frame.Visible = true 
		on = true
	elseif on == true then
		frame.Visible = false
		on = false
	end
	
end)

--sets the gui for the upgrades to be false by default, and toggles it when the player clicks on the button
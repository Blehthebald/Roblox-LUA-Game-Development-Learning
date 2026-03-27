-- @ScriptType: Script
local part = script.Parent
part.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	--detects that a humanoid has touched the part and not the accessory
	if humanoid ~= nil then
		-- ensures that script only runs if humanoid has been detected to hit the object
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		-- gets the player from the character that has the humanoid
		player:SetAttribute("Coins", player:GetAttribute("Coins") * 2)
		--multiplies the player's coins by 2
		_G.numclones -= 1
		part:Destroy()
		--destroys the part
	end
	
	
	--decrements the global orb count by 1
end)
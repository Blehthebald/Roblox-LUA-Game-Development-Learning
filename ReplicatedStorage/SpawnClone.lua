-- @ScriptType: ModuleScript
_G.numclones = 0
--sets global variable of number of clones to be 0
local SpawnDudes = {}
function SpawnDudes.SpawnClone(part)

	if _G.numclones < 20 then
		local clone = part:clone()

		clone.Name = "Clone"
		clone.Parent = game.Workspace
		clone.CFrame = CFrame.new(math.random(1,100),5,math.random(1,100))
		_G.numclones +=1
		clone.Transparency = 0
		clone.Text.Enabled = true
	end


end
return SpawnDudes

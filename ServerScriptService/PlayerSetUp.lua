-- @ScriptType: Script
local players = game:GetService("Players")
local defaulttable = {
	Coins = 0,
	ClickUpgrade = 0,
	MultiplyUpgrade = 0,
	Rebirths = 0
}
local playerdata = {}
local DataStoreService = game:GetService("DataStoreService")
local table = DataStoreService:GetDataStore("table")


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataLoaded = ReplicatedStorage:WaitForChild("DataLoaded")


game.Players.PlayerAdded:Connect(function(player)
	--setting up the player data
	repeat 
		local success , currenttable = pcall(function()
			return table:GetAsync(player.UserId)
			--uses a pcall function to prevent accidental deletion of player data if an error occurs
		end)
		if success then
			if currenttable == nil then
				--currentCoins = 0
				table:SetAsync(player.UserId,defaulttable)
				player:SetAttribute("Coins",0)
				player:SetAttribute("clicknumupgrade",0)
				player:SetAttribute("clickmiltiplyupgrade",0)
				player:SetAttribute("rebirths",0)
				--checks if there is previous player data, if there is no player data it will set the player to their default values
			else
				player:SetAttribute("Coins",currenttable.Coins)
				player:SetAttribute("clicknumupgrade",currenttable.ClickUpgrade)
				player:SetAttribute("clickmultiplyupgrade",currenttable.MultiplyUpgrade)
				player:SetAttribute("rebirths",currenttable.Rebirths)
			end
		else 
			task.wait(1)
		end
		
	until success
	
	




	
	
	
	
	
	local clickmore = player.PlayerGui:WaitForChild("Clickmore")
	local coins = player.PlayerGui:WaitForChild("Coins")
	--enables the screen gui for the player so that I don't need to enable it manually and I can freely write code without any ui clutter
	clickmore.Enabled = true
	coins.Enabled = true
	
	DataLoaded:FireClient(player)
	DataLoaded:FireClient(player)
	
	

end)

players.PlayerRemoving:Connect(function(player)
	--cleaning up the player data so that it does not clog up the server
	playerdata[player] = {
		Coins = player:GetAttribute("Coins"),
		ClickUpgrade = player:GetAttribute("clicknumupgrade"),
		MultiplyUpgrade = player:GetAttribute("clickmultiplyupgrade"),
		Rebirths = player:GetAttribute("rebirths")
	}
	repeat 
		local success , CC = pcall(function()
			 table:SetAsync(player.UserId,playerdata[player])
		end)
		if not success then task.wait(1) end
	until success 
	playerdata[player] = nil
end

)
	

game:BindToClose(function()
	--this code is to prevent data loss and ensure data saves in case a server crashes
	for i, player in pairs(game.Players:GetPlayers()) do
		playerdata[player] = {
			Coins = player:GetAttribute("Coins"),
			ClickUpgrade = player:GetAttribute("clicknumupgrade"),
			MultiplyUpgrade = player:GetAttribute("clickmultiplyupgrade"),
			Rebirths = player:GetAttribute("rebirths")
		}
		repeat 
			local success , CC = pcall(function()
				table:SetAsync(player.UserId,playerdata[player])
			end)
			if not success then task.wait(1) end
		until success 
		playerdata[player] = nil
	end
end)

--// Developed by yh_2231. Free to use model //--

--// Config //--
local GroupID = 33214791
local Rainbow = 629498138 --gamepass ID
local cmdrank = 2
--//Deeper Config //--
local Headtag = script.Headtag
local Username = Headtag.Username
local Rank = Headtag.GPRNK


--// Locals//--
local MPS = game:GetService("MarketplaceService")
function splitString(input, delimiter)
	local result = {}
	local pattern = "[^" .. delimiter .. "]+"
	for word in string.gmatch(input, pattern) do
		table.insert(result, word)
	end
	return result
end


--// Main Loader //--


game.Players.PlayerAdded:Connect(function(player)
	local Rainbowbought = MPS:UserOwnsGamePassAsync(player.UserId,Rainbow)
	
	local groupRank = player:GetRoleInGroup(GroupID)
	local clone = script.Headtag
	clone.Parent = game.Workspace:WaitForChild(player.Name).Head
	clone.Username.Text = player.DisplayName.." [@"..player.name.."]"
	clone.GPRNK.Text = groupRank
	if Rainbowbought then
		clone.Username.Rainbow.Enabled = true
	else 
		print(player.Name.. " Doesn't own the Rainbow Gamepass")
	end
	local warningclone = script.Warning:Clone()
	warningclone.Parent = player
	clone.Role.Text = warningclone.Value
	local WLVL = script.WLVL:Clone()
	WLVL.Parent = player


	player.CharacterAdded:Connect(function()
		
		
		local groupRank = player:GetRoleInGroup(GroupID)
		local clone = script.Headtag
		clone.Parent = game.Workspace:WaitForChild(player.Name).Head
		clone.Username.Text = player.DisplayName.." [@"..player.name.."]"
		clone.GPRNK.Text = groupRank
		if Rainbowbought then
			clone.Username.Rainbow.Enabled = true
			print(player.Name.." Owns the Rainbow gamepass")
		else 
			print(player.Name.. " Doesn't own the Rainbow Gamepass")
		end
		local warningclone = script.Warning:Clone()
		warningclone.Parent = player
		clone.Role.Text = warningclone.Value
		local WLVL = script.WLVL:Clone()
		WLVL.Parent = player
	end)


end)

--// Warnings Module //--


function W1(player, message)
local words = splitString(message, " ")
if #words >= 4 and words[1] == "/e" and words[2] == "W1" then
	local targetPlayerName = words[3]
	local desiredName = table.concat(words, " ", 4)
local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
if targetPlayer then
			local Headtag = targetPlayer.Character.Head.Headtag.Role
			if game.Players:FindFirstChild(targetPlayerName).WLVL.Value == 0 then
			Headtag.Text = "W1-".. desiredName
				game.Players:FindFirstChild(targetPlayerName).Warning.Value = "W1-"..desiredName
				game.Players:FindFirstChild(targetPlayerName).WLVL.Value = 1
end
end
end
end
function W2(player, message)
	local words = splitString(message, " ")
	if #words >= 4 and words[1] == "/e" and words[2] == "W2" then
		local targetPlayerName = words[3]
		local desiredName = table.concat(words, " ", 4)
		local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
		if targetPlayer then
			local Headtag = targetPlayer.Character.Head.Headtag.Role
			if game.Players:FindFirstChild(targetPlayerName).WLVL.Value == 1 then
			Headtag.Text = "W2-".. desiredName
				game.Players:FindFirstChild(targetPlayerName).Warning.Value = "W2-"..desiredName
				game.Players:FindFirstChild(targetPlayerName).WLVL.Value = 2
				end
		end
	end
end
function W3(player, message)
	local words = splitString(message, " ")
	if #words >= 4 and words[1] == "/e" and words[2] == "W3" then
		local targetPlayerName = words[3]
		local desiredName = table.concat(words, " ", 4)
		local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
		if targetPlayer then
			local Headtag = targetPlayer.Character.Head.Headtag.Role
			if game.Players:FindFirstChild(targetPlayerName).WLVL.Value == 2 then
				Headtag.Text = "W3-".. desiredName
				game.Players:FindFirstChild(targetPlayerName).Warning.Value = "W3-"..desiredName
				game.Players:FindFirstChild(targetPlayerName).WLVL.Value = 3
			end
		end
	end
end




--// Player Chatted/Finding command //--

game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		if player:GetRankInGroup(GroupID) >= cmdrank then
			W1(player, message) 
		end
	end)
end)
game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		if player:GetRankInGroup(GroupID) >= cmdrank then
			W2(player, message) 
		end
	end)
end)
game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		if player:GetRankInGroup(GroupID) >= cmdrank then
			W3(player, message) 
		end
	end)
end)

--// End of module //--
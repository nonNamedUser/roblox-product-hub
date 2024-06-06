local data = require(game.ServerScriptService.Config)

-- DO NOT TOUCH ANYTHING DOWN HERE!

wait(4)

if game:GetService("RunService"):IsStudio() then
	local plr = game.Players:GetChildren()[1]
	plr:Kick("\nYou can't join this game.\nError Code: Roblox Studio")
else
	local plr = game.Players:GetChildren()[1]
	local tps = game:GetService("TeleportService")

	local tpdata = Instance.new('TeleportOptions', script)
	
	tpdata:SetTeleportData(data)

	tps:TeleportAsync(16477817565, {plr}, tpdata)
end

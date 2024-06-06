-- name me MainModule in roblox

return {
	CHANGENAME = function()
		--[[ how to use this module (YOU MUST PUBLISH THIS TO ROBLOX AND COPY THE ID):
		
		local wl = require(moduleid_goes_here).CHANGENAME()
		
		
		if wl == "Product" then -- if the game owner owns the product
			print("I work")
		elseif wl == "No_Product" then -- if the game owner doesn't own the product
			print("I don't work")
			script:Destroy() -- destroys the script so the script below won't run
		elseif wl == "http404" then -- if the game owner doesn't have HTTPSERVICE turned on (note: If you don't have http on just keep it how it is!)
			print("Enable HTTPSERVICE")
			script:Destroy() -- destroys the script so the script below won't run
		end
		
		--code goes down here
		
		
		
		
		
		
		
		
		]]
		local w = {} -- put userids here to add people manually to
		local httpsEnabled = true -- change this to false if you don't want to require httpservice to use the product
		local wl = "CHANGENAME" -- change me
		local name = "CHANGEME" -- in the devconsole/output it will say [name] Whitelist
		local gamepassId = 0 -- change this to the gamepass id (the numbers)
		local placeId = game.PlaceId
		local groupService = game:GetService("GroupService")
		local placeInfo = game:GetService("MarketplaceService"):GetProductInfo(placeId, Enum.InfoType.Asset)
		local marketPlace = game:GetService("MarketplaceService")
		if placeInfo ~= nil then
			if game.CreatorType ~= nil then
				if game.CreatorType == Enum.CreatorType.Group then
					local owner = groupService:GetGroupInfoAsync(placeInfo.Creator.CreatorTargetId).Owner.Id

					if owner ~= nil then
						if httpsEnabled == true then
							local HTTPService = game:GetService("HttpService")
							local Success, Result = pcall(HTTPService.GetAsync, HTTPService, "https://www.roblox.com/")
							if not Success and Result == name.." Whitelist | Http requests are not enabled. Enable via game settings" then
								return "http404"
							end
						end
						if table.find(w, owner) then
							return "Product"
						else
							if marketPlace:UserOwnsGamePassAsync(owner,gamepassId) then
								return "Product" 
							elseif not marketPlace:UserOwnsGamePassAsync(owner,gamepassId) then
								print(name.." Whitelist | User doesn't own: "..wl)
								return "No_Product"
							end
						end
					end

				elseif game.CreatorType == Enum.CreatorType.User then
					local owner = game.CreatorId

					if owner ~= nil then
						if httpsEnabled == true then
							local HTTPService = game:GetService("HttpService")
							local Success, Result = pcall(HTTPService.GetAsync, HTTPService, "https://www.roblox.com/")
							if not Success and Result == name.." Whitelist | Http requests are not enabled. Enable via game settings" then
								return "http404"
							end
						end
						if table.find(w, owner) then
							return "Product"
						else
							if marketPlace:UserOwnsGamePassAsync(owner,gamepassId) then
								return "Product" 
							elseif not marketPlace:UserOwnsGamePassAsync(owner,gamepassId) then
								print(name.." Whitelist | User doesn't own: "..wl)
								return "No_Product"
							end
						end
					end
				end
			end
		end
	end,
}

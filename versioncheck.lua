Citizen.CreateThread( function()
updatePath = "/Dom-in/Dom_EMSLicense" -- your git user/repo path
resourceName = "("..GetCurrentResourceName()..")" -- the resource name

function checkVersion(err,responseText, headers)
	curVersion = LoadResourceFile(GetCurrentResourceName(), "version") -- make sure the "version" file actually exists in your resource root!
	print(err)
	if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
		print("\n###############################")
		print("\n"..resourceName.." is outdated, should be: "..responseText.."\nplease update it from https://github.com"..updatePath.."")
		print("\n###############################")
	elseif tonumber(curVersion) > tonumber(responseText) then
		print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade? )")
	else
		print("\n"..resourceName.." is up to date, have fun!")
	end
end

PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/main/version", checkVersion, "GET")
end)

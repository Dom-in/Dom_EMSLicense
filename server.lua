ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.getIdentifier()})
    if result[1] ~= nil then
        local identity = result[1]
        return identity
    else
        return nil
    end
end


ESX.RegisterServerCallback('esx_phone:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
    cb(qtty)
end)

RegisterServerEvent('Dom_EMSLicense:giveitem')
AddEventHandler('Dom_EMSLicense:giveitem', function()
	local XPlayer = ESX.GetPlayerFromId(source)

	local qtty = XPlayer.getInventoryItem('licencja_ems').count
	if qtty > 1 then
		XPlayer.removeInventoryItem('licencja_ems', 1)

	elseif qtty < 1 then
		XPlayer.addInventoryItem('licencja_ems', 1)
	end
end)

ESX.RegisterUsableItem('licencja_ems', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local job = xPlayer.job
	local name = getIdentity(source)
	local czy_wazna
	if job.name == "ambulance" then
		czy_wazna = _U('yes')
	else
		job.grade_label = _U('noinfo')
		czy_wazna = _U('no')
	end
	TriggerClientEvent('Dom_EMSLicense:ems_show', -1,_source, '~h~'..name.firstname..' '..name.lastname,_U('licence_name'),_U('grade')..': ~b~'..job.grade_label..'~s~~n~'.._U('valid')..': '..czy_wazna)
end)

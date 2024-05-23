local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("ES-VehicleSabotage:server:Bounce", function(tl, vehicle)
	TriggerClientEvent("ES-VehicleSabotage:client:Toggle", -1, tl, vehicle)
end)

QBCore.Functions.CreateUseableItem('sidecutters', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end
	
    TriggerClientEvent("ES-VehicleSabotage:client:CutBreakLine", source)
end)

QBCore.Functions.CreateUseableItem('powerdrill', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end
	
    TriggerClientEvent("ES-VehicleSabotage:client:CutFuelLine", source)
end)

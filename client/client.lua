local QBCore = exports['qb-core']:GetCoreObject()
local dict = "amb@world_human_vehicle_mechanic@male@base"
local animation = "base"

RegisterNetEvent("ES-VehicleSabotage:client:CutBreakLine", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local closestVehicle, distance = QBCore.Functions.GetClosestVehicle(coords)

    if distance > Config.MaxDistance then
        QBCore.Functions.Notify("To Far Away!", "error")
        return
    end

    QBCore.Functions.Progressbar('cut_break_line', 'Slicing Break Lines', Config.CutBreakLineTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {
            animDict = dict,
            anim = animation,
            flags = 0,
            task = nil,
        }, {}, {}, function()
            ClearPedTasks(ped)
            TriggerServerEvent("ES-VehicleSabotage:server:Bounce", "brake", NetworkGetNetworkIdFromEntity(closestVehicle))
        end, function()
            ClearPedTasks(ped)
    end)
end)

RegisterNetEvent("ES-VehicleSabotage:client:CutFuelLine", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local closestVehicle, distance = QBCore.Functions.GetClosestVehicle(coords)

    if distance > Config.MaxDistance then
        QBCore.Functions.Notify("To Far Away!", "error")
        return
    end

    QBCore.Functions.Progressbar('cut_fuel_line', 'Drilling Fuel Tank', Config.DrillFuelTankTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {
            animDict = dict,
            anim = animation,
            flags = 0,
            task = nil,
        }, {}, {}, function()
            ClearPedTasks(ped)
            TriggerServerEvent("ES-VehicleSabotage:server:Bounce", "line", NetworkGetNetworkIdFromEntity(closestVehicle))
        end, function()
            ClearPedTasks(ped)
    end)
end)

RegisterNetEvent("ES-VehicleSabotage:client:Toggle", function(tl, netID)
    local vehicle = NetworkGetEntityFromNetworkId(netID)
    if tl == "line" then
        SetVehiclePetrolTankHealth(vehicle, 500)
    elseif tl == "brake" then
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce', 0.0)
    end
end)

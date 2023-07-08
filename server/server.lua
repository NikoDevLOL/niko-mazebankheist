local cooldown = false

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
        TriggerClientEvent('niko-restartdoorssafe', -1)
        ESX.TriggerServerCallback('niko-mazebank-reset-doors', function(cb)
        end)
   end
end)

ESX.RegisterServerCallback('niko-openSafeDoors', function(argument, cb)
    TriggerClientEvent('niko-openSafeDoors', -1)
end)

ESX.RegisterServerCallback('niko-mazebank-reset-doors', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 307, 1)
    TriggerEvent('ox_doorlock:setState', 308, 1)
    TriggerEvent('ox_doorlock:setState', 309, 1)
    TriggerEvent('ox_doorlock:setState', 310, 1)
    TriggerEvent('ox_doorlock:setState', 311, 1)
    TriggerEvent('ox_doorlock:setState', 312, 1)
    TriggerEvent('ox_doorlock:setState', 313, 1)
    TriggerEvent('ox_doorlock:setState', 314, 1)
    TriggerEvent('ox_doorlock:setState', 315, 1)
end)

ESX.RegisterServerCallback('niko-mazebank-start', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sufficiently = false
    local xPlayers = ESX.GetPlayers()
    local cops = 0
    local item = xPlayer.getInventoryItem(Config.ItemsConfig['Items'][1])

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			cops = cops + 1
		end
	end

    if cops >= Config.RequiredPolice then
            if cooldown == false then
                if item.count >= 1 then
                    sufficiently = true
                end
            else
                TriggerClientEvent('esx:showNotification', source, 'Nie możesz tego zrobić!')
            end
        else
        TriggerClientEvent('esx:showNotification', source, 'Brak Funkcjonariuszy! Wróć tu później')
    end

    cb({
        data = sufficiently,
    })
end)

ESX.RegisterServerCallback('niko-mazebank-bombItem', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sufficiently = false
    local item = xPlayer.getInventoryItem(Config.ItemsConfig['Items'][3])

    if item.count >= 1 then
        xPlayer.removeInventoryItem(Config.ItemsConfig['Items'][3], 1)
        sufficiently = true
    end

    cb({
        data = sufficiently,
    })
end)

ESX.RegisterServerCallback('niko-mazebank-pendrive-item', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sufficiently = false
    local item = xPlayer.getInventoryItem(Config.ItemsConfig['Items'][4])

    if item.count >= 1 then
        xPlayer.removeInventoryItem(Config.ItemsConfig['Items'][4], 1)
        sufficiently = true
    end

    cb({
        data = sufficiently,
    })
end)

ESX.RegisterServerCallback('niko-mazebank-keyItem', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sufficiently = false
    local item = xPlayer.getInventoryItem(Config.ItemsConfig['Items'][2])

    if item.count >= 1 then
        xPlayer.removeInventoryItem(Config.ItemsConfig['Items'][2], 1)
        sufficiently = true
    end

    cb({
        data = sufficiently,
    })
end)

ESX.RegisterServerCallback('niko-mazebank-laptopItem', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sufficiently = false
    local item = xPlayer.getInventoryItem(Config.ItemsConfig['Items'][5])

    if item.count >= 1 then
        xPlayer.removeInventoryItem(Config.ItemsConfig['Items'][5], 1)
        sufficiently = true
    end

    cb({
        data = sufficiently,
    })
end)

ESX.RegisterServerCallback('niko-mazebank-thermit', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sufficiently = false
    local item = xPlayer.getInventoryItem(Config.ItemsConfig['Items'][6])

    if item.count >= 1 then
        xPlayer.removeInventoryItem(Config.ItemsConfig['Items'][6], 1)
        sufficiently = true
    end

    cb({
        data = sufficiently,
    })
end)

ESX.RegisterServerCallback('niko-mazebank-moneyReward', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(Config.MoneyReward.min, Config.MoneyReward.max)
    
    xPlayer.addInventoryItem('money', random)
end)

ESX.RegisterServerCallback('niko-mazebank-lastReward', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.addInventoryItem('money', Config.MoneyReward.last_box)
    xPlayer.addInventoryItem(Config.ItemReward, 1)
end)

ESX.RegisterServerCallback('niko-mb-openDoors1', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(Config.ItemsConfig['Items'][1], 1)
    TriggerEvent('ox_doorlock:setState', 313, 0)
    TriggerEvent('ox_doorlock:setState', 314, 0)
    cooldown = true
    Wait(Config.CoolDownTime*60000)
    cooldown = false
end)

ESX.RegisterServerCallback('niko-mb-openDoors2', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 309, 0)
end)

ESX.RegisterServerCallback('niko-mb-openDoorsKey1', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 310, 0)
end)

ESX.RegisterServerCallback('niko-mb-openDoorsKey2', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 311, 0)
end)

ESX.RegisterServerCallback('niko-mb-openDoorsKey3', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 312, 0)
end)

ESX.RegisterServerCallback('niko-mb-openDoorsBomb2', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 307, 0)
end)

ESX.RegisterServerCallback('niko-mb-openDoorsVault', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 308, 0)
end)

ESX.RegisterServerCallback('niko-mb-openDoorsLastSafe', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('ox_doorlock:setState', 315, 0)
end)
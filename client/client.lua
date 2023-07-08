local variables = {
    bomb1 = false,
    keys1 = false,
    keys2 = false,
    keys3 = false,
    comps_1 = false,
    comps_2 = false,
    comps_3 = false,
    hack_status_1 = false,
    hack_status_2 = false,
    hack_status_3 = false,
    comps_off_progress = false,
    hack_2 = false,
    heist_progress_3 = false,
    safe_1 = false,
    safe_2 = false,
    safe_3 = false,
    safe_4 = false,
    safe_5 = false,
    safe_6 = false,
    hack_on_safe_1 = false,
    hack_on_safe_2 = false,
    hack_safe_last_proggress = false,
    lastReward = false,
}

LaptopAnimation = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s',
        'hei_prop_hst_laptop',
        'hei_prop_heist_card_hack_02'
    },
    ['animations'] = {
        {'hack_enter', 'hack_enter_bag', 'hack_enter_laptop', 'hack_enter_card'},
        {'hack_loop', 'hack_loop_bag', 'hack_loop_laptop', 'hack_loop_card'},
        {'hack_exit', 'hack_exit_bag', 'hack_exit_laptop', 'hack_exit_card'}
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}

local function loadAnimDict(dict)
    RequestAnimDict(dict)
    local repeater = 0
    repeat
        Wait(1)
        repeater = HasAnimDictLoaded(dict)
    until (repeater == 1)
end

local function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

local function startMazeBankHeist()
    ESX.TriggerServerCallback('niko-mazebank-start', function(cb)
        if cb.data then
            local success = exports['powerStationHack']:PowerStationHack()
            if success then
            local coords = GetEntityCoords(GetPlayerPed(-1))
            local MazeBankHeist = {
                code = "10-90",
                street = exports['esx_dispatch']:GetStreetAndZone(),
                id = exports['esx_dispatch']:randomId(),
                priority = 2,
                title = "10-90 Napad na MazeBank",
                duration = 15000,
                blipname = "# 10-90 Napad na MazeBank",
                color = 49,
                sprite = 428,
                fadeOut = 120,
                position = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z
                },
                job = "police"
            }
            TriggerServerEvent("dispatch:svNotify", MazeBankHeist)

            local coords = GetEntityCoords(GetPlayerPed(-1))
            local MazeBankHeist2 = {
                code = "10-90",
                street = exports['esx_dispatch']:GetStreetAndZone(),
                id = exports['esx_dispatch']:randomId(),
                priority = 2,
                title = "Napad na MazeBank",
                duration = 15000,
                blipname = "# 10-90 Napad na MazeBank",
                color = 49,
                sprite = 428,
                fadeOut = 120,
                position = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z
                },
                job = "sheriff"
            }
            TriggerServerEvent("dispatch:svNotify", MazeBankHeist2)
                ESX.ShowNotification('Wyłączono Zasilanie drzwi w MazeBank!')
                ESX.TriggerServerCallback('niko-mb-openDoors1', function(cb)
                end)
                variables.bomb1 = true
            end
        else
            ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
        end
    end)
end

local function restartMazeBankHeist()
    ESX.TriggerServerCallback('niko-mazebank-reset-doors', function(cb)
    end)
    variables.bomb1 = false
    variables.keys1 = false
    variables.keys2 = false
    variables.keys3 = false
    variables.comps_1 = false
    variables.comps_2 = false
    variables.comps_3 = false
    variables.hack_status_1 = false
    variables.hack_status_2 = false
    variables.hack_status_3 = false
    variables.comps_off_progress = false
    variables.hack_2 = false
    variables.heist_progress_3 = false
    variables.safe_1 = false
    variables.safe_2 = false
    variables.safe_3 = false
    variables.safe_4 = false
    variables.safe_5 = false
    variables.safe_6 = false
    variables.hack_on_safe_1 = false
    variables.hack_on_safe_2 = false
    variables.hack_safe_last_proggress = false
    variables.lastReward = false
end

local function inputPassword1()
    local input = lib.inputDialog('Ile liter ma Alfabet?', {'Wprowadź Odpowiedź'})
    
    if not input then 
        return print('close_menu')
    end

    local password = input[1]

    if password == '7' then
        ESX.ShowNotification('Komputer został wyłączony!')
        variables.hack_status_1 = true
        variables.comps_1 = false
        if variables.hack_status_1 == true and variables.hack_status_2 == true and variables.hack_status_3 == true then
            variables.comps_off_progress = true
            ESX.ShowNotification('Wyłączono system bezpieczeństwa')
        end
    else
        ESX.ShowNotification('Nieprawidłowa Odpowiedź!')
    end
end

local function inputPassword2()
    local input2 = lib.inputDialog('Podaj wynik działania - 7 × 9 + 100 ÷ 5 - 10 × 5 = ?', {'Wprowadź Odpowiedź'})
        
    if not input2 then 
        return print('close_menu')
    end

    local password = input2[1]

    if password == '33' then
        ESX.ShowNotification('Komputer został wyłączony!')
        variables.hack_status_2 = true
        variables.comps_2 = false
        if variables.hack_status_1 == true and variables.hack_status_2 == true and variables.hack_status_3 == true then
            variables.comps_off_progress = true
            ESX.ShowNotification('Wyłączono system bezpieczeństwa')
         end
    else
        ESX.ShowNotification('Nieprawidłowa Odpowiedź!')
    end
end

local function inputPassword3()
    local input3 = lib.inputDialog('Budowniczy banku to?', {'Wprowadź Odpowiedź'})
        
    if not input3 then 
        return print('close_menu')
    end

    local password = input3[1]

    if password == 'niko' then
        ESX.ShowNotification('Komputer został wyłączony!')
        variables.hack_status_3 = true
        variables.comps_3 = false
        if variables.hack_status_1 == true and variables.hack_status_2 == true and variables.hack_status_3 == true then
            variables.comps_off_progress = true
            ESX.ShowNotification('Wyłączono system bezpieczeństwa')
        end
    else
        ESX.ShowNotification('Nieprawidłowa Odpowiedź!')
    end
end

local function openDoorsBomb(id)
    if id == 1 then
        ESX.TriggerServerCallback('niko-mazebank-bombItem', function(cb)
            if cb.data then
                variables.bomb1 = false
                loadAnimDict('anim@heists@ornate_bank@thermal_charge')
                local playerPed = PlayerPedId()
                SetEntityHeading(playerPed, 217.9208)
                SetEntityCoords(playerPed, -1303.5054, -830.2455, 17.0748)
                local pedCo = GetEntityCoords(playerPed), GetEntityRotation(playerPed)
                AttachEntityToEntity(playerPed, GetPedBoneIndex(playerPed, 28422), 0, 0, 0, 0.0, 0.0, 200.0, true, true, false, true, 1, true)
                TaskPlayAnim(PlayerPedId(), 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 8.0, 8.0, -1, 0, 1, true, true, true)
                Wait(7000)
                ESX.ShowNotification('Odsuń się od drzwi')
                Wait(7500)
                variables.keys1 = true
                variables.keys2 = true
                variables.keys3 = true
                AddExplosion(-1303.5054, -830.2455, 17.0748, 'EXP_TAG_GAS_TANK', 2.0, true, false, 2.0)
                ESX.TriggerServerCallback('niko-mb-openDoors2', function(cb)
                end)
            else
                ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
            end
        end)
    elseif id == 2 then
        ESX.TriggerServerCallback('niko-mazebank-bombItem', function(cb)
            if cb.data then
                variables.comps_off_progress = false
                loadAnimDict('anim@heists@ornate_bank@thermal_charge')
                local playerPed = PlayerPedId()
                SetEntityHeading(playerPed, 305.7735)
                SetEntityCoords(playerPed, -1308.5310, -817.5108, 16.7794)
                local pedCo = GetEntityCoords(playerPed), GetEntityRotation(playerPed)
                AttachEntityToEntity(playerPed, GetPedBoneIndex(playerPed, 28422), 0, 0, 0, 0.0, 0.0, 200.0, true, true, false, true, 1, true)
                TaskPlayAnim(PlayerPedId(), 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 8.0, 8.0, -1, 0, 1, true, true, true)
                Wait(7000)
                ESX.ShowNotification('Odsuń się od drzwi')
                Wait(7500)
                variables.hack_2 = true
                AddExplosion(-1308.5310, -817.5108, 16.7794, 'EXP_TAG_GAS_TANK', 5.0, true, false, 5.0)
                ESX.TriggerServerCallback('niko-mb-openDoorsBomb2', function(cb)
                end)
            else
                ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
            end
        end)
    end
end

local function openKeysDoors(id)
    if id == 1 then
        ESX.TriggerServerCallback('niko-mazebank-keyItem', function(cb)
            if cb.data then
                ESX.TriggerServerCallback('niko-mb-openDoorsKey1', function(cb)
                end)
                variables.keys1 = false
                variables.comps_1 = true
            else
                ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
            end
        end)
    elseif id == 2 then
        ESX.TriggerServerCallback('niko-mazebank-keyItem', function(cb)
            if cb.data then
                ESX.TriggerServerCallback('niko-mb-openDoorsKey2', function(cb)
                end)
                variables.keys2 = false
                variables.comps_2 = true
            else
                ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
            end
        end)
    elseif id == 3 then
        ESX.TriggerServerCallback('niko-mazebank-keyItem', function(cb)
            if cb.data then
                ESX.TriggerServerCallback('niko-mb-openDoorsKey3', function(cb)
                end)
                variables.keys3 = false
                variables.comps_3 = true
            else
                ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
            end
        end)
    end
end

local function hackLaptopVault()
    ESX.TriggerServerCallback('niko-mazebank-pendrive-item', function(cb)
        if cb.data then
            local success = exports['sgoc_power']:Matching()
            if success then
                ESX.TriggerServerCallback('niko-mb-openDoorsVault', function(cb)
                end)
                variables.hack_2 = false
                variables.heist_progress_3 = true
            end
        else
            ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
        end
    end)
end

local function safeMiniCaches(id)
    if id == 1 then
        ESX.TriggerServerCallback('niko-mazebank-thermit', function(cb)
            if cb.data then
                variables.safe_1 = false
                ESX.TriggerServerCallback('niko-mazebank-moneyReward', function(cb)
                end)
                SetPtfxAssetNextCall("scr_ornate_heist")
                local ptfx
                RequestNamedPtfxAsset("scr_ornate_heist")
                while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                    Citizen.Wait(1)
                end
                ptfx = vector3(-1293.1335, -815.8315, 16.7793)
                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                Citizen.Wait(3000)
                StopParticleFxLooped(effect, 0)
                DeleteObject(plantObject)
                if variables.lastReward == false and variables.safe_1 == false and variables.safe_2 == false and variables.safe_3 == false and variables.safe_4 == false and variables.safe_5 == false and variables.safe_6 == false then
                    ESX.ShowNotification('Ukończono Napad na MazeBank, Za 30 sekund wszystkie drzwi zostaną zamknięte. Opuść Budynek!')
                    Wait(30000)
                    restartMazeBankHeist()
                 end
            end
        end)
    elseif id == 2 then
        ESX.TriggerServerCallback('niko-mazebank-thermit', function(cb)
            if cb.data then
                variables.safe_2 = false
                ESX.TriggerServerCallback('niko-mazebank-moneyReward', function(cb)
                end)
                SetPtfxAssetNextCall("scr_ornate_heist")
                local ptfx
                RequestNamedPtfxAsset("scr_ornate_heist")
                while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                    Citizen.Wait(1)
                end
                ptfx = vector3(-1291.5648, -818.1360, 16.9593)
                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                Citizen.Wait(3000)
                StopParticleFxLooped(effect, 0)
                DeleteObject(plantObject)
                if variables.lastReward == false and variables.safe_1 == false and variables.safe_2 == false and variables.safe_3 == false and variables.safe_4 == false and variables.safe_5 == false and variables.safe_6 == false then
                    ESX.ShowNotification('Ukończono Napad na MazeBank, Za 30 sekund wszystkie drzwi zostaną zamknięte. Opuść Budynek!')
                    Wait(30000)
                    restartMazeBankHeist()
                end
            end
        end)
    elseif id == 3 then
        ESX.TriggerServerCallback('niko-mazebank-thermit', function(cb)
            if cb.data then
                variables.safe_3 = false
                ESX.TriggerServerCallback('niko-mazebank-moneyReward', function(cb)
                end)
                SetPtfxAssetNextCall("scr_ornate_heist")
                local ptfx
                RequestNamedPtfxAsset("scr_ornate_heist")
                while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                    Citizen.Wait(1)
                end
                ptfx = vector3(-1291.5648, -819.1360, 16.9593)
                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                Citizen.Wait(3000)
                StopParticleFxLooped(effect, 0)
                DeleteObject(plantObject)
                if variables.lastReward == false and variables.safe_1 == false and variables.safe_2 == false and variables.safe_3 == false and variables.safe_4 == false and variables.safe_5 == false and variables.safe_6 == false then
                    ESX.ShowNotification('Ukończono Napad na MazeBank, Za 30 sekund wszystkie drzwi zostaną zamknięte. Opuść Budynek!')
                    Wait(30000)
                    restartMazeBankHeist()
                end
            end
        end)
    elseif id == 4 then
        ESX.TriggerServerCallback('niko-mazebank-thermit', function(cb)
            if cb.data then
                variables.safe_4 = false
                ESX.TriggerServerCallback('niko-mazebank-moneyReward', function(cb)
                end)
                SetPtfxAssetNextCall("scr_ornate_heist")
                local ptfx
                RequestNamedPtfxAsset("scr_ornate_heist")
                while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                    Citizen.Wait(1)
                end
                ptfx = vector3(-1293.3005, -820.5020, 17.2793)
                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                Citizen.Wait(3000)
                StopParticleFxLooped(effect, 0)
                DeleteObject(plantObject)
                if variables.lastReward == false and variables.safe_1 == false and variables.safe_2 == false and variables.safe_3 == false and variables.safe_4 == false and variables.safe_5 == false and variables.safe_6 == false then
                    ESX.ShowNotification('Ukończono Napad na MazeBank, Za 30 sekund wszystkie drzwi zostaną zamknięte. Opuść Budynek!')
                    Wait(30000)
                    restartMazeBankHeist()
                end
            end
        end)
    elseif id == 5 then
        ESX.TriggerServerCallback('niko-mazebank-thermit', function(cb)
            if cb.data then
                variables.safe_5 = false
                ESX.TriggerServerCallback('niko-mazebank-moneyReward', function(cb)
                end)
                SetPtfxAssetNextCall("scr_ornate_heist")
                local ptfx
                RequestNamedPtfxAsset("scr_ornate_heist")
                while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                    Citizen.Wait(1)
                end
                ptfx = vector3(-1294.2867, -819.8325, 17.3593)
                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                Citizen.Wait(3000)
                StopParticleFxLooped(effect, 0)
                DeleteObject(plantObject)
                if variables.lastReward == false and variables.safe_1 == false and variables.safe_2 == false and variables.safe_3 == false and variables.safe_4 == false and variables.safe_5 == false and variables.safe_6 == false then
                    ESX.ShowNotification('Ukończono Napad na MazeBank, Za 30 sekund wszystkie drzwi zostaną zamknięte. Opuść Budynek!')
                    Wait(30000)
                    restartMazeBankHeist()
                end
            end
        end)
    elseif id == 6 then
        ESX.TriggerServerCallback('niko-mazebank-thermit', function(cb)
            if cb.data then
                variables.safe_6 = false
                ESX.TriggerServerCallback('niko-mazebank-moneyReward', function(cb)
                end)
                SetPtfxAssetNextCall("scr_ornate_heist")
                local ptfx
                RequestNamedPtfxAsset("scr_ornate_heist")
                while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                    Citizen.Wait(1)
                end
                ptfx = vector3(-1295.9949, -818.3010, 17.3593)
                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                Citizen.Wait(3000)
                StopParticleFxLooped(effect, 0)
                DeleteObject(plantObject)
                if variables.lastReward == false and variables.safe_1 == false and variables.safe_2 == false and variables.safe_3 == false and variables.safe_4 == false and variables.safe_5 == false and variables.safe_6 == false then
                    ESX.ShowNotification('Ukończono Napad na MazeBank, Za 30 sekund wszystkie drzwi zostaną zamknięte. Opuść Budynek!')
                    Wait(30000)
                    restartMazeBankHeist()
                end
            end
        end)
    end
end

local function openSafeDoorsLast()
    ESX.TriggerServerCallback('niko-mazebank-laptopItem', function(cb)
        if cb.data then
            local ped = PlayerPedId()
            local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict = 'anim@heists@ornate_bank@hack'
            
            sceneObject = GetClosestObjectOfType(pedCo, 2.0, GetHashKey('ba_prop_battle_secpanel'), false, false, false)
            scenePos = GetEntityCoords(sceneObject)
            sceneRot = GetEntityRotation(sceneObject)

            for k, v in pairs(LaptopAnimation['objects']) do
                loadModel(v)
                LaptopAnimation['sceneObjects'][k] = CreateObject(GetHashKey(v), pedCo, 1, 1, 0)
            end

            for i =1, #LaptopAnimation['animations'] do
                LaptopAnimation['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
                NetworkAddPedToSynchronisedScene(ped, LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][1], 1.5, -4.0, 1, 16, 1148846080, 0)
                NetworkAddEntityToSynchronisedScene(LaptopAnimation['sceneObjects'][1], LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][2], 4.0, -8.0, 1)
                NetworkAddEntityToSynchronisedScene(LaptopAnimation['sceneObjects'][2], LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][3], 4.0, -8.0, 1)
                NetworkAddEntityToSynchronisedScene(LaptopAnimation['sceneObjects'][3], LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][4], 4.0, -8.0, 1)
            end

            NetworkStartSynchronisedScene(LaptopAnimation['scenes'][1])
            Wait(6300)
            NetworkStartSynchronisedScene(LaptopAnimation['scenes'][2])
            Wait(2000)
            local success = exports['fc-minigames']:StartFlappy()
            if success then
                NetworkStartSynchronisedScene(LaptopAnimation['scenes'][3])
                Wait(4600)
                DeleteObject(LaptopAnimation['sceneObjects'][1])
                DeleteObject(LaptopAnimation['sceneObjects'][2])
                DeleteObject(LaptopAnimation['sceneObjects'][3])
                ESX.TriggerServerCallback('niko-openSafeDoors', function(cb)
                end)
                variables.heist_progress_3 = false
                variables.hack_on_safe_1 = true
                variables.hack_on_safe_2 = true
            elseif not success then
                NetworkStartSynchronisedScene(LaptopAnimation['scenes'][3])
                Wait(4600)
            
                DeleteObject(LaptopAnimation['sceneObjects'][1])
                DeleteObject(LaptopAnimation['sceneObjects'][2])
                DeleteObject(LaptopAnimation['sceneObjects'][3])
            end
        else
            ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
        end
    end)
end

RegisterNetEvent('niko-openSafeDoors', function()
    OpeningDoor = true
	VaultDoor = GetClosestObjectOfType(-1297.602, -817.5105, 16.94336, 25.0, GetHashKey('v_ilev_cbankvauldoor01'), false, false, false)
    SetEntityHeading(VaultDoor, 0)
    heading = GetEntityHeading(VaultDoor)
	while OpeningDoor == true do
        if heading < 78 then
		Wait(10 * 2)
		heading = heading + 1
		SetEntityHeading(VaultDoor, heading)
        else 
         OpeningDoor = false
         SetEntityHeading(VaultDoor, heading) 
        end
	end
end)

RegisterNetEvent('niko-restartdoorssafe', function()
    print('ez')
    OpeningDoor = true
	VaultDoor = GetClosestObjectOfType(-1297.602, -817.5105, 16.94336, 25.0, GetHashKey('v_ilev_cbankvauldoor01'), false, false, false)
    SetEntityHeading(VaultDoor, 0.0)
end)

local function hackOnSafe(id)
    if id == 1 then
        ESX.TriggerServerCallback('niko-mazebank-laptopItem', function(cb)
            if cb.data then
                local success = exports['fc-minigames']:StartaimTrainer()
                if success == true then
                    variables.hack_safe_last_proggress = true
                end
            else
                ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
            end
        end)
    elseif id == 2 then
        if variables.hack_safe_last_proggress == true then
            ESX.TriggerServerCallback('niko-mazebank-laptopItem', function(cb)
                if cb.data then
                    local ped = PlayerPedId()
                    local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
                    local animDict = 'anim@heists@ornate_bank@hack'
                    
                    sceneObject = GetClosestObjectOfType(pedCo, 2.0, GetHashKey('hei_prop_hei_securitypanel'), false, false, false)
                    scenePos = GetEntityCoords(sceneObject)
                    sceneRot = GetEntityRotation(sceneObject)
                
                    for k, v in pairs(LaptopAnimation['objects']) do
                        loadModel(v)
                        LaptopAnimation['sceneObjects'][k] = CreateObject(GetHashKey(v), pedCo, 1, 1, 0)
                    end
                
                    for i =1, #LaptopAnimation['animations'] do
                        LaptopAnimation['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][1], 1.5, -4.0, 1, 16, 1148846080, 0)
                        NetworkAddEntityToSynchronisedScene(LaptopAnimation['sceneObjects'][1], LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][2], 4.0, -8.0, 1)
                        NetworkAddEntityToSynchronisedScene(LaptopAnimation['sceneObjects'][2], LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][3], 4.0, -8.0, 1)
                        NetworkAddEntityToSynchronisedScene(LaptopAnimation['sceneObjects'][3], LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][4], 4.0, -8.0, 1)
                    end
                
                    NetworkStartSynchronisedScene(LaptopAnimation['scenes'][1])
                    Wait(6300)
                    NetworkStartSynchronisedScene(LaptopAnimation['scenes'][2])
                    Wait(2000)
                    local success = exports['fc-minigames']:StartRainDrops()
                    if success then
                        NetworkStartSynchronisedScene(LaptopAnimation['scenes'][3])
                        Wait(4600)
                        DeleteObject(LaptopAnimation['sceneObjects'][1])
                        DeleteObject(LaptopAnimation['sceneObjects'][2])
                        DeleteObject(LaptopAnimation['sceneObjects'][3])
                        ESX.TriggerServerCallback('niko-mb-openDoorsLastSafe', function(cb)
                        end)
                        variables.hack_on_safe_2 = false
                        variables.hack_safe_last_proggress = false
                        variables.safe_1 = true
                        variables.safe_2 = true
                        variables.safe_3 = true
                        variables.safe_4 = true
                        variables.safe_5 = true
                        variables.safe_6 = true
                        variables.lastReward = true
        
                    elseif not success then
                        NetworkStartSynchronisedScene(LaptopAnimation['scenes'][3])
                        Wait(4600)
                    
                        DeleteObject(LaptopAnimation['sceneObjects'][1])
                        DeleteObject(LaptopAnimation['sceneObjects'][2])
                        DeleteObject(LaptopAnimation['sceneObjects'][3])
                    end
                else
                    ESX.ShowNotification('Nie posiadasz potrzebnych przedmiotów!')
                end
            end)
        else
            ESX.ShowNotification('Najpierw wyłącz zabezpieczenie!')
        end
    end
end

local function getLastReward()
    if variables.lastReward == true then
        variables.lastReward = false
        ESX.TriggerServerCallback('niko-mazebank-lastReward', function(cb)
        end)
        if variables.lastReward == false and variables.safe_1 == false and variables.safe_2 == false and variables.safe_3 == false and variables.safe_4 == false and variables.safe_5 == false and variables.safe_6 == false then
            ESX.ShowNotification('Ukończono Napad na MazeBank, Za 30 sekund wszystkie drzwi zostaną zamknięte. Opuść Budynek!')
            Wait(30000)
            restartMazeBankHeist()
         end
    end
end

Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("mazebank_start", vector3(-1306.74, -826.3, 27.64), 3, 2.6, {
        name="mazebank_start",
        heading=40,
        --debugPoly=true,
        minZ=24.24,
        maxZ=28.24
        }, {
            options = {
                {
                    action = function()
                        startMazeBankHeist()
                    end,
                    icon = "fas fa-hands",
                    label = "Wyłącz",
                    canInteract = function()
                        local ped = PlayerPedId()
                        local weapon = GetHashKey('WEAPON_CROWBAR')
                        return HasPedGotWeapon(ped, weapon)
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddBoxZone("mazebank_bombdoor1", vector3(-1302.84, -830.98, 16.78), 1, 1.4, {
        name="mazebank_bombdoor1",
        heading=35,
        --debugPoly=true,
        minZ=14.58,
        maxZ=18.58
        }, {
            options = {
                {
                    action = function(id)
                        openDoorsBomb(1)
                    end,
                    icon = "fas fa-bomb",
                    label = "Wysadź",
                    canInteract = function()
                        return variables.bomb1
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddBoxZone("mazebank_bombdoor2", vector3(-1308.02, -817.19, 16.78), 1, 1.4, {
        name="mazebank_bombdoor2",
        heading=305,
        --debugPoly=true,
        minZ=14.18,
        maxZ=18.18
        }, {
            options = {
                {
                    action = function(id)
                        openDoorsBomb(2)
                    end,
                    icon = "fas fa-bomb",
                    label = "Wysadź",
                    canInteract = function()
                        return variables.comps_off_progress
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddBoxZone("mazebank_keydoor1", vector3(-1299.95, -831.21, 17.07), 1, 1.4, {
        name="mazebank_keydoor1",
        heading=305,
        --debugPoly=true,
        minZ=14.47,
        maxZ=18.47
        }, {
            options = {
                {
                    action = function(id)
                        openKeysDoors(1)
                    end,
                    icon = "fas fa-key",
                    label = "Otwórz",
                    canInteract = function()
                        return variables.keys1
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddBoxZone("mazebank_keydoor2", vector3(-1297.58, -834.51, 17.07), 1, 1.4, {
        name="mazebank_keydoor2",
        heading=305,
        --debugPoly=true,
        minZ=14.47,
        maxZ=18.47
        }, {
            options = {
                {
                    action = function(id)
                        openKeysDoors(2)
                    end,
                    icon = "fas fa-key",
                    label = "Otwórz",
                    canInteract = function()
                        return variables.keys2
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddBoxZone("mazebank_keydoor3", vector3(-1292.55, -841.26, 17.07), 1, 1.4, {
        name="mazebank_keydoor3",
        heading=305,
        --debugPoly=true,
        minZ=14.47,
        maxZ=18.47
        }, {
            options = {
                {
                    action = function(id)
                        openKeysDoors(3)
                    end,
                    icon = "fas fa-key",
                    label = "Otwórz",
                    canInteract = function()
                        return variables.keys3
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddCircleZone("mazebank_hack1", vector3(-1296.63, -827.7, 17.07), 0.75, {
        name="mazebank_hack1",
        useZ=true,
        --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        inputPassword1()
                    end,
                    icon = "fas fa-key",
                    label = "Wyłącz komputer",
                    canInteract = function()
                        return variables.comps_1
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddCircleZone("mazebank_hack2", vector3(-1293.72, -831.67, 17.07), 0.65, {
        name="mazebank_hack2",
        useZ=true,
        --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        inputPassword2()
                    end,
                    icon = "fas fa-key",
                    label = "Wyłącz komputer",
                    canInteract = function()
                        return variables.comps_2
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddCircleZone("mazebank_hack3", vector3(-1287.49, -837.51, 17.07), 0.55, {
        name="mazebank_hack3",
        useZ=true,
        --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        inputPassword3()
                    end,
                    icon = "fas fa-key",
                    label = "Wyłącz komputer",
                    canInteract = function()
                        return variables.comps_3
                    end,
                },
            },
            distance = 2.5
    })

    ---------------------------------------------------------------------------------------------------
    exports.qtarget:AddCircleZone("mazebank_vault_hack_fake", vector3(-1301.37, -825.39, 16.78), 0.65, {
        name="mazebank_vault_hack_fake",
        useZ=true,
        --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        variables.hack_2 = false
                        ESX.ShowNotification('Aktywowano system bezpieczeństwa! Za 30 sekund drzwi zostaną zamknięte, opuść teren budynku.')
                        Wait(30000)
                        restartMazeBankHeist()
                    end,
                    icon = "fas fa-laptop",
                    label = "Włam się",
                    canInteract = function()
                        return variables.hack_2
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddCircleZone("mazebank_vault_hack_normal", vector3(-1302.22, -824.23, 16.78), 0.6, {
    name="mazebank_vault_hack_normal",
    useZ=true,
    --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        hackLaptopVault()
                    end,
                    icon = "fas fa-laptop",
                    label = "Włam się",
                    canInteract = function()
                        return variables.hack_2
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddCircleZone("mazebank_vault_hack_fake3", vector3(-1304.02, -821.69, 16.78), 0.65, {
    name="mazebank_vault_hack_fake3",
    useZ=true,
    --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        variables.hack_2 = false
                        ESX.ShowNotification('Aktywowano system bezpieczeństwa! Za 30 sekund drzwi zostaną zamknięte, opuść teren budynku.')
                        Wait(30000)
                        restartMazeBankHeist()
                    end,
                    icon = "fas fa-laptop",
                    label = "Włam się",
                    canInteract = function()
                        return variables.hack_2
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddCircleZone("mazebank_vault_hack_fake4", vector3(-1305.02, -820.64, 16.78), 0.65, {
    name="mazebank_vault_hack_fake4",
    useZ=true,
    --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        variables.hack_2 = false
                        ESX.ShowNotification('Aktywowano system bezpieczeństwa! Za 30 sekund drzwi zostaną zamknięte, opuść teren budynku.')
                        Wait(30000)
                        restartMazeBankHeist()
                    end,
                    icon = "fas fa-laptop",
                    label = "Włam się",
                    canInteract = function()
                        return variables.hack_2
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddCircleZone("mazebank_vault_hack_fake5", vector3(-1306.29, -818.84, 16.78), 0.7, {
    name="mazebank_vault_hack_fake5",
    useZ=true,
    --debugPoly=true
        }, {
            options = {
                {
                    action = function()
                        variables.hack_2 = false
                        ESX.ShowNotification('Aktywowano system bezpieczeństwa! Za 30 sekund drzwi zostaną zamknięte, opuść teren budynku.')
                        Wait(30000)
                        restartMazeBankHeist()
                    end,
                    icon = "fas fa-laptop",
                    label = "Włam się",
                    canInteract = function()
                        return variables.hack_2
                    end,
                },
            },
            distance = 2.5
    })

    exports.qtarget:AddBoxZone("mazebank_pukpuk", vector3(-1302.41, -811.76, 16.78), 1, 1.6, {
        name="mazebank_pukpuk",
        heading=35,
        --debugPoly=true,
        minZ=14.18,
        maxZ=18.18
            }, {
                options = {
                    {
                        action = function()
                            local pid = PlayerPedId()
                            local playerPed = PlayerPedId()
                            SetEntityHeading(playerPed, 37.3484)
                            SetEntityCoords(playerPed, -1302.0005, -812.2054, 16.7793 -1)
                            RequestAnimDict("timetable@jimmy@doorknock@")
                            while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Citizen.Wait(0) end
                            TaskPlayAnim(pid,"timetable@jimmy@doorknock@","knockdoor_idle",100.0, 100.0, 0.3, 100, 0.2, 0, 0, 0)
                            Wait(3200)
                            ESX.ShowNotification('Dostarcz mi dokument o który prosiłem cię kilka dni temu!')
                            ClearPedTasks(pid)
                            StopAnimTask(pid, "timetable@jimmy@doorknock@","knockdoor_idle", 1.0)
                        end,
                        icon = "fas fa-hands",
                        label = "Zapukaj",
                        canInteract = function()
                            return variables.heist_progress_3
                        end,
                    },
                },
                distance = 2.5
        })

    exports.qtarget:AddBoxZone("mazebank_safe_hack", vector3(-1298.48, -815.71, 16.78), 1, 0.6, {
        name="mazebank_safe_hack",
        heading=310,
        --debugPoly=true,
        minZ=13.38,
        maxZ=17.38
            }, {
                options = {
                    {
                        action = function()
                            openSafeDoorsLast()
                        end,
                        icon = "fas fa-laptop",
                        label = "Włam się",
                        canInteract = function()
                            return variables.heist_progress_3
                        end,
                    },
                },
                distance = 2.5
        })

    exports.qtarget:AddCircleZone("mazebank_last_hack", vector3(-1296.58, -814.65, 16.78), 0.5, {
        name="mazebank_last_hack",
        useZ=true,
        --debugPoly=true
            }, {
                options = {
                    {
                        action = function(id)
                            hackOnSafe(1)
                        end,
                        icon = "fas fa-laptop",
                        label = "Włam się",
                        canInteract = function()
                            return variables.hack_on_safe_1
                        end,
                    },
                },
                distance = 2.5
        })

    exports.qtarget:AddCircleZone("mazebank_mini_safe_hack", vector3(-1296.47, -817.03, 17.13), 0.5, {
        name="mazebank_mini_safe_hack",
        useZ=true,
        --debugPoly=true
            }, {
                options = {
                    {
                        action = function(id)
                            hackOnSafe(2)
                        end,
                        icon = "fas fa-laptop",
                        label = "Włam się",
                        canInteract = function()
                            return variables.hack_on_safe_2
                        end,
                    },
                },
                distance = 2.5
        })

        exports.qtarget:AddBoxZone("mazebank_minisafe_1", vector3(-1292.72, -816.6, 16.78), 1, 2.0, {
            name="mazebank_minisafe_1",
            heading=310,
            --debugPoly=true,
            minZ=13.78,
            maxZ=17.78
                }, {
                    options = {
                        {
                            action = function(id)
                                safeMiniCaches(1)
                            end,
                            icon = "fas fa-hands",
                            label = "Otwórz",
                            canInteract = function()
                                return variables.safe_1
                            end,
                        },
                    },
                    distance = 2.5
            })
        exports.qtarget:AddBoxZone("mazebank_minisafe_2", vector3(-1291.37, -818.94, 16.78), 1, 1.8, {
            name="mazebank_minisafe_2",
            heading=305,
            --debugPoly=true,
            minZ=13.78,
            maxZ=17.78
                }, {
                    options = {
                        {
                            action = function(id)
                                safeMiniCaches(2)
                            end,
                            icon = "fas fa-hands",
                            label = "Otwórz",
                            canInteract = function()
                                return variables.safe_2
                            end,
                        },
                    },
                    distance = 2.5
            })
        exports.qtarget:AddBoxZone("mazebank_minisafe_3", vector3(-1291.41, -820.48, 16.78), 1, 1.8, {
            name="mazebank_minisafe_3",
            heading=40,
            --debugPoly=true,
            minZ=13.78,
            maxZ=17.78
                }, {
                    options = {
                        {
                            action = function(id)
                                safeMiniCaches(3)
                            end,
                            icon = "fas fa-hands",
                            label = "Otwórz",
                            canInteract = function()
                                return variables.safe_3
                            end,
                        },
                    },
                    distance = 2.5
            })
        exports.qtarget:AddBoxZone("mazebank_minisafe_4", vector3(-1293.07, -821.68, 16.78), 1, 2.0, {
            name="mazebank_minisafe_4",
            heading=35,
            --debugPoly=true,
            minZ=13.78,
            maxZ=17.78
                }, {
                    options = {
                        {
                            action = function(id)
                                safeMiniCaches(4)
                            end,
                            icon = "fas fa-hands",
                            label = "Otwórz",
                            canInteract = function()
                                return variables.safe_4
                            end,
                        },
                    },
                    distance = 2.5
            })
        exports.qtarget:AddBoxZone("mazebank_minisafe_5", vector3(-1294.42, -821.12, 16.78), 1, 1.6, {
            name="mazebank_minisafe_5",
            heading=310,
            --debugPoly=true,
            minZ=13.78,
            maxZ=17.78
                }, {
                    options = {
                        {
                            action = function(id)
                                safeMiniCaches(5)
                            end,
                            icon = "fas fa-hands",
                            label = "Otwórz",
                            canInteract = function()
                                return variables.safe_5
                            end,
                        },
                    },
                    distance = 2.5
            })
        exports.qtarget:AddBoxZone("mazebank_minisafe_6", vector3(-1296.45, -819.37, 16.78), 1, 2.2, {
            name="mazebank_minisafe_6",
            heading=310,
            --debugPoly=true,
            minZ=13.78,
            maxZ=17.78
                }, {
                    options = {
                        {
                            action = function(id)
                                safeMiniCaches(6)
                            end,
                            icon = "fas fa-hands",
                            label = "Otwórz",
                            canInteract = function()
                                return variables.safe_6
                            end,
                        },
                    },
                    distance = 2.5
            })

        exports.qtarget:AddCircleZone("mazebank_get_reward_1", vector3(-1293.51, -818.78, 16.78), 0.45, {
            name="mazebank_get_reward_1",
            useZ=true,
            --debugPoly=true
                }, {
                    options = {
                        {
                            action = function()
                                getLastReward()
                            end,
                            icon = "fas fa-hands",
                            label = "Weź",
                            canInteract = function()
                                return variables.lastReward
                            end,
                        },
                    },
                    distance = 2.5
            })

end)
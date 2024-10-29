CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        SetPedConfigFlag(ped, 43, true) -- CPED_CONFIG_FLAG_DisablePlayerLockon
        if weapon ~= `WEAPON_UNARMED` and weapon ~= 0 then
            local lockOn = GetLockonDistanceOfCurrentPedWeapon(ped)
            DebugPrint(lockOn)
            if lockOn > 500.0 then 
                DebugPrint(lockOn)
                local player = PlayerId()
                SetPlayerLockon(player, false)
                SetPlayerLockonRangeOverride(player, -1.0)
            end
        end
        Wait(2500)
    end
end)


CreateThread(function()
    while true do
        if NetworkGetTargetingMode() ~= 3 then
            SetPlayerTargetingMode(3)
        else
            Wait(1000)
        end
        Wait(200)
    end
end)
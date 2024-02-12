local debug = false
function DebugPrint(...)
    if debug then print("^0[^8DEBUG^0] ".. ...) end
end

Citizen.CreateThread(function() -- soft aim
    while true do 
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        SetPedConfigFlag(ped, 43, true) -- CPED_CONFIG_FLAG_DisablePlayerLockon
        if weapon ~= `WEAPON_UNARMED` and weapon ~= 0 then -- check pokud ma zbran
            local lockOn = GetLockonDistanceOfCurrentPedWeapon(ped)
            DebugPrint(lockOn)
            if lockOn > 500.0 then 
                DebugPrint(lockOn)
                local player = PlayerId()
                SetPlayerLockon(player, false) -- zastaví lock na osobu
                SetPlayerLockonRangeOverride(player, -1.0)
            end
        end
        Wait(2500)
    end
end)


Citizen.CreateThread(function() -- aim assist (controler), tohle jsem vzal z netu tbh
    while true do
        if NetworkGetTargetingMode() ~= 3 then
            SetPlayerTargetingMode(3)
        else
            Wait(1000)
        end
        Wait(200)
    end
end)
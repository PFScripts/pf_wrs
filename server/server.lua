local Config = require 'config.config'

RegisterNetEvent('pf_wrs:server:FillWaterBottle', function(skillCheckSuccess)
    local src = source
    local playerHasItem = exports.ox_inventory:Search(src, "slots", Config.items.empty_bottle)

    if playerHasItem and skillCheckSuccess then
        local itemRemoved = exports.ox_inventory:RemoveItem(src, Config.items.empty_bottle, 1)
        if itemRemoved then
            exports.ox_inventory:AddItem(src, Config.items.filled_bottle, 1)
            TriggerClientEvent('ox_lib:notify', src, { type = 'success', text = locale{'notify.success_message'} })
        else
            TriggerClientEvent('ox_lib:notify', src, { type = 'error', text = locale{'notify.remove_fail_message'} })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', text = locale['notify.no_empty_bottle'] })
    end
end)

RegisterNetEvent('pf_wrs:server:PlayerTooFar', function()
    local src = source
    if Config.dropplayer.status then
        DropPlayer(src, Config.dropplayer.dropreason)
    end
end)
local Config = require 'config'
local Locale = Config.Locale
local Locales = Config.Locales[Locale]

RegisterNetEvent('consumables:server:FillWaterBottle')
AddEventHandler('consumables:server:FillWaterBottle', function(skillCheckSuccess)
    local src = source
    local playerHasItem = exports.ox_inventory:Search(src, "slots", Config.items.empty_bottle)

    if playerHasItem and skillCheckSuccess then
        local itemRemoved = exports.ox_inventory:RemoveItem(src, Config.items.empty_bottle, 1)
        if itemRemoved then
            exports.ox_inventory:AddItem(src, Config.items.filled_bottle, 1)
            TriggerClientEvent('ox_lib:notify', src, { type = 'success', text = Locales['success_message'] })
        else
            TriggerClientEvent('ox_lib:notify', src, { type = 'error', text = Locales['remove_fail_message'] })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', text = Locales['no_empty_bottle'] })
    end
end)
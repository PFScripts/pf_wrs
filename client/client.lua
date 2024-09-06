local Config = require 'config'

local Locale = Config.Locale
local Locales = Config.Locales[Locale]
local MAX_DISTANCE = Config.distances.max_distance
local TARGET_DISTANCE = Config.distances.target_distance

local function isPlayerWithinRange(target)
    if not DoesEntityExist(target) then
        return false
    end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(target)
    local distance = #(playerCoords - targetCoords)
    return distance <= MAX_DISTANCE
end

exports.ox_target:addModel(Config.targetmodels, {
    {
        name = 'fill_water_bottle',
        label = Locales['fill_water_bottle'],
        icon = 'fas fa-tint',
        distance = TARGET_DISTANCE,
        onSelect = function(data)
            local targetEntity = data.entity or nil
            if targetEntity and isPlayerWithinRange(targetEntity) then
                TriggerEvent('consumables:client:FillWaterBottle')
            else
                if Config.dropplayer.status then
                    DropPlayer(source, Config.dropplayer.dropreason)
                else
                    lib.notify({
                        title = Locales['notif_far_title'],
                        description = Locales['too_far'],
                        type = 'error'
                    })
                end
            end
        end,
        items = { Config.items.empty_bottle }
    }
})

RegisterNetEvent('consumables:client:FillWaterBottle')
AddEventHandler('consumables:client:FillWaterBottle', function()
    TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })

    local success = lib.skillCheck({ Config.progressSettings.skill_difficulty }, { 'e' })

    if success then
        local completed = lib.progressCircle({
            duration = Config.progressSettings.duration,
            label = Locales['filling_water_bottle'],
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true,
            },
        })

        if completed then
            TriggerServerEvent('consumables:server:FillWaterBottle', success)
            exports.scully_emotemenu:cancelEmote()
        else
            print(Locales['progress_cancelled'])
            exports.scully_emotemenu:cancelEmote()
        end
    else
        print(Locales['skill_check_failed'])
        exports.scully_emotemenu:cancelEmote()
    end
end)

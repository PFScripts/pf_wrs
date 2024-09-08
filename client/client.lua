local Config = require 'config.config'
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
        label = locale('target.fill_water_bottle'),
        icon = 'fas fa-tint',
        distance = TARGET_DISTANCE,
        onSelect = function(data)
            local targetEntity = data.entity or nil
            TriggerEvent('consumables:client:FillWaterBottle', targetEntity)
        end,
        items = { Config.items.empty_bottle }
    }
})

RegisterNetEvent('consumables:client:FillWaterBottle', function(targetEntity)
    if targetEntity and isPlayerWithinRange(targetEntity) then
        TriggerEvent('animations:client:EmoteCommandStart', { "mechanic4" })

        local success = lib.skillCheck({ Config.progressSettings.skill_difficulty }, { 'e' })

        if success then
            local completed = lib.progressCircle({
                duration = Config.progressSettings.duration,
                label = locale('progress.filling_water_bottle'),
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
                print(locale('prints.progress_cancelled'))
                exports.scully_emotemenu:cancelEmote()
            end
        else
            print(locale('prints.skill_check_failed'))
            exports.scully_emotemenu:cancelEmote()
        end
    else
        if Config.dropplayer.status then
            DropPlayer(source, Config.dropplayer.dropreason)
        else
            lib.notify({
                title = locale('notify.too_far.title'),
                description = locale('notify.too_far.description'),
                type = 'error'
            })
        end
    end
end)

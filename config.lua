return {
    Locale = "en",

    Locales = {
        en = {
            fill_water_bottle = 'Fill Water Bottle',
            filling_water_bottle = 'Filling Water Bottle...',
            progress_cancelled = 'Filling process was cancelled.',
            skill_check_failed = 'Skill check failed.',
            success_message = 'You have filled the water bottle successfully!',
            remove_fail_message = 'Failed to remove empty water bottle.',
            no_empty_bottle = 'You do not have an empty water bottle.',
            notif_far_title = 'Water Refilling',
            too_far = 'You are too far for refilling your bottle',

        },
        pt = {
            fill_water_bottle = 'Encher a garrafa de água',
            filling_water_bottle = 'Enchendo a garrafa de água...',
            progress_cancelled = 'O processo de enchimento foi cancelado.',
            skill_check_failed = 'Verificação de habilidade falhou.',
            success_message = 'Você preencheu a garrafa de água com sucesso!',
            remove_fail_message = 'Falha ao remover a garrafa de água vazia.',
            no_empty_bottle = 'Você não tem uma garrafa de água vazia.',
            notif_far_title = 'Enchimento da garrafa',
            too_far = 'Estás longe demais para encheres a tua garrafa',

        }
    },

    -- Drop Player Configuration
    dropplayer = {
        status = false,  -- Whether to drop the player
        dropreason = "You are too far from the water source.",  -- Drop reason message
    },

    -- Target models (fountains, sinks, etc.)
    targetmodels = {
        "prop_fountain2",
        "prop_w_fountain_01",
        "prop_fountain1",
        "prop_watercooler",
        "prop_sink_02",
        "prop_sink_03",
        "prop_sink_04",
        "prop_kitchen_sink_01",
        "prop_bathroom_sink_01",
        "prop_bathroom_sink_02",
        "prop_bathroom_sink_03",
        "prop_bathroom_sink_04",
        "v_ret_fh_kitchen_sink",
        "v_ret_fh_bathroom_sink",
        "v_res_m_sink_04",
        "v_res_m_sink_03",
        "v_res_m_sink_02",
        "v_res_m_sink_01",
    },

    -- Distance and Progress Settings
    distances = {
        max_distance = 3,  -- Max distance to fill water bottle
        target_distance = 5  -- Distance to trigger the fill action
    },

    progressSettings = {
        duration = 5000,  -- Time in milliseconds for the progress bar
        skill_difficulty = 'easy',  -- Skill check difficulty level
    },

    -- Items used in the process
    items = {
        empty_bottle = 'empty_water_bottle',
        filled_bottle = 'water_bottle'
    }
}

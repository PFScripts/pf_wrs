return {
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

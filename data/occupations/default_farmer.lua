----------------------------------------------------
-- Test farmer occupation for Advanced NPC
-- By Zorman2000
----------------------------------------------------
-- This farmer implementation is still WIP. It is supposed to spawn
-- on buildings that have plots or there are fields nearby. Also, it
-- work on its crops during the morning, and sell some of them on the
-- afternoon.

local farming_plants = {
    "farming:cotton_1",
    "farming:cotton_2",
    "farming:cotton_3",
    "farming:cotton_4",
    "farming:cotton_5",
    "farming:cotton_6",
    "farming:cotton_7",
    "farming:cotton_8",
    "farming:wheat_1",
    "farming:wheat_2",
    "farming:wheat_3",
    "farming:wheat_4",
    "farming:wheat_5",
    "farming:wheat_6",
    "farming:wheat_7",
    "farming:wheat_8"
}

local farmer_def = {
    dialogues = {},
    textures = {},
    building_types = {
        "farm_tiny", "farm_full"
    },
    surrounding_building_types = {
        {type="field", origin_building_types={"hut", "house", "lumberjack"}}
    },
    walkable_nodes = farming_plants,
    initial_inventory = {
        {name="farming:seed_cotton", count=6}
    },
    schedules_entries = {
        [6] = {
            -- Get out of bed
            [1] = {
                task = npc.actions.cmd.USE_BED, args = {
                    pos = npc.places.PLACE_TYPE.BED.PRIMARY,
                    action = npc.actions.const.beds.GET_UP
                }
            },
            -- Walk to home inside
            [2] = {
                task = npc.actions.cmd.WALK_TO_POS, args = {
                    end_pos = npc.places.PLACE_TYPE.OTHER.HOME_INSIDE,
                    walkable = {}
                },
                chance = 75
            },
            -- Allow mobs_redo wandering
            [3] = {action = npc.actions.cmd.FREEZE, args = {freeze = false}}
        },
        [7] = {
            [1] =
            {
                task = npc.actions.cmd.WALK_TO_POS,
                args = {
                    end_pos = npc.places.PLACE_TYPE.WORKPLACE.PRIMARY,
                    walkable = {}
                }
            },
            [2] =
            {
                check = true,
                range = 2,
                random_execution_times = true,
                min_count = 20,
                max_count = 25,
                nodes = farming_plants,
                prefer_last_acted_upon_node = true,
                walkable_nodes = farming_plants,
                actions =
                {
                    -- Actions for cotton - harvest and replant
                    ["farming:cotton_1"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_2",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:cotton_2"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_3",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:cotton_3"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_4",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:cotton_4"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_5",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:cotton_5"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_6",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:cotton_6"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_7",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:cotton_7"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_8",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:cotton_8"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:cotton_1",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    },
                    ["farming:wheat_8"] =
                    {
                        [1] =
                        {
                            task = npc.actions.cmd.WALK_TO_POS,
                            args = {
                                end_pos = npc.places.PLACE_TYPE.SCHEDULE.TARGET,
                                walkable = farming_plants
                            }
                        },
                        [2] =
                        {
                            action = npc.actions.cmd.DIG,
                            args = {
                                bypass_protection = true
                            }
                        },
                        [3] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        },
                        [4] =
                        {
                            action = npc.actions.cmd.PLACE,
                            args =
                            {
                                node = "farming:wheat_1",
                                bypass_protection = true
                            }
                        },
                        [5] =
                        {
                            action = npc.actions.cmd.STAND,
                            args = {}
                        }
                    }
                },
                none_actions =
                {
                    -- Walk a single step in a random direction
                    [1] = {
                        action = npc.actions.cmd.WALK_STEP,
                        args =
                        {
                            dir = "random_orthogonal"
                        }
                    },
                    [2] = {
                        action = npc.actions.cmd.STAND,
                        args = {}
                    }
                }
            }
        },
        [13] = {
            -- Walk to a sittable node
            [1] = {
                task = npc.actions.cmd.WALK_TO_POS, args = {
                    end_pos = {place_type=npc.places.PLACE_TYPE.SITTABLE.PRIMARY, use_access_node=true},
                    walkable = {"cottages:bench"}
                },
                chance = 75
            },
            -- Sit on the node
            [2] = {
                task = npc.actions.cmd.USE_SITTABLE, args = {
                    pos = npc.places.PLACE_TYPE.SITTABLE.PRIMARY,
                    action = npc.actions.const.sittable.SIT
                },
                depends = {1}
            },
            -- Stay put into place
            [3] = {
                action = npc.actions.cmd.SET_INTERVAL, args = {
                    freeze = true,
                    interval = 35
                },
                depends = {2}
            },
            [4] = {
                action = npc.actions.cmd.SET_INTERVAL, args = {
                    freeze = true,
                    interval = npc.actions.default_interval
                },
                depends = {3}
            },
            -- Get up from sit
            [5] = {
                action = npc.actions.cmd.USE_SITTABLE, args = {
                    pos = npc.places.PLACE_TYPE.SITTABLE.PRIMARY,
                    action = npc.actions.const.sittable.GET_UP
                },
                depends = {4}
            }
        },
        [14] = {
            -- Give NPC money to buy from player
            [1] = {
                property = npc.schedule_properties.put_multiple_items, args = {
                    itemlist = {
                        {name="default:iron_lump", random=true, min=2, max=4}
                    }
                },
                chance = 50
            },
            -- Set trade list - what NPC will buy and what NPC will sell
            [2] = {
                property = npc.schedule_properties.set_trade_list, args = {
                    items = {
                        [1] = {name="farming:seed_cotton", sell=5, keep=5},
                        [2] = {name="farming:cotton", sell=10},
                        [3] = {name="bucket:bucket_empty", buy=2},
                        [4] = {name="farming:hoe_stone", buy=2}
                    }
                }
            },
            -- Change trader status to "trader"
            [3] = {
                property = npc.schedule_properties.trader_status, args = {
                    status = npc.trade.TRADER
                },
                chance = 90
            },
            [4] = {
                property = npc.schedule_properties.can_receive_gifts, args = {
                    can_receive_gifts = false
                },
                depends = {1}
            },
            -- Allow mobs_redo wandering
            [5] = {action = npc.actions.cmd.FREEZE, args = {freeze = false}}
        },
        -- Schedule entry for 6 in the evening
        [18] = {
            -- Change trader status to "none"
            [1] = {
                property = npc.schedule_properties.trader_status, args = {
                    status = npc.trade.NONE
                }
            },
            -- Enable gift receiving again
            [2] = {
                property = npc.schedule_properties.can_receive_gifts, args = {
                    can_receive_gifts = true
                }
            },
            -- Get inside home
            [3] = {
                task = npc.actions.cmd.WALK_TO_POS, args = {
                    end_pos = npc.places.PLACE_TYPE.BED.PRIMARY,
                    walkable = {}
                }
            },
            -- Allow mobs_redo wandering
            [4] = {action = npc.actions.cmd.FREEZE, args = {freeze = false}}
        },
        [22] = {
            [1] = {
                task = npc.actions.cmd.WALK_TO_POS, args = {
                    end_pos = {place_type=npc.places.PLACE_TYPE.BED.PRIMARY, use_access_node=true},
                    walkable = {}
                }
            },
            -- Use bed
            [2] = {
                task = npc.actions.cmd.USE_BED, args = {
                    pos = npc.places.PLACE_TYPE.BED.PRIMARY,
                    action = npc.actions.const.beds.LAY
                }
            },
            -- Stay put on bed
            [3] = {action = npc.actions.cmd.FREEZE, args = {freeze = true} }
        }
    }
}

-- Register occupation
npc.occupations.register_occupation("default_farmer", farmer_def)

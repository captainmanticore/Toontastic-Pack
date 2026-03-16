
SMODS.Booster {
    key = 'captainmanticorepack',
    loc_txt = {
        name = "Captainmanticore Pack",
        text = {
            [1] = 'Pick {C:attention}1{} of {C:attention}3{}  Toontastic mod Jokers'
        },
        group_name = "toontast_boosters"
    },
    config = { extra = 3, choose = 1 },
    cost = 5,
    weight = 3.5,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "toontast_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.2,
            1.15,
            1,
            0.25
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('toontast_captainmanticorepack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "toontast_toontast_jokers",
                rarity = "Common",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "toontast_captainmanticorepack"
            }
        elseif selected_index == 2 then
            return {
                set = "toontast_toontast_jokers",
                rarity = "Uncommon",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "toontast_captainmanticorepack"
            }
        elseif selected_index == 3 then
            return {
                set = "toontast_toontast_jokers",
                rarity = "Rare",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "toontast_captainmanticorepack"
            }
        elseif selected_index == 4 then
            return {
                set = "toontast_toontast_jokers",
                rarity = "toontast_epic",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "toontast_captainmanticorepack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ff0000"))
        ease_background_colour({ new_colour = HEX('ff0000'), special_colour = HEX("ffffff"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'toontasticpack',
        loc_txt = {
            name = "Toontastic Pack",
            text = {
                [1] = 'Pick {C:attention}1{} of {C:attention}3{}  Toontastic mod Jokers'
            },
            group_name = "toontast_boosters"
        },
        config = { extra = 3, choose = 1 },
        cost = 5,
        weight = 3.5,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        group_key = "toontast_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            local weights = {
                1.2,
                1.15,
                1,
                0.25
            }
            local total_weight = 0
            for _, weight in ipairs(weights) do
                total_weight = total_weight + weight
            end
            local random_value = pseudorandom('toontast_toontasticpack_card') * total_weight
            local cumulative_weight = 0
            local selected_index = 1
            for j, weight in ipairs(weights) do
                cumulative_weight = cumulative_weight + weight
                if random_value <= cumulative_weight then
                    selected_index = j
                    break
                end
            end
            if selected_index == 1 then
                return {
                    set = "toontast_toontast_jokers",
                    rarity = "Common",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "toontast_toontasticpack"
                }
            elseif selected_index == 2 then
                return {
                    set = "toontast_toontast_jokers",
                    rarity = "Uncommon",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "toontast_toontasticpack"
                }
            elseif selected_index == 3 then
                return {
                    set = "toontast_toontast_jokers",
                    rarity = "Rare",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "toontast_toontasticpack"
                }
            elseif selected_index == 4 then
                return {
                    set = "toontast_toontast_jokers",
                    rarity = "toontast_epic",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "toontast_toontasticpack"
                }
            end
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("ff0000"))
            ease_background_colour({ new_colour = HEX('ff0000'), special_colour = HEX("ffffff"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'jumbo_captainmanticore_pack',
            loc_txt = {
                name = "Jumbo Captainmanticore Pack",
                text = {
                    [1] = 'Pick {C:attention}2{} of {C:attention}5{}  Toontastic mod Jokers'
                },
                group_name = "toontast_boosters"
            },
            config = { extra = 5, choose = 2 },
            cost = 10,
            weight = 1.2,
            atlas = "CustomBoosters",
            pos = { x = 2, y = 0 },
            group_key = "toontast_boosters",
            discovered = true,
            loc_vars = function(self, info_queue, card)
                local cfg = (card and card.ability) or self.config
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                local weights = {
                    1.2,
                    1.15,
                    1,
                    0.75
                }
                local total_weight = 0
                for _, weight in ipairs(weights) do
                    total_weight = total_weight + weight
                end
                local random_value = pseudorandom('toontast_jumbo_captainmanticore_pack_card') * total_weight
                local cumulative_weight = 0
                local selected_index = 1
                for j, weight in ipairs(weights) do
                    cumulative_weight = cumulative_weight + weight
                    if random_value <= cumulative_weight then
                        selected_index = j
                        break
                    end
                end
                if selected_index == 1 then
                    return {
                        set = "toontast_toontast_jokers",
                        rarity = "Common",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "toontast_jumbo_captainmanticore_pack"
                    }
                elseif selected_index == 2 then
                    return {
                        set = "toontast_toontast_jokers",
                        rarity = "Uncommon",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "toontast_jumbo_captainmanticore_pack"
                    }
                elseif selected_index == 3 then
                    return {
                        set = "toontast_toontast_jokers",
                        rarity = "Rare",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "toontast_jumbo_captainmanticore_pack"
                    }
                elseif selected_index == 4 then
                    return {
                        set = "toontast_toontast_jokers",
                        rarity = "toontast_epic",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "toontast_jumbo_captainmanticore_pack"
                    }
                end
            end,
            ease_background_colour = function(self)
                ease_colour(G.C.DYN_UI.MAIN, HEX("ff0000"))
                ease_background_colour({ new_colour = HEX('ff0000'), special_colour = HEX("ffffff"), contrast = 2 })
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'jumbotoontasticpack',
                loc_txt = {
                    name = "Jumbo Toontastic Pack",
                    text = {
                        [1] = 'Pick {C:attention}2{} of {C:attention}5{}  Toontastic mod Jokers'
                    },
                    group_name = "toontast_boosters"
                },
                config = { extra = 5, choose = 2 },
                cost = 10,
                weight = 1.2,
                atlas = "CustomBoosters",
                pos = { x = 3, y = 0 },
                group_key = "toontast_boosters",
                discovered = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    local weights = {
                        1.2,
                        1.15,
                        1,
                        0.75
                    }
                    local total_weight = 0
                    for _, weight in ipairs(weights) do
                        total_weight = total_weight + weight
                    end
                    local random_value = pseudorandom('toontast_jumbotoontasticpack_card') * total_weight
                    local cumulative_weight = 0
                    local selected_index = 1
                    for j, weight in ipairs(weights) do
                        cumulative_weight = cumulative_weight + weight
                        if random_value <= cumulative_weight then
                            selected_index = j
                            break
                        end
                    end
                    if selected_index == 1 then
                        return {
                            set = "toontast_toontast_jokers",
                            rarity = "Common",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "toontast_jumbotoontasticpack"
                        }
                    elseif selected_index == 2 then
                        return {
                            set = "toontast_toontast_jokers",
                            rarity = "Uncommon",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "toontast_jumbotoontasticpack"
                        }
                    elseif selected_index == 3 then
                        return {
                            set = "toontast_toontast_jokers",
                            rarity = "Rare",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "toontast_jumbotoontasticpack"
                        }
                    elseif selected_index == 4 then
                        return {
                            set = "toontast_toontast_jokers",
                            rarity = "toontast_epic",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "toontast_jumbotoontasticpack"
                        }
                    end
                end,
                ease_background_colour = function(self)
                    ease_colour(G.C.DYN_UI.MAIN, HEX("ff0000"))
                    ease_background_colour({ new_colour = HEX('ff0000'), special_colour = HEX("ffffff"), contrast = 2 })
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                
                
                SMODS.Booster {
                    key = 'chaospack',
                    loc_txt = {
                        name = "Chaos Pack",
                        text = {
                            [1] = 'Pick {C:attention}1{} of {C:attention}3{} Jokers'
                        },
                        group_name = "Chaos Pack"
                    },
                    config = { extra = 3, choose = 1 },
                    atlas = "CustomBoosters",
                    pos = { x = 4, y = 0 },
                    discovered = true,
                    loc_vars = function(self, info_queue, card)
                        local cfg = (card and card.ability) or self.config
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        return {
                            set = "Joker",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true
                        }
                    end,
                    ease_background_colour = function(self)
                        ease_colour(G.C.DYN_UI.MAIN, HEX("fd0202"))
                        ease_background_colour({ new_colour = HEX('fd0202'), special_colour = HEX("02ff00"), contrast = 2 })
                    end,
                    particles = function(self)
                        -- No particles for joker packs
                        end,
                    }
                    
                    
                    SMODS.Booster {
                        key = 'bigchaospack',
                        loc_txt = {
                            name = "Big Chaos Pack",
                            text = {
                                [1] = 'Pick {C:attention}2{} of {C:attention}5{} Jokers'
                            },
                            group_name = "Big Chaos Pack"
                        },
                        config = { extra = 5, choose = 2 },
                        cost = 8,
                        atlas = "CustomBoosters",
                        pos = { x = 5, y = 0 },
                        discovered = true,
                        loc_vars = function(self, info_queue, card)
                            local cfg = (card and card.ability) or self.config
                            return {
                                vars = { cfg.choose, cfg.extra }
                            }
                        end,
                        create_card = function(self, card, i)
                            return {
                                set = "Joker",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true
                            }
                        end,
                        ease_background_colour = function(self)
                            ease_colour(G.C.DYN_UI.MAIN, HEX("fd0202"))
                            ease_background_colour({ new_colour = HEX('fd0202'), special_colour = HEX("02ff00"), contrast = 2 })
                        end,
                        particles = function(self)
                            -- No particles for joker packs
                            end,
                        }
                        
                        
                        SMODS.Booster {
                            key = 'bigrandomtab',
                            loc_txt = {
                                name = "Big Random Tab ",
                                text = {
                                    [1] = 'Pick {C:attention}2 {}of{C:attention} 5{} Levels'
                                },
                                group_name = "toontast_boosters"
                            },
                            config = { extra = 5, choose = 2 },
                            atlas = "CustomBoosters",
                            pos = { x = 6, y = 0 },
                            group_key = "toontast_boosters",
                            select_card = "consumeables",
                            discovered = true,
                            loc_vars = function(self, info_queue, card)
                                local cfg = (card and card.ability) or self.config
                                return {
                                    vars = { cfg.choose, cfg.extra }
                                }
                            end,
                            create_card = function(self, card, i)
                                local weights = {
                                    1,
                                    0.15
                                }
                                local total_weight = 0
                                for _, weight in ipairs(weights) do
                                    total_weight = total_weight + weight
                                end
                                local random_value = pseudorandom('toontast_bigrandomtab_card') * total_weight
                                local cumulative_weight = 0
                                local selected_index = 1
                                for j, weight in ipairs(weights) do
                                    cumulative_weight = cumulative_weight + weight
                                    if random_value <= cumulative_weight then
                                        selected_index = j
                                        break
                                    end
                                end
                                if selected_index == 1 then
                                    return {
                                        set = "level",
                                        area = G.pack_cards,
                                        skip_materialize = true,
                                        soulable = true,
                                        key_append = "toontast_bigrandomtab"
                                    }
                                elseif selected_index == 2 then
                                    return {
                                        key = "c_toontast_robtop",
                                        set = "Tarot",
                                        area = G.pack_cards,
                                        skip_materialize = true,
                                        soulable = true,
                                        key_append = "toontast_bigrandomtab"
                                    }
                                end
                            end,
                            ease_background_colour = function(self)
                                ease_colour(G.C.DYN_UI.MAIN, HEX("0000ff"))
                                ease_background_colour({ new_colour = HEX('0000ff'), special_colour = HEX("006bff"), contrast = 2 })
                            end,
                            particles = function(self)
                                G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                                    timer = 0.015,
                                    scale = 0.2,
                                    initialize = true,
                                    lifespan = 1,
                                    speed = 1.1,
                                    padding = -1,
                                    attach = G.ROOM_ATTACH,
                                    colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                                    fill = true
                                })
                                G.booster_pack_sparkles.fade_alpha = 1
                                G.booster_pack_sparkles:fade(1, 0)
                            end,
                        }
                        
                        
                        SMODS.Booster {
                            key = 'random_tab',
                            loc_txt = {
                                name = "Random Tab",
                                text = {
                                    [1] = 'Pick {C:attention}1 {}of{C:attention} 2{} Levels'
                                },
                                group_name = "toontast_boosters"
                            },
                            config = { extra = 2, choose = 1 },
                            atlas = "CustomBoosters",
                            pos = { x = 7, y = 0 },
                            group_key = "toontast_boosters",
                            select_card = "consumeables",
                            discovered = true,
                            loc_vars = function(self, info_queue, card)
                                local cfg = (card and card.ability) or self.config
                                return {
                                    vars = { cfg.choose, cfg.extra }
                                }
                            end,
                            create_card = function(self, card, i)
                                return {
                                    set = "level",
                                    area = G.pack_cards,
                                    skip_materialize = true,
                                    soulable = true,
                                    key_append = "toontast_random_tab"
                                }
                            end,
                            ease_background_colour = function(self)
                                ease_colour(G.C.DYN_UI.MAIN, HEX("0000ff"))
                                ease_background_colour({ new_colour = HEX('0000ff'), special_colour = HEX("006bff"), contrast = 2 })
                            end,
                            particles = function(self)
                                G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                                    timer = 0.015,
                                    scale = 0.2,
                                    initialize = true,
                                    lifespan = 1,
                                    speed = 1.1,
                                    padding = -1,
                                    attach = G.ROOM_ATTACH,
                                    colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                                    fill = true
                                })
                                G.booster_pack_sparkles.fade_alpha = 1
                                G.booster_pack_sparkles:fade(1, 0)
                            end,
                        }
                        
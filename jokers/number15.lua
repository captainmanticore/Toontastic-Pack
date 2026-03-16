
SMODS.Joker{ --Number 15
    key = "number15",
    config = {
        extra = {
            xmult0 = 15
        }
    },
    loc_txt = {
        ['name'] = 'Number 15',
        ['text'] = {
            [1] = 'Number 15'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "toontast_tuff",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_15")
                    
                    return true
                end,
            }))
            return {
                Xmult = 15,
                extra = {
                    message = "number",
                    colour = G.C.WHITE,
                    extra = {
                        message = "15",
                        colour = G.C.WHITE,
                        extra = {
                            message = "burger king",
                            colour = G.C.WHITE,
                            extra = {
                                message = "foot lettuce",
                                colour = G.C.WHITE,
                                extra = {
                                    message = "The last",
                                    colour = G.C.WHITE,
                                    extra = {
                                        message = "thing",
                                        colour = G.C.WHITE,
                                        extra = {
                                            message = "you would ",
                                            colour = G.C.WHITE,
                                            extra = {
                                                message = "want in",
                                                colour = G.C.WHITE,
                                                extra = {
                                                    message = "your",
                                                    colour = G.C.WHITE,
                                                    extra = {
                                                        message = "burger king",
                                                        colour = G.C.WHITE,
                                                        extra = {
                                                            message = "burger is",
                                                            colour = G.C.WHITE,
                                                            extra = {
                                                                message = "someones ",
                                                                colour = G.C.WHITE,
                                                                extra = {
                                                                    message = "foot fungus",
                                                                    colour = G.C.WHITE,
                                                                    extra = {
                                                                        message = "but as",
                                                                        colour = G.C.WHITE,
                                                                        extra = {
                                                                            message = "it turns out",
                                                                            colour = G.C.WHITE,
                                                                            extra = {
                                                                                message = "that might be what you get",
                                                                                colour = G.C.WHITE
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        end
    end
}
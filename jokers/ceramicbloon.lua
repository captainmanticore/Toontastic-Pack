
SMODS.Joker{ --Ceramic Bloon
    key = "ceramicbloon",
    config = {
        extra = {
            xmultyaya = 5
        }
    },
    loc_txt = {
        ['name'] = 'Ceramic Bloon',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1# {} Mult,',
            [2] = 'Increases by {X:red,C:white}0.1{} When Shop Is Rerolled'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmultyaya}}
    end,
    
    calculate = function(self, card, context)
        if context.reroll_shop  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_Click")
                    
                    return true
                end,
            }))
            return {
                func = function()
                    card.ability.extra.xmultyaya = (card.ability.extra.xmultyaya) + 0.1
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmultyaya
            }
        end
    end
}
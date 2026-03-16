
SMODS.Joker{ --ZOMG
    key = "zomg",
    config = {
        extra = {
            bettercampfir = 0
        }
    },
    loc_txt = {
        ['name'] = 'ZOMG',
        ['text'] = {
            [1] = '{X:red,C:white}X#1# {} Mult',
            [2] = '{X:red,C:white}+2{} Mult per hand played',
            [3] = '{X:red,C:white}-2{} Mult per discard',
            [4] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "toontast_moab_class",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.bettercampfir}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.bettercampfir = (card.ability.extra.bettercampfir) + 2
            return {
                Xmult = card.ability.extra.bettercampfir
            }
        end
        if context.pre_discard  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.bettercampfir = math.max(0, (card.ability.extra.bettercampfir) - 2)
                    return true
                end
            }
        end
    end
}

SMODS.Joker{ --Melan
    key = "melan",
    config = {
        extra = {
            currentmoney = 5
        }
    },
    loc_txt = {
        ['name'] = 'Melan',
        ['text'] = {
            [1] = '{C:green}\"Yo! Im Melan!\"{}',
            [2] = '{}{X:mult,C:white}X#1# {} Mult',
            [3] = '{C:inactive}Depends on your money{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.currentmoney + ((G.GAME.dollars or 0)) * 0.1}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.currentmoney + (G.GAME.dollars) * 0.1
            }
        end
    end
}
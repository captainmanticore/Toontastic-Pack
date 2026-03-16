
SMODS.Joker{ --Long Joker
    key = "longjoker",
    config = {
        extra = {
            xchips0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Long Joker',
        ['text'] = {
            [1] = '{X:chips,C:white}X4{} Chiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 2
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 4,
                message = "4.000000000000000000000000000000000000000"
            }
        end
    end
}
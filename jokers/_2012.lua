
SMODS.Joker{ --2012
    key = "_2012",
    config = {
        extra = {
            mult0 = 20.12
        }
    },
    loc_txt = {
        ['name'] = '2012',
        ['text'] = {
            [1] = 'idea by {X:blue,C:white}nadabxoolboi24alt{}. {C:red}+20.12{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 20.12,
                message = "+20.12"
            }
        end
    end
}
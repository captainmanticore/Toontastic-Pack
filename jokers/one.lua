
SMODS.Joker{ --ONE
    key = "one",
    config = {
        extra = {
            mult0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'ONE',
        ['text'] = {
            [1] = 'HA HA, HA, ONE!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "toontast_tuff",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                message = "HA",
                extra = {
                    message = "HA",
                    colour = G.C.WHITE,
                    extra = {
                        message = "HA!",
                        colour = G.C.WHITE,
                        extra = {
                            mult = 1,
                            message = "ONE!"
                        }
                    }
                }
            }
        end
    end
}
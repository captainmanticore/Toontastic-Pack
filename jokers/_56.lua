
SMODS.Joker{ --56
    key = "_56",
    config = {
        extra = {
            xchips0 = 56,
            xmult0 = 56
        }
    },
    loc_txt = {
        ['name'] = '56',
        ['text'] = {
            [1] = '56'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_56")
                    
                    return true
                end,
            }))
            return {
                x_chips = 56,
                extra = {
                    Xmult = 56
                }
            }
        end
    end
}
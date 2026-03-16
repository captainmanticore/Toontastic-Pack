
SMODS.Joker{ --White Bloon
    key = "whitebloon",
    config = {
        extra = {
            play_size_increase = '2'
        }
    },
    loc_txt = {
        ['name'] = 'White Bloon',
        ['text'] = {
            [1] = '{C:green}+2{} Play Size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(2)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-2)
    end
}
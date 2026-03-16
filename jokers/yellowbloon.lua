
SMODS.Joker{ --Yellow Bloon
    key = "yellowbloon",
    config = {
        extra = {
            hand_size_increase = '3'
        }
    },
    loc_txt = {
        ['name'] = 'Yellow Bloon',
        ['text'] = {
            [1] = '{C:green}+3{} Hand Size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
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
        G.hand:change_size(3)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-3)
    end
}

SMODS.Joker{ --Spinach
    key = "spinach",
    config = {
        extra = {
            shop_slots_increase = '1'
        }
    },
    loc_txt = {
        ['name'] = 'Spinach',
        ['text'] = {
            [1] = '+1 Shop Card Slots'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = false,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        change_shop_size(1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-1)
    end
}
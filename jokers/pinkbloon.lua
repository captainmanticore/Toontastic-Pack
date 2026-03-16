
SMODS.Joker{ --Pink Bloon
    key = "pinkbloon",
    config = {
        extra = {
            shop_slots_increase = '2'
        }
    },
    loc_txt = {
        ['name'] = 'Pink Bloon',
        ['text'] = {
            [1] = '{C:green}+2{} Shop Card Slots'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        change_shop_size(2)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-2)
    end
}
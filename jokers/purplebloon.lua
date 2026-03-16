
SMODS.Joker{ --Purple Bloon
    key = "purplebloon",
    config = {
        extra = {
            voucher_slots_increase = '1'
        }
    },
    loc_txt = {
        ['name'] = 'Purple Bloon',
        ['text'] = {
            [1] = '{C:green}+1{} Voucher Slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        SMODS.change_voucher_limit(1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
    end
}
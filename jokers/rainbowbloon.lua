
SMODS.Joker{ --Rainbow Bloon
    key = "rainbowbloon",
    config = {
        extra = {
            booster_slots_increase = '2'
        }
    },
    loc_txt = {
        ['name'] = 'Rainbow Bloon',
        ['text'] = {
            [1] = '{C:green}+2{} Booster Slots'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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
        SMODS.change_booster_limit(2)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-2)
    end
}
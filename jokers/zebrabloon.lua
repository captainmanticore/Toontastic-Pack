
SMODS.Joker{ --Zebra Bloon
    key = "zebrabloon",
    config = {
        extra = {
            play_size_increase = '2',
            discard_size_increase = '2'
        }
    },
    loc_txt = {
        ['name'] = 'Zebra Bloon',
        ['text'] = {
            [1] = '{C:green}+2{} Play and Discard Size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        SMODS.change_discard_limit(2)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-2)
        SMODS.change_discard_limit(-2)
    end
}
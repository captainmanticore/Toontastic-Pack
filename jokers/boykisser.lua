
SMODS.Joker{ --Boykisser
    key = "boykisser",
    config = {
        extra = {
            xchips0 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Boykisser',
        ['text'] = {
            [1] = 'If Hand Contains 2 or More {C:attention}Kings{}, {X:chips,C:white}X6{} Chips',
            [2] = 'You like Kissing {C:attention}Boys{} don\'t You?'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == K then
                        count = count + 1
                    end
                end
                return count >= 2
            end)() then
                return {
                    x_chips = 6
                }
            end
        end
    end
}
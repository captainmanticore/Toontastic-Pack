
SMODS.Joker{ --Shoe bench
    key = "shoebench",
    config = {
        extra = {
            echips0 = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Shoe bench',
        ['text'] = {
            [1] = 'If your Hand Contains an {C:attention}Ace{}, {C:attention}Queen{}, {C:attention}9{}, {C:attention}8{}, and {C:attention}4{}.',
            [2] = '{X:red,C:white}^1.1{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 8 then
                        count = count + 1
                    end
                end
                return count == 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count == 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if true then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 9 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count == 1
            end)()) then
                return {
                    e_chips = 1.1
                }
            end
        end
    end
}
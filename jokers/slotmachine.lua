
SMODS.Joker{ --Slot Machine
    key = "slotmachine",
    config = {
        extra = {
            xmult0 = 3,
            dollars0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Slot Machine',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult and {C:money}+20{} Dollars If hand is a {C:attention}Three of a Kind {}of {C:attention}Sevens{}',
            [2] = 'idea by {X:blue,C:white}Sheep_withashotgun{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 7 then
                        count = count + 1
                    end
                end
                return count == 3
            end)() then
                return {
                    Xmult = 3,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 20
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(20), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            end
        end
    end
}
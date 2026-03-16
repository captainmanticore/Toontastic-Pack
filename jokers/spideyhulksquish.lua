
SMODS.Joker{ --SpideyHulkSquish
    key = "spideyhulksquish",
    config = {
        extra = {
            mult0 = 16,
            dollars0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'SpideyHulkSquish',
        ['text'] = {
            [1] = 'When a {C:attention}Pair {}Or {C:attention}Two Pair{} is played.',
            [2] = '{C:red}+16{} Mult, and earns {C:money}3${}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
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
            if (next(context.poker_hands["Pair"]) or next(context.poker_hands["Two Pair"])) then
                return {
                    mult = 16,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 3
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            end
        end
    end
}
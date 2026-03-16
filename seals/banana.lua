
SMODS.Seal {
    key = 'banana',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            dollars0 = 2
        }
    },
    badge_colour = HEX('FFD700'),
    loc_txt = {
        name = 'Banana',
        label = 'Banana',
        text = {
            [1] = '{C:money}+2{} Dollars'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "toontast_ohbanana", per = 1, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 2
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}
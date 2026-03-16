
SMODS.Joker{ --Mad non joker
    key = "madnonjoker",
    config = {
        extra = {
            mult0 = -5,
            dollars0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Mad non joker',
        ['text'] = {
            [1] = 'he HATE joke he no coolilo/ he no use texrt format nor do he fix spelling mistake. he remove alot of malt'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_evilmult")
                    
                    return true
                end,
            }))
            return {
                mult = -5
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 1
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}
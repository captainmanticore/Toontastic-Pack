
SMODS.Joker{ --hamburglar
    key = "hamburglar",
    config = {
        extra = {
            hands0 = 0,
            discards0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'hamburglar',
        ['text'] = {
            [1] = 'removes all hands and gives 3 discards once a hand is played. idea by {X:blue,C:white}Sheep_withashotgun{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(0).." Hands", colour = G.C.BLUE})
                    G.GAME.current_round.hands_left = 0
                    return true
                end,
                extra = {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Discards", colour = G.C.GREEN})
                        
                        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 3
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
    end
}
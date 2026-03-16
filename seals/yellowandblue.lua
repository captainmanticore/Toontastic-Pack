
SMODS.Seal {
    key = 'yellowandblue',
    pos = { x = 4, y = 0 },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Yellow and Blue',
        label = 'Yellow and Blue',
        text = {
            [1] = 'Create a Level Card when Scored'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "toontast_Play", per = 1, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'level', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}
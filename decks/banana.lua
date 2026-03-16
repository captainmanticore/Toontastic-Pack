
SMODS.Back {
    key = 'banana',
    pos = { x = 1, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Banana',
        text = {
            [1] = 'bananor'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            for i = 1, 1 do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', key = 'c_toontast_Banana'
                        })
                        return true
                    end
                }))
            end
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_toontast_dartmonkey' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}
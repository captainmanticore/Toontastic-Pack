
SMODS.Back {
    key = 'paparazzi_deck',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Paparazzi Deck',
        text = {
            [1] = 'This Deck Will {C:inactive}(camera snap){}',
            [2] = '{C:inactive}(camera snap){}{C:inactive}(camera snap){}',
            [3] = '{C:inactive}(camera snap){}{C:inactive}(camera snap){}',
            [4] = '{C:inactive}(camera snap){}{C:inactive}(camera snap){}',
            [5] = '{C:inactive}(camera snap){}{C:inactive}(camera snap){}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_photograph' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}
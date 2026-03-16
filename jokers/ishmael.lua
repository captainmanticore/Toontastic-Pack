
SMODS.Joker{ --ishmael
    key = "ishmael",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'ishmael',
        ['text'] = {
            [1] = 'ishmael repeat one other'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_Legendarytoon"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local available_jokers = {}
            for i, joker in ipairs(G.jokers.cards) do
                table.insert(available_jokers, joker)
            end
            local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker')) or nil
            
            if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                        
                        copied_joker:add_to_deck()
                        G.jokers:emplace(copied_joker)
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Yes", colour = G.C.GREEN})
            end
        end
    end
}
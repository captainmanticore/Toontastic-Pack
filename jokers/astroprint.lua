
SMODS.Joker{ --Astroprint
    key = "astroprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Astroprint',
        ['text'] = {
            [1] = 'Copies ability of {C:attention}Joker{} to the right.',
            [2] = 'When Hand is played, Creates 3 Negative {C:planet}Planet{} Cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "toontast_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            for i = 1, 3 do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        end
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', edition = 'e_negative', })                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            return {
                message = created_consumable and localize('k_plus_planet') or nil
            }
        end
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos < #G.jokers.cards) and G.jokers.cards[my_pos + 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}
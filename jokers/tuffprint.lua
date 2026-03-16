
SMODS.Joker{ --Tuffprint
    key = "tuffprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Tuffprint',
        ['text'] = {
            [1] = 'Copies ability of {C:attention}Joker{} to the right.',
            [2] = 'When Hand is played, Creates 2 random Tuff Cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "toontast_tuff",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'toontast_tuff' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            for i = 1, 1 do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'tuff', })                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            return {
                message = created_joker and localize('k_plus_joker') or nil,
                extra = {
                    message = created_consumable and localize('k_plus_consumable') or nil,
                    colour = G.C.PURPLE
                }
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
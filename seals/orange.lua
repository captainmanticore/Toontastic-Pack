
SMODS.Seal {
    key = 'orange',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            odds = 5
        }
    },
    badge_colour = HEX('FF4500'),
    loc_txt = {
        name = 'Orange seal',
        label = 'Orange seal',
        text = {
            [1] = 'Create a common joker when scored',
            [2] = '{C:dark_edition}Ignores Slot limit{}',
            [3] = '{C:green}1 in 5{} chance to {C:red}Self destruct{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "voice2", per = 1, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Destroyed!", colour = G.C.RED})
            return
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            return {
                message = created_joker and localize('k_plus_joker') or nil
                ,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'group_0_48a1bd2e', 1, card.ability.seal.extra.odds, 'j_toontast_orange', true) then
                        context.other_card.should_destroy = true
                        card.should_destroy = true
                        
                    end
                    return true
                end
            }
        end
    end
}
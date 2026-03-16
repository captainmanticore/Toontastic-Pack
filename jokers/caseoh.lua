
SMODS.Joker{ --Caseoh
    key = "caseoh",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Caseoh',
        ['text'] = {
            [1] = 'Eats a random Joker and Gives you {C:money}Money.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 3, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#G.consumeables.cards) >= to_big(1) then
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("toontast_eat")
                        
                        return true
                    end,
                }))
            elseif (function()
                local count = 0
                for _, consumable_card in pairs(G.consumeables.cards or {}) do
                    if consumable_card.config.center.key == "c_wheel_of_fortune" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("toontast_notfer")
                        
                        return true
                    end,
                }))
            end
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_NOO")
                    
                    return true
                end,
            }))
        end
    end
}

SMODS.Joker{ --Photobomb
    key = "photobomb",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Photobomb',
        ['text'] = {
            [1] = 'Each #1# Played Gives {X:mult,C:white}X1.5{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.myVariable_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.myVariable_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    Xmult = 1.5
                }
            end
        end
        if context.setting_blind  and not context.blueprint then
            if G.playing_cards then
                local valid_myVariable_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_myVariable_cards[#valid_myVariable_cards + 1] = v
                    end
                end
                if valid_myVariable_cards[1] then
                    local myVariable_card = pseudorandom_element(valid_myVariable_cards, pseudoseed('myVariable' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.myVariable_card.rank = myVariable_card.base.value
                    G.GAME.current_round.myVariable_card.id = myVariable_card.base.id
                end
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_p3")
                    
                    return true
                end,
            }))
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_p1")
                    
                    return true
                end,
            }))
        end
        if context.first_hand_drawn  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_p2")
                    
                    return true
                end,
            }))
        end
        if context.selling_self  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_pig")
                    
                    return true
                end,
            }))
        end
    end
}
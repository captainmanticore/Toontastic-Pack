
SMODS.Consumable {
    key = '67',
    set = 'tuff',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = '67',
        text = {
            [1] = '67'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = '6'
                    local _suit = 'Spades'
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'add_cards_enhancement')
                    local new_card_params = { set = "Base" }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        local seal_pool = {'Gold','Red','Blue','Purple','toontast_banana','toontast_diceroll','toontast_noteseal','toontast_orange','toontast_soul','toontast_yellowandblue'}
                        local random_seal = pseudorandom_element(seal_pool, 'add_cards_seal')
                        cards[i]:set_seal(random_seal, nil, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition('e_negative', true)
                    end
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = '7'
                    local _suit = 'Hearts'
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'add_cards_enhancement')
                    local new_card_params = { set = "Base" }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        local seal_pool = {'Gold','Red','Blue','Purple','toontast_banana','toontast_diceroll','toontast_noteseal','toontast_orange','toontast_soul','toontast_yellowandblue'}
                        local random_seal = pseudorandom_element(seal_pool, 'add_cards_seal')
                        cards[i]:set_seal(random_seal, nil, true)
                    end
                    if cards[i] then
                        cards[i]:set_edition('e_negative', true)
                    end
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("toontast_67")
                
                return true
            end,
        }))
        return {
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = "67!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!",
                        scale = 2,
                        hold = 6,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Spectral,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                        'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true,
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        }
    end,
    can_use = function(self, card)
        return true
    end
}
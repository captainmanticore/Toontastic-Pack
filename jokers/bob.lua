
SMODS.Joker{ --Bob
    key = "bob",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Bob',
        ['text'] = {
            [1] = '{C:green}\"Yo! I Bob!\"{}',
            [2] = 'If Hand Contains a {C:attention}Straight {}',
            [3] = 'Add a Random {C:enhanced}Enhanced{} Ace To Hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                local rank_suffix = 'A'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','toontast_banana','toontast_diceroll','toontast_noteseal','toontast_orange','toontast_soul','toontast_yellowandblue'}, pseudoseed('add_card_hand_seal')), true)
                
                base_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, pseudoseed('add_card_hand_edition')), true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                base_card.playing_card = G.playing_card
                table.insert(G.playing_cards, base_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.hand:emplace(base_card)
                        base_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Bob specil Move!"
                }
            end
        end
        if context.setting_blind  and not context.blueprint then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_toontast_jaxxaphobio" then 
                        return true
                    end
                end
            end)() then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("toontast_attack")
                        SMODS.calculate_effect({message = "*swing*"}, card)
                        return true
                    end,
                }))
            end
        end
    end
}
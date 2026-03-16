
SMODS.Joker{ --Jaxxaphobio
    key = "jaxxaphobio",
    config = {
        extra = {
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jaxxaphobio',
        ['text'] = {
            [1] = 'Levels up First Played Hand Of Round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_played == 0 then
                local target_hand = (context.scoring_name or "High Card")
                level_up_hand(card, target_hand, true, 1)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("toontast_pencil")
                        
                        return true
                    end,
                }))
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
        if context.setting_blind  and not context.blueprint then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_toontast_bob" then 
                        return true
                    end
                end
            end)() then
                return {
                    message = "you missed"
                }
            end
        end
    end
}
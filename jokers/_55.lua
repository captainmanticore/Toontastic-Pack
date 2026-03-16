
SMODS.Joker{ --55
    key = "_55",
    config = {
        extra = {
            blind_size0 = 0.55
        }
    },
    loc_txt = {
        ['name'] = '55',
        ['text'] = {
            [1] = 'Wait- 55?'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "toontast_tuff",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_55")
                    
                    return true
                end,
            }))
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "55", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * 0.55
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
    end
}
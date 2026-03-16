
SMODS.Joker{ --Max
    key = "max",
    config = {
        extra = {
            totalplayingcards = 0
        }
    },
    loc_txt = {
        ['name'] = 'Max',
        ['text'] = {
            [1] = 'Each Card in deck Give {X:mult,C:white}X0.1{} Mult .',
            [2] = '{C:inactive}(Currently {} {X:mult,C:white}X#1# {} {C:inactive}Mult) {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 26,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_Legendarytoon"] = true },
    soul_pos = {
        x = 1,
        y = 5
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(#(G.playing_cards or {})) * 0.1}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = (#(G.playing_cards or {})) * 0.1
            }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_toontast_max" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_toontast_max" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end
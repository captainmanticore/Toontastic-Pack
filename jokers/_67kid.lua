
SMODS.Joker{ --67 Kid
    key = "_67kid",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = '67 Kid',
        ['text'] = {
            [1] = '6767676767676767676767676767676767676767676767676767676767676767',
            [2] = '6767676767676767676767676767676767676767676767676767676767676767',
            [3] = '6767676767676767676767676767676767676767676767676767676767676767',
            [4] = '6767676767676767676767676767676767676767676767676767676767676767',
            [5] = '6767676767676767676767676767676767676767676767676767676767676767',
            [6] = '6767676767676767676767676767676767676767676767676767676767676767',
            [7] = '6767676767676767676767676767676767676767676767676767676767676767',
            [8] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "toontast_tuff",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_67")
                    
                    return true
                end,
            }))
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 2
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 2
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_toontast__67kid" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_toontast__67kid" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end
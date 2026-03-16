
SMODS.Joker{ --Jimbo if he was peak
    key = "jimboifhewaspeak",
    config = {
        extra = {
            emult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Jimbo if he was peak',
        ['text'] = {
            [1] = '{X:dark_edition,C:white}^1.5{} Mult if hand Does not Contain a {C:attention}Straight{}',
            [2] = 'Otherwise {C:red}explode{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "toontast_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not (next(context.poker_hands["Straight"])) then
                return {
                    e_mult = 1.5
                }
            elseif next(context.poker_hands["Straight"]) then
                local target_joker = card
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:explode({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}

SMODS.Joker{ --Phone
    key = "phone",
    config = {
        extra = {
            scale0 = 2,
            rotation0 = 180,
            xmult0 = 0.1,
            emult0 = 1.3,
            xmult = 12
        }
    },
    loc_txt = {
        ['name'] = 'Phone',
        ['text'] = {
            [1] = 'Will Either dislike or Like Your Played Hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)() then
                local target_card = context.other_card
                return {
                    message = "Booooringggg!!!!!!!!",
                    extra = {
                        func = function()
                            card:juice_up(2, 180)
                            return true
                        end,
                        colour = G.C.WHITE,
                        extra = {
                            Xmult = 0.1
                        }
                    }
                }
            elseif (next(context.poker_hands["Flush Five"]) or next(context.poker_hands["Flush House"]) or next(context.poker_hands["Five of a Kind"])) then
                return {
                    message = "YEAHHHHH",
                    extra = {
                        e_mult = 1.3,
                        colour = G.C.DARK_EDITION
                    }
                }
            elseif next(context.poker_hands["Full House"]) then
                return {
                    Xmult = 12
                }
            end
        end
    end
}
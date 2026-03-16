
SMODS.Joker{ --bear5
    key = "bear5",
    config = {
        extra = {
            mult0 = 19.87,
            chips0 = 66.6
        }
    },
    loc_txt = {
        ['name'] = 'bear5',
        ['text'] = {
            [1] = 'WAS THAT THE BITE OF {C:red}+19.87{} ?!?',
            [2] = 'SUPER SCARY {C:blue}66.6{} HORROR'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
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
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                message = "hor"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 19.87,
                message = "+19.87!",
                extra = {
                    chips = 66.6,
                    message = "+66.6 AHHHH SACARY!",
                    colour = G.C.CHIPS
                }
            }
        end
    end
}
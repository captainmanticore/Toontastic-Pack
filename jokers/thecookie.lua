
SMODS.Joker{ --The Cookie
    key = "thecookie",
    config = {
        extra = {
            Cookie = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Cookie',
        ['text'] = {
            [1] = 'Doing Any Action Increases This Cards Stored Mult by {C:red}+0.1{}',
            [2] = '{C:inactive}Currently{} {C:red}#1# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Cookie}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                    card.ability.extra.Cookie = (card.ability.extra.Cookie) + 0.1
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.Cookie
            }
        end
    end
}
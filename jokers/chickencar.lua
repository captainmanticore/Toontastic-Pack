
SMODS.Joker{ --Chicken Car
    key = "chickencar",
    config = {
        extra = {
            Chipamount = 3
        }
    },
    loc_txt = {
        ['name'] = 'Chicken Car',
        ['text'] = {
            [1] = 'When Shop Is Exited, Add {X:chips,C:white}0.2 {}To {C:blue}XChips{}',
            [2] = '{C:inactive}(Currently {}{X:chips,C:white}X#1# {}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Chipamount}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.Chipamount
            }
        end
        if context.ending_shop  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.Chipamount = (card.ability.extra.Chipamount) + 0.2
                    return true
                end
            }
        end
    end
}
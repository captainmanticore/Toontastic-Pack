
SMODS.Joker{ --Dart Monkey
    key = "dartmonkey",
    config = {
        extra = {
            mult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Dart Monkey',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1# {} Mult.',
            [2] = '{C:red}Mult {}Increases by {C:attention}0.5{} when A {X:money,C:white}Banana{} Is used'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
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
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.mult
            }
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_toontast_Banana' then
                return {
                    func = function()
                        card.ability.extra.mult = (card.ability.extra.mult) + 0.5
                        return true
                    end
                }
            end
        end
    end
}
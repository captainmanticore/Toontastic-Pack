
SMODS.Joker{ --D1 dice
    key = "d1dice",
    config = {
        extra = {
            possible = 1,
            odds = 1
        }
    },
    loc_txt = {
        ['name'] = 'D1 dice',
        ['text'] = {
            [1] = '#2# in #3# Chance to get {X:mult,C:white}X#1# {} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_toontast_d1dice') 
        return {vars = {card.ability.extra.possible, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_27d095ff', 1, card.ability.extra.odds, 'j_toontast_d1dice', false) then
                    SMODS.calculate_effect({Xmult = card.ability.extra.possible}, card)
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.possible = (card.ability.extra.possible) + 1
                    return true
                end
            }
        end
    end
}
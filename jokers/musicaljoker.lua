
SMODS.Joker{ --Musical Joker
    key = "musicaljoker",
    config = {
        extra = {
            odds = 2,
            xchips0 = 3,
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Musical Joker',
        ['text'] = {
            [1] = 'When a {C:blue}Note Seal{} is Scored',
            [2] = '{X:red,C:white}X3{} Mult or {X:blue,C:white}X3{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.toontast_Noteseal
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_toontast_musicaljoker')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_toontast_musicaljoker')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Toontast_noteseal" then
                if SMODS.pseudorandom_probability(card, 'group_0_6e62e0a7', 1, card.ability.extra.odds, 'j_toontast_musicaljoker', true) then
                    SMODS.calculate_effect({x_chips = 3}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_52c3197d', 1, card.ability.extra.odds, 'j_toontast_musicaljoker', true) then
                    SMODS.calculate_effect({Xmult = 3}, card)
                end
            end
        end
    end
}
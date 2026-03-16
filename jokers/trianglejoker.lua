
SMODS.Joker{ --Triangle Joker
    key = "trianglejoker",
    config = {
        extra = {
            emult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Triangle Joker',
        ['text'] = {
            [1] = '{X:dark_edition,C:white}^1.5{} Mult If hand contains A {C:attention}Triangular {}Card.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "toontast_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.toontast_triangle
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = 1.5
            }
        end
    end
}
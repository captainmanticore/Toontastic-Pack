
SMODS.Joker{ --Witch
    key = "witch",
    config = {
        extra = {
            xmult0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Witch',
        ['text'] = {
            [1] = 'takes up a joker slot',
            [2] = '{X:mult,C:white}x0.5{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'jud' and args.source ~= 'rif' 
            or args.source == 'buf' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 0.5
            }
        end
    end,
    check_for_unlock = function(self,args)
        if args.type == "hand_contents" then
            local count = 0
            for i = 1, #args.cards do
                if true then
                    count = count + 1
                end
            end
            if count == to_big(1) then
                return true
            end
        end
        return false
    end
}

SMODS.Joker{ --Your Best Friend!
    key = "yourbestfriend",
    config = {
        extra = {
            mult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Your Best Friend!',
        ['text'] = {
            [1] = 'Howdy! Im {C:money}Flowey!{} {C:money}Flowey{} the {C:money}Flower!{}',
            [2] = '{C:mult}+4 Friendlyness pellets{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 4
            }
        end
    end
}
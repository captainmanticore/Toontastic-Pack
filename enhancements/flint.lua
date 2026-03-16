
SMODS.Enhancement {
    key = 'flint',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        name = 'Flint',
        text = {
            [1] = '{X:chips,C:white}X3{} Chips while this card stays in hand'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 3.25,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                x_chips = 3
            }
        end
    end
}

SMODS.Seal {
    key = 'diceroll',
    pos = { x = 1, y = 0 },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Dice Roll',
        label = 'Dice Roll',
        text = {
            [1] = 'Randomizes Suit and Rank Every Time Scored'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "toontast_dice", per = 1, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            assert(SMODS.change_base(card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
            return {
                message = "Randomized!"
            }
        end
    end
}
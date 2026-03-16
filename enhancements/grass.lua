
SMODS.Enhancement {
    key = 'grass',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Grass',
        text = {
            [1] = 'touch it'
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
    weight = 1.25,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local random_seal = SMODS.poll_seal({mod = 10})
            if random_seal then
                card:set_seal(random_seal, true)
            end
            local random_edition = poll_edition('edit_card_edition', nil, true, true)
            if random_edition then
                card:set_edition(random_edition, true)
            end
            return {
                message = "Card Modified!"
            }
        end
    end
}
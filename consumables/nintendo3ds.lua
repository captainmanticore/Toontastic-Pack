
SMODS.Consumable {
    key = 'nintendo3ds',
    set = 'Tarot',
    pos = { x = 7, y = 2 },
    loc_txt = {
        name = 'nintendo 3ds',
        text = {
            [1] = 'Apply {C:enhanced}Tag{} To 3 Cards'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    can_use = function(self, card)
        return true
    end
}
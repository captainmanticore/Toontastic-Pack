
SMODS.Joker {
    key = 'Tarot Joker',
    pos = { x = 9, y = 2 },
    loc_txt = {
        name = 'Tarot Joker',
        text = {
            [1] = ''
        }
    },
	rarity = 1,
    cost = 1,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("voice1")
                
                return true
            end,
        }))
    end,
    can_use = function(self, card)
        return true
    end
}
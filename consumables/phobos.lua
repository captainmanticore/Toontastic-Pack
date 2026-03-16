
SMODS.Consumable {
    key = 'phobos',
    set = 'level',
    pos = { x = 4, y = 1 },
    loc_txt = {
        name = 'phobos',
        text = {
            [1] = '92.'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("toontast_92")
                
                return true
            end,
        }))
    end,
    can_use = function(self, card)
        return true
    end
}
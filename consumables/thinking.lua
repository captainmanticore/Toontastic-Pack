
SMODS.Consumable {
    key = 'thinking',
    set = 'Spectral',
    pos = { x = 5, y = 1 },
    loc_txt = {
        name = 'thinking',
        text = {
            [1] = 'make brainstorm'
        }
    },
    cost = 12,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_brainstorm' })
                if new_joker then
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'whenthespinachhitsharderthanexpected',
    set = 'tuff',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'when the spinach hits harder than expected',
        text = {
            [1] = '{C:inactive}when the {}{C:green}spinach {}{C:inactive}hits{} {C:red,s:1.4}harder {}{C:enhanced}than{} {C:blue}expected{}'
        }
    },
    cost = 3,
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
                local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_toontast_spinach' })
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
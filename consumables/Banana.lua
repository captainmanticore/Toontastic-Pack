
SMODS.Consumable {
    key = 'Banana',
    set = 'Tarot',
    pos = { x = 6, y = 1 },
    config = { 
        extra = {
            dollars0 = 20   
        } 
    },
    loc_txt = {
        name = 'Banana',
        text = {
            [1] = '{C:money}+20{} Cash',
            [2] = ''
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
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + 20
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(20).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("toontast_ohbanana")
                
                return true
            end,
        }))
    end,
    can_use = function(self, card)
        return true
    end
}
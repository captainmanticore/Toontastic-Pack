
SMODS.Joker{ --The Grinch
    key = "thegrinch",
    config = {
        extra = {
            chips0 = 8,
            mult0 = 9
        }
    },
    loc_txt = {
        ['name'] = 'The Grinch',
        ['text'] = {
            [1] = 'If you Play a {C:attention}6{} and {C:attention}7{}, He gives {C:chips}+8{} Chips and {C:mult}+9{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
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
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 6 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 7 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("toontast_89")
                        
                        return true
                    end,
                }))
                return {
                    chips = 8,
                    extra = {
                        mult = 9
                    }
                }
            end
        end
    end
}
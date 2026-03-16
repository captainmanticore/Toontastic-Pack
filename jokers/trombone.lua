
SMODS.Joker{ --Trombone
    key = "trombone",
    config = {
        extra = {
            chips0 = 100
        }
    },
    loc_txt = {
        ['name'] = 'Trombone',
        ['text'] = {
            [1] = 'If hand contains no Face cards, {C:blue}+100{} Chips',
            [2] = 'idea by {X:blue,C:white}Sheep_withashotgun{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                return {
                    chips = 100
                }
            end
        end
    end
}
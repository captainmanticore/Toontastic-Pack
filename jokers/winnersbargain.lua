
SMODS.Joker{ --Winners Bargain
    key = "winnersbargain",
    config = {
        extra = {
            bestwinstreak = 0
        }
    },
    loc_txt = {
        ['name'] = 'Winners Bargain',
        ['text'] = {
            [1] = 'Adds your Winstreak as xMult',
            [2] = '{C:inactive}currently #1# {}',
            [3] = 'idea by {X:blue,C:white}Sheep_withashotgun{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {G.PROFILES[G.SETTINGS.profile].high_scores.win_streak.amt}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = G.PROFILES[G.SETTINGS.profile].high_scores.win_streak.amt
            }
        end
    end
}
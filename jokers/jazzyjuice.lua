
SMODS.Joker{ --Jazzy Juice
    key = "jazzyjuice",
    config = {
        extra = {
            commonjokers = 0,
            pb_bonus_8b7c3ae7 = 30
        }
    },
    loc_txt = {
        ['name'] = 'Jazzy Juice',
        ['text'] = {
            [1] = '{X:chips,C:white}X5.5{} Chips For Every {C:common}Common{} Joker',
            [2] = 'Played {C:clubs}Clubs{} Permanently Gain {C:blue}50{} Chips when Scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 19,
    rarity = "toontast_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    soul_pos = {
        x = 6,
        y = 4
    },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {((function() local count = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do if joker.config.center.rarity == 1 then count = count + 1 end end; return count end)()) * 5.5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, joker_owned in pairs(G.jokers.cards or {}) do
                    if joker_owned.config.center.rarity == 1 then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
                return {
                x_chips = ((function() local count = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker.config.center.rarity == 1 then count = count + 1 end end; return count end)()) * 5.5
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Clubs") or SMODS.get_enhancements(context.other_card)["m_wild"] == true) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 30
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}

SMODS.Joker{ --MOAB
    key = "moab",
    config = {
        extra = {
            bettercampfir = 3
        }
    },
    loc_txt = {
        ['name'] = 'MOAB',
        ['text'] = {
            [1] = '{X:blue,C:white}X#1# {} Chips',
            [2] = 'Increases By {X:blue,C:white}1{} When a Card is Sold'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "toontast_moab_class",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["toontast_toontast_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.bettercampfir}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.bettercampfir = (card.ability.extra.bettercampfir) + 1
                    return true
                end
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.bettercampfir = 5
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.bettercampfir
            }
        end
    end
}

SMODS.Seal {
    key = 'noteseal',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            odds = 3,
            chips0 = 30,
            mult0 = 15,
            dollars0 = 7
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Note Seal',
        label = 'Note Seal',
        text = {
            [1] = '{C:blue}+30{} Chips or {C:red}+15{} Mult or {C:money}+7{} Money'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "toontast_note", per = 1, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("toontast_note")
                    
                    return true
                end,
            }))
            if SMODS.pseudorandom_probability(card, 'group_0_ab717cbc', 1, card.ability.seal.extra.odds, 'j_toontast_noteseal', true) then
                SMODS.calculate_effect({chips = 30}, card)
            end
            if SMODS.pseudorandom_probability(card, 'group_1_c103ea72', 1, card.ability.seal.extra.odds, 'j_toontast_noteseal', true) then
                SMODS.calculate_effect({mult = 15}, card)
            end
            if SMODS.pseudorandom_probability(card, 'group_2_41c2aaee', 1, card.ability.seal.extra.odds, 'j_toontast_noteseal', true) then
                SMODS.calculate_effect({
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 7
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(7), colour = G.C.MONEY})
                        return true
                    end}, card)
                end
            end
        end
    }
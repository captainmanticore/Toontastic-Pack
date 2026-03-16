
SMODS.Seal {
    key = 'soul',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult0 = 3
        }
    },
    badge_colour = HEX('ff0000'),
    loc_txt = {
        name = 'Soul',
        label = 'Soul',
        text = {
            [1] = '{X:red,C:white}X3{} Mult'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "toontast_save", per = 1, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                Xmult = 3
            }
        end
    end
}
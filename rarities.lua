SMODS.Rarity {
    key = "tuff",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.027,
    badge_colour = HEX('ff0000'),
    loc_txt = {
        name = "Tuff"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "epic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.03,
    badge_colour = HEX('fff500'),
    loc_txt = {
        name = "Epic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "moab_class",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('80b8f3'),
    loc_txt = {
        name = "Moab Class"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
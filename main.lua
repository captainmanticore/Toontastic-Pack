SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

loc_colour()
G.ARGS.LOC_COLOURS.Toontast_epic = HEX('FFF000')

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {46,11,24,64,61,32,25,54,1,57,51,62,43,52,27,30,49,50,8,55,14,42,60,59,10,44,65,16,20,7,31,48,13,41,23,18,19,12,34,53,45,17,63,22,29,28,38,5,56,33,47,26,37,39,58,4,3,2,15,40,35,9,66,21,6,36,67}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {2,27,3,5,18,13,6,1,7,22,23,11,19,15,25,4,10,8,9,26,24,12,16,20,14,17,21}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {1,4,2,3}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local sealIndexList = {5,2,1,4,6,3}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local voucherIndexList = {1}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {2,1}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "toontast_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "toontast_toontast_jokers",
    cards = {
        ["j_toontast__2012"] = true,
        ["j_toontast__55"] = true,
        ["j_toontast__56"] = true,
        ["j_toontast__67kid"] = true,
        ["j_toontast_astroprint"] = true,
        ["j_toontast_bad"] = true,
        ["j_toontast_bananafarmer"] = true,
        ["j_toontast_bear5"] = true,
        ["j_toontast_bfb"] = true,
        ["j_toontast_blackbloon"] = true,
        ["j_toontast_bluebloon"] = true,
        ["j_toontast_bob"] = true,
        ["j_toontast_boykisser"] = true,
        ["j_toontast_camobloon"] = true,
        ["j_toontast_caseoh"] = true,
        ["j_toontast_ceramicbloon"] = true,
        ["j_toontast_chickencar"] = true,
        ["j_toontast_d1dice"] = true,
        ["j_toontast_dartmonkey"] = true,
        ["j_toontast_ddt"] = true,
        ["j_toontast_diagonaljoker"] = true,
        ["j_toontast_goldbloon"] = true,
        ["j_toontast_greenbloon"] = true,
        ["j_toontast_hamburglar"] = true,
        ["j_toontast_jaxxaphobio"] = true,
        ["j_toontast_jazzyjuice"] = true,
        ["j_toontast_jimboifhewaspeak"] = true,
        ["j_toontast_keithledger"] = true,
        ["j_toontast_longjoker"] = true,
        ["j_toontast_madnonjoker"] = true,
        ["j_toontast_melan"] = true,
        ["j_toontast_moab"] = true,
        ["j_toontast_musicaljoker"] = true,
        ["j_toontast_number15"] = true,
        ["j_toontast_oldcreditcard"] = true,
        ["j_toontast_one"] = true,
        ["j_toontast_phobos92"] = true,
        ["j_toontast_phone"] = true,
        ["j_toontast_pinkbloon"] = true,
        ["j_toontast_purplebloon"] = true,
        ["j_toontast_rainbowbloon"] = true,
        ["j_toontast_redbloon"] = true,
        ["j_toontast_shoebench"] = true,
        ["j_toontast_slotmachine"] = true,
        ["j_toontast_spideyhulksquish"] = true,
        ["j_toontast_spinach"] = true,
        ["j_toontast_thecolafox"] = true,
        ["j_toontast_thecookie"] = true,
        ["j_toontast_thegrinch"] = true,
        ["j_toontast_theneighborwithkiwi"] = true,
        ["j_toontast_trianglejoker"] = true,
        ["j_toontast_trombone"] = true,
        ["j_toontast_whitebloon"] = true,
        ["j_toontast_winnersbargain"] = true,
        ["j_toontast_witch"] = true,
        ["j_toontast_yellowbloon"] = true,
        ["j_toontast_yourbestfriend"] = true,
        ["j_toontast_zebrabloon"] = true,
        ["j_toontast_zomg"] = true
    },
})

SMODS.ObjectType({
    key = "toontast_Legendarytoon",
    cards = {
        ["j_toontast_ishmael"] = true,
        ["j_toontast_max"] = true,
        ["j_toontast_sheepwithashotgun"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end
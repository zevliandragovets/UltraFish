-- ============================================================================
-- ROBLOX FISHING AUTOMATION SYSTEM
-- Total Fishes: 392 | Features: Auto Fish, Auto Sell, Rarity Filter
-- Modes: Blatant (Multi-Catch) & Legit | Network Optimized
-- ============================================================================

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ============================================================================
-- FISH DATABASE (392 ENTRIES)
-- ============================================================================
local FishDatabase = {
    [1] = {Data = {Id = 43, Type = "Fish", Name = "Reef Chromis", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [2] = {Data = {Id = 15, Type = "Fish", Name = "Abyss Seahorse", Tier = 5, TierName = "Mythic"}, SellPrice = 38500, Probability = {Chance = 1.18E-05}},
    [3] = {Data = {Id = 20, Type = "Fish", Name = "Ash Basslet", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [4] = {Data = {Id = 17, Type = "Fish", Name = "Astra Damsel", Tier = 4, TierName = "Epic"}, SellPrice = 1633, Probability = {Chance = 0.0005}},
    [5] = {Data = {Id = 66, Type = "Fish", Name = "Azure Damsel", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [6] = {Data = {Id = 44, Type = "Fish", Name = "Banded Butterfly", Tier = 2, TierName = "Uncommon"}, SellPrice = 153, Probability = {Chance = 0.008}},
    [7] = {Data = {Id = 22, Type = "Fish", Name = "Blue Lobster", Tier = 4, TierName = "Legendary"}, SellPrice = 11355, Probability = {Chance = 4.00E-05}},
    [8] = {Data = {Id = 47, Type = "Fish", Name = "Blueflame Ray", Tier = 5, TierName = "Mythic"}, SellPrice = 45000, Probability = {Chance = 1.08E-05}},
    [9] = {Data = {Id = 45, Type = "Fish", Name = "Boa Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.06666666666666667}},
    [10] = {Data = {Id = 37, Type = "Fish", Name = "Bumblebee Grouper", Tier = 4, TierName = "Legendary"}, SellPrice = 3225, Probability = {Chance = 0.0002}},
    [11] = {Data = {Id = 59, Type = "Fish", Name = "Candy Butterfly", Tier = 2, TierName = "Rare"}, SellPrice = 419, Probability = {Chance = 0.0026666666666666666}},
    [12] = {Data = {Id = 18, Type = "Fish", Name = "Charmed Tang", Tier = 3, TierName = "Rare"}, SellPrice = 393, Probability = {Chance = 0.003076923076923077}},
    [13] = {Data = {Id = 53, Type = "Fish", Name = "Chrome Tuna", Tier = 4, TierName = "Legendary"}, SellPrice = 4050, Probability = {Chance = 0.00011111111111111112}},
    [14] = {Data = {Id = 64, Type = "Fish", Name = "Clownfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [15] = {Data = {Id = 19, Type = "Fish", Name = "Coal Tang", Tier = 2, TierName = "Uncommon"}, SellPrice = 74, Probability = {Chance = 0.02}},
    [16] = {Data = {Id = 67, Type = "Fish", Name = "Copperband Butterfly", Tier = 2, TierName = "Common"}, SellPrice = 76, Probability = {Chance = 0.05}},
    [17] = {Data = {Id = 31, Type = "Fish", Name = "Corazon Damsel", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [18] = {Data = {Id = 57, Type = "Fish", Name = "Cow Clownfish", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [19] = {Data = {Id = 71, Type = "Fish", Name = "Darwin Clownfish", Tier = 3, TierName = "Rare"}, SellPrice = 869, Probability = {Chance = 0.0013333333333333333}},
    [20] = {Data = {Id = 26, Type = "Fish", Name = "Domino Damsel", Tier = 4, TierName = "Epic"}, SellPrice = 1444, Probability = {Chance = 0.0006666666666666666}},
    [21] = {Data = {Id = 70, Type = "Fish", Name = "Dorhey Tang", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [22] = {Data = {Id = 75, Type = "Fish", Name = "Dotted Stingray", Tier = 5, TierName = "Mythic"}, SellPrice = 31500, Probability = {Chance = 1.10E-05}},
    [23] = {Data = {Id = 14, Type = "Fish", Name = "Enchanted Angelfish", Tier = 4, TierName = "Legendary"}, SellPrice = 4200, Probability = {Chance = 0.0002}},
    [24] = {Data = {Id = 41, Type = "Fish", Name = "Fire Goby", Tier = 2, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [25] = {Data = {Id = 49, Type = "Fish", Name = "Firecoal Damsel", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.0004}},
    [26] = {Data = {Id = 68, Type = "Fish", Name = "Flame Angelfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 135, Probability = {Chance = 0.01}},
    [27] = {Data = {Id = 25, Type = "Fish", Name = "Greenbee Grouper", Tier = 4, TierName = "Legendary"}, SellPrice = 5732, Probability = {Chance = 0.00016666666666666666}},
    [28] = {Data = {Id = 52, Type = "Fish", Name = "Hammerhead Shark", Tier = 5, TierName = "Mythic"}, SellPrice = 46500, Probability = {Chance = 1.00E-05}},
    [29] = {Data = {Id = 21, Type = "Fish", Name = "Hawks Turtle", Tier = 5, TierName = "Mythic"}, SellPrice = 40500, Probability = {Chance = 1.33E-05}},
    [30] = {Data = {Id = 24, Type = "Fish", Name = "Starjam Tang", Tier = 4, TierName = "Legendary"}, SellPrice = 4200, Probability = {Chance = 0.0002}},
    [31] = {Data = {Id = 46, Type = "Fish", Name = "Jennifer Dottyback", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [32] = {Data = {Id = 60, Type = "Fish", Name = "Jewel Tang", Tier = 2, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [33] = {Data = {Id = 40, Type = "Fish", Name = "Kau Cardinal", Tier = 3, TierName = "Rare"}, SellPrice = 869, Probability = {Chance = 0.0013333333333333333}},
    [34] = {Data = {Id = 72, Type = "Fish", Name = "Korean Angelfish", Tier = 3, TierName = "Rare"}, SellPrice = 391, Probability = {Chance = 0.0033333333333333335}},
    [35] = {Data = {Id = 48, Type = "Fish", Name = "Lavafin Tuna", Tier = 4, TierName = "Legendary"}, SellPrice = 4500, Probability = {Chance = 0.00010001000100010001}},
    [36] = {Data = {Id = 36, Type = "Fish", Name = "Lobster", Tier = 4, TierName = "Legendary"}, SellPrice = 15750, Probability = {Chance = 4.00E-05}},
    [37] = {Data = {Id = 34, Type = "Fish", Name = "Loggerhead Turtle", Tier = 5, TierName = "Mythic"}, SellPrice = 27000, Probability = {Chance = 1.82E-05}},
    [38] = {Data = {Id = 38, Type = "Fish", Name = "Longnose Butterfly", Tier = 4, TierName = "Epic"}, SellPrice = 1575, Probability = {Chance = 0.0006666666666666666}},
    [39] = {Data = {Id = 16, Type = "Fish", Name = "Magic Tang", Tier = 4, TierName = "Legendary"}, SellPrice = 4500, Probability = {Chance = 0.00013333333333333334}},
    [40] = {Data = {Id = 50, Type = "Fish", Name = "Magma Goby", Tier = 2, TierName = "Uncommon"}, SellPrice = 95, Probability = {Chance = 0.01818181818181818}},
    [41] = {Data = {Id = 54, Type = "Fish", Name = "Manta Ray", Tier = 5, TierName = "Mythic"}, SellPrice = 24750, Probability = {Chance = 2.00E-05}},
    [42] = {Data = {Id = 56, Type = "Fish", Name = "Maroon Butterfly", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [43] = {Data = {Id = 23, Type = "Fish", Name = "Maze Angelfish", Tier = 3, TierName = "Uncommon"}, SellPrice = 153, Probability = {Chance = 0.008}},
    [44] = {Data = {Id = 55, Type = "Fish", Name = "Moorish Idol", Tier = 4, TierName = "Epic"}, SellPrice = 2700, Probability = {Chance = 0.00030003000300030005}},
    [45] = {Data = {Id = 117, Type = "Fish", Name = "Bandit Angelfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 105, Probability = {Chance = 0.015384615384615385}},
    [46] = {Data = {Id = 116, Type = "Fish", Name = "Zoster Butterfly", Tier = 1, TierName = "Common"}, SellPrice = 28, Probability = {Chance = 0.125}},
    [47] = {Data = {Id = 32, Type = "Fish", Name = "Orangy Goby", Tier = 1, TierName = "Common"}, SellPrice = 36, Probability = {Chance = 0.14285714285714285}},
    [48] = {Data = {Id = 27, Type = "Fish", Name = "Panther Grouper", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [49] = {Data = {Id = 35, Type = "Fish", Name = "Prismy Seahorse", Tier = 5, TierName = "Mythic"}, SellPrice = 29250, Probability = {Chance = 1.25E-05}},
    [50] = {Data = {Id = 29, Type = "Fish", Name = "Scissortail Dartfish", Tier = 2, TierName = "Rare"}, SellPrice = 369, Probability = {Chance = 0.0033333333333333335}},
    [51] = {Data = {Id = 42, Type = "Fish", Name = "Shrimp Goby", Tier = 2, TierName = "Uncommon"}, SellPrice = 90, Probability = {Chance = 0.02}},
    [52] = {Data = {Id = 63, Type = "Fish", Name = "Skunk Tilefish", Tier = 1, TierName = "Common"}, SellPrice = 36, Probability = {Chance = 0.14285714285714285}},
    [53] = {Data = {Id = 33, Type = "Fish", Name = "Specked Butterfly", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [54] = {Data = {Id = 65, Type = "Fish", Name = "Strawberry Dotty", Tier = 1, TierName = "Common"}, SellPrice = 27, Probability = {Chance = 0.05}},
    [55] = {Data = {Id = 39, Type = "Fish", Name = "Sushi Cardinal", Tier = 4, TierName = "Epic"}, SellPrice = 1282, Probability = {Chance = 0.0008}},
    [56] = {Data = {Id = 30, Type = "Fish", Name = "Tricolore Butterfly", Tier = 2, TierName = "Uncommon"}, SellPrice = 112, Probability = {Chance = 0.014285714285714285}},
    [57] = {Data = {Id = 74, Type = "Fish", Name = "Unicorn Tang", Tier = 4, TierName = "Epic"}, SellPrice = 2835, Probability = {Chance = 0.00022222222222222223}},
    [58] = {Data = {Id = 62, Type = "Fish", Name = "Vintage Blue Tang", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [59] = {Data = {Id = 58, Type = "Fish", Name = "Vintage Damsel", Tier = 2, TierName = "Uncommon"}, SellPrice = 180, Probability = {Chance = 0.007407407407407408}},
    [60] = {Data = {Id = 51, Type = "Fish", Name = "Volcanic Basslet", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [61] = {Data = {Id = 28, Type = "Fish", Name = "White Clownfish", Tier = 2, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [62] = {Data = {Id = 69, Type = "Fish", Name = "Yello Damselfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 99, Probability = {Chance = 0.02}},
    [63] = {Data = {Id = 73, Type = "Fish", Name = "Yellowfin Tuna", Tier = 4, TierName = "Legendary"}, SellPrice = 3600, Probability = {Chance = 0.00013333333333333334}},
    [64] = {Data = {Id = 61, Type = "Fish", Name = "Yellowstate Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [65] = {Data = {Id = 190, Type = "Fish", Name = "Salmon", Tier = 2, TierName = "Uncommon"}, SellPrice = 103, Probability = {Chance = 0.02}},
    [66] = {Data = {Id = 82, Type = "Fish", Name = "Blob Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 98000, Probability = {Chance = 4.00E-06}},
    [67] = {Data = {Id = 89, Type = "Fish", Name = "Volsail Tang", Tier = 3, TierName = "Rare"}, SellPrice = 369, Probability = {Chance = 0.0033333333333333335}},
    [68] = {Data = {Id = 88, Type = "Fish", Name = "Rockform Cardianl", Tier = 3, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [69] = {Data = {Id = 87, Type = "Fish", Name = "Lava Butterfly", Tier = 2, TierName = "Uncommon"}, SellPrice = 153, Probability = {Chance = 0.008}},
    [70] = {Data = {Id = 86, Type = "Fish", Name = "Slurpfish Chromis", Tier = 2, TierName = "Legendary"}, SellPrice = 3830, Probability = {Chance = 0.000125}},
    [71] = {Data = {Id = 92, Type = "Fish", Name = "Festive Goby", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.3333333333333333}},
    [72] = {Data = {Id = 91, Type = "Fish", Name = "Mistletoe Damsel", Tier = 1, TierName = "Common"}, SellPrice = 26, Probability = {Chance = 0.25}},
    [73] = {Data = {Id = 90, Type = "Fish", Name = "Gingerbread Tang", Tier = 1, TierName = "Common"}, SellPrice = 26, Probability = {Chance = 0.2}},
    [74] = {Data = {Id = 99, Type = "Fish", Name = "Great Christmas Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 195000, Probability = {Chance = 1.00E-06}},
    [75] = {Data = {Id = 94, Type = "Fish", Name = "Gingerbread Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 72, Probability = {Chance = 0.01818181818181818}},
    [76] = {Data = {Id = 97, Type = "Fish", Name = "Gingerbread Turtle", Tier = 5, TierName = "Mythic"}, SellPrice = 38750, Probability = {Chance = 1.43E-05}},
    [77] = {Data = {Id = 98, Type = "Fish", Name = "Gingerbread Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 89253, Probability = {Chance = 5.00E-06}},
    [78] = {Data = {Id = 93, Type = "Fish", Name = "Christmastree Longnose", Tier = 3, TierName = "Rare"}, SellPrice = 190, Probability = {Chance = 0.002857142857142857}},
    [79] = {Data = {Id = 95, Type = "Fish", Name = "Candycane Lobster", Tier = 4, TierName = "Epic"}, SellPrice = 2138, Probability = {Chance = 0.0005}},
    [80] = {Data = {Id = 96, Type = "Fish", Name = "Festive Pufferfish", Tier = 4, TierName = "Epic"}, SellPrice = 1244, Probability = {Chance = 0.0008333333333333334}},
    [81] = {Data = {Id = 106, Type = "Fish", Name = "Blue-Banded Goby", Tier = 2, TierName = "Uncommon"}, SellPrice = 91, Probability = {Chance = 0.02}},
    [82] = {Data = {Id = 107, Type = "Fish", Name = "Blumato Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 95, Probability = {Chance = 0.01818181818181818}},
    [83] = {Data = {Id = 108, Type = "Fish", Name = "Conspi Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [84] = {Data = {Id = 109, Type = "Fish", Name = "Fade Tang", Tier = 1, TierName = "Common"}, SellPrice = 43, Probability = {Chance = 0.06666666666666667}},
    [85] = {Data = {Id = 110, Type = "Fish", Name = "Lined Cardinal Fish", Tier = 5, TierName = "Legendary"}, SellPrice = 3100, Probability = {Chance = 0.0001818181818181818}},
    [86] = {Data = {Id = 111, Type = "Fish", Name = "Masked Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [87] = {Data = {Id = 112, Type = "Fish", Name = "Pygmy Goby", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.16666666666666666}},
    [88] = {Data = {Id = 113, Type = "Fish", Name = "Sail Tang", Tier = 1, TierName = "Common"}, SellPrice = 24, Probability = {Chance = 0.2}},
    [89] = {Data = {Id = 114, Type = "Fish", Name = "Watanabei Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [90] = {Data = {Id = 115, Type = "Fish", Name = "White Tang", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.2}},
    [91] = {Data = {Id = 119, Type = "Fish", Name = "Ballina Angelfish", Tier = 3, TierName = "Rare"}, SellPrice = 391, Probability = {Chance = 0.0033333333333333335}},
    [92] = {Data = {Id = 121, Type = "Fish", Name = "Bleekers Damsel", Tier = 2, TierName = "Common"}, SellPrice = 74, Probability = {Chance = 0.02857142857142857}},
    [93] = {Data = {Id = 122, Type = "Fish", Name = "Loving Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 59583, Probability = {Chance = 6.67E-06}},
    [94] = {Data = {Id = 120, Type = "Fish", Name = "Pink Smith Damsel", Tier = 2, TierName = "Uncommon"}, SellPrice = 62, Probability = {Chance = 0.02}},
    [95] = {Data = {Id = 138, Type = "Fish", Name = "Axolotl", Tier = 4, TierName = "Legendary"}, SellPrice = 3971, Probability = {Chance = 0.00015384615384615385}},
    [96] = {Data = {Id = 139, Type = "Fish", Name = "Silver Tuna", Tier = 2, TierName = "Uncommon"}, SellPrice = 62, Probability = {Chance = 0.016666666666666666}},
    [97] = {Data = {Id = 140, Type = "Fish", Name = "Pilot Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [98] = {Data = {Id = 135, Type = "Fish", Name = "Patriot Tang", Tier = 1, TierName = "Common"}, SellPrice = 36, Probability = {Chance = 0.1}},
    [99] = {Data = {Id = 136, Type = "Fish", Name = "Frostborn Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 100000, Probability = {Chance = 2.00E-06}},
    [100] = {Data = {Id = 137, Type = "Fish", Name = "Plasma Shark", Tier = 5, TierName = "Mythic"}, SellPrice = 94500, Probability = {Chance = 4.44E-06}},
    [101] = {Data = {Id = 143, Type = "Fish", Name = "Pufferfish", Tier = 4, TierName = "Epic"}, SellPrice = 1145, Probability = {Chance = 0.0006666666666666666}},
    [102] = {Data = {Id = 144, Type = "Fish", Name = "Racoon Butterfly Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 71, Probability = {Chance = 0.02}},
    [103] = {Data = {Id = 142, Type = "Fish", Name = "Orange Basslet", Tier = 2, TierName = "Uncommon"}, SellPrice = 64, Probability = {Chance = 0.02}},
    [104] = {Data = {Id = 146, Type = "Fish", Name = "Strippled Seahorse", Tier = 5, TierName = "Mythic"}, SellPrice = 40500, Probability = {Chance = 1.05E-05}},
    [105] = {Data = {Id = 147, Type = "Fish", Name = "Thresher Shark", Tier = 5, TierName = "Mythic"}, SellPrice = 44000, Probability = {Chance = 1.05E-05}},
    [106] = {Data = {Id = 141, Type = "Fish", Name = "Great Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 180000, Probability = {Chance = 1.05E-06}},
    [107] = {Data = {Id = 163, Type = "Fish", Name = "Viperfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 94, Probability = {Chance = 0.02}},
    [108] = {Data = {Id = 152, Type = "Fish", Name = "Deep Sea Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 4680, Probability = {Chance = 0.0002}},
    [109] = {Data = {Id = 161, Type = "Fish", Name = "Spotted Lantern Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 88, Probability = {Chance = 0.02}},
    [110] = {Data = {Id = 159, Type = "Fish", Name = "Robot Kraken", Tier = 7, TierName = "SECRET"}, SellPrice = 327500, Probability = {Chance = 2.86E-07}},
    [111] = {Data = {Id = 160, Type = "Fish", Name = "Monk Fish", Tier = 4, TierName = "Epic"}, SellPrice = 3200, Probability = {Chance = 0.0003333333333333333}},
    [112] = {Data = {Id = 158, Type = "Fish", Name = "King Crab", Tier = 6, TierName = "SECRET"}, SellPrice = 218500, Probability = {Chance = 8.33E-07}},
    [113] = {Data = {Id = 157, Type = "Fish", Name = "Jellyfish", Tier = 3, TierName = "Rare"}, SellPrice = 402, Probability = {Chance = 0.0033333333333333335}},
    [114] = {Data = {Id = 156, Type = "Fish", Name = "Giant Squid", Tier = 7, TierName = "SECRET"}, SellPrice = 162300, Probability = {Chance = 1.25E-06}},
    [115] = {Data = {Id = 155, Type = "Fish", Name = "Fangtooth", Tier = 4, TierName = "Epic"}, SellPrice = 1840, Probability = {Chance = 0.0005}},
    [116] = {Data = {Id = 154, Type = "Fish", Name = "Electric Eel", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [117] = {Data = {Id = 162, Type = "Fish", Name = "Vampire Squid", Tier = 4, TierName = "Epic"}, SellPrice = 3770, Probability = {Chance = 0.0003333333333333333}},
    [118] = {Data = {Id = 153, Type = "Fish", Name = "Dark Eel", Tier = 2, TierName = "Uncommon"}, SellPrice = 96, Probability = {Chance = 0.02}},
    [119] = {Data = {Id = 151, Type = "Fish", Name = "Boar Fish", Tier = 1, TierName = "Common"}, SellPrice = 24, Probability = {Chance = 0.5}},
    [120] = {Data = {Id = 150, Type = "Fish", Name = "Blob Fish", Tier = 6, TierName = "Mythic"}, SellPrice = 26200, Probability = {Chance = 2.00E-05}},
    [121] = {Data = {Id = 149, Type = "Fish", Name = "Angler Fish", Tier = 4, TierName = "Epic"}, SellPrice = 3620, Probability = {Chance = 0.0003333333333333333}},
    [122] = {Data = {Id = 166, Type = "Fish", Name = "Dead Fish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.25}},
    [123] = {Data = {Id = 165, Type = "Fish", Name = "Skeleton Fish", Tier = 1, TierName = "Common"}, SellPrice = 26, Probability = {Chance = 0.1}},
    [124] = {Data = {Id = 164, Type = "Fish", Name = "Swordfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 84, Probability = {Chance = 0.02}},
    [125] = {Data = {Id = 145, Type = "Fish", Name = "Worm Fish", Tier = 7, TierName = "SECRET"}, SellPrice = 280000, Probability = {Chance = 3.33E-07}},
    [126] = {Data = {Id = 189, Type = "Fish", Name = "Rockfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 92, Probability = {Chance = 0.02}},
    [127] = {Data = {Id = 191, Type = "Fish", Name = "Sheepshead Fish", Tier = 3, TierName = "Rare"}, SellPrice = 412, Probability = {Chance = 0.0033333333333333335}},
    [128] = {Data = {Id = 182, Type = "Fish", Name = "Blackcap Basslet", Tier = 2, TierName = "Uncommon"}, SellPrice = 95, Probability = {Chance = 0.02}},
    [129] = {Data = {Id = 183, Type = "Fish", Name = "Catfish", Tier = 3, TierName = "Rare"}, SellPrice = 422, Probability = {Chance = 0.0033333333333333335}},
    [130] = {Data = {Id = 184, Type = "Fish", Name = "Coney Fish", Tier = 3, TierName = "Rare"}, SellPrice = 287, Probability = {Chance = 0.0033333333333333335}},
    [131] = {Data = {Id = 185, Type = "Fish", Name = "Hermit Crab", Tier = 6, TierName = "Mythic"}, SellPrice = 29700, Probability = {Chance = 1.67E-05}},
    [132] = {Data = {Id = 186, Type = "Fish", Name = "Crater Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 93, Probability = {Chance = 0.02}},
    [133] = {Data = {Id = 187, Type = "Fish", Name = "Queen Crab", Tier = 7, TierName = "SECRET"}, SellPrice = 218500, Probability = {Chance = 1.25E-06}},
    [134] = {Data = {Id = 188, Type = "Fish", Name = "Red Snapper", Tier = 2, TierName = "Uncommon"}, SellPrice = 97, Probability = {Chance = 0.02}},
    [135] = {Data = {Id = 199, Type = "Fish", Name = "Lake Sturgeon", Tier = 5, TierName = "Legendary"}, SellPrice = 14350, Probability = {Chance = 5.00E-05}},
    [136] = {Data = {Id = 200, Type = "Fish", Name = "Orca", Tier = 7, TierName = "SECRET"}, SellPrice = 231500, Probability = {Chance = 6.67E-07}},
    [137] = {Data = {Id = 194, Type = "Fish", Name = "Barracuda Fish", Tier = 3, TierName = "Rare"}, SellPrice = 392, Probability = {Chance = 0.0033333333333333335}},
    [138] = {Data = {Id = 195, Type = "Fish", Name = "Crystal Crab", Tier = 7, TierName = "SECRET"}, SellPrice = 162000, Probability = {Chance = 1.33E-06}},
    [139] = {Data = {Id = 196, Type = "Fish", Name = "Frog", Tier = 3, TierName = "Rare"}, SellPrice = 432, Probability = {Chance = 0.002857142857142857}},
    [140] = {Data = {Id = 197, Type = "Fish", Name = "Gar Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 72, Probability = {Chance = 0.02}},
    [141] = {Data = {Id = 198, Type = "Fish", Name = "Herring Fish", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.1}},
    [142] = {Data = {Id = 210, Type = "Fish", Name = "Dark Tentacle", Tier = 3, TierName = "Rare"}, SellPrice = 392, Probability = {Chance = 0.0033333333333333335}},
    [143] = {Data = {Id = 202, Type = "Fish", Name = "Flat Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [144] = {Data = {Id = 203, Type = "Fish", Name = "Flying Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [145] = {Data = {Id = 204, Type = "Fish", Name = "Lion Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 143, Probability = {Chance = 0.01}},
    [146] = {Data = {Id = 209, Type = "Fish", Name = "Starfish", Tier = 3, TierName = "Rare"}, SellPrice = 385, Probability = {Chance = 0.0033333333333333335}},
    [147] = {Data = {Id = 211, Type = "Fish", Name = "Wahoo", Tier = 2, TierName = "Uncommon"}, SellPrice = 105, Probability = {Chance = 0.015384615384615385}},
    [148] = {Data = {Id = 208, Type = "Fish", Name = "Saw Fish", Tier = 5, TierName = "Legendary"}, SellPrice = 11250, Probability = {Chance = 6.67E-05}},
    [149] = {Data = {Id = 207, Type = "Fish", Name = "Pink Dolphin", Tier = 4, TierName = "Legendary"}, SellPrice = 3910, Probability = {Chance = 0.0002}},
    [150] = {Data = {Id = 206, Type = "Fish", Name = "Monster Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 245000, Probability = {Chance = 4.00E-07}},
    [151] = {Data = {Id = 205, Type = "Fish", Name = "Luminous Fish", Tier = 6, TierName = "Mythic"}, SellPrice = 31150, Probability = {Chance = 1.25E-05}},
    [152] = {Data = {Id = 201, Type = "Fish", Name = "Eerie Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 92500, Probability = {Chance = 4.00E-06}},
    [153] = {Data = {Id = 225, Type = "Fish", Name = "Scare", Tier = 7, TierName = "SECRET"}, SellPrice = 280000, Probability = {Chance = 3.33E-07}},
    [154] = {Data = {Id = 224, Type = "Fish", Name = "Synodontis", Tier = 5, TierName = "Legendary"}, SellPrice = 3825, Probability = {Chance = 0.0002}},
    [155] = {Data = {Id = 215, Type = "Fish", Name = "Armor Catfish", Tier = 6, TierName = "Mythic"}, SellPrice = 30500, Probability = {Chance = 2.00E-05}},
    [156] = {Data = {Id = 218, Type = "Fish", Name = "Thin Armor Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 91000, Probability = {Chance = 3.33E-06}},
    [157] = {Data = {Id = 227, Type = "Fish", Name = "Narwhal", Tier = 4, TierName = "Epic"}, SellPrice = 2045, Probability = {Chance = 0.0005}},
    [158] = {Data = {Id = 228, Type = "Fish", Name = "Lochness Monster", Tier = 7, TierName = "SECRET"}, SellPrice = 330000, Probability = {Chance = 3.33E-07}},
    [159] = {Data = {Id = 239, Type = "Fish", Name = "Antique Cup", Tier = 3, TierName = "Rare"}, SellPrice = 430, Probability = {Chance = 0.0033333333333333335}},
    [160] = {Data = {Id = 238, Type = "Fish", Name = "Antique Watch", Tier = 3, TierName = "Epic"}, SellPrice = 1680, Probability = {Chance = 0.0006666666666666666}},
    [161] = {Data = {Id = 232, Type = "Fish", Name = "Sea Shell", Tier = 2, TierName = "Uncommon"}, SellPrice = 76, Probability = {Chance = 0.02}},
    [162] = {Data = {Id = 235, Type = "Fish", Name = "Pearl", Tier = 3, TierName = "Rare"}, SellPrice = 715, Probability = {Chance = 0.0033333333333333335}},
    [163] = {Data = {Id = 234, Type = "Fish", Name = "Old Boot", Tier = 1, TierName = "Common"}, SellPrice = 27, Probability = {Chance = 0.04}},
    [164] = {Data = {Id = 233, Type = "Fish", Name = "Expensive Chain", Tier = 4, TierName = "Epic"}, SellPrice = 1580, Probability = {Chance = 0.0006666666666666666}},
    [165] = {Data = {Id = 236, Type = "Fish", Name = "Diamond Ring", Tier = 5, TierName = "Legendary"}, SellPrice = 3580, Probability = {Chance = 0.0002}},
    [166] = {Data = {Id = 237, Type = "Fish", Name = "Conch Shell", Tier = 2, TierName = "Uncommon"}, SellPrice = 72, Probability = {Chance = 0.02}},
    [167] = {Data = {Id = 226, Type = "Fish", Name = "Megalodon", Tier = 7, TierName = "SECRET"}, SellPrice = 355000, Probability = {Chance = 2.50E-07}},
    [168] = {Data = {Id = 242, Type = "Fish", Name = "Arowana", Tier = 2, TierName = "Uncommon"}, SellPrice = 61, Probability = {Chance = 0.02}},
    [169] = {Data = {Id = 241, Type = "Fish", Name = "King Mackerel", Tier = 3, TierName = "Rare"}, SellPrice = 358, Probability = {Chance = 0.0033333333333333335}},
    [170] = {Data = {Id = 240, Type = "Fish", Name = "Magma Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 115500, Probability = {Chance = 5.00E-06}},
    [171] = {Data = {Id = 243, Type = "Fish", Name = "Ruby", Tier = 5, TierName = "Legendary"}, SellPrice = 13950, Probability = {Chance = 6.67E-05}},
    [172] = {Data = {Id = 280, Type = "Fish", Name = "Abyshorn Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 63, Probability = {Chance = 0.02}},
    [173] = {Data = {Id = 247, Type = "Fish", Name = "Sharp One", Tier = 6, TierName = "Mythic"}, SellPrice = 54000, Probability = {Chance = 9.52E-06}},
    [174] = {Data = {Id = 249, Type = "Fish", Name = "Hybodus Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 63500, Probability = {Chance = 6.67E-06}},
    [175] = {Data = {Id = 248, Type = "Fish", Name = "Panther Eel", Tier = 6, TierName = "SECRET"}, SellPrice = 151500, Probability = {Chance = 1.33E-06}},
    [176] = {Data = {Id = 83, Type = "Fish", Name = "Ghost Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 125000, Probability = {Chance = 2.00E-06}},
    [177] = {Data = {Id = 176, Type = "Fish", Name = "Ghost Worm Fish", Tier = 7, TierName = "SECRET"}, SellPrice = 195000, Probability = {Chance = 1.00E-06}},
    [178] = {Data = {Id = 287, Type = "Fish", Name = "Zebra Snakehead", Tier = 2, TierName = "Uncommon"}, SellPrice = 164, Probability = {Chance = 0.006666666666666667}},
    [179] = {Data = {Id = 281, Type = "Fish", Name = "Waveback Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [180] = {Data = {Id = 263, Type = "Fish", Name = "Crocodile", Tier = 6, TierName = "Mythic"}, SellPrice = 29500, Probability = {Chance = 2.00E-05}},
    [181] = {Data = {Id = 278, Type = "Fish", Name = "Viperangler Fish", Tier = 3, TierName = "Rare"}, SellPrice = 430, Probability = {Chance = 0.0033333333333333335}},
    [182] = {Data = {Id = 286, Type = "Fish", Name = "Temple Spokes Tuna", Tier = 5, TierName = "Legendary"}, SellPrice = 4730, Probability = {Chance = 0.0002}},
    [183] = {Data = {Id = 276, Type = "Fish", Name = "Spear Guardian", Tier = 4, TierName = "Epic"}, SellPrice = 1150, Probability = {Chance = 0.001}},
    [184] = {Data = {Id = 268, Type = "Fish", Name = "Skeleton Angler Fish", Tier = 4, TierName = "Epic"}, SellPrice = 2750, Probability = {Chance = 0.0003333333333333333}},
    [185] = {Data = {Id = 275, Type = "Fish", Name = "Sail Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 59, Probability = {Chance = 0.02}},
    [186] = {Data = {Id = 283, Type = "Fish", Name = "Sacred Guardian Squid", Tier = 5, TierName = "Legendary"}, SellPrice = 28500, Probability = {Chance = 2.22E-05}},
    [187] = {Data = {Id = 279, Type = "Fish", Name = "Runic Wispeye", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [188] = {Data = {Id = 285, Type = "Fish", Name = "Red Goatfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 145, Probability = {Chance = 0.01}},
    [189] = {Data = {Id = 282, Type = "Fish", Name = "Parrot Fish", Tier = 3, TierName = "Rare"}, SellPrice = 440, Probability = {Chance = 0.0033333333333333335}},
    [190] = {Data = {Id = 277, Type = "Fish", Name = "Mossy Fishlet", Tier = 3, TierName = "Rare"}, SellPrice = 430, Probability = {Chance = 0.0033333333333333335}},
    [191] = {Data = {Id = 262, Type = "Fish", Name = "Ancient Arapaima", Tier = 2, TierName = "Uncommon"}, SellPrice = 64, Probability = {Chance = 0.02}},
    [192] = {Data = {Id = 274, Type = "Fish", Name = "Manoai Statue Fish", Tier = 5, TierName = "Legendary"}, SellPrice = 4700, Probability = {Chance = 0.0002}},
    [193] = {Data = {Id = 273, Type = "Fish", Name = "Mammoth Appafish", Tier = 6, TierName = "Mythic"}, SellPrice = 66000, Probability = {Chance = 6.67E-06}},
    [194] = {Data = {Id = 270, Type = "Fish", Name = "Goliath Tiger", Tier = 4, TierName = "Epic"}, SellPrice = 1380, Probability = {Chance = 0.001}},
    [195] = {Data = {Id = 345, Type = "Fish", Name = "Ancient Lochness Monster", Tier = 7, TierName = "SECRET"}, SellPrice = 100000, Probability = {Chance = 3.33E-07}},
    [196] = {Data = {Id = 288, Type = "Fish", Name = "Drippy Tucanare", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [197] = {Data = {Id = 292, Type = "Fish", Name = "King Jelly", Tier = 7, TierName = "SECRET"}, SellPrice = 225000, Probability = {Chance = 6.67E-07}},
    [198] = {Data = {Id = 290, Type = "Fish", Name = "Beanie Leedsicheye", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [199] = {Data = {Id = 264, Type = "Fish", Name = "Ancient Relic Crocodile", Tier = 6, TierName = "Mythic"}, SellPrice = 98000, Probability = {Chance = 4.08E-06}},
    [200] = {Data = {Id = 293, Type = "Fish", Name = "Bone Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 255000, Probability = {Chance = 5.00E-07}},
    [201] = {Data = {Id = 272, Type = "Fish", Name = "Mosasaur Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 180000, Probability = {Chance = 1.25E-06}},
    [202] = {Data = {Id = 269, Type = "Fish", Name = "Elshark Gran Maja", Tier = 7, TierName = "SECRET"}, SellPrice = 440000, Probability = {Chance = 2.50E-07}},
    [203] = {Data = {Id = 289, Type = "Fish", Name = "Water Snake", Tier = 2, TierName = "Uncommon"}, SellPrice = 61, Probability = {Chance = 0.02}},
    [204] = {Data = {Id = 295, Type = "Fish", Name = "Ancient Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 270000, Probability = {Chance = 3.64E-07}},
    [205] = {Data = {Id = 296, Type = "Fish", Name = "Crystal Salamander", Tier = 5, TierName = "Legendary"}, SellPrice = 4325, Probability = {Chance = 0.00016666666666666666}},
    [206] = {Data = {Id = 301, Type = "Fish", Name = "Dead Scary Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.01}},
    [207] = {Data = {Id = 303, Type = "Fish", Name = "Dead Spooky Koi Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1180, Probability = {Chance = 0.0005}},
    [208] = {Data = {Id = 302, Type = "Fish", Name = "Dead Zombie Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 66000, Probability = {Chance = 2.00E-06}},
    [209] = {Data = {Id = 299, Type = "Fish", Name = "Pumpkin Jellyfish", Tier = 5, TierName = "Legendary"}, SellPrice = 9800, Probability = {Chance = 0.0001}},
    [210] = {Data = {Id = 300, Type = "Fish", Name = "Scary Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [211] = {Data = {Id = 298, Type = "Fish", Name = "Spooky Koi Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1180, Probability = {Chance = 0.001}},
    [212] = {Data = {Id = 304, Type = "Fish", Name = "Toxic Jellyfish", Tier = 4, TierName = "Epic"}, SellPrice = 2138, Probability = {Chance = 0.0005}},
    [213] = {Data = {Id = 297, Type = "Fish", Name = "Zombie Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 66000, Probability = {Chance = 4.00E-06}},
    [214] = {Data = {Id = 310, Type = "Fish", Name = "Baby Pumpkin Shark", Tier = 3, TierName = "Rare"}, SellPrice = 435, Probability = {Chance = 0.0033333333333333335}},
    [215] = {Data = {Id = 316, Type = "Fish", Name = "Dark Pumpkin Appafish", Tier = 6, TierName = "Mythic"}, SellPrice = 54000, Probability = {Chance = 1.00E-05}},
    [216] = {Data = {Id = 308, Type = "Fish", Name = "Frankenstein Longsnapper", Tier = 6, TierName = "Mythic"}, SellPrice = 29500, Probability = {Chance = 2.00E-05}},
    [217] = {Data = {Id = 313, Type = "Fish", Name = "Ghost Spiralfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 68, Probability = {Chance = 0.02}},
    [218] = {Data = {Id = 315, Type = "Fish", Name = "Mossy Vampire Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [219] = {Data = {Id = 309, Type = "Fish", Name = "Pumpkin Angler Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1980, Probability = {Chance = 0.0006666666666666666}},
    [220] = {Data = {Id = 312, Type = "Fish", Name = "Pumpkin Butterfly Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [221] = {Data = {Id = 307, Type = "Fish", Name = "Pumpkin Carved Shark", Tier = 5, TierName = "Legendary"}, SellPrice = 10250, Probability = {Chance = 0.0001}},
    [222] = {Data = {Id = 305, Type = "Fish", Name = "Pumpkin Hermit Crab", Tier = 3, TierName = "Rare"}, SellPrice = 385, Probability = {Chance = 0.0033333333333333335}},
    [223] = {Data = {Id = 314, Type = "Fish", Name = "Pumpkin Ray", Tier = 6, TierName = "Mythic"}, SellPrice = 27600, Probability = {Chance = 2.00E-05}},
    [224] = {Data = {Id = 317, Type = "Fish", Name = "Pumpkin StoneTurtle", Tier = 5, TierName = "Legendary"}, SellPrice = 3900, Probability = {Chance = 0.0002}},
    [225] = {Data = {Id = 318, Type = "Fish", Name = "Spooky Peafish", Tier = 1, TierName = "Common"}, SellPrice = 18, Probability = {Chance = 0.5}},
    [226] = {Data = {Id = 306, Type = "Fish", Name = "Witch Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 61, Probability = {Chance = 0.02}},
    [227] = {Data = {Id = 311, Type = "Fish", Name = "Wizard Stingray", Tier = 5, TierName = "Legendary"}, SellPrice = 4600, Probability = {Chance = 0.0002}},
    [228] = {Data = {Id = 319, Type = "Fish", Name = "Zombie Megalodon", Tier = 7, TierName = "SECRET"}, SellPrice = 375000, Probability = {Chance = 2.50E-07}},
    [229] = {Data = {Id = 333, Type = "Fish", Name = "Candy Corn Eel", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [230] = {Data = {Id = 334, Type = "Fish", Name = "Ghastly Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 11111, Probability = {Chance = 0.0001}},
    [231] = {Data = {Id = 338, Type = "Fish", Name = "Ghastly Hermit Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 4266, Probability = {Chance = 0.0002}},
    [232] = {Data = {Id = 336, Type = "Fish", Name = "Hammerhead Mummy", Tier = 6, TierName = "Mythic"}, SellPrice = 100000, Probability = {Chance = 4.08E-06}},
    [233] = {Data = {Id = 342, Type = "Fish", Name = "Bloodmoon Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 540000, Probability = {Chance = 2.00E-07}},
    [234] = {Data = {Id = 341, Type = "Fish", Name = "Talon Serpent", Tier = 7, TierName = "SECRET"}, SellPrice = 0, Probability = {Chance = 1.00E-06}},
    [235] = {Data = {Id = 340, Type = "Fish", Name = "Wild Serpent", Tier = 7, TierName = "SECRET"}, SellPrice = 0, Probability = {Chance = 1.00E-06}},
    [236] = {Data = {Id = 335, Type = "Fish", Name = "Witch Koi Fish", Tier = 3, TierName = "Rare"}, SellPrice = 575, Probability = {Chance = 0.002}},
    [237] = {Data = {Id = 337, Type = "Fish", Name = "Wraithfin Abyssal", Tier = 4, TierName = "Epic"}, SellPrice = 1125, Probability = {Chance = 0.001}},
    [238] = {Data = {Id = 339, Type = "Fish", Name = "Skeleton Narwhal", Tier = 7, TierName = "SECRET"}, SellPrice = 135000, Probability = {Chance = 1.67E-06}},
    [239] = {Data = {Id = 378, Type = "Fish", Name = "Wing Parrotfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 85, Probability = {Chance = 0.02}},
    [240] = {Data = {Id = 377, Type = "Fish", Name = "Traffic Cone Fish", Tier = 3, TierName = "Rare"}, SellPrice = 495, Probability = {Chance = 0.0033333333333333335}},
    [241] = {Data = {Id = 376, Type = "Fish", Name = "Toothy Fish", Tier = 3, TierName = "Rare"}, SellPrice = 520, Probability = {Chance = 0.0033333333333333335}},
    [242] = {Data = {Id = 375, Type = "Fish", Name = "Thinkler Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 82, Probability = {Chance = 0.02}},
    [243] = {Data = {Id = 374, Type = "Fish", Name = "Sona Fin Fish", Tier = 1, TierName = "Common"}, SellPrice = 28, Probability = {Chance = 0.5}},
    [244] = {Data = {Id = 373, Type = "Fish", Name = "Sea Crustacean", Tier = 6, TierName = "Mythic"}, SellPrice = 65000, Probability = {Chance = 2.00E-05}},
    [245] = {Data = {Id = 372, Type = "Fish", Name = "Runic Squid", Tier = 6, TierName = "Mythic"}, SellPrice = 114000, Probability = {Chance = 1.11E-05}},
    [246] = {Data = {Id = 371, Type = "Fish", Name = "Runic Sea Crustacean", Tier = 6, TierName = "Mythic"}, SellPrice = 78000, Probability = {Chance = 2.00E-05}},
    [247] = {Data = {Id = 370, Type = "Fish", Name = "Runic Lobster", Tier = 5, TierName = "Legendary"}, SellPrice = 6000, Probability = {Chance = 0.0002}},
    [248] = {Data = {Id = 369, Type = "Fish", Name = "Runic Axolotl", Tier = 5, TierName = "Legendary"}, SellPrice = 9600, Probability = {Chance = 0.0001}},
    [249] = {Data = {Id = 368, Type = "Fish", Name = "Purp Blisfish", Tier = 1, TierName = "Uncommon"}, SellPrice = 73, Probability = {Chance = 0.02}},
    [250] = {Data = {Id = 367, Type = "Fish", Name = "Primordial Octopus", Tier = 6, TierName = "Mythic"}, SellPrice = 105000, Probability = {Chance = 6.67E-06}},
    [251] = {Data = {Id = 366, Type = "Fish", Name = "Primal Lobster", Tier = 5, TierName = "Legendary"}, SellPrice = 5000, Probability = {Chance = 0.0002}},
    [252] = {Data = {Id = 365, Type = "Fish", Name = "Primal Axolotl", Tier = 5, TierName = "Legendary"}, SellPrice = 8000, Probability = {Chance = 0.0001}},
    [253] = {Data = {Id = 364, Type = "Fish", Name = "Pirate Blue Lobster", Tier = 3, TierName = "Rare"}, SellPrice = 500, Probability = {Chance = 0.0033333333333333335}},
    [254] = {Data = {Id = 363, Type = "Fish", Name = "Night Glider Fish", Tier = 1, TierName = "Common"}, SellPrice = 28, Probability = {Chance = 0.5}},
    [255] = {Data = {Id = 362, Type = "Fish", Name = "Lunar Crescent Fish", Tier = 3, TierName = "Rare"}, SellPrice = 490, Probability = {Chance = 0.0033333333333333335}},
    [256] = {Data = {Id = 361, Type = "Fish", Name = "Liar Nose Fish", Tier = 3, TierName = "Rare"}, SellPrice = 490, Probability = {Chance = 0.0033333333333333335}},
    [257] = {Data = {Id = 445, Type = "Fish", Name = "1x1x1x1 Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 150000, Probability = {Chance = 4.00E-07}},
    [258] = {Data = {Id = 359, Type = "Fish", Name = "Gladiator Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 190000, Probability = {Chance = 1.00E-06}},
    [259] = {Data = {Id = 358, Type = "Fish", Name = "Foxtrot Koanfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 87, Probability = {Chance = 0.02}},
    [260] = {Data = {Id = 357, Type = "Fish", Name = "Fossilized Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 94000, Probability = {Chance = 1.00E-05}},
    [261] = {Data = {Id = 356, Type = "Fish", Name = "Flying Manta", Tier = 5, TierName = "Legendary"}, SellPrice = 15000, Probability = {Chance = 6.67E-05}},
    [262] = {Data = {Id = 355, Type = "Fish", Name = "Flatheaded Whale Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 140000, Probability = {Chance = 5.00E-06}},
    [263] = {Data = {Id = 354, Type = "Fish", Name = "Doober Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 93, Probability = {Chance = 0.02}},
    [264] = {Data = {Id = 353, Type = "Fish", Name = "Dogfish", Tier = 4, TierName = "Epic"}, SellPrice = 3333, Probability = {Chance = 0.0005}},
    [265] = {Data = {Id = 352, Type = "Fish", Name = "Cavern Dweller", Tier = 6, TierName = "Mythic"}, SellPrice = 135000, Probability = {Chance = 8.33E-06}},
    [266] = {Data = {Id = 351, Type = "Fish", Name = "Boney Eel", Tier = 3, TierName = "Rare"}, SellPrice = 450, Probability = {Chance = 0.0033333333333333335}},
    [267] = {Data = {Id = 350, Type = "Fish", Name = "Blobby Shieldfish", Tier = 4, TierName = "Epic"}, SellPrice = 1600, Probability = {Chance = 0.001}},
    [268] = {Data = {Id = 349, Type = "Fish", Name = "Baby Shrimp", Tier = 2, TierName = "Uncommon"}, SellPrice = 79, Probability = {Chance = 0.02}},
    [269] = {Data = {Id = 348, Type = "Fish", Name = "Angrylion Fish", Tier = 4, TierName = "Epic"}, SellPrice = 3330, Probability = {Chance = 0.0005}},
    [270] = {Data = {Id = 347, Type = "Fish", Name = "Ancient Squid", Tier = 6, TierName = "Mythic"}, SellPrice = 95000, Probability = {Chance = 1.11E-05}},
    [271] = {Data = {Id = 346, Type = "Fish", Name = "Ancient Pufferfish", Tier = 5, TierName = "Legendary"}, SellPrice = 4500, Probability = {Chance = 0.0002}},
    [272] = {Data = {Id = 284, Type = "Fish", Name = "Freshwater Piranha", Tier = 3, TierName = "Rare"}, SellPrice = 410, Probability = {Chance = 0.0033333333333333335}},
    [273] = {Data = {Id = 380, Type = "Fish", Name = "Plasma Serpent", Tier = 6, TierName = "Mythic"}, SellPrice = 98000, Probability = {Chance = 4.44E-06}},
    [274] = {Data = {Id = 379, Type = "Fish", Name = "Cryoshade Glider", Tier = 7, TierName = "SECRET"}, SellPrice = 120000, Probability = {Chance = 2.22E-06}},
    [275] = {Data = {Id = 381, Type = "Fish", Name = "Starlight Manta Ray", Tier = 6, TierName = "Mythic"}, SellPrice = 33000, Probability = {Chance = 1.25E-05}},
    [276] = {Data = {Id = 383, Type = "Fish", Name = "Starlight Crab", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [277] = {Data = {Id = 385, Type = "Fish", Name = "Parrot Blopfish", Tier = 3, TierName = "Rare"}, SellPrice = 410, Probability = {Chance = 0.0033333333333333335}},
    [278] = {Data = {Id = 391, Type = "Fish", Name = "Green Gillfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [279] = {Data = {Id = 390, Type = "Fish", Name = "Cypress Ratua", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [280] = {Data = {Id = 389, Type = "Fish", Name = "Fish Fossil", Tier = 5, TierName = "Legendary"}, SellPrice = 3580, Probability = {Chance = 0.0002}},
    [281] = {Data = {Id = 388, Type = "Fish", Name = "Glacierfin Snapper", Tier = 2, TierName = "Uncommon"}, SellPrice = 120, Probability = {Chance = 0.01}},
    [282] = {Data = {Id = 387, Type = "Fish", Name = "Curious Garfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 68, Probability = {Chance = 0.02}},
    [283] = {Data = {Id = 386, Type = "Fish", Name = "Iron Domefin", Tier = 4, TierName = "Epic"}, SellPrice = 1150, Probability = {Chance = 0.001}},
    [284] = {Data = {Id = 382, Type = "Fish", Name = "Cute Octopus", Tier = 3, TierName = "Rare"}, SellPrice = 402, Probability = {Chance = 0.0033333333333333335}},
    [285] = {Data = {Id = 384, Type = "Fish", Name = "Freshwater Piranha", Tier = 3, TierName = "Rare"}, SellPrice = 410, Probability = {Chance = 0.0033333333333333335}},
    [286] = {Data = {Id = 392, Type = "Fish", Name = "Coral", Tier = 1, TierName = "Common"}, SellPrice = 25, Probability = {Chance = 0.16666666666666666}},
    [287] = {Data = {Id = 395, Type = "Fish", Name = "Boltback Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 115, Probability = {Chance = 0.01}},
    [288] = {Data = {Id = 393, Type = "Fish", Name = "Sophisticated Angler", Tier = 2, TierName = "Uncommon"}, SellPrice = 84, Probability = {Chance = 0.014285714285714285}},
    [289] = {Data = {Id = 394, Type = "Fish", Name = "Smarty Mcfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 82, Probability = {Chance = 0.014285714285714285}},
    [290] = {Data = {Id = 450, Type = "Fish", Name = "Depthseeker Ray", Tier = 7, TierName = "SECRET"}, SellPrice = 220000, Probability = {Chance = 8.33E-07}},
    [291] = {Data = {Id = 405, Type = "Fish", Name = "Yellow Spinefin", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [292] = {Data = {Id = 427, Type = "Fish", Name = "ElRetro Gran Maja", Tier = 7, TierName = "SECRET"}, SellPrice = 360000, Probability = {Chance = 2.50E-07}},
    [293] = {Data = {Id = 407, Type = "Fish", Name = "Violet Divafish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [294] = {Data = {Id = 408, Type = "Fish", Name = "Turqoi Backfin", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [295] = {Data = {Id = 409, Type = "Fish", Name = "Tree Frog", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [296] = {Data = {Id = 410, Type = "Fish", Name = "Trav Grupper", Tier = 5, TierName = "Legendary"}, SellPrice = 15000, Probability = {Chance = 6.67E-05}},
    [297] = {Data = {Id = 411, Type = "Fish", Name = "Studded Jellyfish", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [298] = {Data = {Id = 412, Type = "Fish", Name = "Studded Dolphin", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [299] = {Data = {Id = 413, Type = "Fish", Name = "Steelfin Marlin", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [300] = {Data = {Id = 414, Type = "Fish", Name = "Starry Night Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 75000, Probability = {Chance = 2.00E-05}},
    [301] = {Data = {Id = 415, Type = "Fish", Name = "Shedletsky Guppy", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [302] = {Data = {Id = 446, Type = "Fish", Name = "Retro Crocodile", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [303] = {Data = {Id = 416, Type = "Fish", Name = "Purple Razorback", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [304] = {Data = {Id = 417, Type = "Fish", Name = "Lumina Stinger", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [305] = {Data = {Id = 418, Type = "Fish", Name = "Leaf Fin", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [306] = {Data = {Id = 419, Type = "Fish", Name = "Lady Luminelle", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [307] = {Data = {Id = 420, Type = "Fish", Name = "Happy Sunfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [308] = {Data = {Id = 421, Type = "Fish", Name = "Gumball Whale", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [309] = {Data = {Id = 422, Type = "Fish", Name = "Guest Guppy", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [310] = {Data = {Id = 423, Type = "Fish", Name = "Grumpy Angler", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [311] = {Data = {Id = 424, Type = "Fish", Name = "Frostbreaker Whale", Tier = 6, TierName = "Mythic"}, SellPrice = 145000, Probability = {Chance = 5.00E-06}},
    [312] = {Data = {Id = 425, Type = "Fish", Name = "Friendly Lobster", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [313] = {Data = {Id = 426, Type = "Fish", Name = "Enchanted Turtle", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [314] = {Data = {Id = 360, Type = "Fish", Name = "King Frog", Tier = 4, TierName = "Epic"}, SellPrice = 4000, Probability = {Chance = 0.0003332222592469177}},
    [315] = {Data = {Id = 428, Type = "Fish", Name = "Disco Party Puffer", Tier = 4, TierName = "Epic"}, SellPrice = 2400, Probability = {Chance = 0.0005}},
    [316] = {Data = {Id = 429, Type = "Fish", Name = "Cousin Tentacles", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [317] = {Data = {Id = 430, Type = "Fish", Name = "Classic Goldfish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [318] = {Data = {Id = 431, Type = "Fish", Name = "Classic Dorhey Tang", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [319] = {Data = {Id = 432, Type = "Fish", Name = "Classic Angler", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [320] = {Data = {Id = 433, Type = "Fish", Name = "Cantelope Puffer", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [321] = {Data = {Id = 434, Type = "Fish", Name = "Builderman Guppy", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [322] = {Data = {Id = 435, Type = "Fish", Name = "Brighteyes Guppy", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [323] = {Data = {Id = 436, Type = "Fish", Name = "Boned Arrowhead Fish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [324] = {Data = {Id = 437, Type = "Fish", Name = "Blue Shell Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [325] = {Data = {Id = 438, Type = "Fish", Name = "Blocky Octopus", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [326] = {Data = {Id = 439, Type = "Fish", Name = "Blockmine Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [327] = {Data = {Id = 440, Type = "Fish", Name = "Block Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [328] = {Data = {Id = 441, Type = "Fish", Name = "Beach Ball", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [329] = {Data = {Id = 442, Type = "Fish", Name = "Angry Rocky", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [330] = {Data = {Id = 443, Type = "Fish", Name = "Ancient Crawler", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [331] = {Data = {Id = 444, Type = "Fish", Name = "Alienhead Squid", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [332] = {Data = {Id = 406, Type = "Fish", Name = "Winged Seahorse", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [333] = {Data = {Id = 451, Type = "Fish", Name = "Void Eel", Tier = 2, TierName = "Uncommon"}, SellPrice = 70, Probability = {Chance = 0.015384615384615385}},
    [334] = {Data = {Id = 449, Type = "Fish", Name = "Tralalero Tralala", Tier = 6, TierName = "Mythic"}, SellPrice = 88888, Probability = {Chance = 1.00E-05}},
    [335] = {Data = {Id = 448, Type = "Fish", Name = "1x1x1x1 Comet Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 444444, Probability = {Chance = 2.22E-07}},
    [336] = {Data = {Id = 469, Type = "Fish", Name = "Swirl Crab Cake", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [337] = {Data = {Id = 460, Type = "Fish", Name = "Balloon Shrimp", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [338] = {Data = {Id = 461, Type = "Fish", Name = "Cake Turtle", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [339] = {Data = {Id = 462, Type = "Fish", Name = "Cherry Spearfish", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [340] = {Data = {Id = 463, Type = "Fish", Name = "King Swirl Pufferfish", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [341] = {Data = {Id = 464, Type = "Fish", Name = "Pinata Crab", Tier = 6, TierName = "Mythic"}, SellPrice = 55000, Probability = {Chance = 1.43E-05}},
    [342] = {Data = {Id = 465, Type = "Fish", Name = "Pinata Squid", Tier = 6, TierName = "Mythic"}, SellPrice = 55000, Probability = {Chance = 1.43E-05}},
    [343] = {Data = {Id = 466, Type = "Fish", Name = "Sprinkle Fish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.1}},
    [344] = {Data = {Id = 467, Type = "Fish", Name = "Sprinkle Wrinkfish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.1}},
    [345] = {Data = {Id = 468, Type = "Fish", Name = "Strawberry Choc Megalodon", Tier = 7, TierName = "SECRET"}, SellPrice = 375000, Probability = {Chance = 2.50E-07}},
    [346] = {Data = {Id = 473, Type = "Fish", Name = "Winter Sweater Redfin", Tier = 2, TierName = "Uncommon"}, SellPrice = 85, Probability = {Chance = 0.0125}},
    [347] = {Data = {Id = 487, Type = "Fish", Name = "Bowtie Blobby", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [348] = {Data = {Id = 527, Type = "Fish", Name = "Chill Santa Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [349] = {Data = {Id = 474, Type = "Fish", Name = "Christmas Light Carp", Tier = 3, TierName = "Rare"}, SellPrice = 320, Probability = {Chance = 0.0033333333333333335}},
    [350] = {Data = {Id = 529, Type = "Fish", Name = "Christmas Wreath Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [351] = {Data = {Id = 511, Type = "Fish", Name = "Christmas Penguin", Tier = 5, TierName = "Legendary"}, SellPrice = 19000, Probability = {Chance = 3.33E-05}},
    [352] = {Data = {Id = 500, Type = "Fish", Name = "Classy Snowfish", Tier = 4, TierName = "Epic"}, SellPrice = 1200, Probability = {Chance = 0.001}},
    [353] = {Data = {Id = 515, Type = "Fish", Name = "Cozy Carp", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [354] = {Data = {Id = 492, Type = "Fish", Name = "Cozy Narwhal Plushie", Tier = 4, TierName = "Epic"}, SellPrice = 1700, Probability = {Chance = 0.0006666666666666666}},
    [355] = {Data = {Id = 526, Type = "Fish", Name = "Reindeer Shark", Tier = 5, TierName = "Legendary"}, SellPrice = 14500, Probability = {Chance = 4.00E-05}},
    [356] = {Data = {Id = 518, Type = "Fish", Name = "Emerald Winter Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 175000, Probability = {Chance = 6.67E-07}},
    [357] = {Data = {Id = 498, Type = "Fish", Name = "Festive Dolphin", Tier = 6, TierName = "Mythic"}, SellPrice = 24000, Probability = {Chance = 2.00E-05}},
    [358] = {Data = {Id = 480, Type = "Fish", Name = "Festive Salmon", Tier = 2, TierName = "Uncommon"}, SellPrice = 63, Probability = {Chance = 0.016666666666666666}},
    [359] = {Data = {Id = 497, Type = "Fish", Name = "Finny Present", Tier = 3, TierName = "Rare"}, SellPrice = 340, Probability = {Chance = 0.0033333333333333335}},
    [360] = {Data = {Id = 505, Type = "Fish", Name = "Frostglow Globe Jelly", Tier = 6, TierName = "Mythic"}, SellPrice = 26500, Probability = {Chance = 1.54E-05}},
    [361] = {Data = {Id = 502, Type = "Fish", Name = "Frostshell Turtle", Tier = 6, TierName = "Mythic"}, SellPrice = 31100, Probability = {Chance = 1.11E-05}},
    [362] = {Data = {Id = 508, Type = "Fish", Name = "Frozen Tundra", Tier = 5, TierName = "Legendary"}, SellPrice = 3800, Probability = {Chance = 0.0002}},
    [363] = {Data = {Id = 503, Type = "Fish", Name = "Giftback Turtle", Tier = 5, TierName = "Legendary"}, SellPrice = 18000, Probability = {Chance = 3.33E-05}},
    [364] = {Data = {Id = 482, Type = "Fish", Name = "Gingerbread Crab", Tier = 4, TierName = "Epic"}, SellPrice = 1300, Probability = {Chance = 0.001}},
    [365] = {Data = {Id = 481, Type = "Fish", Name = "Gingerbread Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 105, Probability = {Chance = 0.01}},
    [366] = {Data = {Id = 491, Type = "Fish", Name = "Gingerbread Fish Plushie", Tier = 3, TierName = "Rare"}, SellPrice = 530, Probability = {Chance = 0.002}},
    [367] = {Data = {Id = 483, Type = "Fish", Name = "Gingerbread Ray", Tier = 4, TierName = "Epic"}, SellPrice = 2400, Probability = {Chance = 0.0005}},
    [368] = {Data = {Id = 485, Type = "Fish", Name = "Gingerbread Starfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 210, Probability = {Chance = 0.005}},
    [369] = {Data = {Id = 506, Type = "Fish", Name = "Tree Horse", Tier = 5, TierName = "Legendary"}, SellPrice = 8000, Probability = {Chance = 0.0001}},
    [370] = {Data = {Id = 494, Type = "Fish", Name = "Holiday Angler Plushie", Tier = 4, TierName = "Epic"}, SellPrice = 2200, Probability = {Chance = 0.0005}},
    [371] = {Data = {Id = 495, Type = "Fish", Name = "Holiday Guppy Plushie", Tier = 2, TierName = "Uncommon"}, SellPrice = 110, Probability = {Chance = 0.01}},
    [372] = {Data = {Id = 493, Type = "Fish", Name = "Holiday Turtle Plushie", Tier = 3, TierName = "Rare"}, SellPrice = 550, Probability = {Chance = 0.002}},
    [373] = {Data = {Id = 472, Type = "Fish", Name = "Icecap Runner", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [374] = {Data = {Id = 470, Type = "Fish", Name = "Icefang Angler", Tier = 3, TierName = "Rare"}, SellPrice = 320, Probability = {Chance = 0.0033333333333333335}},
    [375] = {Data = {Id = 489, Type = "Fish", Name = "Icey Pufferfish", Tier = 1, TierName = "Rare"}, SellPrice = 310, Probability = {Chance = 0.0033333333333333335}},
    [376] = {Data = {Id = 531, Type = "Fish", Name = "Jingle Bells Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 64, Probability = {Chance = 0.016666666666666666}},
    [377] = {Data = {Id = 471, Type = "Fish", Name = "Jinglefin", Tier = 3, TierName = "Rare"}, SellPrice = 310, Probability = {Chance = 0.0033333333333333335}},
    [378] = {Data = {Id = 507, Type = "Fish", Name = "Jolly Crab", Tier = 3, TierName = "Rare"}, SellPrice = 310, Probability = {Chance = 0.0033333333333333335}},
    [379] = {Data = {Id = 490, Type = "Fish", Name = "Mistle Toe Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 88, Probability = {Chance = 0.0125}},
    [380] = {Data = {Id = 484, Type = "Fish", Name = "Mistle Toe Seahorse", Tier = 2, TierName = "Rare"}, SellPrice = 250, Probability = {Chance = 0.004}},
    [381] = {Data = {Id = 479, Type = "Fish", Name = "Northfin Helper", Tier = 2, TierName = "Uncommon"}, SellPrice = 110, Probability = {Chance = 0.01}},
    [382] = {Data = {Id = 504, Type = "Fish", Name = "Nutcracker Ray", Tier = 6, TierName = "Mythic"}, SellPrice = 75000, Probability = {Chance = 8.00E-06}},
    [383] = {Data = {Id = 488, Type = "Fish", Name = "Ornament Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [384] = {Data = {Id = 514, Type = "Fish", Name = "Peppermint Fish", Tier = 3, TierName = "Rare"}, SellPrice = 320, Probability = {Chance = 0.0033333333333333335}},
    [385] = {Data = {Id = 486, Type = "Fish", Name = "Peppermint Spike", Tier = 4, TierName = "Epic"}, SellPrice = 1000, Probability = {Chance = 0.001}},
    [386] = {Data = {Id = 516, Type = "Fish", Name = "Reindeer Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [387] = {Data = {Id = 530, Type = "Fish", Name = "Snowflake Puffer Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 210, Probability = {Chance = 0.005}},
    [388] = {Data = {Id = 476, Type = "Fish", Name = "Santa Guppy", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.125}},
    [389] = {Data = {Id = 477, Type = "Fish", Name = "Reindeer Guppy", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.125}},
    [390] = {Data = {Id = 496, Type = "Fish", Name = "Goofy Santa Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.1}},
    [391] = {Data = {Id = 478, Type = "Fish", Name = "Elf Guppy", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.1}},
    [392] = {Data = {Id = 519, Type = "Fish", Name = "Krampus Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 145000, Probability = {Chance = 1.00E-06}}
}

-- ============================================================================
-- CONFIGURATION
-- ============================================================================
local Config = {
    AutoFish = false,
    AutoSell = false,
    FishingMode = "Blatant", -- "Blatant" or "Legit"
    CatchCount = 10, -- Fish per cast (1-50)
    FishingSpeed = 0.01, -- Delay between actions
    SellInterval = 60, -- Auto sell interval (seconds)
    
    RarityFilter = {
        Common = true,
        Uncommon = true,
        Rare = true,
        Epic = true,
        Legendary = true,
        Mythic = true,
        SECRET = true
    }
}

-- Stats tracking
local Stats = {
    TotalCaught = 0,
    TotalValue = 0,
    LastCatch = "None",
    SessionTime = 0,
    SessionStart = tick(),
    RarityCounts = {
        Common = 0,
        Uncommon = 0,
        Rare = 0,
        Epic = 0,
        Legendary = 0,
        Mythic = 0,
        SECRET = 0
    }
}

-- Theme Colors (Discord-inspired)
local Theme = {
    Background = Color3.fromRGB(54, 57, 63),
    Secondary = Color3.fromRGB(47, 49, 54),
    Accent = Color3.fromRGB(88, 101, 242),
    Success = Color3.fromRGB(67, 181, 129),
    Warning = Color3.fromRGB(250, 166, 26),
    Danger = Color3.fromRGB(237, 66, 69),
    Text = Color3.fromRGB(255, 255, 255),
    TextMuted = Color3.fromRGB(185, 187, 190)
}

-- ============================================================================
-- NETWORK HANDLER (STABILITY LAYER)
-- ============================================================================
local NetworkHandler = {}
NetworkHandler.__index = NetworkHandler

function NetworkHandler.new()
    local self = setmetatable({}, NetworkHandler)
    self.RequestQueue = {}
    self.Processing = false
    return self
end

function NetworkHandler:InvokeRemote(remote, ...)
    local args = {...}
    local attempts = 0
    local maxAttempts = 3
    
    while attempts < maxAttempts do
        local success, result = pcall(function()
            return remote:InvokeServer(unpack(args))
        end)
        
        if success then
            return result
        end
        
        attempts = attempts + 1
        if attempts < maxAttempts then
            task.wait(0.5)
        end
    end
    
    return nil
end

function NetworkHandler:FireRemote(remote, ...)
    local args = {...}
    pcall(function()
        remote:FireServer(unpack(args))
    end)
    task.wait(Config.FishingSpeed)
end

local Network = NetworkHandler.new()

-- ============================================================================
-- GAME DETECTION
-- ============================================================================
local Remotes = {}

local function DetectRemotes()
    local paths = {
        "ReplicatedStorage.Events",
        "ReplicatedStorage.Remotes",
        "ReplicatedStorage.Fishing",
        "ReplicatedStorage"
    }
    
    for _, path in ipairs(paths) do
        local container = game
        for part in string.gmatch(path, "[^.]+") do
            container = container:FindFirstChild(part)
            if not container then break end
        end
        
        if container then
            Remotes.CastRod = container:FindFirstChild("CastRod") or container:FindFirstChild("Cast")
            Remotes.ReelRod = container:FindFirstChild("ReelRod") or container:FindFirstChild("Reel")
            Remotes.Shake = container:FindFirstChild("Shake") or container:FindFirstChild("Minigame")
            Remotes.SellFish = container:FindFirstChild("SellFish") or container:FindFirstChild("Sell")
            
            if Remotes.CastRod and Remotes.ReelRod then
                return true
            end
        end
    end
    
    return false
end

-- ============================================================================
-- FISHING CONTROLLER
-- ============================================================================
local FishingController = {}

function FishingController:GetRod()
    local rod = Player.Character and Player.Character:FindFirstChild("Rod")
    if not rod then
        rod = Player.Backpack and Player.Backpack:FindFirstChild("Rod")
    end
    return rod
end

function FishingController:EquipRod()
    local rod = self:GetRod()
    if rod and rod.Parent == Player.Backpack then
        rod.Parent = Player.Character
        task.wait(0.3)
    end
    return rod and rod.Parent == Player.Character
end

function FishingController:CastRod()
    if not self:EquipRod() then return false end
    
    if Config.FishingMode == "Blatant" then
        -- Direct multi-catch
        for i = 1, Config.CatchCount do
            if Remotes.CastRod then
                Network:FireRemote(Remotes.CastRod)
            end
        end
        task.wait(0.5)
        return true
    else
        -- Legit mode
        if Remotes.CastRod then
            Network:FireRemote(Remotes.CastRod)
            task.wait(math.random(20, 40) / 10)
            return true
        end
    end
    
    return false
end

function FishingController:ReelFish()
    if Config.FishingMode == "Blatant" then
        for i = 1, Config.CatchCount do
            if Remotes.ReelRod then
                Network:FireRemote(Remotes.ReelRod)
            end
            if Remotes.Shake then
                Network:FireRemote(Remotes.Shake)
            end
        end
        
        -- Update stats
        Stats.TotalCaught = Stats.TotalCaught + Config.CatchCount
        Stats.TotalValue = Stats.TotalValue + (50 * Config.CatchCount) -- Estimate
        
        return true
    else
        -- Legit reel
        if Remotes.ReelRod then
            Network:FireRemote(Remotes.ReelRod)
        end
        if Remotes.Shake then
            for i = 1, math.random(3, 5) do
                Network:FireRemote(Remotes.Shake)
                task.wait(0.1)
            end
        end
        
        Stats.TotalCaught = Stats.TotalCaught + 1
        return true
    end
end

function FishingController:SellFish()
    if Remotes.SellFish then
        Network:FireRemote(Remotes.SellFish)
        return true
    end
    return false
end

-- ============================================================================
-- UI CREATION
-- ============================================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FishingSystemUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 600)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Round corners
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

-- Drop shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(100, 100, 100, 100)
Shadow.ZIndex = -1
Shadow.Parent = MainFrame

-- Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Theme.Secondary
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

-- Fix header bottom corners
local HeaderFix = Instance.new("Frame")
HeaderFix.Size = UDim2.new(1, 0, 0, 12)
HeaderFix.Position = UDim2.new(0, 0, 1, -12)
HeaderFix.BackgroundColor3 = Theme.Secondary
HeaderFix.BorderSizePixel = 0
HeaderFix.Parent = Header

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🎣 FISHING SYSTEM | 392 FISH"
Title.TextColor3 = Theme.Text
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Theme.Danger
CloseButton.BorderSizePixel = 0
CloseButton.Text = "✕"
CloseButton.TextColor3 = Theme.Text
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Content Container
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -70)
ContentFrame.Position = UDim2.new(0, 10, 0, 60)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Theme.Accent
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
ContentFrame.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Parent = ContentFrame

-- Auto-resize canvas
ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 20)
end)

-- ============================================================================
-- UI COMPONENTS
-- ============================================================================

local function CreateSection(name, order)
    local Section = Instance.new("Frame")
    Section.Name = name
    Section.Size = UDim2.new(1, 0, 0, 0)
    Section.BackgroundColor3 = Theme.Secondary
    Section.BorderSizePixel = 0
    Section.LayoutOrder = order
    Section.AutomaticSize = Enum.AutomaticSize.Y
    Section.Parent = ContentFrame
    
    local SectionCorner = Instance.new("UICorner")
    SectionCorner.CornerRadius = UDim.new(0, 8)
    SectionCorner.Parent = Section
    
    local SectionLayout = Instance.new("UIListLayout")
    SectionLayout.Padding = UDim.new(0, 8)
    SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionLayout.Parent = Section
    
    local Padding = Instance.new("UIPadding")
    Padding.PaddingTop = UDim.new(0, 12)
    Padding.PaddingBottom = UDim.new(0, 12)
    Padding.PaddingLeft = UDim.new(0, 12)
    Padding.PaddingRight = UDim.new(0, 12)
    Padding.Parent = Section
    
    local SectionTitle = Instance.new("TextLabel")
    SectionTitle.Size = UDim2.new(1, 0, 0, 25)
    SectionTitle.BackgroundTransparency = 1
    SectionTitle.Text = name
    SectionTitle.TextColor3 = Theme.Text
    SectionTitle.Font = Enum.Font.GothamBold
    SectionTitle.TextSize = 14
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    SectionTitle.Parent = Section
    
    return Section
end

local function CreateToggle(parent, text, default, callback)
    local Toggle = Instance.new("Frame")
    Toggle.Size = UDim2.new(1, 0, 0, 35)
    Toggle.BackgroundTransparency = 1
    Toggle.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Theme.TextMuted
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Toggle
    
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 50, 0, 25)
    Button.Position = UDim2.new(1, -50, 0.5, -12.5)
    Button.BackgroundColor3 = default and Theme.Success or Theme.Secondary
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.Parent = Toggle
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    ButtonCorner.Parent = Button
    
    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 19, 0, 19)
    Indicator.Position = default and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
    Indicator.BackgroundColor3 = Theme.Text
    Indicator.BorderSizePixel = 0
    Indicator.Parent = Button
    
    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator
    
    local state = default
    
    Button.MouseButton1Click:Connect(function()
        state = not state
        
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Theme.Success or Theme.Secondary
        }):Play()
        
        TweenService:Create(Indicator, TweenInfo.new(0.2), {
            Position = state and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
        }):Play()
        
        callback(state)
    end)
    
    return Toggle
end

local function CreateSlider(parent, text, min, max, default, callback)
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(1, 0, 0, 50)
    Slider.BackgroundTransparency = 1
    Slider.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Theme.TextMuted
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Slider
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 60, 0, 20)
    ValueLabel.Position = UDim2.new(1, -60, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = Theme.Accent
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 13
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Slider
    
    local Track = Instance.new("Frame")
    Track.Size = UDim2.new(1, 0, 0, 4)
    Track.Position = UDim2.new(0, 0, 1, -15)
    Track.BackgroundColor3 = Theme.Background
    Track.BorderSizePixel = 0
    Track.Parent = Slider
    
    local TrackCorner = Instance.new("UICorner")
    TrackCorner.CornerRadius = UDim.new(1, 0)
    TrackCorner.Parent = Track
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Theme.Accent
    Fill.BorderSizePixel = 0
    Fill.Parent = Track
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = Fill
    
    local Handle = Instance.new("Frame")
    Handle.Size = UDim2.new(0, 12, 0, 12)
    Handle.Position = UDim2.new((default - min) / (max - min), -6, 0.5, -6)
    Handle.BackgroundColor3 = Theme.Text
    Handle.BorderSizePixel = 0
    Handle.Parent = Track
    
    local HandleCorner = Instance.new("UICorner")
    HandleCorner.CornerRadius = UDim.new(1, 0)
    HandleCorner.Parent = Handle
    
    local dragging = false
    local value = default
    
    local function UpdateSlider(input)
        local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * pos)
        
        ValueLabel.Text = tostring(value)
        Fill.Size = UDim2.new(pos, 0, 1, 0)
        Handle.Position = UDim2.new(pos, -6, 0.5, -6)
        
        callback(value)
    end
    
    Handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    Handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            UpdateSlider(input)
        end
    end)
    
    Track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            UpdateSlider(input)
        end
    end)
    
    return Slider
end

local function CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = Theme.Accent
    Button.BorderSizePixel = 0
    Button.Text = text
    Button.TextColor3 = Theme.Text
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 14
    Button.Parent = parent
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = Button
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(
                math.min(255, Theme.Accent.R * 255 + 20),
                math.min(255, Theme.Accent.G * 255 + 20),
                math.min(255, Theme.Accent.B * 255 + 20)
            )
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Theme.Accent
        }):Play()
    end)
    
    Button.MouseButton1Click:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {
            Size = UDim2.new(0.98, 0, 0, 38)
        }):Play()
        task.wait(0.1)
        TweenService:Create(Button, TweenInfo.new(0.1), {
            Size = UDim2.new(1, 0, 0, 40)
        }):Play()
        
        callback()
    end)
    
    return Button
end

-- ============================================================================
-- BUILD UI SECTIONS
-- ============================================================================

-- Stats Section
local StatsSection = CreateSection("📊 STATISTICS", 1)

local StatsGrid = Instance.new("Frame")
StatsGrid.Size = UDim2.new(1, 0, 0, 100)
StatsGrid.BackgroundTransparency = 1
StatsGrid.Parent = StatsSection

local StatsLayout = Instance.new("UIGridLayout")
StatsLayout.CellSize = UDim2.new(0.48, 0, 0, 45)
StatsLayout.CellPadding = UDim2.new(0.04, 0, 0, 10)
StatsLayout.Parent = StatsGrid

local function CreateStatCard(name, value)
    local Card = Instance.new("Frame")
    Card.BackgroundColor3 = Theme.Background
    Card.BorderSizePixel = 0
    Card.Parent = StatsGrid
    
    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 6)
    CardCorner.Parent = Card
    
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -10, 0, 18)
    NameLabel.Position = UDim2.new(0, 5, 0, 5)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = name
    NameLabel.TextColor3 = Theme.TextMuted
    NameLabel.Font = Enum.Font.Gotham
    NameLabel.TextSize = 11
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = Card
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(1, -10, 0, 22)
    ValueLabel.Position = UDim2.new(0, 5, 1, -27)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = value
    ValueLabel.TextColor3 = Theme.Text
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 16
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Left
    ValueLabel.Parent = Card
    
    return ValueLabel
end

local TotalCaughtLabel = CreateStatCard("Total Caught", "0")
local TotalValueLabel = CreateStatCard("Total Value", "$0")
local LastCatchLabel = CreateStatCard("Last Catch", "None")
local SessionTimeLabel = CreateStatCard("Session Time", "0:00")

-- Auto Fishing Section
local FishingSection = CreateSection("🎣 AUTO FISHING", 2)

CreateToggle(FishingSection, "Enable Auto Fish", false, function(state)
    Config.AutoFish = state
end)

local ModeToggle = CreateToggle(FishingSection, "Blatant Mode (Multi-Catch)", true, function(state)
    Config.FishingMode = state and "Blatant" or "Legit"
end)

CreateSlider(FishingSection, "Fishing Speed", 1, 100, 10, function(value)
    Config.FishingSpeed = value / 1000
end)

CreateSlider(FishingSection, "Catch Count (per cast)", 1, 50, 10, function(value)
    Config.CatchCount = value
end)

-- Auto Sell Section
local SellSection = CreateSection("💰 AUTO SELL", 3)

CreateToggle(SellSection, "Enable Auto Sell", false, function(state)
    Config.AutoSell = state
end)

CreateSlider(SellSection, "Sell Interval (seconds)", 10, 300, 60, function(value)
    Config.SellInterval = value
end)

-- Rarity Filter Section
local RaritySection = CreateSection("🌟 RARITY FILTER", 4)

for _, rarity in ipairs({"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "SECRET"}) do
    CreateToggle(RaritySection, rarity, true, function(state)
        Config.RarityFilter[rarity] = state
    end)
end

-- Actions Section
local ActionsSection = CreateSection("⚡ ACTIONS", 5)

CreateButton(ActionsSection, "🎯 Start Fishing", function()
    Config.AutoFish = true
    print("[FISHING] Started!")
end)

CreateButton(ActionsSection, "⏸️ Stop Fishing", function()
    Config.AutoFish = false
    print("[FISHING] Stopped!")
end)

CreateButton(ActionsSection, "💰 Sell Now", function()
    FishingController:SellFish()
    print("[FISHING] Sold fish!")
end)

CreateButton(ActionsSection, "🔄 Reset Stats", function()
    Stats.TotalCaught = 0
    Stats.TotalValue = 0
    Stats.LastCatch = "None"
    Stats.SessionStart = tick()
    for k in pairs(Stats.RarityCounts) do
        Stats.RarityCounts[k] = 0
    end
    print("[FISHING] Stats reset!")
end)

-- ============================================================================
-- MAIN LOOPS
-- ============================================================================

-- Stats Update Loop
task.spawn(function()
    while task.wait(1) do
        Stats.SessionTime = tick() - Stats.SessionStart
        
        TotalCaughtLabel.Text = tostring(Stats.TotalCaught)
        TotalValueLabel.Text = "$" .. tostring(math.floor(Stats.TotalValue))
        LastCatchLabel.Text = Stats.LastCatch
        
        local minutes = math.floor(Stats.SessionTime / 60)
        local seconds = math.floor(Stats.SessionTime % 60)
        SessionTimeLabel.Text = string.format("%d:%02d", minutes, seconds)
    end
end)

-- Fishing Loop
task.spawn(function()
    while task.wait(0.1) do
        if Config.AutoFish then
            if FishingController:CastRod() then
                task.wait(Config.FishingMode == "Blatant" and 0.5 or 3)
                FishingController:ReelFish()
            end
        end
    end
end)

-- Auto Sell Loop
task.spawn(function()
    while task.wait(Config.SellInterval) do
        if Config.AutoSell then
            FishingController:SellFish()
        end
    end
end)

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Make UI draggable
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        TweenService:Create(MainFrame, TweenInfo.new(0.1), {
            Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        }):Play()
    end
end)

-- Entrance animation
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 500, 0, 600),
    Position = UDim2.new(0.5, -250, 0.5, -300)
}):Play()

-- Detect game remotes
if DetectRemotes() then
    print("[FISHING] ✅ Game remotes detected!")
    print("[FISHING] 🎣 System ready with 392 fish!")
else
    warn("[FISHING] ⚠️ Could not detect game remotes!")
end

-- Parent to PlayerGui
ScreenGui.Parent = PlayerGui

print([[
═══════════════════════════════════════════════════
    🎣 FISHING AUTOMATION SYSTEM LOADED
    📊 Total Fish: 392
    ⚡ Features: Auto Fish, Auto Sell, Rarity Filter
    🎯 Modes: Blatant (Multi-Catch) & Legit
    🌐 Network Optimized for Poor Connections
    ✅ Executor Compatible: Delta, Ronix, Solara
═══════════════════════════════════════════════════
]])

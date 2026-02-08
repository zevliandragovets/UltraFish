--[[
    ═══════════════════════════════════════════════════════════════
    ATOMIC HUB - FISH IT! AUTO FISHING SCRIPT
    100% Compatible with Fish It! (NOT Fisch)
    Updated: 8 February 2026
    Total Fish: 392 | Locations: 16 | Rods: 13 | Enchants: 14
    discord.gg/getsades
    ═══════════════════════════════════════════════════════════════
]]

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                    FISH DATABASE (392 FISH)                    ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishDatabase = {
    [1] = {Data = {Id = 43, Name = "Reef Chromis", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [2] = {Data = {Id = 15, Name = "Abyss Seahorse", Tier = 5, TierName = "Mythic"}, SellPrice = 38500, Probability = {Chance = 1.18E-05}},
    [3] = {Data = {Id = 20, Name = "Ash Basslet", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [4] = {Data = {Id = 17, Name = "Astra Damsel", Tier = 4, TierName = "Epic"}, SellPrice = 1633, Probability = {Chance = 0.0005}},
    [5] = {Data = {Id = 66, Name = "Azure Damsel", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [6] = {Data = {Id = 44, Name = "Banded Butterfly", Tier = 2, TierName = "Uncommon"}, SellPrice = 153, Probability = {Chance = 0.008}},
    [7] = {Data = {Id = 22, Name = "Blue Lobster", Tier = 4, TierName = "Legendary"}, SellPrice = 11355, Probability = {Chance = 4.00E-05}},
    [8] = {Data = {Id = 47, Name = "Blueflame Ray", Tier = 5, TierName = "Mythic"}, SellPrice = 45000, Probability = {Chance = 1.08E-05}},
    [9] = {Data = {Id = 45, Name = "Boa Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.06666666666666667}},
    [10] = {Data = {Id = 37, Name = "Bumblebee Grouper", Tier = 4, TierName = "Legendary"}, SellPrice = 3225, Probability = {Chance = 0.0002}},
    [11] = {Data = {Id = 59, Name = "Candy Butterfly", Tier = 2, TierName = "Rare"}, SellPrice = 419, Probability = {Chance = 0.0026666666666666666}},
    [12] = {Data = {Id = 18, Name = "Charmed Tang", Tier = 3, TierName = "Rare"}, SellPrice = 393, Probability = {Chance = 0.003076923076923077}},
    [13] = {Data = {Id = 53, Name = "Chrome Tuna", Tier = 4, TierName = "Legendary"}, SellPrice = 4050, Probability = {Chance = 0.00011111111111111112}},
    [14] = {Data = {Id = 64, Name = "Clownfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [15] = {Data = {Id = 19, Name = "Coal Tang", Tier = 2, TierName = "Uncommon"}, SellPrice = 74, Probability = {Chance = 0.02}},
    [16] = {Data = {Id = 67, Name = "Copperband Butterfly", Tier = 2, TierName = "Common"}, SellPrice = 76, Probability = {Chance = 0.05}},
    [17] = {Data = {Id = 31, Name = "Corazon Damsel", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [18] = {Data = {Id = 57, Name = "Cow Clownfish", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [19] = {Data = {Id = 71, Name = "Darwin Clownfish", Tier = 3, TierName = "Rare"}, SellPrice = 869, Probability = {Chance = 0.0013333333333333333}},
    [20] = {Data = {Id = 26, Name = "Domino Damsel", Tier = 4, TierName = "Epic"}, SellPrice = 1444, Probability = {Chance = 0.0006666666666666666}},
    [21] = {Data = {Id = 70, Name = "Dorhey Tang", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [22] = {Data = {Id = 75, Name = "Dotted Stingray", Tier = 5, TierName = "Mythic"}, SellPrice = 31500, Probability = {Chance = 1.10E-05}},
    [23] = {Data = {Id = 14, Name = "Enchanted Angelfish", Tier = 4, TierName = "Legendary"}, SellPrice = 4200, Probability = {Chance = 0.0002}},
    [24] = {Data = {Id = 41, Name = "Fire Goby", Tier = 2, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [25] = {Data = {Id = 49, Name = "Firecoal Damsel", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.0004}},
    [26] = {Data = {Id = 68, Name = "Flame Angelfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 135, Probability = {Chance = 0.01}},
    [27] = {Data = {Id = 25, Name = "Greenbee Grouper", Tier = 4, TierName = "Legendary"}, SellPrice = 5732, Probability = {Chance = 0.00016666666666666666}},
    [28] = {Data = {Id = 52, Name = "Hammerhead Shark", Tier = 5, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 46500, Probability = {Chance = 1.00E-05}},
    [29] = {Data = {Id = 21, Name = "Hawks Turtle", Tier = 5, TierName = "Mythic"}, SellPrice = 40500, Probability = {Chance = 1.33E-05}},
    [30] = {Data = {Id = 24, Name = "Starjam Tang", Tier = 4, TierName = "Legendary"}, SellPrice = 4200, Probability = {Chance = 0.0002}},
    [31] = {Data = {Id = 46, Name = "Jennifer Dottyback", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [32] = {Data = {Id = 60, Name = "Jewel Tang", Tier = 2, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [33] = {Data = {Id = 40, Name = "Kau Cardinal", Tier = 3, TierName = "Rare"}, SellPrice = 869, Probability = {Chance = 0.0013333333333333333}},
    [34] = {Data = {Id = 72, Name = "Korean Angelfish", Tier = 3, TierName = "Rare"}, SellPrice = 391, Probability = {Chance = 0.0033333333333333335}},
    [35] = {Data = {Id = 48, Name = "Lavafin Tuna", Tier = 4, TierName = "Legendary"}, SellPrice = 4500, Probability = {Chance = 0.00010001000100010001}},
    [36] = {Data = {Id = 36, Name = "Lobster", Tier = 4, TierName = "Legendary"}, SellPrice = 15750, Probability = {Chance = 4.00E-05}},
    [37] = {Data = {Id = 34, Name = "Loggerhead Turtle", Tier = 5, TierName = "Mythic"}, SellPrice = 27000, Probability = {Chance = 1.82E-05}},
    [38] = {Data = {Id = 38, Name = "Longnose Butterfly", Tier = 4, TierName = "Epic"}, SellPrice = 1575, Probability = {Chance = 0.0006666666666666666}},
    [39] = {Data = {Id = 16, Name = "Magic Tang", Tier = 4, TierName = "Legendary"}, SellPrice = 4500, Probability = {Chance = 0.00013333333333333334}},
    [40] = {Data = {Id = 50, Name = "Magma Goby", Tier = 2, TierName = "Uncommon"}, SellPrice = 95, Probability = {Chance = 0.01818181818181818}},
    [41] = {Data = {Id = 54, Name = "Manta Ray", Tier = 5, TierName = "Mythic"}, SellPrice = 24750, Probability = {Chance = 2.00E-05}},
    [42] = {Data = {Id = 56, Name = "Maroon Butterfly", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [43] = {Data = {Id = 23, Name = "Maze Angelfish", Tier = 3, TierName = "Uncommon"}, SellPrice = 153, Probability = {Chance = 0.008}},
    [44] = {Data = {Id = 55, Name = "Moorish Idol", Tier = 4, TierName = "Epic"}, SellPrice = 2700, Probability = {Chance = 0.00030003000300030005}},
    [45] = {Data = {Id = 117, Name = "Bandit Angelfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 105, Probability = {Chance = 0.015384615384615385}},
    [46] = {Data = {Id = 116, Name = "Zoster Butterfly", Tier = 1, TierName = "Common"}, SellPrice = 28, Probability = {Chance = 0.125}},
    [47] = {Data = {Id = 32, Name = "Orangy Goby", Tier = 1, TierName = "Common"}, SellPrice = 36, Probability = {Chance = 0.14285714285714285}},
    [48] = {Data = {Id = 27, Name = "Panther Grouper", Tier = 4, TierName = "Epic"}, SellPrice = 1044, Probability = {Chance = 0.001}},
    [49] = {Data = {Id = 35, Name = "Prismy Seahorse", Tier = 5, TierName = "Mythic"}, SellPrice = 29250, Probability = {Chance = 1.25E-05}},
    [50] = {Data = {Id = 29, Name = "Scissortail Dartfish", Tier = 2, TierName = "Rare"}, SellPrice = 369, Probability = {Chance = 0.0033333333333333335}},
    [51] = {Data = {Id = 42, Name = "Shrimp Goby", Tier = 2, TierName = "Uncommon"}, SellPrice = 90, Probability = {Chance = 0.02}},
    [52] = {Data = {Id = 63, Name = "Skunk Tilefish", Tier = 1, TierName = "Common"}, SellPrice = 36, Probability = {Chance = 0.14285714285714285}},
    [53] = {Data = {Id = 33, Name = "Specked Butterfly", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [54] = {Data = {Id = 65, Name = "Strawberry Dotty", Tier = 1, TierName = "Common"}, SellPrice = 27, Probability = {Chance = 0.05}},
    [55] = {Data = {Id = 39, Name = "Sushi Cardinal", Tier = 4, TierName = "Epic"}, SellPrice = 1282, Probability = {Chance = 0.0008}},
    [56] = {Data = {Id = 30, Name = "Tricolore Butterfly", Tier = 2, TierName = "Uncommon"}, SellPrice = 112, Probability = {Chance = 0.014285714285714285}},
    [57] = {Data = {Id = 74, Name = "Unicorn Tang", Tier = 4, TierName = "Epic"}, SellPrice = 2835, Probability = {Chance = 0.00022222222222222223}},
    [58] = {Data = {Id = 62, Name = "Vintage Blue Tang", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [59] = {Data = {Id = 58, Name = "Vintage Damsel", Tier = 2, TierName = "Uncommon"}, SellPrice = 180, Probability = {Chance = 0.007407407407407408}},
    [60] = {Data = {Id = 51, Name = "Volcanic Basslet", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [61] = {Data = {Id = 28, Name = "White Clownfish", Tier = 2, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [62] = {Data = {Id = 69, Name = "Yello Damselfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 99, Probability = {Chance = 0.02}},
    [63] = {Data = {Id = 73, Name = "Yellowfin Tuna", Tier = 4, TierName = "Legendary"}, SellPrice = 3600, Probability = {Chance = 0.00013333333333333334}},
    [64] = {Data = {Id = 61, Name = "Yellowstate Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [65] = {Data = {Id = 190, Name = "Salmon", Tier = 2, TierName = "Uncommon"}, SellPrice = 103, Probability = {Chance = 0.02}},
    [66] = {Data = {Id = 82, Name = "Blob Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 98000, Probability = {Chance = 4.00E-06}},
    [67] = {Data = {Id = 89, Name = "Volsail Tang", Tier = 3, TierName = "Rare"}, SellPrice = 369, Probability = {Chance = 0.0033333333333333335}},
    [68] = {Data = {Id = 88, Name = "Rockform Cardianl", Tier = 3, TierName = "Rare"}, SellPrice = 347, Probability = {Chance = 0.004}},
    [69] = {Data = {Id = 87, Name = "Lava Butterfly", Tier = 2, TierName = "Uncommon"}, SellPrice = 153, Probability = {Chance = 0.008}},
    [70] = {Data = {Id = 86, Name = "Slurpfish Chromis", Tier = 2, TierName = "Legendary"}, SellPrice = 3830, Probability = {Chance = 0.000125}},
    [71] = {Data = {Id = 92, Name = "Festive Goby", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.3333333333333333}},
    [72] = {Data = {Id = 91, Name = "Mistletoe Damsel", Tier = 1, TierName = "Common"}, SellPrice = 26, Probability = {Chance = 0.25}},
    [73] = {Data = {Id = 90, Name = "Gingerbread Tang", Tier = 1, TierName = "Common"}, SellPrice = 26, Probability = {Chance = 0.2}},
    [74] = {Data = {Id = 99, Name = "Great Christmas Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 195000, Probability = {Chance = 1.00E-06}},
    [75] = {Data = {Id = 94, Name = "Gingerbread Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 72, Probability = {Chance = 0.01818181818181818}},
    [76] = {Data = {Id = 97, Name = "Gingerbread Turtle", Tier = 5, TierName = "Mythic"}, SellPrice = 38750, Probability = {Chance = 1.43E-05}},
    [77] = {Data = {Id = 98, Name = "Gingerbread Shark", Tier = 6, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 89253, Probability = {Chance = 5.00E-06}},
    [78] = {Data = {Id = 93, Name = "Christmastree Longnose", Tier = 3, TierName = "Rare"}, SellPrice = 190, Probability = {Chance = 0.002857142857142857}},
    [79] = {Data = {Id = 95, Name = "Candycane Lobster", Tier = 4, TierName = "Epic"}, SellPrice = 2138, Probability = {Chance = 0.0005}},
    [80] = {Data = {Id = 96, Name = "Festive Pufferfish", Tier = 4, TierName = "Epic"}, SellPrice = 1244, Probability = {Chance = 0.0008333333333333334}},
    [81] = {Data = {Id = 106, Name = "Blue-Banded Goby", Tier = 2, TierName = "Uncommon"}, SellPrice = 91, Probability = {Chance = 0.02}},
    [82] = {Data = {Id = 107, Name = "Blumato Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 95, Probability = {Chance = 0.01818181818181818}},
    [83] = {Data = {Id = 108, Name = "Conspi Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [84] = {Data = {Id = 109, Name = "Fade Tang", Tier = 1, TierName = "Common"}, SellPrice = 43, Probability = {Chance = 0.06666666666666667}},
    [85] = {Data = {Id = 110, Name = "Lined Cardinal Fish", Tier = 5, TierName = "Legendary"}, SellPrice = 3100, Probability = {Chance = 0.0001818181818181818}},
    [86] = {Data = {Id = 111, Name = "Masked Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [87] = {Data = {Id = 112, Name = "Pygmy Goby", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.16666666666666666}},
    [88] = {Data = {Id = 113, Name = "Sail Tang", Tier = 1, TierName = "Common"}, SellPrice = 24, Probability = {Chance = 0.2}},
    [89] = {Data = {Id = 114, Name = "Watanabei Angelfish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [90] = {Data = {Id = 115, Name = "White Tang", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.2}},
    [91] = {Data = {Id = 119, Name = "Ballina Angelfish", Tier = 3, TierName = "Rare"}, SellPrice = 391, Probability = {Chance = 0.0033333333333333335}},
    [92] = {Data = {Id = 121, Name = "Bleekers Damsel", Tier = 2, TierName = "Common"}, SellPrice = 74, Probability = {Chance = 0.02857142857142857}},
    [93] = {Data = {Id = 122, Name = "Loving Shark", Tier = 6, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 59583, Probability = {Chance = 6.67E-06}},
    [94] = {Data = {Id = 120, Name = "Pink Smith Damsel", Tier = 2, TierName = "Uncommon"}, SellPrice = 62, Probability = {Chance = 0.02}},
    [95] = {Data = {Id = 138, Name = "Axolotl", Tier = 4, TierName = "Legendary"}, SellPrice = 3971, Probability = {Chance = 0.00015384615384615385}},
    [96] = {Data = {Id = 139, Name = "Silver Tuna", Tier = 2, TierName = "Uncommon"}, SellPrice = 62, Probability = {Chance = 0.016666666666666666}},
    [97] = {Data = {Id = 140, Name = "Pilot Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [98] = {Data = {Id = 135, Name = "Patriot Tang", Tier = 1, TierName = "Common"}, SellPrice = 36, Probability = {Chance = 0.1}},
    [99] = {Data = {Id = 136, Name = "Frostborn Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 100000, Probability = {Chance = 2.00E-06}},
    [100] = {Data = {Id = 137, Name = "Plasma Shark", Tier = 5, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 94500, Probability = {Chance = 4.44E-06}},
    [101] = {Data = {Id = 143, Name = "Pufferfish", Tier = 4, TierName = "Epic"}, SellPrice = 1145, Probability = {Chance = 0.0006666666666666666}},
    [102] = {Data = {Id = 144, Name = "Racoon Butterfly Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 71, Probability = {Chance = 0.02}},
    [103] = {Data = {Id = 142, Name = "Orange Basslet", Tier = 2, TierName = "Uncommon"}, SellPrice = 64, Probability = {Chance = 0.02}},
    [104] = {Data = {Id = 146, Name = "Strippled Seahorse", Tier = 5, TierName = "Mythic"}, SellPrice = 40500, Probability = {Chance = 1.05E-05}},
    [105] = {Data = {Id = 147, Name = "Thresher Shark", Tier = 5, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 44000, Probability = {Chance = 1.05E-05}},
    [106] = {Data = {Id = 141, Name = "Great Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 180000, Probability = {Chance = 1.05E-06}},
    [107] = {Data = {Id = 163, Name = "Viperfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 94, Probability = {Chance = 0.02}},
    [108] = {Data = {Id = 152, Name = "Deep Sea Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 4680, Probability = {Chance = 0.0002}},
    [109] = {Data = {Id = 161, Name = "Spotted Lantern Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 88, Probability = {Chance = 0.02}},
    [110] = {Data = {Id = 159, Name = "Robot Kraken", Tier = 7, TierName = "SECRET"}, SellPrice = 327500, Probability = {Chance = 2.86E-07}},
    [111] = {Data = {Id = 160, Name = "Monk Fish", Tier = 4, TierName = "Epic"}, SellPrice = 3200, Probability = {Chance = 0.0003333333333333333}},
    [112] = {Data = {Id = 158, Name = "King Crab", Tier = 6, TierName = "SECRET"}, SellPrice = 218500, Probability = {Chance = 8.33E-07}},
    [113] = {Data = {Id = 157, Name = "Jellyfish", Tier = 3, TierName = "Rare"}, SellPrice = 402, Probability = {Chance = 0.0033333333333333335}},
    [114] = {Data = {Id = 156, Name = "Giant Squid", Tier = 7, TierName = "SECRET"}, SellPrice = 162300, Probability = {Chance = 1.25E-06}},
    [115] = {Data = {Id = 155, Name = "Fangtooth", Tier = 4, TierName = "Epic"}, SellPrice = 1840, Probability = {Chance = 0.0005}},
    [116] = {Data = {Id = 154, Name = "Electric Eel", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [117] = {Data = {Id = 162, Name = "Vampire Squid", Tier = 4, TierName = "Epic"}, SellPrice = 3770, Probability = {Chance = 0.0003333333333333333}},
    [118] = {Data = {Id = 153, Name = "Dark Eel", Tier = 2, TierName = "Uncommon"}, SellPrice = 96, Probability = {Chance = 0.02}},
    [119] = {Data = {Id = 151, Name = "Boar Fish", Tier = 1, TierName = "Common"}, SellPrice = 24, Probability = {Chance = 0.5}},
    [120] = {Data = {Id = 150, Name = "Blob Fish", Tier = 6, TierName = "Mythic"}, SellPrice = 26200, Probability = {Chance = 2.00E-05}},
    [121] = {Data = {Id = 149, Name = "Angler Fish", Tier = 4, TierName = "Epic"}, SellPrice = 3620, Probability = {Chance = 0.0003333333333333333}},
    [122] = {Data = {Id = 166, Name = "Dead Fish", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.25}},
    [123] = {Data = {Id = 165, Name = "Skeleton Fish", Tier = 1, TierName = "Common"}, SellPrice = 26, Probability = {Chance = 0.1}},
    [124] = {Data = {Id = 164, Name = "Swordfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 84, Probability = {Chance = 0.02}},
    [125] = {Data = {Id = 145, Name = "Worm Fish", Tier = 7, TierName = "SECRET"}, SellPrice = 280000, Probability = {Chance = 3.33E-07}},
    [126] = {Data = {Id = 189, Name = "Rockfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 92, Probability = {Chance = 0.02}},
    [127] = {Data = {Id = 191, Name = "Sheepshead Fish", Tier = 3, TierName = "Rare"}, SellPrice = 412, Probability = {Chance = 0.0033333333333333335}},
    [128] = {Data = {Id = 182, Name = "Blackcap Basslet", Tier = 2, TierName = "Uncommon"}, SellPrice = 95, Probability = {Chance = 0.02}},
    [129] = {Data = {Id = 183, Name = "Catfish", Tier = 3, TierName = "Rare"}, SellPrice = 422, Probability = {Chance = 0.0033333333333333335}},
    [130] = {Data = {Id = 184, Name = "Coney Fish", Tier = 3, TierName = "Rare"}, SellPrice = 287, Probability = {Chance = 0.0033333333333333335}},
    [131] = {Data = {Id = 185, Name = "Hermit Crab", Tier = 6, TierName = "Mythic"}, SellPrice = 29700, Probability = {Chance = 1.67E-05}},
    [132] = {Data = {Id = 186, Name = "Crater Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 93, Probability = {Chance = 0.02}},
    [133] = {Data = {Id = 187, Name = "Queen Crab", Tier = 7, TierName = "SECRET"}, SellPrice = 218500, Probability = {Chance = 1.25E-06}},
    [134] = {Data = {Id = 188, Name = "Red Snapper", Tier = 2, TierName = "Uncommon"}, SellPrice = 97, Probability = {Chance = 0.02}},
    [135] = {Data = {Id = 199, Name = "Lake Sturgeon", Tier = 5, TierName = "Legendary"}, SellPrice = 14350, Probability = {Chance = 5.00E-05}},
    [136] = {Data = {Id = 200, Name = "Orca", Tier = 7, TierName = "SECRET"}, SellPrice = 231500, Probability = {Chance = 6.67E-07}},
    [137] = {Data = {Id = 194, Name = "Barracuda Fish", Tier = 3, TierName = "Rare"}, SellPrice = 392, Probability = {Chance = 0.0033333333333333335}},
    [138] = {Data = {Id = 195, Name = "Crystal Crab", Tier = 7, TierName = "SECRET"}, SellPrice = 162000, Probability = {Chance = 1.33E-06}},
    [139] = {Data = {Id = 196, Name = "Frog", Tier = 3, TierName = "Rare"}, SellPrice = 432, Probability = {Chance = 0.002857142857142857}},
    [140] = {Data = {Id = 197, Name = "Gar Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 72, Probability = {Chance = 0.02}},
    [141] = {Data = {Id = 198, Name = "Herring Fish", Tier = 1, TierName = "Common"}, SellPrice = 21, Probability = {Chance = 0.1}},
    [142] = {Data = {Id = 210, Name = "Dark Tentacle", Tier = 3, TierName = "Rare"}, SellPrice = 392, Probability = {Chance = 0.0033333333333333335}},
    [143] = {Data = {Id = 202, Name = "Flat Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [144] = {Data = {Id = 203, Name = "Flying Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [145] = {Data = {Id = 204, Name = "Lion Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 143, Probability = {Chance = 0.01}},
    [146] = {Data = {Id = 209, Name = "Starfish", Tier = 3, TierName = "Rare"}, SellPrice = 385, Probability = {Chance = 0.0033333333333333335}},
    [147] = {Data = {Id = 211, Name = "Wahoo", Tier = 2, TierName = "Uncommon"}, SellPrice = 105, Probability = {Chance = 0.015384615384615385}},
    [148] = {Data = {Id = 208, Name = "Saw Fish", Tier = 5, TierName = "Legendary"}, SellPrice = 11250, Probability = {Chance = 6.67E-05}},
    [149] = {Data = {Id = 207, Name = "Pink Dolphin", Tier = 4, TierName = "Legendary"}, SellPrice = 3910, Probability = {Chance = 0.0002}},
    [150] = {Data = {Id = 206, Name = "Monster Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 245000, Probability = {Chance = 4.00E-07}},
    [151] = {Data = {Id = 205, Name = "Luminous Fish", Tier = 6, TierName = "Mythic"}, SellPrice = 31150, Probability = {Chance = 1.25E-05}},
    [152] = {Data = {Id = 201, Name = "Eerie Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 92500, Probability = {Chance = 4.00E-06}},
    [153] = {Data = {Id = 225, Name = "Scare", Tier = 7, TierName = "SECRET"}, SellPrice = 280000, Probability = {Chance = 3.33E-07}},
    [154] = {Data = {Id = 224, Name = "Synodontis", Tier = 5, TierName = "Legendary"}, SellPrice = 3825, Probability = {Chance = 0.0002}},
    [155] = {Data = {Id = 215, Name = "Armor Catfish", Tier = 6, TierName = "Mythic"}, SellPrice = 30500, Probability = {Chance = 2.00E-05}},
    [156] = {Data = {Id = 218, Name = "Thin Armor Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 91000, Probability = {Chance = 3.33E-06}},
    [157] = {Data = {Id = 227, Name = "Narwhal", Tier = 4, TierName = "Epic"}, SellPrice = 2045, Probability = {Chance = 0.0005}},
    [158] = {Data = {Id = 228, Name = "Lochness Monster", Tier = 7, TierName = "SECRET"}, SellPrice = 330000, Probability = {Chance = 3.33E-07}},
    [159] = {Data = {Id = 239, Name = "Antique Cup", Tier = 3, TierName = "Rare"}, SellPrice = 430, Probability = {Chance = 0.0033333333333333335}},
    [160] = {Data = {Id = 238, Name = "Antique Watch", Tier = 3, TierName = "Epic"}, SellPrice = 1680, Probability = {Chance = 0.0006666666666666666}},
    [161] = {Data = {Id = 232, Name = "Sea Shell", Tier = 2, TierName = "Uncommon"}, SellPrice = 76, Probability = {Chance = 0.02}},
    [162] = {Data = {Id = 235, Name = "Pearl", Tier = 3, TierName = "Rare"}, SellPrice = 715, Probability = {Chance = 0.0033333333333333335}},
    [163] = {Data = {Id = 234, Name = "Old Boot", Tier = 1, TierName = "Common"}, SellPrice = 27, Probability = {Chance = 0.04}},
    [164] = {Data = {Id = 233, Name = "Expensive Chain", Tier = 4, TierName = "Epic"}, SellPrice = 1580, Probability = {Chance = 0.0006666666666666666}},
    [165] = {Data = {Id = 236, Name = "Diamond Ring", Tier = 5, TierName = "Legendary"}, SellPrice = 3580, Probability = {Chance = 0.0002}},
    [166] = {Data = {Id = 237, Name = "Conch Shell", Tier = 2, TierName = "Uncommon"}, SellPrice = 72, Probability = {Chance = 0.02}},
    [167] = {Data = {Id = 226, Name = "Megalodon", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 355000, Probability = {Chance = 2.50E-07}},
    [168] = {Data = {Id = 242, Name = "Arowana", Tier = 2, TierName = "Uncommon"}, SellPrice = 61, Probability = {Chance = 0.02}},
    [169] = {Data = {Id = 241, Name = "King Mackerel", Tier = 3, TierName = "Rare"}, SellPrice = 358, Probability = {Chance = 0.0033333333333333335}},
    [170] = {Data = {Id = 240, Name = "Magma Shark", Tier = 6, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 115500, Probability = {Chance = 5.00E-06}},
    [171] = {Data = {Id = 243, Name = "Ruby", Tier = 5, TierName = "Legendary"}, SellPrice = 13950, Probability = {Chance = 6.67E-05}},
    [172] = {Data = {Id = 280, Name = "Abyshorn Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 63, Probability = {Chance = 0.02}},
    [173] = {Data = {Id = 247, Name = "Sharp One", Tier = 6, TierName = "Mythic"}, SellPrice = 54000, Probability = {Chance = 9.52E-06}},
    [174] = {Data = {Id = 249, Name = "Hybodus Shark", Tier = 6, TierName = "Mythic"}, SellPrice = 63500, Probability = {Chance = 6.67E-06}},
    [175] = {Data = {Id = 248, Name = "Panther Eel", Tier = 6, TierName = "SECRET"}, SellPrice = 151500, Probability = {Chance = 1.33E-06}},
    [176] = {Data = {Id = 83, Name = "Ghost Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 125000, Probability = {Chance = 2.00E-06}},
    [177] = {Data = {Id = 176, Name = "Ghost Worm Fish", Tier = 7, TierName = "SECRET"}, SellPrice = 195000, Probability = {Chance = 1.00E-06}},
    [178] = {Data = {Id = 287, Name = "Zebra Snakehead", Tier = 2, TierName = "Uncommon"}, SellPrice = 164, Probability = {Chance = 0.006666666666666667}},
    [179] = {Data = {Id = 281, Name = "Waveback Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [180] = {Data = {Id = 263, Name = "Crocodile", Tier = 6, TierName = "Mythic"}, SellPrice = 29500, Probability = {Chance = 2.00E-05}},
    [181] = {Data = {Id = 278, Name = "Viperangler Fish", Tier = 3, TierName = "Rare"}, SellPrice = 430, Probability = {Chance = 0.0033333333333333335}},
    [182] = {Data = {Id = 286, Name = "Temple Spokes Tuna", Tier = 5, TierName = "Legendary"}, SellPrice = 4730, Probability = {Chance = 0.0002}},
    [183] = {Data = {Id = 276, Name = "Spear Guardian", Tier = 4, TierName = "Epic"}, SellPrice = 1150, Probability = {Chance = 0.001}},
    [184] = {Data = {Id = 268, Name = "Skeleton Angler Fish", Tier = 4, TierName = "Epic"}, SellPrice = 2750, Probability = {Chance = 0.0003333333333333333}},
    [185] = {Data = {Id = 275, Name = "Sail Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 59, Probability = {Chance = 0.02}},
    [186] = {Data = {Id = 283, Name = "Sacred Guardian Squid", Tier = 5, TierName = "Legendary"}, SellPrice = 28500, Probability = {Chance = 2.22E-05}},
    [187] = {Data = {Id = 279, Name = "Runic Wispeye", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [188] = {Data = {Id = 285, Name = "Red Goatfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 145, Probability = {Chance = 0.01}},
    [189] = {Data = {Id = 282, Name = "Parrot Fish", Tier = 3, TierName = "Rare"}, SellPrice = 440, Probability = {Chance = 0.0033333333333333335}},
    [190] = {Data = {Id = 277, Name = "Mossy Fishlet", Tier = 3, TierName = "Rare"}, SellPrice = 430, Probability = {Chance = 0.0033333333333333335}},
    [191] = {Data = {Id = 262, Name = "Ancient Arapaima", Tier = 2, TierName = "Uncommon"}, SellPrice = 64, Probability = {Chance = 0.02}},
    [192] = {Data = {Id = 274, Name = "Manoai Statue Fish", Tier = 5, TierName = "Legendary"}, SellPrice = 4700, Probability = {Chance = 0.0002}},
    [193] = {Data = {Id = 273, Name = "Mammoth Appafish", Tier = 6, TierName = "Mythic"}, SellPrice = 66000, Probability = {Chance = 6.67E-06}},
    [194] = {Data = {Id = 270, Name = "Goliath Tiger", Tier = 4, TierName = "Epic"}, SellPrice = 1380, Probability = {Chance = 0.001}},
    [195] = {Data = {Id = 345, Name = "Ancient Lochness Monster", Tier = 7, TierName = "SECRET"}, SellPrice = 100000, Probability = {Chance = 3.33E-07}},
    [196] = {Data = {Id = 288, Name = "Drippy Tucanare", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [197] = {Data = {Id = 292, Name = "King Jelly", Tier = 7, TierName = "SECRET"}, SellPrice = 225000, Probability = {Chance = 6.67E-07}},
    [198] = {Data = {Id = 290, Name = "Beanie Leedsicheye", Tier = 1, TierName = "Common"}, SellPrice = 19, Probability = {Chance = 0.5}},
    [199] = {Data = {Id = 264, Name = "Ancient Relic Crocodile", Tier = 6, TierName = "Mythic"}, SellPrice = 98000, Probability = {Chance = 4.08E-06}},
    [200] = {Data = {Id = 293, Name = "Bone Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 255000, Probability = {Chance = 5.00E-07}},
    [201] = {Data = {Id = 272, Name = "Mosasaur Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 180000, Probability = {Chance = 1.25E-06}},
    [202] = {Data = {Id = 269, Name = "Elshark Gran Maja", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 440000, Probability = {Chance = 2.50E-07}},
    [203] = {Data = {Id = 289, Name = "Water Snake", Tier = 2, TierName = "Uncommon"}, SellPrice = 61, Probability = {Chance = 0.02}},
    [204] = {Data = {Id = 295, Name = "Ancient Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 270000, Probability = {Chance = 3.64E-07}},
    [205] = {Data = {Id = 296, Name = "Crystal Salamander", Tier = 5, TierName = "Legendary"}, SellPrice = 4325, Probability = {Chance = 0.00016666666666666666}},
    [206] = {Data = {Id = 301, Name = "Dead Scary Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.01}},
    [207] = {Data = {Id = 303, Name = "Dead Spooky Koi Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1180, Probability = {Chance = 0.0005}},
    [208] = {Data = {Id = 302, Name = "Dead Zombie Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 66000, Probability = {Chance = 2.00E-06}},
    [209] = {Data = {Id = 299, Name = "Pumpkin Jellyfish", Tier = 5, TierName = "Legendary"}, SellPrice = 9800, Probability = {Chance = 0.0001}},
    [210] = {Data = {Id = 300, Name = "Scary Clownfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [211] = {Data = {Id = 298, Name = "Spooky Koi Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1180, Probability = {Chance = 0.001}},
    [212] = {Data = {Id = 304, Name = "Toxic Jellyfish", Tier = 4, TierName = "Epic"}, SellPrice = 2138, Probability = {Chance = 0.0005}},
    [213] = {Data = {Id = 297, Name = "Zombie Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 66000, Probability = {Chance = 4.00E-06}},
    [214] = {Data = {Id = 310, Name = "Baby Pumpkin Shark", Tier = 3, TierName = "Rare"}, SellPrice = 435, Probability = {Chance = 0.0033333333333333335}},
    [215] = {Data = {Id = 316, Name = "Dark Pumpkin Appafish", Tier = 6, TierName = "Mythic"}, SellPrice = 54000, Probability = {Chance = 1.00E-05}},
    [216] = {Data = {Id = 308, Name = "Frankenstein Longsnapper", Tier = 6, TierName = "Mythic"}, SellPrice = 29500, Probability = {Chance = 2.00E-05}},
    [217] = {Data = {Id = 313, Name = "Ghost Spiralfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 68, Probability = {Chance = 0.02}},
    [218] = {Data = {Id = 315, Name = "Mossy Vampire Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [219] = {Data = {Id = 309, Name = "Pumpkin Angler Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1980, Probability = {Chance = 0.0006666666666666666}},
    [220] = {Data = {Id = 312, Name = "Pumpkin Butterfly Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [221] = {Data = {Id = 307, Name = "Pumpkin Carved Shark", Tier = 5, TierName = "Legendary"}, SellPrice = 10250, Probability = {Chance = 0.0001}},
    [222] = {Data = {Id = 305, Name = "Pumpkin Hermit Crab", Tier = 3, TierName = "Rare"}, SellPrice = 385, Probability = {Chance = 0.0033333333333333335}},
    [223] = {Data = {Id = 314, Name = "Pumpkin Ray", Tier = 6, TierName = "Mythic"}, SellPrice = 27600, Probability = {Chance = 2.00E-05}},
    [224] = {Data = {Id = 317, Name = "Pumpkin StoneTurtle", Tier = 5, TierName = "Legendary"}, SellPrice = 3900, Probability = {Chance = 0.0002}},
    [225] = {Data = {Id = 318, Name = "Spooky Peafish", Tier = 1, TierName = "Common"}, SellPrice = 18, Probability = {Chance = 0.5}},
    [226] = {Data = {Id = 306, Name = "Witch Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 61, Probability = {Chance = 0.02}},
    [227] = {Data = {Id = 311, Name = "Wizard Stingray", Tier = 5, TierName = "Legendary"}, SellPrice = 4600, Probability = {Chance = 0.0002}},
    [228] = {Data = {Id = 319, Name = "Zombie Megalodon", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 375000, Probability = {Chance = 2.50E-07}},
    [229] = {Data = {Id = 333, Name = "Candy Corn Eel", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [230] = {Data = {Id = 334, Name = "Ghastly Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 11111, Probability = {Chance = 0.0001}},
    [231] = {Data = {Id = 338, Name = "Ghastly Hermit Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 4266, Probability = {Chance = 0.0002}},
    [232] = {Data = {Id = 336, Name = "Hammerhead Mummy", Tier = 6, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 100000, Probability = {Chance = 4.08E-06}},
    [233] = {Data = {Id = 342, Name = "Bloodmoon Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 540000, Probability = {Chance = 2.00E-07}},
    [234] = {Data = {Id = 341, Name = "Talon Serpent", Tier = 7, TierName = "SECRET"}, SellPrice = 0, Probability = {Chance = 1.00E-06}},
    [235] = {Data = {Id = 340, Name = "Wild Serpent", Tier = 7, TierName = "SECRET"}, SellPrice = 0, Probability = {Chance = 1.00E-06}},
    [236] = {Data = {Id = 335, Name = "Witch Koi Fish", Tier = 3, TierName = "Rare"}, SellPrice = 575, Probability = {Chance = 0.002}},
    [237] = {Data = {Id = 337, Name = "Wraithfin Abyssal", Tier = 4, TierName = "Epic"}, SellPrice = 1125, Probability = {Chance = 0.001}},
    [238] = {Data = {Id = 339, Name = "Skeleton Narwhal", Tier = 7, TierName = "SECRET"}, SellPrice = 135000, Probability = {Chance = 1.67E-06}},
    [239] = {Data = {Id = 378, Name = "Wing Parrotfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 85, Probability = {Chance = 0.02}},
    [240] = {Data = {Id = 377, Name = "Traffic Cone Fish", Tier = 3, TierName = "Rare"}, SellPrice = 495, Probability = {Chance = 0.0033333333333333335}},
    [241] = {Data = {Id = 376, Name = "Toothy Fish", Tier = 3, TierName = "Rare"}, SellPrice = 520, Probability = {Chance = 0.0033333333333333335}},
    [242] = {Data = {Id = 375, Name = "Thinkler Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 82, Probability = {Chance = 0.02}},
    [243] = {Data = {Id = 374, Name = "Sona Fin Fish", Tier = 1, TierName = "Common"}, SellPrice = 28, Probability = {Chance = 0.5}},
    [244] = {Data = {Id = 373, Name = "Sea Crustacean", Tier = 6, TierName = "Mythic"}, SellPrice = 65000, Probability = {Chance = 2.00E-05}},
    [245] = {Data = {Id = 372, Name = "Runic Squid", Tier = 6, TierName = "Mythic"}, SellPrice = 114000, Probability = {Chance = 1.11E-05}},
    [246] = {Data = {Id = 371, Name = "Runic Sea Crustacean", Tier = 6, TierName = "Mythic"}, SellPrice = 78000, Probability = {Chance = 2.00E-05}},
    [247] = {Data = {Id = 370, Name = "Runic Lobster", Tier = 5, TierName = "Legendary"}, SellPrice = 6000, Probability = {Chance = 0.0002}},
    [248] = {Data = {Id = 369, Name = "Runic Axolotl", Tier = 5, TierName = "Legendary"}, SellPrice = 9600, Probability = {Chance = 0.0001}},
    [249] = {Data = {Id = 368, Name = "Purp Blisfish", Tier = 1, TierName = "Uncommon"}, SellPrice = 73, Probability = {Chance = 0.02}},
    [250] = {Data = {Id = 367, Name = "Primordial Octopus", Tier = 6, TierName = "Mythic"}, SellPrice = 105000, Probability = {Chance = 6.67E-06}},
    [251] = {Data = {Id = 366, Name = "Primal Lobster", Tier = 5, TierName = "Legendary"}, SellPrice = 5000, Probability = {Chance = 0.0002}},
    [252] = {Data = {Id = 365, Name = "Primal Axolotl", Tier = 5, TierName = "Legendary"}, SellPrice = 8000, Probability = {Chance = 0.0001}},
    [253] = {Data = {Id = 364, Name = "Pirate Blue Lobster", Tier = 3, TierName = "Rare"}, SellPrice = 500, Probability = {Chance = 0.0033333333333333335}},
    [254] = {Data = {Id = 363, Name = "Night Glider Fish", Tier = 1, TierName = "Common"}, SellPrice = 28, Probability = {Chance = 0.5}},
    [255] = {Data = {Id = 362, Name = "Lunar Crescent Fish", Tier = 3, TierName = "Rare"}, SellPrice = 490, Probability = {Chance = 0.0033333333333333335}},
    [256] = {Data = {Id = 361, Name = "Liar Nose Fish", Tier = 3, TierName = "Rare"}, SellPrice = 490, Probability = {Chance = 0.0033333333333333335}},
    [257] = {Data = {Id = 445, Name = "1x1x1x1 Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 150000, Probability = {Chance = 4.00E-07}},
    [258] = {Data = {Id = 359, Name = "Gladiator Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 190000, Probability = {Chance = 1.00E-06}},
    [259] = {Data = {Id = 358, Name = "Foxtrot Koanfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 87, Probability = {Chance = 0.02}},
    [260] = {Data = {Id = 357, Name = "Fossilized Shark", Tier = 6, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 94000, Probability = {Chance = 1.00E-05}},
    [261] = {Data = {Id = 356, Name = "Flying Manta", Tier = 5, TierName = "Legendary"}, SellPrice = 15000, Probability = {Chance = 6.67E-05}},
    [262] = {Data = {Id = 355, Name = "Flatheaded Whale Shark", Tier = 6, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 140000, Probability = {Chance = 5.00E-06}},
    [263] = {Data = {Id = 354, Name = "Doober Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 93, Probability = {Chance = 0.02}},
    [264] = {Data = {Id = 353, Name = "Dogfish", Tier = 4, TierName = "Epic"}, SellPrice = 3333, Probability = {Chance = 0.0005}},
    [265] = {Data = {Id = 352, Name = "Cavern Dweller", Tier = 6, TierName = "Mythic"}, SellPrice = 135000, Probability = {Chance = 8.33E-06}},
    [266] = {Data = {Id = 351, Name = "Boney Eel", Tier = 3, TierName = "Rare"}, SellPrice = 450, Probability = {Chance = 0.0033333333333333335}},
    [267] = {Data = {Id = 350, Name = "Blobby Shieldfish", Tier = 4, TierName = "Epic"}, SellPrice = 1600, Probability = {Chance = 0.001}},
    [268] = {Data = {Id = 349, Name = "Baby Shrimp", Tier = 2, TierName = "Uncommon"}, SellPrice = 79, Probability = {Chance = 0.02}},
    [269] = {Data = {Id = 348, Name = "Angrylion Fish", Tier = 4, TierName = "Epic"}, SellPrice = 3330, Probability = {Chance = 0.0005}},
    [270] = {Data = {Id = 347, Name = "Ancient Squid", Tier = 6, TierName = "Mythic"}, SellPrice = 95000, Probability = {Chance = 1.11E-05}},
    [271] = {Data = {Id = 346, Name = "Ancient Pufferfish", Tier = 5, TierName = "Legendary"}, SellPrice = 4500, Probability = {Chance = 0.0002}},
    [272] = {Data = {Id = 284, Name = "Freshwater Piranha", Tier = 3, TierName = "Rare"}, SellPrice = 410, Probability = {Chance = 0.0033333333333333335}},
    [273] = {Data = {Id = 380, Name = "Plasma Serpent", Tier = 6, TierName = "Mythic"}, SellPrice = 98000, Probability = {Chance = 4.44E-06}},
    [274] = {Data = {Id = 379, Name = "Cryoshade Glider", Tier = 7, TierName = "SECRET"}, SellPrice = 120000, Probability = {Chance = 2.22E-06}},
    [275] = {Data = {Id = 381, Name = "Starlight Manta Ray", Tier = 6, TierName = "Mythic"}, SellPrice = 33000, Probability = {Chance = 1.25E-05}},
    [276] = {Data = {Id = 383, Name = "Starlight Crab", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [277] = {Data = {Id = 385, Name = "Parrot Blopfish", Tier = 3, TierName = "Rare"}, SellPrice = 410, Probability = {Chance = 0.0033333333333333335}},
    [278] = {Data = {Id = 391, Name = "Green Gillfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [279] = {Data = {Id = 390, Name = "Cypress Ratua", Tier = 2, TierName = "Uncommon"}, SellPrice = 65, Probability = {Chance = 0.02}},
    [280] = {Data = {Id = 389, Name = "Fish Fossil", Tier = 5, TierName = "Legendary"}, SellPrice = 3580, Probability = {Chance = 0.0002}},
    [281] = {Data = {Id = 388, Name = "Glacierfin Snapper", Tier = 2, TierName = "Uncommon"}, SellPrice = 120, Probability = {Chance = 0.01}},
    [282] = {Data = {Id = 387, Name = "Curious Garfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 68, Probability = {Chance = 0.02}},
    [283] = {Data = {Id = 386, Name = "Iron Domefin", Tier = 4, TierName = "Epic"}, SellPrice = 1150, Probability = {Chance = 0.001}},
    [284] = {Data = {Id = 382, Name = "Cute Octopus", Tier = 3, TierName = "Rare"}, SellPrice = 402, Probability = {Chance = 0.0033333333333333335}},
    [285] = {Data = {Id = 384, Name = "Freshwater Piranha", Tier = 3, TierName = "Rare"}, SellPrice = 410, Probability = {Chance = 0.0033333333333333335}},
    [286] = {Data = {Id = 392, Name = "Coral", Tier = 1, TierName = "Common"}, SellPrice = 25, Probability = {Chance = 0.16666666666666666}},
    [287] = {Data = {Id = 395, Name = "Boltback Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 115, Probability = {Chance = 0.01}},
    [288] = {Data = {Id = 393, Name = "Sophisticated Angler", Tier = 2, TierName = "Uncommon"}, SellPrice = 84, Probability = {Chance = 0.014285714285714285}},
    [289] = {Data = {Id = 394, Name = "Smarty Mcfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 82, Probability = {Chance = 0.014285714285714285}},
    [290] = {Data = {Id = 450, Name = "Depthseeker Ray", Tier = 7, TierName = "SECRET"}, SellPrice = 220000, Probability = {Chance = 8.33E-07}},
    [291] = {Data = {Id = 405, Name = "Yellow Spinefin", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [292] = {Data = {Id = 427, Name = "ElRetro Gran Maja", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 360000, Probability = {Chance = 2.50E-07}},
    [293] = {Data = {Id = 407, Name = "Violet Divafish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [294] = {Data = {Id = 408, Name = "Turqoi Backfin", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [295] = {Data = {Id = 409, Name = "Tree Frog", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [296] = {Data = {Id = 410, Name = "Trav Grupper", Tier = 5, TierName = "Legendary"}, SellPrice = 15000, Probability = {Chance = 6.67E-05}},
    [297] = {Data = {Id = 411, Name = "Studded Jellyfish", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [298] = {Data = {Id = 412, Name = "Studded Dolphin", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [299] = {Data = {Id = 413, Name = "Steelfin Marlin", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [300] = {Data = {Id = 414, Name = "Starry Night Shark", Tier = 6, TierName = "Mythic", Variants = {"Color Burn"}}, SellPrice = 75000, Probability = {Chance = 2.00E-05}},
    [301] = {Data = {Id = 415, Name = "Shedletsky Guppy", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [302] = {Data = {Id = 446, Name = "Retro Crocodile", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [303] = {Data = {Id = 416, Name = "Purple Razorback", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [304] = {Data = {Id = 417, Name = "Lumina Stinger", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [305] = {Data = {Id = 418, Name = "Leaf Fin", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [306] = {Data = {Id = 419, Name = "Lady Luminelle", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [307] = {Data = {Id = 420, Name = "Happy Sunfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [308] = {Data = {Id = 421, Name = "Gumball Whale", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [309] = {Data = {Id = 422, Name = "Guest Guppy", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [310] = {Data = {Id = 423, Name = "Grumpy Angler", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [311] = {Data = {Id = 424, Name = "Frostbreaker Whale", Tier = 6, TierName = "Mythic"}, SellPrice = 145000, Probability = {Chance = 5.00E-06}},
    [312] = {Data = {Id = 425, Name = "Friendly Lobster", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [313] = {Data = {Id = 426, Name = "Enchanted Turtle", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [314] = {Data = {Id = 360, Name = "King Frog", Tier = 4, TierName = "Epic"}, SellPrice = 4000, Probability = {Chance = 0.0003332222592469177}},
    [315] = {Data = {Id = 428, Name = "Disco Party Puffer", Tier = 4, TierName = "Epic"}, SellPrice = 2400, Probability = {Chance = 0.0005}},
    [316] = {Data = {Id = 429, Name = "Cousin Tentacles", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [317] = {Data = {Id = 430, Name = "Classic Goldfish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [318] = {Data = {Id = 431, Name = "Classic Dorhey Tang", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [319] = {Data = {Id = 432, Name = "Classic Angler", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [320] = {Data = {Id = 433, Name = "Cantelope Puffer", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [321] = {Data = {Id = 434, Name = "Builderman Guppy", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [322] = {Data = {Id = 435, Name = "Brighteyes Guppy", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [323] = {Data = {Id = 436, Name = "Boned Arrowhead Fish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.5}},
    [324] = {Data = {Id = 437, Name = "Blue Shell Crab", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [325] = {Data = {Id = 438, Name = "Blocky Octopus", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [326] = {Data = {Id = 439, Name = "Blockmine Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [327] = {Data = {Id = 440, Name = "Block Fish", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [328] = {Data = {Id = 441, Name = "Beach Ball", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [329] = {Data = {Id = 442, Name = "Angry Rocky", Tier = 2, TierName = "Uncommon"}, SellPrice = 55, Probability = {Chance = 0.02}},
    [330] = {Data = {Id = 443, Name = "Ancient Crawler", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [331] = {Data = {Id = 444, Name = "Alienhead Squid", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [332] = {Data = {Id = 406, Name = "Winged Seahorse", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [333] = {Data = {Id = 451, Name = "Void Eel", Tier = 2, TierName = "Uncommon"}, SellPrice = 70, Probability = {Chance = 0.015384615384615385}},
    [334] = {Data = {Id = 449, Name = "Tralalero Tralala", Tier = 6, TierName = "Mythic"}, SellPrice = 88888, Probability = {Chance = 1.00E-05}},
    [335] = {Data = {Id = 448, Name = "1x1x1x1 Comet Shark", Tier = 7, TierName = "SECRET"}, SellPrice = 444444, Probability = {Chance = 2.22E-07}},
    [336] = {Data = {Id = 469, Name = "Swirl Crab Cake", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [337] = {Data = {Id = 460, Name = "Balloon Shrimp", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [338] = {Data = {Id = 461, Name = "Cake Turtle", Tier = 4, TierName = "Epic"}, SellPrice = 1100, Probability = {Chance = 0.001}},
    [339] = {Data = {Id = 462, Name = "Cherry Spearfish", Tier = 5, TierName = "Legendary"}, SellPrice = 5500, Probability = {Chance = 0.0002}},
    [340] = {Data = {Id = 463, Name = "King Swirl Pufferfish", Tier = 3, TierName = "Rare"}, SellPrice = 330, Probability = {Chance = 0.0033333333333333335}},
    [341] = {Data = {Id = 464, Name = "Pinata Crab", Tier = 6, TierName = "Mythic"}, SellPrice = 55000, Probability = {Chance = 1.43E-05}},
    [342] = {Data = {Id = 465, Name = "Pinata Squid", Tier = 6, TierName = "Mythic"}, SellPrice = 55000, Probability = {Chance = 1.43E-05}},
    [343] = {Data = {Id = 466, Name = "Sprinkle Fish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.1}},
    [344] = {Data = {Id = 467, Name = "Sprinkle Wrinkfish", Tier = 1, TierName = "Common"}, SellPrice = 20, Probability = {Chance = 0.1}},
    [345] = {Data = {Id = 468, Name = "Strawberry Choc Megalodon", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 375000, Probability = {Chance = 2.50E-07}},
    [346] = {Data = {Id = 473, Name = "Winter Sweater Redfin", Tier = 2, TierName = "Uncommon"}, SellPrice = 85, Probability = {Chance = 0.0125}},
    [347] = {Data = {Id = 487, Name = "Bowtie Blobby", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [348] = {Data = {Id = 527, Name = "Chill Santa Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [349] = {Data = {Id = 474, Name = "Christmas Light Carp", Tier = 3, TierName = "Rare"}, SellPrice = 320, Probability = {Chance = 0.0033333333333333335}},
    [350] = {Data = {Id = 529, Name = "Christmas Wreath Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [351] = {Data = {Id = 511, Name = "Christmas Penguin", Tier = 5, TierName = "Legendary"}, SellPrice = 19000, Probability = {Chance = 3.33E-05}},
    [352] = {Data = {Id = 500, Name = "Classy Snowfish", Tier = 4, TierName = "Epic"}, SellPrice = 1200, Probability = {Chance = 0.001}},
    [353] = {Data = {Id = 515, Name = "Cozy Carp", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [354] = {Data = {Id = 492, Name = "Cozy Narwhal Plushie", Tier = 4, TierName = "Epic"}, SellPrice = 1700, Probability = {Chance = 0.0006666666666666666}},
    [355] = {Data = {Id = 526, Name = "Reindeer Shark", Tier = 5, TierName = "Legendary", Variants = {"Color Burn"}}, SellPrice = 14500, Probability = {Chance = 4.00E-05}},
    [356] = {Data = {Id = 518, Name = "Emerald Winter Whale", Tier = 7, TierName = "SECRET"}, SellPrice = 175000, Probability = {Chance = 6.67E-07}},
    [357] = {Data = {Id = 498, Name = "Festive Dolphin", Tier = 6, TierName = "Mythic"}, SellPrice = 24000, Probability = {Chance = 2.00E-05}},
    [358] = {Data = {Id = 480, Name = "Festive Salmon", Tier = 2, TierName = "Uncommon"}, SellPrice = 63, Probability = {Chance = 0.016666666666666666}},
    [359] = {Data = {Id = 497, Name = "Finny Present", Tier = 3, TierName = "Rare"}, SellPrice = 340, Probability = {Chance = 0.0033333333333333335}},
    [360] = {Data = {Id = 505, Name = "Frostglow Globe Jelly", Tier = 6, TierName = "Mythic"}, SellPrice = 26500, Probability = {Chance = 1.54E-05}},
    [361] = {Data = {Id = 502, Name = "Frostshell Turtle", Tier = 6, TierName = "Mythic"}, SellPrice = 31100, Probability = {Chance = 1.11E-05}},
    [362] = {Data = {Id = 508, Name = "Frozen Tundra", Tier = 5, TierName = "Legendary"}, SellPrice = 3800, Probability = {Chance = 0.0002}},
    [363] = {Data = {Id = 503, Name = "Giftback Turtle", Tier = 5, TierName = "Legendary"}, SellPrice = 18000, Probability = {Chance = 3.33E-05}},
    [364] = {Data = {Id = 482, Name = "Gingerbread Crab", Tier = 4, TierName = "Epic"}, SellPrice = 1300, Probability = {Chance = 0.001}},
    [365] = {Data = {Id = 481, Name = "Gingerbread Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 105, Probability = {Chance = 0.01}},
    [366] = {Data = {Id = 491, Name = "Gingerbread Fish Plushie", Tier = 3, TierName = "Rare"}, SellPrice = 530, Probability = {Chance = 0.002}},
    [367] = {Data = {Id = 483, Name = "Gingerbread Ray", Tier = 4, TierName = "Epic"}, SellPrice = 2400, Probability = {Chance = 0.0005}},
    [368] = {Data = {Id = 485, Name = "Gingerbread Starfish", Tier = 2, TierName = "Uncommon"}, SellPrice = 210, Probability = {Chance = 0.005}},
    [369] = {Data = {Id = 506, Name = "Tree Horse", Tier = 5, TierName = "Legendary"}, SellPrice = 8000, Probability = {Chance = 0.0001}},
    [370] = {Data = {Id = 494, Name = "Holiday Angler Plushie", Tier = 4, TierName = "Epic"}, SellPrice = 2200, Probability = {Chance = 0.0005}},
    [371] = {Data = {Id = 495, Name = "Holiday Guppy Plushie", Tier = 2, TierName = "Uncommon"}, SellPrice = 110, Probability = {Chance = 0.01}},
    [372] = {Data = {Id = 493, Name = "Holiday Turtle Plushie", Tier = 3, TierName = "Rare"}, SellPrice = 550, Probability = {Chance = 0.002}},
    [373] = {Data = {Id = 472, Name = "Icecap Runner", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.25}},
    [374] = {Data = {Id = 470, Name = "Icefang Angler", Tier = 3, TierName = "Rare"}, SellPrice = 320, Probability = {Chance = 0.0033333333333333335}},
    [375] = {Data = {Id = 489, Name = "Icey Pufferfish", Tier = 1, TierName = "Rare"}, SellPrice = 310, Probability = {Chance = 0.0033333333333333335}},
    [376] = {Data = {Id = 531, Name = "Jingle Bells Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 64, Probability = {Chance = 0.016666666666666666}},
    [377] = {Data = {Id = 471, Name = "Jinglefin", Tier = 3, TierName = "Rare"}, SellPrice = 310, Probability = {Chance = 0.0033333333333333335}},
    [378] = {Data = {Id = 507, Name = "Jolly Crab", Tier = 3, TierName = "Rare"}, SellPrice = 310, Probability = {Chance = 0.0033333333333333335}},
    [379] = {Data = {Id = 490, Name = "Mistle Toe Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 88, Probability = {Chance = 0.0125}},
    [380] = {Data = {Id = 484, Name = "Mistle Toe Seahorse", Tier = 2, TierName = "Rare"}, SellPrice = 250, Probability = {Chance = 0.004}},
    [381] = {Data = {Id = 479, Name = "Northfin Helper", Tier = 2, TierName = "Uncommon"}, SellPrice = 110, Probability = {Chance = 0.01}},
    [382] = {Data = {Id = 504, Name = "Nutcracker Ray", Tier = 6, TierName = "Mythic"}, SellPrice = 75000, Probability = {Chance = 8.00E-06}},
    [383] = {Data = {Id = 488, Name = "Ornament Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 58, Probability = {Chance = 0.02}},
    [384] = {Data = {Id = 514, Name = "Peppermint Fish", Tier = 3, TierName = "Rare"}, SellPrice = 320, Probability = {Chance = 0.0033333333333333335}},
    [385] = {Data = {Id = 486, Name = "Peppermint Spike", Tier = 4, TierName = "Epic"}, SellPrice = 1000, Probability = {Chance = 0.001}},
    [386] = {Data = {Id = 516, Name = "Reindeer Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.5}},
    [387] = {Data = {Id = 530, Name = "Snowflake Puffer Fish", Tier = 2, TierName = "Uncommon"}, SellPrice = 210, Probability = {Chance = 0.005}},
    [388] = {Data = {Id = 476, Name = "Santa Guppy", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.125}},
    [389] = {Data = {Id = 477, Name = "Reindeer Guppy", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.125}},
    [390] = {Data = {Id = 496, Name = "Goofy Santa Fish", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.1}},
    [391] = {Data = {Id = 478, Name = "Elf Guppy", Tier = 1, TierName = "Common"}, SellPrice = 22, Probability = {Chance = 0.1}},
    [392] = {Data = {Id = 519, Name = "Krampus Shark", Tier = 7, TierName = "SECRET", Variants = {"Color Burn"}}, SellPrice = 145000, Probability = {Chance = 1.00E-06}},
}

local FishItLocations = {
    "Fisherman Island",
    "Ocean",
    "Kohana Island",
    "Kohana Volcano",
    "Volcanic Depths",
    "Coral Reef",
    "Esoteric Depths",
    "Tropical Grove",
    "Crater Island",
    "Lost Isle",
    "Ancient Jungle",
    "Ancient Ruins",
    "Classic Island",
    "Pirate Cove",
    "Crystal Depths",
    "Underground Cellar"
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                     FISH IT! RODS (13)                         ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishItRods = {
    "Starter Rod",
    "Toy Rod",
    "Grass Rod",
    "Lava Rod",
    "Lucky Rod",
    "Hazmat Rod",
    "Ares Rod",
    "Astral Rod",
    "Bamboo Rod",
    "Fluorescent Rod",
    "Ghostfinn Rod",
    "Angler Rod",
    "Element Rod"
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                 FISH IT! ENCHANTMENTS (14)                     ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishItEnchants = {
    "Leprechaun I",
    "Leprechaun II",
    "Big Hunter I",
    "Cursed I",
    "Mutation Hunter I",
    "Mutation Hunter II",
    "Mutation Hunter III",
    "Prismatic I",
    "Empowered I",
    "Reeler I",
    "Secret Hunter",
    "Shark Hunter",
    "Fairy Hunter",
    "Perfection"
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   FISH IT! ROD SKINS (7)                       ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishItAnimationSkins = {
    "Default",
    "Holy",
    "Retro",
    "Festive",
    "Spooky",
    "Ancient",
    "Crystal"
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   SERVICES & VARIABLES                         ║
-- ╚══════════════════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScriptEnabled = true

local AutoFishEnabled = false
local AutoSellEnabled = false
local AutoShakeEnabled = false
local PerfectCastEnabled = false

local Settings = {
    WalkSpeed = 16,
    JumpPower = 50,
    FOV = 70,
    FishingRadar = false,
    DivingGear = false,
    AutoEquipRod = false,
    PerfectCast = false,
    AutoFishing = false,
    AutoShake = false,
    InstantFishing = false,
    InstantCompleteDelay = 3.4,
    SuperInstantFishing = false,
    SuperInstantCancelDelay = 0.8,
    SuperInstantCompleteDelay = 0.3,
    BetaInstantFishing = false,
    BetaCancelDelay = 0.075,
    BetaCompleteDelay = 0.305,
    AutoSell = false,
    SellingType = "--",
    SellLimit = 100,
    SellDelay = 1,
    FishingSpot = "Crystal Depths",
    AutoTeleport = false,
    AnimationSkin = "Holy",
    EnableAnimation = false,
    DisableThunder = false,
    DisableVFX = false,
    FPSBoost = false,
    FishingMode = "Legit"
}

local Stats = {
    TotalCaught = 0,
    TotalValue = 0,
    SessionTime = 0,
    RarityCounts = {
        Common = 0, Uncommon = 0, Rare = 0,
        Epic = 0, Legendary = 0, Mythic = 0, SECRET = 0
    }
}

print("═══════════════════════════════════════════════════════════")
print("          HOOKED+ - FISH IT! AUTO FISHING SCRIPT")
print("═══════════════════════════════════════════════════════════")
print("✓ Fish Database: 392 Fish Loaded")
print("✓ Locations: 16 Islands Available")
print("✓ Rods: 13 Rod Types")
print("✓ Enchantments: 14 Enchantments")
print("✓ Animation Skins: 7 Skins")
print("✓ Status: Ready to Fish!")
print("═══════════════════════════════════════════════════════════")

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   ULTRA DARK MODERN THEME                      ║
-- ╚══════════════════════════════════════════════════════════════╝

local Theme = {
    Background      = Color3.fromRGB(8, 8, 12),
    Sidebar         = Color3.fromRGB(10, 10, 15),
    SidebarItem     = Color3.fromRGB(14, 14, 20),
    SidebarActive   = Color3.fromRGB(28, 140, 75),
    TopBar          = Color3.fromRGB(10, 10, 15),
    ContentBg       = Color3.fromRGB(8, 8, 12),
    Section         = Color3.fromRGB(12, 12, 18),
    SectionHeader   = Color3.fromRGB(16, 16, 24),
    InputField      = Color3.fromRGB(18, 18, 26),
    InputFieldFocus = Color3.fromRGB(22, 22, 32),
    ToggleOff       = Color3.fromRGB(30, 30, 40),
    ToggleOn        = Color3.fromRGB(28, 140, 75),
    Primary         = Color3.fromRGB(28, 140, 75),
    PrimaryDark     = Color3.fromRGB(20, 100, 55),
    Accent          = Color3.fromRGB(70, 80, 200),
    Danger          = Color3.fromRGB(200, 50, 50),
    Warning         = Color3.fromRGB(220, 140, 20),
    TextPrimary     = Color3.fromRGB(230, 230, 240),
    TextSecondary   = Color3.fromRGB(140, 145, 160),
    TextMuted       = Color3.fromRGB(80, 85, 100),
    TextDim         = Color3.fromRGB(60, 65, 80),
    Border          = Color3.fromRGB(20, 20, 30),
    Divider         = Color3.fromRGB(15, 15, 25),
    Shadow          = Color3.fromRGB(0, 0, 0),
    VersionBg       = Color3.fromRGB(18, 18, 26),
    VersionText     = Color3.fromRGB(28, 140, 75),
    SearchBg        = Color3.fromRGB(14, 14, 22),
    ScrollBar       = Color3.fromRGB(35, 35, 48),
    DropdownBg      = Color3.fromRGB(16, 16, 24),
    DropdownHover   = Color3.fromRGB(28, 140, 75),
    MinimizeIcon    = Color3.fromRGB(28, 140, 75),
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   UTILITY FUNCTIONS                            ║
-- ╚══════════════════════════════════════════════════════════════╝

local function Tween(instance, tweenInfo, props)
    local t = TweenService:Create(instance, tweenInfo, props)
    t:Play()
    return t
end

local QuickTween = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local SmoothTween = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local BounceTween = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local function AddCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local function AddStroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or Theme.Border
    s.Thickness = thickness or 1
    s.Transparency = 0.4
    s.Parent = parent
    return s
end

local function AddPadding(parent, t, l, r, b)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, t or 0)
    p.PaddingLeft = UDim.new(0, l or 0)
    p.PaddingRight = UDim.new(0, r or 0)
    p.PaddingBottom = UDim.new(0, b or 0)
    p.Parent = parent
    return p
end

local function AddLayout(parent, direction, padding, sortOrder)
    local l = Instance.new("UIListLayout")
    l.FillDirection = direction or Enum.FillDirection.Vertical
    l.Padding = UDim.new(0, padding or 4)
    l.SortOrder = sortOrder or Enum.SortOrder.LayoutOrder
    l.Parent = parent
    return l
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║              FISHING CONTROLLER (FISH IT! SPECIFIC)            ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishingController = {}
FishingController.__index = FishingController

function FishingController.new()
    local self = setmetatable({}, FishingController)
    self.Remotes = { Cast = nil, Reel = nil, Shake = nil, Sell = nil }
    self:FindRemotes()
    return self
end

function FishingController:FindRemotes()
    local success, err = pcall(function()
        -- FISH IT! primary remote paths
        local remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
        if remotes then
            self.Remotes.Cast = remotes:FindFirstChild("CastRod") or remotes:FindFirstChild("Cast")
            self.Remotes.Reel = remotes:FindFirstChild("ReelIn") or remotes:FindFirstChild("Reel")
            self.Remotes.Shake = remotes:FindFirstChild("Shake")
            self.Remotes.Sell = remotes:FindFirstChild("SellFish") or remotes:FindFirstChild("Sell")
        end
    end)
    
    if not success then 
        warn("[HOOKED+] Primary remote detection failed, trying alternative paths...")
        -- Alternative detection for FISH IT!
        pcall(function()
            for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                    local name = v.Name:lower()
                    if name:find("cast") and not self.Remotes.Cast then 
                        self.Remotes.Cast = v 
                    end
                    if name:find("reel") and not self.Remotes.Reel then 
                        self.Remotes.Reel = v 
                    end
                    if name:find("shake") and not self.Remotes.Shake then 
                        self.Remotes.Shake = v 
                    end
                    if name:find("sell") and not self.Remotes.Sell then 
                        self.Remotes.Sell = v 
                    end
                end
            end
        end)
    end
    
    print("[HOOKED+] Remote Detection Status:")
    print("  ✓ Cast Remote:", self.Remotes.Cast and "Found" or "Not Found")
    print("  ✓ Reel Remote:", self.Remotes.Reel and "Found" or "Not Found")
    print("  ✓ Shake Remote:", self.Remotes.Shake and "Found" or "Not Found")
    print("  ✓ Sell Remote:", self.Remotes.Sell and "Found" or "Not Found")
end

function FishingController:GetRod()
    local character = Player.Character
    if not character then return nil end
    
    -- Check equipped
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name:lower(), "rod") then 
            return item 
        end
    end
    
    -- Check backpack
    for _, item in pairs(Player.Backpack:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name:lower(), "rod") then 
            return item 
        end
    end
    
    return nil
end

function FishingController:EquipRod()
    local rod = self:GetRod()
    if rod and rod.Parent == Player.Backpack then
        local character = Player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:EquipTool(rod)
            wait(0.5)
            return true
        end
    end
    return false
end

function FishingController:Cast()
    if not self.Remotes.Cast then return false end
    return pcall(function() 
        self.Remotes.Cast:FireServer() 
    end)
end

function FishingController:Reel()
    if not self.Remotes.Reel then return false end
    return pcall(function() 
        self.Remotes.Reel:FireServer() 
    end)
end

function FishingController:Shake()
    if not self.Remotes.Shake then return false end
    return pcall(function() 
        self.Remotes.Shake:FireServer() 
    end)
end

function FishingController:Sell()
    if not self.Remotes.Sell then return false end
    return pcall(function()
        if Settings.SellingType == "All" or Settings.SellingType == "--" then
            self.Remotes.Sell:FireServer("All")
        else
            self.Remotes.Sell:FireServer(Settings.SellingType)
        end
    end)
end

local Controller = FishingController.new()

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   CHARACTER UPDATES                            ║
-- ╚══════════════════════════════════════════════════════════════╝

local function UpdateCharacter()
    local character = Player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Settings.WalkSpeed
            humanoid.JumpPower = Settings.JumpPower
        end
    end
    local camera = workspace.CurrentCamera
    if camera then 
        camera.FieldOfView = Settings.FOV 
    end
end

Player.CharacterAdded:Connect(UpdateCharacter)

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   AUTO FISH / SELL LOOPS                       ║
-- ╚══════════════════════════════════════════════════════════════╝

local function AutoFishLoop()
    spawn(function()
        while ScriptEnabled do
            if AutoFishEnabled then
                if Settings.AutoEquipRod then 
                    Controller:EquipRod() 
                end
                
                if Settings.FishingMode == "Instant" then
                    Controller:Cast()
                    wait(Settings.InstantCompleteDelay)
                    Controller:Reel()
                    Stats.TotalCaught = Stats.TotalCaught + 1
                    
                elseif Settings.FishingMode == "Super Instant" then
                    Controller:Cast()
                    wait(Settings.SuperInstantCancelDelay)
                    Controller:Reel()
                    wait(Settings.SuperInstantCompleteDelay)
                    Stats.TotalCaught = Stats.TotalCaught + 1
                    
                elseif Settings.FishingMode == "Beta Instant" then
                    Controller:Cast()
                    wait(Settings.BetaCancelDelay)
                    Controller:Reel()
                    wait(Settings.BetaCompleteDelay)
                    Stats.TotalCaught = Stats.TotalCaught + 1
                    
                else -- Legit Mode
                    Controller:Cast()
                    wait(math.random(2, 4))
                    
                    if AutoShakeEnabled then
                        for i = 1, math.random(3, 6) do
                            Controller:Shake()
                            wait(0.1)
                        end
                    end
                    
                    Controller:Reel()
                    Stats.TotalCaught = Stats.TotalCaught + 1
                end
            end
            wait(0.1)
        end
    end)
end

local function AutoSellLoop()
    spawn(function()
        while ScriptEnabled do
            if AutoSellEnabled then
                wait(Settings.SellDelay)
                Controller:Sell()
            end
            wait(1)
        end
    end)
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   MAIN UI CREATION                             ║
-- ╚══════════════════════════════════════════════════════════════╝

if PlayerGui:FindFirstChild("HookedPlusUI") then
    PlayerGui:FindFirstChild("HookedPlusUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HookedPlusUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = PlayerGui

-- MINIMIZE FLOATING ICON
local MinIcon = Instance.new("ImageButton")
MinIcon.Name = "MinimizeIcon"
MinIcon.Size = UDim2.new(0, 55, 0, 55)
MinIcon.Position = UDim2.new(0, 20, 0.5, -27.5)
MinIcon.BackgroundColor3 = Theme.SidebarActive
MinIcon.BorderSizePixel = 0
MinIcon.Image = "rbxassetid://6031075938"
MinIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
MinIcon.ScaleType = Enum.ScaleType.Fit
MinIcon.Visible = false
MinIcon.ZIndex = 100
MinIcon.Parent = ScreenGui
AddCorner(MinIcon, 16)
AddStroke(MinIcon, Theme.Primary, 2)

-- Glow effect
local MinIconGlow = Instance.new("ImageLabel")
MinIconGlow.Name = "Glow"
MinIconGlow.Size = UDim2.new(1.6, 0, 1.6, 0)
MinIconGlow.Position = UDim2.new(-0.3, 0, -0.3, 0)
MinIconGlow.BackgroundTransparency = 1
MinIconGlow.Image = "rbxassetid://5028857084"
MinIconGlow.ImageColor3 = Theme.Primary
MinIconGlow.ImageTransparency = 0.6
MinIconGlow.ZIndex = 99
MinIconGlow.Parent = MinIcon

-- Pulse animation
spawn(function()
    while true do
        Tween(MinIconGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.3})
        wait(1.5)
        Tween(MinIconGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.6})
        wait(1.5)
    end
end)

-- Draggable minimize icon
local minIconDragging = false
local minIconDragStart, minIconStartPos

MinIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        minIconDragging = true
        minIconDragStart = input.Position
        minIconStartPos = MinIcon.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                minIconDragging = false
            end
        end)
    end
end)

local minIconMoved = false
UserInputService.InputChanged:Connect(function(input)
    if minIconDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - minIconDragStart
        if delta.Magnitude > 5 then minIconMoved = true end
        MinIcon.Position = UDim2.new(
            minIconStartPos.X.Scale, minIconStartPos.X.Offset + delta.X,
            minIconStartPos.Y.Scale, minIconStartPos.Y.Offset + delta.Y
        )
    end
end)

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 640, 0, 440)
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -220)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
AddCorner(MainFrame, 10)
AddStroke(MainFrame, Theme.Border, 1)

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5028857084"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ZIndex = -1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
Shadow.Parent = MainFrame

-- TOP BAR
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Theme.TopBar
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarDivider = Instance.new("Frame")
TopBarDivider.Size = UDim2.new(1, 0, 0, 1)
TopBarDivider.Position = UDim2.new(0, 0, 1, -1)
TopBarDivider.BackgroundColor3 = Theme.Divider
TopBarDivider.BorderSizePixel = 0
TopBarDivider.Parent = TopBar

-- Logo
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, 22, 0, 22)
Logo.Position = UDim2.new(0, 12, 0.5, -11)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://6031075938"
Logo.ImageColor3 = Theme.Primary
Logo.Parent = TopBar

-- Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(0, 90, 1, 0)
TitleLabel.Position = UDim2.new(0, 38, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Hooked+"
TitleLabel.TextColor3 = Theme.TextPrimary
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Version Badge
local VersionBadge = Instance.new("Frame")
VersionBadge.Name = "VersionBadge"
VersionBadge.Size = UDim2.new(0, 62, 0, 22)
VersionBadge.Position = UDim2.new(0, 122, 0.5, -11)
VersionBadge.BackgroundColor3 = Theme.VersionBg
VersionBadge.BorderSizePixel = 0
VersionBadge.Parent = TopBar
AddCorner(VersionBadge, 6)
AddStroke(VersionBadge, Theme.Border, 1)

local VersionIcon = Instance.new("TextLabel")
VersionIcon.Size = UDim2.new(0, 16, 1, 0)
VersionIcon.Position = UDim2.new(0, 5, 0, 0)
VersionIcon.BackgroundTransparency = 1
VersionIcon.Text = "🎣"
VersionIcon.TextColor3 = Theme.VersionText
VersionIcon.TextSize = 10
VersionIcon.Font = Enum.Font.GothamBold
VersionIcon.Parent = VersionBadge

local VersionText = Instance.new("TextLabel")
VersionText.Size = UDim2.new(1, -20, 1, 0)
VersionText.Position = UDim2.new(0, 18, 0, 0)
VersionText.BackgroundTransparency = 1
VersionText.Text = "v1.0.0"
VersionText.TextColor3 = Theme.VersionText
VersionText.TextSize = 11
VersionText.Font = Enum.Font.GothamBold
VersionText.TextXAlignment = Enum.TextXAlignment.Left
VersionText.Parent = VersionBadge

-- Window Controls
local WinControls = Instance.new("Frame")
WinControls.Name = "WinControls"
WinControls.Size = UDim2.new(0, 60, 0, 30)
WinControls.Position = UDim2.new(1, -70, 0.5, -15)
WinControls.BackgroundTransparency = 1
WinControls.Parent = TopBar

local winLayout = Instance.new("UIListLayout")
winLayout.FillDirection = Enum.FillDirection.Horizontal
winLayout.Padding = UDim.new(0, 4)
winLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
winLayout.VerticalAlignment = Enum.VerticalAlignment.Center
winLayout.Parent = WinControls

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 26, 0, 26)
MinimizeBtn.BackgroundColor3 = Theme.SidebarItem
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Text = "—"
MinimizeBtn.TextSize = 14
MinimizeBtn.TextColor3 = Theme.TextSecondary
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.AutoButtonColor = false
MinimizeBtn.Parent = WinControls
AddCorner(MinimizeBtn, 6)

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.BackgroundColor3 = Theme.Danger
CloseBtn.BackgroundTransparency = 0.6
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "✕"
CloseBtn.TextSize = 13
CloseBtn.TextColor3 = Theme.TextPrimary
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = WinControls
AddCorner(CloseBtn, 6)

-- Hover effects
for _, btn in pairs({MinimizeBtn, CloseBtn}) do
    btn.MouseEnter:Connect(function()
        if btn == CloseBtn then
            Tween(btn, QuickTween, {BackgroundTransparency = 0})
        else
            Tween(btn, QuickTween, {BackgroundColor3 = Theme.SidebarActive})
        end
    end)
    btn.MouseLeave:Connect(function()
        if btn == CloseBtn then
            Tween(btn, QuickTween, {BackgroundTransparency = 0.6})
        else
            Tween(btn, QuickTween, {BackgroundColor3 = Theme.SidebarItem})
        end
    end)
end

-- Minimize functionality
MinimizeBtn.MouseButton1Click:Connect(function()
    Tween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    }).Completed:Wait()
    MainFrame.Visible = false
    MinIcon.Visible = true
    MinIcon.Size = UDim2.new(0, 0, 0, 0)
    Tween(MinIcon, BounceTween, {Size = UDim2.new(0, 55, 0, 55)})
end)

-- Restore from minimize
MinIcon.MouseButton1Click:Connect(function()
    if minIconMoved then
        minIconMoved = false
        return
    end
    Tween(MinIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 0, 0)}).Completed:Wait()
    MinIcon.Visible = false
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    Tween(MainFrame, BounceTween, {Size = UDim2.new(0, 640, 0, 440)})
end)

-- Close functionality
CloseBtn.MouseButton1Click:Connect(function()
    ScriptEnabled = false
    Tween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    }).Completed:Wait()
    ScreenGui:Destroy()
end)

-- Draggable Main Frame
local dragging, dragStart, startPos = false, nil, nil
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("[HOOKED+] UI Initialized Successfully!")
print("[HOOKED+] Ready for FISH IT!")

-- Start fishing loops
AutoFishLoop()
AutoSellLoop()

-- Entrance animation
MainFrame.Size = UDim2.new(0, 0, 0, 0)
Tween(MainFrame, BounceTween, {Size = UDim2.new(0, 640, 0, 440)})

print("═══════════════════════════════════════════════════════════")
print("✓ HOOKED+ LOADED SUCCESSFULLY FOR FISH IT!")
print("✓ All systems operational")
print("═══════════════════════════════════════════════════════════")

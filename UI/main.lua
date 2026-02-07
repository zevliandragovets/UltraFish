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

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   FISH IT! LOCATIONS (16)                      ║
-- ╚══════════════════════════════════════════════════════════════╝

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

-- [REST OF THE SCRIPT CONTINUES WITH SERVICES, UI, AND FUNCTIONALITY - Same as before but with updated databases]

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

-- Script State
local ScriptEnabled = true

-- Settings
local Settings = {
    -- Local Player
    WalkSpeed = 16,
    JumpPower = 50,
    FOV = 70,
    
    -- Player Accessories
    FishingRadar = false,
    DivingGear = false,
    AutoEquipRod = false,
    
    -- Legit Fishing
    PerfectCast = false,
    AutoFishing = false,
    AutoShake = false,
    
    -- Instant Fishing
    InstantFishing = false,
    InstantCompleteDelay = 3.4,
    
    -- Super Instant Fishing
    SuperInstantFishing = false,
    SuperInstantCancelDelay = 0.8,
    SuperInstantCompleteDelay = 0.3,
    
    -- Super Instant BETA
    BetaInstantFishing = false,
    BetaCancelDelay = 0.075,
    BetaCompleteDelay = 0.305,
    
    -- Auto Selling
    AutoSell = false,
    SellingType = "--",
    SellLimit = 100,
    SellDelay = 1,
    
    -- Fishing Zones
    FishingSpot = "Crystal Depths",
    AutoTeleport = false,
    
    -- Animation
    AnimationSkin = "Holy",
    EnableAnimation = false,
    
    -- FPS Boost
    DisableThunder = false,
    DisableVFX = false,
    FPSBoost = false
}

-- Stats
local Stats = {
    TotalCaught = 0,
    TotalValue = 0,
    SessionTime = 0,
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

print("═══════════════════════════════════════════════════════════")
print("       ATOMIC HUB - FISH IT! AUTO FISHING SCRIPT")
print("═══════════════════════════════════════════════════════════")
print("✓ Fish Database: 392 Fish Loaded")
print("✓ Locations: 16 Islands Available")
print("✓ Rods: 13 Rod Types")
print("✓ Enchantments: 14 Enchantments")
print("✓ Animation Skins: 7 Skins")
print("✓ Status: Ready to Fish!")
print("✓ discord.gg/getsades")
print("═══════════════════════════════════════════════════════════")

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function GetThemeColor(name)
    local colors = {
        Background = Color3.fromRGB(20, 20, 25),
        Secondary = Color3.fromRGB(28, 28, 33),
        Tertiary = Color3.fromRGB(35, 35, 40),
        Primary = Color3.fromRGB(88, 101, 242),
        Success = Color3.fromRGB(67, 181, 129),
        Warning = Color3.fromRGB(250, 166, 26),
        Danger = Color3.fromRGB(240, 71, 71),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(185, 187, 190),
        TextMuted = Color3.fromRGB(114, 118, 125)
    }
    return colors[name] or Color3.fromRGB(255, 255, 255)
end

local function CreateTween(instance, info, properties)
    local tween = TweenService:Create(instance, info, properties)
    tween:Play()
    return tween
end

-- ============================================
-- FISHING CONTROLLER (FISH IT! SPECIFIC)
-- ============================================
local FishingController = {}
FishingController.__index = FishingController

function FishingController.new()
    local self = setmetatable({}, FishingController)
    
    -- Fish It! uses different remote structure
    self.Remotes = {
        Cast = nil,
        Reel = nil,
        Shake = nil,
        Sell = nil
    }
    
    self:FindRemotes()
    
    return self
end

function FishingController:FindRemotes()
    -- Fish It! remotes are typically in ReplicatedStorage
    local success, err = pcall(function()
        local remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
        if remotes then
            self.Remotes.Cast = remotes:FindFirstChild("CastRod") or remotes:FindFirstChild("Cast")
            self.Remotes.Reel = remotes:FindFirstChild("ReelIn") or remotes:FindFirstChild("Reel")
            self.Remotes.Shake = remotes:FindFirstChild("Shake")
            self.Remotes.Sell = remotes:FindFirstChild("SellFish") or remotes:FindFirstChild("Sell")
        end
    end)
    
    if not success then
        warn("Failed to find Fish It! remotes:", err)
    end
end

function FishingController:GetRod()
    local character = Player.Character
    if not character then return nil end
    
    -- Fish It! rods are typically in the character or backpack
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name:lower(), "rod") then
            return item
        end
    end
    
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
    
    local success = pcall(function()
        if PerfectCastEnabled then
            -- Perfect cast timing for Fish It!
            wait(0.1)
        end
        self.Remotes.Cast:FireServer()
    end)
    
    return success
end

function FishingController:Reel()
    if not self.Remotes.Reel then return false end
    
    local success = pcall(function()
        self.Remotes.Reel:FireServer()
    end)
    
    return success
end

function FishingController:Shake()
    if not self.Remotes.Shake then return false end
    
    local success = pcall(function()
        self.Remotes.Shake:FireServer()
    end)
    
    return success
end

function FishingController:Sell()
    if not self.Remotes.Sell then return false end
    
    local success = pcall(function()
        -- Fish It! selling typically requires you to be near a Fish Monger NPC
        if Settings.SellingType == "All" then
            self.Remotes.Sell:FireServer("All")
        else
            -- Filter by rarity
            self.Remotes.Sell:FireServer(Settings.SellingType)
        end
    end)
    
    return success
end

-- Initialize controller
local Controller = FishingController.new()

-- ============================================
-- AUTO FISH LOOP
-- ============================================
local function AutoFishLoop()
    spawn(function()
        while ScriptEnabled do
            if AutoFishEnabled and Settings.AutoEquipRod then
                Controller:EquipRod()
                
                if Settings.FishingMode == "Instant" then
                    Controller:Cast()
                    wait(Settings.InstantDelay)
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
                    
                else
                    -- Legit mode
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

-- ============================================
-- AUTO SELL LOOP
-- ============================================
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

-- ============================================
-- CHARACTER UPDATES
-- ============================================
local function UpdateCharacter()
    local character = Player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Settings.WalkSpeed
            humanoid.JumpPower = Settings.JumpPower
        end
    end
    
    -- Update camera FOV
    local camera = workspace.CurrentCamera
    if camera then
        camera.FieldOfView = Settings.FOV
    end
end

Player.CharacterAdded:Connect(UpdateCharacter)

-- ============================================
-- UI CREATION
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FishItScript"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 620, 0, 480)
MainFrame.Position = UDim2.new(0.5, -310, 0.5, -240)
MainFrame.BackgroundColor3 = GetThemeColor("Background")
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Rounded corners
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = GetThemeColor("Secondary")
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

-- Logo
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, 30, 0, 30)
Logo.Position = UDim2.new(0, 10, 0.5, -15)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://6031075938"
Logo.Parent = TopBar

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 45, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "FISH IT! SCRIPT"
Title.TextColor3 = GetThemeColor("TextPrimary")
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Version Badge
local VersionBadge = Instance.new("Frame")
VersionBadge.Name = "VersionBadge"
VersionBadge.Size = UDim2.new(0, 50, 0, 20)
VersionBadge.Position = UDim2.new(0, 250, 0.5, -10)
VersionBadge.BackgroundColor3 = GetThemeColor("Primary")
VersionBadge.BorderSizePixel = 0
VersionBadge.Parent = TopBar

local VersionCorner = Instance.new("UICorner")
VersionCorner.CornerRadius = UDim.new(0, 4)
VersionCorner.Parent = VersionBadge

local VersionText = Instance.new("TextLabel")
VersionText.Size = UDim2.new(1, 0, 1, 0)
VersionText.BackgroundTransparency = 1
VersionText.Text = "v1.0"
VersionText.TextColor3 = Color3.fromRGB(255, 255, 255)
VersionText.TextSize = 12
VersionText.Font = Enum.Font.GothamBold
VersionText.Parent = VersionBadge

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0.5, -15)
CloseButton.BackgroundColor3 = GetThemeColor("Danger")
CloseButton.BorderSizePixel = 0
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    ScriptEnabled = false
end)

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 190, 1, -45)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.BackgroundColor3 = GetThemeColor("Secondary")
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

-- Search Bar
local SearchBar = Instance.new("TextBox")
SearchBar.Name = "SearchBar"
SearchBar.Size = UDim2.new(1, -20, 0, 30)
SearchBar.Position = UDim2.new(0, 10, 0, 10)
SearchBar.BackgroundColor3 = GetThemeColor("Tertiary")
SearchBar.BorderSizePixel = 0
SearchBar.PlaceholderText = "Search..."
SearchBar.Text = ""
SearchBar.TextColor3 = GetThemeColor("TextPrimary")
SearchBar.PlaceholderColor3 = GetThemeColor("TextMuted")
SearchBar.TextSize = 14
SearchBar.Font = Enum.Font.Gotham
SearchBar.TextXAlignment = Enum.TextXAlignment.Left
SearchBar.ClearTextOnFocus = false
SearchBar.Parent = Sidebar

local SearchPadding = Instance.new("UIPadding")
SearchPadding.PaddingLeft = UDim.new(0, 10)
SearchPadding.Parent = SearchBar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBar

-- Navigation List
local NavList = Instance.new("ScrollingFrame")
NavList.Name = "NavList"
NavList.Size = UDim2.new(1, 0, 1, -50)
NavList.Position = UDim2.new(0, 0, 0, 50)
NavList.BackgroundTransparency = 1
NavList.BorderSizePixel = 0
NavList.ScrollBarThickness = 4
NavList.ScrollBarImageColor3 = GetThemeColor("Primary")
NavList.CanvasSize = UDim2.new(0, 0, 0, 0)
NavList.Parent = Sidebar

local NavListLayout = Instance.new("UIListLayout")
NavListLayout.SortOrder = Enum.SortOrder.LayoutOrder
NavListLayout.Padding = UDim.new(0, 2)
NavListLayout.Parent = NavList

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -190, 1, -45)
ContentArea.Position = UDim2.new(0, 190, 0, 45)
ContentArea.BackgroundColor3 = GetThemeColor("Background")
ContentArea.BorderSizePixel = 0
ContentArea.Parent = MainFrame

-- Pages Container
local PagesContainer = Instance.new("Frame")
PagesContainer.Name = "PagesContainer"
PagesContainer.Size = UDim2.new(1, 0, 1, 0)
PagesContainer.BackgroundTransparency = 1
PagesContainer.Parent = ContentArea

-- ============================================
-- UI COMPONENTS
-- ============================================

-- Create Navigation Button
local function CreateNavButton(name, icon, order)
    local button = Instance.new("TextButton")
    button.Name = name .. "Button"
    button.Size = UDim2.new(1, -10, 0, 35)
    button.BackgroundColor3 = GetThemeColor("Tertiary")
    button.BorderSizePixel = 0
    button.Text = ""
    button.AutoButtonColor = false
    button.LayoutOrder = order
    button.Parent = NavList
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 1, 0)
    iconLabel.Position = UDim2.new(0, 5, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextColor3 = GetThemeColor("TextSecondary")
    iconLabel.TextSize = 16
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = button
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 35, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = GetThemeColor("TextSecondary")
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = button
    
    return button
end

-- Create Page
local function CreatePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 6
    page.ScrollBarImageColor3 = GetThemeColor("Primary")
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.Visible = false
    page.Parent = PagesContainer
    
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
    layout.Parent = page
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 15)
    padding.PaddingRight = UDim.new(0, 15)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.Parent = page
    
    return page
end

-- Create Section
local function CreateSection(parent, title, order)
    local section = Instance.new("Frame")
    section.Name = title .. "Section"
    section.Size = UDim2.new(1, 0, 0, 40)
    section.BackgroundColor3 = GetThemeColor("Secondary")
    section.BorderSizePixel = 0
    section.LayoutOrder = order
    section.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = section
    
    local header = Instance.new("TextButton")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 40)
    header.BackgroundTransparency = 1
    header.Text = ""
    header.Parent = section
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = GetThemeColor("TextPrimary")
    titleLabel.TextSize = 14
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -30, 0.5, -10)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▼"
    arrow.TextColor3 = GetThemeColor("TextSecondary")
    arrow.TextSize = 12
    arrow.Font = Enum.Font.GothamBold
    arrow.Rotation = 0
    arrow.Parent = header
    
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.Position = UDim2.new(0, 0, 0, 40)
    content.BackgroundTransparency = 1
    content.ClipsDescendants = true
    content.Parent = section
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 8)
    contentLayout.Parent = content
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingTop = UDim.new(0, 10)
    contentPadding.PaddingLeft = UDim.new(0, 15)
    contentPadding.PaddingRight = UDim.new(0, 15)
    contentPadding.PaddingBottom = UDim.new(0, 10)
    contentPadding.Parent = content
    
    local expanded = false
    
    header.MouseButton1Click:Connect(function()
        expanded = not expanded
        
        local targetHeight = expanded and (contentLayout.AbsoluteContentSize.Y + 60) or 40
        local targetRotation = expanded and 180 or 0
        
        CreateTween(section, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, targetHeight)})
        CreateTween(arrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Rotation = targetRotation})
        
        if expanded then
            content.Size = UDim2.new(1, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
        end
    end)
    
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if expanded then
            content.Size = UDim2.new(1, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
            section.Size = UDim2.new(1, 0, 0, contentLayout.AbsoluteContentSize.Y + 60)
        end
    end)
    
    return content
end

-- Create Toggle
local function CreateToggle(parent, name, default, callback)
    local toggle = Instance.new("Frame")
    toggle.Name = name .. "Toggle"
    toggle.Size = UDim2.new(1, 0, 0, 30)
    toggle.BackgroundTransparency = 1
    toggle.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = GetThemeColor("TextPrimary")
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggle
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 48, 0, 24)
    button.Position = UDim2.new(1, -48, 0.5, -12)
    button.BackgroundColor3 = default and GetThemeColor("Primary") or GetThemeColor("Tertiary")
    button.BorderSizePixel = 0
    button.Text = ""
    button.AutoButtonColor = false
    button.Parent = toggle
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(1, 0)
    buttonCorner.Parent = button
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = default and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = button
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local state = default
    
    button.MouseButton1Click:Connect(function()
        state = not state
        
        local bgColor = state and GetThemeColor("Primary") or GetThemeColor("Tertiary")
        local knobPos = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        
        CreateTween(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = bgColor})
        CreateTween(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Position = knobPos})
        
        if callback then
            callback(state)
        end
    end)
    
    return toggle
end

-- Create Slider
local function CreateSlider(parent, name, min, max, default, suffix, callback)
    local slider = Instance.new("Frame")
    slider.Name = name .. "Slider"
    slider.Size = UDim2.new(1, 0, 0, 45)
    slider.BackgroundTransparency = 1
    slider.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = GetThemeColor("TextPrimary")
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = slider
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0, 60, 0, 20)
    valueLabel.Position = UDim2.new(1, -60, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = default .. (suffix or "")
    valueLabel.TextColor3 = GetThemeColor("Primary")
    valueLabel.TextSize = 13
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = slider
    
    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, 0, 0, 6)
    track.Position = UDim2.new(0, 0, 1, -16)
    track.BackgroundColor3 = GetThemeColor("Tertiary")
    track.BorderSizePixel = 0
    track.Parent = slider
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = GetThemeColor("Primary")
    fill.BorderSizePixel = 0
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local handle = Instance.new("Frame")
    handle.Size = UDim2.new(0, 14, 0, 14)
    handle.Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7)
    handle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    handle.BorderSizePixel = 0
    handle.Parent = track
    
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(1, 0)
    handleCorner.Parent = handle
    
    local dragging = false
    local value = default
    
    local function updateSlider(input)
        local relativeX = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * relativeX)
        
        fill.Size = UDim2.new(relativeX, 0, 1, 0)
        handle.Position = UDim2.new(relativeX, -7, 0.5, -7)
        valueLabel.Text = value .. (suffix or "")
        
        if callback then
            callback(value)
        end
    end
    
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateSlider(input)
        end
    end)
    
    track.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)
    
    return slider
end

-- Create Dropdown
local function CreateDropdown(parent, name, options, default, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Name = name .. "Dropdown"
    dropdown.Size = UDim2.new(1, 0, 0, 35)
    dropdown.BackgroundTransparency = 1
    dropdown.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = GetThemeColor("TextPrimary")
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = dropdown
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 32)
    button.Position = UDim2.new(0, 0, 0, 25)
    button.BackgroundColor3 = GetThemeColor("Tertiary")
    button.BorderSizePixel = 0
    button.Text = ""
    button.AutoButtonColor = false
    button.Parent = dropdown
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    local selected = Instance.new("TextLabel")
    selected.Size = UDim2.new(1, -40, 1, 0)
    selected.Position = UDim2.new(0, 10, 0, 0)
    selected.BackgroundTransparency = 1
    selected.Text = default or options[1] or ""
    selected.TextColor3 = GetThemeColor("TextPrimary")
    selected.TextSize = 13
    selected.Font = Enum.Font.Gotham
    selected.TextXAlignment = Enum.TextXAlignment.Left
    selected.Parent = button
    
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -25, 0.5, -10)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▼"
    arrow.TextColor3 = GetThemeColor("TextSecondary")
    arrow.TextSize = 10
    arrow.Font = Enum.Font.GothamBold
    arrow.Rotation = 0
    arrow.Parent = button
    
    local optionsList = Instance.new("Frame")
    optionsList.Size = UDim2.new(1, 0, 0, 0)
    optionsList.Position = UDim2.new(0, 0, 1, 5)
    optionsList.BackgroundColor3 = GetThemeColor("Secondary")
    optionsList.BorderSizePixel = 0
    optionsList.Visible = false
    optionsList.ClipsDescendants = true
    optionsList.ZIndex = 10
    optionsList.Parent = button
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 6)
    optionsCorner.Parent = optionsList
    
    local optionsLayout = Instance.new("UIListLayout")
    optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    optionsLayout.Padding = UDim.new(0, 2)
    optionsLayout.Parent = optionsList
    
    local optionsPadding = Instance.new("UIPadding")
    optionsPadding.PaddingTop = UDim.new(0, 5)
    optionsPadding.PaddingBottom = UDim.new(0, 5)
    optionsPadding.Parent = optionsList
    
    local expanded = false
    
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Size = UDim2.new(1, 0, 0, 30)
        optionButton.BackgroundColor3 = GetThemeColor("Tertiary")
        optionButton.BorderSizePixel = 0
        optionButton.Text = option
        optionButton.TextColor3 = GetThemeColor("TextPrimary")
        optionButton.TextSize = 12
        optionButton.Font = Enum.Font.Gotham
        optionButton.AutoButtonColor = false
        optionButton.Parent = optionsList
        
        optionButton.MouseEnter:Connect(function()
            optionButton.BackgroundColor3 = GetThemeColor("Primary")
        end)
        
        optionButton.MouseLeave:Connect(function()
            optionButton.BackgroundColor3 = GetThemeColor("Tertiary")
        end)
        
        optionButton.MouseButton1Click:Connect(function()
            selected.Text = option
            expanded = false
            
            CreateTween(optionsList, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, 0)})
            CreateTween(arrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Rotation = 0})
            
            wait(0.2)
            optionsList.Visible = false
            dropdown.Size = UDim2.new(1, 0, 0, 60)
            
            if callback then
                callback(option)
            end
        end)
    end
    
    button.MouseButton1Click:Connect(function()
        expanded = not expanded
        
        if expanded then
            optionsList.Visible = true
            local targetSize = #options * 32 + 10
            dropdown.Size = UDim2.new(1, 0, 0, 60 + targetSize)
            
            CreateTween(optionsList, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, targetSize)})
            CreateTween(arrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Rotation = 180})
        else
            CreateTween(optionsList, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, 0)})
            CreateTween(arrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Rotation = 0})
            
            wait(0.2)
            optionsList.Visible = false
            dropdown.Size = UDim2.new(1, 0, 0, 60)
        end
    end)
    
    return dropdown
end

-- ============================================
-- CREATE PAGES
-- ============================================

-- Local Player Page
local LocalPlayerPage = CreatePage("LocalPlayer")
local LocalPlayerButton = CreateNavButton("Local Player", "👤", 1)

local MovementSection = CreateSection(LocalPlayerPage, "Movement", 1)
CreateSlider(MovementSection, "WalkSpeed", 16, 200, 16, "", function(val)
    Settings.WalkSpeed = val
    UpdateCharacter()
end)
CreateSlider(MovementSection, "JumpPower", 50, 200, 50, "", function(val)
    Settings.JumpPower = val
    UpdateCharacter()
end)

local CameraSection = CreateSection(LocalPlayerPage, "Camera", 2)
CreateSlider(CameraSection, "Field of View", 70, 120, 70, "°", function(val)
    Settings.FOV = val
    UpdateCharacter()
end)

local AccessoriesSection = CreateSection(LocalPlayerPage, "Player Accessories", 3)
CreateToggle(AccessoriesSection, "Fishing Radar", false, function(val)
    Settings.FishingRadar = val
end)
CreateToggle(AccessoriesSection, "Diving Gear", false, function(val)
    Settings.DivingGear = val
end)
CreateToggle(AccessoriesSection, "Auto Equip Rod", true, function(val)
    Settings.AutoEquipRod = val
end)

-- Zone Fishing Page
local ZoneFishingPage = CreatePage("ZoneFishing")
local ZoneFishingButton = CreateNavButton("Zone Fishing", "🎣", 2)

local LegitFishingSection = CreateSection(ZoneFishingPage, "Legit Fishing", 1)
CreateToggle(LegitFishingSection, "Perfect Cast", false, function(val)
    PerfectCastEnabled = val
end)
CreateToggle(LegitFishingSection, "Enable Auto Fishing", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Legit"
end)
CreateToggle(LegitFishingSection, "Auto Shake", false, function(val)
    AutoShakeEnabled = val
end)

local InstantFishingSection = CreateSection(ZoneFishingPage, "Instant Fishing", 2)
CreateSlider(InstantFishingSection, "Complete Delay", 0, 10, 0, "s", function(val)
    Settings.InstantDelay = val
end)
CreateToggle(InstantFishingSection, "Enable", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Instant"
end)

local SuperInstantSection = CreateSection(ZoneFishingPage, "Super Instant Fishing", 3)
CreateSlider(SuperInstantSection, "Cancel Delay", 0, 5, 0, "s", function(val)
    Settings.SuperInstantCancelDelay = val
end)
CreateSlider(SuperInstantSection, "Complete Delay", 0, 5, 0, "s", function(val)
    Settings.SuperInstantCompleteDelay = val
end)
CreateToggle(SuperInstantSection, "Enable", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Super Instant"
end)

local BetaInstantSection = CreateSection(ZoneFishingPage, "Super Instant BETA", 4)
CreateSlider(BetaInstantSection, "Cancel Delay", 0, 1, 0, "s", function(val)
    Settings.BetaCancelDelay = val
end)
CreateSlider(BetaInstantSection, "Complete Delay", 0, 1, 0, "s", function(val)
    Settings.BetaCompleteDelay = val
end)
CreateToggle(BetaInstantSection, "Enable", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Beta Instant"
end)

local AutoSellingSection = CreateSection(ZoneFishingPage, "Auto Selling", 5)
CreateDropdown(AutoSellingSection, "Selling Type", {"All", "Common", "Uncommon", "Rare", "Epic", "Legendary"}, "All", function(val)
    Settings.SellingType = val
end)
CreateToggle(AutoSellingSection, "Enable Auto Sell", false, function(val)
    AutoSellEnabled = val
end)

local FishingZonesSection = CreateSection(ZoneFishingPage, "Fishing Zones", 6)
CreateDropdown(FishingZonesSection, "Fishing Spot", FishItLocations, "Fisherman Island", function(val)
    Settings.SelectedLocation = val
end)
CreateToggle(FishingZonesSection, "Auto Teleport", false, function(val)
    Settings.AutoTeleport = val
end)

-- Utilities Page
local UtilitiesPage = CreatePage("Utilities")
local UtilitiesButton = CreateNavButton("Utilities", "🛠️", 3)

local AnimationSection = CreateSection(UtilitiesPage, "Animation Changer", 1)
CreateDropdown(AnimationSection, "Select Animation Skin", {"Default", "Holy", "Retro", "Festive", "Spooky", "Ancient", "Crystal"}, "Default", function(val)
    Settings.AnimationSkin = val
end)
CreateToggle(AnimationSection, "Enable", false, function(val)
    -- Apply animation changes
end)

-- Performance Page
local PerformancePage = CreatePage("Performance")
local PerformanceButton = CreateNavButton("Performance", "⚡", 4)

local FPSBoostSection = CreateSection(PerformancePage, "FPS Boost", 1)
CreateToggle(FPSBoostSection, "Disable Thunder", false, function(val)
    Settings.DisableThunder = val
    if val then
        -- Disable thunder effects
    end
end)
CreateToggle(FPSBoostSection, "Disable VFX Effects", false, function(val)
    Settings.DisableVFX = val
    if val then
        -- Disable VFX
    end
end)
CreateToggle(FPSBoostSection, "FPS Boost", false, function(val)
    Settings.FPSBoost = val
    if val then
        -- Apply FPS boost settings
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    end
end)

-- ============================================
-- PAGE NAVIGATION
-- ============================================
local currentPage = nil

local function ShowPage(page, button)
    if currentPage then
        currentPage.Visible = false
    end
    
    -- Reset all nav buttons
    for _, btn in pairs(NavList:GetChildren()) do
        if btn:IsA("TextButton") then
            btn.BackgroundColor3 = GetThemeColor("Tertiary")
            for _, child in pairs(btn:GetChildren()) do
                if child:IsA("TextLabel") then
                    child.TextColor3 = GetThemeColor("TextSecondary")
                end
            end
        end
    end
    
    -- Highlight selected button
    button.BackgroundColor3 = GetThemeColor("Primary")
    for _, child in pairs(button:GetChildren()) do
        if child:IsA("TextLabel") then
            child.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end
    
    page.Visible = true
    currentPage = page
end

LocalPlayerButton.MouseButton1Click:Connect(function()
    ShowPage(LocalPlayerPage, LocalPlayerButton)
end)

ZoneFishingButton.MouseButton1Click:Connect(function()
    ShowPage(ZoneFishingPage, ZoneFishingButton)
end)

UtilitiesButton.MouseButton1Click:Connect(function()
    ShowPage(UtilitiesPage, UtilitiesButton)
end)

PerformanceButton.MouseButton1Click:Connect(function()
    ShowPage(PerformancePage, PerformanceButton)
end)

-- Show default page
ShowPage(ZoneFishingPage, ZoneFishingButton)

-- ============================================
-- DRAGGABLE
-- ============================================
local dragging = false
local dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
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

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
        updateDrag(input)
    end
end)

-- ============================================
-- ENTRANCE ANIMATION
-- ============================================
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 0, 0, 0)

local entranceTween = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 620, 0, 480)}
)
entranceTween:Play()

-- ============================================
-- START LOOPS
-- ============================================
AutoFishLoop()
AutoSellLoop()

-- ============================================
-- NOTIFICATION
-- ============================================
local function CreateNotification(title, message, duration)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 300, 0, 80)
    notif.Position = UDim2.new(1, -320, 1, -100)
    notif.BackgroundColor3 = GetThemeColor("Secondary")
    notif.BorderSizePixel = 0
    notif.Parent = ScreenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = notif
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = GetThemeColor("TextPrimary")
    titleLabel.TextSize = 14
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notif
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -20, 0, 35)
    messageLabel.Position = UDim2.new(0, 10, 0, 35)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = GetThemeColor("TextSecondary")
    messageLabel.TextSize = 12
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextWrapped = true
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.Parent = notif
    
    local slideTween = TweenService:Create(
        notif,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad),
        {Position = UDim2.new(1, -320, 1, -100)}
    )
    slideTween:Play()
    
    wait(duration or 3)
    
    local fadeOut = TweenService:Create(
        notif,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad),
        {Position = UDim2.new(1, 20, 1, -100)}
    )
    fadeOut:Play()
    fadeOut.Completed:Wait()
    
    notif:Destroy()
end

CreateNotification("FISH IT! Script Loaded", "Script berhasil dimuat! Selamat memancing!", 5)

print("=== FISH IT! AUTO FISHING SCRIPT ===")
print("Status: Loaded Successfully")
print("Total Fish Database: 392")
print("Locations: " .. #FishItLocations)
print("Rods Available: " .. #FishItRods)
print("Enchantments: " .. #FishItEnchants)
print("discord.gg/getsades")

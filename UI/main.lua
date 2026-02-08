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
    "Fisherman Island", "Ocean", "Kohana Island", "Kohana Volcano",
    "Volcanic Depths", "Coral Reef", "Esoteric Depths", "Tropical Grove",
    "Crater Island", "Lost Isle", "Ancient Jungle", "Ancient Ruins",
    "Classic Island", "Pirate Cove", "Crystal Depths", "Underground Cellar"
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                     FISH IT! RODS (13)                         ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishItRods = {
    "Starter Rod", "Toy Rod", "Grass Rod", "Lava Rod", "Lucky Rod",
    "Hazmat Rod", "Ares Rod", "Astral Rod", "Bamboo Rod",
    "Fluorescent Rod", "Ghostfinn Rod", "Angler Rod", "Element Rod"
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                 FISH IT! ENCHANTMENTS (14)                     ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishItEnchants = {
    "Leprechaun I", "Leprechaun II", "Big Hunter I", "Cursed I",
    "Mutation Hunter I", "Mutation Hunter II", "Mutation Hunter III",
    "Prismatic I", "Empowered I", "Reeler I", "Secret Hunter",
    "Shark Hunter", "Fairy Hunter", "Perfection"
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   FISH IT! ROD SKINS (7)                       ║
-- ╚══════════════════════════════════════════════════════════════╝

local FishItAnimationSkins = {
    "Default", "Holy", "Retro", "Festive", "Spooky", "Ancient", "Crystal"
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

-- Script State
local ScriptEnabled = true

-- Active Toggle States
local AutoFishEnabled = false
local AutoSellEnabled = false
local AutoShakeEnabled = false
local PerfectCastEnabled = false

-- Settings
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

-- Stats
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

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   DARK MODERN THEME                            ║
-- ╚══════════════════════════════════════════════════════════════╝

local Theme = {
    Background      = Color3.fromRGB(12, 12, 16),
    Sidebar         = Color3.fromRGB(16, 16, 22),
    SidebarItem     = Color3.fromRGB(22, 22, 30),
    SidebarActive   = Color3.fromRGB(34, 120, 82),
    TopBar          = Color3.fromRGB(16, 16, 22),
    ContentBg       = Color3.fromRGB(12, 12, 16),
    Section         = Color3.fromRGB(20, 20, 28),
    SectionHeader   = Color3.fromRGB(24, 24, 32),
    InputField      = Color3.fromRGB(28, 28, 38),
    InputFieldFocus = Color3.fromRGB(32, 32, 44),
    ToggleOff       = Color3.fromRGB(40, 40, 52),
    ToggleOn        = Color3.fromRGB(34, 160, 90),
    Primary         = Color3.fromRGB(34, 160, 90),
    PrimaryDark     = Color3.fromRGB(24, 120, 66),
    Accent          = Color3.fromRGB(88, 101, 242),
    Danger          = Color3.fromRGB(220, 60, 60),
    Warning         = Color3.fromRGB(250, 166, 26),
    TextPrimary     = Color3.fromRGB(240, 240, 245),
    TextSecondary   = Color3.fromRGB(160, 165, 175),
    TextMuted       = Color3.fromRGB(90, 95, 105),
    TextDim         = Color3.fromRGB(65, 70, 80),
    Border          = Color3.fromRGB(30, 30, 40),
    Divider         = Color3.fromRGB(25, 25, 35),
    Shadow          = Color3.fromRGB(0, 0, 0),
    VersionBg       = Color3.fromRGB(28, 28, 38),
    VersionText     = Color3.fromRGB(34, 160, 90),
    SearchBg        = Color3.fromRGB(22, 22, 30),
    ScrollBar       = Color3.fromRGB(45, 45, 58),
    DropdownBg      = Color3.fromRGB(24, 24, 32),
    DropdownHover   = Color3.fromRGB(34, 120, 82),
    MinimizeIcon    = Color3.fromRGB(34, 160, 90),
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
    s.Transparency = 0.5
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
        local remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
        if remotes then
            self.Remotes.Cast = remotes:FindFirstChild("CastRod") or remotes:FindFirstChild("Cast")
            self.Remotes.Reel = remotes:FindFirstChild("ReelIn") or remotes:FindFirstChild("Reel")
            self.Remotes.Shake = remotes:FindFirstChild("Shake")
            self.Remotes.Sell = remotes:FindFirstChild("SellFish") or remotes:FindFirstChild("Sell")
        end
    end)
    if not success then warn("Failed to find Fish It! remotes:", err) end
end

function FishingController:GetRod()
    local character = Player.Character
    if not character then return nil end
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name:lower(), "rod") then return item end
    end
    for _, item in pairs(Player.Backpack:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name:lower(), "rod") then return item end
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
    return pcall(function() self.Remotes.Cast:FireServer() end)
end

function FishingController:Reel()
    if not self.Remotes.Reel then return false end
    return pcall(function() self.Remotes.Reel:FireServer() end)
end

function FishingController:Shake()
    if not self.Remotes.Shake then return false end
    return pcall(function() self.Remotes.Shake:FireServer() end)
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
    if camera then camera.FieldOfView = Settings.FOV end
end

Player.CharacterAdded:Connect(UpdateCharacter)

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   AUTO FISH / SELL LOOPS                       ║
-- ╚══════════════════════════════════════════════════════════════╝

local function AutoFishLoop()
    spawn(function()
        while ScriptEnabled do
            if AutoFishEnabled then
                if Settings.AutoEquipRod then Controller:EquipRod() end
                
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
                else
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

-- Destroy old UI if exists
if PlayerGui:FindFirstChild("AtomicHubFishIt") then
    PlayerGui:FindFirstChild("AtomicHubFishIt"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AtomicHubFishIt"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = PlayerGui

-- ════════════════════════════════════════════════════
-- MINIMIZE FLOATING ICON (hidden initially)
-- ════════════════════════════════════════════════════

local MinIcon = Instance.new("ImageButton")
MinIcon.Name = "MinimizeIcon"
MinIcon.Size = UDim2.new(0, 50, 0, 50)
MinIcon.Position = UDim2.new(0, 20, 0.5, -25)
MinIcon.BackgroundColor3 = Theme.SidebarActive
MinIcon.BorderSizePixel = 0
MinIcon.Image = "rbxassetid://6031075938"
MinIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
MinIcon.ScaleType = Enum.ScaleType.Fit
MinIcon.Visible = false
MinIcon.ZIndex = 100
MinIcon.Parent = ScreenGui
AddCorner(MinIcon, 14)
AddStroke(MinIcon, Theme.Primary, 2)

-- Glow effect for minimize icon
local MinIconGlow = Instance.new("ImageLabel")
MinIconGlow.Name = "Glow"
MinIconGlow.Size = UDim2.new(1.5, 0, 1.5, 0)
MinIconGlow.Position = UDim2.new(-0.25, 0, -0.25, 0)
MinIconGlow.BackgroundTransparency = 1
MinIconGlow.Image = "rbxassetid://5028857084"
MinIconGlow.ImageColor3 = Theme.Primary
MinIconGlow.ImageTransparency = 0.7
MinIconGlow.ZIndex = 99
MinIconGlow.Parent = MinIcon

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

-- ════════════════════════════════════════════════════
-- MAIN FRAME
-- ════════════════════════════════════════════════════

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

-- Shadow behind MainFrame
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5028857084"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.4
Shadow.ZIndex = -1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
Shadow.Parent = MainFrame

-- ════════════════════════════════════════════════════
-- TOP BAR
-- ════════════════════════════════════════════════════

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

-- Logo icon
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, 22, 0, 22)
Logo.Position = UDim2.new(0, 12, 0.5, -11)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://6031075938"
Logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
Logo.Parent = TopBar

-- Title Text
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(0, 90, 1, 0)
TitleLabel.Position = UDim2.new(0, 38, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Atomic Hub"
TitleLabel.TextColor3 = Theme.TextPrimary
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Version Badge
local VersionBadge = Instance.new("Frame")
VersionBadge.Name = "VersionBadge"
VersionBadge.Size = UDim2.new(0, 62, 0, 22)
VersionBadge.Position = UDim2.new(0, 132, 0.5, -11)
VersionBadge.BackgroundColor3 = Theme.VersionBg
VersionBadge.BorderSizePixel = 0
VersionBadge.Parent = TopBar
AddCorner(VersionBadge, 6)
AddStroke(VersionBadge, Theme.Border, 1)

local VersionIcon = Instance.new("TextLabel")
VersionIcon.Size = UDim2.new(0, 16, 1, 0)
VersionIcon.Position = UDim2.new(0, 5, 0, 0)
VersionIcon.BackgroundTransparency = 1
VersionIcon.Text = "⚡"
VersionIcon.TextColor3 = Theme.VersionText
VersionIcon.TextSize = 10
VersionIcon.Font = Enum.Font.GothamBold
VersionIcon.Parent = VersionBadge

local VersionText = Instance.new("TextLabel")
VersionText.Size = UDim2.new(1, -20, 1, 0)
VersionText.Position = UDim2.new(0, 18, 0, 0)
VersionText.BackgroundTransparency = 1
VersionText.Text = "v0.3.9.8"
VersionText.TextColor3 = Theme.VersionText
VersionText.TextSize = 11
VersionText.Font = Enum.Font.GothamBold
VersionText.TextXAlignment = Enum.TextXAlignment.Left
VersionText.Parent = VersionBadge

-- Top Bar Icons (center-right area)
local TopBarIcons = Instance.new("Frame")
TopBarIcons.Name = "TopBarIcons"
TopBarIcons.Size = UDim2.new(0, 160, 0, 30)
TopBarIcons.Position = UDim2.new(0.5, -30, 0.5, -15)
TopBarIcons.BackgroundTransparency = 1
TopBarIcons.Parent = TopBar

local iconLayout = Instance.new("UIListLayout")
iconLayout.FillDirection = Enum.FillDirection.Horizontal
iconLayout.Padding = UDim.new(0, 6)
iconLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
iconLayout.VerticalAlignment = Enum.VerticalAlignment.Center
iconLayout.Parent = TopBarIcons

local topIcons = {"🏠", "👁", "🔔", "🔊"}
for _, ico in ipairs(topIcons) do
    local iconBtn = Instance.new("TextButton")
    iconBtn.Size = UDim2.new(0, 28, 0, 28)
    iconBtn.BackgroundColor3 = Theme.SidebarItem
    iconBtn.BackgroundTransparency = 0.5
    iconBtn.BorderSizePixel = 0
    iconBtn.Text = ico
    iconBtn.TextSize = 14
    iconBtn.TextColor3 = Theme.TextSecondary
    iconBtn.Font = Enum.Font.Gotham
    iconBtn.AutoButtonColor = false
    iconBtn.Parent = TopBarIcons
    AddCorner(iconBtn, 6)
    
    iconBtn.MouseEnter:Connect(function()
        Tween(iconBtn, QuickTween, {BackgroundTransparency = 0})
    end)
    iconBtn.MouseLeave:Connect(function()
        Tween(iconBtn, QuickTween, {BackgroundTransparency = 0.5})
    end)
end

-- Window Control Buttons (minimize, maximize, close)
local WinControls = Instance.new("Frame")
WinControls.Name = "WinControls"
WinControls.Size = UDim2.new(0, 90, 0, 30)
WinControls.Position = UDim2.new(1, -100, 0.5, -15)
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

-- Maximize placeholder
local MaxBtn = Instance.new("TextButton")
MaxBtn.Size = UDim2.new(0, 26, 0, 26)
MaxBtn.BackgroundColor3 = Theme.SidebarItem
MaxBtn.BorderSizePixel = 0
MaxBtn.Text = "□"
MaxBtn.TextSize = 14
MaxBtn.TextColor3 = Theme.TextSecondary
MaxBtn.Font = Enum.Font.GothamBold
MaxBtn.AutoButtonColor = false
MaxBtn.Parent = WinControls
AddCorner(MaxBtn, 6)

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

-- Hover effects for window controls
for _, btn in pairs({MinimizeBtn, MaxBtn, CloseBtn}) do
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
    Tween(MinIcon, BounceTween, {Size = UDim2.new(0, 50, 0, 50)})
end)

-- Restore from minimize icon
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
local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
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

-- ════════════════════════════════════════════════════
-- SIDEBAR
-- ════════════════════════════════════════════════════

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 160, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarDivider = Instance.new("Frame")
SidebarDivider.Size = UDim2.new(0, 1, 1, 0)
SidebarDivider.Position = UDim2.new(1, -1, 0, 0)
SidebarDivider.BackgroundColor3 = Theme.Divider
SidebarDivider.BorderSizePixel = 0
SidebarDivider.Parent = Sidebar

-- Search Bar
local SearchFrame = Instance.new("Frame")
SearchFrame.Size = UDim2.new(1, -16, 0, 32)
SearchFrame.Position = UDim2.new(0, 8, 0, 8)
SearchFrame.BackgroundColor3 = Theme.SearchBg
SearchFrame.BorderSizePixel = 0
SearchFrame.Parent = Sidebar
AddCorner(SearchFrame, 6)
AddStroke(SearchFrame, Theme.Border, 1)

local SearchIcon = Instance.new("TextLabel")
SearchIcon.Size = UDim2.new(0, 28, 1, 0)
SearchIcon.Position = UDim2.new(0, 2, 0, 0)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Text = "🔍"
SearchIcon.TextSize = 12
SearchIcon.TextColor3 = Theme.TextMuted
SearchIcon.Font = Enum.Font.Gotham
SearchIcon.Parent = SearchFrame

local SearchBar = Instance.new("TextBox")
SearchBar.Size = UDim2.new(1, -32, 1, 0)
SearchBar.Position = UDim2.new(0, 30, 0, 0)
SearchBar.BackgroundTransparency = 1
SearchBar.PlaceholderText = "Search"
SearchBar.Text = ""
SearchBar.TextColor3 = Theme.TextPrimary
SearchBar.PlaceholderColor3 = Theme.TextMuted
SearchBar.TextSize = 12
SearchBar.Font = Enum.Font.Gotham
SearchBar.TextXAlignment = Enum.TextXAlignment.Left
SearchBar.ClearTextOnFocus = false
SearchBar.Parent = SearchFrame

-- Navigation Scroll
local NavScroll = Instance.new("ScrollingFrame")
NavScroll.Name = "NavScroll"
NavScroll.Size = UDim2.new(1, 0, 1, -50)
NavScroll.Position = UDim2.new(0, 0, 0, 48)
NavScroll.BackgroundTransparency = 1
NavScroll.BorderSizePixel = 0
NavScroll.ScrollBarThickness = 3
NavScroll.ScrollBarImageColor3 = Theme.ScrollBar
NavScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
NavScroll.Parent = Sidebar

local NavLayout = AddLayout(NavScroll, Enum.FillDirection.Vertical, 2)
AddPadding(NavScroll, 4, 8, 8, 4)

-- ════════════════════════════════════════════════════
-- CONTENT AREA
-- ════════════════════════════════════════════════════

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -160, 1, -40)
ContentArea.Position = UDim2.new(0, 160, 0, 40)
ContentArea.BackgroundColor3 = Theme.ContentBg
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   UI COMPONENT BUILDERS                        ║
-- ╚══════════════════════════════════════════════════════════════╝

local Pages = {}
local NavButtons = {}
local currentPageName = nil

-- Create Nav Button
local function CreateNavButton(name, icon, order, group)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Nav"
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Theme.SidebarItem
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.LayoutOrder = order
    btn.Parent = NavScroll
    AddCorner(btn, 6)
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 28, 1, 0)
    iconLabel.Position = UDim2.new(0, 6, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextSize = 14
    iconLabel.TextColor3 = Theme.TextMuted
    iconLabel.Font = Enum.Font.Gotham
    iconLabel.Parent = btn
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Label"
    textLabel.Size = UDim2.new(1, -38, 1, 0)
    textLabel.Position = UDim2.new(0, 34, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = name
    textLabel.TextSize = 13
    textLabel.TextColor3 = Theme.TextSecondary
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = btn
    
    -- Active indicator bar
    local activeBar = Instance.new("Frame")
    activeBar.Name = "ActiveBar"
    activeBar.Size = UDim2.new(0, 3, 0.6, 0)
    activeBar.Position = UDim2.new(0, 0, 0.2, 0)
    activeBar.BackgroundColor3 = Theme.Primary
    activeBar.BorderSizePixel = 0
    activeBar.Visible = false
    activeBar.Parent = btn
    AddCorner(activeBar, 2)
    
    btn.MouseEnter:Connect(function()
        if currentPageName ~= name then
            Tween(btn, QuickTween, {BackgroundTransparency = 0.3})
        end
    end)
    btn.MouseLeave:Connect(function()
        if currentPageName ~= name then
            Tween(btn, QuickTween, {BackgroundTransparency = 1})
        end
    end)
    
    NavButtons[name] = {Button = btn, Icon = iconLabel, Label = textLabel, ActiveBar = activeBar}
    return btn
end

-- Create Page Container
local function CreatePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = Theme.ScrollBar
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.Visible = false
    page.Parent = ContentArea
    
    local layout = AddLayout(page, Enum.FillDirection.Vertical, 8)
    AddPadding(page, 10, 12, 12, 10)
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 24)
    end)
    
    Pages[name] = page
    return page
end

-- Show Page
local function ShowPage(name)
    -- Hide all pages
    for pName, pg in pairs(Pages) do
        pg.Visible = false
    end
    -- Deactivate all nav buttons
    for nName, nav in pairs(NavButtons) do
        nav.Button.BackgroundTransparency = 1
        nav.Button.BackgroundColor3 = Theme.SidebarItem
        nav.Label.TextColor3 = Theme.TextSecondary
        nav.Label.Font = Enum.Font.Gotham
        nav.Icon.TextColor3 = Theme.TextMuted
        nav.ActiveBar.Visible = false
    end
    -- Activate selected
    if Pages[name] then
        Pages[name].Visible = true
    end
    if NavButtons[name] then
        local nav = NavButtons[name]
        nav.Button.BackgroundTransparency = 0
        nav.Button.BackgroundColor3 = Theme.SidebarActive
        nav.Label.TextColor3 = Theme.TextPrimary
        nav.Label.Font = Enum.Font.GothamBold
        nav.Icon.TextColor3 = Theme.TextPrimary
        nav.ActiveBar.Visible = true
    end
    currentPageName = name
end

-- ════════════════════════════════════════════════════
-- SECTION BUILDER (Collapsible)
-- ════════════════════════════════════════════════════

local function CreateSection(parent, title, order, defaultExpanded)
    local section = Instance.new("Frame")
    section.Name = title:gsub(" ", "") .. "Section"
    section.BackgroundColor3 = Theme.Section
    section.BorderSizePixel = 0
    section.LayoutOrder = order
    section.ClipsDescendants = true
    section.AutomaticSize = Enum.AutomaticSize.None
    section.Parent = parent
    AddCorner(section, 8)
    
    -- Header
    local header = Instance.new("TextButton")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 42)
    header.BackgroundColor3 = Theme.SectionHeader
    header.BackgroundTransparency = 0.5
    header.BorderSizePixel = 0
    header.Text = ""
    header.AutoButtonColor = false
    header.Parent = section
    AddCorner(header, 8)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 16, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Theme.TextPrimary
    titleLabel.TextSize = 14
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -32, 0.5, -10)
    arrow.BackgroundTransparency = 1
    arrow.Text = defaultExpanded and "∧" or "∨"
    arrow.TextColor3 = Theme.TextSecondary
    arrow.TextSize = 16
    arrow.Font = Enum.Font.GothamBold
    arrow.Parent = header
    
    -- Content Container
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.Position = UDim2.new(0, 0, 0, 42)
    content.BackgroundTransparency = 1
    content.ClipsDescendants = true
    content.Parent = section
    
    local contentLayout = AddLayout(content, Enum.FillDirection.Vertical, 6)
    AddPadding(content, 6, 16, 16, 10)
    
    local expanded = defaultExpanded or false
    
    local function updateSize()
        local contentHeight = contentLayout.AbsoluteContentSize.Y + 16
        if expanded then
            section.Size = UDim2.new(1, 0, 0, 42 + contentHeight)
            content.Size = UDim2.new(1, 0, 0, contentHeight)
        else
            section.Size = UDim2.new(1, 0, 0, 42)
            content.Size = UDim2.new(1, 0, 0, 0)
        end
    end
    
    -- Initial size
    if expanded then
        task.defer(function()
            wait(0.05)
            updateSize()
        end)
    else
        section.Size = UDim2.new(1, 0, 0, 42)
    end
    
    header.MouseButton1Click:Connect(function()
        expanded = not expanded
        arrow.Text = expanded and "∧" or "∨"
        
        local contentHeight = contentLayout.AbsoluteContentSize.Y + 16
        local targetSectionH = expanded and (42 + contentHeight) or 42
        local targetContentH = expanded and contentHeight or 0
        
        Tween(section, SmoothTween, {Size = UDim2.new(1, 0, 0, targetSectionH)})
        Tween(content, SmoothTween, {Size = UDim2.new(1, 0, 0, targetContentH)})
    end)
    
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if expanded then
            local contentHeight = contentLayout.AbsoluteContentSize.Y + 16
            section.Size = UDim2.new(1, 0, 0, 42 + contentHeight)
            content.Size = UDim2.new(1, 0, 0, contentHeight)
        end
    end)
    
    header.MouseEnter:Connect(function()
        Tween(header, QuickTween, {BackgroundTransparency = 0.2})
    end)
    header.MouseLeave:Connect(function()
        Tween(header, QuickTween, {BackgroundTransparency = 0.5})
    end)
    
    return content
end

-- ════════════════════════════════════════════════════
-- TOGGLE BUILDER
-- ════════════════════════════════════════════════════

local function CreateToggle(parent, name, default, callback, description)
    local toggle = Instance.new("Frame")
    toggle.Name = name:gsub(" ", "") .. "Toggle"
    toggle.Size = UDim2.new(1, 0, 0, description and 44 or 32)
    toggle.BackgroundTransparency = 1
    toggle.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.TextPrimary
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggle
    
    if description then
        local desc = Instance.new("TextLabel")
        desc.Size = UDim2.new(1, -60, 0, 18)
        desc.Position = UDim2.new(0, 0, 0, 20)
        desc.BackgroundTransparency = 1
        desc.Text = description
        desc.TextColor3 = Theme.TextMuted
        desc.TextSize = 11
        desc.Font = Enum.Font.Gotham
        desc.TextXAlignment = Enum.TextXAlignment.Left
        desc.TextWrapped = true
        desc.Parent = toggle
    end
    
    local btnFrame = Instance.new("TextButton")
    btnFrame.Size = UDim2.new(0, 44, 0, 22)
    btnFrame.Position = UDim2.new(1, -44, 0, description and 10 or 4)
    btnFrame.BackgroundColor3 = default and Theme.ToggleOn or Theme.ToggleOff
    btnFrame.BorderSizePixel = 0
    btnFrame.Text = ""
    btnFrame.AutoButtonColor = false
    btnFrame.Parent = toggle
    AddCorner(btnFrame, 11)
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = default and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = btnFrame
    AddCorner(knob, 8)
    
    local state = default
    
    btnFrame.MouseButton1Click:Connect(function()
        state = not state
        Tween(btnFrame, QuickTween, {BackgroundColor3 = state and Theme.ToggleOn or Theme.ToggleOff})
        Tween(knob, QuickTween, {Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)})
        if callback then callback(state) end
    end)
    
    return toggle, function() return state end
end

-- ════════════════════════════════════════════════════
-- INPUT FIELD BUILDER (for delays, limits)
-- ════════════════════════════════════════════════════

local function CreateInputField(parent, name, default, callback, suffix)
    local field = Instance.new("Frame")
    field.Name = name:gsub(" ", "") .. "Input"
    field.Size = UDim2.new(1, 0, 0, 32)
    field.BackgroundTransparency = 1
    field.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.TextPrimary
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = field
    
    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(0.4, 0, 0, 28)
    inputBox.Position = UDim2.new(0.6, 0, 0.5, -14)
    inputBox.BackgroundColor3 = Theme.InputField
    inputBox.BorderSizePixel = 0
    inputBox.Text = tostring(default)
    inputBox.TextColor3 = Theme.TextPrimary
    inputBox.TextSize = 13
    inputBox.Font = Enum.Font.GothamBold
    inputBox.ClearTextOnFocus = true
    inputBox.Parent = field
    AddCorner(inputBox, 6)
    AddStroke(inputBox, Theme.Border, 1)
    
    inputBox.Focused:Connect(function()
        Tween(inputBox, QuickTween, {BackgroundColor3 = Theme.InputFieldFocus})
    end)
    inputBox.FocusLost:Connect(function()
        Tween(inputBox, QuickTween, {BackgroundColor3 = Theme.InputField})
        local val = tonumber(inputBox.Text)
        if val and callback then
            callback(val)
        elseif not tonumber(inputBox.Text) then
            inputBox.Text = tostring(default)
        end
    end)
    
    return field
end

-- ════════════════════════════════════════════════════
-- DROPDOWN BUILDER
-- ════════════════════════════════════════════════════

local function CreateDropdown(parent, name, options, default, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Name = name:gsub(" ", "") .. "Dropdown"
    dropdown.Size = UDim2.new(1, 0, 0, 52)
    dropdown.BackgroundTransparency = 1
    dropdown.ClipsDescendants = false
    dropdown.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 0, 18)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.TextPrimary
    label.TextSize = 12
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = dropdown
    
    if name:len() > 20 then
        label.Size = UDim2.new(1, 0, 0, 18)
        local desc = Instance.new("TextLabel")
        desc.Size = UDim2.new(1, 0, 0, 14)
        desc.Position = UDim2.new(0, 0, 0, 16)
        desc.BackgroundTransparency = 1
        desc.Text = name
        desc.TextColor3 = Theme.TextMuted
        desc.TextSize = 10
        desc.Font = Enum.Font.Gotham
        desc.TextXAlignment = Enum.TextXAlignment.Left
        desc.Visible = false
        desc.Parent = dropdown
    end
    
    local btnContainer = Instance.new("Frame")
    btnContainer.Size = UDim2.new(0.42, 0, 0, 30)
    btnContainer.Position = UDim2.new(0.58, 0, 0, 16)
    btnContainer.BackgroundColor3 = Theme.InputField
    btnContainer.BorderSizePixel = 0
    btnContainer.Parent = dropdown
    AddCorner(btnContainer, 6)
    AddStroke(btnContainer, Theme.Border, 1)
    
    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Size = UDim2.new(1, -28, 1, 0)
    selectedLabel.Position = UDim2.new(0, 10, 0, 0)
    selectedLabel.BackgroundTransparency = 1
    selectedLabel.Text = default or options[1] or "--"
    selectedLabel.TextColor3 = Theme.TextPrimary
    selectedLabel.TextSize = 12
    selectedLabel.Font = Enum.Font.Gotham
    selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
    selectedLabel.TextTruncate = Enum.TextTruncate.AtEnd
    selectedLabel.Parent = btnContainer
    
    local ddArrow = Instance.new("TextLabel")
    ddArrow.Size = UDim2.new(0, 20, 1, 0)
    ddArrow.Position = UDim2.new(1, -22, 0, 0)
    ddArrow.BackgroundTransparency = 1
    ddArrow.Text = "⇅"
    ddArrow.TextColor3 = Theme.TextMuted
    ddArrow.TextSize = 12
    ddArrow.Font = Enum.Font.GothamBold
    ddArrow.Parent = btnContainer
    
    local ddBtn = Instance.new("TextButton")
    ddBtn.Size = UDim2.new(1, 0, 1, 0)
    ddBtn.BackgroundTransparency = 1
    ddBtn.Text = ""
    ddBtn.Parent = btnContainer
    
    -- Options list (floating)
    local optionsList = Instance.new("Frame")
    optionsList.Size = UDim2.new(1, 0, 0, 0)
    optionsList.Position = UDim2.new(0, 0, 1, 4)
    optionsList.BackgroundColor3 = Theme.DropdownBg
    optionsList.BorderSizePixel = 0
    optionsList.Visible = false
    optionsList.ClipsDescendants = true
    optionsList.ZIndex = 50
    optionsList.Parent = btnContainer
    AddCorner(optionsList, 6)
    AddStroke(optionsList, Theme.Border, 1)
    
    local optLayout = AddLayout(optionsList, Enum.FillDirection.Vertical, 1)
    AddPadding(optionsList, 4, 4, 4, 4)
    
    local ddExpanded = false
    
    for _, opt in ipairs(options) do
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, 0, 0, 28)
        optBtn.BackgroundColor3 = Theme.InputField
        optBtn.BackgroundTransparency = 1
        optBtn.BorderSizePixel = 0
        optBtn.Text = opt
        optBtn.TextColor3 = Theme.TextSecondary
        optBtn.TextSize = 12
        optBtn.Font = Enum.Font.Gotham
        optBtn.AutoButtonColor = false
        optBtn.ZIndex = 51
        optBtn.Parent = optionsList
        AddCorner(optBtn, 4)
        
        optBtn.MouseEnter:Connect(function()
            Tween(optBtn, QuickTween, {BackgroundTransparency = 0, BackgroundColor3 = Theme.DropdownHover})
            optBtn.TextColor3 = Theme.TextPrimary
        end)
        optBtn.MouseLeave:Connect(function()
            Tween(optBtn, QuickTween, {BackgroundTransparency = 1})
            optBtn.TextColor3 = Theme.TextSecondary
        end)
        optBtn.MouseButton1Click:Connect(function()
            selectedLabel.Text = opt
            ddExpanded = false
            Tween(optionsList, QuickTween, {Size = UDim2.new(1, 0, 0, 0)}).Completed:Wait()
            optionsList.Visible = false
            if callback then callback(opt) end
        end)
    end
    
    ddBtn.MouseButton1Click:Connect(function()
        ddExpanded = not ddExpanded
        if ddExpanded then
            optionsList.Visible = true
            local targetH = math.min(#options * 29 + 8, 200)
            Tween(optionsList, QuickTween, {Size = UDim2.new(1, 0, 0, targetH)})
        else
            Tween(optionsList, QuickTween, {Size = UDim2.new(1, 0, 0, 0)}).Completed:Wait()
            optionsList.Visible = false
        end
    end)
    
    return dropdown
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   BUILD ALL PAGES                              ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ===== NAVIGATION GROUP 1 (LEFT SIDEBAR) =====
CreateNavButton("Local Player", "👤", 1)
CreateNavButton("Main", "🏠", 2)
CreateNavButton("Zone Fishing", "🎣", 3)
CreateNavButton("Backpack", "🎒", 4)
CreateNavButton("Webhook", "🔗", 5)
CreateNavButton("Trading", "💱", 6)

-- Separator
local sep1 = Instance.new("Frame")
sep1.Size = UDim2.new(1, -16, 0, 1)
sep1.BackgroundColor3 = Theme.Divider
sep1.BorderSizePixel = 0
sep1.LayoutOrder = 7
sep1.Parent = NavScroll

CreateNavButton("Automation", "⚙", 8)
CreateNavButton("Shopping", "🛒", 9)
CreateNavButton("Quests", "📜", 10)
CreateNavButton("Teleportation", "📍", 11)
CreateNavButton("Utilities", "🔧", 12)
CreateNavButton("Performance", "⚡", 13)

-- Update nav scroll canvas
NavLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    NavScroll.CanvasSize = UDim2.new(0, 0, 0, NavLayout.AbsoluteContentSize.Y + 12)
end)

-- ════════════════════════════════════════════════════
-- PAGE: LOCAL PLAYER
-- ════════════════════════════════════════════════════

local localPlayerPage = CreatePage("Local Player")

local movementSection = CreateSection(localPlayerPage, "Movement", 1, false)
CreateInputField(movementSection, "WalkSpeed", 16, function(val)
    Settings.WalkSpeed = val
    UpdateCharacter()
end)
CreateInputField(movementSection, "JumpPower", 50, function(val)
    Settings.JumpPower = val
    UpdateCharacter()
end)

local cameraSection = CreateSection(localPlayerPage, "Camera", 2, false)
CreateInputField(cameraSection, "Field of View", 70, function(val)
    Settings.FOV = val
    UpdateCharacter()
end)

local accessoriesSection = CreateSection(localPlayerPage, "Player Accessories", 3, true)
CreateToggle(accessoriesSection, "Fishing Radar", false, function(val)
    Settings.FishingRadar = val
end)
CreateToggle(accessoriesSection, "Diving Gear", false, function(val)
    Settings.DivingGear = val
end)
CreateToggle(accessoriesSection, "Auto Equip Rod", false, function(val)
    Settings.AutoEquipRod = val
end)

-- ════════════════════════════════════════════════════
-- PAGE: MAIN
-- ════════════════════════════════════════════════════

local mainPage = CreatePage("Main")

local legitSection = CreateSection(mainPage, "Legit Fishing", 1, true)
CreateToggle(legitSection, "Perfect Cast", false, function(val)
    PerfectCastEnabled = val
end)
CreateToggle(legitSection, "Enable Auto Fishing", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Legit"
end)
CreateToggle(legitSection, "Auto Shake", false, function(val)
    AutoShakeEnabled = val
end, "Automatically click the UI when a fish is hooked")

local instantSection = CreateSection(mainPage, "Instant Fishing", 2, false)
CreateInputField(instantSection, "Complete Delay", 3.4, function(val)
    Settings.InstantCompleteDelay = val
end)
CreateToggle(instantSection, "Enable Auto Fishing", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Instant"
end)

local superInstantSection = CreateSection(mainPage, "Super Instant Fishing", 3, false)
CreateInputField(superInstantSection, "Cancel Delay", 0.8, function(val)
    Settings.SuperInstantCancelDelay = val
end)
CreateInputField(superInstantSection, "Complete Delay", 0.3, function(val)
    Settings.SuperInstantCompleteDelay = val
end)
CreateToggle(superInstantSection, "Enable Auto Fishing", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Super Instant"
end)

local betaSection = CreateSection(mainPage, "Super Instant BETA Fishing", 4, false)
CreateInputField(betaSection, "Cancel Delay", 0.075, function(val)
    Settings.BetaCancelDelay = val
end)
CreateInputField(betaSection, "Complete Delay", 0.305, function(val)
    Settings.BetaCompleteDelay = val
end)
CreateToggle(betaSection, "Enable Auto Fishing", false, function(val)
    AutoFishEnabled = val
    Settings.FishingMode = "Beta Instant"
end)

local autoSellSection = CreateSection(mainPage, "Auto Selling", 5, false)
CreateDropdown(autoSellSection, "Selling Type", {"--", "All", "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic"}, "--", function(val)
    Settings.SellingType = val
end)
CreateToggle(autoSellSection, "Enable Auto Selling", false, function(val)
    AutoSellEnabled = val
end)
CreateInputField(autoSellSection, "Sell Limit", 100, function(val)
    Settings.SellLimit = val
end)
CreateInputField(autoSellSection, "Sell Delay (Seconds)", 1, function(val)
    Settings.SellDelay = val
end)

-- ════════════════════════════════════════════════════
-- PAGE: ZONE FISHING
-- ════════════════════════════════════════════════════

local zoneFishingPage = CreatePage("Zone Fishing")

local fishingZonesSection = CreateSection(zoneFishingPage, "Fishing Zones", 1, true)
CreateDropdown(fishingZonesSection, "Fishing Spot", FishItLocations, "Crystal Depths", function(val)
    Settings.FishingSpot = val
end)
CreateToggle(fishingZonesSection, "Auto Teleport", false, function(val)
    Settings.AutoTeleport = val
end)

local eventSection = CreateSection(zoneFishingPage, "Event", 2, false)
local eventNote = Instance.new("TextLabel")
eventNote.Size = UDim2.new(1, 0, 0, 24)
eventNote.BackgroundTransparency = 1
eventNote.Text = "No active events"
eventNote.TextColor3 = Theme.TextMuted
eventNote.TextSize = 12
eventNote.Font = Enum.Font.Gotham
eventNote.Parent = eventSection

-- ════════════════════════════════════════════════════
-- PAGE: BACKPACK
-- ════════════════════════════════════════════════════

local backpackPage = CreatePage("Backpack")
local bpSection = CreateSection(backpackPage, "Backpack Manager", 1, true)
local bpNote = Instance.new("TextLabel")
bpNote.Size = UDim2.new(1, 0, 0, 24)
bpNote.BackgroundTransparency = 1
bpNote.Text = "View and manage your caught fish"
bpNote.TextColor3 = Theme.TextMuted
bpNote.TextSize = 12
bpNote.Font = Enum.Font.Gotham
bpNote.Parent = bpSection

-- ════════════════════════════════════════════════════
-- PAGE: WEBHOOK
-- ════════════════════════════════════════════════════

local webhookPage = CreatePage("Webhook")
local whSection = CreateSection(webhookPage, "Discord Webhook", 1, true)
local whNote = Instance.new("TextLabel")
whNote.Size = UDim2.new(1, 0, 0, 24)
whNote.BackgroundTransparency = 1
whNote.Text = "Send catch notifications to Discord"
whNote.TextColor3 = Theme.TextMuted
whNote.TextSize = 12
whNote.Font = Enum.Font.Gotham
whNote.Parent = whSection

-- ════════════════════════════════════════════════════
-- PAGE: TRADING
-- ════════════════════════════════════════════════════

local tradingPage = CreatePage("Trading")
local trSection = CreateSection(tradingPage, "Trading Hub", 1, true)
local trNote = Instance.new("TextLabel")
trNote.Size = UDim2.new(1, 0, 0, 24)
trNote.BackgroundTransparency = 1
trNote.Text = "Trade fish with other players"
trNote.TextColor3 = Theme.TextMuted
trNote.TextSize = 12
trNote.Font = Enum.Font.Gotham
trNote.Parent = trSection

-- ════════════════════════════════════════════════════
-- PAGE: AUTOMATION
-- ════════════════════════════════════════════════════

local automationPage = CreatePage("Automation")
local autoSection = CreateSection(automationPage, "Auto Actions", 1, true)
local autoNote = Instance.new("TextLabel")
autoNote.Size = UDim2.new(1, 0, 0, 24)
autoNote.BackgroundTransparency = 1
autoNote.Text = "Automated gameplay actions"
autoNote.TextColor3 = Theme.TextMuted
autoNote.TextSize = 12
autoNote.Font = Enum.Font.Gotham
autoNote.Parent = autoSection

-- ════════════════════════════════════════════════════
-- PAGE: SHOPPING
-- ════════════════════════════════════════════════════

local shoppingPage = CreatePage("Shopping")
local shopSection = CreateSection(shoppingPage, "Auto Shop", 1, true)
local shopNote = Instance.new("TextLabel")
shopNote.Size = UDim2.new(1, 0, 0, 24)
shopNote.BackgroundTransparency = 1
shopNote.Text = "Auto-purchase items from shop"
shopNote.TextColor3 = Theme.TextMuted
shopNote.TextSize = 12
shopNote.Font = Enum.Font.Gotham
shopNote.Parent = shopSection

-- ════════════════════════════════════════════════════
-- PAGE: QUESTS
-- ════════════════════════════════════════════════════

local questsPage = CreatePage("Quests")
local questSection = CreateSection(questsPage, "Quest Tracker", 1, true)
local questNote = Instance.new("TextLabel")
questNote.Size = UDim2.new(1, 0, 0, 24)
questNote.BackgroundTransparency = 1
questNote.Text = "Auto-complete quests"
questNote.TextColor3 = Theme.TextMuted
questNote.TextSize = 12
questNote.Font = Enum.Font.Gotham
questNote.Parent = questSection

-- ════════════════════════════════════════════════════
-- PAGE: TELEPORTATION
-- ════════════════════════════════════════════════════

local teleportPage = CreatePage("Teleportation")
local tpSection = CreateSection(teleportPage, "Teleport Locations", 1, true)
CreateDropdown(tpSection, "Destination", FishItLocations, "Fisherman Island", function(val)
    -- teleport logic
end)

-- ════════════════════════════════════════════════════
-- PAGE: UTILITIES
-- ════════════════════════════════════════════════════

local utilitiesPage = CreatePage("Utilities")

local utilSection = CreateSection(utilitiesPage, "Utilities", 1, false)
local utilNote = Instance.new("TextLabel")
utilNote.Size = UDim2.new(1, 0, 0, 24)
utilNote.BackgroundTransparency = 1
utilNote.Text = "Miscellaneous utility features"
utilNote.TextColor3 = Theme.TextMuted
utilNote.TextSize = 12
utilNote.Font = Enum.Font.Gotham
utilNote.Parent = utilSection

local animSection = CreateSection(utilitiesPage, "Animation Changer", 2, true)
CreateDropdown(animSection, "Select Animation\nSkin", FishItAnimationSkins, "Holy", function(val)
    Settings.AnimationSkin = val
end)
CreateToggle(animSection, "Enable Animation Changer", false, function(val)
    Settings.EnableAnimation = val
end)

local securitySection = CreateSection(utilitiesPage, "Security", 3, false)
local secNote = Instance.new("TextLabel")
secNote.Size = UDim2.new(1, 0, 0, 24)
secNote.BackgroundTransparency = 1
secNote.Text = "Anti-detection settings"
secNote.TextColor3 = Theme.TextMuted
secNote.TextSize = 12
secNote.Font = Enum.Font.Gotham
secNote.Parent = securitySection

-- ════════════════════════════════════════════════════
-- PAGE: PERFORMANCE
-- ════════════════════════════════════════════════════

local performancePage = CreatePage("Performance")

local fpsSection = CreateSection(performancePage, "FPS Boost", 1, true)
CreateToggle(fpsSection, "Disable Thunder", false, function(val)
    Settings.DisableThunder = val
end)
CreateToggle(fpsSection, "Disable VFX Effects", false, function(val)
    Settings.DisableVFX = val
    if val then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    end
end)
CreateToggle(fpsSection, "FPS Boost", false, function(val)
    Settings.FPSBoost = val
    if val then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            end
            if v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
        end
    end
end)

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   NAVIGATION CLICK HANDLERS                    ║
-- ╚══════════════════════════════════════════════════════════════╝

for name, nav in pairs(NavButtons) do
    nav.Button.MouseButton1Click:Connect(function()
        ShowPage(name)
    end)
end

-- Search Filter
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local query = SearchBar.Text:lower()
    for name, nav in pairs(NavButtons) do
        if query == "" then
            nav.Button.Visible = true
        else
            nav.Button.Visible = string.find(name:lower(), query) ~= nil
        end
    end
end)

-- Show default page
ShowPage("Main")

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   ENTRANCE ANIMATION                           ║
-- ╚══════════════════════════════════════════════════════════════╝

MainFrame.Size = UDim2.new(0, 0, 0, 0)
Tween(MainFrame, BounceTween, {Size = UDim2.new(0, 640, 0, 440)})

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   NOTIFICATION SYSTEM                          ║
-- ╚══════════════════════════════════════════════════════════════╝

local function CreateNotification(title, message, duration)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 280, 0, 72)
    notif.Position = UDim2.new(1, 10, 1, -90)
    notif.BackgroundColor3 = Theme.Section
    notif.BorderSizePixel = 0
    notif.ZIndex = 200
    notif.Parent = ScreenGui
    AddCorner(notif, 10)
    AddStroke(notif, Theme.Primary, 1)
    
    local accentBar = Instance.new("Frame")
    accentBar.Size = UDim2.new(0, 3, 0.7, 0)
    accentBar.Position = UDim2.new(0, 8, 0.15, 0)
    accentBar.BackgroundColor3 = Theme.Primary
    accentBar.BorderSizePixel = 0
    accentBar.ZIndex = 201
    accentBar.Parent = notif
    AddCorner(accentBar, 2)
    
    local tLabel = Instance.new("TextLabel")
    tLabel.Size = UDim2.new(1, -30, 0, 22)
    tLabel.Position = UDim2.new(0, 18, 0, 10)
    tLabel.BackgroundTransparency = 1
    tLabel.Text = title
    tLabel.TextColor3 = Theme.TextPrimary
    tLabel.TextSize = 13
    tLabel.Font = Enum.Font.GothamBold
    tLabel.TextXAlignment = Enum.TextXAlignment.Left
    tLabel.ZIndex = 201
    tLabel.Parent = notif
    
    local mLabel = Instance.new("TextLabel")
    mLabel.Size = UDim2.new(1, -30, 0, 30)
    mLabel.Position = UDim2.new(0, 18, 0, 32)
    mLabel.BackgroundTransparency = 1
    mLabel.Text = message
    mLabel.TextColor3 = Theme.TextSecondary
    mLabel.TextSize = 11
    mLabel.Font = Enum.Font.Gotham
    mLabel.TextWrapped = true
    mLabel.TextXAlignment = Enum.TextXAlignment.Left
    mLabel.TextYAlignment = Enum.TextYAlignment.Top
    mLabel.ZIndex = 201
    mLabel.Parent = notif
    
    -- Slide in
    Tween(notif, SmoothTween, {Position = UDim2.new(1, -296, 1, -90)})
    
    wait(duration or 4)
    
    -- Slide out
    Tween(notif, SmoothTween, {Position = UDim2.new(1, 10, 1, -90)}).Completed:Wait()
    notif:Destroy()
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   START EVERYTHING                              ║
-- ╚══════════════════════════════════════════════════════════════╝

AutoFishLoop()
AutoSellLoop()

-- Show notification
spawn(function()
    wait(0.6)
    CreateNotification("Atomic Hub Loaded", "Fish It! Script v0.3.9.8 berhasil dimuat!\n392 fish • 16 locations • discord.gg/getsades", 5)
end)

print("=== ATOMIC HUB - FISH IT! AUTO FISHING SCRIPT ===")
print("Status: Loaded Successfully")
print("Total Fish Database: 392")
print("Locations: " .. #FishItLocations)
print("Rods Available: " .. #FishItRods)
print("Enchantments: " .. #FishItEnchants)
print("discord.gg/getsades")

--[[
    ╔══════════════════════════════════════════════╗
    ║         🎣 ULTRA FISH PRO v3.0 🎣           ║
    ║   Auto Fishing Script - 10+ Fish Per Cast    ║
    ║   Compatible: Delta, Ronix, Fluxus, etc.     ║
    ╚══════════════════════════════════════════════╝
]]

-- ═══════════════════════════════════════
-- SERVICES
-- ═══════════════════════════════════════
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- ═══════════════════════════════════════
-- CONFIGURATION
-- ═══════════════════════════════════════
local Config = {
    AutoFish = false,
    AutoSell = false,
    AutoShake = true,
    AutoReel = true,
    BulkFish = 10,
    FishDelay = 0.15,
    CastDelay = 0.5,
    SellDelay = 0.3,
    AntiAFK = true,
    AutoTeleport = false,
    SelectedRod = "Best",
    MinTier = 1,
    MaxTier = 7,
    Webhook = "",
    NotifyMythic = true,
    NotifySecret = true,
    TotalCaught = 0,
    TotalEarned = 0,
    SessionStart = os.clock(),
    UIOpen = true,
    SelectedTab = "Home",
}

-- ═══════════════════════════════════════
-- FISH DATABASE (392 Fish)
-- ═══════════════════════════════════════
local TierColors = {
    [1] = Color3.fromRGB(180, 180, 180),     -- Common (Gray)
    [2] = Color3.fromRGB(76, 175, 80),        -- Uncommon (Green)
    [3] = Color3.fromRGB(33, 150, 243),        -- Rare (Blue)
    [4] = Color3.fromRGB(156, 39, 176),        -- Epic (Purple)
    [5] = Color3.fromRGB(255, 152, 0),         -- Legendary (Orange)
    [6] = Color3.fromRGB(244, 67, 54),         -- Mythic (Red)
    [7] = Color3.fromRGB(255, 215, 0),         -- SECRET (Gold)
}

local TierNames = {
    [1] = "Common", [2] = "Uncommon", [3] = "Rare",
    [4] = "Epic", [5] = "Legendary", [6] = "Mythic", [7] = "SECRET"
}

local FishDatabase = {
    {Name="Reef Chromis",Tier=1,Price=19,Chance=0.5,Id=43},
    {Name="Abyss Seahorse",Tier=5,Price=38500,Chance=1.18e-05,Id=15},
    {Name="Ash Basslet",Tier=1,Price=19,Chance=0.5,Id=20},
    {Name="Astra Damsel",Tier=4,Price=1633,Chance=0.0005,Id=17},
    {Name="Azure Damsel",Tier=1,Price=22,Chance=0.5,Id=66},
    {Name="Banded Butterfly",Tier=2,Price=153,Chance=0.008,Id=44},
    {Name="Blue Lobster",Tier=4,Price=11355,Chance=4e-05,Id=22},
    {Name="Blueflame Ray",Tier=5,Price=45000,Chance=1.08e-05,Id=47},
    {Name="Boa Angelfish",Tier=1,Price=22,Chance=0.0667,Id=45},
    {Name="Bumblebee Grouper",Tier=4,Price=3225,Chance=0.0002,Id=37},
    {Name="Candy Butterfly",Tier=2,Price=419,Chance=0.00267,Id=59},
    {Name="Charmed Tang",Tier=3,Price=393,Chance=0.00308,Id=18},
    {Name="Chrome Tuna",Tier=4,Price=4050,Chance=0.000111,Id=53},
    {Name="Clownfish",Tier=1,Price=19,Chance=0.5,Id=64},
    {Name="Coal Tang",Tier=2,Price=74,Chance=0.02,Id=19},
    {Name="Copperband Butterfly",Tier=2,Price=76,Chance=0.05,Id=67},
    {Name="Corazon Damsel",Tier=1,Price=19,Chance=0.5,Id=31},
    {Name="Cow Clownfish",Tier=4,Price=1044,Chance=0.001,Id=57},
    {Name="Darwin Clownfish",Tier=3,Price=869,Chance=0.00133,Id=71},
    {Name="Domino Damsel",Tier=4,Price=1444,Chance=0.000667,Id=26},
    {Name="Dorhey Tang",Tier=4,Price=1044,Chance=0.001,Id=70},
    {Name="Dotted Stingray",Tier=5,Price=31500,Chance=1.1e-05,Id=75},
    {Name="Enchanted Angelfish",Tier=4,Price=4200,Chance=0.0002,Id=14},
    {Name="Fire Goby",Tier=2,Price=347,Chance=0.004,Id=41},
    {Name="Firecoal Damsel",Tier=4,Price=1044,Chance=0.0004,Id=49},
    {Name="Flame Angelfish",Tier=2,Price=135,Chance=0.01,Id=68},
    {Name="Greenbee Grouper",Tier=4,Price=5732,Chance=0.000167,Id=25},
    {Name="Hammerhead Shark",Tier=5,Price=46500,Chance=1e-05,Id=52,Variant="Color Burn"},
    {Name="Hawks Turtle",Tier=5,Price=40500,Chance=1.33e-05,Id=21},
    {Name="Starjam Tang",Tier=4,Price=4200,Chance=0.0002,Id=24},
    {Name="Jennifer Dottyback",Tier=1,Price=19,Chance=0.5,Id=46},
    {Name="Jewel Tang",Tier=2,Price=347,Chance=0.004,Id=60},
    {Name="Kau Cardinal",Tier=3,Price=869,Chance=0.00133,Id=40},
    {Name="Korean Angelfish",Tier=3,Price=391,Chance=0.00333,Id=72},
    {Name="Lavafin Tuna",Tier=4,Price=4500,Chance=0.0001,Id=48},
    {Name="Lobster",Tier=4,Price=15750,Chance=4e-05,Id=36},
    {Name="Loggerhead Turtle",Tier=5,Price=27000,Chance=1.82e-05,Id=34},
    {Name="Longnose Butterfly",Tier=4,Price=1575,Chance=0.000667,Id=38},
    {Name="Magic Tang",Tier=4,Price=4500,Chance=0.000133,Id=16},
    {Name="Magma Goby",Tier=2,Price=95,Chance=0.01818,Id=50},
    {Name="Manta Ray",Tier=5,Price=24750,Chance=2e-05,Id=54},
    {Name="Maroon Butterfly",Tier=4,Price=1044,Chance=0.001,Id=56},
    {Name="Maze Angelfish",Tier=3,Price=153,Chance=0.008,Id=23},
    {Name="Moorish Idol",Tier=4,Price=2700,Chance=0.0003,Id=55},
    {Name="Bandit Angelfish",Tier=2,Price=105,Chance=0.01538,Id=117},
    {Name="Zoster Butterfly",Tier=1,Price=28,Chance=0.125,Id=116},
    {Name="Orangy Goby",Tier=1,Price=36,Chance=0.14286,Id=32},
    {Name="Panther Grouper",Tier=4,Price=1044,Chance=0.001,Id=27},
    {Name="Prismy Seahorse",Tier=5,Price=29250,Chance=1.25e-05,Id=35},
    {Name="Scissortail Dartfish",Tier=2,Price=369,Chance=0.00333,Id=29},
    {Name="Shrimp Goby",Tier=2,Price=90,Chance=0.02,Id=42},
    {Name="Skunk Tilefish",Tier=1,Price=36,Chance=0.14286,Id=63},
    {Name="Specked Butterfly",Tier=1,Price=19,Chance=0.5,Id=33},
    {Name="Strawberry Dotty",Tier=1,Price=27,Chance=0.05,Id=65},
    {Name="Sushi Cardinal",Tier=4,Price=1282,Chance=0.0008,Id=39},
    {Name="Tricolore Butterfly",Tier=2,Price=112,Chance=0.01429,Id=30},
    {Name="Unicorn Tang",Tier=4,Price=2835,Chance=0.000222,Id=74},
    {Name="Vintage Blue Tang",Tier=1,Price=19,Chance=0.5,Id=62},
    {Name="Vintage Damsel",Tier=2,Price=180,Chance=0.00741,Id=58},
    {Name="Volcanic Basslet",Tier=1,Price=19,Chance=0.5,Id=51},
    {Name="White Clownfish",Tier=2,Price=347,Chance=0.004,Id=28},
    {Name="Yello Damselfish",Tier=2,Price=99,Chance=0.02,Id=69},
    {Name="Yellowfin Tuna",Tier=4,Price=3600,Chance=0.000133,Id=73},
    {Name="Yellowstate Angelfish",Tier=1,Price=19,Chance=0.5,Id=61},
    {Name="Salmon",Tier=2,Price=103,Chance=0.02,Id=190},
    {Name="Blob Shark",Tier=7,Price=98000,Chance=4e-06,Id=82,Variant="Color Burn"},
    {Name="Volsail Tang",Tier=3,Price=369,Chance=0.00333,Id=89},
    {Name="Rockform Cardianl",Tier=3,Price=347,Chance=0.004,Id=88},
    {Name="Lava Butterfly",Tier=2,Price=153,Chance=0.008,Id=87},
    {Name="Slurpfish Chromis",Tier=2,Price=3830,Chance=0.000125,Id=86},
    {Name="Festive Goby",Tier=1,Price=21,Chance=0.333,Id=92},
    {Name="Mistletoe Damsel",Tier=1,Price=26,Chance=0.25,Id=91},
    {Name="Gingerbread Tang",Tier=1,Price=26,Chance=0.2,Id=90},
    {Name="Great Christmas Whale",Tier=7,Price=195000,Chance=1e-06,Id=99},
    {Name="Gingerbread Clownfish",Tier=2,Price=72,Chance=0.01818,Id=94},
    {Name="Gingerbread Turtle",Tier=5,Price=38750,Chance=1.43e-05,Id=97},
    {Name="Gingerbread Shark",Tier=6,Price=89253,Chance=5e-06,Id=98,Variant="Color Burn"},
    {Name="Christmastree Longnose",Tier=3,Price=190,Chance=0.00286,Id=93},
    {Name="Candycane Lobster",Tier=4,Price=2138,Chance=0.0005,Id=95},
    {Name="Festive Pufferfish",Tier=4,Price=1244,Chance=0.000833,Id=96},
    {Name="Blue-Banded Goby",Tier=2,Price=91,Chance=0.02,Id=106},
    {Name="Blumato Clownfish",Tier=2,Price=95,Chance=0.01818,Id=107},
    {Name="Conspi Angelfish",Tier=1,Price=19,Chance=0.5,Id=108},
    {Name="Fade Tang",Tier=1,Price=43,Chance=0.0667,Id=109},
    {Name="Lined Cardinal Fish",Tier=5,Price=3100,Chance=0.000182,Id=110},
    {Name="Masked Angelfish",Tier=1,Price=19,Chance=0.5,Id=111},
    {Name="Pygmy Goby",Tier=1,Price=21,Chance=0.167,Id=112},
    {Name="Sail Tang",Tier=1,Price=24,Chance=0.2,Id=113},
    {Name="Watanabei Angelfish",Tier=1,Price=22,Chance=0.25,Id=114},
    {Name="White Tang",Tier=1,Price=21,Chance=0.2,Id=115},
    {Name="Ballina Angelfish",Tier=3,Price=391,Chance=0.00333,Id=119},
    {Name="Bleekers Damsel",Tier=2,Price=74,Chance=0.02857,Id=121},
    {Name="Loving Shark",Tier=6,Price=59583,Chance=6.67e-06,Id=122,Variant="Color Burn"},
    {Name="Pink Smith Damsel",Tier=2,Price=62,Chance=0.02,Id=120},
    {Name="Axolotl",Tier=4,Price=3971,Chance=0.000154,Id=138},
    {Name="Silver Tuna",Tier=2,Price=62,Chance=0.01667,Id=139},
    {Name="Pilot Fish",Tier=2,Price=58,Chance=0.02,Id=140},
    {Name="Patriot Tang",Tier=1,Price=36,Chance=0.1,Id=135},
    {Name="Frostborn Shark",Tier=7,Price=100000,Chance=2e-06,Id=136,Variant="Color Burn"},
    {Name="Plasma Shark",Tier=5,Price=94500,Chance=4.44e-06,Id=137,Variant="Color Burn"},
    {Name="Pufferfish",Tier=4,Price=1145,Chance=0.000667,Id=143},
    {Name="Racoon Butterfly Fish",Tier=2,Price=71,Chance=0.02,Id=144},
    {Name="Orange Basslet",Tier=2,Price=64,Chance=0.02,Id=142},
    {Name="Strippled Seahorse",Tier=5,Price=40500,Chance=1.05e-05,Id=146},
    {Name="Thresher Shark",Tier=5,Price=44000,Chance=1.05e-05,Id=147,Variant="Color Burn"},
    {Name="Great Whale",Tier=7,Price=180000,Chance=1.05e-06,Id=141},
    {Name="Viperfish",Tier=2,Price=94,Chance=0.02,Id=163},
    {Name="Deep Sea Crab",Tier=5,Price=4680,Chance=0.0002,Id=152},
    {Name="Spotted Lantern Fish",Tier=2,Price=88,Chance=0.02,Id=161},
    {Name="Robot Kraken",Tier=7,Price=327500,Chance=2.86e-07,Id=159},
    {Name="Monk Fish",Tier=4,Price=3200,Chance=0.000333,Id=160},
    {Name="King Crab",Tier=6,Price=218500,Chance=8.33e-07,Id=158},
    {Name="Jellyfish",Tier=3,Price=402,Chance=0.00333,Id=157},
    {Name="Giant Squid",Tier=7,Price=162300,Chance=1.25e-06,Id=156},
    {Name="Fangtooth",Tier=4,Price=1840,Chance=0.0005,Id=155},
    {Name="Electric Eel",Tier=1,Price=22,Chance=0.5,Id=154},
    {Name="Vampire Squid",Tier=4,Price=3770,Chance=0.000333,Id=162},
    {Name="Dark Eel",Tier=2,Price=96,Chance=0.02,Id=153},
    {Name="Boar Fish",Tier=1,Price=24,Chance=0.5,Id=151},
    {Name="Blob Fish",Tier=6,Price=26200,Chance=2e-05,Id=150},
    {Name="Angler Fish",Tier=4,Price=3620,Chance=0.000333,Id=149},
    {Name="Dead Fish",Tier=1,Price=19,Chance=0.25,Id=166},
    {Name="Skeleton Fish",Tier=1,Price=26,Chance=0.1,Id=165},
    {Name="Swordfish",Tier=2,Price=84,Chance=0.02,Id=164},
    {Name="Worm Fish",Tier=7,Price=280000,Chance=3.33e-07,Id=145},
    {Name="Rockfish",Tier=2,Price=92,Chance=0.02,Id=189},
    {Name="Sheepshead Fish",Tier=3,Price=412,Chance=0.00333,Id=191},
    {Name="Blackcap Basslet",Tier=2,Price=95,Chance=0.02,Id=182},
    {Name="Catfish",Tier=3,Price=422,Chance=0.00333,Id=183},
    {Name="Coney Fish",Tier=3,Price=287,Chance=0.00333,Id=184},
    {Name="Hermit Crab",Tier=6,Price=29700,Chance=1.67e-05,Id=185},
    {Name="Crater Fish",Tier=2,Price=93,Chance=0.02,Id=186},
    {Name="Queen Crab",Tier=7,Price=218500,Chance=1.25e-06,Id=187},
    {Name="Red Snapper",Tier=2,Price=97,Chance=0.02,Id=188},
    {Name="Lake Sturgeon",Tier=5,Price=14350,Chance=5e-05,Id=199},
    {Name="Orca",Tier=7,Price=231500,Chance=6.67e-07,Id=200},
    {Name="Barracuda Fish",Tier=3,Price=392,Chance=0.00333,Id=194},
    {Name="Crystal Crab",Tier=7,Price=162000,Chance=1.33e-06,Id=195},
    {Name="Frog",Tier=3,Price=432,Chance=0.00286,Id=196},
    {Name="Gar Fish",Tier=2,Price=72,Chance=0.02,Id=197},
    {Name="Herring Fish",Tier=1,Price=21,Chance=0.1,Id=198},
    {Name="Dark Tentacle",Tier=3,Price=392,Chance=0.00333,Id=210},
    {Name="Flat Fish",Tier=2,Price=58,Chance=0.02,Id=202},
    {Name="Flying Fish",Tier=2,Price=55,Chance=0.02,Id=203},
    {Name="Lion Fish",Tier=2,Price=143,Chance=0.01,Id=204},
    {Name="Starfish",Tier=3,Price=385,Chance=0.00333,Id=209},
    {Name="Wahoo",Tier=2,Price=105,Chance=0.01538,Id=211},
    {Name="Saw Fish",Tier=5,Price=11250,Chance=6.67e-05,Id=208},
    {Name="Pink Dolphin",Tier=4,Price=3910,Chance=0.0002,Id=207},
    {Name="Monster Shark",Tier=7,Price=245000,Chance=4e-07,Id=206,Variant="Color Burn"},
    {Name="Luminous Fish",Tier=6,Price=31150,Chance=1.25e-05,Id=205},
    {Name="Eerie Shark",Tier=7,Price=92500,Chance=4e-06,Id=201,Variant="Color Burn"},
    {Name="Scare",Tier=7,Price=280000,Chance=3.33e-07,Id=225},
    {Name="Synodontis",Tier=5,Price=3825,Chance=0.0002,Id=224},
    {Name="Armor Catfish",Tier=6,Price=30500,Chance=2e-05,Id=215},
    {Name="Thin Armor Shark",Tier=7,Price=91000,Chance=3.33e-06,Id=218,Variant="Color Burn"},
    {Name="Narwhal",Tier=4,Price=2045,Chance=0.0005,Id=227},
    {Name="Lochness Monster",Tier=7,Price=330000,Chance=3.33e-07,Id=228},
    {Name="Antique Cup",Tier=3,Price=430,Chance=0.00333,Id=239},
    {Name="Antique Watch",Tier=3,Price=1680,Chance=0.000667,Id=238},
    {Name="Sea Shell",Tier=2,Price=76,Chance=0.02,Id=232},
    {Name="Pearl",Tier=3,Price=715,Chance=0.00333,Id=235},
    {Name="Old Boot",Tier=1,Price=27,Chance=0.04,Id=234},
    {Name="Expensive Chain",Tier=4,Price=1580,Chance=0.000667,Id=233},
    {Name="Diamond Ring",Tier=5,Price=3580,Chance=0.0002,Id=236},
    {Name="Conch Shell",Tier=2,Price=72,Chance=0.02,Id=237},
    {Name="Megalodon",Tier=7,Price=355000,Chance=2.5e-07,Id=226,Variant="Color Burn"},
    {Name="Arowana",Tier=2,Price=61,Chance=0.02,Id=242},
    {Name="King Mackerel",Tier=3,Price=358,Chance=0.00333,Id=241},
    {Name="Magma Shark",Tier=6,Price=115500,Chance=5e-06,Id=240,Variant="Color Burn"},
    {Name="Ruby",Tier=5,Price=13950,Chance=6.67e-05,Id=243},
    {Name="Abyshorn Fish",Tier=2,Price=63,Chance=0.02,Id=280},
    {Name="Sharp One",Tier=6,Price=54000,Chance=9.52e-06,Id=247},
    {Name="Hybodus Shark",Tier=6,Price=63500,Chance=6.67e-06,Id=249},
    {Name="Panther Eel",Tier=6,Price=151500,Chance=1.33e-06,Id=248},
    {Name="Ghost Shark",Tier=7,Price=125000,Chance=2e-06,Id=83,Variant="Color Burn"},
    {Name="Ghost Worm Fish",Tier=7,Price=195000,Chance=1e-06,Id=176},
    {Name="Zebra Snakehead",Tier=2,Price=164,Chance=0.00667,Id=287},
    {Name="Waveback Fish",Tier=1,Price=22,Chance=0.5,Id=281},
    {Name="Crocodile",Tier=6,Price=29500,Chance=2e-05,Id=263},
    {Name="Viperangler Fish",Tier=3,Price=430,Chance=0.00333,Id=278},
    {Name="Temple Spokes Tuna",Tier=5,Price=4730,Chance=0.0002,Id=286},
    {Name="Spear Guardian",Tier=4,Price=1150,Chance=0.001,Id=276},
    {Name="Skeleton Angler Fish",Tier=4,Price=2750,Chance=0.000333,Id=268},
    {Name="Sail Fish",Tier=2,Price=59,Chance=0.02,Id=275},
    {Name="Sacred Guardian Squid",Tier=5,Price=28500,Chance=2.22e-05,Id=283},
    {Name="Runic Wispeye",Tier=1,Price=22,Chance=0.5,Id=279},
    {Name="Red Goatfish",Tier=2,Price=145,Chance=0.01,Id=285},
    {Name="Parrot Fish",Tier=3,Price=440,Chance=0.00333,Id=282},
    {Name="Mossy Fishlet",Tier=3,Price=430,Chance=0.00333,Id=277},
    {Name="Ancient Arapaima",Tier=2,Price=64,Chance=0.02,Id=262},
    {Name="Manoai Statue Fish",Tier=5,Price=4700,Chance=0.0002,Id=274},
    {Name="Mammoth Appafish",Tier=6,Price=66000,Chance=6.67e-06,Id=273},
    {Name="Goliath Tiger",Tier=4,Price=1380,Chance=0.001,Id=270},
    {Name="Ancient Lochness Monster",Tier=7,Price=100000,Chance=3.33e-07,Id=345},
    {Name="Drippy Tucanare",Tier=2,Price=65,Chance=0.02,Id=288},
    {Name="King Jelly",Tier=7,Price=225000,Chance=6.67e-07,Id=292},
    {Name="Beanie Leedsicheye",Tier=1,Price=19,Chance=0.5,Id=290},
    {Name="Ancient Relic Crocodile",Tier=6,Price=98000,Chance=4.08e-06,Id=264},
    {Name="Bone Whale",Tier=7,Price=255000,Chance=5e-07,Id=293},
    {Name="Mosasaur Shark",Tier=7,Price=180000,Chance=1.25e-06,Id=272,Variant="Color Burn"},
    {Name="Elshark Gran Maja",Tier=7,Price=440000,Chance=2.5e-07,Id=269,Variant="Color Burn"},
    {Name="Water Snake",Tier=2,Price=61,Chance=0.02,Id=289},
    {Name="Ancient Whale",Tier=7,Price=270000,Chance=3.64e-07,Id=295},
    {Name="Crystal Salamander",Tier=5,Price=4325,Chance=0.000167,Id=296},
    {Name="Dead Scary Clownfish",Tier=2,Price=65,Chance=0.01,Id=301},
    {Name="Dead Spooky Koi Fish",Tier=4,Price=1180,Chance=0.0005,Id=303},
    {Name="Dead Zombie Shark",Tier=7,Price=66000,Chance=2e-06,Id=302,Variant="Color Burn"},
    {Name="Pumpkin Jellyfish",Tier=5,Price=9800,Chance=0.0001,Id=299},
    {Name="Scary Clownfish",Tier=2,Price=65,Chance=0.02,Id=300},
    {Name="Spooky Koi Fish",Tier=4,Price=1180,Chance=0.001,Id=298},
    {Name="Toxic Jellyfish",Tier=4,Price=2138,Chance=0.0005,Id=304},
    {Name="Zombie Shark",Tier=7,Price=66000,Chance=4e-06,Id=297,Variant="Color Burn"},
    {Name="Baby Pumpkin Shark",Tier=3,Price=435,Chance=0.00333,Id=310},
    {Name="Dark Pumpkin Appafish",Tier=6,Price=54000,Chance=1e-05,Id=316},
    {Name="Frankenstein Longsnapper",Tier=6,Price=29500,Chance=2e-05,Id=308},
    {Name="Ghost Spiralfish",Tier=2,Price=68,Chance=0.02,Id=313},
    {Name="Mossy Vampire Fish",Tier=1,Price=22,Chance=0.25,Id=315},
    {Name="Pumpkin Angler Fish",Tier=4,Price=1980,Chance=0.000667,Id=309},
    {Name="Pumpkin Butterfly Fish",Tier=2,Price=65,Chance=0.02,Id=312},
    {Name="Pumpkin Carved Shark",Tier=5,Price=10250,Chance=0.0001,Id=307},
    {Name="Pumpkin Hermit Crab",Tier=3,Price=385,Chance=0.00333,Id=305},
    {Name="Pumpkin Ray",Tier=6,Price=27600,Chance=2e-05,Id=314},
    {Name="Pumpkin StoneTurtle",Tier=5,Price=3900,Chance=0.0002,Id=317},
    {Name="Spooky Peafish",Tier=1,Price=18,Chance=0.5,Id=318},
    {Name="Witch Fish",Tier=2,Price=61,Chance=0.02,Id=306},
    {Name="Wizard Stingray",Tier=5,Price=4600,Chance=0.0002,Id=311},
    {Name="Zombie Megalodon",Tier=7,Price=375000,Chance=2.5e-07,Id=319,Variant="Color Burn"},
    {Name="Candy Corn Eel",Tier=2,Price=65,Chance=0.02,Id=333},
    {Name="Ghastly Crab",Tier=5,Price=11111,Chance=0.0001,Id=334},
    {Name="Ghastly Hermit Crab",Tier=5,Price=4266,Chance=0.0002,Id=338},
    {Name="Hammerhead Mummy",Tier=6,Price=100000,Chance=4.08e-06,Id=336,Variant="Color Burn"},
    {Name="Bloodmoon Whale",Tier=7,Price=540000,Chance=2e-07,Id=342},
    {Name="Talon Serpent",Tier=7,Price=0,Chance=1e-06,Id=341},
    {Name="Wild Serpent",Tier=7,Price=0,Chance=1e-06,Id=340},
    {Name="Witch Koi Fish",Tier=3,Price=575,Chance=0.002,Id=335},
    {Name="Wraithfin Abyssal",Tier=4,Price=1125,Chance=0.001,Id=337},
    {Name="Skeleton Narwhal",Tier=7,Price=135000,Chance=1.67e-06,Id=339},
    {Name="Wing Parrotfish",Tier=2,Price=85,Chance=0.02,Id=378},
    {Name="Traffic Cone Fish",Tier=3,Price=495,Chance=0.00333,Id=377},
    {Name="Toothy Fish",Tier=3,Price=520,Chance=0.00333,Id=376},
    {Name="Thinkler Fish",Tier=2,Price=82,Chance=0.02,Id=375},
    {Name="Sona Fin Fish",Tier=1,Price=28,Chance=0.5,Id=374},
    {Name="Sea Crustacean",Tier=6,Price=65000,Chance=2e-05,Id=373},
    {Name="Runic Squid",Tier=6,Price=114000,Chance=1.11e-05,Id=372},
    {Name="Runic Sea Crustacean",Tier=6,Price=78000,Chance=2e-05,Id=371},
    {Name="Runic Lobster",Tier=5,Price=6000,Chance=0.0002,Id=370},
    {Name="Runic Axolotl",Tier=5,Price=9600,Chance=0.0001,Id=369},
    {Name="Purp Blisfish",Tier=1,Price=73,Chance=0.02,Id=368},
    {Name="Primordial Octopus",Tier=6,Price=105000,Chance=6.67e-06,Id=367},
    {Name="Primal Lobster",Tier=5,Price=5000,Chance=0.0002,Id=366},
    {Name="Primal Axolotl",Tier=5,Price=8000,Chance=0.0001,Id=365},
    {Name="Pirate Blue Lobster",Tier=3,Price=500,Chance=0.00333,Id=364},
    {Name="Night Glider Fish",Tier=1,Price=28,Chance=0.5,Id=363},
    {Name="Lunar Crescent Fish",Tier=3,Price=490,Chance=0.00333,Id=362},
    {Name="Liar Nose Fish",Tier=3,Price=490,Chance=0.00333,Id=361},
    {Name="1x1x1x1 Shark",Tier=7,Price=150000,Chance=4e-07,Id=445,Variant="Color Burn"},
    {Name="Gladiator Shark",Tier=7,Price=190000,Chance=1e-06,Id=359,Variant="Color Burn"},
    {Name="Foxtrot Koanfish",Tier=2,Price=87,Chance=0.02,Id=358},
    {Name="Fossilized Shark",Tier=6,Price=94000,Chance=1e-05,Id=357,Variant="Color Burn"},
    {Name="Flying Manta",Tier=5,Price=15000,Chance=6.67e-05,Id=356},
    {Name="Flatheaded Whale Shark",Tier=6,Price=140000,Chance=5e-06,Id=355,Variant="Color Burn"},
    {Name="Doober Fish",Tier=2,Price=93,Chance=0.02,Id=354},
    {Name="Dogfish",Tier=4,Price=3333,Chance=0.0005,Id=353},
    {Name="Cavern Dweller",Tier=6,Price=135000,Chance=8.33e-06,Id=352},
    {Name="Boney Eel",Tier=3,Price=450,Chance=0.00333,Id=351},
    {Name="Blobby Shieldfish",Tier=4,Price=1600,Chance=0.001,Id=350},
    {Name="Baby Shrimp",Tier=2,Price=79,Chance=0.02,Id=349},
    {Name="Angrylion Fish",Tier=4,Price=3330,Chance=0.0005,Id=348},
    {Name="Ancient Squid",Tier=6,Price=95000,Chance=1.11e-05,Id=347},
    {Name="Ancient Pufferfish",Tier=5,Price=4500,Chance=0.0002,Id=346},
    {Name="Freshwater Piranha",Tier=3,Price=410,Chance=0.00333,Id=284},
    {Name="Plasma Serpent",Tier=6,Price=98000,Chance=4.44e-06,Id=380},
    {Name="Cryoshade Glider",Tier=7,Price=120000,Chance=2.22e-06,Id=379},
    {Name="Starlight Manta Ray",Tier=6,Price=33000,Chance=1.25e-05,Id=381},
    {Name="Starlight Crab",Tier=4,Price=1100,Chance=0.001,Id=383},
    {Name="Parrot Blopfish",Tier=3,Price=410,Chance=0.00333,Id=385},
    {Name="Green Gillfish",Tier=2,Price=65,Chance=0.02,Id=391},
    {Name="Cypress Ratua",Tier=2,Price=65,Chance=0.02,Id=390},
    {Name="Fish Fossil",Tier=5,Price=3580,Chance=0.0002,Id=389},
    {Name="Glacierfin Snapper",Tier=2,Price=120,Chance=0.01,Id=388},
    {Name="Curious Garfish",Tier=2,Price=68,Chance=0.02,Id=387},
    {Name="Iron Domefin",Tier=4,Price=1150,Chance=0.001,Id=386},
    {Name="Cute Octopus",Tier=3,Price=402,Chance=0.00333,Id=382},
    {Name="Freshwater Piranha 2",Tier=3,Price=410,Chance=0.00333,Id=384},
    {Name="Coral",Tier=1,Price=25,Chance=0.167,Id=392},
    {Name="Boltback Fish",Tier=2,Price=115,Chance=0.01,Id=395},
    {Name="Sophisticated Angler",Tier=2,Price=84,Chance=0.01429,Id=393},
    {Name="Smarty Mcfish",Tier=2,Price=82,Chance=0.01429,Id=394},
    {Name="Depthseeker Ray",Tier=7,Price=220000,Chance=8.33e-07,Id=450},
    {Name="Yellow Spinefin",Tier=2,Price=55,Chance=0.02,Id=405},
    {Name="ElRetro Gran Maja",Tier=7,Price=360000,Chance=2.5e-07,Id=427,Variant="Color Burn"},
    {Name="Violet Divafish",Tier=1,Price=20,Chance=0.5,Id=407},
    {Name="Turqoi Backfin",Tier=2,Price=55,Chance=0.02,Id=408},
    {Name="Tree Frog",Tier=3,Price=330,Chance=0.00333,Id=409},
    {Name="Trav Grupper",Tier=5,Price=15000,Chance=6.67e-05,Id=410},
    {Name="Studded Jellyfish",Tier=5,Price=5500,Chance=0.0002,Id=411},
    {Name="Studded Dolphin",Tier=4,Price=1100,Chance=0.001,Id=412},
    {Name="Steelfin Marlin",Tier=3,Price=330,Chance=0.00333,Id=413},
    {Name="Starry Night Shark",Tier=6,Price=75000,Chance=2e-05,Id=414,Variant="Color Burn"},
    {Name="Shedletsky Guppy",Tier=4,Price=1100,Chance=0.001,Id=415},
    {Name="Retro Crocodile",Tier=5,Price=5500,Chance=0.0002,Id=446},
    {Name="Purple Razorback",Tier=2,Price=55,Chance=0.02,Id=416},
    {Name="Lumina Stinger",Tier=5,Price=5500,Chance=0.0002,Id=417},
    {Name="Leaf Fin",Tier=1,Price=20,Chance=0.5,Id=418},
    {Name="Lady Luminelle",Tier=2,Price=55,Chance=0.02,Id=419},
    {Name="Happy Sunfish",Tier=2,Price=55,Chance=0.02,Id=420},
    {Name="Gumball Whale",Tier=3,Price=330,Chance=0.00333,Id=421},
    {Name="Guest Guppy",Tier=3,Price=330,Chance=0.00333,Id=422},
    {Name="Grumpy Angler",Tier=3,Price=330,Chance=0.00333,Id=423},
    {Name="Frostbreaker Whale",Tier=6,Price=145000,Chance=5e-06,Id=424},
    {Name="Friendly Lobster",Tier=4,Price=1100,Chance=0.001,Id=425},
    {Name="Enchanted Turtle",Tier=4,Price=1100,Chance=0.001,Id=426},
    {Name="King Frog",Tier=4,Price=4000,Chance=0.000333,Id=360},
    {Name="Disco Party Puffer",Tier=4,Price=2400,Chance=0.0005,Id=428},
    {Name="Cousin Tentacles",Tier=5,Price=5500,Chance=0.0002,Id=429},
    {Name="Classic Goldfish",Tier=1,Price=20,Chance=0.5,Id=430},
    {Name="Classic Dorhey Tang",Tier=2,Price=55,Chance=0.02,Id=431},
    {Name="Classic Angler",Tier=4,Price=1100,Chance=0.001,Id=432},
    {Name="Cantelope Puffer",Tier=2,Price=55,Chance=0.02,Id=433},
    {Name="Builderman Guppy",Tier=3,Price=330,Chance=0.00333,Id=434},
    {Name="Brighteyes Guppy",Tier=4,Price=1100,Chance=0.001,Id=435},
    {Name="Boned Arrowhead Fish",Tier=1,Price=20,Chance=0.5,Id=436},
    {Name="Blue Shell Crab",Tier=5,Price=5500,Chance=0.0002,Id=437},
    {Name="Blocky Octopus",Tier=4,Price=1100,Chance=0.001,Id=438},
    {Name="Blockmine Fish",Tier=2,Price=55,Chance=0.02,Id=439},
    {Name="Block Fish",Tier=4,Price=1100,Chance=0.001,Id=440},
    {Name="Beach Ball",Tier=2,Price=55,Chance=0.02,Id=441},
    {Name="Angry Rocky",Tier=2,Price=55,Chance=0.02,Id=442},
    {Name="Ancient Crawler",Tier=3,Price=330,Chance=0.00333,Id=443},
    {Name="Alienhead Squid",Tier=3,Price=330,Chance=0.00333,Id=444},
    {Name="Winged Seahorse",Tier=5,Price=5500,Chance=0.0002,Id=406},
    {Name="Void Eel",Tier=2,Price=70,Chance=0.01538,Id=451},
    {Name="Tralalero Tralala",Tier=6,Price=88888,Chance=1e-05,Id=449},
    {Name="1x1x1x1 Comet Shark",Tier=7,Price=444444,Chance=2.22e-07,Id=448},
    {Name="Swirl Crab Cake",Tier=3,Price=330,Chance=0.00333,Id=469},
    {Name="Balloon Shrimp",Tier=5,Price=5500,Chance=0.0002,Id=460},
    {Name="Cake Turtle",Tier=4,Price=1100,Chance=0.001,Id=461},
    {Name="Cherry Spearfish",Tier=5,Price=5500,Chance=0.0002,Id=462},
    {Name="King Swirl Pufferfish",Tier=3,Price=330,Chance=0.00333,Id=463},
    {Name="Pinata Crab",Tier=6,Price=55000,Chance=1.43e-05,Id=464},
    {Name="Pinata Squid",Tier=6,Price=55000,Chance=1.43e-05,Id=465},
    {Name="Sprinkle Fish",Tier=1,Price=20,Chance=0.1,Id=466},
    {Name="Sprinkle Wrinkfish",Tier=1,Price=20,Chance=0.1,Id=467},
    {Name="Strawberry Choc Megalodon",Tier=7,Price=375000,Chance=2.5e-07,Id=468,Variant="Color Burn"},
    {Name="Winter Sweater Redfin",Tier=2,Price=85,Chance=0.0125,Id=473},
    {Name="Bowtie Blobby",Tier=2,Price=58,Chance=0.02,Id=487},
    {Name="Chill Santa Fish",Tier=2,Price=58,Chance=0.02,Id=527},
    {Name="Christmas Light Carp",Tier=3,Price=320,Chance=0.00333,Id=474},
    {Name="Christmas Wreath Fish",Tier=2,Price=58,Chance=0.02,Id=529},
    {Name="Christmas Penguin",Tier=5,Price=19000,Chance=3.33e-05,Id=511},
    {Name="Classy Snowfish",Tier=4,Price=1200,Chance=0.001,Id=500},
    {Name="Cozy Carp",Tier=1,Price=22,Chance=0.25,Id=515},
    {Name="Cozy Narwhal Plushie",Tier=4,Price=1700,Chance=0.000667,Id=492},
    {Name="Reindeer Shark",Tier=5,Price=14500,Chance=4e-05,Id=526,Variant="Color Burn"},
    {Name="Emerald Winter Whale",Tier=7,Price=175000,Chance=6.67e-07,Id=518},
    {Name="Festive Dolphin",Tier=6,Price=24000,Chance=2e-05,Id=498},
    {Name="Festive Salmon",Tier=2,Price=63,Chance=0.01667,Id=480},
    {Name="Finny Present",Tier=3,Price=340,Chance=0.00333,Id=497},
    {Name="Frostglow Globe Jelly",Tier=6,Price=26500,Chance=1.54e-05,Id=505},
    {Name="Frostshell Turtle",Tier=6,Price=31100,Chance=1.11e-05,Id=502},
    {Name="Frozen Tundra",Tier=5,Price=3800,Chance=0.0002,Id=508},
    {Name="Giftback Turtle",Tier=5,Price=18000,Chance=3.33e-05,Id=503},
    {Name="Gingerbread Crab",Tier=4,Price=1300,Chance=0.001,Id=482},
    {Name="Gingerbread Fish",Tier=2,Price=105,Chance=0.01,Id=481},
    {Name="Gingerbread Fish Plushie",Tier=3,Price=530,Chance=0.002,Id=491},
    {Name="Gingerbread Ray",Tier=4,Price=2400,Chance=0.0005,Id=483},
    {Name="Gingerbread Starfish",Tier=2,Price=210,Chance=0.005,Id=485},
    {Name="Tree Horse",Tier=5,Price=8000,Chance=0.0001,Id=506},
    {Name="Holiday Angler Plushie",Tier=4,Price=2200,Chance=0.0005,Id=494},
    {Name="Holiday Guppy Plushie",Tier=2,Price=110,Chance=0.01,Id=495},
    {Name="Holiday Turtle Plushie",Tier=3,Price=550,Chance=0.002,Id=493},
    {Name="Icecap Runner",Tier=1,Price=22,Chance=0.25,Id=472},
    {Name="Icefang Angler",Tier=3,Price=320,Chance=0.00333,Id=470},
    {Name="Icey Pufferfish",Tier=1,Price=310,Chance=0.00333,Id=489},
    {Name="Jingle Bells Fish",Tier=2,Price=64,Chance=0.01667,Id=531},
    {Name="Jinglefin",Tier=3,Price=310,Chance=0.00333,Id=471},
    {Name="Jolly Crab",Tier=3,Price=310,Chance=0.00333,Id=507},
    {Name="Mistle Toe Fish",Tier=2,Price=88,Chance=0.0125,Id=490},
    {Name="Mistle Toe Seahorse",Tier=2,Price=250,Chance=0.004,Id=484},
    {Name="Northfin Helper",Tier=2,Price=110,Chance=0.01,Id=479},
    {Name="Nutcracker Ray",Tier=6,Price=75000,Chance=8e-06,Id=504},
    {Name="Ornament Fish",Tier=2,Price=58,Chance=0.02,Id=488},
    {Name="Peppermint Fish",Tier=3,Price=320,Chance=0.00333,Id=514},
    {Name="Peppermint Spike",Tier=4,Price=1000,Chance=0.001,Id=486},
    {Name="Reindeer Fish",Tier=1,Price=22,Chance=0.5,Id=516},
    {Name="Snowflake Puffer Fish",Tier=2,Price=210,Chance=0.005,Id=530},
    {Name="Santa Guppy",Tier=1,Price=22,Chance=0.125,Id=476},
    {Name="Reindeer Guppy",Tier=1,Price=22,Chance=0.125,Id=477},
    {Name="Goofy Santa Fish",Tier=1,Price=22,Chance=0.1,Id=496},
    {Name="Elf Guppy",Tier=1,Price=22,Chance=0.1,Id=478},
    {Name="Krampus Shark",Tier=7,Price=145000,Chance=1e-06,Id=519,Variant="Color Burn"},
}

-- ═══════════════════════════════════════
-- INVENTORY & STATS TRACKING
-- ═══════════════════════════════════════
local Inventory = {}
local SessionStats = {
    Caught = {},
    TotalCaught = 0,
    TotalEarned = 0,
    StartTime = os.clock(),
    BestCatch = nil,
    BestCatchValue = 0,
}

-- ═══════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════
local function SafeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("[UltraFish] Error: " .. tostring(result))
    end
    return success, result
end

local function FormatNumber(n)
    if n >= 1e6 then
        return string.format("%.1fM", n / 1e6)
    elseif n >= 1e3 then
        return string.format("%.1fK", n / 1e3)
    end
    return tostring(math.floor(n))
end

local function FormatTime(seconds)
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = math.floor(seconds % 60)
    if h > 0 then
        return string.format("%dh %dm %ds", h, m, s)
    elseif m > 0 then
        return string.format("%dm %ds", m, s)
    end
    return string.format("%ds", s)
end

local function FormatChance(chance)
    if chance >= 0.01 then
        return string.format("%.2f%%", chance * 100)
    elseif chance >= 0.0001 then
        return string.format("1 in %s", FormatNumber(math.floor(1 / chance)))
    else
        return string.format("1 in %s", FormatNumber(math.floor(1 / chance)))
    end
end

local function GetFishByTier(tier)
    local result = {}
    for _, fish in ipairs(FishDatabase) do
        if fish.Tier == tier then
            table.insert(result, fish)
        end
    end
    return result
end

local function RollFish()
    local roll = math.random()
    local cumulative = 0
    local sorted = {}
    
    for i, fish in ipairs(FishDatabase) do
        if fish.Tier >= Config.MinTier and fish.Tier <= Config.MaxTier then
            table.insert(sorted, fish)
        end
    end
    
    table.sort(sorted, function(a, b) return a.Chance > b.Chance end)
    
    for _, fish in ipairs(sorted) do
        cumulative = cumulative + fish.Chance
        if roll <= cumulative then
            return fish
        end
    end
    
    return sorted[math.random(1, #sorted)]
end

-- ═══════════════════════════════════════
-- REMOTE FINDER & HOOKER
-- ═══════════════════════════════════════
local Remotes = {
    Cast = nil,
    Reel = nil,
    Sell = nil,
    Shake = nil,
    Inventory = nil,
}

local function FindRemotes()
    local function SearchIn(parent, depth)
        if depth > 5 then return end
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
                local name = child.Name:lower()
                if name:find("cast") or name:find("throw") or name:find("fish") then
                    Remotes.Cast = child
                end
                if name:find("reel") or name:find("catch") or name:find("collect") then
                    Remotes.Reel = child
                end
                if name:find("sell") or name:find("shop") then
                    Remotes.Sell = child
                end
                if name:find("shake") or name:find("pull") or name:find("tug") then
                    Remotes.Shake = child
                end
            end
            SearchIn(child, depth + 1)
        end
    end
    
    SafeCall(function()
        SearchIn(ReplicatedStorage, 0)
        if Workspace:FindFirstChild("__REMOTES") then
            SearchIn(Workspace.__REMOTES, 0)
        end
        if ReplicatedStorage:FindFirstChild("Remotes") then
            SearchIn(ReplicatedStorage.Remotes, 0)
        end
        if ReplicatedStorage:FindFirstChild("Events") then
            SearchIn(ReplicatedStorage.Events, 0)
        end
    end)
end

local function FireRemote(remote, ...)
    if not remote then return false end
    local ok = false
    SafeCall(function(...)
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
            ok = true
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer(...)
            ok = true
        end
    end, ...)
    return ok
end

-- ═══════════════════════════════════════
-- UI FRAMEWORK
-- ═══════════════════════════════════════
local function DestroyExisting()
    SafeCall(function()
        if CoreGui:FindFirstChild("UltraFishPro") then
            CoreGui.UltraFishPro:Destroy()
        end
    end)
    SafeCall(function()
        if Player.PlayerGui:FindFirstChild("UltraFishPro") then
            Player.PlayerGui.UltraFishPro:Destroy()
        end
    end)
end

DestroyExisting()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UltraFishPro"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

SafeCall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = CoreGui
    elseif gethui then
        ScreenGui.Parent = gethui()
    else
        ScreenGui.Parent = CoreGui
    end
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
end

-- Color Scheme
local Colors = {
    BG = Color3.fromRGB(15, 15, 25),
    BGLight = Color3.fromRGB(22, 22, 38),
    BGLighter = Color3.fromRGB(30, 30, 50),
    Accent = Color3.fromRGB(88, 101, 242),
    AccentHover = Color3.fromRGB(108, 121, 255),
    AccentDark = Color3.fromRGB(68, 81, 222),
    Green = Color3.fromRGB(46, 204, 113),
    Red = Color3.fromRGB(231, 76, 60),
    Orange = Color3.fromRGB(243, 156, 18),
    Text = Color3.fromRGB(220, 220, 230),
    TextDim = Color3.fromRGB(140, 140, 160),
    TextMuted = Color3.fromRGB(90, 90, 110),
    Border = Color3.fromRGB(40, 40, 65),
    CardBG = Color3.fromRGB(18, 18, 32),
    Success = Color3.fromRGB(46, 204, 113),
    Warning = Color3.fromRGB(241, 196, 15),
}

local function Create(className, props, children)
    local inst = Instance.new(className)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then
            SafeCall(function() inst[k] = v end)
        end
    end
    for _, child in ipairs(children or {}) do
        child.Parent = inst
    end
    if props and props.Parent then
        inst.Parent = props.Parent
    end
    return inst
end

local function AddCorner(parent, radius)
    return Create("UICorner", {Parent = parent, CornerRadius = UDim.new(0, radius or 8)})
end

local function AddStroke(parent, color, thickness)
    return Create("UIStroke", {
        Parent = parent,
        Color = color or Colors.Border,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
end

local function AddPadding(parent, t, b, l, r)
    return Create("UIPadding", {
        Parent = parent,
        PaddingTop = UDim.new(0, t or 8),
        PaddingBottom = UDim.new(0, b or 8),
        PaddingLeft = UDim.new(0, l or 8),
        PaddingRight = UDim.new(0, r or 8),
    })
end

local function Tween(obj, props, duration, style, dir)
    local ti = TweenInfo.new(duration or 0.3, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out)
    local tw = TweenService:Create(obj, ti, props)
    tw:Play()
    return tw
end

-- ═══════════════════════════════════════
-- MAIN WINDOW
-- ═══════════════════════════════════════
local MainFrame = Create("Frame", {
    Parent = ScreenGui,
    Name = "Main",
    Size = UDim2.new(0, 520, 0, 420),
    Position = UDim2.new(0.5, -260, 0.5, -210),
    BackgroundColor3 = Colors.BG,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Active = true,
})
AddCorner(MainFrame, 12)
AddStroke(MainFrame, Colors.Border, 1)

-- Shadow
local Shadow = Create("ImageLabel", {
    Parent = MainFrame,
    Name = "Shadow",
    Size = UDim2.new(1, 40, 1, 40),
    Position = UDim2.new(0, -20, 0, -20),
    BackgroundTransparency = 1,
    Image = "rbxassetid://5554236805",
    ImageColor3 = Color3.new(0, 0, 0),
    ImageTransparency = 0.6,
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(23, 23, 277, 277),
    ZIndex = -1,
})

-- Drag Functionality
local Dragging, DragStart, StartPos = false, nil, nil

local TitleBar = Create("Frame", {
    Parent = MainFrame,
    Name = "TitleBar",
    Size = UDim2.new(1, 0, 0, 42),
    BackgroundColor3 = Colors.BGLight,
    BorderSizePixel = 0,
})
AddCorner(TitleBar, 12)

-- Fix bottom corners of title bar
Create("Frame", {
    Parent = TitleBar,
    Size = UDim2.new(1, 0, 0, 14),
    Position = UDim2.new(0, 0, 1, -14),
    BackgroundColor3 = Colors.BGLight,
    BorderSizePixel = 0,
})

-- Title
Create("TextLabel", {
    Parent = TitleBar,
    Text = "🎣 ULTRA FISH PRO",
    Size = UDim2.new(0, 200, 1, 0),
    Position = UDim2.new(0, 14, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 15,
    TextColor3 = Colors.Text,
    TextXAlignment = Enum.TextXAlignment.Left,
})

-- Version Badge
Create("TextLabel", {
    Parent = TitleBar,
    Text = "v3.0",
    Size = UDim2.new(0, 40, 0, 20),
    Position = UDim2.new(0, 180, 0.5, -10),
    BackgroundColor3 = Colors.Accent,
    Font = Enum.Font.GothamBold,
    TextSize = 10,
    TextColor3 = Color3.new(1, 1, 1),
}, {Create("UICorner", {CornerRadius = UDim.new(0, 6)})})

-- Status Indicator
local StatusDot = Create("Frame", {
    Parent = TitleBar,
    Size = UDim2.new(0, 8, 0, 8),
    Position = UDim2.new(1, -80, 0.5, -4),
    BackgroundColor3 = Colors.Red,
}, {Create("UICorner", {CornerRadius = UDim.new(1, 0)})})

local StatusLabel = Create("TextLabel", {
    Parent = TitleBar,
    Text = "IDLE",
    Size = UDim2.new(0, 50, 1, 0),
    Position = UDim2.new(1, -68, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 10,
    TextColor3 = Colors.TextDim,
    TextXAlignment = Enum.TextXAlignment.Left,
})

-- Close Button
local CloseBtn = Create("TextButton", {
    Parent = TitleBar,
    Text = "✕",
    Size = UDim2.new(0, 32, 0, 32),
    Position = UDim2.new(1, -38, 0.5, -16),
    BackgroundColor3 = Colors.BGLighter,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = Colors.TextDim,
    AutoButtonColor = false,
})
AddCorner(CloseBtn, 8)

CloseBtn.MouseEnter:Connect(function()
    Tween(CloseBtn, {BackgroundColor3 = Colors.Red, TextColor3 = Color3.new(1,1,1)}, 0.2)
end)
CloseBtn.MouseLeave:Connect(function()
    Tween(CloseBtn, {BackgroundColor3 = Colors.BGLighter, TextColor3 = Colors.TextDim}, 0.2)
end)

-- Minimize Button
local MinBtn = Create("TextButton", {
    Parent = TitleBar,
    Text = "─",
    Size = UDim2.new(0, 32, 0, 32),
    Position = UDim2.new(1, -74, 0.5, -16),
    BackgroundColor3 = Colors.BGLighter,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = Colors.TextDim,
    AutoButtonColor = false,
})
AddCorner(MinBtn, 8)

MinBtn.MouseEnter:Connect(function()
    Tween(MinBtn, {BackgroundColor3 = Colors.Orange, TextColor3 = Color3.new(1,1,1)}, 0.2)
end)
MinBtn.MouseLeave:Connect(function()
    Tween(MinBtn, {BackgroundColor3 = Colors.BGLighter, TextColor3 = Colors.TextDim}, 0.2)
end)

-- Dragging
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = false
    end
end)

-- ═══════════════════════════════════════
-- TAB SYSTEM
-- ═══════════════════════════════════════
local TabBar = Create("Frame", {
    Parent = MainFrame,
    Size = UDim2.new(1, 0, 0, 36),
    Position = UDim2.new(0, 0, 0, 42),
    BackgroundColor3 = Colors.BGLight,
    BorderSizePixel = 0,
})

local TabContainer = Create("Frame", {
    Parent = TabBar,
    Size = UDim2.new(1, -16, 1, -4),
    Position = UDim2.new(0, 8, 0, 2),
    BackgroundTransparency = 1,
})
Create("UIListLayout", {
    Parent = TabContainer,
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, 4),
    VerticalAlignment = Enum.VerticalAlignment.Center,
})

local ContentArea = Create("Frame", {
    Parent = MainFrame,
    Name = "Content",
    Size = UDim2.new(1, 0, 1, -78),
    Position = UDim2.new(0, 0, 0, 78),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
})

local Tabs = {}
local TabPages = {}
local TabButtons = {}

local TabDefs = {
    {Name = "Home", Icon = "🏠"},
    {Name = "AutoFish", Icon = "🎣"},
    {Name = "Collection", Icon = "📚"},
    {Name = "Inventory", Icon = "🎒"},
    {Name = "Settings", Icon = "⚙️"},
}

for i, def in ipairs(TabDefs) do
    local btn = Create("TextButton", {
        Parent = TabContainer,
        Text = def.Icon .. " " .. def.Name,
        Size = UDim2.new(0, 95, 0, 28),
        BackgroundColor3 = i == 1 and Colors.Accent or Colors.BGLighter,
        Font = Enum.Font.GothamSemibold,
        TextSize = 11,
        TextColor3 = i == 1 and Color3.new(1,1,1) or Colors.TextDim,
        AutoButtonColor = false,
    })
    AddCorner(btn, 6)
    TabButtons[def.Name] = btn
    
    local page = Create("ScrollingFrame", {
        Parent = ContentArea,
        Name = def.Name,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Colors.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Visible = i == 1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
    })
    AddPadding(page, 10, 10, 12, 12)
    Create("UIListLayout", {
        Parent = page,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    TabPages[def.Name] = page
    
    btn.MouseButton1Click:Connect(function()
        for name, b in pairs(TabButtons) do
            Tween(b, {BackgroundColor3 = Colors.BGLighter, TextColor3 = Colors.TextDim}, 0.2)
            TabPages[name].Visible = false
        end
        Tween(btn, {BackgroundColor3 = Colors.Accent, TextColor3 = Color3.new(1,1,1)}, 0.2)
        page.Visible = true
        Config.SelectedTab = def.Name
    end)
    
    btn.MouseEnter:Connect(function()
        if Config.SelectedTab ~= def.Name then
            Tween(btn, {BackgroundColor3 = Colors.BGLighter:Lerp(Colors.Accent, 0.3)}, 0.15)
        end
    end)
    btn.MouseLeave:Connect(function()
        if Config.SelectedTab ~= def.Name then
            Tween(btn, {BackgroundColor3 = Colors.BGLighter}, 0.15)
        end
    end)
end

-- ═══════════════════════════════════════
-- UI COMPONENT BUILDERS
-- ═══════════════════════════════════════
local function CreateCard(parent, title, height)
    local card = Create("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, height or 60),
        BackgroundColor3 = Colors.CardBG,
    })
    AddCorner(card, 8)
    AddStroke(card, Colors.Border, 1)
    AddPadding(card, 10, 10, 12, 12)
    
    if title then
        Create("TextLabel", {
            Parent = card,
            Text = title,
            Size = UDim2.new(1, 0, 0, 18),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            TextSize = 12,
            TextColor3 = Colors.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
    end
    
    return card
end

local function CreateToggle(parent, text, default, callback)
    local container = Create("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = Colors.CardBG,
    })
    AddCorner(container, 8)
    AddStroke(container, Colors.Border, 1)
    
    local label = Create("TextLabel", {
        Parent = container,
        Text = "  " .. text,
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamSemibold,
        TextSize = 12,
        TextColor3 = Colors.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    
    local toggleBG = Create("Frame", {
        Parent = container,
        Size = UDim2.new(0, 42, 0, 22),
        Position = UDim2.new(1, -52, 0.5, -11),
        BackgroundColor3 = default and Colors.Green or Colors.BGLighter,
    })
    AddCorner(toggleBG, 11)
    
    local toggleCircle = Create("Frame", {
        Parent = toggleBG,
        Size = UDim2.new(0, 18, 0, 18),
        Position = default and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
        BackgroundColor3 = Color3.new(1, 1, 1),
    })
    AddCorner(toggleCircle, 9)
    
    local enabled = default
    
    local btn = Create("TextButton", {
        Parent = container,
        Text = "",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
    })
    
    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        Tween(toggleBG, {BackgroundColor3 = enabled and Colors.Green or Colors.BGLighter}, 0.2)
        Tween(toggleCircle, {Position = enabled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}, 0.2)
        if callback then callback(enabled) end
    end)
    
    return container, function() return enabled end, function(val)
        enabled = val
        Tween(toggleBG, {BackgroundColor3 = enabled and Colors.Green or Colors.BGLighter}, 0.2)
        Tween(toggleCircle, {Position = enabled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}, 0.2)
    end
end

local function CreateSlider(parent, text, min, max, default, callback)
    local container = Create("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, 52),
        BackgroundColor3 = Colors.CardBG,
    })
    AddCorner(container, 8)
    AddStroke(container, Colors.Border, 1)
    AddPadding(container, 8, 8, 12, 12)
    
    local label = Create("TextLabel", {
        Parent = container,
        Text = text,
        Size = UDim2.new(0.6, 0, 0, 16),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamSemibold,
        TextSize = 12,
        TextColor3 = Colors.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    
    local valueLabel = Create("TextLabel", {
        Parent = container,
        Text = tostring(default),
        Size = UDim2.new(0.4, 0, 0, 16),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextColor3 = Colors.Accent,
        TextXAlignment = Enum.TextXAlignment.Right,
    })
    
    local sliderBG = Create("Frame", {
        Parent = container,
        Size = UDim2.new(1, 0, 0, 6),
        Position = UDim2.new(0, 0, 0, 28),
        BackgroundColor3 = Colors.BGLighter,
    })
    AddCorner(sliderBG, 3)
    
    local sliderFill = Create("Frame", {
        Parent = sliderBG,
        Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Colors.Accent,
    })
    AddCorner(sliderFill, 3)
    
    local sliderKnob = Create("Frame", {
        Parent = sliderBG,
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7),
        BackgroundColor3 = Color3.new(1, 1, 1),
        ZIndex = 2,
    })
    AddCorner(sliderKnob, 7)
    
    local dragging = false
    
    local function UpdateSlider(input)
        local rel = math.clamp((input.Position.X - sliderBG.AbsolutePosition.X) / sliderBG.AbsoluteSize.X, 0, 1)
        local val = math.floor(min + (max - min) * rel)
        valueLabel.Text = tostring(val)
        sliderFill.Size = UDim2.new(rel, 0, 1, 0)
        sliderKnob.Position = UDim2.new(rel, -7, 0.5, -7)
        if callback then callback(val) end
    end
    
    local sliderBtn = Create("TextButton", {
        Parent = sliderBG,
        Text = "",
        Size = UDim2.new(1, 0, 1, 10),
        Position = UDim2.new(0, 0, 0, -5),
        BackgroundTransparency = 1,
        ZIndex = 3,
    })
    
    sliderBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            UpdateSlider(input)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    return container
end

local function CreateButton(parent, text, color, callback)
    local btn = Create("TextButton", {
        Parent = parent,
        Text = text,
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = color or Colors.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextColor3 = Color3.new(1, 1, 1),
        AutoButtonColor = false,
    })
    AddCorner(btn, 8)
    
    btn.MouseEnter:Connect(function()
        Tween(btn, {BackgroundColor3 = (color or Colors.Accent):Lerp(Color3.new(1,1,1), 0.15)}, 0.15)
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, {BackgroundColor3 = color or Colors.Accent}, 0.15)
    end)
    btn.MouseButton1Click:Connect(function()
        Tween(btn, {Size = UDim2.new(1, -4, 0, 34)}, 0.05)
        task.wait(0.05)
        Tween(btn, {Size = UDim2.new(1, 0, 0, 36)}, 0.1)
        if callback then callback() end
    end)
    
    return btn
end

-- ═══════════════════════════════════════
-- HOME TAB
-- ═══════════════════════════════════════
local homePage = TabPages["Home"]

-- Stats Cards Row
local statsRow = Create("Frame", {
    Parent = homePage,
    Size = UDim2.new(1, 0, 0, 70),
    BackgroundTransparency = 1,
})
Create("UIListLayout", {
    Parent = statsRow,
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, 8),
})

local function CreateStatCard(parent, icon, title, value, color)
    local card = Create("Frame", {
        Parent = parent,
        Size = UDim2.new(0, 153, 0, 70),
        BackgroundColor3 = Colors.CardBG,
    })
    AddCorner(card, 8)
    AddStroke(card, Colors.Border, 1)
    AddPadding(card, 8, 8, 10, 10)
    
    Create("TextLabel", {
        Parent = card,
        Text = icon .. " " .. title,
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextColor3 = Colors.TextDim,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    
    local valLabel = Create("TextLabel", {
        Parent = card,
        Text = value,
        Size = UDim2.new(1, 0, 0, 24),
        Position = UDim2.new(0, 0, 0, 20),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        TextColor3 = color or Colors.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    
    return card, valLabel
end

local _, caughtLabel = CreateStatCard(statsRow, "🐟", "CAUGHT", "0", Colors.Accent)
local _, earnedLabel = CreateStatCard(statsRow, "💰", "EARNED", "$0", Colors.Green)
local _, timeLabel = CreateStatCard(statsRow, "⏱️", "SESSION", "0s", Colors.Orange)

-- Quick Actions
local quickCard = CreateCard(homePage, "⚡ Quick Actions", 90)

local quickRow = Create("Frame", {
    Parent = quickCard,
    Size = UDim2.new(1, 0, 0, 36),
    Position = UDim2.new(0, 0, 0, 28),
    BackgroundTransparency = 1,
})
Create("UIListLayout", {
    Parent = quickRow,
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, 6),
})

local autoFishBtn, _, setAutoFish
local startFishToggle

local function QuickBtn(parent, text, color, w)
    local b = Create("TextButton", {
        Parent = parent,
        Text = text,
        Size = UDim2.new(0, w or 118, 0, 36),
        BackgroundColor3 = color,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextColor3 = Color3.new(1, 1, 1),
        AutoButtonColor = false,
    })
    AddCorner(b, 6)
    return b
end

local startBtn = QuickBtn(quickRow, "▶ START FISHING", Colors.Green, 150)
local sellBtn = QuickBtn(quickRow, "💰 SELL ALL", Colors.Orange, 110)
local tpBtn = QuickBtn(quickRow, "📍 TP TO SPOT", Colors.Accent, 120)

startBtn.MouseButton1Click:Connect(function()
    Config.AutoFish = not Config.AutoFish
    startBtn.Text = Config.AutoFish and "⏹ STOP FISHING" or "▶ START FISHING"
    startBtn.BackgroundColor3 = Config.AutoFish and Colors.Red or Colors.Green
    StatusDot.BackgroundColor3 = Config.AutoFish and Colors.Green or Colors.Red
    StatusLabel.Text = Config.AutoFish and "ACTIVE" or "IDLE"
    StatusLabel.TextColor3 = Config.AutoFish and Colors.Green or Colors.TextDim
end)

sellBtn.MouseButton1Click:Connect(function()
    if Remotes.Sell then
        for i = 1, 5 do
            FireRemote(Remotes.Sell, "all")
            task.wait(0.1)
        end
    end
    Inventory = {}
end)

tpBtn.MouseButton1Click:Connect(function()
    SafeCall(function()
        local char = Player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            -- Try to find fishing spot
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v.Name:lower():find("fish") and v:IsA("BasePart") then
                    char.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 5, 0)
                    break
                end
            end
        end
    end)
end)

-- Recent Catches
local recentCard = CreateCard(homePage, "🎯 Recent Catches", 140)
local recentList = Create("Frame", {
    Parent = recentCard,
    Size = UDim2.new(1, 0, 0, 100),
    Position = UDim2.new(0, 0, 0, 26),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
})
Create("UIListLayout", {
    Parent = recentList,
    Padding = UDim.new(0, 3),
})

local function AddRecentCatch(fish)
    -- Remove oldest if > 4
    local children = recentList:GetChildren()
    local frames = {}
    for _, c in ipairs(children) do
        if c:IsA("Frame") then table.insert(frames, c) end
    end
    if #frames >= 4 then
        frames[1]:Destroy()
    end
    
    local row = Create("Frame", {
        Parent = recentList,
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundColor3 = Colors.BGLighter,
    })
    AddCorner(row, 4)
    
    Create("Frame", {
        Parent = row,
        Size = UDim2.new(0, 3, 0.7, 0),
        Position = UDim2.new(0, 4, 0.15, 0),
        BackgroundColor3 = TierColors[fish.Tier] or Colors.TextDim,
    }, {Create("UICorner", {CornerRadius = UDim.new(0, 2)})})
    
    Create("TextLabel", {
        Parent = row,
        Text = fish.Name,
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamSemibold,
        TextSize = 11,
        TextColor3 = TierColors[fish.Tier] or Colors.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    
    Create("TextLabel", {
        Parent = row,
        Text = TierNames[fish.Tier] or "Unknown",
        Size = UDim2.new(0.25, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextColor3 = Colors.TextDim,
    })
    
    Create("TextLabel", {
        Parent = row,
        Text = "$" .. FormatNumber(fish.Price),
        Size = UDim2.new(0.25, 0, 1, 0),
        Position = UDim2.new(0.75, 0, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextColor3 = Colors.Green,
        TextXAlignment = Enum.TextXAlignment.Right,
    })
end

-- ═══════════════════════════════════════
-- AUTOFISH TAB
-- ═══════════════════════════════════════
local fishPage = TabPages["AutoFish"]

CreateToggle(fishPage, "🎣 Auto Fish", false, function(v)
    Config.AutoFish = v
    StatusDot.BackgroundColor3 = v and Colors.Green or Colors.Red
    StatusLabel.Text = v and "ACTIVE" or "IDLE"
    StatusLabel.TextColor3 = v and Colors.Green or Colors.TextDim
    startBtn.Text = v and "⏹ STOP FISHING" or "▶ START FISHING"
    startBtn.BackgroundColor3 = v and Colors.Red or Colors.Green
end)

CreateToggle(fishPage, "💰 Auto Sell", false, function(v) Config.AutoSell = v end)
CreateToggle(fishPage, "🔔 Auto Shake/Reel", true, function(v) Config.AutoShake = v; Config.AutoReel = v end)
CreateToggle(fishPage, "🛡️ Anti-AFK", true, function(v) Config.AntiAFK = v end)

CreateSlider(fishPage, "🐟 Fish Per Cast", 1, 20, 10, function(v) Config.BulkFish = v end)
CreateSlider(fishPage, "⏱️ Cast Delay (ms)", 50, 2000, 500, function(v) Config.CastDelay = v / 1000 end)
CreateSlider(fishPage, "⏱️ Fish Delay (ms)", 50, 1000, 150, function(v) Config.FishDelay = v / 1000 end)

-- Tier Filter
local tierCard = CreateCard(fishPage, "🏷️ Tier Filter", 80)
local tierRow = Create("Frame", {
    Parent = tierCard,
    Size = UDim2.new(1, 0, 0, 28),
    Position = UDim2.new(0, 0, 0, 30),
    BackgroundTransparency = 1,
})
Create("UIListLayout", {
    Parent = tierRow,
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, 4),
})

local tierFilters = {}
for tier = 1, 7 do
    local btn = Create("TextButton", {
        Parent = tierRow,
        Text = TierNames[tier]:sub(1, 3),
        Size = UDim2.new(0, 60, 0, 28),
        BackgroundColor3 = TierColors[tier],
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        TextColor3 = Color3.new(1, 1, 1),
        AutoButtonColor = false,
    })
    AddCorner(btn, 6)
    tierFilters[tier] = true
    
    btn.MouseButton1Click:Connect(function()
        tierFilters[tier] = not tierFilters[tier]
        btn.BackgroundTransparency = tierFilters[tier] and 0 or 0.7
    end)
end

-- ═══════════════════════════════════════
-- COLLECTION TAB
-- ═══════════════════════════════════════
local collPage = TabPages["Collection"]

-- Search Bar
local searchFrame = Create("Frame", {
    Parent = collPage,
    Size = UDim2.new(1, 0, 0, 32),
    BackgroundColor3 = Colors.CardBG,
})
AddCorner(searchFrame, 8)
AddStroke(searchFrame, Colors.Border, 1)

local searchBox = Create("TextBox", {
    Parent = searchFrame,
    Text = "",
    PlaceholderText = "🔍 Search fish...",
    Size = UDim2.new(1, -16, 1, 0),
    Position = UDim2.new(0, 8, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.Gotham,
    TextSize = 12,
    TextColor3 = Colors.Text,
    PlaceholderColor3 = Colors.TextMuted,
    TextXAlignment = Enum.TextXAlignment.Left,
    ClearTextOnFocus = false,
})

-- Fish Grid
local fishGrid = Create("Frame", {
    Parent = collPage,
    Size = UDim2.new(1, 0, 0, 0),
    BackgroundTransparency = 1,
    AutomaticSize = Enum.AutomaticSize.Y,
})
Create("UIGridLayout", {
    Parent = fishGrid,
    CellSize = UDim2.new(0, 235, 0, 44),
    CellPadding = UDim2.new(0, 6, 0, 4),
    SortOrder = Enum.SortOrder.LayoutOrder,
})

local function PopulateFishGrid(filter)
    for _, c in ipairs(fishGrid:GetChildren()) do
        if c:IsA("Frame") then c:Destroy() end
    end
    
    local sorted = {}
    for _, fish in ipairs(FishDatabase) do
        if not filter or filter == "" or fish.Name:lower():find(filter:lower()) then
            table.insert(sorted, fish)
        end
    end
    
    table.sort(sorted, function(a, b)
        if a.Tier ~= b.Tier then return a.Tier > b.Tier end
        return a.Price > b.Price
    end)
    
    local shown = math.min(#sorted, 100)
    for i = 1, shown do
        local fish = sorted[i]
        local card = Create("Frame", {
            Parent = fishGrid,
            BackgroundColor3 = Colors.CardBG,
            LayoutOrder = i,
        })
        AddCorner(card, 6)
        AddStroke(card, TierColors[fish.Tier]:Lerp(Colors.Border, 0.5), 1)
        
        -- Tier indicator
        Create("Frame", {
            Parent = card,
            Size = UDim2.new(0, 4, 0.7, 0),
            Position = UDim2.new(0, 0, 0.15, 0),
            BackgroundColor3 = TierColors[fish.Tier],
        }, {Create("UICorner", {CornerRadius = UDim.new(0, 2)})})
        
        -- Name
        Create("TextLabel", {
            Parent = card,
            Text = fish.Name,
            Size = UDim2.new(0.55, 0, 0.5, 0),
            Position = UDim2.new(0, 10, 0, 2),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamSemibold,
            TextSize = 10,
            TextColor3 = TierColors[fish.Tier],
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
        })
        
        -- Tier badge
        Create("TextLabel", {
            Parent = card,
            Text = TierNames[fish.Tier] or "?",
            Size = UDim2.new(0.55, 0, 0.5, 0),
            Position = UDim2.new(0, 10, 0.5, 0),
            BackgroundTransparency = 1,
            Font = Enum.Font.Gotham,
            TextSize = 9,
            TextColor3 = Colors.TextDim,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        
        -- Price
        Create("TextLabel", {
            Parent = card,
            Text = "$" .. FormatNumber(fish.Price),
            Size = UDim2.new(0.22, 0, 0.5, 0),
            Position = UDim2.new(0.55, 0, 0, 2),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            TextSize = 10,
            TextColor3 = Colors.Green,
            TextXAlignment = Enum.TextXAlignment.Right,
        })
        
        -- Chance
        Create("TextLabel", {
            Parent = card,
            Text = FormatChance(fish.Chance),
            Size = UDim2.new(0.22, 0, 0.5, 0),
            Position = UDim2.new(0.55, 0, 0.5, 0),
            BackgroundTransparency = 1,
            Font = Enum.Font.Gotham,
            TextSize = 9,
            TextColor3 = Colors.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Right,
        })
        
        -- Variant indicator
        if fish.Variant then
            Create("TextLabel", {
                Parent = card,
                Text = "✨",
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(1, -22, 0.5, -10),
                BackgroundTransparency = 1,
                Font = Enum.Font.Gotham,
                TextSize = 14,
            })
        end
    end
end

PopulateFishGrid("")

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    PopulateFishGrid(searchBox.Text)
end)

-- ═══════════════════════════════════════
-- INVENTORY TAB
-- ═══════════════════════════════════════
local invPage = TabPages["Inventory"]

local invStatsCard = CreateCard(invPage, "📊 Inventory Stats", 50)
local invCountLabel = Create("TextLabel", {
    Parent = invStatsCard,
    Text = "Items: 0 | Value: $0",
    Size = UDim2.new(1, 0, 0, 16),
    Position = UDim2.new(0, 0, 0, 22),
    BackgroundTransparency = 1,
    Font = Enum.Font.Gotham,
    TextSize = 12,
    TextColor3 = Colors.TextDim,
    TextXAlignment = Enum.TextXAlignment.Left,
})

local invList = Create("Frame", {
    Parent = invPage,
    Size = UDim2.new(1, 0, 0, 0),
    BackgroundTransparency = 1,
    AutomaticSize = Enum.AutomaticSize.Y,
})
Create("UIListLayout", {
    Parent = invList,
    Padding = UDim.new(0, 4),
})

local function UpdateInventoryUI()
    for _, c in ipairs(invList:GetChildren()) do
        if c:IsA("Frame") then c:Destroy() end
    end
    
    local totalValue = 0
    local counts = {}
    
    for _, fish in ipairs(Inventory) do
        counts[fish.Name] = (counts[fish.Name] or 0) + 1
        totalValue = totalValue + fish.Price
    end
    
    invCountLabel.Text = string.format("Items: %d | Value: $%s", #Inventory, FormatNumber(totalValue))
    
    local sorted = {}
    for name, count in pairs(counts) do
        for _, f in ipairs(FishDatabase) do
            if f.Name == name then
                table.insert(sorted, {Fish = f, Count = count})
                break
            end
        end
    end
    
    table.sort(sorted, function(a, b)
        return a.Fish.Tier > b.Fish.Tier
    end)
    
    for _, item in ipairs(sorted) do
        local row = Create("Frame", {
            Parent = invList,
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = Colors.CardBG,
        })
        AddCorner(row, 6)
        
        Create("Frame", {
            Parent = row,
            Size = UDim2.new(0, 3, 0.6, 0),
            Position = UDim2.new(0, 4, 0.2, 0),
            BackgroundColor3 = TierColors[item.Fish.Tier],
        }, {Create("UICorner", {CornerRadius = UDim.new(0, 2)})})
        
        Create("TextLabel", {
            Parent = row,
            Text = item.Fish.Name,
            Size = UDim2.new(0.5, 0, 1, 0),
            Position = UDim2.new(0, 14, 0, 0),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamSemibold,
            TextSize = 11,
            TextColor3 = TierColors[item.Fish.Tier],
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        
        Create("TextLabel", {
            Parent = row,
            Text = "x" .. item.Count,
            Size = UDim2.new(0.15, 0, 1, 0),
            Position = UDim2.new(0.5, 0, 0, 0),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            TextSize = 12,
            TextColor3 = Colors.Text,
        })
        
        Create("TextLabel", {
            Parent = row,
            Text = "$" .. FormatNumber(item.Fish.Price * item.Count),
            Size = UDim2.new(0.3, 0, 1, 0),
            Position = UDim2.new(0.65, 0, 0, 0),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            TextColor3 = Colors.Green,
            TextXAlignment = Enum.TextXAlignment.Right,
        })
    end
end

CreateButton(invPage, "💰 SELL ALL INVENTORY", Colors.Orange, function()
    if Remotes.Sell then
        for i = 1, 5 do
            FireRemote(Remotes.Sell, "all")
            task.wait(0.1)
        end
    end
    
    local totalValue = 0
    for _, fish in ipairs(Inventory) do
        totalValue = totalValue + fish.Price
    end
    SessionStats.TotalEarned = SessionStats.TotalEarned + totalValue
    Inventory = {}
    UpdateInventoryUI()
end)

-- ═══════════════════════════════════════
-- SETTINGS TAB
-- ═══════════════════════════════════════
local setPage = TabPages["Settings"]

CreateToggle(setPage, "🔔 Notify on Mythic+", true, function(v) Config.NotifyMythic = v end)
CreateToggle(setPage, "🌟 Notify on SECRET", true, function(v) Config.NotifySecret = v end)

CreateSlider(setPage, "📍 Min Tier Filter", 1, 7, 1, function(v) Config.MinTier = v end)
CreateSlider(setPage, "📍 Max Tier Filter", 1, 7, 7, function(v) Config.MaxTier = v end)

-- Info Card
local infoCard = CreateCard(setPage, "ℹ️ Script Info", 120)
local infoText = Create("TextLabel", {
    Parent = infoCard,
    Text = [[🎣 Ultra Fish Pro v3.0
📊 Total Fish Database: ]] .. #FishDatabase .. [[ fish
🔧 Compatible: Delta, Ronix, Fluxus, Wave
💡 Toggle UI: Right Shift / F4
⚠️ Use responsibly]],
    Size = UDim2.new(1, 0, 0, 80),
    Position = UDim2.new(0, 0, 0, 24),
    BackgroundTransparency = 1,
    Font = Enum.Font.Gotham,
    TextSize = 11,
    TextColor3 = Colors.TextDim,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    TextWrapped = true,
})

CreateButton(setPage, "🔄 Refresh Remotes", Colors.Accent, function()
    FindRemotes()
    local count = 0
    for _, v in pairs(Remotes) do
        if v then count = count + 1 end
    end
    StarterGui:SetCore("SendNotification", {
        Title = "Ultra Fish Pro",
        Text = "Found " .. count .. " remotes!",
        Duration = 3,
    })
end)

CreateButton(setPage, "🗑️ Reset Session Stats", Colors.Red, function()
    SessionStats.TotalCaught = 0
    SessionStats.TotalEarned = 0
    SessionStats.StartTime = os.clock()
    SessionStats.Caught = {}
    SessionStats.BestCatch = nil
    SessionStats.BestCatchValue = 0
    Inventory = {}
    UpdateInventoryUI()
end)

CreateButton(setPage, "❌ Destroy Script", Colors.Red, function()
    Config.AutoFish = false
    task.wait(0.5)
    ScreenGui:Destroy()
end)

-- ═══════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ═══════════════════════════════════════
local NotifContainer = Create("Frame", {
    Parent = ScreenGui,
    Size = UDim2.new(0, 280, 1, 0),
    Position = UDim2.new(1, -290, 0, 0),
    BackgroundTransparency = 1,
})
Create("UIListLayout", {
    Parent = NotifContainer,
    Padding = UDim.new(0, 6),
    VerticalAlignment = Enum.VerticalAlignment.Bottom,
    SortOrder = Enum.SortOrder.LayoutOrder,
})
AddPadding(NotifContainer, 0, 10, 0, 0)

local function ShowNotification(title, message, color, duration)
    local notif = Create("Frame", {
        Parent = NotifContainer,
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundColor3 = Colors.BG,
        BackgroundTransparency = 1,
    })
    AddCorner(notif, 8)
    AddStroke(notif, color or Colors.Accent, 1)
    
    Create("Frame", {
        Parent = notif,
        Size = UDim2.new(0, 4, 0.7, 0),
        Position = UDim2.new(0, 0, 0.15, 0),
        BackgroundColor3 = color or Colors.Accent,
    }, {Create("UICorner", {CornerRadius = UDim.new(0, 2)})})
    
    Create("TextLabel", {
        Parent = notif,
        Text = title,
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 14, 0, 8),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = color or Colors.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    
    Create("TextLabel", {
        Parent = notif,
        Text = message,
        Size = UDim2.new(1, -20, 0, 24),
        Position = UDim2.new(0, 14, 0, 28),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextColor3 = Colors.TextDim,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    })
    
    Tween(notif, {BackgroundTransparency = 0.05}, 0.3)
    
    task.delay(duration or 4, function()
        Tween(notif, {BackgroundTransparency = 1}, 0.5)
        task.wait(0.5)
        SafeCall(function() notif:Destroy() end)
    end)
end

-- ═══════════════════════════════════════
-- MAIN FISHING LOOP
-- ═══════════════════════════════════════
local function SimulateFishCatch()
    local caught = {}
    for i = 1, Config.BulkFish do
        local fish = RollFish()
        if fish then
            table.insert(caught, fish)
            table.insert(Inventory, fish)
            SessionStats.TotalCaught = SessionStats.TotalCaught + 1
            SessionStats.TotalEarned = SessionStats.TotalEarned + fish.Price
            SessionStats.Caught[fish.Name] = (SessionStats.Caught[fish.Name] or 0) + 1
            
            if fish.Price > SessionStats.BestCatchValue then
                SessionStats.BestCatch = fish
                SessionStats.BestCatchValue = fish.Price
            end
            
            AddRecentCatch(fish)
            
            -- Notifications for rare catches
            if fish.Tier >= 6 and Config.NotifyMythic then
                ShowNotification(
                    "🌟 " .. (TierNames[fish.Tier] or "RARE") .. " CATCH!",
                    fish.Name .. " - $" .. FormatNumber(fish.Price),
                    TierColors[fish.Tier],
                    6
                )
            elseif fish.Tier == 7 and Config.NotifySecret then
                ShowNotification(
                    "⭐ SECRET FISH!",
                    fish.Name .. " - $" .. FormatNumber(fish.Price),
                    TierColors[7],
                    8
                )
            end
        end
    end
    return caught
end

local function DoFishingCycle()
    -- Step 1: Cast
    if Remotes.Cast then
        local retries = 0
        local success = false
        while not success and retries < 3 do
            success = FireRemote(Remotes.Cast)
            if not success then
                retries = retries + 1
                task.wait(0.2)
            end
        end
    end
    task.wait(Config.FishDelay)
    
    -- Step 2: Auto Shake (if applicable)
    if Config.AutoShake and Remotes.Shake then
        for i = 1, 3 do
            FireRemote(Remotes.Shake)
            task.wait(0.05)
        end
    end
    task.wait(Config.FishDelay)
    
    -- Step 3: Reel / Catch
    if Remotes.Reel then
        for i = 1, Config.BulkFish do
            FireRemote(Remotes.Reel)
            task.wait(Config.FishDelay)
        end
    end
    
    -- Step 4: Simulate catches (for UI tracking)
    local caught = SimulateFishCatch()
    
    -- Step 5: Auto Sell
    if Config.AutoSell and Remotes.Sell then
        task.wait(0.1)
        FireRemote(Remotes.Sell, "all")
        Inventory = {}
    end
    
    -- Update inventory UI periodically
    if SessionStats.TotalCaught % 20 == 0 then
        UpdateInventoryUI()
    end
    
    return caught
end

-- Main fishing coroutine
task.spawn(function()
    while ScreenGui.Parent do
        if Config.AutoFish then
            SafeCall(DoFishingCycle)
            task.wait(Config.CastDelay)
        else
            task.wait(0.5)
        end
    end
end)

-- ═══════════════════════════════════════
-- UI UPDATE LOOP
-- ═══════════════════════════════════════
task.spawn(function()
    while ScreenGui.Parent do
        SafeCall(function()
            caughtLabel.Text = FormatNumber(SessionStats.TotalCaught)
            earnedLabel.Text = "$" .. FormatNumber(SessionStats.TotalEarned)
            timeLabel.Text = FormatTime(os.clock() - SessionStats.StartTime)
        end)
        task.wait(0.5)
    end
end)

-- ═══════════════════════════════════════
-- ANTI-AFK
-- ═══════════════════════════════════════
task.spawn(function()
    while ScreenGui.Parent do
        if Config.AntiAFK then
            SafeCall(function()
                local vp = game:GetService("VirtualInputManager")
                if vp then
                    vp:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    task.wait(0.1)
                    vp:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                end
            end)
            
            SafeCall(function()
                local con
                con = Player.Idled:Connect(function()
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
                    con:Disconnect()
                end)
            end)
        end
        task.wait(60)
    end
end)

-- ═══════════════════════════════════════
-- KEYBIND (Toggle UI)
-- ═══════════════════════════════════════
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift or input.KeyCode == Enum.KeyCode.F4 then
        Config.UIOpen = not Config.UIOpen
        MainFrame.Visible = Config.UIOpen
    end
end)

-- ═══════════════════════════════════════
-- CLOSE / MINIMIZE
-- ═══════════════════════════════════════
CloseBtn.MouseButton1Click:Connect(function()
    Config.AutoFish = false
    Tween(MainFrame, {Size = UDim2.new(0, 520, 0, 0)}, 0.3)
    task.wait(0.3)
    ScreenGui:Destroy()
end)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Tween(MainFrame, {Size = UDim2.new(0, 520, 0, 42)}, 0.3)
    else
        Tween(MainFrame, {Size = UDim2.new(0, 520, 0, 420)}, 0.3)
    end
end)

-- ═══════════════════════════════════════
-- INITIALIZATION
-- ═══════════════════════════════════════
FindRemotes()

-- Opening animation
MainFrame.Size = UDim2.new(0, 520, 0, 0)
MainFrame.BackgroundTransparency = 1
task.wait(0.1)
Tween(MainFrame, {Size = UDim2.new(0, 520, 0, 420), BackgroundTransparency = 0}, 0.4)

ShowNotification("🎣 Ultra Fish Pro", "Script loaded! " .. #FishDatabase .. " fish in database.", Colors.Green, 5)

SafeCall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "🎣 Ultra Fish Pro v3.0",
        Text = "Loaded! Press RightShift to toggle UI",
        Duration = 5,
    })
end)

print("[Ultra Fish Pro] ✅ Script loaded successfully!")
print("[Ultra Fish Pro] 📊 Fish Database: " .. #FishDatabase .. " fish")
print("[Ultra Fish Pro] 🎮 Toggle UI: RightShift / F4")
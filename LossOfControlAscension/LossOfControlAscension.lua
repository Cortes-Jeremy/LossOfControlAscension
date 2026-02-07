local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, addonName)
    -- On attend que l'addon qui définit CROWD_CONTROL_DATA soit chargé
    if not CROWD_CONTROL_DATA then return end

    local L = CROWD_CONTROL_DATA
    local CROWD_CONTROL_TYPE_ROOTS = CROWD_CONTROL_TYPE_ROOTS or 1
    local CROWD_CONTROL_TYPE_INCAPACITATE = CROWD_CONTROL_TYPE_INCAPACITATE or 2
    local CROWD_CONTROL_TYPE_DISORIENT = CROWD_CONTROL_TYPE_DISORIENT or 3
    local CROWD_CONTROL_TYPE_STUN = CROWD_CONTROL_TYPE_STUN or 4
    local CROWD_CONTROL_TYPE_SILENCE = CROWD_CONTROL_TYPE_SILENCE or 5
    local CROWD_CONTROL_TYPE_DISARM = CROWD_CONTROL_TYPE_DISARM or 6
    local CROWD_CONTROL_TYPE_SLOW = CROWD_CONTROL_TYPE_SLOW or 7
    local CROWD_CONTROL_TYPE_PACIFY = CROWD_CONTROL_TYPE_PACIFY or 8

    -- Exemple : ajout de nouveaux CC
    -- CROWD_CONTROL_DATA[123456] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }

    ------------------------------------------------
    -- SpellID list for Wrath of the Lich King.
    ------------------------------------------------
    -- *** Incapacitate Effects ***
    L[1249203] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Hungering Cold
    L[1102637] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Hibernate (Rank 1)
    L[1118657] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Hibernate (Rank 2)
    L[1118658] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Hibernate (Rank 3)
    L[60210]   = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Arrow Effect (Rank 1)
    L[3355]    = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Trap Effect (Rank 1)
    L[14308]   = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Trap Effect (Rank 2)
    L[14309]   = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Trap Effect (Rank 3)
    L[1160210] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Arrow Effect (Rank 1)
    L[1103355] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Trap Effect (Rank 1)
    L[1114308] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Trap Effect (Rank 2)
    L[1114309] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Freezing Trap Effect (Rank 3)
    L[1119386] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Wyvern Sting (Rank 1)
    L[1124132] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Wyvern Sting (Rank 2)
    L[1124133] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Wyvern Sting (Rank 3)
    L[1127068] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Wyvern Sting (Rank 4)
    L[1149011] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Wyvern Sting (Rank 5)
    L[1149012] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Wyvern Sting (Rank 6)
    L[1100118] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph (Rank 1)
    L[1112824] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph (Rank 2)
    L[1112825] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph (Rank 3)
    L[1112826] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph (Rank 4)
    L[1128271] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph: Turtle
    L[1128272] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph: Pig
    L[1161721] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph: Rabbit
    L[1161780] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph: Turkey
    L[1161305] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Polymorph: Black Cat
    L[1120066] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Repentance
    L[1101776] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Gouge
    L[1106770] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_SAPPED" } -- Sap (Rank 1)
    L[1102070] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_SAPPED" } -- Sap (Rank 2)
    L[1111297] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_SAPPED" } -- Sap (Rank 3)
    L[1151724] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_SAPPED" } -- Sap (Rank 4)
    L[1100710] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_BANISHED" } -- Banish (Rank 1)
    L[1118647] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_BANISHED" } -- Banish (Rank 2)
    L[1109484] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_SHACKLED" } -- Shackle Undead (Rank 1)
    L[1109485] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_SHACKLED" } -- Shackle Undead (Rank 2)
    L[1110955] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_SHACKLED" } -- Shackle Undead (Rank 3)
    L[1151514] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Hex
    L[4064]  = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Rough Copper Bomb (Item)
    L[4065]  = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Large Copper Bomb (Item)
    L[4066]  = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Small Bronze Bomb (Item)
    L[4067]  = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Big Bronze Bomb (Item)
    L[4068]  = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Iron Grenade (Item)
    L[12421] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Mithril Frag Bomb (Item)
    L[4069]  = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Big Iron Bomb (Item)
    L[12562] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- The Big One (Item)
    L[19769] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Thorium Grenade (Item)
    L[19784] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Dark Iron Bomb (Item)
    L[30216] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Fel Iron Bomb (Item)
    L[30461] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- The Bigger One (Item)
    L[30217] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Adamantite Grenade (Item)
    L[67769] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Cobalt Frag Bomb (Item)
    L[67890] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Cobalt Frag Bomb (Item, Frag Belt)
    L[54466] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Saronite Grenade (Item)
    -- Ascension
    L[2304855] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Ring of frost
    L[2110121] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Sundering
    L[2304121] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Petrification Totem Effect
    L[2305072] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Hypnosis

    -- *** Controlled Stun Effects ***
    L[47481] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Gnaw (Ghoul Pet)
    L[1105211] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Bash (Rank 1)
    L[1106798] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Bash (Rank 2)
    L[1108983] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Bash (Rank 3)
    L[1122570] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Maim (Rank 1)
    L[1149802] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Maim (Rank 2)
    L[1124394] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intimidation
    L[1150519] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Sonic Blast (Pet Rank 1)
    L[1153564] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Sonic Blast (Pet Rank 2)
    L[1153565] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Sonic Blast (Pet Rank 3)
    L[1153566] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Sonic Blast (Pet Rank 4)
    L[1153567] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Sonic Blast (Pet Rank 5)
    L[1153568] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Sonic Blast (Pet Rank 6)
    L[1150518] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Ravage (Pet Rank 1)
    L[1153558] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Ravage (Pet Rank 2)
    L[1153559] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Ravage (Pet Rank 3)
    L[1153560] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Ravage (Pet Rank 4)
    L[1153561] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Ravage (Pet Rank 5)
    L[1153562] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Ravage (Pet Rank 6)
    L[1144572] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Deep Freeze
    L[1100853] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Hammer of Justice (Rank 1)
    L[1105588] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Hammer of Justice (Rank 2)
    L[1105589] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Hammer of Justice (Rank 3)
    L[1110308] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Hammer of Justice (Rank 4)
    L[1102812] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Holy Wrath (Rank 1)
    L[1110318] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Holy Wrath (Rank 2)
    L[1127139] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Holy Wrath (Rank 3)
    L[1148816] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Holy Wrath (Rank 4)
    L[1148817] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Holy Wrath (Rank 5)
    L[1100408] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Kidney Shot (Rank 1)
    L[1108643] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Kidney Shot (Rank 2)
    L[1158861] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Bash (Spirit Wolves)
    L[1130283] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shadowfury (Rank 1)
    L[1130413] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shadowfury (Rank 2)
    L[1130414] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shadowfury (Rank 3)
    L[1147846] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shadowfury (Rank 4)
    L[1147847] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shadowfury (Rank 5)
    L[1112809] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Concussion Blow
    L[60995] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Demon Charge
    L[1130153] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept (Felguard Rank 1)
    L[1130195] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept (Felguard Rank 2)
    L[1130197] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept (Felguard Rank 3)
    L[1147995] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept (Felguard Rank 4)
    L[1120253] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept Stun (Rank 1)
    L[1120614] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept Stun (Rank 2)
    L[1120615] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept Stun (Rank 3)
    L[1125273] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept Stun (Rank 4)
    L[1125274] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Intercept Stun (Rank 5)
    L[1146968] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shockwave
    L[1120549] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- War Stomp (Racial)
    -- Ascensnion
    L[1572740] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Storm Bolt
    L[1155572] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Deep Freeze


    -- *** Non-controlled Stun Effects ***
    L[1112355] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Impact
    L[1120170] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Seal of Justice Stun
    L[1139796] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Stoneclaw Stun
    -- Ascension
    L[2304527] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Earthquake Stun ? idk if its Non controlled or controlled stun
    L[1133047] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Binding Shot
    L[954595]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- capacitor totem
    L[954596]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- capacitor totem
    L[954597]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- capacitor totem
    L[2304519] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- capacitor totem


    -- *** Fear Effects ***
    L[1101513] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Scare Beast (Rank 1)
    L[1114326] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Scare Beast (Rank 2)
    L[1114327] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Scare Beast (Rank 3)
    L[1110326] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Turn Evil
    L[1108122] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Psychic Scream (Rank 1)
    L[1108124] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Psychic Scream (Rank 2)
    L[1110888] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Psychic Scream (Rank 3)
    L[1110890] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Psychic Scream (Rank 4)
    L[1102094] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Blind
    L[1105782] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Fear (Rank 1)
    L[1106213] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Fear (Rank 2)
    L[1106215] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Fear (Rank 3)
    L[1106358] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" } -- Seduction (Succubus)
    L[1105484] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Howl of Terror (Rank 1)
    L[1117928] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Howl of Terror (Rank 2)
    L[1105246] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Intimidating Shout
    L[1120511] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Intimidating Shout (low rank)
    -- Ascensnion
    L[2304517] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Blood Horror
    L[2304565] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Blood Horror
    L[2304500] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Blinding Light

    -- *** Controlled Root Effects ***
    L[1100339] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 1)
    L[1101062] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 2)
    L[1105195] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 3)
    L[1105196] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 4)
    L[1109852] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 5)
    L[1109853] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 6)
    L[1126989] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 7)
    L[1153308] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 8)
    L[1165857] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots (Rank 8) (TODO: not sure which ID is correct)
    L[1119975] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 1)
    L[1119974] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 2)
    L[1119973] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 3)
    L[1119972] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 4)
    L[1119971] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 5)
    L[1119970] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 6)
    L[1127010] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 7)
    L[1153313] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 8)
    L[1166070] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Nature's Grasp (Rank 8) (TODO: not sure which ID is correct)
    L[1150245] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Pin (Rank 1)
    L[1153544] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Pin (Rank 2)
    L[1153545] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Pin (Rank 3)
    L[1153546] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Pin (Rank 4)
    L[1153547] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Pin (Rank 5)
    L[1153548] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Pin (Rank 6)
    L[1133395] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Freeze (Water Elemental)
    L[1100122] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Nova (Rank 1)
    L[1100865] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Nova (Rank 2)
    L[1106131] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Nova (Rank 3)
    L[1110230] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Nova (Rank 4)
    L[1127088] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Nova (Rank 5)
    L[1142917] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Nova (Rank 6)
    L[1164695] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Earthgrab
    L[1163685] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Freeze (Frost Shock)
    L[39965] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Grenade (Item)
    -- Ascension
    L[1104167] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Web (Hunter Pet)
    L[2304507] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Mass Entanglement
    L[1145334] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Feral Charge Effect

    -- *** Non-controlled Root Effects ***
    L[47168] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Improved Wing Clip
    L[1112494] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frostbite
    L[1155080] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Shattered Barrier
    L[1158373] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Glyph of Hamstring
    L[1123694] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Improved Hamstring
    L[1119185] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entrapment (Rank 1)
    L[1164803] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entrapment (Rank 2)

    -- *** Disarm Weapon Effects ***
    L[1153359] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Chimera Shot (Scorpid)
    L[1150541] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Snatch (Rank 1)
    L[1153537] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Snatch (Rank 2)
    L[1153538] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Snatch (Rank 3)
    L[1153540] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Snatch (Rank 4)
    L[1153542] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Snatch (Rank 5)
    L[1153543] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Snatch (Rank 6)
    L[1164346] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Fiery Payback
    L[1164058] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Psychic Horror Disarm Effect
    L[1151722] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Dismantle
    L[1100676] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Disarm

    -- *** Silence Effects ***
    L[1147476] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Strangulate
    L[1134490] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silencing Shot
    L[1118469] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silenced - Improved Counterspell (Rank 1)
    L[1155021] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silenced - Improved Counterspell (Rank 2)
    L[1163529] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silenced - Shield of the Templar
    L[1115487] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silence
    L[1101330] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Garrote - Silence
    L[1118425] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silenced - Improved Kick
    L[1124259] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Spell Lock
    L[1143523] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Unstable Affliction 1
    L[1131117] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Unstable Affliction 2 (TODO: not sure which ID is correct)
    L[1118498] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silenced - Gag Order (Shield Slam)
    L[1174347] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silenced - Gag Order (Heroic Throw)
    L[1150613] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Arcane Torrent (Racial, Runic Power)
    L[1128730] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Arcane Torrent (Racial, Mana)
    L[1125046] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Arcane Torrent (Racial, Energy)
    -- Ascensnion
    L[2304523] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Solar Beam

    -- *** Horror Effects ***
    L[1164044] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" } -- Psychic Horror
    L[1106789] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" } -- Death Coil (Rank 1)
    L[1117925] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" } -- Death Coil (Rank 2)
    L[1117926] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" } -- Death Coil (Rank 3)
    L[1127223] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" } -- Death Coil (Rank 4)
    L[1147859] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" } -- Death Coil (Rank 5)
    L[1147860] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" } -- Death Coil (Rank 6)

    -- *** Stealth/Opener Stun Effects ***
    L[1109005] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Pounce (Rank 1)
    L[1109823] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Pounce (Rank 2)
    L[1109827] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Pounce (Rank 3)
    L[1127006] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Pounce (Rank 4)
    L[1149803] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Pounce (Rank 5)
    L[1101833] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Cheap Shot

    -- *** Scatter Effects ***
    L[1119503] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Scatter Shot
    L[1131661] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Dragon's Breath (Rank 1)
    L[1133041] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Dragon's Breath (Rank 2)
    L[1133042] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Dragon's Breath (Rank 3)
    L[1133043] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Dragon's Breath (Rank 4)
    L[1142949] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Dragon's Breath (Rank 5)
    L[1142950] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Dragon's Breath (Rank 6)
    -- Ascension
    L[1469503] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" } -- Scatter Shot

    -- *** Spells that DRs with itself only ***
    L[1133786] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_BANISHED" } -- Cyclone
    L[1119306] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Counterattack 1
    L[1120909] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Counterattack 2
    L[1120910] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Counterattack 3
    L[1127067] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Counterattack 4
    L[1148998] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Counterattack 5
    L[1148999] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Counterattack 6
    L[1100605] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }  -- Mind Control
    L[1107922] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Charge Stun
    L[67799]   = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }  -- Mind Amplification Dish (Item)

    -- *** Slows ***
    L[1112323] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }  -- Piercing Howl
    L[1112486] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }  -- Chilled

    -- *** Interrupts ***
    -- Warrior
    L[1106552] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 4 } -- Pummel
    L[1100072] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 6 } -- Shield Bash
    -- Paladin
    -- Hunter
    -- Rogue
    L[1101766] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 5 } -- Kick
    -- Priest
    -- Shaman
    L[1157994] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 2 } -- Wind Shear
    -- Mage
    L[1102139] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 8 } -- Counterspell
    -- Warlock
    L[1119244] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 5 } -- Spell Lock ???
    L[1119647] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 6 } -- Spell Lock
    -- Druid
    L[1116979] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 4 } -- Charge (Bear)
    L[1149376] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 4 } -- Skull Bash (Cat) ???
    -- DK
    L[1147528] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 4 } -- Mind Freeze

    ----------------------------
    --- PvE I Add over Time  ---
    ----------------------------

    L[2101322] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Entangling Roots
    L[2101129] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" } -- Chains of Ice
    L[2101728] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" } -- Disarm
    L[2101410] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Hammer of Justice
    L[2102660] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Hammer of Justice
    L[2101361] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Sleep
    L[2102742] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shield Slam
    L[2101733] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Shield Slam
    L[2102575] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Smite Stomp
    L[2101506] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Panic
    L[2102635] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }  -- Mass Entanglement
    L[2102761] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Bellowing Roar
    L[267008]  = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silence
    L[2101111] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Frost Nova
    L[2102600] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Sleep
    L[2102646] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Panic
    L[2102120] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Petrifying Gaze
    L[2102017] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" } -- Hex
    L[2102698] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Throw Net
    L[2100743] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Smoke Bomb
    L[5011010] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } -- Chains of Woe (Blackrock Cavern First Boss)
    L[5011083] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } -- Terrifying Roar
    L[5011035] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Force Blast
    L[5011088] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Stone Blow
    L[2101569]  = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } -- Silence
    L[256834]  = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" } -- Entangling Web
    L[3589]  = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" } --Deafening Screech
    L[5588]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } --Hammer of Justice
    L[12747]  = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" } --Entangling Roots
    L[2102729]  = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" } --Nightmare Rift

    ----------------------------------
    --- List from pw_lossofcontrol ---
    ----------------------------------

    L[25]   = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[101]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[122]  = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[692]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[720]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[731]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[785]  = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[800]  = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[804]  = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[865]  = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[1121] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[1776] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[1777] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[2647] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[2812] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[3260] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[3271] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[3442] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[3618] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[3651] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[4159] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[4168] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[4169] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[4243] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[4320] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[4538] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[5101] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_DAZED" }
    L[5165] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[5219] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[5260] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[5376] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[5543] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[5726] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[5727] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[5951] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[6131] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[6432] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[6538] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[6576] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[6580] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[6614] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[6664] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[6669] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[6714] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[6716] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[6754] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[6869] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[6894] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[7082] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[7136] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[7144] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[7184] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[7267] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[7295] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[7586] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[7587] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[7621] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[7670] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[7761] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[7950] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[7961] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8041] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[8064] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8281] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[8338] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8359] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[8510] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8511] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8611] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8629] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[8646] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8672] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8817] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[8893] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[9032] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[9179] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[9256] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_ASLEEP" } -- Whitemane Deep Sleep
    L[9458] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[9576] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[9632] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[9827] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[9992] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[10093] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[10134] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[10230] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[10318] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[10326] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[10451] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[10576] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[10737] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[10794] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[10805] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[10834] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[10835] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[10836] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[11285] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[11286] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[11412] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[11444] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[11481] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[12134] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[12241] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[12242] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[12509] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[12520] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[12521] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[12565] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[12613] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[12890] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[12943] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[13158] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[13235] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[13238] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[13360] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[13466] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[13488] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[13808] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[13907] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[14821] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[14823] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[14870] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[14871] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[15056] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[15618] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[15660] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[15822] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[16053] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[16310] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[16452] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[16470] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[16805] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[17244] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[17250] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[17272] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[17307] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[17333] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[17398] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[17446] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    -- L[17492] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" } -- Hand of Thaurissan
    L[17624] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[17651] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[17691] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[17743] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[18425] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[18546] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[18798] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[19306] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[19369] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[19386] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[19597] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19636] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[19676] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19677] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19678] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19679] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19680] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19681] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19682] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19683] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19684] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19685] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19686] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19695] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[19725] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[19753] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[19832] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[19872] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[20019] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[20253] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[20478] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[20614] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[20615] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[20668] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[20672] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[20909] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[20910] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[21060] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[21167] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[21188] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[21556] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[21566] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[21847] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[21909] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[21936] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[21980] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[22291] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[22357] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[22561] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[22651] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[22667] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[22703] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[22901] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[22911] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[22935] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[23010] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[23023] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[23055] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23171] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23174] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[23186] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23269] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23279] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[23310] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23312] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23414] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[23417] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[23444] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23447] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23456] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23457] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[23601] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[24020] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24048] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24132] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[24133] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[24178] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[24193] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24324] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24408] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24594] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24619] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[24647] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24664] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24671] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24686] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24690] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24753] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[24778] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24811] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24832] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[24919] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[24937] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[25006] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[25043] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25046] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[25161] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[25273] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25274] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25371] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25425] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25495] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25515] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25656] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[25685] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25698] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25725] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25756] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25772] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[25774] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25806] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[25821] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[25937] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[26044] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[26049] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[26053] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[26079] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[26102] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[26180] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[26195] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[26196] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[26197] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[26198] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[26258] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[26259] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[26332] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[26552] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[27067] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[27068] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[27088] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[27139] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[27177] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[27553] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[27619] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_PACIFIED" } -- 29 immune
    L[27620] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 4 } -- 26 interrupt
    L[27792] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[27808] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[27814] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 6 } -- 26 interrupt
    L[27868] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[27983] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28127] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28225] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[28323] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28335] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28374] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28410] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[28412] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[28450] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28456] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28516] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[28522] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28622] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[28786] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[29124] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[29300] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[29309] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[29425] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[29484] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[29511] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[29512] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[29684] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[29903] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[29909] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[29963] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[29964] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[29989] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[30100] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[30103] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[30104] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[30112] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30115] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30153] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30195] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30197] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30254] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30298] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[30500] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[30647] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[30648] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[30652] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[30657] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30741] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[30756] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[30790] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30857] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30889] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[30923] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[31075] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[31117] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[31249] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31250] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[31298] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31302] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31428] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31537] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31548] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31661] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[31673] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[31733] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31932] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[31988] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[32021] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32053] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[32104] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32105] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32150] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32308] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32323] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32361] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32690] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[32709] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[32752] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32830] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[32832] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[32913] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[33043] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[33128] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33175] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[33241] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33332] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33384] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[33395] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[33401] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[33422] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33463] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33499] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[33542] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33563] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33637] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33652] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33684] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[33810] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[33849] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[33854] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[33919] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[33965] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[34017] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[34080] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[34097] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[34099] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[34190] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[34437] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[34490] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[34569] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[34620] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[34630] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[34654] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[34661] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[34664] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[34694] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[34770] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[34815] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[35049] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[35250] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[35268] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[35326] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[35327] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[35334] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[35382] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[35570] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[35614] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[35840] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[35954] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[35957] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36145] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[36252] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[36449] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36509] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36512] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[36634] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36642] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36671] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36719] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36732] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[36734] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[36797] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[36801] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[36834] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[36887] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[36940] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[37018] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[37073] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37103] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37118] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37135] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37216] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37221] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37289] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[37323] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37417] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37493] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37511] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37527] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37748] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37749] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37768] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37850] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37868] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37871] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37893] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37895] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[37919] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38003] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[38006] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38023] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38024] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38025] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38035] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[38049] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38065] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[38121] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[38123] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[38126] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[38128] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[38130] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[38146] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[38235] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38318] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[38441] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38461] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38509] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38511] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[38634] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[38764] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[38830] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[38850] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[39019] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[39194] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[39219] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[39268] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[39293] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[39346] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[39568] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[39574] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[39645] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[39661] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[39668] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[39674] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[39837] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[39914] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[40175] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40219] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40259] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[40268] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[40305] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED" }
    L[40307] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40321] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40357] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40358] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40370] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40398] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40409] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40490] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40491] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[40497] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40503] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40510] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40511] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40525] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40563] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40569] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40590] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40591] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40597] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40620] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40647] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40669] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[40695] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40760] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40774] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40835] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[40875] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40951] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41053] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[41070] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[41084] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[41128] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[41130] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41168] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[41197] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 3 } -- 26 interrupt
    L[41213] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41247] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[41272] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41338] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41392] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[41397] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[41421] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41426] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[41476] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[41479] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41528] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41592] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41962] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[41981] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[42166] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42167] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42168] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[42217] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42220] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[42320] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[42325] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42354] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[42380] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[42394] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[42398] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[42435] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42621] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42671] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[42672] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42695] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42696] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[42723] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42869] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[42917] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[42949] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[43049] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[43150] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[43207] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[43348] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43356] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43361] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[43416] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43433] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[43442] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[43489] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[43519] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43523] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[43612] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43648] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43651] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43906] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[43936] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[43977] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[44031] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[44138] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[44142] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[44217] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[44233] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[44320] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[44420] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[44424] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[44465] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[44542] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[44554] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[44565] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[44603] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[44813] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[44837] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[44841] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[44872] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[44957] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[45029] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45066] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45108] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45201] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[45203] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[45255] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[45256] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[45334] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[45342] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[45419] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45438] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_PACIFIED" } -- 29 immune
    L[45574] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45587] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45602] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[45665] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[45676] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45839] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[45848] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45889] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45922] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45947] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[45995] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46010] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46102] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[46182] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_INTERRUPTED", lockout = 2 } -- 26 interrupt
    L[46188] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46239] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46283] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[46315] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46383] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46408] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[46411] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46567] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46590] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[46604] = { ccType = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_PACIFIED" } -- 29 immune
    L[46631] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[46681] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[46762] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[46895] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47007] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47035] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47109] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47310] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[47340] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47407] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[47411] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[47415] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47428] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47442] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47466] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47521] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[47585] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[47718] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47748] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47772] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47995] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48082] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48131] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48179] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[48267] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48288] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48323] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48416] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[48601] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[48620] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48703] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48816] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48817] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[48998] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[48999] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[49011] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[49012] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[49025] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49170] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49172] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[49173] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[49215] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49288] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[49333] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[49342] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49356] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49481] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49721] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[49735] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49750] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[49803] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49838] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50015] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[50093] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50095] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[50101] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[50234] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50368] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[50396] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[50518] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50519] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50597] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50635] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[50642] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50731] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50733] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[50760] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[50812] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50839] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50874] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50876] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[50979] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[51020] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[51131] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[51162] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[51316] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[51319] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[51343] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[51413] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[51581] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[51609] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[51756] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[51788] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[51846] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[51959] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[52087] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52141] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52149] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52169] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52174] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[52207] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52244] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[52271] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52287] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52390] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[52457] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52459] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52488] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[52497] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52577] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52584] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52593] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52601] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52640] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52716] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[52781] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52847] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52856] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52939] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52989] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53017] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53019] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[53052] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53069] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[53070] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[53077] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[53095] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[53103] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[53211] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53218] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[53239] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[53261] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[53463] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53472] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53500] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53534] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[53558] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53559] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53560] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53561] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53562] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53564] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53565] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53566] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53567] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53568] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53625] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54022] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[54028] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54029] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54047] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[54125] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54159] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[54166] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[54224] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54426] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54453] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[54460] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54477] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54506] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[54526] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54561] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54786] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[54888] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55030] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[55080] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[55099] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[55101] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55126] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55142] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55224] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55251] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[55284] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[55314] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[55334] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[55467] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55479] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[55633] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[55636] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55844] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[55891] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55929] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55947] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55958] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55959] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55964] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55982] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[56115] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[56117] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[56404] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[56448] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[56485] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[56691] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[56693] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[56747] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[56935] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[57388] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[57546] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[57728] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[57741] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[57794] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[57854] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[57886] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58119] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58151] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[58283] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[58351] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58447] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[58458] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[58526] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[58534] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58563] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58663] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58664] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58672] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58747] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58891] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[58893] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[58947] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58974] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58976] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[58977] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59010] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[59124] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59145] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[59150] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[59153] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[59253] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[59330] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59433] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59513] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59564] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59611] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59689] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[59709] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59726] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[59820] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[60067] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[60077] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[60109] = { ccType = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[60511] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[60642] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[60880] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[60983] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[61043] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[61136] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61143] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61224] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61475] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[61476] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61491] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61556] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[61557] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61579] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[61596] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[61878] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61968] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61969] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62000] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[62042] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62187] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[62297] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62310] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62332] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62382] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62420] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62469] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[62487] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62526] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[62573] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[62585] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[62628] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[62826] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[62886] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[62887] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[62891] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62928] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62951] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[62973] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[63080] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[63120] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[63124] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[63228] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[63480] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[63830] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[63846] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[63881] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[63986] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[63987] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64046] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[64047] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[64048] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[64049] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[64052] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[64151] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64175] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64189] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[64345] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64478] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64647] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[64654] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[64668] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[64669] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64774] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64781] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64819] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64877] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[64903] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[64918] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64942] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64970] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[64971] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65078] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65105] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65208] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65256] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65400] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65444] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[65544] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[65578] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65792] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[65802] = { cctype = CROWD_CONTROL_TYPE_PACIFY, display = "CROWD_CONTROL_MECHANIC_PACIFIED" } -- 29 immune
    L[65813] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[65820] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[65918] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[65982] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[66012] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[66474] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[66490] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[66514] = { cctype = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[66517] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[66546] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[66547] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[66683] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[66758] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[66770] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[66862] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[67114] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67232] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[67366] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67468] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67575] = { cctype = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[67576] = { cctype = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[67654] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67655] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67656] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67660] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67661] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67662] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67681] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[67686] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[67691] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[67745] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67780] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67791] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67806] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67810] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67867] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67868] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[68139] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[68140] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[68141] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[68157] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[68158] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[68159] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[68306] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[68771] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[68821] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[68848] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[68872] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[68922] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[68939] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[68980] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[68981] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[69006] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[69060] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[69106] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[69218] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[69222] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[69242] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[69244] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[69248] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[69503] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[69681] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[69705] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[69715] = { cctype = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[69741] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70049] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[70130] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[70199] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70209] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[70291] = { cctype = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[70296] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70299] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[70380] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70384] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70431] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[70525] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70540] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70583] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70639] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70645] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70781] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70856] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70857] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70858] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70859] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70860] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[70861] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71010] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71123] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71163] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71288] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71289] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[71320] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71325] = { cctype = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[71365] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71441] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[71590] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71615] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71618] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71713] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71715] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71722] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71745] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71750] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[71752] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71755] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[71758] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71759] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71760] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[71785] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[71786] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71847] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71955] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[71960] = { cctype = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[72090] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[72104] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[72259] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[72268] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[72269] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[72274] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[72276] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[72277] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[72343] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[72428] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[72649] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[72650] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[73003] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[73005] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[73076] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[73173] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[73174] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[73395] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[73536] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[73800] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[73801] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[73802] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[74270] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[74271] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[74272] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[74273] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[74274] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[74275] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[74325] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[74326] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[74327] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[74412] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[74456] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[74472] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[74509] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[74735] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[74785] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[75215] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[75343] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[75377] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[75417] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[75418] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[75448] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[75496] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[75510] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[76096] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[85004] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[90101] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_ASLEEP" }
    L[90112] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[90119] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[280101] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[300223] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[300231] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[300362] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[300540] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[300542] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[300544] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[300566] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[300571] = { cctype = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[300573] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[300578] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[300588] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300644] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300657] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300681] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300682] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[300683] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" }
    L[300698] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300699] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300707] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[300716] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300717] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300719] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300728] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[300864] = { cctype = CROWD_CONTROL_TYPE_SLOW, display = "CROWD_CONTROL_MECHANIC_ENSNARED" }
    L[300865] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[300962] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[301023] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[301024] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[301051] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301077] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301079] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301087] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301135] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[301136] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[301137] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[301138] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[301139] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[301140] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[301141] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[301192] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[301193] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[301323] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301336] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301338] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[301461] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[301490] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[301491] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301492] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301493] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301494] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[301495] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[302043] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[302079] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[302190] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[302249] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[302277] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[302282] = { cctype = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[302288] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[302312] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[302316] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[302354] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[302357] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[302387] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[302427] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[302428] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[302429] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[302499] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[302615] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[302732] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[302783] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[302789] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[302800] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[304624] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[304637] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[305001] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[305002] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[305006] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[305013] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[305031] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[305277] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[305328] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[305477] = { cctype = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[305478] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[305506] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[305586] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[305728] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306115] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[306151] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306182] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306184] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306219] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306220] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306234] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306263] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[306316] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306345] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[306357] = { cctype = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[306404] = { cctype = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_BANISHED" }
    L[306514] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[306547] = { cctype = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[306564] = { cctype = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }

    ------------------------------------
    --- List from LossOfControlSmart ---
    ------------------------------------

    L[26157] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" }
    L[26272] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" }
    L[26273] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" }
    L[26274] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_POLYMORPHED" }
    L[10255] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[43354] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[45476] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[47591] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[62468] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[49203] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_FROZEN" }
    L[37546] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_BANISHED" }
    L[70923] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_CHARMED" }
    L[4064] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[4065] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[4066] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[4067] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[4068] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[4069] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[12421] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[12543] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[12562] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[19769] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[19784] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[30216] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[30217] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[30461] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[54466] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[54712] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[56350] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[57489] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[67769] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[67890] = { ccType = CROWD_CONTROL_TYPE_INCAPACITATE, display = "CROWD_CONTROL_MECHANIC_INCAPACITATED" }
    L[49892] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[49893] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[49894] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[49895] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[53769] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[62901] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[62902] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[62903] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[62904] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[66019] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[67929] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[67930] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[67931] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_HORRIFIED" }
    L[53439] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[69240] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[71218] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[72272] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[72273] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[72273] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[73020] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_DISORIENTED" }
    L[31273] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[36314] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[64085] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[67519] = { ccType = CROWD_CONTROL_TYPE_SILENCE, display = "CROWD_CONTROL_MECHANIC_SILENCED" }
    L[41393] = { ccType = CROWD_CONTROL_TYPE_DISARM, display = "CROWD_CONTROL_MECHANIC_DISARMED" }
    L[28310] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[46562] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[54339] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[30057] = { ccType = CROWD_CONTROL_TYPE_DISORIENT, display = "CROWD_CONTROL_MECHANIC_FLEEING" }
    L[35062] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[35373] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[35460] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36038] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36058] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36140] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36606] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[36816] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[37777] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[39082] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42351] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[42379] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[47481] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[49863] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[52592] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[53329] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[55317] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[56733] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[56903] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[57290] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[58619] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[59368] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[60995] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[61463] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62486] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62613] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62614] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62961] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[62974] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[64767] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67345] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67573] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67663] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67664] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[67665] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[72149] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[72323] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[73794] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[73795] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[73796] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[75349] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[19577] = { ccType = CROWD_CONTROL_TYPE_STUN, display = "CROWD_CONTROL_MECHANIC_STUNNED" }
    L[19231] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[36575] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[39965] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[40663] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[42598] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[58644] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[61853] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[76114] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }
    L[76116] = { ccType = CROWD_CONTROL_TYPE_ROOTS, display = "CROWD_CONTROL_MECHANIC_ROOTED" }

end)

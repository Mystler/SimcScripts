require_relative 'lib/SimcConfig'

toRun = {
  'Combinator' => {
    'DeathKnight' => [
      'T21_Death_Knight_Frost Death_Knight_Frost T21 xx0x0xx',
      'T21_Death_Knight_Unholy Death_Knight_Unholy T21 xx0x0xx'
    ],
    'DemonHunter' => [
      'T21_Demon_Hunter_Havoc Demon_Hunter T21 xxx0x2x'
    ],
    'Druid' => [
      'T21_Druid_Balance Druid_Balance T21 x000xxx',
      'T21_Druid_Feral Druid_Feral T21 x000xxx'
    ],
    'Hunter' => [
      'T21_Hunter_Beast_Mastery Hunter_Beast_Mastery T21 xx0x0xx',
      'T21_Hunter_Marksmanship Hunter_Marksmanship T21 xx0x0xx',
      'T21_Hunter_Survival Hunter_Survival T21 xx0x0xx'
    ],
    'Mage' => [
      'T21_Mage_Arcane Mage_Arcane T21 x0xx0xx',
      'T21_Mage_Fire Mage_Fire T21 x0xx0xx',
      'T21_Mage_Frost Mage_Frost T21 x0xx0xx'
    ],
    'Monk' => [
      'T21_Monk_Windwalker Monk T21 x0x00xx'
    ],
    'Paladin' => [
      'T21_Paladin_Retribution Paladin T21 xx0x0[02]x'
    ],
    'Priest' => [
      'T21_Priest_Shadow Priest_Shadow T21 x0x0xxx'
    ],
    'Rogue' => [
      'T21_Rogue_Assassination-Poison Rogue T21 xxx00[12]x',
      'T21_Rogue_Assassination-Bleed Rogue_Assassination_Exsg T21 xxx003x',
      'T21_Rogue_Outlaw-Roll_the_Bones Rogue T21 x3x00[12]x',
      'T21_Rogue_Outlaw-Slice_and_Dice Rogue_Outlaw_SnD T21 x3x003x',
      'T21_Rogue_Subtlety Rogue T21 xxx00xx'
    ],
    'Shaman' => [
      'T21_Shaman_Elemental Shaman_Elemental T21 xx0x0xx',
      'T21_Shaman_Enhancement Shaman_Enhancement T21 xx0x0xx'
    ],
    'Warlock' => [
      # 'T21_Warlock_Affliction Warlock_Affliction T21 xx0x0xx',
      'T21_Warlock_Demonology Warlock_Demonology T21 xx0x0xx',
      'T21_Warlock_Destruction Warlock_Destruction T21 xx0x0xx'
    ],
    'Warrior' => [
      'T21_Warrior_Arms Warrior_Arms T21 x3x2xxx',
      'T21_Warrior_Fury Warrior_Fury T21 x3x2xxx'
    ]
  },
  'RaceSimulation' => {
    'DeathKnight' => [
      'T21_Death_Knight_Blood',
      'T21_Death_Knight_Frost',
      'T21_Death_Knight_Unholy'
    ],
    'DemonHunter' => [
      'T21_Demon_Hunter_Havoc'
    ],
    'Druid' => [
      'T21_Druid_Balance',
      # 'T21_Druid_Feral',
      # 'T21_Druid_Guardian'
    ],
    'Hunter' => [
      'T21_Hunter_Beast_Mastery',
      'T21_Hunter_Marksmanship',
      'T21_Hunter_Survival'
    ],
    'Mage' => [
      'T21_Mage_Arcane',
      'T21_Mage_Fire',
      'T21_Mage_Frost'
    ],
    'Monk' => [
      'T21_Monk_Brewmaster',
      'T21_Monk_Windwalker'
    ],
    'Paladin' => [
      'T21_Paladin_Protection',
      'T21_Paladin_Retribution'
    ],
    'Priest' => [
      'T21_Priest_Shadow'
    ],
    'Rogue' => [
      'T21_Rogue_Assassination',
      'T21_Rogue_Assassination_Exsg',
      'T21_Rogue_Outlaw',
      'T21_Rogue_Outlaw_SnD',
      'T21_Rogue_Subtlety',
      'T21_Rogue_Subtlety_DfA'
    ],
    'Shaman' => [
      'T21_Shaman_Elemental',
      'T21_Shaman_Enhancement'
    ],
    'Warlock' => [
      # 'T21_Warlock_Affliction',
      'T21_Warlock_Demonology',
      'T21_Warlock_Destruction'
    ],
    'Warrior' => [
      'T21_Warrior_Arms',
      'T21_Warrior_Fury'
    ]
  },
  'TrinketSimulation' => {
    'DeathKnight' => [
      'T21_Death_Knight_Blood Melee_Strength',
      'T21_Death_Knight_Frost Melee_Strength',
      'T21_Death_Knight_Unholy Melee_Strength'
    ],
    'DemonHunter' => [
      'T21_Demon_Hunter_Havoc Melee_Agility'
    ],
    'Druid' => [
      'T21_Druid_Balance Ranged_Intelligence',
      # 'T21_Druid_Feral Melee_Agility',
      # 'T21_Druid_Guardian Melee_Agility'
    ],
    'Hunter' => [
      'T21_Hunter_Beast_Mastery Ranged_Agility',
      'T21_Hunter_Marksmanship Ranged_Agility',
      'T21_Hunter_Survival Melee_Agility'
    ],
    'Mage' => [
      'T21_Mage_Arcane Ranged_Intelligence',
      'T21_Mage_Fire Ranged_Intelligence',
      'T21_Mage_Frost Ranged_Intelligence'
    ],
    'Monk' => [
      'T21_Monk_Brewmaster Melee_Agility',
      'T21_Monk_Windwalker Melee_Agility'
    ],
    'Paladin' => [
      'T21_Paladin_Protection Melee_Strength',
      'T21_Paladin_Retribution Melee_Strength'
    ],
    'Priest' => [
      'T21_Priest_Shadow Ranged_Intelligence'
    ],
    'Rogue' => [
      'T21_Rogue_Assassination Melee_Agility',
      'T21_Rogue_Assassination_Exsg Melee_Agility',
      'T21_Rogue_Outlaw Melee_Agility',
      'T21_Rogue_Outlaw_SnD Melee_Agility',
      'T21_Rogue_Subtlety Melee_Agility',
      'T21_Rogue_Subtlety_DfA Melee_Agility'
    ],
    'Shaman' => [
      'T21_Shaman_Elemental Ranged_Intelligence',
      'T21_Shaman_Enhancement Melee_Agility'
    ],
    'Warlock' => [
      # 'T21_Warlock_Affliction Ranged_Intelligence',
      'T21_Warlock_Demonology Ranged_Intelligence',
      'T21_Warlock_Destruction Ranged_Intelligence'
    ],
    'Warrior' => [
      'T21_Warrior_Arms Melee_Strength',
      'T21_Warrior_Fury Melee_Strength'
    ]
  }
}

scripts = SimcConfig["RunScripts"]
fightstyles = SimcConfig["RunFightstyles"]
wowclasses = SimcConfig["RunClasses"]

scripts.each do |script|
  fightstyles.each do |fightstyle|
    wowclasses.each do |wowclass|
      commands = toRun[script][wowclass]
      commands.each do |command|
        system "bundle exec ruby #{script}.rb #{fightstyle} #{wowclass} #{command} q"
      end
    end
  end
end

puts "All batch simulations done! Press enter!"
gets

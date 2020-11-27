require "rubygems"
require "bundler/setup"
require "optparse"
require_relative "lib/SimcConfig"

to_run = {
  "RaceSimulation" => { ### !!! This will also be used for Legendary, and Soulbind simulations
    "Death-Knight" => [
      #"PR_Death_Knight_Blood",
      "PR_Death_Knight_Frost",
      "PR_Death_Knight_Unholy",
    ],
    "Demon-Hunter" => [
      "PR_Demon_Hunter_Havoc",
      "PR_Demon_Hunter_Havoc_Momentum",
      #"PR_Demon_Hunter_Vengeance",
    ],
    "Druid" => [
      #"PR_Druid_Balance",
      "PR_Druid_Feral",
      #"PR_Druid_Guardian",
    ],
    "Hunter" => [
      "PR_Hunter_Beast_Mastery",
      "PR_Hunter_Marksmanship",
      "PR_Hunter_Survival",
    ],
    "Mage" => [
      "PR_Mage_Arcane",
      "PR_Mage_Fire",
      "PR_Mage_Frost",
    ],
    "Monk" => [
      "PR_Monk_Brewmaster",
      "PR_Monk_Windwalker",
      "PR_Monk_Windwalker_Serenity",
    ],
    "Paladin" => [
      #"PR_Paladin_Protection",
      "PR_Paladin_Retribution",
    ],
    "Priest" => [
      "PR_Priest_Shadow",
    ],
    "Rogue" => [
      "PR_Rogue_Assassination",
      "PR_Rogue_Outlaw",
      "PR_Rogue_Subtlety",
    ],
    "Shaman" => [
      "PR_Shaman_Elemental",
      "PR_Shaman_Enhancement",
    ],
    "Warlock" => [
      "PR_Warlock_Affliction",
      "PR_Warlock_Demonology",
      "PR_Warlock_Destruction",
    ],
    "Warrior" => [
      "PR_Warrior_Arms",
      "PR_Warrior_Fury",
      #"PR_Warrior_Protection",
    ],
  },
  "Combinator" => {
    ##############################################################################################
    # Keep the part called !!SetSL!!, this will be auto replaced with different gear and setups. #
    ##############################################################################################
    "Death-Knight" => [
      #"PR_Death_Knight_Blood !!SetSL!! xxx20xx",
      "PR_Death_Knight_Frost !!SetSL!! xx0x0xx",
      "PR_Death_Knight_Unholy !!SetSL!! xx0x0xx",
    ],
    "Demon-Hunter" => [
      "PR_Demon_Hunter_Havoc !!SetSL!! xxx0x2[13]",
      "PR_Demon_Hunter_Havoc_Momentum !!SetSL!! xxx0x22",
      #"PR_Demon_Hunter_Vengeance !!SetSL!! xxxx1x1",
    ],
    "Druid" => [
      #"PR_Druid_Balance !!SetSL!! x000xxx",
      "PR_Druid_Feral !!SetSL!! x000xxx",
      #"PR_Druid_Guardian !!SetSL!! x111x2x",
    ],
    "Hunter" => [
      "PR_Hunter_Beast_Mastery !!SetSL!! xx0x0xx",
      "PR_Hunter_Marksmanship !!SetSL!! xx0x0xx",
      "PR_Hunter_Survival !!SetSL!! xx0x0xx",
    ],
    "Mage" => [
      "PR_Mage_Arcane !!SetSL!! x0xx0xx",
      "PR_Mage_Fire !!SetSL!! x0xx0xx",
      "PR_Mage_Frost !!SetSL!! x0xx0xx",
    ],
    "Monk" => [
      "PR_Monk_Brewmaster !!SetSL!! x0x01xx",
      "PR_Monk_Windwalker !!SetSL!! x0x20x[12]",
      "PR_Monk_Windwalker_Serenity !!SetSL!! x0x20x3",
    ],
    "Paladin" => [
      #"PR_Paladin_Protection !!SetSL!! xx0000x",
      "PR_Paladin_Retribution !!SetSL!! xx01x0x",
    ],
    "Priest" => [
      "PR_Priest_Shadow !!SetSL!! x0x0xxx",
    ],
    "Rogue" => [
      "PR_Rogue_Assassination !!SetSL!! xxx00xx",
      "PR_Rogue_Outlaw !!SetSL!! x0x00xx",
      "PR_Rogue_Subtlety !!SetSL!! xxx00xx",
    ],
    "Shaman" => [
      "PR_Shaman_Elemental !!SetSL!! xx0x0xx",
      "PR_Shaman_Enhancement !!SetSL!! xx0x0xx",
    ],
    "Warlock" => [
      "PR_Warlock_Affliction !!SetSL!! xx0x0xx",
      "PR_Warlock_Demonology !!SetSL!! xx0x0xx",
      "PR_Warlock_Destruction !!SetSL!! xx0x0xx",
    ],
    "Warrior" => [
      "PR_Warrior_Arms !!SetSL!! x3x2xxx",
      "PR_Warrior_Fury !!SetSL!! x3x2xxx",
      #"PR_Warrior_Protection !!SetSL!! x0x00xx",
    ],
  },
  "TrinketSimulation" => {
    "Death-Knight" => [
      #"PR_Death_Knight_Blood Strength",
      "PR_Death_Knight_Frost Strength",
      "PR_Death_Knight_Unholy Strength",
    ],
    "Demon-Hunter" => [
      "PR_Demon_Hunter_Havoc Agility",
      "PR_Demon_Hunter_Havoc_Momentum Agility",
      #"PR_Demon_Hunter_Vengeance Agility",
    ],
    "Druid" => [
      #"PR_Druid_Balance Intelligence",
      "PR_Druid_Feral Agility",
      #"PR_Druid_Guardian Agility",
    ],
    "Hunter" => [
      "PR_Hunter_Beast_Mastery Agility",
      "PR_Hunter_Marksmanship Agility",
      "PR_Hunter_Survival Agility",
    ],
    "Mage" => [
      "PR_Mage_Arcane Intelligence",
      "PR_Mage_Fire Intelligence",
      "PR_Mage_Frost Intelligence",
    ],
    "Monk" => [
      "PR_Monk_Brewmaster Agility",
      "PR_Monk_Windwalker Agility",
      "PR_Monk_Windwalker_Serenity Agility",
    ],
    "Paladin" => [
      #"PR_Paladin_Protection Strength",
      "PR_Paladin_Retribution Strength",
    ],
    "Priest" => [
      "PR_Priest_Shadow Intelligence",
    ],
    "Rogue" => [
      "PR_Rogue_Assassination Agility",
      "PR_Rogue_Outlaw Agility",
      "PR_Rogue_Subtlety Agility",
    ],
    "Shaman" => [
      "PR_Shaman_Elemental Intelligence",
      "PR_Shaman_Enhancement Agility",
    ],
    "Warlock" => [
      "PR_Warlock_Affliction Intelligence",
      "PR_Warlock_Demonology Intelligence",
      "PR_Warlock_Destruction Intelligence",
    ],
    "Warrior" => [
      "PR_Warrior_Arms Strength",
      "PR_Warrior_Fury Strength",
      #"PR_Warrior_Protection Strength",
    ],
  },
}

# Make links for sims using the same input
to_run["LegendarySimulation"] = to_run["RaceSimulation"]
to_run["SoulbindSimulation"] = to_run["RaceSimulation"]

orders = SimcConfig["RunOrders"]
wow_classes = SimcConfig["RunClasses"]

wow_classes.each do |wow_class|
  orders.each do |steps|
    steps.each do |order|
      scripts = order[0].clone
      fightstyles = order[1].clone
      fightstyles.each do |fightstyle|
        scripts.each do |script|
          next unless to_run[script]
          next unless to_run[script][wow_class]
          commands = to_run[script][wow_class].clone
          commands.each do |command|
            #next if command.start_with?("DS_") && fightstyle != "DS" || !command.start_with?("DS_") && fightstyle == "DS"
            if script == "Combinator" && command.include?("!!SetSL!!")
              # Base run for talents + covenants
              specialCommand = command.gsub("!!SetSL!!", "#{wow_class}_Covenants SLBaseCovenants")
              system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} Default #{specialCommand} q"
              ["Kyrian", "Necrolord", "Night-Fae", "Venthyr"].each do |cov|
                specialCommand = command.gsub("!!SetSL!!", "#{wow_class}_Legendaries 1L")
                system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} #{cov} #{specialCommand} q"
                specialCommand = command.gsub("!!SetSL!!", "#{wow_class}_Conduits 2C")
                system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} #{cov} #{specialCommand} q"
              end
            elsif script == "SoulbindSimulation"
              system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} #{command} Kyrian q"
              system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} #{command} Necrolord q"
              system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} #{command} Night-Fae q"
              system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} #{command} Venthyr q"
            else
              if script == "Combinator"
                system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} Default #{command} q"
              else
                system "bundle exec ruby #{script}.rb #{fightstyle} #{wow_class} #{command} q"
              end
            end
          end
        end
      end
    end
  end
end

### HAX: For display on HeroDamage, rename our DS reports to include PR so they show as PR fightstyle.
#Dir.glob("#{SimcConfig["ReportsFolder"]}/*_DS_DS_*.{json,csv}").each do |file|
#  puts "Renaming #{file} for PR..."
#  File.rename(file, file.gsub(/_DS_DS_/, "_DS_PR_"))
#end

puts "All batch simulations done! Press enter!"
gets

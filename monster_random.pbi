Procedure wassermonster_random(level.w)


  zaehler.w = 1
  Repeat
    hugo.w = Random(#ANZ_MONSTER2-1) + 1
    zaehler = zaehler + 1
  Until (monster(hugo)\minlevel <= level And has_trait2(hugo,#ME_WASSER) ) Or zaehler > 500
  If zaehler > 500
    hugo = #MONSTER_WATER_GRAPPLEVINES
  EndIf
  
  Procedurereturn (hugo)
  
EndProcedure


Procedure monster_random(level.w,sonderlevel.w)

   Select (sonderlevel)
      Case 0:
         zaehler.w = 1
         Repeat
            hugo.w = Random(#ANZ_MONSTER2-1) + 1
            zaehler = zaehler + 1
         Until (monster(hugo)\minlevel <= level And has_trait2(hugo,#ME_WASSER) <> 1) Or zaehler > 500
         If zaehler > 500
             hugo = 1
         EndIf
         ; Spinnenkoenigin?
         If hugo = #MONSTER_SPIDER_QUEEN
            If spinnenkoenigin(level) = 1
               hugo = #MONSTER_GIANT_SPIDER
            Else
               spinnenkoenigin(level) = 1
            EndIf
         EndIf
         ; Goblinkoenig?
         If hugo = #MONSTER_GOBLIN_KING
            If goblinkoenig(level) = 1
               hugo = #MONSTER_FOUR_HANDED_OGRE
            Else
               goblinkoenig(level) = 1
            EndIf
         EndIf
         ; Herr der Untoten?
         If hugo = #MONSTER_LORD_OF_THE_UNDEAD
            If untotenherr(level) = 1
               hugo = #MONSTER_SKELETON_WARRIOR
            Else
               untotenherr(level) = 1
            EndIf
         EndIf
      ; Eiskaverne
      Case #SL_EISKAVERNE:
         Select(Random(3)+1)
            Case 1: hugo = #MONSTER_STONE_GOLEM
            Case 2: hugo = #MONSTER_FROST_DEMON
            Case 3: hugo = #MONSTER_BLUE_DRAGON
            Case 4: hugo = #MONSTER_ICE_GRAPPLEVINES
         EndSelect
      ; Lavakaverne
      Case #SL_LAVAKAVERNE:
         Select(Random(5)+1)
            Case 1: hugo = #MONSTER_MAGMA_LIZARD
            Case 2: hugo = #MONSTER_PURPLE_WORM
            Case 3: hugo = #MONSTER_STONE_GOLEM
            case 4: hugo = #MONSTER_PHOENIX
            case 5: hugo = #MONSTER_FIRE_DEMON
            case 6: hugo = #MONSTER_RED_DRAGON
         endselect
      ; Halle der Toten
      case #SL_TOTENHALLE:
         select (random(13)+1)
            case  1: hugo = #MONSTER_SKELETON_WARRIOR
            case  2: hugo = #MONSTER_ZOMBIE
            case  3: hugo = #MONSTER_WILL_O_THE_WHISP
            case  4: hugo = #MONSTER_WRAITH
            case  5: hugo = #MONSTER_INVISIBLE_STALKER
            case  6: hugo = #MONSTER_UNDEAD_KNIGHT
            case  7: hugo = #MONSTER_SHADOW
            case  8: hugo = #MONSTER_NECROMANCER
            case  9: hugo = #MONSTER_MUMMY
            case 10: hugo = #MONSTER_LICH
            case 11: hugo = #MONSTER_TOMB_SHADOW
            case 12: hugo = #MONSTER_SKELETON_DRAGON
            case 13: hugo = #MONSTER_ZOMBIE_GENERAL
            case 14: hugo = #MONSTER_POLTERGEIST
         endselect
      ; Goblinhoehle
      case #SL_GOBLINHOEHLE:
         select(random(15)+1)
            case  1: hugo = #MONSTER_GOBLIN
            case  2: hugo = #MONSTER_GOBLIN_SHAMAN
            case  3: hugo = #MONSTER_ORC
            case  4: hugo = #MONSTER_HOBGOBLIN
            case  5: hugo = #MONSTER_OGRE
            case  6: hugo = #MONSTER_RED_DRAGON
            case  7: hugo = #MONSTER_ORC_WITH_STAFF
            case  8: hugo = #MONSTER_ORC_PRIEST
            case  9: hugo = #MONSTER_ORC_MAGE
            case 10: hugo = #MONSTER_ORC_VETERAN
            case 11: hugo = #MONSTER_ELDER_ORC_PRIEST
            case 12: hugo = #MONSTER_ORC_THIEF
            case 13: hugo = #MONSTER_ELDER_ORC_THIEF
            case 14: hugo = #MONSTER_ELDER_ORC_VETERAN
            case 15: hugo = #MONSTER_WEAPONLESS_ORC
            case 16: hugo = #MONSTER_ELDER_ORC_WITH_STAFF
         endselect
      ; Diebesnest
      case #SL_DIEBESNEST:
         select(random(2)+1)
            case 1: hugo = #MONSTER_THIEF
            case 2: hugo = #MONSTER_NINJA
            case 3: hugo = #MONSTER_EVIL_HERO
         endselect
      ; Zentauerwald
      case #SL_ZENTAUERWALD:
         select (random(7)+1)
            case 1: hugo = #MONSTER_DARK_WOLF
            case 2: hugo = #MONSTER_GRAPPLEVINES
            case 3: hugo = #MONSTER_GIANT_SNAKE
            case 4: hugo = #MONSTER_GIANT_MOSQUITO
            case 5: hugo = #MONSTER_SABERTOOTH_TIGER
            case 6: hugo = #MONSTER_UNICORN
            case 7: hugo = #MONSTER_CENTAUR
            case 8: hugo = #MONSTER_MAMMOTH
         endselect
      ; Halle der Illusionen
      case #SL_ILLUSIONEN:
         select (random(7)+1)
            case 1: hugo = #MONSTER_APPRENTICE_WIZARD
            case 2: hugo = #MONSTER_WILL_O_THE_WHISP
            case 3: hugo = #MONSTER_INVISIBLE_STALKER
            case 4: hugo = #MONSTER_WITCH
            case 5: hugo = #MONSTER_SHADOW
            case 6: hugo = #MONSTER_PHANTOM
            case 7: hugo = #MONSTER_MASTER_ILLUSIONIST
            case 8: hugo = #MONSTER_KOBOLD
         endselect
      ; Spinnenbau
      case #SL_SPINNENBAU:
         select (random(4)+1)
            case 1: hugo = #MONSTER_GIANT_SPIDER
            case 2: hugo = #MONSTER_JUMPING_SPIDER
            case 3: hugo = #MONSTER_TARANTULA
            case 4: hugo = #MONSTER_GIANT_BIRD_SPIDER
            case 5: hugo = #MONSTER_GIANT_CROSS_SPIDER
         endselect
      ; Wueste
      case #SL_WUESTE:
         select (random(6)+1)
            case 1: hugo = #MONSTER_VULTURE
            case 2: hugo = #MONSTER_GIANT_SNAKE
            case 3: hugo = #MONSTER_GIANT_ANT
            case 4: hugo = #MONSTER_GIANT_SCORPION
            case 5: hugo = #MONSTER_EFREET
            case 6: hugo = #MONSTER_SANDMAN
            case 7: hugo = #MONSTER_DJINN
         endselect
      ; Archipelago
      case #SL_ARCHIPEL:
         select (random(9)+1)
            case  1: hugo = #MONSTER_GIANT_OCTOPUS
            case  2: hugo = #MONSTER_SUCCUBUS
            case  3: hugo = #MONSTER_WATER_DRAGON
            case  4: hugo = #MONSTER_MERMAID
            case  5: hugo = #MONSTER_DEEP_ONE
            case  6: hugo = #MONSTER_GIANT_ELECTRIC_EEL
            case  7: hugo = #MONSTER_GIANT_GOLDFISH
            case  8: hugo = #MONSTER_GIANT_BLOWFISH
            case  9: hugo = #MONSTER_GIANT_JELLYFISH
            case 10: hugo = #MONSTER_GIANT_SEAHORSE
         endselect
      ; Sumpf
      case #SL_SUMPF:
         select (random(11)+1)
            case  1: hugo = #MONSTER_GRAPPLEVINES
            case  2: hugo = #MONSTER_GIANT_SNAKE
            case  3: hugo = #MONSTER_GIANT_MAGGOT
            case  4: hugo = #MONSTER_MONSTROUS_TURTLE
            case  5: hugo = #MONSTER_GIANT_LIZARD
            case  6: hugo = #MONSTER_ZOMBIE
            case  7: hugo = #MONSTER_WILL_O_THE_WHISP
            case  8: hugo = #MONSTER_GIANT_MOSQUITO
            case  9: hugo = #MONSTER_MUMMY
            case 10: hugo = #MONSTER_HORNED_TOAD
            case 11: hugo = #MONSTER_POISONOUS_GRAPPLEVINES
            case 12: hugo = #MONSTER_POISONOUS_SUFFOCATOR
         endselect
      endselect
      
      Procedurereturn (hugo)
            
EndProcedure
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

; IDE Options = PureBasic 4.10 (Linux - x86)
; Folding = -
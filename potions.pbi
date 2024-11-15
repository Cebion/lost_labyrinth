; Traenke
Procedure make_potion(allpotions.w = 0)

   If allpotions = 1
      ProcedureReturn Random(#ANZ_TRAENKE-1) + #OBJGRAFIK_TRANK1
   EndIf
   potion.w = Random(#ANZ_TRAENKE-3) + #OBJGRAFIK_TRANK1
   If item(potion)\attri1 = #POTION_GODS 
      potion = #ANZ_TRAENKE-2 + #OBJGRAFIK_TRANK1
      If item(potion)\attri1 = #POTION_HEROES
         potion = #ANZ_TRAENKE-1 + #OBJGRAFIK_TRANK1
      EndIf
   EndIf
   If item(potion)\attri1 = #POTION_HEROES
      potion = #ANZ_TRAENKE-1 + #OBJGRAFIK_TRANK1
      If item(potion)\attri1 = #POTION_GODS 
         potion = #ANZ_TRAENKE-2 + #OBJGRAFIK_TRANK1
      EndIf
   EndIf
   ProcedureReturn potion
  
EndProcedure

; ----------------------------------------------------------------

; Traenke mischen
Procedure init_traenke()

Shared gegenstand
   zw_geg.gs
   potion_god.w = 0
   potion_hero.w = 0

   ;permute potions
   For i = 0 To #ANZ_TRAENKE-2
      von = #OBJGRAFIK_TRANK1 + i
      nach = #OBJGRAFIK_TRANK1 + i + Random(#ANZ_TRAENKE-1-i)
      
      For k = 1 To #ANZ_languages
         zw_geg \name[k]  = item(von)\name[k]
      Next
      zw_geg \attri1  = item(von)\attri1
      zw_geg \einkauf = item(von)\einkauf
      zw_geg \verkauf = item(von)\verkauf
      
      For k = 1 To #ANZ_languages
         item(von)\name[k]  = item(nach)\name[k]
      Next
      item(von)\attri1  = item(nach)\attri1
      item(von)\einkauf = item(nach)\einkauf
      item(von)\verkauf = item(nach)\verkauf
      
      If item(von)\attri1 = #POTION_GODS
        potion_god = #OBJGRAFIK_TRANK1 + i
      ElseIf item(von)\attri1 = #POTION_HEROES
        potion_hero = #OBJGRAFIK_TRANK1 + i
      EndIf
      For k = 1 To #ANZ_languages
         item(nach)\name[k]  = zw_geg \name[k]
      Next
      item(nach)\attri1  = zw_geg \attri1
      item(nach)\einkauf = zw_geg \einkauf
      item(nach)\verkauf = zw_geg \verkauf
   Next
   
   For i = 0 To #ANZ_TRAENKE-1
     Repeat ;all results possible exept potion hero/gods + the potion itself
       mischen(i)\result = Random(#ANZ_TRAENKE-1) + #OBJGRAFIK_TRANK1
     Until mischen(i)\result <> potion_god And mischen(i)\result <> potion_hero And mischen(i)\result <> i+#OBJGRAFIK_TRANK1
     ;initialize all potions as unknown for all players
     mischen(i)\learned = 0
   Next
   ;make exactly 3 potions go boom on mixing exept potion hero/gods as nobody would mix these anyway
   For i = 1 to 3
     Repeat 
       j = Random(#ANZ_TRAENKE-1) + #OBJGRAFIK_TRANK1
     Until j <> potion_god And j <> potion_hero And mischen(j-#OBJGRAFIK_TRANK1)\result <> #UNENDLICH
     mischen(j-#OBJGRAFIK_TRANK1)\result = #UNENDLICH
   Next
   ;allow exactly one potion to be mixed to a Potion of Heroes
   ;well no more!
   ;Repeat 
   ;  j = Random(#ANZ_TRAENKE-1) + #OBJGRAFIK_TRANK1
   ;Until j <> potion_god And j <> potion_hero And mischen(j-#OBJGRAFIK_TRANK1)\result <> #UNENDLICH
   ;mischen(j-#OBJGRAFIK_TRANK1)\result = potion_hero
   
   ;initialize the alchemy buffer for potion generation
   ;also all similar buffers
   spell_chance_buff(0) = 1 ;101
   lore_chance_buff(0) = 1  ;102
   hit_chance_buff(0) = 1   ;103
   critical_chance_buff(0) = 1;104
   damage_buff(0) = 1 ;1001
   damage_buff2(0) = 1 ;1002
   wand_buff(0) = 1 ;999
   scroll_buff(0) = 1 ;998
   alch_buff(0) = 1 ;997
   break_chance_buff(0) = 1 ;996
   gold_buff(0) = 1 ;995
   boulder_buff(0) = 1 ;994
   herb_buff(0) = 1 ;61
   crysolit_buff(0) = 1 ;62
   god_bonus_buff(0) = 1 ; 105
   fish_buff(0) = 1 ; 106
   general_percent_buff(0) = 1 ;100
   For i = 1 to #buff_size
     get_chance(3) ; 1-3 next quality rating
     get_chance(61) ; 1-6 next herb heal
     get_chance(62) ; 1-6 next crysolit boost
     get_chance(999) ; next wand for thaumaturgy
     get_chance(998) ; next scroll
     get_chance(997) ; next potion
     get_chance(996) ; weapon break
     get_chance(995) ; gold amount
     get_chance(994) ; next boulder content
     get_chance(100) ; genearal percentage chance
     get_chance(101) ; spell chance
     get_chance(102) ; lore chance
     get_chance(103) ; hit chance
     get_chance(104) ; critical chance
     get_chance(105) ; god bonus chance
     get_chance(106) ; fishing chance
     get_chance(1001) ; player damage
     get_chance(1002) ; monster damage
   Next
   For i = 1 to 31 ;item break chances
     get_chance(5)
     get_chance(10)
     get_chance(15)
     get_chance(20)
     get_chance(50)
   Next
   
   If test = 3 ; data dump mode
     For i = 1 To #ANZ_TRAENKE
       If mischen(i-1)\result = #UNENDLICH
         result.s = "!KABOOM!"
       Else
         result.s = item(mischen(i-1)\result)\name[1]
       EndIf
       If i < 21
         result = result+" <b>"+item(alch_buff(i))\name[1]
       EndIf
       Print (item(#OBJGRAFIK_TRANK1 + i - 1)\name[1]+" -> "+result)
     Next
   EndIf

EndProcedure

; ----------------------------------------------------------------

Procedure trinken(welchen.w)

Shared language, item_spell, akt_zauber, akt_zauber_offset

   Sound(#SOUND_GULP)
   IF skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt
      spieler(akt_spieler)\durst = spieler(akt_spieler)\durst - 10
   EndIf
   spieler(akt_spieler)\durst - 10
   If spieler(akt_spieler)\durst < 0
     spieler(akt_spieler)\durst = 0
   EndIf

   Select(welchen)
      Case #POTION_USELESS:
         message(38,#COLOR_GRUEN)
      Case #POTION_WEAK_HEALING:
         spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + Random(10)+3
         If spieler(akt_spieler)\Lifepoints > spieler(akt_spieler)\Maxlifepoints
            spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Maxlifepoints
         EndIf
         message(46,#COLOR_GRUEN)
      Case #POTION_STRONG_HEALING:
         spieler(akt_spieler)\Lifepoints = maxlife()
         message(47,#COLOR_GRUEN)
      Case #POTION_WEAK_POISON:
         ; Giftschutz ?
         If habich(#SPELL_GIFTSCHUTZ) > 0
            message(256,#COLOR_GRUEN)
         Else
            add_poison(myRand2(10)+1)
            message(40,#COLOR_GRUEN)
         EndIf
      Case #POTION_STRONG_POISON:
         ; Giftschutz ?
         If habich(#SPELL_GIFTSCHUTZ) > 0
            message(256,#COLOR_GRUEN)
         Else
            ;spieler(akt_spieler)\gift = 2
            ;spieler(akt_spieler)\giftdauer = Random(15)+1
            add_poison(myRand2(15)+15)
            message(40,#COLOR_GRUEN)
         EndIf
      Case #POTION_HEROES:
         aufsteigen2()
      Case #POTION_GODS:
         For i = 1 To 3
            aufsteigen2()
         Next
      Case #POTION_STRENGTH:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_STAERKEZAUBER
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_WEAKNESS:
         message(41,#COLOR_GRUEN)
      Case #POTION_PARALYSIS:
         spieler(akt_spieler)\fluch = #FLUCH_PARALYSE
         spieler(akt_spieler)\fluchdauer = myRand2(15)+1
         message(42,#COLOR_GRUEN)
      Case #POTION_FLY:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_FLIEGEN
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_PROTECTION: 
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_SCHUTZSCHILD
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_WEAK_MANA:
         spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana + myRand(10)+3
         If spieler(akt_spieler)\Mana > maxmana()
            spieler(akt_spieler)\Mana = maxmana()
         EndIf
         message(43,#COLOR_GRUEN)
      Case #POTION_STRONG_MANA:
         spieler(akt_spieler)\Mana = maxmana()
         message(43,#COLOR_GRUEN)
      Case #POTION_ANTIDOTE:
         spieler(akt_spieler)\poison = 0
         ;spieler(akt_spieler)\Gift = 0
         ;spieler(akt_spieler)\GiftDauer = 0
         message(222,#COLOR_GRUEN)
      Case #POTION_COLD_PROTECTION:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_EISSCHILD
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_HEAT_PROTECTION:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_FEUERSCHILD
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_MANA_VOID:
         spieler(akt_spieler)\Mana = 0
         message(222,#COLOR_GRUEN)
      Case #POTION_INVISIBILITY:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_UNSICHTBARKEIT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_MIGHT:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_MACHT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_SENSE_TRAPS:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_FALLEN_SPUEREN
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_BREATH_WINTER:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_WINTERATEM
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_AURA_FIRE:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_FEUERAURA
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_BAT_SHAPE:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_FLEDERMAUSGESTALT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_WOLF_SHAPE:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_WOLFSGESTALT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_BIRD_SHAPE:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_VOGELGESTALT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_CAT_SHAPE:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_KATZENGESTALT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_DRAGON_SHAPE:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_DRACHENGESTALT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_WATER_WALK:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_UEBERS_WASSER_GEHEN
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_WARD_MISSILES:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_SCHUTZ_VOR_GESCHOSSEN
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_VIEW_INVISIBLE:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_UNSICHTBARES_SEHEN
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_WARD_MAGIC:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_MAGIESCHUTZ
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_WITCH_SIGHT:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_HEXENSICHT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_INVULNERABILITY:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_UNVERWUNDBARKEIT
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_POISON_PROTECTION:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_GIFTSCHUTZ
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_SELF_HYPNOSIS:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_HYPNOSE
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_REGENERATION:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_REGENERATION
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      Case #POTION_LIFE_BOND:
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_LEBENSBUND
         item_spell = 5 + myRand(3)
         cast_it()
         item_spell = 0
      default:
         message(38,#COLOR_GRUEN)
   endselect

EndProcedure

; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 58
; FirstLine = 58
; Folding = -
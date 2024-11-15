; Vor und Nachteile durch Skills

Procedure in_rucksack(geg.w, anzahl.w, equip.w = 0)

   already_exists.w = 0
   foreach unique_items()
      if unique_items()\name = geg
         already_exists = 1
      endif
   next

   if already_exists = 1
      message(669,#COLOR_WEISS)
      ProcedureReturn 0
   else
      ; add to unique list
      if item(geg)\unique = 1
         AddElement(unique_items())
         unique_items()\name = geg
      endif

      If geg = #OBJGRAFIK_SCHRIFTROLLE  ; Schriftrolle?
         new_item(1)\name = #OBJGRAFIK_SCHRIFTROLLE
         new_item(1)\anzahl = 0
         new_item(1)\benutzt = 0
         Repeat
            new_item(1)\status = Random(#ANZ_ZAUBER-1) + 1   ; Effekt
         Until spells(new_item(1)\status)\duration <> #UNENDLICH
         new_item(1)\attri5 = Random(5) + 3    ; Staerke
         If learned(akt_spieler,new_item(1)\status) & #l_scrollname
         ;mark known scrolls as identified
         new_item(1)\attri5 = new_item(1)\attri5 | 256
         EndIf

      Else
         new_item(1)\name = geg
         new_item(1)\anzahl = anzahl - 1
         new_item(1)\status = 0
         If item(geg)\type = #ITEMTYPE_POTION And mischen(geg-#OBJGRAFIK_TRANK1)\learned & PM()
         ;mark known potion as identified
         new_item(1)\status = 1
         EndIf
         If item(geg)\type = #ITEMTYPE_MUSHROOM And mush_known(geg-#OBJGRAFIK_PILZE_SCHWARZ) & PM()
         ;mark known mushroom as identified
         new_item(1)\status = 1
         EndIf
            
         If item(geg)\qualitaet = 1
            new_item(1)\attri5 = get_chance(3)
         ElseIf item(geg)\qualitaet = 3
            new_item(1)\attri5 = 2*get_chance(3)
         Else 
            new_item(1)\attri5 = 0
         EndIf
         If item(geg)\qualitaet = 2 ;charges torch etc.
            new_item(1)\status = item(geg)\attri1
         EndIf
         If geg = #OBJGRAFIK_BUCH3
            new_item(1)\status = Random(6)+1
         EndIf
      EndIf
            
      ; Item exists in the backpack? -> auto stacking
      j = 0
      Repeat
         j = j + 1
      Until (inventory(j,akt_spieler)\benutzt = 0 And inventory(j,akt_spieler)\name = new_item(1)\name And inventory(j,akt_spieler)\status = new_item(1)\status And inventory(j,akt_spieler)\attri5 = new_item(1)\attri5) Or j > #MAX_RUCKSACK
            
      If j > #MAX_RUCKSACK Or geg = #OBJGRAFIK_WASSERSCHLAUCH
         j = backpackspace()
         If j <= #MAX_RUCKSACK
            inventory(j,akt_spieler)\name = new_item(1)\name
            inventory(j,akt_spieler)\benutzt = 0
            inventory(j,akt_spieler)\anzahl = new_item(1)\anzahl
            inventory(j,akt_spieler)\status = new_item(1)\status
            inventory(j,akt_spieler)\attri5 = new_item(1)\attri5
            If equip
               equip(j)
            EndIf
         Else 
            message(428,#COLOR_WEISS)
         EndIf
      Else
         inventory(j,akt_spieler)\anzahl = inventory(j,akt_spieler)\anzahl + 1
      EndIf

      ProcedureReturn j
   endif
      
EndProcedure


Procedure advancements()

j.w

; Standardausruestung
; armut ?
If skills(#CE_ARM,akt_spieler)\gewaehlt = 0 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_FACKEL1,2)
   in_rucksack(#OBJGRAFIK_BROT,1)
   in_rucksack(#OBJGRAFIK_WASSERSCHLAUCH,1)
   in_rucksack(#OBJGRAFIK_DOLCH,1,1)
   
   ; Welcher Trank ist Heiltrank?
   heiltrank.w = 0
   For j = 0 To #ANZ_TRAENKE-1
      If item(#OBJGRAFIK_TRANK1 + j)\name[2] = "Starker Heiltrank"
         heiltrank = #OBJGRAFIK_TRANK1 + j
         ;mark as known potion
         mischen(j)\learned = mischen(j)\learned | PM()
         Break
      EndIf
   Next
   pos.w = in_rucksack(heiltrank,1)
   inventory(pos,akt_spieler)\status = 1
EndIf


If test=1 ;testing items
   ;in_rucksack(#OBJGRAFIK_KRONE1,1)
   ;in_rucksack(#OBJGRAFIK_KRONE2,1)
   in_rucksack(#OBJGRAFIK_RING_GRUEN,1)
   ;in_rucksack(#OBJGRAFIK_WASSERSCHLAUCH,1)
   ;in_rucksack(#OBJGRAFIK_BIER,1)
   ;in_rucksack(#OBJGRAFIK_PFEIL1,15)
   ;in_rucksack(#OBJGRAFIK_PFEIL1,15)
   ;in_rucksack(#OBJGRAFIK_STAHLKUGELN,15)
   ;in_rucksack(#OBJGRAFIK_SCHLEUDER,1)
   in_rucksack(#OBJGRAFIK_GOLDENER_SCHLUESSEL,20)
   ;in_rucksack(#OBJGRAFIK_FLAMMENSCHWERT,1)
   in_rucksack(#OBJGRAFIK_AMULETT5,1)
   ;in_rucksack(#OBJGRAFIK_BLOOD,1)
   ;in_rucksack(#OBJGRAFIK_HUMAN_MEAT,1)
   in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_1,1)
   in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_2,1)
   ;in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_3,1)
   ;in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_4,1)
   ;in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_5,1)
   ;in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_6,1)
   ;in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_7,1)
   ;in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_8,1)
   ;in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_9,1)
   ;in_rucksack(#OBJGRAFIK_UDJAT,3)
   ;in_rucksack(#OBJGRAFIK_FALLENWERKZEUG,1)
   ;in_rucksack(#OBJGRAFIK_KESSEL,1)
   in_rucksack(#OBJGRAFIK_BOGEN,1)
   ;in_rucksack(#OBJGRAFIK_EIS_HAMMER,1)
   in_rucksack(#OBJGRAFIK_MASKE1,1)
   ;in_rucksack(#OBJGRAFIK_LICHT_HAMMER,1)
   in_rucksack(#OBJGRAFIK_HANDSCHUHE2,1)
   in_rucksack(#OBJGRAFIK_GRUENERHELM,1)
   ;in_rucksack(#OBJGRAFIK_SCHILD1,1)
   ;in_rucksack(#OBJGRAFIK_LEDERRUESTUNG1,1)
   ;in_rucksack(#OBJGRAFIK_SPIEGEL,1)
   ;in_rucksack(#OBJGRAFIK_OEL,10)
   ;j = in_rucksack(#OBJGRAFIK_LAMPE1,10)
   ;inventory(j,akt_spieler)\status = 0 
   ;in_rucksack(#OBJGRAFIK_LAMPE1,5)
   ; Welcher Trank ist goettlich?
   heiltrank.w = 0
   For j = 0 To #ANZ_TRAENKE-1
      If item(#OBJGRAFIK_TRANK1 + j)\name[1] = "Potion of the Gods"
         heiltrank = #OBJGRAFIK_TRANK1 + j
         pos.w = in_rucksack(heiltrank,99)
         inventory(pos,akt_spieler)\status = 1
         Break
      EndIf
   Next
   pos = in_rucksack(#OBJGRAFIK_SCHRIFTROLLE,1)
   inventory(pos,akt_spieler)\status = #SPELL_CHAOS
   inventory(pos,akt_spieler)\attri5 = 256 + 7
   inventory(pos,akt_spieler)\anzahl = 10
   pos = in_rucksack(#OBJGRAFIK_SCHRIFTROLLE,1)
   inventory(pos,akt_spieler)\status = #SPELL_FLAMEBURST
   inventory(pos,akt_spieler)\attri5 = 256 + 7
   inventory(pos,akt_spieler)\anzahl = 10
EndIf

;  Combat Training
If skills(#CE_KAMPFTRAINING,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Attack+3
EndIf

; Konstitution
If skills(#CE_KONSTITUTION,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Lifepoints = 15
   spieler(akt_spieler)\MaxLifepoints = 15
   spieler(akt_spieler)\LifeGain = 4
EndIf

; Staerke
If skills(#CE_STAERKE,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Strength+3
EndIf

; Dex
If skills(#CE_GEWANDTHEIT,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Dexterity+3
EndIf

; Indiana Jones
If skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_SCHAUFEL,1)
   in_rucksack(#OBJGRAFIK_GOLDENER_SCHLUESSEL,3)
   in_rucksack(#OBJGRAFIK_PEITSCHE,1,1)
EndIf

; Veteran
If skills(#CE_VETERAN,akt_spieler)\gewaehlt = 1
   If spieler(akt_spieler)\creature_typ = 0
      in_rucksack(#OBJGRAFIK_HELM1,1,1)
      in_rucksack(#OBJGRAFIK_LEDERRUESTUNG1,1,1)
      in_rucksack(#OBJGRAFIK_SCHILD1,1,1)
      in_rucksack(#OBJGRAFIK_LANGSCHWERT,1,1)
      in_rucksack(#OBJGRAFIK_HANDSCHUHE1,1,1)
      in_rucksack(#OBJGRAFIK_STIEFEL1,1,1)
   EndIf
   spieler(akt_spieler)\goblinlehre+2
   spieler(akt_spieler)\spinnenlehre+2
   spieler(akt_spieler)\untotenlehre+2
   spieler(akt_spieler)\pflanzenlehre+2
   spieler(akt_spieler)\tierkunde+2
   spieler(akt_spieler)\fallenlehre+2
   spieler(akt_spieler)\giftlehre+2
EndIf

; Pfeilmacher
If skills(#CE_PFEILMACHER,akt_spieler)\gewaehlt = 1
   in_rucksack(#OBJGRAFIK_PFEIL1,1)
   in_rucksack(#OBJGRAFIK_PFEIL2,1)
   in_rucksack(#OBJGRAFIK_PFEILE_SCHWARZ,1)
EndIf

; Giftkenntnis
If skills(#CE_GIFTKENNTNIS,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\giftlehre = spieler(akt_spieler)\giftlehre + 2

   ; Welcher Trank ist Gift?
   gift.w = 0
   For j = 0 To #ANZ_TRAENKE-1
      If item(#OBJGRAFIK_TRANK1 + j)\attri1 = #POTION_STRONG_POISON
         gift = #OBJGRAFIK_TRANK1 + j
         ;mark as known potion type
         mischen(j)\learned = mischen(j)\learned | PM(akt_spieler)
      ElseIf item(#OBJGRAFIK_TRANK1 + j)\attri1 = #POTION_WEAK_POISON
         ;mark as known potion type
         mischen(j)\learned = mischen(j)\learned | PM(akt_spieler)
      EndIf
   Next
   If spieler(akt_spieler)\creature_typ = 0
      in_rucksack(gift,5)
   EndIf
   
   ;search poison mushrooms
   For j = 0 To #ANZ_PILZE-1
     If item(#OBJGRAFIK_PILZE_SCHWARZ + j)\attri1 = #MUSHROOM_POISON Or item(#OBJGRAFIK_PILZE_SCHWARZ + j)\attri1 = #MUSHROOM_STRONG_POISON
       ;mark as known
        mush_known(j) = mush_known(j) | PM()
      EndIf
   Next

EndIf

; Bogenschiessen
If skills(#CE_BOGENSCHIESSEN,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_BOGEN,1,1)
   in_rucksack(#OBJGRAFIK_PFEIL,1,1)
EndIf

; Magielehre
If skills(#CE_MAGIELEHRE,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\circle+3
   If test = 1
      spieler(akt_spieler)\circle = 15
   EndIf
EndIf

; Native Magie
If skills(#CE_NATIVE_MAGIE,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\circle = 1
EndIf

; Free Magic ?
tmp_sav.w = spieler(akt_spieler)\circle
If skills(#CE_FREIE_MAGIE,akt_spieler)\gewaehlt = 1
   For i = 1 To tmp_sav
      spieler(akt_spieler)\circle = i
      freie_magie()
   Next
EndIf

; Power
If skills(#CE_ZAUBERMACHT,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Power_score+3
EndIf

; Magieresistenz
If skills(#CE_MAGIERESISTENZ,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\magic_resistance+70
EndIf
If skills(#CE_MAGIESCHWAECHE,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\magic_resistance = -100
EndIf

; Giftresistenz
If skills(#CE_GIFTRESISTENZ,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\poison_resistance+70
EndIf
If skills(#CE_GIFTSCHWAECHE,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\poison_resistance = -100
EndIf


; Mana
If skills(#CE_MANA,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Mana = 12
   spieler(akt_spieler)\MaxMana = 12
   spieler(akt_spieler)\ManaGain = 4
   
   If test = 1
      spieler(akt_spieler)\Mana = 120
      spieler(akt_spieler)\MaxMana = 120
      spieler(akt_spieler)\ManaGain = 40
   EndIf
EndIf

; Natural Mana
If skills(#CE_NATURAL_MANA,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Mana+2
   spieler(akt_spieler)\MaxMana+2
EndIf

; Kraeuterkunde
If skills(#CE_KRAEUTERKUNDE,akt_spieler)\gewaehlt = 1
   For j = 0 To #ANZ_TRAENKE-1
     ;mark all potions as known
     mischen(j)\learned = mischen(j)\learned | PM()
   Next
   For j = 0 To #ANZ_PILZE-1
     ;mark all mushrooms as known
     mush_known(j) = mush_known(j) | PM()
   Next

   For i = 1 To 5
      akt_pilz = Random(#ANZ_PILZE-1) + #OBJGRAFIK_PILZE_SCHWARZ
      in_rucksack(akt_pilz,1)
   Next
   If spieler(akt_spieler)\creature_typ = 0
      in_rucksack(#OBJGRAFIK_KRAEUTER,5)
   EndIf
EndIf

; Alchimie
If skills(#CE_ALCHEMIE,akt_spieler)\gewaehlt = 1
   If spieler(akt_spieler)\creature_typ = 0
      For i = 1 To 5
         akt_pilz = Random(#ANZ_PILZE-1) + #OBJGRAFIK_PILZE_SCHWARZ
         in_rucksack(akt_pilz,1)
      Next
   EndIf
   For j = 0 To #ANZ_TRAENKE-1
     ;mark all potions as known
     mischen(j)\learned = mischen(j)\learned | PM()
   Next
EndIf

; Thaumaturgie
If skills(#CE_THAUMATURGIE,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0

   For hugo = 1 To 5
      welcher = Random(28)+1
      obj.w = 0
      Select(welcher)
       Case 1
          obj = #OBJGRAFIK_EDELSTEIN_TUERKIS
       Case 2
          obj = #OBJGRAFIK_EDELSTEIN_GELB
       Case 3
          obj = #OBJGRAFIK_EDELSTEIN_BLAU
       Case 4
          obj = #OBJGRAFIK_EDELSTEIN_ROT
       Case 5
          obj = #OBJGRAFIK_BERNSTEIN
       Case 6
          obj = #OBJGRAFIK_ZAUBERSTAB1
       Case 7
          obj = #OBJGRAFIK_ZAUBERSTAB2
       Case 8
          obj = #OBJGRAFIK_ZAUBERSTAB3
       Case 9
          obj = #OBJGRAFIK_ZAUBERSTAB4
       Case 10
          obj = #OBJGRAFIK_ZAUBERSTAB5
       Case 11
          obj = #OBJGRAFIK_ZAUBERSTAB6
       Case 12
          obj = #OBJGRAFIK_ZAUBERSTAB7
       Case 13
          obj = #OBJGRAFIK_ZAUBERSTAB8
       Case 14
          obj = #OBJGRAFIK_EDELSTEIN_GRUEN 
       Case 15
          obj = #OBJGRAFIK_EDELSTEIN_WEISS 
       Case 16
          obj = #OBJGRAFIK_EDELSTEIN_SCHWARZ 
       Case 17
          obj = #OBJGRAFIK_JADE 
       Case 18
          obj = #OBJGRAFIK_MONDSTEIN 
       Case 19
          obj = #OBJGRAFIK_OPAL 
       Case 20
          obj = #OBJGRAFIK_TIGERAUGE
       Case 21
          obj = #OBJGRAFIK_WAND1
       Case 22
          obj = #OBJGRAFIK_WAND2
       Case 23
          obj = #OBJGRAFIK_WAND3
       Case 24
          obj = #OBJGRAFIK_WAND4
       Case 25
          obj = #OBJGRAFIK_WAND5
       Case 26
          obj = #OBJGRAFIK_WAND6
       Case 27
          obj = #OBJGRAFIK_WAND7
       Case 28
          obj = #OBJGRAFIK_WAND8
       Case 29
          obj = #OBJGRAFIK_WAND9
      EndSelect
      
      i = backpackspace()
      
      If i <= #MAX_RUCKSACK
        inventory(i,akt_spieler)\name = obj
        If item(obj)\type = #ITEMTYPE_BASTON
          inventory(i,akt_spieler)\status = 0
          inventory(i,akt_spieler)\attri5 = 1+Random(2) ; quality rating
        EndIf
      EndIf
      inventory(i,akt_spieler)\benutzt = 0
   Next
EndIf

; Zauberschrift
If skills(#CE_ZAUBERSCHRIFT,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   For hugo = 1 To 5
      in_rucksack(#OBJGRAFIK_SCHRIFTROLLE,1)
   Next
   ; Zauberbuch
   in_rucksack(#OBJGRAFIK_BUCH,1)
EndIf

; Wahrnehmung
If skills(#CE_WAHRNEHMUNG,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Perception+3
EndIf

; Schnelligkeit
If skills(#CE_SCHNELLIGKEIT,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Speed+4
   spieler(akt_spieler)\MaxSpeed+4
EndIf

; Glueck
If skills(#CE_GLUECK,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\luck_score+3
EndIf

; Kartographie
If skills(#CE_KARTOGRAPHIE,akt_spieler)\gewaehlt = 1
   in_rucksack(#OBJGRAFIK_KARTE,1)
EndIf

; Spelunker
If skills(#CE_SPELUNKER,akt_spieler)\gewaehlt = 1
   in_rucksack(#OBJGRAFIK_LAMPE1,1)
   in_rucksack(#OBJGRAFIK_OEL,2)
   in_rucksack(#OBJGRAFIK_SEIL,1)
   in_rucksack(#OBJGRAFIK_SPITZHACKE,1)
   in_rucksack(#OBJGRAFIK_SCHAUFEL,1)
EndIf

; Erbschaft
If skills(#CE_ERBSCHAFT,akt_spieler)\gewaehlt = 1
   i = backpackspace()
   ; Goldsack
   inventory(i,akt_spieler)\name = #OBJGRAFIK_BEUTEL
   inventory(i,akt_spieler)\status = 0
   inventory(i,akt_spieler)\attri5 = 0
   spieler(akt_spieler)\gold = 1000
   
   If test = 1
     spieler(akt_spieler)\gold = 40000
   EndIf
EndIf

; Udjat-Auge
If skills(#CE_UDJAT,akt_spieler)\gewaehlt = 1
   in_rucksack(#OBJGRAFIK_UDJAT,1)
EndIf

; Schwertkampf
If skills(#CE_SCHWERTKAMPF,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_LANGSCHWERT,1,1)
EndIf

; Axtkampf
If skills(#CE_AXTKAMPF,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_AXT3,1,1)
EndIf

; Speerkampf
If skills(#CE_SPEERKAMPF,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_SPEER1,1,1)
EndIf

; Hammerkampf
If skills(#CE_HAMMERKAMPF,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_HAMMER,1,1)
EndIf

; kampf in ruestung bekommen die kleine platte
If skills(#CE_KAMPF_IN_RUESTUNG,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_PLATTENPANZER1,1,1)
EndIf

; Wurfwaffen
If skills(#CE_WURFWAFFEN,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_DOLCH,5)
EndIf

; Ueberlebenskuenstler
If skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   in_rucksack(#OBJGRAFIK_HUEHNCHEN,1)
   in_rucksack(#OBJGRAFIK_KRAEUTER,5)
   in_rucksack(#OBJGRAFIK_ANGEL,1)
   in_rucksack(#OBJGRAFIK_FALLENWERKZEUG,1)
EndIf

; Ringmeisterung
If skills(#CE_RINGMEISTERUNG,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\creature_typ = 0
   willi = Random(11)+1
   Select (willi)
      Case 1: hugo = #OBJGRAFIK_RING2
      Case 2: hugo = #OBJGRAFIK_RING_BLAU
      Case 3: hugo = #OBJGRAFIK_RING_ROT
      Case 4: hugo = #OBJGRAFIK_RING_GRUEN
      Case 5: hugo = #OBJGRAFIK_RING1
      Case 6: hugo = #OBJGRAFIK_TOTENKOPFRING
      Case 7: hugo = #OBJGRAFIK_RING_KLEIN1
      Case 8: hugo = #OBJGRAFIK_RING_KLEIN2
      Case 9: hugo = #OBJGRAFIK_RING_KLEIN3
      Case 10: hugo = #OBJGRAFIK_RING_KLEIN4
      Case 11: hugo = #OBJGRAFIK_RING_KLEIN5
      Case 12: hugo = #OBJGRAFIK_RING_KLEIN6
   EndSelect
   in_rucksack(hugo,1,1)
EndIf


; Elfenblut
If skills(#CE_ELFENBLUT,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Attack = spieler(akt_spieler)\Attack + 1
   spieler(akt_spieler)\Strength = spieler(akt_spieler)\Strength + 1
   spieler(akt_spieler)\Dexterity = spieler(akt_spieler)\Dexterity + 1
   spieler(akt_spieler)\Perception = spieler(akt_spieler)\Perception + 1
   spieler(akt_spieler)\Luck_score = spieler(akt_spieler)\Luck_score + 1
   spieler(akt_spieler)\Power_score = spieler(akt_spieler)\Power_score + 1
EndIf


; Schwaechlich
If skills(#CE_SCHWACH,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Lifepoints = 10
   spieler(akt_spieler)\MaxLifepoints = 10
   spieler(akt_spieler)\LifeGain = 2
EndIf


; Geringes Mana
If skills(#CE_GERINGES_MANA,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\Mana = 1
   spieler(akt_spieler)\MaxMana = 1
   spieler(akt_spieler)\ManaGain = 2
EndIf


; Dumm
If skills(#CE_DUMM,akt_spieler)\gewaehlt = 1
   spieler(akt_spieler)\dumm = 3
EndIf

; inital help for single mages : one crysolit per pick invested in the way of magic
crysolit.w = 0
If nr_of_players = 2 And spieler(akt_spieler)\creature_typ = 0
  For i = 1 To #Anz_Skills
    If skills(i,akt_spieler)\gewaehlt = 1 And (skills(i,akt_spieler)\gruppe = 3 Or i = #CE_DISJUNCT Or i = #CE_KEINE_BASISMAGIE Or i = #CE_KURZE_MAGIE Or i = #CE_ZAUBERFUERST Or i = #CE_GOTT_DES_TODES Or i = #CE_GOETTIN_DER_WEISHEIT Or i = #CE_GERINGES_MANA Or i = #CE_MAGIESCHWAECHE Or i = #CE_NATURAL_MANA Or i = #CE_NATIVE_MAGIE)
      crysolit + skills(i,akt_spieler)\kosten
    EndIf
  Next
  If crysolit > 0
    in_rucksack(#OBJGRAFIK_CRYSOLIT,crysolit)
  EndIf
EndIf


For i = 1 To #MAX_RUCKSACK ;add potentially missing quality rating (should not happen)
   If item(inventory(i,akt_spieler)\name)\qualitaet = 1 And inventory(i,akt_spieler)\attri5 = 0
      inventory(i,akt_spieler)\attri5 = Random(2)+1
   EndIf
   If item(inventory(i,akt_spieler)\name)\qualitaet = 3 And inventory(i,akt_spieler)\attri5 = 0
      inventory(i,akt_spieler)\attri5 = 2*(Random(2)+1)
   EndIf
Next

EndProcedure

; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 95
; FirstLine = 79
; Folding = -
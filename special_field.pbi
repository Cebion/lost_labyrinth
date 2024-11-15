Procedure on_waterfield()

   Shared aktion

   spieler(akt_spieler)\Durst = 0
   spieler(akt_spieler)\verdursten = 0
   For i = 1 To #MAX_RUCKSACK
      If inventory(i,akt_spieler)\name = #OBJGRAFIK_WASSERSCHLAUCH
         inventory(i,akt_spieler)\status = 7
      EndIf
   Next
   ; Fliegen ?
   If habich(#SPELL_FLIEGEN) = 0 And habich(#SPELL_FLEDERMAUSGESTALT) = 0 And habich(#SPELL_VOGELGESTALT) = 0
      ; Wassergehen ?
      If habich(#SPELL_UEBERS_WASSER_GEHEN) = 0
	 If spieler(akt_spieler)\in_water
	    Sound(#SOUND_SPLISH)
	 Else
	    Sound(#SOUND_SPLASH)
	    spieler(akt_spieler)\in_water = 1
	 EndIf
	 ; Schwimmen?
	 If skills(#CE_SCHWIMMEN,akt_spieler)\gewaehlt = 0
	    aktion = 1
	    If spieler(akt_spieler)\fluch = #FLUCH_DES_POSEIDON
	       spielerschaden(2,3,#ROD_DROWNING)
	    Else
	       spielerschaden(1,3,#ROD_DROWNING)
	    EndIf
	 EndIf
      EndIf
   EndIf
         
EndProcedure


Procedure teacher(which.w)
   Shared aktion

   If skills(#CE_AUSGESTOSSEN,akt_spieler)\gewaehlt = 1 Or spieler(akt_spieler)\fluch = #FLUCH_NOSFERATU
      message(327,#COLOR_GRAU)
      ;cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
   Else
      If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = -1
         gefaehrte(which)
      endif
      If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 > 0
         act_nr_in_level.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1
         lehrer(which,act_nr_in_level)
      EndIf
   EndIf
   laby_screen()
   aktion = 1

EndProcedure


Procedure autopickup()

Shared aktion, autopickup, over_item, warten
   
   testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld

   If spieler(akt_spieler)\charge > 0 And skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
      ProcedureReturn 0
   EndIf
   
      over_item = 0
      If testfeld >= #FELD_BAUM3 And testfeld <= #FELD_BAUM6
         If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\stat1 <> 1
            labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\stat1 = 1
            If get_chance(100) < 20 + luck() * 5 
               Sound(#SOUND_SUCCESS)
               i.w = backpackspace()
               If i <= #MAX_RUCKSACK
                  gef_apfel = gef_apfel + 1
                  inventory(i,akt_spieler)\name = #OBJGRAFIK_APFEL
                  inventory(i,akt_spieler)\benutzt = 0
                  ;inventory(i,akt_spieler)\status = 30  ; Naehrwert
               EndIf
               message(311,#COLOR_GELB)
            EndIf
            aktion = 1
         EndIf
      EndIf
      
      ; Objekt?
      If laby_item(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\name[spieler(akt_spieler)\level] > 0
         objekt(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
      EndIf
       
       If testfeld = #FELD_TRUHE  ; Hier gibts Gegenstaende!
         chest(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf
      EndIf
         
      If testfeld = #FELD_WIESE_TRUHE  ; Hier gibts Gegenstaende!
         chest(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf
       EndIf
      
      If testfeld = #FELD_GRUENETRUHE1
         message(978,#COLOR_BLAU)
      EndIf
      
      If testfeld = #FELD_GRUENETRUHE2
         chest(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf
      EndIf
         
      If testfeld = #FELD_WIESE_GRUENETRUHE1
         message(978,#COLOR_BLAU)
      EndIf
         
      If testfeld = #FELD_WIESE_GRUENETRUHE2
         chest(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf
      EndIf
         
     If testfeld = #FELD_BLAUETRUHE1
         message(977,#COLOR_BLAU)
      EndIf
         
     If testfeld = #FELD_BLAUETRUHE2
         chest(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf
      EndIf
      
      If testfeld = #FELD_WASSER_TRUHE
         chest(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf 
      EndIf
         
      If testfeld = #FELD_WASSER_GRUENE_TRUHE
         chest(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf 
      EndIf
         
      If testfeld = #FELD_GOLD  ; Hier gibts Kohle!
         gold(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf 
      EndIf
      
      If testfeld = #FELD_WASSER_GOLDSACK  ; Hier gibts Kohle!
         gold(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf 
      EndIf
      
      If testfeld = #FELD_STABTEIL
          Sound(#SOUND_SUCCESS)
          which_piece.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1
          einpacken.w = in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_1-1+which_piece,1)
          if einpacken <= #MAX_RUCKSACK
             cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
          else
            message(428,#COLOR_BLAU)
          endif
          laby_screen()
          message(238,#COLOR_GELB)
          If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
             aktion = 1
          EndIf
      EndIf

   ;here are non item specials which can't be used in charge mode even with swift fingers
   If spieler(akt_spieler)\charge > 0
      ProcedureReturn 0
   EndIf
         
      If testfeld = #FELD_SANKTUM
        If spieler(akt_spieler)\Lifepoints < maxlife() Or skills(#CE_AKOLYTH,akt_spieler)\gewaehlt = 1 Or skills(#CE_GOETTIN_DER_HEILUNG,akt_spieler)\gewaehlt = 1 Or skills(#CE_GOETTIN_DER_WEISHEIT,akt_spieler)\gewaehlt = 1
            grafik = 0
            ; Gottlos oder Verflucht?
            If skills(#CE_GOTTLOS,akt_spieler)\gewaehlt = 0 And spieler(akt_spieler)\fluch <> #FLUCH_DES_OSIRIS

               If skills(#CE_GOETTIN_DER_HEILUNG,akt_spieler)\gewaehlt = 1
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 & (PM()*16) = 0
                     labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 + (PM()*16)
                     spieler(akt_spieler)\maxlifepoints = spieler(akt_spieler)\maxlifepoints + 1
                     message(323,#COLOR_GELB)
                  EndIf
               EndIf
               
               If skills(#CE_GOETTIN_DER_WEISHEIT,akt_spieler)\gewaehlt = 1
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 & (PM()*16) = 0
                     labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 + (PM()*16)
                     spieler(akt_spieler)\maxmana = spieler(akt_spieler)\maxmana + 1
                     spieler(akt_spieler)\mana = spieler(akt_spieler)\mana + 1
                     message(324,#COLOR_GELB)
                  EndIf
               EndIf
               
               If spieler(akt_spieler)\Lifepoints < maxlife() Or skills(#CE_GOETTIN_DER_WEISHEIT,akt_spieler)\gewaehlt = 1
                  grafik = 1
                  spieler(akt_spieler)\Lifepoints = maxlife()
               EndIf
               ; Akolyth ?
               If skills(#CE_AKOLYTH,akt_spieler)\gewaehlt = 1
                  grafik = 1
                  For i = 1 To #ACTIVE_SLOTS
                     If aktive(i,akt_spieler)\dauer > 0 And aktive(i,akt_spieler)\dauer <> #UNENDLICH
                        aktive(i,akt_spieler)\nr = 0
                        aktive(i,akt_spieler)\staerke = 0
                        aktive(i,akt_spieler)\dauer = 0
                     EndIf
                  Next
                  spieler(akt_spieler)\poison = 0
                  spieler(akt_spieler)\fluch = 0
                  spieler(akt_spieler)\fluchdauer = 0
                  spieler(akt_spieler)\krankheit = 0
                  spieler(akt_spieler)\krankheitdauer = 0
                  spieler(akt_spieler)\Mana = maxmana()
               EndIf
            EndIf
            If grafik = 1
               aktion = 1
               Sound(#SOUND_HOLY)
               For j = 1 To 5
                  For i = 1 To 4
                     laby_screen2()
                     ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                     DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
      
                     end_screen()
                     Delay(delay_animation2)
                  Next
               Next
               
               ; Sanktum leer?
               labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 - 1
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 & 15 = 0
                  Sound(#SOUND_WIND)
                  message(259,#COLOR_BLAU)
                  cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
               EndIf
            EndIf
            laby_screen()
        EndIf
      EndIf
         
      If testfeld = #FELD_HAENDLER1 Or testfeld = #FELD_HAENDLER2 Or testfeld = #FELD_HAENDLER3 Or testfeld = #FELD_HAENDLER4 Or testfeld = #FELD_HAENDLER4_4 Or testfeld = #FELD_HAENDLER9 Or testfeld = #FELD_HAENDLER10
         If skills(#CE_AUSGESTOSSEN,akt_spieler)\gewaehlt = 1 Or spieler(akt_spieler)\fluch = #FLUCH_NOSFERATU
            message(327,#COLOR_GRAU)
            ;cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
         Else
            warten = 0
            merchant(labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1)
         EndIf
         laby_screen()
         aktion = 1
      EndIf
         
      If testfeld = #FELD_LEHRER1
	      teacher(1)
      EndIf
         
      If testfeld = #FELD_LEHRER2
	      teacher(2)
      EndIf
         
      If testfeld = #FELD_LEHRER3
	      teacher(3)
      EndIf
         
      If testfeld = #FELD_LEHRER4
	      teacher(4)
      EndIf
         
      If testfeld = #FELD_LEHRER5
	      teacher(5)
      EndIf
         
      If testfeld = #FELD_LEHRER6
	       teacher(6)
      EndIf
         
      If testfeld = #FELD_LEHRER7
         teacher(7)
      EndIf
         
      If testfeld = #FELD_LEHRER8
          If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 2
               helpful_wizard()
	        Else
	            teacher(8)
	        EndIf
      EndIf
         
      If testfeld = #FELD_LEHRER9
	      teacher(9)
      EndIf
         
      If testfeld = #FELD_LEHRER10
	      teacher(10)
      EndIf
         
      If testfeld = #FELD_WOUNDED_HERO1
         wounded_hero()
         laby_screen()
         aktion = 1
      EndIf
         
      If testfeld = #FELD_WOUNDED_HERO2
         message(513,#COLOR_GELB)
      EndIf

      If testfeld = #FELD_NEXUS
        If spieler(akt_spieler)\Mana < maxmana() And skills(#CE_DISJUNCT,akt_spieler)\gewaehlt = 0
            If spieler(akt_spieler)\fluch <> #FLUCH_DES_SETH
               spieler(akt_spieler)\Mana = maxmana()
               For i = 1 To #ACTIVE_SLOTS
                  If aktive(i,akt_spieler)\dauer > 0 And aktive(i,akt_spieler)\dauer <> #UNENDLICH
                     aktive(i,akt_spieler)\nr = 0
                     aktive(i,akt_spieler)\staerke = 0
                     aktive(i,akt_spieler)\dauer = 0
                  EndIf
               Next
               Sound(#SOUND_HARP)
               sternchen(160,160,3)
               laby_screen()
               
                ; Nexus leer?
               labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 - 1
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 0
                  Sound(#SOUND_WIND)
                  message(258,#COLOR_BLAU)
                  cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
                  laby_screen()
               EndIf
               
            Else
               message(9,#COLOR_GRAU)
            EndIf
            aktion = 1
        EndIf
      EndIf
      
      If testfeld = #FELD_SCHALTER1
         Sound(#SOUND_EARTH)
         message(389,#COLOR_WEISS)
         setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_SCHALTER2,0,0)
         For i = 1 To groesse(spieler(akt_spieler)\level)
            For j = 1 To groesse(spieler(akt_spieler)\level)
               If labyrinth(spieler(akt_spieler)\level,i,j)\feld = #FELD_AUSGANG
                  ausg_x.w = i
                  ausg_y.w = j
               EndIf
            Next
         Next
         If labyrinth(spieler(akt_spieler)\level,ausg_x-1,ausg_y)\feld = #FELD_TUER2
            setlaby(ausg_x-1,ausg_y,spieler(akt_spieler)\level,#FELD_OFFENE_TUER,0,0)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,ausg_x+1,ausg_y)\feld = #FELD_TUER2
            setlaby(ausg_x+1,ausg_y,spieler(akt_spieler)\level,#FELD_OFFENE_TUER,0,0)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,ausg_x,ausg_y-1)\feld = #FELD_TUER2
            setlaby(ausg_x,ausg_y-1,spieler(akt_spieler)\level,#FELD_OFFENE_TUER,0,0)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,ausg_x,ausg_y+1)\feld = #FELD_TUER2
            setlaby(ausg_x,ausg_y+1,spieler(akt_spieler)\level,#FELD_OFFENE_TUER,0,0)
         EndIf
      EndIf
      
      If spieler(akt_spieler)\creature_typ > 0
         If spieler(akt_spieler)\creature_typ <> #CREATURE_COMPANION
            If testfeld = #FELD_RUNE1
               message(498,#COLOR_GRAU)
               spielerschaden(999,4,#ROD_DRAIN_LIFE)
            ElseIf  testfeld = #FELD_RUNE2
               message(499,#COLOR_GRAU) 
               spielerschaden(myRand2(spieler(akt_spieler)\level)+5,3,#ROD_DRAIN_LIFE)
            EndIf
         EndIf
         ;following special fields only appplicable for real players,not creatures
         ProcedureReturn 0
      EndIf

      If testfeld = #FELD_BRUNNEN
         Sound(#SOUND_FILLUP)
         message(11,#COLOR_BLAU)
         spieler(akt_spieler)\Durst = 0
         spieler(akt_spieler)\verdursten = 0
         aktion = 1
         For i = 1 To #MAX_RUCKSACK
            If inventory(i,akt_spieler)\name = #OBJGRAFIK_WASSERSCHLAUCH
               inventory(i,akt_spieler)\status = 7
            EndIf
         Next
      EndIf
         
      If testfeld = #FELD_AMBOSS
         Sound(#SOUND_METAL)
            message(412,#COLOR_GRAU)
            For feld = 1 To #MAX_RUCKSACK
               If (inventory(feld,akt_spieler)\status = 1 Or inventory(feld,akt_spieler)\status = 2) And (item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_WEAPON Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_HELMET  Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_GLOVE  Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_BOOTS Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_ARMOR Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_SHIELD) 
                  inventory(feld,akt_spieler)\status = 0
               EndIf
            Next
            If get_chance(100) < 20
               Sound(#SOUND_EARTH)
               message(413,#COLOR_GRAU)
               cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
            EndIf
         aktion = 1
      EndIf
         
      If testfeld = #FELD_EINGANG  ; Eingang
         If spieler(akt_spieler)\level > 1
            message(439,#COLOR_WEISS)
            vorheriger_level()
            aktion = 1
         Else
            message(440,#COLOR_WEISS)
         EndIf
      EndIf
      
      If testfeld = #FELD_AUSGANG ; Ausgang
         message(193,#COLOR_WEISS)
         If spieler(akt_spieler)\level+1 > spieler(akt_spieler)\maxlevel
            aufsteigen()
         EndIf
         neuer_level()
         aktion = 1
      EndIf
      
      If testfeld = #FELD_RINNSAAL
         Sound(#SOUND_GULP)
         message(700,#COLOR_GELB)
         IF skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt
            spieler(akt_spieler)\durst = spieler(akt_spieler)\durst - 10
         EndIf
         spieler(akt_spieler)\durst = spieler(akt_spieler)\durst - 10
         If spieler(akt_spieler)\durst < 1
            spieler(akt_spieler)\durst = 0
         EndIf
         cleartile(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
         aktion = 1
      EndIf

EndProcedure


Procedure chest(x.w,y.w)

   If spieler(akt_spieler)\fluch = #FLUCH_DER_ASTARTE
      message(179,#COLOR_GRAU)
   Else
      obje = labyrinth(spieler(akt_spieler)\level,x, y)\stat1
      If obje = 0
        obje = find1()
      EndIf
      i.w = backpackspace()
      If i <= #MAX_RUCKSACK
         If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_TRUHE
            cleartile(x, y)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_WIESE_TRUHE
            setlaby(x, y,spieler(akt_spieler)\level,#FELD_GRAS,0,0)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_WASSER_TRUHE
            setlaby(x, y,spieler(akt_spieler)\level,#FELD_WASSER,0,0)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_GRUENETRUHE2
            cleartile(x, y)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_BLAUETRUHE2
            cleartile(x, y)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_WIESE_GRUENETRUHE2
            setlaby(x, y,spieler(akt_spieler)\level,#FELD_GRAS,0,0)
         EndIf
         If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_WASSER_GRUENE_TRUHE
            setlaby(x, y,spieler(akt_spieler)\level,#FELD_WASSER,0,0)
         EndIf
         Sound(#SOUND_OPEN_CHEST)
         in_rucksack(obje,1)
         If item(obje)\type = #ITEMTYPE_POTION
            If mischen(obje-#OBJGRAFIK_TRANK1)\learned & PM() = 0
               obje = 998
            EndIf
         EndIf
         If obje = #OBJGRAFIK_SCHRIFTROLLE
            If skills(#CE_ZAUBERSCHRIFT,akt_spieler)\gewaehlt = 0 And skills(#CE_SCROLLORE,akt_spieler)\gewaehlt = 0
               obje = 997
            EndIf
         EndIf
         
         nachricht2(6,obje)
      Else
         message(428,#COLOR_ROT)
      EndIf
   EndIf

EndProcedure


Procedure gold(x.w, y.w)

   gold_stack()
   If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_GOLD
      cleartile(x, y)
   EndIf
   If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_WASSER_GOLDSACK
      setlaby(x, y,spieler(akt_spieler)\level,#FELD_WASSER,0,0)
   EndIf
         
EndProcedure


Procedure objekt(x.w, y.w)

Shared aktion, bewegt

   unaufmerksam.w = 0
   take_item.w = 1
   item.w = laby_item(x, y)\name[spieler(akt_spieler)\level]
   item_status.w = laby_item(x, y)\status[spieler(akt_spieler)\level]
   item_attri.w = laby_item(x, y)\anzahl[spieler(akt_spieler)\level]
   message.w = 0
   ; moneybag
   If item = #OBJGRAFIK_BEUTEL
      If gold_finden2(laby_item(x, y)\anzahl[spieler(akt_spieler)\level])
         ProcedureReturn 0; no room for gold
      Else
         setitem(x,y,spieler(akt_spieler)\level,0,0,0) ;remove item
         ProcedureReturn 0 ;done
      EndIf
   ElseIf item = #OBJGRAFIK_SCHRIFTROLLE
      ;found an identified scroll or we already know that one ?
      If item_attri & 256 Or learned(akt_spieler,item_status) & #l_scrollname
         item_attri = item_attri | 256 ;mark item as identified
         learned(akt_spieler,item_status) = learned(akt_spieler,item_status) | #l_scrollname ; mark scroll type as learned
         For i.w = 1 to #MAX_RUCKSACK
            If inventory(i,akt_spieler)\name = item And inventory(i,akt_spieler)\status = item_status
               inventory(i,akt_spieler)\attri5 = inventory(i,akt_spieler)\attri5 | 256 ;mark same scrolls as identified
            EndIf
         Next
      EndIf
      message = 310
   ElseIf item(item)\type = #ITEMTYPE_MUSHROOM
      If skills(#CE_UNAUFMERKSAM,akt_spieler)\gewaehlt = 1
         take_item = 0
         unaufmerksam = 1 ;can't take 
      Else
         ;found an identified mushroom or we already know that one
         If item_status = 1 Or mush_known(item-#OBJGRAFIK_PILZE_SCHWARZ) & PM()
            item_status = 1 ; mark mushroom as identified
            mush_known(item-#OBJGRAFIK_PILZE_SCHWARZ) = mush_known(item-#OBJGRAFIK_PILZE_SCHWARZ) | PM()  ;mark mushroom type as identified
            For i.w = 1 to #MAX_RUCKSACK
               If inventory(i,akt_spieler)\name = item
                  inventory(i,akt_spieler)\status = 1 ;mark same mushrooms as identified
               EndIf
            Next
         Else
            message = 10 ; unknown mushroom
         EndIf
      EndIf
   ElseIf item(item)\type = #ITEMTYPE_POTION
      ;found an identified potion or we already know that one
      If item_status = 1 Or mischen(item-#OBJGRAFIK_TRANK1)\learned & PM() = 0
         item_status = 1 ; mark potion as identified
         mischen(item-#OBJGRAFIK_TRANK1)\learned = mischen(item-#OBJGRAFIK_TRANK1)\learned | PM() ;mark potion type as identified
         For i.w = 1 to #MAX_RUCKSACK
            If inventory(i,akt_spieler)\name = item
               inventory(i,akt_spieler)\status = 1 ;mark same potions as identified
            EndIf
         Next
      Else
         message = 309 ;unknown potion
      EndIf
   EndIf
   If unaufmerksam
      message(221,#COLOR_GRAU)
   Else
      j.w = 0 
      Repeat ; stackable item exists in the backpack?
         j = j + 1
         attri.w = inventory(j,akt_spieler)\attri5
         status.w = inventory(j,akt_spieler)\status
         name.w = inventory(j,akt_spieler)\name
         If name = item And attri = item_attri
            If item(item)\type = #ITEMTYPE_AMMUNITION
              Break ; allow stacking while in use here,also status is number counter for ammunition
            Else
               If inventory(j,akt_spieler)\benutzt = 0 And status = item_status
                  Break ; found suitable stacking item
               EndIf
            EndIf
         EndIf
      Until j > #MAX_RUCKSACK
      If j < #MAX_RUCKSACK ;found stackable 
         If item(item)\type = #ITEMTYPE_AMMUNITION
            stack_size.w = item(item)\attri1
            status = status + item_status
            If status > stack_size
               status = status - stack_size
               inventory(j,akt_spieler)\anzahl = inventory(j,akt_spieler)\anzahl + 1
            EndIf
            inventory(j,akt_spieler)\status = status
         Else
            inventory(j,akt_spieler)\anzahl = inventory(j,akt_spieler)\anzahl + 1
         EndIf
      Else
         j = backpackspace() ;look for free slot
         If j <= #MAX_RUCKSACK ; free slot found
            inventory(j,akt_spieler)\name = item
            inventory(j,akt_spieler)\benutzt = 0
            inventory(j,akt_spieler)\status = item_status
            inventory(j,akt_spieler)\attri5 = item_attri
         Else
            take_item = 0
            message(428,#COLOR_GRAU)
         EndIf
      EndIf
      
      If take_item
         Sound(#SOUND_SUCCESS)
         setitem(x,y,spieler(akt_spieler)\level,0,0,0)
         If message 
            message(message,#COLOR_GELB)
         Else
            nachricht2(6,item)
         EndIf
         If skills(#CE_FINGERFERTIGKEIT, akt_spieler)\gewaehlt = 0
            aktion = 1
         EndIf
      EndIf
   EndIf

EndProcedure


Procedure sonderfeld()
      
Shared frame, bewegt, aktion, autopickup

   inhalt_x.w = inhalt(spieler(akt_spieler)\level)
   inhalt_y.w = 0
   If inhalt_x > 10
      Repeat
         inhalt_y = inhalt_y + 1
         inhalt_x = inhalt_x - 10
      Until inhalt_x < 11
   EndIf
   If inhalt_x = 10
      inhalt_x = 0
      inhalt_y = inhalt_y + 1
   EndIf
   
   If bewegt = 1

   type.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld
   
   If fields(type)\water = 0
      spieler(akt_spieler)\in_water = 0
   EndIf 

   Select type 
      Case #FELD_ALTAR2
         ; Gottlos ?
         If skills(#CE_GOTT_DES_KRIEGES,akt_spieler)\gewaehlt = 1 Or skills(#CE_GOTT_DES_TODES,akt_spieler)\gewaehlt = 1 Or skills(#CE_GOETTIN_DER_WEISHEIT,akt_spieler)\gewaehlt = 1 Or skills(#CE_GOETTIN_DER_HEILUNG,akt_spieler)\gewaehlt = 1 Or skills(#CE_GOTT_DER_GEHEIMNISSE,akt_spieler)\gewaehlt = 1 Or skills(#CE_GOTT_DES_REICHTUMS,akt_spieler)\gewaehlt = 1
            If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 > 0
               If altar()
                  labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 - 1
               EndIf
               ;spieler(akt_spieler)\character_y = spieler(akt_spieler)\character_y - 1
               laby_screen()
            Else
               message(654,#COLOR_GELB)
            EndIf
         Else
            message(655,#COLOR_GELB)
         EndIf
         aktion = 1
      Case #FELD_SKELETT2  ; Vergrabener Schatz
         If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 0 
            message(446,#COLOR_WEISS)
            labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 1
         EndIf
      Case #FELD_HEADSTONE
         aktion = 1
         If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 1
               labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 0
               If get_chance(100) < 30
                  hugo = Random(7)
                  ; Hinterhalt
                  If hugo = 0 Or hugo = 1 Or hugo = 2
                     egon = Random(2)+1
                     If egon = 1
                        welches.w = 4 ; Skelettkrieger
                     EndIf
                     If egon = 2
                        welches.w = 16 ; Zombie
                     EndIf
                     If egon = 3
                        welches.w = 22 ; Skelettritter
                     EndIf
                     message(4,#COLOR_ROT)
                     hinterhalt(welches)
                  EndIf
                  ; Gold
                  If hugo = 3 Or hugo = 4
                    gold_stack()
                  EndIf
                  ; Gegenstand
                  If hugo = 5
                     obje = find1()
                     in_rucksack(obje,1)
                     If obje >= #OBJGRAFIK_TRANK1 And obje <= #ANZ_TRAENKE-1 + #OBJGRAFIK_TRANK1 And mischen(obje-#OBJGRAFIK_TRANK1)\learned & PM() = 0
                        obje = 998
                     EndIf
                     nachricht2(6,obje)
                  EndIf
                  ; Dolch
                  If hugo = 6 Or hugo = 7
                     in_rucksack(#OBJGRAFIK_DOLCH,1)
                  EndIf
               Else
                  message(445,#COLOR_WEISS)
               EndIf
         EndIf
         
       Case #FELD_LABOR2
          If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\stat1 <> 1
            If spieler(akt_spieler)\fluch <> #FLUCH_DES_LEPRECHAUN
               labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\stat1 = 1
               If get_chance(100) < 20 + luck() * 5
                  Sound(#SOUND_SUCCESS)
                  obje = Random(#ANZ_TRAENKE-1) + #OBJGRAFIK_TRANK1
                  in_rucksack(obje,1)
                  message(309,#COLOR_GELB)
               EndIf
            Else
               message(7,#COLOR_GRAU)
            EndIf
            aktion = 1
         EndIf
         
      Case #FELD_BUECHER2
         If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\stat1 <> 1
            If spieler(akt_spieler)\fluch <> #FLUCH_DES_LEPRECHAUN
               labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\stat1 = 1
               If get_chance(100) < 20 + luck() * 5
                  Sound(#SOUND_SUCCESS)
                  gef_rolle = gef_rolle + 1
                  in_rucksack(#OBJGRAFIK_SCHRIFTROLLE,1)
                  message(310,#COLOR_GELB)
               EndIf
            Else
               message(7,#COLOR_GRAU)
            EndIf
            aktion = 1
         EndIf
         
      Case #FELD_GIFT
         If skills(#CE_GIFTRESISTENZ,akt_spieler)\gewaehlt = 0
            aktion = 1
            add_poison(10)
         Else
            message(256,#COLOR_GRUEN)
         EndIf
         
      Case #FELD_GIFTIG
         If skills(#CE_GIFTRESISTENZ,akt_spieler)\gewaehlt = 0
           ;aktion = 1
           add_poison(10)
         Else
            message(256,#COLOR_GRUEN)
         EndIf
         
      Case #FELD_FEUER1
         ; Feuerschild ?
         If habich(#SPELL_WINTERATEM) = 0
            spielerschaden(1,1,#ROD_FIRE)
         EndIf
         ;setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
         aktion = 1
         
      Case #FELD_FEUER2
         ; Feuerschild ?
         If habich(#SPELL_WINTERATEM)
            spielerschaden(1,1,#ROD_FIRE) ;half damage with breath of winter
         Else
            spielerschaden(2,1,#ROD_FIRE)
         EndIf
         ;setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
         aktion = 1
         
      Case #FELD_LAVA
         ; Feuerschild ?
         If habich(#SPELL_WINTERATEM) = 0 And habich(#SPELL_FLIEGEN) = 0 And habich(#SPELL_FLEDERMAUSGESTALT) = 0 And habich(#SPELL_VOGELGESTALT) = 0
            If sonderlevel(spieler(akt_spieler)\level) = 0
               spielerschaden(5,1,#ROD_FIRE)
               aktion = 1
            EndIf
         EndIf
      
      Case #FELD_WASSER
         If (habich(#SPELL_FLIEGEN) And habich(#SPELL_FLEDERMAUSGESTALT) And habich(#SPELL_VOGELGESTALT) And habich(#SPELL_UEBERS_WASSER_GEHEN)) = 0
            ; Schatz im Teich?
            If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 1
              labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1 = 0
              If get_chance(100) < 20
                gold_stack()
              EndIf
            EndIf
         EndIf
         on_waterfield()
         
      Case #FELD_WASSER_GOLDSACK
         on_waterfield()
         
      Case #FELD_WASSER_TRUHE
         on_waterfield()
         
      Case #FELD_WASSER_SKELETT
         on_waterfield()
         
       Case #FELD_WASSER_GRUENE_TRUHE
         on_waterfield()
         
      Case #FELD_TELEPORTER
         Sound(#SOUND_SUCCESS)
         sternchen(156,156,4)
         xsave = spieler(akt_spieler)\character_x
         ysave = spieler(akt_spieler)\character_y
         spieler(akt_spieler)\character_x = labyrinth(spieler(akt_spieler)\level,xsave,ysave)\stat1
         spieler(akt_spieler)\character_y = labyrinth(spieler(akt_spieler)\level,xsave,ysave)\stat2
         ClearList(movementlist())
         update_automap()
         laby_screen()
         
      Case #FELD_GITTER1
         Sound(#SOUND_METAL)
         setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_GITTER2,0,0)

      Case #FELD_NAGELGRUBE
         stiefel.w = 0
         For i = 1 To #MAX_RUCKSACK
            If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BOOTS And inventory(i,akt_spieler)\benutzt = 1
               stiefel = i
            EndIf
         Next
         If habich(#SPELL_FLIEGEN) Or habich(#SPELL_FLEDERMAUSGESTALT) Or habich(#SPELL_VOGELGESTALT)
            message(865,#COLOR_BLAU)
         Else
            If stiefel = 0
              ; invulnerable?
              If habich(#SPELL_UNVERWUNDBARKEIT) > 0
                 message(431,#COLOR_BLAU)
              Else
                spielerschaden(1,1,#ROD_NAILPIT)
                message(831,#COLOR_ROT)
              EndIf
            Else
               message(832,#COLOR_WEISS)
               If get_chance(996) < 5
                  If inventory(stiefel,akt_spieler)\status = 1
                     inventory(stiefel,akt_spieler)\status = 2
                     un_equip(stiefel)
                     message(451,#COLOR_ROT)
                  EndIf
                  If inventory(stiefel,akt_spieler)\status = 0
                     inventory(stiefel,akt_spieler)\status = 1
                     message(450,#COLOR_ROT)
                  EndIf
               EndIf
            EndIf
         EndIf
         
      Case #FELD_LAGERFEUER
         ; Feuerschild ?
         If habich(#SPELL_WINTERATEM) = 0
            Sound(#SOUND_OW)
            spielerschaden(1,1,#ROD_FIRE)
            laby_screen()
            aktion = 1
         EndIf
   EndSelect
   
   ; Geheimtuere ?
   entdecken.w = entdecken()
     For k = 1 To 4
       xoffs.w = neighbour(k)\x
       yoffs.w = neighbour(k)\y
      If spieler(akt_spieler)\character_x+xoffs >= 0 And spieler(akt_spieler)\character_y+yoffs >= 0
      If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xoffs, spieler(akt_spieler)\character_y+yoffs)\feld = #FELD_GEHEIMGANG
         If  labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xoffs, spieler(akt_spieler)\character_y+yoffs)\stat1 < entdecken
            setlaby(spieler(akt_spieler)\character_x+xoffs,spieler(akt_spieler)\character_y+yoffs,spieler(akt_spieler)\level,#FELD_TUER1,0,0)
            Sound(#SOUND_EVASION)
            ClearList(movementlist())
            laby_screen()
            main_wait_release = 1
            Delay(delay_animation)
            sav_act_player.w = akt_spieler
            If spieler(akt_spieler)\creature_typ > 0 And skills(#CE_BESCHWOERER,akt_spieler-1)\gewaehlt = 1
               akt_spieler - 1
            EndIf
            If skills(#CE_GOTT_DER_GEHEIMNISSE,akt_spieler)\gewaehlt = 1 And get_chance(105) < 100 - (spieler(akt_spieler)\level * 2)
               spieler(akt_spieler)\maxlifepoints = spieler(akt_spieler)\maxlifepoints + 1
               message(325,#COLOR_GELB)
            EndIf
            akt_spieler = sav_act_player
         EndIf
      EndIf
      EndIf
   Next

      If autopickup = 1
         autopickup()
      EndIf
   EndIf ; bewegt?
   
EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 652
; FirstLine = 634
; Folding = --
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
;              EOF
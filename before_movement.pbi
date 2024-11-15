Procedure entdecken()
;basic used for secret doors, traps and hidden treasure

  akt_entdecken = wahrnehmung() * 10
  akt_entdecken = akt_entdecken - spieler(akt_spieler)\level
   
  If skills(#CE_UNAUFMERKSAM,akt_spieler)\gewaehlt = 1
     akt_entdecken = 0
  EndIf
  If akt_entdecken > 90
    akt_entdecken = 90
  EndIf
   
   ProcedureReturn akt_entdecken
   
EndProcedure


Procedure find_trap()

  entdecken.w = entdecken()+ habich(#SPELL_FALLENSINN) * 10
  If skills(#CE_GEFAHREN_SPUEREN,akt_spieler)\gewaehlt = 1
    entdecken = entdecken + 70
  EndIf
  If skills(#CE_VISIONEN,akt_spieler)\gewaehlt = 1
    entdecken = entdecken + 30
  EndIf
  If entdecken > 90
    entdecken = 90
  EndIf
  ; Fallen spueren ?
  If habich(#SPELL_FALLEN_SPUEREN) > 0
    entdecken = 90
  EndIf
  If skills(#CE_UNAUFMERKSAM,akt_spieler)\gewaehlt = 1
    entdecken = 0
  EndIf
  ProcedureReturn entdecken
EndProcedure


Procedure find_treasure()

  entdecken.w = entdecken()
  If skills(#CE_VISIONEN,akt_spieler)\gewaehlt = 1
    entdecken = entdecken + 30
  EndIf
  If entdecken > 90
    entdecken = 90
  EndIf
  If skills(#CE_UNAUFMERKSAM,akt_spieler)\gewaehlt = 1
    entdecken = 0
  EndIf
  If skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 1
    entdecken = 100
  EndIf
  ProcedureReturn entdecken
EndProcedure


Procedure hydra_cut_head(act_nr_in_level.w)
  ; Find Room
  resetlist(room_list())
  Repeat
      nextelement(room_list())
  Until (room_list()\nr_in_level = act_nr_in_level) And (room_list()\level = spieler(akt_spieler)\level)
  room_list()\stat1 = room_list()\stat1 - 1
  message(287,#COLOR_ROT)
  nachricht3(289,room_list()\stat1,290)
  If room_list()\stat1 < 1
     setlaby(room_list()\x+5,room_list()\y+2,spieler(akt_spieler)\level,#FELD_OFFENE_TUER,0,0)
     setlaby(room_list()\x+3,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+5,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+6,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_GOLD,0,#FELD_HOEHLE2_LEER)
     setlaby(room_list()\x+5,room_list()\y+4,spieler(akt_spieler)\level,#FELD_GOLD,0,#FELD_HOEHLE2_LEER)
     setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+3,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
     setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
  EndIf
EndProcedure


Procedure hydra_grow_head(act_nr_in_level.w)
  ; How many new heads?
  neue_koepfe = get_chance(50)+1
  
  ; Find Room
  resetlist(room_list())
  repeat
      nextelement(room_list())
  until room_list()\nr_in_level = act_nr_in_level and (room_list()\level = spieler(akt_spieler)\level)
  
  room_list()\stat1 = room_list()\stat1 + neue_koepfe
                       
  If room_list()\stat1 > 9
     room_list()\stat1 = 9
  EndIf
                        
  nachricht3(289,room_list()\stat1,290)
   
EndProcedure


Procedure vor_bewegung()

Shared aktion,schutz_min,schutz_max,frame
  mon_no.w

   ; Betrunken
   If spieler(akt_spieler)\betrunken > 0
      zaehler.w = 1
      frei.w = 0
      Repeat
         richtung.w = Random(3)+1
         Select(richtung)
            Case 1: If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y)\feld = inhalt(spieler(akt_spieler)\level)
                        xmod = 1
                        ymod = 0
                        frei = 1
                     EndIf
            Case 2: If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x-1, spieler(akt_spieler)\character_y)\feld = inhalt(spieler(akt_spieler)\level)
                        xmod = -1
                        ymod = 0
                        frei = 1
                     EndIf
            Case 3: If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y+1)\feld = inhalt(spieler(akt_spieler)\level)
                        xmod = 0
                        ymod = 1
                        frei = 1
                     EndIf
            Case 4: If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y-1)\feld = inhalt(spieler(akt_spieler)\level)
                        xmod = 0
                        ymod = -1
                        frei = 1
                     EndIf
         EndSelect
         zaehler = zaehler + 1
      Until frei = 1 Or zaehler > 500
   EndIf

   ; Fallgitter ?
   If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld = #FELD_GITTER2 And habich(#SPELL_FLEDERMAUSGESTALT) = 0
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
         Sound(#SOUND_HUH)
         message(799,#COLOR_WEISS)
      Else
         If get_chance(100) < staerke() * 3
            message(829,#COLOR_WEISS)
            setlaby(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,#FELD_GITTER1,0,0)
         Else
            message(827,#COLOR_WEISS)
         EndIf
      EndIf
      xmod = 0
      ymod = 0
      spieler(akt_spieler)\Speed = 0
      aktion = 1
   EndIf
      
   ; Hydra ?
   If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld >= #FELD_HYDRA1 And labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld <= #FELD_HYDRA12
      act_nr_in_level.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat1
      vorbei = 0
      If spieler(akt_spieler)\schleichen > 0
         akt_schleichen = schleichen()
         If get_chance(100) < akt_schleichen
            message(1,#COLOR_BLAU)
            vorbei = 1
         Else
            message(2,#COLOR_ROT)
            xmod = 0
            ymod = 0
            laby_screen()
            spieler(akt_spieler)\Speed = 0
            aktion = 1
         EndIf
      Else
         If skills(#CE_KEIN_ANGRIFF,akt_spieler)\gewaehlt = 1
            xmod = 0
            ymod = 0
            message(708,#COLOR_ROT)
         Else
            ; Kampf gegen Hydra
            angriff.w = spieler_angriffswert()
            mini = schaden_min()
            maxi = schaden_max()
            critical_chance = schaden_critical()
            treffer.w = get_chance(103)
            If treffer < angriff
               Sound(Random(12))
               If treffer < critical_chance
                  ClipSprite(#SPRITE_TILESET_PROJEKTILE, 3*32, 7*32, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+xmod*32, 160+ymod*32)
                  hydra_cut_head(act_nr_in_level)
               Else
               ; Schaden darstellen
                  ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 7*32, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+xmod*32, 160+ymod*32)
                  schaden = myRand(maxi-mini) + mini
                  wohin = ScreenOutput()
                  StartDrawing(wohin)
                  DrawingMode(1)
                  xx = 175 + xmod*32
                  yy = 168 + ymod*32
                  DrawText(xx-TextWidth((Str(schaden)))/2,yy,Str(schaden),$ffffff)
                  StopDrawing()
                  If schaden > min(max(spieler(akt_spieler)\level/2+1,6),15)
                     hydra_cut_head(act_nr_in_level)
                  Else
                     ; character wieder zeigen
                     ClipSprite(#SPRITE_TILESET_LABYRINTH, 9*32, 8*32, 32, 32) ; Inhalt 
                     DisplaySprite(#SPRITE_TILESET_LABYRINTH, 160, 160)  ; Erst Gang
                     draw_character(spieler(akt_spieler)\face, frame,0) ; Dann character
                     FlipBuffers()
                     hydra_grow_head(act_nr_in_level)
                  EndIf
               EndIf
            Else
               message(286,#COLOR_ROT)
            EndIf
               
            spieler(akt_spieler)\Speed = 0
            aktion = 1
            xmod = 0
            ymod = 0
         EndIf
      EndIf
      If vorbei = 0
         ; Hydra greift an
         ; Ausweichen?
         ausweichen = 0
         If skills(#CE_AUSWEICHEN,akt_spieler)\gewaehlt = 1 And get_chance(50)
            ausweichen = 1
         EndIf
         If ausweichen = 0
            angriff = 80
            angriff = angriff - reflexe() * 10
            If angriff < 10
               angriff = 10
            EndIf
            If spieler(akt_spieler)\fluch = #FLUCH_DER_ATHENE
               angriff = 90
            EndIf
            If get_Chance(100) < angriff
               schaden = myRand2(spieler(akt_spieler)\level/4)+spieler(akt_spieler)\level/4
               IncludeFile("combat2.pbi")
               ; Spieler Tot ?
               If spieler(akt_spieler)\LifePoints < 1
                  ; tot!!!
                  spieler(akt_spieler)\cause_of_death = #ROD_HYDRA
                  tot()
               EndIf
            Else
               message(291,#COLOR_ROT)
            EndIf
         Else
            message(178,#COLOR_ROT)
         EndIf
      EndIf
   EndIf
   
   
   ; Monster ?
   mon_no.w = getmonster(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
   If mon_no
      ; Befreundet?
      If monster_list()\status <> #MONSTERSTATUS_FREUND
         If spieler(akt_spieler)\schleichen  > 0 Or habich(#SPELL_UNSICHTBARKEIT) > 0
            akt_schleichen = schleichen()
            If get_chance(100) < akt_schleichen
               message(1,#COLOR_BLAU)
            Else
               message(2,#COLOR_ROT)
               ; Status aendern
               If monster_list()\status = #MONSTERSTATUS_NORMAL
                  monster_list()\status = #MONSTERSTATUS_ALERT
               EndIf
               If monster_list()\status = #MONSTERSTATUS_SCHLAEFT
                  monster_list()\status = #MONSTERSTATUS_NORMAL
               EndIf
               xmod = 0
               ymod = 0
               laby_screen()
               spieler(akt_spieler)\Speed = 0
               aktion = 1
               ; Unsichtbarkeit weg!
               For i = 1 To #ACTIVE_SLOTS
                  If aktive(i,akt_spieler)\nr = #SPELL_UNSICHTBARKEIT
                     aktive(i,akt_spieler)\nr = 0
                     aktive(i,akt_spieler)\staerke = 0
                     aktive(i,akt_spieler)\dauer = 0
                  EndIf
               Next
            EndIf
         Else
               
            unsichtbar = 0
            ; Unsichtbares Monster ?
            If has_trait2(mon_no,#ME_UNSICHTBAR) = 1 And habich(#SPELL_UNSICHTBARES_SEHEN) = 0 And habich(#SPELL_GEISTERTANZ) = 0
               unsichtbar = 1
            EndIf
            ; Nur mit 20% Kaempfen bei unsichtbar!
            If (unsichtbar = 1 And get_chance(100) < 20) Or unsichtbar = 0
               ; Kaempfen!!!
               If (skills(#CE_RUNDSCHLAG,akt_spieler)\gewaehlt = 1 Or spieler(akt_spieler)\style = 9)
                  xmod_save = xmod
                  ymod_save = ymod
                  nr_of_monsters.w = 0
                  dim mon_here.w(4)
                  For i = 1 to 4
                     If getmonster(spieler(akt_spieler)\character_x+neighbour(i)\x, spieler(akt_spieler)\character_y+neighbour(i)\y)
                        nr_of_monsters = nr_of_monsters + 1
                        mon_here(i) = 1
                     Else
                        mon_here(i) = 0
                     EndIf
                  Next
                  If nr_of_monsters > 1
                     For i = 1 To 12
                        laby_screen2()
                        ClipSprite(#SPRITE_SWING, -32+32*i, 0, 32, 32)
                        DisplayTransparentSprite(#SPRITE_SWING, 156, 156)
                        FlipBuffers()
                        Delay(delay_animation2)
                     Next
                  EndIf
                  For i = 4 to 1 step -1
                     xmod = neighbour(i)\x
                     ymod = neighbour(i)\y
                     If mon_here(i)
                        kampf()
                     EndIf
                  Next
                  xmod = xmod_save
                  ymod = ymod_save
               Else
                  kampf()
               EndIf
               
               mon_no = getmonster(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
               If (skills(#CE_FLINKE_ATTACKE,akt_spieler)\gewaehlt = 1 Or spieler(akt_spieler)\style = 7) And mon_no
                  kampf()
               EndIf
                  
               mon_no = getmonster(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
               If mon_no
                  ; Verstaerkung ?
                  If has_trait2(mon_no,#ME_VERSTAERKUNG) = 1 And get_chance(100) < 60
                     If hinterhalt(mon_no)
                        message(36,#COLOR_ROT)
                        laby_screen2()
                     EndIf
                  EndIf
               EndIf
                  
               If skills(#CE_STURMANGRIFF,akt_spieler)\gewaehlt = 1 And mon_no = 0
                  spieler(akt_spieler)\Speed = spieler(akt_spieler)\Speed - 1
                  spieler(akt_spieler)\charge = spieler(akt_spieler)\face + 1
               Else
                  spieler(akt_spieler)\Speed = 0
                  aktion = 1
               EndIf
            Else 
               message(441,#COLOR_BLAU)
               spieler(akt_spieler)\Speed = 0
               aktion = 1
            EndIf
               xmod = 0
               ymod = 0
         EndIf
      Else
      message(457,#COLOR_GELB)
      EndIf ; befreundet!
   EndIf

   ; Mimic ?
   act_tile.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld
   If act_tile = #FELD_MIMIC
      hugo = #MONSTER_MIMIC
      cleartile(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
      setmonster(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,0,0,0)
      spieler(akt_spieler)\Speed = 0
      aktion = 1
      xmod = 0
      ymod = 0
   EndIf
   
   ; Eisblock ?
   If act_tile = #FELD_EIS
      ; Angriff berechnen
      angriff.w = spieler_angriffswert() / 2
      If get_chance(103) < angriff
         Sound(#SOUND_GLASS)
         cleartile(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod)
         Delay(delay_animation)
         laby_screen()
      Else
         message(3,#COLOR_BLAU)
         Sound(#SOUND_OW)
         spielerschaden(1,3,#ROD_FREEZING)
         Delay(delay_animation)
      EndIf
      spieler(akt_spieler)\Speed = 0
      aktion = 1
      xmod = 0
      ymod = 0
   EndIf

   ; Unaufmerksam?
   If skills(#CE_UNAUFMERKSAM,akt_spieler)\gewaehlt = 0
      ; Falle ?
      If act_tile >= #FELD_SPEERFALLE1 And act_tile <= #FELD_SPEERFALLE1 + 8
         If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat1 < find_trap()
            setlaby(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod)\feld+9,0,0)
            xmod = 0
            ymod = 0
            Sound(#SOUND_EVASION)
            laby_screen()
            FlipBuffers()
            Delay(delay_animation)
            main_wait_release = 1
         EndIf
      EndIf
   
      ; Verborgener Schatz ?
      If act_tile = #FELD_VERBORGENER_SCHATZ
         If get_chance(100) < find_treasure()
            labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld = #FELD_VERBORGENER_SCHATZ2
            ;setlaby(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,#FELD_VERBORGENER_SCHATZ2,0,0)
            xmod = 0
            ymod = 0
            Sound(#SOUND_EVASION)
            laby_screen()
            Delay(delay_animation)
            main_wait_release = 1
         EndIf
      EndIf
   EndIf

   ; Raum ?
   If act_tile  = #FELD_FRAGEZEICHEN
      If spieler(akt_spieler)\creature_typ > 0
         xmod = 0
         ymod = 0
         message(783,#COLOR_WEISS)
      Else
         ; read to this room
         act_nr_in_level.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat2
         if test = 1
            printn("act_nr_in_level:" + str(act_nr_in_level))
         endif
         ResetList(room_list())
         repeat 
            NextElement(room_list())
         until (room_list()\level = spieler(akt_spieler)\level) and (room_list()\nr_in_level = act_nr_in_level)
      
         if room_list()\visions = 1 And skills(#CE_VISIONEN,akt_spieler)\gewaehlt = 1
            room_list()\visions = 0
            Select(room_list()\type)
               Case  0: message(458,#COLOR_BLAU)
               Case  1: message(458,#COLOR_BLAU)
               Case  2: message(459,#COLOR_BLAU)
               Case  3: message(460,#COLOR_BLAU)
               Case  4: message(461,#COLOR_BLAU)
               Case  5: message(462,#COLOR_BLAU)
               Case  6: message(463,#COLOR_BLAU)
               Case  7: message(464,#COLOR_BLAU)
               Case  8: message(465,#COLOR_BLAU)
               Case  9: message(466,#COLOR_BLAU)
               Case 10: message(467,#COLOR_BLAU)
               Case 11: message(468,#COLOR_BLAU)
               Case 12: message(469,#COLOR_BLAU)
               Case 13: message(470,#COLOR_BLAU)
               Case 14: message(471,#COLOR_BLAU)
               Case 15: message(458,#COLOR_BLAU)
               Case 16: message(472,#COLOR_BLAU)
               Case 17: message(473,#COLOR_BLAU)
               Case 18: message(470,#COLOR_BLAU)
               Case 19: message(470,#COLOR_BLAU)
               Case 20: message(474,#COLOR_BLAU)
               Case 21: message(475,#COLOR_BLAU)
               Case 22: message(470,#COLOR_BLAU)
               Case 23: message(476,#COLOR_BLAU)
               Case 24: message(477,#COLOR_BLAU)
               Case 25: message(478,#COLOR_BLAU)
               Case 26: message(479,#COLOR_BLAU)
               Case 27: message(458,#COLOR_BLAU)
               Case 28: message(458,#COLOR_BLAU)
               Case 29: message(507,#COLOR_BLAU)
            EndSelect
            xmod = 0
            ymod = 0
         Else
            raum(act_nr_in_level)
         EndIf
      EndIf ;creature
   EndIf
   
   If fields(act_tile)\block_walk
      If istmauer(act_tile) = 0 Or habich(#SPELL_WALL_WALK) = 0 Or istmauer(labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld)
         xmod = 0
         ymod = 0
      EndIf
   EndIf

   If act_tile = #FELD_RUNE3 And spieler(akt_spieler)\creature_typ <> 0 And spieler(akt_spieler)\creature_typ <> #CREATURE_COMPANION
      message(648,#COLOR_GRAU)
      main_wait_release = 1
      xmod = 0
      ymod = 0
   EndIf
   
   Select act_tile
      Case #FELD_TUER2
         If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
            Sound(#SOUND_OW)
            message(800,#COLOR_WEISS)
         ; Picklocks
         elseIf habich(#SPELL_DOOR_SMASH)
            Sound(#SOUND_EARTH)
            Sound(#SOUND_CRACK)
            Sound(Random(12))
            cleartile(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
            laby_screen()
            Delay(delay_animation)
         ElseIf skills(#CE_SCHLOESSER_OEFFNEN,akt_spieler)\gewaehlt = 1 Or labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat1 = 2 ; unlocked?
            If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat1 = 1 ; Reinforced?
               message(524,#COLOR_WEISS)
            Else
               Sound(#SOUND_OPEN_DOOR)
               setlaby(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,#FELD_OFFENE_TUER,0,0)
               laby_screen()
               Delay(delay_animation)
            EndIf
         Else
            Sound(#SOUND_OW)
            message(185,#COLOR_WEISS)
            main_wait_release = 1
         EndIf
         xmod = 0
         ymod = 0
      
      Case #FELD_WASSERMONSTER
         mon_no.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat1
         monstat.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat2
         aufstehen2(monster(mon_no)\nr)
         setlaby(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,#FELD_WASSER,0,0)
         setmonster(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,mon_no,monster(mon_no)\nr,monster(mon_no)\lebenspunkte,monstat,0,0)
         xmod = 0
         ymod = 0
         laby_screen()
         main_wait_release = 1
         Sound(#SOUND_SPLASH)
   EndSelect
   
   testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld
   
   ; Archipelrand?
   ;If testfeld = #FELD_WASSER
   ;  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat1 = 1
      ;    xmod = 0
      ;   ymod = 0
      ;   Sound(#SOUND_SPLASH)
      ;EndIf
   ;EndIf
   
   If istknochen(testfeld) = 1
      If habich(#SPELL_LIED_DES_TODES) = 0 And mon_no = 0
         If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat1 = 1 Or spieler(akt_spieler)\fluch = #FLUCH_DES_HADES
            Sound(#SOUND_MOAN)
            aufstehen(23)
            cleartile(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod)
            setmonster(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,4,monster(4)\nr,monster(4)\lebenspunkte,0,0,0)
            xmod = 0
            ymod = 0
            spieler(akt_spieler)\Speed = 0
            main_wait_release = 1
            aktion = 1
            laby_screen()
         EndIf
      EndIf
   EndIf
   
   ;test for laby borders
   If spieler(akt_spieler)\character_x+xmod < 1 Or spieler(akt_spieler)\character_y+ymod < 1 Or spieler(akt_spieler)\character_x+xmod > groesse(spieler(akt_spieler)\level) Or spieler(akt_spieler)\character_y+ymod > groesse(spieler(akt_spieler)\level)
      xmod = 0
      ymod = 0
   EndIf
     
EndProcedure
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 206
; FirstLine = 90
; Folding = -
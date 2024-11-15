; Fallen

Procedure ausweichen()

   akt_ausweichen.w = reflexe() * 10 - spieler(akt_spieler)\level / 2
   akt_ausweichen = akt_ausweichen + spieler(akt_spieler)\fallenlehre * 2
   
   ProcedureReturn akt_ausweichen

EndProcedure

Procedure add_poison(amount.w)
   amount = amount - spieler(akt_spieler)\giftlehre
   amount = (amount * (100 - poison_resistance() ) ) / 100
   If amount > 0
     spieler(akt_spieler)\poison + amount
   EndIf
EndProcedure


Procedure test_for_wall()

   Shared spell_x, spell_y
   
   lauf.w = 1
   okay.w = 0
   while okay = 0 and lauf < 5
      spell_x = neighbour(lauf)\x
      spell_y = neighbour(lauf)\y
      If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+spell_x, spieler(akt_spieler)\character_y+spell_y)\feld = mit_was(spieler(akt_spieler)\level)
         okay = 1
      EndIf
      lauf = lauf + 1
   wend
   Sound(#SOUND_BOW)

EndProcedure


Procedure falle()

Shared schutz_min, aktion, bewegt, spell_x, spell_y

     testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld
     dodge_diff.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat2

     ausweichen = ausweichen()
     ; Schon entdeckte Falle ?
     If testfeld >= #FELD_SPEERFALLE1 + 9 And testfeld <= #FELD_SPEERFALLE1 + 8 + 9
        ausweichen = ausweichen + 30
        ; Fallen entschaerfen ?
        If skills(#CE_FALLENKUNDE,akt_spieler)\gewaehlt = 1
           cleartile(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
           Sound(#SOUND_EVASION)
            message(953,#COLOR_BLAU)
           laby_screen()
        Else
           testfeld = testfeld - 9
           ;setlaby(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y,spieler(akt_spieler)\level, testfeld,0,0)
        EndIf
        aktion = 1
     EndIf

   Select testfeld
       Case #FELD_SPEERFALLE1
          ; Speer animieren
          test_for_wall()
          animate_projectile(9,-1)
          
          ; Ausgewichen?
          If dodge_diff < ausweichen
            message(180,#COLOR_WEISS)
            If get_chance(102) < 5 - spieler(akt_spieler)\fallenlehre
               spieler(akt_spieler)\fallenlehre = spieler(akt_spieler)\fallenlehre + 1
               message(625,#COLOR_BLAU)
            EndIf
          Else
            schutz()
            zw = myRand2(spieler(akt_spieler)\level/2)+1 - schutz_min
            If levelmod(akt_level) = #LM_FIERCE_TRAPS
               zw = zw * 2
            EndIf
            If zw < 1
               zw = 0
            EndIf
            ; Unverwundbar?
            If habich(#SPELL_UNVERWUNDBARKEIT) > 0
               message(431,#COLOR_BLAU)
            ElseIf habich(#SPELL_SCHUTZ_VOR_GESCHOSSEN) > 0
               message(25,#COLOR_BLAU)
            Else
               spielerschaden(zw,1,#ROD_SPEARTRAP)
               message(17,#COLOR_ROT)
            EndIf
          EndIf
          cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
          aktion = 1

       Case #FELD_AXTFALLE1
          ; Axt animieren
          test_for_wall()
          animate_projectile(8,-1)
       
          ; Ausgewichen?
          If dodge_diff < ausweichen
            message(180,#COLOR_WEISS)
            If get_chance(102) < 5 - spieler(akt_spieler)\fallenlehre
               spieler(akt_spieler)\fallenlehre = spieler(akt_spieler)\fallenlehre + 1
               message(625,#COLOR_BLAU)
            EndIf
          Else
            schutz()
            zw = myRand2(spieler(akt_spieler)\level)+ 6 - schutz_min
            If levelmod(akt_level) = #LM_FIERCE_TRAPS
               zw = zw * 2
            EndIf
            If zw < 1
               zw = 0
            EndIf
            ; Unverwundbar?
            If habich(#SPELL_UNVERWUNDBARKEIT) > 0
               message(431,#COLOR_BLAU)
            ElseIf habich(#SPELL_SCHUTZ_VOR_GESCHOSSEN) > 0
               message(25,#COLOR_BLAU)
            Else
               spielerschaden(zw,1,#ROD_AXETRAP)
               message(18,#COLOR_ROT)
            EndIf
          EndIf
          cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
          aktion = 1

       Case #FELD_PFEILFALLE1
          ; Pfeil animieren
          test_for_wall()
          animate_projectile(12,-1)
          
          ; Ausgewichen?
          If dodge_diff < ausweichen
            message(180,#COLOR_WEISS)
            If get_chance(102) < 5 - spieler(akt_spieler)\fallenlehre
               spieler(akt_spieler)\fallenlehre = spieler(akt_spieler)\fallenlehre + 1
               message(625,#COLOR_BLAU)
            EndIf
          Else
            schutz()
            zw = myRand2(3) - schutz_min
            If levelmod(akt_level) = #LM_FIERCE_TRAPS
               zw = zw * 2
            EndIf
            If zw < 1
               zw = 0
            EndIf
            ; Unverwundbar?
            If habich(#SPELL_UNVERWUNDBARKEIT) > 0
               message(431,#COLOR_BLAU)
            ElseIf habich(#SPELL_SCHUTZ_VOR_GESCHOSSEN) > 0
               message(25,#COLOR_BLAU)
            Else
              If zw > 0
                 spielerschaden(zw,1,#ROD_DARTTRAP)
                 message(19,#COLOR_GRUEN)
                 If levelmod(akt_level) = #LM_FIERCE_TRAPS
                   add_poison(20)
                 Else
                   add_poison(10)
                 EndIf
               EndIf
            EndIf
          EndIf
          cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
          aktion = 1
       Case #FELD_RUNENFALLE_FLUCH1
          If bewegt = 1
            If habich(#SPELL_LIED_DER_MAGIE) = 0
               aktion = 1
               Sternchen(156,156,6)
               If get_chance(100) > 85
                  ; Back to old level
                  message(663,#COLOR_WEISS)
                  new_level.w = spieler(akt_spieler)\level - (get_chance(50)+1)
                  counter = 1
                  Repeat
                     x=Random(groesse(new_level)-3)+2
                     y=Random(groesse(new_level)-3)+2
                     counter = counter + 1
                  Until labyrinth(new_level,x,y)\feld = inhalt(new_level) Or counter > 500
                  If counter <= 500
                     spieler(akt_spieler)\level = new_level
                     spieler(akt_spieler)\character_x = x
                     spieler(akt_spieler)\character_y = y
                     laby_screen()
                  EndIf
               Else
                  message(20,#COLOR_GRAU)
                  spieler(akt_spieler)\fluch = myRand2(#ANZ_FLUECHE-1)+1
                  spieler(akt_spieler)\fluchdauer = myRand2(18) + 4
                  cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
                  If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
                     Sound(#SOUND_CHICKEN)
                  Else
                     Sound(#SOUND_DARKNESS)
                  EndIf
                  laby_screen()
               EndIf
            Else
               message(21,#COLOR_BLAU)
            EndIf
          EndIf
       Case #FELD_FALLGRUBE1
          If bewegt = 1
            ; Fliegen ?
            If habich(#SPELL_FLIEGEN) = 0 And habich(#SPELL_FLEDERMAUSGESTALT) = 0 And habich(#SPELL_VOGELGESTALT) = 0
               ; set trap as known, as we have either avoided it or fallen in
               spot_diff.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat1
               setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_FALLGRUBE1+9,-1,dodge_diff)
               ; Ausgewichen?
               If dodge_diff < ausweichen
                  message(180,#COLOR_WEISS)
                  If  spot_diff <> -1 ;spot diff is used here to deny dangerless "training" in trap lore
                    If get_chance(102) < 5 - spieler(akt_spieler)\fallenlehre
                      spieler(akt_spieler)\fallenlehre = spieler(akt_spieler)\fallenlehre + 1
                      message(625,#COLOR_BLAU)
                    EndIf
                  EndIf
               Else
                  If spieler(akt_spieler)\creature_typ > 0
                     spielerschaden(999,4,#ROD_TRAPDOOR)
                  Else
                     zw = myRand2(6)
                     If levelmod(akt_level) = #LM_FIERCE_TRAPS
                        zw = zw * 2
                     EndIf
                     If zw < 1
                        zw = 1
                     EndIf
                     Sound(#SOUND_FALL)
                     ; Unverwundbar?
                     If habich(#SPELL_UNVERWUNDBARKEIT) > 0
                        message(431,#COLOR_BLAU)
                     Else
                        spielerschaden(zw,1,#ROD_TRAPDOOR)
                        message(22,#COLOR_ROT)
                     EndIf
                     If skills(#CE_WEISHEIT,akt_spieler)\gewaehlt = 1
                        spieler(akt_spieler)\weisheit = spieler(akt_spieler)\weisheit + 1
                     EndIf
                     potionlist.s = ""
                     comma.s =""
                     For i = 1 To #MAX_RUCKSACK
                        If item(inventory(i,akt_spieler)\name)\type = 4 And get_chance(100) < 20
                           Sound(#SOUND_GLASS)
                           If inventory(i,akt_spieler)\status
                             potionlist = potionlist + comma + item(inventory(i,akt_spieler)\name)\name[language+1]
                           Else
                             potionlist = potionlist + comma + message_text(586,1+language)
                           EndIf
                           If comma = ""
                             comma = ","
                           EndIf
                           leeren(i)
                        EndIf
                     Next
                     If potionlist <> ""
                       nachricht7(nachricht6(348,potionlist),#COLOR_WEISS)
                     EndIf
                     Delay(delay_animation)
                     bewegt = 0
                     neuer_level()
                     naechster()
                     laby_screen()
                  EndIf ; creature
               EndIf ; Ausgewichen
            EndIf ; Fliegt?
         EndIf
       Case #FELD_RUNENFALLE_GIFT1
          If bewegt = 1
            If habich(#SPELL_LIED_DER_MAGIE) = 0
               aktion = 1
               message(20,#COLOR_GRUEN)
               Sound(#SOUND_DARKNESS)
               Sternchen(156,156,6)
               For i = 1 To 11
                  For j = 1 To 11
                     setx.w = (spieler(akt_spieler)\character_x - 6) + i
                     If setx < 1
                        setx = 1
                     EndIf
                     If setx > groesse(spieler(akt_spieler)\level)
                        setx = groesse(spieler(akt_spieler)\level)
                     EndIf
                     sety.w = (spieler(akt_spieler)\character_y - 6) + j
                     If sety < 1
                        sety = 1
                     EndIf
                     If sety > groesse(spieler(akt_spieler)\level)
                        sety = groesse(spieler(akt_spieler)\level)
                     EndIf
                     tile = labyrinth(spieler(akt_spieler)\level,setx,sety)\feld 
                     If is_floor(tile)
                        setlaby(setx,sety,spieler(akt_spieler)\level,#FELD_GIFTIG,0,tile)
                     EndIf
                  Next
               Next
               setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_GIFTIG,0,inhalt(spieler(akt_spieler)\level))
               laby_screen()
               Else
                  message(21,#COLOR_BLAU)
               EndIf
             EndIf
       Case #FELD_RUNENFALLE_FEUER1
          If bewegt = 1
            If habich(#SPELL_LIED_DER_MAGIE) = 0
               aktion = 1
               message(20,#COLOR_ROT)
               Sound(#SOUND_DARKNESS)
               Sternchen(156,156,6)
               For i = 1 To 11
                  For j = 1 To 11
                     setx.w = (spieler(akt_spieler)\character_x - 6) + i
                     If setx < 1
                        setx = 1
                     EndIf
                     If setx > groesse(spieler(akt_spieler)\level)
                        setx = groesse(spieler(akt_spieler)\level)
                     EndIf
                     sety.w = (spieler(akt_spieler)\character_y - 6) + j
                     If sety < 1
                        sety = 1
                     EndIf
                     If sety > groesse(spieler(akt_spieler)\level)
                        sety = groesse(spieler(akt_spieler)\level)
                     EndIf
                     tile = labyrinth(spieler(akt_spieler)\level,setx,sety)\feld 
                     If is_floor(tile)
                        setlaby(setx,sety,spieler(akt_spieler)\level,#FELD_FEUER2,0,tile)
                     EndIf
                  Next
               Next
               setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_FEUER2,0,inhalt(spieler(akt_spieler)\level))
               laby_screen()
            Else
               message(21,#COLOR_BLAU)
            EndIf
          EndIf
       Case #FELD_RUNENFALLE_EIS1
          If bewegt = 1
            If habich(#SPELL_LIED_DER_MAGIE) = 0
               aktion = 1
               message(20,#COLOR_BLAU)
               Sound(#SOUND_DARKNESS)
               Sternchen(156,156,6)
               For i = 1 To 11
                  For j = 1 To 11
                     setx.w = (spieler(akt_spieler)\character_x - 6) + i
                     If setx < 1
                        setx = 1
                     EndIf
                     If setx > groesse(spieler(akt_spieler)\level)
                        setx = groesse(spieler(akt_spieler)\level)
                     EndIf
                     sety.w = (spieler(akt_spieler)\character_y - 6) + j
                     If sety < 1
                        sety = 1
                     EndIf
                     If sety > groesse(spieler(akt_spieler)\level)
                        sety = groesse(spieler(akt_spieler)\level)
                     EndIf
                     tile = labyrinth(spieler(akt_spieler)\level,setx,sety)\feld 
                     If is_floor(tile)
                        setlaby(setx,sety,spieler(akt_spieler)\level,#FELD_EIS,0,tile)
                     EndIf
                  Next
               Next
               cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
               laby_screen()
            Else
               message(21,#COLOR_BLAU)
            EndIf
          EndIf
       Case #FELD_MANALEERE1
          Sound(#SOUND_DARKNESS)
          message(23,#COLOR_BLAU)
          sternchen(156,156,4)
          spieler(akt_spieler)\Mana = 0
          cleartile(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
          aktion = 1
       EndSelect

EndProcedure
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 34
; FirstLine = 20
; Folding = -
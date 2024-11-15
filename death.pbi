; Spieler stirbt
Procedure tot()

Shared letzter_eintrag, yplus, anfangszeit, joystick_used, myname

init_keyboard_return()

; Herz aus Stein
herz = 0
For i = 1 To #MAX_RUCKSACK
   If inventory(i,akt_spieler)\name = #OBJGRAFIK_HERZ1
      herz = i
   EndIf
Next

If herz = 0
   Sound(#SOUND_DEATH)
   spieler(akt_spieler)\Status = 3   ; dead
   If spieler(akt_spieler)\creature_typ > 0
      naechster()
      init_keyboard_main()
      ProcedureReturn 0 ; nothing more to do if player was actually a creature
   Else
      spieler(akt_spieler+1)\Status = 3   ; kill player creature if any
   Endif

   ; Testen ob neuer Highscore
   punkte.w = punkte()

   eintrag.b = 0
   i = 1
   Repeat
      If punkte > hscores(i,nr_of_players/2)\punkte
         eintrag = i   ; neuer highscore eintrag!
      EndIf
      i = i + 1
   Until i > 30 Or eintrag > 0

   If eintrag > 0    ; neuer highscore
      warten.w = 0
      xx.w = 100
      yy.w = 120
      raus.w = 0
   
      Repeat
         read_joystick()
         read_keyboard()
         read_mouse()
         
         ; #PB_Key_Return
         if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) or jb1 = 1
            used_keys(1)\wait_release = 1
            raus = 1
         endif
         
         warten = warten + 1
         If warten = 1 or warten = 4
            something_changed = 1
         EndIf
         If warten > 4
            warten = 0
         EndIf
         
         if something_changed = 1
            Fenster()
            ClearScreen(RGB(0,0,0))
            laby_rahmen()
            show_logo()
            show_varys(0)
            ClipSprite(#SPRITE_TILESET_END, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_END, 16, 16)
            ClipSprite(#SPRITE_CLEANER, 0, 0, 150, 17)
            DisplaySprite(#SPRITE_CLEANER, xx, yy)

            ; Last words einlesen
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(0,0,0))  ; Schwarz
            DrawText(130,40,message_text(83,1+language))
            DrawText(80, 55,message_text(79,1+language))
            DrawText(80, 70,message_text(80,1+language))
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(xx,yy,myname)
            StopDrawing()
            
            myname = keyboard_string(myname,0)

            If Len(myname) > 25
               myname = Mid(myname,1,25)
            EndIf
                     
            ; Cursor darstellen
            warten = warten + 1
            If warten < 3
               ; anzeigen
               wohin = ScreenOutput()
               StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))  ; Weiss
               Line(xx+TextWidth(myname), yy, 0, 15)
               Line(xx+1+TextWidth(myname), yy, 0, 15)
               StopDrawing()
            EndIf
            If warten > 4
               warten = 0
            EndIf
            end_screen()
         endif
         
         Delay(#Input_delay)
      Until raus = 1
      
         ; Alles nach unten schieben
         j = 30
         While j > eintrag
            hscores(j,nr_of_players/2)\version                = hscores(j-1,nr_of_players/2)  \version
            hscores(j,nr_of_players/2)\name                   = hscores(j-1,nr_of_players/2)  \name
            hscores(j,nr_of_players/2)\level                  = hscores(j-1,nr_of_players/2)  \level
            hscores(j,nr_of_players/2)\gold                   = hscores(j-1,nr_of_players/2)  \gold
            hscores(j,nr_of_players/2)\mks                    = hscores(j-1,nr_of_players/2)  \mks
            hscores(j,nr_of_players/2)\punkte                 = hscores(j-1,nr_of_players/2)  \punkte
            hscores(j,nr_of_players/2)\maennchen              = hscores(j-1,nr_of_players/2)  \maennchen
            hscores(j,nr_of_players/2)\anfangszeit            = hscores(j-1,nr_of_players/2)  \anfangszeit
            hscores(j,nr_of_players/2)\endezeit               = hscores(j-1,nr_of_players/2)  \endezeit
            hscores(j,nr_of_players/2)\MaxLifepoints          = hscores(j-1,nr_of_players/2)  \MaxLifepoints
            hscores(j,nr_of_players/2)\MaxMana                = hscores(j-1,nr_of_players/2)  \MaxMana
            hscores(j,nr_of_players/2)\Attack                 = hscores(j-1,nr_of_players/2)  \Attack
            hscores(j,nr_of_players/2)\Dexterity              = hscores(j-1,nr_of_players/2)  \Dexterity
            hscores(j,nr_of_players/2)\Strength               = hscores(j-1,nr_of_players/2)  \Strength
            hscores(j,nr_of_players/2)\MaxSpeed               = hscores(j-1,nr_of_players/2)  \MaxSpeed
            hscores(j,nr_of_players/2)\Perception             = hscores(j-1,nr_of_players/2)  \Perception
            hscores(j,nr_of_players/2)\Luck_score             = hscores(j-1,nr_of_players/2)  \Luck_score
            hscores(j,nr_of_players/2)\Power_score            = hscores(j-1,nr_of_players/2)  \Power_score
            hscores(j,nr_of_players/2)\Circle                 = hscores(j-1,nr_of_players/2)  \Circle
            hscores(j,nr_of_players/2)\stabteile              = hscores(j-1,nr_of_players/2)  \stabteile
            hscores(j,nr_of_players/2)\moves                  = hscores(j-1,nr_of_players/2)  \moves
            hscores(j,nr_of_players/2)\cause_of_death   	   = hscores(j-1,nr_of_players/2)  \cause_of_death
            hscores(j,nr_of_players/2)\cause_of_death_monster = hscores(j-1,nr_of_players/2)  \cause_of_death_monster
            For k = 1 To 30
               hscores(j,nr_of_players/2)\skills[k]           = hscores(j-1,nr_of_players/2)  \skills[k]
            Next
            j = j - 1
         Wend
         
         ; Neuen Highscore eintragen
         letzter_eintrag = eintrag
         If eintrag > 0
            endezeit.s = FormatDate("%yyyy%mm%dd%hh%ii%ss",Date())
            hscores(eintrag,nr_of_players/2)\version       = #PROGRAMMVERSION
            hscores(eintrag,nr_of_players/2)\name          = spieler(akt_spieler)\Name
            hscores(eintrag,nr_of_players/2)\level         = spieler(akt_spieler)\maxlevel
            hscores(eintrag,nr_of_players/2)\gold          = gold_anzahl()
            hscores(eintrag,nr_of_players/2)\mks           = spieler(akt_spieler)\mks
            hscores(eintrag,nr_of_players/2)\punkte        = punkte
            hscores(eintrag,nr_of_players/2)\maennchen     = spieler(akt_spieler)\maennchen
            hscores(eintrag,nr_of_players/2)\anfangszeit   = anfangszeit
            hscores(eintrag,nr_of_players/2)\endezeit      = endezeit
            hscores(eintrag,nr_of_players/2)\MaxLifepoints = spieler(akt_spieler)\MaxLifepoints
            hscores(eintrag,nr_of_players/2)\MaxMana       = spieler(akt_spieler)\MaxMana
            hscores(eintrag,nr_of_players/2)\Attack        = spieler(akt_spieler)\Attack
            hscores(eintrag,nr_of_players/2)\Dexterity     = spieler(akt_spieler)\Dexterity
            hscores(eintrag,nr_of_players/2)\Strength      = spieler(akt_spieler)\Strength
            hscores(eintrag,nr_of_players/2)\MaxSpeed      = spieler(akt_spieler)\MaxSpeed
            hscores(eintrag,nr_of_players/2)\Perception    = spieler(akt_spieler)\Perception
            hscores(eintrag,nr_of_players/2)\Luck_score    = spieler(akt_spieler)\Luck_score
            hscores(eintrag,nr_of_players/2)\Power_score   = spieler(akt_spieler)\Power_score
            hscores(eintrag,nr_of_players/2)\Circle        = spieler(akt_spieler)\Circle
            hscores(eintrag,nr_of_players/2)\stabteile     = anz_staffpieces()
            hscores(eintrag,nr_of_players/2)\moves         = spieler(akt_spieler)\moves
            hscores(eintrag,nr_of_players/2)\cause_of_death = spieler(akt_spieler)\cause_of_death
            hscores(eintrag,nr_of_players/2)\cause_of_death_monster = spieler(akt_spieler)\cause_of_death_monster
            
            Global Dim high_skill.w(30)
            
            For i = 1 To 30
               high_skill(i) = 0
            Next
            
            zaehler = 1
            For i = 2 To #ANZ_SKILLS
               If skills(i,akt_spieler)\gewaehlt = 1
                  high_skill(zaehler) = skills(i,akt_spieler)\nummer
                  zaehler = zaehler + 1 
               EndIf
            Next
            
            For k = 1 To 30
               hscores(eintrag,nr_of_players)\skills[k] = high_skill(k)
            Next
            new_highscore(myname)
            show_highscore()
         EndIf
      
      Else
         Repeat
            read_keyboard()
            read_joystick()
            read_mouse()
         
            ; #PB_Key_Return
            if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) or jb1 = 1
               used_keys(1)\wait_release = 1
               raus = 1
            endif
            
            If mmouse_links And mmouse_links_wait_release = 0
               mmouse_links_wait_release = 1
               raus = 1
            endif
         
            if something_changed = 1
               Fenster()
               ClearScreen(RGB(0,0,0))
               laby_rahmen()
               show_logo()
               show_varys(0)
               ClipSprite(#SPRITE_TILESET_END, 1, 1, 335, 335)
               DisplayTransparentSprite(#SPRITE_TILESET_END, 16, 16)

               wohin = ScreenOutput()
               StartDrawing(wohin)
                  DrawingMode(1)
                  FrontColor(RGB(255,255,255))  ; Weiss
                  DrawText(130,25, nachricht4(83))
               StopDrawing()

               end_screen()
            endif ; something_changed
            Delay(#Input_delay)
         Until raus = 1
      EndIf
      
      ; Noch anderer aktiver Spieler? -> Naechster
      aktiv = 0
      For i = 1 To nr_of_players
         If spieler(i)\Status = 1
            aktiv = 1
         EndIf
      Next
      If aktiv = 1
         naechster()
      Else
         ; Alle tot -> Neues spiel
         tot = 1
         For i = 1 To nr_of_players
            If spieler(i)\Status < 3
               tot = 0
            EndIf
         Next
         If tot = 1
            Goto again
         EndIf
      EndIf
         
   ; Steinernes Herz!
   Else
      leeren(herz)

      Repeat
         read_keyboard()
         read_joystick()
         read_mouse()
         
         ; #PB_Key_Return
         if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) or jb1 = 1
            used_keys(1)\wait_release = 1
            raus = 1
         endif
         
         If mmouse_rechts And mmouse_rechts_wait_release = 0
            mmouse_rechts_wait_release = 1
            raus = 1
         endif
         
         if something_changed = 1
            Fenster()
            ClearScreen(RGB(0,0,0))
            laby_rahmen()
            show_logo()
            show_varys(0)
            show_buttons()

            ClipSprite(#SPRITE_TILESET_FSI3, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI3, 16, 16)

            x = 160
            y = 35
            wohin = ScreenOutput()
            StartDrawing(wohin)
               FrontColor(RGB(255,1,1))  ; Schwarz
               DrawingMode(1)
               DrawText(x,y, nachricht4(176))
               y = y + yplus + 5
               DrawText(x,y, nachricht4(177))
            StopDrawing()

            end_screen()
         endif
         Delay(#Input_delay)
      Until raus = 1
      
      spieler(akt_spieler)\Lifepoints = maxlife()
      naechster()
   EndIf
   init_keyboard_main()
   something_changed = 1
      
EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 3
; FirstLine = 228
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
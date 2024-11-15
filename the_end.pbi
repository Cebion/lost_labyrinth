; Spieler gewinnt
Procedure ende()

Shared punkte, level, letzter_eintrag, yplus, anfangszeit, joystick_used

      
   lastwords.s = ""
   spieler(akt_spieler)\Status = 3   ; tot
   spieler(akt_spieler)\cause_of_death = #ROD_SURVIVED
      
   init_keyboard_return()

   ; Testen ob neuer Highscore
   x1 = spieler(akt_spieler)\MaxLevel * 10
   x2 = gold_anzahl() / 10
   x3 = spieler(akt_spieler)\mks / 5
   If x2 > x1
      x2 = x1
   EndIf
   If x3 > x1
      x3 = x1
   EndIf
   punkte = x1 + x2 + x3
   
   punkte = punkte + 1000  ; Alle Stabteile oder alle Levels gemeistert!

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
      yy.w = 115
      
      Repeat
         read_keyboard()
         read_joystick()
         read_mouse()
         
         ; #PB_KEY_Return
         raus = 0
         if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) or jay > 0
            used_keys(1)\wait_release = 1
            raus = 1
         endif
         
         lastwords_old.s =  lastwords  
         lastwords = keyboard_string(lastwords,0)
         if lastwords <> lastwords_old
            something_changed = 1
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
            ClipSprite(#SPRITE_TILESET_FSI23, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI23, 16, 16)

            ; Name einlesen
            ClipSprite(#SPRITE_CLEANER, 0, 0, 150, 17)
            DisplaySprite(#SPRITE_CLEANER, xx, yy)
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))  ; Weiss
               tmptxt.s = spieler(akt_spieler)\Name + message_text(240,1+language)
               DrawText(11*16-(TextWidth(tmptxt)/2),25,tmptxt)
               DrawText(40, 40,message_text(241,1+language))
               DrawText(40, 55,message_text(242,1+language))
               DrawText(40, 70,message_text(243,1+language))
               DrawText(40, 85,message_text(244,1+language))
               DrawText(40, 100,message_text(80,1+language))
               DrawText(xx,yy,lastwords)
            StopDrawing()
            
            lastwords = keyboard_string(lastwords,0)

            If Len(lastwords) > 25
               lastwords = Mid(lastwords,1,25)
            EndIf
                     
            ; Cursor darstellen
            warten = warten + 1
            If warten < 3
               ; anzeigen
               wohin = ScreenOutput()
               StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))  ; Weiss
               Line(xx+TextWidth(lastwords), yy, 0, 15)
               Line(xx+1+TextWidth(lastwords), yy, 0, 15)
               StopDrawing()
            EndIf
            If warten > 4
               warten = 0
            EndIf
            
            end_screen()
         endif ; something_changed
         delay(#Input_delay)
      Until raus = 1 And lastwords <> ""
         
      ; alles nach unten schieben
      j = 30
      While j > eintrag
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
         hscores(j,nr_of_players/2)\cause_of_death         = hscores(j-1,nr_of_players/2)  \cause_of_death
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
         hscores(eintrag,nr_of_players)\name           = spieler(akt_spieler)\Name
         hscores(eintrag,nr_of_players)\level          = level
         hscores(eintrag,nr_of_players)\gold           = gold_anzahl()
         hscores(eintrag,nr_of_players)\mks            = spieler(akt_spieler)\mks
         hscores(eintrag,nr_of_players)\punkte         = punkte
         hscores(eintrag,nr_of_players)\maennchen      = spieler(akt_spieler)\maennchen
         hscores(eintrag,nr_of_players)\anfangszeit    = anfangszeit
         hscores(eintrag,nr_of_players)\endezeit       = endezeit
         hscores(eintrag,nr_of_players)\MaxLifepoints  = spieler(akt_spieler)\MaxLifepoints
         hscores(eintrag,nr_of_players)\MaxMana        = spieler(akt_spieler)\MaxMana
         hscores(eintrag,nr_of_players)\Attack         = spieler(akt_spieler)\Attack
         hscores(eintrag,nr_of_players)\Dexterity      = spieler(akt_spieler)\Dexterity
         hscores(eintrag,nr_of_players)\Strength       = spieler(akt_spieler)\Strength
         hscores(eintrag,nr_of_players)\MaxSpeed       = spieler(akt_spieler)\MaxSpeed
         hscores(eintrag,nr_of_players)\Perception     = spieler(akt_spieler)\Perception
         hscores(eintrag,nr_of_players)\Luck_score     = spieler(akt_spieler)\Luck_score
         hscores(eintrag,nr_of_players)\Power_score    = spieler(akt_spieler)\Power_score
         hscores(eintrag,nr_of_players)\Circle         = spieler(akt_spieler)\Circle
         hscores(eintrag,nr_of_players)\stabteile      = anz_staffpieces()
         hscores(eintrag,nr_of_players)\cause_of_death = #ROD_SURVIVED
         
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
            If high_skill(k) > 0
               hscores(eintrag,nr_of_players)\skills[k] = high_skill(k)
            EndIf
         Next
         new_highscore(lastwords)
         show_highscore()
      EndIf
   
   Else ; no entry
      Repeat
         
         ; #PB_KEY_Return
         raus = 0
         if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) or jay > 0
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
            DrawText(130,25,nachricht4(83))
            StopDrawing()

            end_screen()
         endif ; something_changed
         delay(#Input_delay)
      Until raus = 1
   EndIf ; eintrag
   
   ; Noch anderer aktiver spieler? -> Naechster
   aktiv = 0
   For i = 1 To nr_of_players
      If spieler(i)\Status = 1
         aktiv = 1
      EndIf
   Next
   If aktiv = 1
      naechster()
   Else
      ; alle tot -> neues spiel
      tot = 1
      For i = 1 To nr_of_players
         If spieler(i)\Status < 3
            tot = 0
         EndIf
      Next
      If tot = 1
         Goto again
      Else
         ; Nur noch inaktive -> neuer_level
         inaktiv = 1
         For i = 1 To nr_of_players
            If spieler(i)\Status = 1 Or spieler(i)\Status = 3
               inaktiv = 0
            EndIf
         Next
         If inaktiv = 1
            neuer_level()
         EndIf
      EndIf
   EndIf
      
EndProcedure
; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 92
; FirstLine = 83
; Folding = -
; Executable = laby.exe
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; DisableDebugger

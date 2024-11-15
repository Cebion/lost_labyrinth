         If habich(#SPELL_UNVERWUNDBARKEIT) > 0
            message(431,#COLOR_BLAU)
         Else
            
            If has_trait2(mon_no,#ME_SPINNE) And spinnenkoenigin(spieler(akt_spieler)\Level) = 1
               schaden = schaden + 2
            EndIf
            If has_trait2(mon_no,#ME_GOBLIN) And goblinkoenig(spieler(akt_spieler)\Level) = 1
               schaden = schaden + 2
            EndIf
            If has_trait2(mon_no,#ME_UNTOTER) And untotenherr(spieler(akt_spieler)\Level) = 1
               schaden = schaden + 2
            EndIf
         
            If spieler(akt_spieler)\fluch = #FLUCH_DES_ACHILLES
               schaden = schaden * 2
            EndIf
            
            schutz.w = 0
            If spieler(akt_spieler)\fluch <> #FLUCH_DES_HEPHAISTOS
               schutz()
               schutz = myRand(schutz_max-schutz_min)+schutz_min
               schaden = schaden - schutz 
            EndIf
            ; Haerte ?
            If skills(#CE_HAERTE,akt_spieler)\gewaehlt = 1
               schaden = schaden - 1
            EndIf
            ; Lied des Schutzes ?
            If habich(#SPELL_LIED_DES_SCHUTZES) > 1
               schaden = schaden - 3
            EndIf
            If schaden < 1
               schaden = 0
            EndIf
            
            ; Manchmal trotzdem einen Punkt Schaden machen
            If schaden = 0 And get_chance(50)
               schaden = 1
            EndIf
      
            ; Schutzschild ?
            habich = 0
            For i = 1 To #ACTIVE_SLOTS
               If aktive(i,akt_spieler)\nr = #SPELL_SCHUTZSCHILD
                  habich = i
               EndIf
            Next
            If habich > 0
               schaden_save = schaden
               schaden = schaden - aktive(habich,akt_spieler)\staerke
               If schaden < 0
                  schaden = 0
               EndIf
               spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints - schaden
               aktive(habich,akt_spieler)\staerke = aktive(habich,akt_spieler)\staerke - schaden_save
              
               If aktive(habich,akt_spieler)\staerke < 1
                  aktive(habich,akt_spieler)\staerke = 0
                  aktive(habich,akt_spieler)\dauer = 0
                  aktive(habich,akt_spieler)\nr = 0
               EndIf
            EndIf
      
            
            ; Schaden darstellen
            ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 7*32, 32, 32)  ; Roter Fleck
            DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160, 160)
            
            ; Sound
            If labyrinth(spieler(akt_spieler)\Level,x_r,y_r)\feld >= #FELD_HYDRA1 And labyrinth(spieler(akt_spieler)\Level,x_r,y_r)\feld <= #FELD_HYDRA12
               Sound(#SOUND_ROAR)
            Else
               If monster(mon_no)\sound = 0
                  Sound(Random(12))
               Else
                  Sound(monster(mon_no)\sound)
               EndIf
            EndIf
            
            
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               
              ; verschieben bei groesseren Zahlen
              If schaden < 10: xx =172: yy = 168: EndIf
              If schaden >= 10: xx=166: yy = 168: EndIf
              If schaden >= 100: xx =163:yy= 168: EndIf
               
               FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(xx,yy,Str(schaden))
            StopDrawing()
            FlipBuffers()
            Delay(delay_animation)
            
      
            spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints - schaden
         EndIf ; unverwundbar
; IDE Options = PureBasic v4.02 (Windows - x86)
; CursorPosition = 98
; FirstLine = 61
; Folding = ----
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

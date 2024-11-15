Procedure zwischenbild()

Shared schongemalt, zw_bild, aktion

   If zw_bild <> 0
         schongemalt = 1
         ClipSprite(#SPRITE_CLEANER, 0, 0, 150, 50)
         DisplaySprite(#SPRITE_CLEANER, 400, 110)
         laby_rahmen()
         show_logo()   
         
         Select zw_bild
            Case 1
               ; Help
               hilfe()
            Case 2
               ; Inventory
               inv()
               ; stop "i" key from repeating
               used_keys(10)\wait_release  = 1
               laby_screen()
               If aktion = 1
                  Goto nach_zauber
               EndIf
            Case 3
               ; Spellmenu
               cast_spell()
               laby_screen()
               If aktion = 1
                  Goto nach_zauber
               EndIf
            Case 4
               ; Climb for player / kill(suicide) for creatures
               If spieler(akt_spieler)\creature_typ = 0
                  If (skills(#CE_KLETTERN,akt_spieler)\gewaehlt = 1 And labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\feld = #FELD_SCHACHT) Or spieler(akt_spieler)\name = "Mogli_111"
                     message(5,#COLOR_BLAU)
                     If spieler(akt_spieler)\level+1 > spieler(akt_spieler)\maxlevel
                        aufsteigen()
                     EndIf
                     neuer_level()
                     naechster()
                  EndIf
               Else
                  spielerschaden(99, 4, #ROD_DRAIN_LIFE)
               EndIf
            Case 5
               ; Options
               optionen()
               laby_screen()
            Case 6
               character_info()
               laby_screen()
            Case 7
               monsterlore()
               laby_screen()
            Case 8
               If spieler(akt_spieler)\schleichen = 0 And skills(#CE_NO_SNEAK,akt_spieler)\gewaehlt = 0
                  spieler(akt_spieler)\schleichen = 1
                  If spieler(akt_spieler)\Speed > maxspeed()
                     spieler(akt_spieler)\Speed = maxspeed()
                  EndIf
               Else
                  spieler(akt_spieler)\schleichen = 0
               EndIf
               laby_screen()
               FlipBuffers()
               Delay(delay_animation)
            Case 9
               bogen()
               laby_screen()
               If aktion = 1
                  Goto nach_zauber
               EndIf
            Case 10
               stealing()
               laby_screen()
               If aktion = 1
                  Goto nach_zauber
               EndIf
            Case 11
               If skills(#CE_MYSTISCHE_ATTACKE,akt_spieler)\gewaehlt = 1
                  mystisch()
                  laby_screen()
                  If aktion = 1
                     Goto nach_zauber
                  EndIf
               EndIf
            Case 12
               ; Automap
                If radius() < 2
                  message(946,#COLOR_WEISS)
                Else
                  show_automap()
               EndIf
            Case 13
               ; Old messages
               show_old_messages()
         EndSelect
         
         zw_bild = 0
         
         init_keyboard_main()
      EndIf   ; if zwischenbild

EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 74
; FirstLine = 51
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
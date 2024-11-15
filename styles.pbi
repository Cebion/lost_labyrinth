   wohin = ScreenOutput()
   StartDrawing(wohin)
   DrawingMode(1)

   FrontColor(RGB(255,255,22))
   xxx.w = 375
   yyy.w = 390
   DrawText(xxx,yyy-20,skills(#CE_KAMPFTECHNIKEN,akt_spieler)\name[language+1])
   DrawText(xxx+40,yyy+8,message_text(709+spieler(akt_spieler)\style,language+1))
   
   StopDrawing()
   
   style_diff.w = 0
   ;wait release
   If (KeyboardPushed(#PB_Key_F) Or mmouse_links) = 0
     wait_release4.w = 1
   EndIf
   ;key control
   If KeyboardPushed(#PB_Key_F)  And wait_release4 = 1
     wait_release4.w = 0
     style_diff = 1
   EndIf
   
   ; Links Button
   If mmouse_x > xxx And mmouse_x < xxx+32 And mmouse_y > yyy And mmouse_y < yyy+32
      ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 0, 31, 31)
      If mmouse_links = 1 And wait_release4 = 1
        wait_release4 = 0
        style_diff = -1
      EndIf 
   Else
     ClipSprite(#SPRITE_TILESET_BUTTONS5, 1*32, 0, 31, 31)
   EndIf 
   DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, xxx, yyy)

   ; Abstand
   xxx = xxx + 200
   
   ; Rechts Button
   If mmouse_x > xxx And mmouse_x < xxx+32 And mmouse_y > yyy And mmouse_y < yyy+32
      ClipSprite(#SPRITE_TILESET_BUTTONS5, 63, 0, 31, 31)
      If mmouse_links = 1 And wait_release4 = 1
        wait_release4 = 0
        style_diff = 1
      EndIf
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS5, 0*32, 0, 31, 31)
   EndIf
   DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, xxx, yyy)
      
   spieler(akt_spieler)\style = spieler(akt_spieler)\style + style_diff
   
   If style_diff < 0
     If spieler(akt_spieler)\style < 0
       spieler(akt_spieler)\style = 9
     EndIf
     If spieler(akt_spieler)\style = 9 And ich_trage(#KLASSE_POLEAXE) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style - 1
     EndIf
     If spieler(akt_spieler)\style = 8 And ich_trage(#KLASSE_DOLCH) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style - 1
     EndIf
     If spieler(akt_spieler)\style = 7 And ich_trage(#KLASSE_DEGEN) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style - 1
     EndIf
     If spieler(akt_spieler)\style = 6 And ich_trage(#KLASSE_STAB) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style - 1
     EndIf
     If spieler(akt_spieler)\style = 5 And ich_trage(#KLASSE_SCHWERT) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style - 1
     EndIf
     If spieler(akt_spieler)\style = 4 And ich_trage(#KLASSE_SPEER) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style - 1
     EndIf
     If spieler(akt_spieler)\style = 3 And ich_trage(#KLASSE_HAMMER) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style - 1
     EndIf
   ElseIf style_diff > 0
     If spieler(akt_spieler)\style > 9
       spieler(akt_spieler)\style = 9
     EndIf
     If spieler(akt_spieler)\style = 3 And ich_trage(#KLASSE_HAMMER) = 0
       spieler(akt_spieler)\style = spieler(akt_spieler)\style + 1 
     EndIf 
     If spieler(akt_spieler)\style = 4 And ich_trage(#KLASSE_SPEER) = 0 
       spieler(akt_spieler)\style = spieler(akt_spieler)\style + 1 
     EndIf 
     If spieler(akt_spieler)\style = 5 And ich_trage(#KLASSE_SCHWERT) = 0 
       spieler(akt_spieler)\style = spieler(akt_spieler)\style + 1 
     EndIf 
     If spieler(akt_spieler)\style = 6 And ich_trage(#KLASSE_STAB) = 0 
       spieler(akt_spieler)\style = spieler(akt_spieler)\style + 1 
     EndIf 
     If spieler(akt_spieler)\style = 7 And ich_trage(#KLASSE_DEGEN) = 0 
       spieler(akt_spieler)\style = spieler(akt_spieler)\style + 1 
     EndIf 
     If spieler(akt_spieler)\style = 8 And ich_trage(#KLASSE_DOLCH) = 0 
       spieler(akt_spieler)\style = spieler(akt_spieler)\style + 1 
     EndIf 
     If spieler(akt_spieler)\style = 9 And ich_trage(#KLASSE_POLEAXE) = 0 
       spieler(akt_spieler)\style = spieler(akt_spieler)\style + 1 
     EndIf 
     If spieler(akt_spieler)\style > 9 
       spieler(akt_spieler)\style = 0 
     EndIf
   EndIf
   
   
   
   
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 92
; FirstLine = 35
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
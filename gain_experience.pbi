Procedure draw_advancements()

Shared yplus, yplus2, anzz, mauszauber2

   wohin = ScreenOutput()
   StartDrawing(wohin)
   DrawingMode(1)
      FrontColor(RGB(255,255,255))  ; Weiss
      x = 90
      y = 101
      DrawText(x, y,message_text(50,1+language))
      y = y + yplus
      DrawText(x, y,message_text(51,1+language))

      y = y + yplus + yplus

      mauszauber = 0
      mauszauber2 = 0
      aktuell = 1
      yy = y
      If mmouse_x > 25 And mmouse_x < 350
         For i = 1 To anzz
            If mmouse_y >= yy And mmouse_y <= yy + yplus
               mauszauber = aktuell
               If mmouse_links And mauszauber > 0 And mmouse_links_wait_release = 0
                  mmouse_links_wait_release = 1
                  mauszauber2 = aktuell
               EndIf
            EndIf
            yy = yy + yplus
            aktuell = aktuell + 1
         Next
      EndIf

      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 1
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(52,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\Attack))
      DrawText(x + 165, y,"+1")

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 2
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(53,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\Dexterity))
      DrawText(x + 165, y,"+1")

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 3
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(54,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\Strength))
      DrawText(x + 165, y,"+1")

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 4
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(55,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\MaxLifepoints))
      DrawText(x + 165, y,"+" + Str(spieler(akt_spieler)\LifeGain))

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 5
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(56,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\MaxSpeed))
      DrawText(x + 165, y,"+1")

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 6
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(57,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\Perception))
      DrawText(x + 165, y,"+1")

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 7
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(58,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\Luck_score))
      DrawText(x + 165, y,"+1")

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 8
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(59,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\MaxMana))
      DrawText(x + 165, y,"+" + Str(spieler(akt_spieler)\ManaGain))

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 9
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(60,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\Power_score))
      DrawText(x + 165, y,"+1")

      y = y + yplus
      FrontColor(RGB(255,255,255))  ; Weiss
      If mauszauber = 10
         FrontColor(RGB(1,1,255))  ; Blau
      EndIf
      DrawText(x, y,message_text(61,1+language))
      DrawText(x + 135, y,Str(spieler(akt_spieler)\Circle))
      DrawText(x + 165, y,"+1")

   StopDrawing()
     
EndProcedure

; ---------------------------------------------------------------

; Aufsteigen
; does not consider dumb, udjat eye or wisdom
Procedure aufsteigen2()

Shared yplus, yplus2, mauszauber, mauszauber2, joystick_used

   something_changed = 1

   If spieler(akt_spieler)\fluch <> #FLUCH_NAMENLOS And spieler(akt_spieler)\dumm < 1
      pos.w = 1
      freie.w = 0
      
      init_keyboard_experience()
      
      Repeat
         read_keyboard()
         read_joystick()
         read_mouse()
         
         ; #PB_KEY_DOWN
         if used_keys(1)\pressed And used_keys(1)\wait_release = 0
            used_keys(1)\wait_release = 1
            If pos < 10
               pos = pos + 1
            EndIf
         EndIf
         
         ; #PB_KEY_UP
         if used_keys(2)\pressed And used_keys(2)\wait_release = 0
            used_keys(2)\wait_release = 1
            If pos > 1
               pos = pos - 1
            EndIf
         EndIf
         
         ; #PB_KEY_Return
         if used_keys(3)\pressed And used_keys(3)\wait_release = 0
            used_keys(3)\wait_release = 1
            raus = 1
         endif
         
         ; #PB_KEY_Space
         if used_keys(4)\pressed And used_keys(4)\wait_release = 0
            used_keys(4)\wait_release = 1
            raus = 1
         endif
         
         If mmouse_rechts And mmouse_rechts_wait_release = 0
            mmouse_rechts_wait_release = 1
            raus = 1
         endif
         
         if something_changed = 1
            Fenster()
            laby_screen2()
               
            ClipSprite(#SPRITE_CLEANER, 1, 1, 220, 190)
            DisplaySprite(#SPRITE_CLEANER, 74, 93)
               
            ClipSprite(#SPRITE_TILESET_FSI2, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI2, 16, 16)
               
            wohin = ScreenOutput()
            StartDrawing(wohin)
               FrontColor(RGB(150,150,150))
               Box(89,129 + yplus2 + (pos * yplus - yplus),189,yplus)
            StopDrawing()

            draw_advancements()
            
            end_screen()
         endif ; something_changed
         Delay(#Input_delay)
      until raus = 1 Or mauszauber2 > 0
      
      If mauszauber2 > 0
         pos = mauszauber2
      EndIf
      Select pos
         Case 1
            spieler(akt_spieler)\Attack = spieler(akt_spieler)\Attack + 1
         Case 2
            spieler(akt_spieler)\Dexterity = spieler(akt_spieler)\Dexterity + 1
         Case 3
            spieler(akt_spieler)\Strength = spieler(akt_spieler)\Strength + 1
         Case 4
            spieler(akt_spieler)\MaxLifepoints = spieler(akt_spieler)\MaxLifepoints + spieler(akt_spieler)\LifeGain
            spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + spieler(akt_spieler)\LifeGain
         Case 5
            spieler(akt_spieler)\MaxSpeed = spieler(akt_spieler)\MaxSpeed + 1
         Case 6
            spieler(akt_spieler)\Perception = spieler(akt_spieler)\Perception + 1
         Case 7
            spieler(akt_spieler)\Luck_score = spieler(akt_spieler)\Luck_score + 1
         Case 8
            spieler(akt_spieler)\MaxMana = spieler(akt_spieler)\MaxMana + spieler(akt_spieler)\ManaGain
            spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana + spieler(akt_spieler)\ManaGain
         Case 9
            spieler(akt_spieler)\Power_score = spieler(akt_spieler)\Power_score + 1
         Case 10
            spieler(akt_spieler)\Circle = spieler(akt_spieler)\Circle + 1
            ; Freie Magie ?
            Delay(delay_animation)
            If skills(#CE_FREIE_MAGIE,akt_spieler)\gewaehlt = 1
               freie_magie()
               init_keyboard_experience()
               freie = 1
            EndIf
         Default
            spieler(akt_spieler)\Attack = spieler(akt_spieler)\Attack + 1
      EndSelect

      If freie = 0
         ClipSprite(#SPRITE_CLEANER, 1, 1, 191, 155)
         DisplaySprite(#SPRITE_CLEANER, 88, 102)
            
         draw_advancements()
         FlipBuffers()
         Delay(delay_animation*2)
      EndIf

   Else   ; Fluch namenslos
      If spieler(akt_spieler)\fluch = #FLUCH_NAMENLOS
         namenlos()
         init_keyboard_experience()
      EndIf
      If spieler(akt_spieler)\dumm > 0
         spieler(akt_spieler)\dumm = spieler(akt_spieler)\dumm - 1
         sonderlevel_text(#SL_DUMM)
         init_keyboard_experience()
      EndIf
   EndIf

EndProcedure

; ---------------------------------------------------------------

Procedure aufsteigen()

Shared yplus, yplus2, mauszauber, mauszauber2


   If spieler(akt_spieler)\Status = 1
      spieler(akt_spieler)\Speed = 0
und_nochmal:
      aufsteigen2()
      
      ; Udjat Auge ?
      udjat.b = 0
      udj_pos.w = 0
      For i = 1 To #MAX_RUCKSACK
         If inventory(i,akt_spieler)\name = #OBJGRAFIK_UDJAT And inventory(i,akt_spieler)\status > 0
            udjat = 1
            udj_pos = i
         EndIf
      Next
      If udjat = 1
         If spieler(akt_spieler)\udjat_ben = 1
            spieler(akt_spieler)\udjat_ben = 0
            ; Udjat Screen!
             inventory(udj_pos,akt_spieler)\status - 1
             nachricht7(nachricht4(62)+nachricht4(63),#COLOR_GRUEN)
             message(64,#COLOR_GRUEN)
             
             Goto und_nochmal
         EndIf
      EndIf

      ; Weisheit ?
      If skills(#CE_WEISHEIT,akt_spieler)\gewaehlt = 1
         spieler(akt_spieler)\weisheit = spieler(akt_spieler)\weisheit + 1
         If spieler(akt_spieler)\weisheit > 3
            spieler(akt_spieler)\weisheit = 0
         
            nachricht7(nachricht4(65)+nachricht4(63),#COLOR_GRUEN)
            message(64,#COLOR_GRUEN)
            
            Goto und_nochmal
         EndIf
      EndIf

   EndIf

   Delay(delay_animation)

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 309
; FirstLine = 272
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
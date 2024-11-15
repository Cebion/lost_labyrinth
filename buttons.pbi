; Buttons

Procedure read_buttons()

Shared zw_bild, aktion, over_rulesbutton, over_lookbutton, over_sneakbutton, over_climbbutton, over_theftbutton, over_inventorybutton
Shared over_attributesbutton, over_bowbutton, over_spellbutton, over_optionsbutton, over_skipbutton, over_automapbutton
Shared over_oldmessagesbutton

   x = 378
   y = 373
   
   ; Rules Button
   ; #PB_KEY_H
   if used_keys(5)\pressed And used_keys(5)\wait_release = 0
      used_keys(5)\wait_release = 1
      zw_bild = 1
   EndIf
   
   ; Look Button
   ; #PB_KEY_L
   if used_keys(6)\pressed And used_keys(6)\wait_release = 0
      used_keys(6)\wait_release = 1
      zw_bild = 7
   EndIf
   
   ; Sneak Button
   ; #PB_KEY_S
   if used_keys(7)\pressed And used_keys(7)\wait_release = 0
      used_keys(7)\wait_release = 1
      zw_bild = 8
   EndIf
   
   ; Climb Button
   ; #PB_KEY_K
   if used_keys(8)\pressed And used_keys(8)\wait_release = 0
      used_keys(8)\wait_release = 1
      zw_bild = 4
   EndIf
   
   ; Theft Button
   ; #PB_KEY_G
   if used_keys(9)\pressed And used_keys(9)\wait_release = 0
      used_keys(9)\wait_release = 1
      If skills(#CE_DIEBSTAHL,akt_spieler)\gewaehlt = 1
         zw_bild = 10
      EndIf
   EndIf
   
   ; Inventory Button
   ; #PB_KEY_I
   if used_keys(10)\pressed And used_keys(10)\wait_release = 0
      used_keys(10)\wait_release = 1
      zw_bild = 2
   EndIf
   ; #PB_KEY_R
   if used_keys(11)\pressed And used_keys(11)\wait_release = 0
      used_keys(11)\wait_release = 1
      zw_bild = 2
   EndIf
   ; #PB_KEY_B
   if used_keys(12)\pressed And used_keys(12)\wait_release = 0
      used_keys(12)\wait_release = 1
      zw_bild = 2
   EndIf
   
   ; Attributes Button
   ; #PB_KEY_D
   if used_keys(13)\pressed And used_keys(13)\wait_release = 0
      used_keys(13)\wait_release = 1
      zw_bild = 6
   EndIf
   
   ; Bow Button
   ; #PB_KEY_F
   if used_keys(14)\pressed And used_keys(14)\wait_release = 0
      used_keys(14)\wait_release = 1
      zw_bild = 9
   EndIf
   
   ; Spell Button
   ; #PB_KEY_Z
   if used_keys(15)\pressed And used_keys(15)\wait_release = 0
      used_keys(15)\wait_release = 1
      zw_bild = 3
   EndIf
   ; #PB_KEY_Y
   if used_keys(16)\pressed And used_keys(16)\wait_release = 0
      used_keys(16)\wait_release = 1
      zw_bild = 3
   EndIf
   ; #PB_KEY_C
   if used_keys(17)\pressed And used_keys(17)\wait_release = 0
      used_keys(17)\wait_release = 1
      zw_bild = 3
   EndIf
   
   ; Options Button
   ; #PB_KEY_O
   if used_keys(18)\pressed And used_keys(18)\wait_release = 0
      used_keys(18)\wait_release = 1
      zw_bild = 5
   EndIf
   
   ; Options Button (alternate)
   ; #PB_KEY_escape
   if used_keys(44)\pressed And used_keys(44)\wait_release = 0
      used_keys(44)\wait_release = 1
      zw_bild = 5
   EndIf

   ; Skip Button
   ; #PB_KEY_X
   if used_keys(19)\pressed And used_keys(19)\wait_release = 0
      used_keys(19)\wait_release = 1
      aktion = 1
      ; Spieler Zugweite hochsetzen
      spieler(akt_spieler)\Speed = maxspeed()
      If nr_of_players = 1
         message(947,#COLOR_WEISS)
      EndIf
   EndIf
   
   ; Automap Button
   ; #PB_KEY_M
   if used_keys(20)\pressed And used_keys(20)\wait_release = 0
      used_keys(20)\wait_release = 1
      zw_bild = 12
   EndIf
   
   ; Old Messages
   ; #PB_KEY_Q
   if used_keys(21)\pressed And used_keys(21)\wait_release = 0
      used_keys(21)\wait_release = 1
      zw_bild = 13
   EndIf
   
   ; Mystic Attack
   ; #PB_KEY_A
   if used_keys(22)\pressed And used_keys(22)\wait_release = 0
      used_keys(22)\wait_release = 1
      zw_bild = 11
   EndIf

   
   If mmouse_x > 40 + x And mmouse_x < 81 + x And mmouse_y > 0 + y And mmouse_y < 40 + y
      over_rulesbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 1
      EndIf
   else
      over_rulesbutton = 0
   endif
   
   If mmouse_x > 80 + x And mmouse_x < 121 + x And mmouse_y > 0 + y And mmouse_y < 40 + y
      over_lookbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 7
      EndIf
   else
      over_lookbutton = 0
   endif
   
   If mmouse_x > 120 + x And mmouse_x < 161 + x And mmouse_y > 0 + y And mmouse_y < 40 + y
      over_sneakbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 8
      EndIf
   else
      over_sneakbutton = 0
   endif
   
   If mmouse_x > 160 + x And mmouse_x < 201 + x And mmouse_y > 0 + y And mmouse_y < 40 + y
      over_climbbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 4
      EndIf
   else
      over_climbbutton = 0
   endif
   
   If mmouse_x > 200 + x And mmouse_x < 241 + x And mmouse_y > 0 + y And mmouse_y < 40 + y
      over_theftbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         If skills(#CE_DIEBSTAHL,akt_spieler)\gewaehlt = 1
            zw_bild = 10
         EndIf
      EndIf
   else
      over_theftbutton = 0
   endif
   
   If mmouse_x > 40 + x And mmouse_x < 81 + x And mmouse_y > 50 + y And mmouse_y < 90 + y
      over_inventorybutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 2
      EndIf
   else
      over_inventorybutton = 0
   endif
   
   If mmouse_x > 80 + x And mmouse_x < 121 + x And mmouse_y > 50 + y And mmouse_y < 90 + y
      over_attributesbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 6
      EndIf
   else
      over_attributesbutton = 0
   endif
   
   If mmouse_x > 120 + x And mmouse_x < 161 + x And mmouse_y > 50 + y And mmouse_y < 90 + y
      over_bowbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 9
      EndIf
   else
      over_bowbutton = 0
   endif
   
   If mmouse_x > 160 + x And mmouse_x < 201 + x And mmouse_y > 50 + y And mmouse_y < 90 + y
      over_spellbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 3
      EndIf
   else
      over_spellbutton = 0
   endif
   
   If mmouse_x > 200 + x And mmouse_x < 241 + x And mmouse_y > 50 + y And mmouse_y < 90 + y 
      over_optionsbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 5
      EndIf
   else
      over_optionsbutton = 0
   endif
   
   If mmouse_x > 0 + x And mmouse_x < 41 + x And mmouse_y > 0 + y And mmouse_y < 40 + y
      over_skipbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         aktion = 1
         ; Spieler Zugweite hochsetzen
         spieler(akt_spieler)\Speed = maxspeed()
         If nr_of_players = 1
            message(947,#COLOR_WEISS)
         EndIf
      EndIf
   else
      over_skipbutton = 0
   endif
   
   If mmouse_x > 0 + x And mmouse_x < 41 + x And mmouse_y > 50 + y And mmouse_y < 90 + y
      over_automapbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 12
      EndIf
   else
      over_automapbutton = 0
   endif
   
   If mmouse_x > 16 And mmouse_x < 350 And mmouse_y > 367 And mmouse_y < 367+47
      over_oldmessagesbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         zw_bild = 13
      EndIf
   else
      over_oldmessagesbutton = 0
   endif
   
EndProcedure


Procedure show_buttons()

Shared warten, flaschen, win_mode, released, no_mouse
Shared zw_bild, aktion, joystick_used, bewegt, autopickup, knopf5
Shared over_rulesbutton, over_lookbutton, over_sneakbutton, over_climbbutton, over_theftbutton, over_inventorybutton
Shared over_attributesbutton, over_bowbutton, over_spellbutton, over_optionsbutton, over_skipbutton, over_automapbutton
Shared over_oldmessagesbutton
   
   x = 378
   y = 373
   zw_bild = 0

   If flaschen = 1
      wohin = ScreenOutput()
      StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(247,36,61))
      DrawText(#POS_FLASCHE_X -4,#POS_FLASCHE_Y +47,Str(spieler(akt_spieler)\Lifepoints) + "/" + Str(maxlife()))
      FrontColor(RGB(130,125,250))
      DrawText(#POS_FLASCHE_X +53,#POS_FLASCHE_Y +47,Str(spieler(akt_spieler)\Mana) + "/" + Str(maxmana()))
      StopDrawing()
   EndIf
   
   ; Button Hintergrund darstellen
   ClipSprite(#SPRITE_TILESET_BUTTONS_BACK, 0, 0, 256, 96)
   DisplaySprite(#SPRITE_TILESET_BUTTONS_BACK, x-12, y-5)

   ; Rules Button
   if over_rulesbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(572,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 204, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 38, y - 2)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 204, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 38, y - 2)
      ok_button = 0
   EndIf

   ; Look Button
   if over_lookbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(573,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 238, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 78, y - 2)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 238, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 78, y - 2)
   EndIf

   ; Sneak Button
   if over_sneakbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(574,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 272, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 118, y - 2)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 272, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 118, y - 2)
   EndIf

   ; Climb Button
   xp.w = 306
   msg.w = 575
   If spieler(akt_spieler)\creature_typ > 0
     xp = 646
     msg = 798
   EndIf
   if over_climbbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(msg,1+language))
         ClipSprite(#SPRITE_TILESET_BUTTONS, xp, 1, 34, 42) 
      StopDrawing() 
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 157, y - 2)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, xp, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 157, y - 2)
   EndIf

   ; Theft Button
   if over_theftbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(576,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 340, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 196, y - 2)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 340, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 196, y - 2)
   EndIf

   ; Inventory Button
   if over_inventorybutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(577,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 374, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 38, y + 47)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 374, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 38, y + 47)
   EndIf

   ; Attributes Button
   if over_attributesbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(578,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 476, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 78, y + 46)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 476, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 78, y + 46)
   EndIf

   ; Bow Button
   If knopf5 = 1 And joystick_used = 1
      If jb(5) <> 0
         zw_bild = 9
      EndIf
   EndIf
   if over_bowbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(579,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 442, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 117, y + 46)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 442, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 117, y + 46)
   EndIf

   ; Spell Button
   if over_spellbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(580,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 408, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 157, y + 46)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 408, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 157, y + 46)
   EndIf

   ; Options Button
   if over_optionsbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(581,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 510, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 196, y + 46)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 510, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x + 196, y + 46)
      ok_button = 0
   EndIf
   
   ; Skip Button
   if over_skipbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(582,1+language))     
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 578, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x - 2, y - 2)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 578, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x - 2, y - 2)
      ok_button = 0
   EndIf
   
   ; Automap Button
   if over_automapbutton
      ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 15)
      DisplaySprite(#SPRITE_CLEANER, 400, 330)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(0,0,0))
         FrontColor(RGB(170,170,170))
         DrawText(430,330,message_text(518,1+language))
      StopDrawing()
      ClipSprite(#SPRITE_TILESET_BUTTONS, 544, 1, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x - 2, y + 47)
   Else
      ClipSprite(#SPRITE_TILESET_BUTTONS, 544, 43, 34, 42)
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, x - 2, y + 47)
   EndIf
   
   ; Old Messages
   if over_oldmessagesbutton
      wohin = ScreenOutput()
      StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(255,255,0))
      Line(17,367,332,0)
      Line(17,367+47,332,0)
      Line(17,367,0,48)
      Line(17+332,367,0,48)
      StopDrawing()
   EndIf

EndProcedure



; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 300
; FirstLine = 283
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
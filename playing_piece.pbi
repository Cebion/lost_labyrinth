Procedure maennchen_auswaehlen()

Shared win_mode, released, maennchen_menu, joystick_used, no_mouse

pos_aktuell_x.w = 1
pos_aktuell_y.w = 1
frame.w = 0
face.w = 2
gewaehlt.w = 0
warten.w = 0
gogogo.w = 0
   
   init_keyboard_playingpiece()
   set_default_auto_repeat()
   
Repeat
   read_mouse()
   read_keyboard()
   read_joystick()
         
   ; #PB_Key_Right
   if used_keys(1)\pressed And used_keys(1)\wait_release = 0
      used_keys(1)\wait_release = 1
      pos_aktuell_x = pos_aktuell_x + 1
      If pos_aktuell_x > 7
         pos_aktuell_x = 1
         If maennchen_menu = 1
            maennchen_menu = 2
         EndIf
      EndIf
   endif
         
   ; #PB_Key_Left
   if used_keys(2)\pressed And used_keys(2)\wait_release = 0
      used_keys(2)\wait_release = 1
      pos_aktuell_x = pos_aktuell_x - 1
      If pos_aktuell_x < 1
         pos_aktuell_x = 7
         If maennchen_menu = 2
            maennchen_menu = 1
         EndIf
      EndIf
   endif
         
   ; #PB_Key_Down
   if used_keys(3)\pressed And used_keys(3)\wait_release = 0
      used_keys(3)\wait_release = 1
      pos_aktuell_y = pos_aktuell_y + 1
      If pos_aktuell_y > 4
         pos_aktuell_y = 1
      EndIf
   endif
         
   ; #PB_Key_Up
   if used_keys(4)\pressed And used_keys(4)\wait_release = 0
      used_keys(4)\wait_release = 1
      pos_aktuell_y = pos_aktuell_y - 1
      If pos_aktuell_y < 1
         pos_aktuell_y = 4
      EndIf
   endif
   
   ; #PB_Key_Return
   if used_keys(5)\pressed And used_keys(5)\wait_release = 0 and gogogo = 0
      used_keys(5)\wait_release = 1
      gogogo = 1
      something_changed = 1
   Endif
   
   ; #PB_Key_LeftShift
   if used_keys(6)\pressed And used_keys(6)\wait_release = 0
      used_keys(6)\wait_release = 1
      face + 1
      If face > 3
         face = 0
      EndIf
   EndIf
   ; #PB_Key_RightShift
   if used_keys(7)\pressed And used_keys(7)\wait_release = 0
      used_keys(7)\wait_release = 1
      face - 1
      If face < 0
         face = 3
      EndIf
   EndIf
         
   If mmouse_x > 550 And mmouse_x < 582 And mmouse_y > 350 And mmouse_y < 382
      over_leftbutton = 1
      If mmouse_links = 1 And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         maennchen_menu = 1
      EndIf 
   else
      over_leftbutton = 0
   endif
   
   If mmouse_x > 584 And mmouse_x < 616 And mmouse_y > 350 And mmouse_y < 382
      over_rightbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         maennchen_menu = 2
      EndIf
   else
      over_rightbutton = 0
   endif
   
   If mmouse_x > 529 And mmouse_x < 616 And mmouse_y > 409 And mmouse_y < 439
      over_rotatebutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         face + 1
         If face > 3
            face = 0
         EndIf
      endif
   else
      over_rotatebutton = 0
   endif

   warten = warten + 1
   If warten > 3
      warten = 1
      frame = frame + 1
      If frame > 1
         frame = 0
      EndIf
      something_changed = 1
   EndIf
   
   If something_changed = 1
      Fenster()
   
      ClearScreen(RGB(0,0,0))

      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,1))  ; Gelb
         DrawText(195,25,message_text(644,1+language) + Str((akt_spieler / 2) + 1) + ")")
      StopDrawing()

      ; Rahmen zeichnen
      draw_plain_frame(0)

      ; Maus darstellen
      If no_mouse = 0
      
         If mmouse_links = 1 And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If maennchen_menu = 1
               For x = 1 To 7
                  For y = 1 To 4
                     If mmouse_x > 34 + x * 64 And mmouse_x < 98 + x * 64  And mmouse_y > 8 + y * 64 And mmouse_y < 72 + y * 64
                        wohin = ScreenOutput()
                        StartDrawing(wohin)
                           FrontColor(RGB(255,255,1))
                           Box(34 + x * 64, 8 + y * 64,64,64)
                        StopDrawing()
                        spieler(akt_spieler)\maennchen = ((y-1) * 7) + x
                        gewaehlt = 1
                     EndIf
                  Next
               Next
            Else
               For x = 1 To 7
                  For y = 1 To 4
                     If mmouse_x > 34 + x * 64 And mmouse_x < 98 + x * 64  And mmouse_y > 8 + y * 64 And mmouse_y < 72 + y * 64
                        wohin = ScreenOutput()
                        StartDrawing(wohin)
                           FrontColor(RGB(255,255,1))
                           Box(34 + x * 64, 8 + y * 64,64,64)
                        StopDrawing()
                        spieler(akt_spieler)\maennchen = ((y+3) * 7) + x
                        gewaehlt = 1
                     EndIf
                  Next
               Next
            EndIf
         EndIf
      EndIf
      
      
      If gogogo = 1 Or jb(1) = 1
         For x = 1 To 7
            For y = 1 To 4
               If x = pos_aktuell_x And y = pos_aktuell_y
                  wohin = ScreenOutput()
                  StartDrawing(wohin)
                     FrontColor(RGB(255,255,1))
                     Box(34 + x * 64, 8 + y * 64,64,64)
                  StopDrawing()
                  If maennchen_menu = 1
                     spieler(akt_spieler)\maennchen = ((y-1) * 7) + x
                  Else
                     spieler(akt_spieler)\maennchen = ((y+3) * 7) + x
                  EndIf
                  gewaehlt = 1
               EndIf
            Next
         Next
      EndIf


      If maennchen_menu = 1
         nr = 1
         For j = 1 To 4
            For i = 1 To 7
               gew.w = 0
               For k = 1 To akt_spieler-1 Step 2
                  If nr = spieler(k)\maennchen
                     gew = 1
                  EndIf
               Next
               If gew = 0
                  ClipSprite(#SPRITE_TILESET_CHARACTER, face*32*2+frame*32, nr * 32 -32, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_CHARACTER, 50+32*i*2, 25+32*j*2)
               EndIf
               nr = nr + 1
               
            Next
         Next
      Else
         nr = 29
         For j = 1 To 4
            For i = 1 To 7
               gew.w = 0
               For k = 1 To akt_spieler-1 Step 2
                  If nr = spieler(k)\maennchen
                     gew = 1
                  EndIf
               Next
               If gew = 0
                  ClipSprite(#SPRITE_TILESET_CHARACTER, face*32*2+frame*32, nr * 32 -32, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_CHARACTER, 50+32*i* 2, 25+32*j*2)
               EndIf
               nr = nr + 1
            Next
         Next
      EndIf
      
      ; Cursor darstellen
      wohin = ScreenOutput()
      StartDrawing(wohin)
         FrontColor(RGB(255,255,1))
         Line(48+38+64*pos_aktuell_x, 22+64*pos_aktuell_y, -38, 0)
         Line(48+38+64*pos_aktuell_x, 22+64*pos_aktuell_y, 0, 39)
         Line(48+64*pos_aktuell_x, 60+64*pos_aktuell_y, 38, 0)
         Line(48+64*pos_aktuell_x, 60+64*pos_aktuell_y, 0, -38)
      StopDrawing()
      
      If maennchen_menu = 2
         ; Links Button
         if over_leftbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 0, 32, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 1*32, 0, 32, 31)
         EndIf 
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS5, 9*32, 0, 32, 31)
      EndIf   
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 550, 350)
      
      
      If maennchen_menu = 1
         ; Rechts Button
         if over_rightbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 0, 32, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 0, 0, 32, 31)
         EndIf
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS5, 8*32, 0, 32, 31)
      EndIf
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 584, 350) 
      
      ; Rotate Button darstellen
      if over_rotatebutton
         ClipSprite(#SPRITE_TILESET_BUTTONS3, 88, 0, 87, 32)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS3, 88, 31, 87, 32)
      EndIf
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS3, 530, 410)

      end_screen()
   Endif ; something_changed
   delay(#Input_delay)

Until gewaehlt = 1 Or back_button = 1
Delay(delay_animation)

If back_button = 1
   Goto again
EndIf

EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 95
; FirstLine = 92
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
Procedure show_old_messages()

   raus.w = 0
   x.w = 0
   y.w = 0
      
   init_keyboard_messages()

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()

      ; #PB_Key_Escape
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
      endif

      ; #PB_Key_Q
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         raus = 1
      endif
      
      If mmouse_x >= #POS_TEMPLATES_EXIT_X And mmouse_x <= #POS_TEMPLATES_EXIT_X + 32 And mmouse_y >= #POS_TEMPLATES_EXIT_Y And mmouse_y <= #POS_TEMPLATES_EXIT_Y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf
      Else
         over_exitbutton = 0
      Endif

      x = 20
      y = 20
      If mmouse_x >= x And mmouse_x <= x + 32 And mmouse_y >= y And mmouse_y <= y + 32
         over_iconbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            ;use message slot 0 for display state values
            old_messages(0)\player = old_messages(0)\player ! 1
         EndIf
      Else
         over_iconbutton = 0
      Endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf

      x = 60
      y = 20
      If mmouse_x >= x And mmouse_x <= x + 32 And mmouse_y >= y And mmouse_y <= y + 32
         over_timebutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            ;use message slot 0 for display state values
            old_messages(0)\color = old_messages(0)\color ! 1
         EndIf
      Else
         over_timebutton = 0
      Endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf
         
      If something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         draw_plain_frame(-1)
         
         y = 60
         x = 25
         If old_messages(0)\player
            For i = 1 To 25
               draw_small_player(x + (i & 1) * 5, y,old_messages(i)\player)
               y = y + 15
            Next
            x = 50
         EndIf

         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))  ; Weiss
         
         DrawText(250, 30,message_text(660,1+language))
            
         y.w = 60
         For i = 1 To 25
            Select(old_messages(i)\color)
               Case #COLOR_WEISS: FrontColor(RGB(255,255,255))  ; Weiss
               Case #COLOR_BLAU:  FrontColor(RGB(1,1,255))      ; Blau
               Case #COLOR_ROT:   FrontColor(RGB(255,1,1))      ; Rot
               Case #COLOR_GRUEN: FrontColor(RGB(1,255,1))      ; Gruen
               Case #COLOR_GELB:  FrontColor(RGB(255,255,1))    ; Gelb
               Case #COLOR_GRAU:  FrontColor(RGB(150,150,150))  ; Grau
            EndSelect
            If old_messages(0)\color
               DrawText(x, y,old_messages(i)\time+" "+old_messages(i)\message)
            Else
               DrawText(x, y,old_messages(i)\message)
            EndIf
            y = y + 15
         Next
         StopDrawing()

         If over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_TEMPLATES_EXIT_X, #POS_TEMPLATES_EXIT_Y)
         
         ClipSprite(#SPRITE_TILESET_BUTTONS5, 8*32 + 32*over_iconbutton + 64*old_messages(0)\player, 32, 31, 31)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 20, 20)
         ClipSprite(#SPRITE_TILESET_BUTTONS5,10*32 + 32*over_timebutton + 64*old_messages(0)\color, 0, 31, 31)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 60, 20)
         end_screen()
      Endif ; something_changed
      delay(#Input_delay)
   Until raus = 1

EndProcedure
; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 5
; FirstLine = 2
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

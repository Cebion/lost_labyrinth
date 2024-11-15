; Procedure for curses

Procedure namenlos()

   init_keyboard_return()

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()

      ; #PB_Key_Return
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
      endif
      
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
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

         ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
         DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
         FrontColor(RGB(0,0,0))   ; Schwarz
         ClipSprite(#SPRITE_CLEANER, 0, 0, 335, 335)
         DisplaySprite(#SPRITE_CLEANER, 16, 16)

         wohin = ScreenOutput()
         StartDrawing(wohin)
            FrontColor(RGB(255,0,0))  ; Rot
            x = 110
            y = 130
            DrawText(x,y,nachricht4(122))
            y = y + 20
            DrawText(x,y,nachricht4(123))
            y = y + 20
            DrawText(x,y,nachricht4(124))
         StopDrawing()
               
         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until raus > 0

EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 7
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

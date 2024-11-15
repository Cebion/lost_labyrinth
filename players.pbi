Procedure get_player_name()

   Shared joystick_used, no_mouse
   
   raus.w = 0  ; 0= cont. 1=abort  2=accept
   cursor.w = 0
   tmp_name.s = ""
   tmp_name_old.s = ""
   i.w
   tooltip = 0
   
   init_keyboard_playername()
   
   ;initialize list of templates
   ClearList(template_list())
   ;load the variable templates from disc
   load_templates()
   SelectElement(template_list(),(akt_spieler-1) / 2 )
   tmp_name = template_list()\name

   skill_count.w = count_skills(akt_spieler)
   ;print("skills:"+str(skill_count))
   #maxlines = 20
   Dim sp.w(3,2)
   If skill_count <= #maxlines ; 1 column
      ;print("1 column")
      sp(0,0) = #maxlines ;rows
      sp(0,1) = 1 ;firstline
      sp(0,2) = 220 ;xpos
      sp(1,0) = 0 ;no more columns
   ElseIf skill_count <= 2*#maxlines ; 2 columns
      ;print("2 columns")
      sp(0,0) = (skill_count+1)/2 ;half the skills round up
      sp(0,1) = 1 ;firstline
      sp(0,2) = 140 ;xpos
      sp(1,0) = #maxlines ;the remaining rows
      sp(1,1) = sp(0,0)+1 ;firstline
      sp(1,2) = 340 ;xpos
      sp(2,0) = 0 ;no more columns
   Else ; 3 columns needed
      ;print("3 columns")
      sp(0,0) = (skill_count+2)/3 ;1/3 the skills round up
      sp(0,1) = 1 ;firstline
      sp(0,2) = 30 ;xpos
      sp(1,0) = (skill_count+1)/3 ;1/3 the skills round up
      sp(1,1) = sp(0,0)+1 ;firstline = one more than rows in first column
      sp(1,2) = 230 ;xpos
      sp(2,0) = #maxlines ;the remaining rows
      sp(2,1) = sp(1,1) + sp(1,0) ;firstline plus number of elements in preceding column
      sp(2,2) = 430 ;xpos
      sp(3,0) = 0 ;no more columns
   EndIf
   ;i = 0
   ;While sp(i,0)
   ;  print(str(i)+":"+str(sp(i,0))+":"+str(sp(i,1))+":"+str(sp(i,2)))
   ;  i+1
   ;Wend

   Repeat
      read_joystick()
      read_mouse()
      read_keyboard()
      
      If mmouse_x >= #POS_NAME_EXIT_BUTTON_X And mmouse_x <= #POS_NAME_EXIT_BUTTON_X + 88 And mmouse_y >= #POS_NAME_EXIT_BUTTON_Y And mmouse_y <= #POS_NAME_EXIT_BUTTON_Y + 33
         over_okaybutton = 1
         tooltip = 907
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 2
         EndIf
      Else
         over_okaybutton = 0
         tooltip = 0
      EndIf
      
      If mmouse_x >= #POS_NAME_DELETE_BUTTON_X And mmouse_x <= #POS_NAME_DELETE_BUTTON_X + 45 And mmouse_y >= #POS_NAME_DELETE_BUTTON_Y And mmouse_y <= #POS_NAME_DELETE_BUTTON_Y + 29
         over_deletebutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            tmp_name = ""
         EndIf
      Else
         over_deletebutton = 0
      EndIf
         
      ; #PB_Key_Return
      If used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         raus = 2
      EndIf
         
      ; #PB_Key_Escape
      If used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
      EndIf

      tmp_name = keyboard_string(tmp_name,0)
      If tmp_name <> tmp_name_old
         tmp_name_old = tmp_name
         something_changed = 1
      EndIf
      cursor = (cursor + 1) % 32
      If cursor % 16 = 0
         something_changed = 1
      EndIf
         
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf
      
      If something_changed = 1
         Fenster()
         
         ClearScreen(RGB(0,0,0))
         draw_plain_frame()
         ; Okay Button 
         If over_okaybutton
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS2, #POS_NAME_EXIT_BUTTON_X, #POS_NAME_EXIT_BUTTON_Y)

         ; delete Button 
         If over_deletebutton
            ;tooltip = 976
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 1, 1, 45, 29)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 1, 32, 45, 29)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS4, #POS_NAME_DELETE_BUTTON_X, #POS_NAME_DELETE_BUTTON_Y)

         ; Maennchen anzeigen damit man weiss wer dran ist
         draw_player(220, 385)
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)

         If Len(tmp_name) > 25
            tmp_name = Mid(tmp_name,1,25)
         EndIf
         
         i = 0
         While sp(i,0)
            Draw_skill_list(akt_spieler,sp(i,2),80,sp(i,0),sp(i,1))
            i+1
         Wend

         FrontColor(RGB(255,255,255))  ; Weiss
         title.s = message_text(245,1+language)+" "+ message_text(113,1+language) + " " + Str((akt_spieler / 2) + 1)
         DrawText(320-TextWidth(title)/2,25,title)
         If tooltip
            DrawText(30,430,message_text(tooltip,1+language))
         EndIf
         DrawText(#POS_NAME_ENTER_FIELD_X,#POS_NAME_ENTER_FIELD_Y,tmp_name)
         If cursor < 16
            Line(#POS_NAME_ENTER_FIELD_X+TextWidth(tmp_name), #POS_NAME_ENTER_FIELD_Y, 0, 15)
         EndIf
         
         StopDrawing()

         end_screen()
      EndIf ; something_changed
      Delay(#Input_delay)
   Until raus > 0

   If raus = 2
      If Right(tmp_name, 1) = "*"
         tmp_name = "Lazy "+Str((akt_spieler / 2) + 1)
      EndIf
      Spieler(akt_spieler)\Name = tmp_name
      template_list()\name = tmp_name
      save_templates() ;write to disc for next time
   EndIf
   ClearList(template_list()) ;no longer needed

EndProcedure

; -------------------------------------------------------------------------------------

Procedure select_spieler()

Shared joystick_used, no_mouse


gewaehlt = 0
something_changed = 1
   
   init_keyboard_nr_of_players()

Repeat
   read_mouse()
   read_joystick()
   read_keyboard()
         
   ; #PB_Key_1
   if used_keys(1)\pressed And used_keys(1)\wait_release = 0
      used_keys(1)\wait_release = 1
      nr_of_players = 2
      gewaehlt = 1
      something_changed = 1
   endif
         
   ; #PB_Key_2
   if used_keys(2)\pressed And used_keys(2)\wait_release = 0
      used_keys(2)\wait_release = 1
      nr_of_players = 4
      gewaehlt = 1
      something_changed = 1
   endif
         
   ; #PB_Key_3
   if used_keys(3)\pressed And used_keys(3)\wait_release = 0
      used_keys(3)\wait_release = 1
      nr_of_players = 6
      gewaehlt = 1
      something_changed = 1
   endif
         
   ; #PB_Key_4
   if used_keys(4)\pressed And used_keys(4)\wait_release = 0
      used_keys(4)\wait_release = 1
      nr_of_players = 8
      gewaehlt = 1
      something_changed = 1
   endif
   
   If mmouse_x > 529 And mmouse_x < 616 And mmouse_y > 409 And mmouse_y < 439
      over_backbutton = 1
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         back_button = 1
      EndIf
   else
      over_backbutton = 0
   endif

   If mmouse_links And mmouse_links_wait_release = 0
      mmouse_links_wait_release = 1
      For i = 1 To 4
         If mmouse_x > 40 + i * 32 * 3 And mmouse_x < 108 + i * 32 * 3  And mmouse_y > 180 And mmouse_y < 240
            nr_of_players = 2*i
            gewaehlt = 1
         EndIf
      Next
      something_changed = 1
   EndIf

   if something_changed = 1
      Fenster()
      ClearScreen(RGB(0,0,0))

      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,1))  ; Gelb
         DrawText(225,25,nachricht4(112))
      StopDrawing()

      ; Rahmen zeichnen
      draw_plain_frame(0)
      
      if gewaehlt = 1
         wohin = ScreenOutput()
         StartDrawing(wohin)
            FrontColor(RGB(120,120,120))
            Box(30 + nr_of_players * 16 * 3, 170,84,74)
         StopDrawing()
      endif

      For nr = 1 To 4
         ClipSprite(#SPRITE_ELEMENTS, 32, 0, 32, 32)
         DisplayTransparentSprite(#SPRITE_ELEMENTS, 50+32*nr* 3, 200)

         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(0,0,0))
            Box(20,380,330,60)
            If mmouse_x > 40 + nr * 32 * 3 And mmouse_x < 108 + nr * 32 * 3  And mmouse_y > 180 And mmouse_y < 240
               FrontColor(RGB(0,0,255)) ; Blau
            Else
               FrontColor(RGB(255,255,255))  ; Weiss
            EndIf
            DrawText(40+32*nr*3,180,Str(nr))
            DrawText(55+32*nr*3,180,nachricht4(113))
         StopDrawing()
      Next
      
      ; Back Button darstellen
      if over_backbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 0, 87, 32)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 31, 87, 32)
      EndIf
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS3, 530, 410)

      end_screen()
   endif

   Delay(#Input_delay)

Until gewaehlt = 1 Or back_button = 1

delay(delay_animation2)

If back_button = 1
   Goto again
EndIf

EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 162
; FirstLine = 123
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
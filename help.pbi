Procedure display(was.s)

   offset.l = 0
   raus.w = 0
   up.w = 0
   down.w = 0
  
   NewList text.s()
  
      
   If ReadFile(0, "./" + was)
      While Eof(0) = 0
         AddElement(text())
         text() = ReadString(0)
      Wend
      CloseFile(0)
   EndIf

   maxlines = CountList(text())
   
   init_keyboard_display()


   Repeat
      read_keyboard()
      read_mouse()
      read_joystick()
     
      ; #PB_KEY_DOWN
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         down = 1
      endif
      
      ; #PB_KEY_UP
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         up = 1
      endif
      
      ; #PB_KEY_PAGEDOWN
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         down = 15
      endif
      
      ; #PB_KEY_PAGEUP
      if used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         up = 15
      endif
      
      ; #PB_Key_Escape
      if used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
        raus = 1
      endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf
     
     
      If mmouse_x >= #POS_EXIT_X And mmouse_x <= #POS_EXIT_X + 32 And mmouse_y >= #POS_EXIT_Y And mmouse_y <= #POS_EXIT_Y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf 
      else
         over_exitbutton = 0
      endif
      
      If mmouse_x >= #POS_LEVEL_UP_X And mmouse_x <= #POS_LEVEL_UP_X + 32 And mmouse_y >= #POS_LEVEL_UP_Y And mmouse_y <= #POS_LEVEL_UP_Y + 32
         over_levelup = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            up = 1
         EndIf 
      else
         over_levelup = 0
      endif
      
      If mmouse_x > #POS_LEVEL_UP_X And mmouse_x < #POS_LEVEL_UP_X + 32 And mmouse_y > #POS_LEVEL_UP_Y+32 And mmouse_y < #POS_LEVEL_UP_Y + 32 + 32
         over_leveldown = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            down = 1
         EndIf
      else
         over_leveldown = 0
      endif
   
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
    
         SelectElement(text(), offset)
            
         For i = 1 To 30
            DrawBitmapFont(#SPRITE_FONTS, 20, i*12+5, 6, 11, text())
            If NextElement(text()) = 0
            Break
            EndIf
         Next
         
         ; Level Hoch
         if over_levelup
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 6*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 4*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_LEVEL_UP_X, #POS_LEVEL_UP_Y)

         ; Level Runter
         if over_leveldown
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 7*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 5*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_LEVEL_UP_X, #POS_LEVEL_UP_Y+32)
      
         If up
            offset = offset - up
            If offset < 0
               offset = 0
            EndIf
            up = 0
         EndIf

         If down
            offset = offset + down
            If offset > maxlines -30
               offset = maxlines -30
            EndIf
            down = 0
         EndIf

         ; exit button
         if over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_EXIT_X, #POS_EXIT_Y)

         draw_plain_frame(-1)

         end_screen()
     endif
     delay(#Input_delay)
  Until raus = 1
  ClearList(text())
      
EndProcedure


Procedure hilfe()

   Shared yplus, gb_CallFromTitleScreen

   raus.w = 0
   spelltextdump.w = 0
   
   init_keyboard_help()
      
   Repeat
      read_joystick()
      read_keyboard()
      read_mouse()

      If gb_CallFromTitleScreen = 1
         x.w = 220
         y.w = 90
         pos_x.w = 220
         pos_y.w = 400
         esc_but_x.w = 640 - 31 - 16
         esc_but_y.w = 16
      Else
         x = 100
         y = 70
         pos_x = 60
         pos_y = 385
         esc_but_x = 350 - 31
         esc_but_y = 16
      EndIf
      
      ; #PB_KEY_Escape
      if used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
         raus = 1
      EndIf 
      
      ; #PB_KEY_1
      if used_keys(6)\pressed And used_keys(6)\wait_release = 0
         used_keys(6)\wait_release = 1
         text.s=""
         If language = 0
            text = "readme.txt"
         EndIf
         If language = 1
            text = "liesmich.txt"
         EndIf
         If language = 2
            text = "leeme.txt"
         EndIf
         display(text)
      EndIf 
      
      ; #PB_KEY_2
      if used_keys(7)\pressed And used_keys(7)\wait_release = 0
         used_keys(7)\wait_release = 1
         text.s=""
         If language = 0
            text = "readme_spells.txt"
         EndIf
         If language = 1
            text = "liesmich_zauber.txt"
         EndIf
         If language = 2
            text = "leeme_hechizos.txt"
         EndIf
         display(text)
         init_keyboard_help()
      EndIf 
      
      ; #PB_KEY_3
      if used_keys(8)\pressed And used_keys(8)\wait_release = 0
         used_keys(8)\wait_release = 1
         text.s=""
         If language = 0
            text = "FAQ_eng.txt"
         EndIf
         If language = 1
            text = "FAQ_deu.txt"
         EndIf
         If language = 2
            text = "FAQ_esp.txt"
         EndIf
         display(text)
         init_keyboard_help()
      EndIf
      
      ; #PB_KEY_W
      if used_keys(9)\pressed And used_keys(9)\wait_release = 0
         used_keys(9)\wait_release = 1 
         If spelltextdump = 0
            spelltextdump = 1
            dim outtext.s(17)
            spaces.s = "                                                                          "
            For lang = 1 to 3
               Select lang
                  Case 1: spellfile.s = "./readme_spells.txt"
                  Case 2: spellfile.s = "./liesmich_zauber.txt"
                  Case 3: spellfile.s = "./leeme_hechizos.txt"
               EndSelect
               CreateFile(1,spellfile)
               For i = 1 to 15
                  school.w = -1
                  schoolname.s = ""
                  Select i
                  Case 8: school = #school_air
                  Case 7: school = #school_bard
                           schoolname = skills(school,akt_spieler)\name[lang]+"     "
                  Case 1: school = #school_basic
                           schoolname = message_text(885,lang)
                  Case 4: school = #school_black
                  Case 5: school = #school_druid
                  Case 2: school = #school_earth
                  Case 3: school = #school_fire
                  Case 10: school = #school_high
                  Case 9: school = #school_illusion
                  Case 11: school = #school_star
                  Case 14: school = #school_warlock
                  Case 12: school = #school_water
                  Case 6: school = #school_white
                  Case 13: school = #school_witch
                  Case 15: school = #school_summon
                  EndSelect
                  If schoolname = ""
                  schoolname = skills(school,akt_spieler)\name[lang]
                  EndIf
                  ;cut off "Magic" suffix
                  ;schoolname = Mid(schoolname,1,Len(schoolname)-5)
                  If i % 3 = 1 ;start new column
                     outtext(0) = "  "
                     outtext(1) = "--"
                     For j = 1 to 9
                        outtext(j+1) = "0"+Str(j)
                     Next
                     For j = 10 to 15
                        outtext(j+1) = Str(j)
                     Next
                  EndIf
                  maxlen.w = Len(schoolname)
                  For j = 1 to 15
                     For k = 0 to #ANZ_ZAUBER+1
                        If spells(k)\school = school And spells(k)\level = j
                           Break
                        EndIf
                     Next
                     If Len(spells(k)\name[lang]) > maxlen
                        maxlen = Len(spells(k)\name[lang])
                     EndIf
                  Next
                  outtext(0) = outtext(0)+"  "+Mid(schoolname+spaces,1,maxlen)
                  outtext(1) = outtext(1)+Mid("-------------------------------------------------",1,maxlen+2)
                  For j = 1 to 15
                     For k = 0 to #ANZ_ZAUBER+1
                        If spells(k)\school = school And spells(k)\level = j
                           Break
                        EndIf
                     Next
                     outtext(j+1) = outtext(j+1)+"  "+Mid(spells(k)\name[lang]+spaces,1,maxlen)
                  Next
                  If i % 3 = 0  Or i = 15 ;start new row after 3 schools
                  For j = 0 to 16
                     WriteStringN( 1 , outtext(j) )
                  Next
                  WriteStringN( 1 , " " ) ;empy line
                  WriteStringN( 1 , " " ) ;empy line
                  EndIf
               Next
            Closefile(1)
            Next
         EndIf
      endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      endif
      
      If mmouse_x >= esc_but_x And mmouse_x <= esc_but_x + 32 And mmouse_y >= esc_but_y And mmouse_y <= esc_but_y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf 
      else
         over_exitbutton = 0
      endif
      
      If mmouse_x > pos_x - 6 And mmouse_x < pos_x + 60 And mmouse_y > pos_y - 6 And mmouse_y < pos_y + 20
         over_readmebutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            text.s=""
            If language = 0
               text = "readme.txt"
            EndIf
            If language = 1
               text = "liesmich.txt"
            EndIf
            If language = 2
               text = "leeme.txt"
            EndIf
            display(text)
            init_keyboard_help()
         EndIf
      else
         over_readmebutton = 0
      endif
      
      If mmouse_x > pos_x + 94 And mmouse_x < pos_x + 200 And mmouse_y > pos_y - 6 And mmouse_y < pos_y + 20
         over_readmespellsbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            text.s=""
            If language = 0
               text = "readme_spells.txt"
            EndIf
            If language = 1
               text = "liesmich_zauber.txt"
            EndIf
            If language = 2
               text = "leeme_hechizos.txt"
            EndIf
            display(text)
            init_keyboard_help()
         endif
      else
         over_readmespellsbutton = 0
      endif
      
      If mmouse_x > pos_x + 224 And mmouse_x < pos_x + 250 And mmouse_y > pos_y - 6 And mmouse_y < pos_y + 20
         over_readmefaqbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            text.s=""
            If language = 0
               text = "FAQ_eng.txt"
            EndIf
            If language = 1
               text = "FAQ_deu.txt"
            EndIf
            If language = 2
               text = "FAQ_esp.txt"
            EndIf
            display(text)
            init_keyboard_help()
         endif
      else
         over_readmefaqbutton = 0
      endif
      
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         If gb_CallFromTitleScreen = 1
            ClipSprite(#SPRITE_TILESET_SPLASH1, 0, 0, 640, 480)
            DisplaySprite(#SPRITE_TILESET_SPLASH1, 0, 0)

            ; Rahmen zeichnen
            draw_plain_frame(-1)
         Else
            laby_rahmen()
            show_logo()
            show_varys(1)
            show_buttons()
            ClearMessageWindow()

            ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
         EndIf

         ; Show all 'Keyboard Shortcuts'
         StartDrawing(ScreenOutput())
            DrawingMode(#PB_2DDrawing_Transparent)
            FrontColor($FFFF00) 
            DrawText(x, y, message_text(67, language+1))
            y + yplus
            DrawText(x, y, message_text(74, language+1))
            y + yplus
            DrawText(x, y, message_text(69, language+1))
            y + yplus
            DrawText(x, y, message_text(70, language+1))
            y + yplus
            DrawText(x, y, "M: " +  message_text(518, language+1))
            y + yplus
            DrawText(x, y, message_text(657, language+1))
            y + yplus
            DrawText(x, y, message_text(886, language+1))
            y + yplus
            DrawText(x, y, message_text(68, language+1))
            y + yplus
            DrawText(x, y, message_text(71, language+1))
            y + yplus
            DrawText(x, y, message_text(72, language+1))
            y + yplus
            DrawText(x, y, message_text(808, language+1))
            y + yplus
            DrawText(x, y, message_text(73, language+1))
            y + yplus
            DrawText(x, y, message_text(408, language+1))
            y + yplus
            DrawText(x, y, message_text(806, language+1))
            y + yplus
            DrawText(x, y, message_text(807, language+1))
            y + yplus
            DrawText(x, y, message_text(720, language+1))
            y + yplus
            DrawText(x, y, message_text(698, language+1))
            y + yplus
            DrawText(x, y, message_text(415, language+1))
         StopDrawing()
      
         if over_readmebutton
            DrawButtonPressed(#SPRITE_FONTS, pos_x, pos_y, 6, 24, "1."+ message_text(819,1+language))
         else
            DrawButtonNotPressed(#SPRITE_FONTS, pos_x, pos_y, 6, 24, "1."+ message_text(819,1+language))
         endif
         
         if over_readmespellsbutton
            DrawButtonPressed(#SPRITE_FONTS, pos_x + 100 , pos_y, 6, 24, "2."+ message_text(820,1+language))
         else
            DrawButtonNotPressed(#SPRITE_FONTS, pos_x + 100, pos_y, 6, 24, "2."+ message_text(820,1+language))
         endif
         
         if over_readmefaqbutton
            DrawButtonPressed(#SPRITE_FONTS, pos_x + 230 , pos_y, 6, 24, "3.FAQ")
         else
            DrawButtonNotPressed(#SPRITE_FONTS, pos_x + 230, pos_y, 6, 24, "3.FAQ")
         endif
         
         ; exit button
         if over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, esc_but_x, esc_but_y)

         end_screen()
      endif
      delay(#Input_delay)
   Until raus = 1

EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 88
; FirstLine = 48
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby_2.8.2.exe
; DisableDebugger
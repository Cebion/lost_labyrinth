Procedure title()

   Shared win_mode, released, joystick_used, no_mouse, gb_CallFromTitleScreen

   Dim position.l(8)
   Dim over_language.w(#ANZ_languages-1)
   position(1)=#POS_START
   position(2)=#POS_languages
   position(3)=#POS_HILFE
   position(4)=#POS_HIGHSCORE
   position(5)=#POS_CREDITS
   position(6)=#POS_LOAD
   position(7)=#POS_ENDE

   pos_aktuell.l = 0

   xxx.w
   x_moddy.b = 2

   start.w = 0
   
   init_keyboard_title()
  
   Repeat
      Fenster()
      xxx = xxx + x_moddy
      If xxx > 1123
         x_moddy = -2
      EndIf
      If xxx < 1
         x_moddy = 2
      EndIf

      ClearScreen(0)

      ; Hintergrund scrollen
      ClipSprite(#SPRITE_TILESET_SPLASH1, xxx, 0, 640, 480)
      DisplaySprite(#SPRITE_TILESET_SPLASH1, 0, 0)

      ; Logo darstellen
      ClipSprite(#SPRITE_TILESET_SPLASH3, 0, 0, 640, 174)
      DisplayTransparentSprite(#SPRITE_TILESET_SPLASH3, 0, 40)

      read_keyboard()
      read_mouse()
      read_joystick()
      jb1 = jb(1)

      ; Keyboard Shortcuts
      ; #PB_Key_S
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         pos_aktuell=1
         jb1=1
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_L
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         pos_aktuell=2
         jb1=1
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_F1
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         pos_aktuell=3
         jb1=1
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_H
      if used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         pos_aktuell=4
         jb1=1
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_C
      if used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
         pos_aktuell=5
         jb1=1
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_F9
      if used_keys(6)\pressed And used_keys(6)\wait_release = 0
         used_keys(6)\wait_release = 1
         pos_aktuell=6
         jb1=1
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_Q
      if used_keys(7)\pressed And used_keys(7)\wait_release = 0
         used_keys(7)\wait_release = 1
         pos_aktuell=7
         jb1=1
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_Right
      if used_keys(8)\pressed And used_keys(8)\wait_release = 0
         used_keys(8)\wait_release = 1
         pos_aktuell = pos_aktuell + 1
         If pos_aktuell > 7
            pos_aktuell = 1
         EndIf
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      ; #PB_Key_Left
      if used_keys(9)\pressed And used_keys(9)\wait_release = 0
         used_keys(9)\wait_release = 1
         pos_aktuell = pos_aktuell - 1
         If pos_aktuell < 1
            pos_aktuell = 7
         EndIf
         MouseLocate(position(pos_aktuell)+20,#POS_Y+20)
      EndIf
      
      
      
      If pos_aktuell = 1
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
            start = 1
         EndIf
      EndIf
      
      If pos_aktuell = 2
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
         language=language+1
         If language>#ANZ_languages-1
            language=0
         EndIf
         EndIf
         
         ; #PB_Key_Down
         if (used_keys(11)\pressed And used_keys(11)\wait_release = 0) or jb1 = 1
            used_keys(11)\wait_release = 1
            language=language-1
            If language<0
               language = #ANZ_languages-1
            EndIf
         EndIf
         
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
            If show_languages=1
               show_languages=0
            Else
               show_languages=1
            EndIf
         EndIf
      EndIf
      
      If pos_aktuell = 3
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
            gb_CallFromTitleScreen = 1
            hilfe()
            init_keyboard_title()
            gb_CallFromTitleScreen = 0
         EndIf
      EndIf
      
      If pos_aktuell = 4
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
            init_skills()
            show_highscore()
            init_keyboard_title()
         EndIf
      EndIf
      
      If pos_aktuell = 5
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
            show_credits()
            init_keyboard_title()
         EndIf
      EndIf
      
      If pos_aktuell = 6
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
            loading_screen()
            init_keyboard_title()
            jb1 = 0
         EndIf
      EndIf
      
      If pos_aktuell = 7
         ; #PB_Key_Return
         if (used_keys(10)\pressed And used_keys(10)\wait_release = 0) or jb1 = 1
            used_keys(10)\wait_release = 1
            CloseScreen()
            RunProgram("http://www.lostlabyrinth.com")
            End
         EndIf
      EndIf
      

      If mmouse_rechts And show_languages
         show_languages=0
      EndIf


      ; Draw all 'button text'
      StartDrawing(ScreenOutput())
      DrawingMode(#PB_2DDrawing_Transparent)
      FrontColor($FF0000)

      t.s = "Version: " + #PROGRAMMVERSION + "  (" + #LASTCHANGE + ")"
      DrawText(#POS_START+280-TextWidth(t)/2, 240, t)

      t = "http://www.lostlabyrinth.com"
      DrawText(#POS_START+280-TextWidth(t)/2, 260, t)

      t = "Authors:"
      DrawText(#POS_START+280-TextWidth(t)/2, 290, t)

      t = "Markus Döbele (Programming)"
      DrawText(#POS_START+280-TextWidth(t)/2, 310, t)

      t = "Bernd Edler (Programming)"
      DrawText(#POS_START+280-TextWidth(t)/2, 330, t)

      t = "Richard Braakman (Programming - Compiler)"
      DrawText(#POS_START+280-TextWidth(t)/2, 350, t)

      FrontColor($FFFFFF)

      DrawText(#POS_START+20-TextWidth(message_text(106, language+1))/2, #POS_Y+50, message_text(106, language+1))
      DrawText(#POS_START+16-TextWidth("(S)")/2,#POS_Y+65,"(S)")
      DrawText(#POS_languages+20-TextWidth(message_text(#nachrichten_languagen+language, language))/2, #POS_Y+50, message_text(#nachrichten_languagen+language, language))
      DrawText(#POS_languages+16-TextWidth("(L)")/2,#POS_Y+65,"(L)")
      If show_languages = 0
         DrawText(#POS_languages+14, #POS_Y-10, "^")
      Else
         For a = 0 To #ANZ_languages-1
         If a <> language
            DrawText(#POS_languages+20-TextWidth(message_text(#nachrichten_languagen+a,language))/2, #POS_Y+160-60*ytemp, message_text(#nachrichten_languagen+a,language))
            ytemp + 1
         EndIf
         Next
      EndIf

      DrawText(#POS_HIGHSCORE+20-TextWidth(message_text(109, language+1))/2, #POS_Y+50, message_text(109, language+1))
      DrawText(#POS_HIGHSCORE+16-TextWidth("(H)")/2,#POS_Y+65,"(H)")
      DrawText(#POS_CREDITS+20-TextWidth(message_text(110, language+1))/2, #POS_Y+50, message_text(110, language+1))
      DrawText(#POS_CREDITS+16-TextWidth("(C)")/2,#POS_Y+65,"(C)")
      DrawText(#POS_HILFE+16-TextWidth(message_text(67, language+1))/2, #POS_Y+50, message_text(67, language+1))
      DrawText(#POS_HILFE+16-TextWidth("(F1)")/2,#POS_Y+65,"(F1)")
      DrawText(#POS_LOAD+16-TextWidth(message_text(405, language+1))/2, #POS_Y+50, message_text(405, language+1))
      DrawText(#POS_LOAD+16-TextWidth("(F9)")/2,#POS_Y+65,"(F9)")
      DrawText(#POS_ENDE+20-TextWidth(message_text(111, language+1))/2, #POS_Y+50, message_text(111, language+1))
      DrawText(#POS_ENDE+16-TextWidth("(Q)")/2,#POS_Y+65,"(Q)")
      StopDrawing()


      If mmouse_x >= #POS_START And mmouse_x <= #POS_START+41 And mmouse_y >= #POS_Y And mmouse_y <= #POS_Y + 41
         over_startbutton = 1
         pos_aktuell=1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            start = 1
         endif
      else
         over_startbutton = 0
      endif
      
      If mmouse_x >= #POS_languages And mmouse_x <= #POS_languages + 41 And mmouse_y >= #POS_Y And mmouse_y <= #POS_Y + 41
         over_languagesbutton = 1
         pos_aktuell=2
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If show_languages=1
               show_languages=0
            Else
               show_languages=1
            EndIf
         EndIf
      else
         over_languagesbutton = 0
      endif
      
      If show_languages
         ytemp=1
         For a = 0 To #ANZ_languages-1
         If a<>language
            If mmouse_x >= #POS_languages And mmouse_x <= #POS_languages + 41 And mmouse_y >= #POS_Y-60*ytemp And mmouse_y <= #POS_Y + 41-60*ytemp
               over_language(a) = 1
               If mmouse_links And mmouse_links_wait_release = 0
               mmouse_links_wait_release = 1
               show_languages=0
               language=a
               EndIf
            else
               over_language(a) = 0
            EndIf
            ytemp+1
         EndIf
         Next
      EndIf
      
      If mmouse_x >= #POS_HILFE And mmouse_x <= #POS_HILFE + 41 And mmouse_y >= #POS_Y And mmouse_y <= #POS_Y + 41
         over_helpbutton = 1
         pos_aktuell=3
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            gb_CallFromTitleScreen = 1
            hilfe()
            gb_CallFromTitleScreen = 0
         EndIf
      else
         over_helpbutton = 0
      endif
      
      If mmouse_x >= #POS_HIGHSCORE And mmouse_x <= #POS_HIGHSCORE + 41 And mmouse_y >= #POS_Y And mmouse_y <= #POS_Y + 41
         over_highscorebutton = 1
         pos_aktuell=4
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            init_skills()
            show_highscore()
         EndIf
      else
         over_highscorebutton = 0
      endif
      
      If mmouse_x >= #POS_CREDITS And mmouse_x <= #POS_CREDITS + 41 And mmouse_y >= #POS_Y And mmouse_y <= #POS_Y + 41
         over_creditsbutton = 1
         pos_aktuell=5
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            show_credits()
         EndIf
      else
         over_creditsbutton = 0
      endif
      
      If mmouse_x >= #POS_LOAD And mmouse_x <= #POS_LOAD + 41 And mmouse_y >= #POS_Y And mmouse_y <= #POS_Y + 41
         over_loadbutton = 1
         pos_aktuell=6
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            loading_screen()
         EndIf
      else
         over_loadbutton = 0
      endif
      
      If mmouse_x >= #POS_ENDE And mmouse_x <= #POS_ENDE + 41 And mmouse_y >= #POS_Y And mmouse_y <= #POS_Y + 41
         over_savebutton = 1
         pos_aktuell=7
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            CloseScreen()
            RunProgram("http://www.lostlabyrinth.com")
            End
         EndIf
      else
         over_savebutton = 0
      endif
      

      ; Start Button darstellen
      if over_startbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS, 0, 1, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS,#POS_START, #POS_Y)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS, 0, 43, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_START, #POS_Y)
      EndIf

      ; Languages Button darstellen
      If show_languages
         ytemp=1
         For a = 0 To #ANZ_languages-1
         If a<>language
            if over_language(a)
               ClipSprite(#SPRITE_TILESET_BUTTONS, language(a)\buttonpos, 1, 34, 42)
            Else
               ClipSprite(#SPRITE_TILESET_BUTTONS, language(a)\buttonpos, 43, 34, 42)
            EndIf
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_languages, #POS_Y-ytemp*60)
            ytemp+1
         EndIf
         Next
      EndIf

      if over_languagesbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS, language(language)\buttonpos, 1, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_languages, #POS_Y)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS, language(language)\buttonpos, 43, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_languages, #POS_Y)
      EndIf
      ;Ende languages

      ; Hilfe Button darstellen
      if over_helpbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS, 6*34, 1, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_HILFE, #POS_Y)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS, 6*34, 43, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_HILFE, #POS_Y)
      EndIf

      ; Highscores Button darstellen
      if over_highscorebutton
         ClipSprite(#SPRITE_TILESET_BUTTONS, 136, 1, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_HIGHSCORE, #POS_Y)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS, 136, 43, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_HIGHSCORE, #POS_Y)
      EndIf

      ; Credits Button darstellen
      if over_creditsbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS, 102, 1, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_CREDITS, #POS_Y)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS, 102, 43, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_CREDITS, #POS_Y)
      EndIf

      ; Load Button darstellen
      if over_loadbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS, 578, 1, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_LOAD, #POS_Y)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS, 578, 43, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_LOAD, #POS_Y)
      EndIf

      ; Ende Button darstellen
      if over_savebutton
         ClipSprite(#SPRITE_TILESET_BUTTONS, 170, 1, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS,#POS_ENDE, #POS_Y)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS, 170, 43, 34, 42)
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS, #POS_ENDE, #POS_Y)
      EndIf

      end_screen()

   Until start = 1

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 162
; FirstLine = 135
; Folding = -
; Markers = 220,284
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby_2.8.2.exe
; DisableDebugger
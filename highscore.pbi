; Highscores anzeigen

Procedure init_highscores()

   for j = 1 to 4
      For i = 1 To 30
         hscores(i,j)\version                = " "
         hscores(i,j)\name                   = " "
         hscores(i,j)\level                  = 0
         hscores(i,j)\gold                   = 0
         hscores(i,j)\mks                    = 0
         hscores(i,j)\punkte                 = 0
         hscores(i,j)\maennchen              = 0
         hscores(i,j)\anfangszeit            = " "
         hscores(i,j)\endezeit               = " "
         hscores(i,j)\MaxLifepoints          = 0
         hscores(i,j)\MaxMana                = 0
         hscores(i,j)\Attack                 = 0
         hscores(i,j)\Dexterity              = 0
         hscores(i,j)\Strength               = 0
         hscores(i,j)\MaxSpeed               = 0
         hscores(i,j)\Perception             = 0
         hscores(i,j)\Luck_score             = 0
         hscores(i,j)\Power_score            = 0
         hscores(i,j)\Circle                 = 0
         hscores(i,j)\stabteile              = 0
         hscores(i,j)\moves                  = 0
         hscores(i,j)\cause_of_death         = 0
         hscores(i,j)\cause_of_death_monster = 0
         For k = 1 To 30
            hscores(i,j)\skills[k]   = 0
         Next
      Next
   next

EndProcedure


Procedure read_highscores()

   load.w = 0
   If ReadFile(0, environment + "/highscores.dat")
      load = 1
   ElseIf ReadFile(0, "./highscores.dat" )
      load = 1
   EndIf
   
   If load = 1
      for j = 1 to 4
         For i = 1 To 30
            hscores(i,j)\version                =  ReadString(0)
            hscores(i,j)\name                   =  ReadString(0)
            hscores(i,j)\level                  =  ReadWord(0)
            hscores(i,j)\gold                   =  ReadWord(0)
            hscores(i,j)\mks                    =  ReadWord(0)
            hscores(i,j)\punkte                 =  ReadWord(0)
            hscores(i,j)\maennchen              =  ReadWord(0)
            hscores(i,j)\anfangszeit            =  ReadString(0)
            hscores(i,j)\endezeit               =  ReadString(0)
            hscores(i,j)\MaxLifepoints          =  ReadWord(0)
            hscores(i,j)\MaxMana                =  ReadWord(0)
            hscores(i,j)\Attack                 =  ReadWord(0)
            hscores(i,j)\Dexterity              =  ReadWord(0)
            hscores(i,j)\Strength               =  ReadWord(0)
            hscores(i,j)\MaxSpeed               =  ReadWord(0)
            hscores(i,j)\Perception             =  ReadWord(0)
            hscores(i,j)\Luck_score             =  ReadWord(0)
            hscores(i,j)\Power_score            =  ReadWord(0)
            hscores(i,j)\Circle                 =  ReadWord(0)
            hscores(i,j)\stabteile              =  ReadWord(0)
            hscores(i,j)\moves                  =  ReadWord(0)
            hscores(i,j)\cause_of_death         =  ReadWord(0)
            hscores(i,j)\cause_of_death_monster =  ReadWord(0)
            For k = 1 To 30
               hscores(i,j)\skills[k]           =  ReadWord(0)
            Next
         Next
      next
      CloseFile(0)
   EndIf

EndProcedure


Procedure show_detail(akt_eintrag,akt_page)

Shared joystick_used
   
   raus.w = 0
   
   init_keyboard_special_level()
   
   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      
      ; #PB_KEY_Escape
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
      endif
      
      ; #PB_KEY_Space
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         raus = 1
      endif
      
      ; #PB_KEY_Return
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         raus = 1
      endif
      
      If mmouse_x >= #highscore_exit_x And mmouse_x <= #highscore_exit_x + 32 And mmouse_y >= #highscore_exit_y And mmouse_y <= #highscore_exit_y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf 
      else
         over_exitbutton = 0
      endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf 
      
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         ; Rahmen zeichnen
         draw_plain_frame(33)
      
         ; Maennchen anzeigen
         draw_player(50, 100)
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawingMode(1)
            xx = 150
            yy = 65

            DrawText(xx, yy,message_text(115,1+language))
            DrawText(xx+200, yy,hscores(akt_eintrag,akt_page)\name)
            
            yy = yy + 15
      
            FrontColor(RGB(154,251,120))
            DrawText(xx, yy,message_text(525,1+language)+":")
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\level))
            
            yy = yy + 15
      
            FrontColor(RGB(255,255,1))
            DrawText(xx, yy,message_text(156,1+language)+":")
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\gold))
            
            yy = yy + 15
      
            FrontColor(RGB(255,255,255))
            DrawText(xx, yy,message_text(155,1+language)+":")
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\mks))
            
            yy = yy + 15
      
            DrawText(xx, yy,message_text(93,1+language)+":")
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\punkte))
            
            yy = yy + 15
            DrawText(xx, yy,message_text(52,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\attack))
            
            yy = yy + 15

            DrawText(xx, yy,message_text(53,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\dexterity))
            
            yy = yy + 15
            DrawText(xx, yy,message_text(54,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\strength))
            
            yy = yy + 15
            FrontColor(RGB(247,36,61))
            DrawText(xx, yy,message_text(55,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\maxlifepoints))
            
            yy = yy + 15
            FrontColor(RGB(239,131,44))
            DrawText(xx, yy,message_text(56,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\maxspeed))
            
            yy = yy + 15

            FrontColor(RGB(255,255,255))
            DrawText(xx, yy,message_text(57,1+language))

            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\perception))
            
            yy = yy + 15
            DrawText(xx, yy,message_text(58,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\luck_score))
            
            yy = yy + 15
            FrontColor(RGB(130,125,250))
            DrawText(xx, yy,message_text(59,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\maxmana))
            
            yy = yy + 15
            DrawText(xx, yy,message_text(60,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\power_score))
            
            yy = yy + 15
            DrawText(xx, yy,message_text(61,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\circle))
            
            yy = yy + 15

            FrontColor(RGB(255,255,255))
            DrawText(xx, yy,message_text(239,1+language))

            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\stabteile) + "/9")
            
            yy = yy + 15

            DrawText(xx, yy,message_text(436,1+language))
            DrawText(xx+200, yy,Str(hscores(akt_eintrag,akt_page)\moves))
            
            yy = yy + 15
   
            select (hscores(akt_eintrag,akt_page)\cause_of_death)
               case  1 
                  reason_string.s = message_text(680,1+language)
               case  2 
                  reason_string = message_text(681,1+language)
               case  3 
                  reason_string = message_text(682,1+language)
               case  4 
                  reason_string = message_text(683,1+language)
               case  5 
                  reason_string = message_text(684,1+language)
               case  6 
                  reason_string = message_text(685,1+language)
               case  7 
                  reason_string = message_text(686,1+language)
               case  8 
                  reason_string = message_text(687,1+language)
               case  9 
                  reason_string = message_text(688,1+language)
               case 10 
                  reason_string = message_text(689,1+language)
               case 11 
                  reason_string = message_text(690,1+language)
               case 12 
                  reason_string = message_text(691,1+language)
               case 13 
                  reason_string = message_text(692,1+language)
               case 14 
                  reason_string = message_text(693,1+language)
               case 15 
                  reason_string = message_text(707,1+language)
               case 16 
                  reason_string = message_text(739,1+language)
               case 17 
                  reason_string = message_text(830,1+language)
               case 18 
                  reason_string = message_text(132,1+language)
               case 19 
                  reason_string = message_text(372,1+language)
               case 20 
                  reason_string = message_text(631,1+language)
               case 21 
                  reason_string = message_text(626,1+language) + " " + monster(hscores(akt_eintrag,akt_page)\cause_of_death_monster)\name[1+language]
               case 22 
                  reason_string = message_text(630,1+language)
               case 23 
                  reason_string = message_text(630,1+language)
               default 
                  reason_string = ""
            endselect
   
            DrawText(xx, yy,message_text(249,1+language))
            DrawText(xx+200, yy,reason_string)
            
            yy = yy + 5
            yy = yy + 15
            ysave = yy

            DrawText(xx-100, yy,message_text(250,1+language))
            
            j.w = 1
            For i = 1 To 30
               If hscores(akt_eintrag,akt_page)\skills[i] > 0
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 1
                     FrontColor(RGB(255,1,1))
                  EndIf
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 2
                     FrontColor(RGB(138,11,88))
                  EndIf
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 3
                     FrontColor(RGB(255,1,255))
                  EndIf
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 4
                     FrontColor(RGB(1,1,255))
                  EndIf
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 5
                     FrontColor(RGB(1,255,1))
                  EndIf
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 6
                     FrontColor(RGB(1,255,255))
                  EndIf
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 7
                     FrontColor(RGB(130,115,30))
                  EndIf
                  If skills(hscores(akt_eintrag,akt_page)\skills[i],1)\gruppe = 8
                     FrontColor(RGB(150,150,150))
                  EndIf
                  DrawText(xx+50, yy,skills(hscores(akt_eintrag,akt_page)\skills[i],1)\name[1+language])
               EndIf
               yy = yy + 15
               j = j + 1
               If j = 9
                  xx = xx + 150
                  yy = ysave
                  j = 1
               EndIf
            Next
            
         StopDrawing()
         
         if over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #highscore_exit_x, #highscore_exit_y)
         
         end_screen()
      endif ; something_changed
      Delay(#Input_delay)
   Until raus = 1

EndProcedure


Procedure upload_box(last_words.s)

Shared yplus, joystick_used

   raus.w = 0
   
   init_keyboard_upload()
   
   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      
      xx.w = 90
      yy.w = 250
      xxx.w = 190
      yyy.w = 250
      
      ; #PB_KEY_Y
      if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) or jay > 0
         used_keys(1)\wait_release = 1
         raus = 1
      endif
      
      ; #PB_KEY_Z
      if (used_keys(2)\pressed And used_keys(2)\wait_release = 0) or jay > 0
         used_keys(2)\wait_release = 1
         raus = 1
      endif
      
      ; #PB_KEY_Z
      if (used_keys(3)\pressed And used_keys(3)\wait_release = 0) or jay > 0
         used_keys(3)\wait_release = 1
         raus = 2
      endif
      
      If mmouse_x > xx And mmouse_x < xx+90 And mmouse_y > yy And mmouse_y < yy+28
         over_okaybutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf
      else
         over_okaybutton = 0
      endif
      
      If mmouse_x > xxx And mmouse_x < xxx+90 And mmouse_y > yyy And mmouse_y < yyy+28
         over_backbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 2
         EndIf
      else
         over_backbutton = 0
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
         
         StartDrawing(ScreenOutput())
         DrawingMode(1)
         FrontColor(RGB(255,255,255))
         DrawText(60, 300, message_text(740, 1+language))
         DrawText(60, 315, message_text(741, 1+language))
         ;FrontColor(RGB(0,0,0))  ; Schwarz
         DrawText(90, 170, message_text(748,1+language))
         StopDrawing()
         
         if over_okaybutton
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS2, xx, yy)
         
         if over_backbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS3, xxx, yyy)
      
         end_screen()
      endif ; something_changed
      Delay(#Input_delay)
  Until raus > 0
  If raus = 1
     highscore_upload(0,last_words)
  EndIf

EndProcedure



Procedure new_highscore(last_words.s)

   If CreateFile(0, environment + "/highscores.dat")
      for j = 1 to 4
         For i = 1 To 30
            WriteStringN(0,hscores(i,j)\version)
            WriteStringN(0,hscores(i,j)\name)
            WriteWord(0,hscores(i,j)\level)
            WriteWord(0,hscores(i,j)\gold)
            WriteWord(0,hscores(i,j)\mks)
            WriteWord(0,hscores(i,j)\punkte)
            WriteWord(0,hscores(i,j)\maennchen)
            WriteStringN(0,hscores(i,j)\anfangszeit)
            WriteStringN(0,hscores(i,j)\endezeit)
            WriteWord(0,hscores(i,j)\MaxLifepoints)
            WriteWord(0,hscores(i,j)\MaxMana)
            WriteWord(0,hscores(i,j)\Attack)
            WriteWord(0,hscores(i,j)\Dexterity)
            WriteWord(0,hscores(i,j)\Strength)
            WriteWord(0,hscores(i,j)\MaxSpeed)
            WriteWord(0,hscores(i,j)\Perception)
            WriteWord(0,hscores(i,j)\Luck_score)
            WriteWord(0,hscores(i,j)\Power_score)
            WriteWord(0,hscores(i,j)\Circle)
            WriteWord(0,hscores(i,j)\stabteile)
            WriteWord(0,hscores(i,j)\moves)
            WriteWord(0,hscores(i,j)\cause_of_death)
            WriteWord(0,hscores(i,j)\cause_of_death_monster)
            For k = 1 To 30
               WriteWord(0,hscores(i,j)\skills[k])
            Next
         Next
      next
      CloseFile(0)
   EndIf
   
   If spieler(akt_spieler)\maxlevel>3
      upload_box(last_words)
   EndIf

EndProcedure


Procedure clear_highscores()

   init_highscores()

EndProcedure


Procedure show_highscore()

Shared letzter_eintrag, joystick_used

   akt_pos.w = 1
   akt_page.w = nr_of_players/2

wieder_high:
   akt_eintrag.w = 0
   
   init_keyboard_showhighscore()
   
   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      
      akt_eintrag = 0
         
      ; #PB_KEY_Escape
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
      endif
         
      ; #PB_KEY_Return
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         show_detail(akt_pos,akt_page)
         init_keyboard_showhighscore()
      endif
         
      ; #PB_KEY_Space
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         show_detail(akt_eintrag,akt_page)
         init_keyboard_showhighscore()
      endif
         
      ; #PB_KEY_Down
      if used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         akt_pos = akt_pos + 1
         If akt_pos > 30
            akt_pos = 30
         EndIf
      endif
         
      ; #PB_KEY_Up
      if used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
         akt_pos = akt_pos - 1
         If akt_pos < 1
            akt_pos = 1
         EndIf
      endif
         
      ; #PB_KEY_Left
      if used_keys(11)\pressed And used_keys(11)\wait_release = 0
         used_keys(11)\wait_release = 1
         akt_page = akt_page - 1
         If akt_page < 1
            akt_page = 1
         EndIf
      endif
         
      ; #PB_KEY_Right
      if used_keys(12)\pressed And used_keys(12)\wait_release = 0
         used_keys(12)\wait_release = 1
         akt_page = akt_page + 1
         If akt_page > 4
            akt_page = 4
         EndIf
      endif

      ; #PB_KEY_X
      if used_keys(6)\pressed And used_keys(6)\wait_release = 0
         used_keys(6)\wait_release = 1
         clear_highscores()
      Endif

      ; #PB_KEY_1
      if used_keys(7)\pressed And used_keys(7)\wait_release = 0
         used_keys(7)\wait_release = 1
         akt_page = 1
      Endif

      ; #PB_KEY_2
      if used_keys(8)\pressed And used_keys(8)\wait_release = 0
         used_keys(8)\wait_release = 1
         akt_page = 2
      Endif

      ; #PB_KEY_3
      if used_keys(9)\pressed And used_keys(9)\wait_release = 0
         used_keys(9)\wait_release = 1
         akt_page = 3
      Endif

      ; #PB_KEY_4
      if used_keys(10)\pressed And used_keys(10)\wait_release = 0
         used_keys(10)\wait_release = 1
         akt_page = 4
      Endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf 
      
      If mmouse_x >= #highscore_exit_x And mmouse_x <= #highscore_exit_x + 32 And mmouse_y >= #highscore_exit_y And mmouse_y <= #highscore_exit_y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf 
      else
         over_exitbutton = 0
      endif
      
      If mmouse_x >= #highscore_delete_x And mmouse_x <= #highscore_delete_x + 16 And mmouse_y >= #highscore_delete_y And mmouse_y <= #highscore_delete_y + 16
         over_deletebutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            clear_highscores()
         endif
      else
         over_deletebutton = 0
      endif
      
      If mmouse_x >= #highscore_1_player_x And mmouse_x <= #highscore_1_player_x + 100 And mmouse_y >= #highscore_players_y And mmouse_y <= #highscore_players_y + 16
         over_1_player = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            akt_page = 1
         endif
      else
         over_1_player = 0
      endif
      
      If mmouse_x >= #highscore_2_player_x And mmouse_x <= #highscore_2_player_x + 100 And mmouse_y >= #highscore_players_y And mmouse_y <= #highscore_players_y + 16
         over_2_player = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            akt_page = 2
         endif
      else
         over_2_player = 0
      endif
      
      If mmouse_x >= #highscore_3_player_x And mmouse_x <= #highscore_3_player_x + 100 And mmouse_y >= #highscore_players_y And mmouse_y <= #highscore_players_y + 16
         over_3_player = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            akt_page = 3
         endif
      else
         over_3_player = 0
      endif
      
      If mmouse_x >= #highscore_4_player_x And mmouse_x <= #highscore_4_player_x + 100 And mmouse_y >= #highscore_players_y And mmouse_y <= #highscore_players_y + 16
         over_4_player = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            akt_page = 4
         endif
      else
         over_4_player = 0
      endif
      
      For i = 1 To 30
         If mmouse_y > i*12+85 And mmouse_y < i*12+98
            If mmouse_links And mmouse_links_wait_release = 0
               mmouse_links_wait_release = 1
               akt_eintrag = i
               show_detail(akt_eintrag,akt_page)
               init_keyboard_showhighscore()
            EndIf
         EndIf
      Next

      If something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         ; Rahmen zeichnen
         draw_plain_frame(33)
      
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(1,255,1))  ; Gruen
            DrawText(260,18,message_text(109,1+language))
            yy = 75
            DrawText(50, yy,"Nr")
            DrawText(100, yy,message_text(154,1+language))
            DrawText(400, yy,message_text(525,1+language))
            DrawText(450, yy,"MKS")
            DrawText(500, yy,message_text(156,1+language))
            DrawText(550, yy,message_text(93,1+language))
         
            yy = 95
            For i = 1 To 30
               FrontColor(RGB(255,255,255))  ; Weiss
               
               If i = akt_pos 
               FrontColor(RGB(150,150,150))   ; grey
               Box(16,yy+1,640-16-16,TextHeight("Iq")-2)
               FrontColor(RGB(0,0,0))  ; Black
               EndIf
               
               If i = letzter_eintrag
                  FrontColor(RGB(255,1,1))  ; Rot
               EndIf
               
               If mmouse_y > i*12+85 And mmouse_y < i*12+98
                  FrontColor(RGB(1,1,255))  ; Blau
               EndIf
               DrawText(50, yy,Str(i))
               DrawText(100, yy,hscores(i,akt_page)\name)
               DrawText(400, yy,Str(hscores(i,akt_page)\level))
               DrawText(450, yy,Str(hscores(i,akt_page)\mks))
               DrawText(500, yy,Str(hscores(i,akt_page)\gold))
               DrawText(550, yy,Str(hscores(i,akt_page)\punkte))
               yy = yy + 12
            Next
         
            if over_1_player
               FrontColor(RGB(1,1,255))  ; Blau
            else
               FrontColor(RGB(255,255,255))  ; Weiss
            endif
            if akt_page = 1
               FrontColor(RGB(1,255,1))  ; Grün
            endif
            DrawText(#highscore_1_player_x, #highscore_players_y,"1 " + message_text(113,1+language))
            
            if over_2_player
               FrontColor(RGB(1,1,255))  ; Blau
            else
               FrontColor(RGB(255,255,255))  ; Weiss
            endif
            if akt_page = 2
               FrontColor(RGB(1,255,1))  ; Grün
            endif
            DrawText(#highscore_2_player_x, #highscore_players_y,"2 " + message_text(113,1+language))
            
            if over_3_player
               FrontColor(RGB(1,1,255))  ; Blau
            else
               FrontColor(RGB(255,255,255))  ; Weiss
            endif
            if akt_page = 3
               FrontColor(RGB(1,255,1))  ; Grün
            endif
            DrawText(#highscore_3_player_x, #highscore_players_y,"3 " + message_text(113,1+language))
            
            if over_4_player
               FrontColor(RGB(1,1,255))  ; Blau
            else
               FrontColor(RGB(255,255,255))  ; Weiss
            endif
            if akt_page = 4
               FrontColor(RGB(1,255,1))  ; Grün
            endif
            DrawText(#highscore_4_player_x, #highscore_players_y,"4 " + message_text(113,1+language))
         
         StopDrawing()
         
         If over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #highscore_exit_x, #highscore_exit_y)
         
         If over_deletebutton
            ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 16*9, 16*3, 14, 14)
            DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, #highscore_delete_x,#highscore_delete_y)
         Else
            ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 32, 32, 14, 14)
            DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, #highscore_delete_x,#highscore_delete_y)
         EndIf
         
         end_screen()
      endif ; something_changed
      Delay(#Input_delay)
   until raus = 1
   
EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 583
; FirstLine = 579
; Folding = --
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
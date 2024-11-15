Procedure count_skills(player_num)

   actcount.w = 0
   For i = 1 To #ANZ_SKILLS
     If skills(i,player_num)\gewaehlt = 1 And skills(i,player_num)\nummer 
       actcount+1
     EndIf
   Next
   ProcedureReturn actcount
   
EndProcedure


Procedure draw_skill_list(player_num,x,y,maxlines,firstline = 1)

   shared mmouse_x,mmouse_y,mmouse_links,language
   Static my_old.w,ml_old.w,oldfirstline.w
   ;If maxlines = 0
   ;   firstline = 1
   ;EndIf
   actline.w = 0
   num_skills = count_skills(player_num)
   ; allow dragging with mouse
   If num_skills > maxlines
     If mmouse_links And mmouse_x > x And mmouse_x < x +100
       If ml_old = 0
         ml_old = 1
         my_old = mmouse_y
       Else
         firstline = oldfirstline + (my_old - mmouse_y) / 15
         If firstline < 1 
           firstline = 1
         EndIf
         If firstline > num_skills - maxlines + 1
           firstline = num_skills - maxlines + 1
         EndIf
       EndIf
     Else
       ml_old = 0
       oldfirstline = firstline
     EndIf
   EndIf
   ;FrontColor(RGB(255,255,255))
   ;DrawText(160,415, "skillcount:" + Str(num_skills) )
   For i = 1 To #ANZ_SKILLS
     If skills(i,player_num)\gewaehlt = 1 And skills(i,player_num)\nummer
       actline+1
       If actline > maxlines + firstline - 1
         Break
       EndIf
       If firstline > actline
         Continue
       Else
         ; mouseover tooltip
         If mmouse_x > x And mmouse_x < x +100 And mmouse_y > y And mmouse_y < y + 14
           FrontColor(RGB(255,255,255))
           DrawText(30,430,skills(i,akt_spieler)\beschreibung_1[1+language] + " (" + Str(skills(i,akt_spieler)\kosten) + " CP)")
           DrawText(30,445,skills(i,akt_spieler)\beschreibung_2[1+language])
         EndIf
         Select ( skills(i,player_num)\gruppe )
           Case 1 : 
             r = 255
             g = 1
             b = 1
           Case 2 : 
             r = 138
             g = 11
             b = 88
           Case 3 : 
             r = 255
             g = 1
             b = 255
           Case 4 : 
             r = 1
             g = 1
             b = 255
           Case 5 : 
             r = 1
             g = 255
             b = 1
           Case 6 : 
             r = 1
             g = 255
             b = 255
           Case 7 : 
             r = 130
             g = 115
             b = 32
           Case 8 : 
             r = 150
             g = 150
             b = 150
           Case 9 : 
             r = 97
             g = 56
             b = 36
         EndSelect
         FrontColor(RGB(r,g,b))
         DrawText(x,y,skills(i,akt_spieler)\name[1+language])
         y = y + 15
       EndIf
     EndIf
   Next
   ProcedureReturn firstline
   
EndProcedure

Procedure draw_player(x.w, y.w, player_num.w = -1)
   If player_num = -1
      player_num = akt_spieler
   EndIf
   If spieler(player_num)\creature_typ = 0 Or spieler(player_num)\creature_typ = #CREATURE_DOPPELGANGER  Or spieler(player_num)\creature_typ = #CREATURE_COMPANION
      ClipSprite(#SPRITE_TILESET_CHARACTER, 128, spieler(player_num)\maennchen*32-32, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_CHARACTER, x, y)
   Else
      ClipSprite(#SPRITE_TILESET_MONSTERANIM, 128, spieler(player_num)\maennchen*32-32, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x, y)
   EndIf
EndProcedure

Procedure draw_small_player(x.w, y.w, player_num.w = -1)
   If player_num = -1
      player_num = akt_spieler
   EndIf
   If spieler(player_num)\creature_typ = 0 Or spieler(player_num)\creature_typ = #CREATURE_DOPPELGANGER  Or spieler(player_num)\creature_typ = #CREATURE_COMPANION
      ClipSprite(#SPRITE_TILESET_SMALLCHARA, 64, spieler(player_num)\maennchen*16-16, 16, 16)
      DisplayTransparentSprite(#SPRITE_TILESET_SMALLCHARA, x, y)
   Else
      ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, 64, spieler(player_num)\maennchen*16-16, 16, 16)
      DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x, y)
   EndIf
EndProcedure

Procedure character_info()

Shared schutz_min, schutz_max, behinderung, released, cinfo_menu, no_mouse

   raus.w = 0
   ;skillnum.w = count_skills(akt_spieler) ;not used now, but needed for scroll buttons
   first_line.w = 1
  
   init_keyboard_cinfo()

   Repeat
      read_joystick()
      read_keyboard()
      read_mouse()

      ; #PB_Key_Escape
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
       EndIf
       
      ; #PB_Key_D
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         raus = 1
      EndIf
       
      ; #PB_Key_Right
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         cinfo_menu = 2
      EndIf
       
      ; #PB_Key_Left
      if used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         cinfo_menu = 1
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
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf 
      
      If (mmouse_x > 584 And mmouse_x < 616 And mmouse_y > 350 And mmouse_y < 382) Or KeyboardPushed(#PB_Key_Right)
         over_rightbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            cinfo_menu = 2
         EndIf 
      else
         over_rightbutton = 0
      endif
      
      If (mmouse_x > 550 And mmouse_x < 582 And mmouse_y > 350 And mmouse_y < 382) Or KeyboardPushed(#PB_Key_Left)
         over_leftbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            cinfo_menu = 1
         EndIf 
      else
         over_leftbutton = 0
      endif
         
      if something_changed = 1
         Fenster()

         ClearScreen(RGB(0,0,0))
         draw_plain_frame()

         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         x = 55
         y = 80
         FrontColor(RGB(255,255,255))  ; Weiss
         title.s = message_text(92,1+language) + spieler(akt_spieler)\name
         DrawText(320-TextWidth(title)/2,25,title)
         
         If cinfo_menu = 1
            FrontColor(RGB(247,36,61))
            DrawText(x,y,message_text(55,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Lifepoints) + " (" + Str(maxlife()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(919,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(130,125,250))
            DrawText(x,y,message_text(59,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Mana) + " (" + Str(maxmana()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(920,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(52,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Attack) + " (" + Str(angriff()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(921,1+language))
            EndIf
            y = y + 15

            DrawText(x,y,message_text(53,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Dexterity) + " (" + Str(reflexe()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(922,1+language))
               DrawText(30,445,message_text(923,1+language))
            EndIf
            y = y + 15
            
            DrawText(x,y,message_text(54,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Strength) + " (" + Str(staerke()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(924,1+language))
               DrawText(30,445,message_text(925,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(239,131,44))
            DrawText(x,y,message_text(56,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\MaxSpeed) + " (" + Str(maxspeed()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(926,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(57,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Perception) + " (" + Str(wahrnehmung()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(927,1+language))
            EndIf
            y = y + 15

            DrawText(x,y,message_text(58,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Luck_score) + " (" + Str(luck()) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(928,1+language))
            EndIf
            y = y + 15

            DrawText(x,y,message_text(91,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Power_score) + " (" + Str(power(0)) + ")")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(929,1+language))
            EndIf
            y = y + 15

            DrawText(x,y,message_text(61,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Circle))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(930,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(1,1,255))  ; Blau
            DrawText(x,y,message_text(90,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Hunger))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(931,1+language))
            EndIf
            y = y + 15

            DrawText(x,y,message_text(89,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\Durst))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(932,1+language))
            EndIf
            y = y + 15
            
            waffenl.s = ""
            If ich_trage(#KLASSE_WAFFENLOS) = 0
               waffenl = message_text(636,language+1)
            EndIf
            
            FrontColor(RGB(255,1,1))
            DrawText(x,y,message_text(88,1+language))
            DrawText(x+170,y,Str(schaden_min()) + "-" + Str(schaden_max()) + waffenl)
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(933,1+language))
            EndIf
            y = y + 15
            schutz()
            DrawText(x,y,message_text(87,1+language))
            schutz()
            DrawText(x+170,y,Str(schutz_min) + "-" + Str(schutz_max))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(934,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(86,1+language))
            DrawText(x+170,y,Str(behinderung))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(935,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(255,1,1))
            DrawText(x,y,message_text(84,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\mks))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(936,1+language))
            EndIf
            y = y + 15

            FrontColor(RGB(255,255,1))
            DrawText(x,y,message_text(85,1+language))
            DrawText(x+170,y,Str(gold_anzahl()))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(937,1+language))
            EndIf
            y = y + 15
            
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(239,1+language))
            DrawText(x+170,y,Str(anz_staffpieces()) + " ( + " + Str(100 * anz_staffpieces()) + " " + message_text(93,1+language) + " )")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(938,1+language))
            EndIf
            y = y + 15
            
            DrawText(x,y,message_text(436,1+language))
            DrawText(x+170,y,Str(spieler(akt_spieler)\moves))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(939,1+language))
            EndIf
            y = y + 15
            
            ; Punkte
            DrawText(x,y,message_text(93,1+language))
            DrawText(x+170,y,Str(punkte()))
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(940,1+language))
               DrawText(30,445,message_text(941,1+language))
            EndIf
            y = y + 15
            
            first_line = draw_skill_list(akt_spieler,350,80,20,first_line)
            StopDrawing()
         Else
            ; Attack
            DrawText(x,y,message_text(615,1+language))
            DrawText(x+190,y,Str(spieler_angriffswert()) + "%")
               If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(894,1+language))
               DrawText(30,445,message_text(895,1+language))
            EndIf
            y = y + 15
            
            ; Kritisch
            DrawText(x,y,message_text(612,1+language))
            DrawText(x+190,y,Str(schaden_critical()) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(896,1+language))
               DrawText(30,445,message_text(897,1+language))
            EndIf
            y = y + 15
            
            ; Schleichen
            DrawText(x,y,message_text(574,1+language)+":")
            DrawText(x+190,y,Str(schleichen()) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(898,1+language))
               DrawText(30,445,message_text(899,1+language))
            EndIf
            y = y + 15
            
            ; find secret doors
            DrawText(x,y,message_text(915,1+language))
            DrawText(x+190,y,Str(entdecken()) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(916,1+language))
               DrawText(30,445,message_text(909,1+language))
            EndIf
            y = y + 15

            ; find hidden treasure
            DrawText(x,y,message_text(917,1+language))
            DrawText(x+190,y,Str(find_treasure()) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(918,1+language))
               DrawText(30,445,message_text(909,1+language))
            EndIf
            y = y + 15

            ; Fallen entdecken
            DrawText(x,y,message_text(614,1+language))
            DrawText(x+190,y,Str(find_trap()) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(908,1+language))
               DrawText(30,445,message_text(909,1+language))
            EndIf
            y = y + 15
            
            ; Fallen ausweichen
            DrawText(x,y,message_text(613,1+language))
            DrawText(x+190,y,Str(ausweichen()) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(910,1+language))
               DrawText(30,445,message_text(911,1+language))
            EndIf
            y = y + 15
            
            ; Monster ausweichen
            DrawText(x,y,message_text(629,1+language))
            DrawText(x+190,y,Str(reflexe() * 10) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(912,1+language))
               DrawText(30,445,message_text(913,1+language))
            EndIf
            y = y + 15
            
            ; Magieresistenz
            DrawText(x,y,message_text(703,1+language))
            resi.w = magic_resistance()
            DrawText(x+190,y,Str(resi) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(914,1+language))
            EndIf
            y = y + 15
            
            ; Giftresistenz
            DrawText(x,y,message_text(787,1+language))
            resi.w = poison_resistance()
            DrawText(x+190,y,Str(resi) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(791,1+language))
            EndIf
            y = y + 15
            
            ; Feuerresistenz
            DrawText(x,y,message_text(788,1+language))
            resi.w = fire_resistance()
            DrawText(x+190,y,Str(resi) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(792,1+language))
            EndIf
            y = y + 15
            
            ; Eisresistenz
            DrawText(x,y,message_text(789,1+language))
            resi.w = cold_resistance()
            DrawText(x+190,y,Str(resi) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(793,1+language))
            EndIf
            y = y + 15
            
            ; Blitzresistenz
            DrawText(x,y,message_text(790,1+language))
            resi.w = lightning_resistance()
            DrawText(x+190,y,Str(resi) + "%")
            If mmouse_x > x And mmouse_x < x+200 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(794,1+language))
            EndIf
            StopDrawing()
            
            x = 350
            y = 80
            ; Goblinlehre
            ClipSprite(#SPRITE_TILESET_MONSTER, 1*32, 6*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, x-36, y-10)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)         
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(618,1+language) + ":")
            DrawText(x+170,y,Str(spieler(akt_spieler)\goblinlehre))
            If mmouse_x > x-36 And mmouse_x < x+170 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(888,1+language))
               DrawText(30,445,message_text(889,1+language))
            EndIf
            StopDrawing()
            y = y + 32
            
            ; Spinnenlehre
            ClipSprite(#SPRITE_TILESET_MONSTER, 5*32, 14*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, x-36, y-10)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)         
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(619,1+language) + ":")
            DrawText(x+170,y,Str(spieler(akt_spieler)\spinnenlehre))
            If mmouse_x > x-36 And mmouse_x < x+170 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(888,1+language))
               DrawText(30,445,message_text(889,1+language))
            EndIf
            StopDrawing()
            y = y + 32
            
            ; Untotenlehre
            ClipSprite(#SPRITE_TILESET_MONSTER, 1*32, 4*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, x-36, y-10)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)         
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(620,1+language) + ":")
            DrawText(x+170,y,Str(spieler(akt_spieler)\untotenlehre))
            If mmouse_x > x-36 And mmouse_x < x+170 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(888,1+language))
               DrawText(30,445,message_text(889,1+language))
            EndIf
            StopDrawing()
            y = y + 32
            
            ; Tierkunde
            ClipSprite(#SPRITE_TILESET_MONSTER, 0*32, 0*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, x-36, y-10)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)         
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(621,1+language) + ":")
            DrawText(x+170,y,Str(spieler(akt_spieler)\tierkunde))
            If mmouse_x > x-36 And mmouse_x < x+170 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(888,1+language))
               DrawText(30,445,message_text(889,1+language))
            EndIf
            StopDrawing()
            y = y + 32
            
            ; Pflanzenkunde
            ClipSprite(#SPRITE_TILESET_MONSTER, 8*32, 0*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, x-36, y-10)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)         
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(628,1+language) + ":")
            DrawText(x+170,y,Str(spieler(akt_spieler)\pflanzenlehre))
            If mmouse_x > x-36 And mmouse_x < x+170 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(888,1+language))
               DrawText(30,445,message_text(889,1+language))
            EndIf
            StopDrawing()
            y = y + 32
            
            ; Fallenlehre
            ClipSprite(#SPRITE_TILESET_LABYRINTH, 1*32, 3*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_LABYRINTH, x-36, y-10)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)         
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(622,1+language) + ":")
            DrawText(x+170,y,Str(spieler(akt_spieler)\fallenlehre))
            If mmouse_x > x-36 And mmouse_x < x+170 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(890,1+language))
               DrawText(30,445,message_text(891,1+language))
            EndIf
            StopDrawing()
            y = y + 32
            
            ; Giftlehre
            ClipSprite(#SPRITE_TILESET_ITEMS, 14*32, 5*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x-36, y-10)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)         
            FrontColor(RGB(255,255,255))
            DrawText(x,y,message_text(623,1+language) + ":")
            DrawText(x+170,y,Str(spieler(akt_spieler)\giftlehre))
            If mmouse_x > x-36 And mmouse_x < x+170 And mmouse_y > y And mmouse_y < y+15
               DrawText(30,430,message_text(892,1+language))
               DrawText(30,445,message_text(893,1+language))
            EndIf
            StopDrawing()
            
         EndIf
               
         ; Maennchen anzeigen damit man weiss wer dran ist
         draw_player(310, 395)

         ; exit button
         if over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_EXIT_X, #POS_EXIT_Y)
         
         
         If cinfo_menu = 2
            ; Links Button
            if over_leftbutton
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 0, 31, 31)
            Else
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 1*32, 0, 31, 31)
            EndIf 
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 9*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 550, 350)
         
         
         If cinfo_menu = 1
            ; Rechts Button
            if over_rightbutton
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 63, 0, 31, 31)
            Else
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 0*32, 0, 31, 31)
            EndIf
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 8*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 584, 350)

         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until raus = 1

EndProcedure

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 314
; FirstLine = 314
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
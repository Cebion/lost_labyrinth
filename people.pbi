Procedure lehrer(welcher,act_nr_in_level.w)

   Shared joystick_used, aktion

   sel.w = 1
   raus.w = 0
   lernen.w = 0
   something_changed = 1
	 
   ; Find Room
   resetlist(room_list())
   repeat
	 nextelement(room_list())
   until (room_list()\nr_in_level = act_nr_in_level) and (room_list()\level = spieler(akt_spieler)\level)
   
   init_keyboard_people()
   set_default_auto_repeat()

   If room_list()\only_once[akt_spieler] > 0

      Repeat
         read_joystick()
         read_mouse()
         read_keyboard()
         
         ; #PB_Key_Down
         if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or jay = -1            
            used_keys(1)\wait_release = 1
            sel = 2
         endif
         
         ; #PB_Key_Up
         if (used_keys(2)\pressed And used_keys(2)\wait_release = 0) Or jay = 1
            used_keys(2)\wait_release = 1
            sel = 1
         endif
         
         ; #PB_Key_Escape
         if used_keys(4)\pressed And used_keys(4)\wait_release = 0
            used_keys(4)\wait_release = 1
            raus = 1
         endif
         
         ; #PB_Key_Return
         if used_keys(3)\pressed And used_keys(3)\wait_release = 0
            used_keys(3)\wait_release = 1
            raus = 1
            if sel = 1
               lernen = 1
            else
               lernen = 0
            endif
         endif
         
         If mmouse_x > 90 And mmouse_x < 190 And mmouse_y > 200 And mmouse_y < 220
            over_yes = 1
            If mmouse_links And mmouse_links_wait_release = 0
               mmouse_links_wait_release = 1
               raus = 1
               lernen = 1
            EndIf
         else
            over_yes = 0
         endif
         
         If mmouse_x > 90 And mmouse_x < 190 And mmouse_y > 220 And mmouse_y < 240
            If mmouse_links And mmouse_links_wait_release = 0
               mmouse_links_wait_release = 1
               raus = 1
               lernen = 0
            endif
         endif
         
         If mmouse_rechts And mmouse_rechts_wait_release = 0
            mmouse_rechts_wait_release = 1
            raus = 1
         endif

         if something_changed = 1
            Fenster()
            ClearScreen(RGB(0,0,0))
            
            ; Rahmen zeichnen
            draw_plain_frame(-1)
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(190,25,message_text(202+welcher,1+language))
            
               Select (welcher)
                  Case 1: kosten = 30 * spieler(akt_spieler)\luck_Score
                  Case 2: kosten = 30 * spieler(akt_spieler)\attack
                  Case 3: kosten = 30 * spieler(akt_spieler)\dexterity
                  Case 4: kosten = 30 * spieler(akt_spieler)\strength
                  Case 5: kosten = 30 * (spieler(akt_spieler)\maxlifepoints / spieler(akt_spieler)\lifegain)
                  Case 6: kosten = 5 * spieler(akt_spieler)\maxspeed
                  Case 7: kosten = 30 * spieler(akt_spieler)\perception
                  Case 8: kosten = 30 * (spieler(akt_spieler)\maxmana / spieler(akt_spieler)\managain)
                  Case 9: kosten = 30 * spieler(akt_spieler)\power_score
                  Case 10: kosten = 30 * spieler(akt_spieler)\circle
               EndSelect
               
               If skills(#CE_FEILSCHEN,akt_spieler)\gewaehlt = 1
                  kosten = kosten * 0.75
               EndIf
               
               DrawText(100, 100,message_text(213,1+language) + Str(kosten))
               Select (welcher)
                  Case 1: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\luck_Score))
                  Case 2: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\attack))
                  Case 3: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\dexterity))
                  Case 4: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\strength))
                  Case 5: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\maxlifepoints))
                  Case 6: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\maxspeed))
                  Case 7: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\perception))
                  Case 8: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\maxmana))
                  Case 9: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\power_score))
                  Case 10: DrawText(100, 125,message_text(216,1+language) + "  " + Str(spieler(akt_spieler)\circle))
               EndSelect
               
               DrawText(100,150,message_text(883,1+language) + Str(gold_anzahl()))
               
               if over_yes
                  FrontColor(RGB(150,150,150))
                  Box(90,200,100,20)
                  If sel = 1
                     FrontColor(RGB(1,1,255))  ; Blau
                     DrawText(100, 200,message_text(214,1+language))
                     FrontColor(RGB(255,255,255))  ; Weiss
                     DrawText(100, 220,message_text(416,1+language))
                  Else
                     FrontColor(RGB(255,255,255))  ; Weiss
                     DrawText(100, 200,message_text(214,1+language))
                     FrontColor(RGB(1,1,255))  ; Blau
                     DrawText(100, 220,message_text(416,1+language))
                  EndIf
               else
                  FrontColor(RGB(150,150,150))
                  Box(90,220,100,20)
                  If sel = 1
                     FrontColor(RGB(1,1,255))  ; Blau
                     DrawText(100, 200,message_text(214,1+language))
                     FrontColor(RGB(255,255,255))  ; Weiss
                     DrawText(100, 220,message_text(416,1+language))
                  Else
                     FrontColor(RGB(255,255,255))  ; Weiss
                     DrawText(100, 200,message_text(214,1+language))
                     FrontColor(RGB(1,1,255))  ; Blau
                     DrawText(100, 220,message_text(416,1+language))
                  EndIf
               EndIf
            StopDrawing()
            
            end_screen()
         endif ; something_changed
         delay(#Input_delay)
      Until raus = 1
            
      If lernen = 1
         If gold_anzahl() >= kosten
            gold_verlieren(kosten)
            room_list()\only_once[akt_spieler] = room_list()\only_once[akt_spieler] - 1
            Select (welcher)
               Case 1:  spieler(akt_spieler)\luck_score     = spieler(akt_spieler)\luck_score + 1
               Case 2:  spieler(akt_spieler)\attack         = spieler(akt_spieler)\attack + 1
               Case 3:  spieler(akt_spieler)\dexterity      = spieler(akt_spieler)\dexterity + 1
               Case 4:  spieler(akt_spieler)\strength       = spieler(akt_spieler)\strength + 1
               Case 5:  spieler(akt_spieler)\lifepoints     = spieler(akt_spieler)\lifepoints + 3
                        spieler(akt_spieler)\maxlifepoints  = spieler(akt_spieler)\maxlifepoints + 3
               Case 6:  spieler(akt_spieler)\speed          = spieler(akt_spieler)\speed + 1
                        spieler(akt_spieler)\maxspeed       = spieler(akt_spieler)\maxspeed + 1
               Case 7:  spieler(akt_spieler)\perception     = spieler(akt_spieler)\perception + 1
               Case 8:  spieler(akt_spieler)\mana           = spieler(akt_spieler)\mana + 3
                        spieler(akt_spieler)\maxmana        = spieler(akt_spieler)\maxmana + 3
               Case 9:  spieler(akt_spieler)\power_score    = spieler(akt_spieler)\power_score + 1
               Case 10: spieler(akt_spieler)\circle         = spieler(akt_spieler)\circle + 1
            EndSelect
            message(217,#COLOR_WEISS)
         Else
            message(215,#COLOR_GELB)
            raus = 1
         EndIf
      EndIf
      
   Else ; only_once
      message(232,#COLOR_WEISS)
   EndIf
   aktion = 1

EndProcedure



Procedure gefaehrte(welcher)

Shared  joystick_used, aktion

   sel.w = 1
   raus.w = 0
   anstellen.w = 0
   
   init_keyboard_people()
   set_default_auto_repeat()

   Repeat
      read_joystick()
      read_mouse()
      read_keyboard()
         
      ; #PB_Key_Down
      if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or jay = -1
         used_keys(1)\wait_release = 1
         sel = 2
      endif
      
      ; #PB_Key_Up
      if (used_keys(2)\pressed And used_keys(2)\wait_release = 0) Or jay = 1
         used_keys(2)\wait_release = 1
         sel = 1
      endif
         
      ; #PB_Key_Return
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         raus = 1
         if sel = 1
            anstellen = 1
         else
            anstellen = 0
         endif
      endif
      
      If mmouse_x > #POS_TAVERN_YES_X And mmouse_x < #POS_TAVERN_YES_X + 60 And mmouse_y > #POS_TAVERN_YES_Y And mmouse_y < #POS_TAVERN_YES_Y + 20
         over_yes = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            anstellen = 1
            raus = 1
         EndIf
      else
         over_yes = 0
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            anstellen = 0
            raus = 1
         EndIf
      endif
         
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      endif

      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
      
         draw_plain_frame(-1)
         
         yy = 65
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(190,yy,message_text(273,1+language))
            yy = yy + 15
            DrawText(190,yy,message_text(274,1+language))
         
            Select (welcher)
               Case 1:  cc = #CREATURE_COMPANION1 ; warrior 1
                        kosten = 200
               Case 2:  cc = #CREATURE_COMPANION2
                        kosten = 20
               Case 3:  cc = #CREATURE_COMPANION3 ; thief 1
                        kosten = 200
               Case 4:  cc = #CREATURE_COMPANION4 ; warrior 2
                        kosten = 300
               Case 5:  cc = #CREATURE_COMPANION5 ; thief 2
                        kosten = 300
               Case 6:  cc = #CREATURE_COMPANION6
                        kosten = 40
               Case 7:  cc = #CREATURE_COMPANION7
                        kosten = 45
               Case 8:  cc = #CREATURE_COMPANION8 ; warrior 3 
                        kosten = 400
               Case 9:  cc = #CREATURE_COMPANION9; thief 1
                        kosten = 400
               Case 10: cc = #CREATURE_COMPANION10
                        kosten = 80
            EndSelect
            
            If skills(#CE_FEILSCHEN,akt_spieler)\gewaehlt = 1
               kosten = kosten * 0.75
            EndIf
            
            yy = yy + 25
            DrawText(100, yy,message_text(276,1+language))
            yy = yy + 15
            DrawText(100, yy,message_text(55,1+language) + "  " + Str(creature(cc)\LifePoints))
            yy = yy + 15
            DrawText(100, yy,message_text(52,1+language) + "  " +  Str(creature(cc)\Attack))
            yy = yy + 15
            DrawText(100, yy,message_text(56,1+language) + "  " +  Str(creature(cc)\Speed))
            yy = yy + 15
            DrawText(100, yy,message_text(54,1+language) + "  " +  Str(creature(cc)\Strength))
            yy = yy + 15
            DrawText(100, yy,message_text(53,1+language) + "  " +  Str(creature(cc)\Dexterity))
            yy = yy + 15
            DrawText(100, yy,message_text(57,1+language) + "  " +  Str(creature(cc)\Perception))
            yy = yy + 15
            DrawText(100, yy,message_text(58,1+language) + "  " +  Str(creature(cc)\Luck))
            yy = yy + 15
            DrawText(100, yy,message_text(101,1+language) + "  " +  Str(kosten))
            
            yy = yy + 35
            DrawText(100,yy,message_text(883,1+language) + Str(gold_anzahl()))
            
            if over_yes
               FrontColor(RGB(150,150,150))
               Box(#POS_TAVERN_YES_X,#POS_TAVERN_YES_Y,50,20)
               If sel = 1
                  FrontColor(RGB(1,1,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y,message_text(277,1+language))
                  FrontColor(RGB(255,255,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y + 20,message_text(278,1+language))
               Else
                  FrontColor(RGB(255,255,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y,message_text(277,1+language))
                  FrontColor(RGB(1,1,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y + 20,message_text(278,1+language))
               EndIf
            Else
               FrontColor(RGB(150,150,150))
               Box(#POS_TAVERN_YES_X,#POS_TAVERN_YES_Y+20,50,20)
               If sel =  1
                  FrontColor(RGB(1,1,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y,message_text(277,1+language))
                  FrontColor(RGB(255,255,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y + 20,message_text(278,1+language))
               Else
                  FrontColor(RGB(255,255,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y,message_text(277,1+language))
                  FrontColor(RGB(1,1,255))
                  DrawText(#POS_TAVERN_YES_X, #POS_TAVERN_YES_Y + 20,message_text(278,1+language))
               EndIf
            EndIf
         
         StopDrawing()
         
         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until raus = 1
            
   If anstellen = 1
      If gold_anzahl() >= kosten
         gold_verlieren(kosten)
         get_creature(cc)
         spieler(akt_spieler+1)\character_x = spieler(akt_spieler)\character_x + 1
         spieler(akt_spieler+1)\character_y = spieler(akt_spieler)\character_y + 1
         mit_was.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y)\feld
         setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,mit_was,0,0) 
         message(280,#COLOR_WEISS)
      Else
         message(215,#COLOR_GELB)
      EndIf
   EndIf
   
   aktion = 1

EndProcedure


Procedure helpful_wizard()

Shared joystick_used, aktion

   sel.w = 1
   raus.b = 0
   kill.w = 0
   traps.w = 0
   open.w = 0
   heal.w = 0
   
   init_keyboard_people()
   set_default_auto_repeat()

   Repeat
      read_joystick()
      read_mouse()
      read_keyboard()
         
      ; #PB_Key_Down
      if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or jay = -1
         used_keys(1)\wait_release = 1
         sel = sel + 1
         If sel > 4
            sel = 4
         EndIf
      endif
      
      ; #PB_Key_Up
      if (used_keys(2)\pressed And used_keys(2)\wait_release = 0) Or jay = 1
         used_keys(2)\wait_release = 1
         sel = sel - 1
         If sel < 1
            sel = 1
         EndIf
      endif
      
      ; #PB_Key_Escape
      if (used_keys(4)\pressed And used_keys(4)\wait_release = 0) Or jay = 1
         used_keys(4)\wait_release = 1
         raus = 1
      endif
         
      ; #PB_Key_Return
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         raus = 1
         Select(sel)
            case 1
               kill = 1
            case 2
               traps = 1
            case 3
               open = 1
            case 4
               heal = 1
         EndSelect
      endif
      
      If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 120 And mmouse_y < 140
         over_killmonsters = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
            kill = 1
         EndIf
      else
         over_killmonsters = 0
      endif
      
      If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 140 And mmouse_y < 160
         over_removetraps = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
            traps = 1
         EndIf
      else
         over_removetraps = 0
      endif
      
      If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 160 And mmouse_y < 180
         over_openall = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
            open = 1
         EndIf
      else
         over_openall = 0
      endif
      
      If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 180 And mmouse_y < 200
         over_heal = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
            heal = 1
         EndIf
      else
         over_heal = 0
      endif
         
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         ; Rahmen zeichnen
         draw_plain_frame(-1)

         yy = 65
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(190,yy,message_text(338,1+language))
            yy = yy + 15
            DrawText(190,yy,message_text(339,1+language))
            
            ClipSprite(#SPRITE_TILESET_LABYRINTH, 9*32, 12*32, 32, 32)
            DisplaySprite(#SPRITE_TILESET_LABYRINTH, 50, 70)
            
            ; Kill Monsters
            if over_killmonsters
               FrontColor(RGB(150,150,150))
               Box(40,120,550,20)
               If sel = 1
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 120,message_text(340,1+language))
            Else
               If sel = 1
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 120,message_text(340,1+language))
            EndIf
           
            ; Remove traps
            if over_removetraps
               FrontColor(RGB(150,150,150))
               Box(40,140,550,20)
               If sel = 2
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 140,message_text(341,1+language))
            Else
               If sel = 2
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 140,message_text(341,1+language))
            EndIf
           
            ; Open all
            if over_openall
               FrontColor(RGB(150,150,150))
               Box(40,160,550,20)
               If sel = 3
                  FrontColor(RGB(1,1,255)) ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 160,message_text(342,1+language))
            Else
               If sel = 3
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 160,message_text(342,1+language))
            EndIf
           
            ; Heal
            if over_heal
               FrontColor(RGB(150,150,150))
               Box(40,180,550,20)
               If sel = 4
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 180,message_text(343,1+language))
            Else
               If sel = 4
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 180,message_text(343,1+language))
            EndIf
        
         StopDrawing()
         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until raus = 1
            
   If traps = 1
      mit_was.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y)\feld
      setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,mit_was,0,0) 
      For i = 1 To #MAX_GROESSE
         For j = 1 To #MAX_GROESSE
            If labyrinth(spieler(akt_spieler)\level,i,j)\feld >= #FELD_SPEERFALLE1 And labyrinth(spieler(akt_spieler)\level,i,j)\feld <= #FELD_RUNENFALLE_FLUCH2
               setlaby(i,j,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
            EndIf
         Next
      Next
   elseif kill = 1
      mit_was.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y)\feld
      setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,mit_was,0,0) 
      ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
      While monster_list()\z = spieler(akt_spieler)\level
         remove_monster()
         NextElement(monster_list())
      Wend
      cleanup_monsters()
   elseif open = 1
      mit_was.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y)\feld
      setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,mit_was,0,0) 
      For i = 1 To #MAX_GROESSE
         For j = 1 To #MAX_GROESSE
            If labyrinth(spieler(akt_spieler)\level,i,j)\feld = #FELD_GRUENETRUHE1
               setlaby(i,j,spieler(akt_spieler)\level,#FELD_GRUENETRUHE2,0,0)
            EndIf
            If labyrinth(spieler(akt_spieler)\level,i,j)\feld = #FELD_TUER2
               setlaby(i,j,spieler(akt_spieler)\level,#FELD_TUER1,0,0)
            EndIf
         Next
      Next
   elseif heal = 1
      mit_was.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y)\feld
      setlaby(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,mit_was,0,0) 
      spieler(akt_spieler)\lifepoints = maxlife()
      spieler(akt_spieler)\mana = maxmana()
      spieler(akt_spieler)\fluch = 0
      spieler(akt_spieler)\fluchdauer = 0
      spieler(akt_spieler)\poison = 0
   EndIf
            
   message(344,#COLOR_WEISS)
   
   aktion = 1

EndProcedure


Procedure wounded_hero()

Shared  joystick_used, aktion

   sel.w = 1
   trank2.w = 0
   raus.b = 0
   trank.w = 0
   heilen.w = 0
      
   init_keyboard_people()
   set_default_auto_repeat()

   Repeat
      read_joystick()
      read_mouse()
      read_keyboard()
         
      ; #PB_Key_Down
      if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or jay = -1
         used_keys(1)\wait_release = 1
         sel = sel + 1
         If sel > 3
            sel = 3
         EndIf
      endif
      
      ; #PB_Key_Up
      if (used_keys(2)\pressed And used_keys(2)\wait_release = 0) Or jay = 1
         used_keys(2)\wait_release = 1
         sel = sel - 1
         If sel < 1
            sel = 1
         EndIf
      endif
      
      ; #PB_Key_Escape
      if (used_keys(4)\pressed And used_keys(4)\wait_release = 0) Or jay = 1
         used_keys(4)\wait_release = 1
         raus = 1
      endif
         
      ; #PB_Key_Return
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         raus = 1
         Select(sel)
            case 1
               trank = 1
            case 2
               heilen = 1
            case 3
               raus = 1
         EndSelect
      endif
      
      If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 120 And mmouse_y < 140
         over_healingpotion = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
            trank = 1
         EndIf
      else
         over_healingpotion = 0
      endif
      
      If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 140 And mmouse_y < 160
         over_healothers = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
            heilen = 1
         EndIf
      else
         over_healothers = 0
      endif
      
      If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 160 And mmouse_y < 180
         over_canthelp = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf
      else
         over_canthelp = 0
      endif
      
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         draw_plain_frame(-1)

         yy = 65
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(190,yy,message_text(508,1+language))
            yy = yy + 15
            DrawText(190,yy,message_text(509,1+language))
            
            ClipSprite(#SPRITE_TILESET_LABYRINTH, 2*32, 20*32, 32, 32)
            DisplaySprite(#SPRITE_TILESET_LABYRINTH, 50, 70)
      
            ; Healing Potion
            if over_healingpotion
               FrontColor(RGB(150,150,150))
               Box(40,120,550,20)
               If sel = 1
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 120,message_text(510,1+language))
            Else
               If sel = 1
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 120,message_text(510,1+language))
            EndIf
            
            ; Andere heilen
            if over_healothers
               FrontColor(RGB(150,150,150))
               Box(40,140,550,20)
               If sel = 2
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 140,message_text(511,1+language))
            Else
               If sel = 2
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 140,message_text(511,1+language))
            EndIf
            
            ; Ich kann nicht helfen
            if over_canthelp
               FrontColor(RGB(150,150,150))
               Box(40,160,550,20)
               If sel = 2
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 160,message_text(512,1+language))
            Else
               If sel = 2
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 160,message_text(512,1+language))
            EndIf
            
         StopDrawing()
         
         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until raus = 1
            
   If trank = 1
      For i = 1 To #MAX_RUCKSACK
         If item(inventory(i,akt_spieler)\name)\name[2] = "Schwacher Heiltrank" Or item(inventory(i,akt_spieler)\name)\name[2] = "Starker Heiltrank"
            trank2.w = i
         EndIf
      Next
      If trank2 > 0
         message(514,#COLOR_WEISS)
         message(515,#COLOR_WEISS)
         leeren(trank2)
         setlaby(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y,spieler(akt_spieler)\level, #FELD_WOUNDED_HERO2,0,0)
      Else
         message(517,#COLOR_WEISS)
      EndIf
   EndIf
            
   heilen2 = 0
   If heilen = 1
      If skills(#CE_WEISSE_MAGIE,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\circle >= 7
         heilen2 = 1
      EndIf
      If learned(akt_spieler,#SPELL_ANDERE_HEILEN) & #l_masq
         heilen2 = 1
      EndIf
   EndIf
               
   If heilen2 = 1
      If spieler(akt_spieler)\mana >= 2
         spieler(akt_spieler)\mana = spieler(akt_spieler)\mana - 2
         Sound(#SOUND_HOLY)
         message(514,#COLOR_WEISS)
         message(515,#COLOR_WEISS)
         setlaby(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y,spieler(akt_spieler)\level, #FELD_WOUNDED_HERO2,0,0)
         trank2 = 1
      Else
         message(194,#COLOR_WEISS)
      EndIf
   Else
      message(516,#COLOR_WEISS)
   EndIf
               
   If trank2 > 0
      i = backpackspace()
      If i <= #MAX_RUCKSACK
         was.w = 0
         Select Random(7)
            Case 0: was = #OBJGRAFIK_RING2
            Case 1: was = #OBJGRAFIK_AMULETT1_VIOLETT
            Case 2: was = #OBJGRAFIK_MASKE1
            Case 3: was = #OBJGRAFIK_TOTENKOPFRING
            Case 4: was = #OBJGRAFIK_KRONE2
            Case 5: was = #OBJGRAFIK_ALPTRAEUME
            Case 6: was = #OBJGRAFIK_ZAUBERSCHWERT1
            Case 7: was = #OBJGRAFIK_GOLDENE_AXT
         EndSelect
         in_rucksack(was,1)
         Sound(#SOUND_SUCCESS)
      EndIf
   EndIf
   

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 527
; FirstLine = 525
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
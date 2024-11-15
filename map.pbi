; Routines for maps
; --------------------------------------------------------------------------------------

; player
Procedure update_automap()

      automap(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld[spieler(akt_spieler)\level] = 1
      automap(spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y)\feld[spieler(akt_spieler)\level] = 1
      If spieler(akt_spieler)\character_x > 1
        automap(spieler(akt_spieler)\character_x-1, spieler(akt_spieler)\character_y)\feld[spieler(akt_spieler)\level] = 1
        If spieler(akt_spieler)\character_y > 1
          automap(spieler(akt_spieler)\character_x-1, spieler(akt_spieler)\character_y-1)\feld[spieler(akt_spieler)\level] = 1
        EndIf
        automap(spieler(akt_spieler)\character_x-1, spieler(akt_spieler)\character_y+1)\feld[spieler(akt_spieler)\level] = 1
      EndIf
      automap(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y+1)\feld[spieler(akt_spieler)\level] = 1
      automap(spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y+1)\feld[spieler(akt_spieler)\level] = 1
      If spieler(akt_spieler)\character_y > 1
        automap(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y-1)\feld[spieler(akt_spieler)\level] = 1
        automap(spieler(akt_spieler)\character_x+1, spieler(akt_spieler)\character_y-1)\feld[spieler(akt_spieler)\level] = 1
      EndIf
  
  EndProcedure
  
; --------------------------------------------------------------------------------------
; Prozedur zum Zeichnen von Karten

Procedure show_automap(mode.w = 0)
; 0 standard
; 1 creature (obsolete)
; 2 kartograph
; 3 starsight
; 4 sense earth
; 5 find nexus
; 6 find sanktum
; 7 find exit (talk to animals)

Shared joystick_used, karten_typ

   offset.w = 11
   If mode < 4
      karten_typ = 2
   EndIf
   Select mode
   Case 4:
      karten_typ = 1
   Case 5:
      karten_typ = 3
   Case 6:
      karten_typ = 4
   Case 7:
      karten_typ = 5
   EndSelect
   map_level.w = spieler(akt_spieler)\Level
   get_out.w = 0
   drag_x.w = 0
   drag_y.w = 0
   x_akt.w = spieler(akt_spieler)\character_x - offset
   y_akt.w = spieler(akt_spieler)\character_y - offset
   d_startx = x_akt
   d_starty = y_akt
   
   init_keyboard_map()
   set_default_auto_repeat()

   Repeat
      read_joystick()
      read_mouse()
      read_keyboard()
         
      ; #PB_Key_M
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         get_out = 1
      endif
         
      ; #PB_Key_Escape
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         get_out = 1
      endif
         
      ; #PB_Key_Right
      if used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         x_akt = x_akt + 1
         If x_akt > groesse(map_level) -1
            x_akt = groesse(map_level) -1
         EndIf
      endif
         
      ; #PB_Key_Left
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         x_akt = x_akt - 1
         If x_akt < - 20
            x_akt = - 20
         EndIf
      endif
         
      ; #PB_Key_Up
      if used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
         y_akt = y_akt - 1
         If y_akt < - 20
            y_akt = - 20
         EndIf
      endif
         
      ; #PB_Key_Down
      if used_keys(6)\pressed And used_keys(6)\wait_release = 0
         used_keys(6)\wait_release = 1
         y_akt = y_akt + 1
         If y_akt > groesse(map_level) -1
            y_akt = groesse(map_level) -1
         EndIf
      endif
         
      ; #PB_Key_PageUp
      if used_keys(7)\pressed And used_keys(7)\wait_release = 0
         used_keys(7)\wait_release = 1
         If map_level > 1
            map_level = map_level - 1
            x_akt= groesse(map_level)/2 -offset
            y_akt= groesse(map_level)/2 -offset
         EndIf
      endif
         
      ; #PB_Key_PageDown
      if used_keys(8)\pressed And used_keys(8)\wait_release = 0
         used_keys(8)\wait_release = 1
         If map_level < spieler(akt_spieler)\maxlevel
            map_level = map_level + 1
            x_akt= groesse(map_level)/2 -offset
            y_akt= groesse(map_level)/2 -offset
         EndIf
      endif
      
      If mmouse_x >= #POS_BUTTON_LINKS_X And mmouse_x <= #POS_BUTTON_LINKS_X+32 And mmouse_y >= #POS_BUTTON_LINKS_Y And mmouse_y <= #POS_BUTTON_LINKS_Y + 32
         over_leftbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            x_akt = x_akt - 1
            If x_akt < -20
               x_akt = -20
            EndIf
         EndIf 
      else
         over_leftbutton = 0
      endif
      
      If mmouse_x >= #POS_BUTTON_RECHTS_X And mmouse_x <= #POS_BUTTON_RECHTS_X + 32 And mmouse_y >= #POS_BUTTON_RECHTS_Y And mmouse_y <= #POS_BUTTON_RECHTS_Y + 32
         over_rightbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            x_akt = x_akt + 1
            If x_akt > groesse(map_level) -1
               x_akt = groesse(map_level) -1
            EndIf
         EndIf
      else
         over_rightbutton = 0
      endif
      
      If mmouse_x >= #POS_BUTTON_HOCH_X And mmouse_x <= #POS_BUTTON_HOCH_X + 32 And mmouse_y >= #POS_BUTTON_HOCH_Y And mmouse_y <= #POS_BUTTON_HOCH_Y + 32
         over_upbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            y_akt = y_akt - 1
            If y_akt < -20
               y_akt = -20
            EndIf
         EndIf 
      else
         over_upbutton = 0
      endif
      
      If mmouse_x > #POS_BUTTON_RUNTER_X And mmouse_x < #POS_BUTTON_RUNTER_X + 32 And mmouse_y > #POS_BUTTON_RUNTER_Y And mmouse_y < #POS_BUTTON_RUNTER_Y + 32
         over_downbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            y_akt = y_akt + 1
            If y_akt > groesse(map_level) -1
               y_akt = groesse(map_level) -1
            EndIf
         EndIf
      else
         over_downbutton = 0
      endif
      
      If mmouse_x > #POS_BUTTON_CENTER_X And mmouse_x < #POS_BUTTON_CENTER_X + 32 And mmouse_y > #POS_BUTTON_CENTER_Y And mmouse_y < #POS_BUTTON_CENTER_Y + 32
         over_centerbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            x_akt = spieler(akt_spieler)\character_x - offset
            y_akt = spieler(akt_spieler)\character_y - offset
            map_level.w = spieler(akt_spieler)\Level
         EndIf
      else
         over_centerbutton = 0
      endif
      
      If mmouse_x >= #POS_BUTTON_LEV_HOCH_X And mmouse_x <= #POS_BUTTON_LEV_HOCH_X + 32 And mmouse_y >= #POS_BUTTON_LEV_HOCH_Y And mmouse_y <= #POS_BUTTON_LEV_HOCH_Y + 32
         over_levelupbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If map_level > 1
               map_level = map_level - 1
               x_akt= groesse(map_level)/2 -offset
               y_akt= groesse(map_level)/2 -offset
            EndIf
         EndIf
      else
         over_levelupbutton = 0
      endif
      
      If mmouse_x > #POS_BUTTON_LEV_RUNTER_X And mmouse_x < #POS_BUTTON_LEV_RUNTER_X + 32 And mmouse_y > #POS_BUTTON_LEV_RUNTER_Y And mmouse_y < #POS_BUTTON_LEV_RUNTER_Y + 32
         over_leveldownbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If map_level < spieler(akt_spieler)\maxlevel
               map_level = map_level + 1
               x_akt= groesse(map_level)/2 -offset
               y_akt= groesse(map_level)/2 -offset
            EndIf
         EndIf
      else
         over_leveldownbutton = 0
      endif
      
      If mmouse_x >= #POS_MAP_EXIT_X And mmouse_x <= #POS_MAP_EXIT_X + 32 And mmouse_y >= #POS_MAP_EXIT_Y And mmouse_y <= #POS_MAP_EXIT_Y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            get_out = 1
         EndIf 
      else
         over_exitbutton = 0
      endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         get_out = 1
      EndIf 
      
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))

         For y.b= 1 To 21
            For x.b=1 To 21
               If x_akt+x < 1 Or y_akt+y < 1 Or x_akt+x > groesse(map_level) Or y_akt+y > groesse(map_level)
                  draw_small_tile(mit_was(map_level), x, y, x_offset, y_offset, map_level)
               Else
                  If (automap(x + x_akt, y + y_akt)\feld[map_level] > 0 And mode < 2) Or mode >= 2
                     tile.w = labyrinth(map_level,x + x_akt, y + y_akt)\feld
                     bg.w = inhalt(map_level)
                     If fields(tile)\attri_floor = 1
                        bg = labyrinth(map_level,x + x_akt, y + y_akt)\stat2
                     EndIf
                     draw_small_tile(tile, x, y, x_offset, y_offset, map_level, bg)
                     
                     If mode = 3 ; starsight shows monsters too (no procedure drawing small items exits)
                        welches.w = getmonster(x + x_akt, y + y_akt,map_level)
                        If welches > 0
                           draw_small_monster(monster(welches)\nr, x, y, x_offset, y_offset)
                        EndIf
                     EndIf
                     
                     ; Charactere darstellen
                     For xx = 1 To nr_of_players
                        If x + x_akt = spieler(xx)\character_x And y + y_akt = spieler(xx)\character_y
                           If spieler(xx)\Status = 1 And spieler(xx)\level = map_level                     
                              If spieler(xx)\fluch = #FLUCH_CHICKEN 
                                 ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, spieler(xx)\face*16*2, 1*16-16, 16, 16)
                                 DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x*16+x_offset, y*16+y_offset)
                              ElseIf hater(#SPELL_FLEDERMAUSGESTALT,xx) 
                                 ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, spieler(xx)\face*16*2, 5*16-16, 16, 16)
                                 DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x*16+x_offset, y*16+y_offset)
                              ElseIf hater(#SPELL_WOLFSGESTALT,xx)
                                 ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, spieler(xx)\face*16*2, 3*16-16, 16, 16)
                                 DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x*16+x_offset, y*16+y_offset)
                              ElseIf hater(#SPELL_VOGELGESTALT,xx) 
                                 ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, spieler(xx)\face*16*2, 4*16-16, 16, 16)
                                 DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x*16+x_offset, y*16+y_offset)
                              ElseIf hater(#SPELL_KATZENGESTALT,xx) 
                                 ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, spieler(xx)\face*16*2, 2*16-16, 16, 16)
                                 DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x*16+x_offset, y*16+y_offset)
                              ElseIf hater(#SPELL_DRACHENGESTALT,xx) 
                                 ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, spieler(xx)\face*16*2, 6*16-16, 16, 16)
                                 DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x*16+x_offset, y*16+y_offset) 
                              ; Normales aussehen
                              Else
                                 If spieler(xx)\creature_typ = #CREATURE_DOPPELGANGER Or spieler(xx)\creature_typ = 0 Or spieler(xx)\creature_typ = #CREATURE_COMPANION
                                    ClipSprite(#SPRITE_TILESET_SMALLCHARA, spieler(xx)\face*16*2, spieler(xx)\maennchen*16-16, 16, 16)
                                    DisplayTransparentSprite(#SPRITE_TILESET_SMALLCHARA, x*16+x_offset, y*16+y_offset)
                                 Else
                                    ClipSprite(#SPRITE_TILESET_SMALLMONSTERANIM, spieler(xx)\face*16*2, spieler(xx)\maennchen*16-16, 16, 16)
                                    DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTERANIM, x*16+x_offset, y*16+y_offset)
                                 EndIf
                              EndIf
                              
                           EndIf
                        EndIf
                     Next
                     
                  EndIf ; Auf automap?
               EndIf
            Next
         Next
         
         laby_rahmen()
         show_logo()
         show_varys(1)
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))
         DrawText(#POS_BUTTON_LEV_HOCH_X-10,#POS_BUTTON_LEV_HOCH_Y-17,"Lv." + Str(map_level))
         StopDrawing()

         ; Links
         if over_leftbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_LINKS_X, #POS_BUTTON_LINKS_Y)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 1*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_LINKS_X, #POS_BUTTON_LINKS_Y)
         EndIf
         
         ; Rechts
         if over_rightbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 63, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_RECHTS_X, #POS_BUTTON_RECHTS_Y)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 0*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_RECHTS_X, #POS_BUTTON_RECHTS_Y)
         EndIf
         
         ; Oben
         if over_upbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 6*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_HOCH_X, #POS_BUTTON_HOCH_Y)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 4*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_HOCH_X, #POS_BUTTON_HOCH_Y)
         EndIf
         
         ; Unten
         if over_downbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 7*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_RUNTER_X, #POS_BUTTON_RUNTER_Y)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 5*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_RUNTER_X, #POS_BUTTON_RUNTER_Y)
         EndIf

         If mode < 3 ; no level change for spell generated maps
            ; Level Hoch
            if over_levelupbutton
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 6*32, 0, 32, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_LEV_HOCH_X, #POS_BUTTON_LEV_HOCH_Y)
            Else
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 4*32, 0, 32, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_LEV_HOCH_X, #POS_BUTTON_LEV_HOCH_Y)
            EndIf
            
            ; Level Runter
            if over_leveldownbutton
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 7*32, 0, 32, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_LEV_RUNTER_X, #POS_BUTTON_LEV_RUNTER_Y)
            Else
               ClipSprite(#SPRITE_TILESET_BUTTONS5, 5*32, 0, 32, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_LEV_RUNTER_X, #POS_BUTTON_LEV_RUNTER_Y)
            EndIf
         EndIf ; mode < 3

         ; Center
         if over_centerbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 1*32, 1*32, 29, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_CENTER_X, #POS_BUTTON_CENTER_Y)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 0*32, 1*32, 29, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_CENTER_X, #POS_BUTTON_CENTER_Y)
         EndIf

         ; on map (dragging)
         If mmouse_x > 15 And mmouse_x < 350 And mmouse_y > 15 And mmouse_y < 350
            If mmouse_links
               If drag_x
                  x_akt = d_startx + (drag_x-mmouse_x)/16
                  If x_akt < -20
                     x_akt = -20
                  EndIf
                  If x_akt > groesse(map_level) -1
                     x_akt = groesse(map_level) -1
                  EndIf
                     y_akt = d_starty + (drag_y-mmouse_y)/16
                  If y_akt < -20
                     y_akt = -20
                  EndIf
                  If y_akt > groesse(map_level) -1
                     y_akt = groesse(map_level) -1
                  EndIf
               Else
                  drag_x = mmouse_x
                  drag_y = mmouse_y
                  d_startx = x_akt
                  d_starty = y_akt
               EndIf
            Else
               drag_x = 0
            EndIf
         Else
            drag_x = 0
         EndIf
         

         ; exit button
         if over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_MAP_EXIT_X, #POS_MAP_EXIT_Y)
         
         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until get_out = 1

EndProcedure

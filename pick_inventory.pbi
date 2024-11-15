Procedure select_inventory(nachricht.w)

Shared joystick_used
   
   sel_x.w = 1
   sel_y.w = 1
   sel_x_old.w = sel_x
   sel_y_old.w = sel_y
   something_changed = 1
   
   init_keyboard_selectinventory()
   set_default_auto_repeat()

   Repeat
      read_joystick()
      read_mouse()
      read_keyboard()
         
      ; #PB_Key_Right
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
          sel_x = sel_x + 1
          If sel_x > 8
            sel_x = 8
          EndIf
          If sel_y > 5 And sel_x > 5
             sel_x = 5
          EndIf
      endif
         
      ; #PB_Key_Left
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
          sel_x = sel_x - 1
          If sel_x < 1
            sel_x = 1
          EndIf
      endif
         
      ; #PB_Key_Down
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
          sel_y = sel_y + 1
          If sel_y > 7
             sel_y = 7
          EndIf
          If sel_y > 5 And sel_x > 5
             sel_x = 5
          EndIf
      endif
         
      ; #PB_Key_Up
      if used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
          sel_y = sel_y - 1
          If sel_y < 1
            sel_y = 1
          EndIf
      endif
      
      ; #PB_Key_Return
      if used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
         verkauf = savepos
         gewaehlt = 1
      EndIf
      
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         verkauf = savepos
      EndIf
         
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus_hier = 1
      endif
      
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         draw_plain_frame(-1)

         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,255))  ; Weiss
            ;DrawText(319-(TextWidth(nachricht4(nachricht))/2),40,nachricht4(nachricht)) ;
            DrawText(200+35,40,nachricht4(nachricht))
         StopDrawing()

         ; character icon above inventory items
         draw_player(200,60-35)

         For pos = 1 To 50
            i = ((pos-1) % 8 ) + 1
            j = ((pos-1) / 8 ) + 1
            If pos > 45
               i = pos - 45
               j = 7
            EndIf
            
            cursor_here = 0
            If i = sel_x And j = sel_y And gewaehlt = 0
               cursor_here = 1
               If sel_x_old <> sel_x Or sel_y_old <> sel_y
                  sel_x_old = sel_x
                  sel_y_old = sel_y
                  verkaufobjekt = inventory(pos,akt_spieler)\name
                  savepos = pos
               EndIf
            EndIf
               
            mouse_over = draw_item_inventory(200,60,pos,cursor_here,2)

            If mouse_over
               If mmouse_x_old <> mmouse_x Or mmouse_y_old <> mmouse_y
                  verkaufobjekt = inventory(pos,akt_spieler)\name
                  savepos = pos
               EndIf
            EndIf

         Next
         
         If verkaufobjekt
            describe(savepos,200,290,200,380)
         EndIf

         ; Wurde schon ein Feld angeklickt?
         If verkauf > 0 And inventory(verkauf,akt_spieler)\name <> 0
            raus_hier = 1
         EndIf

         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until raus_hier > 0 Or jb(2) <> 0 Or gewaehlt > 0
   ;print ("verkauf: "+str(verkauf)+"  savepos:"+str(savepos))d_keys(i)\key = saved_pick_keys(i)
   
   ProcedureReturn savepos

EndProcedure


Procedure altar()

   verkauf.w = select_inventory(523)

   If verkauf <> 0
      Sound(#SOUND_HOLY)
      If item(inventory(verkauf,akt_spieler)\name)\einkauf > 40
         un_equip(verkauf)
         leeren(verkauf)
         message(12,#COLOR_GELB)
         aufsteigen2()
         ProcedureReturn 1
      Else
         message(13,#COLOR_GELB)
      EndIf
   EndIf
   ProcedureReturn 0
EndProcedure


Procedure vergiften()

   verkauf.w = select_inventory(452)

   If verkauf <> 0
      ; Waffen und Munition
      If item(inventory(verkauf,akt_spieler)\name)\type = #ITEMTYPE_WEAPON
         If inventory(verkauf,akt_spieler)\status = 0 Or inventory(verkauf,akt_spieler)\status = 1
            inventory(verkauf,akt_spieler)\status = 4
            Sound(#SOUND_SUCCESS)
            message(453,#COLOR_GRUEN)
         Else
            message(455,#COLOR_ROT)
         EndIf
      ElseIf  item(inventory(verkauf,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION
         inventory(verkauf,akt_spieler)\attri5 = 4
      Else
         message(454,#COLOR_ROT)
      EndIf
   EndIf

EndProcedure


Procedure vergolden()

   verkauf.w = select_inventory(104)
   If inventory(verkauf,akt_spieler)\name = #OBJGRAFIK_BEUTEL
      verkauf = 0
   EndIf

   If verkauf <> 0
      gold_stack2()
      un_equip(verkauf)
      leeren(verkauf)
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,1))  ; Gelb
         DrawText(200,400,nachricht6(105,Str(gold_anzahl())))
      StopDrawing()
   EndIf

EndProcedure


Procedure duplizieren()

   verkauf.w = select_inventory(875)

   If inventory(verkauf,akt_spieler)\name = #OBJGRAFIK_SCHRIFTROLLE
      i.w = backpackspace()
      
      If i <= #MAX_RUCKSACK
         inventory(i,akt_spieler)\name   = inventory(verkauf,akt_spieler)\name
         inventory(i,akt_spieler)\anzahl = 0
         inventory(i,akt_spieler)\status = inventory(verkauf,akt_spieler)\status
         inventory(i,akt_spieler)\attri5 = inventory(verkauf,akt_spieler)\attri5
         message(877,#COLOR_GELB)
      Else
         message(428,#COLOR_GELB)
      EndIf
   Else
      message(876,#COLOR_GELB)
   EndIf

EndProcedure


Procedure opfern()

okay.w = 0

   opfern.w = select_inventory(595)

   If item(inventory(opfern,akt_spieler)\name)\einkauf > 40 And inventory(opfern,akt_spieler)\name <>#OBJGRAFIK_ZAUBERRUESTUNG1
      okay = opfern
      un_equip(opfern)
   Else
      message(596,#COLOR_GELB)
   EndIf

   ProcedureReturn okay
   
EndProcedure


Procedure opfern2()

okay.w = 0

   opfern.w = select_inventory(604)

   If item(inventory(opfern,akt_spieler)\name)\type = #ITEMTYPE_EMERALD
      okay = opfern
   Else
      message(605,#COLOR_GELB)
   EndIf

   ProcedureReturn okay
   
EndProcedure


Procedure opfern3()

okay.w = 0

   opfern.w = select_inventory(637)

   If item(inventory(opfern,akt_spieler)\name)\name[2] = "Edelstein Schwarz"
      okay = opfern
   Else
      message(638,#COLOR_GELB)
   EndIf

   ProcedureReturn okay
   
EndProcedure


Procedure opfern4()

okay.w = 0

   opfern.w = select_inventory(954)

   If item(inventory(opfern,akt_spieler)\name)\type = #ITEMTYPE_WEAPON or item(inventory(opfern,akt_spieler)\name)\type = #ITEMTYPE_BOW
      okay = opfern
      un_equip(opfern)
   Else
      message(955,#COLOR_GELB)
   EndIf

   ProcedureReturn okay
   
EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 301
; FirstLine = 287
; Folding = --
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
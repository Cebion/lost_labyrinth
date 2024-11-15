; Proceduren zum Eigenschaften auswaehlen

Global currentSTyp.l
Global SkillRow_offset.l

; -------------------------------------------------------------------------------------


Procedure unlocken(welche.w)

  For i.w = 1 To #ANZ_UNMOEGLICH
    If unmoeglich(i)\name = skills(welche,akt_spieler)\nummer
      For j.w = 0 To #ANZ_PLAYER_SKILLS-1
        If unmoeglich(i)\locked = skills(j,akt_spieler)\nummer
          skills(j,akt_spieler)\gelocked -1
        EndIf
      Next
    EndIf
  Next

EndProcedure


Procedure locken(welche.w)

  ; skills locken
  For iii.w = 1 To #ANZ_UNMOEGLICH
    If unmoeglich(iii)\name = skills(welche,akt_spieler)\nummer
      For jjj.w = 0 To #ANZ_PLAYER_SKILLS-1
        If unmoeglich(iii)\locked = skills(jjj, akt_spieler)\nummer
          skills(jjj, akt_spieler)\gelocked  +1
        EndIf
      Next
    EndIf
  Next

EndProcedure


Procedure waehlen(welche.w,from_template.w = 0)

  If skills(welche,akt_spieler)\nummer ;real skill,not section title?
     If ((welche = #CE_CANNIBAL) Or (welche = #CE_UNDEAD))
         If skills(#CE_AUSGESTOSSEN,akt_spieler)\gewaehlt = 1
            If from_template = 0
               spieler(akt_spieler)\skill_points = spieler(akt_spieler)\skill_points - skills(welche,akt_spieler)\kosten
            EndIf
            skills(welche,akt_spieler)\gewaehlt = 1
            locken(welche)
         EndIf
     Else
         If from_template = 0
            spieler(akt_spieler)\skill_points = spieler(akt_spieler)\skill_points - skills(welche,akt_spieler)\kosten
         EndIf
         skills(welche,akt_spieler)\gewaehlt = 1 ; turn on
         locken(welche)
     EndIf
  EndIf

EndProcedure


Procedure freigeben(welche.w)

   If (welche = #CE_AUSGESTOSSEN)
      If skills(#CE_CANNIBAL,akt_spieler)\gewaehlt = 0 And skills(#CE_UNDEAD,akt_spieler)\gewaehlt = 0
         skills(welche,akt_spieler)\gewaehlt = 0   ; turn off
         spieler(akt_spieler)\skill_points = spieler(akt_spieler)\skill_points + skills(welche,akt_spieler)\kosten
         unlocken(welche)
      EndIf
   Else
      skills(welche,akt_spieler)\gewaehlt = 0   ; turn off
      spieler(akt_spieler)\skill_points = spieler(akt_spieler)\skill_points + skills(welche,akt_spieler)\kosten
      unlocken(welche)
   EndIf
                  
EndProcedure


Procedure preset_template(type.w)
  Select (type)
    Case 0: ;warrior
      waehlen(#CE_DISJUNCT,1)
      waehlen(#CE_KEINE_BASISMAGIE,1)
      waehlen(#CE_GERINGES_MANA,1)
      waehlen(#CE_HEILKUNDE,1)
      waehlen(#CE_KONSTITUTION,1)
      waehlen(#CE_STURMANGRIFF,1)
      waehlen(#CE_FLINKE_ATTACKE,1)
      waehlen(#CE_AUSWEICHEN,1)
      waehlen(#CE_SCHWERTKAMPF,1)
      waehlen(#CE_SPELUNKER,1)
      waehlen(#CE_GEFAHREN_SPUEREN,1)
      waehlen(#CE_UEBERLEBEN,1)
      waehlen(#CE_KAMPFTRAINING,1)
    Case 1: ;thief
      waehlen(#CE_GEWANDTHEIT,1)
      waehlen(#CE_FLINKE_ATTACKE,1)
      waehlen(#CE_NACHTSICHT,1)
      waehlen(#CE_SCHLEICHEN,1)
      waehlen(#CE_DIEBSTAHL,1)
      waehlen(#CE_ASSASSINE,1)
      waehlen(#CE_SCHATZJAEGER,1)
      waehlen(#CE_GLUECK,1)
      waehlen(#CE_HEILKUNDE,1)
      waehlen(#CE_THAUMATURGIE,1)
      waehlen(#CE_HAENDLER,1)
      waehlen(#CE_SCHWACH,1)
      waehlen(#CE_DISJUNCT,1)
      waehlen(#CE_KEINE_BASISMAGIE,1)
      waehlen(#CE_GERINGES_MANA,1)
    Case 2; white mage
      waehlen(#CE_LEYKONTAKT,1)
      waehlen(#CE_MAGIELEHRE,1)
      waehlen(#CE_ZAUBERMACHT,1)
      waehlen(#CE_MANA,1)
      waehlen(#CE_ZAUBERKUNST,1)
      waehlen(#CE_WEISSE_MAGIE,1)
      waehlen(#CE_FEUERMAGIE,1)
      waehlen(#CE_WASSERMAGIE,1)
      waehlen(#CE_DRUIDENMAGIE,1)
      waehlen(#CE_SCROLLORE,1)
      waehlen(#CE_UDJAT,1)
      waehlen(#CE_SCHWACH,1)
      waehlen(#CE_ARM,1)
      waehlen(#CE_AUSGESTOSSEN,1)
      waehlen(#CE_KEINE_BASISMAGIE,1)
    Case 3: ;archer
      waehlen(#CE_KAMPFTRAINING,1)
      waehlen(#CE_KONSTITUTION,1)
      waehlen(#CE_AUSWEICHEN,1)
      waehlen(#CE_BOGENSCHIESSEN,1)
      waehlen(#CE_ZEN_BOGEN,1)
      waehlen(#CE_PFEILMACHER,1)
      waehlen(#CE_ALCHEMIE,1)
      waehlen(#CE_FALLENKUNDE,1)
      waehlen(#CE_WAHRNEHMUNG,1)
      waehlen(#CE_HEILKUNDE,1)
      waehlen(#CE_KURZE_MAGIE,1)
      waehlen(#CE_GERINGES_MANA,1)
      waehlen(#CE_DISJUNCT,1)
    Case 4: ;necromancer
      waehlen(#CE_LEYKONTAKT,1)
      waehlen(#CE_MAGIELEHRE,1)
      waehlen(#CE_ZAUBERMACHT,1)
      waehlen(#CE_MANA,1)
      waehlen(#CE_ZAUBERKUNST,1)
      waehlen(#CE_ALTE_MAGIE,1)
      waehlen(#CE_BLUTMAGIE,1)
      waehlen(#CE_SCHWARZE_MAGIE,1)
      waehlen(#CE_FEUERMAGIE,1)
      waehlen(#CE_ERDMAGIE,1)
      waehlen(#CE_UDJAT,1)
      waehlen(#CE_WEISHEIT,1)
      waehlen(#CE_RINGMEISTERUNG,1)
      waehlen(#CE_SCHWACH,1)
      waehlen(#CE_ARM,1)
      waehlen(#CE_UNAUFMERKSAM,1)
      waehlen(#CE_VERFLUCHT,1)
      waehlen(#CE_GOTTLOS,1)
      waehlen(#CE_AUSGESTOSSEN,1)
      waehlen(#CE_KURZE_MAGIE,1)
  EndSelect

EndProcedure


Procedure lock_unique()

  For i = 1 To #ANZ_SKILLS
     For j = 1 To akt_spieler-1
        If skills(i,j)\unique = 1 And skills(i,j)\gewaehlt = 1
           skills(i,akt_spieler)\gelocked +1
        EndIf
     Next
  Next
  
EndProcedure


Procedure reset_skills()

   For i.w = 1 To #ANZ_SKILLS
      skills(i,akt_spieler)\gewaehlt = 0
      skills(i,akt_spieler)\gelocked = 0
   Next
   spieler(akt_spieler)\skill_points = #ANZ_STARTSKILLS
   lock_unique()
   
EndProcedure


Procedure player_to_template()

   For i.w = #ANZ_SKILLS To 1 Step -1 ;go downward,so that disadvantages go first
      If skills(i,akt_spieler)\nummer
         template_list()\skills[i] = skills(i,akt_spieler)\gewaehlt
      Else
         template_list()\skills[i] = 0
      EndIf
   Next
   
EndProcedure


Procedure template_to_player()

   reset_skills()
   For i.w = #ANZ_SKILLS To 1 Step -1 ;go downward,so that disadvantages go first
      If template_list()\skills[i] And skills(i,akt_spieler)\nummer 
         waehlen(i,1)
         spieler(akt_spieler)\skill_points - skills(i,akt_spieler)\kosten
         ;print(str(akt_spieler)+" : "+skills(i,akt_spieler)\name[1])
      EndIf
   Next
   
EndProcedure


Procedure load_templates()

   sav_act_player.w = akt_spieler
   i.w
   j.w
   tpl_count.w = -1
   LastElement(template_list())
   If ReadFile(2, environment + "/templates.dat")
      If Not Eof(2) ;check for 0 bytes file which should not happen
         header.w = ReadWord(2)
         file_version.w  = ReadWord(2)
         If header = -1 And file_version = #TEMPLATE_VERSION ;check if proper template file format 
            tpl_count = ReadWord(2)
            For j = 1 To tpl_count
               AddElement(template_list())
               For i.w = #ANZ_SKILLS To 1 Step -1 ;go downward,so that disadvantages go first
                  template_list()\skills[i] = ReadWord(2)
               Next
               template_list()\name = ReadString(2)
            Next
         EndIf
      EndIf
      CloseFile(2)
   EndIf
      ;print("load: "+Str(tpl_count)+" templates" )
   If tpl_count = -1
      ;print("load: no (proper) template file found")
      akt_spieler = 0
      reset_skills()
      For i = 1 To 4
        AddElement(template_list())
        player_to_template()
        template_list()\name = message_text(113,1+language)+" "+Str(i)+"*"
      Next
   EndIf
   akt_spieler = sav_act_player
   
EndProcedure


Procedure save_templates()

   i.w
   If CreateFile(2, environment + "/templates.dat")
      WriteWord( 2 , -1 ) ;new stype header
      WriteWord( 2 , #TEMPLATE_VERSION ) ; version number 
      tpl_count.w = CountList(template_list())
      WriteWord( 2 , tpl_count )
      ResetList(template_list())
      While NextElement(template_list())
         For i.w = #ANZ_SKILLS To 1 Step -1  ;go downward,so that disadvantages go first
            WriteWord(2,template_list()\skills[i])
         Next
         WriteStringN(2,template_list()\name)
      Wend
      ;print("save: "+Str(tpl_count)+" templates" )
      CloseFile(2)
   Else
      Print("error creating templates file")
   EndIf
   
EndProcedure


Procedure template_load()

   Shared joystick_used, no_mouse
   
   #slotnum = 22
   raus.w = 0
   i.w
   act_slot.w = 0
   old_slot.w = -1
   first_slot.w = 0 ;template
   firstline.w = 1 ;skills
   ;initialize list of templates
   ClearList(template_list())
   spieler(0)\Mousepointer = spieler(akt_spieler)\Mousepointer
   sav_act_player.w = akt_spieler
   akt_spieler = 0

   ;put the default templates at top of the list
   For i = 0 To 4
      reset_skills()
      AddElement(template_list())
      preset_template(i)
      player_to_template()
      template_list()\name = message_text(588+i,1+language)
   Next
   ;load the variable templates from disc
   load_templates()
   slot_count.w = CountList(template_list())-1
   
   init_keyboard_templateload()
   set_default_auto_repeat()
   
   Repeat
      read_mouse()
      read_keyboard()
      read_joystick()
         
      ; #PB_Key_Escape
      If used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
      EndIf
         
      ; #PB_Key_Return
      If used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         raus = 2
      EndIf
         
      ; #PB_Key_Down
      If used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         act_slot + 1
         If act_slot > slot_count
            act_slot = slot_count
         EndIf
         If act_slot > first_slot + #slotnum
            first_slot+1
         EndIf
      EndIf
         
      ; #PB_Key_Up
      If used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         act_slot - 1
         If act_slot < 0
            act_slot = 0
         EndIf
         If act_slot < first_slot
            first_slot-1
         EndIf
      EndIf
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf 
      
      If mmouse_x >= #POS_TEMPLATES_EXIT_X And mmouse_x <= #POS_TEMPLATES_EXIT_X + 32 And mmouse_y >= #POS_TEMPLATES_EXIT_Y And mmouse_y <= #POS_TEMPLATES_EXIT_Y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf
      Else
         over_exitbutton = 0
      EndIf
      
      If mmouse_x >= #POS_TEMPLATES_OKAY_X And mmouse_x <= #POS_TEMPLATES_OKAY_X + 88 And mmouse_y >= #POS_TEMPLATES_OKAY_Y And mmouse_y <= #POS_TEMPLATES_OKAY_Y + 33
         over_okaybutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 2
         EndIf
      Else
         over_okaybutton = 0
      EndIf
       
      If something_changed = 1
         Fenster()

         ClearScreen(RGB(0,0,0))
         draw_plain_frame()

         ; exit button
         If over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_TEMPLATES_EXIT_X, #POS_TEMPLATES_EXIT_Y)

         ; Okay Button 
         If over_okaybutton
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS2, #POS_TEMPLATES_OKAY_X, #POS_TEMPLATES_OKAY_Y)

         
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))  ; Weiss
         DrawText(320-TextWidth(message_text(902,1+language))/2,25,message_text(902,1+language))

         If act_slot <> old_slot
            SelectElement(template_list(), act_slot)
            template_to_player()
            old_slot = act_slot
            firstline = 1 ;reset list position to 1
         EndIf
         firstline = Draw_skill_list(0,340,70,24,firstline)

         x.w = 70
         y.w = 70
         SelectElement(template_list(), first_slot)
         For i = 0 To min(#slotnum,slot_count)
            If act_slot = first_slot+i
               FrontColor(RGB(100,100,100))   ; gray
               Box(x,y,230,15)
            EndIf
            If mmouse_x >= x And mmouse_x <= x + 150 And mmouse_y >= y And mmouse_y <= y + 14
               FrontColor(RGB(0,0,255))   ; blue
               If mmouse_links = 1
                  act_slot = first_slot+i
               EndIf
            Else
               FrontColor(RGB(255,255,255))   ; white
            EndIf
            If i > 4 And i < 9
               DrawText(x,y,message_text(113,1+language)+" "+Str(i-4)+"*")
            Else
               DrawText(x,y,template_list()\name)
            EndIf
            NextElement(template_list())
            y+15
         Next
         StopDrawing()
         
         end_screen()
      EndIf ; something_changed

      Delay(#Input_delay)
   Until raus > 0

   akt_spieler = sav_act_player
   If raus = 2 ;actually set skills of player now
      SelectElement(template_list(), act_slot)
      template_to_player()
   EndIf
   ClearList(template_list()) ;no longer needed

EndProcedure
; -------------------------------------------------------------------------------------

Procedure template_save()

   Shared joystick_used, no_mouse
   
   #slotnum2 = 20
   raus.w = 0  ; 0= cont. 1=abort  2=accept
   tooltip.w = 0
   firstline.w = 1
   delmode.w = 0
   typemode.w = 0
   cursor.w = 0
   tmp_name.s = ""
   i.w
   first_slot.w = #nr_of_players / 2
   act_slot.w = first_slot
   ;initialize list of templates
   ClearList(template_list())
   ;load the variable templates from disc
   load_templates()

   ;add placeholder for new slot 
   LastElement(template_list())
   AddElement(template_list())
   template_list()\name = message_text(904,1+language)
   template_list()\skills[0] = 999
   ;add placeholder for save & exit 
   LastElement(template_list())
   AddElement(template_list())
   template_list()\name = message_text(905,1+language)
   template_list()\skills[0] = 777

   ;skip first 4 templates,they hold last selection of players 1-4
   slot_count.w = CountList(template_list())-1-(#nr_of_players/2)
   
   init_keyboard_templatesave()
   set_default_auto_repeat()

   Repeat
      read_mouse()
      read_keyboard()
      read_joystick()

      x.w = 340
      y.w = 70
      mouse_over_slot.w = 0
      SelectElement(template_list(), first_slot)
      For i = 0 To min(#slotnum2,slot_count)
         If mmouse_x >= x And mmouse_x <= x + 150 And mmouse_y >= y And mmouse_y <= y + 14
            mouse_over_slot = 1
            If delmode = 1
               If mmouse_links = 1
                  act_slot = first_slot+i
                  If template_list()\skills[0] < 99 ;not a special entry?
                     delmode = 2
                     DeleteElement( template_list() )
                     slot_count - 1
                     first_slot - 1
                     If first_slot < #nr_of_players / 2
                        first_slot = #nr_of_players / 2 
                     EndIf
                  EndIf
               EndIf
            Else
               If mmouse_links = 1 And typemode = 0 And delmode = 0
                  act_slot = first_slot + i
                  If template_list()\skills[0] = 999
                     tmp_name = ""
                  Else
                     tmp_name = template_list()\name
                  EndIf
                  If template_list()\skills[0] = 777
                     raus = 2
                  Else
                     typemode = 1
                  EndIf
               EndIf
            EndIf
         EndIf
         If typemode And act_slot = first_slot + i
            tmp_name_old.s = tmp_name
            tmp_name = keyboard_string(tmp_name,0)
            If tmp_name <> tmp_name_old
               something_changed = 1
            EndIf
            cursor = (cursor + 1) % 32
            If cursor % 16 = 0
               something_changed = 1
            EndIf
         EndIf
         NextElement(template_list())
         y+15
      Next
      
      ; #PB_Key_Delete
      If used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
         delmode = 0
         SelectElement(template_list(), act_slot)
         If template_list()\skills[0] < 99 ;not a special entry?
            DeleteElement( template_list() )
            slot_count -1
            first_slot-1
            If first_slot < #nr_of_players / 2
               first_slot = #nr_of_players / 2
            EndIf
         EndIf
      EndIf
         
      ; #PB_Key_Escape
      If used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         raus = 1
      EndIf
      
      ;only abort name input if in type mode
      If typemode And raus = 1
         typemode = 0
         raus = 0
      EndIf
         
      ; #PB_Key_Return
      If used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         If typemode ;if typing -> done & accept
            raus = 2
         Else ;start typing
            SelectElement(template_list(), act_slot)
            If template_list()\skills[0] = 999 ;empty slot placeholder
               tmp_name = ""
            Else
               tmp_name = template_list()\name
            EndIf
            If template_list()\skills[0] = 777 ;special save & exit slot
               raus = 2  
            Else
               typemode = 1
            EndIf
         EndIf
      EndIf
      
      
      ; #PB_Key_Down
      If used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         act_slot + 1
         If act_slot > slot_count + #nr_of_players / 2
            act_slot = slot_count + #nr_of_players / 2
         EndIf
         If act_slot > first_slot + #slotnum2
            first_slot+1
         EndIf
      EndIf
      
      ; #PB_Key_Up
      If used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         act_slot - 1
         If act_slot < #nr_of_players / 2
            act_slot = #nr_of_players / 2 
         EndIf
         If act_slot < first_slot
            first_slot-1
         EndIf
      EndIf

      
      If mmouse_x >= #POS_TEMPLATES_EXIT_X And mmouse_x <= #POS_TEMPLATES_EXIT_X + 32 And mmouse_y >= #POS_TEMPLATES_EXIT_Y And mmouse_y <= #POS_TEMPLATES_EXIT_Y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0 
            mmouse_links_wait_release = 1
            raus = 1
         EndIf
      Else
         over_exitbutton = 0
      EndIf
      
      If mmouse_x >= #POS_TEMPLATES_OKAY_X And mmouse_x <= #POS_TEMPLATES_OKAY_X + 88 And mmouse_y >= #POS_TEMPLATES_OKAY_Y And mmouse_y <= #POS_TEMPLATES_OKAY_Y + 33
         over_okaybutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 2
         EndIf
      Else
         over_okaybutton = 0
      EndIf
      
      If mmouse_x >= #POS_TEMPLATES_DELETE_X And mmouse_x <= #POS_TEMPLATES_DELETE_X + 45 And mmouse_y >= #POS_TEMPLATES_DELETE_Y And mmouse_y <= #POS_TEMPLATES_DELETE_Y + 29
         over_deletebutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            delmode = 1
         EndIf
      Else
         over_deletebutton = 0
      EndIf
      
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         If delmode And mouse_over_slot = 0 And tooltip <> 976
            delmode = 0 ;clicking on empty space cancels delete mode
         EndIf
      EndIf
      
       If delmode = 2 And mmouse_links = 0
          delmode = 0 ;wait for mouse release after deleting entry with mouse
       EndIf
         
      If something_changed = 1
         Fenster()
         
         ClearScreen(RGB(0,0,0))
         draw_plain_frame()

         tooltip = 0
         ; abort/esc button
         If over_exitbutton
            tooltip = 650
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_TEMPLATES_EXIT_X, #POS_TEMPLATES_EXIT_Y)

         ; Okay Button
         If over_okaybutton
            tooltip = 905
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS2, #POS_TEMPLATES_OKAY_X, #POS_TEMPLATES_OKAY_Y)

         ; delete Button 
         If over_deletebutton
            tooltip = 976
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 1, 1, 45, 29)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 1, 32, 45, 29)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS4, #POS_TEMPLATES_DELETE_X, #POS_TEMPLATES_DELETE_Y)

         
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))  ; Weiss
         DrawText(320-TextWidth(message_text(901,1+language))/2,25,message_text(901,1+language))
         If tooltip
            DrawText(30,430,message_text(tooltip,1+language))
         EndIf

         firstline = Draw_skill_list(akt_spieler,70,70,24,firstline)

         x.w = 340
         y.w = 70
         mouse_over_slot.w = 0
         SelectElement(template_list(), first_slot)
         For i = 0 To min(#slotnum2,slot_count)
            If act_slot = first_slot+i
               FrontColor(RGB(100,100,100))   ; gray
               Box(x,y,230,15)
            EndIf
            If mmouse_x >= x And mmouse_x <= x + 150 And mmouse_y >= y And mmouse_y <= y + 14
               mouse_over_slot = 1
               If delmode = 1
                  FrontColor(RGB(255,0,0))   ; red
               Else
                  FrontColor(RGB(0,0,255))   ; blue
               EndIf
            Else
               FrontColor(RGB(255,255,255))   ; white
            EndIf
            If typemode And act_slot = first_slot+i
               DrawText(x,y,tmp_name)
               If cursor < 16
                  Line(x+TextWidth(tmp_name), y, 0, 15)
               EndIf
            Else
               DrawText(x,y,template_list()\name)
            EndIf
            NextElement(template_list())
            y+15
         Next

         ;take name and actually write skills from player to template list
         If typemode And raus = 2
            typemode = 0
            raus = 0
            SelectElement(template_list(), act_slot)
            template_list()\name = tmp_name
            If template_list()\skills[0] = 999 ;used empty slot placeholder
               template_list()\skills[0] = 0 ;remove any special marking
               ;add placeholder for new empty slot 
               AddElement(template_list())
               template_list()\name = message_text(904,1+language)
               template_list()\skills[0] = 999
               slot_count+1
            EndIf
            SelectElement(template_list(), act_slot)
            player_to_template()
         EndIf
         
         StopDrawing()
         
         If delmode
            end_screen(0,0,0,1)
         Else
            end_screen()
         EndIf
      EndIf ; something_changed

      Delay(#Input_delay)
   Until raus > 0

   If raus = 2 ;actually write template list to disc now
      ;remove special entries
      ResetList(template_list())
      While NextElement(template_list())
         If template_list()\skills[0]>99
            DeleteElement(template_list())
         EndIf
      Wend
      save_templates() ;write to disc
   EndIf
   ClearList(template_list()) ;no longer needed

EndProcedure

; -------------------------------------------------------------------------------------

; Spalte und Zeile enthaelt die aktuelle Mausposition
Procedure draw_skills(spalte, zeile, pos_aktuell, besch)

  Shared skills_menu

  ClearScreen(RGB(0,0,0))
  draw_plain_frame(33)

  wohin = ScreenOutput()
  StartDrawing(wohin)
    DrawingMode(1)
    FrontColor(RGB(255,255,1)); Gelb
    DrawText(170,17, message_text(114,1+language) + Str(akt_spieler/2 +1) + ") :")
  StopDrawing()



  Global Dim SkillTyp_range.l (#ANZ_SEKTIONEN)
  Global Dim SkillTyp_offset.l (#ANZ_SEKTIONEN)


  SkillRow_offset = #ANZ_SEKTIONEN + 4 ; Free space for the menu
  #UpsideDown_offset = #SKILLS_PRO_SPALTE - #ANZ_SEKTIONEN + 4

  SkillTyp_offset(0) = 0  ; Alle anzeigen erste Seite
  SkillTyp_range(0)  = #ANZ_ERSTE_SEITE

  ; Differenzen
  SkillTyp_range(1) = #ANZ_SKILLS_IN_CLASS_1
  SkillTyp_range(2) = #ANZ_SKILLS_IN_CLASS_2
  SkillTyp_range(3) = #ANZ_SKILLS_IN_CLASS_3
  SkillTyp_range(4) = #ANZ_SKILLS_IN_CLASS_4
  SkillTyp_range(5) = #ANZ_SKILLS_IN_CLASS_5
  SkillTyp_range(6) = #ANZ_SKILLS_IN_CLASS_6
  SkillTyp_range(7) = #ANZ_SKILLS_IN_CLASS_7
  SkillTyp_range(8) = #ANZ_SKILLS_IN_CLASS_8
  SkillTyp_range(9) = #ANZ_SKILLS_IN_CLASS_9


  ; Automatische Berechung Anfangsstellen der Skillklassen

  SkillTyp_offset(1) = 0
  SkillTyp_offset(2) = SkillTyp_offset(1) + SkillTyp_range(1) + 1
  SkillTyp_offset(3) = SkillTyp_offset(2) + SkillTyp_range(2) + 1
  SkillTyp_offset(4) = SkillTyp_offset(3) + SkillTyp_range(3) + 1
  SkillTyp_offset(5) = SkillTyp_offset(4) + SkillTyp_range(4) + 1
  SkillTyp_offset(6) = SkillTyp_offset(5) + SkillTyp_range(5) + 1
  SkillTyp_offset(7) = SkillTyp_offset(6) + SkillTyp_range(6) + 1
  SkillTyp_offset(8) = SkillTyp_offset(7) + SkillTyp_range(7) + 1
  SkillTyp_offset(9) = SkillTyp_offset(8) + SkillTyp_range(8) + 1


  ; Male SkillKlassen- Auswahl
  x = 40
  y = 50
  For Shortcut_temp = -1 To #ANZ_SEKTIONEN

    wohin = ScreenOutput()
    StartDrawing(wohin)
      DrawingMode(1)
  
      temp.w = 1
      If Shortcut_temp = 0: welche=0:  FrontColor (RGB(255,255,255)):j_art=1 : EndIf
      If Shortcut_temp = 1: welche=temp:  FrontColor (RGB(255,1,1)):j_art=1 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_1
      If Shortcut_temp = 2: welche=temp:  FrontColor (RGB(138,11,88)):j_art=8 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_2
      If Shortcut_temp = 3: welche=temp: FrontColor (RGB(255,1,255)):j_art=2 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_3
      If Shortcut_temp = 4: welche=temp: FrontColor (RGB(1,1,255)):j_art=4 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_4
      If Shortcut_temp = 5: welche=temp: FrontColor (RGB(1,255,1)):j_art=3 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_5
      If Shortcut_temp = 6: welche=temp: FrontColor (RGB(1,255,255)):j_art=6 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_6
      If Shortcut_temp = 7: welche=temp: FrontColor (RGB(130,115,32)):j_art=7 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_7
      If Shortcut_temp = 8: welche=temp: FrontColor (RGB(150,150,150)):j_art=5 : EndIf
      temp = temp + #ANZ_SKILLS_IN_CLASS_8
      If Shortcut_temp = 9: welche=temp: FrontColor (RGB(97,56,36)):j_art=9 : EndIf
  
      If Shortcut_temp >= 1: welche=SkillTyp_offset(Shortcut_temp): EndIf
  
  
      If Shortcut_temp >= 1
        DrawText(x,y,skills(welche,akt_spieler)\name[1+language])
      EndIf
  
      If Shortcut_temp = 0
        DrawText(x,y,message_text(639,1+language))
      EndIf

      FrontColor(RGB(r,g,b))  ; Reset
    StopDrawing()

    If Shortcut_temp >= 1
      ; Dunklen Juwel malen
      If Shortcut_temp <> currentSTyp
        ClipSprite(#SPRITE_TILESET_JEWELS, j_art * 16 - 16, 1, 15, 15)
        DisplaySprite(#SPRITE_TILESET_JEWELS, x-20, y+2)
      EndIf

      ; Hellen Juwel malen
      If Shortcut_temp = currentSTyp
        ClipSprite(#SPRITE_TILESET_JEWELS, j_art * 16 - 16, 33, 15, 15)
        DisplaySprite(#SPRITE_TILESET_JEWELS, x-20, y+2)
      EndIf
    EndIf

    If Shortcut_temp = 0
      ; Dunklen Juwel malen
      If Shortcut_temp <> currentSTyp
        ClipSprite(#SPRITE_TILESET_JEWELS, 13 * 16 - 16, 1, 15, 15)
        DisplaySprite(#SPRITE_TILESET_JEWELS, x-20, y+2)
      EndIf

      ; Hellen Juwel malen
      If Shortcut_temp = currentSTyp
        ClipSprite(#SPRITE_TILESET_JEWELS, 13 * 16 - 16, 33, 15, 15)
        DisplaySprite(#SPRITE_TILESET_JEWELS, x-20, y+2)
      EndIf
    EndIf

    y = y + 14
  Next
  
  ; Draw all text
  welche = SkillTyp_offset(currentSTyp)
  x = 40
  y = 50
  If currentSTyp=0
    welche = (#SKILL_SPRUNG * (skills_menu-1))
  EndIf
  aktuell = 0
  wohin = ScreenOutput()
  StartDrawing(wohin)
  DrawingMode(1)
  For spalte_temp = 1 To 3
    For zeile_temp = 1 To #SKILLS_PRO_SPALTE

      ; Erspringe Offset der ersten Spalte
      If zeile_temp<SkillRow_offset And spalte_temp=1
        zeile_temp=SkillRow_offset
        y=50 + 14*(SkillRow_offset-1)
        aktuell=SkillRow_offset
      EndIf

      blockshow.w = 0
      which_skill.w = 0

      If besch = 2 ; keyboard used
        If skills(pos_aktuell,akt_spieler)\nummer <> 0 And welche = pos_aktuell
          which_skill = pos_aktuell
          If  skills(welche,akt_spieler)\gelocked > 0 And ( KeyboardPushed(#PB_Key_LeftShift) Or KeyboardPushed(#PB_Key_RightShift) )
            blockshow = 1
          EndIf
        EndIf
      Else           ;mouse used
        If spalte_temp = spalte And zeile_temp = zeile And skills(welche,akt_spieler)\nummer <> 0
          which_skill = welche
          If besch = 3 And skills(welche,akt_spieler)\gelocked > 0
              blockshow = 1
          EndIf
        EndIf
      EndIf

      If which_skill > 0
        FrontColor (RGB(255,255,255))   ; Weiss
        If blockshow ; show skills blocking this one
          scount.w = 0
          line1.s = message_text(884,1+language)
          line2.s = ""
          For iii.w = 1 To #ANZ_UNMOEGLICH
            If unmoeglich(iii)\locked = skills(welche,akt_spieler)\nummer
              If skills(unmoeglich(iii)\name,akt_spieler)\gewaehlt = 1
                Select scount
                  Case 0: line1 = line1+skills(unmoeglich(iii)\name,akt_spieler)\name[1+language]
                  Case 1: line1 = line1+","+skills(unmoeglich(iii)\name,akt_spieler)\name[1+language]
                  Case 2: line1 = line1+","
                           line2 = skills(unmoeglich(iii)\name,akt_spieler)\name[1+language]
                  Default:line2 = line2+","+skills(unmoeglich(iii)\name,akt_spieler)\name[1+language]
                EndSelect
                scount = scount +1
              EndIf
            EndIf
          Next
          If skills(which_skill,akt_spieler)\unique = 1
            For i = 1 To akt_spieler-1
               If skills(which_skill,i)\gewaehlt = 1
                  line1 = message_text(113,1+language)+ " " + Str(i)
               EndIf
            Next
          EndIf
          DrawText(30,430,line1)
          DrawText(30,445,line2)
        Else
          ; show standard skill description
          DrawText(30,430,skills(which_skill,akt_spieler)\beschreibung_1[1+language] + " (" + Str(skills(which_skill,akt_spieler)\kosten) + " CP)")
          act_text.s = skills(which_skill,akt_spieler)\beschreibung_2[1+language]
          If skills(which_skill,akt_spieler)\unique = 1
            act_text = act_text + "  (" + message_text(669,1+language) + "!)"
          EndIf
          DrawText(30,445,act_text)
        EndIf
      EndIf

      If welche > SkillTyp_offset(1)
        ; Rot
        r = 255
        g = 1
        b = 1
      EndIf
      If welche > SkillTyp_offset(2)
        ; Rosa
        r = 138
        g = 11
        b = 88
      EndIf
      If welche > SkillTyp_offset(3)
        ; Lila
        r = 255
        g = 1
        b = 255
      EndIf
      If welche > SkillTyp_offset(4)
        ; Blau
        r = 1
        g = 1
        b = 255
      EndIf
      If welche > SkillTyp_offset(5)
        ; Gruen
        r = 1
        g = 255
        b = 1
      EndIf
      If welche > SkillTyp_offset(6)
        ; Tuerkis
        r = 1
        g = 255
        b = 255
      EndIf
      If welche > SkillTyp_offset(7)
        ; Braun
        r = 130
        g = 115
        b = 32
      EndIf
      If welche > SkillTyp_offset(8)
        ; Grau
        r = 150
        g = 150
        b = 150
      EndIf
      If welche > SkillTyp_offset(9)
        ; Dunkelbraun
        r = 97
        g = 56
        b = 36
      EndIf
      FrontColor (RGB(r,g,b))
      If skills(welche,akt_spieler)\nummer = 0
        FrontColor (RGB(255,255,1))   ; Gelb
      EndIf
      If (spalte_temp = spalte And zeile_temp = zeile) Or welche = pos_aktuell
        FrontColor (RGB(255,255,255))   ; Weiss
        lighting=1
      Else
        lighting=0
      EndIf

      DrawText(x,y,skills(welche,akt_spieler)\name[1+language])
      FrontColor(RGB(r,g,b))  ; Zuruecksetzen

      y = y + 14
      welche = welche + 1
      aktuell = aktuell + 1
      ; Reichweite wird mit Offset verrechnet und bricht Funktion ab
      If welche > #ANZ_PLAYER_SKILLS-1 Or aktuell > SkillTyp_range(currentSTyp) + SkillRow_offset
        Goto raushier_1
      EndIf
    Next
    x = x + 180
    y = 50
  Next
    
  raushier_1:
  StopDrawing()
  
    ; Draw the jewels
  welche = SkillTyp_offset(currentSTyp)
  x = 40
  y = 50
  If currentSTyp=0
    welche = (#SKILL_SPRUNG * (skills_menu-1))
  EndIf
  
  For spalte_temp = 1 To 3
    For zeile_temp = 1 To #SKILLS_PRO_SPALTE

      ; Erspringe Offset der ersten Spalte
      If zeile_temp<SkillRow_offset And spalte_temp=1
        zeile_temp=SkillRow_offset
        y=50 + 14*(SkillRow_offset-1)
        aktuell=SkillRow_offset
      EndIf

      If welche > SkillTyp_offset(1)
        ; Rot
        j_art = 1
      EndIf
      If welche > SkillTyp_offset(2)
        ; Rosa
        j_art = 8
      EndIf
      If welche > SkillTyp_offset(3)
        ; Lila
        j_art = 2
      EndIf
      If welche > SkillTyp_offset(4)
        ; Blau
        j_art = 4
      EndIf
      If welche > SkillTyp_offset(5)
        ; Gruen
        j_art = 3
      EndIf
      If welche > SkillTyp_offset(6)
        ; Tuerkis
        j_art = 6
      EndIf
      If welche > SkillTyp_offset(7)
        ; Braun
        j_art = 7
      EndIf
      If welche > SkillTyp_offset(8)
        ; Grau
        j_art = 5
      EndIf
      If welche > SkillTyp_offset(9)
        ; Dunkelbraun
        j_art = 9
      EndIf

      ; draw blocked skills
      If skills(welche,akt_spieler)\gelocked > 0
        ClipSprite(#SPRITE_TILESET_JEWELS, 9 * 16 , 1, 15, 15)
        DisplayTransparentSprite(#SPRITE_TILESET_JEWELS, x-20, y+2)
      Else
        ; Dunklen Juwel malen
        If skills(welche,akt_spieler)\nummer <> 0 And skills(welche,akt_spieler)\gewaehlt = 0
          ClipSprite(#SPRITE_TILESET_JEWELS, j_art * 16 - 16, 1, 15, 15)
          DisplayTransparentSprite(#SPRITE_TILESET_JEWELS, x-20, y+2)
        EndIf

        ; Hellen Juwel malen
        If skills(welche,akt_spieler)\nummer <> 0 And skills(welche,akt_spieler)\gewaehlt = 1
          ClipSprite(#SPRITE_TILESET_JEWELS, j_art * 16 - 16, 33, 15, 15)
          DisplayTransparentSprite(#SPRITE_TILESET_JEWELS, x-20, y+2)
        EndIf
      EndIf

      y = y + 14
      welche = welche + 1
      aktuell = aktuell + 1
      ; Reichweite wird mit Offset verrechnet und bricht Funktion ab
      If welche > #ANZ_PLAYER_SKILLS-1 Or aktuell > SkillTyp_range(currentSTyp) + SkillRow_offset
        Goto raushier_2
      EndIf
    Next
    x = x + 180
    y = 50
  Next

  raushier_2:
  

EndProcedure

;---------------------------------------------------------------------------------------------
; Prozedur Eigenschaften auswaehlen
Procedure select_skills()

   Shared zeile, spalte, skills_menu, win_mode, klicking, joystick_used, no_mouse

   ok_button = 0
   pos_aktuell.w = 1
   wait_space_release.w = 0

   init_keyboard_skills()
   set_default_auto_repeat()

   lock_unique()
   ReloadKeys = 0
   something_changed = 1 ; enforce drawing screen initially
   Repeat
      read_joystick()
      read_keyboard()
      read_mouse()

      ; #PB_Key_Right
      If used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         besch.w = 2
         If pos_aktuell + #SKILLS_PRO_SPALTE < (Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG) + 1 ) * #SKILLS_PRO_SPALTE + #UpsideDown_offset
            pos_aktuell = pos_aktuell + #SKILLS_PRO_SPALTE
            something_changed = 1
            ReloadKeys = 1
         EndIf
      EndIf

      ; #PB_Key_Left
      If used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         besch = 2
         If pos_aktuell - #SKILLS_PRO_SPALTE >= 0
            pos_aktuell = pos_aktuell - #SKILLS_PRO_SPALTE
            something_changed = 1
            ReloadKeys = 1
         EndIf
      EndIf

      ; #PB_Key_Down
      If used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         besch = 2
         If pos_aktuell + 1 < (Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG) + 1) * #SKILLS_PRO_SPALTE + #UpsideDown_offset
            pos_aktuell = pos_aktuell + 1
            something_changed = 1
            ReloadKeys = 1
         EndIf
      EndIf

      ; #PB_Key_Up
      If used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         besch = 2
         If pos_aktuell > 1
            pos_aktuell = pos_aktuell - 1
            something_changed = 1
            ReloadKeys = 1
         EndIf
      EndIf

      ; #PB_Key_Return
      pressed = 0
      If used_keys(9)\pressed And used_keys(9)\wait_release = 0
         used_keys(9)\wait_release = 1
         something_changed = 1
         pressed = 1
      EndIf

      ; #PB_Key_Space
      If used_keys(10)\pressed And used_keys(10)\wait_release = 0
         used_keys(10)\wait_release = 1
         wait_space_release = 1 ;we wait for release manually as space is used in next screen
      EndIf
      If wait_space_release = 1 And used_keys(10)\wait_release = 0
         raus = 1
      EndIf
      
      ; #PB_Key_D, #PB_Key_X, #PB_Key_E, #PB_Key_R
      For i = 5 To 8
         If used_keys(i)\pressed And used_keys(i)\wait_release = 0
            used_keys(i)\wait_release = 1
            something_changed = 1
            For j = 1 To #ANZ_PLAYER_SKILLS
               skills(j,akt_spieler)\gewaehlt = 0
               skills(j,akt_spieler)\gelocked = 0
            Next
            spieler(akt_spieler)\skill_points = #ANZ_STARTSKILLS
         EndIf
      Next
      
      ; #PB_Key_L  (load from template)  
      If used_keys(11)\pressed And used_keys(11)\wait_release = 0
         used_keys(11)\wait_release = 1
         something_changed = 1
         template_load()
         init_keyboard_skills()
         set_default_auto_repeat()
      EndIf

      ; #PB_Key_S (safe from template)
      If used_keys(12)\pressed And used_keys(12)\wait_release = 0
         used_keys(12)\wait_release = 1
         something_changed = 1
         template_save()
         init_keyboard_skills()
         set_default_auto_repeat()
      EndIf

      If pos_aktuell > #ANZ_PLAYER_SKILLS-1
         pos_aktuell = #ANZ_PLAYER_SKILLS-1
      EndIf

      If ReloadKeys = 1
         If currentSTyp <> 0
            If pos_aktuell < SkillTyp_offset(currentSTyp)
               pos_aktuell = SkillTyp_offset(currentSTyp)
            EndIf

            If pos_aktuell > SkillTyp_offset(currentSTyp) + SkillTyp_range(currentSTyp)
               pos_aktuell = SkillTyp_offset(currentSTyp) + SkillTyp_range(currentSTyp)
            EndIf
         EndIf

         If pos_aktuell > (#SKILLS_PRO_SPALTE * (skills_menu+1)) + 12
            skills_menu = skills_menu + 1
         EndIf
         If pos_aktuell < (#SKILLS_PRO_SPALTE * (skills_menu -1 ))
            skills_menu = skills_menu - 1
         EndIf

         If skills_menu < 1
         skills_menu = 1
         EndIf

         SkillTyp_offset(2) = SkillTyp_offset(1) + SkillTyp_range(1)

         If skills_menu > Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG)
            skills_menu = Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG)
         EndIf
         ReloadKeys = 0
      EndIf

      spalte = 0
      zeile = 0

      If mmouse_x_old <> mmouse_x Or mmouse_y_old <> mmouse_y
         besch = 1
      EndIf

      on_icon.w = 0
      zw_x.w = mmouse_x
      zw_y.w = mmouse_y
      zw_x = zw_x - 20
      zw_y = zw_y - 50
      If zw_x > - 18 + 14 And zw_x < 160  ; spalte 1
         spalte = 1
         If zw_x < - 18 + 38
         on_icon = 1
         EndIf
         zeile = zw_y / 14 + 1      ; zeile berechnen
      EndIf
      If zw_x > 159 +14 And zw_x < 340   ; spalte 2
         spalte = 2
         If zw_x < 159 + 38
         on_icon = 1
         EndIf
         zeile = zw_y / 14 + 1      ; zeile berechnen
      EndIf
      If zw_x > 339 + 14 And zw_x < 470   ; spalte 3
         spalte = 3
         If zw_x < 339 + 38
         on_icon = 1
         EndIf
         zeile = zw_y / 14 + 1      ; zeile berechnen
      EndIf

      If zeile > #SKILLS_PRO_SPALTE
         zeile = #SKILLS_PRO_SPALTE
      EndIf

      If zeile < 1
         zeile = 1
      EndIf

      If spalte > 3
         spalte = 3
      EndIf

      If spalte < 1
         spalte = 1
      EndIf

      ; delete all Button
      If mmouse_x > 485 And mmouse_x < 500 And mmouse_y > 410 And mmouse_y < 425
         If mmouse_links_wait_release = 0 And mmouse_links
            Sound(#SOUND_SELECT)
            reset_skills()
         Else
            mouse_over_deleteall=1
         EndIf
      Else
         mouse_over_deleteall=0
      EndIf
      
      If mmouse_x > 529 And mmouse_x < 616 And mmouse_y > 389 And mmouse_y < 419
         over_okaybutton = 1
         If mmouse_links_wait_release = 0 And mmouse_links
            ok_button = 1
         EndIf
      Else
         over_okaybutton = 0
      EndIf
      
      If mmouse_x > 529 And mmouse_x < 616 And mmouse_y > 419 And mmouse_y < 449
         over_backbutton = 1
         If mmouse_links_wait_release = 0 And mmouse_links
            back_button = 1
         EndIf
      Else
         over_backbutton = 0
      EndIf
      
      If mmouse_x > 550 And mmouse_x < 582 And mmouse_y > 350 And mmouse_y < 382
         over_linksbutton = 1
         If mmouse_links_wait_release = 0 And mmouse_links
            If skills_menu > 1
               skills_menu - 1
            EndIf
            If skills_menu < 1
               skills_menu = 1
            EndIf
         EndIf
      Else
         over_linksbutton = 0
      EndIf
      
      If mmouse_x > 584 And mmouse_x < 616 And mmouse_y > 350 And mmouse_y < 382
         over_rechtsbutton = 1
         If mmouse_links_wait_release = 0 And mmouse_links
            If skills_menu < Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG)
               skills_menu + 1
            EndIf
            If skills_menu > Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG)
               skills_menu = Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG)
            EndIf
         EndIf
      Else
         over_rechtsbutton = 0
      EndIf
      
      If mmouse_x >= #load_tpl_x And mmouse_x <= #load_tpl_x+45 And mmouse_y >= #load_tpl_y And mmouse_y <= #load_tpl_y+29
         over_loadtemplate = 1
         If mmouse_links_wait_release = 0 And mmouse_links
            template_load()
            init_keyboard_skills()
         EndIf
      Else
         over_loadtemplate = 0
      EndIf
      
      If mmouse_x >= #sav_tpl_x And mmouse_x <= #sav_tpl_x+45 And mmouse_y >= #sav_tpl_y And mmouse_y <= #sav_tpl_y+29
         over_savetemplate = 1
         If mmouse_links_wait_release = 0 And mmouse_links
            template_save()
            init_keyboard_skills()
         EndIf
      Else
         over_savetemplate = 0
      EndIf



      If (mmouse_links And mmouse_links_wait_release = 0) Or pressed = 1
         mmouse_links_wait_release = 1

         ; Skillnr berechnen
         If pressed = 1
            zw_skill.w = pos_aktuell
         Else
            zw_skill.w = zeile + SkillTyp_offset(currentSTyp) + spalte * #SKILLS_PRO_SPALTE - #SKILLS_PRO_SPALTE - SkillRow_offset
         EndIf

         ; No reaction outside of reaction area 1
         If zw_skill < SkillTyp_offset(currentSTyp) And pressed = 0
            zw_skill = 0
            If zeile <= #ANZ_SEKTIONEN+2 And spalte = 1
               currentSTyp = zeile - 2
            EndIf ; Menu reaction
            If currentSTyp>0
               pos_aktuell = SkillTyp_offset(currentSTyp-1)
            EndIf

            If zeile = 1 And spalte = 1: currentSTyp = 0: EndIf
         EndIf

         ; Second no reaction area
         If zw_skill > SkillTyp_offset(currentSTyp) + SkillTyp_range(currentSTyp) And pressed = 0
            zw_skill = 0
         EndIf

         If currentSTyp = 0 And pressed = 0
            zw_skill = zw_skill + (#SKILL_SPRUNG * (skills_menu-1))
         EndIf

         If zw_skill > #ANZ_PLAYER_SKILLS
            zw_skill = 0
         EndIf

         If mmouse_x > 20 And mmouse_y > 50 And mmouse_x < 400 And mmouse_y < 430
            mouse_over_skills=1
         Else
            mouse_over_skills=0
         EndIf
         If mmouse_x > 20 And mmouse_y > 50 And mmouse_x < 570 And mmouse_y < 400
            mouse_over_skills=1
         EndIf
         If mmouse_x > 550  And mmouse_y > 350
            mouse_over_skills=0
         EndIf
         If mmouse_x < 200  And mmouse_y < 50+14*#ANZ_SEKTIONEN
            mouse_over_skills=0
         EndIf

         If mouse_over_skills Or pressed = 1
            If spieler(akt_spieler)\skill_points > 0
               If klicking = 1
                  Sound(#SOUND_SELECT)
               EndIf
            EndIf

            If skills(zw_skill,akt_spieler)\kosten < 0    ; Nachteil ?
               If skills(zw_skill,akt_spieler)\gewaehlt = 0
                  If skills(zw_skill,akt_spieler)\gelocked = 0
                     If ((mmouse_x < 571 And mmouse_y < 529) Or (mmouse_x < 571 And mmouse_y < 350)) Or pressed = 1
                        waehlen(zw_skill)
                     EndIf
                  EndIf
               Else
                  If spieler(akt_spieler)\skill_points > -skills(zw_skill,akt_spieler)\kosten-1
                     If ((mmouse_x < 571 And mmouse_y < 529) Or (mmouse_x < 571 And mmouse_y < 350)) Or pressed = 1
                        freigeben(zw_skill)
                     EndIf
                  EndIf
               EndIf
               Else    ; Skill!
               If skills(zw_skill,akt_spieler)\gewaehlt = 0
                  If skills(zw_skill,akt_spieler)\gelocked = 0
                     If spieler(akt_spieler)\skill_points > (-1 + skills(zw_skill,akt_spieler)\kosten)
                     If ((mmouse_x < 571 And mmouse_y < 529) Or (mmouse_x < 571 And mmouse_y < 350)) Or pressed = 1
                        waehlen(zw_skill)
                     EndIf
                     EndIf
                  EndIf
               Else
                  If skills(zw_skill,akt_spieler)\gelocked = 0
                     If ((mmouse_x < 571 And mmouse_y < 529) Or (mmouse_x < 571 And mmouse_y < 350)) Or pressed = 1
                        freigeben(zw_skill)
                     EndIf
                  EndIf
               EndIf
            EndIf   ; skill
         EndIf ; warten
      EndIf

      ; mouse is over jewel
      If on_icon = 1 And besch = 1
         besch = 3
      EndIf

      If something_changed = 1
         Fenster()
         draw_skills(spalte, zeile, pos_aktuell, besch)

         ; Gelockte Skills Punkte freigeben
         For i = 0 To #ANZ_SKILLS - 1
            If skills(i,akt_spieler)\gelocked = 1 And skills(i,akt_spieler)\gewaehlt = 1
            skills(i,akt_spieler)\gewaehlt = 0
            spieler(akt_spieler)\skill_points = spieler(akt_spieler)\skill_points + skills(i,akt_spieler)\kosten
            EndIf
         Next

         ; Restliche Punkte darstellen
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
            FrontColor(RGB(255,255,1) ) ; Gelb
            DrawText(400,410,message_text(93,1+language) + ": " + Str(spieler(akt_spieler)\skill_points))
            If mouse_over_deleteall
               DrawText(30,445,message_text(#nachrichten_tooltips,1+language),$ffffff)
            EndIf
         StopDrawing()


         ; Skill delete Button
         If mouse_over_deleteall = 0
            ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 32, 32, 14, 14)
            DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, 485,410)
         Else
            ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 16*9, 16*3, 14, 14)
            DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, 485,410)
         EndIf

         ; Okay Button darstellen
         If over_okaybutton = 1
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               DrawText(30,445,message_text(#nachrichten_tooltips+7,1+language),$ffffff)
            StopDrawing()
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS2, 530, 390)



         ; Back Button darstellen
         If over_backbutton = 1
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)
            DrawText(30,445,message_text(#nachrichten_tooltips+6,1+language),$ffffff)
            StopDrawing()
            ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS3, 530, 420)



         ; Links Button
         If over_linksbutton = 1
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 1*32, 0, 31, 31)
         EndIf

         If skills_menu <= 1
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 9*32, 0, 31, 31)
         EndIf

         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 550, 350)


         ; Rechts Button
         If over_rechtsbutton = 1
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 63, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 0*32, 0, 31, 31)
         EndIf

         If skills_menu >= Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG)
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 8*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, 584, 350)


         ; Show Page
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))  ; Weiss

         DrawText(572,334,Str(skills_menu) + "/" + Str(Int(#ANZ_PLAYER_SKILLS/#SKILL_SPRUNG)))
         StopDrawing()


         ; load template button
         If over_loadtemplate = 1
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               DrawText(30,445,message_text(#nachrichten_tooltips+2,1+language),$ffffff)
            StopDrawing()
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 48, 63, 45, 29)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 48, 94, 45, 29)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS4, #load_tpl_x, #load_tpl_y)

         ; Save template button
         If over_savetemplate = 1
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               DrawText(30,445,message_text(#nachrichten_tooltips+1,1+language),$ffffff)
            StopDrawing()
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 48,  1, 45, 29)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS4, 48, 32, 45, 29)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS4, #sav_tpl_x, #sav_tpl_y)

         
         end_screen()
      EndIf ; something_changed
      Delay(#Input_delay)

   Until ok_button = 1 Or back_button = 1 Or raus = 1

   If back_button = 1
      Goto again
   EndIf

EndProcedure
; IDE Options = PureBasic v3.94 (Windows - x86)
; Executable = laby.exe
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 763
; FirstLine = 725
; Folding = ---
; Markers = 965,1156
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; DisableDebugger
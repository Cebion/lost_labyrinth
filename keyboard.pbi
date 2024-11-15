
Procedure clear_used_keys()

   For i = 1 To #nr_maxkeys
      used_keys(i)\key           = 0
      used_keys(i)\pressed       = 0
      used_keys(i)\pressed_old   = 0
      used_keys(i)\auto_repeat   = 0
      used_keys(i)\wait_release  = 1 ; always wait for release initially 
   Next
   mmouse_links_wait_release = 1  ;set wait release for mouse buttons too
   mmouse_rechts_wait_release = 1
   
EndProcedure

;---------------------------------------------------------------------------------

Procedure set_default_auto_repeat()

   For i = 1 To #nr_maxkeys
      If used_keys(i)\key = #PB_Key_Up Or used_keys(i)\key = #PB_Key_Down Or used_keys(i)\key = #PB_Key_Left Or used_keys(i)\key = #PB_Key_Right  Or used_keys(i)\key = #PB_Key_PageUp  Or used_keys(i)\key = #PB_Key_PageDown
         used_keys(i)\auto_repeat   = 1
      EndIf
   Next

EndProcedure

;---------------------------------------------------------------------------------

Procedure read_keyboard()

   ExamineKeyboard()
   
   For i = 1 To #nr_maxkeys
      If used_keys(i)\key <> 0
         used_keys(i)\pressed = KeyboardPushed(used_keys(i)\key)
   
         If key_repeat_counter > 0 And used_keys(i)\wait_release And used_keys(i)\auto_repeat
            key_repeat_counter - 1
         EndIf 
         
         If used_keys(i)\wait_release And ( used_keys(i)\pressed = 0 Or key_repeat_counter < 1 )
            used_keys(i)\wait_release = 0
            key_repeat_counter = key_repeat_time
            something_changed = 1
         EndIf
         
         If used_keys(i)\pressed <> used_keys(i)\pressed_old
            something_changed = 1
            key_repeat_counter = first_key_repeat_time
         EndIf
      EndIf
   Next
    
EndProcedure

;---------------------------------------------------------------------------------

Procedure init_keyboard_main()

   clear_used_keys()
   used_keys(1)\key   = #PB_Key_Right
   used_keys(2)\key   = #PB_Key_Left
   used_keys(3)\key   = #PB_Key_Up
   used_keys(4)\key   = #PB_Key_Down
   used_keys(5)\key   = #PB_Key_H
   used_keys(6)\key   = #PB_Key_L
   used_keys(7)\key   = #PB_Key_S
   used_keys(8)\key   = #PB_Key_K
   used_keys(9)\key   = #PB_Key_G
   used_keys(10)\key  = #PB_Key_I
   used_keys(11)\key  = #PB_Key_R
   used_keys(12)\key  = #PB_Key_B
   used_keys(13)\key  = #PB_Key_D
   used_keys(14)\key  = #PB_Key_F
   used_keys(15)\key  = #PB_Key_Z
   used_keys(16)\key  = #PB_Key_Y
   used_keys(17)\key  = #PB_Key_C
   used_keys(18)\key  = #PB_Key_O
   used_keys(19)\key  = #PB_Key_X
   used_keys(20)\key  = #PB_Key_M
   used_keys(21)\key  = #PB_Key_Q
   used_keys(22)\key  = #PB_Key_A
   used_keys(23)\key  = #PB_Key_Space
   used_keys(24)\key  = #PB_Key_1
   used_keys(25)\key  = #PB_Key_2
   used_keys(26)\key  = #PB_Key_3
   used_keys(27)\key  = #PB_Key_4
   used_keys(28)\key  = #PB_Key_5
   used_keys(29)\key  = #PB_Key_6
   used_keys(30)\key  = #PB_Key_7
   used_keys(31)\key  = #PB_Key_8
   used_keys(32)\key  = #PB_Key_9
   used_keys(33)\key  = #PB_Key_0
   used_keys(34)\key  = #PB_Key_F1
   used_keys(35)\key  = #PB_Key_F2
   used_keys(36)\key  = #PB_Key_F3
   used_keys(37)\key  = #PB_Key_F4
   used_keys(38)\key  = #PB_Key_F5
   used_keys(39)\key  = #PB_Key_F6
   used_keys(40)\key  = #PB_Key_F7
   used_keys(41)\key  = #PB_Key_F8
   used_keys(42)\key  = #PB_Key_F9
   used_keys(43)\key  = #PB_Key_F10
   used_keys(44)\key  = #PB_Key_Escape

EndProcedure


Procedure init_keyboard_title()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_S
   used_keys(2)\key  = #PB_Key_L
   used_keys(3)\key  = #PB_Key_F1
   used_keys(4)\key  = #PB_Key_H
   used_keys(5)\key  = #PB_Key_C
   used_keys(6)\key  = #PB_Key_F9
   used_keys(7)\key  = #PB_Key_Q
   used_keys(8)\key  = #PB_Key_Right
   used_keys(9)\key  = #PB_Key_Left
   used_keys(10)\key = #PB_Key_Return
   used_keys(11)\key = #PB_Key_Down
   used_keys(12)\key = #PB_Key_Up
   
EndProcedure


Procedure init_keyboard_loading_saving()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Up
   used_keys(2)\key  = #PB_Key_Down
   used_keys(3)\key  = #PB_Key_Return
   used_keys(4)\key  = #PB_Key_Escape
   set_default_auto_repeat()
EndProcedure


Procedure init_keyboard_options()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Down
   used_keys(2)\key  = #PB_Key_Up
   used_keys(3)\key  = #PB_Key_Return
   used_keys(4)\key  = #PB_Key_Space
   used_keys(5)\key  = #PB_Key_Escape
   set_default_auto_repeat()
EndProcedure


Procedure init_keyboard_special_level()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Escape
   used_keys(2)\key  = #PB_Key_Return
   used_keys(3)\key  = #PB_Key_Space
   
EndProcedure


Procedure init_keyboard_return()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Return
   
EndProcedure


Procedure init_keyboard_skills()

   clear_used_keys()
   used_keys(1)\key   = #PB_Key_Right
   used_keys(2)\key   = #PB_Key_Left
   used_keys(3)\key   = #PB_Key_Up
   used_keys(4)\key   = #PB_Key_Down
   used_keys(5)\key   = #PB_Key_D
   used_keys(6)\key   = #PB_Key_X
   used_keys(7)\key   = #PB_Key_E
   used_keys(8)\key   = #PB_Key_R
   used_keys(9)\key   = #PB_Key_Return
   used_keys(10)\key  = #PB_Key_Space
   used_keys(11)\key  = #PB_Key_L
   used_keys(12)\key  = #PB_Key_S
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_trader()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Return
   used_keys(2)\key  = #PB_Key_Right
   used_keys(3)\key  = #PB_Key_Left
   used_keys(4)\key  = #PB_Key_Down
   used_keys(5)\key  = #PB_Key_Up
   used_keys(6)\key  = #PB_Key_Escape
   used_keys(7)\key  = #PB_Key_Space
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_cast()

   clear_used_keys()
   used_keys(1)\key   = #PB_Key_S
   used_keys(2)\key   = #PB_Key_Down
   used_keys(3)\key   = #PB_Key_Up
   used_keys(4)\key   = #PB_Key_PageDown
   used_keys(5)\key   = #PB_Key_PageUp
   used_keys(6)\key   = #PB_Key_F1
   used_keys(7)\key   = #PB_Key_F2
   used_keys(8)\key   = #PB_Key_F3
   used_keys(9)\key   = #PB_Key_F4
   used_keys(10)\key  = #PB_Key_F5
   used_keys(11)\key  = #PB_Key_F6
   used_keys(12)\key  = #PB_Key_F7
   used_keys(13)\key  = #PB_Key_F8
   used_keys(14)\key  = #PB_Key_F9
   used_keys(15)\key  = #PB_Key_F10
   used_keys(16)\key  = #PB_Key_F11
   used_keys(17)\key  = #PB_Key_F12
   used_keys(18)\key  = #PB_Key_F
   used_keys(19)\key  = #PB_Key_1
   used_keys(20)\key  = #PB_Key_2
   used_keys(21)\key  = #PB_Key_3
   used_keys(22)\key  = #PB_Key_4
   used_keys(23)\key  = #PB_Key_5
   used_keys(24)\key  = #PB_Key_6
   used_keys(25)\key  = #PB_Key_7
   used_keys(26)\key  = #PB_Key_8
   used_keys(27)\key  = #PB_Key_9
   used_keys(28)\key  = #PB_Key_0
   used_keys(29)\key  = #PB_Key_Return
   used_keys(30)\key  = #PB_Key_Escape
   used_keys(31)\key  = #PB_Key_Pad1
   used_keys(32)\key  = #PB_Key_Pad2
   used_keys(33)\key  = #PB_Key_Pad3
   used_keys(34)\key  = #PB_Key_Pad4
   used_keys(35)\key  = #PB_Key_Pad5
   used_keys(36)\key  = #PB_Key_Pad6
   used_keys(37)\key  = #PB_Key_Pad7
   used_keys(38)\key  = #PB_Key_Pad8
   used_keys(39)\key  = #PB_Key_Pad9
   used_keys(40)\key  = #PB_Key_Add
   used_keys(41)\key  = #PB_Key_Subtract
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_experience()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Down
   used_keys(2)\key  = #PB_Key_Up
   used_keys(3)\key  = #PB_Key_Return
   used_keys(4)\key  = #PB_Key_Space
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_messages()

   clear_used_keys()
   used_keys(1)\key   = #PB_Key_Escape
   used_keys(2)\key   = #PB_Key_Q
   used_keys(2)\wait_release   = 1
   
EndProcedure


Procedure init_keyboard_freemagic()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Down
   used_keys(2)\key  = #PB_Key_Up
   used_keys(3)\key  = #PB_Key_Return
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_selectfield()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Space
   used_keys(2)\key  = #PB_Key_Return
   used_keys(3)\key  = #PB_Key_F
   used_keys(4)\key  = #PB_Key_A
   used_keys(5)\key  = #PB_Key_L
   used_keys(6)\key  = #PB_Key_Escape
   used_keys(7)\key  = #PB_Key_Up
   used_keys(8)\key  = #PB_Key_Down
   used_keys(9)\key  = #PB_Key_Left
   used_keys(10)\key = #PB_Key_Right
   used_keys(11)\key = #PB_Key_0
   used_keys(12)\key = #PB_Key_1
   used_keys(13)\key = #PB_Key_2
   used_keys(14)\key = #PB_Key_3
   used_keys(15)\key = #PB_Key_4
   used_keys(16)\key = #PB_Key_5
   used_keys(17)\key = #PB_Key_6
   used_keys(18)\key = #PB_Key_7
   used_keys(19)\key = #PB_Key_8
   used_keys(20)\key = #PB_Key_9
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_map()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Escape
   used_keys(2)\key  = #PB_Key_M
   used_keys(3)\key  = #PB_Key_Left
   used_keys(4)\key  = #PB_Key_Right
   used_keys(5)\key  = #PB_Key_Up
   used_keys(6)\key  = #PB_Key_Down
   used_keys(7)\key  = #PB_Key_PageUp
   used_keys(8)\key  = #PB_Key_PageDown
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_okaybox()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Y
   used_keys(2)\key  = #PB_Key_Z
   used_keys(3)\key  = #PB_Key_N
   
EndProcedure


Procedure init_keyboard_inventory()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_I
   used_keys(1)\wait_release  = 1
   used_keys(2)\key  = #PB_Key_Escape
   used_keys(3)\key  = #PB_Key_Up
   used_keys(4)\key  = #PB_Key_Down
   used_keys(5)\key  = #PB_Key_Right
   used_keys(6)\key  = #PB_Key_Left
   used_keys(7)\key  = #PB_Key_Space
   used_keys(8)\key  = #PB_Key_Return
   used_keys(9)\key  = #PB_Key_F1
   used_keys(10)\key = #PB_Key_F2
   used_keys(11)\key = #PB_Key_F3
   used_keys(12)\key = #PB_Key_F4
   used_keys(13)\key = #PB_Key_F5
   used_keys(14)\key = #PB_Key_F6
   used_keys(15)\key = #PB_Key_F7
   used_keys(16)\key = #PB_Key_F8
   used_keys(17)\key = #PB_Key_F9
   used_keys(18)\key = #PB_Key_F10
   used_keys(19)\key = #PB_Key_F11
   used_keys(20)\key = #PB_Key_F12
   used_keys(21)\key = #PB_Key_1
   used_keys(22)\key = #PB_Key_2
   used_keys(23)\key = #PB_Key_3
   used_keys(24)\key = #PB_Key_4
   used_keys(25)\key = #PB_Key_5
   used_keys(26)\key = #PB_Key_6
   used_keys(27)\key = #PB_Key_7
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_playername()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Escape
   used_keys(2)\key  = #PB_Key_Return
   
EndProcedure


Procedure init_keyboard_nr_of_players()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_1
   used_keys(2)\key  = #PB_Key_2
   used_keys(3)\key  = #PB_Key_3
   used_keys(4)\key  = #PB_Key_4
   
EndProcedure


Procedure init_keyboard_cinfo()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Escape
   used_keys(2)\key  = #PB_Key_D
   used_keys(3)\key  = #PB_Key_Right
   used_keys(4)\key  = #PB_Key_Left
   
EndProcedure


Procedure init_keyboard_credits()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Escape
   used_keys(2)\key  = #PB_Key_Space
   used_keys(3)\key  = #PB_Key_Return
   
EndProcedure


Procedure init_keyboard_display()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Down
   used_keys(2)\key  = #PB_Key_Up
   used_keys(3)\key  = #PB_Key_PageDown
   used_keys(4)\key  = #PB_Key_PageUp
   used_keys(5)\key  = #PB_Key_Escape
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_help()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Down
   used_keys(2)\key  = #PB_Key_Up
   used_keys(3)\key  = #PB_Key_PageDown
   used_keys(4)\key  = #PB_Key_PageUp
   used_keys(5)\key  = #PB_Key_Escape
   used_keys(6)\key  = #PB_Key_1
   used_keys(7)\key  = #PB_Key_2
   used_keys(8)\key  = #PB_Key_3
   used_keys(9)\key  = #PB_Key_W
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_upload()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Y
   used_keys(2)\key  = #PB_Key_Z
   used_keys(3)\key  = #PB_Key_N
   
EndProcedure


Procedure init_keyboard_showhighscore()

   clear_used_keys()
   used_keys(1)\key   = #PB_Key_Escape
   used_keys(2)\key   = #PB_Key_Return
   used_keys(3)\key   = #PB_Key_Space
   used_keys(4)\key   = #PB_Key_Down
   used_keys(5)\key   = #PB_Key_Up
   used_keys(6)\key   = #PB_Key_X
   used_keys(7)\key   = #PB_Key_1
   used_keys(8)\key   = #PB_Key_2
   used_keys(9)\key   = #PB_Key_3
   used_keys(10)\key  = #PB_Key_4
   used_keys(11)\key  = #PB_Key_Left
   used_keys(12)\key  = #PB_Key_Right
   
EndProcedure


Procedure init_keyboard_monsterlore()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Return
   used_keys(2)\key  = #PB_Key_Space
   used_keys(3)\key  = #PB_Key_L
   used_keys(4)\key  = #PB_Key_Escape
   
EndProcedure


Procedure init_keyboard_people()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Down
   used_keys(2)\key  = #PB_Key_Up
   used_keys(3)\key  = #PB_Key_Return
   used_keys(4)\key  = #PB_Key_Escape
   
EndProcedure


Procedure init_keyboard_templateload()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Escape
   used_keys(2)\key  = #PB_Key_Return
   used_keys(3)\key  = #PB_Key_Down
   used_keys(4)\key  = #PB_Key_Up
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_templatesave()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Return
   used_keys(2)\key  = #PB_Key_Escape
   used_keys(3)\key  = #PB_Key_Up
   used_keys(4)\key  = #PB_Key_Down
   used_keys(5)\key  = #PB_Key_Delete
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_selectinventory()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Right
   used_keys(2)\key  = #PB_Key_Left
   used_keys(3)\key  = #PB_Key_Down
   used_keys(4)\key  = #PB_Key_Up
   used_keys(5)\key  = #PB_Key_Return
   set_default_auto_repeat()
   
EndProcedure


Procedure init_keyboard_playingpiece()

   clear_used_keys()
   used_keys(1)\key  = #PB_Key_Right
   used_keys(2)\key  = #PB_Key_Left
   used_keys(3)\key  = #PB_Key_Down
   used_keys(4)\key  = #PB_Key_Up
   used_keys(5)\key  = #PB_Key_Return
   used_keys(6)\key  = #PB_Key_LeftShift
   used_keys(6)\auto_repeat  = 1
   used_keys(7)\key  = #PB_Key_RightShift
   used_keys(7)\auto_repeat  = 1
   set_default_auto_repeat()
   
EndProcedure


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 294
; FirstLine = 274
; Folding = ------
; EnableXP
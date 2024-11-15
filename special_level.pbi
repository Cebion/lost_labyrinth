; Hilfe Screen
Procedure sonderlevel_text(nr.w)

Shared yplus, joystick_used

   If nr = #SL_DAEMON Or nr = #SL_THRONSAAL
      Sound(#SOUND_HOHOHO)
   ElseIf nr = #SL_DRACHE Or nr = #SL_HYDRA
      Sound(#SOUND_ROAR)
   EndIf

   raus.w = 0
   something_changed = 1
   
   init_keyboard_special_level()

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      
      ; #PB_Key_Return, #PB_Key_Escape, #PB_Key_Space
      for i = 1 to 3
         if (used_keys(i)\pressed And used_keys(i)\wait_release = 0) or jay > 0
            used_keys(i)\wait_release = 1
            raus = 1
         EndIf
      next
      
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         raus = 1
      EndIf
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf
      
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         laby_rahmen()
         show_logo()
         show_varys(0)
         show_buttons()
         akt_color.w = 1

         If nr = #SL_EISKAVERNE
            ClipSprite(#SPRITE_TILESET_FSI5, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI5, 16, 16)
            nachricht1 = 157
            nachricht2 = 158
            nachricht3 = 159
            nachricht4 = 160
         EndIf
         If nr = #SL_LAVAKAVERNE
            ClipSprite(#SPRITE_TILESET_FSI6, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI6, 16, 16)
            nachricht1 = 161
            nachricht2 = 162
            nachricht3 = 163
            nachricht4 = 164
         EndIf
         If nr = #SL_TOTENHALLE
            ClipSprite(#SPRITE_TILESET_FSI4, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI4, 16, 16)
            nachricht1 = 165
            nachricht2 = 166
            nachricht3 = 167
            nachricht4 = 0
         EndIf
         If nr = #SL_GOBLINHOEHLE
            ClipSprite(#SPRITE_TILESET_FSI7, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI7, 16, 16)
            akt_color = 2
            nachricht1 = 168
            nachricht2 = 169
            nachricht3 = 170
            nachricht4 = 171
         EndIf
         If nr = #SL_DIEBESNEST
            ClipSprite(#SPRITE_TILESET_FSI9, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI9, 16, 16)
            nachricht1 = 172
            nachricht2 = 173
            nachricht3 = 174
            nachricht4 = 0
         EndIf
         If nr = #SL_ZENTAUERWALD
            ClipSprite(#SPRITE_TILESET_FSI8, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI8, 16, 16)
            akt_color = 2
            nachricht1 = 201
            nachricht2 = 202
            nachricht3 = 0
            nachricht4 = 0
         EndIf
         If nr = #SL_ILLUSIONEN
            ClipSprite(#SPRITE_TILESET_FSI13, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI13, 16, 16)
            nachricht1 = 292
            nachricht2 = 293
            nachricht3 = 294
            nachricht4 = 0
         EndIf
         If nr = #SL_SPINNENBAU
            ClipSprite(#SPRITE_TILESET_FSI11, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI11, 16, 16)
            akt_color = 2
            nachricht1 = 295
            nachricht2 = 296
            nachricht3 = 297
            nachricht4 = 0
         EndIf
         If nr = #SL_WUESTE
            ClipSprite(#SPRITE_TILESET_FSI20, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI20, 16, 16)
            nachricht1 = 488
            nachricht2 = 489
            nachricht3 = 490
            nachricht4 = 0
         EndIf
         If nr = #SL_ARCHIPEL
            ClipSprite(#SPRITE_TILESET_FSI19, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI19, 16, 16)
            nachricht1 = 491
            nachricht2 = 492
            nachricht3 = 493
            nachricht4 = 0
         EndIf
         If nr = #SL_DAEMON
            ClipSprite(#SPRITE_TILESET_FSI0, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI0, 16, 16)
            akt_color = 2
            nachricht1 = 127
            nachricht2 = 128
            nachricht3 = 129
            nachricht4 = 0
         EndIf
         If nr = #SL_FRIEDHOF
            ClipSprite(#SPRITE_TILESET_FSI4, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI4, 16, 16)
            nachricht1 = 484
            nachricht2 = 485
            nachricht3 = 0
            nachricht4 = 0
         EndIf
         If nr = #SL_DRACHE
            ClipSprite(#SPRITE_TILESET_FSI24, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI24, 16, 16)
            akt_color = 2
            nachricht1 = 218
            nachricht2 = 219
            nachricht3 = 220
            nachricht4 = 0
         EndIf
         If nr = #SL_LAVASCHATZ
            ClipSprite(#SPRITE_TILESET_FSI6, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI6, 16, 16)
            nachricht1 = 234
            nachricht2 = 235
            nachricht3 = 0
            nachricht4 = 0
         EndIf
         If nr = #SL_STABTEIL
            ClipSprite(#SPRITE_TILESET_FSI9, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI9, 16, 16)
            nachricht1 = 236
            nachricht2 = 237
            nachricht3 = 0
            nachricht4 = 0
         EndIf
         If nr = #SL_TAVERNE
            ClipSprite(#SPRITE_TILESET_FSI10, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI10, 16, 16)
            nachricht1 = 270
            nachricht2 = 271
            nachricht3 = 272
            nachricht4 = 0
         EndIf
         If nr = #SL_HYDRA
            ClipSprite(#SPRITE_TILESET_FSI12, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI12, 16, 16)
            akt_color = 2
            nachricht1 = 282
            nachricht2 = 283
            nachricht3 = 284
            nachricht4 = 285
         EndIf
         If nr = #SL_LABOR
            ClipSprite(#SPRITE_TILESET_FSI14, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI14, 16, 16)
            akt_color = 2
            nachricht1 = 301
            nachricht2 = 302
            nachricht3 = 303
            nachricht4 = 304
         EndIf
         If nr = #SL_BIBLIOTHEK
            ClipSprite(#SPRITE_TILESET_FSI14, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI14, 16, 16)
            akt_color = 2
            nachricht1 = 305
            nachricht2 = 306
            nachricht3 = 307
            nachricht4 = 308
         EndIf
         If nr = #SL_EINGESCHLOSSEN
            ClipSprite(#SPRITE_TILESET_FSI9, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI9, 16, 16)
            nachricht1 = 331
            nachricht2 = 332
            nachricht3 = 333
            nachricht4 = 0
         EndIf
         If nr = #SL_WIZARD
            ClipSprite(#SPRITE_TILESET_FSI22, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI22, 16, 16)
            akt_color = 2
            nachricht1 = 335
            nachricht2 = 336
            nachricht3 = 337
            nachricht4 = 0
         EndIf
         If nr = #SL_SEE
            ClipSprite(#SPRITE_TILESET_FSI15, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI15, 16, 16)
            nachricht1 = 345
            nachricht2 = 346
            nachricht3 = 347
            nachricht4 = 0
         EndIf
         If nr = #SL_SCHMIEDE
            ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
            akt_color = 2
            nachricht1 = 410
            nachricht2 = 411
            nachricht3 = 0
            nachricht4 = 0
         EndIf
         If nr = #SL_FALLEN
            ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
            akt_color = 2
            nachricht1 = 426
            nachricht2 = 0
            nachricht3 = 0
            nachricht4 = 0
         EndIf
         If nr = #SL_THRONSAAL
            ClipSprite(#SPRITE_TILESET_FSI16, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI16, 16, 16)
            akt_color = 2
            nachricht1 = 500
            nachricht2 = 501
            nachricht3 = 502
            nachricht4 = 0
         EndIf
         If nr = #SL_SUMPF
            ClipSprite(#SPRITE_TILESET_FSI18, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI18, 16, 16)
            nachricht1 = 504
            nachricht2 = 505
            nachricht3 = 506
            nachricht4 = 0
         EndIf
         If nr = #SL_DUMM
            ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
            akt_color = 2
            nachricht1 = 125
            nachricht2 = 123
            nachricht3 = 124
            nachricht4 = 0
         EndIf
         If nr = #SL_MONSTERFALLE
            ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
            akt_color = 2
            nachricht1 = 640
            nachricht2 = 641
            nachricht3 = 642
            nachricht4 = 643
         EndIf
         If nr = #SL_FALLEN_SCHATZ
            ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
            akt_color = 2
            nachricht1 = 722
            nachricht2 = 723
            nachricht3 = 724
            nachricht4 = 0
         EndIf
         If nr = #SL_GEFAENGNIS
            ClipSprite(#SPRITE_TILESET_FSI21, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI21, 16, 16)
            akt_color = 2
            nachricht1 = 725
            nachricht2 = 726
            nachricht3 = 727
            nachricht4 = 0
         EndIf
         If nr = #SL_ORK_DORF
            ClipSprite(#SPRITE_TILESET_FSI17, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI17, 16, 16)
            akt_color = 2
            nachricht1 = 742
            nachricht2 = 743
            nachricht3 = 744
            nachricht4 = 745
         EndIf
         If nr = #SL_HEXENHAUS
            ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
            akt_color = 2
            nachricht1 = 746
            nachricht2 = 747
            nachricht3 = 0
            nachricht4 = 0
         EndIf
         If nr = #SL_CUSTOMDUMMY
            ClipSprite(#SPRITE_TILESET_ROOMPICDUMMY, 1, 1, 335, 335)
            DisplayTransparentSprite(#SPRITE_TILESET_ROOMPICDUMMY, 16, 16)
            nachricht1 = 867
            nachricht2 = 868
            nachricht3 = 869
            nachricht4 = 870
         EndIf

         x = 45
         y = 45
         wohin = ScreenOutput()
         StartDrawing(wohin)
            Select akt_color
            case 1:
         FrontColor(RGB(255,1,1))  ; Black
            case 2:
         FrontColor(RGB(255,255,255))  ; White
         EndSelect
            DrawingMode(1)
            If nachricht1 <> 0
               DrawText(x,y,nachricht4(nachricht1))
               y = y + yplus
            EndIf
            If nachricht2 <> 0
               DrawText(x,y,  nachricht4(nachricht2))
               y = y + yplus
            EndIf
            If nachricht3 <> 0
               DrawText(x,y, nachricht4(nachricht3))
               y = y + yplus
            EndIf
            If nachricht4 <> 0
               DrawText(x,y,  nachricht4(nachricht4))
               y = y + yplus
            EndIf
         StopDrawing()
      
         end_screen()
      endif ; something_changed
   Until raus = 1
   init_keyboard_main()

EndProcedure


Procedure levelmodtext(welcher.w)

   Shared yplus, joystick_used
   
   Sound(#SOUND_HOHOHO)

   raus.w = 0
   something_changed = 1
   
   init_keyboard_special_level()

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      
      ; #PB_Key_Return, #PB_Key_Escape, #PB_Key_Space
      for i = 1 to 3
         if (used_keys(i)\pressed And used_keys(i)\wait_release = 0) or jay > 0
            used_keys(i)\wait_release = 1
            raus = 1
         EndIf
      next
      
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         raus = 1
      EndIf
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      EndIf

      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         laby_rahmen()
         show_logo()
         show_varys(0)
         show_buttons()

         ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
         DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)

         x = 20
         y = 35
         wohin = ScreenOutput()
         StartDrawing(wohin)
            FrontColor(RGB(255,1,1))  ; Schwarz
            DrawingMode(1)
            
            Select(welcher)
            Case #LM_MAGICAL_DARKNESS:
               DrawText(x,y,nachricht4(377))
               y = y + yplus + 5
               DrawText(x,y,  nachricht4(378))
               y = y + yplus + 5
               DrawText(x,y, nachricht4(379))
            Case #LM_FIERCE_TRAPS:
               DrawText(x,y,nachricht4(380))
               y = y + yplus + 5
               DrawText(x,y, nachricht4(381))
               y = y + yplus + 5
               DrawText(x,y, nachricht4(382))
            Case #LM_MONSTERS:
               DrawText(x,y,nachricht4(383))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(384))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(385))
            Case #LM_BLOCKED_EXIT:
               DrawText(x,y,nachricht4(386))
               y = y + yplus + 5
               DrawText(x,y, nachricht4(387))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(388))
            Case #LM_KEIN_NEXUS:
               DrawText(x,y,nachricht4(390))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(391))
            Case #LM_KEIN_SANKTUM:
               DrawText(x,y,nachricht4(392))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(393))
            Case #LM_HINTERHALTE:
               DrawText(x,y,nachricht4(394))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(395))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(396))
            Case #LM_GIFTIGER_NEBEL:
               DrawText(x,y,nachricht4(397))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(398))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(399))
            Case #LM_EXTREME_HOT:
               DrawText(x,y,nachricht4(420))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(421))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(422))
            Case #LM_EXTREME_COLD:
               DrawText(x,y,nachricht4(423))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(424))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(425))
            Case #LM_ALERTED_MONSTERS:
               DrawText(x,y,nachricht4(607))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(608))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(609))
            Case #LM_GEHEIMTUEREN:
               DrawText(x,y,nachricht4(651))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(652))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(653))
            Case #LM_MANASCHWUND:
               DrawText(x,y,nachricht4(809))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(810))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(811))
            Case #LM_UNZERSTOERBARE_WAENDE:
               DrawText(x,y,nachricht4(812))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(813))
               y = y + yplus + 5
               DrawText(x,y, nachricht4(814))
            Case #LM_TELEPORTSPERRE:
               DrawText(x,y,nachricht4(815))
               y = y + yplus + 5
               DrawText(x,y, nachricht4(816))
               y = y + yplus + 5
               DrawText(x,y,nachricht4(817))
            EndSelect
          StopDrawing()

         end_screen()
      endif ; something_changed
   Until raus = 1
   init_keyboard_main()

EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 102
; FirstLine = 90
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
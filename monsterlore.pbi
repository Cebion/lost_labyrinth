Procedure explain (was.w, pos.w)

         Select (was)
            Case #ME_FLIEGT:
               nr = 349
            Case #ME_HINTERHALT:
               nr = 350
            Case #ME_GIFT:
               nr = 351
            Case #ME_BESTEHLBAR:
               nr = 352
            Case #ME_FERNKAMPF:
               nr = 353
            Case #ME_VERSTAERKUNG:
               nr = 354
            Case #ME_TROCKEN:
               nr = 355
            Case #ME_ANGST:
               nr = 356
            Case #ME_CHARM:
               nr = 357
            Case #ME_DIEBSTAHL:
               nr = 358
            Case #ME_BRENNT:
               nr = 359
            Case #ME_FEUERFEST:
               nr = 360
            Case #ME_STEINFEST:
               nr = 361
            Case #ME_BLITZE:
               nr = 362
            Case #ME_DISPEL:
               nr = 363
            Case #ME_REGENERATION:
               nr = 364
            Case #ME_UNVERWUNDBAR:
               nr = 365
            Case #ME_EISFEST:
               nr = 366
            Case #ME_UNSICHTBAR:
               nr = 367
            Case #ME_FEUERATEM:
               nr = 368
            Case #ME_GIFTATEM:
               nr = 369
            Case #ME_VERSTEINERN:
               nr = 370
            Case #ME_FROSTATEM:
               nr = 371
            Case #ME_TODESBLICK:
               nr = 372
            Case #ME_BLITZEFEST:
               nr = 373
            Case #ME_HAT_SCHATZ:
               nr = 374
            Case #ME_HAT_MAG_SCHATZ:
               nr = 375
            Case #ME_RES_CRITICAL:
               nr = 376
            Case #ME_SCHLAEFT:
               nr = 481
            Case #ME_WASSER:
               nr = 668
            Case #ME_EINMALIG:
               nr = 669
            Case #ME_SPINNE:
               nr = 670
            Case #ME_GOBLIN:
               nr = 671
            Case #ME_UNTOTER:
               nr = 672
            Case #ME_RATTE:
               nr = 673
            Case #ME_WOLF:
               nr = 674
            Case #ME_FLEDERMAUS:
               nr = 675
            Case #ME_KATZE:
               nr = 676
            Case #ME_WAFFEN_ZERSTOEREN:
               nr = 677
            Case #ME_RUESTUNG_ZERSTOEREN:
               nr = 678
            Case #ME_STEINE_WERFEN:
               nr = 821
            Case #ME_EXPLODIERT:
               nr = 822
            Case #ME_VERMEHREND:
               nr = 823
            Case #ME_ANSTECKEND:
               nr = 824
            Case #ME_WINDFEST:
               nr = 834
         EndSelect
         DrawText(175,pos,nachricht4(nr))
         
EndProcedure
         

Procedure monsterlore()

Shared frame, spell_x, spell_y, monsterauge

   ;If test = 1
   ;  OpenConsole()
   ;  Print("----------- Dump of monster_list() : -------------")
   ;  ResetList(monster_list())
   ;  While NextElement(monster_list())
   ;    Print("nr:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
   ;  Wend
   ;EndIf
            
   raus.w = 0
   spell_x = 0
   spell_y = 0
   yplus = 20
   destination = select_field(1)   ; gibt spell_x und spell_y zurueck
   init_keyboard_monsterlore()
   If destination = 1
      mon.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
      akt_tile.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
      If skills(#CE_MONSTERKUNDE,akt_spieler)\gewaehlt = 1 Or monsterauge = 1
      If akt_tile = #FELD_MIMIC
         mon = 70 ;we can detect mimics with monster lore
         labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = inhalt(spieler(akt_spieler)\level)
         setmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level,mon,monster(mon)\nr,monster(mon)\lebenspunkte, #MONSTERSTATUS_NORMAL,0,0)
      EndIf
      EndIf
      If matrix(#HALF_MATRIX_SIZE+spell_x, #HALF_MATRIX_SIZE+spell_y) <= radius() Or skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt

         Repeat
            read_mouse()
            read_keyboard()
            read_joystick()
            
            ; #PB_Key_Return
            If used_keys(1)\pressed And used_keys(1)\wait_release = 0
               used_keys(1)\wait_release = 1
               raus = 1
            EndIf
            
            ; #PB_Key_Space
            If used_keys(2)\pressed And used_keys(2)\wait_release = 0
               used_keys(2)\wait_release = 1
               raus = 1
            EndIf
            
            ; #PB_Key_L
            If used_keys(3)\pressed And used_keys(3)\wait_release = 0
               used_keys(3)\wait_release = 1
               raus = 1
            EndIf
            
            ; #PB_Key_ESC
            If used_keys(4)\pressed And used_keys(4)\wait_release = 0
               used_keys(4)\wait_release = 1
               raus = 1
            EndIf
            
            If mmouse_rechts And mmouse_rechts_wait_release = 0
               mmouse_rechts_wait_release = 1
               raus = 1
            endif
            
            If mmouse_links And mmouse_links_wait_release = 0
               mmouse_links_wait_release = 1
               raus = 1
            endif
            
            if something_changed = 1
               Fenster()
               ClearScreen(RGB(0,0,0))
               draw_plain_frame()
         
               ClipSprite(#SPRITE_BG_LORE, 1, 1, 606, 446)
               DisplayTransparentSprite(#SPRITE_BG_LORE, 17, 17)
               
               okay.w = 0
               x = 75
               yn = 50
               ; monster?
               If mon And ( has_trait2(mon, #ME_UNSICHTBAR) = 0 Or habich(#SPELL_UNSICHTBARES_SEHEN) Or habich(#SPELL_GEISTERTANZ) Or skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt)
                  okay = 1
                  draw_monster(2,2,x-40,yn-12) ;the monster itself
                  wohin = ScreenOutput()
                  StartDrawing(wohin)
                  DrawingMode(1)
               
                  FrontColor(RGB(255,255,255))
                  DrawText(x,yn,nachricht5(115,mon))

                  ;Explain Monsterstatus
                  yn = yn + yplus
                  Select monster_list()\status
                     Case #MONSTERSTATUS_NORMAL:
                        yn = yn - yplus
                     Case #MONSTERSTATUS_ALERT:
                        DrawText(x,yn,message_text(763,1+language))
                     Case #MONSTERSTATUS_SCHLAEFT:
                        DrawText(x,yn,message_text(764,1+language))
                     Case #MONSTERSTATUS_FREUND:
                        DrawText(x,yn,message_text(765,1+language))
                     Case #MONSTERSTATUS_VERGIFTET:
                        DrawText(x,yn,message_text(766,1+language))
                     Case #MONSTERSTATUS_BLIND:
                        DrawText(x,yn,message_text(767,1+language))
                     Case #MONSTERSTATUS_SCHWARM:
                        DrawText(x,yn,message_text(768,1+language))
                  EndSelect

                  If skills(#CE_MONSTERKUNDE,akt_spieler)\gewaehlt = 1 Or monsterauge = 1
                     yn = yn + yplus
                     tempart.s = ""
               
                     Select(monster(mon)\art)
                        Case 1: tempart = message_text(118,1+language)
                        Case 2: tempart = message_text(119,1+language)
                        Case 3: tempart = message_text(120,1+language)
                        Case 4: tempart = message_text(121,1+language)
                        Case 5: tempart = message_text(400,1+language)
                        Case 7: tempart = message_text(401,1+language)
                        Case 8: tempart = message_text(402,1+language)
                        Case 9: tempart = message_text(403,1+language)
                        Case 10: tempart = message_text(404,1+language)
                     EndSelect
                     
                     DrawText(x,yn, nachricht6(116,tempart))
                     yn = yn + yplus
                     DrawText(x,yn,nachricht6(55,Str(monster_list()\hp) + "/" + Str(monster(mon)\lebenspunkte)))
                     yn = yn + yplus
                     DrawText(x,yn,  nachricht6(117,Str(monster(mon)\angriff) + "/" + Str(monster(mon)\abwehr)))
                     yn = yn + yplus
                     DrawText(x,yn, nachricht6(54,Str(monster(mon)\staerke)))
                     yn = yn + yplus
                     DrawText(x,yn,  nachricht6(87,Str(monster(mon)\ruestung)))
                     
                     
                     yn = yn + yplus
                     explain(monster(mon)\eigenschaft1,yn)
                     yn = yn + yplus
                     explain(monster(mon)\eigenschaft2,yn)
                     yn = yn + yplus
                     explain(monster(mon)\eigenschaft3,yn)
                     yn = yn + yplus
                     explain(monster(mon)\eigenschaft4,yn)
                     yn = yn + yplus
                     explain(monster(mon)\eigenschaft5,yn)
                     yn = yn + yplus
                     explain(monster(mon)\eigenschaft6,yn)
                     yn = yn + yplus
                     explain(monster(mon)\eigenschaft7,yn)
                  EndIf
               
                  StopDrawing()
                  yn = yn + yplus
               EndIf ; Monster?
               
               akt_item.w = laby_item(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\name[spieler(akt_spieler)\Level]
               If akt_item > 0
                  If item(akt_item)\type <> 17 Or skills(#CE_UNAUFMERKSAM,akt_spieler)\gewaehlt = 0 ;hide mushrooms if flaw selected
                     yn = yn + yplus
                     draw_item(akt_item, 2, 2, x-40,yn-12)
                     wohin = ScreenOutput()
                     StartDrawing(wohin)
                     DrawingMode(1)
                     FrontColor(RGB(255,255,255))
                     DrawText(x,yn, item(akt_item)\name[language+1])
                     StopDrawing()
                     yn = yn + 32
                  Endif
               EndIf
               ; tile itself
               wohin = ScreenOutput()
               StartDrawing(wohin)
                  DrawingMode(1)
                  FrontColor(RGB(255,255,255))
                  yn = yn + yplus
                  DrawText(x,yn, fields(akt_tile)\description[language+1])
                  If (akt_tile = #FELD_NEXUS or akt_tile = #FELD_SANKTUM)
                     charges.s = str(labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\stat1 & 15)
                     DrawText(x,yn+15, message_text(548,language+1) + charges)
                  Endif
               StopDrawing()
               draw_tile(akt_tile, 2, 2, x-40,yn-12,-1)
         
               end_screen()
            endif ; something_changed
            delay(#Input_delay)
         Until raus = 1
      EndIf
   endif

EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 118
; FirstLine = 101
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
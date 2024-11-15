Procedure merchant(merch_pos.w)

   Shared modules, sound, music, warten, joystick_used, aktion, message_text

   sel_x.w = 1
   sel_y.w = 1
   doubleclick.w = 0
   buy.w = -1
   sell.w = 0
   price_sell.w = 0
   price_buy.w = 0
   obj_sell.w = 0
   obj_buy.w = 0
      
   init_keyboard_trader()

   SelectElement(Merchants(),merch_pos)
   obj_sell = 0
   obj_buy = 0
   sell = 0
   buy = -1

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      doubleclick = doubleClick()
         
      ; #PB_Key_Right
      if (used_keys(2)\pressed And used_keys(2)\wait_release = 0) or jax = 1
         used_keys(2)\wait_release = 1
         sel_x = sel_x + 1
         If sel_x > 16
            sel_x = 16
         EndIf
         If sel_y > 5 And sel_x > 13
            sel_x = 13
         EndIf
      endif
         
      ; #PB_Key_Left
      if (used_keys(3)\pressed And used_keys(3)\wait_release = 0) or jax = -1
         used_keys(3)\wait_release = 1
         sel_x = sel_x - 1
         If sel_x < 1
            sel_x = 1
         EndIf
      endif
         
      ; #PB_Key_Down
      if (used_keys(4)\pressed And used_keys(4)\wait_release = 0) or jay = 1
         used_keys(4)\wait_release = 1
         sel_y = sel_y + 1
         If sel_y > 7
            sel_y = 7
         EndIf
         If sel_y > 5 And sel_x > 13
            sel_x = 13
         EndIf
      endif
         
      ; #PB_Key_Up
      if (used_keys(5)\pressed And used_keys(5)\wait_release = 0) or jay = -1
         used_keys(5)\wait_release = 1
         sel_y = sel_y - 1
         If sel_y < 1
            sel_y = 1
         EndIf
      endif
         
      ; #PB_KEY_Escape
      if used_keys(6)\pressed And used_keys(6)\wait_release = 0
         used_keys(6)\wait_release = 1
         raus = 1
      endif
      
         
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 1
      endif
      
      If mmouse_x >= #POS_TRADER_EXIT_X And mmouse_x <= #POS_TRADER_EXIT_X + 32 And mmouse_y >= #POS_TRADER_EXIT_Y And mmouse_y <= #POS_TRADER_EXIT_Y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 1
         EndIf
      else
         over_exitbutton = 0
      endif
      
      If mmouse_x >= #POS_TRADER_SELL_X And mmouse_x <= #POS_TRADER_SELL_X + 32 And mmouse_y >= #POS_TRADER_SELL_Y And mmouse_y <= #POS_TRADER_SELL_Y + 32
         over_sellbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            buy = -2
         EndIf
      else
         over_sellbutton = 0
      endif
      
      If mmouse_x >= #POS_TRADER_BUY_X And mmouse_x <= #POS_TRADER_BUY_X + 32 And mmouse_y >= #POS_TRADER_BUY_Y And mmouse_y <= #POS_TRADER_BUY_Y + 32
         over_buybutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            sell = -2
         EndIf
      else
         over_buybutton = 0
      endif
      
      price_sell = 0
      price_buy = 0
      
      If something_changed
         ; Merchant Items
         x = 25
         y = 80
         For i_trader = 1 To 8
            For j_trader = 1 To 7
               pos.w = i_trader - 1 + 8 * (j_trader-1)
               ; return/space pushed
               If sel_x = i_trader And sel_y = j_trader
                  obj_buy = Merchants()\i[pos]\id
                  buy = pos
                  obj_sell = 0
                  If (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or (used_keys(7)\pressed And used_keys(7)\wait_release = 0) 
                     used_keys(1)\wait_release = 1
                     used_keys(7)\wait_release = 1
                     If obj_buy > 0
                        sell = -2
                     EndIf
                  EndIf
               EndIf
               ; Ist die Maus hier ?
               a.w = (x + ((i_trader * 32) - 32))
               b.w = (x + (i_trader * 32))
               c.w = (y + ((j_trader * 32 ) - 32))
               d.w = (y + (j_trader * 32 ))
               If (mmouse_x > a And mmouse_x < b And mmouse_y > c And mmouse_y < d)
                  If mmouse_links And mmouse_links_wait_release = 0
                     mmouse_links_wait_release = 1
                     sel_x = i_trader
                     sel_y = j_trader
                     buy = pos
                     sell = 0
                     obj_buy = Merchants()\i[pos]\id
                     obj_sell = 0
                  EndIf
                  If doubleclick And obj_buy > 2
                     sell = -2
                  EndIf
               EndIf
            Next
         Next

         ; Character Items
         x = 365
         y = 80
         For ii = 1 To 50
            i_character = ((ii-1) % 8 ) + 1
            j_character = ((ii-1) / 8 ) + 1
            If ii > 45
               i_character = ii - 45
               j_character = 7
            EndIf

            If sel_x = i_character + 8 And sel_y = j_character
               obj_sell = inventory(ii,akt_spieler)\name
               sell = ii
               obj_buy = 0
               If (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or (used_keys(7)\pressed And used_keys(7)\wait_release = 0)
                  used_keys(1)\wait_release = 1
                  used_keys(7)\wait_release = 1
                  If obj_sell > 0
                     buy = -2
                  EndIf
               EndIf
            EndIf
               
            a.w = (x + ((i_character * 32) - 32))
            b.w = (x + (i_character * 32))
            c.w = (y + ((j_character * 32 ) - 32))
            d.w =  (y + (j_character * 32 ))
            If (mmouse_x > a And mmouse_x < b And mmouse_y > c And mmouse_y < d)
               If mmouse_links And mmouse_links_wait_release = 0
                  mmouse_links_wait_release = 1
                  obj_sell = inventory(ii,akt_spieler)\name
                  sel_x = i_character + 8
                  sel_y = j_character
                  sell = ii
                  obj_buy = 0
               EndIf
               If doubleclick And obj_sell > 0
                  buy = -2
               EndIf
            EndIf
         Next         
      endif
      
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         draw_plain_frame(-1)

         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))  ; Weiss
         tmptxt.s = message_text(66,1+language) + " (" + spieler(akt_spieler)\name + ")"
         DrawText((640-TextWidth(tmptxt))/2,25,tmptxt)
         StopDrawing()

         ; Merchant Items
         x = 25
         y = 80
         ;draw trader icon above the merchandise
         face_x.w = (Merchants()\face % 10) * 32
         face_y.w = (Merchants()\face / 10) * 32
         ClipSprite(#SPRITE_TILESET_LABYRINTH, face_x, face_y, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_LABYRINTH, x + 3 * 32 + 16, y - 35)
         For i_trader = 1 To 8
            For j_trader = 1 To 7
               pos.w = i_trader-1 + 8 * (j_trader-1)
               If sel_x = i_trader And sel_y = j_trader
                  ClipSprite(#SPRITE_TILESET_LABYRINTH, 0, 32, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_LABYRINTH, x + ((i_trader * 32) - 32), y + ((j_trader *32 ) - 32))
               Else
                  ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x + ((i_trader * 32) - 32), y + ((j_trader *32 ) - 32))
               EndIf
               ; Ist die Maus hier ?
               a.w = (x + ((i_trader * 32) - 32))
               b.w = (x + (i_trader * 32))
               c.w = (y + ((j_trader * 32 ) - 32))
               d.w = (y + (j_trader * 32 ))
               If (mmouse_x > a And mmouse_x < b And mmouse_y > c And mmouse_y < d)
                  ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x + ((i_trader * 32) - 32), y + ((j_trader *32 ) - 32))
               EndIf

               ; draw item
               If Merchants()\i[pos]\id 
                  sprite_x.w = Merchants()\i[pos]\id - 1
                  sprite_y.w = sprite_x / 16
                  sprite_x = sprite_x % 16
                  ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32, sprite_y * 32, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x + ((i_trader * 32) - 32), y + ((j_trader *32 ) - 32))
                  If Merchants()\i[pos]\id = #OBJGRAFIK_SCHRIFTROLLE
                     select (spells(Merchants()\i[pos]\spell)\school)
                        case #school_basic:    school_clip_icon =  3*19
                        case #school_earth:    school_clip_icon =  6*19
                        case #school_fire:     school_clip_icon =  7*19
                        case #school_black:    school_clip_icon =  4*19
                        case #school_druid:    school_clip_icon =  5*19
                        case #school_white:    school_clip_icon = 13*19
                        case #school_bard:     school_clip_icon =  2*19
                        case #school_air:      school_clip_icon =  0*19
                        case #school_illusion: school_clip_icon =  9*19
                        case #school_high:     school_clip_icon =  8*19
                        case #school_star:     school_clip_icon = 10*19
                        case #school_water:    school_clip_icon = 12*19
                        case #school_witch:    school_clip_icon = 14*19
                        case #school_warlock:  school_clip_icon = 11*19
                        case #school_summon:   school_clip_icon = 16*19
                     endselect
                     ClipSprite(#SPRITE_ICONS, school_clip_icon, 0, 16, 16)
                     DisplayTransparentSprite(#SPRITE_ICONS, x + ((i_trader * 32) - 31), y + ((j_trader *32 ) - 31))
                  EndIf
               EndIf
            Next
         Next
         
         ;cursor over item from merchant
         If obj_buy > 0
            price_buy = item(obj_buy)\einkauf
            ;place item in unused inventory slot 0, for generic function "describe"
            inventory(0,akt_spieler)\name = obj_buy
            inventory(0,akt_spieler)\benutzt = 0
            If obj_buy = #OBJGRAFIK_SCHRIFTROLLE
               price_buy = 35
               inventory(0,akt_spieler)\status = Merchants()\i[buy]\spell
               inventory(0,akt_spieler)\attri5 = Merchants()\i[buy]\power | 256
            Else
               If item(obj_buy)\qualitaet = 2 ;charges, torch etc.
                  inventory(0,akt_spieler)\status = item(obj_buy)\attri1
               Else
                  inventory(0,akt_spieler)\status = 0 ;fully repaired
               EndIf
               ; Hat Qualitaet?
               If item(obj_buy)\qualitaet = 1 Or item(obj_buy)\qualitaet = 3
                  price_buy = price_buy * Merchants()\i[buy]\power
                  inventory(0,akt_spieler)\attri5 = Merchants()\i[buy]\power
               EndIf
               ; Mark potions and mushrooms as identified
               If item(obj_buy)\type = #ITEMTYPE_POTION
                  inventory(0,akt_spieler)\status = 1
               ElseIf item(obj_buy)\type = #ITEMTYPE_MUSHROOM
                  inventory(0,akt_spieler)\status = 1
               EndIf
            EndIf
            describe(0, 25,y+230,25,375)
            inventory(0,akt_spieler)\name = 0
            
            If skills(#CE_FEILSCHEN,akt_spieler)\gewaehlt = 1
               price_buy = (price_buy * 3) / 4
               If price_buy < 1
                  price_buy = 1
               EndIf
            EndIf
            
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,1))  ; Gelb
            DrawText(25,y+275,Str(price_buy)+" "+ message_text(8,1+language) )
            StopDrawing()
         EndIf

         ; buy button
         if over_buybutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 0*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_TRADER_BUY_X, #POS_TRADER_BUY_Y)

         ;--------------------------------
         ; Character Items
         x = 365
         y = 80
         ; character icon above inventory items
         draw_player( x + 3 * 32 + 16, y - 35)
         For ii = 1 To 50            
            i_character = ((ii-1) % 8 ) + 1
            j_character = ((ii-1) / 8 ) + 1
            If ii > 45
               i_character = ii - 45
               j_character = 7
            EndIf

            cursor_here = 0
            If sel_x = i_character + 8 And sel_y = j_character
               cursor_here = 1
            endif
            draw_item_inventory(x,y,ii,cursor_here,2)
         Next
         
         ;display info+price for item player wants to sell
         If obj_sell > 0 And obj_sell <= #ANZ_GEGENSTAENDE
            type.w = item(obj_sell)\type
            gegname.s = ""
            ; Schriftrolle?
            sr.w = 0
            If obj_sell = #OBJGRAFIK_SCHRIFTROLLE
               sr = inventory(sell,akt_spieler)\status
               price_sell = 15
               If learned(akt_spieler,sr) & #l_scrollname
                  gegname = spells(sr)\name[1+language]
                  If learned(akt_spieler,sr) & #l_masq Or zauber_nehmen(sr)
                     gegname + "+"
                  EndIf
                  gegname + " ("+Str(spells(sr)\level)+")"
               Else
                  gegname = message_text(584,1+language) ;unknown scroll
               EndIf
               sr = 1
            EndIf

            If sr = 0
               price_sell = item(obj_sell)\verkauf

               ; Hat Qualitaet?
               If (item(obj_sell)\qualitaet = 1 Or item(obj_sell)\qualitaet = 3)And item(obj_sell)\type <> #ITEMTYPE_BASTON
                  price_sell = item(obj_sell)\verkauf * inventory(sell,akt_spieler)\attri5
               EndIf

               ; Udjat Auge
               if obj_sell = #OBJGRAFIK_UDJAT
                  Select inventory(sell, akt_spieler)\status
                     Case 0: price_sell = 50
                     Case 1: price_sell = 150
                     Case 2: price_sell = 300
                  EndSelect
               EndIf
               
               ; weapon/armor
               If type = #ITEMTYPE_WEAPON Or type = #ITEMTYPE_MASK Or ( type >= #ITEMTYPE_HELMET And type <= #ITEMTYPE_SHIELD )
                  If inventory(sell, akt_spieler)\status = 1
                     ;damaged
                     price_sell = price_sell / 2
                  EndIf
                  If inventory(sell, akt_spieler)\status = 2
                     ;broken
                     price_sell = 0
                  EndIf
               EndIf

               ; wand/staff
               If item(obj_sell)\type = #ITEMTYPE_BASTON
                  If inventory(sell, akt_spieler)\attri5 = 2
                  ;elder
                     price_sell = price_sell * 1.2
                  EndIf
                  If inventory(sell, akt_spieler)\attri5 = 3
                     ;ancient
                     price_sell = price_sell * 1.5
                  EndIf
               EndIf

               ; potion
               If obj_sell >= #OBJGRAFIK_TRANK1 And obj_sell <= #OBJGRAFIK_TRANK1 + #ANZ_TRAENKE-1
                  If mischen(obj_sell-#OBJGRAFIK_TRANK1)\learned & PM() = 0 And inventory(sell,akt_spieler)\status = 0
                     gegname = message_text(586,1+language)
                     price_sell = 15
                  EndIf
               EndIf

               ; mushroom
               If obj_sell >= #OBJGRAFIK_PILZE_SCHWARZ And obj_sell <= #OBJGRAFIK_PILZE_SCHWARZ + #ANZ_PILZE - 1
                  If mush_known(obj_sell-#OBJGRAFIK_PILZE_SCHWARZ) & PM() = 0
                     gegname = message_text(585,1+language)
                     price_sell = 0
                  EndIf
               EndIf

               If gegname = "" And obj_sell > 0
                  gegname = item(obj_sell)\name[1+language]
               EndIf
            EndIf ; schriftrolle

            Describe(sell,x,y+230,25,375)
            wohin = ScreenOutput()
            StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,1))  ; Gelb
            DrawText(x,y+280,message_text(587,1+language) + Str(price_sell) + message_text(8,1+language))
            StopDrawing()

         EndIf
         nachricht8(x,400,gold_anzahl())

         ; sell button
         if over_sellbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 1*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_TRADER_SELL_X, #POS_TRADER_SELL_Y)

         If buy >= 0 And sell = -2 And obj_buy > 0
            i = backpackspace()
            If i <= #MAX_RUCKSACK And gold_anzahl() >= price_buy
               gold_verlieren(price_buy)
               Sound(#SOUND_BUY)
               nachricht7(message_text(437,1+language) + item(obj_buy)\name[1+language],#COLOR_GELB)
               price_buy = 0
               If obj_buy = #OBJGRAFIK_SCHRIFTROLLE
                  inventory(i,akt_spieler)\name = #OBJGRAFIK_SCHRIFTROLLE
                  inventory(i,akt_spieler)\benutzt = 0
                  inventory(i,akt_spieler)\status = Merchants()\i[buy]\spell
                  inventory(i,akt_spieler)\attri5 = Merchants()\i[buy]\power | 256
                  ;mark this scroll type as known
                  learned(akt_spieler,inventory(i,akt_spieler)\status) = learned(akt_spieler,inventory(i,akt_spieler)\status) | #l_scrollname
               ElseIf item(obj_buy)\qualitaet = 1 Or item(obj_buy)\qualitaet = 3; item with quality rating?
                  inventory(i,akt_spieler)\name = obj_buy
                  inventory(i,akt_spieler)\benutzt = 0
                  inventory(i,akt_spieler)\status = 0
                  inventory(i,akt_spieler)\attri5 = Merchants()\i[buy]\power
               Else
                  ; Mark potions and mushrooms as identified+learned
                  If item(obj_buy)\type = #ITEMTYPE_POTION
                     mischen(obj_buy-#OBJGRAFIK_TRANK1)\learned = mischen(obj_buy-#OBJGRAFIK_TRANK1)\learned | PM()
                     For i = 1 to #MAX_RUCKSACK
                        If inventory(i,akt_spieler)\name = obj_buy
                           inventory(i,akt_spieler)\status = 1
                        EndIf
                     Next
                  ElseIf item(obj_buy)\type = #ITEMTYPE_MUSHROOM
                     mush_known(obj_buy-#OBJGRAFIK_PILZE_SCHWARZ) = mush_known(obj_buy-#OBJGRAFIK_PILZE_SCHWARZ) | PM()
                     For i = 1 to #MAX_RUCKSACK
                        If inventory(i,akt_spieler)\name = obj_buy
                           inventory(i,akt_spieler)\status = 1
                        EndIf
                     Next
                  EndIf
                  i = in_rucksack(obj_buy, 1)
               EndIf
               Merchants()\i[buy]\id = 0
               Merchants()\i[buy]\power = 0
               Merchants()\i[buy]\spell = 0
            EndIf
            buy = 0
            obj_buy = 0
            sell = 0
         EndIf

         If sell > 0 And buy = -2
            If inventory(sell,akt_spieler)\name <> 0 And inventory(sell,akt_spieler)\name <> #OBJGRAFIK_BEUTEL
               un_equip(sell)
               gold_finden2(price_sell)
               nachricht7(message_text(438,1+language) + gegname,#COLOR_GELB)
               price_sell = 0
               For i = 0 To 55
                  If Merchants()\i[i]\id = 0   ; empty merchant slot
                     Merchants()\i[i]\id = inventory(sell,akt_spieler)\name
                     ; scroll?
                     If inventory(sell,akt_spieler)\name = #OBJGRAFIK_SCHRIFTROLLE
                        Merchants()\i[i]\spell = inventory(sell,akt_spieler)\status
                        Merchants()\i[i]\power = inventory(sell,akt_spieler)\attri5
                     Else
                        ; has quality attr.?
                        If item(inventory(sell,akt_spieler)\name)\qualitaet = 1 Or item(inventory(sell,akt_spieler)\name)\qualitaet = 3
                           Merchants()\i[i]\power = inventory(sell,akt_spieler)\attri5
                        EndIf
                     EndIf
                     Break
                  EndIf
               Next
               leeren(sell)
               sell = 0
               obj_sell = 0
               buy = 0
            EndIf
         EndIf

         ; exit button
         if over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_TRADER_EXIT_X, #POS_TRADER_EXIT_Y)

         end_screen()
      endif ; something_changed
      Delay(#Input_delay)
   Until raus = 1
EndProcedure


Procedure gen_food(which.w = 0)
   If which = 0
     which = 1 + Random(14)
   EndIf
   Select (which)
      Case  1: food = #OBJGRAFIK_KIRSCHEN
      Case  2: food = #OBJGRAFIK_TOMATE
      Case  3: food = #OBJGRAFIK_ZITRONE
      Case  4: food = #OBJGRAFIK_ERDBEERE
      Case  5: food = #OBJGRAFIK_APFEL
      Case  6: food = #OBJGRAFIK_ORANGE
      Case  7: food = #OBJGRAFIK_BIRNE
      Case  8: food = #OBJGRAFIK_TRAUBEN
      Case  9: food = #OBJGRAFIK_BANANEN
      Case 10: food = #OBJGRAFIK_ANANAS
      Case 11: food = #OBJGRAFIK_HONIG
      Case 12: food = #OBJGRAFIK_FISCH
      Case 13: food = #OBJGRAFIK_HUEHNCHEN
      Case 14: food = #OBJGRAFIK_BROT
      Case 15: food = #OBJGRAFIK_SCHINKEN
   EndSelect
   ProcedureReturn food
EndProcedure


Procedure init_merchant(type.w,level.w = 0)
  ;clear all entries
  For i = 0 To 55
    Merchants()\i[i]\id = 0
    Merchants()\i[i]\spell = 0
    Merchants()\i[i]\power = 0
  Next

  Select type:
    Case 1:
      Merchants()\i[0]\id = #OBJGRAFIK_APFEL
      Merchants()\i[1]\id = #OBJGRAFIK_BROT
      Merchants()\i[2]\id = #OBJGRAFIK_FACKEL1
      Merchants()\i[3]\id = #OBJGRAFIK_LAMPE1
      Merchants()\i[4]\id = #OBJGRAFIK_OEL
      Merchants()\i[5]\id = #OBJGRAFIK_WASSERSCHLAUCH
      Merchants()\i[6]\id = #OBJGRAFIK_PFEIL
      For i = 7 To 28
        Merchants()\i[i]\id = #OBJGRAFIK_DOLCH +i -7
      Next
      For i = 29 To 39
        Merchants()\i[i]\id = #OBJGRAFIK_UMHANG +i -29
      Next
    Case 2:
      Merchants()\i[0]\id  = #OBJGRAFIK_TOMATE
      Merchants()\i[1]\id  = #OBJGRAFIK_BROT
      Merchants()\i[2]\id  = #OBJGRAFIK_FACKEL1
      Merchants()\i[3]\id  = #OBJGRAFIK_LAMPE1
      Merchants()\i[4]\id  = #OBJGRAFIK_OEL
      Merchants()\i[5]\id  = #OBJGRAFIK_WASSERSCHLAUCH
      Merchants()\i[6]\id  = #OBJGRAFIK_PFEIL
      Merchants()\i[7]\id  = #OBJGRAFIK_KOECHER
      Merchants()\i[8]\id  = #OBJGRAFIK_SCHAUFEL
      Merchants()\i[9]\id  = #OBJGRAFIK_BUCH
      Merchants()\i[10]\id = #OBJGRAFIK_UDJAT
      Merchants()\i[11]\id = #OBJGRAFIK_KRONE1
      Merchants()\i[12]\id = #OBJGRAFIK_HANDSCHUHE3
      Merchants()\i[13]\id = #OBJGRAFIK_KESSEL
      Merchants()\i[14]\id = #OBJGRAFIK_STIEFEL_DUNKEL
      Merchants()\i[15]\id = #OBJGRAFIK_FLAMMENSCHWERT
      Merchants()\i[16]\id = #OBJGRAFIK_EISSCHWERT
      Merchants()\i[17]\id = #OBJGRAFIK_ZAUBERSTAB_GRUEN
      Merchants()\i[18]\id = #OBJGRAFIK_ZAUBERSTAB_BLAU
      Merchants()\i[19]\id = #OBJGRAFIK_ZAUBERSTAB_ROT
      Merchants()\i[20]\id = #OBJGRAFIK_ZAUBERSTAB_PURPUR
      Merchants()\i[21]\id = #OBJGRAFIK_ZAUBERSTAB_TUERKIS
      Merchants()\i[22]\id = #OBJGRAFIK_ZAUBERSTAB_GRAU
      Merchants()\i[23]\id = #OBJGRAFIK_ZAUBERSTAB_GELB
      Merchants()\i[24]\id = #OBJGRAFIK_ZAUBERSTAB_ORANGE
      Merchants()\i[25]\id = #OBJGRAFIK_MEDUSAHAUPT
      Merchants()\i[26]\id = #OBJGRAFIK_RING2
      Merchants()\i[27]\id = #OBJGRAFIK_RING3
      Merchants()\i[28]\id = #OBJGRAFIK_HERZ1
      Merchants()\i[29]\id = #OBJGRAFIK_FEDERHUT
      Merchants()\i[30]\id = #OBJGRAFIK_PFEILE_SCHWARZ
      For i = 31 To 39
        Merchants()\i[i]\id = make_potion()
      Next
    Case 3:
      Merchants()\i[0]\id = #OBJGRAFIK_KIRSCHEN
      Merchants()\i[1]\id = #OBJGRAFIK_BROT
      Merchants()\i[2]\id = #OBJGRAFIK_FACKEL1
      Merchants()\i[3]\id = #OBJGRAFIK_LAMPE1
      Merchants()\i[4]\id = #OBJGRAFIK_OEL
      Merchants()\i[5]\id = #OBJGRAFIK_WASSERSCHLAUCH
      Merchants()\i[6]\id = #OBJGRAFIK_PFEIL
      Merchants()\i[7]\id = #OBJGRAFIK_SPITZHACKE
      Merchants()\i[8]\id = #OBJGRAFIK_STUNDENGLAS
      For i = 9 To 14
        Merchants()\i[i]\id = #OBJGRAFIK_AMULETT1_ROT +i -9
      Next
      For i = 15 To 20
        Merchants()\i[i]\id = #OBJGRAFIK_AMULETT1 +i -15
      Next
      Merchants()\i[21]\id = #OBJGRAFIK_GRUENERHELM
      Merchants()\i[22]\id = #OBJGRAFIK_GUERTEL
      For i = 23 To 39
        Merchants()\i[i]\id = make_potion()
      Next
    Case 4:
      Merchants()\i[0]\id  = #OBJGRAFIK_ORANGE
      Merchants()\i[1]\id  = #OBJGRAFIK_HUEHNCHEN
      Merchants()\i[2]\id  = #OBJGRAFIK_FACKEL1
      Merchants()\i[3]\id  = #OBJGRAFIK_LAMPE1
      Merchants()\i[4]\id  = #OBJGRAFIK_OEL
      Merchants()\i[5]\id  = #OBJGRAFIK_WASSERSCHLAUCH
      Merchants()\i[6]\id  = #OBJGRAFIK_PFEIL
      Merchants()\i[7]\id  = #OBJGRAFIK_SCHWERT2
      Merchants()\i[8]\id  = #OBJGRAFIK_SEIL
      Merchants()\i[9]\id  = #OBJGRAFIK_SPIEGEL
      Merchants()\i[10]\id = #OBJGRAFIK_KRISTALLKUGEL
      Merchants()\i[11]\id = #OBJGRAFIK_ALPTRAEUME
      Merchants()\i[12]\id = #OBJGRAFIK_STAHLKUGELN
      Merchants()\i[13]\id = #OBJGRAFIK_STEINE
      Merchants()\i[14]\id = #OBJGRAFIK_RING_KLEIN1
      Merchants()\i[15]\id = #OBJGRAFIK_RING_KLEIN2
      Merchants()\i[16]\id = #OBJGRAFIK_RING_KLEIN3
      Merchants()\i[17]\id = #OBJGRAFIK_RING_KLEIN4
      Merchants()\i[18]\id = #OBJGRAFIK_RING_KLEIN5
      Merchants()\i[19]\id = #OBJGRAFIK_RING_KLEIN6
      Merchants()\i[20]\id = #OBJGRAFIK_ZAUBERSCHWERT1
      Merchants()\i[21]\id = #OBJGRAFIK_ZAUBERRUESTUNG1
      Merchants()\i[22]\id = #OBJGRAFIK_ZAUBERBOGEN
      Merchants()\i[23]\id = #OBJGRAFIK_ZAUBERPFEIL
      Merchants()\i[24]\id = #OBJGRAFIK_ZAUBERRUESTUNG2
      Merchants()\i[25]\id = #OBJGRAFIK_DEGEN
      Merchants()\i[26]\id = #OBJGRAFIK_ZAUBERDEGEN
      Merchants()\i[27]\id = #OBJGRAFIK_NAHRUNG
      Merchants()\i[28]\id = #OBJGRAFIK_MUETZE
      Merchants()\i[29]\id = #OBJGRAFIK_ZAUBERSCHWERT3
      Merchants()\i[30]\id = #OBJGRAFIK_LICHTAXT
      For i = 31 To 39
        Merchants()\i[i]\id = #OBJGRAFIK_SCHRIFTROLLE
        Repeat
          Merchants()\i[i]\spell = Random(#ANZ_ZAUBER-1) + 1   ; effect
        Until spells(Merchants()\i[i]\spell)\duration <> #UNENDLICH
        Merchants()\i[i]\power = Random(7) + 6    ; strength
      Next
    Case 5:
      Merchants()\i[0]\id  = #OBJGRAFIK_TRAUBEN
      Merchants()\i[1]\id  = #OBJGRAFIK_SCHINKEN
      Merchants()\i[2]\id  = #OBJGRAFIK_FACKEL1
      Merchants()\i[3]\id  = #OBJGRAFIK_LAMPE1
      Merchants()\i[4]\id  = #OBJGRAFIK_OEL
      Merchants()\i[5]\id  = #OBJGRAFIK_WASSERSCHLAUCH
      Merchants()\i[6]\id  = #OBJGRAFIK_PFEIL
      Merchants()\i[7]\id  = #OBJGRAFIK_KETTE1
      Merchants()\i[8]\id  = #OBJGRAFIK_KETTE2
      Merchants()\i[9]\id  = #OBJGRAFIK_ANGEL
      Merchants()\i[10]\id = #OBJGRAFIK_ZAUBEREI
      Merchants()\i[11]\id = #OBJGRAFIK_FALLENWERKZEUG
      Merchants()\i[12]\id = #OBJGRAFIK_GOLDENE_AXT
      Merchants()\i[13]\id = #OBJGRAFIK_GOLDENER_HAMMER
      Merchants()\i[14]\id = #OBJGRAFIK_ROTER_SPEER
      Merchants()\i[15]\id = #OBJGRAFIK_GOLDENER_DREIZACK
      Merchants()\i[16]\id = #OBJGRAFIK_BLUTIGE_AXT
      Merchants()\i[17]\id = #OBJGRAFIK_GOLDENER_MORGENSTERN
      Merchants()\i[18]\id = #OBJGRAFIK_STAHLHELM1
      Merchants()\i[19]\id = #OBJGRAFIK_STAHLHELM2
      Merchants()\i[20]\id = #OBJGRAFIK_DOLCH2
      Merchants()\i[21]\id = #OBJGRAFIK_FLORETTE
      Merchants()\i[22]\id = #OBJGRAFIK_DOLCH3
      Merchants()\i[23]\id = #OBJGRAFIK_DOLCH4
      Merchants()\i[24]\id = #OBJGRAFIK_KURZSCHWERT
      Merchants()\i[25]\id = #OBJGRAFIK_FALCHION
      Merchants()\i[26]\id = #OBJGRAFIK_DOLCH5
      Merchants()\i[27]\id = #OBJGRAFIK_FALCHION2
      Merchants()\i[28]\id = #OBJGRAFIK_BREITSCHWERT
      Merchants()\i[29]\id = #OBJGRAFIK_BREITSCHWERT2
      Merchants()\i[30]\id = #OBJGRAFIK_ZWEIHAENDER
      Merchants()\i[31]\id = #OBJGRAFIK_ZWEIHAENDER2
      Merchants()\i[32]\id = #OBJGRAFIK_STABAXT3
      Merchants()\i[33]\id = #OBJGRAFIK_STABAXT4
      Merchants()\i[34]\id = #OBJGRAFIK_SENSE1
      Merchants()\i[35]\id = #OBJGRAFIK_SENSE2
      For i = 36 To 39
        Merchants()\i[i]\id = #OBJGRAFIK_SCHRIFTROLLE
        Repeat
          Merchants()\i[i]\spell = Random(#ANZ_ZAUBER-1) + 1   ; effect
        Until spells(Merchants()\i[i]\spell)\duration <> #UNENDLICH
        Merchants()\i[i]\power = Random(5) + 3    ; strength
      Next
    default: ;small trader
     If type = 0
       type = Random(9)+5
     EndIf
     Select type
       Case 5:
         Merchants()\i[0]\id = #OBJGRAFIK_WASSERSCHLAUCH
         Merchants()\i[1]\id = #OBJGRAFIK_WASSERSCHLAUCH
       Case 6:
         Merchants()\i[0]\id = #OBJGRAFIK_FACKEL1
         Merchants()\i[1]\id = #OBJGRAFIK_FACKEL1
       Case 7:
         For i = 0 To 1
           Merchants()\i[i]\id = #OBJGRAFIK_SCHRIFTROLLE
           Repeat
             Merchants()\i[i]\spell = Random(#ANZ_ZAUBER-1) + 1   ; effect
           Until spells(Merchants()\i[i]\spell)\duration <> #UNENDLICH
           Merchants()\i[i]\power = Random(5) + 3    ; strength
        Next
       Case 8:
         Merchants()\i[0]\id = #OBJGRAFIK_SILBERNER_SCHLUESSEL
         Merchants()\i[1]\id = #OBJGRAFIK_GOLDENER_SCHLUESSEL
       Case 9:
         Merchants()\i[0]\id = #OBJGRAFIK_SCHAUFEL
         Merchants()\i[1]\id = #OBJGRAFIK_SPITZHACKE
       Case 10:
         Merchants()\i[0]\id = make_potion()
         Merchants()\i[1]\id = make_potion()
       Case 11:
         For i = 0 to 1
           Select(Random(4)+1)
             Case 1 : Merchants()\i[i]\id = #OBJGRAFIK_EDELSTEIN_TUERKIS
             Case 2 : Merchants()\i[i]\id = #OBJGRAFIK_EDELSTEIN_GELB
             Case 3 : Merchants()\i[i]\id = #OBJGRAFIK_EDELSTEIN_BLAU
             Case 4 : Merchants()\i[i]\id = #OBJGRAFIK_EDELSTEIN_ROT
             Case 5 : Merchants()\i[i]\id = #OBJGRAFIK_BERNSTEIN
           EndSelect
         Next
       Case 12:
         Merchants()\i[0]\id = #OBJGRAFIK_LEDERRUESTUNG1
         Merchants()\i[1]\id = #OBJGRAFIK_LEDERRUESTUNG2
       Case 13:
         Merchants()\i[0]\id = #OBJGRAFIK_STIEFEL1
         Merchants()\i[1]\id = #OBJGRAFIK_STIEFEL2
       Case 14:
         Merchants()\i[0]\id = #OBJGRAFIK_APFEL
         Merchants()\i[1]\id = #OBJGRAFIK_APFEL
      EndSelect ; small trader
  EndSelect

  For i = 0 To 55
    If item(Merchants()\i[i]\id)\qualitaet = 1
      Merchants()\i[i]\power = Random(2)+1
    ElseIf item(Merchants()\i[i]\id)\qualitaet = 3
      Merchants()\i[i]\power = 2*(Random(2)+1)
    EndIf
    If level < 10 And Merchants()\i[i]\id = #OBJGRAFIK_WASSERSCHLAUCH
       Merchants()\i[i]\id = gen_food(0)
    EndIf
  Next
  
  ; remove unique intems
   For i = 0 To 55
      If item(Merchants()\i[i]\id)\unique = 1
         unique_exists.w = 0
         foreach unique_items()
            if unique_items()\name = Merchants()\i[i]\id
               unique_exists = 1
            endif
         next
         if unique_exists = 1
            Merchants()\i[i]\id = #OBJGRAFIK_FACKEL1
         endif
      endif
   next

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 443
; FirstLine = 441
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
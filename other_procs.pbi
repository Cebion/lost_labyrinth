; Sonstige Routinen
Procedure Fenster(typ=0)

  Shared released, windowsfenster

  If windowsfenster Or typ
    CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows
    If WindowEvent()=#PB_Event_CloseWindow
      End
    EndIf
    If Not typ
      x=WindowMouseX(0)
      y=WindowMouseY(0)
      If x<1 Or x>638 Or y<1 Or y>478
        If released=0
          released=1
          ReleaseMouse(1)
        EndIf
      Else
        If released=1
          released=0
          ReleaseMouse(0)
          MouseLocate(x, y)
        EndIf
      EndIf
    EndIf
    CompilerEndSelect
  EndIf


EndProcedure

;---------------------------------------------------------------------------------

Procedure read_joystick()

Shared joystick_used
   
   If joystick_used = 1
      ExamineJoystick()
      jax = JoystickAxisX()
      jay = JoystickAxisY()
      For i = 1 To 12
         jb(i) = JoystickButton(i)
      Next
   EndIf

EndProcedure

;---------------------------------------------------------------------------------

Procedure read_mouse()

Shared no_mouse

   If no_mouse = 0
      ExamineMouse()
      mmouse_x = MouseX()
      mmouse_y = MouseY()
      mmouse_links  = MouseButton(1)
      mmouse_rechts  = MouseButton(2)
      If mmouse_x_old <> mmouse_x Or mmouse_y_old <> mmouse_y Or mmouse_links <> mmouse_links_old Or mmouse_rechts <> mmouse_rechts_old
         something_changed = 1
      EndIf
      
      If mmouse_links_wait_release And mmouse_links = 0
         mmouse_links_wait_release = 0
      EndIf
      
      If mmouse_rechts_wait_release And mmouse_rechts = 0
         mmouse_rechts_wait_release = 0
      EndIf
   EndIf

EndProcedure

;---------------------------------------------------------------------------------

Procedure end_screen(over_item.w = 0, bew_geg_x.w = 0, bew_geg_y.w = 0, delete_mode.w = 0)

   ; Maus darstellen
   If over_item = 1
      ClipSprite(#SPRITE_TILESET_ITEMS, 1*32, 25*32, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, mmouse_x, mmouse_y)
   ElseIf delete_mode = 1
      ClipSprite(#SPRITE_MOUSEPOINTER, 4*32, 1*32, 32, 32)
      DisplayTransparentSprite(#SPRITE_MOUSEPOINTER, mmouse_x, mmouse_y)
      ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*16, 2*16, 16, 16)
      DisplayTransparentSprite(#SPRITE_TILESET_ENCHANTMENTS, mmouse_x+10, mmouse_y+10)
   Else
      ; Inventory + Item move?
      If bew_geg_x > 0 Or bew_geg_y > 0
         ClipSprite(#SPRITE_TILESET_ITEMS, bew_geg_x * 32-32, bew_geg_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, mmouse_x-16, mmouse_y-16)
      Else
         draw_mousepointer(mmouse_x,mmouse_y)
      EndIf
   EndIf
   
   mmouse_x_old = mmouse_x
   mmouse_y_old = mmouse_y
   mmouse_links_old = mmouse_links
   mmouse_rechts_old = mmouse_rechts
   
   For i = 1 To 20
      used_keys(i)\pressed_old = used_keys(i)\pressed
   Next
   
   something_changed = 0
   
   FlipBuffers()

EndProcedure

;------------------------------------------------------------------------------------------------------------------

Procedure PM(p_numb.w = 0) ;calculate 2^(p_numb-1) for bitmask

   If p_numb = 0 
      p_numb = akt_spieler
   EndIf
   result.w = 1
   While p_numb > 1
      p_numb - 1
      result = result * 2
   Wend
   
   ProcedureReturn result
 
EndProcedure

;--------------------------------------------------------------------------------------------------------------

Procedure get_chance (chance_type.w)

; returns successes from the appropiate buffers
  result.w = 0
  #H_BIT = 1073741824 ; 2^30
  #H_3 = 387420489 ; 3^18
  #MOD_RANGE = (8*9*5*7*10) -1 ;lot of dividers,smaller than maxint16
  Select chance_type
    Case 50: ;50% chance: dodge etc.
      result = coin_toss & 1
      coin_toss = coin_toss/2
      If Random(99) < 50
        coin_toss + #H_BIT
      EndIf
    Case 20: ;20% break chance: normal wands shovels etc.
      result = item_break20 & 1
      item_break20 = item_break20/2
      If Random(99) < 20
        item_break20 + #H_BIT
      EndIf
    Case 15: ; 15% break chance: frozen lightning, trap toolkit etc.
      result = item_break15 & 1
      item_break15 = item_break15/2
      If Random(99) < 15
        item_break10 + #H_BIT
      EndIf
    Case 10: ; 10% break chance: elder wands + medusa head etc.
      result = item_break10 & 1
      item_break10 = item_break10/2
      If Random(99) < 10
        item_break10 + #H_BIT
      EndIf
    Case 5: ; 5% break chance: ancient wands
      result = item_break05 & 1
      item_break05 = item_break05/2
      If Random(99) < 5
        item_break05 + #H_BIT
      EndIf
    Case 3: ; 1-3 next quality rating
      result = (next_qual % 3) + 1
      next_qual = next_qual/3
      next_qual + ( Random(2) * #H_3 )
      ;xtest.l = next_qual
      ;otext.s = ""
      ;while xtest > 0
      ;  otext = otext + str(xtest%3) + ","
      ;  xtest = xtest / 3
      ;wend
      ;print(otext)
    Case 61: ; 1-6 next herb heal
      result = herb_buff(herb_buff(0))
      herb_buff(herb_buff(0)) = Random(5) + 1
      herb_buff(0) + 1
      If herb_buff(0) > #buff_size
        herb_buff(0) = 1
      EndIf
    Case 62: ; 1-6 next crysolit boost
      result = crysolit_buff(crysolit_buff(0))
      crysolit_buff(crysolit_buff(0)) = Random(5) + 1
      crysolit_buff(0) + 1
      If crysolit_buff(0) > #buff_size
        crysolit_buff(0) = 1
      EndIf
    Case 1001: ; open range with more = better (player damage)
      result = damage_buff(damage_buff(0))
      damage_buff(damage_buff(0)) = Random(#MOD_RANGE)
      damage_buff(0) + 1
      If damage_buff(0) > #buff_size
        damage_buff(0) = 1
      EndIf
    Case 1002: ; open range with more = worse (monster damage)
      result = damage_buff2(damage_buff2(0))
      damage_buff2(damage_buff2(0)) = Random(#MOD_RANGE)
      damage_buff2(0) + 1
      If damage_buff2(0) > #buff_size
        damage_buff2(0) = 1
      EndIf
    Case 999: ; next wand for thaumaturgy
      result = wand_buff(wand_buff(0))
      Select(Random(2))
        Case 0:
          wand_buff(wand_buff(0)) = #OBJGRAFIK_ZAUBERSTAB_GRUEN+Random(7)
        Case 1:
          wand_buff(wand_buff(0)) = #OBJGRAFIK_ZAUBERSTAB2+Random(6)
        Case 2:
          wand_buff(wand_buff(0)) = #OBJGRAFIK_WAND1+Random(8)
      EndSelect
      wand_buff(0) + 1
      If wand_buff(0) > #buff_size
        wand_buff(0) = 1
      EndIf
    Case 998: ; next scroll
      result = scroll_buff(scroll_buff(0))
      Repeat
        scroll_buff(scroll_buff(0)) = Random(#ANZ_ZAUBER-1) + 1   ; Effekt
      Until spells(scroll_buff(scroll_buff(0)))\duration <> #UNENDLICH And spells(scroll_buff(scroll_buff(0)))\name[1] <> "" ; Keine Lieder!
      scroll_buff(0) + 1
      If scroll_buff(0) > #buff_size
        scroll_buff(0) = 1
      EndIf
    Case 997: ; next potion
      result = alch_buff(alch_buff(0))
      alch_buff(alch_buff(0)) = make_potion() ;makes all but heroes/gods
      alch_buff(0) + 1
      If alch_buff(0) > #buff_size
        alch_buff(0) = 1
      EndIf
    Case 996: ; break chance for weapons/armor
      result = break_chance_buff(break_chance_buff(0))
      break_chance_buff(break_chance_buff(0)) = Random(#BRECHFAKTOR)
      break_chance_buff(0) + 1
      If break_chance_buff(0) > #buff_size
        break_chance_buff(0) = 1
      EndIf
    Case 995: ; next gold amount
      result = gold_buff(gold_buff(0))
      gold_buff(gold_buff(0)) = Random(255)
      gold_buff(0) + 1
      If gold_buff(0) > #buff_size
        gold_buff(0) = 1
      EndIf
    Case 994: ;next boulder content
      result = boulder_buff(boulder_buff(0))
      cont.w = Random(9)
      If cont = 0
        cont = Random(11)
        Select cont
        Case 0: cont = #OBJGRAFIK_EDELSTEIN_TUERKIS
        Case 1: cont = #OBJGRAFIK_EDELSTEIN_GELB
        Case 2: cont = #OBJGRAFIK_EDELSTEIN_BLAU
        Case 3: cont = #OBJGRAFIK_EDELSTEIN_ROT
        Case 4: cont = #OBJGRAFIK_BERNSTEIN
        Case 5: cont = #OBJGRAFIK_EDELSTEIN_GRUEN 
        Case 6: cont = #OBJGRAFIK_EDELSTEIN_WEISS 
        Case 7: cont = #OBJGRAFIK_EDELSTEIN_SCHWARZ 
        Case 8: cont = #OBJGRAFIK_JADE 
        Case 9: cont = #OBJGRAFIK_MONDSTEIN 
        Case 10: cont = #OBJGRAFIK_OPAL 
        Case 11: cont = #OBJGRAFIK_TIGERAUGE
        EndSelect
      ElseIf cont < 4
        cont = #OBJGRAFIK_STAHLKUGELN
      Else
        cont = #OBJGRAFIK_STEINE
      EndIf
      boulder_buff(boulder_buff(0)) = cont
      boulder_buff(0) + 1
      If boulder_buff(0) > #buff_size
        boulder_buff(0) = 1
      EndIf
    Case 100: ; general percent chance
      result = general_percent_buff(general_percent_buff(0))
      general_percent_buff(general_percent_buff(0)) = Random(99)
      general_percent_buff(0) + 1
      If general_percent_buff(0) > #buff_size
        general_percent_buff(0) = 1
      EndIf
    Case 101: ; spell chance
      result = spell_chance_buff(spell_chance_buff(0))
      spell_chance_buff(spell_chance_buff(0)) = Random(99)
      spell_chance_buff(0) + 1
      If spell_chance_buff(0) > #buff_size
        spell_chance_buff(0) = 1
      EndIf
    Case 102: ; lore chance
      result = lore_chance_buff(lore_chance_buff(0))
      lore_chance_buff(lore_chance_buff(0)) = Random(99)
      lore_chance_buff(0) + 1
      If lore_chance_buff(0) > #buff_size
        lore_chance_buff(0) = 1
      EndIf
    Case 103: ; chance to hit
      result = hit_chance_buff(hit_chance_buff(0))
      hit_chance_buff(hit_chance_buff(0)) = Random(99)
      hit_chance_buff(0) + 1
      If hit_chance_buff(0) > #buff_size
        hit_chance_buff(0) = 1
      EndIf
    Case 104: ; chance for critical hits
      result = critical_chance_buff(critical_chance_buff(0))
      critical_chance_buff(critical_chance_buff(0)) = Random(99)
      critical_chance_buff(0) + 1
      If critical_chance_buff(0) > #buff_size
        critical_chance_buff(0) = 1
      EndIf
    Case 105: ; chance for god bonus
      result = god_bonus_buff(god_bonus_buff(0))
      god_bonus_buff(god_bonus_buff(0)) = Random(99)
      god_bonus_buff(0) + 1
      If god_bonus_buff(0) > #buff_size
        god_bonus_buff(0) = 1
      EndIf
    Case 106: ; chance to catch a fish
      result = fish_buff(fish_buff(0))
      fish_buff(fish_buff(0)) = Random(99)
      fish_buff(0) + 1
      If fish_buff(0) > #buff_size
        fish_buff(0) = 1
      EndIf

    Default:
       ProcedureReturn 0
  EndSelect
  ProcedureReturn result

EndProcedure

;------------------------------------------------------------------------------------------------------------------

Procedure myRand(range.w) ;this should be used where larger numbers are good for player (player damage)

   If range = 0
     ProcedureReturn 0
   EndIf
   result.l = get_chance(1001)
   ;print ("myRand:("+str(range)+") = "+str(result % (range+1)))
   result = result / ( (#MOD_RANGE+1) / (range+1) )
   ProcedureReturn result

EndProcedure

;------------------------------------------------------------------------------------------------------------------

Procedure myRand2(range.w) ;this should be used where larger numbers are bad for player (monster damage)

   If range = 0
     ProcedureReturn 0
   EndIf
   result.l = get_chance(1002)
   ;print ("myRand2:("+str(range)+") = "+str(result % (range+1)))
   result = result / ( (#MOD_RANGE+1) / (range+1) )
   ProcedureReturn result

EndProcedure


;------------------------------------------------------------------------------------------------------------------


Procedure punkte()
   
   x1.w = spieler(akt_spieler)\level * 10
   x2.w = gold_anzahl() / 10
   x3.w = spieler(akt_spieler)\mks / 5
   If x2 > x1
      x2 = x1
   EndIf
   If x3 > x1
      x3 = x1
   EndIf
   punkte.w = x1 + x2 + x3
   punkte = punkte + (anz_staffpieces() * 100)
   
   ProcedureReturn punkte

EndProcedure


;------------------------------------------------------------------------------------------------------------------

Procedure anz_staffpieces()

   ; in backpack
   anz_pieces.w = 0
   For i = 1 To #MAX_RUCKSACK
      If inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_1 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_2 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_3 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_4 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_5 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_6 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_7 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_8 Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_9
         anz_pieces = anz_pieces + 1
      EndIf
   Next
   
   ; already combined
   For i = 1 To 9
      If spieler(akt_spieler)\staff_pieces[i] = 1
         anz_pieces = anz_pieces + 1
      EndIf
   Next

   ProcedureReturn anz_pieces

EndProcedure

;------------------------------------------------------------------------------------------------------------------

Procedure gewicht()

   gewicht.w = 0
   For i = 1 To #MAX_RUCKSACK
      If inventory(i,akt_spieler)\name <> 0 And item(inventory(i,akt_spieler)\name)\gewicht > 0 And inventory(i,akt_spieler)\anzahl >= 0 And inventory(i,akt_spieler)\name <= #ANZ_GEGENSTAENDE
         gewicht = gewicht + (item(inventory(i,akt_spieler)\name)\gewicht * (inventory(i,akt_spieler)\anzahl + 1))
      EndIf
   Next
   gewicht + (spieler(akt_spieler)\gold * 3) / 200
   
   
   For i = 1 To 9
      If spieler(akt_spieler)\staff_pieces[i] = 1
         gewicht = gewicht + (item(#OBJGRAFIK_STAFF_LAST_COVENANT_1)\gewicht)
      EndIf
   Next
   
   ProcedureReturn gewicht
   
EndProcedure

;------------------------------------------------------------------------------------------------------------------

; Free Magic
Procedure freie_magie()

Shared yplus, yplus2, akt_zauber_offset2, akt_zauber_offset, anzz, joystick_used, anz_zauber
   
   ; Show list for election
   akt_zauber.w = 0
   mauszauber.w = -1
   selected_spell.w = 0
   
   init_keyboard_freemagic()
   set_default_auto_repeat()
   
   something_changed = 1
   
   Repeat
      read_joystick()
      read_keyboard()
      read_mouse()
      
      If mmouse_x >= #POS_BUTTON_SPELLIST_HOCH_X And mmouse_x <= #POS_BUTTON_SPELLIST_HOCH_X + 32 And mmouse_y >= #POS_BUTTON_SPELLIST_HOCH_Y And mmouse_y <= #POS_BUTTON_SPELLIST_HOCH_Y + 32
         over_upbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If akt_zauber > 0
               akt_zauber = akt_zauber - 1
            EndIf
         EndIf 
      Else
         over_upbutton = 0
      EndIf
      
      If mmouse_x > #POS_BUTTON_SPELLIST_RUNTER_X And mmouse_x < #POS_BUTTON_SPELLIST_RUNTER_X + 32 And mmouse_y > #POS_BUTTON_SPELLIST_RUNTER_Y And mmouse_y < #POS_BUTTON_SPELLIST_RUNTER_Y + 32
         over_downbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If akt_zauber < anz_zauber - 1
               akt_zauber = akt_zauber + 1
            EndIf
         EndIf
      Else
         over_downbutton = 0
      EndIf

      ; #PB_KEY_DOWN
      If used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         If akt_zauber < anz_zauber - 1
            akt_zauber = akt_zauber + 1
         EndIf
      EndIf

      ; #PB_KEY_UP
      If used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         If akt_zauber > 0
            akt_zauber = akt_zauber - 1
         EndIf
      EndIf

      ; #PB_KEY_RETURN
      If used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         raushier = 1
         selected_spell = akt_zauber
      EndIf

      ; Mit Maus gewaehlt ?
      mauszauber = 0
      y = 52
      aktuell = 1
      If mmouse_x > 200 And mmouse_x < 460
         For i = 1 To anzz
            If mmouse_y >= y And mmouse_y <= y + yplus
               mauszauber = aktuell
            EndIf
            y = y + yplus
            aktuell = aktuell + 1
         Next
      EndIf

      If mmouse_links And mmouse_links_wait_release = 0 And mauszauber > 0
         mmouse_links_wait_release = 1
         raushier = 1
      EndIf
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raushier = 1
      EndIf

      If something_changed = 1
         ; Populate list of available spells
         liste_leeren()
         
         anz_zauber.w = 1
         For i = 1 To #ANZ_ZAUBER
            If spells(i)\level = spieler(akt_spieler)\circle And learned(akt_spieler,i) & #l_masq = 0
               If zauber_nehmen(i) = 0 And spells(i)\duration <> #UNENDLICH
                  zauberliste(anz_zauber+akt_zauber_offset2) = i
                  anz_zauber = anz_zauber + 1
               EndIf
            EndIf
         Next

         If anz_zauber = 1 ; no suitable spells found
            ProcedureReturn 0
         EndIf
         
         bubblesort()
   
         Fenster()
         ClearScreen(0)

         draw_plain_frame(-1)

         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         
         FrontColor(RGB(150,150,150))
         Box(200,200+yplus2,260,yplus)

         FrontColor(RGB(255,255,255))
         DrawText(250,25,message_text(593,1+language))
         
         
         ; Display spells
         x = 200
         y = 52
         besch = 0
         mzauber.w = -1
         For i = 1 To anzz
            FrontColor(RGB(255,255,255))  ; White
            sp_num = zauberliste(i + akt_zauber)
            If i = mauszauber
               FrontColor(RGB(1,1,255))  ; Blue
               mzauber = sp_num
            EndIf
            If sp_num  
               school.s = skills(spells(sp_num)\school,akt_spieler)\name[1+language]
               DrawText(x,y,spells(sp_num)\name[1+language]+" ("+school+")")
            EndIf
            y = y + yplus
         Next
         
         ; Description for actual spell
         If mzauber = -1
            besch = zauberliste(akt_zauber+akt_zauber_offset)
         Else
            besch = mzauber
         EndIf
         
         If besch > 0
            x = 350
            y = 390
            xadd = 150

            DrawText(x,y,nachricht4(61))
            DrawText(x+xadd,y,Str(spells(besch)\level))
            
            y = y + yplus
            cost.w = zauberkosten(besch)
            DrawText(x,y,nachricht4(101))
            DrawText(x+xadd,y,Str(spells(besch)\cost) +" ("+ Str(cost) +")" )
               
            y = y + yplus
            DrawText(x,y,nachricht4(91))
            DrawText(x+xadd,y,Str(spieler(akt_spieler)\Power_score) +" ("+ Str(Power(besch)) +")")
               
            y = y + yplus
            DrawText(x,y,nachricht4(102))
            If spells(besch)\duration = #META_MAGIC
               DrawText(x+xadd,y,"1*")
            ElseIf spells(besch)\duration = #UNENDLICH
               DrawText(x+xadd,y,nachricht4(951))
            ElseIf spells(besch)\duration = 0
               DrawText(x+xadd,y,"---")
            Else
               If skills(#CE_BESTAENDIGKEIT,akt_spieler)\gewaehlt
                  cost = 2
               Else
                  cost = 1
               EndIf
               DrawText(x+xadd,y,Str(spells(besch)\duration) +" ("+ Str(spells(besch)\duration*power(besch)*cost) +")")
            EndIf
               
            y = y + yplus
            DrawText(x,y,nachricht4(103))
            DrawText(x+xadd,y,Str(learned(akt_spieler,besch) & 127 ))

            DrawText(25,400,spells(besch)\info_1[1+language])
            DrawText(25,420,spells(besch)\info_2[1+language])
         EndIf ; besch

         StopDrawing()
         
         ; Up
         If over_upbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 6*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_SPELLIST_HOCH_X, #POS_BUTTON_SPELLIST_HOCH_Y)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 4*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_SPELLIST_HOCH_X, #POS_BUTTON_SPELLIST_HOCH_Y)
         EndIf
         
         ; Down
         If over_downbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 7*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_SPELLIST_RUNTER_X, #POS_BUTTON_SPELLIST_RUNTER_Y)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 5*32, 0, 31, 31)
            DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_SPELLIST_RUNTER_X, #POS_BUTTON_SPELLIST_RUNTER_Y)
         EndIf
         
         end_screen()
      EndIf ; something_changed
      Delay(#Input_delay)
   Until raushier = 1

   If selected_spell > 0
      learned(akt_spieler,selected_spell) = learned(akt_spieler,selected_spell) | #l_free
   Else
      learned(akt_spieler,besch) = learned(akt_spieler,besch) | #l_free
   EndIf
   message(483,#COLOR_WEISS)

EndProcedure


Procedure sound(welchen.w)

Shared sound

   If sound = 1
      PlaySound(welchen)
   EndIf

EndProcedure



Procedure min(zahl1.w, zahl2.w)

   If zahl1 > zahl2
      ProcedureReturn zahl2
   Else
      ProcedureReturn zahl1
   EndIf

EndProcedure


Procedure max(zahl1.w, zahl2.w)

   If zahl1 < zahl2
      ProcedureReturn zahl2
   Else
      ProcedureReturn zahl1
   EndIf

EndProcedure

; --------------------------------------------------------------------------------

Procedure gold_finden2(anzahl.w)

   If spieler(akt_spieler)\fluch <> #FLUCH_DES_LEPRECHAUN
      
      ; Haben wir schon einen Goldsack?
      beutel.w = 0
      For i = 1 To #MAX_RUCKSACK
         If inventory(i,akt_spieler)\name = #OBJGRAFIK_BEUTEL
            beutel = i
         EndIf
      Next
      
      ; Wenn nicht neuer Beutel!
      If beutel = 0
         i = Backpackspace()
         If i <= #MAX_RUCKSACK
            ; Goldsack
            inventory(i,akt_spieler)\name = #OBJGRAFIK_BEUTEL
         Else
            message(428,#COLOR_GRAU)
            ProcedureReturn 1 ;inv full,could not take
         EndIf
      EndIf
      If anzahl = 1
         Sound(#SOUND_GOLD1)
      Else
         Sound(#SOUND_GOLD)
      EndIf
      long.l = anzahl
      spieler(akt_spieler)\gold + long
   Else
      message(7,#COLOR_GRAU)
   EndIf
   
   ProcedureReturn 0 ;gold taken or gone

EndProcedure

; --------------------------------------------------------------------------------

Procedure gold_finden(anzahl.w)

   If spieler(akt_spieler)\fluch <> #FLUCH_DES_LEPRECHAUN
      
      nachricht3(6,anzahl,8)
      sav_act_player.w = akt_spieler
      If spieler(akt_spieler)\creature_typ > 0 And skills(#CE_BESCHWOERER,akt_spieler-1)\gewaehlt = 1
         akt_spieler - 1
      EndIf
      If skills(#CE_GOTT_DES_REICHTUMS,akt_spieler)\gewaehlt = 1 And (get_chance(105) < 600/maxlife())
         spieler(akt_spieler)\maxlifepoints + 1
         message(326,#COLOR_GRAU)
      EndIf
      akt_spieler = sav_act_player
      gold_finden2(anzahl)
   Else
      message(7,#COLOR_GRAU)
   EndIf

EndProcedure

; --------------------------------------------------------------------------------

Procedure gold_stack2()

   gold_finden2(1 + (get_chance(995)*(30+luck()))/256)
   
EndProcedure

; --------------------------------------------------------------------------------

Procedure gold_stack()

   gold_finden(1 + (get_chance(995)*(30+luck()))/256)
   
EndProcedure

; --------------------------------------------------------------------------------

Procedure gold_verlieren(anzahl.w)

   ; Wo ist der Goldsack?
   beutel.w = 0
   For i = 1 To #MAX_RUCKSACK
      If inventory(i,akt_spieler)\name = #OBJGRAFIK_BEUTEL
         beutel = i
      EndIf
   Next
    
   If beutel > 0
     long.l = anzahl
     spieler(akt_spieler)\gold - long
     If spieler(akt_spieler)\gold < 1
       spieler(akt_spieler)\gold = 0
     EndIf
   EndIf  
     

EndProcedure

; --------------------------------------------------------------------------------

Procedure gold_anzahl()

   ; Haben wir einen Goldsack?
   beutel.w = 0
   For i = 1 To #MAX_RUCKSACK
      If inventory(i,akt_spieler)\name = #OBJGRAFIK_BEUTEL
         beutel = i
      EndIf
   Next
   
   If beutel > 0
      ProcedureReturn(spieler(akt_spieler)\gold)
   Else
      ProcedureReturn(0)
   EndIf

EndProcedure

; --------------------------------------------------------------------------------

Procedure gott_check()
      
   If skills(#CE_GOTT_DES_KRIEGES,akt_spieler)\gewaehlt = 1
      If get_chance(105) < (200 / spieler(akt_spieler)\maxlifepoints)
         spieler(akt_spieler)\maxlifepoints + 1
         message(321,#COLOR_GELB)
      EndIf
   ElseIf skills(#CE_BESCHWOERER,akt_spieler-1)\gewaehlt = 1 And skills(#CE_GOTT_DES_KRIEGES,akt_spieler-1)\gewaehlt = 1
      If get_chance(105) < (200 / spieler(akt_spieler-1)\maxlifepoints)
         spieler(akt_spieler-1)\maxlifepoints + 1
         message(321,#COLOR_GELB)
      EndIf
   EndIf
   If skills(#CE_GOTT_DES_TODES,akt_spieler)\gewaehlt = 1
      If get_chance(105) < (200 / spieler(akt_spieler)\maxmana)
         spieler(akt_spieler)\maxmana + 1
         message(322,#COLOR_GELB)
      EndIf
   ElseIf skills(#CE_BESCHWOERER,akt_spieler-1)\gewaehlt = 1 And skills(#CE_GOTT_DES_TODES,akt_spieler-1)\gewaehlt = 1
      If get_chance(105) < (200 / spieler(akt_spieler-1)\maxmana)
         spieler(akt_spieler-1)\maxmana + 1
         message(322,#COLOR_GELB)
      EndIf
   EndIf

EndProcedure

   If skills(#CE_BESCHWOERER,akt_spieler-1)\gewaehlt = 1
      For i = 1 To #Anz_Skills
         If skills(i,akt_spieler-1)\gewaehlt = 1 And skills(i,akt_spieler)\pet_transferable = 1
            skills(i,akt_spieler)\gewaehlt = 1
         EndIf
      Next
   EndIf

; --------------------------------------------------------------------------------

Procedure zeige_unsichtbare(x_r.w, y_r.w)

   xx.w = 0
   yy.w = 0
   ; Unsichtbares Monster darstellen
   mon_no.w = getmonster(x_r,y_r)
   If has_trait2(mon_no,#ME_UNSICHTBAR) = 1
      If x_r > spieler(akt_spieler)\character_x
         xx = 1
      EndIf
      If x_r < spieler(akt_spieler)\character_x
         xx = -1
      EndIf
      If y_r > spieler(akt_spieler)\character_y
         yy = 1
      EndIf
      If y_r < spieler(akt_spieler)\character_y
         yy = -1
      EndIf
      sprite_x.w = monster(mon_no)\nr -1
      sprite_y.w = sprite_x / 10
      sprite_x = sprite_x % 10
      ClipSprite(#SPRITE_TILESET_MONSTER, sprite_x*32, sprite_y*32, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, 160+xx*32, 160+yy*32)
   EndIf
   
EndProcedure

; --------------------------------------------------------------------------------------

Procedure old_message(ausgabe.s, farbe.w)

   time.s = FormatDate("%hh:%ii:%ss", Date())
   i = 1
   frei = 0
   Repeat
      If old_messages(i)\message = " "
         frei = i
      EndIf
      i = i + 1
   Until frei > 0 Or i > 25
   
   If frei > 0
      old_messages(frei)\message = ausgabe
      old_messages(frei)\color   = farbe
      old_messages(frei)\time   = time
      old_messages(frei)\player   = akt_spieler
   Else
      ; schieben + eintragen
      For i = 1 To 24
         old_messages(i)\message = old_messages(i+1)\message
         old_messages(i)\color     = old_messages(i+1)\color
         old_messages(i)\time     = old_messages(i+1)\time
         old_messages(i)\player     = old_messages(i+1)\player
      Next
      old_messages(25)\message = ausgabe
      old_messages(25)\color   = farbe
      old_messages(25)\time   = time
      old_messages(25)\player   = akt_spieler
   EndIf

EndProcedure

; --------------------------------------------------------------------------------------

; Eine Nachricht nach unten links schreiben
Procedure message(text.w, farbe.w)

Shared message_text

   old_message(message_text(text,1+language),farbe)
   FlipBuffers()
   Delay(delay_animation)

EndProcedure

; --------------------------------------------------------------------------------------

; Finden/Stehlen Gegenstand
Procedure nachricht2(text.w,geg.w)

Shared message_text

    fertig = 0
      
   ; Trank
   If geg = 998
      fertig = 1
      ausgabe.s = message_text(text,1+language) + message_text(734,1+language)
   EndIf
   
   ; Schriftrolle
   If geg = 997 Or geg = #OBJGRAFIK_SCHRIFTROLLE
      fertig = 1
      ausgabe = message_text(text,1+language) + message_text(658,1+language)
   EndIf
   
   If fertig = 0
      If item(geg)\type = #ITEMTYPE_POTION
         ausgabe.s = message_text(text,1+language) + message_text(734,1+language)
      Else
         ausgabe = message_text(text,1+language) + item(geg)\name[1+language]
      EndIf
   EndIf
   old_message(ausgabe,#COLOR_GELB)
   FlipBuffers()
   Delay(delay_animation)

EndProcedure

; --------------------------------------------------------------------------------------

; Finden Gold
Procedure nachricht3(text1.w,anz.w,text2.w)

Shared message_text

   ausgabe.s = message_text(text1,1+language) + Str(anz) + message_text(text2,1+language)
   old_message(ausgabe,#COLOR_GELB)
   FlipBuffers()
   Delay(delay_animation)

EndProcedure

; --------------------------------------------------------------------------------------

; Nur Text rausschreiben
Procedure.s nachricht4(text.w)

Shared message_text

   ausgabe.s = message_text(text,1+language)
   ProcedureReturn ausgabe

EndProcedure

; --------------------------------------------------------------------------------------

; Monsterkunde
Procedure.s nachricht5(text.w,mon.w)

Shared message_text

   ausgabe.s = message_text(text,1+language) + monster(mon)\name[1+language]
   ProcedureReturn ausgabe

EndProcedure

; --------------------------------------------------------------------------------------

; Variabler Text
Procedure.s nachricht6(text.w, text2.s)

Shared message_text

   ausgabe.s = message_text(text,1+language) + text2
   ProcedureReturn ausgabe

EndProcedure

; --------------------------------------------------------------------------------------

; Eine Nachricht nach unten links schreiben
Procedure nachricht7(text.s,farbe.w)

Shared message_text

   old_message(text,farbe)
   FlipBuffers()
   Delay(delay_animation)

EndProcedure

; --------------------------------------------------------------------------------------

; Trader display gold
Procedure nachricht8(x.w,y.w,anz.l)

Shared message_text

   wohin = ScreenOutput()
   StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(255,255,1))  ; Gelb
      ausgabe.s = message_text(883,1+language) + Str(anz)
      DrawText(x,y,ausgabe)
   StopDrawing()

EndProcedure

; --------------------------------------------------------------------------------------

Procedure show_movement(mmouse_x.w, mmouse_y.w, force.w)
    Shared matrix_pos_x, matrix_pos_y, in_sight

    speed.w = spieler(akt_spieler)\Speed
    px.w = spieler(akt_spieler)\character_x
    py.w = spieler(akt_spieler)\character_y
    
    ; New movement routine
    ; if mouse is over playing field calculate on which field
    matrix_x.w = 0
    matrix_y.w = 0
    matrix_pos_x = 0
    matrix_pos_y = 0
    For matrix_x = 1 To 11
       For matrix_y = 1 To 11
          If mmouse_x >= matrix_x*32-32 And mmouse_x <= matrix_x*32 And mmouse_y >= matrix_y*32-32 And mmouse_y <= matrix_y*32
              matrix_pos_x = matrix_x
              matrix_pos_y = matrix_y
          EndIf
       Next
    Next
    
    ; create matrix of fields we could move to
   For x.b = 1 To #MATRIX_SIZE
      For y.b = 1 To #MATRIX_SIZE
         matrix(x,y) = #CLOSED
      Next
   Next

   kopiere_matrix()
   If istoutdoor() = 1 Or habich(#SPELL_LICHT) = #UNENDLICH
      insert_light(8)
   Else
      insert_light(radius()+1)
   EndIf
    
    in_sight = 0
    If matrix(matrix_pos_x+1,matrix_pos_y+1) <= radius()+1 And (matrix_pos_x <> 6 Or matrix_pos_y <> 6) And px-#HALF_MATRIX_SIZE+matrix_pos_x+1 > 0 And py-#HALF_MATRIX_SIZE+matrix_pos_y+1 > 0
        in_sight = 1
    EndIf

    If (mouse_matrix_x_old <> matrix_pos_x Or mouse_matrix_y_old <> matrix_pos_y) Or force = 1
        mouse_matrix_x_old = matrix_pos_x
        mouse_matrix_y_old = matrix_pos_y
        If in_sight = 1 Or force = 1
            ClearList(openlist()) 
            ClearList(closedlist())
            ClearList(movementlist())
            insert_knot(#HALF_MATRIX_SIZE, #HALF_MATRIX_SIZE, #HALF_MATRIX_SIZE, #HALF_MATRIX_SIZE, 0,#HALF_MATRIX_SIZE,#HALF_MATRIX_SIZE)
            
            count.w = 1
            Repeat
              result.w = astar(matrix_pos_x+1, matrix_pos_y+1)
              count + 1
            Until result > 0 Or count > 1000
            
             ; we found a way so build the movement list
             If result = 1
                xx = matrix_pos_x+1
                yy = matrix_pos_y+1
                zaehler = 1
                
                ; insert target knot
                If AddElement(movementlist())
                  movementlist()\x = matrix_pos_x + 1
                  movementlist()\y = matrix_pos_y + 1
                EndIf
                
                Repeat
                  ResetList(closedlist())
                  While NextElement(closedlist())
                    If closedlist()\x = xx And closedlist()\y = yy
                        xx = closedlist()\parent_x
                        yy = closedlist()\parent_y
                        If xx <> #HALF_MATRIX_SIZE Or yy <> #HALF_MATRIX_SIZE
                            If AddElement(movementlist())
                              movementlist()\x = xx
                              movementlist()\y = yy
                            EndIf
                        EndIf
                        Break
                    EndIf
                  Wend
                  zaehler+1
                Until (xx = #HALF_MATRIX_SIZE And yy = #HALF_MATRIX_SIZE) Or zaehler > 100  
                
            EndIf
        Else
            ClearList(openlist()) 
            ClearList(closedlist())
            ClearList(movementlist())
        EndIf
   EndIf
   
   akt_number.w = 1
    ResetList(movementlist())
    If speed >= CountList(movementlist())
        While NextElement(movementlist())
          stepnum.w  =  speed-CountList(movementlist())+akt_number-1
          If stepnum < 10
            ClipSprite(#SPRITE_NUMBERS, (stepnum)*4, 7, 4, 7)
            DisplayTransparentSprite(#SPRITE_NUMBERS, movementlist()\x*32-64+#NUMBER_POS_X, movementlist()\y*32-64+#NUMBER_POS_Y)
          Else
            ClipSprite(#SPRITE_NUMBERS,  (stepnum / 10)*4, 7, 4, 7)
            DisplayTransparentSprite(#SPRITE_NUMBERS, movementlist()\x*32-66+#NUMBER_POS_X, movementlist()\y*32-64+#NUMBER_POS_Y)
            ClipSprite(#SPRITE_NUMBERS,  (stepnum % 10)*4, 7, 4, 7)
            DisplayTransparentSprite(#SPRITE_NUMBERS, movementlist()\x*32-62+#NUMBER_POS_X, movementlist()\y*32-64+#NUMBER_POS_Y)
          EndIf
          akt_number+1
        Wend
   Else
      zaehler=0
        While NextElement(movementlist())
            If akt_number <= CountList(movementlist()) - speed
               stepnum.w  =  CountList(movementlist())-speed -akt_number + 1
               If stepnum < 10
                  ClipSprite(#SPRITE_NUMBERS,  (stepnum)*4, 0, 4, 7)
                  DisplayTransparentSprite(#SPRITE_NUMBERS, movementlist()\x*32-64+#NUMBER_POS_X, movementlist()\y*32-64+#NUMBER_POS_Y)
               Else
                  ClipSprite(#SPRITE_NUMBERS,  (stepnum/10)*4, 0, 4, 7)
                  DisplayTransparentSprite(#SPRITE_NUMBERS, movementlist()\x*32-66+#NUMBER_POS_X, movementlist()\y*32-64+#NUMBER_POS_Y)
                  ClipSprite(#SPRITE_NUMBERS,  (stepnum % 10)*4, 0, 4, 7)
                  DisplayTransparentSprite(#SPRITE_NUMBERS, movementlist()\x*32-62+#NUMBER_POS_X, movementlist()\y*32-64+#NUMBER_POS_Y)
               EndIf
               akt_number+1
            Else
               ClipSprite(#SPRITE_NUMBERS, zaehler*4, 7, 4, 7)
               zaehler+1
               DisplayTransparentSprite(#SPRITE_NUMBERS, movementlist()\x*32-64+#NUMBER_POS_X, movementlist()\y*32-64+#NUMBER_POS_Y)
            EndIf
        Wend
    EndIf
    
EndProcedure

; --------------------------------------------------------------------------------------
Procedure radius()
  
   ; Andere Gestalt?
   If habich(#SPELL_FLEDERMAUSGESTALT) > 0
      sicht = 7
   ElseIf habich(#SPELL_VOGELGESTALT) > 0
      sicht = 4
   ElseIf habich(#SPELL_KATZENGESTALT) > 0
      sicht = 6
   ElseIf habich(#SPELL_WOLFSGESTALT) > 0
      sicht = 5
   ElseIf habich(#SPELL_DRACHENGESTALT) > 0
      sicht = 4
   Else
     ; Nachtsicht ?
     nachtsicht.w = 0
     If skills(#CE_NACHTSICHT,akt_spieler)\gewaehlt = 1
        nachtsicht = 2
     EndIf
     sicht = max(spieler(akt_spieler)\light, habich(#SPELL_LICHT)) + spieler(akt_spieler)\lichtgegenstand + nachtsicht + habich(#SPELL_LIED_DER_HOFFNUNG)
   EndIf
   
   If istoutdoor() = 1 Or habich(#SPELL_LICHT) = #UNENDLICH
      sicht = 8
   EndIf 
   
    ; Kurzsichtig ?
   If skills(#CE_KURZSICHTIG,akt_spieler)\gewaehlt = 1
      sicht = sicht / 2
   EndIf
   
   ; Magical Darkness?
   If levelmod(spieler(akt_spieler)\level) = #LM_MAGICAL_DARKNESS
      sicht = sicht / 2
   EndIf
   
   If sicht < 1 Or spieler(akt_spieler)\fluch = #FLUCH_BLINDHEIT
      sicht = 1
   EndIf   
   
   ProcedureReturn sicht

EndProcedure

; --------------------------------------------------------------------------------------

Procedure show_sight()

sicht.w = radius()

Select sicht
   Case 1
      ClipSprite(#SPRITE_TILESET_SIGHT, 1, 1, 335, 335)
      DisplayTransparentSprite(#SPRITE_TILESET_SIGHT, 16, 15)
   Case 2
      ClipSprite(#SPRITE_TILESET_SIGHT, 335, 1, 335, 335)
      DisplayTransparentSprite(#SPRITE_TILESET_SIGHT, 16, 15)
   Case 3
      ClipSprite(#SPRITE_TILESET_SIGHT, 670, 1, 335, 335)
      DisplayTransparentSprite(#SPRITE_TILESET_SIGHT, 16, 15)
   Case 4
      ClipSprite(#SPRITE_TILESET_SIGHT, 1, 335, 335, 335)
      DisplayTransparentSprite(#SPRITE_TILESET_SIGHT, 16, 15)
   Case 5
      ClipSprite(#SPRITE_TILESET_SIGHT, 335, 335, 335, 335)
      DisplayTransparentSprite(#SPRITE_TILESET_SIGHT, 16, 15)
   Case 6
      ClipSprite(#SPRITE_TILESET_SIGHT, 670, 335, 335, 335)
      DisplayTransparentSprite(#SPRITE_TILESET_SIGHT, 16, 15)
   Case 7
      ClipSprite(#SPRITE_TILESET_SIGHT, 1, 670, 335, 335)
      DisplayTransparentSprite(#SPRITE_TILESET_SIGHT, 16, 15)
   Default  ; zeige alles
EndSelect

EndProcedure

; -------------------------------------------------------------------------------

Procedure has_trait2(welches.w,eigensch.w)

   gef = 0
   If monster(welches)\eigenschaft1 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft2 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft3 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft4 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft5 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft6 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft7 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft8 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft9 = eigensch
      gef = 1
   EndIf
   If monster(welches)\eigenschaft10 = eigensch
      gef = 1
   EndIf

ProcedureReturn gef

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure select_field(monster_lore.w = 0)

Shared frame, spell_x, spell_y, joystick_used
Dim saved_keys.used_key (#nr_maxkeys+1)
raus.w = 0

   for i = 1 to #nr_maxkeys
      saved_keys(i)\key = used_keys(i)\key
      saved_keys(i)\pressed = used_keys(i)\pressed
      saved_keys(i)\pressed_old = used_keys(i)\pressed_old
      saved_keys(i)\auto_repeat = used_keys(i)\auto_repeat
      saved_keys(i)\wait_release = used_keys(i)\wait_release
   next

   init_keyboard_selectfield()
   set_default_auto_repeat()

   Repeat
      read_mouse()
      read_keyboard()
      read_joystick()
      
      ; #PB_Key_Space,Return,F,L,A
      For i = 1 To 5
         If used_keys(i)\pressed And used_keys(i)\wait_release = 0
            used_keys(i)\wait_release = 1
            raus = 1
         EndIf
      Next
     
      For i = 1 To 10 ;number keys
         If used_keys(10+i)\pressed And used_keys(10+i)\wait_release = 0
            used_keys(10+i)\wait_release = 1
            raus = 1
         EndIf
      Next
      
      ; #PB_Key_Up
      If used_keys(7)\pressed And used_keys(7)\wait_release = 0
         used_keys(7)\wait_release = 1
         spell_y = spell_y - 1
      EndIf
     
      ; #PB_Key_Down
      If used_keys(8)\pressed And used_keys(8)\wait_release = 0
         used_keys(8)\wait_release = 1
         spell_y = spell_y + 1
      EndIf
     
      ; #PB_Key_Left
      If used_keys(9)\pressed And used_keys(9)\wait_release = 0
         used_keys(9)\wait_release = 1
         spell_x = spell_x - 1
      EndIf
     
      ; #PB_Key_Left
      If used_keys(10)\pressed And used_keys(10)\wait_release = 0
         used_keys(10)\wait_release = 1
         spell_x = spell_x + 1
      EndIf
      
      ; #PB_Key_Escape
      If used_keys(6)\pressed And used_keys(6)\wait_release = 0
         used_keys(6)\wait_release = 1
         for i = 1 to #nr_maxkeys
            used_keys(i)\key = saved_keys(i)\key
            used_keys(i)\pressed = saved_keys(i)\pressed
            used_keys(i)\pressed_old = saved_keys(i)\pressed_old
            used_keys(i)\auto_repeat = saved_keys(i)\auto_repeat
            used_keys(i)\wait_release = saved_keys(i)\wait_release
         next
         procedurereturn 0
      endif
      
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         for i = 1 to #nr_maxkeys
            used_keys(i)\key = saved_keys(i)\key
            used_keys(i)\pressed = saved_keys(i)\pressed
            used_keys(i)\pressed_old = saved_keys(i)\pressed_old
            used_keys(i)\auto_repeat = saved_keys(i)\auto_repeat
            used_keys(i)\wait_release = saved_keys(i)\wait_release
         next
         procedurereturn 0
      EndIf
      
      If spell_x > 4
         spell_x = 4
      EndIf
      If spell_y > 4
         spell_y = 4
      EndIf
      If spell_x < -4
         spell_x = -4
      EndIf
      If spell_y < -4
         spell_y = -4
      EndIf

      if something_changed = 1
         Fenster()
         laby_screen2()

         x = 30
         y = 30
         mouseclick = 0
         For i = 1 To 9
            For j = 1 To 9
               If mmouse_x >= x + i * 32 - 32 And mmouse_x <= x + i * 32 And mmouse_y >=  y + j * 32 - 32 And mmouse_y <= y + j * 32
                  if mmouse_x <> mmouse_x_old or mmouse_y <> mmouse_y_old
                     spell_x = i - 5
                     spell_y = j - 5
                  endif
                  If mmouse_links And mmouse_links_wait_release = 0
                     mmouse_links_wait_release = 1
                     mouseclick = 1
                  EndIf
               EndIf
            Next
         Next
         
         ; Display fieldname for cursor
         if monster_lore = 1
            If matrix(#HALF_MATRIX_SIZE+spell_x, #HALF_MATRIX_SIZE+spell_y) <= radius()
               mon.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               if mon And ( has_trait2(mon, #ME_UNSICHTBAR) = 0 Or habich(#SPELL_UNSICHTBARES_SEHEN) Or habich(#SPELL_GEISTERTANZ) Or skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt)
                  was.s = monster(mon)\name[language+1]
               else
                  akt_tile.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                  was = fields(akt_tile)\description[1+language]
               endif
               x = 25
               yn = #NACHRICHTEN_POSY-15
               wohin = ScreenOutput()
               StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))
               DrawText(x,yn,was)
               StopDrawing()
            endif
         endif
      
         ; Auswahlfeld
         ClipSprite(#SPRITE_TILESET_LABYRINTH, 0, 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_LABYRINTH, 160+spell_x*32, 160+spell_y*32)
      
         end_screen()
      endif
   
      delay(#Input_delay)
   until raus = 1 or mouseclick = 1
   for i = 1 to #nr_maxkeys
      used_keys(i)\key = saved_keys(i)\key
      used_keys(i)\pressed = saved_keys(i)\pressed
      used_keys(i)\pressed_old = saved_keys(i)\pressed_old
      used_keys(i)\auto_repeat = saved_keys(i)\auto_repeat
      used_keys(i)\wait_release = saved_keys(i)\wait_release
   next
   procedurereturn 1

EndProcedure

; --------------------------------------------------------------------------------------

Procedure neuer_level()

   spieler(akt_spieler)\level = spieler(akt_spieler)\level + 1
   
   ; Spielende?
   If spieler(akt_spieler)\level > #MAX_EBENEN
      ende()
   EndIf
   
   ClearList(movementlist())
   
   If spieler(akt_spieler)\level > spieler(akt_spieler)\maxlevel

      spieler(akt_spieler)\maxlevel = spieler(akt_spieler)\level
      spieler(akt_spieler+1)\maxlevel = spieler(akt_spieler)\maxlevel ;set maxlevel for creature too

      spieler(akt_spieler)\udjat_ben = 1
   
      ; Bei Ley Kontakt Aktive Zauber beenden
      If skills(#CE_LEYKONTAKT,akt_spieler)\gewaehlt = 1
         For j = 1 To #ACTIVE_SLOTS
            If aktive(j,akt_spieler)\dauer > 0 And aktive(j,akt_spieler)\dauer <> #UNENDLICH
               aktive(j,akt_spieler)\nr = 0
               aktive(j,akt_spieler)\staerke = 0
               aktive(j,akt_spieler)\dauer = 0
            EndIf
         Next
         spieler(akt_spieler)\Mana = maxmana()
      EndIf
      
      ; First Aid ?
      If skills(#CE_HEILKUNDE,akt_spieler)\gewaehlt = 1
         spieler(akt_spieler)\Lifepoints = maxlife()
      EndIf
      
      ; Archery ?
      If skills(#CE_BOGENSCHIESSEN,akt_spieler)\gewaehlt = 1
         ; 10 neue Pfeile
         in_rucksack(#OBJGRAFIK_PFEIL,1)
      EndIf
      
      ; Pfeilmacher ?
      If skills(#CE_PFEILMACHER,akt_spieler)\gewaehlt = 1
         ; 10 neue Spezial Pfeile
         hugo.w = MyRand(6)+1
         Select(hugo)
            Case 1: geg.w = #OBJGRAFIK_KOECHER
            Case 2: geg.w = #OBJGRAFIK_PFEILE_SCHWARZ
            Case 3: geg.w = #OBJGRAFIK_ZAUBERPFEIL
            Case 4: geg.w = #OBJGRAFIK_PFEIL1
            Case 5: geg.w = #OBJGRAFIK_PFEIL2
            Case 6: geg.w = #OBJGRAFIK_PFEIL3
            Case 7: geg.w = #OBJGRAFIK_PFEIL4
         EndSelect
         in_rucksack(geg,1)
      EndIf
      
      ; Haendler ?
      If skills(#CE_HAENDLER,akt_spieler)\gewaehlt = 1 And skill_trader(spieler(akt_spieler)\level) >= 0
        merchant(skill_trader(spieler(akt_spieler)\level))
      EndIf
      
      ; Soeldner ?
      If skills(#CE_SOELDNER,akt_spieler)\gewaehlt = 1
         gold_finden2(spieler(akt_spieler)\level*5)
      EndIf
      
      ; Natural Mana ?
      If skills(#CE_NATURAL_MANA,akt_spieler)\gewaehlt = 1 And spieler(akt_spieler)\level % 2 = 0
         spieler(akt_spieler)\Mana+1
         spieler(akt_spieler)\MaxMana+1
      EndIf
      
      ; Verflucht ?
      If skills(#CE_VERFLUCHT,akt_spieler)\gewaehlt = 1 And level_curse(spieler(akt_spieler)\level)
         message(29,#COLOR_GRAU)
         If spieler(akt_spieler)\fluch = 0
            spieler(akt_spieler)\fluch = level_curse(spieler(akt_spieler)\level)
            If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
               Sound(#SOUND_CHICKEN)
            Else
               Sound(#SOUND_DARKNESS)
            EndIf
            spieler(akt_spieler)\fluchdauer = Random(6) + 5 + spieler(akt_spieler)\level
         Else
            spieler(akt_spieler)\fluchdauer = spieler(akt_spieler)\fluchdauer + Random(6) + 5 + spieler(akt_spieler)\level
         EndIf
      EndIf
   EndIf ; Neuer maxlevel

   ; Schon erschaffen?
   If groesse(spieler(akt_spieler)\level) = 0
      gen_laby(spieler(akt_spieler)\level)
   EndIf

   If sonderlevel(spieler(akt_spieler)\level) > 0
      sonderlevel_text(sonderlevel(spieler(akt_spieler)\level))
   EndIf
   
   If levelmod(spieler(akt_spieler)\level) > 0
      levelmodtext(levelmod(spieler(akt_spieler)\level))
   EndIf
         
   spieler(akt_spieler)\character_x = eingangx(spieler(akt_spieler)\level)
   spieler(akt_spieler)\character_y = eingangy(spieler(akt_spieler)\level)
   spieler(akt_spieler)\Speed = maxspeed()
   ;set creature (if any) at same position
   spieler(akt_spieler+1)\character_x = eingangx(spieler(akt_spieler)\level)
   spieler(akt_spieler+1)\character_y = eingangy(spieler(akt_spieler)\level)
   spieler(akt_spieler+1)\level = spieler(akt_spieler)\level

EndProcedure

; --------------------------------------------------------------------------------

Procedure vorheriger_level()

   spieler(akt_spieler)\level = spieler(akt_spieler)\level - 1
   
   spieler(akt_spieler)\character_x = ausgangx(spieler(akt_spieler)\level)
   spieler(akt_spieler)\character_y = ausgangy(spieler(akt_spieler)\level)
   spieler(akt_spieler)\Speed = maxspeed()
   ;set creature (if any) at same position
   spieler(akt_spieler+1)\character_x = eingangx(spieler(akt_spieler)\level)
   spieler(akt_spieler+1)\character_y = eingangy(spieler(akt_spieler)\level)
   spieler(akt_spieler+1)\level = spieler(akt_spieler)\level

   If sonderlevel(spieler(akt_spieler)\level) > 0
      sonderlevel_text(sonderlevel(spieler(akt_spieler)\level))
   EndIf
   
   If levelmod(spieler(akt_spieler)\level) > 0
      levelmodtext(levelmod((spieler(akt_spieler)\level)))
   EndIf

EndProcedure

; --------------------------------------------------------------------------------

Procedure naechster()

Shared xmod, ymod

   If nr_of_players > 1

      ; gibts noch aktive spieler?
      aktiv = 0
      For i = 1 To nr_of_players
         If spieler(i)\Status = 1 
            aktiv = 1
         EndIf
      Next

      ; Wenn ja weiterschalten auf naechsten aktiven
      If aktiv = 1
         Repeat
            akt_spieler = akt_spieler + 1
            If akt_spieler > nr_of_players
               akt_spieler = 1
            EndIf
         Until spieler(akt_spieler)\Status = 1
      EndIf

      xmod = 0
      ymod = 0
      laby_screen()
      Delay(delay_animation)
      
   EndIf

EndProcedure

; --------------------------------------------------------------------------------------

Procedure spielerschaden(schaden.w, farbe.w, sterbegrund.w, modx.w = 0, mody.w = 0)

Shared frame
   ; #ROD_EXPLOSION = 15
   ; #ROD_BOTCH = 16

   resi.w = 0
   If sterbegrund = #ROD_FROSTBALL Or sterbegrund = #ROD_FREEZING Or sterbegrund = #ROD_FROSTBREATHING
      resi = cold_resistance()
   Elseif sterbegrund = #ROD_FIREBALL Or sterbegrund = #ROD_FIRE Or sterbegrund = #ROD_FIRELANCE Or sterbegrund = #ROD_FIREBREATHING
      resi = fire_resistance()
   Elseif sterbegrund = #ROD_LIGHTNING
      resi = lightning_resistance()
   EndIf
   resi = 100 - resi
   schaden = (schaden * resi ) / 100

   ; Abziehen
   spieler(akt_spieler)\LifePoints = spieler(akt_spieler)\Lifepoints - schaden
   
   if (sterbegrund <> #ROD_FIRELANCE)
      laby_screen2()
   endif
   ; Fleck darstellen
   ClipSprite(#SPRITE_TILESET_PROJEKTILE, (farbe-1)*32, 7*32, 32, 32)
   DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+modx*32, 160+mody*32)
   Sound(Random(12))
   ; Schaden darstellen
   If farbe < 4
   wohin = ScreenOutput()
      StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(255,255,255))  ; Weiss
      xx=176: yy= 168
      DrawText(xx-TextWidth((Str(schaden)))/2+modx*32,yy+mody*32,Str(schaden))
      StopDrawing()
   EndIf
   FlipBuffers()
   Delay(delay_animation)

   ; Bei Fallgrube nicht toeten!
   If sterbegrund = #ROD_TRAPDOOR And spieler(akt_spieler)\LifePoints < 1
      spieler(akt_spieler)\Lifepoints = 1
   EndIf
   ; Spieler Tot ?
   If spieler(akt_spieler)\LifePoints < 1 Or farbe = 4
      spieler(akt_spieler)\cause_of_death = sterbegrund
      tot()
   EndIf

EndProcedure

; --------------------------------------------------------------------------------------

; Skelett
Procedure aufstehen(nr.w , sprite.w = #SPRITE_TILESET_MONSTER , mode.w = 0)

Shared xmod, ymod, frame

   Select sprite
     Case #SPRITE_TILESET_MONSTERANIM: columns.w = 8
     Case #SPRITE_TILESET_CHARACTER: columns.w = 8
     Default: columns.w = 10
   EndSelect
   nr = nr - 1
   inhalt_x.w = nr % columns
   inhalt_y.w = nr / columns

   i = 1
   stepsize.w = 1

   Repeat
      starttime.l = ElapsedMilliseconds()
      laby_screen2()
      ;tile.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld
      ;If fields(tile)\attri_floor
      ;   bg.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\stat2
      ;Else
      ;   bg.w = 0
      ;EndIf
      ;draw_tile(tile, #HALF_MATRIX_SIZE+xmod, #HALF_MATRIX_SIZE+ymod, 0, 0, bg)
      ;mon_no = getmonster(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
      ;If mon_no
      ;  draw_monster(#HALF_MATRIX_SIZE+xmod, #HALF_MATRIX_SIZE+ymod, 0, 0)
      ;EndIf
      ;If laby_item(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\name[spieler(akt_spieler)\level] > 0
      ;  draw_item(laby_item(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\name[spieler(akt_spieler)\Level],#HALF_MATRIX_SIZE+xmod, #HALF_MATRIX_SIZE+ymod, 0, 0)
      ;EndIf


      ClipSprite(sprite, inhalt_x * 32, inhalt_y * 32, 32, i)
      If mode = 0
         DisplayTransparentSprite(sprite, 160+xmod*32, 160+ymod*32+(32-i))
      Else
         If mode & 1 ;north
            DisplayTransparentSprite(sprite, 160 + 0*32, 160 -1*32 +(32-i))
         EndIf
         If mode & 2 ;east
            DisplayTransparentSprite(sprite, 160 + 1*32, 160 +0*32 +(32-i))
         EndIf
         If mode & 4 ;south
            DisplayTransparentSprite(sprite, 160 + 0*32, 160 +1*32 +(32-i))
         EndIf
         If mode & 8 ;west
            DisplayTransparentSprite(sprite, 160  -1*32, 160 +0*32 +(32-i))
         EndIf
      EndIf
 
      restaurieren()
      
      end_screen()
      timediff.l = ElapsedMilliseconds()-starttime
      ;print(str(timediff)+" ")
      If timediff < (delay_animation2 * stepsize) / 2
         delay((delay_animation2 * stepsize) / 2 - timediff)
      Else ;increase stepsize so next time we should need delay
         stepsize = (timediff*2 + delay_animation2 - 1) / delay_animation2 
      EndIf
      i= i + stepsize
   Until i > 32

EndProcedure

; --------------------------------------------------------------------------------------

; Wassermonster
Procedure aufstehen2(nr.w)

Shared xmod, ymod, frame

   nr = nr - 1
   sprite_x.w = nr % 10
   sprite_y.w = nr / 10

   For i = 1 To 32
      laby_screen2()
      ; Water
      draw_tile(labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)\feld, #HALF_MATRIX_SIZE+xmod, #HALF_MATRIX_SIZE+ymod, 0, 0, -1)
      
      ClipSprite(#SPRITE_TILESET_MONSTER, sprite_x * 32, sprite_y * 32, 32, i)
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, 160+xmod*32, 160+ymod*32+(32-i))

      restaurieren()
      
      end_screen()
      Delay(delay_animation2/2)
   Next

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure aus_schule(spell.w)

   schule.w = 0
   If (spells(spell)\summoning > 0 Or spells(spell)\school = #school_summon) And skills(#CE_BESCHWOERER,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_basic And skills(#CE_KEINE_BASISMAGIE,akt_spieler)\gewaehlt = 0
     schule = 1
   EndIf
   If spells(spell)\school = #school_earth And (skills(#CE_ERDMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1)
     schule = 1
   EndIf
   If spells(spell)\school = #school_fire And (skills(#CE_FEUERMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1)
     schule = 1
   EndIf
   If spells(spell)\school = #school_black And skills(#CE_SCHWARZE_MAGIE,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_druid And skills(#CE_DRUIDENMAGIE,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_water And (skills(#CE_WASSERMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1)
     schule = 1
   EndIf
   If spells(spell)\school = #school_star And skills(#CE_STERNENMAGIE,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_air And (skills(#CE_LUFTMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1)
     schule = 1
   EndIf
   If spells(spell)\school = #school_white And skills(#CE_WEISSE_MAGIE,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_bard And skills(#CE_ZAUBERLIEDER,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_illusion And skills(#CE_ILLUSIONSMAGIE,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_high And skills(#CE_HOHE_MAGIE,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_witch And skills(#CE_HEXEREI,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf
   If spells(spell)\school = #school_warlock And skills(#CE_WARLOCK,akt_spieler)\gewaehlt = 1
     schule = 1
   EndIf

   ProcedureReturn schule

EndProcedure

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 1371
; FirstLine = 1353
; Folding = --------
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
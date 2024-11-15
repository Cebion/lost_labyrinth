
Procedure leeren(feld)

   If inventory(feld,akt_spieler)\anzahl > 0
      inventory(feld,akt_spieler)\anzahl = inventory(feld,akt_spieler)\anzahl - 1
      If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION
        ; re-fill count for ammunition
        inventory(feld,akt_spieler)\status = item(inventory(feld,akt_spieler)\name)\attri1
      EndIf
   Else
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BEUTEL   ; Gold gestohlen?
         spieler(akt_spieler)\gold - Random(spieler(akt_spieler)\level * 2) + 1
         If spieler(akt_spieler)\gold < 1
            spieler(akt_spieler)\gold = 0
         EndIf
      Else
         ; remove item from unique list
         If item(inventory(feld,akt_spieler)\name)\unique = 1
            ForEach unique_items()
               If unique_items()\name = inventory(feld,akt_spieler)\name
                  DeleteElement(unique_items())
               EndIf
            Next
         EndIf
         
         inventory(feld,akt_spieler)\name = 0
         inventory(feld,akt_spieler)\benutzt = 0
         inventory(feld,akt_spieler)\status = 0
         inventory(feld,akt_spieler)\anzahl = 0
         inventory(feld,akt_spieler)\attri5 = 0
      EndIf
   EndIf

EndProcedure



Procedure Backpackspace()

   i.w = 1
   Repeat
      If inventory(i,akt_spieler)\name = 0 
         ProcedureReturn i
      EndIf 
      i = i + 1
   Until i > #MAX_RUCKSACK
   
     ProcedureReturn i

EndProcedure


Procedure was_last_piece()

   finished = 1
   for act_piece = 1 to 9
      if spieler(akt_spieler)\staff_pieces[act_piece]=0
         finished = 0
      endif
   next
   if finished = 1
      ende()
   endif

EndProcedure


Procedure okaybox(feld)

Shared yplus, joystick_used, no_mouse

   xx.w = 90
   yy.w = 250
   xxx.w = 190
   yyy.w = 250
   
   init_keyboard_okaybox()
         
   Repeat
      read_joystick()
      read_mouse()
      read_keyboard()
   
      ; #PB_KEY_Y
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         raus = 1
      EndIf
   
      ; #PB_KEY_Z
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         raus = 1
      EndIf
      
      ; #PB_KEY_N
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         raus = 2
      EndIf
      
      ; Okay Button
      If mmouse_x > xx And mmouse_x < xx+90 And mmouse_y > yy And mmouse_y < yy+28
         over_okaybutton = 1
         If mmouse_links  = 1
            raus = 1
         EndIf
      Else
         over_okaybutton = 0
      EndIf
      
      ; Back Button
      If mmouse_x > xxx And mmouse_x < xxx+90 And mmouse_y > yyy And mmouse_y < yyy+28
         over_backbutton = 1
         If mmouse_links  = 1
            raus = 2
         EndIf
      Else
         over_backbutton = 0
      EndIf
         
      if something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         laby_rahmen()
         show_logo()
         show_varys(1)
         show_buttons()

         ClipSprite(#SPRITE_TILESET_FSI1, 1, 1, 335, 335)
         DisplayTransparentSprite(#SPRITE_TILESET_FSI1, 16, 16)
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))
         DrawText(60, 300,message_text(740, 1+language))
         DrawText(60, 315,message_text(741, 1+language))

         x = 90
         y = 170
         DrawText(x,y,message_text(705,1+language))
         y = y + 15
         was.s = item(inventory(feld,akt_spieler)\name)\name[language+1]
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_SCHRIFTROLLE And skills(#CE_ZAUBERSCHRIFT,akt_spieler)\gewaehlt = 0 And inventory(feld,akt_spieler)\status = 0
            was = message_text(658,1+language)
         EndIf
         If inventory(feld,akt_spieler)\name >= #OBJGRAFIK_TRANK1 And inventory(feld,akt_spieler)\name <= #OBJGRAFIK_TRANK1+#ANZ_TRAENKE-1 And mischen(inventory(feld,akt_spieler)\name-#OBJGRAFIK_TRANK1)\learned & PM() = 0 And inventory(feld,akt_spieler)\status = 0
            was = message_text(734,1+language)
         EndIf
         If inventory(feld,akt_spieler)\name >= #OBJGRAFIK_PILZE_SCHWARZ And inventory(feld,akt_spieler)\name <= #OBJGRAFIK_PILZE_SCHWARZ+#ANZ_PILZE-1 And mush_known(inventory(feld,akt_spieler)\name-#OBJGRAFIK_PILZE_SCHWARZ) & PM() = 0 And inventory(feld,akt_spieler)\status = 0
            was = message_text(585,1+language)
         EndIf
         DrawText(x,y,message_text(704,1+language) + " (" + was + ")")
         StopDrawing()
      
         ; Okay Button darstellen
         If over_okaybutton = 1
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS2, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS2, xx, yy)
         
         
         ; Back Button darstellen
         If over_backbutton = 1
            ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 0, 87, 32)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS3, 0, 31, 87, 32)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS3, xxx, yyy)
      
         end_screen()
     endif ; something_changed
     delay(#Input_delay)
  Until raus > 0
  something_changed = 1
  If raus = 1
     ProcedureReturn 1
  Else
     ProcedureReturn 0
  EndIf

EndProcedure


Procedure zerstoeren(feld)

   If okaybox(feld) = 1
      If inventory(feld,akt_spieler)\benutzt = 0
         leeren(feld)
      Else
         message(719,#COLOR_WEISS)
      EndIf
   EndIf
   init_keyboard_inventory()

EndProcedure


Procedure alchemie(feld.w)

Shared aktion

   If skills(#CE_ALCHEMIE,akt_spieler)\gewaehlt = 1
      leeren(feld)
      in_rucksack(get_chance(997),1) ;997 returns next potion
      aktion = 1
   EndIf

EndProcedure


Procedure umwandeln(feld.w)

Shared aktion

   geg.w = 0
   welche = select_inventory(565)
   gewa.w = 0
   
   ; Pfeile
   If item(inventory(welche,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION
      gewa = 1
      ; Oger Pfeile
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_TIGERAUGE Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_ROT Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_BERNSTEIN 
         geg = #OBJGRAFIK_PFEILE_SCHWARZ
      EndIf 
      ; Durchschlagende
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_BLAU Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_OPAL Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_WEISS
         geg = #OBJGRAFIK_PFEIL3
      EndIf
      ; Explodierende
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GELB Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_WEISS
         geg = #OBJGRAFIK_PFEIL4
      EndIf
      ; Giftpfeile
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GRUEN Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_TUERKIS Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_JADE
         geg = #OBJGRAFIK_PFEIL2
      EndIf
      ; Elfenpfeile
       If inventory(feld,akt_spieler)\name = #OBJGRAFIK_MONDSTEIN Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_SCHWARZ
          geg = #OBJGRAFIK_ZAUBERPFEIL
       EndIf
   EndIf
   
   ; Schwert?
   If item(inventory(welche,akt_spieler)\name)\klasse = #KLASSE_SCHWERT
      gewa = 1
      ; Flammenschwert
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_TIGERAUGE Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_ROT Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_BERNSTEIN 
         geg = #OBJGRAFIK_FLAMMENSCHWERT
      EndIf 
      ; Eisschwert
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_BLAU Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_OPAL
         geg = #OBJGRAFIK_EISSCHWERT
      EndIf
      ; Lichtschwert
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GELB Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_WEISS
         geg = #OBJGRAFIK_SCHWERT_DES_LICHTS
      EndIf
      ; Giftschwert
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GRUEN Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_TUERKIS Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_JADE
         geg = #OBJGRAFIK_GIFTSCHWERT
      EndIf
      ; Demonslayer
       If inventory(feld,akt_spieler)\name = #OBJGRAFIK_MONDSTEIN
          geg = #OBJGRAFIK_SCHWERT2
       EndIf
      ; Dragonslayer
       If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_SCHWARZ
          geg = #OBJGRAFIK_SCHWERT2
       EndIf
   EndIf
   
   ; Axt
   If item(inventory(welche,akt_spieler)\name)\klasse = #KLASSE_AXT
      gewa = 1
      ; Flammenaxt
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_TIGERAUGE Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_ROT Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_BERNSTEIN 
         geg = #OBJGRAFIK_FEUERAXT
      EndIf 
      ; Eisaxt
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_BLAU Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_OPAL Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_MONDSTEIN
         geg = #OBJGRAFIK_EISAXT
      EndIf
      ; Lichtaxt
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GELB Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_WEISS
         geg = #OBJGRAFIK_LICHTAXT
      EndIf
      ; Giftaxt
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GRUEN Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_TUERKIS Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_JADE
         geg = #OBJGRAFIK_GIFTAXT
      EndIf
   EndIf
   
   ; Speer?
   If item(inventory(welche,akt_spieler)\name)\klasse = #KLASSE_SPEER
      gewa = 1
      ; Flammenspeer
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_TIGERAUGE Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_ROT Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_BERNSTEIN 
         geg = #OBJGRAFIK_FEUERSPEER
      EndIf 
      ; Eisspeer
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_BLAU Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_OPAL Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_MONDSTEIN
         geg = #OBJGRAFIK_EISSPEER
      EndIf
      ; Lichtspeer
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GELB Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_WEISS
         geg = #OBJGRAFIK_LICHTSPEER
      EndIf
      ; Giftspeer
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GRUEN Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_TUERKIS Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_JADE
         geg = #OBJGRAFIK_GIFTSPEER
      EndIf
   EndIf
      
   ; Hammer?
   If item(inventory(welche,akt_spieler)\name)\klasse = #KLASSE_HAMMER
      gewa = 1
      ; Flammen_HAMMER
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_TIGERAUGE Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_ROT Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_BERNSTEIN 
         geg = #OBJGRAFIK_FEUER_HAMMER
      EndIf 
      ; Eis_HAMMER
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_BLAU Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_OPAL Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_MONDSTEIN
         geg = #OBJGRAFIK_EIS_HAMMER
      EndIf
      ; Licht_HAMMER
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GELB Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_WEISS
         geg = #OBJGRAFIK_LICHT_HAMMER
      EndIf
      ; Gift_HAMMER
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_GRUEN Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_EDELSTEIN_TUERKIS Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_JADE
         geg = #OBJGRAFIK_GIFT_HAMMER
      EndIf
   EndIf
      
   If gewa = 0
      message(566,#COLOR_WEISS)
   Else
      If geg > 0
         leeren(feld)
         leeren(welche)
         in_rucksack(geg,1)
         aktion = 1
         message(567,#COLOR_WEISS)
      EndIf
   EndIf ; Nur mit Schwertern
   init_keyboard_inventory()

EndProcedure


Procedure mischung(feld.w)

Shared aktion

   welche = select_inventory(729)
   
   If feld = welche
      message(731,#COLOR_WEISS)
   Else
      If item(inventory(welche,akt_spieler)\name)\type = #ITEMTYPE_POTION
         prob.w = mischen(inventory(welche,akt_spieler)\name-#OBJGRAFIK_TRANK1)\result
         aktion = 1
         leeren(feld)
         leeren(welche)
         If prob = #UNENDLICH
            message(732,#COLOR_WEISS)
            spielerschaden(2,1,#ROD_EXPLOSION)
         Else
            in_rucksack(prob,1)
            message(733,#COLOR_WEISS)
         EndIf
      Else
         message(730,#COLOR_WEISS)
      EndIf
   EndIf
   init_keyboard_inventory()

EndProcedure


Procedure reparieren(feld.w)

Shared aktion

   inventory(feld,akt_spieler)\status = 0
   Sound(#SOUND_METAL)
   aktion = 1
   Delay(delay_animation)

EndProcedure


Procedure move_int(a.w,b.w)
  
   If a = b Or a = 0 Or b = 0
      ProcedureReturn 0
   EndIf
   ; Stack identical items
   If inventory(b,akt_spieler)\name = inventory(a,akt_spieler)\name And inventory(b,akt_spieler)\status = inventory(a,akt_spieler)\status And inventory(b,akt_spieler)\name <> 0 And inventory(b,akt_spieler)\benutzt = 0 And inventory(a,akt_spieler)\benutzt = 0 And inventory(b,akt_spieler)\attri5 = inventory(a,akt_spieler)\attri5 And inventory(a,akt_spieler)\name <> #OBJGRAFIK_WASSERSCHLAUCH  And item(inventory(b,akt_spieler)\name)\type <> #ITEMTYPE_AMMUNITION 
      inventory(b,akt_spieler)\anzahl = inventory(b,akt_spieler)\anzahl + 1
      leeren(a)
   ElseIf inventory(b,akt_spieler)\name = inventory(a,akt_spieler)\name And item(inventory(b,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION And inventory(b,akt_spieler)\benutzt = 0 And inventory(a,akt_spieler)\benutzt = 0 And inventory(b,akt_spieler)\attri5 = inventory(a,akt_spieler)\attri5 
      ;stack arrows
      s_size.w = item(inventory(b,akt_spieler)\name)\attri1 
      source.w = inventory(a,akt_spieler)\status + (inventory(a,akt_spieler)\anzahl * s_size)
      target.w = inventory(b,akt_spieler)\status + (inventory(b,akt_spieler)\anzahl * s_size)
      target = target + source
      If (target % s_size) = 0
         inventory(b,akt_spieler)\status = s_size
         inventory(b,akt_spieler)\anzahl = target / s_size - 1
      Else
         inventory(b,akt_spieler)\status = target % s_size
         inventory(b,akt_spieler)\anzahl = target / s_size
      EndIf
      inventory(a,akt_spieler)\anzahl = 0
      inventory(a,akt_spieler)\status = 0
      leeren(a)
   Else
      ;switch content of inventory slots
      sav.w = inventory(b,akt_spieler)\name
      inventory(b,akt_spieler)\name    = inventory(a,akt_spieler)\name
      inventory(a,akt_spieler)\name = sav

      sav = inventory(b,akt_spieler)\status
      inventory(b,akt_spieler)\status  = inventory(a,akt_spieler)\status
      inventory(a,akt_spieler)\status = sav

      sav = inventory(b,akt_spieler)\benutzt
      inventory(b,akt_spieler)\benutzt = inventory(a,akt_spieler)\benutzt
      inventory(a,akt_spieler)\benutzt = sav

      sav = inventory(b,akt_spieler)\anzahl
      inventory(b,akt_spieler)\anzahl  = inventory(a,akt_spieler)\anzahl
      inventory(a,akt_spieler)\anzahl = sav

      sav = inventory(b,akt_spieler)\attri5
      inventory(b,akt_spieler)\attri5  = inventory(a,akt_spieler)\attri5
      inventory(a,akt_spieler)\attri5 = sav
   EndIf

EndProcedure


Procedure describe(feld.w,x.w,y.w,sx.w = -1, sy.w = -1)

  name.w = inventory(feld,akt_spieler)\name
  type.w = item(name)\type
  line1.s = ""
  line2.s = ""
  line3.s = ""
  
  If name = 0 ;empty ->do nothing
    ProcedureReturn 0
  EndIf
  
  If item(name)\qualitaet = 1 Or item(name)\qualitaet = 3 ;items with quality rating
    line3 = line3 + " +" + Str(inventory(feld,akt_spieler)\attri5)
  EndIf
  line3 = line3 + item(name)\info[1+language]
  If item(name)\qualitaet = 2  ;items with charges
    line3 = item(name)\info[1+language] + ". "+ message_text(548,language+1) + Str(inventory(feld,akt_spieler)\status) + " / " + Str(item(name)\attri1)
  EndIf


  ; describe potion if they are known
  If name >= #OBJGRAFIK_TRANK1 And name <= #OBJGRAFIK_TRANK1+#ANZ_TRAENKE-1
  
    If mischen(inventory(feld,akt_spieler)\name-#OBJGRAFIK_TRANK1)\learned & PM() Or inventory(feld,akt_spieler)\status = 1
      ; Identifizieren
       inventory(feld,akt_spieler)\status = 1
    Else
       line1 = message_text(586,1+language)
    EndIf
  EndIf
  
  ; describe known mushrooms
  If name >= #OBJGRAFIK_PILZE_SCHWARZ And name <= #OBJGRAFIK_PILZE_SCHWARZ+#ANZ_PILZE-1
    If mush_known(inventory(feld,akt_spieler)\name-#OBJGRAFIK_PILZE_SCHWARZ) & PM() Or inventory(feld,akt_spieler)\status = 1
      ; Identifizieren
      inventory(feld,akt_spieler)\status = 1
    Else
      line1 = message_text(585,1+language)
    EndIf
  EndIf
  
  ; describe known scrolls
  scrollspell.w = 0
  If name = #OBJGRAFIK_SCHRIFTROLLE
    ; Do you know this scroll?
    If (learned(akt_spieler,inventory(feld,akt_spieler)\status) & #l_scrollname) Or inventory(feld,akt_spieler)\attri5 & 256
      line1 = message_text(658,1+language)+" ("+message_text(91,1+language)+" "+Str(inventory(feld,akt_spieler)\attri5 & 255)+")"
      ; Identifizieren
      inventory(feld,akt_spieler)\attri5 = inventory(feld,akt_spieler)\attri5 | 256
      line2 = spells(inventory(feld,akt_spieler)\status)\name[1+language]
      If learned(akt_spieler,inventory(feld,akt_spieler)\status) & #l_masq Or zauber_nehmen(inventory(feld,akt_spieler)\status)
        line2 + "+"
      EndIf
      line2 + " ("+Str(spells(inventory(feld,akt_spieler)\status)\level)+")"
      If sy > -1 ;spells descriptions on?
         scrollspell = inventory(feld,akt_spieler)\status
      EndIf
    Else
      ;unknown scroll
      line1 = message_text(584,1+language)
    EndIf
  EndIf
  
  ;light sources
  If name = #OBJGRAFIK_FACKEL1 Or name = #OBJGRAFIK_FACKEL2 Or name = #OBJGRAFIK_LAMPE1  Or name = #OBJGRAFIK_LAMPE2
    line2 = message_text(526,language+1) + Str(inventory(feld,akt_spieler)\status)
    line3 = ""
  EndIf

  ; food
  If type = #ITEMTYPE_FOOD
    foodvalue.w = item(inventory(feld,akt_spieler)\name)\attri1
    If skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1
      foodvalue = foodvalue * 2
    EndIf
    line2 = message_text(530,language+1) + Str(foodvalue)
    If test = 1
      line3 = "status: "+Str(inventory(feld,akt_spieler)\status)+" attri5: "+Str(inventory(feld,akt_spieler)\attri5)
    EndIf
  EndIf
  
  ; alcohol
  If type = #ITEMTYPE_ALCOHOLIC Or name = #OBJGRAFIK_BLOOD
    foodvalue.w = item(inventory(feld,akt_spieler)\name)\attri1
    If skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1
      foodvalue = foodvalue * 2
    EndIf
    line2 = message_text(530,language+1) + Str(foodvalue)
    line3 = ""
  EndIf

  If name = #OBJGRAFIK_KRAEUTER Or name = #OBJGRAFIK_HORN Or name = #OBJGRAFIK_CRYSOLIT
    If name = #OBJGRAFIK_CRYSOLIT
      line2 = message_text(610,language+1)
    Else
      line2 = message_text(531,language+1)
    EndIf
    line3 = ""
  EndIf

  ; armor
  If type = #ITEMTYPE_BOOTS Or type = #ITEMTYPE_HELMET Or type = #ITEMTYPE_ARMOR Or type = #ITEMTYPE_GLOVE Or type = #ITEMTYPE_SHIELD Or type = #ITEMTYPE_MASK
    min.w = item(inventory(feld,akt_spieler)\name)\attri2
    max.w = item(inventory(feld,akt_spieler)\name)\attri3
    If inventory(feld,akt_spieler)\status = 1
      line2 = message_text(536,language+1)
      min = min / 2
      max = max / 2
    EndIf
    If inventory(feld,akt_spieler)\status = 2
      line2 = message_text(537,language+1)
      min = 0
      max = 0
    EndIf
    If inventory(feld,akt_spieler)\status = 3
      line2 = message_text(538,language+1)
    EndIf
    line2 = line2 + message_text(534,language+1) + Str(item(name)\attri1) + message_text(535,language+1) + Str(min) + "/" + Str(max)
  EndIf
  
  ; melee weapon + ranged weapon
  If type = #ITEMTYPE_WEAPON Or type = #ITEMTYPE_BOW
    attack.w  = item(name)\attri1
    damage.w  = item(name)\attri2
    critical.w = item(name)\attri3
    If inventory(feld,akt_spieler)\status = 1
      line2 = message_text(536,language+1)
      attack = attack / 2
      damage = damage / 2
      critical = critical / 2
    EndIf
    If inventory(feld,akt_spieler)\status = 2
      line2 = message_text(537,language+1)
      attack = 0
      damage = 0
      critical = 0
    EndIf
    If inventory(feld,akt_spieler)\status = 3
      line2 = message_text(538,language+1)
    EndIf
    If inventory(feld,akt_spieler)\status = 4
      line2 = message_text(539,language+1)
    EndIf
    line2 = line2 + message_text(543,language+1) + Str(attack) + message_text(544,language+1) + Str(damage) + message_text(545,language+1) + Str(critical)
  EndIf

  ; ammunition
  If type = #ITEMTYPE_AMMUNITION
    If inventory(feld,akt_spieler)\attri5 = 4 ;poisoned status
      line2 = message_text(539,language+1)
    EndIf
    line2 = line2 + message_text(546,language+1) + Str(inventory(feld,akt_spieler)\status) +" " + message_text(543,language+1) + Str(item(name)\attri2) + message_text(544,language+1) + Str(item(name)\attri3) + message_text(545,language+1) + Str(item(name)\attri4)
    line3 = ""
  EndIf
  
  If name = #OBJGRAFIK_BEUTEL
    line2 = Str(spieler(akt_spieler)\gold) + message_text(8,language+1)
  EndIf

  If name = #OBJGRAFIK_WASSERSCHLAUCH
    line2 = Str(inventory(feld,akt_spieler)\status) + message_text(550,language+1)
    line3 = ""
  EndIf
  
  If inventory(feld,akt_spieler)\name = #OBJGRAFIK_MEDUSAHAUPT
    line2 = spells(item(inventory(feld,akt_spieler)\name)\attri1)\name[1+language]
    line3 = ""
  EndIf

  ;staffs+wands
  If type = #ITEMTYPE_BASTON 
    line2 = message_text(694+inventory(feld,akt_spieler)\attri5,1+language)
    line2 = line2 + spells(item(inventory(feld,akt_spieler)\name)\attri1)\name[1+language]
    line3 = ""
    If sy > -1 ;spells descriptions on?
      scrollspell = item(inventory(feld,akt_spieler)\name)\attri1
    EndIf
  EndIf
  
  ; staff of the last covenant
  if type = #ITEMTYPE_STAFFPIECE
    line2 = message_text(771,1+language)+Str(item(inventory(feld,akt_spieler)\name)\attri1)
    line3 = ""
  endif

  If name = #OBJGRAFIK_BUCH3
    Select(inventory(feld,akt_spieler)\status)
      Case 1: line2 = message_text(618,1+language)
      Case 2: line2 = message_text(619,1+language)
      Case 3: line2 = message_text(620,1+language)
      Case 4: line2 = message_text(621,1+language)
      Case 5: line2 = message_text(622,1+language)
      Case 6: line2 = message_text(623,1+language)
      Case 7: line2 = message_text(628,1+language)
    EndSelect
    line3 = ""
  EndIf

  If line2 = "" ;move text up, if needed
    line2 = line3
    line3 = ""
  EndIf
  
  If line1 = "" ;default first line: item name
    line1 = item(inventory(feld,akt_spieler)\name)\name[1+language]
  EndIf
  ;calculate item weight
  gew.w = item(inventory(feld,akt_spieler)\name)\gewicht / 5
  frc.w = (item(inventory(feld,akt_spieler)\name)\gewicht % 5 ) * 2
  If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BEUTEL
    gew = (spieler(akt_spieler)\gold * 3) / 1000
    frc = ((spieler(akt_spieler)\gold * 3) % 1000) / 100
  EndIf
  
  wohin = ScreenOutput()
  StartDrawing(wohin)
  DrawingMode(1)
  FrontColor(RGB(255,255,1)) ;yellow
  DrawText(x,y,line1 + " (" + Str(gew) + "." + Str(frc) + " Kg)")
  FrontColor(RGB(160,160,160)) ;gray
  DrawText(x,y+15,line2) 
  DrawText(x,y+30,line3) 

  If scrollspell
      FrontColor(RGB(0,0,50))
      Box(sx -8 ,sy -8,332,46)
      FrontColor(RGB(255,255,255))
      DrawText(sx,sy,spells(scrollspell)\info_1[1+language])
      DrawText(sx,sy+15,spells(scrollspell)\info_2[1+language])
  EndIf

  StopDrawing()
  
EndProcedure


Procedure split(reverse.w = 0)

;splits one item off a stack of items
Shared feld, first_empty

If first_empty > 0 And inventory(feld,akt_spieler)\anzahl > 0
   inventory(first_empty,akt_spieler)\status = inventory(feld,akt_spieler)\status
   If reverse = 0 ; standard split (removes one from stack on active field)
      inventory(feld,akt_spieler)\anzahl - 1
      inventory(first_empty,akt_spieler)\anzahl = 0
      If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION
         inventory(first_empty,akt_spieler)\status = item(inventory(feld,akt_spieler)\name)\attri1
      EndIf
   Else ; split reverse(1 on active rest on first_empty)
      inventory(first_empty,akt_spieler)\anzahl = inventory(feld,akt_spieler)\anzahl - 1
      inventory(feld,akt_spieler)\anzahl = 0
      If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION
         inventory(feld,akt_spieler)\status = item(inventory(feld,akt_spieler)\name)\attri1
      EndIf
   EndIf
   inventory(first_empty,akt_spieler)\name = inventory(feld,akt_spieler)\name
   inventory(first_empty,akt_spieler)\attri5 = inventory(feld,akt_spieler)\attri5
   target.w = first_empty
   first_empty = 0
   For i.w = 1 To 50
      If inventory(i,akt_spieler)\name = 0
         first_empty = i
         Break
      EndIf
   Next
   ProcedureReturn target
Else
   ProcedureReturn 0
EndIf

EndProcedure


Procedure itemmenue(text1.s, text2.s, text3.s)

Shared benutzen, feld, first_empty, bew_geg_pos
Shared itemmenue_aktiv, aktuell, joystick_used, bewegen, aktion, no_mouse

Dim entry.s(7)

   entry(1) = text1
   entry(2) = text2
   entry(3) = text3

   If inventory(feld,akt_spieler)\name <> #OBJGRAFIK_ZAUBERSCHWERT2 And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_ZAUBERRUESTUNG1 And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_REGENBOGENSCHILD And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_UDJAT And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_KESSEL And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_BUCH And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_APFEL_GRUEN And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_ZAUBERBOGEN
      entry(4) = message_text(649,1+language) ; drop item
   Else
      entry(4) = ""
   EndIf

   If first_empty > 0 And inventory(feld,akt_spieler)\anzahl > 0
      entry(5) = message_text(942,1+language) ; split stack
   Else
      entry(5) = ""
   EndIf

   entry(6) = message_text(943,1+language) ; move item within the inventory
   entry(7) = message_text(704,1+language) ; destroy item

   If spieler(akt_spieler)\charge > 0 ;only moving items within inventory allowed during charge
      entry(1) = ""
      entry(2) = ""
      entry(3) = ""
      entry(4) = ""
   EndIf

   If bewegen = 0

      If itemmenue_aktiv = 1
         ; #PB_Key_Up
         if used_keys(3)\pressed And used_keys(3)\wait_release = 0
            used_keys(3)\wait_release = 1
            aktuell = aktuell - 1
            If aktuell < 1
               aktuell = 1
            EndIf
         ; #PB_Key_Down
         elseif used_keys(4)\pressed And used_keys(4)\wait_release = 0
            used_keys(4)\wait_release = 1
            aktuell = aktuell + 1
            If aktuell > 7
               aktuell = 7
            EndIf
         ; #PB_Key_Right
         elseif used_keys(5)\pressed And used_keys(5)\wait_release = 0
            used_keys(5)\wait_release = 1
            itemmenue_aktiv = 0
            aktuell = 1
         ; #PB_Key_Left
         elseif used_keys(6)\pressed And used_keys(6)\wait_release = 0
            used_keys(6)\wait_release = 1
            itemmenue_aktiv = 0
            aktuell = 1
         EndIf
      EndIf
      
   EndIf ; bewegen
  
   ; number keys
   For i = 1 to 7
      If used_keys(20+i)\pressed And used_keys(20+i)\wait_release = 0
         used_keys(20+i)\wait_release = 1
         benutzen = i
      EndIf
   Next

   x = 400
   y = 200
   describe(feld,x-25,y,25,375)
   
   wohin = ScreenOutput()
   StartDrawing(wohin)
   DrawingMode(#PB_2DDrawing_Transparent)
   y = y + 40

   For i = 1 To 7
      y = y + 15
      If (aktuell = i And itemmenue_aktiv = 1);draw cursor bar
         FrontColor(RGB(200,200,200))   ; Weiss
         Box(367,y,640-367-16,TextHeight("Iq"))
      EndIf
      If entry(i)<>""
         If mmouse_x > (400) And mmouse_x < (500) And mmouse_y > (y) And mmouse_y < (y+15) And bewegen = 0
         FrontColor(RGB(1,1,255))  ; Blau
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            benutzen = i
         EndIf
         Else
            FrontColor(RGB(255,255,255))   ; Weiss
         EndIf
         If (aktuell = i And itemmenue_aktiv = 1) ; space activate
            FrontColor(RGB(0,0,0))  ; black
            ; Space
            if used_keys(7)\pressed And used_keys(7)\wait_release = 0
               used_keys(7)\wait_release = 1
               benutzen = i
            EndIf
            ; Return
            if used_keys(8)\pressed And used_keys(8)\wait_release = 0
               used_keys(8)\wait_release = 1
               benutzen = i
            EndIf
         EndIf
         
         DrawText(x-5-TextWidth(Str(i)),y,Str(i))
         DrawText(x,y,entry(i))
      EndIf
   Next
   StopDrawing()

   ;activate item menu (only affects up/down selection style)
   ;mouse and number keys will always work
   ; Return
   if itemmenue_aktiv = 0 And used_keys(8)\pressed And used_keys(8)\wait_release = 0
      used_keys(8)\wait_release = 1
      itemmenue_aktiv = 1
      aktuell = 1
   EndIf
   ; Space
   if itemmenue_aktiv = 0 And used_keys(7)\pressed And used_keys(7)\wait_release = 0
      used_keys(7)\wait_release = 1
      itemmenue_aktiv = 1
      aktuell = 1
   EndIf

   ; split stack
   If benutzen = 5
      split()
      benutzen = 0
   EndIf

   ; keyboard/joystick item movement
   If benutzen = 6
      bew_geg_pos = feld
      itemmenue_aktiv = 0
      bewegen = 7
   EndIf

   ; destroy item
   If benutzen = 7
      zerstoeren(feld)
      itemmenue_aktiv = 0
      benutzen = 0
   EndIf

EndProcedure

; ------------------------------------------------------------------------------------

Procedure ablegen()

Shared spell_x, spell_y, feld, aktion, blocked

   If inventory(feld,akt_spieler)\benutzt = 1
     un_equip(feld)
   EndIf
   If inventory(feld,akt_spieler)\name <> #OBJGRAFIK_ZAUBERSCHWERT2 And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_ZAUBERRUESTUNG1 And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_REGENBOGENSCHILD And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_UDJAT And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_KESSEL And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_BUCH And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_APFEL_GRUEN And inventory(feld,akt_spieler)\name <> #OBJGRAFIK_ZAUBERBOGEN
     spell_x = 0
     spell_y = 0
     destination = select_field()   ; gibt spell_x und spell_y zurueck
     init_keyboard_inventory()
     if destination = 1
         blocked = 0
         los(1)            ; gibt blocked zurueck
         If blocked = 0 And istmauer(labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld) = 0
            ; Leer?
            If laby_item(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\name[spieler(akt_spieler)\level] = 0
               ; Goldsack?
               If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BEUTEL
                 If spieler(akt_spieler)\creature_typ = 0
                    ablegen.l = gold_anzahl() / 4
                 Else
                    ablegen.l = gold_anzahl() ;creatures drop all gold
                 EndIf
                 If ablegen > 30000
                    ablegen = 30000
                 EndIf
                 setitem(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, #OBJGRAFIK_BEUTEL,ablegen,0)
                 spieler(akt_spieler)\gold - ablegen
                 If spieler(akt_spieler)\gold = 0
                    leeren(feld)
                 EndIf
               Else
                  attri.w = inventory(feld,akt_spieler)\attri5
                  status.w = inventory(feld,akt_spieler)\status
                  setitem(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, inventory(feld,akt_spieler)\name,attri,status)
                  leeren(feld)
               EndIf
               laby_screen()
               Delay(delay_animation)
               aktion = 1
            EndIf ;empty
         Else ; blocked
            message(233,#COLOR_ROT)
         EndIf
     endif
   EndIf

EndProcedure

; ------------------------------------------------------------------------------------

Procedure werfen()

Shared spell_x, spell_y, feld, aktion, blocked

   If inventory(feld,akt_spieler)\benutzt = 0 
      spell_x = 0
      spell_y = 0
      destination = select_field()   ; gibt spell_x und spell_y zurueck
      if destination = 1
         blocked = 0
         los(1)            ; gibt blocked zurueck
         If blocked = 0
            mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
            act_monster.monster_pointer\p = @monster_list()
            If mon_no
               aktion = 1
               Sound(#SOUND_BOW)
               ; Dolch ?
               If item(inventory(feld,akt_spieler)\name)\klasse = 5
                  animate_projectile(7)
               EndIf
               ; Axt ?
               If item(inventory(feld,akt_spieler)\name)\klasse = 2
                  animate_projectile(8)
               EndIf
               ; Speer ?
               If item(inventory(feld,akt_spieler)\name)\klasse = 3
                  animate_projectile(9)
               EndIf
               ; Schaden
               angriff = 60
               If skills(#CE_WURFWAFFEN,akt_spieler)\gewaehlt = 1
                  angriff = angriff + 50
               EndIf
               If angriff > 90
                  angriff = 90
               EndIf
               If angriff < 10
                  angriff = 10
               EndIf
               If get_chance(103) < angriff
                  maxschaden.w = item(inventory(feld,akt_spieler)\name)\attri2 + spieler(akt_spieler)\strength
                  If skills(#CE_WURFWAFFEN,akt_spieler)\gewaehlt = 1
                     maxschaden = maxschaden + 2
                  EndIf
                  schaden.w = myRand(maxschaden)
                  hydra_zauber(schaden)
                  ChangeCurrentElement(monster_list(),act_monster\p)
                  monsterschaden(schaden, 0)
                  
                  ; Monster vergiftet?
                  If inventory(feld,akt_spieler)\status = 4
                     inventory(feld,akt_spieler)\status = 0
                     If has_trait2(mon_no,#ME_GIFT) = 0
                     monster_list()\status = #MONSTERSTATUS_VERGIFTET
                     monster_list()\duration = myRand(20)+5
                     Else
                        message(456,#COLOR_GRUEN)
                     EndIf
                  EndIf
               Else
                  message(16,#COLOR_ROT)
               EndIf
               ; Wenn Platz ablegen
               okay = 0
               If laby_item(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\name[spieler(akt_spieler)\level] = 0 And okay = 0
                  setitem(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, inventory(feld,akt_spieler)\name,inventory(feld,akt_spieler)\attri5,inventory(feld,akt_spieler)\status)
                  okay = 1
               EndIf
               If laby_item(spieler(akt_spieler)\character_x + spell_x+1, spieler(akt_spieler)\character_y + spell_y)\name[spieler(akt_spieler)\level] = 0 And okay = 0
                  setitem(spieler(akt_spieler)\character_x + spell_x+1, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, inventory(feld,akt_spieler)\name,inventory(feld,akt_spieler)\attri5,inventory(feld,akt_spieler)\status)
                  okay = 1
               EndIf
               If laby_item(spieler(akt_spieler)\character_x + spell_x-1, spieler(akt_spieler)\character_y + spell_y)\name[spieler(akt_spieler)\level] = 0 And okay = 0
                  setitem(spieler(akt_spieler)\character_x + spell_x-1, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, inventory(feld,akt_spieler)\name,inventory(feld,akt_spieler)\attri5,inventory(feld,akt_spieler)\status)
                  okay = 1
               EndIf
               If laby_item(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y+1)\name[spieler(akt_spieler)\level] = 0 And okay = 0
                  setitem(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y+1,spieler(akt_spieler)\level, inventory(feld,akt_spieler)\name,inventory(feld,akt_spieler)\attri5,inventory(feld,akt_spieler)\status)
                  okay = 1
               EndIf
               If laby_item(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y-1)\name[spieler(akt_spieler)\level] = 0 And okay = 0
                  setitem(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y-1,spieler(akt_spieler)\level, inventory(feld,akt_spieler)\name,inventory(feld,akt_spieler)\attri5,inventory(feld,akt_spieler)\status)
                  okay = 1
               EndIf
               leeren(feld)
               laby_screen()
               Delay(delay_animation)
            Else
               message(246,#COLOR_ROT)
            EndIf
         Else
            message(233,#COLOR_ROT)
         EndIf
      endif
   EndIf

EndProcedure

; ------------------------------------------------------------------------------------

Procedure draw_item_inventory(x,y,inv_pos,cursor_here,type)

   inv_pos-1
   
   ;slots 40 to 49 are quick access slots
   select (type)
      case 1: ; standard (belt in lower left corner)
         If inv_pos > 39 ; all in 1 line
            xpos = inv_pos - 40
            ypos = 0
            x = 23
            y = 431
         else
            xpos = inv_pos % 8
            ypos = inv_pos / 8
         endif
      case 2: ; trader (belt shown as 2 new lines under player inventory)
         If inv_pos > 44
            xpos = inv_pos - 45
            ypos = 6
         elseIf inv_pos > 39 ; 2 lines with 5 slots each
            xpos = inv_pos-40
            ypos = 5
         else
            xpos = inv_pos % 8
            ypos = inv_pos / 8
         endif
         
   endselect
   
   ; Ist die Maus hier ?
   a.w = x + (xpos * 32)
   b.w = a + 32
   c.w = y + (ypos * 32)
   d.w = c + 32
   If mmouse_x > a And mmouse_x < b And mmouse_y > c And mmouse_y < d
      mouse_over = 1
   else
      mouse_over = 0
   endif

   ; if "used" show grey background
   If inventory(inv_pos+1,akt_spieler)\benutzt = 1
      ClipSprite(#SPRITE_USED_FIELD, 0, 0, 30, 30)
      DisplaySprite(#SPRITE_USED_FIELD, x + (xpos * 32)+1, y + (ypos *32)+1)
   EndIf
   
   If mouse_over
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x + (xpos * 32) , y + (ypos *32) )
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x + (xpos * 32) , y + (ypos *32 ) )
   endif
   
   ; Ist Cursor hier?
   If cursor_here
      ClipSprite(#SPRITE_TILESET_LABYRINTH, 0, 32, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_LABYRINTH, x + (xpos * 32), y + (ypos * 32) )
   EndIf

   sprite_x.w = inventory(inv_pos+1,akt_spieler)\name
   If sprite_x > 0
      ; Fackel ?
      If sprite_x = 46 And inventory(inv_pos+1,akt_spieler)\benutzt = 1
         sprite_x = 47
      EndIf
      ; Lampe ?
      If sprite_x = 39 And inventory(inv_pos+1,akt_spieler)\benutzt = 1
         sprite_x = 40
      EndIf
      sprite_x - 1
      sprite_y.w = sprite_x / 16
      sprite_x = sprite_x % 16
      ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32, sprite_y * 32, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x + (xpos * 32), y + (ypos *32) )
      
      ; show spellschool icon
      ; Do you know this scroll?
      If item(inventory(inv_pos+1,akt_spieler)\name)\type = #ITEMTYPE_SCROLL
         If (learned(akt_spieler,inventory(inv_pos+1,akt_spieler)\status) & #l_scrollname) Or inventory(inv_pos+1,akt_spieler)\attri5 & 256
            select (spells(inventory(inv_pos+1,akt_spieler)\status)\school)
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
            DisplayTransparentSprite(#SPRITE_ICONS, x + (xpos * 32)+1, y + (ypos *32)+1)
         Endif
      Endif
   EndIf

   ; Mehrere?
   If inventory(inv_pos+1,akt_spieler)\anzahl > 0
      wohin = ScreenOutput()
      StartDrawing(wohin)
      FrontColor(RGB(255,255,255))
      DrawingMode(1)
      DrawText(x + (xpos * 32) + 30 - TextWidth(Str(inventory(inv_pos+1,akt_spieler)\anzahl+1)) , y + (ypos *32 ) + 18,Str(inventory(inv_pos+1,akt_spieler)\anzahl+1))
      StopDrawing()
   EndIf
   
   Procedurereturn mouse_over

endprocedure

; ------------------------------------------------------------------------------------

; Inventory
Procedure inv()

Shared frame, feld, akt_zauber, item_spell, itemmenue_aktiv, first_empty
Shared benutzen, no_mouse, joystick_used, bewegen, do_it, abbrechen
Shared zeit, altezeit, test, akt_zauber_offset, pilz, aktion, spell_x, spell_y
Shared bew_geg_pos
Static lastSelected.l

feld = 1
sel_pos.w = 1
benutzen = 0
bewegen = 0
bew_geg_x.w = 0  ; Fuer Mauszeiger
bew_geg_y.w = 0  ; Fuer Mauszeiger 
bew_geg.w = 0    ; Gegenstand Nummer
bew_geg_pos = 0   ; Position im Rucksack
mmouse_xdif.l
mmouse_ydif.l
get_out.w = 0
abbrechen = 0
  
init_keyboard_inventory()

Repeat
   read_joystick()
   read_keyboard()
   read_mouse()
   mmouse_xdif = mmouse_x_old - mmouse_x
   mmouse_ydif = mmouse_y_old - mmouse_y
   doppelklick = doubleClick()

   ; #PB_Key_I
   if used_keys(1)\pressed And used_keys(1)\wait_release = 0
      used_keys(1)\wait_release = 1
      get_out = 1
   endif
   
   ; #PB_Key_Escape
   if used_keys(2)\pressed And used_keys(2)\wait_release = 0
      used_keys(2)\wait_release = 1
      get_out = 1
   endif
   
   ; #PB_Key_Up
   if used_keys(3)\pressed And used_keys(3)\wait_release = 0 and itemmenue_aktiv = 0
      used_keys(3)\wait_release = 1
      sel_pos - 8
      If sel_pos < 1
         sel_pos + 8
      EndIf
      feld = sel_pos
   endif
   
   ; #PB_Key_Down
   if used_keys(4)\pressed And used_keys(4)\wait_release = 0 and itemmenue_aktiv = 0
      used_keys(4)\wait_release = 1
      sel_pos + 8
      If sel_pos > 50
         sel_pos - 8
      EndIf
      feld = sel_pos
   endif
   
   ; #PB_Key_Right
   if used_keys(5)\pressed And used_keys(5)\wait_release = 0 and itemmenue_aktiv = 0
      used_keys(5)\wait_release = 1
      sel_pos + 1
      If sel_pos > 50
         sel_pos = 50
      EndIf
      feld = sel_pos
   endif
   
   ; #PB_Key_Left
   if used_keys(6)\pressed And used_keys(6)\wait_release = 0 and itemmenue_aktiv = 0
      used_keys(6)\wait_release = 1
      sel_pos - 1
      If sel_pos < 1
         sel_pos = 1
      EndIf
      feld = sel_pos
   endif
   
   
   If mmouse_rechts And mmouse_rechts_wait_release = 0
      mmouse_rechts_wait_release = 1
      get_out = 1
   endif
   
   if something_changed = 1 or something_moved = 1
      Fenster()
      ClearScreen(RGB(0,0,0))
      laby_rahmen(2)
      
      something_moved = 0
      ClipSprite(#SPRITE_CLEANER, 0, 0, 258, 220)
      DisplaySprite(#SPRITE_CLEANER, 366, 15)
      
      ; Display last 2 messages
      last_msg.w = 25
      While old_messages(last_msg)\message = " " And last_msg > 1
         last_msg-1
      Wend
      If last_msg-1>0
         last_message(last_msg-1,#NACHRICHTEN_POSY)
      EndIf
      last_message(last_msg,#NACHRICHTEN_POSY+15)

      first_empty = 0
      For i = 0 To 49   
      
         pos = i
   
         ; Where are we?
         If feld = 99
            feld = pos
            sel_pos = pos
         EndIf

         ;remember, if and where there is an empty space
         If first_empty = 0 And inventory(pos,akt_spieler)\name = 0
            first_empty = pos
         EndIf 
         
         cursor_here = 0
         If pos = sel_pos -1
            cursor_here = 1
         EndIf

         ; Item zeichnen
         mouse_over = draw_item_inventory(366,15,i+1,cursor_here,1)
            
         If mouse_over
            bew_ziel.w = i + 1

            ; Click
            If bewegen = 0 And mmouse_links = 1 And doppelklick = 0
               feld = 99
               bewegen = 1
               bew_geg = inventory(bew_ziel,akt_spieler)\name
               bew_geg_pos = bew_ziel
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_x - 16
                     bew_geg_y + 1
                  Until bew_geg_x < 17
               EndIf
               lastSelected = bew_ziel
            EndIf

            ; Doppelklick
            If bewegen = 0 And doppelklick = 1 And lastSelected = bew_ziel
               feld = bew_ziel
               sel_pos = bew_ziel
               bew_geg_pos = bew_ziel
               ; combine the staff pieces
               for act_piece = 1 to 9
                  if inventory(feld,akt_spieler)\name = #OBJGRAFIK_STAFF_LAST_COVENANT_1 - 1 + act_piece
                     spieler(akt_spieler)\staff_pieces[act_piece] = 1
                     leeren(feld)
                     was_last_piece()
                  endif
               next
               mmouse_links = 0
               If spieler(akt_spieler)\charge < 1 ; no item usage in charge mode
                  do_it = 1
                  redraw = 1
               else
                  nachricht7(message_text(775,1+language),#COLOR_WEISS)
                  redraw = 1
               EndIf
            EndIf

            If mmouse_links = 1
            ; Moven?

               If bewegen = 0 And (mmouse_xdif <> 0 Or mmouse_ydif <> 0)
                  feld = 99
                  bewegen = 1
                  bew_geg = inventory(bew_ziel,akt_spieler)\name
                  bew_geg_pos = bew_ziel
                  bew_geg_x = bew_geg
                  bew_geg_y = 0
                  If bew_geg_x > 16
                  Repeat
                     bew_geg_x - 16
                     bew_geg_y + 1
                  Until bew_geg_x < 17
                  EndIf
               EndIf
            EndIf
         EndIf ; mouse_over
      
      Next
      
      
      XIncludeFile("show_body.pbi")
      If bewegen = 2 Or bewegen = 3; Item in Body or staff clicked?
         feld = bew_geg_pos
         bew_geg_x = bew_geg
         bew_geg_y = 0
         If bew_geg_x > 16
            Repeat
               bew_geg_x - 16
               bew_geg_y + 1
            Until bew_geg_x < 17
         EndIf
      EndIf

      If skills(#CE_KAMPFTECHNIKEN,akt_spieler)\gewaehlt = 1
         XIncludeFile("styles.pbi")
      EndIf

      ; Gewicht und Lebens/Manapunkte darstellen
      wohin = ScreenOutput()
      StartDrawing(wohin)
      FrontColor(RGB(255,255,255))
      DrawingMode(1)
      gew.w = gewicht() / 5
      txt.s = message_text(597,1+language) + Str(gew) + message_text(598,1+language)
      DrawText(640-18-TextWidth(txt),178,txt)

      ; LP
      FrontColor(RGB(247,36,61))
      txt = Str(spieler(akt_spieler)\Lifepoints) + "/" + Str(maxlife())
      DrawText(375,450,message_text(878,language+1))
      DrawText(480-TextWidth(txt),450,txt)

      ; MP
      FrontColor(RGB(130,125,250))
      txt = Str(spieler(akt_spieler)\Mana) + "/" + Str(maxmana())
      DrawText(510,450,message_text(879,language+1))
      DrawText(640-18-TextWidth(txt),450,txt)

      ; hunger
      FrontColor(RGB(150,150,100))
      txt = Str(spieler(akt_spieler)\hunger)
      DrawText(375,430,message_text(90,language+1))
      DrawText(480-TextWidth(txt),430,txt)

      ; thirst
      FrontColor(RGB(0,0,255))
      txt = Str(spieler(akt_spieler)\durst)
      DrawText(510,430,message_text(89,language+1))
      DrawText(640-18-TextWidth(txt),430,txt)
      StopDrawing()

      ; Wurde schon ein Feld angeklickt?
      If feld > 0 Or do_it > 0
         If inventory(feld,akt_spieler)\name = 0 And itemmenue_aktiv = 1
            itemmenue_aktiv = 0
         EndIf
         
         If do_it > 0
            feld = bew_geg_pos
         EndIf
      EndIf
       
      for i = 1 to 10
         if used_keys(i+8)\pressed And used_keys(i+8)\wait_release = 0
            used_keys(i+8)\wait_release = 1
            move_int(40+i,sel_pos)
            something_moved = 1
         endif
      next

      If bewegen = 7 ; keyboard/joystick item inventory movement
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))
         DrawText(400,200,message_text(944,language+1))
         StopDrawing()
         describe(bew_geg_pos,400,220,25,375)
         
         ; #PB_Key_Space
         if used_keys(7)\pressed And used_keys(7)\wait_release = 0
            used_keys(7)\wait_release = 1
            move_int(bew_geg_pos,sel_pos)
            something_moved = 1
            bewegen = 0
            itemmenue_aktiv = 0
            bew_geg = 0
            bew_geg_pos = 0
            bew_ziel = 0
         EndIf
         
         ; #PB_Key_Return
         if used_keys(8)\pressed And used_keys(8)\wait_release = 0
            used_keys(8)\wait_release = 1
            move_int(bew_geg_pos,sel_pos)
            something_moved = 1
            bewegen = 0
            itemmenue_aktiv = 0
            bew_geg = 0
            bew_geg_pos = 0
            bew_ziel = 0
         EndIf
         
         ; #PB_Key_6
         if used_keys(26)\pressed And used_keys(26)\wait_release = 0
            used_keys(26)\wait_release = 1
            move_int(bew_geg_pos,sel_pos)
            something_moved = 1
            bewegen = 0
            itemmenue_aktiv = 0
            bew_geg = 0
            bew_geg_pos = 0
            bew_ziel = 0
         EndIf
      Else
         If inventory(feld,akt_spieler)\name > 0; show item menue if non-empty slot
            itemtest()
         EndIf
      EndIf
      
      ; Gegenstand losgelassen?
      do_it = 0
      If mmouse_links = 0  ; Falls nicht mehr gedrueckt Maus Gegenstand loslassen
         ; Aus Inventory
         If bewegen = 1 
            ; Gegenstand benutzen!
            If mmouse_x < 340 And mmouse_y < 350 And spieler(akt_spieler)\charge < 1 ; nach Body
               aktion = 1
               do_it = 1
               ; combine the staff pieces
               for act_piece = 1 to 9
                  if bew_geg = #OBJGRAFIK_STAFF_LAST_COVENANT_1-1+act_piece
                     spieler(akt_spieler)\staff_pieces[act_piece] = 1
                     leeren(bew_geg_pos)
                     was_last_piece()
                  endif
               next
            Else              ; nach Inventory
               move_int(bew_geg_pos,bew_ziel)
               something_moved = 1
               bew_geg = 0
               bew_geg_pos = 0
               bew_ziel = 0
               bew_geg_x = 0
               bew_geg_y = 0
            EndIf
            bewegen = 0
         EndIf
         ; Doppelklick zurueck
         If bewegen = 5
            do_it = 1
            bewegen = 0
         EndIf
         If bewegen = 6
            if spieler(akt_spieler)\staff_pieces[bew_geg_pos] = 1
               if in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_1-1+bew_geg_pos,1) <= #MAX_RUCKSACK
                  spieler(akt_spieler)\staff_pieces[bew_geg_pos] = 0
               endif
            endif
            bewegen = 0
         EndIf

         ; Aus Bodybild
         If bewegen = 2 
            ; Gegenstand entnutzen!
            If mmouse_x > 350  Or mmouse_y > 425; nach Inventory
               aktion = 1
               do_it = 1
            EndIf
            bewegen = 0
         EndIf
         
         if bewegen = 3
            if spieler(akt_spieler)\staff_pieces[bew_geg_pos] = 1
               if in_rucksack(#OBJGRAFIK_STAFF_LAST_COVENANT_1-1+bew_geg_pos,1) <= #MAX_RUCKSACK
                  spieler(akt_spieler)\staff_pieces[bew_geg_pos] = 0
               endif
            endif
            bewegen = 0
         endif
      EndIf

      If bewegen = 0 Or bewegen = 5 Or bewegen = 7
         end_screen()
      Else
         end_screen(0, bew_geg_x, bew_geg_y)
      EndIf
      
      if redraw = 1
         something_changed = 1
         redraw = 0
      endif
   endif ; something_changed
   delay(#Input_delay)
Until abbrechen = 1 Or get_out = 1
abbrechen = 0
get_out = 0
EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 480
; FirstLine = 478
; Folding = ---
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
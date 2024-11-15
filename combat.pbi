Procedure lernen(nr.w)

   If has_trait2(nr,#ME_SPINNE)
      If get_chance(102) < 5 - spieler(akt_spieler)\spinnenlehre
         spieler(akt_spieler)\spinnenlehre = spieler(akt_spieler)\spinnenlehre + 1
         message(625,#COLOR_BLAU)
      EndIf
   EndIf
   
   If has_trait2(nr,#ME_UNTOTER)
      If get_chance(102) < 5 - spieler(akt_spieler)\untotenlehre
         spieler(akt_spieler)\untotenlehre = spieler(akt_spieler)\untotenlehre + 1
         message(625,#COLOR_BLAU)
      EndIf
   EndIf
   
   If has_trait2(nr,#ME_GOBLIN)
      If get_chance(102) < 5 - spieler(akt_spieler)\goblinlehre
         spieler(akt_spieler)\goblinlehre = spieler(akt_spieler)\goblinlehre + 1
         message(625,#COLOR_BLAU)
      EndIf
   EndIf
   
   If monster(nr)\art = #TP_ANIMAL
      If get_chance(102) < 5 - spieler(akt_spieler)\tierkunde
         spieler(akt_spieler)\tierkunde = spieler(akt_spieler)\tierkunde + 1
         message(625,#COLOR_BLAU)
      EndIf
   EndIf
   
   If monster(nr)\art = #TP_PLANT
      If get_chance(102) < 5 - spieler(akt_spieler)\pflanzenlehre
         spieler(akt_spieler)\pflanzenlehre = spieler(akt_spieler)\pflanzenlehre + 1
         message(625,#COLOR_BLAU)
      EndIf
   EndIf
   
EndProcedure


Procedure hinterlassen(x.w,y.w)

   ; Soeldner ?
   If skills(#CE_SOELDNER,akt_spieler)\gewaehlt = 1
      gold_finden2(min(5,spieler(akt_spieler)\level))
   EndIf

   tile.w = labyrinth(spieler(akt_spieler)\level,x,y)\feld
   freetile = 1
   If is_floor(tile) = 0
      freetile = 0
   EndIf
   freeitem.w = 1
   If laby_item(x,y)\name[spieler(akt_spieler)\level]
      freeitem = 0
   EndIf
            
   mon_no.w = getmonster(x,y)
   container.w = monster_list()\container
   item.w = monster_list()\item
   skilldrop.w = monster_list()\skilldrop
   If item
     If container = 0 And freeitem
       Select(item(item)\qualitaet)
         Case 1: ;item with quality rating
           setitem(x,y,spieler(akt_spieler)\level,obje,0,get_chance(3))
         Case 2: ;item with quantity/charges eg. arrows,torches,udjat
           setitem(x,y,spieler(akt_spieler)\level,obje,item(obje)\attri1,0)
         Case 3: ;item with quality rating (double value)
           setitem(x,y,spieler(akt_spieler)\level,obje,0,2*get_chance(3))
         Default: ;no quality rating needed
           setitem(x,y,spieler(akt_spieler)\level,obje,0,0)
       EndSelect
       freeitem = 0
     Else
       If freetile
         setlaby(x,y,spieler(akt_spieler)\level,container,item,tile)
         freetile = 0
       EndIf
     EndIf
   EndIf

   ; Paladin?
   If has_trait2(mon_no,#ME_UNTOTER) And skills(#CE_PALADIN,akt_spieler)\gewaehlt = 1 And freetile And skilldrop < 500
      setlaby(x,y,spieler(akt_spieler)\level,#FELD_GOLD,0,tile)
      freetile = 0
   EndIf
   ; Hunter?
   If monster(mon_no)\art = #TP_ANIMAL And skills(#CE_JAEGER,akt_spieler)\gewaehlt = 1 And skilldrop < 500
      If skilldrop < 250 And freeitem
         If skilldrop < 125
            setitem(x,y,spieler(akt_spieler)\level,#OBJGRAFIK_SCHINKEN,0,0)
         Else
            setitem(x,y,spieler(akt_spieler)\level,#OBJGRAFIK_HUEHNCHEN,0,0)
         EndIf
         freeitem = 0
      ElseIf freetile
         setlaby(x,y,spieler(akt_spieler)\level,#FELD_GOLD,0,tile)
         freetile = 0
      EndIf
   EndIf

   If monster(mon_no)\art = #TP_HUMAN
     ; Headhunter?
      If skills(#CE_KOPFGELDJAEGER,akt_spieler)\gewaehlt = 1 And skilldrop < 600 And freetile
         setlaby(x,y,spieler(akt_spieler)\level,#FELD_GOLD,0,tile)
         freetile = 0
      EndIf
     ; Cannibal?
      If skills(#CE_CANNIBAL,akt_spieler)\gewaehlt = 1 And (skilldrop % 100) < 60 And freeitem
         If skilldrop % 2
            setitem(x,y,spieler(akt_spieler)\level,#OBJGRAFIK_HUMAN_MEAT,0,0)
         Else
            setitem(x,y,spieler(akt_spieler)\level,#OBJGRAFIK_BLOOD,0,0)
         EndIf
         freeitem = 0
      EndIf
   EndIf

   ; Survivalist?
   If monster(mon_no)\art = #TP_ANIMAL And skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1 And freeitem And skilldrop >= 900
      If skilldrop % 2
         setitem(x,y,spieler(akt_spieler)\level,#OBJGRAFIK_SCHINKEN,0,0)
      Else
         setitem(x,y,spieler(akt_spieler)\level,#OBJGRAFIK_HUEHNCHEN,0,0)
      EndIf
      freeitem = 0
   EndIf
   
   remove_monster()
   
EndProcedure


Procedure explodiert(damage.w = 2)

Shared spell_x, spell_y

   message(706,#COLOR_ROT)
   Sound(#SOUND_CANNON+Random(1))
   
   ; Zielbereich mit Flammen fuellen
   For y=spell_y-1+#HALF_MATRIX_SIZE To spell_y+1+#HALF_MATRIX_SIZE
      For x=spell_x-1+#HALF_MATRIX_SIZE To spell_x+1+#HALF_MATRIX_SIZE
         draw_tile(#FELD_FEUER3, x, y, 1, 1, -1)
      Next
   Next
   FlipBuffers()
   Delay(delay_animation)
   laby_screen()
   
   ; Alle Spieler angreifen
   save_akt_spieler.w = akt_spieler
   vergl_x.w = spieler(akt_spieler)\character_x+spell_x
   vergl_y.w = spieler(akt_spieler)\character_y+spell_y
   For akt_spieler = 1 To nr_of_players
     If spieler(akt_spieler)\Status <> 1
       ;skip dead players
       Continue
     EndIf
     If spieler(akt_spieler)\character_x >= vergl_x-1 And spieler(akt_spieler)\character_x <= vergl_x+1 And spieler(akt_spieler)\character_y >= vergl_y-1 And spieler(akt_spieler)\character_y <= vergl_y+1 And spieler(akt_spieler)\level = spieler(save_akt_spieler)\level
       If habich(#SPELL_UNVERWUNDBARKEIT) = 0
         spielerschaden(damage,1,#ROD_EXPLOSION)
       EndIf
     EndIf
   Next
   akt_spieler = save_akt_spieler
   
   save_spell_x.w = spell_x
   save_spell_y.w = spell_y
   
   ; Alle Monster angreifen
   For zaehl = 1 To 9
      Select (zaehl)
         Case 1: spell_x = spell_x - 1
                 spell_y = spell_y - 1
         Case 2: spell_x = spell_x + 1
         Case 3: spell_x = spell_x + 1
         Case 4: spell_y = spell_y + 1
                 spell_x = spell_x - 2
         Case 5: spell_x = spell_x + 1
         Case 6: spell_x = spell_x + 1
         Case 7: spell_y = spell_y + 1
                 spell_x = spell_x - 2
         Case 8: spell_x = spell_x + 1
         Case 9: spell_x = spell_x + 1
      EndSelect
      mon.w = getmonster(spieler(akt_spieler)\character_x+spell_x,spieler(akt_spieler)\character_y+spell_y)
      If mon
        If has_trait2(mon,#ME_UNVERWUNDBAR) = 0 Or has_trait2(mon,#ME_FEUERFEST) = 0
          monsterschaden(damage, 0)
        EndIf
      EndIf
   Next
   
   spell_x = save_spell_x
   spell_y = save_spell_y

EndProcedure


Procedure zerstoert(color.w,no_explo.w = 0)

Shared spell_x, spell_y

   mon_no.w = monster_list()\number
   x.w = monster_list()\x - spieler(akt_spieler)\character_x
   y.w = monster_list()\y - spieler(akt_spieler)\character_y
   If mon_no
      explo.w = 0
      If has_trait2(mon_no,#ME_EXPLODIERT) > 0 And no_explo = 0
         explo = 1
      EndIf
      
      If spieler(akt_spieler)\creature_typ > 0 ;count kill of creature for player
         spieler(akt_spieler-1)\mks = spieler(akt_spieler-1)\mks + 1
      Else
         spieler(akt_spieler)\mks = spieler(akt_spieler)\mks + 1
      EndIf
      willi.s = " "
      willi = monster(mon_no)\name[1+language] + message_text(627,language+1)
      
      lernen(mon_no)
      
      ; Feld leeren
      ; Wassermonster?
      If has_trait2(mon_no,#ME_WASSER) > 0
        remove_monster()
      Else
         hinterlassen(spieler(akt_spieler)\character_x+x,spieler(akt_spieler)\character_y+y)
      EndIf
      laby_screen2()
      nachricht7(willi,color)

      gott_check()
      
      If explo = 1
         spell_x = x
         spell_y = y
         explodiert()
      EndIf
      
   EndIf ; monster?
         
EndProcedure


Procedure ich_trage2(geg.w)

   hugo = 0
   For i = 1 To #MAX_RUCKSACK
      If inventory(i,akt_spieler)\name = geg And inventory(i,akt_spieler)\benutzt = 1
         hugo = 1
      EndIf
   Next
   
   ProcedureReturn hugo

EndProcedure


; Magische Waffe?
Procedure ich_trage4()

Shared akt_spieler

   hugo = 0
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\magisch = 1 And inventory(i,akt_spieler)\benutzt = 1
         hugo = 1
      EndIf
   Next
   
   ProcedureReturn hugo

EndProcedure


Procedure kampf()

Shared sprite_x, sprite_y

   mon_no.w = getmonster(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod)
   act_monster.monster_pointer\p = @monster_list()
   
   If skills(#CE_KEIN_ANGRIFF,akt_spieler)\gewaehlt = 1 Or spieler(akt_spieler)\charge < 0
      message(708,#COLOR_ROT)
   ElseIf has_trait2(mon_no,#ME_UNVERWUNDBAR) > 0 And ich_trage4() = 0 And skills(#CE_GEISTERJAEGER,akt_spieler)\gewaehlt = 0
      message(736,#COLOR_ROT)
   Else
      ; Let player jump
      tile.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld
      If fields(tile)\attri_floor
         bg.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\stat2
      Else
         bg.w = 0
      EndIf
      draw_tile(tile,#HALF_MATRIX_SIZE ,#HALF_MATRIX_SIZE , 0, 0, bg)
      If getmonster(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
        ;we stand ON a monster (possible with sneaking)
        draw_monster(#HALF_MATRIX_SIZE, #HALF_MATRIX_SIZE, 0, 0)
      EndIf
      ;restore pointer
      ChangeCurrentElement(monster_list(),act_monster\p)
      item.w = laby_item(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\name[spieler(akt_spieler)\level]
      If item > 0
        draw_item(item.w, #HALF_MATRIX_SIZE, #HALF_MATRIX_SIZE,0 ,0)
      EndIf
      draw_character(spieler(akt_spieler)\face, 1,-3)
      
      inhalt_x.w = inhalt(spieler(akt_spieler)\level)
      inhalt_y.w = 0
      If inhalt_x > 10
         Repeat
            inhalt_y = inhalt_y + 1
            inhalt_x = inhalt_x - 10
         Until inhalt_x < 11
      EndIf
      If inhalt_x = 10
         inhalt_x = 0
         inhalt_y = inhalt_y + 1
      EndIf
   
      sprite_x = monster(mon_no)\nr - 1
      sprite_y = sprite_x / 10
      sprite_x = sprite_x % 10
      
      ; Wolfsgestalt und Wolf?
      If has_trait2(mon_no,#ME_WOLF) > 0 And habich(#SPELL_WOLFSGESTALT) > 0
         monster_list()\status = #MONSTERSTATUS_FREUND
      EndIf
      
      ; Fledermausgestalt und Fledermaus?
      If has_trait2(mon_no,#ME_FLEDERMAUS) > 0 And habich(#SPELL_FLEDERMAUSGESTALT) > 0
         monster_list()\status = #MONSTERSTATUS_FREUND
      EndIf
      
      ; Katzengestalt und Katze?
      If has_trait2(mon_no,#ME_KATZE) > 0 And habich(#SPELL_KATZENGESTALT) > 0
         monster_list()\status = #MONSTERSTATUS_FREUND
      EndIf
      
      ; Angriff berechnen
      angriff.w = spieler_angriffswert()
      angriff   = angriff - (monster(mon_no)\abwehr * 10)
      If angriff > 90
         angriff = 90
      EndIf
      If angriff < 10
         angriff = 10
      EndIf
      mini.w = schaden_min()
      maxi.w = schaden_max()
      
      ; Befreundet?
      If monster_list()\status <> #MONSTERSTATUS_FREUND
      
      ; Jaeger?
      If monster(mon_no)\art = #TP_ANIMAL And skills(#CE_JAEGER,akt_spieler)\gewaehlt = 1
         angriff = angriff + 3
         mini = mini + 3
         maxi = maxi + 3
      EndIf
      
      ; Kopfgeldjaeger?
      If monster(mon_no)\art = #TP_HUMAN And skills(#CE_KOPFGELDJAEGER,akt_spieler)\gewaehlt = 1
         angriff = angriff + 3
         mini = mini + 3
         maxi = maxi + 3
      EndIf
      
      ; Paladin?
      If has_trait2(mon_no,#ME_UNTOTER) And skills(#CE_PALADIN,akt_spieler)\gewaehlt = 1
         angriff = angriff + 3
         mini = mini + 3
         maxi = maxi + 3
      EndIf
      
      ; Geisterjaeger?
      If monster(mon_no)\art = #TP_GHOST And skills(#CE_GEISTERJAEGER,akt_spieler)\gewaehlt = 1
         angriff = angriff + 5
         mini = mini + 5
         maxi = maxi + 5
      EndIf
      
      ; Goblinlehre
      If has_trait2(mon_no,#ME_GOBLIN) = 1
         angriff = angriff + spieler(akt_spieler)\goblinlehre * 2
         mini = mini + spieler(akt_spieler)\goblinlehre * 2 
         maxi = maxi + spieler(akt_spieler)\goblinlehre * 2
      EndIf
      
      ; Spinnenlehre
      If has_trait2(mon_no,#ME_SPINNE) = 1
         angriff = angriff + spieler(akt_spieler)\spinnenlehre * 2
         mini = mini + spieler(akt_spieler)\spinnenlehre * 2
         maxi = maxi + spieler(akt_spieler)\spinnenlehre * 2
      EndIf
      
      ; Untotenlehre
      If has_trait2(mon_no,#ME_UNTOTER) = 1
         angriff = angriff + spieler(akt_spieler)\untotenlehre * 2
         mini = mini + spieler(akt_spieler)\untotenlehre * 2
         maxi = maxi + spieler(akt_spieler)\untotenlehre * 2
      EndIf
      
      ; Tierkunde
      If monster(mon_no)\art = #TP_ANIMAL
         angriff = angriff + spieler(akt_spieler)\tierkunde * 2
         mini = mini + spieler(akt_spieler)\tierkunde * 2
         maxi = maxi + spieler(akt_spieler)\tierkunde * 2
      EndIf
      
      ; Schwert Drachentoeter und Drache? (65 = skeleton dragon)
      If (monster(mon_no)\art = #TP_DRAGON Or mon_no = #MONSTER_SKELETON_DRAGON ) And ich_trage2(#OBJGRAFIK_ZAUBERSCHWERT3)
         angriff = angriff + 7
         mini = mini + 7
         maxi = maxi + 7
      EndIf
      
      ; Schwert Daemonentoeter und Daemon?
      If monster(mon_no)\art = #TP_DEMON And ich_trage2(#OBJGRAFIK_SCHWERT2)
         angriff = angriff + 7
         mini = mini + 7
         maxi = maxi + 7
      EndIf
      
      ; Katzengestalt und Ratte?
      If has_trait2(mon_no,#ME_RATTE) > 0 And habich(#SPELL_KATZENGESTALT) > 0
         angriff = angriff + 3
         mini = mini + 3
         maxi = maxi + 3
      EndIf
   
      critical_chance = schaden_critical()
      
      critical.w = 0
      treffer.w = get_chance(103)
      If treffer < angriff Or ( spieler(akt_spieler)\style = 5 And treffer < (100-(100-angriff)/2) )
   
         ; Roten Fleck darstellen
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 7*32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160 + xmod*32, 160 + ymod*32)

         If spieler(akt_spieler)\creature_typ = #CREATURE_STARFEARIE
            Sound(#SOUND_JAWA)
         ElseIf spieler(akt_spieler)\creature_typ = #CREATURE_TIGRE
            Sound(#SOUND_BLACKCAT)
         ElseIf spieler(akt_spieler)\creature_typ = #CREATURE_MUMMY
            Sound(#SOUND_BOAR)
         ElseIf spieler(akt_spieler)\creature_typ = #CREATURE_DEMON
            Sound(#SOUND_ROAR)
         ElseIf spieler(akt_spieler)\creature_typ = #CREATURE_ANGEL
            Sound(#SOUND_METAL)
         ElseIf spieler(akt_spieler)\creature_typ = #CREATURE_DRAGON
            Sound(#SOUND_ROAR)
         Else
            Sound(Random(12))
         EndIf
       
         ; Unsichtbarkeit weg!
         For i = 1 To #ACTIVE_SLOTS
            If aktive(i,akt_spieler)\nr = #SPELL_UNSICHTBARKEIT
               aktive(i,akt_spieler)\nr = 0
               aktive(i,akt_spieler)\staerke = 0
               aktive(i,akt_spieler)\dauer = 0
            EndIf
         Next
         
         schaden.w = mini + myRand(maxi-mini)
         
         
         ; Fighting styles?
         If spieler(akt_spieler)\style <> 3
            schaden = schaden - myRand2(monster(mon_no)\ruestung)
            ;schaden = schaden - monster(mon_no)\ruestung
         EndIf
         If spieler(akt_spieler)\style = 5 Or spieler(akt_spieler)\style = 6
            schaden = (schaden * 3 ) / 4
         EndIf
         If spieler(akt_spieler)\style = 8 And monster_list()\status <> #MONSTERSTATUS_ALERT
            schaden = schaden * 2
         EndIf
         
         If schaden < 1
            schaden = 0
         EndIf
   
         If get_chance(104) < critical_chance And schaden > 0   ; Critical ?
            ClipSprite(#SPRITE_TILESET_PROJEKTILE, 3*32, 7*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+ xmod*32, 160 + ymod*32)
            critical = 1
         EndIf
   
         If critical = 0
            ; Display damage
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               xx = 175 + xmod*32
               yy = 168 + ymod*32
               
               DrawText(xx-TextWidth((Str(schaden)))/2,yy,Str(schaden),$ffffff)
               ;DrawText(xx,yy,Str(schaden),$ffffff)
            StopDrawing()
         EndIf
         
         FlipBuffers()
         Delay(delay_animation)
      
         i = 1
         Repeat
            If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
               aktwaffe = i
            EndIf
            i = i + 1
         Until aktwaffe > 0 Or i > #MAX_RUCKSACK
         
         aktwaffe2.w = 0
         For i = aktwaffe + 1 To #MAX_RUCKSACK
            If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
               aktwaffe2 = i
            EndIf
         Next
         
         ; Waffen zerbrechen
         brechfaktor.w = 5
         If has_trait2(mon_no,#ME_WAFFEN_ZERSTOEREN) = 1
            brechfaktor = 25
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_GAIA
            brechfaktor = brechfaktor * 2
         EndIf
         If get_chance(996) < brechfaktor
            If aktwaffe > 0
               If inventory(aktwaffe,akt_spieler)\status = 1
                  inventory(aktwaffe,akt_spieler)\status = 2
                  un_equip(aktwaffe)
                  message(449,#COLOR_ROT)
               EndIf
               If inventory(aktwaffe,akt_spieler)\status = 0
                  inventory(aktwaffe,akt_spieler)\status = 1
                  message(448,#COLOR_ROT)
               EndIf
            EndIf
         EndIf
         
         If get_chance(996) < brechfaktor
            If aktwaffe2 > 0
               If inventory(aktwaffe2,akt_spieler)\status = 1
                  inventory(aktwaffe2,akt_spieler)\status = 2
                  un_equip(aktwaffe)
                  message(449,#COLOR_ROT)
               EndIf
               If inventory(aktwaffe2,akt_spieler)\status = 0
                  inventory(aktwaffe2,akt_spieler)\status = 1
                  message(448,#COLOR_ROT)
               EndIf
            EndIf
         EndIf
         
         ; Monster vergiftet?
         akt_item = inventory(aktwaffe,akt_spieler)\name
         If inventory(aktwaffe,akt_spieler)\status = 4 Or akt_item = #OBJGRAFIK_GIFTSCHWERT Or akt_item = #OBJGRAFIK_GIFTAXT Or akt_item = #OBJGRAFIK_GIFTSPEER Or akt_item = #OBJGRAFIK_GIFT_HAMMER
            art.w = monster(mon_no)\art
            If has_trait2(mon_no,#ME_GIFT) = 0 And art <> #TP_UNDEAD And art <> #TP_CONSTRUCT And art <> #TP_GHOST
               If inventory(aktwaffe,akt_spieler)\status = 4
                  inventory(aktwaffe,akt_spieler)\status = 0
               EndIf
               monster_list()\status = #MONSTERSTATUS_VERGIFTET
               monster_list()\duration = myRand(20)+5
            Else
               message(456,#COLOR_GRUEN)
            EndIf
         EndIf
   
         ; abziehen
         monster_list()\hp = monster_list()\hp - schaden
         ; zerstoert ?
         If monster_list()\hp < 1 Or critical = 1
            zerstoert(#COLOR_ROT,0)
            cleanup_monsters()
         Else
            ; Status aendern!
            If monster_list()\status = #MONSTERSTATUS_NORMAL
               monster_list()\status = #MONSTERSTATUS_ALERT
            EndIf
            If monster_list()\status = #MONSTERSTATUS_SCHLAEFT
               monster_list()\status = #MONSTERSTATUS_NORMAL
            EndIf
      
            ; monster wieder zeigen
            ; Wassermonster?
            If has_trait2(mon_no,#ME_WASSER) > 0
               ; Wasserfeld
               ClipSprite(#SPRITE_TILESET_LABYRINTH, 64, 224, 32, 32) 
               DisplaySprite(#SPRITE_TILESET_LABYRINTH, 160 + xmod*32, 160 + ymod*32)
            Else
               ; Inhalt
               ClipSprite(#SPRITE_TILESET_LABYRINTH, inhalt_x*32, inhalt_y*32, 32, 32) 
               DisplaySprite(#SPRITE_TILESET_LABYRINTH, 160 + xmod*32, 160 + ymod*32)
            EndIf
            
            ClipSprite(#SPRITE_TILESET_MONSTER, sprite_x*32, sprite_y*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, 160 + xmod*32, 160 + ymod*32)
            laby_screen2()
         EndIf
      Else
         Sound(#SOUND_MISSED)
         message(286,#COLOR_ROT)
      EndIf
      
      EndIf ; Freund?
   EndIf ; kein angriff?


EndProcedure
; ---------------------------------------------------------------------------------------

Procedure monster_angriff(x_r.w,y_r.w)

Shared sprite_x, sprite_y, frame, von_ferne, schutz_min, schutz_max

   mon_no.w = getmonster(x_r,y_r)
  
   ; Ausweichen ?
   ausweichen.w = 0
   If (skills(#CE_AUSWEICHEN,akt_spieler)\gewaehlt = 1 Or spieler(akt_spieler)\style = 6) And get_chance(50)
       ausweichen = 1
   EndIf
   
   ; Schleichend ?
   schleichen.w = 0
   If spieler(akt_spieler)\schleichen > 0 And monster_list()\status <> #MONSTERSTATUS_ALERT
      If skills(#CE_SCHLEICHEN,akt_spieler)\gewaehlt = 1 
         chance.w = (reflexe() + luck()) * 2
      Else
         chance.w = reflexe() + luck()
      EndIf
      
      If monster_list()\status = #MONSTERSTATUS_BLIND Or monster_list()\status = #MONSTERSTATUS_SCHLAEFT
         chance = chance * 2
      EndIf
      
      If chance > 90
         chance = 90
      EndIf
      
      If get_chance(100) < chance
         schleichen = 1
      EndIf
   EndIf
   
   If ausweichen = 0 And schleichen = 0
      angriff.w = 50
      If has_trait2(mon_no,#ME_SPINNE) And spinnenkoenigin(spieler(akt_spieler)\level) = 1
         angriff = angriff + 20
      EndIf
      If has_trait2(mon_no,#ME_GOBLIN) And goblinkoenig(spieler(akt_spieler)\level) = 1
         angriff = angriff + 20
      EndIf
      If has_trait2(mon_no,#ME_UNTOTER) And untotenherr(spieler(akt_spieler)\level) = 1
         angriff = angriff + 20
      EndIf
      If spieler(akt_spieler)\fluch = #FLUCH_DER_MORRIGU
         egon.w = monster(mon_no)\angriff * 15
      Else
         egon.w = monster(mon_no)\angriff * 10
      EndIf
      angriff = angriff + egon
      
      If habich(#SPELL_TAEUSCHUNG) > 0
         angriff = angriff / 2
      EndIf
      
      If monster_list()\status = #MONSTERSTATUS_BLIND
         angriff = angriff / 2
      EndIf
      
      angriff = angriff - reflexe() * 10
      
      ; Fighting style?
      If spieler(akt_spieler)\style = 1 Or spieler(akt_spieler)\style = 2
         angriff = angriff - 20
      EndIf
      
      If angriff > 90
         angriff = 90
      EndIf
      If angriff < 10
      angriff = 10
      EndIf
      If spieler(akt_spieler)\fluch = #FLUCH_DER_ATHENE
         angriff = 90
      EndIf
      
      
      If get_chance(103) < angriff

         ; Diebstahl ?
         If has_trait2(mon_no,#ME_DIEBSTAHL) = 1
            Sound(#SOUND_DARKNESS)
            
            If skills(#CE_AWARENESS,akt_spieler)\gewaehlt = 1 And get_chance(50)
		          message(880,#COLOR_BLAU)
            Else
		; unbenutzter gegenstand vorhanden ?
		geg.b = 0
		For i = 1 To #MAX_RUCKSACK
         If inventory(i,akt_spieler)\name <> 0 And inventory(i,akt_spieler)\benutzt = 0 and item(inventory(i,akt_spieler)\name)\type <> #ITEMTYPE_STAFFPIECE
            geg = 1
         EndIf
		Next
		If geg = 1
         geklaut.w = 0
         counter.w = 1
         Repeat
            what.w = Random(#MAX_RUCKSACK-1) + 1
            If inventory(what,akt_spieler)\name <> 0 And inventory(what,akt_spieler)\benutzt = 0 and item(inventory(what,akt_spieler)\name)\type <> #ITEMTYPE_STAFFPIECE
               geklaut = 1
               temp_text.s = message_text(871,language+1) + item(inventory(what,akt_spieler)\name)\name[language+1]
               nachricht7(temp_text,#COLOR_BLAU)
                  If item(inventory(what,akt_spieler)\name)\name[language+1] = ""
                     nachricht7(message_text(769,1+language)+Str(inventory(what,akt_spieler)\name),#COLOR_WEISS)
                  EndIf
               leeren(what)
            EndIf
            counter = counter + 1
         Until geklaut = 1 Or counter > 500
         If counter > 500
            message(37,#COLOR_BLAU)
         EndIf
		Else
			message(37,#COLOR_BLAU)
		EndIf
            EndIf
            
         Else  ; Kein Diebstahl
   
            zeige_unsichtbare(x_r,y_r)
            ; schaden ermitteln
            schaden.w = myRand2(monster(mon_no)\staerke)+1
            IncludeFile("combat2.pbi")
            
            ; Vergiftet ?
            If schaden > 0 And has_trait2(mon_no,#ME_GIFT) = 1
               If habich(#SPELL_GIFTSCHUTZ) > 0
                  message(256,#COLOR_GRUEN)
               Else
                  add_poison(myRand2(10) + 1)
               EndIf
            EndIf

            ; Ansteckend ?
            If schaden > 0 And has_trait2(mon_no,#ME_ANSTECKEND) = 1 And get_chance(100) < 10
               If spieler(akt_spieler)\krankheit = 0
                  spieler(akt_spieler)\krankheit = 1
               Else
                  spieler(akt_spieler)\krankheit = spieler(akt_spieler)\krankheit + 1
               EndIf
               spieler(akt_spieler)\krankheitdauer = spieler(akt_spieler)\krankheitdauer + myRand2(30) + 1
            EndIf
            
            ; Ruestung/Schild beschaedigt?
            brechfaktor.w = 5
            If has_trait2(mon_no,#ME_RUESTUNG_ZERSTOEREN) = 1
               brechfaktor = 25
            EndIf
            If spieler(akt_spieler)\fluch = #FLUCH_GAIA
               brechfaktor = brechfaktor * 2
            EndIf
            If get_chance(996) < brechfaktor
               aktruestung.w = 0
               aktarmor.w = 0
               aktschild.w = 0
               akthelm.w = 0
               akthandschuhe.w = 0
               aktstiefel.w = 0
               For i = 1 To #MAX_RUCKSACK
                  If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_HELMET And inventory(i,akt_spieler)\benutzt = 1
                     akthelm = i
                  EndIf
                  If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_GLOVE And inventory(i,akt_spieler)\benutzt = 1
                     akthandschuhe = i
                  EndIf
                  If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BOOTS And inventory(i,akt_spieler)\benutzt = 1
                     aktstiefel = i
                  EndIf
                  If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_ARMOR And inventory(i,akt_spieler)\benutzt = 1
                     aktarmor = i
                  EndIf
                  If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_SHIELD And inventory(i,akt_spieler)\benutzt = 1
                     aktschild = i
                  EndIf
               Next
               If akthelm > 0 Or akthandschuhe > 0 Or aktstiefel > 0 Or aktschild > 0 Or aktarmor > 0
                  Repeat
                     hugo.w = Random(4) + 1
                     Select(hugo)
                        Case 1: If akthelm > 0
                                   aktruestung = akthelm
                                EndIf
                        Case 2: If akthandschuhe > 0
                                   aktruestung = akthandschuhe
                                EndIf
                        Case 3: If aktstiefel > 0
                                   aktruestung = aktstiefel
                                EndIf
                        Case 4: If aktarmor > 0
                                   aktruestung = aktarmor
                                EndIf
                        Case 5: If aktschild > 0
                                   aktruestung = aktschild
                                EndIf
                     EndSelect
                  Until aktruestung > 0
               EndIf
               If aktruestung > 0
                  If inventory(aktruestung,akt_spieler)\status = 1
                     inventory(aktruestung,akt_spieler)\status = 2
                     un_equip(aktruestung)
                     message(451,#COLOR_ROT)
                  EndIf
                  If inventory(aktruestung,akt_spieler)\status = 0
                     inventory(aktruestung,akt_spieler)\status = 1
                     message(450,#COLOR_ROT)
                  EndIf
               EndIf
            EndIf
            
            ; Spieler Tot ?
            If spieler(akt_spieler)\LifePoints < 1
               spieler(akt_spieler)\cause_of_death = #ROD_COMBAT
               spieler(akt_spieler)\cause_of_death_monster = mon_no
               tot()
            EndIf
         EndIf ; Diebstahl
      Else
         zeige_unsichtbare(x_r,y_r)
         Sound(#SOUND_MISSED)
         message(291,#COLOR_ROT)
      EndIf
   
      ; Flammenaura oder Kaelteaura ?
      If von_ferne = 0
         zw_x = x_r - spieler(akt_spieler)\character_x
         zw_y = y_r - spieler(akt_spieler)\character_Y
         If habich(#SPELL_FEUERAURA) > 0
            schaden2.w = 1
            If has_trait2(mon_no,#ME_BRENNT)
              schaden2 = schaden2 * 2
            ElseIf has_trait2(mon_no,#ME_FEUERFEST)
              schaden2 = 0
            EndIf
            ; Roten Fleck darstellen
            ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 7*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, zw_x*32+160, zw_y*32+160)
            Sound(Random(12))
            ; Schaden darstellen
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(zw_x*32+172, zw_y*32+168,Str(schaden2))
            StopDrawing()
            FlipBuffers()
            Delay(delay_animation)
      
            monster_list()\hp = monster_list()\hp - schaden2
            ; Zerstoert ?
            If monster_list()\hp < 1
               zerstoert(#COLOR_BLAU,0)
               cleanup_monsters()
               mon_no = 0
            Else
               laby_screen()
               mon_no.w = getmonster(x_r,y_r)
            EndIf
         EndIf ; Feueraura
         
         If habich(#SPELL_WINTERATEM) > 0 And mon_no
            schaden2 = 1
            If has_trait2(mon_no,#ME_EISFEST)
              schaden2 = 0
            EndIf
            ; Blauen Fleck darstellen
            ClipSprite(#SPRITE_TILESET_PROJEKTILE, 2*32, 7*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, zw_x*32+160, zw_y*32+160)
            Sound(Random(12))
            ; Schaden darstellen
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(zw_x*32+172, zw_y*32+168,Str(schaden2))
            StopDrawing()
            FlipBuffers()
            Delay(delay_animation)
      
            monster_list()\hp = monster_list()\hp - schaden2
            ; Zerstoert ?
            If monster_list()\hp < 1
               zerstoert(#COLOR_BLAU,0)
               mon_no = 0
               cleanup_monsters()
            Else
               laby_screen()
               mon_no.w = getmonster(x_r,y_r)
            EndIf
         EndIf ; winteratem
         
         If habich(#SPELL_LEBENSBUND) = 1 And mon_no And schaden
            ; Blauen Fleck darstellen
            ClipSprite(#SPRITE_TILESET_PROJEKTILE, 2*32, 7*32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, zw_x*32+160, zw_y*32+160)
            Sound(Random(12))
            ; Schaden darstellen
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(zw_x*32+172, zw_y*32+168,Str(schaden))
            StopDrawing()
            FlipBuffers()
            Delay(delay_animation)
      
            monster_list()\hp = monster_list()\hp - schaden
            ; zerstoert ?
            If monster_list()\hp < 1
               zerstoert(#COLOR_BLAU,0)
               cleanup_monsters()
            Else
               laby_screen()
            EndIf
         EndIf ; lebensbund
         
         
      EndIf   ; von_ferne
   Else  ; ausgewichen
      If schleichen > 0
         message(701,#COLOR_BLAU)
      Else
         If ausweichen > 0
            Sound(#SOUND_MISSED)
            message(178,#COLOR_ROT)
         EndIf
      EndIf
   EndIf
   
EndProcedure

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 404
; FirstLine = 381
; Folding = --
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
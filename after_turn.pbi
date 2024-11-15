Procedure hinterhalt(welches.w = -1)

Shared xmod, ymod

   x.w = spieler(akt_spieler)\character_x
   y.w = spieler(akt_spieler)\character_y

   landmode.w = 0
   landcount.w = 0
   watermode.w = 0
   watercount.w = 0
   mode.w = 0
   bit.w = 1
   For k.w = 1 To 4
      xmod = neighbour(k)\x
      ymod = neighbour(k)\y
      If free_for_monster(x+xmod,y+ymod)
         landmode = landmode | bit
         landcount + 1
      EndIf
      If free_for_water_monster(x+xmod,y+ymod)
         watermode = watermode | bit
         watercount + 1
      EndIf
      bit = bit * 2
   Next

   If watercount > landcount
      mode = watermode
      water.w = 1
   Elseif landcount > 0
      mode = landmode
      water.w = 0
   Else
      ProcedureReturn 0 ;no free room for any monster
   EndIf
   candidates.w = 0
   If welches = -1 ; no monster specified so we chose one now
      For i = 1 to #ANZ_MONSTER2 ;count the possible candidates
         If monster(i)\minlevel <= spieler(akt_spieler)\maxlevel And has_trait2(i,#ME_HINTERHALT) And has_trait2(i,#ME_WASSER) = water
            candidates + 1
         EndIf
      Next
      If candidates = 0 ;no candidate found
         If water = 0
            welches = #MONSTER_GIANT_RAT
         Else
            welches = #MONSTER_GIANT_BLOWFISH
         EndIf
      Else
         selected.w = myRand2(candidates-1) 
         For i = 1 to #ANZ_MONSTER2
            If monster(i)\minlevel <= spieler(akt_spieler)\maxlevel And has_trait2(i,#ME_HINTERHALT) And has_trait2(i,#ME_WASSER) = water
               If selected = 0
                  welches = i
                  break
               EndIf
               selected - 1
            EndIf
         Next
      EndIf
   Else ;monster IS specified
     If has_trait2(welches,#ME_WASSER)
        mode = watermode
        If watercount = 0
           ProcedureReturn 0 ;no free room for specified monster
        EndIf
     Else
        mode = landmode
        If landcount = 0
           ProcedureReturn 0 ;no free room for specified monster
        EndIf
     EndIf
   EndIf

   aufstehen(monster(welches)\nr,#SPRITE_TILESET_MONSTER,mode)
   bit = 1
   For k.w = 1 To 4
      xmod = neighbour(k)\x
      ymod = neighbour(k)\y
      If mode & bit
         setmonster(x+xmod,y+ymod,spieler(akt_spieler)\level,welches,monster(welches)\nr,monster(welches)\lebenspunkte,0,0,0)
      EndIf
      bit = bit * 2
   Next
   laby_screen()
   
   ProcedureReturn mode
   
EndProcedure

; --------------------------------------------------------------------------------

Procedure restaurieren()

   show_sight()
   
   If skills(#CE_ERDE_SPUEREN,akt_spieler)\gewaehlt = 1
      draw_screen3(0,0) ; Mauern
   EndIf
   If skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 1
      draw_screen4(0,0) ; Schaetze    
      If skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 0
        draw_screen9(0,0) ; Monster over treasure
      EndIf      
   EndIf
   If skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 1
      draw_screen7(0,0) ; Monster
   EndIf
   
   laby_rahmen()
   show_logo()
   show_varys(0)
   show_buttons()

EndProcedure

; --------------------------------------------------------------------------------

Procedure nach_zug()

; Monster Angriff, verdursten, verhungern, aktive zauber, hinterhalt, neue monster, ring of life

Shared xmod, ymod, von_ferne, spinnenkoenigin, goblinkoenig, untotenherr

   spieler(akt_spieler)\moves = spieler(akt_spieler)\moves + 1

   ; Metamagie ausschalten
   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler)\dauer = #META_MAGIC
         aktive(i,akt_spieler)\dauer = 0
         aktive(i,akt_spieler)\nr = 0
         aktive(i,akt_spieler)\staerke = 0
      EndIf
   Next
   
   ; Position etc. fuer Stundenglas speichern
   spieler(akt_spieler)\old_pos_x  = spieler(akt_spieler)\character_x
   spieler(akt_spieler)\old_pos_y  = spieler(akt_spieler)\character_y
   spieler(akt_spieler)\old_level  = spieler(akt_spieler)\level
   spieler(akt_spieler)\old_lp     = spieler(akt_spieler)\lifepoints
   spieler(akt_spieler)\old_max_lp = spieler(akt_spieler)\maxlifepoints
   spieler(akt_spieler)\old_mp     = spieler(akt_spieler)\mana
   spieler(akt_spieler)\old_max_mp = spieler(akt_spieler)\maxmana
   

   ; Hinterhalt ?
   If skills(#CE_GEFAHREN_SPUEREN,akt_spieler)\gewaehlt = 1
      If (spieler(akt_spieler)\moves % 2)
         spieler(akt_spieler)\hinterhalt = spieler(akt_spieler)\hinterhalt + 1
      EndIf
   Else
      spieler(akt_spieler)\hinterhalt = spieler(akt_spieler)\hinterhalt + 1
   EndIf
   If spieler(akt_spieler)\fluch = #FLUCH_DES_MARDUK
      spieler(akt_spieler)\hinterhalt = spieler(akt_spieler)\hinterhalt + 1
   EndIf
   If levelmod(spieler(akt_spieler)\level) = #LM_HINTERHALTE
      spieler(akt_spieler)\hinterhalt = spieler(akt_spieler)\hinterhalt + 2
   EndIf
   akt_hinterhalt.w = spieler(akt_spieler)\hinterhalt - 20
   If akt_hinterhalt > 0  And habich(#SPELL_LIED_DER_EINSAMKEIT) = 0
     If get_chance(100) < akt_hinterhalt
      
         mode.w = hinterhalt()
         If mode > 0 ;there was room for at least 1 monster
            message(4,#COLOR_ROT)
            spieler(akt_spieler)\hinterhalt = 0
         EndIf
      
         xmod = 0
         ymod = 0
      EndIf  ; Hinterhalt
   EndIf
   
   
   ; Monster greifen an
   ; Nahkampf
   unsichtbar.w = 0
   hat_monster.w = 0
   If habich(#SPELL_UNSICHTBARKEIT) = 1 And get_chance(100) < 80
      unsichtbar = 1
   EndIf
   
   If unsichtbar = 0
     For i = 1 To 4
       xx.w = spieler(akt_spieler)\character_x + neighbour(i)\x
       yy.w = spieler(akt_spieler)\character_y + neighbour(i)\y
       mon_no.w = getmonster(xx,yy)
       If mon_no
         If monster_list()\status <> #MONSTERSTATUS_SCHLAEFT And monster_list()\status <> #MONSTERSTATUS_FREUND
           von_ferne = 0
           hat_monster = 1
           ; Monster huepfen lassen
           x.w = #HALF_MATRIX_SIZE + neighbour(i)\x
           y.w = #HALF_MATRIX_SIZE + neighbour(i)\y
           If has_trait2(mon_no,#ME_WASSER) > 0 
             draw_tile(#FELD_WASSER,x ,y , 0, 0, -1)
           Else
             tile.w = labyrinth(spieler(akt_spieler)\level,xx,yy)\feld
             If fields(tile)\attri_floor
               bg.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\stat2
             Else
               bg = 0
             EndIf
             draw_tile(tile,x ,y , 0, 0, bg)
           EndIf
           If laby_item(xx,yy)\name[spieler(akt_spieler)\level] > 0
             draw_item(laby_item(xx,yy)\name[spieler(akt_spieler)\level], x ,y , 0, 0)
           EndIf
           draw_monster(x, y, 0, -3)
           restaurieren()
           monster_angriff(xx,yy)
           If has_trait2(mon_no,#ME_WASSER) > 0 
             draw_tile(#FELD_WASSER,x ,y , 0, 0, -1)
           Else
             draw_tile(tile,x ,y , 0, 0, bg)
           EndIf
           If laby_item(xx,yy)\name[spieler(akt_spieler)\level] > 0
             draw_item(laby_item(xx,yy)\name[spieler(akt_spieler)\level], x ,y , 0, 0)
           EndIf
           draw_monster(x, y, 0, 0)
           restaurieren()
         EndIf
       EndIf
     Next
   Else
      message(444,#COLOR_BLAU)
   EndIf
   
   ; Fernkampf
   fernkampf()
   
   ; Lieder des Schlafes/Selbstmords
   If habich(#SPELL_LIED_DES_SCHLAFES) > 0
     ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
     r.w = 6
     While monster_list()\z = spieler(akt_spieler)\level
       If monster_list()\x > spieler(akt_spieler)\character_x -r And monster_list()\x < spieler(akt_spieler)\character_x +r And monster_list()\y > spieler(akt_spieler)\character_y -r And monster_list()\y < spieler(akt_spieler)\character_y +r
         If has_trait2(monster_list()\number,#ME_SCHLAEFT) And monster_list()\status <> #MONSTERSTATUS_SCHLAEFT
           If get_chance(100) < 20
             spell_x = monster_list()\x - spieler(akt_spieler)\character_x
             spell_y = monster_list()\y - spieler(akt_spieler)\character_y
             Sound(#SOUND_EVASION)
             For i = 1 To 8
               ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
               FlipBuffers()
               Delay(delay_animation2)
             Next
             For i = 1 To 8
               ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
               FlipBuffers()
               Delay(delay_animation2)
             Next
             monster_list()\status = #MONSTERSTATUS_SCHLAEFT
           EndIf
         EndIf
       EndIf
       NextElement(monster_list())
     Wend
   EndIf
   
   If habich(#SPELL_LIED_DES_SELBSTMORDS) > 0
     ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
     r.w = 6
     While monster_list()\z = spieler(akt_spieler)\level
       If monster_list()\x > spieler(akt_spieler)\character_x -r And monster_list()\x < spieler(akt_spieler)\character_x +r And monster_list()\y > spieler(akt_spieler)\character_y -r And monster_list()\y < spieler(akt_spieler)\character_y +r
         art_n = monster(monster_list()\number)\art
         If art_n = 1 Or art_n = 2
           If get_chance(100) < 10
             spell_x = monster_list()\x - spieler(akt_spieler)\character_x
             spell_y = monster_list()\y - spieler(akt_spieler)\character_y
             Sound(#SOUND_OW)
             For i = 1 To 8
               ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
               FlipBuffers()
               Delay(delay_animation2)
             Next
             For i = 1 To 8
               ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
               FlipBuffers()
               Delay(delay_animation2)
             Next
             zerstoert(#COLOR_BLAU)
           EndIf
         EndIf
       EndIf
       NextElement(monster_list())
     Wend
     cleanup_monsters()
   EndIf
   

   ; Verdursten!
   if skills(#CE_UNDEAD,akt_spieler)\gewaehlt = 0 And spieler(akt_spieler)\creature_typ = 0
      If ((ich_trage3(#OBJGRAFIK_KETTE1) = 1 Or habich(#SPELL_HYPNOSE) > 0) And get_chance(50) ) Or (ich_trage3(#OBJGRAFIK_KETTE1) = 0 And habich(#SPELL_HYPNOSE) = 0)
         spieler(akt_spieler)\Durst = spieler(akt_spieler)\Durst + 1
      EndIf
      If spieler(akt_spieler)\fluch = #FLUCH_DER_NAIADEN
         spieler(akt_spieler)\Durst = spieler(akt_spieler)\Durst + 1
      EndIf
      If sonderlevel(spieler(akt_spieler)\level) = #SL_WUESTE 
         spieler(akt_spieler)\Durst = spieler(akt_spieler)\Durst + 1
      EndIf
      If spieler(akt_spieler)\Durst < #dehydration_1
         spieler(akt_spieler)\verdursten = 0
      EndIf
      If spieler(akt_spieler)\Durst >= #dehydration_1 And spieler(akt_spieler)\Durst < #dehydration_2
         spieler(akt_spieler)\verdursten = 1
      EndIf
      If spieler(akt_spieler)\Durst >= #dehydration_2 And spieler(akt_spieler)\Durst < #dehydration_3
         spieler(akt_spieler)\verdursten = 2
      EndIf
      If spieler(akt_spieler)\Durst >= #dehydration_3 And spieler(akt_spieler)\Durst < #dehydration_4
         spieler(akt_spieler)\verdursten = 3
         spielerschaden(1,3,#ROD_THIRST)
      EndIf
      If spieler(akt_spieler)\Durst >= #dehydration_4
         spieler(akt_spieler)\verdursten = 4
         spielerschaden(2,3,#ROD_THIRST)
      EndIf
   endif
   
   ; Verhungern!
   if skills(#CE_UNDEAD,akt_spieler)\gewaehlt = 0
      If ((ich_trage3(#OBJGRAFIK_KETTE2) = 1 Or habich(#SPELL_HYPNOSE) > 0) And get_chance(50)) Or (ich_trage3(#OBJGRAFIK_KETTE2) = 0 And habich(#SPELL_HYPNOSE) = 0)
         spieler(akt_spieler)\hunger = spieler(akt_spieler)\hunger + 1
      EndIf
      If spieler(akt_spieler)\fluch = #FLUCH_DES_DAGDA
         spieler(akt_spieler)\hunger = spieler(akt_spieler)\hunger + 1
      EndIf
      If spieler(akt_spieler)\hunger < #starving_1
         spieler(akt_spieler)\verhungern = 0
      EndIf
      If spieler(akt_spieler)\hunger >= #starving_1 And spieler(akt_spieler)\hunger < #starving_2
         spieler(akt_spieler)\verhungern = 1
      EndIf
      If spieler(akt_spieler)\hunger >= #starving_2 And spieler(akt_spieler)\hunger < #starving_3
         spieler(akt_spieler)\verhungern = 2
      EndIf
      If spieler(akt_spieler)\hunger >= #starving_3 And spieler(akt_spieler)\hunger < #starving_4
         spieler(akt_spieler)\verhungern = 3
         spielerschaden(1,3,#ROD_HUNGER)
      EndIf
      If spieler(akt_spieler)\hunger >= #starving_4
         spieler(akt_spieler)\verhungern = 4
         spielerschaden(2,3,#ROD_HUNGER)
      EndIf
   endif

   ; Zeit Aktiver Zauber verkuerzen
   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler)\dauer > 1
         If aktive(i,akt_spieler)\dauer <> #UNENDLICH
            aktive(i,akt_spieler)\dauer = aktive(i,akt_spieler)\dauer - 1
         EndIf
      Else
         If aktive(i,akt_spieler)\dauer = 1
            aktive(i,akt_spieler)\dauer = 0
            aktive(i,akt_spieler)\nr = 0
            aktive(i,akt_spieler)\staerke = 0
         EndIf
      EndIf
   Next
   
   ; Manaschwund?
   If sonderlevel(spieler(akt_spieler)\level) = #LM_MANASCHWUND
      If spieler(akt_spieler)\mana > 0
         spieler(akt_spieler)\mana = spieler(akt_spieler)\mana - 1
      EndIf
   EndIf

   ; Lampen und Fackeln abbrennen
   For i = 1 To #MAX_RUCKSACK
      ; Fackel ?
      If inventory(i,akt_spieler)\benutzt = 1 And inventory(i,akt_spieler)\name = #OBJGRAFIK_FACKEL1
         inventory(i,akt_spieler)\status = inventory(i,akt_spieler)\status - 1
         If inventory(i,akt_spieler)\status < 1
            If inventory(i,akt_spieler)\anzahl > 0
               inventory(i,akt_spieler)\anzahl = inventory(i,akt_spieler)\anzahl - 1
               inventory(i,akt_spieler)\status = item(inventory(i,akt_spieler)\name)\attri1
            Else
               inventory(i,akt_spieler)\benutzt = 0
               spieler(akt_spieler)\light = spieler(akt_spieler)\light - 3
            EndIf
         EndIf
      EndIf
      ; Lampe ?
      If inventory(i,akt_spieler)\benutzt = 1 And inventory(i,akt_spieler)\name = #OBJGRAFIK_LAMPE1
         inventory(i,akt_spieler)\status = inventory(i,akt_spieler)\status - 1
         If inventory(i,akt_spieler)\status < 1
            If inventory(i,akt_spieler)\anzahl > 0
               inventory(i,akt_spieler)\anzahl = inventory(i,akt_spieler)\anzahl - 1
               inventory(i,akt_spieler)\status = item(inventory(i,akt_spieler)\name)\attri1
            Else
               inventory(i,akt_spieler)\benutzt = 0
               spieler(akt_spieler)\light = spieler(akt_spieler)\light - 4
            EndIf
         EndIf
      EndIf
   Next

   ; Fluch
   If spieler(akt_spieler)\fluch = #FLUCH_DER_TIAMAT
     spielerschaden(1,1,#ROD_TIAMAT)
   EndIf
   If spieler(akt_spieler)\fluchdauer = 1   ; Fluch zuende ?
      spieler(akt_spieler)\fluchdauer = 0
      spieler(akt_spieler)\fluch = 0
   ElseIf spieler(akt_spieler)\fluchdauer > 1
      spieler(akt_spieler)\fluchdauer = spieler(akt_spieler)\fluchdauer - 1
   EndIf
   
   ; Betrunken
   If spieler(akt_spieler)\betrunken > 0
      spieler(akt_spieler)\betrunken = spieler(akt_spieler)\betrunken - 1
   EndIf

   ; Krankheiten
   If spieler(akt_spieler)\krankheit > 0
      If get_chance(100) < 20
         spielerschaden(1,2,#ROD_POISON)
      EndIf
      If get_chance(100) < 5
         spieler(akt_spieler)\krankheit = spieler(akt_spieler)\krankheit + 1
      EndIf
      spieler(akt_spieler)\krankheitdauer = spieler(akt_spieler)\krankheitdauer - 1
      If spieler(akt_spieler)\krankheitdauer = 0
         spieler(akt_spieler)\krankheit = 0
      EndIf
   EndIf

   ; Gift
   If spieler(akt_spieler)\poison = 1   ; Gift ausgestanden ?
      spielerschaden(1, 2, #ROD_POISON)
      spieler(akt_spieler)\poison = 0
      ; Giftlehre
      If get_chance(102) < 10
         message(625,#COLOR_GRUEN)
         spieler(akt_spieler)\giftlehre = spieler(akt_spieler)\giftlehre + 1
      EndIf
   EndIf
   If spieler(akt_spieler)\poison > 1
      poison_dam.w = (spieler(akt_spieler)\poison / #POISON_DAMAGE_FACTOR ) +1
      If spieler(akt_spieler)\fluch <> #FLUCH_DES_APOPHIS
         spieler(akt_spieler)\poison = spieler(akt_spieler)\poison - poison_dam
         ; Giftlehre?
         If spieler(akt_spieler)\poison > 1
            If get_chance(100) < spieler(akt_spieler)\giftlehre * 2
               spieler(akt_spieler)\poison = spieler(akt_spieler)\poison - 1
            EndIf
         EndIf
      Else
         message(256,#COLOR_GRAU)
      EndIf
      spielerschaden(poison_dam,2,#ROD_POISON)
   EndIf
   
   
   ; Monster regenerieren + Monster Vergiftungsschaden
   processed_already.w = 0
   For i = 1 To akt_spieler-1
     If spieler(i)\level = spieler(akt_spieler)\level And spieler(i)\status = 1
       processed_already = 1
       Break
     EndIf
   Next
   If processed_already = 0 ; Nur einmal bei mehreren Spielern auf der selben Ebene
   
     If spinnenkoenigin > 0 And get_chance(50)
       monster_setzen(spieler(akt_spieler)\level,monster_random(spieler(akt_spieler)\level,#SL_SPINNENBAU))
     EndIf
     If goblinkoenig > 0 And get_chance(50)
       monster_setzen(spieler(akt_spieler)\level,monster_random(spieler(akt_spieler)\level,#SL_GOBLINHOEHLE))
     EndIf
     If untotenherr > 0 And get_chance(50)
       monster_setzen(spieler(akt_spieler)\level,monster_random(spieler(akt_spieler)\level,#SL_TOTENHALLE))
     EndIf
         
     ClearList(animationlist())
     ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
     While monster_list()\z = spieler(akt_spieler)\level
       ;printn("living: "+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
       
       ; Position auf Schirm berechnen
       posx.w = monster_list()\x - spieler(akt_spieler)\character_x
       posy.w = monster_list()\y - spieler(akt_spieler)\character_y
       ;store actual position for later restoration
       act_monster.monster_pointer\p = @monster_list()
       
       ;poisoned?
       If monster_list()\status = #MONSTERSTATUS_VERGIFTET
         ;printn("poisoned:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))

         monster_list()\duration = monster_list()\duration - 1
         If monster_list()\duration = 0
           monster_list()\status = #MONSTERSTATUS_NORMAL
         EndIf
         ; on screen?
         If posx >= - 6 And posx <= 6 And posy >= - 6 And posy <= 6
           laby_screen2()
           ; Roten Fleck darstellen
           ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0, 7*32, 32, 32)
           DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+ posx*32, 160 + posy*32)
           ; Schaden darstellen
           wohin = ScreenOutput()
           StartDrawing(wohin)
           DrawingMode(1)
           FrontColor(RGB(255,255,255))  ; Weiss
           DrawText(172+posx*32, 172+posy*32,Str(2))
           StopDrawing()
           Sound(Random(12))
           FlipBuffers()
           Delay(delay_animation)
           ;restore pointer
           ChangeCurrentElement(monster_list(),act_monster\p)
         EndIf
         monster_list()\hp = monster_list()\hp - 2
         If monster_list()\hp < 1
           zerstoert(#COLOR_GRUEN)
           ;restore pointer
           ChangeCurrentElement(monster_list(),act_monster\p)
         EndIf
       EndIf
       
       If monster_list()\status = #MONSTERSTATUS_BLIND
         monster_list()\duration = monster_list()\duration - 1
         If monster_list()\duration = 0
           monster_list()\status = #MONSTERSTATUS_NORMAL
         EndIf
       EndIf
       
       If has_trait2(monster_list()\number,#ME_VERMEHREND) And get_chance(100) < 5
         ;Printn("multipy:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
         hugo.w = monster_list()\number
         xxx.w = monster_list()\x
         yyy.w = monster_list()\y
         zzz.w = monster_list()\z

         For k.w = 1 To 4
           If free_for_monster(xxx+neighbour(k)\x,yyy+neighbour(k)\y,zzz)
             setmonster(xxx+neighbour(k)\x,yyy+neighbour(k)\y,zzz,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,0,0,0)
             Break
           EndIf
         Next
         ;restore pointer
         ChangeCurrentElement(monster_list(),act_monster\p)
       EndIf
       
       ; Regeneration ?
       If has_trait2(monster_list()\number, #ME_REGENERATION) And monster_list()\hp < monster(monster_list()\number)\lebenspunkte And monster_list()\status <> #MONSTERSTATUS_VERGIFTET
          ;Printn("regenerate:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
         ; Im Sichtfeld?
         If posx >= - 6 And posx <= 6 And posy >= - 6 And posy <= 6
            AddElement(animationlist())
            animationlist()\x = posx
            animationlist()\y = posy
         EndIf
         ChangeCurrentElement(monster_list(),act_monster\p)
         monster_list()\hp = monster_list()\hp + myRand2(5)+1
         If monster_list()\hp > monster(monster_list()\number)\lebenspunkte
           monster_list()\hp = monster(monster_list()\number)\lebenspunkte
         EndIf
       EndIf
       
       ;swarmed?
       If monster_list()\status = #MONSTERSTATUS_SCHWARM
         ;printn("swarm1:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
         monster_list()\duration = monster_list()\duration - 1
         If monster_list()\duration = 0
           monster_list()\status = #MONSTERSTATUS_NORMAL
         EndIf
         schaden.w = MyRand(5)+1
         ; on screen?
         If posx >= - 6 And posx <= 6 And posy >= - 6 And posy <= 6
           Sound(#SOUND_INSEKT)
           For jjj = 1 To 5
             For iii = 1 To 2
                laby_screen2()
                ClipSprite(#SPRITE_TILESET_FX, iii*32-32, 14*32, 32, 32)
                DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+posx*32,160+posy*32)
                FlipBuffers()
                Delay(delay_animation2)
             Next
           Next
           laby_screen2()
           ; Roten Fleck darstellen
           ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0, 7*32, 32, 32)
           DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+ posx*32, 160 + posy*32)
           ; Schaden darstellen
           wohin = ScreenOutput()
           StartDrawing(wohin)
           DrawingMode(1)
           FrontColor(RGB(255,255,255))  ; Weiss
           DrawText(172+posx*32, 168+posy*32,Str(schaden))
           StopDrawing()
           Sound(Random(12))
           FlipBuffers()
           Delay(delay_animation)
           ChangeCurrentElement(monster_list(),act_monster\p)
         EndIf
         monster_list()\hp = monster_list()\hp - schaden
         ;printn("swarm2:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
         If monster_list()\hp < 1
           zerstoert(#COLOR_BLAU)
           ChangeCurrentElement(monster_list(),act_monster\p)
         EndIf
       EndIf
       
       NextElement(monster_list())
     Wend
     
     If CountList(animationlist())
       Sound(#SOUND_HOLY)
       For jjj = 1 To 5
         For iii = 0 To 3
           laby_screen2()
           ResetList(animationlist())
           While NextElement(animationlist())
             ClipSprite(#SPRITE_TILESET_ANIMATIONEN, iii*40, 1, 39, 39)
             DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+animationlist()\x*32,156+animationlist()\y*32)
           Wend
           FlipBuffers()
           Delay(delay_animation2)
         Next
       Next
     EndIf
   EndIf
 
   
   ; neue monster
   If Random(1)
      If level > 3
         monster_setzen(spieler(akt_spieler)\level,monster_random(spieler(akt_spieler)\level,sonderlevel(spieler(akt_spieler)\level)))
      EndIf
      
      If level > 15
         monster_setzen(spieler(akt_spieler)\level,monster_random(spieler(akt_spieler)\level,sonderlevel(spieler(akt_spieler)\level)))
      EndIf
      
      If level > 30
         monster_setzen(spieler(akt_spieler)\level,monster_random(spieler(akt_spieler)\level,sonderlevel(spieler(akt_spieler)\level)))
      EndIf
   EndIf
   
   
   If habich(#SPELL_REGENERATION) > 0
      If spieler(akt_spieler)\Lifepoints < maxlife()
         spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + 1
         If spieler(akt_spieler)\Lifepoints > maxlife()
            spieler(akt_spieler)\Lifepoints = maxlife()
         EndIf
      EndIf
   EndIf
   ; Song of Wealth ?
   If habich(#SPELL_LIED_DES_REICHTUMS) > 0
     gold_finden2(1)
   EndIf
   ; Song of Life ?
   If habich(#SPELL_LIED_DES_LEBENS) > 0
      If spieler(akt_spieler)\Lifepoints < maxlife()
         spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + 1
         If spieler(akt_spieler)\Lifepoints > maxlife()
            spieler(akt_spieler)\Lifepoints = maxlife()
         EndIf
         
         ; Aktiver Ring des Lebens?
         ring = 0
         For i = 1 To #MAX_RUCKSACK
            If inventory(i,akt_spieler)\name = #OBJGRAFIK_RING3 And inventory(i,akt_spieler)\benutzt = 1
               ring = i
            EndIf
         Next
         If ring > 0
            inventory(ring,akt_spieler)\status = inventory(ring,akt_spieler)\status - 1
            If inventory(ring,akt_spieler)\status = 0
               leeren(ring)
               message(257,#COLOR_WEISS)
               terminate(#SPELL_LIED_DES_LEBENS,#OBJGRAFIK_RING3)
            EndIf
         EndIf
      EndIf
   EndIf
   
   ; Spieler Zugweite hochsetzen
   spieler(akt_spieler)\Speed = maxspeed()
   spieler(akt_spieler)\charge = 0
  
EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 31
; FirstLine = 9
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
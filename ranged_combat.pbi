; -------------------------------------------------------------------------------
; attack spells and other projectiles

Procedure animate_projectile(aussehen.w,direction.w = 1)

Shared spell_x, spell_y

   akt_frame.w = 1
   zw_frame.w = 1

   spx.w = spell_x
   If spx > (#HALF_MATRIX_SIZE-1)
      spx = (#HALF_MATRIX_SIZE-1)
   ElseIf spx < -(#HALF_MATRIX_SIZE-1)
      spx = -(#HALF_MATRIX_SIZE-1)
   EndIf
   spy.w = spell_y
   If spy > (#HALF_MATRIX_SIZE-1)
      spy = (#HALF_MATRIX_SIZE-1)
   ElseIf spy < -(#HALF_MATRIX_SIZE-1)
      spy = -(#HALF_MATRIX_SIZE-1)
   EndIf
   xdir.w
   ydir.w
   If spx > 0
     ziel = 32 * spx
     xdir = 1*direction
     ydir = 0
   EndIf
   If spx < 0
     ziel = -32 * spx
     xdir = -1*direction
     ydir = 0
   EndIf
   If spy > 0
     ziel = 32 * spy
     xdir = 0
     ydir = 1*direction
   EndIf
   If spy < 0
     ziel = -32 * spy
     xdir = 0
     ydir = -1*direction
   EndIf
 
   Select aussehen
     Case 1: ; Funke
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 6*32, 32, 32)
     Case 2: ; Lila
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, 3*32, 4*32, 32, 32)
     Case 3: ; Feuerschlag
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, 3*32, 6*32, 32, 32)
     Case 4: ; Blauer Ball
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, 1*32, 4*32, 32, 32)
     Case 5: ; Pfeil
       If spx*direction > 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 1*32, 3*32, 32, 32)
       EndIf
       If spx*direction < 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 3*32, 3*32, 32, 32)
       EndIf
       If spy*direction > 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 2*32, 3*32, 32, 32)
       EndIf
       If spy*direction < 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 3*32, 32, 32)
        EndIf
     Case 6: ; Blitz
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, 1*32, 8*32, 32, 32)
     Case 7: ; Dolch
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, akt_frame*32-32,0, 32, 32)
     Case 8: ; Axt
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, akt_frame*32-32,32, 32, 32)
     Case 9: ; Speer
       If spx*direction > 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 32,64, 32, 32)
       EndIf
       If spx*direction < 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 96,64, 32, 32)
       EndIf
       If spy*direction > 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 64,64, 32, 32)
       EndIf
       If spy*direction < 0
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0,64, 32, 32)
       EndIf
     Case 10: ; Grosser Gruener Ball
       ClipSprite(#SPRITE_TILESET_PROJEKTILE, 2*32, 4*32, 32, 32)
     Case 11: ; Stein
       ClipSprite(#SPRITE_TILESET_ITEMS, 3*32,18*32, 32, 32)
     Case 12 ; Dart
        If spx*direction < 0
           ClipSprite(#SPRITE_TILESET_PROJEKTILE, 96,160, 32, 32)
        EndIf
        If spx*direction > 0
           ClipSprite(#SPRITE_TILESET_PROJEKTILE, 32,160, 32, 32)
        EndIf
        If spy*direction < 0
           ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0,160, 32, 32)
        EndIf
        If spy*direction > 0
           ClipSprite(#SPRITE_TILESET_PROJEKTILE, 64,160, 32, 32)
        EndIf

   EndSelect

   bx.w = 160
   by.w = 160
   If direction = -1 ;projectile is flying towards player instead from
     If spx <> 0 
       bx = 160 + spx*32
     Else
       by = 160 + spy*32
     EndIf 
   Endif

   i = 1
   stepsize.w = 2
   
   Repeat
     starttime.l = ElapsedMilliseconds()
     Fenster()
      laby_screen2()
      If aussehen = 11 ; Stein
         ClipSprite(#SPRITE_TILESET_ITEMS, 3*32,18*32, 32, 32) ;need re-clipping as laby_screen clips in items too
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, bx + i*xdir, by + i*ydir)
      Else
        If aussehen = 7 Or aussehen = 8; Dolch,Axt
          ClipSprite(#SPRITE_TILESET_PROJEKTILE, akt_frame*32-32,32*(aussehen-7) , 32, 32)
          zw_frame = zw_frame + 1
          If zw_frame > 3
            akt_frame = akt_frame + 1
            If akt_frame > 4
              akt_frame = 1
            EndIf
            zw_frame = 1
          EndIf
        EndIf
        ;Dolch,Axt + all else
        DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, bx + i*xdir, by + i*ydir)
      EndIf
      FlipBuffers()
      timediff.l = ElapsedMilliseconds()-starttime
      ;print(str(timediff)+" ")
      If timediff < (delay_animation2 * stepsize) / 4
         delay((delay_animation2 * stepsize) / 4 - timediff)
      Else ;increase stepsize so next time we should need delay
         stepsize = (timediff*4 + delay_animation2 - 1) / delay_animation2 
      EndIf
      i = i + stepsize
    Until i >= ziel
   
EndProcedure

; ------------------------------------------------------------------------------------------

Procedure fernattack()

Shared spell_x, spell_y, blocked, von_ferne

   x.w = monster_list()\x
   y.w = monster_list()\y
   mon_no.w = monster_list()\number
   ; Schleichend?
   If spieler(akt_spieler)\schleichen > 0
      If skills(#CE_SCHLEICHEN,akt_spieler)\gewaehlt = 1 
         chance.w = (reflexe() + luck()) * 2
      Else
         chance.w = reflexe() + luck()
      EndIf
      
      If chance > 90
         chance = 90
      EndIf
      
      If get_chance(100) < chance And monster_list()\status <> #MONSTERSTATUS_ALERT
         message(701,#COLOR_BLAU)
         ProcedureReturn 0
      EndIf
   EndIf
   
   ausw = (reflexe() / 2) + (luck() / 2) * 3
   If ausw > 50
     ausw = 50
   EndIf
   
   ; Ausgewichen?
   ausgewichen = 0
   If (skills(#CE_AUSWEICHEN, akt_spieler)\gewaehlt = 1 And get_chance(50)) Or (get_chance(100) < ausw)
     ausgewichen = 1
   EndIf
      
   angegriffen = 0
   ; Bogen ?
   If has_trait2(mon_no,#ME_FERNKAMPF) = 1 And angegriffen = 0
     angegriffen = 1
     message(24,#COLOR_ROT)
     Sound(#SOUND_BOW)
     animate_projectile(5,-1)
     weg.w = 0
     ; Unverwundbar ?
     If habich(#SPELL_UNVERWUNDBARKEIT) > 0
       message(431,#COLOR_BLAU)
       weg = 1
     EndIf
     ; Geschosseschutz ?
     If habich(#SPELL_SCHUTZ_VOR_GESCHOSSEN) > 0 And weg = 0
       message(25,#COLOR_BLAU)
       weg = 1
     EndIf
     If ausgewichen = 1 And weg = 0
       weg = 1
       Sound(#SOUND_MISSED)
       message(178,#COLOR_ROT)
     EndIf
     If weg = 0
       von_ferne = 1
       monster_angriff(x,y)
     EndIf
   EndIf
      
   ; Wirft Steine ?
   If has_trait2(mon_no,#ME_STEINE_WERFEN) = 1 And angegriffen = 0
     angegriffen = 1
     message(679,#COLOR_ROT)
     Sound(#SOUND_BOW)
     animate_projectile(11,-1)
     weg.w = 0
     ; Unverwundbar ?
     If habich(#SPELL_UNVERWUNDBARKEIT) > 0
       message(431,#COLOR_BLAU)
       weg = 1
     EndIf
     ; Geschosseschutz ?
     If habich(#SPELL_SCHUTZ_VOR_GESCHOSSEN) > 0 And weg = 0
       message(25,#COLOR_BLAU)
       weg = 1
     EndIf
     If ausgewichen = 1 And weg = 0
       weg = 1
       Sound(#SOUND_MISSED)
       message(178,#COLOR_ROT)
     EndIf
     If weg = 0
       von_ferne = 1
        monster_angriff(x,y)
     EndIf
   EndIf
      
   ; Feueratem ?
   If has_trait2(mon_no,#ME_FEUERATEM) = 1 And angegriffen = 0
     angegriffen = 1
     Sound(#SOUND_FLAME)
     message(313,#COLOR_ROT)
     animate_projectile(1,-1)
     If ausgewichen = 1 
       weg = 1
       Sound(#SOUND_MISSED)
       message(178,#COLOR_ROT)
     EndIf
     If weg = 0
       schaden.w = myRand2(monster(mon_no)\staerke + 1) + 2
       spielerschaden(schaden,1,#ROD_FIREBREATHING)
     EndIf
   EndIf
      
   ; Frostatem ?
   If has_trait2(mon_no,#ME_FROSTATEM) > 0 And angegriffen = 0
     angegriffen = 1
     Sound(#SOUND_FLAME)
     message(314,#COLOR_BLAU)
     animate_projectile(4,-1)
     weg = 0
     If ausgewichen = 1 And weg = 0
       weg = 1
       Sound(#SOUND_MISSED)
       message(178,#COLOR_ROT)
     EndIf
     If weg = 0
       schaden.w = myRand2(monster(mon_no)\staerke + 1) + 2
       spielerschaden(schaden,1,#ROD_FROSTBREATHING)
     EndIf
   EndIf
      
   ; Giftatem ?
   If has_trait2(mon_no,#ME_GIFTATEM) = 1 And angegriffen = 0
     angegriffen = 1
     Sound(#SOUND_FLAME)
     message(316,#COLOR_GRUEN)
     animate_projectile(10,-1)
     If ausgewichen = 1
       weg = 1
       Sound(#SOUND_MISSED)
       message(178,#COLOR_ROT)
     EndIf
     If weg = 0
       add_poison(monster(mon_no)\staerke)
     EndIf
   EndIf
      
   ; Blitze ?
   If has_trait2(mon_no,#ME_BLITZE) = 1 And angegriffen = 0
     angegriffen = 1
     Sound(#SOUND_BLITZ)
     message(317,#COLOR_BLAU)
     animate_projectile(6,-1)
     If ausgewichen = 1 And weg = 0
       weg = 1
       Sound(#SOUND_MISSED)
       message(178,#COLOR_ROT)
     EndIf
     If weg = 0
       schaden.w = myRand2(monster(mon_no)\staerke + 1) + 2
       spielerschaden(schaden,1,#ROD_LIGHTNING)
     EndIf
   EndIf
      
   ; Versteinern ?
   If has_trait2(mon_no,#ME_VERSTEINERN) = 1 And angegriffen = 0
     angegriffen = 1
     If habich(#SPELL_VERSTEINERNSCHUTZ) > 0 Or get_chance(100) < magic_resistance()
       message(187,#COLOR_GRAU)
     Else
       killhim.w = luck() * 10
       If killhim > 90
         killhim = 90
       EndIf
       If get_chance(100) < killhim
         message(429,#COLOR_ROT)
       Else
         Sound(#SOUND_EARTH)
         spell_x = 0
         spell_y = 0
         versteinern()
         message(318,#COLOR_ROT)
         spieler(akt_spieler)\cause_of_death = #ROD_PETRIFIED
         tot()
       EndIf
     EndIf
   EndIf
      
   ; Todesblick ?
   If has_trait2(mon_no,#ME_TODESBLICK) = 1 And angegriffen = 0
     angegriffen = 1
     Sound(#SOUND_DARKNESS)
     sternchen(156,156,2)
     killhim = luck() * 5
     If killhim > 90
       killhim = 90
     EndIf
     If get_chance(100) < killhim
       message(430,#COLOR_ROT)
     Else
       Sound(#SOUND_EARTH)
       spell_x = 0
       spell_y = 0
       todesblick()
       message(319,#COLOR_ROT)
       spieler(akt_spieler)\cause_of_death = #ROD_VIEW_OF_DEATH
       tot()
     EndIf
   EndIf
      
   ; Attacks with spell?
   If angegriffen = 0
     If get_chance(100) < magic_resistance()
       message(187,#COLOR_BLAU)
     Else
       If get_chance(100) < 20
         gew_zauber = myRand2(8)+1
       Else
         gew_zauber = monster(mon_no)\zauber
       EndIf
            
       Select (gew_zauber)
         ; Fireball ?
         Case #MZ_FEUERBALL:
           Sound(#SOUND_FLAME)
           message(27,#COLOR_BLAU)
           animate_projectile(1,-1)
             schaden.w = myRand2(monster(mon_no)\zauberkraft + 1) + 2
             ; Schwaeche Magie ?
             If skills(#CE_MAGIESCHWAECHE,akt_spieler)\gewaehlt = 1
               schaden = schaden * 2
             EndIf
             spielerschaden(schaden,1,#ROD_FIREBALL)
            
         ; Curse ?
         Case #MZ_FLUCH: 
           sternchen(156,156,5)
           message(29,#COLOR_BLAU)
           If spieler(akt_spieler)\fluch = 0
             spieler(akt_spieler)\fluch = MyRand(#ANZ_FLUECHE-1) + 1
             If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
               Sound(#SOUND_CHICKEN)
             Else
               Sound(#SOUND_DARKNESS)
             EndIf
             spieler(akt_spieler)\fluchdauer = myRand2(monster(mon_no)\zauberkraft * 2) + 5
             ; Verflucht ?
             If skills(#CE_VERFLUCHT,akt_spieler)\gewaehlt = 1
               spieler(akt_spieler)\fluchdauer = spieler(akt_spieler)\fluchdauer * 2
             EndIf
           Else
             spieler(akt_spieler)\fluchdauer = spieler(akt_spieler)\fluchdauer + myRand2(monster(mon_no)\zauberkraft * 2) + 5
             ; Verflucht ?
             If skills(#CE_VERFLUCHT,akt_spieler)\gewaehlt = 1
               spieler(akt_spieler)\fluchdauer = spieler(akt_spieler)\fluchdauer  + myRand2(monster(mon_no)\zauberkraft * 2) + 5
             EndIf
           EndIf
            
         ; Theft ?
         Case #MZ_DIEBSTAHL:
           Sound(#SOUND_DARKNESS)
           sternchen(156,156,6)
               
           If skills(#CE_AWARENESS,akt_spieler)\gewaehlt = 1 And get_chance(50)
             message(880,#COLOR_BLAU)
           Else
             ; Gibts auch was zu klauen?
             geg.b = 0
             For i = 1 To #MAX_RUCKSACK
               If inventory(i,akt_spieler)\name <> 0 And inventory(i,akt_spieler)\benutzt = 0
                 geg = 1
                 Break
               EndIf
             Next
             ; Wenn ja klauen!
             If geg = 1
               geklaut.w = 0
               counter.w = 1
               Repeat
                 what.w = Random(#MAX_RUCKSACK-1) + 1
                 If inventory(what,akt_spieler)\name <> 0 And inventory(what,akt_spieler)\benutzt = 0 and item(inventory(what,akt_spieler)\name)\type <> #ITEMTYPE_STAFFPIECE
                   geklaut = 1
                   nachricht7(message_text(30,1+language) + " (" + item(inventory(what,akt_spieler)\name)\name[1+language] + ")",#COLOR_BLAU)
                   If item(inventory(what,akt_spieler)\name)\name[language+1] = ""
                     nachricht7(message_text(769,1+language)+Str(inventory(what,akt_spieler)\name),#COLOR_WEISS)
                   EndIf
                   leeren(what)
                 EndIf
                 counter = counter + 1
               Until geklaut = 1 Or counter > 500
             Else
               message(37,#COLOR_BLAU)
             EndIf
           EndIf ;awareness
            
         ; Steal Mana
         Case #MZ_MANARAUB:
           Sound(#SOUND_DARKNESS)
           sternchen(156,156,1)
           message(31,#COLOR_BLAU)
           schaden.w = myRand2(monster(mon_no)\zauberkraft + 1) + 2
           ; Schwaeche Magie ?
           If skills(#CE_MAGIESCHWAECHE,akt_spieler)\gewaehlt = 1
             schaden = schaden * 2
           EndIf
           spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana - schaden
           If spieler(akt_spieler)\Mana < 0
             spieler(akt_spieler)\Mana = 0
           EndIf
            
         ; Dunkler Sog
         Case #MZ_DUNKLER_SOG:
           Sound(#SOUND_DARKNESS)
           For j = 1 To 5
             For i = 1 To 4
               laby_screen2()
               If i = 1
                 ClipSprite(#SPRITE_TILESET_ANIMATIONEN, 80, 40, 39, 39)
               EndIf
               If i = 2
                 ClipSprite(#SPRITE_TILESET_ANIMATIONEN, 120, 40, 39, 39)
               EndIf
               If i = 3
                 ClipSprite(#SPRITE_TILESET_ANIMATIONEN, 1, 80, 39, 39)
               EndIf
               If i = 4
                 ClipSprite(#SPRITE_TILESET_ANIMATIONEN, 40, 80, 39, 39)
               EndIf
               DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
               FlipBuffers()
               Delay(delay_animation2)
             Next
           Next
           message(32,#COLOR_BLAU)
           schaden.w = myRand2(monster(mon_no)\zauberkraft + 1) + 2
           ; Schwaeche Magie ?
           If skills(#CE_MAGIESCHWAECHE,akt_spieler)\gewaehlt = 1
             schaden = schaden * 2
           EndIf
           spielerschaden(schaden,1,#ROD_DRAIN_LIFE)
           monster_list()\hp = monster_list()\hp + schaden
           
         ; Frostball ?
         Case #MZ_FROSTBALL:
           Sound(#SOUND_FLAME)
           message(27,#COLOR_BLAU)
           animate_projectile(4,-1)
           schaden.w = myRand2(monster(mon_no)\zauberkraft + 1) + 2
           ; Schwaeche Magie ?
           If skills(#CE_MAGIESCHWAECHE,akt_spieler)\gewaehlt = 1
             schaden = schaden * 2
           EndIf
           spielerschaden(schaden,1,#ROD_FROSTBALL)
           
         ; Teleport ?
         Case #MZ_TELEPORT:
           Sound(#SOUND_DARKNESS)
           message(521,#COLOR_BLAU)
           For i = 1 To 8
             laby_screen2()
             ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
             DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
             FlipBuffers()
             Delay(delay_animation2)
           Next
           For i = 1 To 8
             laby_screen2()
             ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
             DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
             FlipBuffers()
             Delay(delay_animation2)
           Next
           spieler(akt_spieler)\character_x = eingangx(spieler(akt_spieler)\level)
           spieler(akt_spieler)\character_y = eingangy(spieler(akt_spieler)\level)
           laby_screen()
           For i = 1 To 8
             laby_screen2()
             ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
             DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
             FlipBuffers()
             Delay(delay_animation2)
           Next
           For i = 1 To 8
             laby_screen2()
             ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
             DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
             FlipBuffers()
             Delay(delay_animation2)
           Next
            
         ; Dispel
         Case #MZ_DISPEL:
           Sound(#SOUND_DARKNESS)
           sternchen(156,156,3)
           message(594,#COLOR_BLAU)
           For i = 1 To #ACTIVE_SLOTS
             If aktive(i,akt_spieler)\dauer > 0 And aktive(i,akt_spieler)\dauer <> #UNENDLICH
               aktive(i,akt_spieler)\nr = 0
               aktive(i,akt_spieler)\staerke = 0
               aktive(i,akt_spieler)\dauer = 0
             EndIf
           Next
           laby_screen()
           
         ; Firelance
         Case #MZ_FIRELANCE:
           Sound(#SOUND_FLAME2)
           message(756,#COLOR_BLAU)
           If spell_x > 0
               x_diff.w = -1
               y_diff.w = 0
           ElseIf spell_x < 0
               x_diff.w = 1
               y_diff.w = 0
           ElseIf spell_y > 0
               x_diff.w = 0
               y_diff.w = -1
           Else
               x_diff.w = 0
               y_diff.w = 1
           EndIf
           
           weite.w = abs(spell_x) + abs(spell_y) + #HALF_MATRIX_SIZE
           
           ;draw flames
           For i = 1 To weite
               draw_tile(#FELD_FEUER3,#HALF_MATRIX_SIZE+spell_x+i*x_diff,#HALF_MATRIX_SIZE+spell_y+i*y_diff, 1, 1, -1)
           Next
           FlipBuffers()
           Delay(delay_animation)
           laby_screen()
           For i = 1 To weite
           
               ;attack monsters
               save_spell_x.w = spell_x
               save_spell_y.w = spell_y
               schaden = myRand2(monster(mon_no)\zauberkraft + 1) + 2
               spell_x = spell_x+i*x_diff
               spell_y = spell_y+i*y_diff
               feuerschaden(schaden)
               spell_x = save_spell_x
               spell_y = save_spell_y
               
               save_akt_spieler.w = akt_spieler
               for akt_spieler = 1 to nr_of_players
           
                  ; attack characters
                  If (spieler(akt_spieler)\status = 1 and spieler(akt_spieler)\character_x = spieler(save_akt_spieler)\character_x+spell_x+i*x_diff and spieler(akt_spieler)\character_y = spieler(save_akt_spieler)\character_y + spell_y+i*y_diff and spieler(akt_spieler)\level = spieler(save_akt_spieler)\level)
                     schaden.w = myRand2(monster(mon_no)\zauberkraft + 1) + 2
                     ; Schwaeche Magie ?
                     If skills(#CE_MAGIESCHWAECHE,akt_spieler)\gewaehlt = 1
                        schaden = schaden * 2
                     EndIf
                     xmode.w = spieler(akt_spieler)\character_x - spieler(save_akt_spieler)\character_x
                     ymode.w = spieler(akt_spieler)\character_y - spieler(save_akt_spieler)\character_y
                     spielerschaden(schaden,1,#ROD_FIRELANCE,xmode, ymode)
                  EndIf
                  
               next
               akt_spieler = save_akt_spieler
           Next
           cleanup_monsters()
         
         EndSelect
            
      EndIf
   EndIf

EndProcedure

; -------------------------------------------------------------------------------
; ranged combat on players
Procedure fernkampf()

Shared spell_x, spell_y

     ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
     While monster_list()\z = spieler(akt_spieler)\level
       If monster_list()\x = spieler(akt_spieler)\character_x Or monster_list()\y = spieler(akt_spieler)\character_y
         mon.w = monster_list()\number
         mx.w = monster_list()\x
         my.w = monster_list()\y
         mz.w = monster_list()\z
         spell_x = monster_list()\x - spieler(akt_spieler)\character_x
         spell_y = monster_list()\y - spieler(akt_spieler)\character_y
         range.w = Abs(spell_x) + Abs(spell_y)
         ;print (monster(mon)\name[1]+" -> dist:" + Str(range)+" rng:" + Str(monster(mon)\reichweite))
         If monster_list()\status <> #MONSTERSTATUS_SCHLAEFT And monster_list()\status <> #MONSTERSTATUS_FREUND And monster_list()\status <> #MONSTERSTATUS_BLIND And monster(mon)\reichweite And monster(mon)\reichweite >= range And range > 1 ;And hat_fernkampf(mon)
           If los(1) = 0
             act_monster.monster_pointer\p = @monster_list()
             ; Monster huepfen lassen
             x.w = spell_x + 7
             y.w = spell_y + 7
             ;xx.w = spieler(akt_spieler)\character_x + spell_x
             ;yy.w = spieler(akt_spieler)\character_y + spell_y
             tile.w = labyrinth(spieler(akt_spieler)\Level, monster_list()\x, monster_list()\y)\feld
             If fields(tile)\attri_floor
                bg.w = labyrinth(spieler(akt_spieler)\Level, monster_list()\x, monster_list()\y)\stat2
             Else
                bg.w = 0
             EndIf
             draw_tile(tile,x ,y , 0, 0, bg)
             item.w = laby_item(mx, my)\name[mz]
             If item
                draw_item(item,x, y, 0, 0)
             EndIf
             draw_monster(x, y, 0, -3)
             restaurieren()
             ;restore pointer
             ChangeCurrentElement(monster_list(),act_monster\p)
             fernattack()
             ;restore pointer
             ChangeCurrentElement(monster_list(),act_monster\p)
                  
             draw_tile(tile,x ,y , 0, 0, bg)
             If item
                draw_item(item,x, y, 0, 0)
             EndIf
             draw_monster(x, y, 0, 0)
             restaurieren()
             ;restore pointer
             ChangeCurrentElement(monster_list(),act_monster\p) 
           EndIf ;los
         EndIf
       EndIf
       NextElement(monster_list())
     Wend

EndProcedure

; -------------------------------------------------------------------------------
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 1193
; FirstLine = 1149
; Folding = --
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
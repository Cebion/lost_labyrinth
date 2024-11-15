; Alle Routinen fuer die Zauber

Procedure botch(spell.w)

   Sound(#SOUND_BOTCH)
   Message(979,#COLOR_BLAU)
   For j = 1 To 3
      For i = 1 To 8
         laby_screen2()
         ClipSprite(#SPRITE_TILESET_FX, i*31-31, 7*31+4, 31, 31)
         DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
         FlipBuffers()
         Delay(delay_animation2)
      Next
   Next
   zw.w = MyRand2(spells(spell)\level) + (max(2,spieler(akt_spieler)\Power_score/2))
   spielerschaden(zw,1,#ROD_BOTCH)

EndProcedure


Procedure erfolgreich(spell.w)

Shared item_spell

   okay.w = 0

   If learned(akt_spieler,spell) & 127 < 100 ;casting with items improves spell ability (can be changed by moving this behind item_spell check)
      learned(akt_spieler,spell) + 5
   EndIf

   If item_spell ;no special success nor botching item spells
      ProcedureReturn 1
   EndIf

   If zauberchance(spell) > 99
     okay = 1
   Else
      If get_chance(101) < zauberchance(spell)
        ;only use get_chance if needed, to prevent skipping low values deliberately
        okay = 1
      EndIf
   EndIf

   If okay ;casting successful
     If myRand(1499) < max(1,16-Luck()) ;small chance of botching a spell remains still
        botch(spell)                  ; 1% with luck 1 down to 1/15 % with luck 15
        ProcedureReturn 0
     EndIf
     ;Special success?
     If spells(spell)\weavable = 1 ;only applies to spells with power scaling ability
        If MyRand2(199) <= min(20,5 + Luck()) ;special success
           message(737,#COLOR_BLAU)
           animate_special_success()
           ProcedureReturn 2
        EndIf
     EndIf
   Else
     If myRand(149) < max(1,16-Luck()) ;chance to botch a spell is 10 times higher if it failed anyway
        botch(spell)                 ; 10 % with luck = 1 down to 10/15 = .666 % with luck 15 
     Else ;normal spell failure
        Sound(#SOUND_HUH)
        message(48,#COLOR_BLAU)
     EndIf
   EndIf
   
   ProcedureReturn okay
   
EndProcedure


Procedure terminate_meta_magic()

   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler)\dauer = #META_MAGIC
         aktive(i,akt_spieler)\nr = 0
         aktive(i,akt_spieler)\staerke = 0
         aktive(i,akt_spieler)\dauer = 0
      EndIf
   Next

EndProcedure


Procedure get_creature(typ.w)

Shared spell_x, spell_y

   spieler(akt_spieler+1)\creature_typ = creature(typ)\number
   spieler(akt_spieler+1)\LifePoints = creature(typ)\LifePoints
   spieler(akt_spieler+1)\MaxLifePoints = creature(typ)\LifePoints
   spieler(akt_spieler+1)\Attack = creature(typ)\Attack
   spieler(akt_spieler+1)\Strength = creature(typ)\Strength
   spieler(akt_spieler+1)\Dexterity = creature(typ)\Dexterity
   spieler(akt_spieler+1)\Perception = creature(typ)\Perception
   spieler(akt_spieler+1)\Luck_score = creature(typ)\Luck
   spieler(akt_spieler+1)\Power_score = creature(typ)\Power
   spieler(akt_spieler+1)\Circle = creature(typ)\Circle
   spieler(akt_spieler+1)\Mana = creature(typ)\Mana
   spieler(akt_spieler+1)\MaxMana = creature(typ)\Mana
   spieler(akt_spieler+1)\creature_schaden_min = creature(typ)\schaden_min
   spieler(akt_spieler+1)\creature_schaden_max = creature(typ)\schaden_max
   spieler(akt_spieler+1)\Speed = creature(typ)\Speed
   spieler(akt_spieler+1)\MaxSpeed = creature(typ)\Speed
   spieler(akt_spieler+1)\character_x = spieler(akt_spieler)\character_x + spell_x
   spieler(akt_spieler+1)\character_y = spieler(akt_spieler)\character_y + spell_y
   spieler(akt_spieler+1)\level = spieler(akt_spieler)\level
   spieler(akt_spieler+1)\maxlevel = spieler(akt_spieler)\maxlevel
   spieler(akt_spieler+1)\face = 2
   spieler(akt_spieler+1)\status = 1
   spieler(akt_spieler+1)\fluch = 0
   spieler(akt_spieler+1)\fluchdauer = 0
   spieler(akt_spieler+1)\krankheit = 0
   spieler(akt_spieler+1)\krankheitdauer = 0
   spieler(akt_spieler+1)\poison = 0
   spieler(akt_spieler+1)\verhungern = 0
   spieler(akt_spieler+1)\verdursten = 0
   spieler(akt_spieler+1)\betrunken = 0
   spieler(akt_spieler+1)\lifepointgegenstand = 0
   spieler(akt_spieler+1)\managegenstand = 0
   spieler(akt_spieler+1)\staerkegegenstand = 0
   spieler(akt_spieler+1)\zugweitegegenstand = 0
   spieler(akt_spieler+1)\dexteritygegenstand = 0
   spieler(akt_spieler+1)\gluecksgegenstand = 0
   spieler(akt_spieler+1)\bogentreffergegenstand = 0
   spieler(akt_spieler+1)\bogenschadengegenstand = 0
   spieler(akt_spieler+1)\powergegenstand = 0
   spieler(akt_spieler+1)\perceptiongegenstand = 0
   spieler(akt_spieler+1)\attackgegenstand = 0
   spieler(akt_spieler+1)\stealthgegenstand = 0
   spieler(akt_spieler+1)\damagegegenstand = 0
   spieler(akt_spieler+1)\lichtgegenstand = 0
   spieler(akt_spieler+1)\diebstahlgegenstand = 0
   spieler(akt_spieler+1)\goblinlehre = 0
   spieler(akt_spieler+1)\spinnenlehre = 0
   spieler(akt_spieler+1)\untotenlehre = 0
   spieler(akt_spieler+1)\pflanzenlehre = 0
   spieler(akt_spieler+1)\tierkunde = 0
   spieler(akt_spieler+1)\fallenlehre = 0
   spieler(akt_spieler+1)\giftlehre = 0
   spieler(akt_spieler+1)\gold = 0
   spieler(akt_spieler+1)\schleichen = 0
   spieler(akt_spieler+1)\magic_resistance = creature(typ)\magic_resistance
   spieler(akt_spieler+1)\poison_resistance = creature(typ)\poison_resistance
   spieler(akt_spieler+1)\fire_resistance = creature(typ)\fire_resistance
   spieler(akt_spieler+1)\cold_resistance = creature(typ)\cold_resistance
   spieler(akt_spieler+1)\lightning_resistance = creature(typ)\lightning_resistance
   spieler(akt_spieler+1)\betrunken = 0
   If typ = #CREATURE_DOPPELGANGER
      spieler(akt_spieler+1)\Maennchen = spieler(akt_spieler)\Maennchen
      spieler(akt_spieler+1)\MaxLifepoints = spieler(akt_spieler)\MaxLifepoints
      spieler(akt_spieler+1)\Lifepoints = spieler(akt_spieler)\MaxLifepoints
      spieler(akt_spieler+1)\Dexterity = spieler(akt_spieler)\Dexterity
      spieler(akt_spieler+1)\Strength = spieler(akt_spieler)\Strength
      spieler(akt_spieler+1)\MaxSpeed = spieler(akt_spieler)\MaxSpeed
      spieler(akt_spieler+1)\Speed = spieler(akt_spieler)\MaxSpeed
      spieler(akt_spieler+1)\Perception = spieler(akt_spieler)\Perception
      spieler(akt_spieler+1)\Luck_score = spieler(akt_spieler)\Luck_score
   Else
      spieler(akt_spieler+1)\Maennchen = creature(typ)\graphic
   EndIf
   spieler(akt_spieler+1)\Name = creature(typ)\name[1+language] + " ("+spieler(akt_spieler)\Name+")"
   spieler(akt_spieler+1)\light = creature(typ)\light

   sav_act_player.w = akt_spieler
   akt_spieler + 1

   For i = 1 To #MAX_RUCKSACK ;for now only unapply items until we can properly drop them for dead creatures
      ;inventory(i,akt_spieler)\name = 0
      ;inventory(i,akt_spieler)\status = 0
      inventory(i,akt_spieler)\benutzt = 0
      ;inventory(i,akt_spieler)\anzahl = 0
      ;inventory(i,akt_spieler)\attri5 = 0
   Next

   For i = 1 To #ACTIVE_SLOTS
       aktive(i,akt_spieler)\nr = 0
       aktive(i,akt_spieler)\staerke = 0
       aktive(i,akt_spieler)\dauer = 0
   Next
   For i = 0 To 2
      If creature(typ)\duration_effects[i] > 0
         eintragen(creature(typ)\duration_effects[i],1,#UNENDLICH,999)
      EndIf
   Next

   reset_skills()
   For i = 0 To 19
      If creature(typ)\skills[i] > 0
         waehlen(creature(typ)\skills[i],1)
      EndIf
   Next
   If skills(#CE_BESCHWOERER,akt_spieler-1)\gewaehlt = 1 And creature(typ)\number <> #CREATURE_COMPANION
      For i = 1 To #Anz_Skills ;all REAL summoned creatures inherit skills if caster IS real summoner
         If skills(i,akt_spieler-1)\gewaehlt = 1 And skills(i,akt_spieler)\pet_transferable = 1
            skills(i,akt_spieler)\gewaehlt = 1
         EndIf
      Next
   EndIf
   advancements()

   For i = 1 To #ANZ_ZAUBER
      If skills(#CE_ZAUBERSCHRIFT,akt_spieler)\gewaehlt = 1 Or skills(#CE_SCROLLORE,akt_spieler)\gewaehlt = 1
         scroll_known.w = #l_scrollname
      Else
         scroll_known.w = 0
      EndIf
      If spells(i)\school = #school_bard
         learned(akt_spieler,i)  = 100 | scroll_known
      Else
         learned(akt_spieler,i)  = 50 | scroll_known
      EndIf
   Next
   For i = 0 To 2
      If creature(typ)\spells[i] > 0
         learned(akt_spieler,creature(typ)\spells[i]) = 100 | (learned(akt_spieler,creature(typ)\spells[i]) & #l_scrollname) | #l_free
      EndIf
   Next

   akt_spieler = sav_act_player

EndProcedure


Procedure get_weaving(player.w = -1)

Shared item_spell

   If item_spell
     ProcedureReturn 1
   EndIf

   If player = -1
     player = akt_spieler
   EndIf

   ProcedureReturn spieler(player)\spellweaving

EndProcedure


Procedure zauberkosten(spell.w)

   kosten.w = spells(spell)\cost

   If skills(#CE_ALTE_MAGIE,akt_spieler)\gewaehlt = 1 And kosten > 1
     kosten - 1
   EndIf
   If habich(#SPELL_SYPHON) > 0 And kosten > 0
     kosten = kosten / 2
     If kosten < 1
       kosten = 1
     EndIf
   EndIf
   If spells(spell)\weavable
      kosten = kosten + (get_weaving() - 1)
   EndIf
   
   ProcedureReturn kosten

EndProcedure


Procedure immune(gegen.w)

Shared spell_x, spell_y
   mon_no.w = monster_list()\number
   If has_trait2(mon_no,gegen) = 0 Or habich(#SPELL_PENETRATION) > 0
      res.w = 0
   Else
      res = 1
   EndIf
   
   ProcedureReturn res

EndProcedure


Procedure dispelled()

Shared spell_x, spell_y

   disp.w = 0
   mon_no.w = monster_list()\number
   If has_trait2(mon_no,#ME_DISPEL) = 1 And habich(#SPELL_PENETRATION) = 0
     disp = get_chance(50)
   EndIf

   ProcedureReturn disp

EndProcedure


Procedure zug_verlieren()

Shared aktion

   If habich(#SPELL_SCHNELLZAUBER) = 0
     aktion = 1
   Else
     terminate_meta_magic()
   EndIf

EndProcedure


Procedure mana_verlieren(spell.w)

Shared item_spell

   If item_spell = 0
      kosten.w = zauberkosten(spell)
      spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana - kosten
   EndIf

EndProcedure


Procedure hydra_zauber(schaden.w)

Shared spell_x, spell_y

   ishydra.w = 0
   If isthydra(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
      ishydra = 1
      act_nr_in_level.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+spell_x, spieler(akt_spieler)\character_y+spell_y)\stat1
      If spell_x > -6 And spell_x < 6 And spell_y > -6 And spell_y < 6 ;on screen
          ; Schaden darstellen
         Sound(Random(12))
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 7*32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+spell_x*32, 160+spell_y*32)
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            xx = 175 + spell_x*32
            yy = 168 + spell_y*32
            DrawText(xx-TextWidth((Str(schaden)))/2,yy,Str(schaden),$ffffff)
         StopDrawing()
         Delay(delay_animation)
      EndIf
      If schaden > min(max(spieler(akt_spieler)\level/2+1,6),15)
        hydra_cut_head(act_nr_in_level)
      Else
        hydra_grow_head(act_nr_in_level)
      EndIf
   EndIf
   ProcedureReturn ishydra
EndProcedure

; -----------------------------------------------------------------------------

Procedure schnelltasten()

Shared  akt_zauber, akt_zauber_offset, joystick_used

   If spieler(akt_spieler)\charge > 0
      ProcedureReturn 0
   EndIf
   ; Zauber Schnelltasten
   
   For j = 1 To 10
      If used_keys(j+23)\pressed And used_keys(j+23)\wait_release = 0
         used_keys(j+23)\wait_release = 1
         zauberliste(akt_zauber+akt_zauber_offset) = quickspells(j,akt_spieler)
         cast_it()
         laby_screen()
         ProcedureReturn 1
      EndIf
   Next
   
   ; Joystick Buttons
   If joystick_used = 1
      For xx.b = 1 To 8
         If jb(xx+4) And quickspells2(xx,akt_spieler) > 0
            something_changed = 1
            zauberliste(akt_zauber+akt_zauber_offset) = quickspells2(xx,akt_spieler)
            cast_it()
            laby_screen()
            ProcedureReturn 1
         EndIf
      Next
   EndIf

EndProcedure

; -----------------------------------------------------------------------------

Procedure eisschaden(schaden.w, magic.w = 1)

Shared spell_x, spell_y

   If spieler(akt_spieler)\character_x + spell_x > 0 And spieler(akt_spieler)\character_y + spell_y > 0
     ; Monster?
      mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
      If mon_no
         If magic And dispelled()
            message(312,#COLOR_BLAU)
         Else
            ; Eisfest ?
            If has_trait2(mon_no,#ME_EISFEST) = 0 Or ( magic And habich(#SPELL_PENETRATION) > 0 )
               monsterschaden(schaden, magic)
            Else
               message(267,#COLOR_ROT)
            EndIf
         EndIf
      EndIf
      ; Feuer?
      testfeld.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
      If testfeld = #FELD_FEUER1 Or testfeld = #FELD_FEUER2
         If schaden > 3
            Sound(#SOUND_SPLASH)
            cleartile(spieler(akt_spieler)\character_x+spell_x,spieler(akt_spieler)\character_y+spell_y)
            Delay(delay_animation)
            laby_screen()
         EndIf
      EndIf
   EndIf
   
EndProcedure

; -----------------------------------------------------------------------------

Procedure feuerschaden(schaden.w, magic.w = 1)

Shared spell_x, spell_y

   If spieler(akt_spieler)\character_x + spell_x > 0 And spieler(akt_spieler)\character_y + spell_y > 0
     testfeld.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
      mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
      If mon_no
         If magic And dispelled()
            message(312,#COLOR_BLAU)
         Else
            If has_trait2(mon_no,#ME_BRENNT) = 1
               schaden = schaden * 2
            EndIf
            ; Feuerfest ?
            If has_trait2(mon_no,#ME_FEUERFEST) = 0 Or ( magic And habich(#SPELL_PENETRATION) > 0 )
               monsterschaden(schaden,magic)
            Else
               message(265,#COLOR_ROT)
            EndIf
         EndIf
      EndIf
      If testfeld = #FELD_EIS     ; Eisblock
         If schaden > 3
          Destroy_Iceblock(spieler(akt_spieler)\character_x+spell_x,spieler(akt_spieler)\character_y+spell_y,spieler(akt_spieler)\level)
          laby_screen()
         EndIf
      EndIf
   EndIf
EndProcedure

; -----------------------------------------------------------------------------

Procedure eintragen(nr.w, staerke.w, dauer.w, source.w)

   ; Alle gleichen Spells rauswerfen
   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler)\nr = nr And aktive(i,akt_spieler)\source = source
         aktive(i,akt_spieler)\nr = 0
         aktive(i,akt_spieler)\staerke = 0
         aktive(i,akt_spieler)\dauer = 0
      EndIf
   Next
   
   ; Alle anderen Shapechangers rauswerfen
   If nr >= #SPELL_FLEDERMAUSGESTALT And nr <= #SPELL_DRACHENGESTALT
      For i = 1 To #ACTIVE_SLOTS
         If aktive(i,akt_spieler)\nr = #SPELL_FLEDERMAUSGESTALT Or aktive(i,akt_spieler)\nr = #SPELL_WOLFSGESTALT Or aktive(i,akt_spieler)\nr = #SPELL_VOGELGESTALT Or aktive(i,akt_spieler)\nr = #SPELL_KATZENGESTALT Or aktive(i,akt_spieler)\nr = #SPELL_DRACHENGESTALT
            aktive(i,akt_spieler)\nr = 0
            aktive(i,akt_spieler)\staerke = 0
            aktive(i,akt_spieler)\dauer = 0
         EndIf
      Next
   EndIf
   
   ; Alle anderen Kreatur Verzauberungen rauswerfen
   If nr >= #SPELL_VERZAUBERE_KREATUR_1 And nr <= #SPELL_VERZAUBERE_KREATUR_4
      For i = 1 To #ACTIVE_SLOTS
         If aktive(i,akt_spieler)\nr = #SPELL_VERZAUBERE_KREATUR_1 Or aktive(i,akt_spieler)\nr = #SPELL_VERZAUBERE_KREATUR_2 Or aktive(i,akt_spieler)\nr = #SPELL_VERZAUBERE_KREATUR_3 Or aktive(i,akt_spieler)\nr = #SPELL_VERZAUBERE_KREATUR_4
            aktive(i,akt_spieler)\nr = 0
            aktive(i,akt_spieler)\staerke = 0
            aktive(i,akt_spieler)\dauer = 0
         EndIf
      Next
   EndIf

   i = 1
   pos = 0
   Repeat
      If aktive(i,akt_spieler)\nr = 0
         pos = i
      EndIf
      i = i + 1
   Until i > #ACTIVE_SLOTS Or pos > 0

   If i <= #ACTIVE_SLOTS
      aktive(pos,akt_spieler)\nr = nr
      aktive(pos,akt_spieler)\staerke = staerke
      
      If dauer = #META_MAGIC
         aktive(pos,akt_spieler)\dauer = #META_MAGIC
      Else
         If dauer <> #UNENDLICH
            If habich(#SPELL_VERLAENGERN2) > 0
               dauer = dauer * 2
            EndIf
         
            If skills(#CE_BESTAENDIGKEIT,akt_spieler)\gewaehlt = 1
               dauer = dauer * 2
            EndIf
            
            If skills(#CE_KURZE_MAGIE,akt_spieler)\gewaehlt = 1
               dauer = dauer / 2
            EndIf
            
            If spieler(akt_spieler)\fluch = #FLUCH_DER_TANIS
               dauer = dauer / 2
            EndIf
         EndIf
         
         aktive(pos,akt_spieler)\dauer = dauer
         aktive(pos,akt_spieler)\source = source
      EndIf
   EndIf

EndProcedure

; -----------------------------------------------------------------------------

Procedure stop_songs()

   For i.w = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler)\source = #UNENDLICH
         aktive(i,akt_spieler)\nr = 0
         aktive(i,akt_spieler)\staerke = 0
         aktive(i,akt_spieler)\dauer = 0
      EndIf
   Next
   
EndProcedure

; -----------------------------------------------------------------------

Procedure habich(nr.w)

Shared aktive

   habich = 0
   gef = 0
   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler)\nr = nr
         habich = aktive(i,akt_spieler)\staerke
         gef = 1
      EndIf
   Next
   If habich = 0 And gef = 1   ; Zauber ohne staerke als 1 melden!
      habich = 1
   EndIf

   ProcedureReturn habich

EndProcedure

; -----------------------------------------------------------------------------

Procedure hater(nr.w,xx)

Shared aktive

   hater = 0
   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,xx)\nr = nr
         hater = 1
      EndIf
   Next

   ProcedureReturn hater

EndProcedure

; -----------------------------------------------------------------------------

Procedure get_enchant_creature()

Shared aktive

   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler-1)\nr = #SPELL_VERZAUBERE_KREATUR_1
         ProcedureReturn 1
      ElseIf aktive(i,akt_spieler-1)\nr = #SPELL_VERZAUBERE_KREATUR_2
         ProcedureReturn 2
      ElseIf aktive(i,akt_spieler-1)\nr = #SPELL_VERZAUBERE_KREATUR_3
         ProcedureReturn 3
      ElseIf aktive(i,akt_spieler-1)\nr = #SPELL_VERZAUBERE_KREATUR_4
         ProcedureReturn 4
      EndIf
   Next

   ProcedureReturn 0

EndProcedure

; -----------------------------------------------------------------------------

Procedure sog()

Shared spell_x, spell_y

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
         DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+spell_x*32, 156+spell_y*32)
         FlipBuffers()
         Delay(delay_animation2)
      Next
   Next

EndProcedure

; --------------------------------------------------------------

Procedure Spraygrafik(radius,dauer)

  z=5*32+15
  For i=1 To dauer
    laby_screen2()
    For j=0 To 350 Step 10
      r=Random(1) : g=Random(1) : b=Random(1)
      wohin = ScreenOutput()
      StartDrawing(wohin)
      DrawingMode(1)
      FrontColor (RGB(r*255,g*255,b*255))
      Line (z,z,Sin(j)*radius,Cos(j)*radius)
      StopDrawing()
    Next
    FlipBuffers()
    Delay (delay_animation2)
  Next

EndProcedure

; -------------------------------------------------------------------------

Procedure Sternchen(x.w,y.w,stern.w)

Shared frame

  For i=1 To 20
    xsprites(i)=0:ysprites(i)=0:fsprites(i)=-i-1:rsprites(i)=1
  Next
  For j=1 To 30
    laby_screen2()
    For i=1 To 20
      fsprites(i)=fsprites(i)+rsprites(i)
      If fsprites(i)>=4
         rsprites(i)=-1
      EndIf
      If fsprites(i)=-1
         xsprites(i)=Random(32):ysprites(i)=Random(32):rsprites(i)=1
      EndIf
      If fsprites(i)>=0
        ClipSprite(#SPRITE_TILESET_STARS, fsprites(i)+stern*5, stern*9-9, 9, 9)
        DisplayTransparentSprite(#SPRITE_TILESET_STARS,x+xsprites(i)-5,y+ysprites(i)-5)
      EndIf
    Next
    FlipBuffers()
    Delay(delay_animation2/2)
  Next

EndProcedure

; -------------------------------------------------------------------------

Procedure faechergrafik()

  a=1
  s=5
  While 32*6>a*s
    laby_screen2()
    For i=1 To a
      wohin = ScreenOutput()
      StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(255,255,255))
      LineXY (32*6-15-i*s,32*6-15-i*s,32*6-15+i*s,32*6-15-i*s)
      LineXY (32*6-15+i*s,32*6-15-i*s,32*6-15+i*s,32*6-15+i*s)
      LineXY (32*6-15+i*s,32*6-15+i*s,32*6-15-i*s,32*6-15+i*s)
      LineXY (32*6-15-i*s,32*6-15+i*s,32*6-15-i*s,32*6-15-i*s)
      StopDrawing()
    Next
    FlipBuffers()
    Delay (delay_animation2/2)
    a=a+1
  Wend

EndProcedure

; -------------------------------------------------------------------------------

Procedure versteinern()

Shared spell_x, spell_y
   
    wohin = ScreenOutput()
    StartDrawing(wohin)
       DrawingMode(1)
       FrontColor(RGB(255,255,255))
       For akt_zeile = 32 To 1 Step -1
          Line(160+spell_x*32, 160+akt_zeile+spell_y*32, 32, 0)
          FlipBuffers()
          Delay(delay_animation2/2)
       Next
    StopDrawing()
    
EndProcedure

; -------------------------------------------------------------------------------

Procedure todesblick()

Shared spell_x, spell_y
   
   wohin = ScreenOutput()
   StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(0,0,0))
      For akt_zeile = 32 To 1 Step -1
         Line(160+spell_x*32, 160+akt_zeile+spell_y*32, 32, 0)
         FlipBuffers()
         Delay(delay_animation2/2)
      Next
   StopDrawing()

EndProcedure

; -------------------------------------------------------------------------------

Procedure animate_special_success()

   Sound(#SOUND_SPECIAL_SUCCESS)
   For i = 1 To 8
      laby_screen2()
      ClipSprite(#SPRITE_TILESET_FX, i*31-31, 8*31+9, 31, 31)
      DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
      FlipBuffers()
      Delay(delay_animation2/2)
   Next
   For i = 1 To 8
      laby_screen2()
      ClipSprite(#SPRITE_TILESET_FX, i*31-31, 9*31+9, 31, 31)
      DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
      FlipBuffers()
      Delay(delay_animation2/2)
   Next

EndProcedure

; -------------------------------------------------------------------------------

Procedure wr_txt(what,nr1,nr2,x,y)
    
    q1.s = ""
    q2.s = ""

    If nr1 > 0
      q1 = "(" + Str(nr1) + ")"
    EndIf
    If nr2 > 0
      q2 = "(B" + Str(nr2) + ")"
    EndIf
    what = zauberliste(what)
    
    If  what = -2 ; cancel
      DrawText(x,y,message_text(650,1+language))
    Else
      DrawText(x,y,spells(what)\name[1+language]+" "+q1+q2)
    EndIf

EndProcedure

; -------------------------------------------------------------------------------

Procedure liste_leeren()

   For i.w = 1 To #ANZ_ZAUBER
      zauberliste(i) = 0
   Next
   
EndProcedure

; -------------------------------------------------------------------------------

Procedure zauber_nehmen(i.w)

      nehmen.w = 0
      If spells(i)\level <= spieler(akt_spieler)\circle
        nehmen = aus_schule(i)
      EndIf

   ProcedureReturn nehmen

EndProcedure

; -------------------------------------------------------------------------------

Procedure bubblesort()

Shared anz_zauber, akt_zauber_offset2

   switch.w = 0
   ; Bubblesort
   For i.w = 1 To anz_zauber - 2
      For j.w = 1 To anz_zauber - 2
         n1.s = spells(zauberliste(j+akt_zauber_offset2))\name[1+language]
         n2.s = spells(zauberliste(j+akt_zauber_offset2+1))\name[1+language]
         If spieler(akt_spieler)\sorting_style = 1 ; sort by level
           switch = spells(zauberliste(j+akt_zauber_offset2))\level - spells(zauberliste(j+akt_zauber_offset2+1))\level
           If switch = 0 And n1 > n2
             switch = 1 ; sub-sort alphabetically
           EndIf
           If switch < 0 ; correct order -> no switch
             switch = 0
           EndIf
         Else  ; sort by name
           If n1 > n2
             switch = 1
           EndIf
         EndIf
         If switch
            switch = zauberliste(j+akt_zauber_offset2+1)
            zauberliste(j+akt_zauber_offset2+1) = zauberliste(j+akt_zauber_offset2)
            zauberliste(j+akt_zauber_offset2) = switch
            switch = 0
         EndIf
      Next
   Next

EndProcedure

; -------------------------------------------------------------------------------

Procedure erstelle_liste(reset_pos.w = 0)

Shared anz_zauber, akt_zauber_offset2, akt_zauber

   ; Liste der besessenen Zauber erstellen
   liste_leeren()
   
   anz_zauber = 1
   For i.w = 1 To #ANZ_ZAUBER
      nehmen.w = zauber_nehmen(i)
      
      ; Scrollore / Free Magic?
      If learned(akt_spieler,i) & #l_scroll
         nehmen = 1
      EndIf
      lmasq.w = learned(akt_spieler,i) & #l_masq
      If (spieler(akt_spieler)\schule = #school_scroll And lmasq = #l_scroll) Or (spieler(akt_spieler)\schule = #school_free And lmasq = #l_free) Or (spieler(akt_spieler)\schule = #school_summon And spells(i)\summoning > 0) Or (spieler(akt_spieler)\schule = 999 And learned(akt_spieler,i) & #l_favourite)
      Else
         If spieler(akt_spieler)\schule <> #school_all
            If spells(i)\school <> spieler(akt_spieler)\schule
               nehmen = 0
            EndIf
         EndIf
      EndIf
      
      If nehmen = 1
         zauberliste(anz_zauber+akt_zauber_offset2) = i
         anz_zauber = anz_zauber + 1
      EndIf
   Next
   
   bubblesort()

   zauberliste(anz_zauber+akt_zauber_offset2) = -2 ; cancel entry
   
   If reset_pos
      akt_zauber = max (0,anz_zauber-13)
      spieler(akt_spieler)\pos_zaubermenue = akt_zauber
   EndIf
      
EndProcedure

; -------------------------------------------------------------------------------

Procedure spellweaving(weavable.w)

   #WEAVE_X = 367
   #WEAVE_Y = 375+16
   #WEAVE_d = 42
         
   ; #PB_Key_Add
   If used_keys(40)\pressed And used_keys(40)\wait_release = 0
      used_keys(40)\wait_release = 1
      spieler(akt_spieler)\spellweaving + 1
      If spieler(akt_spieler)\spellweaving > 9
         spieler(akt_spieler)\spellweaving = 9
      EndIf
   EndIf
         
   ; #PB_Key_Subtract
   If used_keys(41)\pressed And used_keys(41)\wait_release = 0
      used_keys(41)\wait_release = 1
      spieler(akt_spieler)\spellweaving - 1
      If spieler(akt_spieler)\spellweaving < 1
         spieler(akt_spieler)\spellweaving = 1
      EndIf
   EndIf
         
   ; Numpad
   For i = 31 To 39
      If used_keys(i)\pressed And used_keys(i)\wait_release = 0
         used_keys(i)\wait_release = 1
         spieler(akt_spieler)\spellweaving = i - 30
      EndIf
   Next
   
   
   If mmouse_x > #WEAVE_X And mmouse_x < #WEAVE_X+32 And mmouse_y > #WEAVE_Y And mmouse_y < #WEAVE_Y+32
      over_upbutton = 1
      If wait_release = 0 And mmouse_links = 1
         wait_release = 1
         spieler(akt_spieler)\spellweaving = spieler(akt_spieler)\spellweaving + 1
         If spieler(akt_spieler)\spellweaving > 9
            spieler(akt_spieler)\spellweaving = 9
         EndIf
      EndIf 
   Else
      over_upbutton = 0
   EndIf
   
   If mmouse_x > #WEAVE_X And mmouse_x < #WEAVE_X+32 And mmouse_y > #WEAVE_Y+#WEAVE_d And mmouse_y < #WEAVE_Y+#WEAVE_d+32
      over_downbutton = 1
      If wait_release = 0 And mmouse_links = 1
         wait_release = 1
         spieler(akt_spieler)\spellweaving = spieler(akt_spieler)\spellweaving - 1
         If spieler(akt_spieler)\spellweaving < 1
            spieler(akt_spieler)\spellweaving = 1
         EndIf
      EndIf
   Else
      over_downbutton = 0
   EndIf

   If something_changed = 1

      ; Up Button
      If over_upbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS5, 6*32, 0, 31, 31)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS5, 4*32, 0, 31, 31)
      EndIf 
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #WEAVE_X, #WEAVE_Y)

      ; Down Button
      If over_downbutton
         ClipSprite(#SPRITE_TILESET_BUTTONS5, 7*32, 0, 31, 31)
      Else
         ClipSprite(#SPRITE_TILESET_BUTTONS5, 5*32, 0, 31, 31)
      EndIf
      DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #WEAVE_X, #WEAVE_Y+#WEAVE_d)
      
      wohin = ScreenOutput()
      StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))
         tmpstr.s = Str(spieler(akt_spieler)\spellweaving)+"("
         If weavable
            FrontColor(RGB(255,255,255))
            tmpstr = tmpstr+Str(spieler(akt_spieler)\spellweaving)+")"
         Else
            FrontColor(RGB(150,150,150))
            tmpstr = tmpstr+"-)"
         EndIf
         DrawText(#WEAVE_X+5,#WEAVE_Y+29,tmpstr)
      StopDrawing()
   EndIf ; something_changed

EndProcedure


Procedure schulenicons()

Shared icon_pos, max_icon, min_icon_pos, school_names, school_numbers, school_clip_icon_pos

   #ZS_ICON_X = 350
   #ZS_ICON_Y = 375-17
   #ZS_OFFS_X = 0
   #ZS_OFFS_Y = -17

   x.w = #ZS_ICON_X
   y.w = #ZS_ICON_Y

   clip_x.w
   clip_y.w

   For i = min_icon_pos To #max_icon
     If i = icon_pos
       schooln = school_numbers(i)
       clip_y = 17
     Else
       clip_y = 0
     EndIf
     If mmouse_x >= x And mmouse_x <= x+16 And mmouse_y >= y And mmouse_y <= y+16
       clip_y = 33
     EndIf
     clip_x = school_clip_icon_pos(i)
     ClipSprite(#SPRITE_ICONS, clip_x, clip_y, 15, 15)
     DisplayTransparentSprite(#SPRITE_ICONS, x, y)
     x + #ZS_OFFS_X
     y + #ZS_OFFS_Y
   Next

   ProcedureReturn schooln

EndProcedure


Procedure schulenicons_check()

Shared icon_pos, max_icon, min_icon_pos, school_names, school_numbers, school_clip_icon_pos

   #ZS_ICON_X = 350
   #ZS_ICON_Y = 375-17
   #ZS_OFFS_X = 0
   #ZS_OFFS_Y = -17

   x.w = #ZS_ICON_X
   y.w = #ZS_ICON_Y
   schooln.w = 0

   For i = min_icon_pos To #max_icon
     If mmouse_x >= x And mmouse_x <= x+16 And mmouse_y >= y And mmouse_y <= y+16
       If mmouse_links And mmouse_links_wait_release = 0
          mmouse_links_wait_release = 1
          spieler(akt_spieler)\schule = school_numbers(i)
          schooln = school_numbers(i)
          icon_pos = i
          erstelle_liste(1)
       EndIf
     EndIf
     x + #ZS_OFFS_X
     y + #ZS_OFFS_Y
   Next

   ProcedureReturn schooln

EndProcedure

; -------------------------------------------------------------------------------

Procedure spells_border()

Shared anz_zauber, akt_zauber, yplus, yplus2, akt_zauber_offset, anzz, mauszauber, mausbesch

   ; Ueberbleibsel des Labyrinths uebermalen
   ClipSprite(#SPRITE_CLEANER, 0, 0, 260, 449)
   DisplaySprite(#SPRITE_CLEANER, 365, 15)
   ClipSprite(#SPRITE_CLEANER, 0, 0, 335, 15)
   DisplaySprite(#SPRITE_CLEANER, 15, 365)

   ; Rahmen zeichnen
   ClipSprite(#SPRITE_RAHMEN_OBEN, 0, 0, 640, 17)
   DisplayTransparentSprite(#SPRITE_RAHMEN_OBEN, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_LINKS, 0, 0, 17, 480)
   DisplayTransparentSprite(#SPRITE_RAHMEN_LINKS, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_UNTEN, 0, 0, 640, 17)
   DisplayTransparentSprite(#SPRITE_RAHMEN_UNTEN, 0, 464)
   ClipSprite(#SPRITE_RAHMEN_RECHTS, 0, 0, 17, 480)
   DisplayTransparentSprite(#SPRITE_RAHMEN_RECHTS, 624, 0)

   ClipSprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 0, 365, 17)
   DisplaySprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 350)
   ClipSprite(#SPRITE_RAHMEN_SCHMAL1, 0, 0, 274, 16)
   DisplaySprite(#SPRITE_RAHMEN_SCHMAL1, 350, 35)
   ClipSprite(#SPRITE_RAHMEN_SCHMAL2, 0, 0, 274, 16)
   DisplaySprite(#SPRITE_RAHMEN_SCHMAL2, 350, 375)
   
   ClipSprite(#SPRITE_RAHMEN_MITTE, 0, 0, 17, 480)
   DisplaySprite(#SPRITE_RAHMEN_MITTE, 350, 0)

   ClearMessageWindow()

   wohin = ScreenOutput()
   StartDrawing(wohin)
   DrawingMode(1)

   ; In der Mitte wird ausgewaehlt
   FrontColor(RGB(150,150,150))
   Box(365, 200+yplus2, 260, yplus)

   ; Zauber darstellen
   x = 400
   y = 52
   besch = 0
   mzauber.w = -1
   For i = 1 To anzz
      FrontColor(RGB(255,255,255))  ; Weiss
      If i = mauszauber
         FrontColor(RGB(1,1,255))  ; Blau
         mzauber = zauberliste(i + akt_zauber)
      EndIf

      merker = 0
      merker2 = 0
      If zauberliste(i + akt_zauber) > 0
         For j = 1 To 10
           If quickspells(j,akt_spieler) = zauberliste(i + akt_zauber)
              merker = j
           EndIf
         Next
         For j = 1 To 8
            If quickspells2(j,akt_spieler) = zauberliste(i + akt_zauber)
               merker2 = j
            EndIf
         Next
      EndIf
      wr_txt(i + akt_zauber,merker,merker2,x,y)

      y = y + yplus
   Next
   FrontColor(RGB(255,255,255))  ; Weiss

   ; Beschreibung zu momentanem Zauber
   If mausbesch = 0
     besch = zauberliste(akt_zauber + akt_zauber_offset)
   Else
     besch = mzauber
   EndIf
      
      
   If besch > 0
      x = 415
      y = 390
      xadd = 150

      DrawText(x,y,nachricht4(61))
      DrawText(x+xadd,y,Str(spells(besch)\level))
        
      y = y + yplus
      cost.w = zauberkosten(besch)
      If spieler(akt_spieler)\Mana < cost
         FrontColor(RGB(255,0,0))
      EndIf
      DrawText(x,y,nachricht4(101))
      DrawText(x+xadd,y,Str(spells(besch)\cost) +" ("+ Str(cost) +")" )
      FrontColor(RGB(255,255,255))
         
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
        duration.w = spells(besch)\duration*power(besch)*get_weaving()
        If habich(#SPELL_VERLAENGERN2) > 0
          duration = duration * 2
        EndIf
         
        If skills(#CE_BESTAENDIGKEIT,akt_spieler)\gewaehlt = 1
          duration = duration * 2
        EndIf
            
        If skills(#CE_KURZE_MAGIE,akt_spieler)\gewaehlt = 1
          duration = duration / 2
        EndIf
           
        If spieler(akt_spieler)\fluch = #FLUCH_DER_TANIS
          duration = duration / 2
        EndIf
        DrawText(x+xadd,y,Str(spells(besch)\duration) +" ("+ Str(duration) +")")
      EndIf
         
      y = y + yplus
      DrawText(x,y,nachricht4(103))
      DrawText(x+xadd,y,Str(zauberchance(besch)))

      DrawText(25,375,spells(besch)\info_1[1+language])
      DrawText(25,390,spells(besch)\info_2[1+language])
      
      
      If spells(besch)\summoning > 0
         xx.w = 25
         yy.w = 410
         DrawText(xx,yy,message_text(55,language+1) + " " + Str(creature(spells(besch)\summoning)\LifePoints))
         yy + 10
         DrawText(xx,yy,message_text(52,language+1) + " " + Str(creature(spells(besch)\summoning)\Attack))
         yy + 10
         DrawText(xx,yy,message_text(88,language+1) + " " + Str(creature(spells(besch)\summoning)\schaden_min) + "-" + Str(creature(spells(besch)\summoning)\schaden_max))
         yy + 10
         DrawText(xx,yy,message_text(56,language+1) + " " + Str(creature(spells(besch)\summoning)\Speed))
         
         If spells(besch)\summoning = #CREATURE_STARFEARIE
            yy + 10
            DrawText(xx,yy,message_text(761,language+1))
         EndIf
         If spells(besch)\summoning = #CREATURE_DRAGON
            yy + 10
            DrawText(xx,yy,message_text(762,language+1))
         EndIf
      EndIf
      
      If spells(besch)\shapechanging = 1
         Select (besch)
            Case #SPELL_FLEDERMAUSGESTALT:
               schutz_min = 0
               schutz_max = 4
               akt_reflexe = 6
               akt_maxspeed = 10
               akt_strength = 1
               akt_schleichen = 70
               sicht = 7
            Case #SPELL_WOLFSGESTALT:
               schutz_min = 1
               schutz_max = 6
               akt_reflexe = 6
               akt_maxspeed = 10
               akt_strength = 5
               sicht = 5
            Case #SPELL_VOGELGESTALT:
               schutz_min = 0
               schutz_max = 5
               akt_reflexe = 6
               akt_strength = 1
               akt_schleichen = 70
               sicht = 4
            Case #SPELL_KATZENGESTALT:
               schutz_min = 1
               schutz_max = 6
               akt_reflexe = 10
               akt_maxspeed = 10
               akt_strength = 1
               akt_schleichen = 70
               sicht = 6
            Case #SPELL_DRACHENGESTALT:
               schutz_min = 3
               schutz_max = 12
               akt_reflexe = 1
               akt_maxspeed = 5
               akt_strength = 30
               akt_schleichen = 0
               sicht = 4
         EndSelect
         
         xx.w = 25
         yy.w = 410
         DrawText(xx,yy,message_text(757,language+1))
         yy + 10
         DrawText(xx,yy,message_text(87,language+1) + " " + Str(schutz_min) + "-" + Str(schutz_max))
         yy + 10
         DrawText(xx,yy,message_text(53,language+1) + " " + Str(akt_reflexe) + " " + message_text(54,language+1) + " " + Str(akt_strength))
         yy + 10
         DrawText(xx,yy,message_text(574,language+1) + ": " + Str(akt_schleichen) + " " + message_text(760,language+1) + Str(sicht))
      EndIf
      
      
      If spells(besch)\attack > 0  
         Select(spells(besch)\min_damage)
            Case 1: txt_min_damage.s = message_text(786,language+1)
            Case 2: txt_min_damage = message_text(786,language+1) + "+1"
            Case 3: txt_min_damage = message_text(786,language+1) + "+2"
            Case 4: txt_min_damage = message_text(786,language+1) + "*2"
            Case 5: txt_min_damage = message_text(786,language+1) + "*3"
            Case 6: txt_min_damage = message_text(786,language+1) + "*4"
            Default: txt_min_damage = message_text(786,language+1)
         EndSelect
         Select(spells(besch)\max_damage)
            Case 1: txt_max_damage.s = message_text(786,language+1) + "+2"
            Case 2: txt_max_damage = message_text(786,language+1) + "*2"
            Case 3: txt_max_damage = message_text(786,language+1) + "*2+1"
            Case 4: txt_max_damage = message_text(786,language+1) + "*2+2"
            Case 5: txt_max_damage = message_text(786,language+1) + "*3"
            Case 6: txt_max_damage = message_text(786,language+1) + "*4"
            Case 7: txt_max_damage = message_text(786,language+1) + "*6"
            Default: txt_max_damage = message_text(786,language+1) + "+2"
         EndSelect
         xx.w = 25
         yy.w = 410
         DrawText(xx,yy,message_text(784,language+1) + " " + txt_min_damage)
         yy + 10
         DrawText(xx,yy,message_text(785,language+1) + " " + txt_max_damage)
      EndIf
      
      
      If spells(besch)\area > 0 
          ; Schaden
          Select (spells(spell)\min_damage)
             Case 1: txt_min_damage = message_text(786,language+1)
             Case 2: txt_min_damage = message_text(786,language+1) + "*2"
             Case 3: txt_min_damage = message_text(786,language+1) + "*3"
             Default: txt_min_damage = message_text(786,language+1)
          EndSelect
          Select (spells(spell)\max_damage)
             Case 1: txt_max_damage = message_text(786,language+1) + "*2"
             Case 2: txt_max_damage = message_text(786,language+1) + "*3"
             Case 3: txt_max_damage = message_text(786,language+1) + "*4"
             Default: txt_max_damage = message_text(786,language+1) + "*2"
          EndSelect
         xx.w = 25
         yy.w = 410
         DrawText(xx,yy,message_text(784,language+1) + " " + txt_min_damage)
         yy + 10
         DrawText(xx,yy,message_text(785,language+1) + " " + txt_max_damage)
       EndIf
   EndIf


   ; LP
   FrontColor(RGB(247,36,61))
   DrawText(410,450,message_text(878,language+1))
   tempstr.s = Str(spieler(akt_spieler)\Lifepoints) + "/" + Str(maxlife())
   DrawText(520-TextWidth(tempstr),450,tempstr)
      
   ;display amount of mana
   FrontColor(RGB(130,125,250))
   DrawText(530,450,message_text(879,language+1))
   tempstr.s = Str(spieler(akt_spieler)\Mana) + "/" + Str(maxmana())
   DrawText(640-17-TextWidth(tempstr),450,tempstr)
   StopDrawing()

   x = 400
   y = 52
   For i = 1 To anzz
      If zauberliste(i + akt_zauber) > 0
         what.w =  zauberliste(i + akt_zauber)
         If learned(akt_spieler,what) & #l_favourite
            ClipSprite(#SPRITE_ICONS, 326+18, 52, 10, 8)
         Else
            ClipSprite(#SPRITE_ICONS, 326, 52, 10, 8)
         EndIf
         DisplayTransparentSprite(#SPRITE_ICONS, x-17,y+(yplus/2)-4)
      EndIf
      y = y + yplus
   Next

   SchoolN.w = schulenicons()
   Select SchoolN
      Case 0: schoolname.s = ""
      Case 1: schoolname.s = " (" + nachricht4(885)+")"
      Case 999: schoolname.s = " (" + nachricht4(774)+")"
      Default : schoolname.s = " (" + skills(SchoolN,akt_spieler)\name[1+language]+")"
   EndSelect
   wohin = ScreenOutput()
   StartDrawing(wohin)
   FrontColor(RGB(255,255,255))  ; Weiss
   DrawingMode(1)
   DrawText(370, 18, nachricht4(100)+schoolname)
   StopDrawing()

   If skills(#CE_ZAUBERWEBEN,akt_spieler)\gewaehlt = 1
     If besch > 0
        spellweaving(spells(besch)\weavable)
     Else
        spellweaving(0)
     EndIf
   EndIf

EndProcedure

; ------------------------------------------------------------------------------------------

; Fields that block our sight
Procedure blockiert(x.w,y.w,level.w = 0)
   
   If x < 1 Or y < 1
      ProcedureReturn 1
   EndIf
   
   If level = 0
     level = Spieler(akt_spieler)\level
   EndIf
   testfeld.w = labyrinth(level,x,y)\feld
   
   If fields(testfeld)\block_los = 1
      ProcedureReturn 1
   EndIf
   
   ProcedureReturn 0

EndProcedure

; ------------------------------------------------------------------------------------------

; check if field is suitable for item placement
Procedure blockiert2(x.w,y.w,level.w)
   If x < 1 Or y < 1
      ProcedureReturn 1
   EndIf
   
   testfeld.w = labyrinth(level,x,y)\feld
   
   If fields(testfeld)\block_item = 1
      ProcedureReturn 1
   EndIf
   
   ProcedureReturn 0

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure los(no_tunnel.w = 0)

Shared spell_x, spell_y, blocked

   blocked = 0
   If spell_x = 0 Or spell_y = 0   ; Nur Horizontal oder Vertikal erlaubt
      If spell_x < -1    ; links vom character
         x = spieler(akt_spieler)\character_x + spell_x + 1
         y = spieler(akt_spieler)\character_y
         For i = x To spieler(akt_spieler)\character_x
            If blockiert(x,y,spieler(akt_spieler)\level) = 1
               blocked = 1
            EndIf
            x = x + 1
         Next
      EndIf
      If spell_x > 1    ; rechts vom character
         x = spieler(akt_spieler)\character_x
         y = spieler(akt_spieler)\character_y
         For i = x To spieler(akt_spieler)\character_x + spell_x - 1
            If blockiert(x,y,spieler(akt_spieler)\level) = 1
               blocked = 1
            EndIf
            x = x + 1
         Next
      EndIf
      If spell_y < -1    ; oberhalb vom character
         x = spieler(akt_spieler)\character_x
         y = spieler(akt_spieler)\character_y + spell_y + 1
         For i = y To spieler(akt_spieler)\character_y
            If blockiert(x,y,spieler(akt_spieler)\level) = 1
               blocked = 1
            EndIf
            y = y + 1
         Next
      EndIf
      If spell_y > 1   ; unterhalb vom character
         x = spieler(akt_spieler)\character_x
         y = spieler(akt_spieler)\character_y
         For i = y To spieler(akt_spieler)\character_y + spell_y - 1
            If blockiert(x,y,spieler(akt_spieler)\level) = 1
               blocked = 1
            EndIf
            y = y + 1
         Next
      EndIf
   Else
      blocked = 1
   EndIf
   
   If habich(#SPELL_TUNNEL) > 0 And no_tunnel = 0
      blocked = 0
   EndIf

   ProcedureReturn blocked

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure monsterschaden(schaden.w, magic.w = 1)

Shared spell_x, spell_y
   
   ; Monster ? 
   ;mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
   mon_no.w = monster_list()\number
   act_monster.monster_pointer\p = @monster_list()
   If  mon_no And monster_list()\status <> #MONSTERSTATUS_TOT
   
      ; Unsichtbarkeit weg!
      For i = 1 To #ACTIVE_SLOTS
         If aktive(i,akt_spieler)\nr = #SPELL_UNSICHTBARKEIT And aktive(i,akt_spieler)\dauer <> #UNENDLICH
            aktive(i,akt_spieler)\nr = 0
            aktive(i,akt_spieler)\staerke = 0
            aktive(i,akt_spieler)\dauer = 0
         EndIf
      Next
      
      ; Im Sichtfeld?
      on_screen.w = 0
      If spell_x > -6 And spell_x < 6 And spell_y > -6 And spell_y < 6
         laby_screen2()
         on_screen = 1
         ; Roten Fleck darstellen
         ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 7*32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+ spell_x*32, 160 + spell_y*32)
         ; Schaden darstellen
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
               ; Verschieben bei groesseren Zahlen
               If schaden < 10: xx=172+ spell_x*32:yy= 168 + spell_y*32: EndIf
               If schaden >= 10: xx=166+ spell_x*32: yy = 168 + spell_y*32: EndIf
               If schaden >= 100: xx=163+ spell_x*32:yy= 168 + spell_y*32: EndIf
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(xx,yy,Str(schaden))
         StopDrawing()
         Sound(Random(12))
      EndIf
   
      ;restore pointer
      ChangeCurrentElement(monster_list(),act_monster\p)

      ; Ruestung abziehen
      If magic = 0 Or habich(#SPELL_BRECHER) = 0 
         schaden = schaden - myRand2(monster(mon_no)\ruestung)
         ;schaden = schaden - monster(mon_no)\ruestung
         If schaden < 1
            schaden = 0
         EndIf
      EndIf
      monster_list()\hp = monster_list()\hp - schaden
      ;print("monsterschaden1:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))

   
      ; Monster tot ?
      If monster_list()\hp < 1
      
         explo.w = 0
      
         ; Explodiert?
         If has_trait2(mon_no,#ME_EXPLODIERT)
            explo = 1
         EndIf
         
         If on_screen
           willi.s = monster(mon_no)\name[1+language] + message_text(627,language+1)
           nachricht7(willi,#COLOR_ROT)
           lernen(mon_no)
         EndIf
         
         gott_check()
         
         ; Wassermonster?
         If has_trait2(mon_no,#ME_WASSER)
           remove_monster()
         Else
           hinterlassen(spieler(akt_spieler)\character_x + spell_x,spieler(akt_spieler)\character_y + spell_y)
           ;restore pointer
           ChangeCurrentElement(monster_list(),act_monster\p)
         EndIf
         
         spieler(akt_spieler)\mks = spieler(akt_spieler)\mks + 1
         
         If explo = 1
            explodiert()
         EndIf
        ;restore pointer
        ChangeCurrentElement(monster_list(),act_monster\p)
      Else
         ; Status aendern
         If monster_list()\status = #MONSTERSTATUS_NORMAL
            monster_list()\status = #MONSTERSTATUS_ALERT
         EndIf
         If monster_list()\status = #MONSTERSTATUS_SCHLAEFT
            monster_list()\status = #MONSTERSTATUS_NORMAL
         EndIf
         FlipBuffers()
         If on_screen
           Delay(delay_animation)
         EndIf 
      EndIf
   EndIf
   
   laby_screen()
   ChangeCurrentElement(monster_list(),act_monster\p)

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure cast_it2()

Shared anz_zauber, akt_zauber, frame, spell_x, spell_y, blocked
Shared akt_zauber_offset, item_spell, aktion
Shared karten_typ, monsterauge

   XIncludeFile("check_spells.pbi")

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure cast_it()

Shared  akt_zauber, akt_zauber_offset
   spell.w = zauberliste(akt_zauber + akt_zauber_offset)
   If spell > 0
      If habich(#SPELL_VERDOPPELN) > 0 And spell <> #SPELL_VERDOPPELN
         cast_it2()
      EndIf
      cast_it2()
   EndIf

EndProcedure

; ------------------------------------------------------------------------------------------
; Zaubermenue

Procedure cast_spell()

Shared anz_zauber, akt_zauber, frame, spell_x, spell_y, blocked
Shared anzz, yplus, mauszauber, mausbesch, akt_zauber_offset, aktion
Shared akt_zauber_offset2, joystick_used, no_mouse
Shared min_icon_pos, icon_pos

   If spieler(akt_spieler)\charge > 0 ;no spellcasting while in charge
      ProcedureReturn 0
   EndIf
   erstelle_liste()

   akt_zauber = spieler (akt_spieler)\pos_zaubermenue

   For i = 0 To #max_icon - 1
     school_names(i) = "nil"
   Next
   school_names(#max_icon) = "" ;all spells
   school_numbers(#max_icon) = 0
   school_clip_icon_pos(#max_icon) = 1*19
   i = #max_icon -1
   school_names(i) = "selected" ;favoured spells
   school_numbers(i) = 999
   school_clip_icon_pos(i) =  17*19
   
   If skills(#CE_KEINE_BASISMAGIE,akt_spieler)\gewaehlt = 0
     i - 1
     school_names(i) = "basis"
     school_numbers(i) = 1
     school_clip_icon_pos(i) =  3*19
   EndIf
   If skills(#CE_WEISSE_MAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "weiss"
     school_numbers(i) = #CE_WEISSE_MAGIE
     school_clip_icon_pos(i) = 13*19
   EndIf
   If skills(#CE_SCROLLORE,akt_spieler)\gewaehlt = 1 
     i - 1
     school_names(i) = "scroll"
     school_numbers(i) = #CE_SCROLLORE
     school_clip_icon_pos(i) = 15*19
   EndIf
   If skills(#CE_STERNENMAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "sterne"
     school_numbers(i) = #CE_STERNENMAGIE
     school_clip_icon_pos(i) = 10*19
   EndIf
   If skills(#CE_ILLUSIONSMAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "illusion"
     school_numbers(i) = #CE_ILLUSIONSMAGIE
     school_clip_icon_pos(i) =  9*19
   EndIf
   If skills(#CE_WARLOCK,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "warlock"
     school_numbers(i) = #CE_WARLOCK
     school_clip_icon_pos(i) = 11*19
   EndIf
   If skills(#CE_SCHWARZE_MAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "schwarz"
     school_numbers(i) = #CE_SCHWARZE_MAGIE
     school_clip_icon_pos(i) =  4*19
   EndIf
   If skills(#CE_FEUERMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "feuer"
     school_numbers(i) = #CE_FEUERMAGIE
     school_clip_icon_pos(i) =  7*19
   EndIf
   If skills(#CE_WASSERMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "wasser"
     school_numbers(i) = #CE_WASSERMAGIE
     school_clip_icon_pos(i) = 12*19
   EndIf
   If skills(#CE_ERDMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "erde"
     school_numbers(i) = #CE_ERDMAGIE
     school_clip_icon_pos(i) =  6*19
   EndIf
   If skills(#CE_LUFTMAGIE,akt_spieler)\gewaehlt = 1 Or skills(#CE_ELEMENTARMAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "luft"
     school_numbers(i) = #CE_LUFTMAGIE
     school_clip_icon_pos(i) =  0*19
   EndIf
   If skills(#CE_DRUIDENMAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "druide"
     school_numbers(i) = #CE_DRUIDENMAGIE
     school_clip_icon_pos(i) =  5*19
   EndIf
   If skills(#CE_HEXEREI,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "hexerei"
     school_numbers(i) = #CE_HEXEREI
     school_clip_icon_pos(i) = 14*19
   EndIf
   If skills(#CE_HOHE_MAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "hohe"
     school_numbers(i) = #CE_HOHE_MAGIE
     school_clip_icon_pos(i) =  8*19
   EndIf
   If skills(#CE_ZAUBERLIEDER,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "barde"
     school_numbers(i) = #CE_ZAUBERLIEDER
     school_clip_icon_pos(i) =  2*19
   EndIf
   If skills(#CE_BESCHWOERER,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "beschwörer"
     school_numbers(i) = #CE_BESCHWOERER
     school_clip_icon_pos(i) = 16*19
   EndIf
   If skills(#CE_FREIE_MAGIE,akt_spieler)\gewaehlt = 1
     i - 1
     school_names(i) = "frei"
     school_numbers(i) = #CE_FREIE_MAGIE
     school_clip_icon_pos(i) =  18*19
   EndIf

   min_icon_pos = i
   release = 0
   mausbesch = 0

   For i = min_icon_pos To #max_icon
      If spieler(akt_spieler)\schule = school_numbers(i)
         icon_pos = i
      EndIf
   Next
      
   init_keyboard_cast()

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
   
      schulenicons_check()

      ; #PB_Key_S
      if used_keys(1)\pressed And used_keys(1)\wait_release = 0
         used_keys(1)\wait_release = 1
         spieler(akt_spieler)\sorting_style = spieler(akt_spieler)\sorting_style ! 1
         bubblesort()
         mausbesch = 0
      endif

      ; #PB_Key_Down
      if used_keys(2)\pressed And used_keys(2)\wait_release = 0
         used_keys(2)\wait_release = 1
         If akt_zauber < anz_zauber - 1
            akt_zauber = akt_zauber + 1
            mausbesch = 0
         EndIf
      endif

      ; #PB_Key_Up
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         If akt_zauber > 0
            akt_zauber = akt_zauber - 1
            mausbesch = 0
         EndIf
      endif
      
      ; #PB_Key_PageDown
      if used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         icon_pos - 1
         release = 1
         If icon_pos < min_icon_pos
            icon_pos = #max_icon
         EndIf
         spieler(akt_spieler)\schule = school_numbers(icon_pos)
         erstelle_liste(1)
         mausbesch = 0
      endif
      
      ; #PB_Key_PageUp
      if used_keys(5)\pressed And used_keys(5)\wait_release = 0
         used_keys(5)\wait_release = 1
         icon_pos + 1
         release = 1
         If icon_pos > #max_icon
            icon_pos = min_icon_pos
         EndIf
         spieler(akt_spieler)\schule = school_numbers(icon_pos)
         erstelle_liste(1)
         mausbesch = 0
      endif

      ; function keys / spellschools
      For i = 6 To 17
         if used_keys(i)\pressed And used_keys(i)\wait_release = 0 And school_names(#max_icon + i - 12 - 5) <> "nil"
            used_keys(i)\wait_release = 1
            icon_pos = #max_icon + i - 12 - 5 ; ???
            spieler(akt_spieler)\schule = school_numbers(icon_pos)
            erstelle_liste(1)
            mausbesch = 0
         EndIf
      Next

      ; #PB_Key_F
      if used_keys(18)\pressed And used_keys(18)\wait_release = 0
         used_keys(18)\wait_release = 1
         whichspell.w = zauberliste(akt_zauber + akt_zauber_offset)
         If whichspell > 0
            learned(akt_spieler,whichspell) = learned(akt_spieler,whichspell) ! #l_favourite
         EndIf
      endif

      ; #PB_Key_Escape
      if used_keys(30)\pressed And used_keys(30)\wait_release = 0
         used_keys(30)\wait_release = 1
         raus = 3
      endif

      ; #PB_Key_Return
      if used_keys(29)\pressed And used_keys(29)\wait_release = 0
         used_keys(29)\wait_release = 1
         raus = 1
      endif

      ; set quickspells
      If zauberliste(akt_zauber+akt_zauber_offset) > 0
         For j = 19 To 28
            if used_keys(j)\pressed And used_keys(j)\wait_release = 0
               used_keys(j)\wait_release = 1
               For i = 1 To 10
                  If quickspells(i,akt_spieler) = zauberliste(akt_zauber+akt_zauber_offset)
                     quickspells(i,akt_spieler) = 0
                  EndIf
               Next
               quickspells(j-18,akt_spieler) = zauberliste(akt_zauber+akt_zauber_offset)
            EndIf
         Next
      EndIf
      
      If mmouse_x >= #POS_BUTTON_SPELLIST_HOCH_X And mmouse_x <= #POS_BUTTON_SPELLIST_HOCH_X + 32 And mmouse_y >= #POS_BUTTON_SPELLIST_HOCH_Y And mmouse_y <= #POS_BUTTON_SPELLIST_HOCH_Y + 32
         over_upbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If akt_zauber > 0
               akt_zauber = akt_zauber - 1
            EndIf
         EndIf
      else
         over_upbutton = 0
      endif
      
      If mmouse_x > #POS_BUTTON_SPELLIST_RUNTER_X And mmouse_x < #POS_BUTTON_SPELLIST_RUNTER_X + 32 And mmouse_y > #POS_BUTTON_SPELLIST_RUNTER_Y And mmouse_y < #POS_BUTTON_SPELLIST_RUNTER_Y + 32
         over_downbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If akt_zauber < anz_zauber - 1
               akt_zauber = akt_zauber + 1
            EndIf
         EndIf
      else
         over_downbutton = 0
      endif
      
      If mmouse_x >= #POS_BUTTON_ESC_x And mmouse_x <= #POS_BUTTON_ESC_x + 32 And mmouse_y >= #POS_BUTTON_ESC_y And mmouse_y <= #POS_BUTTON_ESC_y + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raus = 3
         EndIf
      else
         over_exitbutton = 0
      endif
      
      If mmouse_x >= #POS_BUTTON_sort_x And mmouse_x <= #POS_BUTTON_sort_x + 32 And mmouse_y >= #POS_BUTTON_sort_y And mmouse_y <= #POS_BUTTON_sort_y + 32
         over_sortbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            spieler(akt_spieler)\sorting_style = spieler(akt_spieler)\sorting_style ! 1
            bubblesort()
         EndIf
      else
         over_sortbutton = 0
      endif
         
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 3
      endif

      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         If mmouse_x > 400
            raus = 2
         Elseif mmouse_x > 400 - 18 And mmouse_x < 400 - 6
            If mzauber > 0
               learned(akt_spieler,mzauber) = learned(akt_spieler,mzauber) ! #l_favourite
            EndIf
         EndIf
      EndIf

      oldmauszauber.w = mauszauber
      mauszauber = 0
      y = 52
      aktuell = 1
      If mmouse_x > 365 And mmouse_x < 574
         For i = 1 To anzz
            If mmouse_y >= y And mmouse_y <= y + yplus
               mauszauber = aktuell
               mzauber = zauberliste(i + akt_zauber)
               If mauszauber <> oldmauszauber
                  mausbesch = 1
               EndIf
            EndIf
            y = y + yplus
            aktuell = aktuell + 1
         Next
      EndIf
      
      if something_changed = 1
         Fenster()
         screen2(1,1)
         spells_border()

         if over_upbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 6*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 4*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_SPELLIST_HOCH_X, #POS_BUTTON_SPELLIST_HOCH_Y)
         
         ; Unten
         if over_downbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 7*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 5*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_SPELLIST_RUNTER_X, #POS_BUTTON_SPELLIST_RUNTER_Y)

         ; exit button
         if over_exitbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_ESC_x, #POS_BUTTON_ESC_y)

         ; sorting style button
         if over_sortbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, (5+spieler(akt_spieler)\sorting_style*2)*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, (4+spieler(akt_spieler)\sorting_style*2)*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_sort_x, #POS_BUTTON_sort_y)
         
         end_screen()
      endif ; something_changed
      delay(#Input_delay)
   Until raus > 0

   ; casted with keyboard
   if raus = 1
      item_spell = 0
      cast_it()
   EndIf

   ; casted with mouse
   If raus = 2
      If mausbesch
         zauberliste(akt_zauber + akt_zauber_offset) = zauberliste(akt_zauber + akt_zauber_offset + mauszauber - 14)
      EndIf
      item_spell = 0
      cast_it()
   EndIf
   
   spieler (akt_spieler)\pos_zaubermenue = akt_zauber

EndProcedure


Procedure damage(spell.w, special.w)

    Select(spells(spell)\min_damage)
      Case 1: new_min_damage = power(spell)
      Case 2: new_min_damage = power(spell)+1
      Case 3: new_min_damage = power(spell)+2
      Case 4: new_min_damage = power(spell)*2
      Case 5: new_min_damage = power(spell)*3
      Case 6: new_min_damage = power(spell)*4
      Default: new_min_damage = power(spell)
    EndSelect
    Select(spells(spell)\max_damage)
      Case 1: new_max_damage = power(spell)+2
      Case 2: new_max_damage = power(spell)*2
      Case 3: new_max_damage = power(spell)*2+1
      Case 4: new_max_damage = power(spell)*2+2
      Case 5: new_max_damage = power(spell)*3
      Case 6: new_max_damage = power(spell)*4
      Case 7: new_max_damage = power(spell)*6
      Default: new_max_damage = power(spell)
    EndSelect
    new_min_damage = new_min_damage * special * get_weaving()
    new_max_damage = new_max_damage * special * get_weaving()
    schaden.w = new_min_damage + myRand(new_max_damage-new_min_damage)
    
    ProcedureReturn schaden

EndProcedure


Procedure angriffsspruch(spell.w, attack_animation.w, spell_sound.w, damage_type.w)

Shared item_spell, spell_x, spell_y, blocked
    
    If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
      spell_x = 0
      spell_y = 0
      destination = select_field()   ; gibt spell_x und spell_y zurueck
      if destination = 1
         blocked = 0
         los()            ; gibt blocked zurueck
         If blocked = 0
            zug_verlieren()
            mana_verlieren(spell)
            special.w = erfolgreich(spell)
            If special > 0
               schaden.w = damage(spell, special)
               Sound(spell_sound)
               If damage_type = 5
                  For j = 1 To 5
                     For i = 1 To 2
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 40, 39, 39)
                        DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+spell_x*32, 156+spell_y*32)
                        FlipBuffers()
                        Delay(delay_animation2)
                     Next
                  Next
               Else
                  animate_projectile(attack_animation)
               EndIf
               hydra_zauber(schaden)
               Select (damage_type)
                  Case 1: feuerschaden(schaden)
                  Case 2: eisschaden(schaden)
                  Case 3: 
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If immune(#ME_BLITZEFEST) = 1
                           message(329,#COLOR_BLAU)
                        Else
                           If dispelled() = 1
                              message(312,#COLOR_BLAU)
                           Else
                              monsterschaden(schaden)
                           EndIf
                        EndIf
                     EndIf
                  Case 4:
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           monsterschaden(schaden)
                        EndIf
                     EndIf
                  Case 5:
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If immune(#ME_WINDFEST) = 0
                           If dispelled() = 1
                              message(312,#COLOR_BLAU)
                           Else
                              monsterschaden(schaden)
                           EndIf
                        Else
                           message(834,#COLOR_BLAU)
                        EndIf
                     EndIf
                  Default: feuerschaden(schaden)
               EndSelect
               cleanup_monsters()
            EndIf
         Else
            message(233,#COLOR_BLAU)
         EndIf
      endif
    Else
      message(194,#COLOR_BLAU)
    EndIf

EndProcedure


Procedure banish_monster(spell.w, type.w)

Shared item_spell, spell_x, spell_y, blocked

   If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
      spell_x = 0
      spell_y = 0
      destination = select_field()   ; gibt spell_x und spell_y zurueck
      if destination = 1
         blocked = 0
         los()            ; gibt blocked zurueck
         If blocked = 0
            zug_verlieren()
            ; zaubern!
            special.w = erfolgreich(spell)
            If special > 0
               mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               act_monster.monster_pointer\p = @monster_list()
               If mon_no
                  If monster(mon_no)\art = type
                     mana_verlieren(spell)
                     Sound(#SOUND_CHAOS)
                     sternchen(160+spell_x*32,160+spell_y*32,3)
                     ChangeCurrentElement(monster_list(), act_monster\p)
                     zerstoert(#COLOR_BLAU, 0)
                     cleanup_monsters()
                  Else
                     Select(type)
                        Case 1: message(189,#COLOR_BLAU)
                        Case 2: message(887,#COLOR_BLAU)
                        Case 3: message(190,#COLOR_BLAU)
                        Case 4: message(601,#COLOR_BLAU)
                        Case 10: message(602,#COLOR_BLAU)
                        Default:message(189,#COLOR_BLAU)
                     EndSelect
                  EndIf
               Else
                  message(600,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(233,#COLOR_BLAU)
         EndIf
      endif
   Else
      message(194,#COLOR_BLAU)
   EndIf

EndProcedure


Procedure shapechange(type.w,spell.w)

Shared item_spell

    If spieler(akt_spieler)\Mana > zauberkosten(type) - 1 Or item_spell
      zug_verlieren()
      mana_verlieren(type)
      special.w = erfolgreich(type)
      If special > 0
         Sound(#SOUND_DING)
         sternchen(160,160,5)
         eintragen(type,1,spells(type)\duration * power(spell) * special * get_weaving(),0)
      EndIf
    Else
      message(194,#COLOR_BLAU)
    EndIf

EndProcedure


Procedure attack_area(spell.w, sound.w, filler.w, destroy_type.w, bereich.w, damage_type.w)

Shared item_spell, spell_x, spell_y, blocked

    success.w = 0
    If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
       zug_verlieren()
       mana_verlieren(spell)
       special.w = erfolgreich(spell)
       If special > 0
          akt_power.w = special * power(spell)
          success = 1
          Sound(sound)
          laby_screen()
          ; Bildschirm fuellen
          If filler = 9999
             spraygrafik(8*21,10)
          Else
             For y=1 To #MATRIX_SIZE
                For x=1 To #MATRIX_SIZE
                   draw_tile(filler, x, y, 1, 1, -1)
                Next
             Next
          EndIf
          FlipBuffers()
          Delay(delay_animation)
          laby_screen()

          Select(bereich)
             Case 1:
                anfang_x.w = max(-#HALF_MATRIX_SIZE, -spieler(akt_spieler)\character_x + 1)
                ende_x.w = min(#HALF_MATRIX_SIZE, groesse(spieler(akt_spieler)\level) - spieler(akt_spieler)\character_x)
                anfang_y.w = max(-#HALF_MATRIX_SIZE, -spieler(akt_spieler)\character_y + 1)
                ende_y.w = min(#HALF_MATRIX_SIZE, groesse(spieler(akt_spieler)\level) - spieler(akt_spieler)\character_y)
             Case 2:
                anfang_x.w = -spieler(akt_spieler)\character_x + 1
                ende_x.w = groesse(spieler(akt_spieler)\level) - spieler(akt_spieler)\character_x
                anfang_y.w = -spieler(akt_spieler)\character_y + 1
                ende_y.w = groesse(spieler(akt_spieler)\level) - spieler(akt_spieler)\character_y
             Default: ; nothing
          EndSelect
          ;print("X:"+Str(anfang_x+spieler(akt_spieler)\character_x)+"-"+Str(ende_x+spieler(akt_spieler)\character_x)+" Y:"+Str(anfang_y+spieler(akt_spieler)\character_y)+"-"+Str(ende_y+spieler(akt_spieler)\character_y))
          hydrahits.w = 0
          hy_x.w = 0
          hy_y.w = 0
          ; Schaden
          Select (spells(spell)\min_damage)
             Case 1: min_damage.w = akt_power
             Case 2: min_damage.w = akt_power*2
             Case 3: min_damage.w = akt_power*3
             Default: min_damage.w = akt_power
          EndSelect
          Select (spells(spell)\max_damage)
             Case 1: max_damage.w = akt_power*2
             Case 2: max_damage.w = akt_power*3
             Case 3: max_damage.w = akt_power*4
             Default: max_damage.w = akt_power*2
          EndSelect
          ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
          While monster_list()\z = spieler(akt_spieler)\level
            ;print("area_attack:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
            If monster_list()\x >= anfang_x+spieler(akt_spieler)\character_x And monster_list()\x <= ende_x+spieler(akt_spieler)\character_x And monster_list()\y >= anfang_y+spieler(akt_spieler)\character_y And monster_list()\y <= ende_y+spieler(akt_spieler)\character_y
              ;print("in_range:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
              mon_no.w = monster_list()\number
              ;art.w = monster(mon_no)\art
              spell_x = monster_list()\x - spieler(akt_spieler)\character_x
              spell_y = monster_list()\y - spieler(akt_spieler)\character_y
              schaden.w = min_damage + myRand(max_damage-min_damage)
              schaden = schaden * get_weaving() 
              Select(damage_type)
                Case 1: ; feuer
                  ; Brennt?
                  If has_trait2(mon_no,#ME_BRENNT) = 1
                    schaden = schaden * 2
                  EndIf
                  ; Feuerfest?
                  If has_trait2(mon_no,#ME_FEUERFEST) = 0
                    monsterschaden(schaden)
                  Else
                    message(265,#COLOR_BLAU)
                  EndIf
                Case 2: ; flutwelle
                  ; Fliegt?
                  If has_trait2(mon_no,#ME_FLIEGT) = 0
                    ; Schaden
                    monsterschaden(schaden)
                  EndIf
                Case 3 ; winde
                  ; Fliegt?
                  If has_trait2(mon_no,#ME_FLIEGT) = 1
                    If immune(#ME_WINDFEST) = 0
                      monsterschaden(schaden)
                    Else
                      message(834,#COLOR_BLAU)
                    EndIf
                  EndIf
                Case 4: ; normal
                  monsterschaden(schaden)
                Default: ; nothing
              EndSelect
              ;print("area_attack after dam:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
            EndIf
            NextElement(monster_list())
          Wend
          ;print("area_attack ende:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
          cleanup_monsters()
     
          For spell_x = anfang_x To ende_x
             For spell_y = anfang_y To ende_y
                testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                Select (destroy_type)
                   Case 1: ; feuer
                      If testfeld = #FELD_EIS     ; Eisblock
                         schaden.w = min_damage + myRand(max_damage-min_damage)
                         schaden = schaden * get_weaving()
                         ; Schaden
                         If schaden > 3
                            Destroy_Iceblock(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level)
                         EndIf
                      EndIf
                   Case 2: ; wasser
                      If testfeld = #FELD_FEUER1 Or testfeld = #FELD_FEUER2 Or testfeld = #FELD_LAGERFEUER
                         schaden.w = min_damage + myRand(max_damage-min_damage)
                         schaden = schaden * get_weaving() 
                         ; Schaden
                         If schaden > 3
                            Sound(#SOUND_SPLASH)
                            cleartile(spieler(akt_spieler)\character_x+spell_x,spieler(akt_spieler)\character_y+spell_y)
                         EndIf
                      EndIf
                   Default: ; nothing
                EndSelect
                If testfeld >= #FELD_HYDRA1 And testfeld <= #FELD_HYDRA12
                    hydrahits+1
                    hy_x = spell_x
                    hy_y = spell_y
                EndIf
             Next
          Next
          If hydrahits > 0
             schaden = min_damage + myRand(max_damage-min_damage)
             schaden = schaden * get_weaving() * hydrahits
             spell_x = hy_x
             spell_y = hy_y
             ; divide by 6 , thus if all 12 parts of the hydra have been hit,
             ; one does about double damage to it
             hydra_zauber( schaden / 6 )
          EndIf
       EndIf
    Else
       message(194,#COLOR_BLAU)
    EndIf
    ProcedureReturn success
         
 EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 1603
; FirstLine = 1574
; Folding = --------
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
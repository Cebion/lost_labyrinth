      spell.w = zauberliste(akt_zauber + akt_zauber_offset)
      
      ;allow only one active meta-magic spell
      If spells(spell)\duration = #META_MAGIC
        terminate_meta_magic()
      EndIf
      
      special.w = 0

      Select spell
      Case #SPELL_HEILUNG
         If heal(akt_spieler,spieler(akt_spieler)\level) > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  heal(akt_spieler,spieler(akt_spieler)\level) - 1
                  gain.w = myRand(3) + special * power(spell) * 2 * get_weaving()
                  spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + gain
                  If spieler(akt_spieler)\Lifepoints > maxlife()
                     spieler(akt_spieler)\Lifepoints = maxlife()
                  EndIf
                  Sound(#SOUND_HOLY)
                  For j = 1 To 5
                     For i = 1 To 4
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                        DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
                        end_screen()
                        Delay(delay_animation2)
                     Next
                  Next
                  laby_screen()
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         Else
            message(694,#COLOR_BLAU)
            zug_verlieren()
         EndIf
      
      Case #SPELL_ANDERE_HEILEN
         If heal_others(akt_spieler,spieler(akt_spieler)\level) > 0
             If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
                spell_x = 0
                spell_y = 0
                destination = select_field()   ; gibt spell_x und spell_y zurueck
                If destination = 1
                  blocked = 0
                  los()            ; gibt blocked zurueck
                  If blocked = 0
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        heal_others(akt_spieler,spieler(akt_spieler)\level) - 1
                        
                        ; Welcher Spieler
                        jemand.b = 0
                        For i = 1 To nr_of_players
                           If spieler(akt_spieler)\character_x + spell_x = spieler(i)\character_x And spieler(akt_spieler)\character_y + spell_y = spieler(i)\character_y And spieler(i)\Level = spieler(akt_spieler)\Level And spieler(i)\creature_typ = 0
                              jemand = i
                           EndIf
                        Next
                        
                        If jemand > 0
                           gain = myRand(3) + special * power(spell) * 2 * get_weaving()
                           spieler(jemand)\Lifepoints = spieler(jemand)\Lifepoints + gain
                           save_player = akt_spieler
                           akt_spieler = jemand
                           If spieler(jemand)\Lifepoints > maxlife()
                              spieler(jemand)\Lifepoints = maxlife()
                           EndIf
                           akt_spieler = save_player
                           
                           Sound(#SOUND_HOLY)
                           For j = 1 To 5
                              For i = 1 To 4
                                 laby_screen2()
                                 ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                                 DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+spell_x*32,156+spell_y*32)
                                 FlipBuffers()
                                 Delay(delay_animation2)
                              Next
                           Next
                        Else
                           message(246,#COLOR_BLAU)
                        EndIf
                        laby_screen()
                     EndIf
                  Else
                     message(233,#COLOR_BLAU)
                  EndIf
                EndIf
             Else
                message(194,#COLOR_BLAU)
             EndIf
          Else
              message(694,#COLOR_BLAU)
            zug_verlieren()
          EndIf
      
      Case #SPELL_HEILE_KREATUR
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     ; Welche Kreatur?
                     jemand.b = 0
                     For i = 1 To nr_of_players
                        If spieler(i)\creature_typ > 0 And spieler(akt_spieler)\character_x + spell_x = spieler(i)\character_x And spieler(akt_spieler)\character_y + spell_y = spieler(i)\character_y And spieler(i)\Level = spieler(akt_spieler)\Level
                           jemand = i
                        EndIf
                     Next
                     
                     If jemand > 0
                        gain = myRand(3) + special * power(spell) * 2 * get_weaving()
                        spieler(jemand)\LifePoints = spieler(jemand)\LifePoints + gain
                        If spieler(jemand)\LifePoints > spieler(jemand)\MaxLifePoints
                           spieler(jemand)\LifePoints = spieler(jemand)\MaxLifePoints
                        EndIf
                        
                        Sound(#SOUND_HOLY)
                        For j = 1 To 5
                           For i = 1 To 4
                              laby_screen2()
                              ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                              DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+spell_x*32,156+spell_y*32)
                              end_screen()
                              Delay(delay_animation2)
                           Next
                        Next
                     Else
                        message(246,#COLOR_BLAU)
                     EndIf
                     laby_screen()
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_CURE_CREATURE_POISON
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     ; Welche Kreatur?
                     jemand.b = 0
                     For i = 1 To nr_of_players
                        If spieler(i)\creature_typ > 0 And spieler(akt_spieler)\character_x + spell_x = spieler(i)\character_x And spieler(akt_spieler)\character_y + spell_y = spieler(i)\character_y And spieler(i)\Level = spieler(akt_spieler)\Level
                           jemand = i
                        EndIf
                     Next

                     If jemand > 0
                        spieler(jemand)\poison = 0
            
                        Sound(#SOUND_HOLY)
                        For j = 1 To 5
                           For i = 1 To 4
                              laby_screen2()
                              ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                              DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+spell_x*32,156+spell_y*32)
                              end_screen()
                              Delay(delay_animation2)
                           Next
                        Next
                     Else
                        message(246,#COLOR_BLAU)
                     EndIf
                     laby_screen()
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf

      Case #SPELL_ANDERE_ENTGIFTEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     ; Welcher Spieler
                     jemand.b = 0
                     For i = 1 To nr_of_players
                        If spieler(akt_spieler)\character_x + spell_x = spieler(i)\character_x And spieler(akt_spieler)\character_y + spell_y = spieler(i)\character_y And spieler(i)\Level = spieler(akt_spieler)\Level And spieler(i)\creature_typ = 0
                           jemand = i
                        EndIf
                     Next
                     
                     If jemand > 0
                        spieler(jemand)\poison = 0
                        
                        Sound(#SOUND_HOLY)
                        For j = 1 To 5
                           For i = 1 To 4
                              laby_screen2()
                              ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                              DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+spell_x*32,156+spell_y*32)
                              end_screen()
                              Delay(delay_animation2)
                           Next
                        Next
                     Else
                        message(246,#COLOR_BLAU)
                     EndIf
                     laby_screen()
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ANDERE_ENTFLUCHEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     ; Welcher Spieler
                     jemand.b = 0
                     For i = 1 To nr_of_players
                        If spieler(akt_spieler)\character_x + spell_x = spieler(i)\character_x And spieler(akt_spieler)\character_y + spell_y = spieler(i)\character_y And spieler(i)\Level = spieler(akt_spieler)\Level And spieler(i)\creature_typ = 0
                           jemand = i
                        EndIf
                     Next
                     
                     If jemand > 0
                        spieler(jemand)\fluch = 0
                        spieler(jemand)\fluchdauer = 0
                        
                        Sound(#SOUND_HOLY)
                        For j = 1 To 5
                           For i = 1 To 4
                              laby_screen2()
                              ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                              DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156+spell_x*32,156+spell_y*32)
                              end_screen()
                              Delay(delay_animation2)
                           Next
                        Next
                     Else
                        message(246,#COLOR_BLAU)
                     EndIf
                     laby_screen()
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ALLHEILUNG
         If full_healing(akt_spieler,spieler(akt_spieler)\level) > 0
             If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
                zug_verlieren()
                mana_verlieren(spell)
                special = erfolgreich(spell)
                If special
                   full_healing(akt_spieler,spieler(akt_spieler)\level) - 1
                   spieler(akt_spieler)\Lifepoints = maxlife()
                   Sound(#SOUND_HOLY)
                   For j = 1 To 5
                      For i = 1 To 4
                         laby_screen2()
                         ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                         DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
                         end_screen()
                         Delay(delay_animation2)
                      Next
                   Next
                   laby_screen()
                EndIf
             Else
                message(194,#COLOR_BLAU)
             EndIf
           Else
              message(694,#COLOR_BLAU)
            zug_verlieren()
           EndIf
      
      Case #SPELL_SCHMERZEN_LINDERN
         If ease_pain(akt_spieler,spieler(akt_spieler)\level) > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  ease_pain(akt_spieler,spieler(akt_spieler)\level) - 1
                  gain = myRand(3) + special * power(spell) * 3 * get_weaving()
                  spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + gain
                  If spieler(akt_spieler)\Lifepoints > maxlife()
                     spieler(akt_spieler)\Lifepoints = maxlife()
                  EndIf
                  Sound(#SOUND_HOLY)
                  For j = 1 To 5
                     For i = 1 To 4
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                        DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
                        end_screen()
                        Delay(delay_animation2)
                     Next
                  Next
                  laby_screen()
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         Else
            message(694,#COLOR_BLAU)
            zug_verlieren()
         EndIf

      Case #SPELL_CHAOS
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               ;zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  Sound(#SOUND_CHAOS)
                  sternchen(160,160,6)
                  Repeat
                     welcher.w = Random(#ANZ_ZAUBER-1)+1
                     zauberliste(akt_zauber+akt_zauber_offset) = welcher
                  Until spells(welcher)\level = 1 And welcher <> #SPELL_CHAOS And spells(welcher)\duration <> #UNENDLICH
                  nachricht7(spells(welcher)\name[1+language],#COLOR_BLAU)
                  ; no mana needed + 100% success for triggered spell
                  item_spell = power(#SPELL_CHAOS)
                  cast_it()
                  item_spell = 0
                  laby_screen()
                  Goto nach_zauber
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf

      Case #SPELL_TRANSMIGRATION
            If spieler(akt_spieler)\Mana > zauberkosten(spell) Or (item_spell And spieler(akt_spieler)\Mana >0)
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  okay = opfern()
                  If okay > 0
                     leeren(okay)
                     Sound(#SOUND_CHAOS)
                     sternchen(160,160,6)
                     save1.w = spieler(akt_spieler)\Lifepoints
                     save2.w = spieler(akt_spieler)\MaxLifepoints
                     save3.w = spieler(akt_spieler)\LifeGain
                     spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Mana
                     spieler(akt_spieler)\MaxLifepoints = spieler(akt_spieler)\MaxMana
                     spieler(akt_spieler)\LifeGain = spieler(akt_spieler)\ManaGain
                     If save1 > save2 ;do check because of life boosting items
                       save1 = save2
                     EndIf
                     spieler(akt_spieler)\Mana = save1
                     spieler(akt_spieler)\MaxMana = save2
                     spieler(akt_spieler)\ManaGain = save3
                  EndIf
               EndIf ; wertvoll genug?
            Else
               message(194,#COLOR_BLAU)
            EndIf
      
      Case #SPELL_WIEDERBELEBUNG
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HOLY)
               For j = 1 To 5
                  For i = 1 To 4
                      laby_screen2()
                     ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                     DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
                     end_screen()
                     Delay(delay_animation2)
                  Next
               Next
               For i = 1 To nr_of_players
                  If spieler(i)\status = 3 And spieler(i)\creature_typ = 0
                     spieler(i)\status = 1
                     spieler(i)\MaxLifepoints = spieler(i)\MaxLifepoints / 2
                     spieler(i)\Lifepoints = maxlife()
                  EndIf
               Next
               laby_screen()
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_MONDLICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(156,156,5)
               eintragen(#SPELL_LICHT,3,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_CONCENTRATION
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_DING)
               sternchen(156,156,5)
               eintragen(#SPELL_CONCENTRATION,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_PRAEZISION
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_DING)
               sternchen(156,156,5)
               eintragen(#SPELL_PRAEZISION,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_TUNNEL
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_LAAA)
               sternchen(156,156,6)
               eintragen(spell,1,#META_MAGIC,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERLAENGERN2
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_LAAA)
               sternchen(156,156,6)
               eintragen(spell,1,#META_MAGIC,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SCHNELLZAUBER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_LAAA)
               sternchen(156,156,6)
               eintragen(spell,1,#META_MAGIC,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_PENETRATION
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_LAAA)
               sternchen(156,156,6)
               eintragen(spell,1,#META_MAGIC,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERDOPPELN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_LAAA)
               sternchen(156,156,6)
               eintragen(spell,1,#META_MAGIC,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_BRECHER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_LAAA)
               sternchen(156,156,6)
               eintragen(spell,1,#META_MAGIC,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_REGENERATION
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_HOLY)
               sternchen(156,156,3)
               eintragen(spell,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_WINDMEISTER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_WIND)
               sternchen(156,156,4)
               eintragen(spell,2,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_HYPNOSE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_HOLY)
               sternchen(156,156,3)
               eintragen(spell,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_LEBENSBUND
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_HOWL)
               sternchen(156,156,3)
               eintragen(spell,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SCHOCK
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_BLITZ)
               sternchen(156,156,6)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FLEDERMAUSGESTALT
          shapechange(#SPELL_FLEDERMAUSGESTALT,spell)
      
      Case #SPELL_WOLFSGESTALT
          shapechange(#SPELL_WOLFSGESTALT,spell)
      
      Case #SPELL_VOGELGESTALT
          shapechange(#SPELL_VOGELGESTALT,spell)
      
      Case #SPELL_KATZENGESTALT
          shapechange(#SPELL_KATZENGESTALT,spell)
      
      Case #SPELL_DRACHENGESTALT
          If drachenform(akt_spieler,spieler(akt_spieler)\level) > 0
             drachenform(akt_spieler,spieler(akt_spieler)\level) - 1
             shapechange(#SPELL_DRACHENGESTALT,spell)
          Else
             message(49,#COLOR_BLAU)
          EndIf
      
      Case #SPELL_SYPHON
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_DARKNESS)
               sternchen(160,160,4)
               eintragen(#SPELL_SYPHON,3,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FLUECHE_BRECHEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HOLY)
               sternchen(160,160,5)
               spieler(akt_spieler)\fluch = 0
               spieler(akt_spieler)\fluchdauer = 0
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_WINTERATEM
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,5)
               eintragen(#SPELL_WINTERATEM,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FEUERAURA
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,6)
               eintragen(#SPELL_FEUERAURA,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FALLEN_SPUEREN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,5)
               eintragen(#SPELL_FALLENSINN,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FEUERSCHILD
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,5)
               eintragen(spell,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_EISSCHILD
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,5)
               eintragen(spell,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_UNVERWUNDBARKEIT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,5)
               eintragen(spell,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_TAEUSCHUNG
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_CHAOS)
               sternchen(160,160,5)
               eintragen(spell,1,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_MACHT
         If macht(akt_spieler,spieler(akt_spieler)\level) > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
		  power.w = spells(spell)\duration * special * power(spell) * get_weaving()
                  macht(akt_spieler,spieler(akt_spieler)\level) - 1
                  Sound(#SOUND_FLAME)
                  sternchen(160,160,5)
                  eintragen(spell,1,power,0)
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         Else
            message(35,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_GLUECKSZAUBER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_STAERKEZAUBER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_UNSICHTBARES_SEHEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_UNSICHTBARKEIT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf

      Case #SPELL_VERZAUBERE_KREATUR_1
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf

      Case #SPELL_VERZAUBERE_KREATUR_2
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf

      Case #SPELL_VERZAUBERE_KREATUR_3
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf

      Case #SPELL_VERZAUBERE_KREATUR_4
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_NORDLICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,5)
               eintragen(#SPELL_LICHT,5,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SONNENLICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,5)
               eintragen(#SPELL_LICHT,6,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_WAHRLICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,5)
               eintragen(#SPELL_LICHT,#UNENDLICH,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_IRRLICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,5)
               eintragen(#SPELL_LICHT,4,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERGOLDEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_DING)
               vergolden()
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FALLEN_ZEIGEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               Sound(#SOUND_LAAA)
               faechergrafik()
               x1.w = spieler(akt_spieler)\character_x - akt_power * 2 * get_weaving()
               y1.w = spieler(akt_spieler)\character_y - akt_power * 2 * get_weaving()
               x2.w = spieler(akt_spieler)\character_x + akt_power * 2 * get_weaving()
               y2.w = spieler(akt_spieler)\character_y + akt_power * 2 * get_weaving()
               If x1 < 1
                  x1 = 1
               EndIf
               If y1 < 1
                  y1 = 1
               EndIf
               If x2 > groesse(spieler(akt_spieler)\level)
                  x2 = groesse(spieler(akt_spieler)\level)
               EndIf
               If y2 > groesse(spieler(akt_spieler)\level)
                  y2 = groesse(spieler(akt_spieler)\level)
               EndIf
               For i = x1 To x2
                  For j = y1 To y2
                     If labyrinth(spieler(akt_spieler)\level,i,j)\feld >= #FELD_SPEERFALLE1 And labyrinth(spieler(akt_spieler)\level,i,j)\feld <= #FELD_RUNENFALLE_FLUCH1
                        If Random(99) < 80
                           labyrinth(spieler(akt_spieler)\level,i,j)\feld+9
                        EndIf
                     EndIf
                  Next
               Next
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_EXORZISMUS
        If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
          zug_verlieren()
          mana_verlieren(spell)
          special = erfolgreich(spell)
          If special
            akt_power.w = special * power(spell)
            Sound(#SOUND_LAAA)
            faechergrafik()
            ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
            r.w = akt_power * 2 * get_weaving()
            While monster_list()\z = spieler(akt_spieler)\level
              If monster_list()\x > spieler(akt_spieler)\character_x -r And monster_list()\x < spieler(akt_spieler)\character_x +r And monster_list()\y > spieler(akt_spieler)\character_y -r And monster_list()\y < spieler(akt_spieler)\character_y +r
                If monster(monster_list()\number)\art = #TP_UNDEAD
                   spell_x = monster_list()\x - spieler(akt_spieler)\character_x
                   spell_y = monster_list()\y - spieler(akt_spieler)\character_y
                   Sound(#SOUND_OW)
                   zerstoert(#COLOR_BLAU)
                EndIf
              EndIf
              NextElement(monster_list())
            Wend
            cleanup_monsters()
          EndIf
        Else
          message(194,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_FEUER_BANNEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               Sound(#SOUND_LAAA)
               faechergrafik()
               x1.w = spieler(akt_spieler)\character_x - akt_power * 2 * get_weaving()
               y1.w = spieler(akt_spieler)\character_y - akt_power * 2 * get_weaving()
               x2.w = spieler(akt_spieler)\character_x + akt_power * 2 * get_weaving()
               y2.w = spieler(akt_spieler)\character_y + akt_power * 2 * get_weaving()
               If x1 < 1
                  x1 = 1
               EndIf
               If y1 < 1
                  y1 = 1
               EndIf
               If x2 > groesse(spieler(akt_spieler)\level)
                  x2 = groesse(spieler(akt_spieler)\level)
               EndIf
               If y2 > groesse(spieler(akt_spieler)\level)
                  y2 = groesse(spieler(akt_spieler)\level)
               EndIf
               For i = x1 To x2
                  For j = y1 To y2
                     If labyrinth(spieler(akt_spieler)\level,i,j)\feld = #FELD_FEUER1 Or labyrinth(spieler(akt_spieler)\level,i,j)\feld = #FELD_FEUER2 Or labyrinth(spieler(akt_spieler)\level,i,j)\feld = #FELD_LAGERFEUER
                        cleartile(i,j)
                     EndIf
                  Next
               Next
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FALLEN_ENTFERNEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               Sound(#SOUND_LAAA)
               faechergrafik()
               x1.w = spieler(akt_spieler)\character_x - akt_power * 2 * get_weaving()
               y1.w = spieler(akt_spieler)\character_y - akt_power * 2 * get_weaving()
               x2.w = spieler(akt_spieler)\character_x + akt_power * 2 * get_weaving()
               y2.w = spieler(akt_spieler)\character_y + akt_power * 2 * get_weaving()
               If x1 < 1
                  x1 = 1
               EndIf
               If y1 < 1
                  y1 = 1
               EndIf
               If x2 > groesse(spieler(akt_spieler)\level)
                  x2 = groesse(spieler(akt_spieler)\level)
               EndIf
               If y2 > groesse(spieler(akt_spieler)\level)
                  y2 = groesse(spieler(akt_spieler)\level)
               EndIf
               For i = x1 To x2
                  For j = y1 To y2
                     If labyrinth(spieler(akt_spieler)\level,i, j)\feld >= #FELD_SPEERFALLE1 And labyrinth(spieler(akt_spieler)\level,i,j)\feld <= #FELD_RUNENFALLE_FLUCH2
                        cleartile(i,j)
                     EndIf
                     If labyrinth(spieler(akt_spieler)\level,i, j)\feld = #FELD_NAGELGRUBE
                        cleartile(i,j)
                     EndIf
                  Next
               Next
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_REMOVE_RUNES
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               Sound(#SOUND_LAAA)
               faechergrafik()
               x1.w = spieler(akt_spieler)\character_x - akt_power * 2 * get_weaving()
               y1.w = spieler(akt_spieler)\character_y - akt_power * 2 * get_weaving()
               x2.w = spieler(akt_spieler)\character_x + akt_power * 2 * get_weaving()
               y2.w = spieler(akt_spieler)\character_y + akt_power * 2 * get_weaving()
               If x1 < 1
                  x1 = 1
               EndIf
               If y1 < 1
                  y1 = 1
               EndIf
               If x2 > groesse(spieler(akt_spieler)\level)
                  x2 = groesse(spieler(akt_spieler)\level)
               EndIf
               If y2 > groesse(spieler(akt_spieler)\level)
                  y2 = groesse(spieler(akt_spieler)\level)
               EndIf
               For i = x1 To x2
                  For j = y1 To y2
                     feld.w = labyrinth(spieler(akt_spieler)\level,i, j)\feld
                     If feld = #FELD_RUNE1 Or feld = #FELD_RUNE2 Or feld = #FELD_RUNE3
                        cleartile(i,j)
                     EndIf
                  Next
               Next
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf

      Case #SPELL_SCHUTZSCHILD
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               Sound(#SOUND_DING)
               sternchen(160,160,2)
               akt_dauer.w = spells(spell)\duration * akt_power * get_weaving()
               akt_staerke.w = myRand(3) + akt_power * 2 * get_weaving()
               eintragen(#SPELL_SCHUTZSCHILD,akt_staerke,akt_dauer,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_WEISSER_SCHUTZ
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               Sound(#SOUND_DING)
               sternchen(160,160,2)
               akt_dauer.w = spells(spell)\duration * akt_power * get_weaving()
               akt_staerke.w = myRand(3) + akt_power * 3 * get_weaving()
               eintragen(#SPELL_SCHUTZSCHILD,akt_staerke,akt_dauer,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_BLITZSCHUTZ
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,2)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERSTEINERNSCHUTZ
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,2)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_GIFTSCHUTZ
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,7)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERGIFTUNG_HEILEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HOLY)
               For j = 1 To 5
                  For i = 1 To 4
                      laby_screen2()
                     ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                     DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
                     end_screen()
                     Delay(70)
                  Next
               Next
               spieler(akt_spieler)\poison = 0
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf

      Case #SPELL_HEILE_KRANKHEIT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HOLY)
               For j = 1 To 5
                  For i = 1 To 4
                     laby_screen2()
                     ClipSprite(#SPRITE_TILESET_ANIMATIONEN, i*40-40, 1, 39, 39)
                     DisplayTransparentSprite(#SPRITE_TILESET_ANIMATIONEN, 156, 156)
                     end_screen()
                     Delay(delay_animation2)
                  Next
               Next
               spieler(akt_spieler)\krankheit = 0
               spieler(akt_spieler)\krankheitdauer = 0
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ERDSTAERKE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_DING)
               sternchen(160,160,2)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_TERMINUS
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_DING)
               sternchen(160,160,2)
               For i = 1 To #ACTIVE_SLOTS
                  If aktive(i,akt_spieler)\dauer > 0 And aktive(i,akt_spieler)\dauer <> #UNENDLICH
                     spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana + 1
                     aktive(i,akt_spieler)\nr = 0
                     aktive(i,akt_spieler)\staerke = 0
                     aktive(i,akt_spieler)\dauer = 0
                  EndIf
               Next
               If spieler(akt_spieler)\Mana > maxmana()
                  spieler(akt_spieler)\Mana = maxmana()
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_MAGISCHE_FLAMME
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,5)
               eintragen(#SPELL_LICHT,4,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_STERNENLICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
	       power.w = spells(spell)\duration * special * power(spell) * get_weaving()
               Sound(#SOUND_FLAME)
               sternchen(160,160,5)
               eintragen(#SPELL_LICHT,4,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_MAGIESCHUTZ
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
	       power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,6)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SCHUTZ_VOR_GESCHOSSEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
	       power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,6)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_HEXENSICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
	       power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,6)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERLAENGERN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell) * get_weaving()
               Sound(#SOUND_SUCCESS)
               sternchen(160,160,6)
               For i = 1 To #ACTIVE_SLOTS
                  If aktive(i,akt_spieler)\dauer > 0
                     new_duration.l = aktive(i,akt_spieler)\dauer+akt_power
                     If new_duration > 30000
                       new_duration = 30000
                     EndIf
                     aktive(i,akt_spieler)\dauer = new_duration
                  EndIf
               Next
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERSCHWINDEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_WIND)
               sternchen(160,160,4)
               Repeat
                  neux=Random(groesse(spieler(akt_spieler)\level)-3)+2
                  neuy=Random(groesse(spieler(akt_spieler)\level)-3)+2
               Until labyrinth(spieler(akt_spieler)\level,neux,neuy)\feld=inhalt(spieler(akt_spieler)\level)
               spieler(akt_spieler)\character_x = neux
               spieler(akt_spieler)\character_y = neuy
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FALLENSINN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
	       power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_HARP)
               sternchen(160,160,5)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ERDE_SPUEREN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HARP)
               show_automap(4)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_STERNENSICHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HARP)
               show_automap(3)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_NEXUS_FINDEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HARP)
               show_automap(5)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SANKTUM_FINDEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_HARP)
               show_automap(6)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_MAGIC_APPLE
         If magic_apple(akt_spieler,spieler(akt_spieler)\level) > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  magic_apple(akt_spieler,spieler(akt_spieler)\level) - 1
                  Sound(#SOUND_CHAOS)
                  sternchen(160,160,6)
                  in_rucksack(#OBJGRAFIK_APFEL_GRUEN,1)
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         Else
            message(45,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ZAUBERSCHWERT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_CHAOS)
               sternchen(160,160,6)
               in_rucksack(#OBJGRAFIK_ZAUBERSCHWERT2,1)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ZAUBERSCHILD
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_CHAOS)
               For i = 1 To 8
                   laby_screen2()
                  ClipSprite(#SPRITE_TILESET_FX, i*31-31, 2*31, 31, 31)
                  DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                  end_screen()
                  Delay(delay_animation2)
               Next
               For i = 1 To 8
                   laby_screen2()
                  ClipSprite(#SPRITE_TILESET_FX, i*31-31, 3*31, 31, 31)
                  DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                  end_screen()
                  Delay(delay_animation2)
               Next
               in_rucksack(#OBJGRAFIK_REGENBOGENSCHILD,1)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ZAUBERPFEILE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_CHAOS)
               sternchen(160,160,6)
               in_rucksack(#OBJGRAFIK_KOECHER,1)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ZAUBERRUESTUNG
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_CHAOS)
               sternchen(160,160,6)
               in_rucksack(#OBJGRAFIK_ZAUBERRUESTUNG1,1)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ZAUBERBOGEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_CHAOS)
               sternchen(160,160,6)
               in_rucksack(#OBJGRAFIK_ZAUBERBOGEN,1)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FLIEGENDER_BESEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_CHAOS)
               sternchen(160,160,6)
               in_rucksack(#OBJGRAFIK_BESEN,1)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ERFRISCHUNG
         If refresh(akt_spieler,spieler(akt_spieler)\level) > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  refresh(akt_spieler,spieler(akt_spieler)\level) - 1
                  Sound(#SOUND_GULP)
                  For i = 1 To 8
                      laby_screen2()
                     ClipSprite(#SPRITE_TILESET_FX, i*31-31, 10*31+9, 31, 31)
                     DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                     end_screen()
                     Delay(delay_animation2)
                  Next
                  For i = 1 To 8
                      laby_screen2()
                     ClipSprite(#SPRITE_TILESET_FX, i*31-31, 11*31+9, 31, 31)
                     DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                     end_screen()
                     Delay(delay_animation2)
                  Next
                  spieler(akt_spieler)\Durst = spieler(akt_spieler)\Durst - 60
                  If spieler(akt_spieler)\Durst < 1
                     spieler(akt_spieler)\Durst = 0
                  EndIf
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         Else
            message(45,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_LIED_DES_SCHUTZES
         zug_verlieren()
         Sound(#SOUND_SUCCESS)
         sternchen(156,156,5)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
         
      Case #SPELL_LIED_DES_SCHLAFES
         zug_verlieren()
         Sound(#SOUND_SUCCESS)
         sternchen(156,156,5)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DES_SELBSTMORDS
         zug_verlieren()
         Sound(#SOUND_SUCCESS)
         sternchen(156,156,5)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DES_REICHTUMS
         zug_verlieren()
         Sound(#SOUND_SUCCESS)
         sternchen(156,156,5)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DER_REISE
         zug_verlieren()
         Sound(#SOUND_WIND)
         sternchen(160,160,5)
         stop_songs()
         eintragen(#SPELL_RUECKENWIND,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DES_KAMPFES
         zug_verlieren()
         Sound(#SOUND_HARP)
         sternchen(160,160,1)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DER_HOFFNUNG
         zug_verlieren()
         Sound(#SOUND_HARP)
         sternchen(160,160,1)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DER_EINSAMKEIT
         zug_verlieren()
         Sound(#SOUND_HARP)
         sternchen(160,160,1)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DES_TODES
         zug_verlieren()
         Sound(#SOUND_HARP)
         sternchen(160,160,1)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DER_MAGIE
         zug_verlieren()
         Sound(#SOUND_HARP)
         sternchen(160,160,1)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_LIED_DES_LEBENS
         zug_verlieren()
         Sound(#SOUND_HARP)
         sternchen(160,160,1)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_GEISTERTANZ
         zug_verlieren()
         Sound(#SOUND_HARP)
         sternchen(160,160,1)
         stop_songs()
         eintragen(spell,1,#UNENDLICH,#UNENDLICH)
      
      Case #SPELL_RUECKENWIND
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_WIND)
               sternchen(160,160,5)
               eintragen(spell,3,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_1000_KLINGEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_EVASION)
               sternchen(160,160,5)
               akt_power.w = special * power(spell)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FLIEGEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_WIND)
               sternchen(160,160,5)
               akt_power.w = special * power(spell)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_UEBERS_WASSER_GEHEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               akt_power.w = special * power(spell)
               power.w = spells(spell)\duration * akt_power * get_weaving()
               Sound(#SOUND_WIND)
               sternchen(160,160,5)
               akt_power.w = special * power(spell)
               eintragen(spell,akt_power,power,0)
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_TOTENGOLD
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  ; zaubern!
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_CHAOS)
                     For j = 1 To 2
                        For i = 1 To 8
                           laby_screen2()
                           ClipSprite(#SPRITE_TILESET_FX, i*31-31, 6*31+4, 31, 31)
                           DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                           end_screen()
                           Delay(delay_animation2)
                        Next
                     Next
                     testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                     If testfeld = #FELD_WASSER_SKELETT
                     setlaby(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level,#FELD_WASSER_GOLDSACK,0,0)
                     ElseIf istknochen(testfeld) = 1
                     setlaby(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level,#FELD_GOLD,0,0)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_TIERE_BANNEN
        banish_monster(spell, 1)
      
      Case #SPELL_UNTOTE_BANNEN
        banish_monster(spell, 3)
      
      Case #SPELL_GEISTER_BANNEN
        banish_monster(spell, 10)
      
      Case #SPELL_PFLANZE_ZERSTOEREN
        banish_monster(spell, 4)
      
      Case #SPELL_DESTROY_GOLEM
        banish_monster(spell, 9)

      Case #SPELL_DIG_TREASURE
        spell_x = 0
        spell_y = 0
        destination = select_field()   ; gibt spell_x und spell_y zurueck
        If destination = 1
            blocked = 0
            los(0)            ; gibt blocked zurueck
            If blocked = 0
               If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
                  zug_verlieren()
                  ; zaubern!
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                  ; Vergrabener Schatz?
                  Dig_Treasure(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level)
                  EndIf ; success
               Else
                  message(194,#COLOR_BLAU)
               EndIf
            Else
               message(233,#COLOR_ROT)
            EndIf
        EndIf
      
      Case #SPELL_DESTROY_RUNE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  ; zaubern!
                  special = erfolgreich(spell)
                  If special
                     testfeld = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                     If  testfeld = #FELD_RUNE1 Or testfeld = #FELD_RUNE2 Or testfeld = #FELD_RUNE3
                        mana_verlieren(spell)
                        Sound(#SOUND_CHAOS)
                        sternchen(160+spell_x*32,160+spell_y*32,3)
                        message(881,#COLOR_BLAU)
                        cleartile(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     Else
                        message(882,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      
      
      Case #SPELL_FREEZE_WATER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  ; zaubern!
                  special = erfolgreich(spell)
                  If special
                     testfeld = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                     If  testfeld = #FELD_WASSER Or testfeld = #FELD_WASSERMONSTER
                        mana_verlieren(spell)
                        sternchen(160+spell_x*32,160+spell_y*32,3)
                        If  testfeld = #FELD_WASSER
                           setlaby(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level,#FELD_SCHNEE,0,0)
                              Sound(#SOUND_CHAOS)
                        EndIf
                        If  testfeld = #FELD_WASSERMONSTER
                           zaehl.w = 1
                           Repeat
                              egon.w = Random(#ANZ_MONSTER2-1) + 1
                              zaehl = zaehl + 1
                           Until has_trait2(egon,#ME_WASSER) = 1 Or zaehl > 500
                           If zaehl > 500
                              egon = 1
                           EndIf
                           xmod_save.w = xmod
                           ymod_save.w = ymod
                           xmod = spell_x
                           ymod = spell_y
                           aufstehen2(monster(egon)\nr)
                           setmonster(spieler(akt_spieler)\character_x+xmod,spieler(akt_spieler)\character_y+ymod,spieler(akt_spieler)\level,egon,monster(egon)\nr,monster(egon)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)
                           xmod = xmod_save
                           ymod = ymod_save
                           Sound(#SOUND_SPLASH)
                        EndIf
                        
                     Else
                        message(952,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERDORREN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  ; zaubern!
                  special = erfolgreich(spell)
                  If special
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        mana_verlieren(spell)
                        Sound(#SOUND_CHAOS)
                        sternchen(160+spell_x*32,160+spell_y*32,3)
                        i = monster_list()\hp / 2
                        If i
                           monster_list()\hp = i
                        Else
                           zerstoert(#COLOR_BLAU, 0)
                           cleanup_monsters()
                        EndIf
                     Else
                        message(600,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_DIMENSIONENTAUSCH
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  ; zaubern!
                  special = erfolgreich(spell)
                  If special
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        act_monster.monster_pointer\p = @monster_list()
                        mana_verlieren(spell)
                        Sound(#SOUND_WIND)
                        
                        laby_screen()
                        For i = 1 To 8
                           laby_screen2()
                           ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
                           DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                           ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
                           DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                           end_screen()
                           Delay(delay_animation2)
                        Next
                        For i = 1 To 8
                           laby_screen2()
                           ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
                           DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                           ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
                           DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                           end_screen()
                           Delay(delay_animation2)
                        Next
                        
                        If getmonster(spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)
                        ;just in case player stands ON a monster (sneaking)
                        monster_list()\x = spieler(akt_spieler)\character_x + spell_x
                        monster_list()\y = spieler(akt_spieler)\character_y + spell_y
                        EndIf
                        act_monster\p\x = spieler(akt_spieler)\character_x
                        act_monster\p\y = spieler(akt_spieler)\character_y
                        
                        spieler(akt_spieler)\character_x = spieler(akt_spieler)\character_x + spell_x
                        spieler(akt_spieler)\character_y = spieler(akt_spieler)\character_y + spell_y
                        
                        laby_screen()
                     Else
                        message(600,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_WASSER_STEHLEN
        If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
          spell_x = 0
          spell_y = 0
          destination = select_field()   ; gibt spell_x und spell_y zurueck
          If destination = 1
            blocked = 0
            los()            ; gibt blocked zurueck
            If blocked = 0
               zug_verlieren()
               ; zaubern!
               special = erfolgreich(spell)
               If special
               mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               If mon_no
                  If monster(mon_no)\art = #TP_PLANT
                     mana_verlieren(spell)
                     Sound(#SOUND_SPLASH)
                     sternchen(160+spell_x*32,160+spell_y*32,3)
                     ; Schaden
                     schaden.w = myRand(special * power(spell) + 1) + 1
                     schaden = schaden * get_weaving()
                     If dispelled() = 1
                     message(312,#COLOR_BLAU)
                     Else
                     monsterschaden(schaden)
                     cleanup_monsters()
                     spieler(akt_spieler)\durst = spieler(akt_spieler)\durst - (schaden * 2)
                     If spieler(akt_spieler)\durst < 1
                        spieler(akt_spieler)\durst = 0
                     EndIf
                     EndIf
                  Else
                     message(601,#COLOR_BLAU)
                  EndIf
               Else
                  message(600,#COLOR_BLAU)
               EndIf
               EndIf
            Else
               message(233,#COLOR_BLAU)
            EndIf
          EndIf
        Else
          message(194,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_WEGBLASEN
        If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
          spell_x = 0
          spell_y = 0
          destination = select_field()   ; gibt spell_x und spell_y zurueck
          If destination = 1
            blocked = 0
            los()            ; gibt blocked zurueck
            If blocked = 0
               zug_verlieren()
               ; zaubern!
               special = erfolgreich(spell)
               If special
               mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               act_monster.monster_pointer\p = @monster_list()
               If mon_no
                  monsterart.w = monster(mon_no)\art
                  If monsterart <> 4 And monsterart <> 7 And monsterart <> 10
                     If immune(#ME_WINDFEST) = 0
                     mana_verlieren(spell)
                     Sound(#SOUND_WIND)
                     sternchen(160+spell_x*32,160+spell_y*32,3)
                     zaehler.w = 1
                     Repeat
                        x.w=Random(groesse(spieler(akt_spieler)\level)-3)+2
                        y.w=Random(groesse(spieler(akt_spieler)\level)-3)+2
                        zaehler = zaehler + 1
                     Until labyrinth(spieler(akt_spieler)\level,x,y)\feld=inhalt(spieler(akt_spieler)\level) Or zaehler > 500
                     If zaehler <= 500
                        act_monster\p\x = x
                        act_monster\p\y = y
                     EndIf
                     Else
                     message(834,#COLOR_BLAU)
                     EndIf
                  Else
                     message(611,#COLOR_BLAU)
                  EndIf
               Else
                  message(600,#COLOR_BLAU)
               EndIf
               EndIf
            Else
               message(233,#COLOR_BLAU)
            EndIf
          EndIf
        Else
          message(194,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_MIT_TIEREN_REDEN
        If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
          spell_x = 0
          spell_y = 0
          destination = select_field()   ; gibt spell_x und spell_y zurueck
          If destination = 1
            blocked = 0
            los()            ; gibt blocked zurueck
            If blocked = 0
               zug_verlieren()
               ; zaubern!
               special = erfolgreich(spell)
               If special
               mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               If mon_no
                  If monster(mon_no)\art = #TP_ANIMAL
                     mana_verlieren(spell)
                     Sound(#SOUND_CHAOS)
                     sternchen(160+spell_x*32,160+spell_y*32,3)
                     If monster_list()\status = #MONSTERSTATUS_ALERT
                     message(599,#COLOR_BLAU)
                     Else
                     If Random(100)+3*special * power(spell) > (45 + spieler(akt_spieler)\level)
                        monster_list()\status = #MONSTERSTATUS_FREUND
                        message(603,#COLOR_BLAU)
                        show_automap(7)
                     Else
                        monster_list()\status = #MONSTERSTATUS_ALERT
                        message(599,#COLOR_BLAU)
                     EndIf
                     EndIf
                  Else
                     message(189,#COLOR_BLAU)
                  EndIf
               Else
                  message(600,#COLOR_BLAU)
               EndIf
               EndIf
            Else
               message(233,#COLOR_BLAU)
            EndIf
          EndIf
        Else
          message(194,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_NEXUS
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  ; zaubern!
                  special = erfolgreich(spell)
                  If special
                     tile.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                     If is_floor(tile)
                        If nexus(spieler(akt_spieler)\level)
                           nexus(spieler(akt_spieler)\level) - 1
                           mana_verlieren(spell)
                           Sound(#SOUND_CHAOS)
                           sternchen(160+spell_x*32,160+spell_y*32,3)
                           setlaby(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level,#FELD_NEXUS,2,tile)
                        Else
                           message(49,#COLOR_BLAU)
                        EndIf
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ANKER_ERSCHAFFEN
         If sonderlevel(spieler(akt_spieler)\level) <> #LM_TELEPORTSPERRE
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
                ; Feld leer?
                If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld = inhalt(spieler(akt_spieler)\level)
                  zug_verlieren()
                  ; zaubern!
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                      Sound(#SOUND_CHAOS)
                      sternchen(160,160,3)
                      setlaby(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_ANKER_ZIEL,0,0)
                      spieler(akt_spieler)\anker_x = spieler(akt_spieler)\character_x
                      spieler(akt_spieler)\anker_y = spieler(akt_spieler)\character_y
                      spieler(akt_spieler)\anker_level = spieler(akt_spieler)\level
                  EndIf
                Else
                  message(632,#COLOR_BLAU)
                EndIf
            Else
                message(194,#COLOR_BLAU)
            EndIf
         Else
             message(815,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_REGEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               Sound(#SOUND_SPLASH)
               sternchen(160,160,3)
               For i = 1 To power(spell) * 5 * get_weaving()
                  zaehler.w = 1
                  Repeat
                     x.w=Random(groesse(spieler(akt_spieler)\level)-3)+2
                     y.w=Random(groesse(spieler(akt_spieler)\level)-3)+2
                     zaehler = zaehler + 1
                  Until labyrinth(spieler(akt_spieler)\level,x,y)\feld=inhalt(spieler(akt_spieler)\level) Or zaehler > 2000
                  If zaehler <= 2000
                     setlaby(x, y,spieler(akt_spieler)\level,#FELD_RINNSAAL,0,0)
                  EndIf
               Next
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_WORT_DES_TODES
        banish_monster(spell, 2)
      
      Case #SPELL_VACUUM
        If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
          spell_x = 0
          spell_y = 0
          destination = select_field()   ; gibt spell_x und spell_y zurueck
          If destination = 1
            blocked = 0
            los()            ; gibt blocked zurueck
            If blocked = 0
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
               mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               act_monster.monster_pointer\p = @monster_list()
               If mon_no
                  If dispelled() = 1
                     message(312,#COLOR_BLAU)
                  Else
                     testwert.w = monster(mon_no)\art
                     If testwert <> 3 And testwert <> 7 And testwert <> 9 And testwert <> 10
                     Sound(#SOUND_WIND)
                     For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 0, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                        end_screen()
                        Delay(delay_animation2)
                     Next
                     For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 31, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                        end_screen()
                        Delay(delay_animation2)
                     Next
                     ChangeCurrentElement(monster_list(), act_monster\p)
                     zerstoert(#COLOR_BLAU, 0)
                     cleanup_monsters()
                     Else
                     message(503,#COLOR_BLAU)
                     EndIf
                  EndIf
               EndIf
               EndIf
            Else
               message(233,#COLOR_BLAU)
            EndIf
          EndIf
        Else
          message(194,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_VERSTEINERN
        If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
          spell_x = 0
          spell_y = 0
          destination = select_field()   ; gibt spell_x und spell_y zurueck
          If destination = 1
            blocked = 0
            los()            ; gibt blocked zurueck
            If blocked = 0
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
               mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               act_monster.monster_pointer\p = @monster_list()
               If mon_no
                  If dispelled() = 1
                     message(312,#COLOR_BLAU)
                  Else
                     If immune(#ME_STEINFEST) = 0
                     Sound(#SOUND_CHAOS)
                     versteinern()
                     ChangeCurrentElement(monster_list(), act_monster\p)
                     zerstoert(#COLOR_BLAU, 1)
                     cleanup_monsters()
                     Else
                     message(266,#COLOR_BLAU)
                     EndIf
                  EndIf
               EndIf
               EndIf
            EndIf
          EndIf
        Else
          message(194,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_EWIGER_WINTER
        If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
          spell_x = 0
          spell_y = 0
          destination = select_field()   ; gibt spell_x und spell_y zurueck
          If destination = 1
            blocked = 0
            los()            ; gibt blocked zurueck
            If blocked = 0
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
               mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               act_monster.monster_pointer\p = @monster_list()
               If mon_no
                  If dispelled() = 1
                     message(312,#COLOR_BLAU)
                  Else
                     If immune(#ME_EISFEST) = 0
                     Sound(#SOUND_CHAOS)
                     sternchen(160+spell_x*32,160+spell_y*32,7)
                     ChangeCurrentElement(monster_list(), act_monster\p)
                     zerstoert(#COLOR_BLAU, 1)
                     cleanup_monsters()
                     Else
                     message(267,#COLOR_BLAU)
                     EndIf
                  EndIf
               EndIf
               EndIf
            Else
               message(233,#COLOR_BLAU)
            EndIf
          EndIf
        Else
          message(194,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_FALLE_ZERSTOEREN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld >= #FELD_SPEERFALLE2 And labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld <= #FELD_RUNENFALLE_FLUCH2
                        Sound(#SOUND_SUCCESS)
                        sternchen(160+spell_x*32,160+spell_y*32,3)
                        cleartile(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     EndIf
                     If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NAGELGRUBE
                        Sound(#SOUND_SUCCESS)
                        sternchen(160+spell_x*32,160+spell_y*32,3)
                        cleartile(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_GIFT_NEUTRALISIEREN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     count.w = power(spell) * special * get_weaving()
                     limit.w = min(3 * count -1,160)
                     Sound(#SOUND_SUCCESS)
                     ;sternchen(160+spell_x*32,160+spell_y*32,3)
                     For i = 0 to limit
                        x.w = spieler(akt_spieler)\character_x + spell_x + neighbour(i)\x
                        y.w = spieler(akt_spieler)\character_y + spell_y + neighbour(i)\y
                        If x > 0 And y > 0 And x <= groesse(spieler(akt_spieler)\level)  And y <= groesse(spieler(akt_spieler)\level)
                           ;setlaby(x,y,spieler(akt_spieler)\level,#FELD_SAND1,0,0)
                           If labyrinth(spieler(akt_spieler)\level,x,y)\feld = #FELD_GIFTIG
                              floor.w = labyrinth(spieler(akt_spieler)\level,x,y)\stat2
                              setlaby(x,y,spieler(akt_spieler)\level,floor,0,0)
                              count - 1
                              If count = 0
                                Break
                              EndIf
                           EndIf
                        EndIf
                     Next
                  EndIf
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VERHEXEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     act_monster.monster_pointer\p = @monster_list()
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           If has_trait2(mon_no, #ME_CHARM) = 1
                              Sound(#SOUND_CHAOS)
                              sternchen(160+spell_x*32,160+spell_y*32,3)
                              act_monster\p\status = #MONSTERSTATUS_FREUND
                           Else
                              message(200,#COLOR_BLAU)
                           EndIf
                        EndIf
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_MONSTERAUGE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               monsterauge = 1
               monsterlore()
               monsterauge = 0
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_PORTAL
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               If sonderlevel(spieler(akt_spieler)\level) <> #LM_UNZERSTOERBARE_WAENDE
               If portal(spieler(akt_spieler)\level)
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\stat1 = 1
                     message(334,#COLOR_BLAU)
                  Else
                     zug_verlieren()
                     If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = mit_was(spieler(akt_spieler)\level) Or labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_GEHEIMGANG
                        mana_verlieren(spell)
                        special = erfolgreich(spell)
                        If special
                           Sound(#SOUND_EARTH)
                           sternchen(160+spell_x*32,160+spell_y*32,4)
                           cleartile(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                           portal(spieler(akt_spieler)\level) -1  ; Nur einmal pro Ebene
                        EndIf
                     Else  ; Mauer ?
                        message(264,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(49,#COLOR_BLAU)
               EndIf
               Else
                  message(812,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_STEIN_ZERSTOEREN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_FELSBROCKEN
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  sternchen(160+spell_x*32,160+spell_y*32,4)
                  Destroy_Boulder(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level)
                  message(247,#COLOR_WEISS)
               EndIf
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FEDERFALL
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               sternchen(160,160,6)
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld = #FELD_SCHACHT Or test = 1
                  Sound(#SOUND_WIND)
                  message(193,#COLOR_BLAU)
                  If spieler(akt_spieler)\level+1 > spieler(akt_spieler)\maxlevel
                     aufsteigen()
                  EndIf
                  neuer_level()
                  naechster()
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_DUNKLES_MANA
         zug_verlieren()
         special = erfolgreich(spell)
         If special
            testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld
            If istknochen(testfeld) = 1
               Sound(#SOUND_DARKNESS)
               For j = 1 To 2
                  For i = 1 To 8
                     laby_screen2()
                     ClipSprite(#SPRITE_TILESET_FX, i*31-31, 6*31+4, 31, 31)
                     DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                     end_screen()
                     Delay(delay_animation2)
                  Next
               Next
               gesetzt.w = 0
               If testfeld = #FELD_WIESE_SKELETT
                  gesetzt = 1
                  setlaby(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_GRAS,0,0)
               EndIf
               If testfeld = #FELD_WASSER_SKELETT
                  gesetzt = 1
                  setlaby(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y,spieler(akt_spieler)\level,#FELD_WASSER,0,0)
               EndIf
               If gesetzt = 0
                  cleartile(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)
               EndIf
               spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana + special * max(3,myRand(power(spell) / 2))
               If spieler(akt_spieler)\Mana > maxmana()
                  spieler(akt_spieler)\Mana = maxmana()
               EndIf
            Else
                message(182,#COLOR_BLAU)
            EndIf
         EndIf
      
      Case #SPELL_DUNKLER_SOG
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     schaden_min.w = special * power(spell)
                     Sound(#SOUND_DARKNESS)
                     sog()
                     ; Schaden
                     schaden = (myRand(schaden_min) + schaden_min)  * get_weaving()
                     hydra_zauber(schaden)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        art.w = monster(mon_no)\art
                        If art <> 3 And art <> 9 And art <> 10
                           spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + schaden
                           If spieler(akt_spieler)\Lifepoints > maxlife()
                              spieler(akt_spieler)\Lifepoints = maxlife()
                           EndIf
                           monsterschaden(schaden)
                        Else
                           message(735,#COLOR_BLAU)
                        EndIf
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FUNKE
          angriffsspruch(spell, 1, #SOUND_FLAME, 1)
      
      Case #SPELL_DRACHENFEUER
         angriffsspruch(spell, 3, #SOUND_FLAME2, 1)
      
      Case #SPELL_VERGIFTEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     duration.w = (special * power(spell) * spells(spell)\duration * get_weaving())+5
                     Sound(#SOUND_OW)
                     animate_projectile(10)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           If duration > 99
                              duration = 99
                           EndIf
                           monster_list()\status = #MONSTERSTATUS_VERGIFTET
                           monster_list()\duration = duration
                        EndIf
                     Else
                        message(600,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_BLENDEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     duration.w = (special * power(spell) * spells(spell)\duration * get_weaving())
                     Sound(#SOUND_OW)
                     animate_projectile(2)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           If duration > 99
                              duration = 99
                           EndIf
                           monster_list()\status = #MONSTERSTATUS_BLIND
                           monster_list()\duration = duration
                        EndIf
                     Else
                        message(600,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SCHLAF
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_DARKNESS)
                     sternchen(160 + spell_x * 32, 160 + spell_y * 32, 6)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           If has_trait2(mon_no,#ME_SCHLAEFT) = 0
                              message(480,#COLOR_BLAU)
                           Else
                              monster_list()\status = #MONSTERSTATUS_SCHLAEFT
                           EndIf
                        EndIf
                     Else
                        message(600,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SCHWARM
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     duration.w = special * power(spell) * get_weaving()
                     Sound(#SOUND_DARKNESS)
                     sternchen(160 + spell_x * 32, 160 + spell_y * 32, 6)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           If duration > 99
                              duration = 99
                           EndIf 
                           ;print("swarmed: "+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))

                           monster_list()\status = #MONSTERSTATUS_SCHWARM
                           monster_list()\duration = duration
                        EndIf
                     Else
                        message(600,#COLOR_BLAU)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_TELEKINESIS
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_WIND)
                     
                     testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                     If testfeld = #FELD_GOLD
                        gold(spieler(akt_spieler)\character_x + spell_x,spieler(akt_spieler)\character_y + spell_y)
                     EndIf
                     If testfeld = #FELD_TRUHE Or testfeld = #FELD_WASSER_TRUHE Or testfeld = #FELD_WIESE_TRUHE
                        chest(spieler(akt_spieler)\character_x + spell_x,spieler(akt_spieler)\character_y + spell_y)
                     EndIf
                     If testfeld = #FELD_GRUENETRUHE2 Or testfeld = #FELD_WIESE_GRUENETRUHE2 Or testfeld = #FELD_WASSER_GRUENE_TRUHE
                        chest(spieler(akt_spieler)\character_x + spell_x,spieler(akt_spieler)\character_y + spell_y)
                     EndIf
                     If laby_item(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\name[spieler(akt_spieler)\level] > 0
                        objekt(spieler(akt_spieler)\character_x + spell_x,spieler(akt_spieler)\character_y + spell_y)
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FLAMEBURST
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  Sound(#SOUND_FLAME2)
                  If spell_x > 0
                     x_diff.w = 1
                     y_diff.w = 0
                  ElseIf spell_x < 0
                     x_diff.w = -1
                     y_diff.w = 0
                  ElseIf spell_y > 0
                     x_diff.w = 0
                     y_diff.w = 1
                  Else
                     x_diff.w = 0
                     y_diff.w = -1
                  EndIf
                  ;draw flames
                  For i = 1 To 5
                     draw_tile(#FELD_FEUER3,#HALF_MATRIX_SIZE+i*x_diff,#HALF_MATRIX_SIZE+i*y_diff, 1, 1, -1)
                  Next
                  end_screen()
                  Delay(delay_animation)
                  laby_screen()
                  ; Schaden
                  schaden.w = damage(spell, special)
                  hydra_zauber(schaden)
                  For i = 1 To 5
                     schaden = damage(spell, special)
                     spell_x = i*x_diff
                     spell_y = i*y_diff
                     feuerschaden(schaden)
                  Next
                  cleanup_monsters()
               EndIf
               Else
               message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FIREBALL
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     schaden.w = damage(spell, special)
                     Sound(#SOUND_FLAME2)
                     animate_projectile(3)
                     ; Zielbereich mit Flammen fuellen
                     For y=spell_y-1+#HALF_MATRIX_SIZE To spell_y+1+#HALF_MATRIX_SIZE
                        For x=spell_x-1+#HALF_MATRIX_SIZE To spell_x+1+#HALF_MATRIX_SIZE
                           draw_tile(#FELD_FEUER3, x, y, 1, 1, -1)
                        Next
                     Next
                     Sound(#SOUND_FIREBALL)
                     end_screen()
                     Delay(delay_animation)
                     laby_screen()
                     hydra_zauber(schaden)
                     For zaehl = 1 To 9
                        Select (zaehl)
                           Case 2: spell_x = spell_x - 1
                                 spell_y = spell_y - 1
                           Case 3: spell_x = spell_x + 1
                           Case 4: spell_x = spell_x + 1
                           Case 5: spell_y = spell_y + 1
                                 spell_x = spell_x - 2
                           Case 6: spell_x = spell_x + 2
                           Case 7: spell_y = spell_y + 1
                                 spell_x = spell_x - 2
                           Case 8: spell_x = spell_x + 1
                           Case 9: spell_x = spell_x + 1
                        EndSelect
                        feuerschaden(schaden)
                     Next
                     cleanup_monsters()
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_METEOR
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  schaden.w = damage(spell, special)
                  Sound(#SOUND_CANNON2)
                  ; Zielbereich mit Felsen fuellen
                  For y=spell_y-1+#HALF_MATRIX_SIZE To spell_y+1+#HALF_MATRIX_SIZE
                     For x=spell_x-1+#HALF_MATRIX_SIZE To spell_x+1+#HALF_MATRIX_SIZE
                        draw_tile(#FELD_FELSBROCKEN, x, y, 1, 1, -1)
                     Next
                  Next
                  end_screen()
                  Delay(delay_animation)
                  laby_screen()
                  hydra_zauber(schaden)
                  For zaehl = 1 To 9
                     Select (zaehl)
                        Case 2: spell_x = spell_x - 1
                              spell_y = spell_y - 1
                        Case 3: spell_x = spell_x + 1
                        Case 4: spell_x = spell_x + 1
                        Case 5: spell_y = spell_y + 1
                              spell_x = spell_x - 2
                        Case 6: spell_x = spell_x + 2
                        Case 7: spell_y = spell_y + 1
                              spell_x = spell_x - 2
                        Case 8: spell_x = spell_x + 1
                        Case 9: spell_x = spell_x + 1
                     EndSelect
                     feuerschaden(schaden)
                  Next
                  cleanup_monsters()
               EndIf
             EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_TODESWOLKE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
            special.w = special * power(spell)
                  Sound(#SOUND_HOWL)
                  ; Zielbereich mit Skeletten fuellen
                  For y=spell_y-1+#HALF_MATRIX_SIZE To spell_y+1+#HALF_MATRIX_SIZE
                     For x=spell_x-1+#HALF_MATRIX_SIZE To spell_x+1+#HALF_MATRIX_SIZE
                        draw_tile(#FELD_SKELETT, x, y, 1, 1, -1)
                     Next
                  Next
                  end_screen()
                  Delay(delay_animation)
                  laby_screen()
                  ; Schaden
                  For zaehl = 1 To 9
                     Select (zaehl)
                        Case 2: spell_x = spell_x - 1
                              spell_y = spell_y - 1
                        Case 3: spell_x = spell_x + 1
                        Case 4: spell_x = spell_x + 1
                        Case 5: spell_y = spell_y + 1
                              spell_x = spell_x - 2
                        Case 6: spell_x = spell_x + 2
                        Case 7: spell_y = spell_y + 1
                              spell_x = spell_x - 2
                        Case 8: spell_x = spell_x + 1
                        Case 9: spell_x = spell_x + 1
                     EndSelect
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        ; Roten Fleck darstellen
                        ClipSprite(#SPRITE_TILESET_PROJEKTILE, 0*32, 7*32, 32, 32)
                        DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+ spell_x*32, 160 + spell_y*32)
                        If monster_list()\hp < special * 3 * get_weaving()
                           zerstoert(#COLOR_BLAU, 0)
                        EndIf
                     EndIf
                  Next
                  cleanup_monsters()
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FEUERSCHLAG
         angriffsspruch(spell, 3, #SOUND_FLAME, 1)
      
      Case #SPELL_MENTALSCHLAG
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     special = special * power(spell)
                     schaden.w = myRand(special*2) + special
                     Sound(#SOUND_FLAME)
                     For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 0, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                        end_screen()
                        Delay(delay_animation2)
                     Next
                     For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 31, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                        end_screen()
                        Delay(delay_animation2)
                     Next
                     ; Schaden
                     schaden = schaden * get_weaving() 
                     hydra_zauber(schaden)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           monsterschaden(schaden)
                           cleanup_monsters()
                        EndIf
                     EndIf
                  EndIf
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_DESINTEGRATION
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_FLAME)
                     For j = 1 To 3
                        For i = 1 To 8
                           laby_screen2()
                           ClipSprite(#SPRITE_TILESET_FX, i*31-31, 7*31+4, 31, 31)
                           DisplayTransparentSprite(#SPRITE_TILESET_FX, 160+spell_x*32, 160+spell_y*32)
                           end_screen()
                           Delay(delay_animation2)
                        Next
                     Next
                     ; Schaden
                     schaden.w = damage(spell, special)
                     hydra.w = hydra_zauber(schaden)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                           mon_no = -1
                        Else
                           If immune(#ME_BLITZEFEST) = 1
                              message(329,#COLOR_BLAU)
                           Else
                              zerstoert(#COLOR_BLAU, 1)
                              cleanup_monsters()
                           EndIf
                        EndIf
                     EndIf
                     If mon_no <> -1 ;was not dispelled
                        testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x+spell_x, spieler(akt_spieler)\character_y+spell_y)\feld
                        setitem(spieler(akt_spieler)\character_x+spell_x, spieler(akt_spieler)\character_y+spell_y,spieler(akt_spieler)\level,0,0,0)
                        If is_waterfield(spieler(akt_spieler)\character_x+spell_x, spieler(akt_spieler)\character_y+spell_y)
                           setlaby(spieler(akt_spieler)\character_x+spell_x, spieler(akt_spieler)\character_y+spell_y,spieler(akt_spieler)\level,#FELD_WASSER,0,0)
                        Else
                           If istmauer(testfeld) = 0 And hydra = 0 And testfeld <> #FELD_AUSGANG And testfeld <> #FELD_EINGANG And testfeld <> #FELD_FRAGEZEICHEN And testfeld <> #FELD_LAVA
                              cleartile(spieler(akt_spieler)\character_x+spell_x, spieler(akt_spieler)\character_y+spell_y)
                           EndIf
                        EndIf
                     EndIf
                  EndIf
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_VORTEX
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_CHAOS)
                     sog()
                     ; Schaden
                     schaden.w = damage(spell, special)
                     hydra_zauber(schaden)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           monsterschaden(schaden)
                           cleanup_monsters()
                        EndIf
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_BLITZSCHLAG
         angriffsspruch(spell, 6, #SOUND_BLITZ, 3)
      
      Case #SPELL_FROSTBOLT
         angriffsspruch(spell, 4, #SOUND_FLAME, 2)
      
      Case #SPELL_TELEPORT
         If sonderlevel(spieler(akt_spieler)\level) <> #LM_TELEPORTSPERRE
            If teleport(akt_spieler,spieler(akt_spieler)\level)
                teleport(akt_spieler,spieler(akt_spieler)\level) -1   ; Nur einmal pro ebene
                okay = opfern()
                If okay > 0
                  If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
                      zug_verlieren()
                      spell_x = 0
                      spell_y = 0
                      destination = select_field()   ; gibt spell_x und spell_y zurueck
                      If destination = 1
                        ; zaubern!
                        mana_verlieren(spell)
                        special = erfolgreich(spell)
                        If special
                           Sound(#SOUND_EVASION)
                           For i = 1 To 8
                              laby_screen2()
                              ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
                              DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                              end_screen()
                              Delay(delay_animation2)
                           Next
                           For i = 1 To 8
                              laby_screen2()
                              ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
                              DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                              end_screen()
                              Delay(delay_animation2)
                           Next
                           If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = inhalt(spieler(akt_spieler)\level)
                              spieler(akt_spieler)\character_x = spieler(akt_spieler)\character_x + spell_x
                              spieler(akt_spieler)\character_y = spieler(akt_spieler)\character_y + spell_y
                              laby_screen()
                              For i = 1 To 8
                                 laby_screen2()
                                 ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
                                 DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                                 end_screen()
                                 Delay(delay_animation2)
                              Next
                              For i = 1 To 8
                                 laby_screen2()
                                 ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
                                 DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                                 end_screen()
                                 Delay(delay_animation2)
                              Next
                              laby_screen()
                           EndIf
                        EndIf
                      EndIf
                  Else
                      message(194,#COLOR_BLAU)
                  EndIf
                EndIf
            Else
                message(49,#COLOR_BLAU)
            EndIf
         Else
             message(815,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ANKER_TELEPORT
         If sonderlevel(spieler(akt_spieler)\level) <> #LM_TELEPORTSPERRE
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
                zug_verlieren()
                ; zaubern!
                If spieler(akt_spieler)\anker_x > 0 And spieler(akt_spieler)\anker_y > 0 And spieler(akt_spieler)\anker_level > 0
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                      Sound(#SOUND_EVASION)
                      For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                        end_screen()
                        Delay(delay_animation2)
                      Next
                      For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                        end_screen()
                        Delay(delay_animation2)
                      Next
                      spieler(akt_spieler)\character_x = spieler(akt_spieler)\anker_x
                      spieler(akt_spieler)\character_y = spieler(akt_spieler)\anker_y
                      spieler(akt_spieler)\level       = spieler(akt_spieler)\anker_level
                      laby_screen()
                      For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                        end_screen()
                        Delay(delay_animation2)
                      Next
                      For i = 1 To 8
                        laby_screen2()
                        ClipSprite(#SPRITE_TILESET_FX, i*31-31, 13*31+11, 31, 31)
                        DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
                        end_screen()
                        Delay(delay_animation2)
                      Next
                      laby_screen()
                  EndIf
                Else
                  message(633,#COLOR_BLAU)
                EndIf
            Else
                message(194,#COLOR_BLAU)
            EndIf
         Else
             message(815,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_DEHYDRATION
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     special.w = special * power(spell)
                     schaden.w = myRand(special) + special * 2
                     Sound(#SOUND_DARKNESS)
                     sternchen(160 + spell_x * 32, 160 + spell_y * 32, 6)
                     ; Schaden
                     schaden = schaden * get_weaving() 
                     hydra_zauber(schaden)
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           ; Trocken ?
                           If has_trait2(mon_no,#ME_TROCKEN) = 0
                              monsterschaden(schaden)
                              cleanup_monsters()
                           Else
                              message(268,#COLOR_BLAU)
                           EndIf
                        EndIf
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_ARKANER_SCHLAG
         angriffsspruch(spell, 2, #SOUND_FLAME, 4)
      
      Case #SPELL_OEFFNEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_KEY)
                     ; Tuer ?
                     If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_TUER2
                        ; reinforced?
                        If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\stat1 = 1 
                           message(524,#COLOR_BLAU)
                        Else
                           setlaby(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, #FELD_OFFENE_TUER,0,0)
                        EndIf
                     EndIf
                     ; Truhe ?
                     If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_BLAUETRUHE1
                        labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_BLAUETRUHE2
                     EndIf 
                     ; Gatter ?
                     If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_GITTER2
                        labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_GITTER1
                     EndIf
                  EndIf
               Else
                  message(255,#COLOR_BLAU) 
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FURCHT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                     act_monster.monster_pointer\p = @monster_list()
                     If mon_no
                        If dispelled() = 1
                           message(312,#COLOR_BLAU)
                        Else
                           ; Hat Angst ?
                           If has_trait2(mon_no, #ME_ANGST)
                              Sound(#SOUND_DARKNESS)
                              sternchen(156+spell_x*32,156+spell_y*32,7)
                              willi.s = monster(mon_no)\name[1+language] + message_text(627,1+language)
                              nachricht7(willi,#COLOR_BLAU)
                              lernen(mon_no)
                              spieler(akt_spieler)\mks = spieler(akt_spieler)\mks + 1
                              ChangeCurrentElement(monster_list(), act_monster\p)
                              remove_monster()
                              cleanup_monsters()
                           Else
                              message(269,#COLOR_BLAU)
                           EndIf
                        EndIf
                     EndIf
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_HOMUNKULUS
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0 And free_for_monster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_CHAOS)
                     sternchen(156+spell_x*32,156+spell_y*32,7)
                     get_creature(#CREATURE_HOMUNKULUS)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_VOGEL
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0 And free_for_monster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_CHAOS)
                     sternchen(156+spell_x*32,156+spell_y*32,7)
                     get_creature(#CREATURE_BIRD)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_SKELETT
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                  If istknochen(testfeld) = 1 Or item_spell
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special   
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_SKELETON)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        cleartile(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                        get_creature(#CREATURE_SKELETON)
                     EndIf
                  Else
                     message(182,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_TODESRITTER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                  If istknochen(testfeld) = 1 Or item_spell
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special   
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_DEATH_KNIGHT)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        cleartile(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                        get_creature(#CREATURE_DEATH_KNIGHT)
                     EndIf
                  Else
                     message(182,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_STERNENFEE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS Or item_spell
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special   
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_STARFEARIE)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_STARFEARIE)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_TIGER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS Or item_spell
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_TIGRE)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_TIGRE)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_MUMIE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
                  If istknochen(testfeld) = 1 Or item_spell
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special  
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_MUMMY)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        cleartile(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                        get_creature(#CREATURE_MUMMY)
                     EndIf
                  Else
                     message(182,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_GOLEM
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special   
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_GOLEM)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_GOLEM)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_SATYR
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_SATYR)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_SATYR)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FEUERELEMENTAR
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_FIREELEMENTAL)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_FIREELEMENTAL)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_WASSERELEMENTAR
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_WATERELEMENTAL)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_WATERELEMENTAL)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_DAEMON
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_DEMON)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_DEMON)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_ENGEL
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_SANKTUM
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((creature(#CREATURE_ANGEL)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                        get_creature(#CREATURE_ANGEL)
                     EndIf
                  Else
                     message(554,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_SUMMON_DRACHE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  zug_verlieren()
                  mana_verlieren(spell)
                  special = erfolgreich(spell)
                  If special
                     Sound(#SOUND_CHAOS)
                     sternchen(156+spell_x*32,156+spell_y*32,7)
                     xmod = spell_x
                     ymod = spell_y
                     aufstehen((creature(#CREATURE_DRAGON)\graphic-1)*8+5,#SPRITE_TILESET_MONSTERANIM)
                     get_creature(#CREATURE_DRAGON)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_DOPPELGAENGER
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            spell_x = 0
            spell_y = 0
            destination = select_field()   ; gibt spell_x und spell_y zurueck
            If destination = 1
               blocked = 0
               los()            ; gibt blocked zurueck
               If blocked = 0
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_NEXUS Or item_spell
                     zug_verlieren()
                     mana_verlieren(spell)
                     special = erfolgreich(spell)
                     If special
                        Sound(#SOUND_CHAOS)
                        sternchen(156+spell_x*32,156+spell_y*32,7)
                        xmod = spell_x
                        ymod = spell_y
                        aufstehen((spieler(akt_spieler)\Maennchen-1)*8+5,#SPRITE_TILESET_CHARACTER)
                        get_creature(#CREATURE_DOPPELGANGER)
                     EndIf
                  Else
                     message(183,#COLOR_BLAU)
                  EndIf
               Else
                  message(233,#COLOR_BLAU)
               EndIf
            EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      
      Case #SPELL_ERDBEBEN
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  Sound(#SOUND_EARTH)
                  ; Bildschirm zittern lassen
                  zittern = 3
                  laby_screen()
                  For i = 1 To 20
                     For y=1 To #MATRIX_SIZE
                        For x=1 To #MATRIX_SIZE
                           If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x < 1 Or spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y < 1
                              draw_tile(1, x, y, x_offset, y_offset, -1)   ; Mauer
                           Else
                              tile.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld
                              If fields(tile)\attri_floor
                                 bg.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\stat2
                              Else
                                 bg.w = 0
                              EndIf
                              draw_tile(tile, x, y, x_offset+zittern, y_offset+zittern, bg)
                           EndIf
                        Next
                      Next
                      draw_character(spieler(akt_spieler)\face,frame,0)   
                      laby_rahmen()
                      show_logo()
                      show_varys(1)
                      show_buttons()
                      show_schnellinventory()
                      show_sight()
                      end_screen()
                      If zittern = 3
                         zittern = -3
                      Else
                         zittern = 3
                      EndIf
                      Delay(delay_animation/2)
                   Next
                   Delay(delay_animation)

                   akt_power.w = special * power(spell)
                   For spell_x = -#HALF_MATRIX_SIZE To #HALF_MATRIX_SIZE
                      For spell_y = -#HALF_MATRIX_SIZE To #HALF_MATRIX_SIZE
                         If spieler(akt_spieler)\character_x + spell_x > 0 And spieler(akt_spieler)\character_y + spell_y > 0
                            mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
                            If mon_no
                              ; fliegt ?
                              If has_trait2(mon_no,#ME_FLIEGT) = 0
                                 ; Schaden
                                 schaden.w = damage(spell, special)
                                 monsterschaden(schaden)
                              EndIf
                           EndIf
                         EndIf
                      Next
                   Next
                   cleanup_monsters()
               EndIf
         Else
            message(194,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_FLAMMENMEER
          attack_area(spell,#SOUND_FLAME2,#FELD_FEUER3,1,1,1)
      
      Case #SPELL_ARMAGEDDON
         If armageddon(spieler(akt_spieler)\level)
            okay = opfern()
            If okay > 0
               If attack_area(spell,#SOUND_FLAME2,#FELD_FEUER3,1,2,1)
                 leeren(okay)
                 armageddon(spieler(akt_spieler)\level) - 1
               EndIf 
            EndIf ; wertvoll genug?
         Else
            message(35,#COLOR_BLAU)
         EndIf
      
      Case #SPELL_PESTILENCE
        If pestilence(spieler(akt_spieler)\level)
          okay = opfern()
          If okay > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
              zug_verlieren()
              mana_verlieren(spell)
              special = erfolgreich(spell)
              If special
                leeren(okay)
                pestilence(spieler(akt_spieler)\level) - 1
                Sound(#SOUND_HOWL)
                laby_screen()
                ; Bildschirm mit Skeletten fuellen
                For y=1 To #MATRIX_SIZE
                  For x=1 To #MATRIX_SIZE
                    draw_tile(#FELD_SKELETT, x, y, 1, 1, -1)
                  Next
                Next
                end_screen()
                Delay(delay_animation)
                laby_screen()
 
                ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
                While monster_list()\z = spieler(akt_spieler)\level
                  type.w = monster(monster_list()\number)\art
                  ;print( monster(monster_list()\number)\name[1] + " : " + str(typtest) )
                  ; Lebt ?
                  If type <> #TP_UNDEAD And type <> #TP_DEMON And type <> #TP_CONSTRUCT And type <> #TP_GHOST And monster_list()\number <> 123
                    spell_x = monster_list()\x - spieler(akt_spieler)\character_x
                    spell_y = monster_list()\y - spieler(akt_spieler)\character_y
                    ;print("hit: "+str(spell_x)+","+str(spell_y))
                    ; Schaden
                    monsterschaden(damage(spell, special))
                  EndIf
                  NextElement(monster_list())
                Wend
                cleanup_monsters()
              EndIf
            Else
              message(194,#COLOR_BLAU)
            EndIf
          EndIf ; opfern
        Else
          message(35,#COLOR_BLAU)
        EndIf
      
      Case #SPELL_TOD_AUSTRICKSEN
         okay = opfern3()
         If okay > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  leeren(okay)
                  Sound(#SOUND_SUCCESS)
                  laby_screen()
                  i = backpackspace()
                  If i <= #MAX_RUCKSACK
                     inventory(i,akt_spieler)\name = #OBJGRAFIK_HERZ1
                     inventory(i,akt_spieler)\status = 0
                     inventory(i,akt_spieler)\attri5 = 0
                  EndIf
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         EndIf ; opfern
      
      Case #SPELL_ENERGIE_DER_STEINE
         If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
            zug_verlieren()
            mana_verlieren(spell)
            special = erfolgreich(spell)
            If special
               okay = opfern2()
               If okay > 0
                  leeren(okay)
                  Sound(#SOUND_SUCCESS)
                  message(43,#COLOR_BLAU)
                  spieler(akt_spieler)\mana = maxmana()
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         EndIf ; opfern
      
      Case #SPELL_PFLUGSCHAR
         okay = opfern4()
         If okay > 0
            If spieler(akt_spieler)\Mana > zauberkosten(spell) - 1 Or item_spell
               zug_verlieren()
               mana_verlieren(spell)
               special = erfolgreich(spell)
               If special
                  akt_power.w = special * power(spell)
                  Sound(#SOUND_SUCCESS)
                  If item(inventory(okay,akt_spieler)\name)\verkauf >= 20
                    akt_power+1
                  EndIf
                  If item(inventory(okay,akt_spieler)\name)\verkauf >= 40
                    akt_power+1
                  EndIf
                  If item(inventory(okay,akt_spieler)\name)\verkauf >= 50
                    akt_power+1
                  EndIf
                  If item(inventory(okay,akt_spieler)\name)\verkauf >= 300
                    akt_power+3
                  EndIf
                  If akt_power > 15
                    akt_power = 15
                  EndIf
                  food.w = gen_food(akt_power)
                  leeren(okay)
                  in_rucksack(food,1)
               EndIf
            Else
               message(194,#COLOR_BLAU)
            EndIf
         EndIf ; opfern
      
      Case #SPELL_STERNENFEUER
          attack_area(spell,#SOUND_FLAME2,#FELD_STERNE2,1,1,1)
      
      Case #SPELL_FLUTWELLE
          attack_area(spell,#SOUND_SPLASH,#FELD_WASSER,2,1,2)
      
      Case #SPELL_PRISMATISCHES_SPRAY
          attack_area(spell,#SOUND_FLAME,9999,0,1,4)
      
      Case #SPELL_WINDE_RUFEN
          attack_area(spell,#SOUND_WIND,#FELD_STERNE3,0,1,3)
      
      Case #SPELL_WIRBELWIND
          angriffsspruch(spell, 99, #SOUND_WIND, 5)
      
      Case #SPELL_ORKAN
          angriffsspruch(spell, 99, #SOUND_WIND, 5)
          
      EndSelect
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 4048
; FirstLine = 4028
; Folding = -
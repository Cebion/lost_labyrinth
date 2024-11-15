; Routinen zum Zeichnen des Hauptschirms

Procedure move()

Shared spielerwechsel, schongemalt, frame, framestep, bewegt, no_mouse

 ; Test new field before movement
    If xmod <> 0 Or ymod <> 0
      vor_bewegung()
    EndIf
    ; Do we still move?
    If xmod <> 0 Or ymod <> 0
      bewegt = 1
    Else
      bewegt = 0
    EndIf

    spielerwechsel = 0
    schongemalt = 0

    ; Do we move ?
    If xmod <> 0 Or ymod <> 0
      spieler(akt_spieler)\Speed = spieler(akt_spieler)\Speed - 1

      For i = 4 To 32 Step 4
        ;StartTime2 = ElapsedMilliseconds()
        framestep = framestep + 1
        If framestep > 3
          framestep = 0
          If frame = 0
            frame = 1
          Else
            frame = 0
          EndIf
        EndIf

        screen1(i)

        end_screen()
        Delay(1)
      Next
      schongemalt = 1
      spieler(akt_spieler)\character_x = spieler(akt_spieler)\character_x + xmod
      spieler(akt_spieler)\character_y = spieler(akt_spieler)\character_y + ymod

      ; Aktualisiere Automap
      update_automap()
      
      laby_screen2()
      falle()
      sonderfeld()
      something_changed = 1
    EndIf
    
EndProcedure

; -------------------------------------------------------------------------------------

Procedure laby_rahmen(skipdiv.w = 0, no_items.w = 0)
   
   ClipSprite(#SPRITE_CLEANER, 0, 0, 51, 449)
   DisplaySprite(#SPRITE_CLEANER, 365, 15)
   ClipSprite(#SPRITE_CLEANER, 0, 0, 335, 51)
   DisplaySprite(#SPRITE_CLEANER, 15, 365)

   If skipdiv = 0
     ClipSprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 0, 640, 17)
     DisplaySprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 350)
   ElseIf skipdiv = 2
     ClipSprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 0, 11*32, 17)
     DisplaySprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 350)
   EndIf
   if no_items = 0
      ClipSprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 0, 365, 17)
      DisplaySprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 414)
   endif
   
   ClipSprite(#SPRITE_RAHMEN_SCHMAL1, 0, 0, 274, 16)
   DisplaySprite(#SPRITE_RAHMEN_SCHMAL1, 350, 87)
   ClipSprite(#SPRITE_RAHMEN_SCHMAL2, 0, 0, 274, 16)
   DisplaySprite(#SPRITE_RAHMEN_SCHMAL2, 350, 167)
   
   ClipSprite(#SPRITE_RAHMEN_MITTE, 0, 0, 17, 480)
   DisplaySprite(#SPRITE_RAHMEN_MITTE, 350, 0)
   
   ; Rahmen zeichnen
   ClipSprite(#SPRITE_RAHMEN_OBEN, 0, 0, 640, 17)
   DisplaySprite(#SPRITE_RAHMEN_OBEN, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_UNTEN, 0, 0, 640, 17)
   DisplaySprite(#SPRITE_RAHMEN_UNTEN, 0, 464)
   ClipSprite(#SPRITE_RAHMEN_LINKS, 0, 0, 17, 480)
   DisplaySprite(#SPRITE_RAHMEN_LINKS, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_RECHTS, 0, 0, 17, 480)
   DisplaySprite(#SPRITE_RAHMEN_RECHTS, 624, 0)

EndProcedure

; --------------------------------------------------------------------------------------

Procedure show_logo()

   ClipSprite(#SPRITE_TILESET_LOGO, 1, 1, 200, 58)
   DisplayTransparentSprite(#SPRITE_TILESET_LOGO, 400, 25)

EndProcedure

; --------------------------------------------------------------------------------------

Procedure last_message(which.w, where.w)

   wohin = ScreenOutput()
   StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(0,0,0))
      Select(old_messages(which)\color)
         Case #COLOR_WEISS: FrontColor(RGB(255,255,255))  ; Weiss
         Case #COLOR_BLAU:  FrontColor(RGB(1,1,255))      ; Blau
         Case #COLOR_ROT:   FrontColor(RGB(255,1,1))      ; Rot
         Case #COLOR_GRUEN: FrontColor(RGB(1,255,1))      ; Gruen
         Case #COLOR_GELB:  FrontColor(RGB(255,255,1))    ; Gelb
         Case #COLOR_GRAU:  FrontColor(RGB(150,150,150))  ; Grau
         Default: FrontColor(RGB(255,255,255))  ; Weiss
      EndSelect
      DrawText(25, where, old_messages(which)\message)
   StopDrawing()

EndProcedure

; --------------------------------------------------------------------------------------

Procedure ClearMessageWindow()

   ClipSprite(#SPRITE_CLEANER, 0, 0, 332, 46)
   DisplaySprite(#SPRITE_CLEANER, 17, 367)
      
EndProcedure

; --------------------------------------------------------------------------------------
; Prozedur Spielervariablen anzeigen

Procedure show_varys( skip_effects.w = 0, skip_messages.w = 0 )

Shared flaschen, matrix_pos_x, matrix_pos_y, in_sight
      
      x = 400
      y = 104
      ClipSprite(#SPRITE_CLEANER, 0, 0, 160, 55)
      DisplaySprite(#SPRITE_CLEANER, x, y)
      ; Life Corrigieren
      If spieler(akt_spieler)\Lifepoints > maxlife()
         spieler(akt_spieler)\Lifepoints = maxlife()
      EndIf
      
      ; Zugweite Korrigieren
      If spieler(akt_spieler)\Speed > maxspeed()
         spieler(akt_spieler)\Speed = maxspeed()
      EndIf

      If flaschen = 1
         faktor.f = maxlife() / 32
         pos.w = (spieler(akt_spieler)\Lifepoints / faktor) - 1
         If maxlife() = spieler(akt_spieler)\Lifepoints
            pos2.w = 27 * 32 - 27
         Else
            pos2 = 27 * pos - 27
         EndIf
         ClipSprite(#SPRITE_LEBEN, pos2, 0, 27, 49)
         DisplaySprite(#SPRITE_LEBEN, #POS_FLASCHE_X, #POS_FLASCHE_Y)

         
         faktor = maxmana() / 32
         pos = (spieler(akt_spieler)\Mana / faktor) - 1
         If maxmana() = spieler(akt_spieler)\Mana
            pos2 = 27 * 32 - 27
         Else
            pos2 = 27 * pos - 27
         EndIf
         ClipSprite(#SPRITE_MANA, pos2, 0, 27, 49)
         DisplaySprite(#SPRITE_MANA, #POS_FLASCHE_X+55, #POS_FLASCHE_Y)
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(239,131,44))
         DrawText(x+70,y+15,message_text(77,language+1))
         DrawText(x+155,y+15,Str(spieler(akt_spieler)\Speed) + "/" + Str(maxspeed()))
         FrontColor(RGB(154,251,120))
         DrawText(x+70,y+30,message_text(525,language+1)+":")
         DrawText(x+155,y+30,Str(spieler(akt_spieler)\Level))
         
         ;If test = 1
         ;  DrawText(x, y+45,Str(matrix_pos_x))
         ;  DrawText(x, y+55,Str(matrix_pos_y))
         ;  DrawText(x, y+65,Str(in_sight))
         ;EndIf
      Else
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         

         FrontColor(RGB(247,36,61))
         DrawText(x,y,message_text(55,language+1))
         DrawText(x+110,y,Str(spieler(akt_spieler)\Lifepoints) + "/" + Str(maxlife()))
         FrontColor(RGB(130,125,250))
         DrawText(x,y+15,message_text(59,language+1))
         DrawText(x+115,y+15,Str(spieler(akt_spieler)\Mana) + "/" + Str(maxmana()))
         FrontColor(RGB(239,131,44))
         DrawText(x,y+30,message_text(77,language+1))
         DrawText(x+115,y+30,Str(spieler(akt_spieler)\Speed) + "/" + Str(maxspeed()))
         FrontColor(RGB(154,251,120))
         DrawText(x,y+45,message_text(525,language+1))
         DrawText(x+115,y+45,Str(spieler(akt_spieler)\Level))
      EndIf
      
      StopDrawing()
      
      ; Maennchen anzeigen damit man weiss wer dran ist
      draw_player(590, 120)

      ; Display last 2 messages
      if skip_messages = 0
         last_msg.w = 25
         While old_messages(last_msg)\message = " " And last_msg > 1
         last_msg-1
         Wend
         If last_msg-1>0
            last_message(last_msg-1,#NACHRICHTEN_POSY)
         EndIf
         last_message(last_msg,#NACHRICHTEN_POSY+15)
      endif

      ; skip drawing active magic effects for some screens
      If skip_effects > 0
        ProcedureReturn 0
      EndIf
      
      wohin = ScreenOutput()
      StartDrawing(wohin)
      DrawingMode(1)


      ; Aktives Zeug
      x = 400
      y = 174
      FrontColor(RGB(0,0,0))    ; Schwarz
      If spieler(akt_spieler)\schleichen > 0
         y = y + 10
         FrontColor(RGB(150,150,150))  ; Grau
         DrawText(x,y,message_text(78,1+language))
      EndIf
      
      StopDrawing()

      For i = 1 To #ACTIVE_SLOTS
         If aktive(i,akt_spieler)\nr > 0
                
            gibts.w = 0
            For zz = 1 To i-1
               If aktive(i,akt_spieler)\nr = aktive(zz,akt_spieler)\nr
                  gibts = 1
               EndIf
            Next
            
            If gibts = 0
               y = y + 16
               ; Ist Maus hier?
               If mmouse_x >= x And mmouse_x <= x+120 And mmouse_y >= y And mmouse_y <= y+15
                  ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*16, 3*16, 16, 16)
                  DisplayTransparentSprite(#SPRITE_TILESET_ENCHANTMENTS, x-20, y)
                  If mmouse_rechts = 1
                     If aktive(i,akt_spieler)\ dauer <> #UNENDLICH
                        aktive(i,akt_spieler)\nr = 0
                        aktive(i,akt_spieler)\staerke = 0
                        Delay(delay_animation)
                     EndIf
                  EndIf
               EndIf
               
               ; Icons fuer Enchantments anzeigen
               Select aktive(i,akt_spieler)\nr
                  Case #SPELL_LICHT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_ERDSTAERKE:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 1*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_FLEDERMAUSGESTALT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*#WIDTH, 1*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_WOLFSGESTALT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*#WIDTH, 1*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_VOGELGESTALT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_KATZENGESTALT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*#WIDTH, 1*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_DRACHENGESTALT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_SYPHON:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 9*#WIDTH , 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_WINTERATEM:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 4*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_FEUERAURA:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 5*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_FALLENSINN:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 6*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_FEUERSCHILD:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 1*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_EISSCHILD:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_MACHT: ;??
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 9*#WIDTH, 1*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_GLUECKSZAUBER:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 5*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_STAERKEZAUBER:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_SCHUTZSCHILD:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 3*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_WEISSER_SCHUTZ:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 4*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_MAGIESCHUTZ:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 9*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_SCHUTZ_VOR_GESCHOSSEN:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 7*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_HEXENSICHT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 6*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_FALLEN_SPUEREN:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 6*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_RUECKENWIND:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 3*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DER_HOFFNUNG:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, #WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DER_EINSAMKEIT: ;??
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 7*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DES_TODES: ;??
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, #WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DER_MAGIE:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 9*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DES_LEBENS:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 3*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DES_REICHTUMS:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 4*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_FLIEGEN:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, #WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_UEBERS_WASSER_GEHEN:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 8*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DES_KAMPFES:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, #WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_TAEUSCHUNG:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 8*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_UNSICHTBARES_SEHEN:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 4*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_UNSICHTBARKEIT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 3*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_BLITZSCHUTZ:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 7*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_VERSTEINERNSCHUTZ:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 7*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_DOPPELGAENGER:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 9*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_1000_KLINGEN:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 6*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_GEISTERTANZ:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 4*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_UNVERWUNDBARKEIT:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 4*#WIDTH, #WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_GIFTSCHUTZ:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 3*#WIDTH, 3*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_WINDMEISTER:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 3*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_HYPNOSE:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 5*#WIDTH, 3*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DES_SCHUTZES:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 4*#WIDTH, 3*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_SCHOCK:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 7*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_REGENERATION:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 3*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LEBENSBUND:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 7*#WIDTH, 3*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DES_SCHLAFES:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, #WIDTH, 3*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_LIED_DES_SELBSTMORDS:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*#WIDTH, 2*#WIDTH, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_CONCENTRATION:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 2*#WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  Case #SPELL_PRAEZISION:
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, #WIDTH, 0, #WIDTH, #WIDTH)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  EndSelect
                  
                  ; Verzauberungen
                  If aktive(i,akt_spieler)\nr = #SPELL_VERZAUBERE_KREATUR_1 Or aktive(i,akt_spieler)\nr =#SPELL_VERZAUBERE_KREATUR_2 Or aktive(i,akt_spieler)\nr = #SPELL_VERZAUBERE_KREATUR_3 Or aktive(i,akt_spieler)\nr = #SPELL_VERZAUBERE_KREATUR_4
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 15, 15, 15)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  EndIf
                  
                  ; Metamagie
                  If aktive(i,akt_spieler)\nr = #SPELL_TUNNEL Or aktive(i,akt_spieler)\nr = #SPELL_VERLAENGERN2 Or aktive(i,akt_spieler)\nr = #SPELL_SCHNELLZAUBER Or aktive(i,akt_spieler)\nr = #SPELL_BRECHER Or aktive(i,akt_spieler)\nr = #SPELL_PENETRATION Or aktive(i,akt_spieler)\nr = #SPELL_VERDOPPELN
                     ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 143, 0, 15, 15)
                     DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
                  EndIf
               
               wohin = ScreenOutput()
               StartDrawing(wohin)
               DrawingMode(1)
               FrontColor(RGB(255,255,1))   ; Gelb
               dauer.s = ""
               If aktive(i,akt_spieler)\dauer <> #UNENDLICH
                 dauer = " ("+Str(aktive(i,akt_spieler)\dauer)+")"
               EndIf
               If aktive(i,akt_spieler)\dauer = #META_MAGIC
                 dauer = " (1*)"
               EndIf
               DrawText(x+20,y,spells(aktive(i,akt_spieler)\nr)\name[1+language]+dauer)
               
               StopDrawing()
            EndIf ; gibts
         EndIf
      Next

      ;show enchant creature spells for creature itself too (those are in active list of owner)
      ench.w = 0
      If spieler(akt_spieler)\creature_typ > 0
         ench.w = get_enchant_creature()
      EndIf
      If ench > 0
         ClipSprite(#SPRITE_TILESET_ENCHANTMENTS, 0, 15, 15, 15)
         DisplaySprite(#SPRITE_TILESET_ENCHANTMENTS, x, y)
         y = y + 16
      EndIf

      wohin = ScreenOutput()
      StartDrawing(wohin)
      DrawingMode(1)
      
      If ench > 0
         FrontColor(RGB(255,255,1))  ; gelb
         etxt.s = spells(#SPELL_VERZAUBERE_KREATUR_1)\name[1+language]
         DrawText(x,y,Left(etxt,Len(etxt)-1)+Str(ench))
      EndIf

      ; Waffe/Ruestung beschaedigt
      waffe_kaputt.w = 0
      ruestung_kaputt.w = 0
      For i = 1 To #MAX_RUCKSACK
         If inventory(i,akt_spieler)\benutzt = 1 And (inventory(i,akt_spieler)\status = 1 Or inventory(i,akt_spieler)\status = 2)
            If item(inventory(i,akt_spieler)\name)\type = 1
               waffe_kaputt = 1
            EndIf
            If item(inventory(i,akt_spieler)\name)\type = 6 Or item(inventory(i,akt_spieler)\name)\type = 7 Or item(inventory(i,akt_spieler)\name)\type = 8 Or item(inventory(i,akt_spieler)\name)\type = 9 Or item(inventory(i,akt_spieler)\name)\type = 11
               ruestung_kaputt = 1
            EndIf
         EndIf
      Next
      If waffe_kaputt > 0
         y = y + 16
         FrontColor(RGB(255,1,1))  ; Rot
         DrawText(x,y,message_text(646,1+language))
      EndIf
      If ruestung_kaputt > 0
         y = y + 16

         FrontColor(RGB(255,1,1))  ; Rot
         DrawText(x,y,message_text(647,1+language))
      EndIf
      
      ; Close to dying?
      If spieler(akt_spieler)\Lifepoints <= maxlife()/6 Or spieler(akt_spieler)\Lifepoints <= 3
         y = y + 16

         FrontColor(RGB(255,1,1))  ; Rot
         DrawText(x,y,message_text(662,1+language))
      Else
         If spieler(akt_spieler)\Lifepoints <= maxlife()/4 Or spieler(akt_spieler)\Lifepoints <= 5
            y = y + 16
            FrontColor(RGB(255,1,1))  ; Rot
            DrawText(x,y,message_text(661,1+language))
         EndIf
      EndIf
      
      ; Drunken?
      If spieler(akt_spieler)\betrunken > 0
         y = y + 16
         FrontColor(RGB(1,255,1))  ; Gruen
         DrawText(x,y,message_text(699,1+language))
      EndIf
      
      ; Belastung
      If belastung() > 0
         y = y + 16

         FrontColor(RGB(255,1,1))  ; Rot
         DrawText(x,y,message_text(86,1+language) + " " + Str(belastung()))
      EndIf

      If spieler(akt_spieler)\poison > 0
         y = y + 16

         FrontColor(RGB(1,255,1))  ; Gruen
         DrawText(x,y,message_text(645,1+language) + Str(spieler(akt_spieler)\poison))
      EndIf
      tmptxt.s
      If spieler(akt_spieler)\verhungern > 0
         y = y + 16
         
         If spieler(akt_spieler)\hunger < #starving_1
            tmptxt =  " ("+Str(#starving_1-spieler(akt_spieler)\hunger)+")"
         EndIf
         If spieler(akt_spieler)\hunger >= #starving_1 And spieler(akt_spieler)\hunger < #starving_2
            tmptxt =  " ("+Str(#starving_2-spieler(akt_spieler)\hunger)+")"
         EndIf
         If spieler(akt_spieler)\hunger >= #starving_2 And spieler(akt_spieler)\hunger < #starving_3
            tmptxt =  " ("+Str(#starving_3-spieler(akt_spieler)\hunger)+")"
         EndIf
         If spieler(akt_spieler)\hunger >= #starving_3 And spieler(akt_spieler)\hunger < #starving_4
            tmptxt =  " ("+Str(#starving_4-spieler(akt_spieler)\hunger)+")"
         EndIf
         If spieler(akt_spieler)\hunger >= #starving_4
            tmptxt =  " ("+Str(spieler(akt_spieler)\hunger-#starving_4)+")"
         EndIf
         
         FrontColor(RGB(1,1,255))  ; Blau
            Select spieler(akt_spieler)\verhungern
               Case 1 : DrawText(x,y,message_text(97,language+1)+tmptxt)
               Case 2 : DrawText(x,y,message_text(98,language+1)+tmptxt)
               Case 3 : DrawText(x,y,message_text(99,language+1)+tmptxt)
               Case 4 : DrawText(x,y,message_text(772,language+1)+tmptxt)
            EndSelect
      EndIf
      If spieler(akt_spieler)\verdursten > 0
         y = y + 16
         
         If spieler(akt_spieler)\durst < #dehydration_1
            tmptxt =  " ("+Str(#dehydration_1-spieler(akt_spieler)\durst)+")"
         EndIf
         If spieler(akt_spieler)\durst >= #dehydration_1 And spieler(akt_spieler)\durst < #dehydration_2
            tmptxt =  " ("+Str(#dehydration_2-spieler(akt_spieler)\durst)+")"
         EndIf
         If spieler(akt_spieler)\durst >= #dehydration_2 And spieler(akt_spieler)\durst < #dehydration_3
            tmptxt =  " ("+Str(#dehydration_3-spieler(akt_spieler)\durst)+")"
         EndIf
         If spieler(akt_spieler)\durst >= #dehydration_3 And spieler(akt_spieler)\durst < #dehydration_4
            tmptxt =  " ("+Str(#dehydration_4-spieler(akt_spieler)\durst)+")"
         EndIf
         If spieler(akt_spieler)\durst >= #dehydration_4
            tmptxt =  " ("+Str(spieler(akt_spieler)\durst-#dehydration_4)+")"
         EndIf
         FrontColor(RGB(1,1,255))  ; Blau
            Select spieler(akt_spieler)\verdursten
               Case 1 : DrawText(x,y,message_text(94,language+1)+tmptxt)
               Case 2 : DrawText(x,y,message_text(95,language+1)+tmptxt)
               Case 3 : DrawText(x,y,message_text(96,language+1)+tmptxt)
               Case 4 : DrawText(x,y,message_text(773,language+1)+tmptxt)
            EndSelect
      EndIf
      If spieler(akt_spieler)\krankheit > 0
         y = y + 16
         FrontColor(RGB(1,255,1))  ; Gruen
         DrawText(x,y,message_text(825,1+language) + " " + Str(spieler(akt_spieler)\krankheit))
      EndIf
      
      If spieler(akt_spieler)\fluch > 0
         y = y + 16

         FrontColor(RGB(150,150,150))  ; Grau

         erkl.w = 0
         If spieler(akt_spieler)\fluch = #FLUCH_NAMENLOS
            DrawText(x,y,message_text(131,language+1))
            erkl = 838
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_TIAMAT
            DrawText(x,y,message_text(132,language+1))
            erkl = 839
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_HEKATE
            DrawText(x,y,message_text(133,language+1))
            erkl = 840
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_ARES
            DrawText(x,y,message_text(134,language+1))
            erkl = 841
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_PARALYSE
            DrawText(x,y,message_text(135,language+1))
            erkl = 842
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_ARTEMIS
            DrawText(x,y,message_text(136,language+1))
            erkl = 843
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_ACHILLES
            DrawText(x,y,message_text(137,language+1))
            erkl = 844
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_BLINDHEIT
            DrawText(x,y,message_text(138,language+1))
            erkl = 845
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_HEPHAISTOS
            DrawText(x,y,message_text(139,language+1))
            erkl = 846
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_HADES
            DrawText(x,y,message_text(140,language+1))
            erkl = 847
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_SETH
            DrawText(x,y,message_text(141,language+1))
            erkl = 848
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_APOPHIS
            DrawText(x,y,message_text(142,language+1))
            erkl = 849
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_DAGDA
            DrawText(x,y,message_text(143,language+1))
            erkl = 850
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_NAIADEN
            DrawText(x,y,message_text(144,language+1))
            erkl = 851
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_OSIRIS
            DrawText(x,y,message_text(145,language+1))
            erkl = 852
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_LEPRECHAUN
            DrawText(x,y,message_text(146,language+1))
            erkl = 853
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_MARDUK
            DrawText(x,y,message_text(147,language+1))
            erkl = 854
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_ASTARTE
            DrawText(x,y,message_text(148,language+1))
            erkl = 855
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DES_POSEIDON
            DrawText(x,y,message_text(149,language+1))
            erkl = 856
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_TANIS
            DrawText(x,y,message_text(150,language+1))
            erkl = 857
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_ATHENE
            DrawText(x,y,message_text(151,language+1))
            erkl = 858
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_DER_MORRIGU
            DrawText(x,y,message_text(152,language+1))
            erkl = 859
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
            DrawText(x,y,message_text(153,language+1))
            erkl = 860
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_MAGNETO
            DrawText(x,y,message_text(749,language+1))
            erkl = 861
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_GAIA
            DrawText(x,y,message_text(750,language+1))
            erkl = 862
         EndIf
         If spieler(akt_spieler)\fluch = #FLUCH_NOSFERATU
            DrawText(x,y,message_text(751,language+1))
            erkl = 863
         EndIf

         ; Ist Maus hier?
         If mmouse_x >= x And mmouse_x <= x+120 And mmouse_y >= y And mmouse_y <= y+15 And erkl <> 0
            ClearMessageWindow()
            FrontColor(RGB(150,150,150))
            DrawText(25,#NACHRICHTEN_POSY+20,message_text(erkl,1+language))
            ; skip log messages
            StopDrawing()
            ProcedureReturn 0
         EndIf
      EndIf
      StopDrawing()
EndProcedure

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 171
; FirstLine = 161
; Folding = --
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
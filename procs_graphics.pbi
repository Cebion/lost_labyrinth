Procedure draw_mousepointer(x.w,y.w)

Shared no_mouse

   If no_mouse = 0
      sprite_x.w = spieler(akt_spieler)\Mousepointer
      sprite_y.w = 0
      If sprite_x > 6
         sprite_y + 1
         sprite_x - 6
      EndIf
      
      ClipSprite(#SPRITE_MOUSEPOINTER, sprite_x*32-32, sprite_y*32, 32, 32)
      DisplayTransparentSprite(#SPRITE_MOUSEPOINTER, x, y)
   EndIf

EndProcedure


Procedure draw_plain_frame(draw_hline.w = 0)

   ; Rahmen zeichnen
   ClipSprite(#SPRITE_RAHMEN_OBEN2, 0, 0, 640, 17)
   DisplayTransparentSprite(#SPRITE_RAHMEN_OBEN2, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 0, 640, 17)
   If draw_hline > 0
      DisplaySprite(#SPRITE_RAHMEN_WAAGRECHT, 0, draw_hline)
   ElseIf draw_hline = 0 ; a common default
      DisplaySprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 46)
   EndIf ;< 0 no extra horizontal line
   ClipSprite(#SPRITE_RAHMEN_UNTEN2, 0, 0, 640, 17)
   DisplayTransparentSprite(#SPRITE_RAHMEN_UNTEN2, 0, 463)
   ClipSprite(#SPRITE_RAHMEN_LINKS, 0, 0, 17, 480)
   DisplayTransparentSprite(#SPRITE_RAHMEN_LINKS, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_RECHTS, 0, 0, 17, 480)
   DisplayTransparentSprite(#SPRITE_RAHMEN_RECHTS, 623, 0)
   
EndProcedure

; ---------------------------------------------------------------------------------------

Procedure screen1(i.w)

Shared xmod, ymod, frame

   ClearScreen(RGB(0,0,0))
   draw_screen(xmod*i*(-1) , ymod*i*(-1))  ; Alles ausser Mauern + Schaetze + Monster
   
   ; before
   If skills(#CE_ERDE_SPUEREN,akt_spieler)\gewaehlt = 0
      draw_screen3(xmod*i*(-1) , ymod*i*(-1)) ; Wall
   EndIf
   If skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 0
      draw_screen4(xmod*i*(-1) , ymod*i*(-1)) ; Treasure
   EndIf
   If skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 0
      draw_screen7(xmod*i*(-1) , ymod*i*(-1)) ; Monster
   EndIf
   
   show_sight()
      
   ; after
   If skills(#CE_ERDE_SPUEREN,akt_spieler)\gewaehlt = 1
      draw_screen3(xmod*i*(-1) , ymod*i*(-1)) ; Wall
   EndIf
   If skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 1
      draw_screen4(xmod*i*(-1) , ymod*i*(-1)) ; Treasure   
      
      If skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 0
        draw_screen9(xmod*i*(-1) , ymod*i*(-1)) ; Monster over treasure
      EndIf   
         
   EndIf
   If skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 1
      draw_screen7(xmod*i*(-1) , ymod*i*(-1)) ; Monster
   EndIf
   
   
   ; other player's sprite has to be drawn after treasures are drawn
   ; otherwise players want be able to see each other when standing on a treasure
   draw_characters(xmod*i*(-1) , ymod*i*(-1))
   draw_character(spieler(akt_spieler)\face, frame,0)
   laby_rahmen()
   show_logo()
   show_varys(0)
   show_buttons()
   show_schnellinventory()

EndProcedure


; --------------------------------------------------------------------------------------------

; With Flipbuffers!
Procedure laby_screen()

   screen2()
   
   FlipBuffers()

EndProcedure

; --------------------------------------------------------------------------------------------

; Without Flipbuffers!
Procedure laby_screen2()

   screen2()

EndProcedure

; --------------------------------------------------------------------------------------------

Procedure screen2(no_items.w = 0, skip_messages.w = 0)

Shared xmod, ymod, frame
   
   ClearScreen(RGB(0,0,0))
   draw_screen(0,0)  ; Alles ausser Mauern + Schaetze + Monster
   
   ; before sight
   If skills(#CE_ERDE_SPUEREN,akt_spieler)\gewaehlt = 0
      draw_screen3(0,0) ; Mauern
   EndIf
   If skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 0
      draw_screen4(0,0) ; Schaetze
   EndIf
   If skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 0
      draw_screen7(0,0) ; Monster
   EndIf
   
   show_sight()
      
   ; after sight
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
   
   ; other player's sprite has to be drawn after treasures are drawn
   ; otherwise players won't be able to see each other when standing on a treasure   
   draw_characters(0, 0)   
   draw_character(spieler(akt_spieler)\face, frame,0)
   laby_rahmen(0,no_items)
   show_logo()
   show_varys(0,skip_messages)
   show_buttons()
   if no_items = 0
      show_schnellinventory()
   endif
   
   ;read_mouse()

EndProcedure


; --------------------------------------------------------------------------------------------

; Prozedur zum Zeichnen eines einzelnen Tile
Procedure draw_tile(nr.w, x.w, y.w, offset_x.w, offset_y.w, bg.w = 0)

   If bg > 0
      inhalt_x.w = bg
   Else
      inhalt_x.w = inhalt(spieler(akt_spieler)\level)
   EndIf
   inhalt_y.w = inhalt_x / 10
   inhalt_x = inhalt_x % 10
     
  ; Hidden Treasure etc anders darstellen
   If nr = #FELD_VERBORGENER_SCHATZ Or (nr >= #FELD_SPEERFALLE1 And nr <= #FELD_SPEERFALLE1+8)
      nr = inhalt(spieler(akt_spieler)\level)
   EndIf
   If nr = #FELD_GEHEIMGANG
      nr = mit_was(spieler(akt_spieler)\level)
   EndIf

   ; Teleporter instead of stairs?
   nr = teleporter_icon(nr)
     
   If bg <> -1
      ; Background first 
      ClipSprite(#SPRITE_TILESET_LABYRINTH, inhalt_x*32, inhalt_y*32, 32, 32)
      DisplaySprite(#SPRITE_TILESET_LABYRINTH, x*32-64+offset_x, y*32-64+offset_y)
   EndIf
   
   sprite_x.w = nr % 10
   sprite_y.w = nr / 10
   ClipSprite(#SPRITE_TILESET_LABYRINTH, sprite_x*32, sprite_y*32, 32, 32)
   DisplayTransparentSprite(#SPRITE_TILESET_LABYRINTH, x*32-64+offset_x, y*32-64+offset_y)
  
   If nr = #FELD_GOLD
     ; Then goldbag
     ClipSprite(#SPRITE_TILESET_LABYRINTH, 288, 0, 32, 32)
     DisplayTransparentSprite(#SPRITE_TILESET_LABYRINTH, x*32-64+offset_x, y*32-64+offset_y)
  EndIf

EndProcedure

; ---------------------------------------------------------------------------------------

; Prozedur zum Zeichnen eines einzelnen Tile (fuer Karten) ausser monster
Procedure draw_small_tile(nr.w, x.w, y.w, offset_x.b, offset_y.b, map_level.w = 0,  bg.w = 0)

; Bei Erde spueren nur Mauern. Bei Karte Mauern/Ausgang/Eingang. Bei Sternensicht alles ausser Objekte.
; Bei Sanktum/Nexus spueren nur Mauern und diese Felder

   Shared sprite_x, sprite_y, karten_typ

   If map_level = 0
      map_level = spieler(akt_spieler)\level
   EndIf
   
  ; Hidden Treasure etc anders darstellen
   If nr = #FELD_VERBORGENER_SCHATZ Or (nr >= #FELD_SPEERFALLE1 And nr <= #FELD_SPEERFALLE1+8)
      nr = inhalt(map_level)
   EndIf
   If nr = #FELD_GEHEIMGANG
      nr = mit_was(map_level)
   EndIf
  
  If  nr = #FELD_AUSGANG And karten_typ = 5
     sprite_x.w = #FELD_AUSGANG
     sprite_y.w = 0
     ClipSprite(#SPRITE_TILESET_SMALLLABYRINTH, sprite_x*16, sprite_y*16, 16, 16)
     DisplaySprite(#SPRITE_TILESET_SMALLLABYRINTH, x*16+offset_x, y*16+offset_y)
  EndIf

  ; Teleporter instead of Stairs?
  nr = teleporter_icon(nr)
  
   sprite_x.w = nr
   sprite_y.w = sprite_x / 10
   sprite_x = sprite_x % 10

   ; Nur Mauern anzeigen
  If istmauer(nr) = 1
     ClipSprite(#SPRITE_TILESET_SMALLLABYRINTH, sprite_x*16, sprite_y*16, 16, 16)
     DisplaySprite(#SPRITE_TILESET_SMALLLABYRINTH, x*16+offset_x, y*16+offset_y)
  EndIf
  ; Normale Felder
  If karten_typ = 2 ;Or item_spell
  
     If map_level > 0
       If bg > 0
         sprite_xx.w = bg
       Else
         sprite_xx.w = inhalt(map_level)
       EndIf
        sprite_yy.w = sprite_xx / 10
        sprite_xx = sprite_xx % 10
            
        ClipSprite(#SPRITE_TILESET_SMALLLABYRINTH, sprite_xx*16, sprite_yy*16, 16, 16)
        DisplaySprite(#SPRITE_TILESET_SMALLLABYRINTH, x*16+offset_x, y*16+offset_y)
     Endif
     ClipSprite(#SPRITE_TILESET_SMALLLABYRINTH, sprite_x*16, sprite_y*16, 16, 16)
     DisplayTransparentSprite(#SPRITE_TILESET_SMALLLABYRINTH, x*16+offset_x, y*16+offset_y)
  EndIf
  If  nr = #FELD_NEXUS And karten_typ = 3
     sprite_x.w = #FELD_NEXUS
     sprite_y.w = 0
     ClipSprite(#SPRITE_TILESET_SMALLLABYRINTH, sprite_x*16, sprite_y*16, 16, 16)
     DisplaySprite(#SPRITE_TILESET_SMALLLABYRINTH, x*16+offset_x, y*16+offset_y)
  EndIf
  If  nr = #FELD_SANKTUM And karten_typ = 4
     sprite_x.w = #FELD_SANKTUM
     sprite_y.w = 0
     ClipSprite(#SPRITE_TILESET_SMALLLABYRINTH, sprite_x*16, sprite_y*16, 16, 16)
     DisplaySprite(#SPRITE_TILESET_SMALLLABYRINTH, x*16+offset_x, y*16+offset_y)
  EndIf


EndProcedure

; ---------------------------------------------------------------------------------------

; Prozedur zum Zeichnen eines einzelnen Monsters (fuer Karten)
Procedure draw_small_monster(nr.w, x.w, y.w, offset_x.b, offset_y.b)

   sprite_x.w = nr - 1
   sprite_y.w = sprite_x / 10
   sprite_x = sprite_x % 10

   ;print(Str(nr)+" x:"+Str(sprite_x)+" y:"+Str(sprite_y))
  ; Unsichtbar?
  If has_trait2(nr,#ME_UNSICHTBAR) = 0
    ClipSprite(#SPRITE_TILESET_SMALLMONSTER, sprite_x*16, sprite_y*16, 16, 16)
    DisplayTransparentSprite(#SPRITE_TILESET_SMALLMONSTER, x*16+offset_x, y*16+offset_y)  
  EndIf


EndProcedure

; ---------------------------------------------------------------------------------------

; Prozedur zum Zeichnen des Charakters
Procedure draw_character(face.b, frame.b, offset.w)

  If spieler(akt_spieler)\in_water
    ysize.w = 16
    yoff.w = 8
  Else
    ysize.w = 32
    yoff.w = 0
  EndIf

  If spieler(akt_spieler)\charge > 0
     draw_item(#OBJGRAFIK_CHARGE_UP -1 + spieler(akt_spieler)\charge, 7, 7, 0, 0)
  EndIf

  If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
    ClipSprite(#SPRITE_TILESET_MONSTERANIM, face*32*2+frame*32, 1*32-32, 32, ysize)
    DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, 5*32, 5*32+offset+yoff)
  ElseIf habich(#SPELL_FLEDERMAUSGESTALT)
    ClipSprite(#SPRITE_TILESET_MONSTERANIM, face*32*2+frame*32, 5*32-32, 32, 32)
    DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, 5*32, 5*32+offset)
  ElseIf habich(#SPELL_WOLFSGESTALT)
    ClipSprite(#SPRITE_TILESET_MONSTERANIM, face*32*2+frame*32, 3*32-32, 32, ysize)
    DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, 5*32, 5*32+offset+yoff)
  ElseIf habich(#SPELL_VOGELGESTALT)
    ClipSprite(#SPRITE_TILESET_MONSTERANIM, face*32*2+frame*32, 4*32-32, 32, 32)
    DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, 5*32, 5*32+offset)
  ElseIf habich(#SPELL_KATZENGESTALT) 
    ClipSprite(#SPRITE_TILESET_MONSTERANIM, face*32*2+frame*32, 2*32-32, 32, ysize)
    DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, 5*32, 5*32+offset+yoff)
  ElseIf habich(#SPELL_DRACHENGESTALT)
    ClipSprite(#SPRITE_TILESET_MONSTERANIM, face*32*2+frame*32, 6*32-32, 32, ysize)
    DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, 5*32, 5*32+offset+yoff)
  Else  ; Normales aussehen
    If spieler(akt_spieler)\creature_typ = #CREATURE_DOPPELGANGER Or spieler(akt_spieler)\creature_typ = 0 Or spieler(akt_spieler)\creature_typ = #CREATURE_COMPANION
       ClipSprite(#SPRITE_TILESET_CHARACTER, face*32*2+frame*32, spieler(akt_spieler)\maennchen*32-32, 32, ysize)
       DisplayTransparentSprite(#SPRITE_TILESET_CHARACTER, 5*32, 5*32+offset+yoff)
    Else
       ClipSprite(#SPRITE_TILESET_MONSTERANIM, face*32*2+frame*32, spieler(akt_spieler)\maennchen*32-32, 32, ysize)
       DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, 5*32, 5*32+offset+yoff)
    EndIf
  EndIf
  
EndProcedure

;--------------------------------------------------------------------------------------

; Prozedur zum Zeichnen eines einzelnen Monster
Procedure draw_monster(x,y,offset_x.w, offset_y.w)

  ; Invisible?
  If has_trait2(monster_list()\number,#ME_UNSICHTBAR) = 1 And habich(#SPELL_UNSICHTBARES_SEHEN) = 0 And habich(#SPELL_GEISTERTANZ) = 0 And skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 0
    ; Nichts anzeigen!
  Else
    sprite_x.w = monster(monster_list()\number)\nr -1
    sprite_y.w = sprite_x / 10
    sprite_x = sprite_x % 10
          
    ClipSprite(#SPRITE_TILESET_MONSTER, sprite_x*32, sprite_y*32, 32, 32)  ; Dann Monster
    DisplayTransparentSprite(#SPRITE_TILESET_MONSTER, x*32-64+offset_x, y*32-64+offset_y)
             
    testfeld.w = monster_list()\status
    If testfeld = #MONSTERSTATUS_ALERT
      ClipSprite(#SPRITE_TILESET_MONSTERSTATUS, 0, 0, 8, 9)  ; Alert
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTERSTATUS, x*32-64+offset_x+23, y*32-64+offset_y)
    ElseIf testfeld = #MONSTERSTATUS_SCHLAEFT
      ClipSprite(#SPRITE_TILESET_MONSTERSTATUS, 8, 0, 8, 9)  ; Sleeping
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTERSTATUS, x*32-64+offset_x+23, y*32-64+offset_y)
    ElseIf testfeld = #MONSTERSTATUS_FREUND
      ClipSprite(#SPRITE_TILESET_MONSTERSTATUS, 16, 0, 8, 9)  ; Friend
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTERSTATUS, x*32-64+offset_x+23, y*32-64+offset_y)
    ElseIf testfeld = #MONSTERSTATUS_VERGIFTET
      ClipSprite(#SPRITE_TILESET_MONSTERSTATUS, 24, 0, 8, 9)  ; Poisoned
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTERSTATUS, x*32-64+offset_x+23, y*32-64+offset_y)
    ElseIf testfeld = #MONSTERSTATUS_BLIND
      ClipSprite(#SPRITE_TILESET_MONSTERSTATUS, 32, 0, 8, 9)  ; Blind
      DisplayTransparentSprite(#SPRITE_TILESET_MONSTERSTATUS, x*32-64+offset_x+23, y*32-64+offset_y)
    ElseIf testfeld = #MONSTERSTATUS_SCHWARM
      ClipSprite(#SPRITE_TILESET_FX, 0, 14*32, 32, 32)  ; Swarmed
      DisplayTransparentSprite(#SPRITE_TILESET_FX, x*32-64+offset_x, y*32-64+offset_y)
    EndIf
  EndIf

EndProcedure

; --------------------------------------------------------------------------------------

; Prozedur zum Zeichnen eines einzelnen Item
Procedure draw_item(name.w, x.w, y.w, offset_x.w, offset_y.w)

     ; Pilze nicht mit Unaufmerksam
     If item(name)\type <> #ITEMTYPE_MUSHROOM Or skills(#CE_UNAUFMERKSAM,akt_spieler)\gewaehlt = 0 ;hide mushrooms if flaw selected
         ; Item zeichnen
         sprite_x.w = name - 1
         sprite_y.w = sprite_x / 16
         sprite_x = sprite_x % 16
         
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, x*32-64+offset_x, y*32-64+offset_y)
     EndIf

EndProcedure

; --------------------------------------------------------------------------------------

Procedure kopiere_matrix()

   ; In neuen Bereich kopieren 
   For y = 1 To #MATRIX_SIZE
      For x = 1 To #MATRIX_SIZE
         If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x > 0 And spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y > 0
            If blockiert(spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y, spieler(akt_spieler)\level) = 0
                  matrix(x,y) = #CLOSED
            Else
                  matrix(x,y) = #OPEN
            EndIf
         EndIf
      Next
   Next

EndProcedure

; --------------------------------------------------------------------------------------

Procedure insert_light(radius.w)

  ; Set starting field
   matrix(#HALF_MATRIX_SIZE,#HALF_MATRIX_SIZE) = 1
      
   For i = 1 To radius+1
      For x = max(#HALF_MATRIX_SIZE - radius,0) To min(#HALF_MATRIX_SIZE + radius,#MATRIX_SIZE)
        For y = max(#HALF_MATRIX_SIZE - radius,0) To min(#HALF_MATRIX_SIZE + radius,#MATRIX_SIZE)
          If matrix(x,y) = #CLOSED
            For k = 1 To 4
              x_offs.w = neighbour(k)\x
              y_offs.w = neighbour(k)\y
              If x+x_offs > 0 And x+x_offs <= #MATRIX_SIZE And y+y_offs > 0 And y+y_offs <= #MATRIX_SIZE
                If matrix(x,y) > matrix(x+x_offs,y+y_offs) + 1
                   matrix(x,y) = matrix(x+x_offs,y+y_offs) + 1
                EndIf
              EndIf
            Next
          EndIf
        Next
      Next
   Next

 EndProcedure

; --------------------------------------------------------------------------------------
 
 Procedure insert_light2(radius.w)
   
   ; Alles was Verbindung zum Licht hat einschalten
   For x = 1 To #MATRIX_SIZE
      For y = 1 To #MATRIX_SIZE
         matrix2(x,y) = 0   
      Next
   Next
   
   For x = 1 To #MATRIX_SIZE
      For y = 1 To #MATRIX_SIZE
         For k = 1 To 8
            x_offs.w = neighbour(k)\x
            y_offs.w = neighbour(k)\y
            If x+x_offs > 0 And x+x_offs <= #MATRIX_SIZE And y+y_offs > 0 And y+y_offs <= #MATRIX_SIZE
               If matrix(x+x_offs,y+y_offs) <= radius
               matrix2(x,y) = 1
               EndIf
            EndIf
         Next
      Next
   Next
   
   For x = 1 To #MATRIX_SIZE
      For y = 1 To #MATRIX_SIZE
         If matrix2(x,y) = 1
            matrix(x,y) = radius
         EndIf   
      Next
   Next

EndProcedure

; --------------------------------------------------------------------------------------

Procedure erstelle_matrix()

   For x.b = 1 To #MATRIX_SIZE
      For y.b = 1 To #MATRIX_SIZE
         matrix(x,y) = #OPEN
      Next
   Next
   
   radius.w = radius()
   kopiere_matrix()
   insert_light(radius)
   insert_light2(radius)
      
   For x = 1 To #MATRIX_SIZE
      For y = 1 To #MATRIX_SIZE
         If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x > 0 And spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y > 0
            testfeld.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld
            If skills(#CE_ERDE_SPUEREN, akt_spieler)\gewaehlt = 1
               If istmauer(testfeld) = 1
                  matrix(x,y) = radius
               EndIf
            EndIf 
         
            If skills(#CE_SCHATZJAEGER, akt_spieler)\gewaehlt = 1
               If testfeld = #FELD_GOLD Or testfeld = #FELD_GRUENETRUHE1 Or testfeld = #FELD_GRUENETRUHE2 Or testfeld = #FELD_VERBORGENER_SCHATZ Or testfeld = #FELD_TRUHE Or testfeld = #FELD_SKELETT2 Or testfeld = #FELD_VERBORGENER_SCHATZ2 Or testfeld = #FELD_BLAUETRUHE1 Or testfeld = #FELD_BLAUETRUHE2
                     matrix(x,y) = radius
               EndIf
            EndIf 
         
         Else
            If skills(#CE_ERDE_SPUEREN, akt_spieler)\gewaehlt = 1
               matrix(x,y) = radius
            EndIf
         EndIf
      Next
   Next

EndProcedure

; --------------------------------------------------------------------------------------

Procedure draw_characters(x_offset.b, y_offset.b)

Shared  frame

   radius.w = radius()
   
   For y = 1 To #MATRIX_SIZE
      For x = 1 To #MATRIX_SIZE
         If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x > 0 And spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y > 0 And (matrix(x,y) <= radius  Or istoutdoor() = 1 Or habich(#SPELL_LICHT) = #UNENDLICH) 

            ; display Characters
            For xx = 1 To nr_of_players
               If xx <> akt_spieler
                  If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x = spieler(xx)\character_x And spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y = spieler(xx)\character_y
                     If spieler(xx)\Status = 1 And spieler(xx)\Level = spieler(akt_spieler)\Level
                        
                        If spieler(xx)\in_water
                           ysize.w = 16
                           yoff.w = 8
                        Else
                           ysize.w = 32
                           yoff.w = 0
                        EndIf
                        If spieler(xx)\fluch = #FLUCH_CHICKEN
                           ClipSprite(#SPRITE_TILESET_MONSTERANIM, spieler(xx)\face*32*2, 1*32-32, 32, 32)
                           DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x*32+x_offset-64, y*32+y_offset-64)
                           okay = 1
                        ElseIf hater(#SPELL_FLEDERMAUSGESTALT,xx)
                           ClipSprite(#SPRITE_TILESET_MONSTERANIM, spieler(xx)\face*32*2, 5*32-32, 32, 32)
                           DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x*32+x_offset-64, y*32+y_offset-64)
                           okay = 1
                        ElseIf hater(#SPELL_WOLFSGESTALT,xx)
                           ClipSprite(#SPRITE_TILESET_MONSTERANIM, spieler(xx)\face*32*2, 3*32-32, 32, ysize)
                           DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x*32+x_offset-64, y*32+y_offset-64+yoff)
                        ElseIf hater(#SPELL_VOGELGESTALT,xx)
                           ClipSprite(#SPRITE_TILESET_MONSTERANIM, spieler(xx)\face*32*2, 4*32-32, 32, 32)
                           DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x*32+x_offset-64, y*32+y_offset-64)
                        ElseIf hater(#SPELL_KATZENGESTALT,xx)
                           ClipSprite(#SPRITE_TILESET_MONSTERANIM, spieler(xx)\face*32*2, 2*32-32, 32, ysize)
                           DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x*32+x_offset-64, y*32+y_offset-64+yoff)
                        ElseIf hater(#SPELL_DRACHENGESTALT,xx)
                           ClipSprite(#SPRITE_TILESET_MONSTERANIM, spieler(xx)\face*32*2, 6*32-32, 32, ysize)
                           DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x*32+x_offset-64, y*32+y_offset-64+yoff)
                        Else  ; Normales aussehen
                           If spieler(xx)\creature_typ = #CREATURE_DOPPELGANGER Or spieler(xx)\creature_typ = 0 Or spieler(xx)\creature_typ = #CREATURE_COMPANION
                              ClipSprite(#SPRITE_TILESET_CHARACTER, spieler(xx)\face*32*2, spieler(xx)\maennchen*32-32, 32, ysize)
                              DisplayTransparentSprite(#SPRITE_TILESET_CHARACTER, x*32+x_offset-64, y*32+y_offset-64+yoff)
                           Else
                              ClipSprite(#SPRITE_TILESET_MONSTERANIM, spieler(xx)\face*32*2, spieler(xx)\maennchen*32-32, 32, ysize)
                              DisplayTransparentSprite(#SPRITE_TILESET_MONSTERANIM, x*32+x_offset-64, y*32+y_offset-64+yoff)
                           EndIf
                        EndIf
                        
                     EndIf
                  EndIf
               EndIf
            Next
         EndIf
      Next
   Next  

EndProcedure

; --------------------------------------------------------------------------------------

; Prozedur zum Zeichnen des Haupt-Bildschirms
; Alles ausser Kisten, Gold, Mauern und Monsters
Procedure draw_screen(x_offset.b, y_offset.b)

Shared  frame
 
   erstelle_matrix()
   radius.w = radius()
   
   For y = 1 To #MATRIX_SIZE
      For x = 1 To #MATRIX_SIZE
         If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x > 0 And spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y > 0 And (matrix(x,y) <= radius  Or istoutdoor() = 1 Or habich(#SPELL_LICHT) = #UNENDLICH)
            testfeld.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld
            ;enable visible fields on the automap
            automap(spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x , spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld[spieler(akt_spieler)\level] = 1
            If testfeld <> #FELD_GOLD And testfeld <> #FELD_GRUENETRUHE1 And testfeld <> #FELD_GRUENETRUHE2 And testfeld <>  #FELD_VERBORGENER_SCHATZ And testfeld <> #FELD_TRUHE And testfeld <> #FELD_SKELETT2 And testfeld <> #FELD_VERBORGENER_SCHATZ2 And testfeld <> #FELD_BLAUETRUHE1 And testfeld <> #FELD_BLAUETRUHE2
               tile.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld
               If fields(tile)\attri_floor
                  bg.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\stat2
               Else
                  bg = 0
               EndIf
               draw_tile(tile, x, y, x_offset, y_offset,bg)
               If laby_item(spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\name[spieler(akt_spieler)\Level]>0
                  draw_item(laby_item(spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x,spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\name[spieler(akt_spieler)\Level], x, y, x_offset, y_offset)
               EndIf
            EndIf
         EndIf
      Next
   Next 

EndProcedure

; --------------------------------------------------------------------------------------
; Prozedur zum Zeichnen des Haupt-Bildschirms
; Nur Mauern
Procedure draw_screen3(x_offset.b, y_offset.b)

   Shared frame
   
   radius.w = radius()
      
   For y.b = 1 To #MATRIX_SIZE
      For x.b = 1 To #MATRIX_SIZE
         If matrix(x,y) <= radius Or istoutdoor() = 1 Or habich(#SPELL_LICHT) = #UNENDLICH
            If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x < 1 Or spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y < 1
               draw_tile(mit_was(spieler(akt_spieler)\level), x, y, x_offset, y_offset, -1)   ; Mauer
            Else
               testfeld.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld
               If istmauer(testfeld) Or testfeld = #FELD_GEHEIMGANG
                  draw_tile(testfeld, x, y, x_offset, y_offset,-1)
               EndIf
            EndIf
         EndIf
      Next
   Next

EndProcedure

; --------------------------------------------------------------------------------------

; Prozedur zum Zeichnen des Haupt-Bildschirms
; Nur Schaetze
Procedure draw_screen4(x_offset.b, y_offset.b)

   Shared frame
   
   radius.w = radius()
   
   For y.b = 1 To #MATRIX_SIZE
      For x.b = 1 To #MATRIX_SIZE
         If matrix(x,y) <= radius Or istoutdoor() = 1 Or habich(#SPELL_LICHT) = #UNENDLICH
            If spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x > 0 And spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y > 0
               testfeld.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld
               If testfeld = #FELD_GOLD Or testfeld = #FELD_GRUENETRUHE1 Or testfeld = #FELD_GRUENETRUHE2 Or testfeld = #FELD_TRUHE Or testfeld = #FELD_VERBORGENER_SCHATZ Or testfeld = #FELD_SKELETT2 Or testfeld = #FELD_VERBORGENER_SCHATZ2 Or testfeld = #FELD_BLAUETRUHE1 Or testfeld = #FELD_BLAUETRUHE2
                  If testfeld = #FELD_VERBORGENER_SCHATZ And skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 1
                     labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld = #FELD_VERBORGENER_SCHATZ2
                  EndIf
                  tile.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\feld
                  If fields(tile)\attri_floor
                     bg.w = labyrinth(spieler(akt_spieler)\Level,spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\stat2
                  Else
                     bg.w = 0
                  EndIf
                  draw_tile(tile, x, y, x_offset, y_offset, bg)
                  If laby_item(spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x, spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\name[spieler(akt_spieler)\Level]>0
                     draw_item(laby_item(spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x,spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y)\name[spieler(akt_spieler)\Level], x, y, x_offset, y_offset)
                  EndIf
               EndIf
            EndIf
         EndIf
      Next
   Next

EndProcedure

; --------------------------------------------------------------------------------------
; Prozedur zum Zeichnen des Haupt-Bildschirms
; Nur Monster
Procedure draw_screen7(x_offset.b, y_offset.b)

   Shared frame
   
   radius.w = radius()
   
   ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
   r.w = #HALF_MATRIX_SIZE
   While monster_list()\z = spieler(akt_spieler)\level
      If monster_list()\x > spieler(akt_spieler)\character_x -r And monster_list()\x < spieler(akt_spieler)\character_x +r And monster_list()\y > spieler(akt_spieler)\character_y -r And monster_list()\y < spieler(akt_spieler)\character_y +r
         x.w = monster_list()\x - spieler(akt_spieler)\character_x + #HALF_MATRIX_SIZE
         y.w = monster_list()\y - spieler(akt_spieler)\character_y + #HALF_MATRIX_SIZE
         If matrix(x,y) <= radius  Or istoutdoor() = 1 Or habich(#SPELL_LICHT) = #UNENDLICH Or skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt
         ;print(str(monster_list()\number)+":"+monster(monster_list()\number)\name[1]+" x:"+str(x)+" y:"+str(y))
         
         testfeld.w = labyrinth(spieler(akt_spieler)\Level, monster_list()\x, monster_list()\y)\feld
         If skills(#CE_MONSTER_SPUEREN,akt_spieler)\gewaehlt = 0 And skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 1 And (testfeld = #FELD_GOLD Or testfeld = #FELD_GRUENETRUHE1 Or testfeld = #FELD_GRUENETRUHE2 Or testfeld = #FELD_TRUHE Or testfeld = #FELD_VERBORGENER_SCHATZ Or testfeld = #FELD_SKELETT2 Or testfeld = #FELD_VERBORGENER_SCHATZ2 Or testfeld = #FELD_BLAUETRUHE1 Or testfeld = #FELD_BLAUETRUHE2)
            ; Monster under treasure and treasures yet to be drawn, do nothing
         Else         
            draw_monster(x, y, x_offset, y_offset)
         EndIf
         EndIf
      EndIf
      NextElement(monster_list())
   Wend

EndProcedure

; --------------------------------------------------------------------------------------

; Prozedur zum Zeichnen des Haupt-Bildschirms
; Drawing treasures and monsters when Treasure hunter enabled
Procedure draw_screen9(x_offset.b, y_offset.b)

   ChangeCurrentElement(monster_list(),first_monster(spieler(akt_spieler)\level)\p)
   r.w = #HALF_MATRIX_SIZE
   While monster_list()\z = spieler(akt_spieler)\level    
   
      r.w = #HALF_MATRIX_SIZE
            
      If monster_list()\x > spieler(akt_spieler)\character_x -r And monster_list()\x < spieler(akt_spieler)\character_x +r And monster_list()\y > spieler(akt_spieler)\character_y -r And monster_list()\y < spieler(akt_spieler)\character_y +r
         monsterx.w = monster_list()\x - spieler(akt_spieler)\character_x + #HALF_MATRIX_SIZE
         monstery.w = monster_list()\y - spieler(akt_spieler)\character_y + #HALF_MATRIX_SIZE
                        
         testfeld.w = labyrinth(spieler(akt_spieler)\Level, monster_list()\x, monster_list()\y)\feld
         If testfeld = #FELD_GOLD Or testfeld = #FELD_GRUENETRUHE1 Or testfeld = #FELD_GRUENETRUHE2 Or testfeld = #FELD_TRUHE Or testfeld = #FELD_VERBORGENER_SCHATZ Or testfeld = #FELD_SKELETT2 Or testfeld = #FELD_VERBORGENER_SCHATZ2 Or testfeld = #FELD_BLAUETRUHE1 Or testfeld = #FELD_BLAUETRUHE2
         draw_monster(monsterx, monstery, x_offset, y_offset)
         EndIf 
                     
      EndIf 
      NextElement(monster_list())
   Wend  
  
EndProcedure


Procedure DrawBitmapFont(s.l, x.l, y.l, w.l, h.l, t.s)

   a=0
   Repeat
      b.c = PeekC(@t+a) 
      ClipSprite(s, (b-32)*w, 0, w, h)
      DisplayTransparentSprite(s, x+a*w, y)
      a+1
   Until b = 0
  
EndProcedure


Procedure DrawButtonNotPressed(s.l, x.l, y.l, w.l, h.l, t.s)

   StartDrawing(ScreenOutput())
      Line(x-6, y-6,   Len(t)*w+10, 0, $AAAAAA)
      Line(x-6, y-6+h, Len(t)*w+10, 0, $333333)
      Line(x-6, y-6, 0, h, $AAAAAA)
      Line(x-6+Len(t)*w+10, y-6, 0, h, $333333)
      Box(x-6 + Len(t)*w+10, y-6, 0, h, $888888)
   StopDrawing()
   DrawBitmapFont(s.l, x.l, y.l, w.l, h.l, t.s)
  
EndProcedure


Procedure DrawButtonPressed(s.l, x.l, y.l, w.l, h.l, t.s)

   StartDrawing(ScreenOutput())
      Box(x-6, y-6, Len(t)*w+10, h, $444444)
   StopDrawing()
   DrawBitmapFont(s.l, x.l, y.l, w.l, h.l, t.s)
  
EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 804
; FirstLine = 769
; Folding = -----
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
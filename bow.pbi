Procedure bogenangriff(bogen.w, schleuder.w, angriff.w, schaden.w, kritisch.w, art.w, akt_munition.w)

Shared spell_x, spell_y, aktion

   ; Pfeil/Stein fliegen lassen
   Sound(#SOUND_BOW)
   If bogen = 1
      schaden.w = (myRand(schaden) + 4)
      animate_projectile(5)
      okay.w = 0
      ; Explodierend?
      If art = 1
         okay = 1
         Sound(#SOUND_FIREBALL)
         ; Zielbereich mit Flammen fuellen
         For y=spell_y-1+#HALF_MATRIX_SIZE To spell_y+1+#HALF_MATRIX_SIZE
            For x=spell_x-1+#HALF_MATRIX_SIZE To spell_x+1+#HALF_MATRIX_SIZE
               draw_tile(#FELD_FEUER3, x, y, 1, 1, -1)
            Next
         Next
         FlipBuffers()
         Delay(delay_animation)
      EndIf
      ; Eispfeile?
      If art = 3
         okay = 1
         Sound(#SOUND_WIND)
         ; Zielbereich mit Schnee fuellen
         If spell_x < 0
            y = #HALF_MATRIX_SIZE
            For x=spell_x+#HALF_MATRIX_SIZE To -1+#HALF_MATRIX_SIZE
               draw_tile(#FELD_SCHNEE, x, y, 1, 1, -1)
            Next
         EndIf
         If spell_x > 0
            y = #HALF_MATRIX_SIZE
            For x=#HALF_MATRIX_SIZE+1 To spell_x+#HALF_MATRIX_SIZE
               draw_tile(#FELD_SCHNEE, x, y, 1, 1, -1)
            Next
         EndIf
         If spell_y < 0
            x = #HALF_MATRIX_SIZE
            For y=spell_y+#HALF_MATRIX_SIZE To -1+#HALF_MATRIX_SIZE
               draw_tile(#FELD_SCHNEE, x, y, 1, 1, -1)
            Next
         EndIf
         If spell_y > 0
            x = #HALF_MATRIX_SIZE
            For y=#HALF_MATRIX_SIZE+1 To spell_y+#HALF_MATRIX_SIZE
               draw_tile(#FELD_SCHNEE, x, y, 1, 1, -1)
            Next
         EndIf
         FlipBuffers()
         Delay(delay_animation)
      EndIf
   EndIf
   If schleuder = 1
      ; Schleuder
      schaden.w = (myRand(schaden)+1)
      animate_projectile(11)
   EndIf
   
   okay = 0
   ; Explodierend?
   If art = 1
      okay = 1
      ; Schaden
      hydra_zauber(schaden)
      
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
            spielerschaden(2,1,#ROD_EXPLOSION)
         EndIf
      Next
      akt_spieler = save_akt_spieler
      
      save_spell_x.w = spell_x
      save_spell_y.w = spell_y
      
      ; Alle Monster angreifen
      For zaehl = 1 To 9
         schaden2.w = (myRand(schaden) + 4)
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
         feuerschaden(schaden2, 0)
      Next
      
      spell_x = save_spell_x
      spell_y = save_spell_y
   EndIf
   ; Eispfeile?
   If art = 3
      okay = 1
      weg.w = 0
      save_x.w = spell_x
      save_y.w = spell_y
      If spell_x < 0 And weg = 0
         weg = 1
         For spell_x = -1 To save_x Step -1
            schaden2.w = (myRand(schaden) + 4)
            eisschaden(schaden2, 0)
         Next
      EndIf
      If spell_x > 0 And weg = 0
         weg = 1
         For spell_x = 1 To save_x
            schaden2.w = (myRand(schaden) + 4)
            eisschaden(schaden2, 0)
         Next
      EndIf
      If spell_y < 0 And weg = 0
         weg = 1
         For spell_y = -1 To save_y Step -1
            schaden2.w = (myRand(schaden) + 4)
            eisschaden(schaden2, 0)
         Next
      EndIf
      If spell_y > 0 And weg = 0
         weg = 1
         For spell_y=1 To save_y
            schaden2.w = (myRand(schaden) + 4)
            eisschaden(schaden2, 0)
         Next
      EndIf
   EndIf
   If okay = 0
      mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
      ;store pointer
      act_monster.monster_pointer\p = @monster_list()
      If mon_no Or isthydra(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y) = 1
         unsichtbar = 0
         ; Unsichtbares Monster ?
         If has_trait2(mon_no,#ME_UNSICHTBAR) = 1
            unsichtbar = 1
         EndIf
         ; Nur mit 20% Kaempfen bei unsichtbar (oder zielsuchende pfeile)!
         If unsichtbar = 0 Or habich(#SPELL_UNSICHTBARES_SEHEN) Or habich(#SPELL_GEISTERTANZ) Or art = 2  Or (unsichtbar = 1 And get_chance(100) < 20)
            ; Angriff
            angriff = angriff + angriff()
            angriff = angriff * 10
            If bogen = 1
               angriff = angriff + spieler(akt_spieler)\bogentreffergegenstand
               If skills(#CE_BOGENSCHIESSEN,akt_spieler)\gewaehlt = 1
                  angriff = angriff + 50
               EndIf
            EndIf
            If angriff > 90
               angriff = 90
            EndIf
            If angriff < 10
               angriff = 10
            EndIf
            If art = 2
               angriff = 100
            EndIf
            
            treffer.w = get_chance(103)
            If treffer < angriff
               ; Kritisch?
               kritisch = kritisch + luck() + reflexe()
               If skills(#CE_SCHARFSCHUETZE,akt_spieler)\gewaehlt = 1
                  kritisch = kritisch * 2
                  If kritisch > 45
                     kritisch = 45
                  EndIf
               Else
                  If kritisch > 35
                     kritisch = 35
                  EndIf
               EndIf

               If has_trait2(mon_no,#ME_RES_CRITICAL)
                 kritisch = 0
               Else
                 If get_chance(104) >= kritisch
                   kritisch = 0
                 EndIf
               EndIf
               If kritisch
                  hydra_zauber(schaden)
                  Sound(Random(12))
                  ClipSprite(#SPRITE_TILESET_PROJEKTILE, 3*32, 7*32, 32, 32)
                  DisplayTransparentSprite(#SPRITE_TILESET_PROJEKTILE, 160+ spell_x*32, 160 + spell_y*32)
                  FlipBuffers()
                  Delay(delay_animation)
                  ;restore pointer
                  ChangeCurrentElement(monster_list(),act_monster\p)
                  zerstoert(#COLOR_ROT)
               Else
                  hydra_zauber(schaden)
                  ;restore pointer
                  ChangeCurrentElement(monster_list(),act_monster\p)
                  monsterschaden(schaden, 0)
                  

                  ; Monster vergiftet?
                  If monster_list()\status <> #MONSTERSTATUS_TOT ;monster still alive?
                    If inventory(akt_munition,akt_spieler)\attri5 = 4 Or inventory(akt_munition,akt_spieler)\name = #OBJGRAFIK_PFEIL2
                       art.w = monster(mon_no)\art
                       If has_trait2(mon_no,#ME_GIFT) = 0 And art <> #TP_UNDEAD And art <> #TP_CONSTRUCT And art <> #TP_GHOST
                          monster_list()\status = #MONSTERSTATUS_VERGIFTET
                          monster_list()\duration = myRand(20)+5
                       Else
                          message(456,#COLOR_GRUEN)
                       EndIf
                    EndIf
                  EndIF
               EndIf
            Else
               message(16,#COLOR_ROT)
            EndIf
         Else
            message(441,#COLOR_ROT)
            spieler(akt_spieler)\Speed = 0
            aktion = 1
         EndIf ; unsichtbar?
      EndIf ; monster ?
   EndIf ; exploding
            
EndProcedure


Procedure bogen()

Shared spell_x, spell_y, aktion, blocked

   akt_munition.w = 0
   bogen.b = 0
   schleuder.b = 0
   pfeile.b = 0
   steine.b = 0
   angriff.w = 0
   schaden.w = 0
   kritisch.w = 0
   spell_x = 0
   spell_y = 0
   destination = select_field()   ; gibt spell_x und spell_y zurueck
   if destination = 1
      blocked = 0
      los(1)            ; gibt blocked zurueck
      If blocked = 0
         ; Bogen/Schleuder benutzt ?
         For i = 1 To #MAX_RUCKSACK
            If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BOW And inventory(i,akt_spieler)\benutzt = 1
               If inventory(i,akt_spieler)\name = #OBJGRAFIK_SCHLEUDER
                  schleuder = 1
               Else
                  bogen = 1
               EndIf
               angriff  = item(inventory(i,akt_spieler)\name)\attri2
               angriff  = angriff + spieler(akt_spieler)\bogentreffergegenstand
               schaden  = item(inventory(i,akt_spieler)\name)\attri3
               schaden  = schaden + spieler(akt_spieler)\bogenschadengegenstand
               kritisch = item(inventory(i,akt_spieler)\name)\attri4
            EndIf
         Next
         ; Pfeile/Steine benutzt ?
         art.w = 0
         magisch.w = 0
         For i = 1 To #MAX_RUCKSACK
            If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION And inventory(i,akt_spieler)\benutzt = 1
               If (inventory(i,akt_spieler)\name = #OBJGRAFIK_STEINE Or inventory(i,akt_spieler)\name = #OBJGRAFIK_STAHLKUGELN)
                  steine = 1
               Else
                  If item(inventory(i,akt_spieler)\name)\magisch = 1
                     magisch = 1
                  EndIf
                  pfeile = 1
                  ; Explodierend
                  If inventory(i,akt_spieler)\name = #OBJGRAFIK_PFEIL1
                     art = 1
                  EndIf
                  ; Zielsuchend
                  If inventory(i,akt_spieler)\name = #OBJGRAFIK_PFEIL4
                     art = 2
                  EndIf
                  ; Durchschlagend
                  If inventory(i,akt_spieler)\name = #OBJGRAFIK_PFEIL3
                     art = 3
                  EndIf
               EndIf
               akt_munition = i
               ; Kostet einen Pfeil!
               inventory(akt_munition,akt_spieler)\status = inventory(akt_munition,akt_spieler)\status - 1
               If inventory(akt_munition,akt_spieler)\status < 1
                  leeren(akt_munition)
               If inventory(akt_munition,akt_spieler)\status < 1
                     message(263,#COLOR_WEISS)
                  EndIf
               EndIf
               angriff = angriff + item(inventory(i,akt_spieler)\name)\attri2
               schaden = schaden +  item(inventory(i,akt_spieler)\name)\attri3
               kritisch = kritisch + item(inventory(i,akt_spieler)\name)\attri4
            EndIf
         Next

         If (bogen = 1 And pfeile = 1) Or (schleuder = 1 And steine = 1)
            mon_no.w = getmonster(spieler(akt_spieler)\character_x+spell_x,spieler(akt_spieler)\character_y+spell_y)
            If has_trait2(mon_no,#ME_UNVERWUNDBAR) > 0 And (magisch = 0 Or skills(#CE_GEISTERJAEGER,akt_spieler)\gewaehlt = 1)
               aktion = 1
               animate_projectile(5)
               message(736,#COLOR_ROT)
            Else
               aktion = 1
               bogenangriff(bogen, schleuder, angriff, schaden, kritisch, art, akt_munition)
               
               ; Wenn nicht tot und zen nochmal schiessen!
               If bogen = 1 And skills(#CE_ZEN_BOGEN,akt_spieler)\gewaehlt = 1 And getmonster(spieler(akt_spieler)\character_x+spell_x,spieler(akt_spieler)\character_y+spell_y)
                  bogenangriff(bogen, schleuder, angriff, schaden, kritisch, art, akt_munition)
               EndIf
               cleanup_monsters()
            EndIf
         Else  ; Pfeile und Bogen?
            message(14,#COLOR_ROT)
         EndIf
      EndIf
   endif

EndProcedure



Procedure mystisch()

Shared spell_x, spell_y, aktion, blocked
   
   schaden.w = 0
   spell_x = 0
   spell_y = 0
   destination = select_field()   ; gibt spell_x und spell_y zurueck
   if destination = 1
      blocked = 0
      los(0)            ; gibt blocked zurueck
      If blocked = 0
         If spieler(akt_spieler)\lifepoints > 1
            mon_no.w = getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
            If  mon_no Or isthydra(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               aktion = 1
               ; Fleck fliegen lassen
               Sound(#SOUND_FLAME)
               animate_projectile(2)
               ; Schaden
               schaden.w = max(5,myRand(5*spieler(akt_spieler)\level) + spieler(akt_spieler)\level)
               hydra_zauber(schaden)
               getmonster(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)
               monsterschaden(schaden, 0)
               cleanup_monsters()
               spielerschaden(1,3,0)
            Else
               message(246,#COLOR_WEISS)
            EndIf
         Else
            message(409,#COLOR_WEISS)
         EndIf
      EndIf
   endif

EndProcedure


; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 290
; FirstLine = 258
; Folding = -
; Traenke

; ----------------------------------------------------------------

Procedure init_pilze()

Shared pilz, language, gegenstand
   zw_geg.gs

   ;permute mushrooms
   For i = 0 To #ANZ_PILZE-2
      von = #OBJGRAFIK_PILZE_SCHWARZ + i
      nach = #OBJGRAFIK_PILZE_SCHWARZ + i + Random(#ANZ_PILZE-1-i)
      
      For k = 1 To #ANZ_languages
         zw_geg \name[k]  = item(von)\name[k]
      Next
      zw_geg \attri1  = item(von)\attri1
      zw_geg \einkauf = item(von)\einkauf
      zw_geg \verkauf = item(von)\verkauf
      
      For k = 1 To #ANZ_languages
         item(von)\name[k]  = item(nach)\name[k]
      Next
      item(von)\attri1  = item(nach)\attri1
      item(von)\einkauf = item(nach)\einkauf
      item(von)\verkauf = item(nach)\verkauf
      
      For k = 1 To #ANZ_languages
         item(nach)\name[k]  = zw_geg \name[k]
      Next
      item(nach)\attri1  = zw_geg \attri1
      item(nach)\einkauf = zw_geg \einkauf
      item(nach)\verkauf = zw_geg \verkauf
   Next
   ;initialize as unknown for all 
   For i = 0 To #ANZ_PILZE-1
     mush_known(i) = 0
   Next
EndProcedure

; ----------------------------------------------------------------

Procedure pilz_essen(welchen.w)

Shared language, item_spell, akt_zauber_offset, akt_zauber

   spieler(akt_spieler)\hunger = spieler(akt_spieler)\hunger - 10
   If spieler(akt_spieler)\hunger < 0
      spieler(akt_spieler)\hunger = 0
   EndIf
   Select(welchen)
      Case #MUSHROOM_USELESS:
         message(38,#COLOR_GRUEN)
      Case #MUSHROOM_WEAK_HEAL:
         spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + 2
         If spieler(akt_spieler)\Lifepoints > spieler(akt_spieler)\Maxlifepoints
            spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Maxlifepoints
         EndIf
         message(39,#COLOR_GRUEN)
      Case #MUSHROOM_STRONG_HEAL:
         spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Lifepoints + 4
         If spieler(akt_spieler)\Lifepoints > spieler(akt_spieler)\Maxlifepoints
            spieler(akt_spieler)\Lifepoints = spieler(akt_spieler)\Maxlifepoints
         EndIf
         message(39,#COLOR_GRUEN)
      Case #MUSHROOM_POISON:
         add_poison(5+myRand2(10))
         message(40,#COLOR_GRUEN)
      Case #MUSHROOM_STRONG_POISON:
         add_poison(15+myRand2(15))
         message(40,#COLOR_GRUEN)
      Case #MUSHROOM_STRENGTH:
           zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_STAERKEZAUBER
           item_spell = 5+myRand(5)
           cast_it()
           item_spell = 0
      Case #MUSHROOM_WEAKNESS:;does nothing for now
         message(41,#COLOR_GRUEN)
      Case #MUSHROOM_PARALYSE:
         spieler(akt_spieler)\fluch = #FLUCH_PARALYSE
         spieler(akt_spieler)\fluchdauer = myRand2(10)+5
         message(42,#COLOR_GRUEN)
      Case #MUSHROOM_WEAK_MANA:
         spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana + 2
         If spieler(akt_spieler)\Mana > maxmana()
            spieler(akt_spieler)\Mana = maxmana()
         EndIf
         message(43,#COLOR_GRUEN)
      Case #MUSHROOM_STRONG_MANA:
         spieler(akt_spieler)\Mana = spieler(akt_spieler)\Mana + 4
         If spieler(akt_spieler)\Mana > maxmana()
            spieler(akt_spieler)\Mana = maxmana()
         EndIf
         message(43,#COLOR_GRUEN)
      Default: ; Wirkungslos
         message(38,#COLOR_GRUEN)
   EndSelect

EndProcedure

; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 44
; FirstLine = 55
; Folding = -
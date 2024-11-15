Procedure stealing()

Shared spell_x, spell_y,aktion

   spell_x = 0
   spell_y = 0
   destination = select_field()   ; gibt spell_x und spell_y zurueck
   If destination = 1
      blocked = 0
      los(1)            ; gibt blocked zurueck
      
      If steal_arr(akt_spieler,spieler(akt_spieler)\level) > 0
      If blocked = 0
         mon_no.w = getmonster(spieler(akt_spieler)\character_x+spell_x,spieler(akt_spieler)\character_y+spell_y)
            If has_trait2(mon_no,#ME_BESTEHLBAR)
            If backpackspace() > #MAX_RUCKSACK
               message(428,#COLOR_BLAU)
            Else
               If monster_list()\status = #MONSTERSTATUS_ALERT
                  message(522,#COLOR_BLAU)
               Else
                  aktion = 1
                  steal_arr(akt_spieler,spieler(akt_spieler)\level) - 1
                  stehl.w = (reflexe() * 8) + (luck() * 6)
                  If monster_list()\status = #MONSTERSTATUS_SCHLAEFT
                  stehl = stehl + 30
                  EndIf
                  If stehl > 90
                  stehl = 90
                  EndIf
                  If get_chance(100) < stehl
                  If has_trait2(mon_no,#ME_HAT_MAG_SCHATZ) = 0
                     hugo = 1
                  Else
                     hugo = get_chance(100)
                  EndIf
                  If hugo < 80
                     obje = find1()
                  Else
                     obje = finden2()
                  EndIf
                  in_rucksack(obje,1)
                           
                  okay.w = 0
                  If obje >= #OBJGRAFIK_TRANK1 And obje <= #ANZ_TRAENKE-1 + #OBJGRAFIK_TRANK1 And mischen(obje-#OBJGRAFIK_TRANK1)\learned & PM() = 0
                     message(199,#COLOR_BLAU)
                     okay = 1
                  EndIf
                           
                  If obje = #OBJGRAFIK_SCHRIFTROLLE  ; Scroll
                     message(443,#COLOR_BLAU)
                     okay = 1
                  EndIf
         
                  If okay = 0
                     nachricht2(44,obje)
                  EndIf
                  Else
                  message(261,#COLOR_BLAU)
                  monster_list()\status = #MONSTERSTATUS_ALERT
                  EndIf
               EndIf ; alert?
            EndIf ;backpack full
            Else
               message(197,#COLOR_BLAU) ;monster can not be robbed
            EndIf
         Else
            message(196,#COLOR_BLAU) ;blocked
         EndIf
      
      Else
         message(45,#COLOR_BLAU) ;player lacks feat
      EndIf
   EndIf

EndProcedure
; ExecutableFormat=
; EOF
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 22
; FirstLine = 11
; Folding = -
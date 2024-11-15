Procedure ftasten()

Shared aktion, do_it, do_it2, feld

   If spieler(akt_spieler)\charge > 0
      ProcedureReturn 0
   EndIf

   ftaste = 0
   
   for i = 1 to 10
      If used_keys(i+33)\pressed And used_keys(i+33)\wait_release = 0
         used_keys(i+33)\wait_release = 1
         ftaste = i
      endif
   next

   If ftaste > 0 And inventory(ftaste+40, akt_spieler)\name > 0
      aktion = 1
      feld = ftaste+40
      If inventory(feld, akt_spieler)\benutzt = 0
         do_it = 1
         itemtest()
         do_it = 0
      Else
         do_it2 = 1
         itemtest()
         do_it2 = 0
      EndIf
      laby_screen()
      Delay(delay_animation/2)
      Goto nach_zauber
   EndIf

EndProcedure


Procedure show_schnellinventory()

Shared feld, do_it, do_it2, aktion

   menuposx.w = 23
   menuposy.w = 431

   For i = 1 To 10
      aktuell = 0
      mouse_over = draw_item_inventory(menuposx,menuposy,i+40,0,1)
      If mouse_over
         ClipSprite(#SPRITE_CLEANER, 0, 0, 224, 45)
         DisplaySprite(#SPRITE_CLEANER, 400, 300)
         describe(i+40,400,300)
         aktuell = 1
         If mmouse_links = 1 And aktion = 0  And spieler(akt_spieler)\charge < 1
            aktion = 1
            feld = i+40
            If inventory(feld, akt_spieler)\name <> 0
               If inventory(feld, akt_spieler)\benutzt = 0
                  do_it = 1
                  itemtest()
                  do_it = 0
               Else
                  do_it2 = 1
                  itemtest()
                  do_it2 = 0
               EndIf
               
               laby_screen()
               Delay(delay_animation/2)
               Goto nach_zauber
            EndIf
         EndIf
      EndIf
   Next
   
EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 58
; FirstLine = 56
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
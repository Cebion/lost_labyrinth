
Procedure teleporter_icon(nr.w)

  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level+1) = #SL_WUESTE
     nr = #FELD_TELEPORTER_WUESTE
  endif
  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level+1) = #SL_ZENTAUERWALD
     nr = #FELD_TELEPORTER_WALD
  endif
  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level+1) = #SL_ARCHIPEL
     nr = #FELD_TELEPORTER_ARCHIPEL
  endif
  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level+1) = #SL_SUMPF
     nr = #FELD_TELEPORTER_SUMPF
  endif
  
  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_WUESTE
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_ZENTAUERWALD
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_ARCHIPEL
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  if nr = #FELD_AUSGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_SUMPF
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  
  if spieler(akt_spieler)\level > 1
      if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level-1) = #SL_WUESTE
         nr = #FELD_TELEPORTER_WUESTE
      endif
      if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level-1) = #SL_ZENTAUERWALD
         nr = #FELD_TELEPORTER_WALD
      endif
      if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level-1) = #SL_ARCHIPEL
         nr = #FELD_TELEPORTER_ARCHIPEL
      endif
      if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level-1) = #SL_SUMPF
         nr = #FELD_TELEPORTER_SUMPF
      endif
  endif
  
  if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_WUESTE
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_ZENTAUERWALD
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_ARCHIPEL
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  if nr = #FELD_EINGANG and sonderlevel(spieler(akt_spieler)\level) = #SL_SUMPF
     nr = #FELD_TELEPORTER_LABYRINTH
  endif
  
  ProcedureReturn nr
  
EndProcedure

; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

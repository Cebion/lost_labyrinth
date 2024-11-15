; Routines for Labyrinth tiles
;------------------------------------------------------------------------------------------------------------------


Procedure setlaby(x.w,y.w,ebene.w,was.w,s1.w,s2.w)

   labyrinth(ebene,x,y)\feld = was
   labyrinth(ebene,x,y)\stat1 = s1
   If fields(was)\attri_floor And s2 = 0
      s2 = inhalt(ebene)
   EndIf
   labyrinth(ebene,x,y)\stat2 = s2

EndProcedure

; --------------------------------------------------------------------------------

Procedure cleartile(x.w,y.w,level.w = -1)

   If level = -1
      level = spieler(akt_spieler)\level
   EndIf
   act_tile.w = labyrinth(level,x,y)\feld
   new_tile.w = inhalt(level)
   If fields(act_tile)\attri_floor
      new_tile = labyrinth(level,x,y)\stat2
   EndIf
   labyrinth(level,x,y)\feld = new_tile
   labyrinth(level,x,y)\stat1 = 0
   labyrinth(level,x,y)\stat2 = 0

EndProcedure

; --------------------------------------------------------------------------------

Procedure free_for_monster(x.w, y.w, level.w = 0)

  If level = 0
    level = spieler(akt_spieler)\level
  EndIf

  If x<0 Or y<0 Or x>groesse(level) Or y>groesse(level)
    ProcedureReturn 0
  EndIf

  If fields(labyrinth(level,x,y)\feld)\block_spawn 
    ProcedureReturn 0
  EndIf

  For i.w = 1 To nr_of_players
    If spieler(i)\status <> 1 Or spieler(i)\level <> level
      Continue
    EndIf
    If x = spieler(i)\character_x And y = spieler(i)\character_y
      ProcedureReturn 0
    EndIf
  Next

  If getmonster(x,y,level)
    ProcedureReturn 0
  EndIf
  
  ProcedureReturn 1

EndProcedure

;--------------------------------------------------------------------------------------------------------------

Procedure free_for_water_monster(x.w, y.w, level.w = 0)

   Shared nr_of_players

   If level = 0
      level = spieler(akt_spieler)\level
   EndIf

   If x<0 Or y<0 Or x>groesse(level) Or y>groesse(level)
      ProcedureReturn 0
   EndIf

   If fields(labyrinth(level,x,y)\feld)\block_spawn <> 2
      ProcedureReturn 0
   EndIf

   For i.w = 1 To nr_of_players
      If spieler(i)\status <> 1 Or spieler(i)\level <> level
         Continue
      EndIf
      If x = spieler(i)\character_x And y = spieler(i)\character_y
         ProcedureReturn 0
      EndIf
   Next

   If getmonster(x,y,level)
      ProcedureReturn 0
   EndIf
   
   ProcedureReturn 1

EndProcedure

;--------------------------------------------------------------------------------------------------------------

Procedure isthydra(x.w,y.w)

   f.w = labyrinth(spieler(akt_spieler)\level,x, y)\feld
   If f = #FELD_HYDRA1 Or f = #FELD_HYDRA2 Or f = #FELD_HYDRA3 Or f = #FELD_HYDRA4 Or f = #FELD_HYDRA5 Or f = #FELD_HYDRA6 Or f = #FELD_HYDRA7 Or f = #FELD_HYDRA8 Or f = #FELD_HYDRA9 Or f = #FELD_HYDRA10 Or f = #FELD_HYDRA11 Or f = #FELD_HYDRA12
      ProcedureReturn 1
   Else
      ProcedureReturn 0
   EndIf
  
EndProcedure

;--------------------------------------------------------------------------------------------------------------

Procedure istmauer(feld.w)

   If feld = #FELD_MAUER Or feld = #FELD_GEHEIMGANG Or ( feld >= #FELD_MAUER2 And feld <= #FELD_MAUER5 ) Or feld = #FELD_WAND_WEISS Or feld = #FELD_HOEHLE2_MAUER Or feld = #FELD_HOEHLE3_MAUER Or feld = #FELD_GRABSTEIN
      ProcedureReturn 1
   EndIf
   
   ProcedureReturn 0

EndProcedure

;--------------------------------------------------------------------------------------------------------------

Procedure is_floor(feld.w)

   If feld = #FELD_LEER Or feld = #FELD_HOEHLE2_LEER Or ( feld >= #FELD_KACHELBODEN1 And feld <= #FELD_KACHELBODEN4 ) Or feld = #FELD_HOEHLE3_LEER Or feld = #FELD_EISBODEN Or feld = #FELD_STERNE3 Or feld = #FELD_SCHNEE Or ( feld >= #FELD_TEPPICH1 And feld <= #FELD_SUMPF1 ) Or ( feld >= #FELD_BODEN1 And feld <= #FELD_BODEN5 )
      ProcedureReturn 1
   EndIf
   
   ProcedureReturn 0

EndProcedure

;--------------------------------------------------------------------------------------------------------------

Procedure istoutdoor()

   If sonderlevel(spieler(akt_spieler)\level) = #SL_WUESTE Or sonderlevel(spieler(akt_spieler)\level) = #SL_ZENTAUERWALD Or sonderlevel(spieler(akt_spieler)\level) = #SL_SUMPF Or sonderlevel(spieler(akt_spieler)\level) = #SL_ARCHIPEL
      ProcedureReturn 1
   EndIf
  
   ProcedureReturn 0

EndProcedure

;--------------------------------------------------------------------------------------------------------------

Procedure istknochen(feld.w)

   If feld = #FELD_SKELETT Or feld = #FELD_KNOCHEN1 Or feld = #FELD_KNOCHEN2 Or feld = #FELD_KNOCHEN3 Or feld = #FELD_KNOCHEN4 Or feld = #FELD_KNOCHEN5 Or feld = #FELD_KNOCHEN6 Or feld = #FELD_KNOCHEN7 Or feld = #FELD_KNOCHEN8 Or feld = #FELD_WASSER_SKELETT Or feld = #FELD_WIESE_SKELETT
      ProcedureReturn 1
   EndIf

   ProcedureReturn 0

EndProcedure

;---------------------------------------------------------------------------------------

Procedure is_waterfield(x.w,y.w, level.w = 0)

   If level = 0
      level = spieler(akt_spieler)\level
   EndIf
   testfeld.w = labyrinth(level, x , y)\feld
   If fields(testfeld)\water = 1
      ProcedureReturn 1
   Else
      ProcedureReturn 0
   EndIf
   
EndProcedure
; Raeume

Procedure ork()

   Repeat
      mon = Random(#ANZ_MONSTER-1)+1
   Until has_trait2(mon,#ME_GOBLIN)
           
   ProcedureReturn mon
           
EndProcedure


Procedure raum(act_nr_in_level.w)

Shared xmod, ymod, no_room_intro

      ;mark the rooms fields as unknown on the automap
      For i = 1 To 8
         For j = 1 To 8
            automap(i+room_list()\x,j+room_list()\y)\feld[spieler(akt_spieler)\level] = 0
         Next
      Next
      
      Select (room_list()\type)
         
         Case #RAUM_HAENDLER1:
             ; Haendler!
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HAENDLER1,room_list()\stat1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LAGERFEUER,0,inhalt(spieler(akt_spieler)\level))
             
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
          
          Case #RAUM_WALD:
             ; Wald
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
            Next
             setlaby(room_list()\x+3,room_list()\y+2,spieler(akt_spieler)\level,#FELD_BAUM1,0,0)
             setlaby(room_list()\x+4,room_list()\y+2,spieler(akt_spieler)\level,#FELD_BAUM2,0,0)
             setlaby(room_list()\x+2,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BAUM1,0,0)
             setlaby(room_list()\x+3,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BAUM5,0,0)
             setlaby(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BAUM6,0,0)
             setlaby(room_list()\x+5,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BAUM2,0,0)
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BAUM3,0,0)
             setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BAUM4,0,0)
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BAUM3,0,0)
             setlaby(room_list()\x+5,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BAUM4,0,0)
          
          ; Pentagramm
          Case #RAUM_PENTAGRAMM:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
            Next
            setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_NEXUS,1,inhalt(spieler(akt_spieler)\level))
            
            setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
            setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
            setlaby(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
            setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
          
          ; Altar
          Case #RAUM_ALTAR:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
            Next
            setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_SANKTUM,1,inhalt(spieler(akt_spieler)\level))
            
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
          
          ; Bibliothek
          Case #RAUM_BIBLIOTHEK:
             sonderlevel_text(#SL_BIBLIOTHEK)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+2,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+2,room_list()\y+5,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUECHER2,0,0)
             
             setlaby(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUECHER2,0,0)
             
             setlaby(room_list()\x+6,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_BUECHER1,0,0)
             setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUECHER2,0,0)
          
          ; Alchimist
          Case #RAUM_ALCHIMIST:
             sonderlevel_text(#SL_LABOR)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+2,room_list()\y+3,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+2,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LABOR2,0,0)
             
             setlaby(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LABOR2,0,0)
             
             setlaby(room_list()\x+6,room_list()\y+3,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LABOR1,0,0)
             setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LABOR2,0,0)
          
          ; Statue
          Case #RAUM_STATUE:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+4,spieler(akt_spieler)\level,#FELD_ALTAR1,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_ALTAR2,1,inhalt(spieler(akt_spieler)\level))
             
              setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
              setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
              setlaby(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
              setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
          
          ; Monsterfalle
          Case #RAUM_MONSTERFALLE:
             sonderlevel_text(#SL_MONSTERFALLE)
             For i = 1 To 8
                For j = 1 To 8
                   welches.w = 1
                   Repeat
                      welches = Random(#ANZ_MONSTER2-1) + 1
                      zaehler = zaehler + 1
                   Until monster(welches)\minlevel <= spieler(akt_spieler)\level And has_trait2(welches,#ME_WASSER) = 0
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                   setmonster(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,welches,monster(welches)\nr, monster(welches)\lebenspunkte,0,0,0)
                Next
             Next
             spieler(akt_spieler)\character_x = room_list()\x + 5
             spieler(akt_spieler)\character_y = room_list()\y + 5
          
          ; Truhen
          Case #RAUM_TRUHEN:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             was.w = finden2()
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_GRUENETRUHE1,was,inhalt(spieler(akt_spieler)\level))
             was = finden2()
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_GRUENETRUHE2,was,inhalt(spieler(akt_spieler)\level))
             was = finden2()
             setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_GRUENETRUHE1,was,inhalt(spieler(akt_spieler)\level))
             
             For i = 3 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+3,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
          
          ; Goldsaecke
          Case #RAUM_GOLD:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 1 To 3
                For j = 1 To 3
                   setlaby(i+room_list()\x+3,j+room_list()\y+3,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
                Next
             Next
             
             For i = 3 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+3,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
          
          ; Friedhof
          Case #RAUM_FRIEDHOF:
             sonderlevel_text(#SL_FRIEDHOF)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+2,room_list()\y+2,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+2,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+2,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+8,room_list()\y+2,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+8,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+8,room_list()\y+6,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             
             setlaby(room_list()\x+2,room_list()\y+8,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+8,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+8,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+8,room_list()\y+8,spieler(akt_spieler)\level,#FELD_HEADSTONE,1,inhalt(spieler(akt_spieler)\level))
          
          ; Brunnen
          Case #RAUM_BRUNNEN:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_BRUNNEN,0,inhalt(spieler(akt_spieler)\level))
             
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                    
          ; Schatzraum
          Case #RAUM_SCHATZ:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             was = find1()
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_TRUHE,was,inhalt(spieler(akt_spieler)\level))
             was = find1()
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_TRUHE,was,inhalt(spieler(akt_spieler)\level))
             was = find1()
             setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_TRUHE,was,inhalt(spieler(akt_spieler)\level))
             
             For i = 3 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+3,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
          
          
          ; Feuerdaemon
          Case #RAUM_FEUERDAEMON:
             sonderlevel_text(#SL_DAEMON)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 7
                For j = 2 To 7
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_FEUER1,0,inhalt(spieler(akt_spieler)\level))
                Next
             Next
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+2,spieler(akt_spieler)\level,#FELD_FEUER3,0,inhalt(spieler(akt_spieler)\level))
             Next
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_FEUER3,0,inhalt(spieler(akt_spieler)\level))
             Next
             For i = 2 To 7
                setlaby(room_list()\x+2,room_list()\y+i,spieler(akt_spieler)\level,#FELD_FEUER3,0,inhalt(spieler(akt_spieler)\level))
             Next
             For i = 2 To 7
                setlaby(room_list()\x+7,room_list()\y+i,spieler(akt_spieler)\level,#FELD_FEUER3,0,inhalt(spieler(akt_spieler)\level))
             Next
             For i = 3 To 6
                hugo = #MONSTER_MAGMA_LIZARD
                setmonster(room_list()\x+i,room_list()\y+5,spieler(akt_spieler)\level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,hugo,0,0)
             Next
             hugo = #MONSTER_FIRE_DEMON
             setmonster(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,0,0,act_nr_in_level)
             
             ; set exit
             room_list()\exit_x = room_list()\x+6
             room_list()\exit_y = room_list()\y+2
             
             spieler(akt_spieler)\character_x = room_list()\x + 4
             spieler(akt_spieler)\character_y = room_list()\y + 6
             laby_screen()
             xmod = 0
             ymod = 0
                    
          ; Haendler2
          Case #RAUM_HAENDLER2:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HAENDLER2,room_list()\stat1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LAGERFEUER,0,inhalt(spieler(akt_spieler)\level))
             
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                    
          ; Trainer
          Case #RAUM_LEHRER:
             boden.w = #FELD_KACHELBODEN1 + Random(3)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,boden,0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LEHRER1+Random(9),act_nr_in_level,boden)
             
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                    
          ; Drache
          Case #RAUM_DRACHE:
             sonderlevel_text(#SL_DRACHE)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 7
                For j = 2 To 7
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
                Next
             Next
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+2,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+2,room_list()\y+i,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+7,room_list()\y+i,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             setlaby(room_list()\x+3,room_list()\y+5,spieler(akt_spieler)\level,#FELD_SKELETT,0,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+5,room_list()\y+6,spieler(akt_spieler)\level,#FELD_SKELETT,0,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_SKELETT,0,#FELD_HOEHLE2_LEER)
             was = finden2()
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_GRUENETRUHE2,was,#FELD_HOEHLE2_LEER)
             
             ;set dragon
             hugo = #MONSTER_GREEN_DRAGON
             setmonster(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,0,0,act_nr_in_level)
             
             ; set exit
             room_list()\exit_x = room_list()\x+4
             room_list()\exit_y = room_list()\y+2
             
             spieler(akt_spieler)\character_x = room_list()\x + 4
             spieler(akt_spieler)\character_y = room_list()\y + 6
             laby_screen()
             xmod = 0
             ymod = 0
                   
          ; Lavaschatz
          Case #RAUM_LAVASCHATZ:
             sonderlevel_text(#SL_LAVASCHATZ)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 6
                For j = 2 To 6
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_LAVA,0,0)
                Next
             Next
             was = finden2()
             setlaby(4+room_list()\x,4+room_list()\y,spieler(akt_spieler)\level,#FELD_GRUENETRUHE2,was,#FELD_LAVA)
             laby_screen()
             xmod = 0
             ymod = 0
                    
          ; Stabteil
          Case #RAUM_STABTEIL:
             sonderlevel_text(#SL_STABTEIL)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 7
                For j = 2 To 7
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_LAVA,0,0)
                Next
             Next
             setlaby(5+room_list()\x,5+room_list()\y,spieler(akt_spieler)\level,#FELD_STABTEIL,room_list()\stat1,inhalt(spieler(akt_spieler)\level))
             setlaby(4+room_list()\x,4+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             setlaby(4+room_list()\x,5+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             setlaby(5+room_list()\x,4+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             laby_screen()
             xmod = 0
             ymod = 0
                    
          ; Taverne
          Case #RAUM_TAVERNE:
             sonderlevel_text(#SL_TAVERNE)
             boden.w = #FELD_KACHELBODEN1 + Random(3)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,boden,0,0)
                Next
             Next
             setlaby(room_list()\x+4,room_list()\y+2,spieler(akt_spieler)\level,#FELD_LEHRER2,-1,boden) ; warrior 1
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEHRER3,-1,boden) ; thief 1
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEHRER4,-1,boden) ; warrior 2
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEHRER5,-1,boden) ; thief 2
             setlaby(room_list()\x+5,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEHRER8,-1,boden) ; warrior 3
             setlaby(room_list()\x+3,room_list()\y+7,spieler(akt_spieler)\level,#FELD_LEHRER9,-1,boden) ; thief 3
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LAGERFEUER,-1,boden)
            
          ; Hydra
          Case #RAUM_HYDRA:
             sonderlevel_text(#SL_HYDRA)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 7
                For j = 2 To 7
                   setlaby(room_list()\x+i,room_list()\y+j,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
                Next
             Next
             For i = 3 To 6
                setlaby(i+room_list()\x,6+room_list()\y,spieler(akt_spieler)\level,#FELD_HOEHLE2_LEER,0,0)
             Next
             ; Hydra
             setlaby(room_list()\x+3,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HYDRA1,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HYDRA2,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+5,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HYDRA3,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+6,room_list()\y+3,spieler(akt_spieler)\level,#FELD_HYDRA4,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HYDRA5,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HYDRA6,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+5,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HYDRA7,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HYDRA8,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+3,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HYDRA9,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HYDRA10,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HYDRA11,act_nr_in_level,#FELD_HOEHLE2_LEER)
             setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HYDRA12,act_nr_in_level,#FELD_HOEHLE2_LEER)
             spieler(akt_spieler)\character_x = room_list()\x + 4
             spieler(akt_spieler)\character_y = room_list()\y + 6
             room_list()\stat1 = 9 ; set number of heads in room stat
             laby_screen()
             xmod = 0
             ymod = 0
                    
          ; Schatzraum 2
          Case #RAUM_SCHATZ2:
             sonderlevel_text(#SL_EINGESCHLOSSEN)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+2,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+2,room_list()\y+i,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+7,room_list()\y+i,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),1,0)
             Next
             was = finden2()
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_GRUENETRUHE2,was,inhalt(spieler(akt_spieler)\level))
             was = find1()
             setlaby(room_list()\x+3,room_list()\y+5,spieler(akt_spieler)\level,#FELD_TRUHE,was,inhalt(spieler(akt_spieler)\level))
             was = find1()
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_TRUHE,was,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+5,room_list()\y+6,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
             hugo = #MONSTER_YOUNG_RED_DRAGON
             setlaby(room_list()\x+4,room_list()\y+2,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             setmonster(room_list()\x+4,room_list()\y+2,spieler(akt_spieler)\level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,0,0,0)
             laby_screen()
             xmod = 0
             ymod = 0
                    
          ; Wizard
          Case #RAUM_WIZARD:
             sonderlevel_text(#SL_WIZARD)
             boden.w = #FELD_KACHELBODEN1 + Random(3)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,boden,0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEHRER8,2,boden) 
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_NEXUS,1,boden) 
                 
          ; See
          Case #RAUM_SEE:
             sonderlevel_text(#SL_SEE)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 7
                For j = 2 To 7
                   If Random(100) < 90
                      setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_WASSER,1,0)
                   Else
                      setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_WASSERMONSTER,wassermonster_random(spieler(akt_spieler)\level),#MONSTERSTATUS_NORMAL)
                   EndIf
                Next
             Next
             For i = 4 To 4
                For j = 4 To 5
                   hugo = Random(100)
                   If hugo > 40 And hugo < 60
                      setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_WASSER_GOLDSACK,0,0)
                   EndIf
                   If hugo >= 60 And hugo < 80
                      was.w = find1()
                      setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_WASSER_TRUHE,was,0)
                   EndIf
                   If hugo >= 80 And hugo < 90
                      setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_WASSER_SKELETT,0,0)
                   EndIf
                   If hugo >= 90
                      was = finden2()
                      setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,#FELD_WASSER_GRUENE_TRUHE,was,0)
                   EndIf
                Next
             Next
             setlaby(2+room_list()\x,2+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             setlaby(2+room_list()\x,7+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             setlaby(7+room_list()\x,2+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             setlaby(7+room_list()\x,7+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
             laby_screen()
             xmod = 0
             ymod = 0
                    
          ; Vergessene Schmiede
          Case #RAUM_SCHMIEDE:
             sonderlevel_text(#SL_SCHMIEDE)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
            Next
            setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_AMBOSS,0,inhalt(spieler(akt_spieler)\level))
            
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
            setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
            setlaby(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
            setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LEUCHTER,0,inhalt(spieler(akt_spieler)\level))
                    
          ; Fallen
          Case #RAUM_FALLEN:
             sonderlevel_text(#SL_FALLEN)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 2 To 7
                For j = 2 To 7
                    If level < 10
                       falle = Random(2) + #FELD_SPEERFALLE1
                    EndIf
                    If level > 9
                       falle = Random(8) + #FELD_SPEERFALLE1
                    EndIf
                    setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,falle,Random(99),Random(99))
                Next
             Next
             spieler(akt_spieler)\character_x = room_list()\x + 4
             spieler(akt_spieler)\character_y = room_list()\y + 4
             laby_screen()
             xmod = 0
             ymod = 0
                    
          ; Haendler3
          Case #RAUM_HAENDLER3:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HAENDLER3,room_list()\stat1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LAGERFEUER,0,inhalt(spieler(akt_spieler)\level))
             
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                    
          ; Haendler4
          Case #RAUM_HAENDLER4:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HAENDLER4,room_list()\stat1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LAGERFEUER,0,inhalt(spieler(akt_spieler)\level))
             
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                    
          ; Thronsaal
          Case #RAUM_THRONSAAL:
             sonderlevel_text(#SL_THRONSAAL)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             For i = 3 To 7
                For j = 3 To 7
                   setlaby(room_list()\x+i,room_list()\y+j,spieler(akt_spieler)\level,#FELD_BODEN3,0,0)
                Next
             Next
             For i = 3 To 7
                setlaby(room_list()\x+i,room_list()\y+2,spieler(akt_spieler)\level,#FELD_MAUER3,1,0)
             Next
             For i = 3 To 7
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_MAUER3,1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+3,room_list()\y+i,spieler(akt_spieler)\level,#FELD_MAUER3,1,0)
             Next
             For i = 2 To 7
                setlaby(room_list()\x+7,room_list()\y+i,spieler(akt_spieler)\level,#FELD_MAUER3,1,0)
             Next
             
             setlaby(room_list()\x+5,room_list()\y+4,spieler(akt_spieler)\level,#FELD_TEPPICH2,0,0)
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_TEPPICH1,0,0)
             setlaby(room_list()\x+5,room_list()\y+6,spieler(akt_spieler)\level,#FELD_TEPPICH3,0,0)
             
             welcher.w = Random(2)
             Select(welcher)
                Case 0: koenig = #MONSTER_SPIDER_QUEEN    ; Spinnenkoenigin
                        anhaenger = #MONSTER_GIANT_CROSS_SPIDER ; Riesenkreuzspinne
                        spinnenkoenigin(spieler(akt_spieler)\level) = 1
                Case 1: koenig = #MONSTER_GOBLIN_KING    ; Goblinkoenig
                        anhaenger = #MONSTER_ORC ; Ork
                        goblinkoenig(spieler(akt_spieler)\level) = 1
                Case 2: koenig = #MONSTER_LORD_OF_THE_UNDEAD    ; Herr der Untoten
                        anhaenger = #MONSTER_ZOMBIE ; Zombie
                        untotenherr(spieler(akt_spieler)\level) = 1
             EndSelect
             
             setmonster(room_list()\x+5,room_list()\y+3,spieler(akt_spieler)\level,koenig,monster(koenig)\nr,monster(koenig)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,act_nr_in_level)
             
             setmonster(room_list()\x+6,room_list()\y+3,spieler(akt_spieler)\level,anhaenger,monster(anhaenger)\nr,monster(anhaenger)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)

             ; set exit
             room_list()\exit_x = room_list()\x+5
             room_list()\exit_y = room_list()\y+2
             
             setmonster(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,anhaenger,monster(anhaenger)\nr,monster(anhaenger)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)
             
             spieler(akt_spieler)\character_x = room_list()\x+5
             spieler(akt_spieler)\character_y = room_list()\y+6
             xmod = 0
             ymod = 0
                    
          ; Haendler5
          Case #RAUM_HAENDLER5:
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HAENDLER4_4,room_list()\stat1,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_LAGERFEUER,0,inhalt(spieler(akt_spieler)\level))
             
             For i = 2 To 7
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                setlaby(room_list()\x+i,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             Next
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
             setlaby(room_list()\x+7,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BUSCH,0,0)
                    
          ; Fallen+Schatz
          Case #RAUM_FALLEN_SCHATZ:
             sonderlevel_text(#SL_FALLEN_SCHATZ)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             ; Waende
             For i = 2 To 7
                setlaby(i+room_list()\x,2+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
                setlaby(2+room_list()\x,i+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
                setlaby(7+room_list()\x,i+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
             Next
             For i = 4 To 7
                setlaby(i+room_list()\x,7+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
                setlaby(4+room_list()\x,i+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
             Next
             ; Fallen
             For i = 3 To 7
                 If spieler(akt_spieler)\level < 10
                    akt_falle.w = Random(2) + #FELD_SPEERFALLE1
                 EndIf
                 If spieler(akt_spieler)\level > 9
                    akt_falle = Random(8) + #FELD_SPEERFALLE1
                 EndIf
                setlaby(room_list()\x+3,room_list()\y+i,spieler(akt_spieler)\level,akt_falle,Random(99),Random(99))
             Next
             For i = 4 To 6
                 If spieler(akt_spieler)\level < 10
                    akt_falle = Random(2) + #FELD_SPEERFALLE1
                 EndIf
                 If spieler(akt_spieler)\level > 9
                    akt_falle = Random(8) + #FELD_SPEERFALLE1
                 EndIf
                setlaby(room_list()\x+i,room_list()\y+3,spieler(akt_spieler)\level,akt_falle,Random(99),Random(99))
             Next
              If spieler(akt_spieler)\level < 10
                 akt_falle = Random(2) + #FELD_SPEERFALLE1
              EndIf
              If spieler(akt_spieler)\level > 9
                 akt_falle = Random(8) + #FELD_SPEERFALLE1
              EndIf
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,akt_falle,Random(99),Random(99))
             
             ; Schaetze
             setlaby(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+5,room_list()\y+6,spieler(akt_spieler)\level,#FELD_GRUENETRUHE2,finden2(),inhalt(spieler(akt_spieler)\level))
                    
          ; Gefaengnis
          Case #RAUM_GEFAENGNIS:
             sonderlevel_text(#SL_GEFAENGNIS)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             ; Waende
             For i = 2 To 7
                setlaby(i+room_list()\x,2+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
             Next
             For i = 2 To 6
                setlaby(2+room_list()\x,i+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
                setlaby(2+room_list()\x,i+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
                setlaby(7+room_list()\x,i+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
             Next
             For i = 4 To 7
                setlaby(i+room_list()\x,4+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
                setlaby(i+room_list()\x,6+room_list()\y,spieler(akt_spieler)\level,mit_was(spieler(akt_spieler)\level),0,0)
             Next
             
             ; Gefangene+Waechter
             mon = 139
             setmonster(room_list()\x+3,room_list()\y+5,spieler(akt_spieler)\level,mon,monster(mon)\nr,monster(mon)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)
             mon = 131
             setmonster(room_list()\x+5,room_list()\y+3,spieler(akt_spieler)\level,mon,monster(mon)\nr,monster(mon)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)
             mon = 108
             setmonster(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,mon,monster(mon)\nr,monster(mon)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)
             
             ; Tueren
             setlaby(room_list()\x+4,room_list()\y+3,spieler(akt_spieler)\level,#FELD_TUER2,0,0)
             setlaby(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#FELD_TUER2,0,0)
             setlaby(room_list()\x+3,room_list()\y+6,spieler(akt_spieler)\level,#FELD_TUER2,2,0)
             
             ; Schluessel+Schaetze
             setlaby(room_list()\x+6,room_list()\y+3,spieler(akt_spieler)\level,#FELD_GOLD,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#FELD_TRUHE,finden2(),inhalt(spieler(akt_spieler)\level))
             setitem(room_list()\x+3,room_list()\y+3,spieler(akt_spieler)\level,#OBJGRAFIK_SILBERNER_SCHLUESSEL,0,0)
          
          ; Ork Dorf
          Case #RAUM_ORK_DORF:
             sonderlevel_text(#SL_ORK_DORF)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             
             setlaby(room_list()\x+2,room_list()\y+2,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+4,room_list()\y+2,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+2,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+2,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+3,room_list()\y+6,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+5,room_list()\y+6,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_LAGERFEUER,0,inhalt(spieler(akt_spieler)\level))
             setlaby(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,#FELD_TRUHE,find1(),inhalt(spieler(akt_spieler)\level))
             
             ; Orks setzen
             For i = 2 To 7
              For j = 2 To 7
                If Random(100) > 50
                 mon = ork()
                 If labyrinth(spieler(akt_spieler)\level,room_list()\x+i,room_list()\x+j)\feld <> #FELD_LAGERFEUER
                    setmonster(room_list()\x+i,room_list()\y+j,spieler(akt_spieler)\level,mon,monster(mon)\nr,monster(mon)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)
                 EndIf
                EndIf
              Next
             Next
                    
          ; Hexenhaus
          Case #RAUM_HEXENHAUS:
             sonderlevel_text(#SL_HEXENHAUS)
             For i = 1 To 8
                For j = 1 To 8
                   setlaby(i+room_list()\x,j+room_list()\y,spieler(akt_spieler)\level,inhalt(spieler(akt_spieler)\level),0,0)
                Next
             Next
             
             setlaby(room_list()\x+3,room_list()\y+5,spieler(akt_spieler)\level,#FELD_HUETTE,0,inhalt(spieler(akt_spieler)\level))
             
             ; Baeume setzen
             setlaby(room_list()\x+3,room_list()\y+2,spieler(akt_spieler)\level,#FELD_BAUM_KLEIN,0,0)
             setlaby(room_list()\x+6,room_list()\y+2,spieler(akt_spieler)\level,#FELD_BAUM_KLEIN,0,0)
             setlaby(room_list()\x+4,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BAUM_KLEIN,0,0)
             setlaby(room_list()\x+6,room_list()\y+4,spieler(akt_spieler)\level,#FELD_BAUM_KLEIN,0,0)
             setlaby(room_list()\x+2,room_list()\y+5,spieler(akt_spieler)\level,#FELD_BAUM_KLEIN,0,0)
             setlaby(room_list()\x+5,room_list()\y+6,spieler(akt_spieler)\level,#FELD_BAUM_KLEIN,0,0)
             setlaby(room_list()\x+3,room_list()\y+7,spieler(akt_spieler)\level,#FELD_BAUM_KLEIN,0,0)
             
             ; Hexe setzen
             mon = 37
             setmonster(room_list()\x+3,room_list()\y+4,spieler(akt_spieler)\level,mon,monster(mon)\nr,monster(mon)\lebenspunkte,#MONSTERSTATUS_NORMAL,0,0)
             
             ; Pilze setzen
             setitem(room_list()\x+5,room_list()\y+2,spieler(akt_spieler)\level,#OBJGRAFIK_PILZE_SCHWARZ+Random(9),0,0)
             setitem(room_list()\x+6,room_list()\y+3,spieler(akt_spieler)\level,#OBJGRAFIK_PILZE_SCHWARZ+Random(9),0,0)
             setitem(room_list()\x+4,room_list()\y+5,spieler(akt_spieler)\level,#OBJGRAFIK_PILZE_SCHWARZ+Random(9),0,0)
             setitem(room_list()\x+5,room_list()\y+5,spieler(akt_spieler)\level,#OBJGRAFIK_PILZE_SCHWARZ+Random(9),0,0)
             setitem(room_list()\x+6,room_list()\y+5,spieler(akt_spieler)\level,#OBJGRAFIK_PILZE_SCHWARZ+Random(9),0,0)
             setitem(room_list()\x+4,room_list()\y+6,spieler(akt_spieler)\level,#OBJGRAFIK_PILZE_SCHWARZ+Random(9),0,0)
             setitem(room_list()\x+6,room_list()\y+6,spieler(akt_spieler)\level,#OBJGRAFIK_PILZE_SCHWARZ+Random(9),0,0)
             
             ; Heilkraeuter setzen
             setitem(room_list()\x+2,room_list()\y+2,spieler(akt_spieler)\level,#OBJGRAFIK_KRAEUTER,0,0)
             setitem(room_list()\x+4,room_list()\y+2,spieler(akt_spieler)\level,#OBJGRAFIK_KRAEUTER,0,0)
             setitem(room_list()\x+2,room_list()\y+3,spieler(akt_spieler)\level,#OBJGRAFIK_KRAEUTER,0,0)
             setitem(room_list()\x+3,room_list()\y+3,spieler(akt_spieler)\level,#OBJGRAFIK_KRAEUTER,0,0)
             setitem(room_list()\x+2,room_list()\y+6,spieler(akt_spieler)\level,#OBJGRAFIK_KRAEUTER,0,0)
             setitem(room_list()\x+2,room_list()\y+7,spieler(akt_spieler)\level,#OBJGRAFIK_KRAEUTER,0,0)
             
      EndSelect
      FlipBuffers()


EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 733
; FirstLine = 696
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
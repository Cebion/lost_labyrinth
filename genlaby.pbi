; Labyrinth generieren
;---------------------------------------------------------------------------------------

; horizontal spiegeln
Procedure horizontal(akt_level.w)

   For i = 1 To groesse(akt_level)/2
      For j = 1 To groesse(akt_level)
         save_feld.w = labyrinth(akt_level,i,j)\feld
         save_stat1.w = labyrinth(akt_level,i,j)\stat1
         save_stat2.w = labyrinth(akt_level,i,j)\stat2
         
         save_name2.w = laby_item(i,j)\name[akt_level]
         save_anzahl.w = laby_item(i,j)\anzahl[akt_level]
         save_status2.w = laby_item(i,j)\status[akt_level]
         
         labyrinth(akt_level,i,j)\feld = labyrinth(akt_level,groesse(akt_level)+1-i,j)\feld
         labyrinth(akt_level,i,j)\stat1 = labyrinth(akt_level,groesse(akt_level)+1-i,j)\stat1
         labyrinth(akt_level,i,j)\stat2 = labyrinth(akt_level,groesse(akt_level)+1-i,j)\stat2
         
         laby_item(i,j)\name[akt_level] = laby_item(groesse(akt_level)+1-i,j)\name[akt_level]
         laby_item(i,j)\anzahl[akt_level] = laby_item(groesse(akt_level)+1-i,j)\anzahl[akt_level]
         laby_item(i,j)\status[akt_level] = laby_item(groesse(akt_level)+1-i,j)\status[akt_level]
         
         labyrinth(akt_level,groesse(akt_level)+1-i,j)\feld = save_feld
         labyrinth(akt_level,groesse(akt_level)+1-i,j)\stat1 = save_stat1
         labyrinth(akt_level,groesse(akt_level)+1-i,j)\stat2 = save_stat2
         
         laby_item(groesse(akt_level)+1-i,j)\name[akt_level] = save_name2
         laby_item(groesse(akt_level)+1-i,j)\anzahl[akt_level] = save_anzahl
         laby_item(groesse(akt_level)+1-i,j)\status[akt_level] = save_status2
         
      Next
   Next
   
   For i = 1 To groesse(akt_level)
      For j = 1 To groesse(akt_level)
         If labyrinth(akt_level,i,j)\feld = #FELD_TELEPORTER
            labyrinth(akt_level,i,j)\stat1 = groesse(akt_level)+1-labyrinth(akt_level,i,j)\stat1
         EndIf
      Next
   Next
   
   foreach room_list()
      if room_list()\level = akt_level
         room_list()\x = (-1*room_list()\x) + groesse(akt_level) - 8
      endif
   next
      
   eingangx(akt_level) = groesse(akt_level)
   ausgangx(akt_level) = groesse(akt_level)+1-ausgangx(akt_level)
   
   ChangeCurrentElement(monster_list(),first_monster(akt_level)\p)
   While monster_list()\z = akt_level
     monster_list()\x = groesse(akt_level)+1 - monster_list()\x
     NextElement(monster_list())
   Wend
   
EndProcedure

 
 ; vertikal spiegeln
Procedure vertikal(akt_level.w)

   For i = 1 To groesse(akt_level)
      For j = 1 To groesse(akt_level)/2
      
         save_feld.w = labyrinth(akt_level,i,j)\feld
         save_stat1.w = labyrinth(akt_level,i,j)\stat1
         save_stat2.w = labyrinth(akt_level,i,j)\stat2
         
         save_name2.w = laby_item(i,j)\name[akt_level]
         save_anzahl.w = laby_item(i,j)\anzahl[akt_level]
         save_status2.w = laby_item(i,j)\status[akt_level]
         
         labyrinth(akt_level,i,j)\feld = labyrinth(akt_level,i,groesse(akt_level)+1-j)\feld
         labyrinth(akt_level,i,j)\stat1 = labyrinth(akt_level,i,groesse(akt_level)+1-j)\stat1
         labyrinth(akt_level,i,j)\stat2 = labyrinth(akt_level,i,groesse(akt_level)+1-j)\stat2
         
         laby_item(i,j)\name[akt_level] = laby_item(i,groesse(akt_level)+1-j)\name[akt_level]
         laby_item(i,j)\anzahl[akt_level] = laby_item(i,groesse(akt_level)+1-j)\anzahl[akt_level]
         laby_item(i,j)\status[akt_level] = laby_item(i,groesse(akt_level)+1-j)\status[akt_level]
         
         labyrinth(akt_level,i,groesse(akt_level)+1-j)\feld = save_feld
         labyrinth(akt_level,i,groesse(akt_level)+1-j)\stat1 = save_stat1
         labyrinth(akt_level,i,groesse(akt_level)+1-j)\stat2 = save_stat2
         
         laby_item(i,groesse(akt_level)+1-j)\name[akt_level] = save_name2
         laby_item(i,groesse(akt_level)+1-j)\anzahl[akt_level] = save_anzahl
         laby_item(i,groesse(akt_level)+1-j)\status[akt_level] = save_status2
         
      Next
   Next
   
   For i = 1 To groesse(akt_level)
      For j = 1 To groesse(akt_level)
         If labyrinth(akt_level,i,j)\feld = #FELD_TELEPORTER
            labyrinth(akt_level,i,j)\stat2 = groesse(akt_level)+1-labyrinth(akt_level,i,j)\stat2
         EndIf
      Next
   Next
   
   foreach room_list()
      if room_list()\level = akt_level
         room_list()\y = (-1*room_list()\y) + groesse(akt_level) - 8 ; roomsize
      endif
   next
      
   eingangy(akt_level) = groesse(akt_level)
   ausgangy(akt_level) = groesse(akt_level)+1-ausgangy(akt_level)
   
   ChangeCurrentElement(monster_list(),first_monster(akt_level)\p)
   While monster_list()\z = akt_level
     monster_list()\y = groesse(akt_level)+1 - monster_list()\y
     NextElement(monster_list())
   Wend

EndProcedure


 ; Diagonal Spiegeln
Procedure diagonal(akt_level.w)

   j.w = 1
   hugo.w = 1
   Repeat
      i = 1 + hugo
      Repeat
      
         save_feld.w = labyrinth(akt_level,i,j)\feld
         save_stat1.w = labyrinth(akt_level,i,j)\stat1
         save_stat2.w = labyrinth(akt_level,i,j)\stat2
         
         save_name2.w = laby_item(i,j)\name[akt_level]
         save_anzahl.w = laby_item(i,j)\anzahl[akt_level]
         save_status2.w = laby_item(i,j)\status[akt_level]
         
         labyrinth(akt_level,i,j)\feld = labyrinth(akt_level,j,i)\feld
         labyrinth(akt_level,i,j)\stat1 = labyrinth(akt_level,j,i)\stat1
         labyrinth(akt_level,i,j)\stat2 = labyrinth(akt_level,j,i)\stat2
         
         laby_item(i,j)\name[akt_level] = laby_item(j,i)\name[akt_level]
         laby_item(i,j)\anzahl[akt_level] = laby_item(j,i)\anzahl[akt_level]
         laby_item(i,j)\status[akt_level] = laby_item(j,i)\status[akt_level]
         
         labyrinth(akt_level,j,i)\feld = save_feld
         labyrinth(akt_level,j,i)\stat1 = save_stat1
         labyrinth(akt_level,j,i)\stat2 = save_stat2
         
         laby_item(j,i)\name[akt_level] = save_name2
         laby_item(j,i)\anzahl[akt_level] = save_anzahl
         laby_item(j,i)\status[akt_level] = save_status2
          
         i = i + 1
      Until i > groesse(akt_level)
      hugo = hugo + 1
      j = j + 1
   Until j > groesse(akt_level)
   
   For i = 1 To groesse(akt_level)
      For j = 1 To groesse(akt_level)
         If labyrinth(akt_level,i,j)\feld = #FELD_TELEPORTER
            save.w = labyrinth(akt_level,i,j)\stat1
            labyrinth(akt_level,i,j)\stat1 = labyrinth(akt_level,i,j)\stat2
            labyrinth(akt_level,i,j)\stat2 = save
         EndIf
      Next
   Next
   
   foreach room_list()
      if room_list()\level = akt_level
         save_x.w = room_list()\x
         room_list()\x = room_list()\y
         room_list()\y = save_x
      endif
   next
         
   save = ausgangy(akt_level)
   ausgangy(akt_level) = ausgangx(akt_level)
   ausgangx(akt_level) = save
 
   ChangeCurrentElement(monster_list(),first_monster(akt_level)\p)
   While monster_list()\z = akt_level
     xxx = monster_list()\x
     yyy = monster_list()\y
     monster_list()\x = yyy
     monster_list()\y = xxx
     NextElement(monster_list())
   Wend
   
EndProcedure


Procedure Gang_graben(x.w,y.w,wand.w,hauptgang.w,mit_was.w,level.w)

Shared posX, posY, ganglaenge


  ganglaenge = 0
  setlaby(x,y,level,inhalt(level),0,0)
  stat = 1
  
  While stat < 3
    richtung=Random(100)

    If y > 1 And ((stat = 1 And richtung < 25) Or stat = 2)
      If labyrinth(level,x,y-2)\feld = mit_was(level)
        setlaby(x,y-1,level,inhalt(level),0,0)
        setlaby(x,y-2,level,inhalt(level),0,0)
        ganglaenge=ganglaenge+2
        y=y-2
        stat=0
      EndIf
    EndIf

    If y < groesse(level) - 1 And ((stat = 1 And richtung >= 25 And richtung < 50) Or stat = 2)
      If labyrinth(level,x,y+2)\feld = mit_was(level)
        setlaby(x,y+1,level,inhalt(level),0,0)
        setlaby(x,y+2,level,inhalt(level),0,0)
        ganglaenge = ganglaenge + 2
        y = y + 2
        stat = 0
      EndIf
    EndIf

    If x > 1 And ((stat = 1 And richtung >= 50 And richtung < 75) Or stat = 2)
      If labyrinth(level,x-2,y)\feld = mit_was(level)
        setlaby(x-1,y,level,inhalt(level),0,0)
        setlaby(x-2,y,level,inhalt(level),0,0)
        ganglaenge = ganglaenge + 2
        x=x-2
        stat=0
      EndIf
    EndIf

    If x < groesse(level) - 1 And ((stat = 1 And richtung >= 75) Or stat = 2)
      If labyrinth(level,x + 2,y)\feld = mit_was(level)
        setlaby(x + 1,y,level,inhalt(level),0,0)
        setlaby(x + 2,y,level,inhalt(level),0,0)
        ganglaenge = ganglaenge + 2
        x = x + 2
        stat = 0
      EndIf
    EndIf

    stat = stat + 1
  Wend

  gangende=inhalt(level)
  If hauptgang=0
    willi = Random(100)
      If willi < 25
         If Random(100) > 90
            gangende = #FELD_SCHACHT
         Else
           gangende = #FELD_GOLD
        EndIf
      EndIf
      If willi >= 25 And willi < 50
        gangende = #FELD_TRUHE
        If Random(100) > 90
           If Random(100) > 50
              gangende=#FELD_BLAUETRUHE1
           Else
              gangende=#FELD_BLAUETRUHE2
           EndIf
        EndIf
        If Random(100) < 50 And Random(99)<level And level > 9
           gangende=#FELD_MIMIC
        EndIf
      EndIf
      If willi >=50 And willi < 75
         gangende=inhalt(level)
      EndIf
    If willi >= 75
      If Random(100) > 50
         gangende = #FELD_VERBORGENER_SCHATZ
      Else
         setitem(x,y,level,#OBJGRAFIK_PILZE_SCHWARZ+Random(#ANZ_PILZE-1),0,0)
      EndIf
    EndIf
    If gangende=#FELD_TRUHE And Random(99)<level/3
      gangende=#FELD_GRUENETRUHE1
    EndIf
    
    was.w = 0
    worin.w = 0
    If gangende = #FELD_TRUHE
         was = find1()
    EndIf
    If gangende = #FELD_GRUENETRUHE1
         was = finden2()
    EndIf
    If gangende = #FELD_BLAUETRUHE1 Or gangende = #FELD_BLAUETRUHE2
         If Random(100) > 50
                was = find1()
         Else
                was = finden2()
         EndIf
    EndIf
    If gangende = #FELD_VERBORGENER_SCHATZ
        If Random(100) > 50
            If Random(100) > 80
                was = finden2()
                If Random(100) > 80
                    worin = #FELD_GRUENETRUHE2
                Else
                    worin = #FELD_GRUENETRUHE1
                EndIf
            Else
                worin = #FELD_TRUHE
                was = find1()
            EndIf
        Else
            worin = #FELD_GOLD
            was = inhalt(level)
        EndIf
    EndIf
    If worin = 0 ;non hidden treasure
        worin = was
        was = 0
    EndIf
    setlaby(x,y,level,gangende,worin,was)

    If x > 1
       If labyrinth(level,x-2,y)\feld = inhalt(level) And labyrinth(level,x-1,y)\feld = wand And x > 1
          hugo = Random(100)
          If hugo < 34
             If sonderlevel(level) = 0
                 setlaby(x-1,y,level,#FELD_GEHEIMGANG,Random(99),0)
              EndIf
          EndIf
          If hugo >= 34 And hugo < 67
             setlaby(x-1,y,level,inhalt(level),0,0)
          EndIf
          If hugo >= 67
             If sonderlevel(level) <> #SL_SUMPF
                offen.w = 0
                If Random(100) > 85
                   offen = 2
                EndIf
                setlaby(x-1,y,level,#FELD_TUER2,offen,0)
             EndIf
          EndIf
       EndIf
    EndIf
    If labyrinth(level,x+2,y)\feld = inhalt(level) And labyrinth(level,x+1,y)\feld = wand And x < groesse(level)-2
         hugo = Random(100)
         If hugo < 34
            If sonderlevel(level) = 0
               setlaby(x+1,y,level,#FELD_GEHEIMGANG,Random(99),0)
            EndIf
         EndIf
         If hugo >= 34 And hugo < 67
            setlaby(x+1,y,level,inhalt(level),0,0)
         EndIf
         If hugo >= 67
            If sonderlevel(level) <> #SL_SUMPF
                offen.w = 0
                If Random(100) > 85
                   offen = 2
                EndIf
               setlaby(x+1,y,level,#FELD_TUER2,offen,0)
            EndIf
         EndIf
    EndIf
    If y > 1
    If labyrinth(level,x,y-2)\feld = inhalt(level) And labyrinth(level,x,y-1)\feld = wand And y > 1
          hugo = Random(100)
          If hugo < 34
             If sonderlevel(level) = 0
                setlaby(x,y-1,level,#FELD_GEHEIMGANG,Random(99),0)
             EndIf
          EndIf
          If hugo >= 34 And hugo < 67
             setlaby(x,y-1,level,inhalt(level),0,0)
          EndIf
          If hugo >= 67
             If sonderlevel(level) <> #SL_SUMPF
                offen.w = 0
                If Random(100) > 85
                   offen = 2
                EndIf
                setlaby(x,y-1,level,#FELD_TUER2,offen,0)
             EndIf
          EndIf
       EndIf
    EndIf
    If labyrinth(level,x,y+2)\feld = inhalt(level) And labyrinth(level,x,y+1)\feld=wand And y < groesse(level)-2
         hugo = Random(100)
         If hugo < 34
             If sonderlevel(level) = 0
                setlaby(x,y-1,level,#FELD_GEHEIMGANG,Random(99),0)
             EndIf
         EndIf
         If hugo >= 34 And hugo < 67
            setlaby(x,y+1,level,inhalt(level),0,0)
         EndIf
         If hugo >= 67
            If sonderlevel(level) <> #SL_SUMPF
                offen.w = 0
                If Random(100) > 85
                   offen = 2
                EndIf
               setlaby(x,y+1,level,#FELD_TUER2,offen,0)
            EndIf
         EndIf
    EndIf
  EndIf

  posX = x
  posY = y

EndProcedure

;---------------------------------------------------------------------------------------
; Raum
Procedure setzen(x_length.w, y_length.w, level.w, type.w, nr_in_level.w)

   zaehler.w = 1
   Repeat
      frei = 0
      Repeat
         x.w = Random(groesse(level)-9)
      Until x > 3
      Repeat
         y.w = Random(groesse(level)-9)
      Until y > 3
      x = x / 2
      y = y / 2
      x = x * 2
      y = y * 2
      For i = 1 To x_length
         For j = 1 To y_length
            tile.w = labyrinth(level,i+x,j+y)\feld
            If  tile = #FELD_EINGANG Or tile = #FELD_AUSGANG Or tile = #FELD_FRAGEZEICHEN Or fields(tile)\water = 1 
               frei = 1
            EndIf
         Next
      Next
      zaehler = zaehler + 1
   Until (x > 0 And y > 0 And frei = 0) Or zaehler > 500
   If zaehler <= 500
      room_list()\x = x
      room_list()\y = y
      For i = 1 To x_length
         For j = 1 To y_length
            setlaby(i+x,j+y,level,#FELD_FRAGEZEICHEN,0,nr_in_level)
            setitem(i+x,j+y,level,0,0,0) ;remove items
         Next
      Next
   EndIf
             
EndProcedure

; ---------------------------------------------------------------------------------------

Procedure setmonster(xx.w, yy.w, level.w, name.w, graphic.w, lifepoints.w, status.w, duration.w, room.w)
;this procedure is meant for creating new monsters
;not for changing values of existing ones

   ChangeCurrentElement(monster_list(),first_monster(level)\p)
   InsertElement(monster_list())
   
   first_monster(level)\p = @monster_list()
   
   monster_list()\x = xx
   monster_list()\y = yy
   monster_list()\z = level
   monster_list()\number = name
   monster_list()\hp = lifepoints
   monster_list()\status = status
   monster_list()\duration = duration
   monster_list()\room = room
   monster_list()\container = 0 ;default to no chest
   monster_list()\item = 0 ;default to no item
   monster_list()\skilldrop = Random(999)

   container.w = 0
   item.w = 0
   If name = #MONSTER_SPIDER_QUEEN
      If Random(99) < 70
         Select(Random(3)+1)
            Case 1: item = #OBJGRAFIK_GIFTSCHWERT
            Case 2: item = #OBJGRAFIK_GOLDENER_SCHLUESSEL
            Case 3: item = #OBJGRAFIK_PFEIL2
            Case 4: item = #OBJGRAFIK_RING_KLEIN3
         EndSelect
      EndIf
   EndIf
   If name = #MONSTER_GOBLIN_KING
      If Random(99) < 70
         Select(Random(4)+1)
            Case 1: item = #OBJGRAFIK_RING_GRUEN
            Case 2: item = #OBJGRAFIK_MASKE1
            Case 3: item = #OBJGRAFIK_AMULETT1_ROT
            Case 4: item = #OBJGRAFIK_AMULETT3
            Case 5: item = #OBJGRAFIK_RING2
         EndSelect
      EndIf
   EndIf
   If name = #MONSTER_LORD_OF_THE_UNDEAD
      If Random(99) < 70
         Select(Random(1)+1)
            Case 1: item = #OBJGRAFIK_AMULETT1
            Case 2: item = #OBJGRAFIK_AMULETT2
         EndSelect
      EndIf
   EndIf
   If name = #MONSTER_UNICORN
      If Random(99) < 10
         item = #OBJGRAFIK_HORN
      EndIf
   EndIf

   ; magic treasure trait
   If has_trait2(name,#ME_HAT_MAG_SCHATZ) = 1 And Random(1) And item = 0
      tresaure.w = Random(99)
      If tresaure < 60
         container = #FELD_GOLD
         item = -1 ; gold insted of item
      ElseIf tresaure < 80
         container = #FELD_TRUHE
         item = find1()
      ElseIf tresaure < 90
         If Random(1)
            container = #FELD_BLAUETRUHE1
         Else
            container = #FELD_BLAUETRUHE2
         EndIf
         If Random(1)
            item = find1()
         Else
            item = finden2()
         EndIf
      Else
         container = #FELD_GRUENETRUHE2
         item = finden2()
      EndIf
   EndIf
   
   ; normal treasure trait
   If has_trait2(name,#ME_HAT_SCHATZ) = 1 And Random(1) And item = 0
      tresaure.w = Random(99)
      If tresaure < 75
         container = #FELD_GOLD
         item = -1 ; gold insted of item
      ElseIf tresaure < 95
         container = #FELD_TRUHE
         item = find1()
      Else
         If Random(1)
            container = #FELD_BLAUETRUHE1
         Else
            container = #FELD_BLAUETRUHE2
         EndIf
         If Random(1)
            item = find1()
         Else
            item = finden2()
         EndIf
      EndIf
   EndIf
   monster_list()\container = container
   monster_list()\item = item

EndProcedure
; ---------------------------------------------------------------------------------------

Procedure remove_monster()
  ;this only sets the status and moves the monster far outside the labyrinth
  ;as it it dangerous to actually remove global list elements inside recursive procedure calls
  ;instead we actually remove those dead monsters from the list after the damage dealing
  
  ;print("remove_monster:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
   
   monster_list()\x = -1000
   monster_list()\y = -1000
   monster_list()\status = #MONSTERSTATUS_TOT
   dead_monsters = monster_list()\z
   ;if room_monster open door
   act_room.w = monster_list()\room
   If act_room > 0
      ResetList(room_list())
      Repeat
         NextElement(room_list())
      Until (room_list()\nr_in_level = act_room) And (room_list()\level = spieler(akt_spieler)\level)
      Sound(#SOUND_HARP)
      setlaby(room_list()\exit_x,room_list()\exit_y,spieler(akt_spieler)\level,#FELD_OFFENE_TUER,0,0)
   EndIf
      

EndProcedure

Procedure cleanup_monsters()
  ;this will delete all the dead monsters from the list
   act_mon.monster_pointer
   If dead_monsters
     ChangeCurrentElement(monster_list(),first_monster(dead_monsters)\p)
     While monster_list()\z = dead_monsters
       act_mon\p = @monster_list()
       If monster_list()\status = #MONSTERSTATUS_TOT
         If act_mon\p = first_monster(dead_monsters)\p
           NextElement(monster_list())
           first_monster(dead_monsters)\p = @monster_list()
           PreviousElement(monster_list())
         EndIf
         DeleteElement(monster_list())
       EndIf
       NextElement(monster_list())
     Wend
     dead_monsters = 0
   Else
     ProcedureReturn 0
   EndIf
   
EndProcedure

; ---------------------------------------------------------------------------------------

Procedure getmonster(xx.w, yy.w, level.w = -1)
   Shared akt_spieler
   If level = -1
     level = spieler(akt_spieler)\level
   EndIf
   ChangeCurrentElement(monster_list(),first_monster(level)\p)
   While monster_list()\z = level
     If monster_list()\x = xx And monster_list()\y = yy
       ProcedureReturn monster_list()\number
     EndIf
     NextElement(monster_list())
   Wend
   ProcedureReturn 0
EndProcedure

; ---------------------------------------------------------------------------------------

Procedure setitem(xx.w, yy.w, level.w, name.w, anzahl.w, status.w)

   laby_item(xx,yy)\name[level] = name
   If item(name)\qualitaet = 1 And anzahl = 0
     anzahl = get_chance(3)
   ElseIf item(name)\qualitaet = 3 And anzahl = 0
     anzahl = 2*get_chance(3)
   EndIf
   laby_item(xx,yy)\anzahl[level] = anzahl
   laby_item(xx,yy)\status[level] = status

EndProcedure
; ---------------------------------------------------------------------------------------

Procedure monster_setzen(level, welches)

  x.w = 0
  y.w = 0
   zaehler.w = 1
   Repeat
      x=Random(groesse(level)-3)+2
      y=Random(groesse(level)-3)+2
      zaehler = zaehler + 1
   Until (blockiert2(x,y,level) = 0 And getmonster(x,y,level) = 0) Or zaehler > 500
   
   If zaehler <= 500
      monstat.w = #MONSTERSTATUS_NORMAL
      If Random(100) > 90 Or levelmod(level) = #LM_ALERTED_MONSTERS
         If Random(100) > 50 And levelmod(level) <> #LM_ALERTED_MONSTERS
            If has_trait2(welches,#ME_SCHLAEFT) = 1
               monstat = #MONSTERSTATUS_SCHLAEFT
            Else
               monstat = #MONSTERSTATUS_ALERT
            EndIf
         Else
            monstat = #MONSTERSTATUS_ALERT
         EndIf
      EndIf
      setmonster(x,y,level,welches,monster(welches)\nr,monster(welches)\lebenspunkte,monstat,0,0)
   EndIf

EndProcedure

; ---------------------------------------------------------------------------------------

Procedure wassermonster_setzen(level, welches)

  x.w = 0
  y.w = 0
   zaehler.w = 1
   Repeat
      x=Random(groesse(level)-3)+2
      y=Random(groesse(level)-3)+2
      zaehler = zaehler + 1
   Until labyrinth(level,x,y)\feld = #FELD_WASSER Or zaehler > 500
   
   If zaehler <= 500
      monstat.w = #MONSTERSTATUS_NORMAL
      If Random(100) > 90 Or levelmod(level) = #LM_ALERTED_MONSTERS
         If Random(100) > 50 And levelmod(level) <> #LM_ALERTED_MONSTERS
            If has_trait2(welches,#ME_SCHLAEFT) = 1
               monstat = #MONSTERSTATUS_SCHLAEFT
            Else
               monstat = #MONSTERSTATUS_ALERT
            EndIf
         Else
            monstat = #MONSTERSTATUS_ALERT
         EndIf
      EndIf
      setlaby(x,y,level,#FELD_WASSERMONSTER,welches,monstat)

      ;setmonster(x,y,level,welches,monster(welches)\nr,monster(welches)\lebenspunkte,monstat,0)
   EndIf

EndProcedure


; ---------------------------------------------------------------------------------------

Procedure gen_laby(akt_level.w)

Shared posX ,posY, ganglaenge, nr, mit_was_normal, inhalt_normal

   groesse(akt_level) = akt_level+10
   
   eingangx(akt_level) = 1
   eingangy(akt_level) = 1
   
   If TEST = 1
      groesse(akt_level) = 30
   EndIf

    ; Tiles wechseln?
    verg1.f = akt_level / 5
    verg2.f = Int(akt_level / 5)
    If verg1 = verg2
       If Random(5) > 4
          mit_was_normal = #FELD_MAUER
       Else
          mit_was_normal = #FELD_MAUER2 + Random(3)
       EndIf
       If Random(6) > 5
          inhalt_normal = #FELD_LEER
       Else
          inhalt_normal  = #FELD_BODEN1 + Random(4)
       EndIf
    EndIf
    
    mit_was(akt_level) = mit_was_normal
    inhalt(akt_level) = inhalt_normal
    visionen(akt_level) = 1
         
     ; Init Automap
      For i = 1 To #MAX_GROESSE
        For j = 1 To #MAX_GROESSE
          automap(i,j) \feld[akt_level] = 0
        Next
      Next
        
    ;If levelmod(akt_level) = #LM_GIFTIGER_NEBEL
    ;   inhalt(akt_level) = #FELD_GIFT
    ;EndIf
    
    ; Eiskaverne
    If sonderlevel(akt_level) = #SL_EISKAVERNE
       mit_was(akt_level) = #FELD_WAND_WEISS
       inhalt(akt_level) = #FELD_SCHNEE
    EndIf
    ; Lavakaverne
    If sonderlevel(akt_level) = #SL_LAVAKAVERNE
       mit_was(akt_level) = #FELD_FEUER2
       inhalt(akt_level) = #FELD_LAVA
    EndIf
    ; Halle Der Toten
    If sonderlevel(akt_level) = #SL_TOTENHALLE
       mit_was(akt_level) = #FELD_GRABSTEIN
    EndIf
    ; Goblin Hoehle
    If sonderlevel(akt_level) = #SL_GOBLINHOEHLE
       mit_was(akt_level) = #FELD_MAUER
       inhalt(akt_level) = #FELD_HOEHLE2_LEER
    EndIf
    ; Diebesnest
    If sonderlevel(akt_level) = #SL_DIEBESNEST
       mit_was(akt_level) = #FELD_MAUER
    EndIf
    ; Zentauerwald
    If sonderlevel(akt_level) = #SL_ZENTAUERWALD
       mit_was(akt_level) = #FELD_BAUM_KLEIN
       inhalt(akt_level) = #FELD_GRAS
    EndIf
    ; Halle der Illusionen
    If sonderlevel(akt_level) = #SL_ILLUSIONEN
       mit_was(akt_level) = #FELD_MOND
       inhalt(akt_level) = #FELD_STERNE2
    EndIf
    ; Spinnenbau
    If sonderlevel(akt_level) = #SL_SPINNENBAU
       mit_was(akt_level) = #FELD_HOEHLE2_MAUER
       inhalt(akt_level) = #FELD_HOEHLE2_LEER
    EndIf
    ; Wueste
    If sonderlevel(akt_level) = #SL_WUESTE
       mit_was(akt_level) = #FELD_SAND_HUEGEL
       inhalt(akt_level) = #FELD_SAND1
    EndIf
    ; Archipel
    If sonderlevel(akt_level) = #SL_ARCHIPEL
       mit_was(akt_level) = #FELD_WASSER
       inhalt(akt_level) = #FELD_GRAS
       ;make size multiple of 5
       groesse(akt_level) = 5 * ((groesse(akt_level)+4) / 5)
    EndIf
    ; Sumpf
    If sonderlevel(akt_level) = #SL_SUMPF
       mit_was(akt_level) = #FELD_SUMPF2
       inhalt(akt_level) = #FELD_SUMPF1
    EndIf
    
    
    special.w = 0
    
    ; Wueste!!!
    If sonderlevel(akt_level) = #SL_WUESTE
       special = 1
      ; Ganzes Laby mit Sandhuegel fuellen
      For i = 1 To #MAX_GROESSE
         For j = 1 To #MAX_GROESSE
            setlaby(i,j,akt_level,mit_was(akt_level),0,0)
         Next
      Next
      
      ; Palmen setzen
      For i = 1 To groesse(akt_level)/3
         zaehler = 1
         Repeat
            x = Random(groesse(akt_level))
            y = Random(groesse(akt_level))
            zaehler = zaehler + 1
         Until (labyrinth(akt_level,x,y)\feld = mit_was(akt_level) And labyrinth(akt_level,x+1,y+1)\feld = mit_was(akt_level) And labyrinth(akt_level,x+1,y)\feld = mit_was(akt_level) And labyrinth(akt_level,x,y+1)\feld = mit_was(akt_level)) Or zaehler > 500
         
         If zaehler <= 500
            setlaby(x,y,akt_level,#FELD_PALME1,0,0)
            setlaby(x+1,y,akt_level,#FELD_PALME2,0,0)
            setlaby(x,y+1,akt_level,#FELD_PALME3,0,0)
            setlaby(x+1,y+1,akt_level,#FELD_PALME4,0,0)
         EndIf
      Next
      
      ; Ganzes Laby mit Sand fuellen
      For i = 1 To groesse(akt_level)
         For j = 1 To groesse(akt_level)
            If labyrinth(akt_level,i,j)\feld = mit_was(akt_level)
               Select Random(13)
                  Case 0: setlaby(i,j,akt_level,#FELD_SAND1,0,0)
                  Case 1: setlaby(i,j,akt_level,#FELD_SAND1,0,0)
                  Case 2: setlaby(i,j,akt_level,#FELD_SAND1,0,0)
                  Case 3: setlaby(i,j,akt_level,#FELD_SAND2,0,0)
                  Case 4: setlaby(i,j,akt_level,#FELD_SAND2,0,0)
                  Case 5: setlaby(i,j,akt_level,#FELD_SAND2,0,0)
                  Case 6: setlaby(i,j,akt_level,#FELD_SAND3,0,0)
                  Case 7: setlaby(i,j,akt_level,#FELD_SAND3,0,0)
                  Case 8: setlaby(i,j,akt_level,#FELD_SAND3,0,0)
                  Case 9: setlaby(i,j,akt_level,#FELD_SAND4,0,0)
                  Case 10: setlaby(i,j,akt_level,#FELD_SAND4,0,0)
                  Case 11: setlaby(i,j,akt_level,#FELD_SAND4,0,0)
                  Case 12: setlaby(i,j,akt_level,#FELD_KAKTUS1,0,0)
                  Case 13: setlaby(i,j,akt_level,#FELD_KAKTUS2,0,0)
               EndSelect
            EndIf
         Next
      Next
      
      ; Place Entry and Exit
      setlaby(1,1,akt_level,#FELD_EINGANG,0,0)
      Select Random(2)
         Case 0: ziel_x = groesse(akt_level)
                 ziel_y = groesse(akt_level)
         Case 1: ziel_x = groesse(akt_level)
                 ziel_y = 1
         Case 2: ziel_x = 1
                 ziel_y = groesse(akt_level)
      EndSelect
      If TEST = 0
         setlaby(ziel_x,ziel_y,akt_level,#FELD_AUSGANG,0,0)
      EndIf
      ausgangx(akt_level) = ziel_x
      ausgangy(akt_level) = ziel_y
    EndIf

    
    ; Archipel!!!
    If sonderlevel(akt_level) = #SL_ARCHIPEL
       special = 1
      ;fill everything with water
      For i = 0 To #MAX_GROESSE
         For j = 0 To #MAX_GROESSE
            setlaby(i,j,akt_level,#FELD_WASSER,0,0)
         Next
      Next
      
      ; Inseln setzen
      x = 1
      Repeat
         y = 1
         Repeat
            willi.w = Random(2)
            If x = 1 And y = 1 
               willi = 1
            EndIf
            Select(willi)
            Case 0:
               ; Insel Klein
               setlaby(x,y,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y,akt_level,#FELD_WASSER,0,0)
               setlaby(x+2,y,akt_level,#FELD_INSEL1,0,0)
               setlaby(x+3,y,akt_level,#FELD_GRAS,0,0)
               setlaby(x+4,y,akt_level,#FELD_INSEL2,0,0)
               
               setlaby(x,y+1,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+1,akt_level,#FELD_WASSER,0,0)
               setlaby(x+2,y+1,akt_level,#FELD_GRAS,0,0)
               If Random(100) > 70
                  Select (Random(2))
                     Case 0:
                        setlaby(x+3,y+1,akt_level,#FELD_WIESE_SKELETT,0,0)
                     Case 1:
                        setlaby(x+3,y+1,akt_level,#FELD_WIESE_TRUHE,find1(),0)
                     Case 2:
                        If Random(100) < 80
                           setlaby(x+3,y+1,akt_level,#FELD_WIESE_GRUENETRUHE1,finden2(),0)
                        Else
                           setlaby(x+3,y+1,akt_level,#FELD_WIESE_GRUENETRUHE2,finden2(),0)
                        EndIf
                  EndSelect
               Else
                  setlaby(x+3,y+1,akt_level,#FELD_GRAS,0,0)
               EndIf
               setlaby(x+4,y+1,akt_level,#FELD_GRAS,0,0)
               
               setlaby(x,y+2,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+2,akt_level,#FELD_WASSER,0,0)
               setlaby(x+2,y+2,akt_level,#FELD_INSEL3,0,0)
               setlaby(x+3,y+2,akt_level,#FELD_GRAS,0,0)
               setlaby(x+4,y+2,akt_level,#FELD_INSEL4,0,0)
               
               setlaby(x,y+3,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+3,akt_level,#FELD_WASSER,0,0)
               setlaby(x+2,y+3,akt_level,#FELD_WASSER,0,0)
               setlaby(x+3,y+3,akt_level,#FELD_WASSER,0,0)
               setlaby(x+4,y+3,akt_level,#FELD_WASSER,0,0)
               
               setlaby(x,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+2,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+3,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+4,y+4,akt_level,#FELD_WASSER,0,0)
          Case 1:
               ; Insel Gross
               setlaby(x,y,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y,akt_level,#FELD_INSEL1,0,0)
               setlaby(x+2,y,akt_level,#FELD_GRAS,0,0)
               setlaby(x+3,y,akt_level,#FELD_GRAS,0,0)
               setlaby(x+4,y,akt_level,#FELD_INSEL2,0,0)
               
               setlaby(x,y+1,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+1,akt_level,#FELD_GRAS,0,0)
               If Random(100) > 70
                  Select (Random(2))
                     Case 0:
                        setlaby(x+2,y+1,akt_level,#FELD_WIESE_SKELETT,0,0)
                     Case 1:
                        setlaby(x+2,y+1,akt_level,#FELD_WIESE_TRUHE,find1(),0)
                     Case 2:
                        If Random(100) < 80
                           setlaby(x+2,y+1,akt_level,#FELD_WIESE_GRUENETRUHE1,finden2(),0)
                        Else
                           setlaby(x+2,y+1,akt_level,#FELD_WIESE_GRUENETRUHE2,finden2(),0)
                        EndIf
                  EndSelect
               Else
                  setlaby(x+2,y+1,akt_level,#FELD_GRAS,0,0)
               EndIf
               If Random(100) > 70
                  Select (Random(2))
                     Case 0:
                        setlaby(x+3,y+1,akt_level,#FELD_WIESE_SKELETT,0,0)
                     Case 1:
                        setlaby(x+3,y+1,akt_level,#FELD_WIESE_TRUHE,find1(),0)
                     Case 2:
                        If Random(100) < 80
                           setlaby(x+3,y+1,akt_level,#FELD_WIESE_GRUENETRUHE1,finden2(),0)
                        Else
                           setlaby(x+3,y+1,akt_level,#FELD_WIESE_GRUENETRUHE2,finden2(),0)
                        EndIf
                  EndSelect
               Else
                  setlaby(x+3,y+1,akt_level,#FELD_GRAS,0,0)
               EndIf
               setlaby(x+4,y+1,akt_level,#FELD_GRAS,0,0)
               
               setlaby(x,y+2,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+2,akt_level,#FELD_GRAS,0,0)
               
               If Random(100) > 70
                  Select (Random(2))
                     Case 0:
                        setlaby(x+2,y+2,akt_level,#FELD_WIESE_SKELETT,0,0)
                     Case 1:
                        setlaby(x+2,y+2,akt_level,#FELD_WIESE_TRUHE,find1(),0)
                     Case 2:
                        If Random(100) < 80
                           setlaby(x+2,y+2,akt_level,#FELD_WIESE_GRUENETRUHE1,finden2(),0)
                        Else
                           setlaby(x+2,y+2,akt_level,#FELD_WIESE_GRUENETRUHE2,finden2(),0)
                        EndIf
                  EndSelect
               Else
                  setlaby(x+2,y+2,akt_level,#FELD_GRAS,0,0)
               EndIf
               If Random(100) > 70
                  Select (Random(2))
                     Case 0:
                        setlaby(x+3,y+2,akt_level,#FELD_WIESE_SKELETT,0,0)
                     Case 1:
                        setlaby(x+3,y+2,akt_level,#FELD_WIESE_TRUHE,find1(),0)
                     Case 2:
                        If Random(100) < 80
                           setlaby(x+3,y+2,akt_level,#FELD_WIESE_GRUENETRUHE1,finden2(),0)
                        Else
                           setlaby(x+3,y+2,akt_level,#FELD_WIESE_GRUENETRUHE2,finden2(),0)
                        EndIf
                  EndSelect
               Else
                  setlaby(x+3,y+2,akt_level,#FELD_GRAS,0,0)
               EndIf
               setlaby(x+4,y+2,akt_level,#FELD_GRAS,0,0)
               
               setlaby(x,y+3,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+3,akt_level,#FELD_INSEL3,0,0)
               setlaby(x+2,y+3,akt_level,#FELD_GRAS,0,0)
               setlaby(x+3,y+3,akt_level,#FELD_GRAS,0,0)
               setlaby(x+4,y+3,akt_level,#FELD_INSEL4,0,0)
               
               setlaby(x,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+1,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+2,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+3,y+4,akt_level,#FELD_WASSER,0,0)
               setlaby(x+4,y+4,akt_level,#FELD_WASSER,0,0)
            Case 2: 
               For xx = 0 To 4
                  For yy = 0 To 4
                     setlaby(x+xx,y+yy,akt_level,#FELD_WASSER,0,0)
                  Next
               Next
            
            EndSelect
         y = y + 5
         Until y > groesse(akt_level)
      x = x + 5
      Until x > groesse(akt_level)
      
      ; Unterwassertruhen etc setzen
      For i = 1 To akt_level
         counter.w = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = #FELD_WASSER Or counter > 500
         If counter <= 500
            Select (Random(2))
               Case 0: If Random(100) < 80
                          setlaby(x,y,akt_level,#FELD_WASSER_TRUHE,find1(),0)
                       Else
                          setlaby(x,y,akt_level,#FELD_WASSER_GRUENE_TRUHE,finden2(),0)
                       EndIf
               Case 1: setlaby(x,y,akt_level,#FELD_WASSER_SKELETT,0,0)
               Case 2: setlaby(x,y,akt_level,#FELD_WASSER_GOLDSACK,0,0)
            EndSelect
            
         EndIf
      Next
      
      ; Place Entry and Exit
      setlaby(1,1,akt_level,#FELD_EINGANG,0,0)
      Select Random(2)
         Case 0: ziel_x = groesse(akt_level)
                 ziel_y = groesse(akt_level)
         Case 1: ziel_x = groesse(akt_level)
                 ziel_y = 1
         Case 2: ziel_x = 1
                 ziel_y = groesse(akt_level)
      EndSelect
      setlaby(ziel_x,ziel_y,akt_level,#FELD_AUSGANG,0,0)
      ausgangx(akt_level) = ziel_x
      ausgangy(akt_level) = ziel_y
    EndIf
    
    If special = 0
      count.l = 0
      Repeat
         count+1
         ; Fill the whole laby with walls
         For i = 1 To #MAX_GROESSE
            For j = 1 To #MAX_GROESSE
               setlaby(i,j,akt_level,mit_was(akt_level),0,0)
            Next
         Next

         ; Clear items
         For i = 1 To #MAX_GROESSE
            For j = 1 To #MAX_GROESSE
               setitem(i,j,akt_level,0,0,0)
            Next
         Next
         
         ; Dig tunnel
         Gang_graben(1,1,1,1,mit_was(akt_level),akt_level)
         ok=1
         If ganglaenge<=groesse(akt_level)*2
            ok=0
         ElseIf test
           print(Str(count)+":"+Str(groesse(akt_level)/2)+" zielX:"+Str(ziel_x)+" zielY:"+Str(ziel_y))
         EndIf
         ziel_y=posY
         ziel_x=posX
         If ziel_x<groesse(akt_level)/2 And ziel_y<groesse(akt_level)/2
            ok=0
         ElseIf test
           print(Str(count)+":"+"g:"+Str(ganglaenge)+" <= "+Str(groesse(akt_level)*2)+" zielX:"+Str(ziel_x)+" zielY:"+Str(ziel_y))
         EndIf
         ; falls Hauptgang zu kurz -> das ganze nochmal
      Until ok=1
      ;print("tunnels done")
   
      ; Nebengaenge graben
      For x=1 To groesse(akt_level)-2 Step 2
         For y=1 To groesse(akt_level)-2 Step 2
         If labyrinth(akt_level,x,y)\feld=mit_was(akt_level)
            graben=0
   
            If graben=0 And y>1
               If labyrinth(akt_level,x,y-2)\feld = inhalt(akt_level)
               setlaby(x,y-1,akt_level,inhalt(akt_level),0,0)
               graben=1
               EndIf
            EndIf
   
            If graben=0 And x<groesse(akt_level)-2
               If labyrinth(akt_level,x+2,y)\feld = inhalt(akt_level)
               setlaby(x+1,y,akt_level,inhalt(akt_level),0,0)
               graben=1
               EndIf
            EndIf
   
            If graben=0 And y<groesse(akt_level)-2
               If labyrinth(akt_level,x,y+2)\feld = inhalt(akt_level)
               setlaby(x,y+1,akt_level,inhalt(akt_level),0,0)
               graben=1
               EndIf
            EndIf
   
            If graben=0 And x>1
               If labyrinth(akt_level,x-2,y)\feld = inhalt(akt_level)
               setlaby(x-1,y,akt_level,inhalt(akt_level),0,0)
               graben=1
               EndIf
            EndIf
   
            If graben=1
               Gang_graben(x,y,mit_was(akt_level),0,mit_was(akt_level),akt_level)
            EndIf
         EndIf
         Next
      Next
      
      ; Place Entry and Exit
      setlaby(1,1,akt_level,#FELD_EINGANG,0,0)
      setlaby(ziel_x,ziel_y,akt_level,#FELD_AUSGANG,0,0)
      ausgangx(akt_level) = ziel_x
      ausgangy(akt_level) = ziel_y
    EndIf
    
    ; Kill Wrong zeros
    For i = 1 To #MAX_GROESSE
       For j = 1 To #MAX_GROESSE
          If labyrinth(akt_level,i,j)\feld = 0
             setlaby(i,j,akt_level,inhalt(akt_level),0,0)
          EndIf
       Next
    Next
        
    ; Place Room
    If sonderlevel(akt_level) = 0
      foreach room_list()
         if room_list()\level = akt_level
            setzen(8,8,akt_level,room_list()\type,room_list()\nr_in_level)
         EndIf
      next
    EndIf
 
  ; Place Traps
  If akt_level > 2 And sonderlevel(akt_level) = 0
    anzahl_fallen = (groesse(akt_level)/8)*(groesse(akt_level)/8)
    If levelmod(akt_level) = #LM_FIERCE_TRAPS
       anzahl_fallen = anzahl_fallen * 3
    EndIf
    For i=1 To anzahl_fallen
      counter = 1
      Repeat
        x=Random(groesse(akt_level)-3)+2
        y=Random(groesse(akt_level)-3)+2
        counter = counter + 1
      Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500

      If akt_level < 10
         falle = Random(2) + #FELD_SPEERFALLE1
      EndIf
      If akt_level > 9
         falle = Random(8) + #FELD_SPEERFALLE1
      EndIf

      setlaby(x,y,akt_level,falle,Random(99),Random(99))
    Next
  EndIf
  
  ; Place Runes
  If akt_level > 2 And sonderlevel(akt_level) = 0
    anzahl_runen.w = Random(akt_level/2)
    If TEST = 1
       anzahl_runen = 5
    EndIf
    For i = 1 To anzahl_runen
      counter = 1
      Repeat
        x=Random(groesse(akt_level)-3)+2
        y=Random(groesse(akt_level)-3)+2
        counter = counter + 1
      Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500

      Select(Random(2))
         Case 0: setlaby(x,y,akt_level,#FELD_RUNE1,Random(99),inhalt(akt_level))
         Case 1: setlaby(x,y,akt_level,#FELD_RUNE2,Random(99),inhalt(akt_level))
         Case 2: setlaby(x,y,akt_level,#FELD_RUNE3,Random(99),inhalt(akt_level))
      EndSelect
    Next
  EndIf

  ; Place Skeletons
  If sonderlevel(akt_level) <> #SL_ARCHIPEL
      For i=1 To akt_level+1
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld=inhalt(akt_level) Or counter > 500
         willi.w = Random(8)+1
         If Random(100) > 75
            filler.w = 1
         Else
            filler = 0
         EndIf
         Select (willi)
            Case 1: setlaby(x,y,akt_level,#FELD_SKELETT,filler,inhalt(akt_level))
            Case 2: setlaby(x,y,akt_level,#FELD_KNOCHEN1,filler,inhalt(akt_level))
            Case 3: setlaby(x,y,akt_level,#FELD_KNOCHEN2,filler,inhalt(akt_level))
            Case 4: setlaby(x,y,akt_level,#FELD_KNOCHEN3,filler,inhalt(akt_level))
            Case 5: setlaby(x,y,akt_level,#FELD_KNOCHEN4,filler,inhalt(akt_level))
            Case 6: setlaby(x,y,akt_level,#FELD_KNOCHEN5,filler,inhalt(akt_level))
            Case 7: setlaby(x,y,akt_level,#FELD_KNOCHEN6,filler,inhalt(akt_level))
            Case 8: setlaby(x,y,akt_level,#FELD_KNOCHEN7,filler,inhalt(akt_level))
            Case 9: setlaby(x,y,akt_level,#FELD_KNOCHEN8,filler,inhalt(akt_level))
         EndSelect
      Next
  EndIf

  If fluss(akt_level) = 1
     breite = groesse(akt_level)/3
     If Random(1) = 0  ; Vertikal
        If ziel_x > breite + 2
           ; Place River
           anfang = Random(ziel_x - breite) + 1
           For j = 1 To groesse(akt_level)
              For i = 1 To breite
                 If Random(100) < 75
                    setlaby(i+anfang,j,akt_level,#FELD_WASSER,0,0)
                 Else
                    setlaby(i+anfang,j,akt_level,#FELD_WASSERMONSTER,wassermonster_random(akt_level),0)
                 EndIf
              Next
           Next
        EndIf
     Else   ; Horizontal
        If ziel_y > breite + 2
           anfang = Random(ziel_y - breite) + 1
           For i = 1 To groesse(akt_level)
              For j = 1 To breite
                 If Random(100) < 90
                    setlaby(i,j+anfang,akt_level,#FELD_WASSER,0,0)
                 Else
                    setlaby(i,j+anfang,akt_level,#FELD_WASSERMONSTER,wassermonster_random(akt_level),0)
                 EndIf
              Next
           Next
        EndIf
     EndIf
  EndIf

    ; Nexus setzen
    If levelmod(akt_level) <> #LM_KEIN_NEXUS
      counter = 1
      Repeat
         x=Random(groesse(akt_level)-3)+2
         y=Random(groesse(akt_level)-3)+2
         counter = counter + 1
      Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
      If counter <= 500
         setlaby(x,y,akt_level,#FELD_NEXUS,3,inhalt(akt_level))
      EndIf
    EndIf

   
   ; Place Sanktum
   If levelmod(akt_level) <> #LM_KEIN_SANKTUM
      counter = 1
      Repeat
         x=Random(groesse(akt_level)-3)+2
         y=Random(groesse(akt_level)-3)+2
         counter = counter + 1
      Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
      If counter <= 500
         setlaby(x,y,akt_level,#FELD_SANKTUM,3,inhalt(akt_level))
      EndIf
    EndIf

    ; Place Boulders
    If sonderlevel(akt_level) <> #SL_ARCHIPEL And sonderlevel(akt_level) <> #SL_SUMPF
         anz_bowlders = Random((akt_level/4)+1)
         If anz_bowlders > 0 And sonderlevel(akt_level) = 0
            For i = 1 To anz_bowlders
               counter = 1
               Repeat
                  x=Random(groesse(akt_level)-3)+2
                  y=Random(groesse(akt_level)-3)+2
                  counter = counter + 1
               Until labyrinth(akt_level,x,y)\feld = #FELD_MAUER Or counter > 500
               If counter <= 500
                  setlaby(x,y,akt_level,#FELD_FELSBROCKEN,0,inhalt(akt_level))
               EndIf
            Next
         EndIf
    EndIf
    
    ; Place Scrolls
    If sonderlevel(akt_level) = 0
      anz_scrolls.w = Random(akt_level/4)+1
      For i = 1 To anz_scrolls
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         If counter <= 500
            Repeat
               which.w = Random(#ANZ_ZAUBER-1)+1
            Until spells(which)\duration <> #UNENDLICH
            setitem(x, y, akt_level, #OBJGRAFIK_SCHRIFTROLLE,3+Random(5),which)
         EndIf
      Next
    EndIf
    
    ; Place Plants
    If sonderlevel(akt_level) = #SL_SUMPF
      ; Pflanzen
      For i = 1 To groesse(akt_level)*groesse(akt_level)/12
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         If counter <= 500
            setlaby(x, y, akt_level, #FELD_PFLANZE,0,inhalt(akt_level))
         EndIf
      Next
      
      ; Gift
      For i = 1 To groesse(akt_level)*groesse(akt_level)/12
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         If counter <= 500
            setlaby(x, y, akt_level, #FELD_GIFTIG,0,inhalt(akt_level))
         EndIf
      Next
    EndIf
   
    ; Place Healing Herbs
    If sonderlevel(akt_level) = 0
      anz_herbs.w = Random(akt_level/2)+1
      For i = 1 To anz_herbs
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         If counter <= 500
            If Random(100) > 80
               setitem(x, y, akt_level, #OBJGRAFIK_CRYSOLIT,0,0)
            Else
               setitem(x, y, akt_level, #OBJGRAFIK_KRAEUTER,0,0)
            EndIf
         EndIf
      Next
    EndIf
    
    
    ; Place SpiderWebs
    If sonderlevel(akt_level) = 8
      For i = 1 To groesse(akt_level)
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         If counter <= 500
            setlaby(x,y,akt_level,#FELD_NETZ,0,inhalt(akt_level))
         EndIf
      Next
    EndIf
    
    ; Place Hidden Treasure
    If Random(100) > 80 And sonderlevel(akt_level) <> #SL_ARCHIPEL And sonderlevel(akt_level) <> #SL_SUMPF
      counter = 1
      Repeat
         x=Random(groesse(akt_level)-3)+2
         y=Random(groesse(akt_level)-3)+2
         counter = counter + 1
      Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
      If counter <= 500
        If Random(100) > 50
          was.w = finden2()
          If Random(100) > 80
            worin.w = #FELD_GRUENETRUHE2
          Else
            worin.w = #FELD_GRUENETRUHE1
          EndIf
        Else
         If Random(100) > 50
            worin.w = #FELD_TRUHE
            was.w = find1()
         Else
            worin.w = #FELD_GOLD
            was.w = 0
         EndIf
       EndIf
         setlaby(x,y,akt_level,#FELD_SKELETT2,worin,was)
      EndIf
    EndIf

     ; Gitter setzen
      If sonderlevel(akt_level) <> #SL_ARCHIPEL And sonderlevel(akt_level) <> #SL_SUMPF And sonderlevel(akt_level) <> #SL_WUESTE And (akt_level > 5 Or TEST = 1)
        For i = 1 To groesse(akt_level)/10
            counter = 1
            Repeat
               x=Random(groesse(akt_level)-3)+2
               y=Random(groesse(akt_level)-3)+2
               counter = counter + 1
            Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
            If counter <= 500
               setlaby(x,y,akt_level,#FELD_GITTER1,0,0)
            EndIf
         Next
      EndIf
      
      If TEST = 1
          For i = 1 To 5
            counter = 1
            Repeat
               x=Random(groesse(akt_level)-3)+2
               y=Random(groesse(akt_level)-3)+2
               counter = counter + 1
            Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
            If counter <= 500
               setlaby(x,y,akt_level,#FELD_BLAUETRUHE1,0,0)
            EndIf
          Next
      EndIf

      ; Nagelgruben setzen
      If sonderlevel(akt_level) <> #SL_ARCHIPEL And sonderlevel(akt_level) <> #SL_SUMPF And sonderlevel(akt_level) <> #SL_WUESTE And (akt_level > 7)
        For i = 1 To (Random(groesse(akt_level)*2)+1)
            counter = 1
            Repeat
               x=Random(groesse(akt_level)-3)+2
               y=Random(groesse(akt_level)-3)+2
               counter = counter + 1
            Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
            If counter <= 500
               setlaby(x,y,akt_level,#FELD_NAGELGRUBE,0,inhalt(akt_level))
            EndIf
         Next
      EndIf

    ; Wounded Hero
    If akt_level >= 8
      If Random(100) > 95
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         If counter <= 500
            setlaby(x,y,akt_level,#FELD_WOUNDED_HERO1,0,inhalt(akt_level))
         EndIf
      EndIf
    EndIf
    

    
   ; Kleinhaendler
   If small_trader(akt_level) <> -1
      counter = 1
      Repeat
         x=Random(groesse(akt_level)-3)+2
         y=Random(groesse(akt_level)-3)+2
         counter = counter + 1
      Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
      If counter <= 500
         SelectElement(Merchants(),small_trader(akt_level))
         setlaby(x,y,akt_level,Merchants()\face,small_trader(akt_level),inhalt(akt_level))
      EndIf
   EndIf
   
   ; Geheimtueren?
   If levelmod(akt_level) = #LM_GEHEIMTUEREN
      For i = 1 To groesse(akt_level) * groesse(akt_level) / 12
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         If counter <= 500
            setlaby(x,y,akt_level,#FELD_GEHEIMGANG,Random(89),0)
         EndIf
      Next
   EndIf
    
    
    ; Place Teleporters
    If (((Random(100) > 40 And akt_level > 3) Or sonderlevel(akt_level) = 7) And sonderlevel(akt_level) <> #SL_ARCHIPEL) Or TEST = 1
      i = 1
      If akt_level > 10 And Random(100) > 50
         i = i + 1
      EndIf
      If akt_level > 20 And Random(100) > 50
         i = i + 1
      EndIf
      If sonderlevel(akt_level) = 7
         i = groesse(akt_level) * groesse(akt_level) / 12
      EndIf
      For j = 1 To i
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
         counter2.w = 1
         Repeat
            xx=Random(groesse(akt_level)-3)+2
            yy=Random(groesse(akt_level)-3)+2
            counter2 = counter2 + 1
         Until labyrinth(akt_level,xx,yy)\feld = inhalt(akt_level) Or counter2 > 500
         If counter <= 500 And counter2 <= 500
            setlaby(x,y,akt_level,#FELD_TELEPORTER,xx,yy)
            setlaby(xx,yy,akt_level,#FELD_TELEPORTER,x,y)
         EndIf
      Next
    EndIf
    
    ; Rinnsaale setzen
    If sonderlevel(akt_level) <> #SL_ARCHIPEL And sonderlevel(akt_level) <> #SL_WUESTE And sonderlevel(akt_level) <> #SL_LAVAKAVERNE And sonderlevel(akt_level) <> #SL_ILLUSIONEN
       For i = 1 To groesse(akt_level)/10
          counter = 1
          Repeat
             x=Random(groesse(akt_level)-3)+2
             y=Random(groesse(akt_level)-3)+2
             counter = counter + 1
          Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
          If counter <= 500
             setlaby(x,y,akt_level,#FELD_RINNSAAL,0,inhalt(akt_level))
          EndIf
       Next
    EndIf

    
    ; ggf Koenige setzen!
    ; Goblin Hoehle
    If sonderlevel(akt_level) = #SL_GOBLINHOEHLE
      hugo = #MONSTER_GOBLIN_KING
      counter = 1
      Repeat
         x=Random(groesse(akt_level)-3)+2
         y=Random(groesse(akt_level)-3)+2
         counter = counter + 1
      Until (labyrinth(akt_level,x,y)\feld = inhalt(akt_level) And x > groesse(akt_level)/2 And y > groesse(akt_level)/2) Or counter > 500
      If counter <= 500
         setmonster(x,y,akt_level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,hugo,0,0)
         goblinkoenig(akt_level) = 1
      EndIf
    EndIf
    
    ; Spinnenbau
    If sonderlevel(akt_level) = #SL_SPINNENBAU
      hugo = #MONSTER_SPIDER_QUEEN
      counter = 1
      Repeat
         x=Random(groesse(akt_level)-3)+2
         y=Random(groesse(akt_level)-3)+2
         counter = counter + 1
      Until (labyrinth(akt_level,x,y)\feld = inhalt(akt_level) And x > groesse(akt_level)/2 And y > groesse(akt_level)/2) Or counter > 500
      If counter <= 500
         setmonster(x,y,akt_level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,hugo,0,0)
         spinnenkoenigin(akt_level) = 1
      EndIf
    EndIf
    
    ; Halle der Toten
    If sonderlevel(akt_level) = #SL_TOTENHALLE
      hugo = #MONSTER_LORD_OF_THE_UNDEAD
      counter = 1
      Repeat
         x=Random(groesse(akt_level)-3)+2
         y=Random(groesse(akt_level)-3)+2
         counter = counter + 1
      Until (labyrinth(akt_level,x,y)\feld = inhalt(akt_level) And x > groesse(akt_level)/2 And y > groesse(akt_level)/2) Or counter > 500
      If counter <= 500
         setmonster(x,y,akt_level,hugo,monster(hugo)\nr,monster(hugo)\lebenspunkte,hugo,0,0)
         untotenherr(akt_level) = 1
      EndIf
    EndIf

    ; Place Monsters
    ; A Monster on each 12 Fields
    For i = 1 To groesse(akt_level)*groesse(akt_level)/12
      If sonderlevel(akt_level) = #SL_ARCHIPEL Or ( fluss(akt_level) And Random(3) = 0 )
        wassermonster_setzen(akt_level,monster_random(akt_level,sonderlevel(akt_level)))
      Else
        monster_setzen(akt_level,monster_random(akt_level,sonderlevel(akt_level)))
       EndIf
    Next
    If levelmod(akt_level) = #LM_MONSTERS
       For i = 1 To groesse(akt_level)*groesse(akt_level)/12
          If sonderlevel(akt_level) = #SL_ARCHIPEL Or ( fluss(akt_level) And Random(3) = 0 )
            wassermonster_setzen(akt_level,monster_random(akt_level,sonderlevel(akt_level)))
          Else
             monster_setzen(akt_level,monster_random(akt_level,sonderlevel(akt_level)))
          EndIf
       Next
    EndIf
    
    
    ; Eishalle
    If sonderlevel(akt_level) = #SL_EISKAVERNE
       For i = 1 To groesse(akt_level)*groesse(akt_level)/12
          counter = 1
          Repeat
             x=Random(groesse(akt_level)-3)+2
             y=Random(groesse(akt_level)-3)+2
             counter = counter + 1
          Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 500
          If counter <= 500
             setlaby(x,y,akt_level,#FELD_EIS,0,inhalt(akt_level))
          EndIf
       Next
    EndIf
    
    ; Make sure that there is an exit
    ausgang_vorh = 0
    If TEST = 0
    For i = 1 To groesse(akt_level)
       For j = 1 To groesse(akt_level)
          If labyrinth(akt_level,i,j)\feld = #FELD_AUSGANG
             ausgang_vorh = 1
          EndIf
       Next
    Next
    EndIf
    If ausgang_vorh = 0
       ; zuerst unten rechts probieren
       zaehler = 1
       Repeat
          x=Random(groesse(akt_level)-3)+2
          y=Random(groesse(akt_level)-3)+2
          zaehler = zaehler + 1
       Until (labyrinth(akt_level,x,y)\feld = inhalt(akt_level) And (labyrinth(akt_level,x+1,y)\feld = inhalt(akt_level) Or labyrinth(akt_level,x-1,y)\feld = inhalt(akt_level) Or labyrinth(akt_level,x,y+1)\feld = inhalt(akt_level) Or labyrinth(akt_level,x,y-1)\feld = inhalt(akt_level))  And x > (groesse(akt_level) - 6) And y > (groesse(akt_level) - 6)) Or zaehler > 500
       ausgangx(akt_level) = x
       ausgangy(akt_level) = y
       ; dann unten links probieren
       If zaehler > 500
         zaehler = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            zaehler = zaehler + 1
         Until (labyrinth(akt_level,x,y)\feld = inhalt(akt_level)And (labyrinth(akt_level,x+1,y)\feld = inhalt(akt_level) Or labyrinth(akt_level,x-1,y)\feld = inhalt(akt_level) Or labyrinth(akt_level,x,y+1)\feld = inhalt(akt_level) Or labyrinth(akt_level,x,y-1)\feld = inhalt(akt_level)) And x < 6 And y > (groesse(akt_level) - 6)) Or zaehler > 500
          ausgangx(akt_level) = x
          ausgangy(akt_level) = y
       EndIf
       ; Wenn unmoeglich irgendwo!
       If zaehler > 500
          zaehler = 1
          Repeat
             x=Random(groesse(akt_level)-3)+2
             y=Random(groesse(akt_level)-3)+2
             zaehler = zaehler + 1
          Until (labyrinth(akt_level,x,y)\feld = inhalt(akt_level) And (labyrinth(akt_level,x+1,y)\feld = inhalt(akt_level) Or labyrinth(akt_level,x-1,y)\feld = inhalt(akt_level) Or labyrinth(akt_level,x,y+1)\feld = inhalt(akt_level) Or labyrinth(akt_level,x,y-1)\feld = inhalt(akt_level))) Or zaehler > 2000
       EndIf
       If zaehler <= 2000
          setlaby(x,y,akt_level,#FELD_AUSGANG,0,0)
          ausgangx(akt_level) = x
          ausgangy(akt_level) = y
       Else
          x = groesse(akt_level)-1
          y = groesse(akt_level)-1
          setlaby(x,y,akt_level,#FELD_AUSGANG,0,0)
          ausgangx(akt_level) = x
          ausgangy(akt_level) = y
       EndIf
    EndIf
    
    ; Sicherstellen das Ausgang erreichbar ist
    erreichbar.w = 0
    x = ausgangx(akt_level)
    y = ausgangy(akt_level)
    If x-1 >= 1 And (labyrinth(akt_level,x-1,y)\feld = inhalt(akt_level))
       erreichbar = 1
    EndIf
    If x+1 <= groesse(akt_level) And (labyrinth(akt_level,x+1,y)\feld = inhalt(akt_level) )
       erreichbar = 1
    EndIf
    If y-1 >= 1 And (labyrinth(akt_level,x,y-1)\feld = inhalt(akt_level))
       erreichbar = 1
    EndIf
    If y+1 <= groesse(akt_level) And (labyrinth(akt_level,x,y+1)\feld = inhalt(akt_level) )
       erreichbar = 1
    EndIf
    If erreichbar = 0 And sonderlevel(akt_level) <> #SL_ARCHIPEL
      ; In alle Richtungen graben
      If x-1 >= 1
         If labyrinth(akt_level,x-1,y)\feld = mit_was(akt_level)
            setlaby(x-1,y,akt_level,inhalt(akt_level),0,0)
         EndIf
      EndIf
      If x+1 <= groesse(akt_level) 
         If labyrinth(akt_level,x+1,y)\feld = mit_was(akt_level)
            setlaby(x+1,y,akt_level,inhalt(akt_level),0,0)
         EndIf
      EndIf
      If y-1 >= 1
         If labyrinth(akt_level,x,y-1)\feld = mit_was(akt_level)
            setlaby(x,y-1,akt_level,inhalt(akt_level),0,0)
         EndIf
      EndIf
      If y+1 <= groesse(akt_level) 
         If labyrinth(akt_level,x,y+1)\feld = mit_was(akt_level)
            setlaby(x,y+1,akt_level,inhalt(akt_level),0,0)
         EndIf
      EndIf
    EndIf
    
    ; Blocked exit?
    If levelmod(akt_level) = #LM_BLOCKED_EXIT
         For i = 1 To groesse(akt_level)
            For j = 1 To groesse(akt_level)
               If labyrinth(akt_level,i,j)\feld = #FELD_AUSGANG
                  ausg_x.w = i
                  ausg_y.w = j
               EndIf
            Next
         Next
         If istmauer(labyrinth(akt_level,ausg_x-1,ausg_y)\feld) = 0
            setlaby(ausg_x-1,ausg_y,akt_level,#FELD_TUER2,1,0)
         EndIf
         If istmauer(labyrinth(akt_level,ausg_x+1,ausg_y)\feld) = 0
            setlaby(ausg_x+1,ausg_y,akt_level,#FELD_TUER2,1,0)
         EndIf
         If istmauer(labyrinth(akt_level,ausg_x,ausg_y-1)\feld) = 0
            setlaby(ausg_x,ausg_y-1,akt_level,#FELD_TUER2,1,0)
         EndIf
         If istmauer(labyrinth(akt_level,ausg_x,ausg_y+1)\feld) = 0
            setlaby(ausg_x,ausg_y+1,akt_level,#FELD_TUER2,1,0)
         EndIf
         counter = 1
         Repeat
            x=Random(groesse(akt_level)-3)+2
            y=Random(groesse(akt_level)-3)+2
            counter = counter + 1
         Until labyrinth(akt_level,x,y)\feld = inhalt(akt_level) Or counter > 2000
         If counter <= 2000
            setlaby(x,y,akt_level,#FELD_SCHALTER1,0,inhalt(akt_level))
         EndIf
      EndIf
      
      
    If levelmod(akt_level) = #LM_EXTREME_HOT
       For i = 1 To groesse(akt_level)
          For j = 1 To groesse(akt_level)
             If labyrinth(akt_level,i,j)\feld = inhalt(akt_level)
                setlaby(i,j,akt_level,#FELD_FEUER2,0,inhalt(akt_level))
             EndIf
          Next
       Next
    EndIf
    If levelmod(akt_level) = #LM_EXTREME_COLD
       For i = 1 To groesse(akt_level)
          For j = 1 To groesse(akt_level)
             If labyrinth(akt_level,i,j)\feld = inhalt(akt_level)
                setlaby(i,j,akt_level,#FELD_EIS,0,inhalt(akt_level))
             EndIf
          Next
       Next
    EndIf
    
    If levelmod(akt_level) = #LM_GIFTIGER_NEBEL
       For i = 1 To groesse(akt_level)
          For j = 1 To groesse(akt_level)
             If labyrinth(akt_level,i,j)\feld = inhalt(akt_level)
                setlaby(i,j,akt_level,#FELD_GIFTIG,0,inhalt(akt_level))
             EndIf
          Next
       Next
    EndIf
    
    If sonderlevel(akt_level) <> #SL_ARCHIPEL And sonderlevel(akt_level) <> #SL_WUESTE
      verdrehen = Random(7)+1
      Select(verdrehen)
         Case 1: ; Nichts
         Case 2: diagonal(akt_level)
         Case 3: vertikal(akt_level)
         Case 4: diagonal(akt_level)
                 vertikal(akt_level)
         Case 5: horizontal(akt_level)
         Case 6: diagonal(akt_level)
                 horizontal(akt_level)
         Case 7: vertikal(akt_level)
                 horizontal(akt_level)
         Case 8: diagonal(akt_level)
                 vertikal(akt_level)
                 horizontal(akt_level)
      EndSelect
    EndIf

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 511
; FirstLine = 509
; Folding = ---
; EnableAsm
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
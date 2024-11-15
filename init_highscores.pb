; Programm init highscores
; Loescht die Highscores!

XIncludeFile "constants.pbi"
XIncludeFile "structures.pbi"

; Highscores initialisieren
For i = 1 To 30
   hscores(i)\version     = " "
   hscores(i)\name        = " "
   hscores(i)\level       = 0
   hscores(i)\gold        = 0
   hscores(i)\mks         = 0
   hscores(i)\punkte      = 0
   hscores(i)\maennchen   = 0
   hscores(i)\anfangszeit = " "
   hscores(i)\endezeit    = " "
   hscores(i)\MaxLifepoints = 0
   hscores(i)\MaxMana       = 0
   hscores(i)\Attack        = 0
   hscores(i)\Dexterity     = 0
   hscores(i)\Strength      = 0
   hscores(i)\MaxSpeed      = 0
   hscores(i)\Perception    = 0
   hscores(i)\Luck_score    = 0
   hscores(i)\Power_score   = 0
   hscores(i)\Circle        = 0
   hscores(i)\stabteile     = 0
   hscores(i)\moves         = 0
   hscores(i)\cause_of_death = 0
   hscores(i)\cause_of_death_monster = 0
   For j = 1 To 30
      hscores(i)\skills[j]      = 0
   Next
Next

If CreateFile(0, "./highscores.dat")
      For i = 1 To 30
         WriteStringN(0,hscores(i)\version)
         WriteStringN(0,hscores(i)\name)
         WriteWord(0,hscores(i)\level)
         WriteWord(0,hscores(i)\gold)
         WriteWord(0,hscores(i)\mks)
         WriteWord(0,hscores(i)\punkte)
         WriteWord(0,hscores(i)\maennchen)
         WriteStringN(0,hscores(i)\anfangszeit)
         WriteStringN(0,hscores(i)\endezeit)
         WriteWord(0,hscores(i)\MaxLifepoints)
         WriteWord(0,hscores(i)\MaxMana)
         WriteWord(0,hscores(i)\Attack)
         WriteWord(0,hscores(i)\Dexterity)
         WriteWord(0,hscores(i)\Strength)
         WriteWord(0,hscores(i)\MaxSpeed)
         WriteWord(0,hscores(i)\Perception)
         WriteWord(0,hscores(i)\Luck_score)
         WriteWord(0,hscores(i)\Power_score)
         WriteWord(0,hscores(i)\Circle)
         WriteWord(0,hscores(i)\stabteile)
         WriteWord(0,hscores(i)\moves)
         WriteWord(0,hscores(i)\cause_of_death)
         WriteWord(0,hscores(i)\cause_of_death_monster)
         For j = 1 To 30
            WriteWord(0,hscores(i)\skills[j])
         Next
      Next
      CloseFile(0)
else
   Print("File could not be opened")
EndIf

;Aus()

; IDE Options = PureBasic v4.02 (Windows - x86)
; CursorPosition = 18
; FirstLine = 1
; Folding = -
; EnableAsm
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
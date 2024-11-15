
Procedure doubleClick()

   Static klicks.l,mmouse_links_old.l,timer.l,time.l

   timer=time-ElapsedMilliseconds()
   If timer <0
      timer=0
      klicks=0
   EndIf

   If mmouse_links
      If klicks=0
         klicks+1
         time=ElapsedMilliseconds()+220
      ElseIf mmouse_links_old=0
         klicks+1
      EndIf
   EndIf

   If klicks>1
      klicks=0
      doppelklick=1
      time=ElapsedMilliseconds()
      something_changed = 1
   Else
      doppelklick=0
   EndIf
   mmouse_links_old=mmouse_links

   ProcedureReturn doppelklick
   
EndProcedure


Procedure.s keyboard_string(text.s,typ.b)

  Shared keydelay, keydelay2, joystick_used

  Static WAIT.l
  Static counter.b
  Static oldKey.s
  Key.s
  TKey.s
  ExamineKeyboard()

  If typ = 0
    If KeyboardPushed(#PB_Key_A)
      Key = "A"
    EndIf
    If KeyboardPushed(#PB_Key_B)
      Key = "B"
    EndIf
    If KeyboardPushed(#PB_Key_C)
      Key = "C"
    EndIf
    If KeyboardPushed(#PB_Key_D)
      Key = "D"
    EndIf
    If KeyboardPushed(#PB_Key_E)
      Key = "E"
    EndIf
    If KeyboardPushed(#PB_Key_F)
      Key = "F"
    EndIf
    If KeyboardPushed(#PB_Key_G)
      Key = "G"
    EndIf
    If KeyboardPushed(#PB_Key_H)
      Key = "H"
    EndIf
    If KeyboardPushed(#PB_Key_I)
      Key = "I"
    EndIf
    If KeyboardPushed(#PB_Key_J)
      Key = "J"
    EndIf
    If KeyboardPushed(#PB_Key_K)
      Key = "K"
    EndIf
    If KeyboardPushed(#PB_Key_L)
      Key = "L"
    EndIf
    If KeyboardPushed(#PB_Key_M)
      Key = "M"
    EndIf
    If KeyboardPushed(#PB_Key_N)
      Key = "N"
    EndIf
    If KeyboardPushed(#PB_Key_O)
      Key = "O"
    EndIf
    If KeyboardPushed(#PB_Key_P)
      Key = "P"
    EndIf
    If KeyboardPushed(#PB_Key_Q)
      Key = "Q"
    EndIf
    If KeyboardPushed(#PB_Key_R)
      Key = "R"
    EndIf
    If KeyboardPushed(#PB_Key_S)
      Key = "S"
    EndIf
    If KeyboardPushed(#PB_Key_T)
      Key = "T"
    EndIf
    If KeyboardPushed(#PB_Key_U)
      Key = "U"
    EndIf
    If KeyboardPushed(#PB_Key_V)
      Key = "V"
    EndIf
    If KeyboardPushed(#PB_Key_W)
      Key = "W"
    EndIf
    If KeyboardPushed(#PB_Key_X)
      Key = "X"
    EndIf
    If KeyboardPushed(#PB_Key_Y)
      Key = "Y"
    EndIf
    If KeyboardPushed(#PB_Key_Z)
      Key = "Z"
    EndIf


    If KeyboardPushed(#PB_Key_Minus)
      Key = "-"
    EndIf
  EndIf

  If KeyboardPushed(#PB_Key_1)
    Key = "1"
  EndIf

  If KeyboardPushed(#PB_Key_2)
    Key = "2"
  EndIf

  If KeyboardPushed(#PB_Key_3)
    Key = "3"
  EndIf

  If KeyboardPushed(#PB_Key_4)
    Key = "4"
  EndIf

  If KeyboardPushed(#PB_Key_5)
    Key = "5"
  EndIf

  If KeyboardPushed(#PB_Key_6)
    Key = "6"
  EndIf

  If KeyboardPushed(#PB_Key_7)
    Key = "7"
  EndIf

  If KeyboardPushed(#PB_Key_8)
    Key = "8"
  EndIf

  If KeyboardPushed(#PB_Key_9)
    Key = "9"
  EndIf

  If KeyboardPushed(#PB_Key_0)
    Key = "0"
  EndIf

  Key = LCase(Key)

  If typ = 0
    If KeyboardPushed(#PB_Key_Capital) Or KeyboardPushed(#PB_Key_RightShift) Or KeyboardPushed(#PB_Key_LeftShift)
      Key = UCase(Key)
    EndIf

    If KeyboardPushed(#PB_Key_Space)
      Key = "_"
    EndIf
  EndIf

  If KeyboardPushed(#PB_Key_Delete)
    Key = "DEL"
  EndIf

  If KeyboardPushed(#PB_Key_Back)
    Key = "BACK"
  EndIf


  TKey = Key

  keychoice = 1
  If WAIT = 0
    If Key = ""
      counter = 0
      keychoice = 0
    ElseIf counter = 0 And oldKey = Key And Key <> ""
      WAIT = keydelay
      Key = ""
      counter = 1
    ElseIf counter = 1 And oldKey = Key And Key <> ""
      WAIT = keydelay2
    EndIf
  Else

    Delay(10)
    WAIT - 1

    If oldKey <> Key
      WAIT = 0
      counter = 0
    EndIf

    If oldKey = Key
      Key = ""
    EndIf
  EndIf

  oldKey = TKey

  If Key = "DEL" Or Key = "BACK"
    text = Mid(text,1,Len(text)-1)
  Else
    text = text + Key
  EndIf

  If typ > 0
    While Mid(text,1,1) = "0" Or Mid(text,1,1) = "0"
      text = Mid(text,2,Len(text))
    Wend

    If Len(text) = 0 And typ > 0
      text = "0"
    EndIf
  EndIf

  If typ > 0
    If joystick_used = 1

      read_joystick()
      If Len(text) = 0 And typ <= 0
        text = "A"
      EndIf

      ; Letztes Zeichen sichern
      letter.s = Mid(text,Len(text),1)

      neu_letter.s = ""
      If jay = -1 And WAIT = 0


        ; Letztes Zeichen entfernen
        text = Mid(text,1,Len(text)-1)
        letter = UCase(letter)

        If typ <= 0
          Select (letter)
            Case "A" : neu_letter.s = "B"
            Case "B" : neu_letter = "C"
            Case "C" : neu_letter = "D"
            Case "D" : neu_letter = "E"
            Case "E" : neu_letter = "F"
            Case "F" : neu_letter = "G"
            Case "G" : neu_letter = "H"
            Case "H" : neu_letter = "I"
            Case "I" : neu_letter = "J"
            Case "J" : neu_letter = "K"
            Case "K" : neu_letter = "L"
            Case "L" : neu_letter = "M"
            Case "M" : neu_letter = "N"
            Case "N" : neu_letter = "O"
            Case "O" : neu_letter = "P"
            Case "P" : neu_letter = "Q"
            Case "Q" : neu_letter = "R"
            Case "R" : neu_letter = "S"
            Case "S" : neu_letter = "T"
            Case "T" : neu_letter = "U"
            Case "U" : neu_letter = "V"
            Case "V" : neu_letter = "W"
            Case "W" : neu_letter = "X"
            Case "X" : neu_letter = "Y"
            Case "Y" : neu_letter = "Z"
            Case "Z" : neu_letter = "A"
          EndSelect

          If (jb(2) = 1)
            letter = LCase(letter)
          EndIf
        EndIf

        If typ > 0 Or jb(3) = 1
          Select (letter)
            Case "1" : neu_letter = "2"
            Case "2" : neu_letter = "3"
            Case "3" : neu_letter = "4"
            Case "4" : neu_letter = "5"
            Case "5" : neu_letter = "6"
            Case "6" : neu_letter = "7"
            Case "7" : neu_letter = "8"
            Case "8" : neu_letter = "9"
            Case "9" : neu_letter = "0"
            Case "0" : neu_letter = "1"
          EndSelect
        EndIf


        text = text + neu_letter
      EndIf
      If jay = 1 And WAIT = 0
        ; Letztes Zeichen entfernen
        text = Mid(text,1,Len(text)-1)
        letter = UCase(letter)

        If typ <= 0
          Select (letter)
            Case "A" : neu_letter = "Z"
            Case "B" : neu_letter = "A"
            Case "C" : neu_letter = "B"
            Case "D" : neu_letter = "C"
            Case "E" : neu_letter = "D"
            Case "F" : neu_letter = "E"
            Case "G" : neu_letter = "F"
            Case "H" : neu_letter = "G"
            Case "I" : neu_letter = "H"
            Case "J" : neu_letter = "I"
            Case "K" : neu_letter = "J"
            Case "L" : neu_letter = "K"
            Case "M" : neu_letter = "L"
            Case "N" : neu_letter = "M"
            Case "O" : neu_letter = "N"
            Case "P" : neu_letter = "O"
            Case "Q" : neu_letter = "P"
            Case "R" : neu_letter = "Q"
            Case "S" : neu_letter = "R"
            Case "T" : neu_letter = "S"
            Case "U" : neu_letter = "T"
            Case "V" : neu_letter = "U"
            Case "W" : neu_letter = "V"
            Case "X" : neu_letter = "W"
            Case "Y" : neu_letter = "X"
            Case "Z" : neu_letter = "Y"
          EndSelect

          If (jb(2) = 1)
            letter = LCase(letter)
          EndIf
        EndIf

        If typ > 0 Or jb(3) = 1
          Select (letter)
            Case "1" : neu_letter = "0"
            Case "2" : neu_letter = "1"
            Case "3" : neu_letter = "2"
            Case "4" : neu_letter = "3"
            Case "5" : neu_letter = "4"
            Case "6" : neu_letter = "5"
            Case "7" : neu_letter = "6"
            Case "8" : neu_letter = "7"
            Case "9" : neu_letter = "8"
            Case "0" : neu_letter = "9"
          EndSelect

        EndIf

        text = text + neu_letter
      EndIf

      If neu_letter <> "" And jay = 0
        WAIT = keydelay2 + 5
      EndIf


      If jax = 1 And WAIT = 0 And jay = 0 And text <> "0"
        If typ <= 0
          text + "A"
        ElseIf typ > 0
          text + "0"
        EndIf
      EndIf

      If jax = -1 And WAIT = 0 And jay = 0
        text = Mid(text,1,1) + Mid(text,2,Len(text)-2)
      EndIf

      If WAIT = 0
        If (jay <> 0 Or jax <> 0) And counter = 0
          WAIT = keydelay
          counter = 1
        ElseIf (jay <> 0 Or jax <> 0) And counter = 1
          WAIT = keydelay2 + 5
        ElseIf keychoice = 0
          counter = 0
        EndIf
      EndIf

    EndIf
  EndIf

  If typ > 0
    text = Mid(text,1,typ)

    While Len(text) < (typ)
      text = "0" + text
    Wend
  EndIf

  ProcedureReturn text

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 16
; FirstLine = 1
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
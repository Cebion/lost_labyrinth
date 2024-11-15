Global g_lCountLanguage.l = 0
Global g_lCountEntries.l = -1

Procedure.l load_messages() 
  retVal.l = 0
  If ReadFile(0, "./messages.txt")
    While Left(ReadString(0), 1) = "#"
      g_lCountLanguage +1
    Wend  
    ReadString(0) ; the next line (an empty line)
    lSeekPos = Loc(0)
    While Eof(0) = 0 
      For n = 0 To g_lCountLanguage
        sLine.s = ReadString(0)
      Next n
      g_lCountEntries +1
    Wend  
    Global Dim languages.s(g_lCountLanguage)
    Global Dim message_text.s(g_lCountEntries, g_lCountLanguage)
    ; 
    FileSeek(0, 0) 
    lCount.l = 0
    Repeat 
      sLine.s = ReadString(0)
      languages(lCount) = Mid(sLine,2,Len(sLine)-1)
      lCount +1
    Until lCount >= g_lCountLanguage
    ReadString(0) ; the next line (an empty line)
    lEntry = 0
    While Eof(0) = 0
      For language = 0 To g_lCountLanguage-1
          message_text(lEntry, language) = ReadString(0)
      Next language    
      lEntry +1
      ReadString(0) ; the next line (an empty line)
    Wend  
    CloseFile(0)
    retVal = 1
  EndIf
  ProcedureReturn retVal
EndProcedure
   
; IDE Options = PureBasic v4.02 (Windows - x86)
; CursorPosition = 20
; Folding = -
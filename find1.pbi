Procedure find1()
             
   obje.w = 0
   hugo = Random(12)+1
   If test = 1
      hugo = 5
   EndIf
   Select(hugo)
      Case 1:
         If Random(15) < 15
            hugo = Random(14)
            obje = #OBJGRAFIK_HELM1+hugo
         Else
            obje = #OBJGRAFIK_DEGEN
         EndIf
      Case 2:
         hugo = Random(20)
         obje = #OBJGRAFIK_DOLCH+hugo
      Case 3:
         hugo=Random(2)+1
         If hugo = 1
            obje = #OBJGRAFIK_APFEL+Random(9)
         EndIf
         If hugo = 2
            obje = #OBJGRAFIK_SCHINKEN+Random(2)
         EndIf
         If hugo = 3
            willi.w = Random(3)+1
            Select(willi)
               Case 1: obje = #OBJGRAFIK_NAHRUNG
               Case 2: obje = #OBJGRAFIK_BIER
               Case 3: obje = #OBJGRAFIK_WEIN
               Case 4: obje = #OBJGRAFIK_HONIG
            EndSelect
         EndIf
      Case 4:
         Repeat
            egon.w = Random(#ANZ_GEGENSTAENDE-1)+1
            If item(egon)\type = #ITEMTYPE_EMERALD
               obje = egon
            EndIf
         Until obje > 0
      Case 5:
         obje = Random(#ANZ_TRAENKE-1) + #OBJGRAFIK_TRANK1
      Case 6:
         hugo = Random(100)
         If hugo < 51
            obje = #OBJGRAFIK_SCHAUFEL
         else
            obje = #OBJGRAFIK_SPITZHACKE
         endif
       Case 7:
            hugo = random(6)+1
            select (hugo)
               case 1: obje = #OBJGRAFIK_STEINE
               case 2: obje = #OBJGRAFIK_STAHLKUGELN
               case 3: obje = #OBJGRAFIK_PFEILE_SCHWARZ ; Oger Pfeile
               case 4: obje = #OBJGRAFIK_PFEIL1         ; Explodierende Pfeile
               case 5: obje = #OBJGRAFIK_PFEIL2         ; Naga Pfeile
               case 6: obje = #OBJGRAFIK_PFEIL3         ; Durchschlagende Pfeile
               case 7: obje = #OBJGRAFIK_PFEIL4         ; Zielsuchende Pfeile
            endselect
       Case 8:
         hugo = random(100)
         if hugo < 51
            obje = #OBJGRAFIK_SILBERNER_SCHLUESSEL
         else
            obje = #OBJGRAFIK_GOLDENER_SCHLUESSEL
         endif
      Case 9:
         obje = #OBJGRAFIK_SCHRIFTROLLE  ; Schriftrolle
      Case 10:
         hugo = random(100)
         if hugo < 61
            obje = #OBJGRAFIK_FACKEL1
         endif
         if hugo > 60 and hugo < 85
            obje = #OBJGRAFIK_LAMPE1
         endif
         if hugo > 84
            obje = #OBJGRAFIK_OEL
         endif
      Case 11:
         if random(100) < 50
            obje = #OBJGRAFIK_KRAEUTER
         else
            obje = #OBJGRAFIK_BUCH3
         endif
      Case 12:
         repeat
            hugo = Random(18)
            obje = #OBJGRAFIK_STAHLHELM1+hugo
         until obje <> 367
      Case 13:
         obje = #OBJGRAFIK_TRANK1 + random(#ANZ_TRAENKE-1)
         
   EndSelect

   procedurereturn(obje)
   
EndProcedure
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 2
; Folding = -
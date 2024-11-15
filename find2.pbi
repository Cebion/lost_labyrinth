Procedure Finden2()
              
mag_geg.w = 0
egon.w = 0
   hugo = Random(5) + 1
   If test = 1
      hugo = 1
   EndIf
   Select(hugo)
      
      Case 1:
         Repeat
            egon = Random(#ANZ_GEGENSTAENDE-1)+1
            If item(egon)\type = #ITEMTYPE_RING
               mag_geg = egon
            EndIf
         Until mag_geg > 0
      Case 2:
         Repeat
            egon = Random(#ANZ_GEGENSTAENDE-1)+1
            If item(egon)\type = #ITEMTYPE_BASTON
               mag_geg = egon
            EndIf
         Until mag_geg > 0
      Case 3
         Repeat
            egon = Random(#ANZ_GEGENSTAENDE-1)+1
            If item(egon)\type = #ITEMTYPE_NECKLACE
               mag_geg = egon
            EndIf
         Until mag_geg > 0
      Case 4:
         ; Magische Waffe
         willi = Random(27)+1
         Select(willi)
            Case  1: mag_geg = #OBJGRAFIK_FLAMMENSCHWERT
            Case  2: mag_geg = #OBJGRAFIK_EISSCHWERT
            Case  3: mag_geg = #OBJGRAFIK_GIFTSCHWERT
            Case  4: mag_geg = #OBJGRAFIK_SCHWERT_DES_LICHTS
            Case  5: mag_geg = #OBJGRAFIK_FEUERSPEER 
            Case  6: mag_geg = #OBJGRAFIK_EISSPEER 
            Case  7: mag_geg = #OBJGRAFIK_GIFTSPEER 
            Case  8: mag_geg = #OBJGRAFIK_LICHTSPEER 
            Case  9: mag_geg = #OBJGRAFIK_FEUER_HAMMER 
            Case 10: mag_geg = #OBJGRAFIK_EIS_HAMMER
            Case 11: mag_geg = #OBJGRAFIK_GIFT_HAMMER 
            case 12: mag_geg = #OBJGRAFIK_LICHT_HAMMER 
            case 13: mag_geg = #OBJGRAFIK_FEUERAXT 
            case 14: mag_geg = #OBJGRAFIK_EISAXT 
            case 15: mag_geg = #OBJGRAFIK_GIFTAXT 
            case 16: mag_geg = #OBJGRAFIK_LICHTAXT 
            case 17: mag_geg = #OBJGRAFIK_BOGEN_GRUEN
            case 18: mag_geg = #OBJGRAFIK_GOLDENER_MORGENSTERN
            case 19: mag_geg = #OBJGRAFIK_ZAUBERDEGEN
            case 20: mag_geg = #OBJGRAFIK_SCHWERT2
            case 21: mag_geg = #OBJGRAFIK_ZAUBERSCHWERT1
            case 22: mag_geg = #OBJGRAFIK_MAGISCHE_AXT
            case 23: mag_geg = #OBJGRAFIK_ZAUBERSCHWERT3
            case 24: mag_geg = #OBJGRAFIK_ZAUBERBOGEN
            case 25: mag_geg = #OBJGRAFIK_GOLDENER_DREIZACK
            case 26: mag_geg = #OBJGRAFIK_ROTER_SPEER
            case 27: mag_geg = #OBJGRAFIK_GOLDENER_HAMMER
            case 28: mag_geg = #OBJGRAFIK_GOLDENE_AXT
         endselect
      Case 5:
         ; Magische Ruestung
         willi = random(18)+1
         select(willi)
            case  1: mag_geg = #OBJGRAFIK_HANDSCHUHE3
            case  2: mag_geg = #OBJGRAFIK_STIEFEL_DUNKEL
            case  3: mag_geg = #OBJGRAFIK_GRUENERHELM
            case  4: mag_geg = #OBJGRAFIK_GUERTEL_DUNKEL
            case  5: mag_geg = #OBJGRAFIK_UMHANG_BRAUN
            case  6: mag_geg = #OBJGRAFIK_UMHANG2
            case  7: mag_geg = #OBJGRAFIK_UMHANG_BLAU
            case  8: mag_geg = #OBJGRAFIK_KRONE1
            case  9: mag_geg = #OBJGRAFIK_KRONE2
            case 10: mag_geg = #OBJGRAFIK_UMHANG_GRUEN
            case 11: mag_geg = #OBJGRAFIK_UMHANG_VIOLETT
            case 12: mag_geg = #OBJGRAFIK_ZAUBERRUESTUNG1
            case 13: mag_geg = #OBJGRAFIK_SCHUHE1
            case 14: mag_geg = #OBJGRAFIK_SCHUHE2
            case 15: mag_geg = #OBJGRAFIK_SCHUHE3
            case 16: mag_geg = #OBJGRAFIK_ZAUBERRUESTUNG2
            case 17: mag_geg = #OBJGRAFIK_ZAUBERERHUT
            case 18: mag_geg = #OBJGRAFIK_FEDERHUT
            case 19: mag_geg = #OBJGRAFIK_UMHANG_GRAU
         endselect
      Case 6:
         ; Anderes
         willi = random(12)+1
         select(willi)
            case  1: mag_geg = #OBJGRAFIK_DIETRICHE
            case  2: mag_geg = #OBJGRAFIK_HERZ1
            case  3: mag_geg = #OBJGRAFIK_MASKE1
            case  4: mag_geg = #OBJGRAFIK_SPIEGEL
            case  5: mag_geg = #OBJGRAFIK_KRISTALLKUGEL
            case  6: mag_geg = #OBJGRAFIK_ALPTRAEUME
            case  7: mag_geg = #OBJGRAFIK_ZAUBERPFEIL
            case  8: mag_geg = #OBJGRAFIK_ZAUBEREI
            case  9: mag_geg = #OBJGRAFIK_FALLENWERKZEUG
            case 10: mag_geg = #OBJGRAFIK_KESSEL
            case 11: mag_geg = #OBJGRAFIK_TUTANKHAMUM
            case 12: mag_geg = #OBJGRAFIK_STUNDENGLAS
            case 13: mag_geg = #OBJGRAFIK_BESEN
         endselect
   EndSelect
   
   ; check if unique and already exists
   foreach unique_items()
      if unique_items()\name = mag_geg
         mag_geg = #OBJGRAFIK_STIEFEL_DUNKEL
      endif
   next

   procedurereturn(mag_geg)
                 
EndProcedure
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger

; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 2
; Folding = -
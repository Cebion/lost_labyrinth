Procedure terminate(welchen.w, source.w)

   For i = 1 To #ACTIVE_SLOTS
      If aktive(i,akt_spieler)\nr = welchen And aktive(i,akt_spieler)\source = source
         aktive(i,akt_spieler)\nr = 0
         aktive(i,akt_spieler)\staerke = 0
         aktive(i,akt_spieler)\dauer = 0
      EndIf
   Next

EndProcedure


Procedure un_equip(slot.w)

Shared aktion

  item.w = inventory(slot,akt_spieler)\name
  If inventory(slot,akt_spieler)\benutzt = 1
    aktion = 1
    inventory(slot,akt_spieler)\benutzt = 0

    ;light sources
    If item = #OBJGRAFIK_FACKEL1 Or item = #OBJGRAFIK_FACKEL2
      spieler(akt_spieler)\light = spieler(akt_spieler)\light - 3
    ElseIf item = #OBJGRAFIK_LAMPE1  Or item = #OBJGRAFIK_LAMPE2
      spieler(akt_spieler)\light = spieler(akt_spieler)\light - 4

    ElseIf item(item)\type = #ITEMTYPE_BOOTS
      ;boots
      Select item
      Case #OBJGRAFIK_STIEFEL_DUNKEL
        spieler(akt_spieler)\zugweitegegenstand = spieler(akt_spieler)\zugweitegegenstand - 3
      Case #OBJGRAFIK_SCHUHE1
         terminate(#SPELL_UEBERS_WASSER_GEHEN,#OBJGRAFIK_SCHUHE1)
      Case #OBJGRAFIK_SCHUHE3
        spieler(akt_spieler)\fire_resistance = spieler(akt_spieler)\fire_resistance - inventory(slot,akt_spieler)\attri5 * 10
      Case #OBJGRAFIK_SCHUHE2
        spieler(akt_spieler)\cold_resistance = spieler(akt_spieler)\cold_resistance - inventory(slot,akt_spieler)\attri5 * 10
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_HELMET
      ;helmet
      Select item
      Case #OBJGRAFIK_FEDERHUT
        spieler(akt_spieler)\bogentreffergegenstand = spieler(akt_spieler)\bogentreffergegenstand - 10
      Case #OBJGRAFIK_GRUENERHELM
        spieler(akt_spieler)\lifepointgegenstand = spieler(akt_spieler)\lifepointgegenstand - 7
      Case #OBJGRAFIK_ZAUBERERHUT
        spieler(akt_spieler)\managegenstand = spieler(akt_spieler)\managegenstand - 7
      Case #OBJGRAFIK_KRONE1
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_KRONE2
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand - 2
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_WEAPON
      ;weapon
      If item = #OBJGRAFIK_SCHWERT_DES_LICHTS Or item = #OBJGRAFIK_LICHTSPEER Or item = #OBJGRAFIK_LICHT_HAMMER Or item = #OBJGRAFIK_LICHTAXT
        spieler(akt_spieler)\lichtgegenstand = spieler(akt_spieler)\lichtgegenstand - 2
      EndIf
      If item = #OBJGRAFIK_FLAMMENSCHWERT Or item = #OBJGRAFIK_FEUERAXT Or item = #OBJGRAFIK_FEUERSPEER Or item = #OBJGRAFIK_FEUER_HAMMER
        terminate(#SPELL_FEUERAURA,item)
      EndIf
      If item = #OBJGRAFIK_EISSCHWERT Or item = #OBJGRAFIK_EISAXT Or item = #OBJGRAFIK_EISSPEER Or item = #OBJGRAFIK_EIS_HAMMER
        terminate(#SPELL_WINTERATEM,item)
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_ARMOR
      ;cloak
      Select item
      Case #OBJGRAFIK_UMHANG_BRAUN
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_UMHANG_BLAU
        spieler(akt_spieler)\lifepointgegenstand = spieler(akt_spieler)\lifepointgegenstand - 1
      Case #OBJGRAFIK_UMHANG2
        spieler(akt_spieler)\stealthgegenstand = spieler(akt_spieler)\stealthgegenstand - 2
      Case #OBJGRAFIK_UMHANG_GRAU
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_UMHANG_GRUEN
        spieler(akt_spieler)\magic_resistance = spieler(akt_spieler)\magic_resistance - 20
      Case #OBJGRAFIK_UMHANG_VIOLETT
        terminate(#SPELL_WINTERATEM,#OBJGRAFIK_UMHANG_VIOLETT)
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_GLOVE
      ;gloves
      If item = #OBJGRAFIK_HANDSCHUHE3
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand - 2
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_RING
      ;ring
      Select item
      Case #OBJGRAFIK_RING1
        spieler(akt_spieler)\managegenstand = spieler(akt_spieler)\managegenstand - 4
      Case #OBJGRAFIK_RING2
        terminate(#SPELL_FALLENSINN,#OBJGRAFIK_RING2)
      Case #OBJGRAFIK_RING3
        terminate(#SPELL_LIED_DES_LEBENS,#OBJGRAFIK_RING3)
      Case #OBJGRAFIK_RING_BLAU
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_ROT
        spieler(akt_spieler)\perceptiongegenstand = spieler(akt_spieler)\perceptiongegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_GRUEN
        spieler(akt_spieler)\damagegegenstand = spieler(akt_spieler)\damagegegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_TOTENKOPFRING
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN1
        spieler(akt_spieler)\stealthgegenstand = spieler(akt_spieler)\stealthgegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN2
        spieler(akt_spieler)\bogentreffergegenstand = spieler(akt_spieler)\bogentreffergegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN3
        spieler(akt_spieler)\bogenschadengegenstand = spieler(akt_spieler)\bogenschadengegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN4
        spieler(akt_spieler)\magic_resistance = spieler(akt_spieler)\magic_resistance - inventory(slot,akt_spieler)\attri5 * 10
      Case #OBJGRAFIK_RING_KLEIN5
        terminate(#SPELL_FEUERAURA,#OBJGRAFIK_RING_KLEIN5)
      Case #OBJGRAFIK_RING_KLEIN6
        terminate(#SPELL_WINTERATEM,#OBJGRAFIK_RING_KLEIN6)
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_NECKLACE
      ;amulet
      Select item
      Case #OBJGRAFIK_AMULETT1
        terminate(#SPELL_UNSICHTBARES_SEHEN,#OBJGRAFIK_AMULETT1)
      Case #OBJGRAFIK_AMULETT2
        spieler(akt_spieler)\lightning_resistance = spieler(akt_spieler)\lightning_resistance - inventory(slot,akt_spieler)\attri5 * 10
      Case #OBJGRAFIK_AMULETT3
        terminate(#SPELL_VERSTEINERNSCHUTZ,#OBJGRAFIK_AMULETT3)
      Case #OBJGRAFIK_AMULETT4
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand - inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_AMULETT5
        terminate(#SPELL_WINTERATEM,#OBJGRAFIK_AMULETT5)
      Case #OBJGRAFIK_AMULETT6
        terminate(#SPELL_FEUERAURA,#OBJGRAFIK_AMULETT6)
      Case #OBJGRAFIK_AMULETT1_ROT
        terminate(#SPELL_FALLENSINN,#OBJGRAFIK_AMULETT1_ROT)
      Case #OBJGRAFIK_AMULETT1_BLAU
        terminate(#SPELL_GLUECKSZAUBER,#OBJGRAFIK_AMULETT1_BLAU)
      Case #OBJGRAFIK_AMULETT1_VIOLETT
        terminate(#SPELL_DOPPELGAENGER,#OBJGRAFIK_AMULETT1_VIOLETT)
      Case #OBJGRAFIK_AMULETT1_GRAU
        terminate(#SPELL_UNSICHTBARKEIT,#OBJGRAFIK_AMULETT1_GRAU)
      Case #OBJGRAFIK_AMULETT1_GELB
        terminate(#SPELL_RUECKENWIND,#OBJGRAFIK_AMULETT1_GELB)
      Case #OBJGRAFIK_AMULETT1_ORANGE
        terminate(#SPELL_UEBERS_WASSER_GEHEN,#OBJGRAFIK_AMULETT1_ORANGE)
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_MASK
      ;mask - only one for now
      spieler(akt_spieler)\perceptiongegenstand = spieler(akt_spieler)\perceptiongegenstand - 2

    ElseIf item(item)\type = #ITEMTYPE_BELT
      ;girdle
      Select item
      Case #OBJGRAFIK_GUERTEL_DUNKEL
        spieler(akt_spieler)\stealthgegenstand = spieler(akt_spieler)\stealthgegenstand - 10
      Case #OBJGRAFIK_GUERTEL
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand - inventory(slot,akt_spieler)\attri5
      EndSelect

    ElseIf item = #OBJGRAFIK_BESEN
      ;flying broom
      terminate(#SPELL_FLIEGEN,#OBJGRAFIK_BESEN)

    EndIf

  EndIf ;equipped

EndProcedure

;--------------------------------------------------------------------------------------------
Procedure equip(slot.w)

Shared aktion

  If slot < 1 or slot > #MAX_RUCKSACK
    ProcedureReturn 0
  EndIf

  item.w = inventory(slot,akt_spieler)\name
  type.w = item(item)\type
  
  ; weapon/armor
  If type = #ITEMTYPE_WEAPON Or type = #ITEMTYPE_MASK Or ( type >= #ITEMTYPE_HELMET And type <= #ITEMTYPE_SHIELD )
    If inventory(slot,akt_spieler)\status = 2
      ;broken items can not be used
      ProcedureReturn 0
    EndIf
  EndIf

  If inventory(slot,akt_spieler)\benutzt = 0

    If item = #OBJGRAFIK_FACKEL1 Or item = #OBJGRAFIK_FACKEL2
      ;torch
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
        message(803,#COLOR_ROT)
        ProcedureReturn 0
      EndIf
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      If inventory(slot,akt_spieler)\status > 0
        laby_screen()
        Sound(#SOUND_FLAME)
        Delay(delay_animation)
        spieler(akt_spieler)\light = spieler(akt_spieler)\light + 3
        inventory(slot,akt_spieler)\status = inventory(slot,akt_spieler)\status - 1
        If inventory(slot,akt_spieler)\status < 1
          spieler(akt_spieler)\light = spieler(akt_spieler)\light - 3
          ProcedureReturn 0
        EndIf
        laby_screen()
        Delay(delay_animation*2)
      Else ;burnt torch -> do nothing
        ProcedureReturn 0
      EndIf
    ElseIf item = #OBJGRAFIK_LAMPE1  Or item = #OBJGRAFIK_LAMPE2
      ;lamp
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
        message(803,#COLOR_ROT)
        ProcedureReturn 0
      EndIf
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      If inventory(slot,akt_spieler)\status > 0
        laby_screen()
        Sound(#SOUND_FLAME)
        Delay(delay_animation)
        spieler(akt_spieler)\light = spieler(akt_spieler)\light + 4
        inventory(slot,akt_spieler)\status = inventory(slot,akt_spieler)\status - 1
        If inventory(slot,akt_spieler)\status < 1
          spieler(akt_spieler)\light = spieler(akt_spieler)\light - 4
          ProcedureReturn 0
        EndIf
        laby_screen()
        Delay(delay_animation*2)
      Else ;empty lamp ->do nothing
        ProcedureReturn 0
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_BOOTS
      ;boots
      If skills(#CE_VERUNSTALTET,akt_spieler)\gewaehlt = 1
        message(872,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;disfigured
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; remove aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BOOTS And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next
      If item = #OBJGRAFIK_STIEFEL_DUNKEL
        spieler(akt_spieler)\zugweitegegenstand = spieler(akt_spieler)\zugweitegegenstand + 3
      ElseIf item = #OBJGRAFIK_SCHUHE1
        eintragen(#SPELL_UEBERS_WASSER_GEHEN,1,#UNENDLICH,#OBJGRAFIK_SCHUHE1)
      ElseIf item = #OBJGRAFIK_SCHUHE3
        spieler(akt_spieler)\fire_resistance = spieler(akt_spieler)\fire_resistance + inventory(slot,akt_spieler)\attri5 * 10
      ElseIf item = #OBJGRAFIK_SCHUHE2
        spieler(akt_spieler)\cold_resistance = spieler(akt_spieler)\cold_resistance + inventory(slot,akt_spieler)\attri5 * 10
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_HELMET
      ;helmet
      If skills(#CE_VERUNSTALTET,akt_spieler)\gewaehlt = 1
        message(872,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;disfigured
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; check, for aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_HELMET And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next
      inventory(slot,akt_spieler)\benutzt = 1
      If item= #OBJGRAFIK_FEDERHUT
        spieler(akt_spieler)\bogentreffergegenstand = spieler(akt_spieler)\bogentreffergegenstand + 10
      ElseIf item = #OBJGRAFIK_GRUENERHELM
        spieler(akt_spieler)\lifepointgegenstand = spieler(akt_spieler)\lifepointgegenstand + 7
      ElseIf item = #OBJGRAFIK_ZAUBERERHUT
        spieler(akt_spieler)\managegenstand = spieler(akt_spieler)\managegenstand + 7
      ElseIf item = #OBJGRAFIK_KRONE1
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand + inventory(slot,akt_spieler)\attri5
      ElseIf item = #OBJGRAFIK_KRONE2
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand + 2
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_WEAPON
      ;Weapon
      If skills(#CE_SCHWACHE_ARME,akt_spieler)\gewaehlt = 1 or skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
        message(873,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;weak arms
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      waffe.b = 0
      schild.b = 0
      waffe2h.b = 0
      waffe2.b = 0
      ; Haben wir schon eine Waffe in der Hand?
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
          If waffe = 0
            waffe = i
          Else
            waffe2 = i
          EndIf
          ; Haben wir schon eine 2H Waffe in der Hand?
          If skills(#CE_MONKEY_GRIP,akt_spieler)\gewaehlt = 0 And item(inventory(i,akt_spieler)\name)\attri4 = 2
            waffe2h = i
          EndIf
        EndIf
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_SHIELD And inventory(i,akt_spieler)\benutzt = 1
          schild = i
        EndIf
      Next
      ; 2H weapons needs both hands free
      If item(inventory(slot,akt_spieler)\name)\attri4 = 2 And skills(#CE_MONKEY_GRIP,akt_spieler)\gewaehlt = 0
        If waffe > 0
          un_equip(waffe)
        EndIf
        If waffe2 > 0
          un_equip(waffe2)
        EndIf
        If schild > 0
          un_equip(schild)
        EndIf
      Else ; we need one free hand
        If schild Or waffe2h Or waffe2 Or skills(#CE_ZWEI_WAFFEN,akt_spieler)\gewaehlt = 0
          If waffe > 0
            un_equip(waffe)
          EndIf
        EndIf
      EndIf
      spieler(akt_spieler)\style = 0
      If item = #OBJGRAFIK_SCHWERT_DES_LICHTS Or item = #OBJGRAFIK_LICHTSPEER Or item = #OBJGRAFIK_LICHT_HAMMER Or item = #OBJGRAFIK_LICHTAXT
        spieler(akt_spieler)\lichtgegenstand = spieler(akt_spieler)\lichtgegenstand + 2
      EndIf
      If item = #OBJGRAFIK_FLAMMENSCHWERT Or item = #OBJGRAFIK_FEUERAXT Or item = #OBJGRAFIK_FEUERSPEER Or item = #OBJGRAFIK_FEUER_HAMMER
        eintragen(#SPELL_FEUERAURA,1,#UNENDLICH,item)
      EndIf
      If item = #OBJGRAFIK_EISSCHWERT Or item = #OBJGRAFIK_EISAXT Or item = #OBJGRAFIK_EISSPEER Or item = #OBJGRAFIK_EIS_HAMMER
        eintragen(#SPELL_WINTERATEM,1,#UNENDLICH,item)
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_ARMOR
      ;cloak
      If skills(#CE_VERUNSTALTET,akt_spieler)\gewaehlt = 1
        message(872,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;disfigured
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; remove aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_ARMOR And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next
      Select item
      Case #OBJGRAFIK_UMHANG_BRAUN
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_UMHANG_BLAU
        spieler(akt_spieler)\lifepointgegenstand = spieler(akt_spieler)\lifepointgegenstand + 1
      Case #OBJGRAFIK_UMHANG2
        spieler(akt_spieler)\stealthgegenstand = spieler(akt_spieler)\stealthgegenstand + 2
      Case #OBJGRAFIK_UMHANG_GRAU
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_UMHANG_GRUEN
        spieler(akt_spieler)\magic_resistance = spieler(akt_spieler)\magic_resistance + 20
      Case #OBJGRAFIK_UMHANG_VIOLETT
        eintragen(#SPELL_WINTERATEM,1,#UNENDLICH,#OBJGRAFIK_UMHANG_VIOLETT)
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_GLOVE
      ;gloves
      If skills(#CE_VERUNSTALTET,akt_spieler)\gewaehlt = 1 or skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
        message(872,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;disfigured
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; check, for aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_GLOVE And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next
      If item = #OBJGRAFIK_HANDSCHUHE3
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand + 2
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_SHIELD
      ;shield
      If skills(#CE_VERUNSTALTET,akt_spieler)\gewaehlt = 1
        message(872,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;disfigured
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      waffe.b = 0
      schild.b = 0
      waffe2h.b = 0
      waffe2.b = 0
      ; Haben wir schon eine Waffe in der Hand?
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
          If waffe = 0
            waffe = i
          Else
            waffe2 = i
          EndIf
          ; Haben wir schon eine 2H Waffe in der Hand?
          If skills(#CE_MONKEY_GRIP,akt_spieler)\gewaehlt = 0 And item(inventory(i,akt_spieler)\name)\attri4 = 2
            waffe2h = i
          EndIf
        EndIf
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_SHIELD And inventory(i,akt_spieler)\benutzt = 1
          schild = i
        EndIf
      Next
      ;clear the shield-hand
      If schild > 0
        un_equip(schild)
      EndIf
      If waffe2 > 0
        un_equip(waffe2)
      EndIf
      If waffe2h > 0
        un_equip(waffe2h)
      EndIf

    ElseIf item(item)\type = #ITEMTYPE_RING
      ;ring
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1 or skills(#CE_NO_RINGS,akt_spieler)\gewaehlt = 1
        message(805,#COLOR_ROT)
        ProcedureReturn 0
      EndIf
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; remove aleady equipped item
      If skills(#CE_RINGMEISTERUNG,akt_spieler)\gewaehlt = 0
        For i = 1 To #MAX_RUCKSACK
          If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_RING And inventory(i,akt_spieler)\benutzt = 1
            un_equip(i)
            Break
           EndIf
        Next
      EndIf
      Select item
      Case #OBJGRAFIK_RING1
        spieler(akt_spieler)\managegenstand = spieler(akt_spieler)\managegenstand + 4
      Case #OBJGRAFIK_RING2
        eintragen(#SPELL_FALLENSINN,2,#UNENDLICH,#OBJGRAFIK_RING2)
      Case #OBJGRAFIK_RING3
        eintragen(#SPELL_LIED_DES_LEBENS,1,#UNENDLICH,#OBJGRAFIK_RING3)
      Case #OBJGRAFIK_RING_BLAU
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_ROT
        spieler(akt_spieler)\perceptiongegenstand = spieler(akt_spieler)\perceptiongegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_GRUEN
        spieler(akt_spieler)\damagegegenstand = spieler(akt_spieler)\damagegegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_TOTENKOPFRING
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN1
        spieler(akt_spieler)\stealthgegenstand = spieler(akt_spieler)\stealthgegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN2
        spieler(akt_spieler)\bogentreffergegenstand = spieler(akt_spieler)\bogentreffergegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN3
        spieler(akt_spieler)\bogenschadengegenstand = spieler(akt_spieler)\bogenschadengegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_RING_KLEIN4
        spieler(akt_spieler)\magic_resistance = spieler(akt_spieler)\magic_resistance + inventory(slot,akt_spieler)\attri5 * 10
      Case #OBJGRAFIK_RING_KLEIN5
        eintragen(#SPELL_FEUERAURA,1,#UNENDLICH,#OBJGRAFIK_RING_KLEIN5)
      Case #OBJGRAFIK_RING_KLEIN6
        eintragen(#SPELL_WINTERATEM,1,#UNENDLICH,#OBJGRAFIK_RING_KLEIN6)
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_NECKLACE
      ;amulet
      If skills(#CE_NO_AMULETS,akt_spieler)\gewaehlt = 1
        message(804,#COLOR_ROT)
        ProcedureReturn 0
      EndIf
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; check, for aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_NECKLACE And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next
      Select item
      Case #OBJGRAFIK_AMULETT1
        eintragen(#SPELL_UNSICHTBARES_SEHEN,1,#UNENDLICH,#OBJGRAFIK_AMULETT1)
      Case #OBJGRAFIK_AMULETT2
        spieler(akt_spieler)\lightning_resistance = spieler(akt_spieler)\lightning_resistance + inventory(slot,akt_spieler)\attri5 * 10
      Case #OBJGRAFIK_AMULETT3
        eintragen(#SPELL_VERSTEINERNSCHUTZ,1,#UNENDLICH,#OBJGRAFIK_AMULETT3)
      Case #OBJGRAFIK_AMULETT4
        spieler(akt_spieler)\powergegenstand = spieler(akt_spieler)\powergegenstand + inventory(slot,akt_spieler)\attri5
      Case #OBJGRAFIK_AMULETT5
        eintragen(#SPELL_WINTERATEM,1,#UNENDLICH,#OBJGRAFIK_AMULETT5)
      Case #OBJGRAFIK_AMULETT6
        eintragen(#SPELL_FEUERAURA,1,#UNENDLICH,#OBJGRAFIK_AMULETT6)
      Case #OBJGRAFIK_AMULETT1_ROT
        eintragen(#SPELL_FALLENSINN,3,#UNENDLICH,#OBJGRAFIK_AMULETT1_ROT)
      Case #OBJGRAFIK_AMULETT1_BLAU
        eintragen(#SPELL_GLUECKSZAUBER,inventory(slot,akt_spieler)\attri5,#UNENDLICH,#OBJGRAFIK_AMULETT1_BLAU)
      Case #OBJGRAFIK_AMULETT1_VIOLETT
        eintragen(#SPELL_DOPPELGAENGER,1,#UNENDLICH,#OBJGRAFIK_AMULETT1_VIOLETT)
      Case #OBJGRAFIK_AMULETT1_GRAU
        eintragen(#SPELL_UNSICHTBARKEIT,1,#UNENDLICH,#OBJGRAFIK_AMULETT1_GRAU)
      Case #OBJGRAFIK_AMULETT1_GELB
        eintragen(#SPELL_RUECKENWIND,inventory(slot,akt_spieler)\attri5,#UNENDLICH,#OBJGRAFIK_AMULETT1_GELB)
      Case #OBJGRAFIK_AMULETT1_ORANGE
        eintragen(#SPELL_UEBERS_WASSER_GEHEN,1,#UNENDLICH,#OBJGRAFIK_AMULETT1_ORANGE)
      EndSelect

    ElseIf item(item)\type = #ITEMTYPE_MASK
      ;mask
      If skills(#CE_VERUNSTALTET,akt_spieler)\gewaehlt = 1
        message(872,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;disfigured
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; check, for aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_MASK And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next ; only one mask exist for now
      spieler(akt_spieler)\perceptiongegenstand = spieler(akt_spieler)\perceptiongegenstand + 2

    ElseIf item(item)\type = #ITEMTYPE_BELT
      ;girdle
      If skills(#CE_VERUNSTALTET,akt_spieler)\gewaehlt = 1
        message(872,#COLOR_ROT)
        ProcedureReturn 0
      EndIf ;disfigured
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; check, for aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BELT And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next
      Select item
      Case #OBJGRAFIK_GUERTEL_DUNKEL
        spieler(akt_spieler)\stealthgegenstand = spieler(akt_spieler)\stealthgegenstand + 10
      Case #OBJGRAFIK_GUERTEL
        spieler(akt_spieler)\staerkegegenstand = spieler(akt_spieler)\staerkegegenstand + inventory(slot,akt_spieler)\attri5
      EndSelect

    ElseIf item = #OBJGRAFIK_BESEN
      ;flying broom
      If skills(#CE_HEXEREI, akt_spieler)\gewaehlt = 0
        ;oly usable by witches
        message(864,#COLOR_ROT)
        ProcedureReturn 0
      EndIf
      ; check number
      If inventory(slot,akt_spieler)\anzahl > 0
        If split(1) = 0 ; reverse split
          message(945,#COLOR_ROT)
          ;split failed -> abort
          ProcedureReturn 0
        EndIf
      EndIf
      ; check, for aleady equipped item
      For i = 1 To #MAX_RUCKSACK
        If inventory(i,akt_spieler)\name = #OBJGRAFIK_BESEN And inventory(i,akt_spieler)\benutzt = 1
          un_equip(i)
          Break
         EndIf
      Next ; only one mask exist for now
      eintragen(#SPELL_FLIEGEN,1,#UNENDLICH,#OBJGRAFIK_BESEN)

    ;Else
    EndIf

    Delay(delay_animation)
    aktion = 1
    inventory(slot,akt_spieler)\benutzt = 1
  EndIf

ProcedureReturn 1

EndProcedure


Procedure UnOrEquip(slot.w)

  If inventory(slot,akt_spieler)\benutzt = 0
    equip(slot)
  Else
    un_equip(slot)
  EndIf
  
EndProcedure


Procedure Destroy_Boulder(x.w,y.w,level.w)

  ; Stein
  If labyrinth(level,x,y)\feld = #FELD_FELSBROCKEN
    Sound(#SOUND_EARTH)
    If laby_item(x,y)\name[level] = 0
      item.w = get_chance(994)
      setitem(x,y,level,item,0,item(item)\attri1)
    EndIf
    cleartile(x,y,level)
  EndIf
  Delay(delay_animation)
  
EndProcedure


Procedure Destroy_Iceblock(x.w,y.w,level.w)

  If labyrinth(level,x,y)\feld = #FELD_EIS
    Sound(#SOUND_GLASS)
    floor.w = labyrinth(level,x,y)\stat2
    If get_chance(50)
      setlaby(x,y,level,#FELD_RINNSAAL,0,floor)
    Else
      setlaby(x,y,level,floor,0,0)
    EndIf
  EndIf
  Delay(delay_animation)
  
EndProcedure


Procedure Dig_Treasure(x.w,y.w,level.w)

  If labyrinth(level,x,y)\feld = #FELD_SKELETT2 Or labyrinth(level,x,y)\feld = #FELD_VERBORGENER_SCHATZ2
    Sound(#SOUND_EARTH)
    item.w = labyrinth(level,x,y)\stat2
    container.w = labyrinth(level,x,y)\stat1
    ;Print("cont:"+Str(container)+" item:"+Str(item))
    setlaby(x,y,level,container,item,0)
    message(248,#COLOR_GELB)
    Delay(delay_animation)
  EndIf
  
EndProcedure


Procedure itemtest()

Shared benutzen, feld, do_it, aktion
Shared akt_zauber, akt_zauber_offset, item_spell, spell_x, spell_y, blocked, abbrechen

   text1.s = ""
   text2.s = ""
   text3.s = ""

   ; repair menue entry
   If skills(#CE_SCHMIEDEKUNST,akt_spieler)\gewaehlt = 1 And (inventory(feld,akt_spieler)\status = 1 Or inventory(feld,akt_spieler)\status = 2) And (item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_WEAPON Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_HELMET  Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_GLOVE  Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_BOOTS Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_ARMOR Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_SHIELD)
      text3 = message_text(563,language+1)
   EndIf


   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_FACKEL1 Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_FACKEL2 Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_LAMPE1  Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_LAMPE2
      If inventory(feld,akt_spieler)\benutzt = 0
         If inventory(feld,akt_spieler)\status > 0 And skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
            text1 = message_text(527,language+1)
         Else
            text1 = ""
         EndIf
      Else
         text1 = message_text(528,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; light+douse
         UnOrEquip(feld)
      EndIf
   EndIf

   ; food
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_FOOD
      text1 = message_text(529,language+1)
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_HUMAN_MEAT And skills(#CE_CANNIBAL,akt_spieler)\gewaehlt = 0
         text1 = ""
      EndIf
      foodvalue.w = item(inventory(feld,akt_spieler)\name)\attri1
      If skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1
         foodvalue = foodvalue * 2
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; eat
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_HUMAN_MEAT And skills(#CE_CANNIBAL,akt_spieler)\gewaehlt = 0
            message(770,#COLOR_BLAU)
         Else
            spieler(akt_spieler)\hunger = spieler(akt_spieler)\hunger - foodvalue
            If spieler(akt_spieler)\hunger < 1
               spieler(akt_spieler)\hunger = 0
            EndIf
            If inventory(feld,akt_spieler)\name = #OBJGRAFIK_NAHRUNG
               spieler(akt_spieler)\durst = spieler(akt_spieler)\durst - item(inventory(feld,akt_spieler)\name)\attri1
               If spieler(akt_spieler)\durst < 1
                  spieler(akt_spieler)\durst = 0
               EndIf
            EndIf
            Sound(#SOUND_BITE)
            leeren(feld)
            aktion = 1
            Delay(delay_animation)
         endif
      EndIf
   EndIf
   
   ; Alkoholisch
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_ALCOHOLIC
      foodvalue.w = item(inventory(feld,akt_spieler)\name)\attri1
      If skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1
         foodvalue = foodvalue * 2
      EndIf
      text1 = message_text(549,language+1)
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Drink
         spieler(akt_spieler)\durst = spieler(akt_spieler)\durst - foodvalue
         If spieler(akt_spieler)\durst < 1
            spieler(akt_spieler)\durst = 0
         EndIf
         ; Betrunken?
         If get_chance(100) < max(min(item(inventory(feld,akt_spieler)\name)\attri2 * 2 - staerke()*5,10),90)
            spieler(akt_spieler)\betrunken = myRand2(item(inventory(feld,akt_spieler)\name)\attri2/2)+1
         EndIf
         Sound(#SOUND_GULP)
         leeren(feld)
         aktion = 1
         Delay(delay_animation)
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_KRAEUTER Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_HORN Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_CRYSOLIT
      text1 = message_text(529,language+1)
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Essen
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_KRAEUTER
            If skills(#CE_NO_CONSUMPTION,akt_spieler)\gewaehlt = 1
               message(802,#COLOR_ROT)
               ProcedureReturn 0
            EndIf
            spieler(akt_spieler)\lifepoints = spieler(akt_spieler)\lifepoints + get_chance(61)
         EndIf
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_HORN
            spieler(akt_spieler)\lifepoints = spieler(akt_spieler)\lifepoints + myRand(15)+5
            spieler(akt_spieler)\poison = 0
         EndIf
         If spieler(akt_spieler)\lifepoints > maxlife()
            spieler(akt_spieler)\lifepoints = maxlife()
         EndIf
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_CRYSOLIT
            If skills(#CE_NO_CONSUMPTION,akt_spieler)\gewaehlt = 1
               message(802,#COLOR_ROT)
               ProcedureReturn 0
            EndIf
            spieler(akt_spieler)\mana = spieler(akt_spieler)\mana + get_chance(62)
         EndIf
         If spieler(akt_spieler)\mana > maxmana()
            spieler(akt_spieler)\mana = maxmana()
         EndIf
         Sound(#SOUND_BITE)
         aktion = 1
         leeren(feld)
         message(39,#COLOR_BLAU)
      EndIf
   EndIf

   ; Stiefel
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_BOOTS
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; wear/remove
         UnOrEquip(feld)
      EndIf
   EndIf
   
   ; Helm
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_HELMET
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Aufsetzen
         UnOrEquip(feld)
      EndIf
   EndIf
   
   ; weapon
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_WEAPON
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(540,language+1)
      Else
         text1 = message_text(541,language+1)
      EndIf
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_DOLCH Or item(inventory(feld,akt_spieler)\name)\klasse = 2 Or item(inventory(feld,akt_spieler)\name)\klasse = 3
         text2 = message_text(542,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; equit/unequip
         UnOrEquip(feld)
      EndIf
      If benutzen = 2 ; throwing
         werfen()
         abbrechen = 1
      EndIf
   EndIf
   
   ; ammunition
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(540,language+1)
      Else
         text1 = message_text(541,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; equip/unequip
         If inventory(feld,akt_spieler)\benutzt = 0
            If skills(#CE_SCHWACHE_FINGER,akt_spieler)\gewaehlt = 1
               message(874,#COLOR_ROT)
            Else
               ; Haben wir schon Munition in der Hand?
               For i = 1 To #MAX_RUCKSACK
                  If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION And inventory(i,akt_spieler)\benutzt = 1
                     inventory(i,akt_spieler)\benutzt = 0
                     Break
                  EndIf
               Next
               inventory(feld,akt_spieler)\benutzt = 1
               Delay(delay_animation)
            EndIf
         Else
            inventory(feld,akt_spieler)\benutzt = 0
            Delay(delay_animation)
         EndIf
      EndIf
   EndIf
   
   ; ranged weapon
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_BOW
      If inventory(feld,akt_spieler)\benutzt = 0
      text1 = message_text(540,language+1)
      Else
      text1 = message_text(541,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; In die Hand nehmen
         If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
            message(803,#COLOR_ROT)
         ProcedureReturn 0
         EndIf
         aktion = 1
         If inventory(feld,akt_spieler)\benutzt = 0
            If skills(#CE_SCHWACHE_FINGER,akt_spieler)\gewaehlt = 1
               message(874,#COLOR_ROT)
            Else
            ; Tragen wir schon einen Bogen?
               For i = 1 To #MAX_RUCKSACK
               If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BOW And inventory(i,akt_spieler)\benutzt = 1
                  inventory(i,akt_spieler)\benutzt = 0
                  Break
               EndIf
               Next
               inventory(feld,akt_spieler)\benutzt = 1
               Delay(delay_animation)
            EndIf
         Else ; in Rucksack
            inventory(feld,akt_spieler)\benutzt = 0
            Delay(delay_animation)
         EndIf
      EndIf
   EndIf

   ; cloak
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_ARMOR
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(532,language+1)
      Else
      text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; wear/remove
         UnOrEquip(feld)
      EndIf
   EndIf
   
   
   ; Handschuhe
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_GLOVE
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; In die Hand nehmen
         UnOrEquip(feld)
      EndIf
   EndIf 
   
   
   ; Schild
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_SHIELD
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; In die Hand nehmen
         UnOrEquip(feld)
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_UDJAT
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 4  ; put down
         message(281,#COLOR_ROT)
         benutzen = 0
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BEUTEL
      text1 = message_text(606,language+1)
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 And spieler(akt_spieler)\creature_typ = 0 ; Erfahrung kaufen
         If gold_anzahl() >= 5000
            aufsteigen2()
            aktion = 1
            gold_verlieren(5000)
         EndIf
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_WASSERSCHLAUCH
      text1 = message_text(549,language+1)
      text2 = ""
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Trinken
         If inventory(feld,akt_spieler)\status > 0 And spieler(akt_spieler)\Durst > 0
            inventory(feld,akt_spieler)\status = inventory(feld,akt_spieler)\status - 1
            spieler(akt_spieler)\Durst = spieler(akt_spieler)\Durst - 60
            If spieler(akt_spieler)\Durst < 1
               spieler(akt_spieler)\Durst = 0
            EndIf
            spieler(akt_spieler)\verdursten = 0
            Sound(#SOUND_GULP)
            Delay(delay_animation)
            aktion = 1
         EndIf
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BLOOD
      If skills(#CE_CANNIBAL,akt_spieler)\gewaehlt = 0
         text1 = ""
      Else
         text1 = message_text(549,language+1)
      EndIf
      text2 = ""
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Trinken
         foodvalue.w = item(inventory(feld,akt_spieler)\name)\attri1
         If skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1
            foodvalue = foodvalue * 2
         EndIf
         If skills(#CE_CANNIBAL,akt_spieler)\gewaehlt = 0
            message(770,#COLOR_BLAU)
         Else
            spieler(akt_spieler)\Durst = spieler(akt_spieler)\Durst - foodvalue
            If spieler(akt_spieler)\Durst < 1
               spieler(akt_spieler)\Durst = 0
            EndIf
            spieler(akt_spieler)\verdursten = 0
            Sound(#SOUND_GULP)
            leeren(feld)
            Delay(delay_animation)
            aktion = 1
         Endif
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_SCHRIFTROLLE
      text1 = message_text(551,language+1)
      If skills(#CE_SCROLLORE,akt_spieler)\gewaehlt = 1 And spells(inventory(feld,akt_spieler)\status)\level + 2 <= spieler(akt_spieler)\circle And learned(akt_spieler,inventory(feld,akt_spieler)\status) & #l_masq = 0 And zauber_nehmen(inventory(feld,akt_spieler)\status) = 0
         text2 = message_text(552,language+1) ;learn
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Anwenden
         If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 1
            message(801,#COLOR_ROT)
            ProcedureReturn 0
         EndIf
         zauberliste(akt_zauber+akt_zauber_offset) = inventory(feld,akt_spieler)\status
         item_spell = inventory(feld,akt_spieler)\attri5 & 255
         laby_screen()
         leeren(feld)
         aktion = 1
         Delay(delay_animation)
         cast_it()
         item_spell = 0
      EndIf
      If benutzen = 2  ; Lernen
         If skills(#CE_SCROLLORE,akt_spieler)\gewaehlt = 1
            If spells(inventory(feld,akt_spieler)\status)\level +2 <= spieler(akt_spieler)\circle
               learn_count.w = #Allowed_scroll_lore
               For i = 1 to #ANZ_ZAUBER
                  If learned(akt_spieler,i) & #l_masq = #l_scroll
                     learn_count - 1
                  EndIf
               Next
               If learn_count > 0
                  learned(akt_spieler,inventory(feld,akt_spieler)\status) + #l_scroll
                  message(483,#COLOR_BLAU)
               Else
                  message(482,#COLOR_BLAU)
               EndIf
            EndIf
         EndIf
         leeren(feld)
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_SILBERNER_SCHLUESSEL
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0 ) And skills(#CE_PAWS,akt_spieler)\gewaehlt = 0 ; Anwendenspell_x = 0
         spell_y = 0
         destination = select_field()   ; gibt spell_x und spell_y zurueck
         if destination = 1
            blocked = 0
            los(1)            ; gibt blocked zurueck
            If blocked = 0
               aktion = 1
               Sound(#SOUND_KEY)
               ; Tuer ?
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_TUER2 
                  ; reinforced?
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\stat1 = 1
                     message(524,#COLOR_WEISS)
                  Else
                     setlaby(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, #FELD_OFFENE_TUER,0,0)
                     leeren(feld)
                     abbrechen = 1
                  EndIf
               EndIf 
               ; Truhe ?
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_BLAUETRUHE1
                  labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_BLAUETRUHE2
                  leeren(feld)
                  abbrechen = 1
               EndIf
            Else
               message(255,#COLOR_WEISS) 
            EndIf

            laby_screen()
         endif
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_GOLDENER_SCHLUESSEL
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_PAWS,akt_spieler)\gewaehlt = 0  ; Anwenden
         spell_x = 0
         spell_y = 0
         destination = select_field()   ; gibt spell_x und spell_y zurueck
         if destination = 1
            blocked = 0
            los(1)            ; gibt blocked zurueck
            If blocked = 0
               aktion = 1
               Sound(#SOUND_KEY)     
               ; Tuer ?
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_TUER2 
                  ; reinforced?
                  If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\stat1 = 1
                     message(524,#COLOR_WEISS)
                  Else
                     setlaby(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level, #FELD_OFFENE_TUER,0,0)
                     leeren(feld)
                     abbrechen = 1
                  EndIf
               EndIf 
               ; Truhe ?
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_GRUENETRUHE1
                  labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_GRUENETRUHE2
                  leeren(feld)
                  abbrechen = 1
               EndIf 
               ; Truhe ?
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_BLAUETRUHE1
                  labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_BLAUETRUHE2
                  leeren(feld)
                  abbrechen = 1
               EndIf
               ; Truhe ?
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_WIESE_GRUENETRUHE1
                  labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_WIESE_GRUENETRUHE2
                  leeren(feld)
                  abbrechen = 1
               EndIf
            Else
               message(255,#COLOR_WEISS) 
            EndIf

            laby_screen()
         endif
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_MEDUSAHAUPT
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0  ; Anwenden
         zauberliste(akt_zauber+akt_zauber_offset) = item(inventory(feld,akt_spieler)\name)\attri1
         item_spell = 1
         cast_it()
         aktion = 1
         item_spell = 0
         If get_chance(10)
            message(33,#COLOR_ROT)
            leeren(feld)
         EndIf
         item_spell = 0
      EndIf
   EndIf

   ; Zauberstab
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_BASTON
      If inventory(feld,akt_spieler)\attri5 = 1
         brechfaktor.w = 20
      EndIf
      If inventory(feld,akt_spieler)\attri5 = 2
         brechfaktor.w = 10
      EndIf
      If inventory(feld,akt_spieler)\attri5 = 3
         brechfaktor.w = 5
      EndIf
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Anwenden
         If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 1
            message(801,#COLOR_ROT)
            ProcedureReturn 0
         EndIf
         zauberliste(akt_zauber+akt_zauber_offset) = item(inventory(feld,akt_spieler)\name)\attri1
         laby_screen()
         aktion = 1
         item_spell = 3 + inventory(feld,akt_spieler)\attri5*2
         cast_it()
         If get_chance(brechfaktor)
            leeren(feld)
            message(34,#COLOR_ROT)
            Delay(delay_animation)
            Sound(#SOUND_CRACK)
         EndIf
         item_spell = 0
         Delay(delay_animation)
         abbrechen = 1
      EndIf
   EndIf

   ; Stab des letzten Bündnisses
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_STAFFPIECE
      text1 = message_text(551,language+1)
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Anwenden
         spieler(akt_spieler)\staff_pieces[item(inventory(feld,akt_spieler)\name)\attri1] = 1
         leeren(feld)
         was_last_piece()
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_ALPTRAEUME
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0  ; Anwenden
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_SUMMON_HOMUNKULUS+Random(8)
         item_spell = 1
         cast_it()
         aktion = 1
         leeren(feld)
         abbrechen = 1
         item_spell = 0
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_KARTE
      If skills(#CE_KARTOGRAPHIE,akt_spieler)\gewaehlt = 1
         text1 = message_text(555,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_KARTOGRAPHIE,akt_spieler)\gewaehlt = 1; Anwenden
         If radius() < 2
            message(946,#COLOR_WEISS)
         Else
            show_automap(2)
            ;If spieler(akt_spieler)\level > 11 And get_chance(10)
            ;   leeren(feld)
            ;   message(251,#COLOR_ROT)
            ;EndIf
         EndIf
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_SPIEGEL Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_KRISTALLKUGEL
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(555,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Anwenden
         If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 1
            message(801,#COLOR_ROT)
            ProcedureReturn 0
         EndIf
         If radius() < 2
            message(946,#COLOR_WEISS)
         Else
            If inventory(feld,akt_spieler)\status > 0
               zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_STERNENSICHT
               item_spell = 1
               aktion = 1
               cast_it()
               item_spell = 0
               inventory(feld,akt_spieler)\status = inventory(feld,akt_spieler)\status - 1
            Else
               message(262,#COLOR_ROT)
            EndIf
         EndIf
      EndIf
   EndIf

   ; Trank
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_POTION
      If (item(inventory(feld,akt_spieler)\name)\name[2] = "Schwaches Gift" Or item(inventory(feld,akt_spieler)\name)\name[2] = "Starkes Gift") And (skills(#CE_GIFTKENNTNIS,akt_spieler)\gewaehlt = 1)
         text1 = message_text(557,language+1)
      Else
         If skills(#CE_NO_CONSUMPTION,akt_spieler)\gewaehlt = 0
            text1 = message_text(549,language+1)
         EndIf
      EndIf
      ; Trank Mischen?
      If skills(#CE_ALCHEMIE,akt_spieler)\gewaehlt = 1
         text2 = message_text(728,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Anwenden
         aktion = 1
         If (item(inventory(feld,akt_spieler)\name)\name[2] = "Schwaches Gift" Or item(inventory(feld,akt_spieler)\name)\name[2] = "Starkes Gift") And (skills(#CE_GIFTKENNTNIS,akt_spieler)\gewaehlt = 1)
            vergiften()
         Else
            If skills(#CE_NO_CONSUMPTION,akt_spieler)\gewaehlt = 1
               message(802,#COLOR_ROT)
               ProcedureReturn 0
            EndIf
            trinken(item(inventory(feld,akt_spieler)\name)\attri1)
         EndIf
         leeren(feld)
      EndIf
      If benutzen = 2  ; mix potions
         aktion = 1
         mischung(feld)
      EndIf
   EndIf

   
   ; Edelstein
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_EMERALD
      text1 = ""
      If skills(#CE_THAUMATURGIE,akt_spieler)\gewaehlt = 1
         text1 = message_text(558,language+1)
      EndIf
      If skills(#CE_SCHMIEDEKUNST,akt_spieler)\gewaehlt = 1
         text2 = message_text(564,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; thaumaturgie
         If skills(#CE_THAUMATURGIE,akt_spieler)\gewaehlt = 1
            i = backpackspace()
            If i <= #MAX_RUCKSACK Or inventory(feld,akt_spieler)\anzahl = 0
               If inventory(feld,akt_spieler)\anzahl = 0
               i = feld
               EndIf
               leeren(feld)
               mag_geg.w = get_chance(999)
               inventory(i,akt_spieler)\name = mag_geg
               inventory(i,akt_spieler)\benutzt = 0
               inventory(i,akt_spieler)\anzahl = 0
               inventory(i,akt_spieler)\status = 0
               inventory(i,akt_spieler)\attri5 = get_chance(3) ; set quality
               aktion = 1
            EndIf
         Else
            message(328,#COLOR_ROT)
         EndIf
      EndIf
      If benutzen = 2  ; combine gem+weapon
         aktion = 1
         umwandeln(feld)
      EndIf
   EndIf

   ; Pilz
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_MUSHROOM
      text1 = ""
      If skills(#CE_NO_CONSUMPTION,akt_spieler)\gewaehlt = 0
         text1 = message_text(529,language+1)
      EndIf
      text2 = ""
      If skills(#CE_ALCHEMIE,akt_spieler)\gewaehlt = 1
         text2 = message_text(617,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_CONSUMPTION,akt_spieler)\gewaehlt = 0  ; Anwenden
         pilz_essen(item(inventory(feld,akt_spieler)\name)\attri1)
         aktion = 1
         leeren(feld)
      EndIf
      If benutzen = 2  ; brew potion from mushroon
         aktion = 1
         alchemie(feld)
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_OEL
      text1 = ""
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      text2 = ""
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_PAWS,akt_spieler)\gewaehlt = 0  ; In Lampe fuellen
         stackplace.w = 0
         For i = 1 To #MAX_RUCKSACK
            If inventory(i,akt_spieler)\name = #OBJGRAFIK_LAMPE1 And inventory(i,akt_spieler)\status = item(#OBJGRAFIK_LAMPE1)\attri1
               stackplace = 1 ;found a full lamp to stack newly filled one 
               Break
            EndIf
            If inventory(i,akt_spieler)\name = 0
               stackplace = 1 ;found empty slot to put lamp after filling 
               Break
            EndIf
         Next
         For i = 1 To #MAX_RUCKSACK
            If inventory(i,akt_spieler)\name = #OBJGRAFIK_LAMPE1 And inventory(i,akt_spieler)\status = 0
               ;found empty lamp that could be filled
               If inventory(i,akt_spieler)\anzahl = 0 Or inventory(feld,akt_spieler)\anzahl = 0 Or stackplace = 1
                  Sound(#SOUND_FILLUP)
                  leeren(feld) ;remove oil
                  leeren(i) ;remove empty lamp
                  in_rucksack(#OBJGRAFIK_LAMPE1, 1)
                  aktion = 1
               Else
                  ;no space in backpack to put full lamp
               EndIf
            EndIf
         Next
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_SEIL
      text1 = ""
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
         text1 = message_text(559,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_PAWS,akt_spieler)\gewaehlt = 0  ; Hinabsteigen
         If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x,spieler(akt_spieler)\character_y)\feld = #FELD_SCHACHT Or test = 1
            Sound(#SOUND_EARTH)
            message(5,#COLOR_BLAU)
            If spieler(akt_spieler)\level+1 > spieler(akt_spieler)\maxlevel
               Sound(#SOUND_SUCCESS)
               aufsteigen()
            EndIf
            neuer_level()
            abbrechen = 1
         else
            message(795,#COLOR_WEISS)
         EndIf
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_ANGEL
      text1 = ""
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
         text1 = message_text(560,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_PAWS,akt_spieler)\gewaehlt = 0  ; Angeln
         spell_x = 0
         spell_y = 0
         destination = select_field()   ; gibt spell_x und spell_y zurueck
         if destination = 1
            blocked = 0
            los(1)            ; gibt blocked zurueck
            If blocked = 0
               aktion = 1
               ; Wasser?
               testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
               If testfeld = #FELD_BRUNNEN Or testfeld = #FELD_WASSER Or testfeld = #FELD_WASSER_GOLDSACK Or testfeld = #FELD_WASSER_TRUHE Or testfeld = #FELD_WASSER_GRUENE_TRUHE Or testfeld = #FELD_WASSER_SKELETT
                     ; erfolgreich?
                     If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\stat1 = 0
                        labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\stat1 = 1
                        chance.w = 10 + luck()
                        If skills(#CE_UEBERLEBEN,akt_spieler)\gewaehlt = 1
                           chance = chance * 2
                        EndIf
                        abbrechen = 1
                        If get_chance(106) < chance
                           i = backpackspace()
                           If i <= #MAX_RUCKSACK
                              If get_chance(100) < 95
                                 in_rucksack(#OBJGRAFIK_FISCH,1)
                              Else
                                 inventory(i,akt_spieler)\name   = #OBJGRAFIK_STIEFEL1
                                 inventory(i,akt_spieler)\status = 3 - get_chance(3)
                              EndIf
                              message(496,#COLOR_WEISS)
                           EndIf
                        Else
                           message(495,#COLOR_WEISS)
                        EndIf
                     Else
                        message(494,#COLOR_WEISS)
                     EndIf
               Else
                  message(497,#COLOR_ROT)
               EndIf
            EndIf
         endif
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BUCH
      If spellbook(spieler(akt_spieler)\level) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         If spellbook(spieler(akt_spieler)\level)
            ; Neue Schriftrolle
            i = backpackspace()
            If i <= #MAX_RUCKSACK
               inventory(i,akt_spieler)\name = #OBJGRAFIK_SCHRIFTROLLE
               inventory(i,akt_spieler)\benutzt = 0
               inventory(i,akt_spieler)\status = get_chance(998) ;next scheduled scroll-spell
               inventory(i,akt_spieler)\attri5 = myRand(5) + 3    ; Staerke
               If (learned(akt_spieler,inventory(feld,akt_spieler)\status) & #l_scrollname)
                  ; mark known scoll as identified
                  inventory(feld,akt_spieler)\attri5 = inventory(feld,akt_spieler)\attri5 | 256
               EndIf
               aktion = 1
               spellbook(spieler(akt_spieler)\level) - 1
            EndIf
         Else
            message(35,#COLOR_ROT)
         EndIf
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_SPITZHACKE
      text1 = ""
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Anwenden
         If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
            message(803,#COLOR_ROT)
            ProcedureReturn 0
         EndIf
         spell_x = 0
         spell_y = 0
         destination = select_field()   ; gibt spell_x und spell_y zurueck
         if destination = 1
            blocked = 0
            los(1)            ; gibt blocked zurueck
            If blocked = 0
               abbrechen = 1
               aktion = 1
               If labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_EIS
                  Destroy_Iceblock(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level)
               ElseIf labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld = #FELD_FELSBROCKEN
                  Destroy_Boulder(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level)
                  message(247,#COLOR_WEISS)
               EndIf
               If get_chance(10)
                  leeren(feld)
                  message(253,#COLOR_ROT)
               EndIf
            Else
               message(233,#COLOR_ROT)
            EndIf
         endif
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_SCHAUFEL
      text1 = ""
      If skills(#CE_PAWS,akt_spieler)\gewaehlt = 0
         text1 = message_text(561,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Anwenden
         If skills(#CE_PAWS,akt_spieler)\gewaehlt = 1
            message(803,#COLOR_ROT)
            ProcedureReturn 0
         EndIf
         spell_x = 0
         spell_y = 0
         destination = select_field()   ; gibt spell_x und spell_y zurueck
         if destination = 1
            blocked = 0
            los(1)            ; gibt blocked zurueck
            If blocked = 0    
               ; Vergrabener Schatz?
               testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y)\feld
               If testfeld = #FELD_SKELETT2 Or testfeld = #FELD_VERBORGENER_SCHATZ2
                  Dig_Treasure(spieler(akt_spieler)\character_x + spell_x, spieler(akt_spieler)\character_y + spell_y,spieler(akt_spieler)\level)
                  If skills(#CE_SCHATZJAEGER,akt_spieler)\gewaehlt = 0
                  If get_chance(10)
                     leeren(feld)
                     message(252,#COLOR_ROT)
                  EndIf
                  EndIf
                  aktion = 1
                  abbrechen = 1
               EndIf
            Else
               message(233,#COLOR_ROT)
            EndIf
         endif
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_DIETRICHE Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_ZAUBEREI Or inventory(feld,akt_spieler)\name = #OBJGRAFIK_FALLENWERKZEUG
      text1 = message_text(551,language+1)
      If inventory(feld,akt_spieler)\name = #OBJGRAFIK_DIETRICHE
         If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt
            text1 = ""
         EndIf
      ElseIf skills(#CE_PAWS,akt_spieler)\gewaehlt
         text1 = ""
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And text1 <> "" ; Anwenden
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_DIETRICHE
            zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_OEFFNEN
         EndIf
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_ZAUBEREI
            zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_BLITZSCHLAG
         EndIf
         If inventory(feld,akt_spieler)\name = #OBJGRAFIK_FALLENWERKZEUG
            zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_FALLE_ZERSTOEREN
         EndIf
         item_spell = 1
         cast_it()
         If get_chance(item(inventory(feld,akt_spieler)\name)\attri1)
            Sound(#SOUND_GLASS)
            If inventory(feld,akt_spieler)\name = #OBJGRAFIK_DIETRICHE
            message(175,#COLOR_ROT)
            ElseIf inventory(feld,akt_spieler)\name = #OBJGRAFIK_ZAUBEREI
            message(950,#COLOR_ROT)
            ElseIf inventory(feld,akt_spieler)\name = #OBJGRAFIK_FALLENWERKZEUG
            message(254,#COLOR_ROT)
            EndIf
            leeren(feld)
         EndIf
         abbrechen = 1
         aktion = 1
         item_spell = 0
      EndIf
   EndIf

   ; Ring
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_RING
      If inventory(feld,akt_spieler)\benutzt = 0 And skills(#CE_NO_RINGS,akt_spieler)\gewaehlt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; In die Hand nehmen
         UnOrEquip(feld)
      EndIf
   EndIf

   ; Amulette/Ketten
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_NECKLACE
      If inventory(feld,akt_spieler)\benutzt = 0 And skills(#CE_NO_AMULETS,akt_spieler)\gewaehlt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; In die Hand nehmen
         UnOrEquip(feld)
      EndIf
   EndIf

   ; Maske
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_MASK
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Aufsetzen
         UnOrEquip(feld)
      EndIf
   EndIf

   ; Steinernes Herz
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_HERZ1
      text1 = ""
      text2 = ""
      benutzen = 0
      itemmenue(text1,text2,text3)
   EndIf


   ; Guertel
   If item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_BELT
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(532,language+1)
      Else
         text1 = message_text(533,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; wear/remove
         UnOrEquip(feld)
      EndIf
   EndIf

   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_KESSEL
      If cauldron(spieler(akt_spieler)\level) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And backpackspace() <= #MAX_RUCKSACK And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         If cauldron(spieler(akt_spieler)\level)
            in_rucksack(get_chance(997),1) ;997 returns next potion
            cauldron(spieler(akt_spieler)\level) - 1
         Else
            message(35,#COLOR_ROT)
         EndIf
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BUCH3
      text1 = ""
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(624,1+language)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         Select(inventory(feld,akt_spieler)\status)
            Case 1: spieler(akt_spieler)\goblinlehre   = spieler(akt_spieler)\goblinlehre   + 1
            Case 2: spieler(akt_spieler)\spinnenlehre  = spieler(akt_spieler)\spinnenlehre  + 1
            Case 3: spieler(akt_spieler)\untotenlehre  = spieler(akt_spieler)\untotenlehre  + 1
            Case 4: spieler(akt_spieler)\tierkunde     = spieler(akt_spieler)\tierkunde     + 1
            Case 5: spieler(akt_spieler)\fallenlehre   = spieler(akt_spieler)\fallenlehre   + 1
            Case 6: spieler(akt_spieler)\giftlehre     = spieler(akt_spieler)\giftlehre     + 1
            Case 7: spieler(akt_spieler)\pflanzenlehre = spieler(akt_spieler)\pflanzenlehre + 1
         EndSelect
         message(625,#COLOR_BLAU)
         leeren(feld)
         aktion = 1
      EndIf
   EndIf
   
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_TUTANKHAMUM
      text1 = ""
      text2 = ""
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(634,language+1)
         text2 = message_text(635,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         If inventory(feld,akt_spieler)\status > 0
            zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_ANKER_ERSCHAFFEN
            item_spell = 1
            cast_it()
            item_spell = 0
            inventory(feld,akt_spieler)\status = inventory(feld,akt_spieler)\status - 1
         Else
            message(262,#COLOR_ROT)
         EndIf
      EndIf
      If (benutzen = 2 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0 ; Anwenden2
         zauberliste(akt_zauber+akt_zauber_offset) = #SPELL_ANKER_TELEPORT
         item_spell = 1
         laby_screen()
         aktion = 1
         cast_it()
         item_spell = 0
      EndIf
   EndIf
   
   ; Fliegender Besen
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_BESEN
      If inventory(feld,akt_spieler)\benutzt = 0
         text1 = message_text(551,language+1)
      Else
         text1 = message_text(541,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If benutzen = 1 Or do_it > 0  ; Benutzen
         UnOrEquip(feld)
      EndIf
   EndIf

   ; Stundenglas
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_STUNDENGLAS
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(866,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0  ; Anwenden
         If inventory(feld,akt_spieler)\status > 0
            
            For i = 1 To 8
               laby_screen2()
               ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
               FlipBuffers()
               Delay(delay_animation2)
            Next
            inventory(feld,akt_spieler)\status = inventory(feld,akt_spieler)\status - 1
            spieler(akt_spieler)\character_x = spieler(akt_spieler)\old_pos_x
            spieler(akt_spieler)\character_y = spieler(akt_spieler)\old_pos_y
            spieler(akt_spieler)\level = spieler(akt_spieler)\old_level
            spieler(akt_spieler)\lifepoints = spieler(akt_spieler)\old_lp
            spieler(akt_spieler)\maxlifepoints = spieler(akt_spieler)\old_max_lp
            spieler(akt_spieler)\mana = spieler(akt_spieler)\old_mp
            spieler(akt_spieler)\maxmana = spieler(akt_spieler)\old_max_mp
            
            
            For i = 1 To 8
               laby_screen2()
               ClipSprite(#SPRITE_TILESET_FX, i*31-31, 12*31+11, 31, 31)
               DisplayTransparentSprite(#SPRITE_TILESET_FX, 160, 160)
               FlipBuffers()
               Delay(delay_animation2)
            Next
         Else
            message(262,#COLOR_ROT)
         EndIf
      EndIf
   EndIf
   
   ; Calligraphie Set
   If inventory(feld,akt_spieler)\name = #OBJGRAFIK_KALLIGRAFIE_SET
      If skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0
         text1 = message_text(551,language+1)
      EndIf
      benutzen = 0
      itemmenue(text1,text2,text3)
      If (benutzen = 1 Or do_it > 0) And skills(#CE_NO_MAGIC_ITEMS,akt_spieler)\gewaehlt = 0  ; Anwenden
         If inventory(feld,akt_spieler)\status > 0
            duplizieren()
            inventory(feld,akt_spieler)\status = inventory(feld,akt_spieler)\status - 1
         Else
            message(262,#COLOR_ROT)
         EndIf
      EndIf
   EndIf

   ; Repair
   If skills(#CE_SCHMIEDEKUNST,akt_spieler)\gewaehlt = 1 And (inventory(feld,akt_spieler)\status = 1 Or inventory(feld,akt_spieler)\status = 2) And (item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_WEAPON Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_HELMET  Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_GLOVE  Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_BOOTS Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_ARMOR Or item(inventory(feld,akt_spieler)\name)\type = #ITEMTYPE_SHIELD) And benutzen = 3
      reparieren(feld)
      aktion = 1
   EndIf

   If benutzen = 4  ; put down on the floor
      ablegen()
   EndIf
   
   ; reset keyboard
   if benutzen = 1
      init_keyboard_inventory()
   endif

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 1591
; FirstLine = 1589
; Folding = --
; EnableAsm
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
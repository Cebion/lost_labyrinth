
Procedure schaden_min()

   schaden_min.w = 0
   waffe.w = 0
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
         bonus.w = 0
         If inventory(i,akt_spieler)\status = 0
            bonus = item(inventory(i,akt_spieler)\name)\attri2
         EndIf
         If inventory(i,akt_spieler)\status = 1
            bonus = item(inventory(i,akt_spieler)\name)\attri2 / 2
         EndIf
         If inventory(i,akt_spieler)\status = 2
            bonus = 0
         EndIf
         waffe = waffe + bonus
      EndIf
   Next
   
   akt_str.w = staerke()
   If skills(#CE_BERSERKER,akt_spieler)\gewaehlt = 1
      akt_str = akt_str * 2
   EndIf
   
   If waffe > 0
      schaden_min = (akt_str/2) + waffe
   Else
      schaden_min = akt_str/2
   EndIf
   
   ; Kampf mit Schwertern
   If skills(#CE_SCHWERTKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_SCHWERT) = 1
      schaden_min = schaden_min + 2
   EndIf
   
   ; Kampf mit Aexten
   If skills(#CE_AXTKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_AXT) = 1
      schaden_min = schaden_min + 2
   EndIf
   
   ; Kampf mit Speeren
   If skills(#CE_SPEERKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_SPEER) = 1
      schaden_min = schaden_min + 2
   EndIf
   
   ; Kampf mit Haemmern
   If skills(#CE_HAMMERKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_HAMMER) = 1
      schaden_min = schaden_min + 2
   EndIf
   
   ; Kampf ohne Waffe
   If ich_trage(#KLASSE_WAFFENLOS) = 0
     If skills(#CE_WAFFENLOSER_KAMPF,akt_spieler)\gewaehlt = 0
       schaden_min = schaden_min / 2
     Else
       schaden_min = schaden_min + 3
     EndIf
   EndIf

   If spieler(akt_spieler)\creature_typ > 0
      If spieler(akt_spieler)\creature_schaden_min > schaden_min
         schaden_min = spieler(akt_spieler)\creature_schaden_min
      EndIf
      schaden_min + get_enchant_creature()
   EndIf

   ; Blutrausch
   If skills(#CE_BLUTRAUSCH,akt_spieler)\gewaehlt = 1
      okay = 0
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 4)) And okay = 0
         schaden_min = schaden_min * 5
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 3)) And okay = 0
         schaden_min = schaden_min * 4
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 2)) And okay = 0
         schaden_min = schaden_min * 3
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 1.5)) And okay = 0
         schaden_min = schaden_min * 2
         okay = 1
      EndIf
   EndIf
   
   schaden_min = schaden_min + habich(#SPELL_LIED_DES_KAMPFES) + habich(#SPELL_STAERKEZAUBER)
   schaden_min = schaden_min + spieler(akt_spieler)\damagegegenstand
   schaden_min = schaden_min + habich(#SPELL_SCHOCK)

   ProcedureReturn schaden_min
   
EndProcedure

; --------------------------------------------------------------------------------

Procedure schaden_max()

   schaden_max.w = 0
   waffe.w = 0
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
         bonus.w = 0
         If inventory(i,akt_spieler)\status = 0
            bonus = item(inventory(i,akt_spieler)\name)\attri2
         EndIf
         If inventory(i,akt_spieler)\status = 1
            bonus = item(inventory(i,akt_spieler)\name)\attri2 / 2
         EndIf
         If inventory(i,akt_spieler)\status = 2
            bonus = 0
         EndIf
         waffe = waffe + bonus
       EndIf
   Next
   
   akt_str.w = staerke()
   If skills(#CE_BERSERKER,akt_spieler)\gewaehlt = 1
      akt_str = akt_str * 2
   EndIf
   
   If waffe > 0
      schaden_max = 2 + akt_str + waffe
   Else
      schaden_max = 2 + akt_str
   EndIf
   
   ; Kampf mit Schwertern
   If skills(#CE_SCHWERTKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_SCHWERT) = 1
      schaden_max = schaden_max + 2
   EndIf
   
   ; Kampf mit Aexten
   If skills(#CE_AXTKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_AXT) = 1
      schaden_max = schaden_max + 2
   EndIf
   
   ; Kampf mit Speeren
   If skills(#CE_SPEERKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_SPEER) = 1
      schaden_max = schaden_max + 2
   EndIf
   
   ; Kampf mit Haemmern
   If skills(#CE_HAMMERKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_HAMMER) = 1
      schaden_max = schaden_max + 2
   EndIf
   
   ; Kampf ohne Waffe
   If ich_trage(#KLASSE_WAFFENLOS) = 0
     If skills(#CE_WAFFENLOSER_KAMPF,akt_spieler)\gewaehlt = 0
       schaden_max = schaden_max / 2
     Else
       schaden_max = schaden_max + 3
     EndIf
   EndIf

   If spieler(akt_spieler)\creature_typ > 0
      If spieler(akt_spieler)\creature_schaden_max > schaden_max
         schaden_max = spieler(akt_spieler)\creature_schaden_max
      EndIf
      schaden_max + get_enchant_creature()
   EndIf

   ; Blutrausch
   If skills(#CE_BLUTRAUSCH,akt_spieler)\gewaehlt = 1
      okay = 0
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 4)) And okay = 0
         schaden_max = schaden_max * 5
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 3)) And okay = 0
         schaden_max = schaden_max * 4
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 2)) And okay = 0
         schaden_max = schaden_max * 3
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 1.5)) And okay = 0
         schaden_max = schaden_max * 2
         okay = 1
      EndIf
   EndIf
   
   schaden_max = schaden_max + habich(#SPELL_LIED_DES_KAMPFES) + habich(#SPELL_STAERKEZAUBER)
   schaden_max = schaden_max + spieler(akt_spieler)\damagegegenstand
   schaden_max = schaden_max + habich(#SPELL_SCHOCK)
   
   ProcedureReturn schaden_max
   
EndProcedure

; --------------------------------------------------------------------------------

Procedure schaden_critical()

Shared xmod, ymod

   schaden_critical.w = 0
   waffe.w = 0
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
         bonus.w = 0
         If inventory(i,akt_spieler)\status = 0
            bonus = item(inventory(i,akt_spieler)\name)\attri3
         EndIf
         If inventory(i,akt_spieler)\status = 1
            bonus = item(inventory(i,akt_spieler)\name)\attri3 / 2
         EndIf
         If inventory(i,akt_spieler)\status = 2
            bonus = 0
         EndIf
         waffe = waffe + bonus
       EndIf
   Next
   
   If waffe > 0
      schaden_critical = waffe
   EndIf
   
   schaden_critical = schaden_critical + (reflexe() + luck())
   
   ; Fighting style?
   If spieler(akt_spieler)\style = 4
      schaden_critical = schaden_critical * 2
   EndIf
   
   ; Assassine ?
   If skills(#CE_ASSASSINE,akt_spieler)\gewaehlt = 1
      schaden_critical = schaden_critical * 2
   EndIf
   
   ; 1000 Klingen
   If habich(#SPELL_1000_KLINGEN) > 0
      schaden_critical = schaden_critical + habich(#SPELL_1000_KLINGEN) * 4
   EndIf
   
   If skills(#CE_ASSASSINE,akt_spieler)\gewaehlt = 1
      If schaden_critical > 45
         schaden_critical = 45
      EndIf
   Else
      If schaden_critical > 30
         schaden_critical = 30
      EndIf
   EndIf
   
   mon_no.w = getmonster(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
   If has_trait2(mon_no,#ME_RES_CRITICAL) = 1
      schaden_critical = 0
   EndIf
   
   ProcedureReturn schaden_critical
   
EndProcedure

; --------------------------------------------------------------------------------

Procedure waffe_attack()

   waffe_attack.w = 0
   waffe.w = 0
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
         waffe = waffe + item(inventory(i,akt_spieler)\name)\attri1
      EndIf
   Next
   
   If waffe > 0
      waffe_attack = waffe
   EndIf
   
   ; Kampf mit Schwertern
   If skills(#CE_SCHWERTKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_SCHWERT) = 1
      waffe_attack = waffe_attack + 2
   EndIf
   
   ; Kampf mit Aexten
   If skills(#CE_AXTKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_AXT) = 1
      waffe_attack = waffe_attack + 2
   EndIf
   
   ; Kampf mit Speeren
   If skills(#CE_SPEERKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_SPEER) = 1
      waffe_attack = waffe_attack + 2
   EndIf
   
   ; Kampf mit Haemmern
   If skills(#CE_HAMMERKAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_HAMMER) = 1
      waffe_attack = waffe_attack + 2
   EndIf
   
   ; Waffenloser Kampf
   If skills(#CE_WAFFENLOSER_KAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_WAFFENLOS) = 0
      waffe_attack = waffe_attack + 3
   EndIf
   
   ; Kampf ohne Waffe
   If ich_trage(#KLASSE_WAFFENLOS) = 0 And skills(#CE_WAFFENLOSER_KAMPF,akt_spieler)\gewaehlt = 0 And spieler(akt_spieler)\creature_typ = 0
      waffe_attack = waffe_attack / 2
   EndIf
   

   ProcedureReturn waffe_attack
   
EndProcedure

; --------------------------------------------------------------------------------

Procedure schutz_min(i)

   bonus_min.w = 0

    If inventory(i,akt_spieler)\status = 0
       bonus_min = item(inventory(i,akt_spieler)\name)\attri2
    EndIf
    If inventory(i,akt_spieler)\status = 1
       bonus_min = item(inventory(i,akt_spieler)\name)\attri2 / 2
    EndIf
    
    ProcedureReturn bonus_min
            
 EndProcedure
 
Procedure schutz_max(i)

   bonus_max.w = 0

    If inventory(i,akt_spieler)\status = 0
       bonus_max = item(inventory(i,akt_spieler)\name)\attri3
    EndIf
    If inventory(i,akt_spieler)\status = 1
       bonus_max = item(inventory(i,akt_spieler)\name)\attri3 / 2
    EndIf
    
    ProcedureReturn bonus_max
            
 EndProcedure
 
Procedure schutz_behinderung(i)

   bonus_behinderung.w = 0
    bonus_behinderung = item(inventory(i,akt_spieler)\name)\attri1
    
    ProcedureReturn bonus_behinderung
            
 EndProcedure


Procedure schutz()

Shared schutz_min, schutz_max, behinderung

   schutz_min = 0
   schutz_max = 0
   behinderung = 0

   ; Andere Gestalt?
   okay.w = 0
   If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
      okay = 1
      schutz_min = 0
      schutz_max = 1
   EndIf
   If habich(#SPELL_FLEDERMAUSGESTALT) > 0 And okay = 0
      okay = 1
      schutz_min = 0
      schutz_max = 4
   EndIf
   If habich(#SPELL_VOGELGESTALT) > 0 And okay = 0
      okay = 1
      schutz_min = 0
      schutz_max = 5
   EndIf
   If habich(#SPELL_KATZENGESTALT) > 0 And okay = 0
      okay = 1
      schutz_min = 1
      schutz_max = 6
   EndIf
   If habich(#SPELL_WOLFSGESTALT) > 0 And okay = 0
      okay = 1
      schutz_min = 1
      schutz_max = 6
   EndIf
   If habich(#SPELL_DRACHENGESTALT) > 0 And okay = 0
      okay = 1
      schutz_min = 3
      schutz_max = 12
   EndIf
   
   If okay = 0
      ; 6:Helm, 7:gloves, 8:boots, 9:body armor, 11:shield
      For i = 1 To #MAX_RUCKSACK
         type.w = item(inventory(i,akt_spieler)\name)\type
         If inventory(i,akt_spieler)\benutzt = 1 And (type = #ITEMTYPE_HELMET Or type = #ITEMTYPE_GLOVE Or type = #ITEMTYPE_BOOTS Or type = #ITEMTYPE_ARMOR Or type = #ITEMTYPE_SHIELD)
            schutz_min = schutz_min + schutz_min(i)
            schutz_max = schutz_max + schutz_max(i)
            behinderung = behinderung + schutz_behinderung(i)
         EndIf
      Next
   EndIf
   

EndProcedure

; --------------------------------------------------------------------------------

Procedure luck()

   akt_luck.w = spieler(akt_spieler)\Luck_score
   ; Glueckszauber ?
   If habich(#SPELL_GLUECKSZAUBER) > 0
      akt_luck = akt_luck + habich(#SPELL_GLUECKSZAUBER)
   EndIf
   
   akt_luck = akt_luck + spieler(akt_spieler)\gluecksgegenstand
   
   If akt_luck > 15
      akt_luck = 15
   EndIf

ProcedureReturn akt_luck

EndProcedure

; --------------------------------------------------------------------------------

Procedure power(spell.w)

Shared item_spell

   akt_power.w = spieler(akt_spieler)\Power_score

   ; Arkane Gabe ?
   If spell > 0
      If skills(#CE_ARKANE_GABE,akt_spieler)\gewaehlt = 1
         akt_power = akt_power + spells(spell)\level
      EndIf
   EndIf
   ; Blutmagie
   If skills(#CE_BLUTMAGIE,akt_spieler)\gewaehlt = 1
      okay = 0
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 4)) And okay = 0
         akt_power = akt_power * 5
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 3)) And okay = 0
         akt_power = akt_power * 4
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 2)) And okay = 0
         akt_power = akt_power * 3
         okay = 1
      EndIf
      If (spieler(akt_spieler)\lifepoints <= (maxlife() / 1.5)) And okay = 0
         akt_power = akt_power * 2
         okay = 1
      EndIf
   EndIf
   If habich(#SPELL_MACHT) > 0
      akt_power = akt_power * 2
   EndIf
   If item_spell
      akt_power = item_spell
   EndIf
   akt_power = akt_power + spieler(akt_spieler)\powergegenstand
   
   If spieler(akt_spieler)\fluch = #FLUCH_DER_HEKATE
      akt_power = 1
   EndIf
   
   ; Magelord?
   magelord.w = 0
   For i = 1 To nr_of_players
     If skills(#CE_ZAUBERFUERST,i)\gewaehlt = 1 And spieler(i)\Status = 1
       magelord = 2
     EndIf
   Next
   akt_power = akt_power + magelord
   
   If akt_power > 15
      akt_power = 15
   EndIf

ProcedureReturn akt_power

EndProcedure

; --------------------------------------------------------------------------------

Procedure reflexe()

   akt_reflexe.w = spieler(akt_spieler)\Dexterity
   akt_reflexe = akt_reflexe + spieler(akt_spieler)\dexteritygegenstand
   okay = 0
   If spieler(akt_spieler)\fluch = #FLUCH_DER_ARTEMIS
      akt_reflexe = 1
      okay = 1
   EndIf
   If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN And okay = 0
      akt_reflexe = 1
      okay = 1
   EndIf
   If habich(#SPELL_FLEDERMAUSGESTALT) > 0 And okay = 0
      akt_reflexe = 6
      okay = 1
   EndIf
   If habich(#SPELL_VOGELGESTALT) > 0 And okay = 0
      akt_reflexe = 6
      okay = 1
   EndIf
   If habich(#SPELL_KATZENGESTALT) > 0 And okay = 0
      akt_reflexe = 10
      okay = 1
   EndIf
   If habich(#SPELL_WOLFSGESTALT) > 0 And okay = 0
      akt_reflexe = 6
      okay = 1
   EndIf
   If habich(#SPELL_DRACHENGESTALT) > 0 And okay = 0
      akt_reflexe = 1
   EndIf

   akt_reflexe = akt_reflexe + habich(#SPELL_CONCENTRATION)
   akt_reflexe = akt_reflexe - spieler(akt_spieler)\krankheit
   
   If akt_reflexe > 15
      akt_reflexe = 15
   EndIf

ProcedureReturn akt_reflexe

EndProcedure

; --------------------------------------------------------------------------------

Procedure maxlife()

   akt_maxlife.w = spieler(akt_spieler)\MaxLifepoints
   okay = 0
   If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
      akt_maxlife = 1
      okay = 1
   EndIf
   If habich(#SPELL_FLEDERMAUSGESTALT) > 0 And okay = 0
      akt_maxlife = spieler(akt_spieler)\MaxLifepoints / 3
      okay = 1
   EndIf
   If habich(#SPELL_VOGELGESTALT) > 0 And okay = 0
      akt_maxlife = spieler(akt_spieler)\MaxLifepoints / 3
      okay = 1
   EndIf
   If habich(#SPELL_KATZENGESTALT) > 0 And okay = 0
      akt_maxlife = spieler(akt_spieler)\MaxLifepoints / 2
      okay = 1
   EndIf
   If habich(#SPELL_DRACHENGESTALT) > 0 And okay = 0
      akt_maxlife = spieler(akt_spieler)\MaxLifepoints * 3
   EndIf
   
   akt_maxlife = akt_maxlife + spieler(akt_spieler)\lifepointgegenstand

   If skills(#CE_STAEMMIG,akt_spieler)\gewaehlt = 1
      akt_maxlife = akt_maxlife + (spieler(akt_spieler)\Strength * 2)
   EndIf
   
   If akt_maxlife > 150
      akt_maxlife = 150
   EndIf
   
   If skills(#CE_SCHWACH,akt_spieler)\gewaehlt = 1
      If akt_maxlife > 50
         akt_maxlife = 50
      EndIf
   EndIf

ProcedureReturn akt_maxlife

EndProcedure

; --------------------------------------------------------------------------------

Procedure belastung()

   ; Gewicht macht langsamer
   belastung.w = 0
   If skills(#CE_TRAEGER,akt_spieler)\gewaehlt = 0
      gewicht.w = gewicht()/10
      If spieler(akt_spieler)\fluch = #FLUCH_MAGNETO
         gewicht = gewicht * 2
      EndIf
      For i = 2 To 9
         If gewicht > i*10
            belastung = belastung + 1
         EndIf
      Next
      
      If belastung > 0
        belastung = belastung - staerke() / 2
        If belastung < 0
            belastung = 0
        EndIf
      EndIf
    EndIf
    
    ProcedureReturn belastung
    
EndProcedure

; --------------------------------------------------------------------------------

Procedure maxspeed()

   akt_maxspeed.w = spieler(akt_spieler)\MaxSpeed
   okay = 0
   If habich(#SPELL_FLEDERMAUSGESTALT) > 0 And okay = 0
      akt_maxspeed = 10
      okay = 1
   EndIf
   If habich(#SPELL_VOGELGESTALT) > 0 And okay = 0
      akt_maxspeed = 10
      okay = 1
   EndIf
   If habich(#SPELL_KATZENGESTALT) > 0 And okay = 0
      akt_maxspeed = 10
      okay = 1
   EndIf
   If habich(#SPELL_WOLFSGESTALT) > 0 And okay = 0
      akt_maxspeed = 10
      okay = 1
   EndIf
   If habich(#SPELL_DRACHENGESTALT) > 0 And okay = 0
      akt_maxspeed = 5
   EndIf
   
   If spieler(akt_spieler)\creature_typ > 0
      ec.w = get_enchant_creature()
      If ec > 1
         akt_maxspeed = akt_maxspeed + ec -1
      EndIf
   EndIf

   ; Rueckenwind?
   akt_maxspeed = akt_maxspeed + habich(#SPELL_RUECKENWIND)
   
   ; Magischer Gegenstand?
   akt_maxspeed = akt_maxspeed + spieler (akt_spieler)\zugweitegegenstand
   
   ; Kundschafter?
   kundschafter.w = 0
   For i = 1 To nr_of_players
      If skills(#CE_KUNDSCHAFTER,i)\gewaehlt = 1 And spieler(i)\Status = 1
         kundschafter = 2
      EndIf
   Next
   akt_maxspeed = akt_maxspeed + kundschafter
   
   ; Meister der Winde?
   meister.w = 0
   For i = 1 To nr_of_players
     If spieler(i)\Status <> 1
       Continue
     EndIf
     If hater(#SPELL_WINDMEISTER,i) > 0
       meister = 2
     EndIf
   Next
   akt_maxspeed = akt_maxspeed + meister
   
   ; Schleichen macht langsamer!
   If spieler(akt_spieler)\schleichen > 0
      akt_maxspeed = akt_maxspeed / 2
   EndIf
   
   akt_maxspeed = akt_maxspeed - belastung()

   akt_maxspeed = akt_maxspeed - spieler(akt_spieler)\krankheit
   
   ; Lahm?
   If skills(#CE_LAHM,akt_spieler)\gewaehlt = 1 
      akt_maxspeed = akt_maxspeed / 2
      If akt_maxspeed < 1
         akt_maxspeed = 1
      EndIf
   EndIf
   
   ; Paralyse?
   If spieler(akt_spieler)\fluch = #FLUCH_PARALYSE
      akt_maxspeed = 1
   EndIf
   
   If akt_maxspeed <= 1
      akt_maxspeed = 1
   EndIf
   
   If akt_maxspeed > 25
      akt_maxspeed = 25
   EndIf

ProcedureReturn akt_maxspeed

EndProcedure

; --------------------------------------------------------------------------------

Procedure staerke()

   dragon.w = 0
   akt_strength.w = spieler(akt_spieler)\Strength
   okay = 0
   If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
      akt_strength = 1
      okay = 1
   EndIf
   If habich(#SPELL_FLEDERMAUSGESTALT) > 0 And okay = 0
      akt_strength = 1
      okay = 1
   EndIf
   If habich(#SPELL_VOGELGESTALT) > 0 And okay = 0
      akt_strength = 1
      okay = 1
   EndIf
   If habich(#SPELL_KATZENGESTALT) > 0 And okay = 0
      akt_strength = 1
      okay = 1
   EndIf
   If habich(#SPELL_WOLFSGESTALT) > 0 And okay = 0
      akt_strength = 5
      okay = 1
   EndIf
   If habich(#SPELL_DRACHENGESTALT) > 0 And okay = 0
      akt_strength = 30
      dragon = 1
   EndIf
   
   akt_strength = akt_strength + spieler(akt_spieler)\staerkegegenstand + habich(#SPELL_ERDSTAERKE)
   akt_strength = akt_strength - spieler(akt_spieler)\krankheit
   
   If akt_strength > 15 And dragon = 0
      akt_strength = 15
   EndIf
   If akt_strength < 1
      akt_strength = 1
   EndIf
   

ProcedureReturn akt_strength

EndProcedure

; --------------------------------------------------------------------------------

Procedure angriff()

   akt_angriff.w = spieler(akt_spieler)\Attack
   akt_angriff = akt_angriff + spieler(akt_spieler)\attackgegenstand
   akt_angriff = akt_angriff + habich(#SPELL_PRAEZISION)
   
   ; Anfuehrer?
   anfuehrer.w = 0
   For i = 1 To nr_of_players
     If skills(#CE_ANFUEHRER,i)\gewaehlt = 1 And spieler(i)\Status = 1
       anfuehrer = 2
     EndIf
   Next
   ; Duelist ?
   If skills(#CE_DUELIST,akt_spieler)\gewaehlt = 1
      akt_angriff = akt_angriff + reflexe() / 2
   EndIf
   ; Kampfeswut ?
   If skills(#CE_KAMPFESWUT,akt_spieler)\gewaehlt = 1
      akt_angriff = akt_angriff + staerke() / 2
   EndIf
   akt_angriff = akt_angriff + anfuehrer
   akt_angriff = akt_angriff - spieler(akt_spieler)\krankheit
      ; Waffenloser Kampf
   If skills(#CE_WAFFENLOSER_KAMPF,akt_spieler)\gewaehlt = 1 And ich_trage(#KLASSE_WAFFENLOS) = 0
   akt_angriff = akt_angriff + 3
   EndIf
   
   ; Fighting styles
   If spieler(akt_spieler)\style = 1
      akt_angriff = akt_angriff + 2
   EndIf
   If spieler(akt_spieler)\style = 2 Or spieler(akt_spieler)\style = 4 Or spieler(akt_spieler)\style = 7 Or spieler(akt_spieler)\style = 9
      akt_angriff = akt_angriff - 2
   EndIf
   If spieler(akt_spieler)\style = 3
      akt_angriff = (akt_angriff+1) / 2
   EndIf
   
   angriff = angriff + habich(#SPELL_SCHOCK)

   If akt_angriff < 1
      akt_angriff = 1
   EndIf

   ProcedureReturn akt_angriff

EndProcedure

; --------------------------------------------------------------------------------
Procedure maxmana()

   akt_maxmana.w = spieler(akt_spieler)\maxmana
   
   akt_maxmana = akt_maxmana + spieler(akt_spieler)\managegenstand
   
   If akt_maxmana > 150
      akt_maxmana = 150
   EndIf
   If skills(#CE_GERINGES_MANA,akt_spieler)\gewaehlt = 1
      If akt_maxmana > 50
         akt_maxmana = 50
      EndIf
   EndIf

   ProcedureReturn akt_maxmana

EndProcedure


; --------------------------------------------------------------------------------
Procedure wahrnehmung()

   akt_wahrnehmung.w = spieler(akt_spieler)\perception
   akt_wahrnehmung = akt_wahrnehmung + habich(#SPELL_HEXENSICHT) * 10
   akt_wahrnehmung = akt_wahrnehmung + spieler(akt_spieler)\perceptiongegenstand
   
   If akt_wahrnehmung > 15
      akt_wahrnehmung = 15
   EndIf

   ProcedureReturn akt_wahrnehmung

EndProcedure

; --------------------------------------------------------------------------------

Procedure schleichen()

Shared behinderung, xmod, ymod

   If skills(#CE_SCHLEICHEN,akt_spieler)\gewaehlt = 1
      akt_schleichen = (luck() * 5) + (spieler(akt_spieler)\dexterity * 10) + spieler(akt_spieler)\stealthgegenstand + 25
   Else
      akt_schleichen = (luck() * 5) + (spieler(akt_spieler)\dexterity * 5) + spieler(akt_spieler)\stealthgegenstand
   EndIf
   okay = 0
   If spieler(akt_spieler)\fluch = #FLUCH_CHICKEN
      akt_schleichen = 0
      okay = 1
   EndIf
   If habich(#SPELL_FLEDERMAUSGESTALT) > 0 And okay = 0
      akt_schleichen = 70
      okay = 1
   EndIf
   If habich(#SPELL_VOGELGESTALT) > 0 And okay = 0
      akt_schleichen = 70
      okay = 1
   EndIf
   If habich(#SPELL_KATZENGESTALT) > 0 And okay = 0
      akt_schleichen = 70
      okay = 1
   EndIf
   If habich(#SPELL_DRACHENGESTALT) > 0 And okay = 0
      akt_schleichen = 0
   EndIf
   If habich(#SPELL_UNSICHTBARKEIT) > 0
      akt_schleichen = akt_schleichen + 40
   EndIf
   schutz()
   akt_schleichen = akt_schleichen - behinderung * 10
   mon_no.w = getmonster(spieler(akt_spieler)\character_x+xmod, spieler(akt_spieler)\character_y+ymod)
   akt_schleichen = akt_schleichen - (monster(mon_no)\minlevel * 2)
   
   ; Schlafendes Monster?
   If monster_list()\status = #MONSTERSTATUS_SCHLAEFT
      akt_schleichen = akt_schleichen + 40
   EndIf
   
   ; Blindes Monster?
   If monster_list()\status = #MONSTERSTATUS_BLIND
      akt_schleichen = akt_schleichen + 20
   EndIf
   
   ; Alarmiertes Monster?
   If monster_list()\status = #MONSTERSTATUS_ALERT
      akt_schleichen = 0
   EndIf
   
   If akt_schleichen < 1
      akt_schleichen = 0
   EndIf
   If akt_schleichen > 80
      akt_schleichen = 80
   EndIf
   
   ProcedureReturn akt_schleichen

EndProcedure


; --------------------------------------------------------------------------------------
; Gegenstand - Klasse
Procedure ich_trage(was.w)

    carry.w = 0
    waffe = 0
    For i = 1 To #MAX_RUCKSACK
       If item(inventory(i,akt_spieler)\name)\klasse = was And inventory(i,akt_spieler)\benutzt = 1
          carry = 1
       EndIf
       If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
          waffe = 1
       EndIf
    Next
    
    If was = #KLASSE_WAFFENLOS And waffe = 1
       carry = 1
    EndIf
    
    ProcedureReturn carry

EndProcedure

; --------------------------------------------------------------------------------------
; Gegenstand - Art
Procedure ich_trage3(was.w)

    carry.w = 0
    For i = 1 To #MAX_RUCKSACK
       If inventory(i,akt_spieler)\name = was And inventory(i,akt_spieler)\benutzt = 1
          carry = 1
       EndIf
    Next
    
    ProcedureReturn carry

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure zauberchance(spell.w)

Shared behinderung

  chance.w = learned(akt_spieler,spell) & 127
  ; Zauberkunst
  If aus_schule(spell) = 1
     If skills(#CE_ZAUBERKUNST,akt_spieler)\gewaehlt = 1
        chance = max(99,chance)
     EndIf
  EndIf
  ; Zaubern in Ruestung ?
  If skills(#CE_ZAUBERN_IN_RUESTUNG,akt_spieler)\gewaehlt = 0
     schutz()
     chance = chance - (behinderung * 10)
  EndIf
  If spells(spell)\school = #school_bard And skills(#CE_ZAUBERLIEDER,akt_spieler)\gewaehlt = 1
    chance = 100 ; make bard songs 100% even if encumbered
  EndIf
  
  ProcedureReturn chance

EndProcedure

; ------------------------------------------------------------------------------------------

Procedure spieler_angriffswert()

Shared behinderung

   angriff.w = 20 + (angriff() * 10) + (waffe_attack() * 10) + (habich(#SPELL_LIED_DES_KAMPFES) * 10)
   ; Behinderung durch Ruestung ?
   If skills(#CE_KAMPF_IN_RUESTUNG,akt_spieler)\gewaehlt = 0
      angriff   = angriff - (behinderung * 10)
   EndIf
   If spieler(akt_spieler)\creature_typ > 0
      angriff = angriff + get_enchant_creature()*10
   EndIf
   If spieler(akt_spieler)\fluch = #FLUCH_DES_ARES
      angriff = 10
   EndIf

   ProcedureReturn angriff
   
EndProcedure
; --------------------------------------------------------------------------------------
Procedure magic_resistance(playnum.w = -1)

    If playnum = -1
       playnum = akt_spieler
    EndIf
    resi.w = spieler(playnum)\magic_resistance
    resi = resi + hater(#SPELL_MAGIESCHUTZ,playnum) * 5
    If resi > 100
       resi = 100
    EndIf
    ProcedureReturn resi

EndProcedure
; --------------------------------------------------------------------------------------
Procedure poison_resistance(playnum.w = -1)

    If playnum = -1
       playnum = akt_spieler
    EndIf
    resi.w = spieler(playnum)\poison_resistance
    resi = resi + hater(#SPELL_GIFTSCHUTZ,playnum) * 5
    If resi > 100
       resi = 100
    EndIf
    ProcedureReturn resi

EndProcedure
; --------------------------------------------------------------------------------------
Procedure fire_resistance(playnum.w = -1)

    If playnum = -1
       playnum = akt_spieler
    EndIf
    resi.w = spieler(playnum)\fire_resistance
    resi = resi + hater(#SPELL_FEUERSCHILD,playnum) * 5
    If resi > 100
       resi = 100
    EndIf
    ProcedureReturn resi

EndProcedure
; --------------------------------------------------------------------------------------
Procedure cold_resistance(playnum.w = -1)

    If playnum = -1
       playnum = akt_spieler
    EndIf
    resi.w = spieler(playnum)\cold_resistance
    resi = resi + hater(#SPELL_EISSCHILD,playnum) * 5
    If resi > 100
       resi = 100
    EndIf
    ProcedureReturn resi

EndProcedure
; --------------------------------------------------------------------------------------
Procedure lightning_resistance(playnum.w = -1)

    If playnum = -1
       playnum = akt_spieler
    EndIf
    resi.w = spieler(playnum)\lightning_resistance
    resi = resi + hater(#SPELL_BLITZSCHUTZ,playnum) * 5
    If resi > 100
       resi = 100
    EndIf
    ProcedureReturn resi

EndProcedure

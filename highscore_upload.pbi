Procedure highscore_upload(mk_csv.w,last_words.s)

Shared anfangszeit, nr_of_saves

  server.s = "www.lostlabyrinth.com"
  If test = 1
     server = "localhost"
  EndIf
  p.s = ""

  name.s = spieler(akt_spieler)\Name
  verifikation.s = spieler(akt_spieler)\verifikation
  gold.l = gold_anzahl()
  ebene.l = spieler(akt_spieler)\level
  version.s = "4.5"
  version_real.s = #PROGRAMMVERSION
  runden.w = spieler(akt_spieler)\moves
  charactereigenschaften.s = ""
  todesart.w = spieler(akt_spieler)\cause_of_death
  todesart_monster.w = spieler(akt_spieler)\cause_of_death_monster
  For i.w = 1 To #ANZ_SKILLS
    akt_skill.w = 0
    If skills(i,akt_spieler)\gewaehlt = 1 Or mk_csv = 1
      If charactereigenschaften <> ""
        charactereigenschaften = charactereigenschaften + ":"
      EndIf
      Select(i)
       ; max now 135
       Case #CE_WEG_DES_SCHWERTES
         akt_skill = 0
       Case #CE_KAMPFTRAINING
         akt_skill = 22 
       Case #CE_KONSTITUTION
         akt_skill = 23 
       Case #CE_STAERKE
         akt_skill = 24 
       Case #CE_BERSERKER
         akt_skill = 52 
       Case #CE_GEWANDTHEIT
         akt_skill = 25 
       Case #CE_AUSWEICHEN
         akt_skill = 26 
       Case #CE_KAMPF_IN_RUESTUNG
        akt_skill = 27 
       Case #CE_HAERTE
         akt_skill = 40
       Case #CE_VETERAN
         akt_skill = 45 
       Case #CE_DUELIST
         akt_skill = 54 
       Case #CE_KAMPFESWUT
         akt_skill = 56 
       Case #CE_ZWEI_WAFFEN
         akt_skill = 86 
       Case #CE_JAEGER
         akt_skill = 78
       Case #CE_PALADIN
         akt_skill = 76 
       Case #CE_KOPFGELDJAEGER
         akt_skill = 77 
       Case #CE_GEISTERJAEGER
         akt_skill = 120
       Case #CE_BLUTRAUSCH
         akt_skill = 91 
       Case #CE_RUNDSCHLAG
         akt_skill = 101
       Case #CE_STURMANGRIFF
         akt_skill = 102 
       Case #CE_FLINKE_ATTACKE
         akt_skill = 103
       Case #CE_SCHWERTKAMPF
         akt_skill = 92
       Case #CE_AXTKAMPF
         akt_skill = 93 
       Case #CE_SPEERKAMPF
         akt_skill = 94
       Case #CE_HAMMERKAMPF
         akt_skill = 95
       Case #CE_WAFFENLOSER_KAMPF
         akt_skill = 96
       Case #CE_ANFUEHRER
         akt_skill = 105
       Case #CE_SOELDNER
         akt_skill = 116
       Case #CE_KAMPFTECHNIKEN
         akt_skill = 131
  
       Case #CE_WEG_DES_BOGENS
         akt_skill = 0
       Case #CE_BOGENSCHIESSEN
         akt_skill = 50 
       Case #CE_ZEN_BOGEN
         akt_skill = 104
       Case #CE_PFEILMACHER
         akt_skill = 117
       Case #CE_SCHARFSCHUETZE
         akt_skill = 118
       
       Case #CE_WEG_DER_MAGIE
         akt_skill = 0
       Case #CE_ARKANE_GABE
         akt_skill = 1 
       Case #CE_LEYKONTAKT
         akt_skill = 2 
       Case #CE_MAGIELEHRE
         akt_skill = 3 
       Case #CE_ZAUBERMACHT
         akt_skill = 4 
       Case #CE_MANA
         akt_skill = 41 
       Case #CE_ZAUBERKUNST
         akt_skill = 46 
       Case #CE_ALTE_MAGIE
         akt_skill = 49
       Case #CE_MAGIERESISTENZ
         akt_skill = 5 
       Case #CE_ALCHEMIE
         akt_skill = 6 
       Case #CE_THAUMATURGIE
         akt_skill = 7 
       Case #CE_ZAUBERN_IN_RUESTUNG
         akt_skill = 9 
       Case #CE_BLUTMAGIE
         akt_skill = 57 
       Case #CE_ZAUBERSCHRIFT
         akt_skill = 42 
       Case #CE_STERNENMAGIE
         akt_skill = 10 
       Case #CE_ILLUSIONSMAGIE
         akt_skill = 11 
       Case #CE_WARLOCK
         akt_skill = 12 
       Case #CE_WEISSE_MAGIE
         akt_skill = 13 
       Case #CE_SCHWARZE_MAGIE
         akt_skill = 14
       Case #CE_FEUERMAGIE
         akt_skill = 15 
       Case #CE_WASSERMAGIE
         akt_skill = 16 
       Case #CE_ERDMAGIE
         akt_skill = 17 
       Case #CE_LUFTMAGIE
         akt_skill = 18 
       Case #CE_DRUIDENMAGIE
         akt_skill = 19 
       Case #CE_HEXEREI
         akt_skill = 20 
       Case #CE_HOHE_MAGIE
         akt_skill = 21 
       Case #CE_ZAUBERLIEDER
         akt_skill = 60
       Case #CE_BESTAENDIGKEIT
         akt_skill = 75 
       Case #CE_ELEMENTARMAGIE
         akt_skill = 97
       Case #CE_ZAUBERFUERST
         akt_skill = 106
       Case #CE_SCROLLORE
         akt_skill = 107
       Case #CE_FREIE_MAGIE
         akt_skill = 114
       Case #CE_ZAUBERWEBEN
         akt_skill = 132
       Case #CE_BESCHWOERER
         akt_skill = 122
  
       Case #CE_WEG_DER_SCHATTEN
         akt_skill = 0
       Case #CE_FALLENKUNDE
         akt_skill = 28 
       Case #CE_WAHRNEHMUNG
         akt_skill = 29 
       Case #CE_NACHTSICHT
         akt_skill = 30 
       Case #CE_SCHNELLIGKEIT
         akt_skill = 31 
       Case #CE_SCHLEICHEN
         akt_skill = 32 
       Case #CE_SCHLOESSER_OEFFNEN
         akt_skill = 33 
       Case #CE_DIEBSTAHL
         akt_skill = 34 
       Case #CE_ASSASSINE
         akt_skill = 48 
       Case #CE_GEFAHREN_SPUEREN
         akt_skill = 89
       Case #CE_KUNDSCHAFTER
         akt_skill = 108
       Case #CE_SCHATZJAEGER
         akt_skill = 99
       Case #CE_ERDE_SPUEREN
         akt_skill = 100
       Case #CE_MONSTER_SPUEREN
         akt_skill = 119
       Case #CE_CANNIBAL
         akt_skill = 134
       Case #CE_UNDEAD
         akt_skill = 135
  
       Case #CE_WEG_DER_ABENTEUER
         akt_skill = 0
       Case #CE_GLUECK
         akt_skill = 35 
       Case #CE_GIFTRESISTENZ
         akt_skill = 36 
       Case #CE_HEILKUNDE
         akt_skill = 39 
       Case #CE_KARTOGRAPHIE
         akt_skill = 43 
       Case #CE_SPELUNKER
         akt_skill = 44 
       Case #CE_ERBSCHAFT
         akt_skill = 47 
       Case #CE_UDJAT
         akt_skill = 59 
       Case #CE_WEISHEIT
         akt_skill = 71
       Case #CE_RINGMEISTERUNG
         akt_skill = 87
       Case #CE_MYSTISCHE_ATTACKE
         akt_skill = 88
       Case #CE_UEBERLEBEN
         akt_skill = 109
       Case #CE_HAENDLER
         akt_skill = 110
       Case #CE_VISIONEN
         akt_skill = 111
       Case #CE_SCHMIEDEKUNST
         akt_skill = 113
       Case #CE_ELFENBLUT
         akt_skill = 55 
       Case #CE_STAEMMIG
         akt_skill = 123
       Case #CE_FINGERFERTIGKEIT
         akt_skill = 124
       Case #CE_AWARENESS
         akt_skill = 129
  
       Case #CE_WEG_DER_GOETTER
         akt_skill = 0
       Case #CE_AKOLYTH
         akt_skill = 8 
       Case #CE_GOTT_DES_KRIEGES
         akt_skill = 79 
       Case #CE_GOTT_DES_TODES
         akt_skill = 80 
       Case #CE_GOETTIN_DER_WEISHEIT
         akt_skill = 81 
       Case #CE_GOETTIN_DER_HEILUNG
         akt_skill = 82 
       Case #CE_GOTT_DER_GEHEIMNISSE
         akt_skill = 84 
       Case #CE_GOTT_DES_REICHTUMS
         akt_skill = 83
  
       Case #CE_SEKUNDAERE_FAEHIGKEITEN
         akt_skill = 0
       Case #CE_WURFWAFFEN
         akt_skill = 98
       Case #CE_KLETTERN
         akt_skill = 37
       Case #CE_SCHWIMMEN
         akt_skill = 38 
       Case #CE_KRAEUTERKUNDE
         akt_skill = 51 
       Case #CE_FEILSCHEN
         akt_skill = 53 
       Case #CE_MONSTERKUNDE
         akt_skill = 58 
       Case #CE_GIFTKENNTNIS
         akt_skill = 90
       Case #CE_TRAEGER
         akt_skill = 115
       Case #CE_NATIVE_MAGIE
         akt_skill = 121
       Case #CE_MONKEY_GRIP
         akt_skill = 128
       Case #CE_NATURAL_MANA
         akt_skill = 130
  
       Case #CE_NACHTEILE
         akt_skill = 0
       Case #CE_SCHWACH
         akt_skill = 61 
       Case #CE_ARM
         akt_skill = 62 
       Case #CE_UNAUFMERKSAM
         akt_skill = 63 
       Case #CE_GERINGES_MANA
         akt_skill = 64 
       Case #CE_GIFTSCHWAECHE
         akt_skill = 65 
       Case #CE_MAGIESCHWAECHE
         akt_skill = 66 
       Case #CE_VERFLUCHT
         akt_skill = 67 
       Case #CE_GOTTLOS
         akt_skill = 68 
       Case #CE_KURZSICHTIG
         akt_skill = 69 
       Case #CE_DUMM
         akt_skill = 70   
       Case #CE_AUSGESTOSSEN
         akt_skill = 74
       Case #CE_DISJUNCT
         akt_skill = 73 
       Case #CE_KEINE_BASISMAGIE
         akt_skill = 72  
       Case #CE_KURZE_MAGIE
         akt_skill = 85 
       Case #CE_LAHM
         akt_skill = 112
       Case #CE_KEIN_ANGRIFF
         akt_skill = 133
  
       Case #CE_SEKUNDAERE_NACHTEILE:
         akt_skill = 0
       Case #CE_SCHWACHE_ARME:
         akt_skill = 125
       Case #CE_SCHWACHE_FINGER:
         akt_skill = 126
       Case #CE_VERUNSTALTET:
         akt_skill = 127
       Default:
         akt_skill = 0
      EndSelect
      If akt_skill > 0
        If mk_csv = 1
          PrintN (Str(akt_skill)+",'"+skills(i,1)\name[1]+"','"+skills(i,1)\name[2]+"','"+skills(i,1)\name[3]+"',"+Str(skills(i,1)\gruppe)+","+Str(skills(i,1)\kosten))
        Else
          charactereigenschaften = charactereigenschaften + Right(Str(akt_skill),3)
        EndIf
      EndIf
    EndIf
  Next

  If mk_csv = 1
    ; do nothing more, we are only creating the csv for the database
    ProcedureReturn 0
  EndIf

  gef_stabteile.w = anz_staffpieces()
  
  icon.w = spieler(akt_spieler)\maennchen

  endezeit.s = FormatDate("%yyyy%mm%dd%hh%ii%ss", Date())
  mks.l = spieler(akt_spieler)\mks
  score.l = punkte()


  ; initialize TCP/IP stack
  If InitNetwork() = 0
  EndIf


  ; connect to server
  con = OpenNetworkConnection(server, 80)
  If con = 0
  EndIf


  ; create string for http GET request
  p = "name=" + ReplaceString(name," ","%20") ; name entered in highscore table
  p = p + "&verifikation=" + verifikation
  p = p + "&anfangszeit=" + anfangszeit
  p = p + "&endezeit=" + endezeit
  p = p + "&ebene=" + Str(ebene) ; last game level (integer)
  p = p + "&mks=" + Str(mks) ; monsters killed (integer)
  p = p + "&punkte=" + Str(score) ; number of points scored (integer)
  p = p + "&version=" + version ; version number of highscore (string)
  p = p + "&version_real=" + version_real ; version number of program (string)
  p = p + "&gold=" + Str(gold) ; gold coins collected (integer)
  p = p + "&cause_of_death=" + Str(todesart) ; character was killed by 
  p = p + "&cause_of_death_monster=" + Str(todesart_monster) ; character was killed by 
  p = p + "&last_words=" + ReplaceString(last_words," ","%20")
  p = p + "&icon=" + Str(icon) ; ID of character graphics (integer)
  p = p + "&st=" + Str(gef_stabteile)
  p = p + "&runden=" + Str(runden)
  p = p + "&ce=" + charactereigenschaften ; list of character abilities
  p = p + "&saves=" + Str(nr_of_saves)
  p = p + "&nr_of_players=" + Str(nr_of_players/2)
  p = p + "&max_lp=" + Str(spieler(akt_spieler)\MaxLifepoints)
  p = p + "&max_mp=" + Str(spieler(akt_spieler)\MaxMana)
  p = p + "&attack=" + Str(spieler(akt_spieler)\Attack)
  p = p + "&dexterity=" + Str(spieler(akt_spieler)\Dexterity)
  p = p + "&strength=" + Str(spieler(akt_spieler)\Strength)
  p = p + "&max_speed=" + Str(spieler(akt_spieler)\MaxSpeed)
  p = p + "&perception=" + Str(spieler(akt_spieler)\Perception)
  p = p + "&luck=" + Str(spieler(akt_spieler)\Luck_score)
  p = p + "&power=" + Str(spieler(akt_spieler)\Power_score)
  p = p + "&circle=" + Str(spieler(akt_spieler)\Circle)
  
  ;newhighscore.php?name=Markus&verifikation=767584637587917675845365768465&anfangszeit=20060115151154&endezeit=20060115161154&ebene=3&mks=23&punkte=54&version=3.0&gold=123&tod=Killed%20by%20Fireball&icon=1&st=0&runden=556&ce=001:002:003&saves=1
  
  SendNetworkString(con, "GET /newhighscore.php?" + p + " HTTP/1.1" + Chr(10))
  SendNetworkString(con, "Host: " + server + Chr(10))
  SendNetworkString(con, "User-agent: PureBasicAgent" + Chr(10))
  SendNetworkString(con, "Accept: */*" + Chr(10))
  SendNetworkString(con, Chr(10))

  ; close connection
  CloseNetworkConnection(con)
  
  message(330,#COLOR_GELB)
  
EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 376
; FirstLine = 351
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
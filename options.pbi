; Optionen
; -------------------------------------------------------------------------------

Procedure save_settings()

Shared joystick_used, win_mode, sound, music
Shared klicking, autopickup, knopf5, no_mouse, flaschen, key_repeat_delay

    If CreateFile(0, environment + "/settings.txt")
      WriteStringN(0,"# Lost Labyrinth Settings File")
      If language = 0
         WriteStringN(0,"language = english   # english, german, spanish")
      EndIf
      If language = 1
         WriteStringN(0,"language = german   # english, german, spanish")
      EndIf
      If language = 2
         WriteStringN(0,"language = spanish   # english, german, spanish")
      EndIf
      WriteStringN(0,"delay_animation  = " + RSet(Str(delay_animation),5)  + "   # One time animation    (5 Digits!)")
      WriteStringN(0,"delay_animation2 = " + RSet(Str(delay_animation2),5) + "   # Animation from Fx     (5 Digits!)")
      WriteStringN(0,"key_repeat = " + RSet(Str(key_repeat_delay),4) + "   # in milliseconds")
      If joystick_used = 0
         WriteStringN(0,"joystick = no   # yes, no")
      EndIf
      If joystick_used = 1
         WriteStringN(0,"joystick = yes   # yes, no")
      EndIf
      If joystick_only = 0
         WriteStringN(0,"no_mouse = no   # yes, no")
      EndIf
      If joystick_only = 1
         WriteStringN(0,"no_mouse = yes   # yes, no")
      EndIf
      If win_mode = 1
         WriteStringN(0,"windowed = no   # yes, no")
      EndIf
      If win_mode = 2
         WriteStringN(0,"windowed = yes    # yes, no")
      EndIf
      If sound = 1
         WriteStringN(0,"sound = yes   # yes, no")
      EndIf
      If sound = 0
         WriteStringN(0,"sound = no    # yes, no")
      EndIf
      If music = 1
         WriteStringN(0,"music = yes   # yes, no")
      EndIf
      If music = 0
         WriteStringN(0,"music = no    # yes, no")
      EndIf
      If klicking = 1
         WriteStringN(0,"klicking = yes   # yes, no")
      EndIf
      If klicking = 0
         WriteStringN(0,"klicking = no    # yes, no")
      EndIf
      If autopickup = 1
         WriteStringN(0,"auto-toggle = yes   # yes, no")
      EndIf
      If autopickup = 0
         WriteStringN(0,"auto-toggle = no    # yes, no")
      EndIf
      If knopf5 = 1
         WriteStringN(0,"button5 = yes   # yes, no")
      EndIf
      If knopf5 = 0
         WriteStringN(0,"button5 = no    # yes, no")
      EndIf
      If flaschen = 1
         WriteStringN(0,"jars = yes   # yes, no")
      EndIf
      If flaschen = 0
         WriteStringN(0,"jars = no    # yes, no")
      EndIf
      CloseFile(0)
      
      ProcedureReturn 1
   Else
   
      ProcedureReturn 0
   EndIf

EndProcedure

; -------------------------------------------------------------------------------

Procedure load_settings()

Shared joystick_used, win_mode, sound, music
Shared klicking, autopickup, knopf5, no_mouse, flaschen, key_repeat_delay

  load.w = 0
    If ReadFile(0, environment + "/settings.txt")
      load = 1
   ElseIf ReadFile(0, "./settings.txt")
      load = 1
   EndIf
   key_repeat_delay = 90
  
    If load = 1
      While (Eof(0) = 0)
         zw.s = ReadString(0)
         If Mid(zw,1,1) <> "#"
            If Mid(zw,1,11) = "language = "
               If Mid(zw,12, 7) = "english"
                  language = 0
               EndIf
               If Mid(zw,12, 6) = "german"
                  language = 1
               EndIf
               If Mid(zw,12, 7) = "spanish"
                  language = 2
               EndIf
            ElseIf Mid(zw,1,19) = "delay_animation  = "
               zw2.s          = Mid(zw,20, 5)
               delay_animation        = Val(zw2)
            ElseIf Mid(zw,1,19) = "delay_animation2 = "
               zw2.s          = Mid(zw,20, 5)
               delay_animation2       = Val(zw2)
            ElseIf Mid(zw,1,13) = "key_repeat = "
               zw2.s          = Mid(zw,14, 4)
               key_repeat_delay       = Val(zw2)
            ElseIf Mid(zw,1,11) = "joystick = "
               If Mid(zw,12, 2) = "no"
                  joystick_used = 0
               EndIf
               If Mid(zw,12, 3) = "yes"
                  joystick_used = 1
               EndIf
            ElseIf Mid(zw,1,11) = "no_mouse = "
               If Mid(zw,12, 2) = "no"
                  no_mouse = 0
               EndIf
               If Mid(zw,12, 3) = "yes"
                  no_mouse = 1
               EndIf
            ElseIf Mid(zw,1,11) = "windowed = "
               If Mid(zw,12, 2) = "no"
                  win_mode = 1
               EndIf
               If Mid(zw,12, 3) = "yes"
                  win_mode = 2
               EndIf
            ElseIf Mid(zw,1,8) = "sound = "
               If Mid(zw,9, 3) = "yes"
                  sound = 1
               EndIf
               If Mid(zw,9, 2) = "no"
                  sound = 0
               EndIf
            ElseIf Mid(zw,1,8) = "music = "
               If Mid(zw,9, 3) = "yes"
                  music = 1
               EndIf
               If Mid(zw,9, 2) = "no"
                  music = 0
               EndIf
            ElseIf Mid(zw,1,11) = "klicking = "
               If Mid(zw,12, 3) = "yes"
                  klicking = 1
               EndIf
               If Mid(zw,12, 2) = "no"
                  klicking = 0
               EndIf
            ElseIf Mid(zw,1,14) = "auto-toggle = "
               If Mid(zw,15, 3) = "yes"
                  autopickup = 1
               EndIf
               If Mid(zw,15, 2) = "no"
                  autopickup = 0
               EndIf
            ElseIf Mid(zw,1,10) = "button5 = "
               If Mid(zw,11, 3) = "yes"
                  knopf5 = 1
               EndIf
               If Mid(zw,11, 2) = "no"
                  knopf5 = 0
               EndIf
            ElseIf Mid(zw,1,7) = "jars = "
               If Mid(zw,8, 3) = "yes"
                  flaschen = 1
               EndIf
               If Mid(zw,8, 2) = "no"
                  flaschen = 0
               EndIf
            EndIf
         EndIf
      Wend
      
      CloseFile(0)
      If joystick_used = 1
         If InitJoystick() = 0
         EndIf
      EndIf
   EndIf

EndProcedure

; -------------------------------------------------------------------------------

Procedure fullscreen()

Shared win_mode
 
CompilerSelect #PB_Compiler_OS
   CompilerCase #PB_OS_Windows       
      If win_mode = 1
         win_mode = 2
      Else
         win_mode = 1
     EndIf
     save_settings()
     message(519,#COLOR_WEISS)      
     message(520,#COLOR_WEISS)
      
   CompilerCase #PB_OS_Linux
      If win_mode = 2
         win_mode = 1
         If OpenScreen(640,480,16,"Lost Labyrinth") = 0
         EndIf
      Else
         win_mode = 2
         ;If OpenWindowedScreen(WindowID(?), 0, 0, 640, 480, 0, 0, 0) = 0
         If OpenWindowedScreen(0, 0, 0, 640, 480, 0, 0, 0) = 0
         EndIf
     EndIf
CompilerEndSelect

EndProcedure

; -------------------------------------------------------------------------------

Procedure load(name.s)

Shared anfangszeit, anz_levels, silent, nr_of_saves

  load.w = 0
    If ReadFile(0, environment + "/" + name)
      load = 1
   ElseIf ReadFile(0, "./" + name)
      load = 1
   EndIf
      
    If load = 1
   
      version.s    = ReadString(0)
      nr_of_saves  = ReadWord(0)
       If version <> #LASTCHANGE And test = 0
          message(320,#COLOR_ROT)
       Else
         nr_of_players     = ReadWord(0)
         akt_spieler     = ReadWord(0)
         anfangszeit     = ReadString(0)
         anz_levels      = ReadWord(0)
         
         For j = 0 To #ANZ_TRAENKE-1
            For k = 1 To #ANZ_languages
               item(#OBJGRAFIK_TRANK1 + j)\name[k] = ReadString(0)
            Next
            item(#OBJGRAFIK_TRANK1 + j)\attri1 = ReadWord(0)
            item(#OBJGRAFIK_TRANK1 + j)\einkauf = ReadWord(0)
            item(#OBJGRAFIK_TRANK1 + j)\verkauf = ReadWord(0)
         Next
         
         For j = 0 To #ANZ_PILZE-1
            For k = 1 To #ANZ_languages
               item(#OBJGRAFIK_PILZE_SCHWARZ + j)\name[k] = ReadString(0)
            Next
            item(#OBJGRAFIK_PILZE_SCHWARZ + j)\attri1 = ReadWord(0)
            item(#OBJGRAFIK_PILZE_SCHWARZ + j)\einkauf = ReadWord(0)
            item(#OBJGRAFIK_PILZE_SCHWARZ + j)\verkauf = ReadWord(0)
            mush_known(j) = ReadWord(0)
         Next
         
         For j = 0 To #ANZ_TRAENKE-1
            mischen(j)\result = ReadWord(0)
            mischen(j)\learned = ReadWord(0)
         Next
         
         For j = 0 To #buff_size
            alch_buff(j) = ReadWord(0)
            spell_chance_buff(j) = ReadWord(0)
            lore_chance_buff(j) = ReadWord(0)
            hit_chance_buff(j) = ReadWord(0)
            critical_chance_buff(j) = ReadWord(0)
            damage_buff(j) = ReadWord(0)
            damage_buff2(j) = ReadWord(0)
            wand_buff(j) = ReadWord(0)
            scroll_buff(j) = ReadWord(0)
            break_chance_buff(j) = ReadWord(0)
            gold_buff(j) = ReadWord(0)
            herb_buff(j) = ReadWord(0)
            crysolit_buff(j) = ReadWord(0)
            god_bonus_buff(j) = ReadWord(0)
            fish_buff(j) = ReadWord(0)
            general_percent_buff(j) = ReadWord(0)
            boulder_buff(j) = ReadWord(0)
         Next
         item_break20 = ReadLong(0)
         item_break15 = ReadLong(0)
         item_break10 = ReadLong(0)
         item_break05 = ReadLong(0)
         next_qual = ReadLong(0)
         coin_toss = ReadLong(0)
         
         ClearList(room_list())
         room_count.w = ReadWord(0)
         While room_count > 0
           AddElement(room_list())
           room_list()\level = ReadWord(0)
           room_list()\nr_in_level = ReadWord(0)
           room_list()\type = ReadWord(0)
           room_list()\visions = ReadWord(0)
           room_list()\stat1 = ReadWord(0)
           room_list()\stat2 = ReadWord(0)
           room_list()\x = ReadWord(0)
           room_list()\y = ReadWord(0)
           room_list()\exit_x = ReadWord(0)
           room_list()\exit_y = ReadWord(0)
           For i = 1 To #nr_of_players
	       room_list()\only_once[i] = ReadWord(0)
	   Next
           room_count -1
         Wend
         
         For j = 1 To #MAX_EBENEN
            sonderlevel(j) = ReadWord(0)
            levelmod(j) = ReadWord(0)
            skill_trader(j) = ReadWord(0)
            small_trader(j) = ReadWord(0)
            level_curse(j) = ReadWord(0)
            portal(j) = ReadWord(0)
            nexus(j) = ReadWord(0)
            spellbook(j) = ReadWord(0)
            cauldron(j) = ReadWord(0)
            armageddon(j) = ReadWord(0)
            pestilence(j) = ReadWord(0)
            fluss(j) = ReadWord(0)
            groesse(j) = 0 ;initialise with 0 so one can see if level is generated already
            For k = 1 To #nr_of_players
               steal_arr(k,j)      = ReadWord(0)
               drachenform(k,j)  = ReadWord(0)
               macht(k,j)        = ReadWord(0)
               magic_apple(k,j)  = ReadWord(0)
               refresh(k,j)      = ReadWord(0)
               heal(k,j)         = ReadWord(0)
               ease_pain(k,j)    = ReadWord(0)
               heal_others(k,j)  = ReadWord(0)
               full_healing(k,j) = ReadWord(0)
               teleport(k,j)     = ReadWord(0)
            Next
         Next

         For j = 1 To anz_levels
            groesse(j) = ReadWord(0)
            ausgangx(j) = ReadWord(0)
            ausgangy(j) = ReadWord(0)
            eingangx(j) = ReadWord(0)
            eingangy(j) = ReadWord(0)
            inhalt(j) = ReadWord(0)
            mit_was(j) = ReadWord(0)
            visionen(j) = ReadWord(0)
            spinnenkoenigin(j) = ReadWord(0)
            goblinkoenig(j)    = ReadWord(0)
            untotenherr(j)     = ReadWord(0)
         Next

         For y = 1 To anz_levels
            For j = 0 To #MAX_GROESSE
               For k = 0 To #MAX_GROESSE
                  labyrinth(y,j,k)\feld = mit_was(y)
               Next
            Next
            For j = 1 To groesse(y)
               For k = 1 To groesse(y)
                  labyrinth(y,j,k)\feld = ReadWord(0)
                  labyrinth(y,j,k)\stat1 = ReadWord(0)
                  labyrinth(y,j,k)\stat2 = ReadWord(0)
                  automap (j,k)\feld[y] = ReadWord(0)
                  laby_item (j,k)\name[y] = ReadWord(0)
                  laby_item (j,k)\anzahl[y] = ReadWord(0)
                  laby_item (j,k)\status[y] = ReadWord(0)
               Next
            Next
         Next
         
         ;clear monsters
         ClearList(monster_list())
         ;add dummy elements as a starter and stopper
         ;these make sure all real elements have a previous and next element
         ;escpecially deleting elements is dangerous otherwise
         AddElement(monster_list())
         monster_list()\z = -1
         AddElement(monster_list())
         monster_list()\z = 9999
         For j = 1 To #MAX_EBENEN
           first_monster(j)\p = @monster_list()
         Next
         SelectElement(monster_list(), 0)
         monster_count.l = ReadLong(0)
         act_level.w = -1
         While monster_count > 0
           AddElement(monster_list())
           monster_list()\number = ReadWord(0)
           monster_list()\hp = ReadWord(0)
           monster_list()\status = ReadWord(0)
           monster_list()\duration = ReadWord(0)
           monster_list()\x = ReadWord(0)
           monster_list()\y = ReadWord(0)
           monster_list()\z = ReadWord(0)
           monster_list()\container = ReadWord(0)
           monster_list()\item = ReadWord(0)
           monster_list()\skilldrop = ReadWord(0)
           ;print("load monsters:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z)) 
           If monster_list()\z <> act_level
             If monster_list()\z <= #MAX_EBENEN
               act_level = monster_list()\z
               first_monster(act_level)\p = @monster_list()
             EndIf
           EndIf
           monster_count -1
         Wend
         
         ClearList(Merchants())
         merch_count.w = ReadWord(0)
         While merch_count > 0
           AddElement(Merchants())
           Merchants()\face = ReadWord(0)
           For i = 0 To 55
             Merchants()\i[i]\id = ReadWord(0)
             Merchants()\i[i]\spell = ReadWord(0)
             Merchants()\i[i]\power = ReadWord(0)
           Next
           merch_count -1
         Wend
         
         For i = 1 To nr_of_players
            spieler(i)\Status = ReadWord(0)
            spieler(i)\verifikation = ReadString(0)
            spieler(i)\Name = ReadString(0)
            spieler(i)\skill_points = ReadWord(0)
            spieler(i)\Level = ReadWord(0)
            spieler(i)\MaxLevel = ReadWord(0)
            spieler(i)\Maennchen = ReadWord(0)
            spieler(i)\Mousepointer = ReadWord(0)
            spieler(i)\Lifepoints = ReadWord(0)
            spieler(i)\MaxLifepoints = ReadWord(0)
            spieler(i)\LifeGain = ReadWord(0)
            spieler(i)\Mana = ReadWord(0)
            spieler(i)\MaxMana = ReadWord(0)
            spieler(i)\ManaGain = ReadWord(0)
            spieler(i)\Attack = ReadWord(0)
            spieler(i)\Dexterity = ReadWord(0)
            spieler(i)\Strength = ReadWord(0)
            spieler(i)\MaxSpeed = ReadWord(0)
            spieler(i)\Speed = ReadWord(0)
            spieler(i)\Perception = ReadWord(0)
            spieler(i)\Luck_score = ReadWord(0)
            spieler(i)\Power_score = ReadWord(0)
            spieler(i)\Circle = ReadWord(0)
            spieler(i)\gold = ReadLong(0)
            spieler(i)\magic_resistance = ReadWord(0)
            spieler(i)\poison_resistance = ReadWord(0)
            spieler(i)\fire_resistance = ReadWord(0)
            spieler(i)\cold_resistance = ReadWord(0)
            spieler(i)\lightning_resistance = ReadWord(0)
            spieler(i)\spellweaving = ReadWord(0)
            spieler(i)\style = ReadWord(0)
            spieler(i)\light = ReadWord(0)
            spieler(i)\Hunger = ReadWord(0)
            spieler(i)\Durst = ReadWord(0)
            spieler(i)\betrunken = ReadWord(0)
            spieler(i)\weisheit = ReadWord(0)
            spieler(i)\schleichen = ReadWord(0)
            spieler(i)\charge = ReadWord(0)
            spieler(i)\mks = ReadLong(0)
            spieler(i)\fluch = ReadWord(0)
            spieler(i)\fluchdauer = ReadWord(0)
            spieler(i)\krankheit = ReadWord(0)
            spieler(i)\krankheitdauer = ReadWord(0)
            spieler(i)\poison = ReadWord(0)
            spieler(i)\verhungern = ReadWord(0)
            spieler(i)\verdursten = ReadWord(0)
            spieler(i)\lifepointgegenstand = ReadWord(0)
            spieler(i)\managegenstand = ReadWord(0)
            spieler(i)\staerkegegenstand = ReadWord(0)
            spieler(i)\zugweitegegenstand = ReadWord(0)
            spieler(i)\dexteritygegenstand = ReadWord(0)
            spieler(i)\gluecksgegenstand = ReadWord(0)
            spieler(i)\bogentreffergegenstand = ReadWord(0)
            spieler(i)\bogenschadengegenstand = ReadWord(0)
            spieler(i)\powergegenstand = ReadWord(0)
            spieler(i)\perceptiongegenstand = ReadWord(0)
            spieler(i)\attackgegenstand = ReadWord(0)
            spieler(i)\stealthgegenstand = ReadWord(0)
            spieler(i)\damagegegenstand = ReadWord(0)
            spieler(i)\lichtgegenstand = ReadWord(0)
            spieler(i)\diebstahlgegenstand = ReadWord(0)
            spieler(i)\goblinlehre = ReadWord(0)
            spieler(i)\spinnenlehre = ReadWord(0)
            spieler(i)\untotenlehre = ReadWord(0)
            spieler(i)\pflanzenlehre = ReadWord(0)
            spieler(i)\tierkunde = ReadWord(0)
            spieler(i)\fallenlehre = ReadWord(0)
            spieler(i)\giftlehre = ReadWord(0)
            spieler(i)\pos_zaubermenue = ReadWord(0)
            spieler(i)\dumm = ReadWord(0)
            spieler(i)\face = ReadWord(0)
            spieler(i)\hinterhalt = ReadWord(0)
            spieler(i)\udjat_ben = ReadWord(0)
            spieler(i)\akt_zauber = ReadWord(0)
            spieler(i)\schule = ReadWord(0)
            spieler(i)\moves = ReadWord(0)
            spieler(i)\anker_x = ReadWord(0)
            spieler(i)\anker_y = ReadWord(0)
            spieler(i)\anker_level = ReadWord(0)
            spieler(i)\old_pos_x = ReadWord(0)
            spieler(i)\old_pos_y = ReadWord(0)
            spieler(i)\old_lp = ReadWord(0)
            spieler(i)\old_max_lp = ReadWord(0)
            spieler(i)\old_mp = ReadWord(0)
            spieler(i)\old_max_mp = ReadWord(0)
            spieler(i)\cause_of_death = ReadWord(0)
            spieler(i)\cause_of_death_monster = ReadWord(0)
            spieler(i)\character_x = ReadWord(0)
            spieler(i)\character_y = ReadWord(0)
            For act_piece = 1 To 9
               spieler(i)\staff_pieces[act_piece] = ReadWord(0)
            Next
            spieler(i)\creature_typ = ReadWord(0)
            spieler(i)\creature_schaden_min = ReadWord(0)
            spieler(i)\creature_schaden_max = ReadWord(0)
            spieler(i)\in_water = ReadWord(0)
            
            For j = 1 To #ACTIVE_SLOTS
               aktive(j,i)\nr = ReadWord(0)
               aktive(j,i)\staerke = ReadWord(0)
               aktive(j,i)\dauer = ReadWord(0)
               aktive(j,i)\source = ReadWord(0)
            Next
            
            For j = 1 To #ANZ_SKILLS
               For k = 1 To #ANZ_languages
                  skills(j,i)\name[k] = ReadString(0)
               Next
               skills(j,i)\nummer = ReadWord(0)
               skills(j,i)\kosten = ReadWord(0)
               skills(j,i)\gruppe = ReadWord(0)
               For k = 1 To #ANZ_languages
                  skills(j,i)\beschreibung_1[k] = ReadString(0)
                  skills(j,i)\beschreibung_2[k] = ReadString(0)
               Next
               skills(j,i)\gewaehlt = ReadWord(0)
               skills(j,i)\gelocked = ReadWord(0)
            Next
            
            For j = 1 To 50
               inventory(j,i)\name = ReadWord(0)
               inventory(j,i)\benutzt = ReadWord(0)
               inventory(j,i)\anzahl = ReadWord(0)
               inventory(j,i)\status = ReadWord(0)
               inventory(j,i)\attri5 = ReadWord(0)
            Next
            
            For j = 1 To #ANZ_ZAUBER
               learned(i,j) = ReadWord(0)
            Next
            
            For j = 1 To 10
               quickspells(j,i) = ReadWord(0)
            Next
            
            For j = 1 To 8
               quickspells2(j,i) = ReadWord(0)
            Next
            
         Next ; nr_of_players
         
         message(299,#COLOR_WEISS)
         CloseFile(0)
         
         If test = 3 ; data dump mode
          For i = 1 To #ANZ_TRAENKE
            If mischen(i-1)\result = #UNENDLICH
              result.s = "!KABOOM!"
             Else
               result.s = item(mischen(i-1)\result)\name[1]
            EndIf
            If i < 21
              result = result+" <b>"+item(alch_buff(i))\name[1]
            EndIf
            Print (item(#OBJGRAFIK_TRANK1 + i - 1)\name[1]+" -> "+result)
          Next
        EndIf

        ; Titelmusic aus
        If silent = 0
            StopModule(-1)
        EndIf

         Goto geladen
      EndIf  ; version okay?
   Else
      message(406,#COLOR_ROT)
   EndIf  ; File vorhanden?

EndProcedure
; -------------------------------------------------------------------------------

Procedure save(name.s)

Shared anfangszeit, anz_levels, nr_of_saves

    If CreateFile(0, environment + "/" + name)
      WriteStringN(0,#LASTCHANGE)
      nr_of_saves = nr_of_saves + 1
      WriteWord(0,nr_of_saves)
      WriteWord(0,nr_of_players)
      WriteWord(0,akt_spieler)
      WriteStringN(0,anfangszeit)
      anz_levels = 0
      For j = 1 To #MAX_EBENEN
         If groesse(j) > 0
            anz_levels = anz_levels + 1
         EndIf
      Next
      WriteWord(0,anz_levels)
      
      For j = 0 To #ANZ_TRAENKE-1
         For k = 1 To #ANZ_languages
            WriteStringN(0,item(#OBJGRAFIK_TRANK1 + j)\name[k])
         Next
         WriteWord(0,item(#OBJGRAFIK_TRANK1 + j)\attri1)
         WriteWord(0,item(#OBJGRAFIK_TRANK1 + j)\einkauf)
         WriteWord(0,item(#OBJGRAFIK_TRANK1 + j)\verkauf)
      Next
      
      For j = 0 To #ANZ_PILZE-1
         For k = 1 To #ANZ_languages
            WriteStringN(0,item(#OBJGRAFIK_PILZE_SCHWARZ + j)\name[k])
         Next
         WriteWord(0,item(#OBJGRAFIK_PILZE_SCHWARZ + j)\attri1)
         WriteWord(0,item(#OBJGRAFIK_PILZE_SCHWARZ + j)\einkauf)
         WriteWord(0,item(#OBJGRAFIK_PILZE_SCHWARZ + j)\verkauf)
         WriteWord(0,mush_known(j))
      Next
      
      For j = 0 To #ANZ_TRAENKE-1
         WriteWord(0,mischen(j)\result)
         WriteWord(0,mischen(j)\learned)
      Next
      
      For j = 0 To #buff_size
         WriteWord(0,alch_buff(j))
         WriteWord(0,spell_chance_buff(j))
         WriteWord(0,lore_chance_buff(j))
         WriteWord(0,hit_chance_buff(j))
         WriteWord(0,critical_chance_buff(j))
         WriteWord(0,damage_buff(j))
         WriteWord(0,damage_buff2(j))
         WriteWord(0,wand_buff(j))
         WriteWord(0,scroll_buff(j))
         WriteWord(0,break_chance_buff(j))
         WriteWord(0,gold_buff(j))
         WriteWord(0,herb_buff(j))
         WriteWord(0,crysolit_buff(j))
         WriteWord(0,god_bonus_buff(j))
         WriteWord(0,fish_buff(j))
         WriteWord(0,general_percent_buff(j))
         WriteWord(0,boulder_buff(j))
      Next
      WriteLong(0,item_break20)
      WriteLong(0,item_break15)
      WriteLong(0,item_break10)
      WriteLong(0,item_break05)
      WriteLong(0,next_qual)
      WriteLong(0,coin_toss)
         
         WriteWord(0,CountList(room_list()))
         ResetList(room_list())
         While NextElement(room_list())
           WriteWord(0,room_list()\level)
           WriteWord(0,room_list()\nr_in_level)
           WriteWord(0,room_list()\type)
           WriteWord(0,room_list()\visions)
           WriteWord(0,room_list()\stat1)
           WriteWord(0,room_list()\stat2)
           WriteWord(0,room_list()\x)
           WriteWord(0,room_list()\y)
           WriteWord(0,room_list()\exit_x)
           WriteWord(0,room_list()\exit_y)
           For i = 1 To #nr_of_players
	       WriteWord(0,room_list()\only_once[i])
	   Next
         Wend
         
         For j = 1 To #MAX_EBENEN
            WriteWord(0,sonderlevel(j))
            WriteWord(0,levelmod(j))
            WriteWord(0,skill_trader(j))
            WriteWord(0,small_trader(j))
            WriteWord(0,level_curse(j))
            WriteWord(0,portal(j))
            WriteWord(0,nexus(j))
            WriteWord(0,spellbook(j))
            WriteWord(0,cauldron(j))
            WriteWord(0,armageddon(j))
            WriteWord(0,pestilence(j))
            WriteWord(0,fluss(j))
            For k = 1 To #nr_of_players
               WriteWord(0,steal_arr(k,j))
               WriteWord(0,drachenform(k,j))
               WriteWord(0,macht(k,j))
               WriteWord(0,magic_apple(k,j))
               WriteWord(0,refresh(k,j))
               WriteWord(0,heal(k,j))
               WriteWord(0,ease_pain(k,j))
               WriteWord(0,heal_others(k,j))
               WriteWord(0,full_healing(k,j))
               WriteWord(0,teleport(k,j))
            Next
         Next

         For j = 1 To anz_levels
            WriteWord(0,groesse(j))
            WriteWord(0,ausgangx(j))
            WriteWord(0,ausgangy(j))
            WriteWord(0,eingangx(j))
            WriteWord(0,eingangy(j))
            WriteWord(0,inhalt(j))
            WriteWord(0,mit_was(j))
            WriteWord(0,visionen(j))
            WriteWord(0,spinnenkoenigin(j))
            WriteWord(0,goblinkoenig(j))
            WriteWord(0,untotenherr(j))
         Next

         For y = 1 To anz_levels
            For j = 1 To groesse(y)
               For k = 1 To groesse(y)
                  WriteWord(0,labyrinth(y,j,k)\feld)
                  WriteWord(0,labyrinth(y,j,k)\stat1)
                  WriteWord(0,labyrinth(y,j,k)\stat2)
                  WriteWord(0,automap (j,k)\feld[y])
                  WriteWord(0,laby_item (j,k)\name[y])
                  WriteWord(0,laby_item (j,k)\anzahl[y])
                  WriteWord(0,laby_item (j,k)\status[y])
               Next
            Next
         Next
         
         WriteLong(0,CountList(monster_list())-2)
         SelectElement(monster_list(), 1)
         While monster_list()\z <= #MAX_EBENEN
           ;print("save monsters:"+Str(monster_list()\number)+"-"+monster(monster_list()\number)\name[1]+" hp:"+Str(monster_list()\hp)+" x:"+Str(monster_list()\x)+" y:"+Str(monster_list()\y)+" z:"+Str(monster_list()\z))
           WriteWord(0,monster_list()\number)
           WriteWord(0,monster_list()\hp)
           WriteWord(0,monster_list()\status)
           WriteWord(0,monster_list()\duration)
           WriteWord(0,monster_list()\x)
           WriteWord(0,monster_list()\y)
           WriteWord(0,monster_list()\z)
           WriteWord(0,monster_list()\container)
           WriteWord(0,monster_list()\item)
           WriteWord(0,monster_list()\skilldrop)
           NextElement(monster_list())
         Wend
         
         WriteWord(0,CountList(Merchants()))
         ResetList(Merchants())
         While NextElement(Merchants())
           WriteWord(0,Merchants()\face)
           For i = 0 To 55
             WriteWord(0,Merchants()\i[i]\id)
             WriteWord(0,Merchants()\i[i]\spell)
             WriteWord(0,Merchants()\i[i]\power)
           Next
         Wend
      
      For i = 1 To nr_of_players
         WriteWord(0,spieler(i)\Status)
         WriteStringN(0,spieler(i)\verifikation)
         WriteStringN(0,spieler(i)\Name)
         WriteWord(0,spieler(i)\skill_points)
         WriteWord(0,spieler(i)\Level)
         WriteWord(0,spieler(i)\MaxLevel)
         WriteWord(0,spieler(i)\Maennchen)
         WriteWord(0,spieler(i)\Mousepointer)
         WriteWord(0,spieler(i)\Lifepoints)
         WriteWord(0,spieler(i)\MaxLifepoints)
         WriteWord(0,spieler(i)\LifeGain)
         WriteWord(0,spieler(i)\Mana)
         WriteWord(0,spieler(i)\MaxMana)
         WriteWord(0,spieler(i)\ManaGain)
         WriteWord(0,spieler(i)\Attack)
         WriteWord(0,spieler(i)\Dexterity)
         WriteWord(0,spieler(i)\Strength)
         WriteWord(0,spieler(i)\MaxSpeed)
         WriteWord(0,spieler(i)\Speed)
         WriteWord(0,spieler(i)\Perception)
         WriteWord(0,spieler(i)\Luck_score)
         WriteWord(0,spieler(i)\Power_score)
         WriteWord(0,spieler(i)\Circle)
         WriteLong(0,spieler(i)\gold)
         WriteWord(0,spieler(i)\magic_resistance)
         WriteWord(0,spieler(i)\poison_resistance)
         WriteWord(0,spieler(i)\fire_resistance)
         WriteWord(0,spieler(i)\cold_resistance)
         WriteWord(0,spieler(i)\lightning_resistance)
         WriteWord(0,spieler(i)\spellweaving)
         WriteWord(0,spieler(i)\style)
         WriteWord(0,spieler(i)\light)
         WriteWord(0,spieler(i)\Hunger)
         WriteWord(0,spieler(i)\Durst)
         WriteWord(0,spieler(i)\betrunken)
         WriteWord(0,spieler(i)\weisheit)
         WriteWord(0,spieler(i)\schleichen)
         WriteWord(0,spieler(i)\charge)
         WriteLong(0,spieler(i)\mks)
         WriteWord(0,spieler(i)\fluch)
         WriteWord(0,spieler(i)\fluchdauer)
         WriteWord(0,spieler(i)\krankheit)
         WriteWord(0,spieler(i)\krankheitdauer)
         WriteWord(0,spieler(i)\poison)
         WriteWord(0,spieler(i)\verhungern)
         WriteWord(0,spieler(i)\verdursten)
         WriteWord(0,spieler(i)\lifepointgegenstand)
         WriteWord(0,spieler(i)\managegenstand)
         WriteWord(0,spieler(i)\staerkegegenstand)
         WriteWord(0,spieler(i)\zugweitegegenstand)
         WriteWord(0,spieler(i)\dexteritygegenstand)
         WriteWord(0,spieler(i)\gluecksgegenstand)
         WriteWord(0,spieler(i)\bogentreffergegenstand)
         WriteWord(0,spieler(i)\bogenschadengegenstand)
         WriteWord(0,spieler(i)\powergegenstand)
         WriteWord(0,spieler(i)\perceptiongegenstand)
         WriteWord(0,spieler(i)\attackgegenstand)
         WriteWord(0,spieler(i)\stealthgegenstand)
         WriteWord(0,spieler(i)\damagegegenstand)
         WriteWord(0,spieler(i)\lichtgegenstand)
         WriteWord(0,spieler(i)\diebstahlgegenstand)
         WriteWord(0,spieler(i)\goblinlehre)
         WriteWord(0,spieler(i)\spinnenlehre)
         WriteWord(0,spieler(i)\untotenlehre)
         WriteWord(0,spieler(i)\pflanzenlehre)
         WriteWord(0,spieler(i)\tierkunde)
         WriteWord(0,spieler(i)\fallenlehre)
         WriteWord(0,spieler(i)\giftlehre)
         WriteWord(0,spieler(i)\pos_zaubermenue)
         WriteWord(0,spieler(i)\dumm)
         WriteWord(0,spieler(i)\face)
         WriteWord(0,spieler(i)\hinterhalt)
         WriteWord(0,spieler(i)\udjat_ben)
         WriteWord(0,spieler(i)\akt_zauber)
         WriteWord(0,spieler(i)\schule)
         WriteWord(0,spieler(i)\moves)
         WriteWord(0,spieler(i)\anker_x)
         WriteWord(0,spieler(i)\anker_y)
         WriteWord(0,spieler(i)\anker_level)
         WriteWord(0,spieler(i)\old_pos_x)
         WriteWord(0,spieler(i)\old_pos_y)
         WriteWord(0,spieler(i)\old_lp)
         WriteWord(0,spieler(i)\old_max_lp)
         WriteWord(0,spieler(i)\old_mp)
         WriteWord(0,spieler(i)\old_max_mp)
         WriteWord(0,spieler(i)\cause_of_death)
         WriteWord(0,spieler(i)\cause_of_death_monster)
         WriteWord(0,spieler(i)\character_x)
         WriteWord(0,spieler(i)\character_y)
         For act_piece = 1 To 9
            WriteWord(0,spieler(i)\staff_pieces[act_piece])
         Next
         WriteWord(0,spieler(i)\creature_typ)
         WriteWord(0,spieler(i)\creature_schaden_min)
         WriteWord(0,spieler(i)\creature_schaden_max)
         WriteWord(0,spieler(i)\in_water)
         
         For j = 1 To #ACTIVE_SLOTS
            WriteWord(0,aktive(j,i)\nr)
            WriteWord(0,aktive(j,i)\staerke)
            WriteWord(0,aktive(j,i)\dauer)
            WriteWord(0,aktive(j,i)\source)
         Next
         
         For j = 1 To #ANZ_SKILLS
            For k = 1 To #ANZ_languages
               WriteStringN(0,skills(j,i)\name[k])
            Next
            WriteWord(0,skills(j,i)\nummer)
            WriteWord(0,skills(j,i)\kosten)
            WriteWord(0,skills(j,i)\gruppe)
            For k = 1 To #ANZ_languages
               WriteStringN(0,skills(j,i)\beschreibung_1[k])
               WriteStringN(0,skills(j,i)\beschreibung_2[k])
            Next
            WriteWord(0,skills(j,i)\gewaehlt)
            WriteWord(0,skills(j,i)\gelocked)
         Next
         
         For j = 1 To 50
            WriteWord(0,inventory(j,i)\name)
            WriteWord(0,inventory(j,i)\benutzt)
            WriteWord(0,inventory(j,i)\anzahl)
            WriteWord(0,inventory(j,i)\status)
            WriteWord(0,inventory(j,i)\attri5)
         Next
         
         For j = 1 To #ANZ_ZAUBER
            WriteWord(0,learned(i,j))
         Next
         
         For j = 1 To 10
            WriteWord(0,quickspells(j,i))
         Next
         
         For j = 1 To 8
            WriteWord(0,quickspells2(j,i))
         Next
         
      Next ; nr_of_players
      CloseFile(0)
   Else
      message(407,#COLOR_ROT)
   EndIf
   
   message(298,#COLOR_WEISS)

EndProcedure

; -------------------------------------------------------------------------------

Procedure loading_screen()

Shared joystick_used, no_mouse
    
weg.w = 0
load.w = 0

   If ReadFile(0, environment + "/savenames.sav")
      load = 1
   ElseIf ReadFile(0, "./savenames.sav")
      load = 1
   EndIf
      
   If load = 1
      For i = 1 To 10
         savenames(i) = ReadString(0)
         savedatum(i) = ReadString(0)
      Next
      CloseFile(0)
   EndIf
   
   init_keyboard_loading_saving()

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()

      ; #PB_Key_Up
      If (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or jay = -1
         used_keys(1)\wait_release = 1
         sel = sel - 1
         If sel < 1
            sel = 1
         EndIf
      EndIf
      ; #PB_Key_Down
      If (used_keys(2)\pressed And used_keys(2)\wait_release = 0) Or jay = 1
         used_keys(2)\wait_release = 1
         sel = sel + 1
         If sel > 10
            sel = 10
         EndIf
      EndIf
      
      If something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         ; Rahmen zeichnen
         draw_plain_frame(-1)

         yy = 65
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(190,yy,message_text(570,1+language))
            yy = yy + 15
            DrawText(190,yy,message_text(569,1+language))
            
            
            For willi = 1 To 10
               If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 100+willi*20 And mmouse_y < 120+willi*20
                  FrontColor(RGB(150,150,150))
                  Box(40,100+willi*20,400,20)
                  If sel = 1
                     FrontColor(RGB(1,1,255))  ; Blau
                  Else
                     FrontColor(RGB(255,255,255))  ; Weiss
                  EndIf
                  DrawText(40, 100+willi*20,Str(willi))
                  If mmouse_links And mmouse_links_wait_release = 0
                     mmouse_links_wait_release = 1
                     weg = 1
                     load = willi
                  EndIf
               EndIf
               If sel = willi
                  FrontColor(RGB(1,1,255))  ; Blau
                  ; #PB_Key_Return
                  If (used_keys(3)\pressed And used_keys(3)\wait_release = 0) Or jb(1) <> 0
                     used_keys(3)\wait_release = 1
                     weg = 1
                     load = willi
                  EndIf
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
               DrawText(40, 100+willi*20,Str(willi))
               
               ;FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(150, 100+willi*20,savenames(willi))
               If savedatum(willi) <> ""
                  akt_datum.s = FormatDate("%dd.%mm.%yyyy %hh:%ii",ParseDate("%yyyy%mm%dd%hh%ii%ss",savedatum(willi)))
                  DrawText(450, 100+willi*20,akt_datum)
               EndIf
            Next
            
         StopDrawing()
         
         end_screen()
         
         Delay(1)
      EndIf ; something_changed
      
      ; #PB_Key_Escape
      If (used_keys(4)\pressed And used_keys(4)\wait_release = 0) Or jb(1) <> 0
         used_keys(4)\wait_release = 1
         weg = 2
      EndIf 
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         weg = 2
      EndIf
      
      Delay(#Input_delay)
      
   Until weg 
   
   If load > 0 And weg = 1
      load("laby" + Str(load) + ".sav")
   EndIf

EndProcedure

; -------------------------------------------------------------------------------

Procedure saving_screen()

Shared joystick_used, no_mouse
    
raus.w = 0
save.w = 0

   If ReadFile(0, environment + "/savenames.sav")
      save = 1
   ElseIf ReadFile(0, "./savenames.sav")
      save = 1
   EndIf

   If save = 1
      For i = 1 To 10
         savenames(i) = ReadString(0)
         savedatum(i) = ReadString(0)
      Next
      CloseFile(0)
   EndIf
   
   init_keyboard_loading_saving()

   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      
      ; #PB_Key_Up
      If (used_keys(1)\pressed And used_keys(1)\wait_release = 0) Or jay = -1
         used_keys(1)\wait_release = 1
         sel = sel - 1
         If sel < 1
            sel = 1
         EndIf
      EndIf
      ; #PB_Key_Down
      If (used_keys(2)\pressed And used_keys(2)\wait_release = 0) Or jay = 1
         used_keys(2)\wait_release = 1
         sel = sel + 1
         If sel > 10
            sel = 10
         EndIf
      EndIf
      
      If something_changed = 1
         Fenster()
         ClearScreen(RGB(0,0,0))
         
         ; Rahmen zeichnen
         draw_plain_frame(-1)

         yy = 65
         
         wohin = ScreenOutput()
         StartDrawing(wohin)
            DrawingMode(1)
            FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(190,yy,message_text(568,1+language))
            yy = yy + 15
            DrawText(190,yy,message_text(569,1+language))
         StopDrawing()
            
         wohin = ScreenOutput()
         StartDrawing(wohin)
         DrawingMode(1)
         FrontColor(RGB(255,255,255))  ; Weiss
            
         For willi = 1 To 10
            If mmouse_x > 40 And mmouse_x < 600 And mmouse_y > 100+willi*20 And mmouse_y < 120+willi*20
               FrontColor(RGB(150,150,150))
               Box(40,100+willi*20,400,20)
               If sel = 1
                  FrontColor(RGB(1,1,255))  ; Blau
               Else
                  FrontColor(RGB(255,255,255))  ; Weiss
               EndIf
      
               DrawText(40, 100+willi*20,Str(willi))
               If mmouse_links And mmouse_links_wait_release = 0
                  mmouse_links_wait_release = 1
                  raus = 1
                  save = willi
               EndIf
            EndIf
            If sel = willi
               FrontColor(RGB(1,1,255))  ; Blau
               ; #PB_Key_Return
               If (used_keys(3)\pressed And used_keys(3)\wait_release = 0) Or jb(1) <> 0
                  used_keys(3)\wait_release = 1
                  raus = 1
                  save = willi
               EndIf
            Else
               FrontColor(RGB(255,255,255))  ; Weiss
            EndIf
            DrawText(40, 100+willi*20,Str(willi))
               
            ;FrontColor(RGB(255,255,255))  ; Weiss
            DrawText(150, 100+willi*20,savenames(willi))
            If savedatum(willi) <> ""
               akt_datum.s = FormatDate("%dd.%mm.%yyyy %hh:%ii",ParseDate("%yyyy%mm%dd%hh%ii%ss",savedatum(willi)))
               DrawText(450, 100+willi*20,akt_datum)
            EndIf
         Next
            
         StopDrawing()
                        
         end_screen()
         
         Delay(1)
      EndIf ; something_changed
      
      ; #PB_Key_Escape
      If used_keys(4)\pressed And used_keys(4)\wait_release = 0
         used_keys(4)\wait_release = 1
         raus = 2
      EndIf 
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raus = 2
      EndIf
      
      Delay(#Input_delay)

   Until raus > 0
   
   If save > 0 And raus<>2
      myname.s = savenames(save)
      myname_old.s = myname
      raus = 0
      Repeat
         read_keyboard()
         read_joystick()
         read_mouse()
         
         ; #PB_Key_Escape
         If used_keys(4)\pressed And used_keys(4)\wait_release = 0
            used_keys(4)\wait_release = 1
            raus = 2
         EndIf
         
         ; #PB_Key_Return
         If used_keys(3)\pressed And used_keys(3)\wait_release = 0
            used_keys(3)\wait_release = 1
            raus = 1
         EndIf 
         
         If mmouse_rechts And mmouse_rechts_wait_release = 0
            mmouse_rechts_wait_release = 1
            raus = 2
         EndIf

         myname = keyboard_string(myname,0)
         If myname <> myname_old
            something_changed = 1
         EndIf
         
         warten = warten + 1
         If warten > 20
            warten = 0
         EndIf
         If (warten = 0) Or (warten = 10)
            something_changed = 1
         EndIf
         
         If something_changed = 1
            Fenster()
            ClearScreen(RGB(0,0,0))

            yy = 65
      
            ; Rahmen zeichnen
            draw_plain_frame(-1)
            
            wohin = ScreenOutput()
            StartDrawing(wohin)
               DrawingMode(1)
               
               FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(190,yy,message_text(568,1+language))
               yy = yy + 15
               DrawText(190,yy,message_text(569,1+language))
               

               For willi = 1 To 10
                  If willi = save
                     FrontColor(RGB(150,150,150))  ; Weiss
                     Box(40,100+save*20,550,20)
                  EndIf
                  FrontColor(RGB(255,255,255))  ; Weiss
                  DrawText(40, 100+willi*20,Str(willi))
               Next
            
               ; Name einlesen
               FrontColor(RGB(255,255,255))  ; Weiss
               DrawText(100, 100+save*20,message_text(571,1+language))
               DrawText(200,100+save*20,myname)
            StopDrawing()

            
            If Len(myname) > 25
               myname = Mid(myname,1,25)
            EndIf
            
            ; Cursor darstellen
            If warten >= 10
               ; anzeigen
               wohin = ScreenOutput()
               StartDrawing(wohin)
                  DrawingMode(1)
                  FrontColor(RGB(255,255,255))  ; Weiss
                  Line(200+TextWidth(myname), 102+save*20, 0, 15)
                  Line(200+1+TextWidth(myname), 102+save*20, 0, 15)
               StopDrawing()
            EndIf
            
            myname_old = myname
            
            end_screen()
         EndIf ; something_changed
         
         Delay(#Input_delay)
      Until raus
      
      If myname <> "" And raus <> 2
         savenames(save) = myname
         savedatum(save) = FormatDate("%yyyy%mm%dd%hh%ii%ss", Date())
         If CreateFile(0, environment + "/savenames.sav")
            For egon = 1 To 10
               WriteStringN(0,savenames(egon))
               WriteStringN(0,savedatum(egon))
            Next
            CloseFile(0)
         EndIf
         save("laby" + Str(save) + ".sav")
      EndIf
      
      something_changed = 1
   EndIf

EndProcedure

; -------------------------------------------------------------------------------

Procedure optionen_rahmen()

Shared optionenliste, akt_option, anzz, yplus, yplus2, mauszauber

   ClipSprite(#SPRITE_CLEANER, 0, 0, 260, 449)
   DisplaySprite(#SPRITE_CLEANER, 365, 15)
   ClipSprite(#SPRITE_CLEANER, 0, 0, 335, 51)
   DisplaySprite(#SPRITE_CLEANER, 15, 365)

   ; Rahmen zeichnen
   ClipSprite(#SPRITE_RAHMEN_OBEN, 0, 0, 640, 17)
   DisplayTransparentSprite(#SPRITE_RAHMEN_OBEN, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_LINKS, 0, 0, 17, 480)
   DisplayTransparentSprite(#SPRITE_RAHMEN_LINKS, 0, 0)
   ClipSprite(#SPRITE_RAHMEN_UNTEN, 0, 0, 640, 17)
   DisplayTransparentSprite(#SPRITE_RAHMEN_UNTEN, 0, 464)
   ClipSprite(#SPRITE_RAHMEN_RECHTS, 0, 0, 17, 480)
   DisplayTransparentSprite(#SPRITE_RAHMEN_RECHTS, 624, 0)

   ClipSprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 0, 365, 17)
   DisplaySprite(#SPRITE_RAHMEN_WAAGRECHT, 0, 350)
   ClipSprite(#SPRITE_RAHMEN_MITTE, 0, 0, 17, 480)
   DisplaySprite(#SPRITE_RAHMEN_MITTE, 350, 0)

   wohin = ScreenOutput()
   StartDrawing(wohin)
      DrawingMode(1)
      FrontColor(RGB(255,255,255))  ; Weiss
      DrawText(440, 19,message_text(76,1+language))

      ; In der Mitte wird ausgewaehlt
      FrontColor(RGB(150,150,150))
      Box(365,200+yplus2,260,yplus)

      ; Optionen darstellen
      FrontColor(RGB(255,255,255))
      x = 370
      y = 52

      For i = 1 To anzz-3
         FrontColor(RGB(255,255,255))  ; Weiss
         If i = mauszauber
            FrontColor(RGB(1,1,255))  ; Blau
         EndIf
         DrawText(x,y,optionenliste(i + akt_option))
         y = y + yplus
      Next
   StopDrawing()

EndProcedure


Procedure get_actual_options()

Shared optionenliste, frame, akt_option, akt_zauber_offset2, yplus, anzz, win_mode
Shared mauszauber, joystick_used, sound, music, klicking, autopickup, knopf5, no_mouse, flaschen
Shared no_mouse_text, autopickup_text, sound_text, music_text, klicking_text, knopf5_text, flaschen_text


   If no_mouse = 1
      no_mouse_text = message_text(956,language+1)
   Else
      no_mouse_text = message_text(957,language+1)
   EndIf
   
   If autopickup = 1
      autopickup_text = message_text(958,language+1)
   Else
      autopickup_text = message_text(959,language+1)
   EndIf
   
   If sound = 1
      sound_text = message_text(958,language+1)
   Else
      sound_text = message_text(959,language+1)
   EndIf
   
   If music = 1
      music_text = message_text(958,language+1)
   Else
      music_text = message_text(959,language+1)
   EndIf
   
   If klicking = 1
      klicking_text = message_text(958,language+1)
   Else
      klicking_text = message_text(959,language+1)
   EndIf
   
   If knopf5 = 1
      knopf5_text = message_text(958,language+1)
   Else
      knopf5_text = message_text(959,language+1)
   EndIf
   
   If flaschen = 1
      flaschen_text = message_text(958,language+1)
   Else
      flaschen_text = message_text(959,language+1)
   EndIf
   
   For i = 1 To 30
      optionenliste(i) = ""
   Next

   optionenliste(akt_zauber_offset2+1)  = message_text(960,language+1)
   optionenliste(akt_zauber_offset2+2)  = message_text(961,language+1)
   
   Select (delay_animation)
      Case #gamespeed_wait_very_slow: 
         optionenliste(akt_zauber_offset2+3)  = message_text(776,language+1) + message_text(781,language+1)
      Case #gamespeed_wait_slow: 
         optionenliste(akt_zauber_offset2+3)  = message_text(776,language+1) + message_text(778,language+1)
      Case #gamespeed_wait_normal:
         optionenliste(akt_zauber_offset2+3)  = message_text(776,language+1) + message_text(779,language+1)
      Case #gamespeed_wait_fast:
         optionenliste(akt_zauber_offset2+3)  = message_text(776,language+1) + message_text(780,language+1)
      Case #gamespeed_wait_very_fast:
         optionenliste(akt_zauber_offset2+3)  = message_text(776,language+1) + message_text(782,language+1)
      Default:
         optionenliste(akt_zauber_offset2+3)  = message_text(776,language+1) + message_text(779,language+1)
   EndSelect
   
   Select (delay_animation2)
      Case #gamespeed_animation_very_slow: 
         optionenliste(akt_zauber_offset2+4)  = message_text(777,language+1) + message_text(781,language+1)
      Case #gamespeed_animation_slow: 
         optionenliste(akt_zauber_offset2+4)  = message_text(777,language+1) + message_text(778,language+1)
      Case #gamespeed_animation_normal:
         optionenliste(akt_zauber_offset2+4)  = message_text(777,language+1) + message_text(779,language+1)
      Case #gamespeed_animation_fast:
         optionenliste(akt_zauber_offset2+4)  = message_text(777,language+1) + message_text(780,language+1)
      Case #gamespeed_animation_very_fast:
         optionenliste(akt_zauber_offset2+4)  = message_text(777,language+1) + message_text(782,language+1)
      Default:
         optionenliste(akt_zauber_offset2+4)  = message_text(777,language+1) + message_text(779,language+1)
   EndSelect
   
   optionenliste(akt_zauber_offset2+5)  = message_text(963,language+1)
   If win_mode = 1
      optionenliste(akt_zauber_offset2+6)  = message_text(962,language+1)
   Else
      optionenliste(akt_zauber_offset2+6)  = message_text(964,language+1)
   EndIf
   optionenliste(akt_zauber_offset2+7)  = message_text(965,language+1)
   optionenliste(akt_zauber_offset2+8)  = message_text(966,language+1) + ": " + no_mouse_text
   optionenliste(akt_zauber_offset2+9)  = message_text(967,language+1) + ": " + autopickup_text
   optionenliste(akt_zauber_offset2+10) = message_text(968,language+1) + ": " + sound_text
   optionenliste(akt_zauber_offset2+11) = message_text(969,language+1) + ": " + music_text
   optionenliste(akt_zauber_offset2+12) = message_text(970,language+1) + ": " + klicking_text
   optionenliste(akt_zauber_offset2+13) = message_text(971,language+1) + ": " + knopf5_text
   optionenliste(akt_zauber_offset2+14) = message_text(972,language+1) + ": " + flaschen_text
   optionenliste(akt_zauber_offset2+15) = message_text(975,language+1) + ": " + Str(spieler(akt_spieler)\mousepointer)
   optionenliste(akt_zauber_offset2+16) = message_text(405,language+1)
   optionenliste(akt_zauber_offset2+17) = message_text(974,language+1)
   optionenliste(akt_zauber_offset2+18) = message_text(650,language+1)

EndProcedure


Procedure menupoint_clicked()

Shared optionenliste, frame, akt_option, akt_zauber_offset2, yplus, anzz
Shared mauszauber, character_x, character_y, joystick_used, sound, music, klicking, autopickup
Shared knopf5, no_mouse, flaschen, raushier
Shared no_mouse_text, autopickup_text, sound_text, music_text, klicking_text, knopf5_text, flaschen_text

   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(960,language+1)
      Goto again
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(961,language+1)
      CloseScreen()
      RunProgram("http://www.lostlabyrinth.com")
      End
   EndIf 
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(776,language+1) + message_text(781,language+1)
      delay_animation = #gamespeed_wait_slow
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(776,language+1) + message_text(778,language+1)
      delay_animation = #gamespeed_wait_normal
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(776,language+1) + message_text(779,language+1)
      delay_animation = #gamespeed_wait_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(776,language+1) + message_text(780,language+1)
      delay_animation = #gamespeed_wait_very_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(776,language+1) + message_text(782,language+1)
      delay_animation = #gamespeed_wait_very_slow
   EndIf
   
   
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(777,language+1) + message_text(781,language+1)
      delay_animation2 = #gamespeed_animation_slow
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(777,language+1) + message_text(778,language+1)
      delay_animation2 = #gamespeed_animation_normal
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(777,language+1) + message_text(779,language+1)
      delay_animation2 = #gamespeed_animation_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(777,language+1) + message_text(780,language+1)
      delay_animation2 = #gamespeed_animation_very_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(777,language+1) + message_text(782,language+1)
      delay_animation2 = #gamespeed_animation_very_slow
   EndIf
   
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(963,language+1)
      
      If save_settings()
         message(486,#COLOR_WEISS)
      Else
         message(487,#COLOR_ROT)
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(964,language+1) Or optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(962,language+1)
      fullscreen()
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(965,language+1)
      no_mouse = 0
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(966,language+1) + ": " + no_mouse_text
      If no_mouse = 1
      no_mouse = 0
      Else
      no_mouse = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(967,language+1) + ": " + autopickup_text
      If autopickup = 1
         autopickup = 0
      Else
         autopickup = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(968,language+1) + ": " + sound_text
      If sound = 0
         sound = 1
      Else
         sound = 0
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(969,language+1) + ": " + music_text
      If music = 1
         music = 0
         StopModule(-1)
      Else
         music = 1
         PlayModule(#MOD_BALLADA)
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(970,language+1) + ": " + klicking_text
      If klicking = 1
         klicking = 0
      Else
         klicking = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(405,language+1)
      loading_screen()
      init_keyboard_options()
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(974,language+1)
      saving_screen()
      init_keyboard_options()
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(971,language+1) + ": " + knopf5_text
      If knopf5 = 1
         knopf5 = 0
      Else
         knopf5 = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(972,language+1) + ": " + flaschen_text
      If flaschen = 0
         flaschen = 1
      Else
         flaschen = 0
      EndIf
   EndIf
   
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(975,language+1) + ": " + Str(spieler(akt_spieler)\mousepointer)
      spieler(akt_spieler)\Mousepointer+1
      If spieler(akt_spieler)\Mousepointer > 12
         spieler(akt_spieler)\Mousepointer = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1 + mauszauber - 14) = message_text(650,language+1)
      raushier = 1
   EndIf

EndProcedure


Procedure menupoint_selected()

Shared optionenliste, frame, akt_option, akt_zauber_offset2, yplus, anzz
Shared mauszauber, character_x, character_y, joystick_used, sound, music, klicking, autopickup
Shared knopf5, no_mouse, flaschen, raushier
Shared no_mouse_text, autopickup_text, sound_text, music_text, klicking_text, knopf5_text, flaschen_text

   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(960,language+1)
      Goto again
   EndIf
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(961,language+1)
      CloseScreen()
      RunProgram("http://www.lostlabyrinth.com")
      End
   EndIf
   
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(776,language+1) + message_text(781,language+1)
      delay_animation = #gamespeed_wait_slow
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(776,language+1) + message_text(778,language+1)
      delay_animation = #gamespeed_wait_normal
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(776,language+1) + message_text(779,language+1)
      delay_animation = #gamespeed_wait_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(776,language+1) + message_text(780,language+1)
      delay_animation = #gamespeed_wait_very_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(776,language+1) + message_text(782,language+1)
      delay_animation = #gamespeed_wait_very_slow
   EndIf
   
   
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(777,language+1) + message_text(781,language+1)
      delay_animation2 = #gamespeed_animation_slow
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(777,language+1) + message_text(778,language+1)
      delay_animation2 = #gamespeed_animation_normal
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(777,language+1) + message_text(779,language+1)
      delay_animation2 = #gamespeed_animation_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(777,language+1) + message_text(780,language+1)
      delay_animation2 = #gamespeed_animation_very_fast
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(777,language+1) + message_text(782,language+1)
      delay_animation2 = #gamespeed_animation_very_slow
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(963,language+1)
      If save_settings()
         message(486,#COLOR_WEISS)
      Else
         message(487,#COLOR_ROT)
      EndIf
   EndIf


   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(964,language+1) Or optionenliste(akt_option + akt_zauber_offset2+1) = message_text(962,language+1)
      fullscreen()
   EndIf
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(965,language+1)
      joystick_used = 1
      If InitJoystick() = 0
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(966,language+1) + ": " + no_mouse_text
      If no_mouse = 1
         no_mouse = 0
      Else
         no_mouse = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(967,language+1) + ": " + autopickup_text
      If autopickup = 1
         autopickup = 0
      Else
         autopickup = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(968,language+1) + ": " + sound_text
      If sound = 0
         sound = 1
      Else
         sound = 0
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(969,language+1) + ": " + music_text
      If music = 1
         music = 0
         StopModule(-1)
      Else
         music = 1
         PlayModule(#MOD_BALLADA)
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(970,language+1) + ": " + klicking_text
      If klicking = 1
         klicking = 0
      Else
         klicking = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(405,language+1)
      loading_screen()
      init_keyboard_options()
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(974,language+1)
      saving_screen()
      init_keyboard_options()
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(971,language+1) + ": " + knopf5_text
      If knopf5 = 1
         knopf5 = 0
      Else
         knopf5 = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(972,language+1) + ": " + flaschen_text
      If flaschen = 0
         flaschen = 1
      Else
         flaschen = 0
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(975,language+1) + ": " + Str(spieler(akt_spieler)\mousepointer)
      spieler(akt_spieler)\Mousepointer + 1
      If spieler(akt_spieler)\Mousepointer > 12
         spieler(akt_spieler)\Mousepointer = 1
      EndIf
   EndIf
   
   If optionenliste(akt_option + akt_zauber_offset2+1) = message_text(650,language+1)
      raushier = 1
   EndIf

EndProcedure

; ------------------------------------------------------------------------------------------
; Optionenmenue

Procedure optionen()

Shared optionenliste, frame, akt_option, akt_zauber_offset2, yplus, anzz
Shared mauszauber, joystick_used, sound, music, klicking, autopickup
Shared knopf5, no_mouse, flaschen, raushier
Shared no_mouse_text, autopickup_text, sound_text, music_text, klicking_text, knopf5_text, flaschen_text

   akt_option = 9
   raushier = 0
   screen2()
   optionen_rahmen()
   get_actual_options()
   
   init_keyboard_options()
   
   Repeat
      read_keyboard()
      read_joystick()
      read_mouse()
      
      ; #PB_KEY_DOWN
      if (used_keys(1)\pressed And used_keys(1)\wait_release = 0) or jay > 0
         used_keys(1)\wait_release = 1
         If akt_option < #anz_options
             akt_option = akt_option + 1
         EndIf
      EndIf
      
      ; #PB_KEY_UP
      if (used_keys(2)\pressed And used_keys(2)\wait_release = 0) or jay < 0
         used_keys(2)\wait_release = 1
         If akt_option > 0
            akt_option = akt_option - 1
         EndIf
      EndIf
      
      ; #PB_KEY_Return
      if used_keys(3)\pressed And used_keys(3)\wait_release = 0
         used_keys(3)\wait_release = 1
         menupoint_selected()
         screen2()
         optionen_rahmen()
         get_actual_options()
      EndIf
     
      If mmouse_links And mauszauber > 0 And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
         menupoint_clicked()
         ;init_keyboard_main()
         ;set_default_auto_repeat()
         screen2()
         optionen_rahmen()
         get_actual_options()
      EndIf
      
      ; #PB_KEY_Escape
      if (used_keys(5)\pressed And used_keys(5)\wait_release = 0) or jay < 0
         used_keys(5)\wait_release = 1
         raushier = 1
      EndIf 
      If mmouse_rechts And mmouse_rechts_wait_release = 0
         mmouse_rechts_wait_release = 1
         raushier = 1
      EndIf
      
      If mmouse_x >= #POS_BUTTON_OPTIONS_HOCH_X And mmouse_x <= #POS_BUTTON_OPTIONS_HOCH_X + 32 And mmouse_y >= #POS_BUTTON_OPTIONS_HOCH_Y And mmouse_y <= #POS_BUTTON_OPTIONS_HOCH_Y + 32
         over_upbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If akt_option > 0
               akt_option = akt_option - 1
            EndIf
         EndIf
      else
         over_upbutton = 0
      endif
      
      If mmouse_x > #POS_BUTTON_OPTIONS_RUNTER_X And mmouse_x < #POS_BUTTON_OPTIONS_RUNTER_X + 32 And mmouse_y > #POS_BUTTON_OPTIONS_RUNTER_Y And mmouse_y < #POS_BUTTON_OPTIONS_RUNTER_Y + 32
         over_downbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            If akt_option < #anz_options
               akt_option = akt_option + 1
            EndIf
         EndIf
      else
         over_downbutton = 0
      endif
            
      If mmouse_x >= #POS_BUTTON_ESC_xx And mmouse_x <= #POS_BUTTON_ESC_xx + 32 And mmouse_y >= #POS_BUTTON_ESC_yy And mmouse_y <= #POS_BUTTON_ESC_yy + 32
         over_exitbutton = 1
         If mmouse_links And mmouse_links_wait_release = 0
            mmouse_links_wait_release = 1
            raushier = 1
         EndIf
      else
         over_exitbutton = 0
      EndIf
      
      If something_changed = 1
         Fenster()
         screen2()
         optionen_rahmen()
         get_actual_options()
         
         ; Display last 2 messages
         last_msg.w = 25
         While old_messages(last_msg)\message = " " And last_msg > 1
            last_msg-1
         Wend
         If last_msg-1>0
            last_message(last_msg-1,#NACHRICHTEN_POSY)
         EndIf
         last_message(last_msg,#NACHRICHTEN_POSY+15)

         ; Mit Maus gewaehlt ?
         mauszauber = 0
         y = 52
         aktuell = 1
         If mmouse_x > 365 And mmouse_x < 610
            For i = 1 To anzz
               If mmouse_y >= y And mmouse_y <= y + yplus
                  mauszauber = aktuell
               EndIf
               y = y + yplus
               aktuell = aktuell + 1
            Next
         EndIf

         if over_upbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 6*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 4*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_OPTIONS_HOCH_X, #POS_BUTTON_OPTIONS_HOCH_Y)
         
         ; Unten
         if over_downbutton
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 7*32, 0, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 5*32, 0, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_OPTIONS_RUNTER_X, #POS_BUTTON_OPTIONS_RUNTER_Y)
         
         ; exit button
         If over_exitbutton = 1
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
         Else
            ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
         EndIf
         DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, #POS_BUTTON_ESC_xx, #POS_BUTTON_ESC_yy)
         
         end_screen()
      EndIf ; something_changed
      Delay(#Input_delay)
   Until raushier = 1 Or jb(1) = 1

EndProcedure
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 708
; FirstLine = 706
; Folding = ---
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
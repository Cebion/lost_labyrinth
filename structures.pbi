; All the structures
Structure monster_type ;for monsters in the labyrinth
   number.w
   hp.w
   status.w
   duration.w
   x.w
   y.w
   z.w ;laby level
   room.w
   container.w ;brown/blue/green chest 0 = no container
   item.w ; item, if any, that this monster will drop
   skilldrop.w ;0-999 :   promille chance to determine if and what will drop for skills like hunter/paladin etc.
EndStructure

Structure monster_pointer ;this is a workaround for compatibility issues with PB and elice
  *p.monster_type
EndStructure
   
Structure item_type ;for items in the labyrinth
   item.w
   status.w
   quality.w
   x.w
   y.w
   z.w ;laby level
EndStructure

Structure item_pointer ;this is a workaround for compatibility issues with PB and elice
  *p.item_type
EndStructure
   

;-the labyrinth
Structure laby
   feld.w
   stat1.w
   stat2.w
EndStructure

Global Dim labyrinth.laby(#MAX_EBENEN+1,#MAX_GROESSE+1,#MAX_GROESSE+1)
Global NewList monster_list.monster_type() ;list of all monsters (sorted by level)
Global Dim first_monster.monster_pointer(#MAX_EBENEN+1) ;pointer to first monster on this level
Global dead_monsters.w = 0 ;global flag for monster cleanup procedure
Global NewList item_list.item_type() ;list of all items (sorted by level)
Global Dim first_item.item_pointer(#MAX_EBENEN+1) ;pointer to first item on this level


Structure item2
   name.w         [#MAX_EBENEN+1]
   anzahl.w       [#MAX_EBENEN+1]
   status.w       [#MAX_EBENEN+1]
EndStructure
Global Dim laby_item.item2(#MAX_GROESSE+1,#MAX_GROESSE+1)


Structure unique_item
   name.w
EndStructure

Global NewList unique_items.unique_item()


Structure room_type
   level.w
   nr_in_level.w
   type.w
   visions.w
   stat1.w
   stat2.w 
   x.w
   y.w
   exit_x.w
   exit_y.w
   only_once.w	[#nr_of_players+1]
EndStructure
Global NewList room_list.room_type() ; list of all rooms (sorted by level, then nr_in_level)


Global Dim eingangx.w        (#MAX_EBENEN+1)
Global Dim eingangy.w        (#MAX_EBENEN+1)
Global Dim ausgangx.w        (#MAX_EBENEN+1)
Global Dim ausgangy.w        (#MAX_EBENEN+1)
Global Dim sonderlevel.w     (#MAX_EBENEN+1)
Global Dim levelmod.w        (#MAX_EBENEN+1)
Global Dim groesse.w         (#MAX_EBENEN+1)
Global Dim inhalt.w          (#MAX_EBENEN+1)   ; Tunnel
Global Dim mit_was.w         (#MAX_EBENEN+1)   ; Wall
Global Dim visionen.w        (#MAX_EBENEN+1)
Global Dim fluss.w           (#MAX_EBENEN+1)
Global Dim spinnenkoenigin.w (#MAX_EBENEN+1)
Global Dim goblinkoenig.w    (#MAX_EBENEN+1)
Global Dim untotenherr.w     (#MAX_EBENEN+1)
Global Dim skill_trader.w    (#MAX_EBENEN+1) ;if,and which trader shows for player with "merchant" skill
Global Dim small_trader.w    (#MAX_EBENEN+1) ;list of non-room  small traders
Global Dim level_curse.w     (#MAX_EBENEN+1) ;if,and which curse is cast upon player with "cursed" skill

Global Dim portal.w          (#MAX_EBENEN+1)
Global Dim nexus.w           (#MAX_EBENEN+1)
Global Dim spellbook.w       (#MAX_EBENEN+1)
Global Dim cauldron.w        (#MAX_EBENEN+1)
Global Dim armageddon.w      (#MAX_EBENEN+1)
Global Dim pestilence.w      (#MAX_EBENEN+1)

Global Dim steal_arr.w    (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim drachenform.w  (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim macht.w        (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim magic_apple.w  (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim refresh.w      (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim heal.w         (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim ease_pain.w    (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim heal_others.w  (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim full_healing.w (#nr_of_players+1,#MAX_EBENEN+1)
Global Dim teleport.w     (#nr_of_players+1,#MAX_EBENEN+1)

;Knot
Structure knot
  x.w
  y.w
  parent_x.w
  parent_y.w
  cost.w
EndStructure

Structure knot2
  x.w
  y.w
EndStructure

Global NewList openlist.knot()
Global NewList closedlist.knot()
Global NewList movementlist.knot2()
Global NewList testlist.knot2()

Global NewList animationlist.knot2() ;for monster regeneration

;-Automap
Structure carta
   feld.w             [#MAX_EBENEN+1]
EndStructure
Global Dim automap.carta(#MAX_GROESSE+1,#MAX_GROESSE+1)

;-Struktur fuer den Charakter
Structure character_data
  Status.b       ; 1=Aktiv,2=Inaktiv,3=dead
  verifikation.s
  Name.s
  skill_points.w
  Level.w
  MaxLevel.w
  Maennchen.w
  Mousepointer.w
  Lifepoints.w
  MaxLifepoints.w
  LifeGain.w
  Mana.w
  MaxMana.w
  ManaGain.w
  Attack.w
  Dexterity.w
  Strength.w
  MaxSpeed.w
  Speed.w
  Perception.w
  Luck_score.w
  Power_score.w
  Circle.w
  gold.l ; should be type "q" but elice does not support this
  magic_resistance.w
  poison_resistance.w
  fire_resistance.w
  cold_resistance.w
  lightning_resistance.w
  spellweaving.w
  style.w
  light.w
  Hunger.w
  Durst.w
  weisheit.w
  schleichen.w
  charge.w ; used for charge attack
  mks.l
  fluch.w
  fluchdauer.w
  krankheit.w
  krankheitdauer.w
  poison.w
  verhungern.w
  verdursten.w
  betrunken.w
  lifepointgegenstand.w
  managegenstand.w
  staerkegegenstand.w
  zugweitegegenstand.w
  dexteritygegenstand.w
  gluecksgegenstand.w
  bogentreffergegenstand.w
  bogenschadengegenstand.w
  powergegenstand.w
  perceptiongegenstand.w
  attackgegenstand.w
  stealthgegenstand.w
  damagegegenstand.w
  lichtgegenstand.w
  diebstahlgegenstand.w
  goblinlehre.w
  spinnenlehre.w
  untotenlehre.w
  pflanzenlehre.w
  tierkunde.w
  fallenlehre.w
  giftlehre.w
  pos_zaubermenue.w
  dumm.w
  face.w
  hinterhalt.w
  teleport.w
  udjat_ben.w
  akt_zauber.w
  sorting_style.w  ; 0 = a-z ; 1 = 1-15
  schule.w
  moves.w
  anker_x.w
  anker_y.w
  anker_level.w
  old_pos_x.w
  old_pos_y.w
  old_level.w
  old_lp.w
  old_max_lp.w
  old_mp.w
  old_max_mp.w
  cause_of_death.w
  cause_of_death_monster.w
  character_x.w
  character_y.w
  staff_pieces.w[10]
  creature_typ.b
  creature_schaden_min.w
  creature_schaden_max.w
  in_water.w
EndStructure

; -------------------------------------
;-Struktur fuer aktive Zauber

Structure az
   nr.w
   staerke.w
   dauer.w
   source.w
EndStructure

Global Dim aktive.az(#ACTIVE_SLOTS+1,#nr_of_players)

; -------------------------------------

;-Struktur fuer Skills

Structure skill
   name.s [#ANZ_languages+1]
   nummer.w
   kosten.w
   beschreibung_1.s [#ANZ_languages+1]
   beschreibung_2.s [#ANZ_languages+1]
   gruppe.w
   gewaehlt.w
   gelocked.w
   unique.w
   pet_transferable.w
EndStructure

Global Dim skills.skill(#ANZ_SKILLS+1,#nr_of_players)

; --------------------------------------

;-Struktur fuer sich ausschliessende Skills

Structure LOCK
   name.w
   locked.w
EndStructure

Global Dim unmoeglich.lock(#ANZ_UNMOEGLICH+1)

; -----------------------------------------
; structure  and list for Character templates
Structure char_tpl
   name.s
   skills.w [#ANZ_SKILLS+1]
EndStructure

Global NewList template_list.char_tpl()
; -----------------------------------------

;-Struktur fuer Highscores

Structure egal
   version.s
   name.s
   level.w
   gold.l
   mks.w
   punkte.w
   maennchen.w
   MaxLifepoints.w 
   MaxMana.w
   Attack.w
   Dexterity.w
   Strength.w
   MaxSpeed.w
   Perception.w
   Luck_score.w
   Power_score.w
   Circle.w
   anfangszeit.s
   endezeit.s
   stabteile.w
   moves.w
   cause_of_death.w
   cause_of_death_monster.w
   skills.w [30+1]
EndStructure

Global Dim hscores.egal(30+1,4)

; ------------------------------------------

;-Struktur fuer Inventory

Structure inv
   name.w
   benutzt.w
   anzahl.w
   status.w
   attri5.w
EndStructure

Global Dim inventory.inv(#MAX_RUCKSACK+1,#nr_of_players)
Global Dim new_item.inv(1)

; -----------------------------------------

;-Struktur fuer Gegenstaende

Structure gs
   name.s [#ANZ_languages+1]
   info.s [#ANZ_languages+1]
   type.w
   klasse.w
   magisch.w
   qualitaet.w
   use_type.w
   einkauf.w
   verkauf.w
   gewicht.w
   unique.w
   attri1.w
   attri2.w
   attri3.w
   attri4.w
EndStructure

Global Dim item.gs (#ANZ_GEGENSTAENDE+1)

; -----------------------------------------

;-Struktur fuer Felder


Structure field
   description.s [#ANZ_languages+1]
   water.w
   block_walk.w
   block_los.w
   block_item.w
   block_spawn.w
   attri_floor.w
EndStructure
Global Dim fields.field(#ANZ_FELDER)

; -----------------------------------------

;-Struktur fuer Zauber

Structure spell
   name.s [#ANZ_languages+1]
   level.w
   cost.w
   duration.w
   school.w
   weavable.w
   shapechanging.w
   summoning.w
   attack.w
   area.w
   min_damage.w
   max_damage.w
   info_1.s [#ANZ_languages+1]
   info_2.s [#ANZ_languages+1]
EndStructure

Global Dim spells.spell(200)
Global Dim learned.w(#nr_of_players,#ANZ_ZAUBER)

; ------------------------------------------------------

;-structure for potions

Structure misch
   result.w
   learned.w
EndStructure

Global Dim mischen.misch(#ANZ_TRAENKE-1)
#buff_size = 50
Global Dim alch_buff.w(#buff_size) ; 997
; other buffers with similar purpose to alch_buff
Global item_break20.l ;20
Global item_break15.l ;15
Global item_break10.l ;10
Global item_break05.l ;5
Global next_qual.l    ;3
Global coin_toss.l ;50
Global Dim spell_chance_buff.w(#buff_size) ;101
Global Dim lore_chance_buff.w(#buff_size)  ;102
Global Dim hit_chance_buff.w(#buff_size)   ;103
Global Dim critical_chance_buff.w(#buff_size);104
Global Dim god_bonus_buff.w(#buff_size);105
Global Dim fish_buff.w(#buff_size);106
Global Dim damage_buff.w(#buff_size) ;1001
Global Dim damage_buff2.w(#buff_size) ;1002
Global Dim wand_buff.w(#buff_size) ;999
Global Dim scroll_buff.w(#buff_size) ;998
Global Dim break_chance_buff.w(#buff_size) ;996
Global Dim gold_buff.w(#buff_size) ;995
Global Dim boulder_buff.w(#buff_size) ;994
Global Dim herb_buff.w(#buff_size) ;61
Global Dim crysolit_buff.w(#buff_size) ;62
Global Dim general_percent_buff.w(#buff_size) ;100


; -----------------------------------------

;-Struktur fuer Monster

Structure monsterstruct
   name.s [#ANZ_languages+1]
   nr.w
   art.b
   lebenspunkte.w
   angriff.b
   abwehr.b
   staerke.b
   ruestung.b
   zauberkraft.b
   zauber.b
   reichweite.b
   minlevel.w
   sound.w
   eigenschaft1.b
   eigenschaft2.b
   eigenschaft3.b
   eigenschaft4.b
   eigenschaft5.b
   eigenschaft6.b
   eigenschaft7.b
   eigenschaft8.b
   eigenschaft9.b
   eigenschaft10.b
EndStructure

Global Dim monster.monsterstruct(#ANZ_MONSTER+1)

; ------------------------------------------------------

;-Struktur fuer Pilze

Global Dim mush_known.w(#ANZ_PILZE-1)

; ------------------------------------------------------

;-Struktur fuer Zauberliste

Global Dim zauberliste.w(500)

; ------------------------------------------------------

;-Struktur fuer Nachrichten

Structure mes
   player.w
   color.w
   time.s
   message.s
EndStructure

Global Dim old_messages.mes (25)

; ------------------------------------------------------

;-Struktur fuer Kreaturen

Structure kriatura
   number.w
   name.s [#ANZ_languages+1]
   graphic.w
   LifePoints.w
   Attack.w
   Speed.w
   Strength.w
   Dexterity.w
   Perception.w
   Luck.w
   Power.w
   Circle.w
   Mana.w
   schaden_min.w
   schaden_max.w
   light.w
   magic_resistance.w
   poison_resistance.w
   fire_resistance.w
   cold_resistance.w
   lightning_resistance.w
   duration_effects.w [3]
   skills.w [20]
   spells.w [3]
EndStructure

Global Dim creature.kriatura (#ANZ_KREATUREN+1)

; ------------------------------------------------------

;-Linked List for languages
Structure language
   id.l
   Buttonpos.l
EndStructure

Global Dim language.language(2)

;Englisch
language(0)\buttonpos=34

;Deutsch
language(1)\buttonpos=68

;Spanisch
language(2)\buttonpos=612

;-------------------------------------------------
; struct for the Merchant's wares
Structure merch_item
  id.w
  spell.w ;for scrolls
  power.w ;for scrolls and items with variable stats(e.g. quality)
EndStructure

Structure merch_items
  face.w
  i.merch_item[56]
EndStructure
Global NewList Merchants.merch_items()

;-------------------------------------------------
; struct for keyboard handling
Structure used_key
   key.w
   pressed.w
   pressed_old.w
   auto_repeat.w
   wait_release.w
EndStructure
Global Dim used_keys.used_key (#nr_maxkeys+1)


; neigbour coordinates in this pattern ; kinda like a constant array
;
;24 20  9 13 21
;
;19  8  1  5 14
;
;12  4  0  2 10
;
;18  7  3  6 15
;
;23 17 11 16 22
Dim bdist.w(25,2) ;the distance steps used to generate linear neighbour list beyond 24..
bdist(0,0) = 3 : bdist(0,1) = 0   ;sqrt(3^2 + 0^2)
bdist(1,0) = 3 : bdist(1,1) = 1   ;sqrt(3^2 + 1^2)
bdist(2,0) = 3 : bdist(2,1) = 2   ;etc.. sortet upwards
bdist(3,0) = 4 : bdist(3,1) = 0
bdist(4,0) = 4 : bdist(4,1) = 1
bdist(5,0) = 3 : bdist(5,1) = 3
bdist(6,0) = 4 : bdist(6,1) = 2
bdist(7,0) = 4 : bdist(7,1) = 3
bdist(8,0) = 5 : bdist(8,1) = 0
bdist(9,0) = 5 : bdist(9,1) = 1
bdist(10,0) = 5 : bdist(10,1) = 2
bdist(11,0) = 4 : bdist(11,1) = 4
bdist(12,0) = 5 : bdist(12,1) = 3
bdist(13,0) = 6 : bdist(13,1) = 0
bdist(14,0) = 6 : bdist(14,1) = 1
bdist(15,0) = 6 : bdist(15,1) = 2
bdist(16,0) = 5 : bdist(16,1) = 4
bdist(17,0) = 6 : bdist(17,1) = 3
bdist(18,0) = 7 : bdist(18,1) = 0
bdist(19,0) = 5 : bdist(19,1) = 5
bdist(20,0) = 7 : bdist(20,1) = 1

Global Dim neighbour.knot2(200)
 neighbour(00)\x =  0 : neighbour(00)\y =  0
 neighbour(01)\x =  0 : neighbour(01)\y = -1
 neighbour(02)\x =  1 : neighbour(02)\y =  0
 neighbour(03)\x =  0 : neighbour(03)\y =  1
 neighbour(04)\x = -1 : neighbour(04)\y =  0
 neighbour(05)\x =  1 : neighbour(05)\y = -1
 neighbour(06)\x =  1 : neighbour(06)\y =  1
 neighbour(07)\x = -1 : neighbour(07)\y =  1
 neighbour(08)\x = -1 : neighbour(08)\y = -1
 neighbour(09)\x =  0 : neighbour(09)\y = -2
 neighbour(10)\x =  2 : neighbour(10)\y =  0
 neighbour(11)\x =  0 : neighbour(11)\y =  2
 neighbour(12)\x = -2 : neighbour(12)\y =  0
 neighbour(13)\x =  1 : neighbour(13)\y = -2
 neighbour(14)\x =  2 : neighbour(14)\y = -1
 neighbour(15)\x =  2 : neighbour(15)\y =  1
 neighbour(16)\x =  1 : neighbour(16)\y =  2
 neighbour(17)\x = -1 : neighbour(17)\y =  2
 neighbour(18)\x = -2 : neighbour(18)\y =  1
 neighbour(19)\x = -2 : neighbour(19)\y = -1
 neighbour(20)\x = -1 : neighbour(20)\y = -2
 neighbour(21)\x =  2 : neighbour(21)\y = -2
 neighbour(22)\x =  2 : neighbour(22)\y =  2
 neighbour(23)\x = -2 : neighbour(23)\y =  2
 neighbour(24)\x = -2 : neighbour(24)\y = -2
 n.w = 25
 For i = 0 to 20
   If bdist(i,1) = 0
      neighbour(n)\x =  bdist(i,0) : neighbour(n)\y =  0          : n+1
      neighbour(n)\x = -bdist(i,0) : neighbour(n)\y =  0          : n+1
      neighbour(n)\x =  0          : neighbour(n)\y =  bdist(i,0) : n+1
      neighbour(n)\x =  0          : neighbour(n)\y = -bdist(i,0) : n+1
   ElseIf bdist(i,0) = bdist(i,1)
      neighbour(n)\x =  bdist(i,0) : neighbour(n)\y =  bdist(i,0) : n+1
      neighbour(n)\x = -bdist(i,0) : neighbour(n)\y =  bdist(i,0) : n+1
      neighbour(n)\x =  bdist(i,0) : neighbour(n)\y = -bdist(i,0) : n+1
      neighbour(n)\x = -bdist(i,0) : neighbour(n)\y = -bdist(i,0) : n+1
   Else
      neighbour(n)\x =  bdist(i,0) : neighbour(n)\y =  bdist(i,1) : n+1
      neighbour(n)\x = -bdist(i,0) : neighbour(n)\y =  bdist(i,1) : n+1
      neighbour(n)\x =  bdist(i,0) : neighbour(n)\y = -bdist(i,1) : n+1
      neighbour(n)\x = -bdist(i,0) : neighbour(n)\y = -bdist(i,1) : n+1
      neighbour(n)\x =  bdist(i,1) : neighbour(n)\y =  bdist(i,0) : n+1
      neighbour(n)\x = -bdist(i,1) : neighbour(n)\y =  bdist(i,0) : n+1
      neighbour(n)\x =  bdist(i,1) : neighbour(n)\y = -bdist(i,0) : n+1
      neighbour(n)\x = -bdist(i,1) : neighbour(n)\y = -bdist(i,0) : n+1
   EndIf
 Next
 ;print(" neighbours: "+str(n))

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 104
; FirstLine = 73
; Folding = -
; EnableAsm
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
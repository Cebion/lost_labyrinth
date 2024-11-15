
; unused: #FELD_TATZE, #FELD_MAUERTEIL, #FELD_SCHLUESSEL, #FELD_SCHALTER(1/2),#FELD_WIEDERGAENGER,#FELD_GIFT

For i=1 to #ANZ_FELDER
   fields(i)\description [1] = ""
   fields(i)\description [2] = ""
   fields(i)\description [3] = ""
   fields(i)\water = 0
   fields(i)\block_walk = 0
   fields(i)\block_los = 0
   fields(i)\block_item = 0
   fields(i)\block_spawn = 0  ;0 free for normal, 1 blocked for all, 2 free water monsters
   fields(i)\attri_floor = 0  ;if 1 then stat2 contains number of floor tile below
Next

; Black
act_field.w = #FELD_SCHWARZ
fields(act_field)\description [1] = "Empty"
fields(act_field)\description [2] = "Leer"
fields(act_field)\description [3] = "Vacio"
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Wall
act_field = #FELD_MAUER
fields(act_field)\description [1] = "Wall"
fields(act_field)\description [2] = "Mauer"
fields(act_field)\description [3] = "Muro"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Exit
act_field = #FELD_AUSGANG
fields(act_field)\description [1] = "Exit"
fields(act_field)\description [2] = "Ausgang"
fields(act_field)\description [3] = "Salida"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Entry
act_field = #FELD_EINGANG
fields(act_field)\description [1] = "Entry"
fields(act_field)\description [2] = "Eingang"
fields(act_field)\description [3] = "Entrada"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Empty
act_field = #FELD_LEER
fields(act_field)\description [1] = "Empty"
fields(act_field)\description [2] = "Leer"
fields(act_field)\description [3] = "Vacio"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Skeleton
act_field = #FELD_SKELETT
fields(act_field)\description [1] = "Skeleton"
fields(act_field)\description [2] = "Skelett"
fields(act_field)\description [3] = "Esqueleto"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Chest brown
act_field = #FELD_TRUHE
fields(act_field)\description [1] = "Chest"
fields(act_field)\description [2] = "Truhe"
fields(act_field)\description [3] = "Caja"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Sanctum
act_field = #FELD_SANKTUM
fields(act_field)\description [1] = "Sanctum"
fields(act_field)\description [2] = "Sanktum"
fields(act_field)\description [3] = "Santuario"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Nexus
act_field = #FELD_NEXUS
fields(act_field)\description [1] = "Nexus"
fields(act_field)\description [2] = "Nexus"
fields(act_field)\description [3] = "Nexo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Gold
act_field = #FELD_GOLD
fields(act_field)\description [1] = "Gold"
fields(act_field)\description [2] = "Gold"
fields(act_field)\description [3] = "Oro"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Cursor1
act_field = #FELD_CURSOR1
fields(act_field)\description [1] = "Cursor"
fields(act_field)\description [2] = "Cursor"
fields(act_field)\description [3] = "Cursor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Cursor2
act_field = #FELD_CURSOR2
fields(act_field)\description [1] = "Cursor"
fields(act_field)\description [2] = "Cursor"
fields(act_field)\description [3] = "Cursor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Cursor3
act_field = #FELD_CURSOR3
fields(act_field)\description [1] = "Cursor"
fields(act_field)\description [2] = "Cursor"
fields(act_field)\description [3] = "Cursor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Cursor4
act_field = #FELD_CURSOR4
fields(act_field)\description [1] = "Cursor"
fields(act_field)\description [2] = "Cursor"
fields(act_field)\description [3] = "Cursor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Cursor5
act_field = #FELD_CURSOR5
fields(act_field)\description [1] = "Cursor"
fields(act_field)\description [2] = "Cursor"
fields(act_field)\description [3] = "Cursor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Books1
act_field = #FELD_BUECHER1
fields(act_field)\description [1] = "Books"
fields(act_field)\description [2] = "Bücher"
fields(act_field)\description [3] = "Libros"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Books2
act_field = #FELD_BUECHER2
fields(act_field)\description [1] = "Books"
fields(act_field)\description [2] = "Bücher"
fields(act_field)\description [3] = "Libros"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Laboratory1
act_field = #FELD_LABOR1
fields(act_field)\description [1] = "Laboratory"
fields(act_field)\description [2] = "Labor"
fields(act_field)\description [3] = "Laboratorio"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Laboratory2
act_field = #FELD_LABOR2
fields(act_field)\description [1] = "Laboratory"
fields(act_field)\description [2] = "Labor"
fields(act_field)\description [3] = "Laboratorio"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Switch1
act_field = #FELD_SCHALTER1
fields(act_field)\description [1] = "Switch"
fields(act_field)\description [2] = "Schalter"
fields(act_field)\description [3] = "Interruptor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Secret Door
act_field = #FELD_GEHEIMGANG
fields(act_field)\description [1] = "Wall"
fields(act_field)\description [2] = "Wand"
fields(act_field)\description [3] = "Muro"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Door1 (detected secret door)
act_field = #FELD_TUER1
fields(act_field)\description [1] = "Door"
fields(act_field)\description [2] = "Türe"
fields(act_field)\description [3] = "Puerta"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Speartrap1 (undetected)
act_field = #FELD_SPEERFALLE1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Darttrap1 (undetected)
act_field = #FELD_PFEILFALLE1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Trapdoor1 (undetected)
act_field = #FELD_FALLGRUBE1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Poison 1 (undetected)
act_field = #FELD_RUNENFALLE_GIFT1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Fire 1 (undetected)
act_field = #FELD_RUNENFALLE_FEUER1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Ice 1 (undetected)
act_field = #FELD_RUNENFALLE_EIS1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Mana Drain 1 (undetected)
act_field = #FELD_MANALEERE1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Axetrap 1 (undetected)
act_field = #FELD_AXTFALLE1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Curse 1 (undetected)
act_field = #FELD_RUNENFALLE_FLUCH1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Curse 1 (undetected)
act_field = #FELD_RUNENFALLE_FLUCH1
fields(act_field)\description [1] = "Floor"
fields(act_field)\description [2] = "Boden"
fields(act_field)\description [3] = "Suelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Speartrap2 (detected)
act_field = #FELD_SPEERFALLE2
fields(act_field)\description [1] = "Speartrap"
fields(act_field)\description [2] = "Speerfalle"
fields(act_field)\description [3] = "Trampa de Lanzas"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Darttrap2 (detected)
act_field = #FELD_PFEILFALLE2
fields(act_field)\description [1] = "Darttrap"
fields(act_field)\description [2] = "Pfeilfalle"
fields(act_field)\description [3] = "Trampa de Dartos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Trapdoor2 (detected)
act_field = #FELD_FALLGRUBE2
fields(act_field)\description [1] = "Trapdoor"
fields(act_field)\description [2] = "Fallgrube"
fields(act_field)\description [3] = "Trampillaa"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Poison 2 (detected)
act_field = #FELD_RUNENFALLE_GIFT2
fields(act_field)\description [1] = "Runetrap Poison"
fields(act_field)\description [2] = "Runenfalle Gift"
fields(act_field)\description [3] = "Trampa de Runas veneno"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Fire 2 (detected)
act_field = #FELD_RUNENFALLE_FEUER2
fields(act_field)\description [1] = "Runetrap Fire"
fields(act_field)\description [2] = "Runenfalle Feuer"
fields(act_field)\description [3] = "Trampa de Runas fuego"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Ice 2 (detected)
act_field = #FELD_RUNENFALLE_EIS2
fields(act_field)\description [1] = "Runetrap Ice"
fields(act_field)\description [2] = "Runenfalle Eis"
fields(act_field)\description [3] = "Trampa de Runas hielo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Mana Drain 2 (detected)
act_field = #FELD_MANALEERE2
fields(act_field)\description [1] = "Mana Drain"
fields(act_field)\description [2] = "Manaleere"
fields(act_field)\description [3] = "Saca Mana"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Axetrap 2 (detected)
act_field = #FELD_AXTFALLE2
fields(act_field)\description [1] = "Axetrap"
fields(act_field)\description [2] = "Axtfalle"
fields(act_field)\description [3] = "Trampa de Hacha"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Runetrap Curse 2 (detected)
act_field = #FELD_RUNENFALLE_FLUCH2
fields(act_field)\description [1] = "Runetrap Curse"
fields(act_field)\description [2] = "Runenfalle Fluch"
fields(act_field)\description [3] = "Trampa de Runas Maldiccion"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Fire 1
act_field = #FELD_FEUER1
fields(act_field)\description [1] = "Fire"
fields(act_field)\description [2] = "Feuer"
fields(act_field)\description [3] = "Fuego"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Fire 2
act_field = #FELD_FEUER2
fields(act_field)\description [1] = "Fire"
fields(act_field)\description [2] = "Feuer"
fields(act_field)\description [3] = "Fuego"
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Fire 3
act_field = #FELD_FEUER3
fields(act_field)\description [1] = "Fire"
fields(act_field)\description [2] = "Feuer"
fields(act_field)\description [3] = "Fuego"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Stars 1
act_field = #FELD_STERNE1
fields(act_field)\description [1] = "Stars"
fields(act_field)\description [2] = "Sterne"
fields(act_field)\description [3] = "Estrellas"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Stars 2
act_field = #FELD_STERNE2
fields(act_field)\description [1] = "Stars"
fields(act_field)\description [2] = "Sterne"
fields(act_field)\description [3] = "Estrellas"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Moon
act_field = #FELD_MOND
fields(act_field)\description [1] = "Moon"
fields(act_field)\description [2] = "Mond"
fields(act_field)\description [3] = "Luna"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Undead(unused)
act_field = #FELD_WIEDERGAENGER
fields(act_field)\description [1] = "Skeleton"
fields(act_field)\description [2] = "Skelett"
fields(act_field)\description [3] = "Esqueleto"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Questionmark
act_field = #FELD_FRAGEZEICHEN
fields(act_field)\description [1] = "Room"
fields(act_field)\description [2] = "Raum"
fields(act_field)\description [3] = "Habitación"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Switch 2
act_field = #FELD_SCHALTER2
fields(act_field)\description [1] = "Switch"
fields(act_field)\description [2] = "Knopf"
fields(act_field)\description [3] = "Interruptor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Island 1
act_field = #FELD_INSEL1
fields(act_field)\description [1] = "Island"
fields(act_field)\description [2] = "Insel"
fields(act_field)\description [3] = "Isla"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Island 2
act_field = #FELD_INSEL2
fields(act_field)\description [1] = "Island"
fields(act_field)\description [2] = "Insel"
fields(act_field)\description [3] = "Isla"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Island 3
act_field = #FELD_INSEL3
fields(act_field)\description [1] = "Island"
fields(act_field)\description [2] = "Insel"
fields(act_field)\description [3] = "Isla"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Island 4
act_field = #FELD_INSEL4
fields(act_field)\description [1] = "Island"
fields(act_field)\description [2] = "Insel"
fields(act_field)\description [3] = "Isla"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Water
act_field = #FELD_WASSER
fields(act_field)\description [1] = "Water"
fields(act_field)\description [2] = "Wasser"
fields(act_field)\description [3] = "Aqua"
fields(act_field)\water = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 2

; Well
act_field = #FELD_BRUNNEN
fields(act_field)\description [1] = "Well"
fields(act_field)\description [2] = "Brunnen"
fields(act_field)\description [3] = "Fuente"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Tombstone (walltype for special level)
act_field = #FELD_GRABSTEIN
fields(act_field)\description [1] = "Tombstone"
fields(act_field)\description [2] = "Grabstein"
fields(act_field)\description [3] = "Lápida"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Tree1
act_field = #FELD_BAUM1
fields(act_field)\description [1] = "Tree"
fields(act_field)\description [2] = "Baum"
fields(act_field)\description [3] = "Arbol"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Tree2
act_field = #FELD_BAUM2
fields(act_field)\description [1] = "Tree"
fields(act_field)\description [2] = "Baum"
fields(act_field)\description [3] = "Arbol"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Tree3
act_field = #FELD_BAUM3
fields(act_field)\description [1] = "Tree"
fields(act_field)\description [2] = "Baum"
fields(act_field)\description [3] = "Arbol"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Tree4
act_field = #FELD_BAUM4
fields(act_field)\description [1] = "Tree"
fields(act_field)\description [2] = "Baum"
fields(act_field)\description [3] = "Arbol"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Tree5
act_field = #FELD_BAUM5
fields(act_field)\description [1] = "Tree"
fields(act_field)\description [2] = "Baum"
fields(act_field)\description [3] = "Arbol"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Tree6
act_field = #FELD_BAUM6
fields(act_field)\description [1] = "Tree"
fields(act_field)\description [2] = "Baum"
fields(act_field)\description [3] = "Arbol"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Blue Chest 1 (locked)
act_field = #FELD_BLAUETRUHE1
fields(act_field)\description [1] = "Blue Chest"
fields(act_field)\description [2] = "Blaue Truhe"
fields(act_field)\description [3] = "Caja azul"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Blue Chest 2 (open)
act_field = #FELD_BLAUETRUHE2
fields(act_field)\description [1] = "Blue Chest"
fields(act_field)\description [2] = "Blaue Truhe"
fields(act_field)\description [3] = "Caja azul"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Trader1
act_field = #FELD_HAENDLER1
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Campfire
act_field = #FELD_LAGERFEUER
fields(act_field)\description [1] = "Campfire"
fields(act_field)\description [2] = "Lagerfeuer"
fields(act_field)\description [3] = "Fogata"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Trader1_1
act_field = #FELD_HAENDLER1_1
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Green Chest 1 (locked)
act_field = #FELD_GRUENETRUHE1
fields(act_field)\description [1] = "Green Chest"
fields(act_field)\description [2] = "Grüne Truhe"
fields(act_field)\description [3] = "Caja verde"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Green Chest 2 (open)
act_field = #FELD_GRUENETRUHE2
fields(act_field)\description [1] = "Green Chest"
fields(act_field)\description [2] = "Grüne Truhe"
fields(act_field)\description [3] = "Caja verde"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Hidden Treasure 2 (detected)
act_field = #FELD_VERBORGENER_SCHATZ2
fields(act_field)\description [1] = "Hidden Treasure"
fields(act_field)\description [2] = "Versteckter Schatz"
fields(act_field)\description [3] = "Tesoro escondido"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Door (closed)
act_field = #FELD_TUER2
fields(act_field)\description [1] = "Door"
fields(act_field)\description [2] = "Tür"
fields(act_field)\description [3] = "Puerta"
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Door (open)
act_field = #FELD_OFFENE_TUER
fields(act_field)\description [1] = "Door"
fields(act_field)\description [2] = "Tür"
fields(act_field)\description [3] = "Puerta"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Watermonster
act_field = #FELD_WASSERMONSTER
fields(act_field)\description [1] = "Water"
fields(act_field)\description [2] = "Wasser"
fields(act_field)\description [3] = "Aqua"
fields(act_field)\water = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Shaft
act_field = #FELD_SCHACHT
fields(act_field)\description [1] = "Shaft"
fields(act_field)\description [2] = "Schacht"
fields(act_field)\description [3] = "Agujero"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter
act_field = #FELD_TELEPORTER
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Hidden Treasure 1 (undetected)
act_field = #FELD_VERBORGENER_SCHATZ
fields(act_field)\description [1] = "Buried Treasire"
fields(act_field)\description [2] = "Vergrabener Schatz"
fields(act_field)\description [3] = "Tesoro enterrado"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Water Partial
act_field = #FELD_WASSER_UNTEN
fields(act_field)\description [1] = "Water"
fields(act_field)\description [2] = "Wasser"
fields(act_field)\description [3] = "Aqua"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Throne
act_field = #FELD_THRON
fields(act_field)\description [1] = "Thore"
fields(act_field)\description [2] = "Thron"
fields(act_field)\description [3] = "Trono"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Altar1
act_field = #FELD_ALTAR1
fields(act_field)\description [1] = "Altar"
fields(act_field)\description [2] = "Altar"
fields(act_field)\description [3] = "Altar"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Altar2
act_field = #FELD_ALTAR2
fields(act_field)\description [1] = "Altar"
fields(act_field)\description [2] = "Altar"
fields(act_field)\description [3] = "Altar"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Ice
act_field = #FELD_EIS
fields(act_field)\description [1] = "Ice"
fields(act_field)\description [2] = "Eis"
fields(act_field)\description [3] = "Hielo"
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Poison
act_field = #FELD_GIFT
fields(act_field)\description [1] = "Poison"
fields(act_field)\description [2] = "Gift"
fields(act_field)\description [3] = "Veneno"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Trader 2
act_field = #FELD_HAENDLER2
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Trader 2_2
act_field = #FELD_HAENDLER2_2
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Trader 3
act_field = #FELD_HAENDLER3
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Trader 3_3
act_field = #FELD_HAENDLER3_3
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Trader 4
act_field = #FELD_HAENDLER4
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Trader 4_4
act_field = #FELD_HAENDLER4_4
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Cave 2 Wall
act_field = #FELD_HOEHLE2_MAUER
fields(act_field)\description [1] = "Cave Wall"
fields(act_field)\description [2] = "Höhlenwand"
fields(act_field)\description [3] = "Muro de Cueva"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Cave 2 Empty
act_field = #FELD_HOEHLE2_LEER
fields(act_field)\description [1] = "Cave Floor"
fields(act_field)\description [2] = "Höhlenboden"
fields(act_field)\description [3] = "Suelo de Cueva"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Cave 3 Wall
act_field = #FELD_HOEHLE3_MAUER
fields(act_field)\description [1] = "Cave Wall"
fields(act_field)\description [2] = "Höhlenwand"
fields(act_field)\description [3] = "Muro de Cueva"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Cave 3 Empty
act_field = #FELD_HOEHLE3_LEER
fields(act_field)\description [1] = "Cave Floor"
fields(act_field)\description [2] = "Höhlenboden"
fields(act_field)\description [3] = "Suelo de Cueva"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Key
act_field = #FELD_SCHLUESSEL
fields(act_field)\description [1] = "Key"
fields(act_field)\description [2] = "Schlüssel"
fields(act_field)\description [3] = "Llave"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Skeleton 2
act_field = #FELD_SKELETT2
fields(act_field)\description [1] = "Skeleton"
fields(act_field)\description [2] = "Skelett"
fields(act_field)\description [3] = "Esqueleto"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0


; Grass
act_field = #FELD_GRAS
fields(act_field)\description [1] = "Grass"
fields(act_field)\description [2] = "Gras"
fields(act_field)\description [3] = "Césped"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Grassstone
act_field = #FELD_GRASSTEIN
fields(act_field)\description [1] = "Stone"
fields(act_field)\description [2] = "Stein"
fields(act_field)\description [3] = "Piedra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Bush
act_field = #FELD_BUSCH
fields(act_field)\description [1] = "Bush"
fields(act_field)\description [2] = "Busch"
fields(act_field)\description [3] = "Arbusto"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Mimic
act_field = #FELD_MIMIC
fields(act_field)\description [1] = "Chest"
fields(act_field)\description [2] = "Truhe"
fields(act_field)\description [3] = "Caja"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 0

; Tombstone (for graveyard room)
act_field = #FELD_HEADSTONE
fields(act_field)\description [1] = "Tombstone"
fields(act_field)\description [2] = "Grabstein"
fields(act_field)\description [3] = "Lápida"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Skeleton 3
act_field = #FELD_SKELETT3
fields(act_field)\description [1] = "Skeleton"
fields(act_field)\description [2] = "Skelett"
fields(act_field)\description [3] = "Esqueleto"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Wall 2
act_field = #FELD_MAUER2
fields(act_field)\description [1] = "Wall"
fields(act_field)\description [2] = "Wand"
fields(act_field)\description [3] = "Pared"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Wall 3
act_field = #FELD_MAUER3
fields(act_field)\description [1] = "Wall"
fields(act_field)\description [2] = "Wand"
fields(act_field)\description [3] = "Pared"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Wall 4
act_field = #FELD_MAUER4
fields(act_field)\description [1] = "Wall"
fields(act_field)\description [2] = "Wand"
fields(act_field)\description [3] = "Pared"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Wall 5
act_field = #FELD_MAUER5
fields(act_field)\description [1] = "Wall"
fields(act_field)\description [2] = "Wand"
fields(act_field)\description [3] = "Pared"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Lava
act_field = #FELD_LAVA
fields(act_field)\description [1] = "Lava"
fields(act_field)\description [2] = "Lava"
fields(act_field)\description [3] = "Lava"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Bricks (unused)
act_field = #FELD_MAUERTEIL
fields(act_field)\description [1] = "Bricks"
fields(act_field)\description [2] = "Steine"
fields(act_field)\description [3] = "Piedras"
fields(act_field)\block_los = 1
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Boulder
act_field = #FELD_FELSBROCKEN
fields(act_field)\description [1] = "Boulder"
fields(act_field)\description [2] = "Stein"
fields(act_field)\description [3] = "Piedra"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1


; Tiled Floor 1
act_field = #FELD_KACHELBODEN1
fields(act_field)\description [1] = "Tiles floor"
fields(act_field)\description [2] = "Kachelboden"
fields(act_field)\description [3] = "Azulejo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Tiled Floor 2
act_field = #FELD_KACHELBODEN2
fields(act_field)\description [1] = "Tiles floor"
fields(act_field)\description [2] = "Kachelboden"
fields(act_field)\description [3] = "Azulejo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Tiled Floor 3
act_field = #FELD_KACHELBODEN3
fields(act_field)\description [1] = "Tiles floor"
fields(act_field)\description [2] = "Kachelboden"
fields(act_field)\description [3] = "Azulejo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Tiled Floor 4
act_field = #FELD_KACHELBODEN4
fields(act_field)\description [1] = "Tiles floor"
fields(act_field)\description [2] = "Kachelboden"
fields(act_field)\description [3] = "Azulejo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Staffpiece
act_field = #FELD_STABTEIL
fields(act_field)\description [1] = "Staffpiece"
fields(act_field)\description [2] = "Stabteil"
fields(act_field)\description [3] = "Trozo del Bastón"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Anvil
act_field = #FELD_AMBOSS
fields(act_field)\description [1] = "Anvil"
fields(act_field)\description [2] = "Amboss"
fields(act_field)\description [3] = "Bigornia"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Trader 9
act_field = #FELD_HAENDLER9
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Trader 10
act_field = #FELD_HAENDLER10
fields(act_field)\description [1] = "Trader"
fields(act_field)\description [2] = "Händler"
fields(act_field)\description [3] = "Commerciante"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 1
act_field = #FELD_LEHRER1
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 2
act_field = #FELD_LEHRER2
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 3
act_field = #FELD_LEHRER3
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 4
act_field = #FELD_LEHRER4
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 5
act_field = #FELD_LEHRER5
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 6
act_field = #FELD_LEHRER6
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 7
act_field = #FELD_LEHRER7
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 8
act_field = #FELD_LEHRER8
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 9
act_field = #FELD_LEHRER9
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Teacher 10
act_field = #FELD_LEHRER10
fields(act_field)\description [1] = "Teacher"
fields(act_field)\description [2] = "Lehrer"
fields(act_field)\description [3] = "Profesor"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Claw (unused)
act_field = #FELD_TATZE
fields(act_field)\description [1] = "Trail"
fields(act_field)\description [2] = "Spur"
fields(act_field)\description [3] = "Huella"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Icefloor
act_field = #FELD_EISBODEN
fields(act_field)\description [1] = "Icefloor"
fields(act_field)\description [2] = "Eisboden"
fields(act_field)\description [3] = "Suelo de Hielo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Stars 3
act_field = #FELD_STERNE3
fields(act_field)\description [1] = "Stars"
fields(act_field)\description [2] = "Sterne"
fields(act_field)\description [3] = "Estrellas"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Net
act_field = #FELD_NETZ
fields(act_field)\description [1] = "Spidernet"
fields(act_field)\description [2] = "Spinnennetz"
fields(act_field)\description [3] = "Telaraña"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Tree small
act_field = #FELD_BAUM_KLEIN
fields(act_field)\description [1] = "Tree"
fields(act_field)\description [2] = "Baum"
fields(act_field)\description [3] = "Arbol"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Hydra 1
act_field = #FELD_HYDRA1
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 2
act_field = #FELD_HYDRA2
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 3
act_field = #FELD_HYDRA3
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 4
act_field = #FELD_HYDRA4
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 5
act_field = #FELD_HYDRA5
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 6
act_field = #FELD_HYDRA6
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 7
act_field = #FELD_HYDRA7
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 8
act_field = #FELD_HYDRA8
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 9
act_field = #FELD_HYDRA9
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 10
act_field = #FELD_HYDRA10
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 11
act_field = #FELD_HYDRA11
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Hydra 12
act_field = #FELD_HYDRA12
fields(act_field)\description [1] = "Hydra"
fields(act_field)\description [2] = "Hydra"
fields(act_field)\description [3] = "Hidra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Rune 1
act_field = #FELD_RUNE1
fields(act_field)\description [1] = "Rune"
fields(act_field)\description [2] = "Rune"
fields(act_field)\description [3] = "Runa"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 1
act_field = #FELD_KNOCHEN1
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 2
act_field = #FELD_KNOCHEN2
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 3
act_field = #FELD_KNOCHEN3
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 4
act_field = #FELD_KNOCHEN4
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 5
act_field = #FELD_KNOCHEN5
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 6
act_field = #FELD_KNOCHEN6
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 7
act_field = #FELD_KNOCHEN7
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Bones 8
act_field = #FELD_KNOCHEN8
fields(act_field)\description [1] = "Bones"
fields(act_field)\description [2] = "Knochen"
fields(act_field)\description [3] = "Huesos"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Rune 2
act_field = #FELD_RUNE2
fields(act_field)\description [1] = "Rune"
fields(act_field)\description [2] = "Rune"
fields(act_field)\description [3] = "Runa"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Rune 3
act_field = #FELD_RUNE3
fields(act_field)\description [1] = "Rune"
fields(act_field)\description [2] = "Rune"
fields(act_field)\description [3] = "Runa"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Water Gold
act_field = #FELD_WASSER_GOLDSACK
fields(act_field)\description [1] = "Gold"
fields(act_field)\description [2] = "Gold"
fields(act_field)\description [3] = "Oro"
fields(act_field)\water = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 2

; Water Chest
act_field = #FELD_WASSER_TRUHE
fields(act_field)\description [1] = "Chest"
fields(act_field)\description [2] = "Truhe"
fields(act_field)\description [3] = "Caja"
fields(act_field)\water = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 2

; Water Green Chest
act_field = #FELD_WASSER_GRUENE_TRUHE
fields(act_field)\description [1] = "Green Chest"
fields(act_field)\description [2] = "Grüne Truhe"
fields(act_field)\description [3] = "Caja verde"
fields(act_field)\water = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 2

; Water Skeleton
act_field = #FELD_WASSER_SKELETT
fields(act_field)\description [1] = "Skeleton"
fields(act_field)\description [2] = "Skelett"
fields(act_field)\description [3] = "Esqueleto"
fields(act_field)\water = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 2

; Lampstand
act_field = #FELD_LEUCHTER
fields(act_field)\description [1] = "Lampstand"
fields(act_field)\description [2] = "Leuchte"
fields(act_field)\description [3] = "Candelabra"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Wall White
act_field = #FELD_WAND_WEISS
fields(act_field)\description [1] = "Wall"
fields(act_field)\description [2] = "Wand"
fields(act_field)\description [3] = "Pared"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Teleporter Forest
act_field = #FELD_TELEPORTER_WALD
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Labyrinth
act_field = #FELD_TELEPORTER_LABYRINTH
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Goblin Lair
act_field = #FELD_TELEPORTER_GOBLINHOEHLE
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Spider Lair
act_field = #FELD_TELEPORTER_SPINNENBAU
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter 1
act_field = #FELD_TELEPORTER_1
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Lava Cavern
act_field = #FELD_TELEPORTER_LAVAKAVERNE
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Ice Cavern
act_field = #FELD_TELEPORTER_EISKAVERNE
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Archipel
act_field = #FELD_TELEPORTER_ARCHIPEL
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Desert
act_field = #FELD_TELEPORTER_WUESTE
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Great Graveyard
act_field = #FELD_TELEPORTER_TOTENHALLE
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Hall of Illusions
act_field = #FELD_TELEPORTER_HALLE_ILLUSIONEN
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Sand 1
act_field = #FELD_SAND1
fields(act_field)\description [1] = "Sand"
fields(act_field)\description [2] = "Sand"
fields(act_field)\description [3] = "Arena"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Sand Dune
act_field = #FELD_SAND_HUEGEL
fields(act_field)\description [1] = "Hill"
fields(act_field)\description [2] = "Hügel"
fields(act_field)\description [3] = "Colina"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Sand 2
act_field = #FELD_SAND2
fields(act_field)\description [1] = "Sand"
fields(act_field)\description [2] = "Sand"
fields(act_field)\description [3] = "Arena"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Sand 3
act_field = #FELD_SAND3
fields(act_field)\description [1] = "Sand"
fields(act_field)\description [2] = "Sand"
fields(act_field)\description [3] = "Arena"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Sand 4
act_field = #FELD_SAND4
fields(act_field)\description [1] = "Sand"
fields(act_field)\description [2] = "Sand"
fields(act_field)\description [3] = "Arena"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Palmtree 1
act_field = #FELD_PALME1
fields(act_field)\description [1] = "Palmtree"
fields(act_field)\description [2] = "Palme"
fields(act_field)\description [3] = "Palmera"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Palmtree 2
act_field = #FELD_PALME2
fields(act_field)\description [1] = "Palmtree"
fields(act_field)\description [2] = "Palme"
fields(act_field)\description [3] = "Palmera"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Palmtree 3
act_field = #FELD_PALME3
fields(act_field)\description [1] = "Palmtree"
fields(act_field)\description [2] = "Palme"
fields(act_field)\description [3] = "Palmera"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Palmtree 4
act_field = #FELD_PALME4
fields(act_field)\description [1] = "Palmtree"
fields(act_field)\description [2] = "Palme"
fields(act_field)\description [3] = "Palmera"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Cactus 1
act_field = #FELD_KAKTUS1
fields(act_field)\description [1] = "Cactus"
fields(act_field)\description [2] = "Kaktus"
fields(act_field)\description [3] = "Cactus"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Cactus 2
act_field = #FELD_KAKTUS2
fields(act_field)\description [1] = "Cactus"
fields(act_field)\description [2] = "Kaktus"
fields(act_field)\description [3] = "Cactus"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter Swamp
act_field = #FELD_TELEPORTER_SUMPF
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter 5
act_field = #FELD_TELEPORTER_5
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Teleporter 6
act_field = #FELD_TELEPORTER_6
fields(act_field)\description [1] = "Teleporter"
fields(act_field)\description [2] = "Teleporter"
fields(act_field)\description [3] = "Teleportador"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Lawn Skeleton
act_field = #FELD_WIESE_SKELETT
fields(act_field)\description [1] = "Skeleton"
fields(act_field)\description [2] = "Skelett"
fields(act_field)\description [3] = "Esqueleto"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Lawn Chest
act_field = #FELD_WIESE_TRUHE
fields(act_field)\description [1] = "Chest"
fields(act_field)\description [2] = "Truhe"
fields(act_field)\description [3] = "Caja"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Lawn Green Chest 1 (locked)
act_field = #FELD_WIESE_GRUENETRUHE1
fields(act_field)\description [1] = "Green Chest"
fields(act_field)\description [2] = "Grüne Truhe"
fields(act_field)\description [3] = "Caja verde"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Lawn Green Chest 2 (open)
act_field = #FELD_WIESE_GRUENETRUHE2
fields(act_field)\description [1] = "Green Chest"
fields(act_field)\description [2] = "Grüne Truhe"
fields(act_field)\description [3] = "Caja verde"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Carpet 1
act_field = #FELD_TEPPICH1
fields(act_field)\description [1] = "Carpet"
fields(act_field)\description [2] = "Teppich"
fields(act_field)\description [3] = "Alfombra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Carpet 2
act_field = #FELD_TEPPICH2
fields(act_field)\description [1] = "Carpet"
fields(act_field)\description [2] = "Teppich"
fields(act_field)\description [3] = "Alfombra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Carpet 3
act_field = #FELD_TEPPICH3
fields(act_field)\description [1] = "Carpet"
fields(act_field)\description [2] = "Teppich"
fields(act_field)\description [3] = "Alfombra"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Swamp 1
act_field = #FELD_SUMPF1
fields(act_field)\description [1] = "Swamp"
fields(act_field)\description [2] = "Sumpf"
fields(act_field)\description [3] = "Pantano"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Swamp 2
act_field = #FELD_SUMPF2
fields(act_field)\description [1] = "Swamp"
fields(act_field)\description [2] = "Sumpf"
fields(act_field)\description [3] = "Pantano"
fields(act_field)\block_walk = 1
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1

; Plant
act_field = #FELD_PFLANZE
fields(act_field)\description [1] = "Plant"
fields(act_field)\description [2] = "Pflanze"
fields(act_field)\description [3] = "Planta"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Poisenous
act_field = #FELD_GIFTIG
fields(act_field)\description [1] = "Poisenous"
fields(act_field)\description [2] = "Giftig"
fields(act_field)\description [3] = "Venenoso"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Wounded Hero 1
act_field = #FELD_WOUNDED_HERO1
fields(act_field)\description [1] = "Wounded Hero"
fields(act_field)\description [2] = "Verletzter Held"
fields(act_field)\description [3] = "Heroe herido"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Wounded Hero 2
act_field = #FELD_WOUNDED_HERO2
fields(act_field)\description [1] = "Wounded Hero"
fields(act_field)\description [2] = "Verletzter Held"
fields(act_field)\description [3] = "Heroe herido"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Snow
act_field = #FELD_SCHNEE
fields(act_field)\description [1] = "Snow"
fields(act_field)\description [2] = "Schnee"
fields(act_field)\description [3] = "Nieve"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Anchor Target
act_field = #FELD_ANKER_ZIEL
fields(act_field)\description [1] = "Anchor"
fields(act_field)\description [2] = "Anker"
fields(act_field)\description [3] = "Ancla"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Trickle
act_field = #FELD_RINNSAAL
fields(act_field)\description [1] = "Trickle"
fields(act_field)\description [2] = "Rinnsaal"
fields(act_field)\description [3] = "Arroyuelo"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Hut
act_field = #FELD_HUETTE
fields(act_field)\description [1] = "Hut"
fields(act_field)\description [2] = "Hütte"
fields(act_field)\description [3] = "Cabaña"
fields(act_field)\block_los = 1
fields(act_field)\block_item = 1
fields(act_field)\block_spawn = 1
fields(act_field)\attri_floor = 1

; Nailpit
act_field = #FELD_NAGELGRUBE
fields(act_field)\description [1] = "Nailpit"
fields(act_field)\description [2] = "Nagelgrube"
fields(act_field)\description [3] = "Trampa de claves"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0
fields(act_field)\attri_floor = 1

; Portcullis up
act_field = #FELD_GITTER1
fields(act_field)\description [1] = "Portcullis"
fields(act_field)\description [2] = "Fallgatter"
fields(act_field)\description [3] = "Barandilla"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 0

; Portcullis down
act_field = #FELD_GITTER2
fields(act_field)\description [1] = "Portcullis"
fields(act_field)\description [2] = "Fallgatter"
fields(act_field)\description [3] = "Barandilla"
fields(act_field)\block_los = 0
fields(act_field)\block_item = 0
fields(act_field)\block_spawn = 1







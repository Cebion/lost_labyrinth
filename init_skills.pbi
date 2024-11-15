; Eigenschaften Daten

; -----------------------------------------------------------------------------------

Procedure init_skills()

Shared combi

   If combi = 0
      For i = 1 To #ANZ_SKILLS
         skills(i,akt_spieler)\gewaehlt = 0
         skills(i,akt_spieler)\gelocked = 0
      Next
   EndIf

; --------------------------------------------------------------------------

i = #CE_WEG_DES_SCHWERTES
skills(i,akt_spieler)\name[2] = "Weg des Schwertes"
skills(i,akt_spieler)\name[1] = "Way of the Sword"
skills(i,akt_spieler)\name[3] = "Camino de la Espada"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KAMPFTRAINING
skills(i,akt_spieler)\name[2] = "Kampftraining"
skills(i,akt_spieler)\name[1] = "Combat Training"
skills(i,akt_spieler)\name[3] = "Entrenamiento de Combate"
skills(i,akt_spieler)\nummer = #CE_KAMPFTRAINING
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Angriff: 4 (normalerweise 1)"
skills(i,akt_spieler)\beschreibung_1[1] = "Attack: 4 (normally 1)"
skills(i,akt_spieler)\beschreibung_1[3] = "Ataque: 4 (normalmente 1)"
skills(i,akt_spieler)\beschreibung_2[2] = "(Angriff = Chance im Kampf zu treffen)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Attack = Chance to hit in combat)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Ataque = Chance de alcanzar en combate)"

i = #CE_KONSTITUTION
skills(i,akt_spieler)\name[2] = "Konstitution" 
skills(i,akt_spieler)\name[1] = "Constitution"
skills(i,akt_spieler)\name[3] = "Constitución"
skills(i,akt_spieler)\nummer = #CE_KONSTITUTION
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "15 Lebenspunkte (normalerweise 12)"
skills(i,akt_spieler)\beschreibung_1[1] = "15 Life Points (normally 12)"
skills(i,akt_spieler)\beschreibung_1[3] = "15 Puntos de Vida (normalmente 12)"
skills(i,akt_spieler)\beschreibung_2[2] = "+4 Lebenspunkte bei Erfahrungsgewinn (normalerweise +3)"
skills(i,akt_spieler)\beschreibung_2[1] = "+4 Life Points per experience gain (normally +3)"
skills(i,akt_spieler)\beschreibung_2[3] = "+4 Puntos de Vida al ganar experiencia (normalmente +3)"

i = #CE_STAERKE
skills(i,akt_spieler)\name[2] = "Stärke"
skills(i,akt_spieler)\name[1] = "Strength"
skills(i,akt_spieler)\name[3] = "Fuerza"
skills(i,akt_spieler)\nummer = #CE_STAERKE
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Stärke: 4 (normalerweise 1)"
skills(i,akt_spieler)\beschreibung_1[1] = "Strength: 4 (normally 1)"
skills(i,akt_spieler)\beschreibung_1[3] = "Fuerza: 4 (normalmente 1)"
skills(i,akt_spieler)\beschreibung_2[2] = "(Richtet Schaden im Nahkampf an)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Deals damage in close combat)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Hace daño en combate cerca)"

i = #CE_BERSERKER
skills(i,akt_spieler)\name[2] = "Berserker"
skills(i,akt_spieler)\name[1] = "Berserk"
skills(i,akt_spieler)\name[3] = "Berserker"
skills(i,akt_spieler)\nummer = #CE_BERSERKER
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] ="Stärke zählt im Nahkampf doppelt"
skills(i,akt_spieler)\beschreibung_1[1] ="Strength counts twice in melee combat"
skills(i,akt_spieler)\beschreibung_1[3] = "La Fuerza se duplica en cuerpo a cuerpo"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_GEWANDTHEIT
skills(i,akt_spieler)\name[2] = "Gewandtheit"
skills(i,akt_spieler)\name[1] = "Dexterity"
skills(i,akt_spieler)\name[3] = "Destreza"
skills(i,akt_spieler)\nummer = #CE_GEWANDTHEIT
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Reflexe: 4 (normalerweise 1)"
skills(i,akt_spieler)\beschreibung_1[1] = "Dexterity: 4 (normally 1)"
skills(i,akt_spieler)\beschreibung_1[3] = "Destreza: 4 (normalmente 1)"
skills(i,akt_spieler)\beschreibung_2[2] = "(Verhindert Monster Treffer und weicht Fallen aus)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Prevents getting hit by monsters and traps)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Preventa que monstuos y trampas alcanzan)"

i = #CE_AUSWEICHEN
skills(i,akt_spieler)\name[2] = "Ausweichen"
skills(i,akt_spieler)\name[1] = "Dodging"
skills(i,akt_spieler)\name[3] = "Evasión"
skills(i,akt_spieler)\nummer  = #CE_AUSWEICHEN
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "50% aller Monsterattacken verfehlen den Charakter"
skills(i,akt_spieler)\beschreibung_1[1] = "50% of all monster attacks miss the character"
skills(i,akt_spieler)\beschreibung_1[3] = "El 50% de ataques de monstruos fallan"
skills(i,akt_spieler)\beschreibung_2[2] = "(Im Nah- und Fernkampf)"
skills(i,akt_spieler)\beschreibung_2[1] = "(in close and ranged combat)"
skills(i,akt_spieler)\beschreibung_2[3] = "(en combate cerca y lejos)"

i = #CE_KAMPF_IN_RUESTUNG
skills(i,akt_spieler)\name[2] = "Kampf in Rüstung"
skills(i,akt_spieler)\name[1] = "Fighting in Armor"
skills(i,akt_spieler)\name[3] = "Luchar con Armadura"
skills(i,akt_spieler)\nummer = #CE_KAMPF_IN_RUESTUNG
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Keine Behinderung durch Rüstung"
skills(i,akt_spieler)\beschreibung_1[1] = "No Encumbrance through armor"
skills(i,akt_spieler)\beschreibung_1[3] = "Sin estorbos con armadura"
skills(i,akt_spieler)\beschreibung_2[2] = "(Behinderung wird normalerweise von Angriff abgezogen)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Encumbrance is normally subtracted from Attack)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Los estorbos normalmente disminuyen el Ataque)"

i = #CE_HAERTE
skills(i,akt_spieler)\name[2] = "Härte"
skills(i,akt_spieler)\name[1] = "Toughness"
skills(i,akt_spieler)\name[3] = "Dureza"
skills(i,akt_spieler)\nummer = #CE_HAERTE
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Jeglicher Schaden wird um 1 Punkt reduziert"
skills(i,akt_spieler)\beschreibung_1[1] = "All damage is reduced by 1 point"
skills(i,akt_spieler)\beschreibung_1[3] = "Todos los daños se reducen en 1 punto"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_VETERAN
skills(i,akt_spieler)\name[2] = "Veteran"
skills(i,akt_spieler)\name[1] = "Veteran"
skills(i,akt_spieler)\name[3] = "Veterano"
skills(i,akt_spieler)\nummer = #CE_VETERAN
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit Schwert, Schild, Rüstung,"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts with sword, shield, armour,"
skills(i,akt_spieler)\beschreibung_1[3] = "Empieza con espada, escudo, armadura,"
skills(i,akt_spieler)\beschreibung_2[2] = "Lederhelm,  Lederschuhen und +2 den Lehren"
skills(i,akt_spieler)\beschreibung_2[1] = "leather helmet, leather shoes and +2 in all lore fields"
skills(i,akt_spieler)\beschreibung_2[3] = "casco, zapatos de cuero y +2 en todos los conocimientos"

i = #CE_DUELIST
skills(i,akt_spieler)\name[2] = "Duelist" 
skills(i,akt_spieler)\name[1] = "Duelist"
skills(i,akt_spieler)\name[3] = "Duelista"
skills(i,akt_spieler)\nummer = #CE_DUELIST
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Angriffs-Bonus: Reflexe/2 "
skills(i,akt_spieler)\beschreibung_1[1] = "Attack bonus: Dexterity/2"
skills(i,akt_spieler)\beschreibung_1[3] = "Bonus en ataque: Destreza/2"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KAMPFESWUT
skills(i,akt_spieler)\name[2] = "Kampfeswut"
skills(i,akt_spieler)\name[1] = "Battlelust"
skills(i,akt_spieler)\name[3] = "Sed de Batalla"
skills(i,akt_spieler)\nummer = #CE_KAMPFESWUT
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Angriffs-Bonus: Stärke/2"
skills(i,akt_spieler)\beschreibung_1[1] = "Attack bonus: Strength/2"
skills(i,akt_spieler)\beschreibung_1[3] = "Bonus en ataque: Fuerza/2"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_ZWEI_WAFFEN
skills(i,akt_spieler)\name[2] = "Zweihändiger Kampf"
skills(i,akt_spieler)\name[1] = "Two-Handed Fighting"
skills(i,akt_spieler)\name[3] = "Combate con Dos Manos"
skills(i,akt_spieler)\nummer = #CE_ZWEI_WAFFEN
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Zwei Waffen tragen und Vorteile beider Nutzen"
skills(i,akt_spieler)\beschreibung_1[1] = "Wield two weapons at once with both advantages"
skills(i,akt_spieler)\beschreibung_1[3] = "Puede luchar con dos armas de forma eficiente"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_JAEGER
skills(i,akt_spieler)\name[2] = "Jäger"
skills(i,akt_spieler)\name[1] = "Hunter"
skills(i,akt_spieler)\name[3] = "Cazador"
skills(i,akt_spieler)\nummer = #CE_JAEGER
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+3 Angriff und Schaden gegen Tiere. "
skills(i,akt_spieler)\beschreibung_1[1] = "+3 Attack and Damage against animals."
skills(i,akt_spieler)\beschreibung_1[3] = "+3 Ataque y Daño contra animales."
skills(i,akt_spieler)\beschreibung_2[2] = "Diese lassen mit 50% Nahrung oder Gold zurück"
skills(i,akt_spieler)\beschreibung_2[1] = "50% chance for animals to leave food or gold behind"
skills(i,akt_spieler)\beschreibung_2[3] = "50% de que dejen carne o oro"

i = #CE_PALADIN
skills(i,akt_spieler)\name[2] = "Paladin"
skills(i,akt_spieler)\name[1] = "Paladin"
skills(i,akt_spieler)\name[3] = "Paladin"
skills(i,akt_spieler)\nummer = #CE_PALADIN
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+3 Angriff und Schaden gegen Untote."
skills(i,akt_spieler)\beschreibung_1[1] = "+3 Attack and Damage against undead."
skills(i,akt_spieler)\beschreibung_1[3] = "+3 Ataque y Daño contra no-muertos."
skills(i,akt_spieler)\beschreibung_2[2] = "Diese lassen mit 50% Gold zurück"
skills(i,akt_spieler)\beschreibung_2[1] = "50% chance for undead to leave gold behind"
skills(i,akt_spieler)\beschreibung_2[3] = "50% de que dejen oro"

i = #CE_KOPFGELDJAEGER
skills(i,akt_spieler)\name[2] = "Kopfgeldjäger"
skills(i,akt_spieler)\name[1] = "Headhunter"
skills(i,akt_spieler)\name[3] = "Cazador de Cabezas"
skills(i,akt_spieler)\nummer = #CE_KOPFGELDJAEGER
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+3 Angriff und Schaden gegen Humanoide."
skills(i,akt_spieler)\beschreibung_1[1] = "+3 Attack and Damage against humanoids."
skills(i,akt_spieler)\beschreibung_1[3] = "+3 Ataque y Daño contra humanoides."
skills(i,akt_spieler)\beschreibung_2[2] = "Diese lassen mit 60% Gold zurück"
skills(i,akt_spieler)\beschreibung_2[1] = "60% chance for humanoids to leave gold behind"
skills(i,akt_spieler)\beschreibung_2[3] = "60% de que dejen oro"

i = #CE_GEISTERJAEGER
skills(i,akt_spieler)\name[2] = "Geisterjäger"
skills(i,akt_spieler)\name[1] = "Ghosthunter"
skills(i,akt_spieler)\name[3] = "Cazador de Fantasmas"
skills(i,akt_spieler)\nummer = #CE_GEISTERJAEGER
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+5 Angriff und Schaden gegen Geister."
skills(i,akt_spieler)\beschreibung_1[1] = "+5 Attack and Damage against ghosts."
skills(i,akt_spieler)\beschreibung_1[3] = "+5 Ataque y Daño contra fantasmas."
skills(i,akt_spieler)\beschreibung_2[2] = "(Und diese sind mit normalen Waffen angreifbar)"
skills(i,akt_spieler)\beschreibung_2[1] = "(And you can attack them with normal weapons)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Y son afectados con armas normales)"

i = #CE_BLUTRAUSCH
skills(i,akt_spieler)\name[2] = "Blutrausch"
skills(i,akt_spieler)\name[1] = "Bloodlust"
skills(i,akt_spieler)\name[3] = "Sed de Sangre"
skills(i,akt_spieler)\nummer = #CE_BLUTRAUSCH
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Grad deiner Verwundung erhöht deinen Schaden."
skills(i,akt_spieler)\beschreibung_1[1] = "The more you are hurt, the more damage you do."
skills(i,akt_spieler)\beschreibung_1[3] = "Cuanto mas herido estes mas daño haces."
skills(i,akt_spieler)\beschreibung_2[2] = "(LP/1.5->Schaden*2,LP/2->Schaden*3,LP/3->Schaden*4,LP/5->Schaden*5)"
skills(i,akt_spieler)\beschreibung_2[1] = "(LP/1.5->Dam*2,LP/2->Damage*3,LP/3->Damage*4,LP/5->Damage*5)"
skills(i,akt_spieler)\beschreibung_2[3] = "(PdV/1.5->Dano*2,PdV/2->Dano*3,PdV/3->Dano*4,PdV/5->Dano*5)"

i = #CE_RUNDSCHLAG
skills(i,akt_spieler)\name[2] = "Rundschlag"
skills(i,akt_spieler)\name[1] = "Round Attack"
skills(i,akt_spieler)\name[3] = "Ataque Alrededor"
skills(i,akt_spieler)\nummer = #CE_RUNDSCHLAG
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Du greifst alle Monster um dich an"
skills(i,akt_spieler)\beschreibung_1[1] = "You attack all monsters that surround you"
skills(i,akt_spieler)\beschreibung_1[3] = "Atacas a todos los monstruos de tu alrededor"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_STURMANGRIFF
skills(i,akt_spieler)\name[2] = "Sturmangriff"
skills(i,akt_spieler)\name[1] = "Charge Attack"
skills(i,akt_spieler)\name[3] = "Ataque Continuo"
skills(i,akt_spieler)\nummer = #CE_STURMANGRIFF
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[1] = "Can charge in one direction through several monsters,"
skills(i,akt_spieler)\beschreibung_2[1] = "if killing them with one swipe"
skills(i,akt_spieler)\beschreibung_1[2] = "Kann in eine Richtung durch mehrere Gegner stürmen,"
skills(i,akt_spieler)\beschreibung_2[2] = "falls diese mit einem Hieb erledigt werden"
skills(i,akt_spieler)\beschreibung_1[3] = "Atacar a un monstruo cuesta un punto movimiento"
skills(i,akt_spieler)\beschreibung_2[3] = "en vez de terminar el turno"

i = #CE_FLINKE_ATTACKE
skills(i,akt_spieler)\name[2] = "Flinke Attacke"
skills(i,akt_spieler)\name[1] = "Fast Attack"
skills(i,akt_spieler)\name[3] = "Ataque Rápido"
skills(i,akt_spieler)\nummer = #CE_FLINKE_ATTACKE
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Macht zwei Schläge im Nahkampf"
skills(i,akt_spieler)\beschreibung_1[1] = "Does two swings when attacking in mêlée"
skills(i,akt_spieler)\beschreibung_1[3] = "Dos ataques por turno"
skills(i,akt_spieler)\beschreibung_2[2] = "(Kombiniert sich mit 2h Kampf + Sturmangriff)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Works together with Two-Handed Fighting and Charge Attack)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Funciona con 2 Manos y Ataque Continuo)"


i = #CE_SCHWERTKAMPF
skills(i,akt_spieler)\name[2] = "Schwertkampf"
skills(i,akt_spieler)\name[1] = "Swordfighting"
skills(i,akt_spieler)\name[3] = "Luchar con Espadas"
skills(i,akt_spieler)\nummer = #CE_SCHWERTKAMPF
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+2 Angriff und Schaden mit Schwertern. Beginnt mit Schwert"
skills(i,akt_spieler)\beschreibung_1[1] = "+2 Attack and Damage with swords. Begins with sword"
skills(i,akt_spieler)\beschreibung_1[3] = "+2 Ataque y Daño con espadas. Empiezas con espada"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_AXTKAMPF
skills(i,akt_spieler)\name[2] = "Axtkampf"
skills(i,akt_spieler)\name[1] = "Axefighting"
skills(i,akt_spieler)\name[3] = "Luchar con Hachas"
skills(i,akt_spieler)\nummer = #CE_AXTKAMPF
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+2 Angriff und Schaden mit Äxten. Beginnt mit Axt"
skills(i,akt_spieler)\beschreibung_1[1] = "+2 Attack and Damage with axes. Begins with axe"
skills(i,akt_spieler)\beschreibung_1[3] = "+2 Ataque y Daño con hachas. Empiezas con hacha"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SPEERKAMPF
skills(i,akt_spieler)\name[2] = "Speerkampf"
skills(i,akt_spieler)\name[1] = "Spearfighting"
skills(i,akt_spieler)\name[3] = "Luchar con Lanzas"
skills(i,akt_spieler)\nummer = #CE_SPEERKAMPF
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+2 Angriff und Schaden mit Speeren. Beginnt mit Speer"
skills(i,akt_spieler)\beschreibung_1[1] = "+2 Attack and Damage with spears. Begins with spear"
skills(i,akt_spieler)\beschreibung_1[3] = "+2 Ataque y Daño con lanzas. Empiezas con lanza"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_HAMMERKAMPF
skills(i,akt_spieler)\name[2] = "Hammerkampf"
skills(i,akt_spieler)\name[1] = "Hammerfighting"
skills(i,akt_spieler)\name[3] = "Luchar con Martillos"
skills(i,akt_spieler)\nummer = #CE_HAMMERKAMPF
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+2 Angriff und Schaden mit Hämmern. Beginnt mit Hammer"
skills(i,akt_spieler)\beschreibung_1[1] = "+2 Attack and Damage with hammers. Begins with hammer"
skills(i,akt_spieler)\beschreibung_1[3] = "+2 Ataque y Daño con martillos. Empiezas con martillo"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_WAFFENLOSER_KAMPF
skills(i,akt_spieler)\name[2] = "Waffenloser Kampf"
skills(i,akt_spieler)\name[1] = "Unarmed Combat"
skills(i,akt_spieler)\name[3] = "Luchar sin Armas"
skills(i,akt_spieler)\nummer = #CE_WAFFENLOSER_KAMPF
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "+3 Angriff und Schaden ohne Waffe"
skills(i,akt_spieler)\beschreibung_1[1] = "+3 Attack and Damage without a weapon"
skills(i,akt_spieler)\beschreibung_1[3] = "+3 Ataque y Daño sin Armas"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_ANFUEHRER
skills(i,akt_spieler)\name[2] = "Anführer"
skills(i,akt_spieler)\name[1] = "Leader"
skills(i,akt_spieler)\name[3] = "Comandante"
skills(i,akt_spieler)\nummer = #CE_ANFUEHRER
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\unique = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Spieler erhalten +2 Angriff"
skills(i,akt_spieler)\beschreibung_1[1] = "All players get +2 Attack"
skills(i,akt_spieler)\beschreibung_1[3] = "Todos jugadores reciben Ataque +2"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SOELDNER
skills(i,akt_spieler)\name[2] = "Söldner"
skills(i,akt_spieler)\name[1] = "Mercenary"
skills(i,akt_spieler)\name[3] = "Mercenario"
skills(i,akt_spieler)\nummer = #CE_SOELDNER
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Jeder Level gibt dir Ebene*5 Gold"
skills(i,akt_spieler)\beschreibung_1[1] = "Every level gives you Level*5 Gold"
skills(i,akt_spieler)\beschreibung_1[3] = "Cada nivel te da Nivel*5 Oro"
skills(i,akt_spieler)\beschreibung_2[2] = "Jedes erchlagene Monster Level Gold (max. 5)"
skills(i,akt_spieler)\beschreibung_2[1] = "Every killed monster Level Gold (max. 5)"
skills(i,akt_spieler)\beschreibung_2[3] = "Cada monstruo que matas Nivel Oro (max. 5)"

i = #CE_KAMPFTECHNIKEN
skills(i,akt_spieler)\name[2] = "Kampftechniken"
skills(i,akt_spieler)\name[1] = "Fighting Styles"
skills(i,akt_spieler)\name[3] = "Estilos de Combate"
skills(i,akt_spieler)\nummer = #CE_KAMPFTECHNIKEN
skills(i,akt_spieler)\gruppe = 1
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Du beherrscht verschiedene Kampftechniken"
skills(i,akt_spieler)\beschreibung_1[1] = "You mastered several different fighting styles"
skills(i,akt_spieler)\beschreibung_1[3] = "Dominas diferentes estilos de combate"
skills(i,akt_spieler)\beschreibung_2[2] = "(Siehe FAQ für Beschreibung)"
skills(i,akt_spieler)\beschreibung_2[1] = "(See FAQ for details)"
skills(i,akt_spieler)\beschreibung_2[3] = "(El FAQ contiene detalles)"

; ---------------------------------------------------------------------------------


i = #CE_WEG_DES_BOGENS
skills(i,akt_spieler)\name[1] = "Way of the Bow"
skills(i,akt_spieler)\name[2] = "Weg des Bogens"
skills(i,akt_spieler)\name[3] = "Camino del Arco"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_BOGENSCHIESSEN
skills(i,akt_spieler)\name[2] = "Bogenschiessen"
skills(i,akt_spieler)\name[1] = "Archery"
skills(i,akt_spieler)\name[3] = "Arqueria"
skills(i,akt_spieler)\nummer = #CE_BOGENSCHIESSEN
skills(i,akt_spieler)\gruppe = 2
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit Bogen und Pfeilen; +50% Trefferchance"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts with bow and arrows; +50% success chance"
skills(i,akt_spieler)\beschreibung_1[3] = "Empiezas con arco y flechas; +50% de acierto"
skills(i,akt_spieler)\beschreibung_2[2] = "(Du bekommst 10 neue Pfeile jeden Level)"
skills(i,akt_spieler)\beschreibung_2[1] = "(You get 10 new arrows every level)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Recibes 10 flechas nuevas cada nivel)"

i = #CE_ZEN_BOGEN
skills(i,akt_spieler)\name[2] = "Zen Bogenschiessen"
skills(i,akt_spieler)\name[1] = "Zen Bowmastery"
skills(i,akt_spieler)\name[3] = "Zen Arcomaestro"
skills(i,akt_spieler)\nummer = #CE_ZEN_BOGEN
skills(i,akt_spieler)\gruppe = 2
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Wenn ein Monster deinen ersten Pfeil überlebt schiesst du"
skills(i,akt_spieler)\beschreibung_1[1] = "If a monster survives your first shot you shoot"
skills(i,akt_spieler)\beschreibung_1[3] = "Si un monstruo sobrevive a la primera flecha atacas otra vez."
skills(i,akt_spieler)\beschreibung_2[2] = "gleich nochmal. Das zweitemal kostet keinen Pfeil"
skills(i,akt_spieler)\beschreibung_2[1] = "another arrow. The second one does not cost an arrow"
skills(i,akt_spieler)\beschreibung_2[3] = "La segunda vez no gastas flecha"

i = #CE_PFEILMACHER
skills(i,akt_spieler)\name[2] = "Pfeilmacher"
skills(i,akt_spieler)\name[1] = "Fletching"
skills(i,akt_spieler)\name[3] = "Flecheria"
skills(i,akt_spieler)\nummer = #CE_PFEILMACHER
skills(i,akt_spieler)\gruppe = 2
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Jede Ebene bekommst du einen Pack Spezialpfeile"
skills(i,akt_spieler)\beschreibung_1[1] = "Every level you get one pack of special arrows"
skills(i,akt_spieler)\beschreibung_1[3] = "Cada nivel te da un par de flechas magicas"
skills(i,akt_spieler)\beschreibung_2[2] = "Beginnt mit Naga, Oger und Explodierenden Pfeilen"
skills(i,akt_spieler)\beschreibung_2[1] = "Starts the game with Naga, Ogre and Exploding Arrows"
skills(i,akt_spieler)\beschreibung_2[3] = "Empiece el juego con flechas Naga, Ogro y Explosivas"

i = #CE_SCHARFSCHUETZE
skills(i,akt_spieler)\name[2] = "Scharfschütze"
skills(i,akt_spieler)\name[1] = "Sharpshooter"
skills(i,akt_spieler)\name[3] = "Francotirador"
skills(i,akt_spieler)\nummer = #CE_SCHARFSCHUETZE
skills(i,akt_spieler)\gruppe = 2
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Doppelte Chance für kritischen Treffer im Fernkampf. Max 45%"
skills(i,akt_spieler)\beschreibung_1[1] = "Percentage for critical hits in ranged combat doubled. Max 45%"
skills(i,akt_spieler)\beschreibung_1[3] = "Porcentage de golpe critico duplicado con armas a distancia. Max 45%"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=(Geschicklichkeit+Glück)*2% + Waffe)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=(Dexterity+Luck)*2% + Weapon)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Chance=(Destreza+Suerte)*2% + Arma)"

; ---------------------------------------------------------------------------------

i = #CE_WEG_DER_MAGIE
skills(i,akt_spieler)\name[1] = "Way of Magic"
skills(i,akt_spieler)\name[2] = "Weg der Magie"
skills(i,akt_spieler)\name[3] = "Camino de la Magia"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_ARKANE_GABE
skills(i,akt_spieler)\name[2] = "Arkane Gabe" 
skills(i,akt_spieler)\name[1] = "Arcane Power"
skills(i,akt_spieler)\name[3] = "Poder Secreto"
skills(i,akt_spieler)\nummer = #CE_ARKANE_GABE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 3
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Der Level des Zaubers zählt als Bonus auf die Zaubermacht"
skills(i,akt_spieler)\beschreibung_1[1] = "The level of a spell counts as bonus to the Spell Power"
skills(i,akt_spieler)\beschreibung_1[3] = "El nivel de un hechizo bonifica el Poder de Hechizo"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_LEYKONTAKT
skills(i,akt_spieler)\name[2] = "Ley Kontakt"
skills(i,akt_spieler)\name[1] = "Leylines Contact"
skills(i,akt_spieler)\name[3] = "Contacto Sobrenatural"
skills(i,akt_spieler)\nummer = #CE_LEYKONTAKT
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Beim Betreten einer neuen Ebene wird dein Mana regeneriert"
skills(i,akt_spieler)\beschreibung_1[1] = "Upon entering a new level all Mana is restored"
skills(i,akt_spieler)\beschreibung_1[3] = "Al empezar un nivel se recupera todo el Mana"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_MAGIELEHRE
skills(i,akt_spieler)\name[2] = "Magielehre"
skills(i,akt_spieler)\name[1] = "Magic Training"
skills(i,akt_spieler)\name[3] = "Entrenamiento Magico"
skills(i,akt_spieler)\nummer = #CE_MAGIELEHRE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Zirkel: 3 (normalerweise 0)"
skills(i,akt_spieler)\beschreibung_1[1] = "Spell Circle: 3 (normally 0)"
skills(i,akt_spieler)\beschreibung_1[3] = "Círculo Mágico: 3 (normalmente 0)"
skills(i,akt_spieler)\beschreibung_2[2] = "(Du bist ein ausgebildeter Magier)"
skills(i,akt_spieler)\beschreibung_2[1] = "(You are a trained magician)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Eres un mago entrenado)"

i = #CE_ZAUBERMACHT
skills(i,akt_spieler)\name[2] = "Zaubermacht"
skills(i,akt_spieler)\name[1] = "Spell Power"
skills(i,akt_spieler)\name[3] = "Poder de Hechizos"
skills(i,akt_spieler)\nummer = #CE_ZAUBERMACHT
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Zaubermacht: 4"
skills(i,akt_spieler)\beschreibung_1[1] = "Spell Power: 4"
skills(i,akt_spieler)\beschreibung_1[3] = "Poder de Hechizo: 4"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_MANA
skills(i,akt_spieler)\name[2] = "Mana"
skills(i,akt_spieler)\name[1] = "Mana"
skills(i,akt_spieler)\name[3] = "Mana"
skills(i,akt_spieler)\nummer = #CE_MANA
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Mana: 12 (normalerweise 3)"
skills(i,akt_spieler)\beschreibung_1[1] = "Mana: 12 (normally 3)"
skills(i,akt_spieler)\beschreibung_1[3] = "Mana: 12 (normalmente 3)"
skills(i,akt_spieler)\beschreibung_2[2] = "+4 Mana bei Erfahrungsgewinn (normalerweise +3)"
skills(i,akt_spieler)\beschreibung_2[1] = "+4 Mana per experience gain (normally +3)"
skills(i,akt_spieler)\beschreibung_2[3] = "+4 Mana por gano de experiencia (normalmente +3)"

i = #CE_ZAUBERKUNST
skills(i,akt_spieler)\name[2] = "Zauberkunst"
skills(i,akt_spieler)\name[1] = "Sorcery"
skills(i,akt_spieler)\name[3] = "Hechizeria"
skills(i,akt_spieler)\nummer = #CE_ZAUBERKUNST
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Die Erfolgschance bei Zaubern aus gewählten Schulen beträgt 99%"
skills(i,akt_spieler)\beschreibung_1[1] = "The casting success for spells from selected schools is 99%"
skills(i,akt_spieler)\beschreibung_1[3] = "La probabilidad de hechizar con exito de las escuelas es 99%"
skills(i,akt_spieler)\beschreibung_2[2] = "(statt 50% + 5% pro Anwendung) (Unwirksam bei Scrollwissen+Freie Magie)"
skills(i,akt_spieler)\beschreibung_2[1] = "(instead of 50% + 5% per casting) (Not for Scroll Lore + Free Magic)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Normalmente es 50% y aumenta en un 5% por hechizo lanzado con exito)"

i = #CE_ALTE_MAGIE
skills(i,akt_spieler)\name[2] = "Alte Magie"
skills(i,akt_spieler)\name[1] = "Elder Magic"
skills(i,akt_spieler)\name[3] = "Magia Antigua"
skills(i,akt_spieler)\nummer = #CE_ALTE_MAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 4
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber kosten einen Manapunkt weniger (min.1)"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells cost 1 less Mana Point (min.1)"
skills(i,akt_spieler)\beschreibung_1[3] = "Los hechizos cuestan 1 punto menos de Mana (min.1)"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_MAGIERESISTENZ
skills(i,akt_spieler)\name[2] = "Magieresistenz"
skills(i,akt_spieler)\name[1] = "Magic Resistance"
skills(i,akt_spieler)\name[3] = "Resistencia a la Magia"
skills(i,akt_spieler)\nummer = #CE_MAGIERESISTENZ
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Mit 70% Resistenz gegen feindliche Magie"
skills(i,akt_spieler)\beschreibung_1[1] = "70% Resistance against hostile magic"
skills(i,akt_spieler)\beschreibung_1[3] = "70% Resistencia ante magia hostil"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_ALCHEMIE
skills(i,akt_spieler)\name[2] = "Alchemie"
skills(i,akt_spieler)\name[1] = "Alchemy"
skills(i,akt_spieler)\name[3] = "Alquimia"
skills(i,akt_spieler)\nummer = #CE_ALCHEMIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Zaubertränke aus Pilzen brauen und Tränke mischen"
skills(i,akt_spieler)\beschreibung_1[1] = "Create potions from mushrooms and mix potions"
skills(i,akt_spieler)\beschreibung_1[3] = "Crear pociones de hongos y mezclar pociones"
skills(i,akt_spieler)\beschreibung_2[2] = "(Startet mit 5 Pilzen)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Starts with 5 mushrooms)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Empiece con 5 hongos)"

i = #CE_THAUMATURGIE
skills(i,akt_spieler)\name[2] = "Thaumaturgie"
skills(i,akt_spieler)\name[1] = "Thaumaturgy"
skills(i,akt_spieler)\name[3] = "Taumaturgia"
skills(i,akt_spieler)\nummer = #CE_THAUMATURGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Erlaubt die Herstellung von Zauberstäben aus Edelsteinen"
skills(i,akt_spieler)\beschreibung_1[1] = "Allows the creation of spell wands from gems"
skills(i,akt_spieler)\beschreibung_1[3] = "Permite crear varitas magicas con gemas"
skills(i,akt_spieler)\beschreibung_2[2] = "(Startet mit 5 Edelsteinen oder Stäben)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Starts with 5 Gems or Wands)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Empiece con 5 Piedras Preciosas)"

i = #CE_ZAUBERN_IN_RUESTUNG
skills(i,akt_spieler)\name[2] = "Zaubern in Rüstung"
skills(i,akt_spieler)\name[1] = "Casting in Armor"
skills(i,akt_spieler)\name[3] = "Hechizar con Armadura"
skills(i,akt_spieler)\nummer = #CE_ZAUBERN_IN_RUESTUNG
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Kein Abzug beim Zaubern durch Rüstungen"
skills(i,akt_spieler)\beschreibung_1[1] = "No reduction to spellcasting ability when wearing armor"
skills(i,akt_spieler)\beschreibung_1[3] = "No se reduce la habilidad de hechizar al llevar armadura"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_BLUTMAGIE
skills(i,akt_spieler)\name[2] = "Blutmagie"
skills(i,akt_spieler)\name[1] = "Blood Magic"
skills(i,akt_spieler)\name[3] = "Magia Sangrienta"
skills(i,akt_spieler)\nummer = #CE_BLUTMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Grad deiner Verwundung erhöht deine Zauberkraft"
skills(i,akt_spieler)\beschreibung_1[1] = "The more you are hurt the more Spell Power you have."
skills(i,akt_spieler)\beschreibung_1[3] = "Cuanto mas herido estes mas poder tienen tus hechizos."
skills(i,akt_spieler)\beschreibung_2[2] = "(LP/2 -> Zauberkraft*2, LP/3 -> Zauberkraft*3, LP/5 -> Zauberkraft*5)"
skills(i,akt_spieler)\beschreibung_2[1] = "(LP/2 -> Spell Power*2, LP/3 -> Spell Power*3, LP/5 -> Spell Power*5)"
skills(i,akt_spieler)\beschreibung_2[3] = "(PdV/2 -> Poder*2, PdV/3 -> Poder*3, PdV/5 -> Poder*5)"

i = #CE_ZAUBERSCHRIFT
skills(i,akt_spieler)\name[2] = "Zauberschrift"
skills(i,akt_spieler)\name[1] = "Arcane Writings"
skills(i,akt_spieler)\name[3] = "Escritos Secretos"
skills(i,akt_spieler)\nummer = #CE_ZAUBERSCHRIFT
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit dem Libram der tausend Zauber und 5 Schriftrollen"
skills(i,akt_spieler)\beschreibung_1[1] = "Start the game with the Libram of Thousand Spells and 5 magic scrolls"
skills(i,akt_spieler)\beschreibung_1[3] = "Empieza el juego con el Codice de los Mil Hechizos y 5 pergaminos magicos"
skills(i,akt_spieler)\beschreibung_2[2] = "(Dieser kann eine Schriftrolle pro Level erzeugen)"
skills(i,akt_spieler)\beschreibung_2[1] = "(It can produce one scroll per level)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Puede crear un pergamino por nivel)"
skills(i,akt_spieler)\unique = 1

i = #CE_STERNENMAGIE
skills(i,akt_spieler)\name[2] = "Sternenmagie"
skills(i,akt_spieler)\name[1] = "Star Magic"
skills(i,akt_spieler)\name[3] = "Magia Estelar"
skills(i,akt_spieler)\nummer = #CE_STERNENMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Sterne und der Himmelskörper"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of the stars and the heavenly bodies"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos de las estrellas y los cuerpos celestes"
skills(i,akt_spieler)\beschreibung_2[2] = "(Die besten Lichtzauber, Sternenfeuer, Sternenfee beschwören)"
skills(i,akt_spieler)\beschreibung_2[1] = "(The best light spells, Starfire, Summon Starfaerie)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Los mejores hechizos de luz, Fuego de las Estrellas, Hada de las Estrellas)"

i = #CE_ILLUSIONSMAGIE
skills(i,akt_spieler)\name[2] = "Illusionsmagie"
skills(i,akt_spieler)\name[1] = "Illusion Magic"
skills(i,akt_spieler)\name[3] = "Ilusionismo"
skills(i,akt_spieler)\nummer = #CE_ILLUSIONSMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Illusion und der Täuschung"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of illusion and deception"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos de ilusion y confusión"
skills(i,akt_spieler)\beschreibung_2[2] = "(Verschwinden, Doppelgänger, Unsichtbarkeit)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Vanish, Doppelganger, Invisibility)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Desvanecerse, Gemelo, Invisibilidad)"

i = #CE_WARLOCK
skills(i,akt_spieler)\name[2] = "Warlock"
skills(i,akt_spieler)\name[1] = "Warlock"
skills(i,akt_spieler)\name[3] = "Arsenal"
skills(i,akt_spieler)\nummer = #CE_WARLOCK
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber des Krieges und der Kampfmagie"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of warfare and combat magic"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos de guerra y magia combativa"
skills(i,akt_spieler)\beschreibung_2[2] = "(Magische Rüstungen+Waffen, Mentalschlag, Unverwundbarkeit)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Magical Weapons+Armor, Mentalbolt, Invulnerability)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Armaduras+Armas magicas, Rayo Mental, Invulnerabilidad)"

i = #CE_WEISSE_MAGIE
skills(i,akt_spieler)\name[2] = "Weisse Magie"
skills(i,akt_spieler)\name[1] = "White Magic"
skills(i,akt_spieler)\name[3] = "Magia Blanca"
skills(i,akt_spieler)\nummer = #CE_WEISSE_MAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Heilung und des Schutzes"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of healing and protection"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos de curación y protección"
skills(i,akt_spieler)\beschreibung_2[2] = "(Untote bannen, Andere heilen, Engel)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Banish Undead, Heal Others, Angel)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Ahuyentar No-Muertos, Curar Otros, Angelito)"

i = #CE_SCHWARZE_MAGIE
skills(i,akt_spieler)\name[2] = "Schwarze Magie"
skills(i,akt_spieler)\name[1] = "Black Magic"
skills(i,akt_spieler)\name[3] = "Magia Negra"
skills(i,akt_spieler)\nummer = #CE_SCHWARZE_MAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber des Todes und der Zerstörung"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of death and destruction"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos de muerte y destrucción"
skills(i,akt_spieler)\beschreibung_2[2] = "(Dunkles Mana, Dämon, Wort des Todes)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Dark Mana, Demon, Word of Death)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Mana Oscuro, Demonio, Palabra de Muerte)"

i = #CE_FEUERMAGIE
skills(i,akt_spieler)\name[2] = "Feuermagie"
skills(i,akt_spieler)\name[1] = "Fire Magic"
skills(i,akt_spieler)\name[3] = "Magia de Fuego"
skills(i,akt_spieler)\nummer = #CE_FEUERMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Hitze und des Feuers"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of the realm of fire"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos del reino del fuego"
skills(i,akt_spieler)\beschreibung_2[2] = "(Funke, Feuerball, Flammenmeer)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Spark, Fireball, Sea of Flames)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Chispa, Bola de Fuego, Mar de Fuego)"

i = #CE_WASSERMAGIE
skills(i,akt_spieler)\name[2] = "Wassermagie"
skills(i,akt_spieler)\name[1] = "Water Magic"
skills(i,akt_spieler)\name[3] = "Magia de Agua"
skills(i,akt_spieler)\nummer = #CE_WASSERMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Flüsse und des Wassers"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of the realm of water"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos del reino del agua"
skills(i,akt_spieler)\beschreibung_2[2] = "(Erfrischung, Dehydration, Flutwelle)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Refresh, Dehydration, Tidal Wave)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Refrescar, Deshidratación, Ola de la Marea)"

i = #CE_ERDMAGIE
skills(i,akt_spieler)\name[2] = "Erdmagie"
skills(i,akt_spieler)\name[1] = "Earth Magic"
skills(i,akt_spieler)\name[3] = "Magia de Tierra"
skills(i,akt_spieler)\nummer = #CE_ERDMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber des Gesteins und der Erde"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of the realm of the earth"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos del reino de la tierra"
skills(i,akt_spieler)\beschreibung_2[2] = "(Portal, Fallensinn, Versteinern)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Portal, Trap Sense, Petrify)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Portal, Sentir Trampas, Petrificar)"

i = #CE_LUFTMAGIE
skills(i,akt_spieler)\name[2] = "Luftmagie"
skills(i,akt_spieler)\name[1] = "Air Magic"
skills(i,akt_spieler)\name[3] = "Magia de Aire"
skills(i,akt_spieler)\nummer = #CE_LUFTMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Winde und der Stürme"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of the realm of the air"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos del reino del aire"
skills(i,akt_spieler)\beschreibung_2[2] = "(Federfall, Rückenwind, Fliegen)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Featherfall, Helpful Winds, Flying)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Peso Pluma, Vientos Amigos, Volar)"

i = #CE_DRUIDENMAGIE
skills(i,akt_spieler)\name[2] = "Druidenmagie" 
skills(i,akt_spieler)\name[1] = "Druid Magic"
skills(i,akt_spieler)\name[3] = "Magia de Druida"
skills(i,akt_spieler)\nummer = #CE_DRUIDENMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Wälder und der Natur"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of the realm of nature"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos del reino de la naturaleza"
skills(i,akt_spieler)\beschreibung_2[2] = "(Magic Apple, Tiere bannen, Wolfsform)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Magic Apple, Banish Animals, Form of the Wolf)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Manazana Magica, Ahuyentar Animales, Forma de Lobo)"

i = #CE_HEXEREI
skills(i,akt_spieler)\name[2] = "Hexerei" 
skills(i,akt_spieler)\name[1] = "Witchcraft"
skills(i,akt_spieler)\name[3] = "Brujeria"
skills(i,akt_spieler)\nummer = #CE_HEXEREI
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber der Kontrolle und Verfluchung"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells of control and cursing"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos de control y maldición"
skills(i,akt_spieler)\beschreibung_2[2] = "(Blitze werfen, Vergiften, Tiger beschwören)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Throw Lightning, Poison, Summon Tiger)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Relampago, Envenenar, Conjurar Tigre)"

i = #CE_HOHE_MAGIE
skills(i,akt_spieler)\name[2] = "Hohe Magie"
skills(i,akt_spieler)\name[1] = "High Magic"
skills(i,akt_spieler)\name[3] = "Alta Magia"
skills(i,akt_spieler)\nummer = #CE_HOHE_MAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Zauber, die die Magie selbst beeinflussen"
skills(i,akt_spieler)\beschreibung_1[1] = "All spells which influence magic itself"
skills(i,akt_spieler)\beschreibung_1[3] = "Hechizos que influyen en la magia"
skills(i,akt_spieler)\beschreibung_2[2] = "(Nexus Finden, Nexus, Metamagie)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Find Nexus, Nexus, Metamagic)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Encontrar Nexo, Nexo, Meta Magia)"

i = #CE_ZAUBERLIEDER
skills(i,akt_spieler)\name[2] = "Zauberlieder"
skills(i,akt_spieler)\name[1] = "Spellsongs"
skills(i,akt_spieler)\name[3] = "Canciones Magicas"
skills(i,akt_spieler)\nummer = #CE_ZAUBERLIEDER
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Magische Lieder der Barden (brauchen weder Mana noch Zaubermacht)"
skills(i,akt_spieler)\beschreibung_1[1] = "Magic songs of the Bards (need neither Mana nor Might)"
skills(i,akt_spieler)\beschreibung_1[3] = "Canciones magicas de los Bardos"
skills(i,akt_spieler)\beschreibung_2[2] = "(Reise: +1 Bewegung, Einsamkeit: Keine Hinterhalte, Magie: Keine Runenfallen)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Travel: +1 Movement, Loneliness: No Ambushes, Magic: No Rune Traps)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Viaje: +1 Velocidad, Soledad: No Emboscadas, Magia: No Trampas Runas)"

i = #CE_BESTAENDIGKEIT
skills(i,akt_spieler)\name[2] = "Beständige Magie"
skills(i,akt_spieler)\name[1] = "Stable Magic"
skills(i,akt_spieler)\name[3] = "Magia Persistente"
skills(i,akt_spieler)\nummer = #CE_BESTAENDIGKEIT
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Spruchdauer doppelt so lange"
skills(i,akt_spieler)\beschreibung_1[1] = "Doubles the duration of spells"
skills(i,akt_spieler)\beschreibung_1[3] = "Doble duración de hechizos"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_ELEMENTARMAGIE
skills(i,akt_spieler)\name[2] = "Elementarmagie"
skills(i,akt_spieler)\name[1] = "Elementary Magic"
skills(i,akt_spieler)\name[3] = "Magia de los Elementos"
skills(i,akt_spieler)\nummer = #CE_ELEMENTARMAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 6
skills(i,akt_spieler)\beschreibung_1[2] = "Erd, Feuer, Luft und Wassermagie"
skills(i,akt_spieler)\beschreibung_1[1] = "Air, Earth, Fire and Water magic"
skills(i,akt_spieler)\beschreibung_1[3] = "Magia de Aire, Tierra, Fuego y Aqua"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_ZAUBERFUERST
skills(i,akt_spieler)\name[2] = "Zauberfürst"
skills(i,akt_spieler)\name[1] = "Mage Lord"
skills(i,akt_spieler)\name[3] = "Rey Mago"
skills(i,akt_spieler)\nummer = #CE_ZAUBERFUERST
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\unique = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Spieler erhalten +2 Zauberkraft"
skills(i,akt_spieler)\beschreibung_1[1] = "All players get +2 Spell Power"
skills(i,akt_spieler)\beschreibung_1[3] = "Todos jugadores reciben Poder de Hechizos +2"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SCROLLORE
skills(i,akt_spieler)\name[2] = "Scrollwissen"
skills(i,akt_spieler)\name[1] = "Scroll Lore"
skills(i,akt_spieler)\name[3] = "Rata de biblioteca"
skills(i,akt_spieler)\nummer = #CE_SCROLLORE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Ermöglicht erlernen von "+str(#Allowed_scroll_lore)+" Zaubern von Schriftrollen."
skills(i,akt_spieler)\beschreibung_1[1] = "Learn up to "+str(#Allowed_scroll_lore)+" spells from scrolls"
skills(i,akt_spieler)\beschreibung_1[3] = "Puedes aprender "+str(#Allowed_scroll_lore)+" hechizos de pergaminos"
skills(i,akt_spieler)\beschreibung_2[2] = "(Max Level eigener Zirkel -2)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Max Level: current Spell Circle -2)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Max Nivel: actual Círculo de Hechizos -2)"

i = #CE_FREIE_MAGIE
skills(i,akt_spieler)\name[2] = "Freie Magie"
skills(i,akt_spieler)\name[1] = "Free Magic"
skills(i,akt_spieler)\name[3] = "Magia Libre"
skills(i,akt_spieler)\nummer = #CE_FREIE_MAGIE
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 4
skills(i,akt_spieler)\beschreibung_1[2] = "Ermöglicht das lernen beliebiger Zauber aller Schulen"
skills(i,akt_spieler)\beschreibung_1[1] = "Allows you to learn spells from all spell schools,"
skills(i,akt_spieler)\beschreibung_1[3] = "Permite aprender hechizos de todas las escuelas"
skills(i,akt_spieler)\beschreibung_2[2] = "Allerdings nur einen pro Zirkel"
skills(i,akt_spieler)\beschreibung_2[1] = "but only one per Spell Circle"
skills(i,akt_spieler)\beschreibung_2[3] = "Pero solo uno por Círculo de Hechizos"

i = #CE_ZAUBERWEBEN
skills(i,akt_spieler)\name[2] = "Zauberweben"
skills(i,akt_spieler)\name[1] = "Spellweaving"
skills(i,akt_spieler)\name[3] = "Fortificar Hechizos"
skills(i,akt_spieler)\nummer = #CE_ZAUBERWEBEN
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 3
skills(i,akt_spieler)\beschreibung_1[2] = "Je mehr Mana der Magier einsetzt desto"
skills(i,akt_spieler)\beschreibung_1[1] = "The more Mana the mage invests the"
skills(i,akt_spieler)\beschreibung_1[3] = "Cuanto mas Mana invierta el mago,"
skills(i,akt_spieler)\beschreibung_2[2] = "stärker sind seine Sprüche"
skills(i,akt_spieler)\beschreibung_2[1] = "stronger his spells are"
skills(i,akt_spieler)\beschreibung_2[3] = "mas fuertes seran sus hechizos"

i = #CE_BESCHWOERER
skills(i,akt_spieler)\name[2] = "Beschwörer"
skills(i,akt_spieler)\name[1] = "Summoner"
skills(i,akt_spieler)\name[3] = "Conjurador"
skills(i,akt_spieler)\nummer = #CE_BESCHWOERER
skills(i,akt_spieler)\gruppe = 3
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[1] = "All summon creature spells+(enchant/heal creatures)"
skills(i,akt_spieler)\beschreibung_2[1] = "Creatures inherit skills from summoner"
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Beschwörungszauber+(Kreatur heilen/verstärken)"
skills(i,akt_spieler)\beschreibung_2[2] = "Kreaturen übernehmen Fertigkeiten des Beschwörers"
skills(i,akt_spieler)\beschreibung_1[3] = "Todos los hechizos de conjuración(curar criatura)"
skills(i,akt_spieler)\beschreibung_2[3] = "Criaturas copian abilidad del conjurador"

; ----------------------------------------------------------------------------------------

i = #CE_WEG_DER_SCHATTEN
skills(i,akt_spieler)\name[1] = "Way of Shadows"
skills(i,akt_spieler)\name[2] = "Weg der Schatten"
skills(i,akt_spieler)\name[3] = "Camino de las Sombras"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_FALLENKUNDE
skills(i,akt_spieler)\name[2] = "Fallenkunde" 
skills(i,akt_spieler)\name[1] = "Trap Lore"
skills(i,akt_spieler)\name[3] = "Conocimiento de Trampas"
skills(i,akt_spieler)\nummer = #CE_FALLENKUNDE
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Automatisches Entschärfen von entdeckten Fallen"
skills(i,akt_spieler)\beschreibung_1[1] = "Detected traps are automatically disarmed"
skills(i,akt_spieler)\beschreibung_1[3] = "Las trampas detectadas se desactivan automáticamente"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_WAHRNEHMUNG
skills(i,akt_spieler)\name[2] = "Wahrnehmung" 
skills(i,akt_spieler)\name[1] = "Perception"
skills(i,akt_spieler)\name[3] = "Percepción"
skills(i,akt_spieler)\nummer = #CE_WAHRNEHMUNG
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Wahrnehmung: 4 (normalerweise 1)"
skills(i,akt_spieler)\beschreibung_1[1] = "Perception: 4 (normally 1)"
skills(i,akt_spieler)\beschreibung_1[3] = "Percepción: 4 (normalmente 1)"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_NACHTSICHT
skills(i,akt_spieler)\name[2] = "Nachtsicht" 
skills(i,akt_spieler)\name[1] = "Night Vision"
skills(i,akt_spieler)\name[3] = "Visión Nocturna"
skills(i,akt_spieler)\nummer = #CE_NACHTSICHT
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Sichtradius +2 Feld"
skills(i,akt_spieler)\beschreibung_1[1] = "Sight radius +2"
skills(i,akt_spieler)\beschreibung_1[3] = "Radio de visión incrementado en +2"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SCHNELLIGKEIT
skills(i,akt_spieler)\name[2] = "Schnelligkeit" 
skills(i,akt_spieler)\name[1] = "Speed"
skills(i,akt_spieler)\name[3] = "Velocidad"
skills(i,akt_spieler)\nummer = #CE_SCHNELLIGKEIT
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Schnelligkeit: 11 (normalerweise 7)"
skills(i,akt_spieler)\beschreibung_1[1] = "Speed: 11 (normally 7)"
skills(i,akt_spieler)\beschreibung_1[3] = "Velocidad: 11 (normalmente 7)"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SCHLEICHEN
skills(i,akt_spieler)\name[2] = "Schleichen" 
skills(i,akt_spieler)\name[1] = "Stealth"
skills(i,akt_spieler)\name[3] = "Furtivo"
skills(i,akt_spieler)\nummer = #CE_SCHLEICHEN
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "An Monstern vorbeischleichen"
skills(i,akt_spieler)\beschreibung_1[1] = "Sneak by monsters"
skills(i,akt_spieler)\beschreibung_1[3] = "Escabullirse de los monstruos"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=Glück*5%+Geschicklichkeit*10%+25%-Monsterlevel)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=Luck*5%+Dexterity*10%+25%-Monster Level)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Chance=Suerte*5%+Destreza*10%+25%-Nivel del Monstruo)"

i = #CE_SCHLOESSER_OEFFNEN
skills(i,akt_spieler)\name[2] = "Schlösser öffnen"
skills(i,akt_spieler)\name[1] = "Pick Locks"
skills(i,akt_spieler)\name[3] = "Cerrajero"
skills(i,akt_spieler)\nummer = #CE_SCHLOESSER_OEFFNEN
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Öffnet jede Tür automatisch"
skills(i,akt_spieler)\beschreibung_1[1] = "You open every door with ease"
skills(i,akt_spieler)\beschreibung_1[3] = "Puedes forzar las puertas"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_DIEBSTAHL
skills(i,akt_spieler)\name[2] = "Diebstahl" 
skills(i,akt_spieler)\name[1] = "Thievery"
skills(i,akt_spieler)\name[3] = "Ladrón"
skills(i,akt_spieler)\nummer = #CE_DIEBSTAHL
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "2 mal pro Ebene bestimmte Monster bestehlen"
skills(i,akt_spieler)\beschreibung_1[1] = "You can steal from certain monsters two times per level"
skills(i,akt_spieler)\beschreibung_1[3] = "Puedes robar 2 veces por nivel a algunos monstruos"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=Geschicklichkeit*8%+Glück*6%)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=Dexterity*8%+Luck*6%)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Chance=Suerte*8%+Destreza*6%)"

i = #CE_ASSASSINE
skills(i,akt_spieler)\name[2] = "Assassine"
skills(i,akt_spieler)\name[1] = "Assassination"
skills(i,akt_spieler)\name[3] = "Asesino"
skills(i,akt_spieler)\nummer = #CE_ASSASSINE
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Doppelte Chance für kritischen Treffer im Nahkampf. Max 45%"
skills(i,akt_spieler)\beschreibung_1[1] = "Percentage for critical hits in close combat doubled. Max 45%"
skills(i,akt_spieler)\beschreibung_1[3] = "Porcentage de golpe crítico duplicado con armas de filo. Max 45%"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=(Geschicklichkeit+Glück)*2% + Waffe)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=(Dexterity+Luck)*2% + Weapon)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Chance=(Destreza+Suerte)*2% + Arma)"

i = #CE_GEFAHREN_SPUEREN
skills(i,akt_spieler)\name[2] = "Gefahren spüren"
skills(i,akt_spieler)\name[1] = "Danger Sense"
skills(i,akt_spieler)\name[3] = "Percepción de Peligros"
skills(i,akt_spieler)\nummer = #CE_GEFAHREN_SPUEREN
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+70% Fallen finden. 50% weniger Hinterhalte"
skills(i,akt_spieler)\beschreibung_1[1] = "+70% Find Traps. 50% less ambushes"
skills(i,akt_spieler)\beschreibung_1[3] = "+70% Encontrar Trampas. 50% menos emboscadas"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KUNDSCHAFTER
skills(i,akt_spieler)\name[2] = "Spion"
skills(i,akt_spieler)\name[1] = "Spy"
skills(i,akt_spieler)\name[3] = "Espía"
skills(i,akt_spieler)\nummer = #CE_KUNDSCHAFTER
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\unique = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Spieler erhalten +2 Zugweite"
skills(i,akt_spieler)\beschreibung_1[1] = "All players get +2 Movement"
skills(i,akt_spieler)\beschreibung_1[3] = "Todos jugadores reciben Velocidad +2"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SCHATZJAEGER
skills(i,akt_spieler)\name[2] = "Schatzjäger"
skills(i,akt_spieler)\name[1] = "Treasure Hunter"
skills(i,akt_spieler)\name[3] = "Cazador de Tesoros"
skills(i,akt_spieler)\nummer = #CE_SCHATZJAEGER
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Sieht Schätze ausserhalb Sichtweite und findet alle verborgenen Schätze"
skills(i,akt_spieler)\beschreibung_1[1] = "Sees treasures outside sight radius and finds all hidden treasures"
skills(i,akt_spieler)\beschreibung_1[3] = "Ve tesoros afuera de su vista y encuentra todos tesoros escondidos"
skills(i,akt_spieler)\beschreibung_2[2] = "(Startet mit Schaufel, 3 Schlüsseln und Peitsche) Er zerbricht keine Schaufel"
skills(i,akt_spieler)\beschreibung_2[1] = "(Starts with shovel, 3 keys and whip) Shovels never break"
skills(i,akt_spieler)\beschreibung_2[3] = "(Empiece con pala, 3 llaves y latigo)"

i = #CE_ERDE_SPUEREN
skills(i,akt_spieler)\name[2] = "Erde spüren"
skills(i,akt_spieler)\name[1] = "Sense Earth"
skills(i,akt_spieler)\name[3] = "Sentir la Tierra"
skills(i,akt_spieler)\nummer = #CE_ERDE_SPUEREN
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Sieht auch Mauern ausserhalb des Sichtradiuses"
skills(i,akt_spieler)\beschreibung_1[1] = "Sees walls outside sight radius"
skills(i,akt_spieler)\beschreibung_1[3] = "Ves paredes fuera de tu vista"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_MONSTER_SPUEREN
skills(i,akt_spieler)\name[2] = "Monster spüren"
skills(i,akt_spieler)\name[1] = "Monstersense"
skills(i,akt_spieler)\name[3] = "Sentir Monstruos"
skills(i,akt_spieler)\nummer = #CE_MONSTER_SPUEREN
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Sieht auch Monster ausserhalb des Sichtradiuses"
skills(i,akt_spieler)\beschreibung_1[1] = "Sees monsters outside sight radius"
skills(i,akt_spieler)\beschreibung_1[3] = "Ves monstruos fuera de tu vista"
skills(i,akt_spieler)\beschreibung_2[2] = "Kann auch unsichbare Monster spüren"
skills(i,akt_spieler)\beschreibung_2[1] = "Can detect invisible creatures"
skills(i,akt_spieler)\beschreibung_2[3] = "Puede idendificar monstruos invisibles"

i = #CE_CANNIBAL
skills(i,akt_spieler)\name[2] = "Kannibale"
skills(i,akt_spieler)\name[1] = "Cannibal"
skills(i,akt_spieler)\name[3] = "Caníbal"
skills(i,akt_spieler)\nummer = #CE_CANNIBAL
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 3
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Besiegte humanoide Gegner hinterlassen mit 60%"
skills(i,akt_spieler)\beschreibung_1[1] = "Killed humanoids leave (with 60% chance) blood"
skills(i,akt_spieler)\beschreibung_1[3] = "Humanoides matados dejan con 60% chance sangre"
skills(i,akt_spieler)\beschreibung_2[2] = "Menschenfleisch oder Blut. Muß Ausgestossen sein!"
skills(i,akt_spieler)\beschreibung_2[1] = "or human meat behind. Has to be outcast!"
skills(i,akt_spieler)\beschreibung_2[3] = "o carne. Tiene que estar abandonado!"

i = #CE_UNDEAD
skills(i,akt_spieler)\name[2] = "Untot"
skills(i,akt_spieler)\name[1] = "Undead"
skills(i,akt_spieler)\name[3] = "No muerto"
skills(i,akt_spieler)\nummer = #CE_UNDEAD
skills(i,akt_spieler)\gruppe = 4
skills(i,akt_spieler)\kosten = 4
skills(i,akt_spieler)\beschreibung_1[2] = "Braucht weder Nahrung noch Wasser"
skills(i,akt_spieler)\beschreibung_1[1] = "Does not need food and water"
skills(i,akt_spieler)\beschreibung_1[3] = "No necesita comida y aqua"
skills(i,akt_spieler)\beschreibung_2[2] = "Muß Ausgestoßen sein!"
skills(i,akt_spieler)\beschreibung_2[1] = "Has to be outcast!"
skills(i,akt_spieler)\beschreibung_2[3] = "Tiene que estar abandonado!"

; ----------------------------------------------------------------------------------

i = #CE_WEG_DER_ABENTEUER
skills(i,akt_spieler)\name[2] = "Weg der Abenteuer"
skills(i,akt_spieler)\name[1] = "Way of Adventure"
skills(i,akt_spieler)\name[3] = "Camino de la Aventura"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_GLUECK
skills(i,akt_spieler)\name[2] = "Glück" 
skills(i,akt_spieler)\name[1] = "Luck"
skills(i,akt_spieler)\name[3] = "Suerte"
skills(i,akt_spieler)\nummer = #CE_GLUECK
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Glück: 4 (normalerweise 1)"
skills(i,akt_spieler)\beschreibung_1[1] = "Luck: 4 (normally 1)"
skills(i,akt_spieler)\beschreibung_1[3] = "Suerte: 4 (normalmente 1)"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_GIFTRESISTENZ
skills(i,akt_spieler)\name[2] = "Giftresistenz" 
skills(i,akt_spieler)\name[1] = "Poison Resistance"
skills(i,akt_spieler)\name[3] = "Resistencia al Veneno"
skills(i,akt_spieler)\nummer = #CE_GIFTRESISTENZ
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Du erholst dich doppelt so schnell von Gift"
skills(i,akt_spieler)\beschreibung_1[1] = "You recover twice as fast from poison"
skills(i,akt_spieler)\beschreibung_1[3] = "Te mejoras con doble velocidad de venenos"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_HEILKUNDE
skills(i,akt_spieler)\name[2] = "Heilkunde"
skills(i,akt_spieler)\name[1] = "First Aid"
skills(i,akt_spieler)\name[3] = "Primeros Auxilios"
skills(i,akt_spieler)\nummer = #CE_HEILKUNDE
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Heilt alle Wunden beim Betreten einer neuen Ebene"
skills(i,akt_spieler)\beschreibung_1[1] = "Heals all wounds when entering a new level"
skills(i,akt_spieler)\beschreibung_1[3] = "Curas todas las heridas al empezar un nivel"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KARTOGRAPHIE
skills(i,akt_spieler)\name[2] = "Kartographie"
skills(i,akt_spieler)\name[1] = "Cartography"
skills(i,akt_spieler)\name[3] = "Cartografia"
skills(i,akt_spieler)\nummer = #CE_KARTOGRAPHIE
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit einer Karte"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts the game with a map"
skills(i,akt_spieler)\beschreibung_1[3] = "Empiezas el juego con un mapa"
skills(i,akt_spieler)\beschreibung_2[2] = "(Diese zeigt immer den aktuellen Level)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Always shows the actual level)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Siempre muestra el nivel actual)"

i = #CE_SPELUNKER
skills(i,akt_spieler)\name[2] = "Spelunker"
skills(i,akt_spieler)\name[1] = "Spelunker"
skills(i,akt_spieler)\name[3] = "Viajero"
skills(i,akt_spieler)\nummer = #CE_SPELUNKER
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit Lampe, Öl, Seil"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts with lamp, oil, rope, shovel and pickaxe"
skills(i,akt_spieler)\beschreibung_1[3] = "Empiezas con lampara, aceite, cuerda, "
skills(i,akt_spieler)\beschreibung_2[2] = "Schaufel und Spitzhacke"
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = "pala y pico"

i = #CE_ERBSCHAFT
skills(i,akt_spieler)\name[2] = "Erbschaft"
skills(i,akt_spieler)\name[1] = "Heirloom"
skills(i,akt_spieler)\name[3] = "Herencia"
skills(i,akt_spieler)\nummer = #CE_ERBSCHAFT
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit 1000 Gold"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts with 1,000 gold"
skills(i,akt_spieler)\beschreibung_1[3] = "Empiezas con 1000 monedas de oro"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_UDJAT
skills(i,akt_spieler)\name[2] = "Udjat-Auge"
skills(i,akt_spieler)\name[1] = "Udjat Eye"
skills(i,akt_spieler)\name[3] = "Ojo de Udjat"
skills(i,akt_spieler)\nummer = #CE_UDJAT
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\unique = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit einem Udjat-Auge mit 3 Ladungen."
skills(i,akt_spieler)\beschreibung_1[1] = "Starts with an Udjat Eye and 3 charges."
skills(i,akt_spieler)\beschreibung_1[3] = "Empiezas con un Ojo de Udjat y 3 cargas."
skills(i,akt_spieler)\beschreibung_2[2] = "(Jede gibt einen zusätzlichen Erfahrungsgewinn)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Each charge provides an additional experience gain)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Una avance mas de experiencia cada uno)"

i = #CE_WEISHEIT
skills(i,akt_spieler)\name[2] = "Weisheit"
skills(i,akt_spieler)\name[1] = "Wisdom"
skills(i,akt_spieler)\name[3] = "Sabiduría"
skills(i,akt_spieler)\nummer = #CE_WEISHEIT
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Ein zusätzlicher Erfahrungsgewinn alle 4 Levels"
skills(i,akt_spieler)\beschreibung_1[1] = "Provides an additional experience gain every 4 dungeon levels"
skills(i,akt_spieler)\beschreibung_1[3] = "Produce un gano de experiencia adicional cada 4 niveles"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_RINGMEISTERUNG
skills(i,akt_spieler)\name[2] = "Ringmeisterung"
skills(i,akt_spieler)\name[1] = "Ringmastery"
skills(i,akt_spieler)\name[3] = "Maestro de Anillos"
skills(i,akt_spieler)\nummer = #CE_RINGMEISTERUNG
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Beliebig viele Ringe gleichzeitig tragen."
skills(i,akt_spieler)\beschreibung_1[1] = "You can wear all rings at the same time."
skills(i,akt_spieler)\beschreibung_1[3] = "Puedes ponerte todos anillos al mismo tiempo."
skills(i,akt_spieler)\beschreibung_2[2] = "Fängt mit einem Ring an"
skills(i,akt_spieler)\beschreibung_2[1] = "Starts with a ring"
skills(i,akt_spieler)\beschreibung_2[3] = "Empiezas con un Anillo"

i = #CE_MYSTISCHE_ATTACKE
skills(i,akt_spieler)\name[2] = "Mystische Attacke"
skills(i,akt_spieler)\name[1] = "Mystic Attack"
skills(i,akt_spieler)\name[3] = "Ataque Místico"
skills(i,akt_spieler)\nummer = #CE_MYSTISCHE_ATTACKE
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Mentaler Schlag die dir und einem Monster Schaden zufügt"
skills(i,akt_spieler)\beschreibung_1[1] = "Mental attack that damages you and a monster"
skills(i,akt_spieler)\beschreibung_1[3] = "Ataque Mental que te daña a ti y a un monstruo"
skills(i,akt_spieler)\beschreibung_2[2] = "(Kostet einen LP und macht level-level*5 Schaden)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Costs a Life Point and does level-level*5 Damage)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Cuesta un PdV y hace nivel-nivel*5 daño)"

i = #CE_UEBERLEBEN
skills(i,akt_spieler)\name[2] = "Überlebenskünstler"
skills(i,akt_spieler)\name[1] = "Survival Expert"
skills(i,akt_spieler)\name[3] = "Supervivencia"
skills(i,akt_spieler)\nummer = #CE_UEBERLEBEN
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Nährwert aller Lebensmittel verdoppelt. Findet mit 10% Nahrung"
skills(i,akt_spieler)\beschreibung_1[1] = "Value of all food is doubled. 10% chance to find food"
skills(i,akt_spieler)\beschreibung_1[3] = "Valor de todos los alimentos cuenta doble. Encuentras comida en cada"
skills(i,akt_spieler)\beschreibung_2[2] = " bei erschlagenen Tieren. Beginnt mit Angel und Fallenwerkzeug"
skills(i,akt_spieler)\beschreibung_2[1] = "with each slain animal. Starts with a Fishing Rod and Trap Toolkit"
skills(i,akt_spieler)\beschreibung_2[3] = " animal con 10%. Empiezas con caña de pescar y herramientas para trampas"

i = #CE_HAENDLER
skills(i,akt_spieler)\name[2] = "Händler"
skills(i,akt_spieler)\name[1] = "Merchant"
skills(i,akt_spieler)\name[3] = "Comerciante"
skills(i,akt_spieler)\nummer = #CE_HAENDLER
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Beim erreichen einer neuen Ebene 20% einen Händler "
skills(i,akt_spieler)\beschreibung_1[1] = "20% chance to meet a merchant when you reach a new level"
skills(i,akt_spieler)\beschreibung_1[3] = "Cuando entras en un nuevo nivel tienes 20% para encontrarte"
skills(i,akt_spieler)\beschreibung_2[2] = "zu treffen"
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = "a un comerciante"

i = #CE_VISIONEN
skills(i,akt_spieler)\name[2] = "Visionen"
skills(i,akt_spieler)\name[1] = "Visions"
skills(i,akt_spieler)\name[3] = "Visiones"
skills(i,akt_spieler)\nummer = #CE_VISIONEN
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Erkennt Räume bevor er sie betritt"
skills(i,akt_spieler)\beschreibung_1[1] = "Identifies rooms before entering them"
skills(i,akt_spieler)\beschreibung_1[3] = "Identificas habitaciones antes de entrar"
skills(i,akt_spieler)\beschreibung_2[2] = "(+30% Fallen entdecken + Verborgene Schätze finden)"
skills(i,akt_spieler)\beschreibung_2[1] = "(+30% Find Traps + find hidden treasure)"
skills(i,akt_spieler)\beschreibung_2[3] = "(+30% Encontrar Trampas + tesoros escondidos)"

i = #CE_SCHMIEDEKUNST
skills(i,akt_spieler)\name[2] = "Schmiedekunst"
skills(i,akt_spieler)\name[1] = "Crafting"
skills(i,akt_spieler)\name[3] = "Forjar"
skills(i,akt_spieler)\nummer = #CE_SCHMIEDEKUNST
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Fähigkeit beschädigte/zerstörte Ausrüstung zu reparieren"
skills(i,akt_spieler)\beschreibung_1[1] = "Ability to repair damaged/broken weapons/armor"
skills(i,akt_spieler)\beschreibung_1[3] = "Abilidad de arreglar armas/armaduras danados/rompios"
skills(i,akt_spieler)\beschreibung_2[2] = "(und magische Waffen/Pfeile aus Edelsteinen erschaffen)"
skills(i,akt_spieler)\beschreibung_2[1] = "(With gem stones  you can create magical weapons/arrows)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Con piedras preciosas podemos crear armas/flechas magicas)"

i = #CE_ELFENBLUT
skills(i,akt_spieler)\name[2] = "Elfenblut"
skills(i,akt_spieler)\name[1] = "Elf Blood"
skills(i,akt_spieler)\name[3] = "Sangre Élfica"
skills(i,akt_spieler)\nummer = #CE_ELFENBLUT
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle deine Attribute sind um eins besser"
skills(i,akt_spieler)\beschreibung_1[1] = "+1 to all attributes"
skills(i,akt_spieler)\beschreibung_1[3] = "*1 a todos los atributos"
skills(i,akt_spieler)\beschreibung_2[2] = "ang, stä, ges, wah, glück, zmacht"
skills(i,akt_spieler)\beschreibung_2[1] = "(Attack, Strength, Dexterity, Perception, Luck, Spell Power)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Ataque, Fuerza, Destreza, Percepción, Suerte, Poder de Hechizos)"

i = #CE_STAEMMIG
skills(i,akt_spieler)\name[2] = "Stämmig"
skills(i,akt_spieler)\name[1] = "Sturdy"
skills(i,akt_spieler)\name[3] = "Duro"
skills(i,akt_spieler)\nummer = #CE_STAEMMIG
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Jeder Punkt Stärke gibt zusätzlich +2 Lebenspunkte"
skills(i,akt_spieler)\beschreibung_1[1] = "Each point of Strength gives +2 Life Points"
skills(i,akt_spieler)\beschreibung_1[3] = "Cada punto de Fuerza te da +2 Puntos de Vida tambien"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_FINGERFERTIGKEIT
skills(i,akt_spieler)\name[2] = "Fingerfertigkeit"
skills(i,akt_spieler)\name[1] = "Swift Fingers"
skills(i,akt_spieler)\name[3] = "Agil"
skills(i,akt_spieler)\nummer = #CE_FINGERFERTIGKEIT
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Gegenstände aufnehmen kostet nicht den Zug"
skills(i,akt_spieler)\beschreibung_1[1] = "Picking up items does not cause the turn to end"
skills(i,akt_spieler)\beschreibung_1[3] = "Recoger cosas no hace que termine el turno"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_AWARENESS
skills(i,akt_spieler)\name[2] = "Aufmerksamkeit"
skills(i,akt_spieler)\name[1] = "Awareness"
skills(i,akt_spieler)\name[3] = "Atento"
skills(i,akt_spieler)\nummer = #CE_AWARENESS
skills(i,akt_spieler)\gruppe = 5
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Halbiert alle Chancen beklaut zu werden"
skills(i,akt_spieler)\beschreibung_1[1] = "Halves all chances to get robbed"
skills(i,akt_spieler)\beschreibung_1[3] = "La probabilidad para ser robado es"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = "la mitad"

; -----------------------------------------------------------------------------------

i = #CE_WEG_DER_GOETTER
skills(i,akt_spieler)\name[2] = "Weg der Götter"
skills(i,akt_spieler)\name[1] = "Way of the Gods"
skills(i,akt_spieler)\name[3] = "Camino de los Dioses"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_AKOLYTH
skills(i,akt_spieler)\name[2] = "Akolyth"
skills(i,akt_spieler)\name[1] = "Akolyth"
skills(i,akt_spieler)\name[3] = "Acolito"
skills(i,akt_spieler)\nummer = #CE_AKOLYTH
skills(i,akt_spieler)\gruppe = 6
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Sanktum regeneriert verlorenes Mana und heilt Gifte, Krankheiten"
skills(i,akt_spieler)\beschreibung_1[1] = "The Sanctum regenerates lost Mana and heals poison, diseases"
skills(i,akt_spieler)\beschreibung_1[3] = "El Santuario regenera el Mana y cura veneno, enfermedades"
skills(i,akt_spieler)\beschreibung_2[2] = "und Flüche"
skills(i,akt_spieler)\beschreibung_2[1] = "and curses"
skills(i,akt_spieler)\beschreibung_2[3] = "y maldiciones"

i = #CE_GOTT_DES_KRIEGES
skills(i,akt_spieler)\name[2] = "Gott des Krieges"
skills(i,akt_spieler)\name[1] = "God of War"
skills(i,akt_spieler)\name[3] = "Dios de la Guerra"
skills(i,akt_spieler)\nummer = #CE_GOTT_DES_KRIEGES
skills(i,akt_spieler)\gruppe = 6
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Bei jedem getöteten Monster chance auf +1 LP"
skills(i,akt_spieler)\beschreibung_1[1] = "For each killed monster, chance to get +1 Life Point"
skills(i,akt_spieler)\beschreibung_1[3] = "Cada monstruo que matas te da una chance para +1 PdV"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=200/Maximale Lebenspunkte in %)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=200/Maximum Life Points in %)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Chance=200/Maximos Puntos de Vida en %)"

i = #CE_GOTT_DES_TODES
skills(i,akt_spieler)\name[2] = "Gott des Todes"
skills(i,akt_spieler)\name[1] = "God of Death"
skills(i,akt_spieler)\name[3] = "Dios del Muerto"
skills(i,akt_spieler)\nummer = #CE_GOTT_DES_TODES
skills(i,akt_spieler)\gruppe = 6
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Bei jedem getötetem Monster chance auf +1 Mana"
skills(i,akt_spieler)\beschreibung_1[1] = "For each killed monster, chance to get +1 Mana"
skills(i,akt_spieler)\beschreibung_1[3] = "Cada monstruo que matas te da una probab. de +1 Mana"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=200/Maximale Manapunkte in %)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=200/Maximum Mana Points in %)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Probabilidad=200/Máximos Puntos de Mana en %)"

i = #CE_GOETTIN_DER_WEISHEIT
skills(i,akt_spieler)\name[2] = "Göttin der Weisheit"
skills(i,akt_spieler)\name[1] = "Goddess of Wisdom"
skills(i,akt_spieler)\name[3] = "Diosa de la Sabiduria"
skills(i,akt_spieler)\nummer = #CE_GOETTIN_DER_WEISHEIT
skills(i,akt_spieler)\gruppe = 6
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "+1 Mana pro Sanktum"
skills(i,akt_spieler)\beschreibung_1[1] = "+1 Mana per Sanctum"
skills(i,akt_spieler)\beschreibung_1[3] = "+1 Mana cada Santuario"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_GOETTIN_DER_HEILUNG
skills(i,akt_spieler)\name[2] = "Göttin der Heilung"
skills(i,akt_spieler)\name[1] = "Goddess of Healing"
skills(i,akt_spieler)\name[3] = "Diosa de la Curación"
skills(i,akt_spieler)\nummer = #CE_GOETTIN_DER_HEILUNG
skills(i,akt_spieler)\gruppe = 6
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\beschreibung_1[2] = "+1 LP pro Sanktum"
skills(i,akt_spieler)\beschreibung_1[1] = "+1 Life Point per Sanctum"
skills(i,akt_spieler)\beschreibung_1[3] = "+1 Punto de Vida cada Santuario"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_GOTT_DER_GEHEIMNISSE
skills(i,akt_spieler)\name[2] = "Gott der Geheimnisse"
skills(i,akt_spieler)\name[1] = "God of Secrets"
skills(i,akt_spieler)\name[3] = "Dios de los Secretos"
skills(i,akt_spieler)\nummer = #CE_GOTT_DER_GEHEIMNISSE
skills(i,akt_spieler)\gruppe = 6
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 2
skills(i,akt_spieler)\beschreibung_1[2] = "+1 LP pro Geheimtür"
skills(i,akt_spieler)\beschreibung_1[1] = "Chance of +1 Life Point per secret door"
skills(i,akt_spieler)\beschreibung_1[3] = "+1 Punto de Vida cada puerta secreta"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=100%-Ebene*2)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=100%-Level*2)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Probabilidad=100%-Nivel*2)"

i = #CE_GOTT_DES_REICHTUMS
skills(i,akt_spieler)\name[2] = "Gott des Reichtums"
skills(i,akt_spieler)\name[1] = "God of Wealth"
skills(i,akt_spieler)\name[3] = "Dios de la Riqueza"
skills(i,akt_spieler)\nummer = #CE_GOTT_DES_REICHTUMS
skills(i,akt_spieler)\gruppe = 6
skills(i,akt_spieler)\kosten = 2
skills(i,akt_spieler)\pet_transferable = 2
skills(i,akt_spieler)\beschreibung_1[2] = "Chance auf +1 LP pro Goldsack"
skills(i,akt_spieler)\beschreibung_1[1] = "Chance of +1 Life Point per gold bag"
skills(i,akt_spieler)\beschreibung_1[3] = "Posibilidad +1 Punto de Vida cada bolsa de oro"
skills(i,akt_spieler)\beschreibung_2[2] = "(Chance=500/Maximale Lebenspunkte in %)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Chance=500/Maximum Life Points in %)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Probabilidad=500/Maximos Puntos de Vida en %)"

; -----------------------------------------------------------------------------------

i = #CE_SEKUNDAERE_FAEHIGKEITEN
skills(i,akt_spieler)\name[2] = "Sekundäre Fertigkeiten"
skills(i,akt_spieler)\name[1] = "Secondary Skills"
skills(i,akt_spieler)\name[3] = "Habilidades Secundarias"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_WURFWAFFEN
skills(i,akt_spieler)\name[2] = "Wurfwaffen"
skills(i,akt_spieler)\name[1] = "Throwing Weapons"
skills(i,akt_spieler)\name[3] = "Armas para Lanzar"
skills(i,akt_spieler)\nummer = #CE_WURFWAFFEN
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+50% Angriff und +2 Schaden mit Wurfwaffen"
skills(i,akt_spieler)\beschreibung_1[1] = "+50% Attack and +2 Damage with throwing weapons"
skills(i,akt_spieler)\beschreibung_1[3] = "+50% Ataque y +2 Daño con armas para lanzar"
skills(i,akt_spieler)\beschreibung_2[2] = "5 extra Dolche"
skills(i,akt_spieler)\beschreibung_2[1] = "Start with 5 extra Daggers"
skills(i,akt_spieler)\beschreibung_2[3] = "5 Dagas mas"

i = #CE_KLETTERN
skills(i,akt_spieler)\name[2] = "Klettern" 
skills(i,akt_spieler)\name[1] = "Climbing"
skills(i,akt_spieler)\name[3] = "Escalador"
skills(i,akt_spieler)\nummer = #CE_KLETTERN
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Erlaubt das Klettern ohne Seil"
skills(i,akt_spieler)\beschreibung_1[1] = "Allows climbing without rope"
skills(i,akt_spieler)\beschreibung_1[3] = "Permite escalar sin cuerda"
skills(i,akt_spieler)\beschreibung_2[2] = "(Du kannst durch Schächte in den nächsten Level klettern)"
skills(i,akt_spieler)\beschreibung_2[1] = "(You can climb through holes to the next level)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Puedes escalar a traves de agujeros al proximo nivel)"

i = #CE_SCHWIMMEN
skills(i,akt_spieler)\name[2] = "Schwimmen" 
skills(i,akt_spieler)\name[1] = "Swimming"
skills(i,akt_spieler)\name[3] = "Natación"
skills(i,akt_spieler)\nummer = #CE_SCHWIMMEN
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Erlaubt das überqueren von Flüssen und Seen ohne Schaden"
skills(i,akt_spieler)\beschreibung_1[1] = "Allows the crossing of rivers and lakes without problems"
skills(i,akt_spieler)\beschreibung_1[3] = "Permite cruzar rios y lagos sin problemas"
skills(i,akt_spieler)\beschreibung_2[2] = "(Und Wasserfelder kosten nicht den Zug)"
skills(i,akt_spieler)\beschreibung_2[1] = "(And water tiles do not end the turn)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Y campos con agua no te cuestan el turno)"

i = #CE_KRAEUTERKUNDE
skills(i,akt_spieler)\name[2] = "Kräuterkunde"
skills(i,akt_spieler)\name[1] = "Herb Lore"
skills(i,akt_spieler)\name[3] = "Conocimiento de Hierbas"
skills(i,akt_spieler)\nummer = #CE_KRAEUTERKUNDE
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Kennt Wirkung aller Tränke, Kräuter und Pilze im Labyrinth."
skills(i,akt_spieler)\beschreibung_1[1] = "Knows effects of all potions, herbs and mushrooms in the labyrinth"
skills(i,akt_spieler)\beschreibung_1[3] = "Conoce los efectos de todas las pociones, hierbas y hongos en el laberinto"
skills(i,akt_spieler)\beschreibung_2[2] = "Beginnt mit 5 Pilzen und 5 Heilkäutern"
skills(i,akt_spieler)\beschreibung_2[1] = "Starts with 5 mushrooms and 5 Healing Herbs"
skills(i,akt_spieler)\beschreibung_2[3] = "Empiezas con 5 hongos y 5 hierbas de curación"

i = #CE_FEILSCHEN
skills(i,akt_spieler)\name[2] = "Feilschen"
skills(i,akt_spieler)\name[1] = "Haggle"
skills(i,akt_spieler)\name[3] = "Regateo"
skills(i,akt_spieler)\nummer = #CE_FEILSCHEN
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Reduziert die Kosten von Gegenständen beim Einkauf und Lehrer um 25%"
skills(i,akt_spieler)\beschreibung_1[1] = "Reduces the cost of goods and training by 25%"
skills(i,akt_spieler)\beschreibung_1[3] = "Reduce el coste de los objetos y del entrenamiento en un 25%"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_MONSTERKUNDE
skills(i,akt_spieler)\name[2] = "Monsterkunde"
skills(i,akt_spieler)\name[1] = "Monster Lore"
skills(i,akt_spieler)\name[3] = "Conocimiento de Monstruos"
skills(i,akt_spieler)\nummer = #CE_MONSTERKUNDE
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Gibt alle Werte eines Monsters preis"
skills(i,akt_spieler)\beschreibung_1[1] = "Shows all attributes of a monster"
skills(i,akt_spieler)\beschreibung_1[3] = "Muestra todos los atributos de un monstruo"
skills(i,akt_spieler)\beschreibung_2[2] = "(Benutzung mit Umsehen Knopf)"
skills(i,akt_spieler)\beschreibung_2[1] = "(Use with Look around button)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Usa con mirar buton)"

i = #CE_GIFTKENNTNIS
skills(i,akt_spieler)\name[2] = "Giftkenntnis"
skills(i,akt_spieler)\name[1] = "Poisonlore"
skills(i,akt_spieler)\name[3] = "Conocimiento de Venenos"
skills(i,akt_spieler)\nummer = #CE_GIFTKENNTNIS
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Erkennt Gifte. Beginnt mit 5 starken Giften. Giftkunde + 2"
skills(i,akt_spieler)\beschreibung_1[1] = "Identifies poisons. Starts with 5 Strong Poisons. Poisonlore + 2"
skills(i,akt_spieler)\beschreibung_1[3] = "Identifica Venenos. Empiece con 5 Venenos Fuertes. Conocimiento de Venenos + 2"
skills(i,akt_spieler)\beschreibung_2[2] = "(Damit können Waffen und Munition vergiftet werden)"
skills(i,akt_spieler)\beschreibung_2[1] = "(You can poison weapons and amunition)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Puedes envenenar armas y munición)"

i = #CE_TRAEGER
skills(i,akt_spieler)\name[2] = "Träger"
skills(i,akt_spieler)\name[1] = "Heavy Carrier"
skills(i,akt_spieler)\name[3] = "Porteador"
skills(i,akt_spieler)\nummer = #CE_TRAEGER
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Unbegrenzte Tragekraft"
skills(i,akt_spieler)\beschreibung_1[1] = "No Encumberance penalty, regardless of carried weight"
skills(i,akt_spieler)\beschreibung_1[3] = "Peso de las cosas portadas no importa"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_NATIVE_MAGIE
skills(i,akt_spieler)\name[2] = "Native Magie"
skills(i,akt_spieler)\name[1] = "Native Sorcery"
skills(i,akt_spieler)\name[3] = "Magia Nativo"
skills(i,akt_spieler)\nummer = #CE_NATIVE_MAGIE
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Zirkel: 1 (normalerweise 0)"
skills(i,akt_spieler)\beschreibung_1[1] = "Spell Circle: 1 (normally 0)"
skills(i,akt_spieler)\beschreibung_1[3] = "Círculo Mágico: 1 (normalmente 0)"
skills(i,akt_spieler)\beschreibung_2[2] = "(Du bist schwach Magiebegabt)"
skills(i,akt_spieler)\beschreibung_2[1] = "(You know how to use a little magic)"
skills(i,akt_spieler)\beschreibung_2[3] = "(Sabes un poco de magia)"

i = #CE_MONKEY_GRIP
skills(i,akt_spieler)\name[2] = "Starke Hände"
skills(i,akt_spieler)\name[1] = "Monkey Grip"
skills(i,akt_spieler)\name[3] = "Manos Fuertes"
skills(i,akt_spieler)\nummer = #CE_MONKEY_GRIP
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\pet_transferable = 1
skills(i,akt_spieler)\beschreibung_1[2] = "Zweihandwaffen mit einer Hand führen"
skills(i,akt_spieler)\beschreibung_1[1] = "Use two-handed weapons with one hand"
skills(i,akt_spieler)\beschreibung_1[3] = "Puedes usar armas de 2 manos con un mano"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_NATURAL_MANA
skills(i,akt_spieler)\name[2] = "Natürliches Mana"
skills(i,akt_spieler)\name[1] = "Natural Mana"
skills(i,akt_spieler)\name[3] = "Mana Natural"
skills(i,akt_spieler)\nummer = #CE_NATURAL_MANA
skills(i,akt_spieler)\gruppe = 7
skills(i,akt_spieler)\kosten = 1
skills(i,akt_spieler)\beschreibung_1[2] = "+2 Mana"
skills(i,akt_spieler)\beschreibung_1[1] = "+2 Mana"
skills(i,akt_spieler)\beschreibung_1[3] = "+2 Mana"
skills(i,akt_spieler)\beschreibung_2[2] = "+1 Mana jeden zweiten Level"
skills(i,akt_spieler)\beschreibung_2[1] = "+1 Mana every second level"
skills(i,akt_spieler)\beschreibung_2[3] = "+1 Mana cada 2 niveles"

; -----------------------------------------------------------------------------------

i = #CE_NACHTEILE
skills(i,akt_spieler)\name[2] = "Nachteile"
skills(i,akt_spieler)\name[1] = "Flaws"
skills(i,akt_spieler)\name[3] = "Defectos"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SCHWACH
skills(i,akt_spieler)\name[2] = "Schwächlich"
skills(i,akt_spieler)\name[1] = "Weak"
skills(i,akt_spieler)\name[3] = "Debil"
skills(i,akt_spieler)\nummer = #CE_SCHWACH
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit 10 Lebenspunkten (normalerweise 12)"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts with 10 Life Points (normally 12)"
skills(i,akt_spieler)\beschreibung_1[3] = "Empieza con 10 puntos de vida (normalmente 12)"
skills(i,akt_spieler)\beschreibung_2[2] = "+2 pro Erfahrungsgewinn (normalerweise +3) (Maximal 50 Lebenspunkte)"
skills(i,akt_spieler)\beschreibung_2[1] = "+2 per experience gain (normally +3) (Maximum 50 Life Points)"
skills(i,akt_spieler)\beschreibung_2[3] = "+2 per experiencia (normalmente +3) (Maximum 50 Puntos de Vida)"

i = #CE_ARM
skills(i,akt_spieler)\name[2] = "Armut"
skills(i,akt_spieler)\name[1] = "Poverty"
skills(i,akt_spieler)\name[3] = "Pobre"
skills(i,akt_spieler)\nummer = #CE_ARM
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel ohne Gold und Ausrüstung"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts without any gold or equipment"
skills(i,akt_spieler)\beschreibung_1[3] = "Empieza sin oro ni equipamiento"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_UNAUFMERKSAM
skills(i,akt_spieler)\name[2] = "Unaufmerksam"
skills(i,akt_spieler)\name[1] = "Unobservant"
skills(i,akt_spieler)\name[3] = "Despistado"
skills(i,akt_spieler)\nummer = #CE_UNAUFMERKSAM
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Charakter findet keine Fallen, Geheimtüren,"
skills(i,akt_spieler)\beschreibung_1[1] = "The character can't find traps, secret doors,"
skills(i,akt_spieler)\beschreibung_1[3] = "El personaje no encuentra trampas, puertas secretas,"
skills(i,akt_spieler)\beschreibung_2[2] = "Pilze und verborgene Schätze"
skills(i,akt_spieler)\beschreibung_2[1] = "mushrooms and hidden treasure"
skills(i,akt_spieler)\beschreibung_2[3] = "hongos y tesoros escondidos"

i = #CE_GERINGES_MANA
skills(i,akt_spieler)\name[2] = "Geringes Mana"
skills(i,akt_spieler)\name[1] = "Low Mana"
skills(i,akt_spieler)\name[3] = "Bajo Mana"
skills(i,akt_spieler)\nummer = #CE_GERINGES_MANA
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Beginnt das Spiel mit einem Manapunkt (normalerweise 3)"
skills(i,akt_spieler)\beschreibung_1[1] = "Starts with 1 Mana Point (normally 3)"
skills(i,akt_spieler)\beschreibung_1[3] = "Empiezas con 1 punto de Mana (normalmente 3)"
skills(i,akt_spieler)\beschreibung_2[2] = "+2 pro Erfahrungsgewinn (normalerweise +3) (Maximal 50 Manapunkte)"
skills(i,akt_spieler)\beschreibung_2[1] = "+2 per experience gain (normally +3) (Maximum 50 Mana Points)"
skills(i,akt_spieler)\beschreibung_2[3] = "+2 con experiencia (normalmente +3) (Maximo 50 Puntos de Mana)"

i = #CE_GIFTSCHWAECHE
skills(i,akt_spieler)\name[2] = "Schwäche: Gift"
skills(i,akt_spieler)\name[1] = "Poison Weakness"
skills(i,akt_spieler)\name[3] = "Debilidad al Veneno"
skills(i,akt_spieler)\nummer = #CE_GIFTSCHWAECHE
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Doppelter Schaden durch Gift"
skills(i,akt_spieler)\beschreibung_1[1] = "Poison does double damage"
skills(i,akt_spieler)\beschreibung_1[3] = "El veneno hace el doble de daño"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_MAGIESCHWAECHE
skills(i,akt_spieler)\name[2] = "Schwäche: Magie"
skills(i,akt_spieler)\name[1] = "Magic Weakness"
skills(i,akt_spieler)\name[3] = "Debilidad a la Magia"
skills(i,akt_spieler)\nummer = #CE_MAGIESCHWAECHE
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Doppelter Schaden durch feindliche Magie"
skills(i,akt_spieler)\beschreibung_1[1] = "Hostile magic does double damage"
skills(i,akt_spieler)\beschreibung_1[3] = "La magia hostil hace el doble de daño"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_VERFLUCHT
skills(i,akt_spieler)\name[2] = "Verflucht"
skills(i,akt_spieler)\name[1] = "Cursed"
skills(i,akt_spieler)\name[3] = "Maldito"
skills(i,akt_spieler)\nummer = #CE_VERFLUCHT
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Flüche haben doppelte Dauer."
skills(i,akt_spieler)\beschreibung_1[1] = "Double duration for all curses."
skills(i,akt_spieler)\beschreibung_1[3] = "Doble duración para las maldiciones."
skills(i,akt_spieler)\beschreibung_2[2] = "Mit 20%+Level neuen Fluch in neuer Ebene"
skills(i,akt_spieler)\beschreibung_2[1] = "With 20%+Level chance for a new curse every level"
skills(i,akt_spieler)\beschreibung_2[3] = "Con 20%+Nivel nuevo maldición en nuevo nivel"

i = #CE_GOTTLOS
skills(i,akt_spieler)\name[2] = "Gottlos" 
skills(i,akt_spieler)\name[1] = "Forsaken"
skills(i,akt_spieler)\name[3] = "Desamparado"
skills(i,akt_spieler)\nummer = #CE_GOTTLOS
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Keine Heilung im Sanktum"
skills(i,akt_spieler)\beschreibung_1[1] = "No healing in the Sanctum"
skills(i,akt_spieler)\beschreibung_1[3] = "El Santuario no cura"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KURZSICHTIG
skills(i,akt_spieler)\name[2] = "Kurzsichtig" 
skills(i,akt_spieler)\name[1] = "Short Sighted"
skills(i,akt_spieler)\name[3] = "Corto de Vista"
skills(i,akt_spieler)\nummer = #CE_KURZSICHTIG
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Sichtradius ist immer halbiert"
skills(i,akt_spieler)\beschreibung_1[1] = "Sight radius is halved"
skills(i,akt_spieler)\beschreibung_1[3] = "El radio de visión se reduce de la mitad"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_DUMM
skills(i,akt_spieler)\name[2] = "Dumm"
skills(i,akt_spieler)\name[1] = "Stupid"
skills(i,akt_spieler)\name[3] = "Estupido"
skills(i,akt_spieler)\nummer = #CE_DUMM
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Gewinnt 3 mal keine Erfahrung"
skills(i,akt_spieler)\beschreibung_1[1] = "No experience gains for the first 3 levels"
skills(i,akt_spieler)\beschreibung_1[3] = "No se gana experiencia durante 3 veces"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_AUSGESTOSSEN
skills(i,akt_spieler)\name[2] = "Ausgestossen"
skills(i,akt_spieler)\name[1] = "Outcast"
skills(i,akt_spieler)\name[3] = "Abandonado"
skills(i,akt_spieler)\nummer = #CE_AUSGESTOSSEN
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Alle Händler und Lehrer flüchten vor dir"
skills(i,akt_spieler)\beschreibung_1[1] = "All merchants and trainers flee from you"
skills(i,akt_spieler)\beschreibung_1[3] = "Todos los comerciantes y profesores se escapan de ti"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_DISJUNCT
skills(i,akt_spieler)\name[2] = "Disjunct"
skills(i,akt_spieler)\name[1] = "Disjunct"
skills(i,akt_spieler)\name[3] = "Antirecarga"
skills(i,akt_spieler)\nummer = #CE_DISJUNCT
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Dein Mana wird nicht am Nexus regeneriert"
skills(i,akt_spieler)\beschreibung_1[1] = "Your Mana does not replenish at the Nexus"
skills(i,akt_spieler)\beschreibung_1[3] = "Tu Mana no se recarga en el Nexo"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KEINE_BASISMAGIE
skills(i,akt_spieler)\name[2] = "Keine Basismagie"
skills(i,akt_spieler)\name[1] = "No Basic Magic"
skills(i,akt_spieler)\name[3] = "No Magia Basica"
skills(i,akt_spieler)\nummer = #CE_KEINE_BASISMAGIE
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine Basismagie lernen"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't learn Basic Magic"
skills(i,akt_spieler)\beschreibung_1[3] = "No puedes aprender Magia Basica"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KURZE_MAGIE
skills(i,akt_spieler)\name[2] = "Kurze Magie"
skills(i,akt_spieler)\name[1] = "Short Magic"
skills(i,akt_spieler)\name[3] = "Magia Corta"
skills(i,akt_spieler)\nummer = #CE_KURZE_MAGIE
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Die Dauer deiner Sprüche ist halbiert"
skills(i,akt_spieler)\beschreibung_1[1] = "The duration of your spells is halved"
skills(i,akt_spieler)\beschreibung_1[3] = "La duración de tus hechizos es la mitad"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_LAHM
skills(i,akt_spieler)\name[2] = "Lahm"
skills(i,akt_spieler)\name[1] = "Lame"
skills(i,akt_spieler)\name[3] = "Postrado"
skills(i,akt_spieler)\nummer = #CE_LAHM
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Zugweite halbiert"
skills(i,akt_spieler)\beschreibung_1[1] = "Speed is halved"
skills(i,akt_spieler)\beschreibung_1[3] = "La velocidad se reduce a la mitad"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_KEIN_ANGRIFF
skills(i,akt_spieler)\name[2] = "Kein Angriff"
skills(i,akt_spieler)\name[1] = "No Attacking"
skills(i,akt_spieler)\name[3] = "No Ataque"
skills(i,akt_spieler)\nummer = #CE_KEIN_ANGRIFF
skills(i,akt_spieler)\gruppe = 8
skills(i,akt_spieler)\kosten = -2
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst nie einen Gegner"
skills(i,akt_spieler)\beschreibung_1[1] = "You can never attack in close range combat"
skills(i,akt_spieler)\beschreibung_1[3] = "Nunca puedes atacar en"
skills(i,akt_spieler)\beschreibung_2[2] = "im Nahkampf angreifen"
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = "combate cuerpo a cuerpo"

; -----------------------------------------------------------------------------------

i = #CE_SEKUNDAERE_NACHTEILE
skills(i,akt_spieler)\name[2] = "Sekundäre Nachteile"
skills(i,akt_spieler)\name[1] = "Secondary Flaws"
skills(i,akt_spieler)\name[3] = "Defectos Secundarios"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SCHWACHE_ARME
skills(i,akt_spieler)\name[2] = "Schwache Arme"
skills(i,akt_spieler)\name[1] = "Weak Arms"
skills(i,akt_spieler)\name[3] = "Brazos Débiles"
skills(i,akt_spieler)\nummer = #CE_SCHWACHE_ARME
skills(i,akt_spieler)\gruppe = 9
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine Waffen führen"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't use weapons"
skills(i,akt_spieler)\beschreibung_1[3] = "No puedes usar armas"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_SCHWACHE_FINGER
skills(i,akt_spieler)\name[2] = "Schwache finger"
skills(i,akt_spieler)\name[1] = "Weak Fingers"
skills(i,akt_spieler)\name[3] = "Dedos Débiles"
skills(i,akt_spieler)\nummer = #CE_SCHWACHE_FINGER
skills(i,akt_spieler)\gruppe = 9
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine Bogen führen"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't use bows"
skills(i,akt_spieler)\beschreibung_1[3] = "No puedes usar arcos"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_VERUNSTALTET
skills(i,akt_spieler)\name[2] = "Verunstaltet"
skills(i,akt_spieler)\name[1] = "Disfigured"
skills(i,akt_spieler)\name[3] = "Desfigurado"
skills(i,akt_spieler)\nummer = #CE_VERUNSTALTET
skills(i,akt_spieler)\gruppe = 9
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine Rüstung anziehen"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't use armor"
skills(i,akt_spieler)\beschreibung_1[3] = "No puedes usar armadura"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

; -----------------------------------------------------------------------------------

i = #CE_WAY_OF_NPC
skills(i,akt_spieler)\name[2] = "Weg der Kraturen"
skills(i,akt_spieler)\name[1] = "Way of Creatures"
skills(i,akt_spieler)\name[3] = "Camino de las Kriaturas"
skills(i,akt_spieler)\nummer = 0
skills(i,akt_spieler)\kosten = 0
skills(i,akt_spieler)\beschreibung_1[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = ""
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_NO_AMULETS
skills(i,akt_spieler)\name[2] = "Keine Amulette"
skills(i,akt_spieler)\name[1] = "No Amulets"
skills(i,akt_spieler)\name[3] = "No Amuletos"
skills(i,akt_spieler)\nummer = #CE_NO_AMULETS
skills(i,akt_spieler)\gruppe = 10
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine Amulette tragen"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't wear amulets"
skills(i,akt_spieler)\beschreibung_1[3] = "No puedes ponerte amuletos"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_NO_RINGS
skills(i,akt_spieler)\name[2] = "Keine Ringe"
skills(i,akt_spieler)\name[1] = "No Rings"
skills(i,akt_spieler)\name[3] = "No Anillos"
skills(i,akt_spieler)\nummer = #CE_NO_RINGS
skills(i,akt_spieler)\gruppe = 10
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine Ringe tragen"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't wear rings"
skills(i,akt_spieler)\beschreibung_1[3] = "You puedes ponerte anillos"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_2[3] = ""

i = #CE_NO_CONSUMPTION
skills(i,akt_spieler)\name[2] = "Kein Konsum"
skills(i,akt_spieler)\name[1] = "No Consumption"
skills(i,akt_spieler)\name[3] = "No Consumir"
skills(i,akt_spieler)\nummer = #CE_NO_CONSUMPTION
skills(i,akt_spieler)\gruppe = 10
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine Verbrauchsgüter nutzen"
skills(i,akt_spieler)\beschreibung_2[2] = "(Heilkräuter,Pilze,Tränke,Crysolit)"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't use consumables"
skills(i,akt_spieler)\beschreibung_2[1] = "(herbs,mushrooms,potions,crysolit)"
skills(i,akt_spieler)\beschreibung_1[3] = "No puedes comer nada"
skills(i,akt_spieler)\beschreibung_2[3] = "(hierbas,hongos,pociones,crysolitos)"

i = #CE_NO_MAGIC_ITEMS
skills(i,akt_spieler)\name[2] = "Keine Gegenstandsmagie"
skills(i,akt_spieler)\name[1] = "No Magic Items"
skills(i,akt_spieler)\name[3] = "No objetos magicos"
skills(i,akt_spieler)\nummer = #CE_NO_MAGIC_ITEMS
skills(i,akt_spieler)\gruppe = 10
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst keine magischen Ladungen nutzen"
skills(i,akt_spieler)\beschreibung_2[2] = "(Schriftrollen,Zauberstäbe,Kristallkugeln..)"
skills(i,akt_spieler)\beschreibung_1[1] = "You can't use magicically charged items"
skills(i,akt_spieler)\beschreibung_2[1] = "(scrolls,wands,crystal balls..)"
skills(i,akt_spieler)\beschreibung_1[3] = "No puedes usar objetos magicos"
skills(i,akt_spieler)\beschreibung_2[3] = "(pergaminos,bastones,bolas de cristal..)"

i = #CE_PAWS
skills(i,akt_spieler)\name[2] = "Keine Hände"
skills(i,akt_spieler)\name[1] = "No Hands"
skills(i,akt_spieler)\name[3] = "Sin manos"
skills(i,akt_spieler)\nummer = #CE_PAWS
skills(i,akt_spieler)\gruppe = 10
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Ohne menschliche Hände geht vieles nicht"
skills(i,akt_spieler)\beschreibung_2[2] = "(Türen,Schlüssel,Schaufeln,Lampen..)"
skills(i,akt_spieler)\beschreibung_1[1] = "Lacking human hands many things are unusable"
skills(i,akt_spieler)\beschreibung_2[1] = "(doors,keys,shovels,lamps,traptool)"
skills(i,akt_spieler)\beschreibung_1[3] = "Sin manos no se puede hacer muchas cosas"
skills(i,akt_spieler)\beschreibung_2[3] = "(puertas,llaves,pala,lamparas,antitrampas)"

i = #CE_NO_SNEAK
skills(i,akt_spieler)\name[2] = "Kein Schleichen"
skills(i,akt_spieler)\name[1] = "No Sneaking"
skills(i,akt_spieler)\name[3] = "No Sneaking"
skills(i,akt_spieler)\nummer = #CE_NO_SNEAK
skills(i,akt_spieler)\gruppe = 10
skills(i,akt_spieler)\kosten = -1
skills(i,akt_spieler)\beschreibung_1[2] = "Du kannst nicht schleichen"
skills(i,akt_spieler)\beschreibung_2[2] = ""
skills(i,akt_spieler)\beschreibung_1[1] = "You can't sneak"
skills(i,akt_spieler)\beschreibung_2[1] = ""
skills(i,akt_spieler)\beschreibung_1[3] = "No te puedes deslizar sigilosamente"
skills(i,akt_spieler)\beschreibung_2[3] = ""

; Strukturen fuer lock skills initialisieren
unmoeglich(1)\name     = #CE_WEISSE_MAGIE
unmoeglich(1)\locked   = #CE_GOTTLOS
unmoeglich(2)\name     = #CE_GOTTLOS
unmoeglich(2)\locked   = #CE_WEISSE_MAGIE

unmoeglich(3)\name     = #CE_AKOLYTH
unmoeglich(3)\locked   = #CE_GOTTLOS
unmoeglich(4)\name     = #CE_GOTTLOS
unmoeglich(4)\locked   = #CE_AKOLYTH

unmoeglich(5)\name     = #CE_AKOLYTH
unmoeglich(5)\locked   = #CE_VERFLUCHT
unmoeglich(6)\name     = #CE_VERFLUCHT
unmoeglich(6)\locked   = #CE_AKOLYTH

unmoeglich(7)\name     = #CE_WEISSE_MAGIE
unmoeglich(7)\locked   = #CE_VERFLUCHT
unmoeglich(8)\name     = #CE_VERFLUCHT
unmoeglich(8)\locked   = #CE_WEISSE_MAGIE

unmoeglich( 9)\name     = #CE_MAGIESCHWAECHE
unmoeglich( 9)\locked   = #CE_MAGIERESISTENZ
unmoeglich(10)\name     = #CE_MAGIERESISTENZ
unmoeglich(10)\locked   = #CE_MAGIESCHWAECHE

unmoeglich(11)\name     = #CE_MAGIESCHWAECHE
unmoeglich(11)\locked   = #CE_HOHE_MAGIE
unmoeglich(12)\name     = #CE_HOHE_MAGIE
unmoeglich(12)\locked   = #CE_MAGIESCHWAECHE

unmoeglich(13)\name    = #CE_GIFTSCHWAECHE
unmoeglich(13)\locked  = #CE_GIFTRESISTENZ
unmoeglich(14)\name    = #CE_GIFTRESISTENZ
unmoeglich(14)\locked  = #CE_GIFTSCHWAECHE

unmoeglich(15)\name    = #CE_GIFTSCHWAECHE
unmoeglich(15)\locked  = #CE_WEISSE_MAGIE
unmoeglich(16)\name    = #CE_WEISSE_MAGIE
unmoeglich(16)\locked  = #CE_GIFTSCHWAECHE

unmoeglich(17)\name    = #CE_GERINGES_MANA
unmoeglich(17)\locked  = #CE_MANA
unmoeglich(18)\name    = #CE_MANA
unmoeglich(18)\locked  = #CE_GERINGES_MANA

unmoeglich(19)\name    = #CE_UNAUFMERKSAM
unmoeglich(19)\locked  = #CE_WAHRNEHMUNG
unmoeglich(20)\name    = #CE_WAHRNEHMUNG
unmoeglich(20)\locked  = #CE_UNAUFMERKSAM

unmoeglich(21)\name    = #CE_UNAUFMERKSAM
unmoeglich(21)\locked  = #CE_FALLENKUNDE
unmoeglich(22)\name    = #CE_FALLENKUNDE
unmoeglich(22)\locked  = #CE_UNAUFMERKSAM

unmoeglich(23)\name    = #CE_ARM
unmoeglich(23)\locked  = #CE_ERBSCHAFT
unmoeglich(24)\name    = #CE_ERBSCHAFT
unmoeglich(24)\locked  = #CE_ARM

unmoeglich(25)\name    = #CE_ARM
unmoeglich(25)\locked  = #CE_SPELUNKER
unmoeglich(26)\name    = #CE_SPELUNKER
unmoeglich(26)\locked  = #CE_ARM

unmoeglich(27)\name    = #CE_ARM
unmoeglich(27)\locked  = #CE_VETERAN
unmoeglich(28)\name    = #CE_VETERAN
unmoeglich(28)\locked  = #CE_ARM

unmoeglich(29)\name    = #CE_SCHWACH
unmoeglich(29)\locked  = #CE_STAERKE
unmoeglich(30)\name    = #CE_STAERKE
unmoeglich(30)\locked  = #CE_SCHWACH

unmoeglich(31)\name    = #CE_SCHWACH
unmoeglich(31)\locked  = #CE_KONSTITUTION
unmoeglich(32)\name    = #CE_KONSTITUTION
unmoeglich(32)\locked  = #CE_SCHWACH

unmoeglich(33)\name    = #CE_SCHWACH
unmoeglich(33)\locked  = #CE_HAERTE
unmoeglich(34)\name    = #CE_HAERTE
unmoeglich(34)\locked  = #CE_SCHWACH

unmoeglich(35)\name    = #CE_SCHWACH
unmoeglich(35)\locked  = #CE_BERSERKER
unmoeglich(36)\name    = #CE_BERSERKER
unmoeglich(36)\locked  = #CE_SCHWACH

unmoeglich(37)\name    = #CE_KURZSICHTIG
unmoeglich(37)\locked  = #CE_WAHRNEHMUNG
unmoeglich(38)\name    = #CE_WAHRNEHMUNG
unmoeglich(38)\locked  = #CE_KURZSICHTIG

unmoeglich(39)\name    = #CE_KURZSICHTIG
unmoeglich(39)\locked  = #CE_NACHTSICHT
unmoeglich(40)\name    = #CE_NACHTSICHT
unmoeglich(40)\locked  = #CE_KURZSICHTIG

unmoeglich(41)\name    = #CE_KURZSICHTIG
unmoeglich(41)\locked  = #CE_STERNENMAGIE
unmoeglich(42)\name    = #CE_STERNENMAGIE
unmoeglich(42)\locked  = #CE_KURZSICHTIG

unmoeglich(43)\name    = #CE_DUMM
unmoeglich(43)\locked  = #CE_WEISHEIT
unmoeglich(44)\name    = #CE_WEISHEIT
unmoeglich(44)\locked  = #CE_DUMM

unmoeglich(45)\name    = #CE_SCHWARZE_MAGIE
unmoeglich(45)\locked  = #CE_WEISSE_MAGIE
unmoeglich(46)\name    = #CE_WEISSE_MAGIE
unmoeglich(46)\locked  = #CE_SCHWARZE_MAGIE

unmoeglich(47)\name    = #CE_AUSGESTOSSEN
unmoeglich(47)\locked  = #CE_FEILSCHEN
unmoeglich(48)\name    = #CE_FEILSCHEN
unmoeglich(48)\locked  = #CE_AUSGESTOSSEN

unmoeglich(49)\name    = #CE_DISJUNCT
unmoeglich(49)\locked  = #CE_LEYKONTAKT
unmoeglich(50)\name    = #CE_LEYKONTAKT
unmoeglich(50)\locked  = #CE_DISJUNCT

unmoeglich(51)\name    = #CE_UNAUFMERKSAM
unmoeglich(51)\locked  = #CE_GEFAHREN_SPUEREN
unmoeglich(52)\name    = #CE_GEFAHREN_SPUEREN
unmoeglich(52)\locked  = #CE_UNAUFMERKSAM

unmoeglich(53)\name    = #CE_GOTTLOS
unmoeglich(53)\locked  = #CE_GOTT_DES_KRIEGES
unmoeglich(54)\name    = #CE_GOTT_DES_KRIEGES
unmoeglich(54)\locked  = #CE_GOTTLOS

unmoeglich(55)\name    = #CE_GOTTLOS
unmoeglich(55)\locked  = #CE_GOTT_DES_TODES
unmoeglich(56)\name    = #CE_GOTT_DES_TODES
unmoeglich(56)\locked  = #CE_GOTTLOS

unmoeglich(57)\name    = #CE_GOTTLOS
unmoeglich(57)\locked  = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(58)\name    = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(58)\locked  = #CE_GOTTLOS

unmoeglich(59)\name    = #CE_GOTTLOS
unmoeglich(59)\locked  = #CE_GOETTIN_DER_HEILUNG
unmoeglich(60)\name    = #CE_GOETTIN_DER_HEILUNG
unmoeglich(60)\locked  = #CE_GOTTLOS

unmoeglich(61)\name    = #CE_GOTTLOS
unmoeglich(61)\locked  = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(62)\name    = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(62)\locked  = #CE_GOTTLOS

unmoeglich(63)\name    = #CE_GOTTLOS
unmoeglich(63)\locked  = #CE_GOTT_DES_REICHTUMS
unmoeglich(64)\name    = #CE_GOTT_DES_REICHTUMS
unmoeglich(64)\locked  = #CE_GOTTLOS

unmoeglich(65)\name    = #CE_KURZE_MAGIE
unmoeglich(65)\locked  = #CE_BESTAENDIGKEIT
unmoeglich(66)\name    = #CE_BESTAENDIGKEIT
unmoeglich(66)\locked  = #CE_KURZE_MAGIE

unmoeglich(67)\name    = #CE_GOTT_DES_KRIEGES
unmoeglich(67)\locked  = #CE_GOTT_DES_TODES
unmoeglich(68)\name    = #CE_GOTT_DES_TODES
unmoeglich(68)\locked  = #CE_GOTT_DES_KRIEGES

unmoeglich(69)\name    = #CE_GOTT_DES_KRIEGES
unmoeglich(69)\locked  = #CE_GOETTIN_DER_HEILUNG
unmoeglich(70)\name    = #CE_GOETTIN_DER_HEILUNG
unmoeglich(70)\locked  = #CE_GOTT_DES_KRIEGES

unmoeglich(71)\name    = #CE_GOTT_DES_KRIEGES
unmoeglich(71)\locked  = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(72)\name    = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(72)\locked  = #CE_GOTT_DES_KRIEGES

unmoeglich(73)\name    = #CE_GOTT_DES_KRIEGES
unmoeglich(73)\locked  = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(74)\name    = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(74)\locked  = #CE_GOTT_DES_KRIEGES

unmoeglich(75)\name    = #CE_GOTT_DES_KRIEGES
unmoeglich(75)\locked  = #CE_GOTT_DES_REICHTUMS
unmoeglich(76)\name    = #CE_GOTT_DES_REICHTUMS
unmoeglich(76)\locked  = #CE_GOTT_DES_KRIEGES

unmoeglich(77)\name    = #CE_GOTT_DES_TODES
unmoeglich(77)\locked  = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(78)\name    = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(78)\locked  = #CE_GOTT_DES_TODES

unmoeglich(79)\name    = #CE_GOTT_DES_TODES
unmoeglich(79)\locked  = #CE_GOETTIN_DER_HEILUNG
unmoeglich(80)\name    = #CE_GOETTIN_DER_HEILUNG
unmoeglich(80)\locked  = #CE_GOTT_DES_TODES

unmoeglich(81)\name    = #CE_GOTT_DES_TODES
unmoeglich(81)\locked  = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(82)\name    = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(82)\locked  = #CE_GOTT_DES_TODES

unmoeglich(83)\name    = #CE_GOTT_DES_TODES
unmoeglich(83)\locked  = #CE_GOTT_DES_REICHTUMS
unmoeglich(84)\name    = #CE_GOTT_DES_REICHTUMS
unmoeglich(84)\locked  = #CE_GOTT_DES_TODES

unmoeglich(85)\name    = #CE_GOETTIN_DER_HEILUNG
unmoeglich(85)\locked  = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(86)\name    = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(86)\locked  = #CE_GOETTIN_DER_HEILUNG

unmoeglich(87)\name    = #CE_GOETTIN_DER_HEILUNG
unmoeglich(87)\locked  = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(88)\name    = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(88)\locked  = #CE_GOETTIN_DER_HEILUNG

unmoeglich(89)\name    = #CE_GOETTIN_DER_HEILUNG
unmoeglich(89)\locked  = #CE_GOTT_DES_REICHTUMS
unmoeglich(90)\name    = #CE_GOTT_DES_REICHTUMS
unmoeglich(90)\locked  = #CE_GOETTIN_DER_HEILUNG

unmoeglich(91)\name    = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(91)\locked  = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(92)\name    = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(92)\locked  = #CE_GOETTIN_DER_WEISHEIT

unmoeglich(93)\name    = #CE_GOETTIN_DER_WEISHEIT
unmoeglich(93)\locked  = #CE_GOTT_DES_REICHTUMS
unmoeglich(94)\name    = #CE_GOTT_DES_REICHTUMS
unmoeglich(94)\locked  = #CE_GOETTIN_DER_WEISHEIT

unmoeglich(95)\name    = #CE_GOTT_DER_GEHEIMNISSE
unmoeglich(95)\locked  = #CE_GOTT_DES_REICHTUMS
unmoeglich(96)\name    = #CE_GOTT_DES_REICHTUMS
unmoeglich(96)\locked  = #CE_GOTT_DER_GEHEIMNISSE

unmoeglich(97)\name    = #CE_ELEMENTARMAGIE
unmoeglich(97)\locked  = #CE_ERDMAGIE
unmoeglich(98)\name    = #CE_ERDMAGIE
unmoeglich(98)\locked  = #CE_ELEMENTARMAGIE

unmoeglich( 99)\name    = #CE_ELEMENTARMAGIE
unmoeglich( 99)\locked  = #CE_FEUERMAGIE
unmoeglich(100)\name    = #CE_FEUERMAGIE
unmoeglich(100)\locked  = #CE_ELEMENTARMAGIE

unmoeglich(101)\name    = #CE_ELEMENTARMAGIE
unmoeglich(101)\locked  = #CE_WASSERMAGIE
unmoeglich(102)\name    = #CE_WASSERMAGIE
unmoeglich(102)\locked  = #CE_ELEMENTARMAGIE

unmoeglich(103)\name   = #CE_ELEMENTARMAGIE
unmoeglich(103)\locked = #CE_LUFTMAGIE
unmoeglich(104)\name   = #CE_LUFTMAGIE
unmoeglich(104)\locked = #CE_ELEMENTARMAGIE

unmoeglich(105)\name   = #CE_HAENDLER
unmoeglich(105)\locked = #CE_AUSGESTOSSEN
unmoeglich(106)\name   = #CE_AUSGESTOSSEN
unmoeglich(106)\locked = #CE_HAENDLER

unmoeglich(107)\name   = #CE_MAGIERESISTENZ
unmoeglich(107)\locked = #CE_VERFLUCHT
unmoeglich(108)\name   = #CE_VERFLUCHT
unmoeglich(108)\locked = #CE_MAGIERESISTENZ

unmoeglich(109)\name   = #CE_JAEGER
unmoeglich(109)\locked = #CE_PALADIN
unmoeglich(110)\name   = #CE_PALADIN
unmoeglich(110)\locked = #CE_JAEGER

unmoeglich(111)\name   = #CE_JAEGER
unmoeglich(111)\locked = #CE_GEISTERJAEGER
unmoeglich(112)\name   = #CE_GEISTERJAEGER
unmoeglich(112)\locked = #CE_JAEGER

unmoeglich(113)\name   = #CE_JAEGER
unmoeglich(113)\locked = #CE_KOPFGELDJAEGER
unmoeglich(114)\name   = #CE_KOPFGELDJAEGER
unmoeglich(114)\locked = #CE_JAEGER

unmoeglich(115)\name   = #CE_PALADIN
unmoeglich(115)\locked = #CE_GEISTERJAEGER
unmoeglich(116)\name   = #CE_GEISTERJAEGER
unmoeglich(116)\locked = #CE_PALADIN

unmoeglich(117)\name   = #CE_PALADIN
unmoeglich(117)\locked = #CE_KOPFGELDJAEGER
unmoeglich(118)\name   = #CE_KOPFGELDJAEGER
unmoeglich(118)\locked = #CE_PALADIN

unmoeglich(119)\name   = #CE_GEISTERJAEGER
unmoeglich(119)\locked = #CE_KOPFGELDJAEGER
unmoeglich(120)\name   = #CE_KOPFGELDJAEGER
unmoeglich(120)\locked = #CE_GEISTERJAEGER

unmoeglich(121)\name   = #CE_ANFUEHRER
unmoeglich(121)\locked = #CE_KUNDSCHAFTER
unmoeglich(122)\name   = #CE_KUNDSCHAFTER
unmoeglich(122)\locked = #CE_ANFUEHRER

unmoeglich(123)\name   = #CE_ANFUEHRER
unmoeglich(123)\locked = #CE_ZAUBERFUERST
unmoeglich(124)\name   = #CE_ZAUBERFUERST
unmoeglich(124)\locked = #CE_ANFUEHRER

unmoeglich(125)\name   = #CE_ANFUEHRER
unmoeglich(125)\locked = #CE_AUSGESTOSSEN
unmoeglich(126)\name   = #CE_AUSGESTOSSEN
unmoeglich(126)\locked = #CE_ANFUEHRER

unmoeglich(127)\name   = #CE_KUNDSCHAFTER
unmoeglich(127)\locked = #CE_ZAUBERFUERST
unmoeglich(128)\name   = #CE_ZAUBERFUERST
unmoeglich(128)\locked = #CE_KUNDSCHAFTER

unmoeglich(129)\name   = #CE_KUNDSCHAFTER
unmoeglich(129)\locked = #CE_AUSGESTOSSEN
unmoeglich(130)\name   = #CE_AUSGESTOSSEN
unmoeglich(130)\locked = #CE_KUNDSCHAFTER

unmoeglich(131)\name   = #CE_ZAUBERFUERST
unmoeglich(131)\locked = #CE_AUSGESTOSSEN
unmoeglich(132)\name   = #CE_AUSGESTOSSEN
unmoeglich(132)\locked = #CE_ZAUBERFUERST

unmoeglich(133)\name   = #CE_KUNDSCHAFTER
unmoeglich(133)\locked = #CE_LAHM
unmoeglich(134)\name   = #CE_LAHM
unmoeglich(134)\locked = #CE_KUNDSCHAFTER

unmoeglich(135)\name   = #CE_LUFTMAGIE
unmoeglich(135)\locked = #CE_LAHM
unmoeglich(136)\name   = #CE_LAHM
unmoeglich(136)\locked = #CE_LUFTMAGIE

unmoeglich(137)\name   = #CE_SCHNELLIGKEIT
unmoeglich(137)\locked = #CE_LAHM
unmoeglich(138)\name   = #CE_LAHM
unmoeglich(138)\locked = #CE_SCHNELLIGKEIT

unmoeglich(139)\name   = #CE_VISIONEN
unmoeglich(139)\locked = #CE_UNAUFMERKSAM
unmoeglich(140)\name   = #CE_UNAUFMERKSAM
unmoeglich(140)\locked = #CE_VISIONEN

unmoeglich(141)\name   = #CE_VISIONEN
unmoeglich(141)\locked = #CE_KURZSICHTIG
unmoeglich(142)\name   = #CE_KURZSICHTIG
unmoeglich(142)\locked = #CE_VISIONEN

unmoeglich(143)\name   = #CE_BLUTRAUSCH
unmoeglich(143)\locked = #CE_SCHWACH
unmoeglich(144)\name   = #CE_SCHWACH
unmoeglich(144)\locked = #CE_BLUTRAUSCH

unmoeglich(145)\name   = #CE_KEINE_BASISMAGIE
unmoeglich(145)\locked = #CE_KURZE_MAGIE
unmoeglich(146)\name   = #CE_KURZE_MAGIE
unmoeglich(146)\locked = #CE_KEINE_BASISMAGIE

unmoeglich(147)\name   = #CE_TRAEGER
unmoeglich(147)\locked = #CE_SCHWACH
unmoeglich(148)\name   = #CE_SCHWACH
unmoeglich(148)\locked = #CE_TRAEGER

unmoeglich(149)\name   = #CE_KURZE_MAGIE
unmoeglich(149)\locked = #CE_ELFENBLUT
unmoeglich(150)\name   = #CE_ELFENBLUT
unmoeglich(150)\locked = #CE_KURZE_MAGIE

unmoeglich(151)\name   = #CE_KURZE_MAGIE
unmoeglich(151)\locked = #CE_MAGIERESISTENZ
unmoeglich(152)\name   = #CE_MAGIERESISTENZ
unmoeglich(152)\locked = #CE_KURZE_MAGIE

unmoeglich(153)\name   = #CE_FREIE_MAGIE
unmoeglich(153)\locked = #CE_KEINE_BASISMAGIE
unmoeglich(154)\name   = #CE_KEINE_BASISMAGIE
unmoeglich(154)\locked = #CE_FREIE_MAGIE

unmoeglich(155)\name   = #CE_SCHNELLIGKEIT
unmoeglich(155)\locked = #CE_KUNDSCHAFTER
unmoeglich(156)\name   = #CE_KUNDSCHAFTER
unmoeglich(156)\locked = #CE_SCHNELLIGKEIT

unmoeglich(157)\name   = #CE_BERSERKER
unmoeglich(157)\locked = #CE_KEIN_ANGRIFF
unmoeglich(158)\name   = #CE_KEIN_ANGRIFF
unmoeglich(158)\locked = #CE_BERSERKER

unmoeglich(159)\name   = #CE_KAMPFESWUT
unmoeglich(159)\locked = #CE_KEIN_ANGRIFF
unmoeglich(160)\name   = #CE_KEIN_ANGRIFF
unmoeglich(160)\locked = #CE_KAMPFESWUT

unmoeglich(161)\name   = #CE_BLUTRAUSCH
unmoeglich(161)\locked = #CE_KEIN_ANGRIFF
unmoeglich(162)\name   = #CE_KEIN_ANGRIFF
unmoeglich(162)\locked = #CE_BLUTRAUSCH

unmoeglich(163)\name   = #CE_RUNDSCHLAG
unmoeglich(163)\locked = #CE_KEIN_ANGRIFF
unmoeglich(164)\name   = #CE_KEIN_ANGRIFF
unmoeglich(164)\locked = #CE_RUNDSCHLAG

unmoeglich(165)\name   = #CE_STURMANGRIFF
unmoeglich(165)\locked = #CE_KEIN_ANGRIFF
unmoeglich(166)\name   = #CE_KEIN_ANGRIFF
unmoeglich(166)\locked = #CE_STURMANGRIFF

unmoeglich(167)\name   = #CE_FLINKE_ATTACKE
unmoeglich(167)\locked = #CE_KEIN_ANGRIFF
unmoeglich(168)\name   = #CE_KEIN_ANGRIFF
unmoeglich(168)\locked = #CE_FLINKE_ATTACKE

unmoeglich(169)\name   = #CE_SCHWERTKAMPF
unmoeglich(169)\locked = #CE_KEIN_ANGRIFF
unmoeglich(170)\name   = #CE_KEIN_ANGRIFF
unmoeglich(170)\locked = #CE_SCHWERTKAMPF

unmoeglich(171)\name   = #CE_AXTKAMPF
unmoeglich(171)\locked = #CE_KEIN_ANGRIFF
unmoeglich(172)\name   = #CE_KEIN_ANGRIFF
unmoeglich(172)\locked = #CE_AXTKAMPF

unmoeglich(173)\name   = #CE_SPEERKAMPF
unmoeglich(173)\locked = #CE_KEIN_ANGRIFF
unmoeglich(174)\name   = #CE_KEIN_ANGRIFF
unmoeglich(174)\locked = #CE_SPEERKAMPF

unmoeglich(175)\name   = #CE_HAMMERKAMPF
unmoeglich(175)\locked = #CE_KEIN_ANGRIFF
unmoeglich(176)\name   = #CE_KEIN_ANGRIFF
unmoeglich(176)\locked = #CE_HAMMERKAMPF

unmoeglich(177)\name   = #CE_WAFFENLOSER_KAMPF
unmoeglich(177)\locked = #CE_KEIN_ANGRIFF
unmoeglich(178)\name   = #CE_KEIN_ANGRIFF
unmoeglich(178)\locked = #CE_WAFFENLOSER_KAMPF
;------------------------------
unmoeglich(179)\name   = #CE_SCHWERTKAMPF
unmoeglich(179)\locked = #CE_SCHWACHE_ARME
unmoeglich(180)\name   = #CE_SCHWACHE_ARME
unmoeglich(180)\locked = #CE_SCHWERTKAMPF

unmoeglich(181)\name   = #CE_AXTKAMPF
unmoeglich(181)\locked = #CE_SCHWACHE_ARME
unmoeglich(182)\name   = #CE_SCHWACHE_ARME
unmoeglich(182)\locked = #CE_AXTKAMPF

unmoeglich(183)\name   = #CE_SPEERKAMPF
unmoeglich(183)\locked = #CE_SCHWACHE_ARME
unmoeglich(184)\name   = #CE_SCHWACHE_ARME
unmoeglich(184)\locked = #CE_SPEERKAMPF

unmoeglich(185)\name   = #CE_HAMMERKAMPF
unmoeglich(185)\locked = #CE_SCHWACHE_ARME
unmoeglich(186)\name   = #CE_SCHWACHE_ARME
unmoeglich(186)\locked = #CE_HAMMERKAMPF
;--------------------------
unmoeglich(187)\name     = #CE_UNDEAD
unmoeglich(187)\locked   = #CE_CANNIBAL
unmoeglich(188)\name     = #CE_CANNIBAL
unmoeglich(188)\locked   = #CE_UNDEAD

unmoeglich(189)\name   = 0
unmoeglich(189)\locked = 0
unmoeglich(190)\name   = 0
unmoeglich(190)\locked = 0

unmoeglich(191)\name   = 0
unmoeglich(191)\locked = 0
unmoeglich(192)\name   = 0
unmoeglich(192)\locked = 0

unmoeglich(193)\name   = 0
unmoeglich(193)\locked = 0
unmoeglich(194)\name   = 0
unmoeglich(194)\locked = 0

unmoeglich(195)\name   = #CE_UDJAT
unmoeglich(195)\locked = #CE_DUMM
unmoeglich(196)\name   = #CE_DUMM
unmoeglich(196)\locked = #CE_UDJAT

unmoeglich(197)\name   = #CE_LAHM
unmoeglich(197)\locked = #CE_SCHNELLIGKEIT
unmoeglich(198)\name   = #CE_SCHNELLIGKEIT
unmoeglich(198)\locked = #CE_LAHM

unmoeglich(199)\name   = #CE_LAHM
unmoeglich(199)\locked = #CE_KUNDSCHAFTER
unmoeglich(200)\name   = #CE_KUNDSCHAFTER
unmoeglich(200)\locked = #CE_LAHM

unmoeglich(201)\name   = #CE_SCHATZJAEGER
unmoeglich(201)\locked = #CE_UNAUFMERKSAM
unmoeglich(202)\name   = #CE_UNAUFMERKSAM
unmoeglich(202)\locked = #CE_SCHATZJAEGER

unmoeglich(203)\name   = #CE_MAGIELEHRE
unmoeglich(203)\locked = #CE_NATIVE_MAGIE
unmoeglich(204)\name   = #CE_NATIVE_MAGIE
unmoeglich(204)\locked = #CE_MAGIELEHRE

unmoeglich(205)\name   = #CE_KEIN_ANGRIFF
unmoeglich(205)\locked = #CE_SCHWACHE_ARME
unmoeglich(206)\name   = #CE_SCHWACHE_ARME
unmoeglich(206)\locked = #CE_KEIN_ANGRIFF

unmoeglich(207)\name     = #CE_MONKEY_GRIP
unmoeglich(207)\locked   = #CE_SCHWACHE_ARME
unmoeglich(208)\name     = #CE_SCHWACHE_ARME
unmoeglich(208)\locked   = #CE_MONKEY_GRIP

unmoeglich(209)\name     = #CE_AWARENESS
unmoeglich(209)\locked   = #CE_UNAUFMERKSAM
unmoeglich(210)\name     = #CE_UNAUFMERKSAM
unmoeglich(210)\locked   = #CE_AWARENESS

unmoeglich(211)\name     = #CE_AWARENESS
unmoeglich(211)\locked   = #CE_KURZSICHTIG
unmoeglich(212)\name     = #CE_KURZSICHTIG
unmoeglich(212)\locked   = #CE_AWARENESS

unmoeglich(213)\name     = #CE_UNAUFMERKSAM
unmoeglich(213)\locked   = #CE_ALCHEMIE
unmoeglich(214)\name     = #CE_ALCHEMIE
unmoeglich(214)\locked   = #CE_UNAUFMERKSAM

unmoeglich(215)\name     = #CE_KAMPF_IN_RUESTUNG
unmoeglich(215)\locked   = #CE_VERUNSTALTET
unmoeglich(216)\name     = #CE_VERUNSTALTET
unmoeglich(216)\locked   = #CE_KAMPF_IN_RUESTUNG

unmoeglich(217)\name     = #CE_BOGENSCHIESSEN
unmoeglich(217)\locked   = #CE_SCHWACHE_FINGER
unmoeglich(218)\name     = #CE_SCHWACHE_FINGER
unmoeglich(218)\locked   = #CE_BOGENSCHIESSEN

unmoeglich(219)\name     = #CE_ZEN_BOGEN
unmoeglich(219)\locked   = #CE_SCHWACHE_FINGER
unmoeglich(220)\name     = #CE_SCHWACHE_FINGER
unmoeglich(220)\locked   = #CE_ZEN_BOGEN

unmoeglich(221)\name     = #CE_SCHARFSCHUETZE
unmoeglich(221)\locked   = #CE_SCHWACHE_FINGER
unmoeglich(222)\name     = #CE_SCHWACHE_FINGER
unmoeglich(222)\locked   = #CE_SCHARFSCHUETZE

EndProcedure


; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 448
; FirstLine = 445
; Folding = -
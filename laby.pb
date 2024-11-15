; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.


; Lost Labyrinth
; Hauptprogramm
; Version: 4.5.0
;   (c) 2003 - 2010  Markus Döbele
; letzte Aenderung:
;   02.04.2003 Markus Döbele   Linuxversion (2 h)
;   17.01.2004 Markus Döbele   Skills auswaehlen begonnen (12 h!)
;   19.01.2004 Markus Döbele   Skills Menue erweitert (8 h)
;   21.01.2004 Markus Döbele   Sound hinzugefuegt (1 h)
;   23.01.2004 Markus Döbele   Hauptschirm erweitert, Highscores, Credits (10 h)
;   24.01.2004 Markus Döbele   Aufsteigen und Hilfescreen (8 h)
;   25.01.2004 Markus Döbele   Inventar angefangen (1 h)
;   27.01.2004 Markus Döbele   Inventar erweitert (4 h)
;   28.01.2004 Markus Döbele   Spellmenue angefangen, plus Animationen (4 h)
;   29.01.2004 Markus Döbele   Inventar erweitert, Laby generieren (8 h)
;   30.01.2004 Markus Döbele   Monster/Skelette/Fallen etc setzen, Kampf (4 h)
;   31.01.2004 Markus Döbele   Kampf erweitert (6 h)
;   01.02.2004 Markus Döbele   Highscore (4 h)
;   02.02.2004 Markus Döbele   Verhungern, Verdursten, Fallen (4 h)
;   03.02.2004 Markus Döbele   Skills, Nexus, Zauber (7 h)
;   04.02.2004 Markus Döbele   Zaubern erweitert, L.O.S. (3 h)
;   05.02.2004 Markus Döbele   Zaubern erweitert, Wirbelwind (3 h)
;   06.02.2004 Markus Döbele   11 Raeume (11 h)
;   07.02.2004 Markus Döbele   Wiedergaenger, Critical Hits, Fallen (4 h)
;   08.02.2004 Markus Döbele   12 Zauber, Optionen, Hinterhalte (5 h)
;   09.02.2004 Markus Döbele   Alle Monster, Lichtdauer, 2 Zauber (5 h)
;   10.02.2004 Markus Döbele   Waffen, Ruestungen (3 h)
;   11.02.2004 Markus Döbele   Druiden-, Schwarze-, Feuer- und Erdmagie (4 h)
;   12.02.2004 Markus Döbele   Wasser-, Sternen, Bardenmagie (4 h)
;   13.02.2004 Markus Döbele   Luftmagie (1 h)
;   14.02.2004 Markus Döbele   Fehler behoben (1 h)
;   15.02.2004 Markus Döbele   Monster Fernkampf (2 h)
;   16.02.2004 Markus Döbele   Fernkampf erweitert (3 h)
;   17.02.2004 Markus Döbele   Flueche (4 h)
;   18.02.2004 Markus Döbele   Runenfallen (2 h)
;   19.02.2004 Markus Döbele   Windows Version (4 h)
;   20.02.2004 Markus Döbele   Windows Version (1 h)
;   22.02.2004 Markus Döbele   Maennchen auswaehlen, Illusionsmagie (2 h)
;   23.02.2004 Markus Döbele   Characterinfo, Hohe Magie, Fluss, Brunnen, Teleport (4 h)
;   24.02.2004 Markus Döbele   Hexerei, Schleichen, Bogenschiessen, Warlock (3 h)
;   25.02.2004 Markus Döbele   9 neue Zauber, aktive Zauber neu (5 h)
;   26.02.2004 Markus Döbele   3 neue Zauber (1 h)
;   28.02.2004 Markus Döbele   8 neue Zauber (3 h)
;   29.02.2004 Markus Döbele   5 neue zauber, Schriftrollen (3 h)
;   01.03.2004 Markus Döbele   Traenke, Code cleanup (5 h)
;   02.03.2004 Markus Döbele   Bugfixing (2 h)
;   03.03.2004 Markus Döbele   Verborgene Schaetze, Altar, 5 mag. Gegenstaende (5 h)
;   06.03.2004 Markus Döbele   Bugfixing, Zauberstaebe, Medusahaupt (3 h)
;   07.03.2004 Markus Döbele   Monstereigenschaften (1 h)
;   08.03.2004 Markus Döbele   Laufen mit Maus (1 h)
;   09.03.2004 Markus Döbele   Bugfixing, Windows Version (4 h)
;   10.03.2004 Markus Döbele   Bugfixing, Ablegen (1 h)
;   11.03.2004 Markus Döbele   Maussteuerung, Feuerdaemon, Verstaerkung (5 h)
;   12.03.2004 Markus Döbele   Zweihaender (1 h)
;   14.03.2004 Markus Döbele   Behinderung durch Ruestung (1 h)
;   16.03.2004 Markus Döbele   Geheimtueren entdecken, Diebstahl, Skills, Pilze (6 h)
;   23.03.2004 Markus Döbele   Bugfixes (1 h)
;   24.03.2004 Markus Döbele   Buttonfunktionen anzeigen (2 h)
;   25.03.2004 Markus Döbele   Buttonfunktionen fertig (1 h)
;   04.04.2004 Markus Döbele   Bugfixing (1 h)
;   14.04.2004 Markus Döbele   Bugfixing, Optionen mit Maus (1 h)
;   15.04.2004 Markus Döbele   Multiplayer (3 h)
;   27.04.2004 Markus Döbele   Multiplayer (1 h)
;   28.04.2004 Markus Döbele   Multiplayer (1 h)
;   14.05.2004 Markus Döbele   Multiplayer (3 h)
;   15.05.2004 Markus Döbele   Multiplayer (1 h)
;   16.05.2004 Markus Döbele   Zauber auf Tasten, sprachenfile (3 h)
;   19.05.2004 Markus Döbele   sprachennfile, Multiplayer (4 h)
;   23.05.2004 Markus Döbele   Bugfixing (1 h)
;   24.05.2004 Markus Döbele   Online Highscore (1 h)
;   08.08.2005 Markus Döbele   Spanische Version, Neuer Compiler (5 h)
;   09.08.2005 Markus Döbele   Spanische Version (8 h)
;   10.08.2005 Markus Döbele   Bugfixes (2 h)
;   11.08.2005 Markus Döbele   Sonderlevel (10 h)
;   12.08.2005 Markus Döbele   6 neue mag Gegenstaende (4 h)
;   13.08.2005 Markus Döbele   Wassermonster, Hexe (8 h)
;   14.08.2005 Markus Döbele   Packer integriert, Bilder fuer Sonderlevel (8 h)
;   15.08.2005 Markus Döbele   Verwandlungszauber, RPM erstellt (8 h)
;   16.08.2005 Markus Döbele   Verwandlungszauber, RPM verbessert, Restliche Flueche (10 h)
;   17.08.2005 Markus Döbele   Beschwoerungszauber (8 h)
;   18.08.2005 Markus Döbele   Beschwoerungszauber, Bugfixes (6 h)
;   19.08.2005 Markus Döbele   Bugfixes (4 h)
;   21.08.2005 Markus Döbele   Bugfixes (2 h)
;   22.08.2005 Markus Döbele   Zentauerwald, Trainer, Drachenraum, Sonderlevel verbessert (6 h)
;   23.08.2005 Markus Döbele   7 neue Magische Gegenstaende (4 h)
;   24.08.2005 Markus Döbele   Bugfixes (2 h)
;   25.08.2005 Markus Döbele   Icons fuer Enchantments, 5 neue mag Gegenstaende, Waffen+Ruestungen Neu (6 h)
;   27.08.2005 Markus Döbele   Waffen+Ruestungen Neu (2 h)
;   28.08.2005 Markus Döbele   Ablegen, Lavaschatz, Stabteilraum, Steine (5 h)
;   29.08.2005 Markus Döbele   Spielende, Andere heilen/entgiften, Spitzhacke, Schaufel, Vergrabene Schatztruhe, Highscore erweitert (6 h)
;   30.08.2005 Markus Döbele   Highscore erweitert, Codecleanup (3 h)
;   31.08.2005 Markus Döbele   Bugfixing (2 h)
;   01.09.2005 Markus Döbele   Code Cleanup, Doppelgaenger, Magische Ruestung (3 h)
;   02.09.2005 Markus Döbele   11 neue Magische Gegenstaende (2 h)
;   03.09.2005 Markus Döbele   Laby Kernel Neu (3 h)
;   04.09.2005 Markus Döbele   Taverne (4 h)
;   05.09.2005 Markus Döbele   Uralte Hydra, Kampf verbessert (7 h)
;   08.09.2005 Markus Döbele   Level: Illusionen, Spinnen, Spielgeschwindigkeit, Laden+Speichern (4 h)
;   10.09.2005 Markus Döbele   4 neue Splashes, Suchen in Raeumen, Restliche Monstereigenschaften (5 h)
;   11.09.2005 Markus Döbele   Bugfixing, Andere entfluchen, Steine zerstoeren (2 h)
;   12.09.2005 Markus Döbele   38 neue Monster, Skillmenue erweitert (6 h)
;   13.09.2005 Markus Döbele   21 neue Skills (8 h)
;   16.09.2005 Markus Döbele   Bugfixes (1 h)
;   17.09.2005 Markus Döbele   Bugfixes, Orkan , Online Highscore (4 h)
;   18.09.2005 Markus Döbele   Online Highscore, Monster hinterlassen Schaetze (3 h)
;   19.09.2005 Markus Döbele   Bewachter Schatzraum, Zauberer, Teich, Pilze neu (3 h)
;   21.09.2005 Markus Döbele   Mimic, Regeneration (1 h)
;   25.09.2005 Markus Döbele   Unsichtbarkeit (Monster und Spieler), Monsterkunde verbessert (3 h)
;   27.09.2005 Markus Döbele   Levelmodifier, Waffenklassen, Wurfwaffen, Geister bannen (5 h)
;   30.09.2005 Markus Döbele   Load Button Titel, Readme Spells (1 h)
;   01.10.2005 Markus Döbele   Turn skippen (2 h)
;   02.10.2005 Markus Döbele   Mystic Attack, leeme, leeme_hechizos, Feuerkreis, Mentalschlag, Neue Effekte (4 h)
;   03.10.2005 Markus Döbele   Sounds fuer Monster, Vergessene Schmiede, Los fixed, Windows Version, Fullscreen/Fenster (5 h)
;   04.10.2005 Markus Döbele   Creatures und Teleporter/Eisbloecke, Sternenfee laeuft durch Waende, Drache schlaegt Tueren ein (2 h)
;   05.10.2005 Markus Döbele   Bugfixes (1 h)
;   06.10.2005 Markus Döbele   Kleinigkeiten (1 h)
;   07.10.2005 Markus Döbele   FAQ, Zauber Effekte - Windows , releaseMouse (3 h)
;   08.10.2005 Markus Döbele   Joystick, Inventory mit Tastatur/Joystick (3 h)
;   09.10.2005 Markus Döbele   Joystick (1 h)
;   10.10.2005 Markus Döbele   Joystick, Kochen, Haendler mit Tastatur/Joystick (4 h)
;   11.10.2005 Markus Döbele   Haendler/Lehrer/Gefaehrten/Wizard/Vergolden/Opfern mit Tastatur/Joystick, Body anzeigen (6 h)
;   13.10.2005 Markus Döbele   Gegenstaende mit Maus bewegen (6 h)
;   14.10.2005 Markus Döbele   Gegenstaende mit Maus bewegen (4 h)
;   15.10.2005 Markus Döbele   Spells: Flameburst, Fireball, Armageddon, Meteor, Levelmodifier: Extremely Cold/Hot, Room of Traps, Skill: Merchant, Items: Flaschengeist, Stack Items, 15 new Potions, 8 neue Zauberstaebe (9 h)
;   16.10.2005 Markus Döbele   Fackel/Lampeneffekt anzeigen, Stapeln bei Zeug mit Ladungen, Magic Apple verbessert, Spells: Blitzeschutz/Versteinernschutz, 11 Amulette, 3ter Haendler (4 h)
;   17.10.2005 Markus Döbele   Bugfixes, Spell: 1000 Klingen (2 h)
;   18.10.2005 Markus Döbele   Spells: Dance of Ghosts, Invulnerability, Find Nexus/Sanktum, Trank der Unverwundbarkeit, Punkte in Cinfo, Kreaturen Zeug aufnehmen, Schaden vermeiden neu (5 h)
;   19.10.2005 Markus Döbele   Zaubern/Inventory abbrechen kostet keinen Zug mehr, Steinschleuder, Munition in Bodybild anzeigen (4 h)
;   20.10.2005 Markus Döbele   Zufaelliger Fluch mit 50% bei Verflucht, 2H Waffenbehandlung neu, 8 neue Knochen, Movecounter, 6 neue Ringe, Ringmeister bekommt einen Ring, Windows Version (6 h)
;   21.10.2005 Markus Döbele   Animation Turn to stone, Haendler Pilze und Traenke nicht anzeigen, Haendler Beschreibungen von magischen Gegenstaenden anzeigen (3 h)
;   22.10.2005 Markus Döbele   Spieler in unterschiedlichen Levels (6 h)
;   23.10.2005 Markus Döbele   Spieler in unterschiedlichen Levels, Spiel endet nach Ebene 150! (4 h)
;   24.10.2005 Markus Döbele   Top Level angefangen, Schaufel behoben, Haendler berichtigt, Zauberstab Effekte, Schleichen neu, Diagonal verhindern, Karte zerstoeren, Invisibility Bug, Turn to stone, Highscore (3 h)
;   25.10.2005 Markus Döbele   Neues Design (4 h)
;   26.10.2005 Markus Döbele   Schnellinventory (6 h)
;   27.10.2005 Markus Döbele   Schnellinventory, F-Tasten, Farben C-Info Screen+Highscore, Karte scrollen (6 h)
;   28.10.2005 Markus Döbele   Spieler+Kreaturen in Karte anzeigen, Move Back Buttons, Schriftrollen finden, Unsichtbarkeit geaendert, Suchen auf Friedhof, 11 Gegenstaende, Haendler4 (5 h)
;   29.10.2005 Markus Döbele   Neue Gegenstaende (2 h)
;   30.10.2005 Markus Döbele   Stati fuer Monster, Verhexen geaendert, Schleichen geaendert, Spell: Vergiften (5 h)
;   31.10.2005 Markus Döbele   Monster Regeneration und Vergiftung geaendert, Stati fuer Waffen/Ruestungen, Waffen vergiften, Skills: Giftkenntis, Lahm, Spell: Resurrection (6 h)
;   01.11.2005 Markus Döbele   Scrolling in Titel, Giftschwert, Sounds fuer Kreaturen, Gold in Rucksack anzeigen, Gold ablegen, Gold stehlen, Alle Raeume 5x5 oder 8x8, Skills: Visionen, Erde spueren (7 h)
;   02.11.2005 Markus Döbele   Skill: Schatzjaeger, Scrollore, Zauber: Schlaf (3 h)
;   03.11.2005 Markus Döbele   Amulett des Durstloeschens, Amulett der Ernaehrung (1 h)
;   04.11.2005 Markus Döbele   jpg statt bmp, 7 neue Monster, Zauberbeschreibung des Zaubers auf dem die Maus ist, Aktive Zauber beenden, Neuer Sound fuer Blitze, Zauber: Pestilence (3 h)
;   05.11.2005 Markus Döbele   Heilkraeuter, Einstellungen speichern, Sunken Treasure, Wueste des Vergessens, Alle Raeume 8x8, Haendler Bug (5 h)
;   06.11.2005 Markus Döbele   Sonderlevel, Levelmodifier bei Spielstart, Inhalt von Truhen am Levelstart festlegen, Teleporter anstatt Treppen, Pilze durch Objekte ersetzt, 5 neue Wassermonster, Archipel der Alten (6 h)
;   07.11.2005 Markus Döbele   Maennchen in Wasser halb uebermalen, Spinnenkoenigin, Goblinkoenig, Herr der Untoten, 2 neue Spinnen (2 h)
;   08.11.2005 Markus Döbele   Koenige nur aktueller Level, Fledermaus+Vogelgestalt haben jetzt LP/3, Katze/2 und Drache*3, Katzengestalt+3 gegen Ratten+ befreundet Katzen, Wolfsgestalt Woelfe, Katzengestalt Katzen, Angeln, Spell: Telekinesis, Windows Version (7 h)
;   09.11.2005 Markus Döbele   Windows Version, Neuer Highscore Upload, Frozen Lightning, Traptoolkit, 6 Weapons, Homepage (6 h)
;   10.11.2005 Markus Döbele   release 1.8.1, Homepage (7 h)
;   11.11.2005 Markus Döbele   Creaturen + Objekte aufnehmen, Online Highscore (7 h)
;   12.11.2005 Markus Döbele   Neue Homepage online (3 h)
;   13.11.2005 Markus Döbele   Runes, Online Highscore verbessert, FAQ verbessert (4 h)
;   14.11.2005 Markus Döbele   release 1.8.3 (2 h)
;   15.11.2005 Markus Döbele   Pfeile vergiften, Raum: Thronsaal, Zauber: Vakuum, Giftschutz, Speziallevel: Sumpf der Einsamkeit (6 h)
;   16.11.2005 Markus Döbele   Bugfixes (2 h)
;   17.11.2005 Markus Döbele   Bugfixes (2 h)
;   18.11.2005 Markus Döbele   Animationen fuer Fallen, Wounded Hero (4 h)
;   20.11.2005 Markus Döbele   Trait Statistik (3 h)
;   21.11.2005 Markus Döbele   fasm problem behoben, Dart Animation, Kleinhaendler (4 h)
;   22.11.2005 Markus Döbele   Automapping (3 h)
;   23.11.2005 Markus Döbele   2 Zeilen pro Skill, Mailingliste (7 h)
;   24.11.2005 Markus Döbele   Teleporter+Bewegt, Wasser+Waterskin, Beschreibung fuer Schnellinventory, Fullscreen+Windows, Schnellinventory benutzen/entnutzen, Grafikfehler Skelette (5 h)
;   25.11.2005 Markus Döbele   Grafikfehler Skelette, Bogen+Unsichtbare, Monsterzauber: Teleport, Neues Design, Neues Bodybild (6 h)
;   26.11.2005 Markus Döbele   Creatures+versch.Level, Haendler unter Spieler in untersch. Levels (3 h)
;   27.11.2005 Markus Döbele   release 1.9.2, Schon gewaehlte Maennchen werden nicht mehr angezeigt, Blaue Truhe, 25 neue Monster, 13 neue Waffen, Haendler 5 (7 h)
;   28.11.2005 Markus Döbele   Stehlen+Monsterstati, Visionen verbessert, Zauber: Pflanze zerstoeren, 3 neue Monster, Modularisierungen, Plain Settingsfile (8 h)
;   29.11.2005 Markus Döbele   Silentmode (2 h)
;   30.11.2005 Markus Döbele   Bugfixes, Scrollore changed, Kurzsichtig geaendert, Blutmagie geaendert (8 h)
;   01.12.2005 Markus Döbele   Neuer Untergrund fuer Eislevel, Elfenblut geaendert, Module Tests, Codeoptimierungen, Module Support (9 h)
;   02.12.2005 Markus Döbele   Bugfixes, Feuerkreis->Desintegration, Bogen+Hydra, release 1.9.5, Show Highscores verbessert, Schmiedekunst, Preise Elder/Ancient (6 h)
;   03.12.2005 Markus Döbele   Bugfixes, Einhorn, Silberner/Goldener Schluessel (2 h)
;   04.12.2005 Markus Döbele   Erlernte Zauber speichern, Verschiedene Wassermonster (3 h)
;   05.12.2005 Markus Döbele   Mehrere Savegames, Freie Magie (4 h)
;   06.12.2005 Markus Döbele   Templates, Haendler erklaert Schriftrollen, Windows Version, release 2.0.1 (7 h)
;   07.12.2005 Markus Döbele   Neuer Laby Algorythmus (2 h)
;   08.12.2005 Markus Döbele   Neuer Laby Algorythmus (2 h)
;   09.12.2005 Markus Döbele   Bugfixes, Monsterzauber: Dispel (3 h)
;   10.12.2005 Markus Döbele   Bugfixes, Freie Magie geaendert (2 h)
;   11.12.2005 Markus Döbele   Highscore nach Punkten/Zeit sortieren, Labyrinth spiegeln, Lichtests (6 h)
;   12.12.2005 Markus Döbele   Diagonal spiegeln, release 2.0.3 (3 h)
;   13.12.2005 Markus Döbele   Weight, Zauber: Mit Tieren reden, Energie der Steine (4 h)
;   14.12.2005 Markus Döbele   Magischer Bogen, Levelmod : Alarmierte Monster, Crysolit, Zauber: Wegblasen, Bugfixes: Verlaengern, Syphon (4 h)
;   15.12.2005 Markus Döbele   Punkte in C-Info, F-Tasten+Guertel, Identifizierte Traenke/Schriftrollen, Chancen in C-Info, Bugfixes, Umherschauen geaendert (5 h)
;   16.12.2005 Markus Döbele   Bugfixes: Staerkeberechnung, Zauber: Blenden (3 h)
;   17.12.2005 Markus Döbele   Bugfixes: Haendler+Id.Schriftrollen (2 h)
;   18.12.2005 Markus Döbele   Qualitaeten fuer Gegenstaende, Bugfixes: Freemagic Crash, release 2.0.5 (3 h)
;   19.12.2005 Markus Döbele   Delay3, min/max schaden neu, Entdeckte Fallen +30% ausweichen, Naga Pfeile, Fehler: Kreaturen+Automap (3 h)
;   20.12.2005 Markus Döbele   Naga Pfeile, Alchemie neu, Monsterlore, 2 Seite C-Info (5 h)
;   21.12.2005 Markus Döbele   Bugfixes, Alle Ruestungen beschaedigen (3 h)
;   22.12.2005 Markus Döbele   Kritische geaendert, Gott der Geheimnisse geaendert, Flecke aus Monster ausgelagert, Lore durch Aktionen, Haendler+Qualitaeten (6 h)
;   23.12.2005 Markus Döbele   Haendler bug (2 h)
;   27.12.2005 Markus Döbele   Wassermonster+Bogen, Kreaturen+Hydra (5 h)
;              Rasmus Klette   Skill Menue überarbeitet (5 h)
;   28.12.2005 Markus Döbele   Bugfixes (4 h)
;   29.12.2005 Markus Döbele   Neue Monster, 5 neue Zauber, release 2.1.3 (6 h)
;   30.12.2005 Rasmus Klette   Berechnung des Menues mit Anzahl Skills, "Alle Skills" Button, Diamanten Tiles verbessert, 3 Neue Buttons, Skill Save Menue Save, (8 h)
;              Markus Döbele   3 neue Zauber, Homepage verbessert (5 h)
;   31.12.2005 Rasmus Klette   Sprachauswahl im Titel speichern (1 h)
;   01.01.2006 Markus Döbele   Neue Zauber: Vogel beschw, Gift neutralisieren (2 h)
;              Rasmus Klette   Schadenswerte zentriert, Bugfixes: Flimmern am Rundenende und beim Betreten von neuen Raeumen
;   02.01.2006 Markus Döbele   Bugfixes (3 h)
;              Rasmus Klette   Neue Zentrale Stringeingabe (2 h)
;   03.01.2006 Markus Döbele   Buttons fuer Hoch/Runter neu, 9 Neue Animationen, Monster huepfen (7 h)
;              Rasmus Klette   Neue Delay Methode (7 h)
;   04.01.2006 Markus Döbele   Waffenstatus in Mainscreen, Bugfixes,  2.2.0 (5 h)
;              Rasmus Klette   Neue Zentrale Stringeingabe (5 h)
;   05.01.2006 Markus Döbele   Bird everywhere, LM: Illusionary walls, Zauber: Todeswolke, Verdorren (4 h)
;   06.01.2006 Markus Döbele   Bugfixes,  2.2.1 (2 h)
;   07.01.2006 Markus Döbele   Beschw. Gegenst. aufloesen (2 h)
;   11.01.2006 Markus Döbele   Englische Schreibfehler, Index FAQ,  2.2.2, schleuder (4 h)
;   13.01.2006 Markus Döbele   Regulationen, Fernkampf+Zuruecklassen, Tiles wechseln (5 h)
;   14.01.2006 Markus Döbele   Nachrichtenschirm, Monster huepfen bei Kreatur, Neue Runenfalle, Highscore Verifikation, Spanische Schreibfehler (10 h)
;   15.01.2006 Markus Döbele   2.3.0 (2 h)
;   16.01.2006 Markus Döbele   Bugfixes, Icons fuer Schulen (5 h)
;   17.01.2006 Markus Döbele   Bugfixes,  2.3.1 (2 h)
;   19.01.2006 Markus Döbele   Doppelklick, Zauber: Insektenschwarm, Sekundaere Faehigkeiten (6 h)
;   20.01.2006 Markus Döbele   7 neue Gegenstaende, Bugfixes,  2.3.2 (4 h)
;   21.01.2006 Markus Döbele   Inventory ueberarbeitet, Bogen und Kritische (5 h)
;   22.01.2006 Markus Döbele   Bugfixes,  2.3.3 (3 h)
;   23.01.2006 Markus Döbele   Strukturen verbessert, Metamagie, Zauber: Tunnel (6 h)
;   24.01.2006 Markus Döbele   Bugfixes (1 h)
;   25.01.2006 Markus Döbele   Zauber: quickspells, Verlaengern2, Neuer Button fÃ¼r Automapping, Alkoholische GetrÃ¤nke (4 h)
;   26.01.2006 Markus Döbele   Rinnsaale, Klicking, Spieler Huepfen,  2.3.4 (6 h)
;   27.01.2006 Markus Döbele   Neuigkeiten als db (2 h)
;   28.01.2006 Markus Döbele   Bugfixes, Animationen Geschwindigkeit,  2.3.5 (2 h)
;   29.01.2006 Markus Döbele   Bugfixes (2 h)
;   30.01.2006 Markus Döbele   Farben fuer Nachrichten (3 h)
;   31.01.2006 Markus Döbele   Bugfixes,  2.4.0 (3 h)
;   01.02.2006 Markus Döbele   Bugfixes, FAQ Raeume, FAQ Sonderlevel, FAQ Monsterfaehigkeiten, 14 neue Charakteranimationen, 2te Auswahlseite (6 h)
;   02.02.2006 Markus Döbele   Bugfixes (2 h)
;   03.02.2006 Markus Döbele   Bugfixes,  2.4.1 (2 h)
;   04.02.2006 Markus Döbele   Blinking cursor, Zauberweben, Admin Seite fuer Neuigkeiten, Beschworene Kreatures aufstehen, Magieresistenz neu (8 h)
;   05.02.2006 Markus Döbele   Explodierende Monster, Durchschlagende Pfeile, Weaponcraft und Spezialpfeile, Kampfstile, Interaktion mit Objekten neu (10 h)
;   06.02.2006 Markus Döbele   2.4.2, Bugfixes (3 h)
;   07.02.2006 Markus Döbele   In_Rucksack, FAQ Unterschiede New/Classic Laby, 2 neue Raeume (4 h)
;   08.02.2006 Markus Döbele   Traenke mischen, Opfer Schirm verbessert (3 h)
;   09.02.2006 Markus Döbele   2.4.3, Monstersense, Scharfschuetze (2 h)
;   10.02.2006 Markus Döbele   Bugfixes, Lichtradius (4 h)
;   11.02.2006 Markus Döbele   Bugfixes (2 h)
;   12.02.2006 Markus Döbele   Bugfixes,  2.4.4 (2 h)
;   13.02.2006 Markus Döbele   Ghosthunter, Immune normal damage, Spawning, Special successes (4 h)
;   14.02.2006 Markus Döbele   2.5.0 + 2.5.1, Bugfixes (6 h)
;   15.02.2006 Markus Döbele   Tiles verbessert, Schmiede geaendert (2 h)
;   17.02.2006 Markus Döbele   Feuer+Wasserelementar, Licht+Kreaturen (5 h)
;   18.02.2006 Markus Döbele   Bugfixes,  2.5.2 (2 h)
;   19.02.2006 Markus Döbele   Tests mehrere Raeume pro Ebene (6 h)
;   20.02.2006 Markus Döbele   Bugfixes (2 h)
;   21.02.2006 Markus Döbele   Titelbild/Spieleranzahl mit Tastatur und Joystick (4 h)
;   22.02.2006 Markus Döbele   Skills mit Tastatur und Joystick (6 h)
;   24.02.2006 Markus Döbele   Bugfixes (3 h)
;   26.02.2006 Markus Döbele   Credits mit Tastatur, Namen eingeben mit Joystick, Bild fuer Gefaengnis, Orkdorf, New light radius and earthsense (8 h)
;   27.02.2006 Markus Döbele   2.5.3 (1 h)
;   28.02.2006 Markus Döbele   Hexenhaus (2 h)
;   04.03.2006 Markus Döbele   Bugfixes: Findentexte, Text Daemon, Zittern Teleport (windows), cursor (windows), Sternenfee und Aussenwaende, Matrix und windows (4 h)
;   08.03.2006 Markus Döbele   Joystick verbessert (5 h)
;   11.03.2006 Markus Döbele   Center Button fuer Karten, Honig (3 h)
;   13.03.2006 Markus Döbele   Explosionen neu (3 h)
;   16.03.2006 Markus Döbele   Unerreichbarer Ausgang, Neue Animationen (4 h)
;   17.03.2006 Markus Döbele   Neue Animationen (4 h)
;   19.03.2006 Markus Döbele   Grafikfehler behoben,  2.6.0 (2 h)
;   21.03.2006 Markus Döbele   Joystick/Tastatur und Select item Screen, Beschreibung Pilze beim Zerstoeren, Zeit/Datum fuer Savegames, Native Magie (4 h)
;   22.03.2006 Markus Döbele   Bugfixes (2 h)
;   24.03.2006 Markus Döbele   Blocked Exit fixed, Bugfixes (2 h)
;   26.03.2006 Markus Döbele   Pfeile und explodierende Monster (4 h)
;   31.03.2006 Markus Döbele   Bogen mit Knopf 5, Wasser/Feuerelementar Ã¼berqueren Wasser/Feuer, Zauber: Lied des Schlafes/Selbstmords (4 h)
;   01.04.2006 Markus Döbele   Bugfixes,  2.6.2 (2 h)
;   02.04.2006 Markus Döbele   Summoner (2 h)
;   03.04.2006 Markus Döbele   Icon fuer Summoner, Kreatur heilen, Umschauen erklaert auch Felder (7 h)
;   06.04.2006 Markus Döbele   Kreaturen verzaubern (2 h)
;              Rasmus Klette   Room Editor Gestarted (6 h)
;   07.04.2006 Rasmus Klette   key_sting verbessert, Editor erweitert (6 h)
;   08.04.2006 Markus Döbele   Kreaturen verzaubern,  2.6.2 (2 h)
;              Rasmus Klette   Room Editor: Cleanups, Grafisches Interface, Speichern mit Dateinamen (4 h)
;   09.04.2006 Markus Döbele   Freie Magie nur neue Zauber anzeigen, Magische Helme (3 h)
;              Rasmus Klette   Room Editor: Speicherart komprimiert (2 h)
;   10.04.2006 Markus Döbele   Hinterhalt aufstehen wie Skelett, 3 neue Levelmods (4 h)
;   12.04.2006 Markus Döbele   Flaschen fuer Lebens/Manapunkte (4 h)
;              Rasmus Klette   Room Editor: Monster und Objekte setzbar gemacht (2 h)
;   13.04.2006 Markus Döbele   Flaschen fuer Lebens/Manapunkte (2 h)
;   17.04.2006 Markus Döbele   Readmes anzeigen,  2.6.4 (3 h)
;   18.04.2006 Markus Döbele   Staemmig, Krankheiten, Schieben (4 h)
;   23.04.2006 Markus Döbele   Fallgitter (2 h)
;   26.04.2006 Markus Döbele   Nagelgruben (2 h)
;   28.04.2006 Markus Döbele   Immun gegen Wind, 6 neue Monster (2 h)
;   09.05.2006 Markus Döbele   Wahrlicht durch Waende (2 h)
;   25.05.2006 Markus Döbele   Kleine Grafikfehler (1 h)
;   30.05.2006 Markus Döbele   Skills erklaeren in C-Info Screen (1 h)
;   31.05.2006 Markus Döbele   Flueche erklaeren in Hauptscreen (2 h)
;   01.06.2006 Rasmus Klette   Ausloten fuer das neue Raumsystem (3 h)
;   02.06.2006 Markus Döbele   Zeitberechnung Online Highscore,  2.7.1, Zauber: Chaos, Transmigration, Konzentration, Praezision (8 h)
;              Rasmus Klette   Neues Raumsystem im Editor (6 h)
;   03.06.2006 Rasmus Klette   Neues Raumsystem im Spiel (6 h)
;   04.06.2006 Rasmus Klette   Neues Raumsystem ohne Bild und HG, Anfaenge der Raum Scriptlanguage (5 h)
;   05.06.2006 Rasmus Klette   Raumsystem voll implementiert, Laden aus slroom automatisch (5 h)
;   06.06.2006 Markus Döbele   Stundenglas, Broomstick (3 h)
;              Rasmus Klette   Wiedereinbau des neuen String und Nummer Eingabesystems in LL (3 h)
;   14.06.2006 Markus Döbele   Bugfix: Unaufmerksam (1 h)
;   17.06.2006 Markus Döbele   Aenderungen Rasmus einfuegen (1 h)
;   14.07.2006 Markus Döbele   Undurchdringliche Waende richtig darstellen, Neue Option Raumtest (1 h)
;   01.08.2006 Markus Döbele   Fehler beheben (1 h)
;   05.08.2006 Markus Döbele   Neue Homepage (2 h)
;   06.08.2006 Markus Döbele   Neue Homepage online stellen (2 h)
;   17.08.2006 Markus Döbele   Code von Rasmus einfuegen (2 h)
;   18.08.2006 Markus Döbele   Bugfixing,  2.7.3 (5 h)
;   11.09.2006 Markus Döbele   Bugfixing (1 h)
;   17.09.2006 Markus Döbele   Fingerfertigkeit, Secondary skills (2 h)
;   18.09.2006 Markus Döbele   Weak arm, weak fingers, disfigured (1 h)
;   19.09.2006 Markus Döbele   Arbeiten fuer Freigabe nach Ubuntu (1 h)
;   21.09.2006 Markus Döbele   Bugfixes (1 h)
;   22.09.2006 Markus Döbele   Neuer Downloadbereich mit Versionen (1 h)
;   23.09.2006 Markus Döbele   Kalligrafie Set (1 h)
;   24.09.2006 Markus Döbele   Bugfixes (1 h)
;   25.09.2006 Markus Döbele   Bugfixes, cross level teleporter (2 h)
;   26.09.2006 Markus Döbele   Lichtmatrix anderer Spieler (2 h)
;   25.12.2006 Peter Eismann   Update to PB4.02 (Windows)
;   13.01.2007 Roger Roesch    Bugs durch Portierung gefixt, Credits Screen erweitert (4 h)
;   13.01.2007 Roger Roesch    Bugs durch Portierung gefixt (ca 1 h)
;   26.01.2007 Markus Döbele   Bugtracker (2 h)
;   27.01.2007 Roger Roesch    Neue Fehlerprozedur (4 h)
;              Markus Döbele   Neues Forum phpBB3 (2 h)
;   28.01.2007 Markus Döbele   Grafikfehler (2 h)
;   29.01.2007 Peter Eismann   Help screen verbessert (2 h)
;   01.02.2007 Roger Roesch    Deutsche Umlaute (5 h)
;   02.02.2007 Roger Roesch    Deutsche Umlaute (5 h)
;   03.02.2007 Markus Döbele   Crosslevel Teleporter Bug (1 h)
;   04.02.2007 Roger Roesch    Skill Menue erweiterungen (1 h)
;   05.02.2007 Roger Roesch    kill Menue erweiterungen (3 h)
;   07.02.2007 Peter Eismann   Bitmapfonts are usable! ;-) (10 h)
;   08.02.2007 Roger Roesch    Skill Menue Erweiterungen (4 h)
;   08.02.2007 Peter Eismann   BMP -> PNG/JPEG (4 h)
;   09.02.2007 Roger Roesch    Titelscreen Erweiterungen (3 h)
;   09.02.2007 Peter Eismann   Titelscreen Erweiterungen (3 h)
;   10.02.2007 Peter Eismann   Hilfescreen erweitert (5 h)
;   13.02.2007 Peter Eismann   Hilfescreen erweitert (5 h)
;   17.02.2007 Markus Döbele   New skill: monkey grip (1 h)
;   18.02.2007 Markus Döbele   New skill: Awareness (1 h)
;   19.02.2007 Markus Döbele   Bugfixing (Peters bugs) (1 h)
;   20.02.2007 Markus Döbele    2.8.2 (1 h)
;   03.03.2007 Markus Döbele   Buttons+Projektile aus Items ausgelagert (1 h)
;   09.03.2007 Markus Döbele   Neue Bilder von Wizball (2 h)
;   10.03.2007 Markus Döbele   Alle Fonts in ein File, Kleine Fehler (3 h)
;   10.03.2007 Markus Döbele   Neue Spellschool Icons, Projektile (1 h)
;   07.04.2007 Markus Döbele   Neues interface, Kleinigkeiten (5 h)
;   08.04.2007 Markus Döbele    2.8.3 (1 h)
;   18.04.2007 Markus Döbele   Replaced some items with better versions from jorgen (1 h)
;   28.04.2007 Markus Döbele   Buttons for selecting figures and up/down in map screen have been invisible (1 h)
;   30.04.2007 Markus Döbele   Bugfixes, New borders,  2.8.4 (1 h)
;   01.05.2007 Markus Döbele   Maps center button (1 h)
;   05.05.2007 Markus Döbele   Monster wakeup (1 h)
;   08.05.2007 Markus Döbele   Magical hammers (1 h)
;   14.05.2007 Markus Döbele   Small code improvements (1 h)
;   28.05.2007 Markus Döbele   Skill delete button, Batform can move through portculis, translations (3 h)
;   06.07.2007 Markus Döbele   Pickup with mouse, Enter Textstring Bug, scroll spellist with mouse (5 h)
;   07.07.2007 Markus Döbele    2.9.0, Merchant and mouse (2 h)
;   08.07.2007 Markus Döbele   Spells and special letters (1 h)
;   23.12.2007 Markus Döbele   Small changes for new compiler 4.10 (1 h)
;   25.12.2007 Markus Döbele   Restored Pack Script (2 h)
;   27.12.2007 Markus Döbele   Modules working with linux, update readme's, bugfixing (1 h)
;   26.02.2008 Markus Döbele   Slow down scrolling on faster machines (1 h)
;   29.02.2008 Markus Döbele   Spell icons fixed (1 h)
;   19.03.2008 Markus Döbele   Akolyth and Sanctum (1 h)
;   31.03.2008 Markus Döbele   Small bugs: Lightning, Firedemon (1 h)
;   14.04.2008 Markus Döbele   Small bugs with some Arrays (1 h)
;   24.04.2008 Markus Döbele   Teleport+Automap, creatures delay, dark mana, encumbrance, autostacking, fighting styles, spellweaving (4 h)
;   11.05.2008 Markus Döbele   Save files in home directory if possible (1 h)
;   12.05.2008 Markus Döbele   Create a new directory .lostlaby in homedir (1 h)
;   14.05.2008 Markus Döbele   Escape key leaves item menue, spell menu, inventory, character data screen  (1 h)
;   22.05.2008 Markus Döbele   New structure for monsters  (6 h)
;   31.05.2008 Markus Döbele   New structure for items  (6 h)
;   01.06.2008 Markus Döbele   More testing  (1 h)
;   07.06.2008 Markus Döbele   Creatures+monster, watermonsters, load+save, witch and orc village, telekinesis, ambush and water  (3 h)
;   08.06.2008 Markus Döbele   Autostacking fixed  (1 h)
;   09.06.2008 Markus Döbele   Throneroom fixed, Swing animation  (1 h)
;   10.06.2008 Markus Döbele   Verstaerkung animiert, bugfixing  (3 h)
;   14.06.2008 Markus Döbele   Added numbers for new movement routine  (1 h)
;   15.06.2008 Markus Döbele   Clear automap with genlaby, new spell destroy rune  (1 h)
;   06.07.2008 Markus Döbele   Got the astar working, just needs to be integrated properly in laby  (3 h)
;   07.07.2008 Markus Döbele   bugfixing: templates path, leave stuff behind, smaller bugfixes  (4 h)
;   08.07.2008 Markus Döbele   astar  (6 h)
;   10.07.2008 Markus Döbele   Bugfixing (array boundaries)  (3 h)
;   11.07.2008 Markus Döbele   Bugfixing feuerlanze, astar (1 h)
;   13.07.2008 Markus Döbele   astar show movement (3 h)
;   14.07.2008 Markus Döbele   astar working (1 h))
;   15.07.2008 Markus Döbele   New movement routine (1 h)
;   15.07.2008 Alexander Kohler  mac version (3 h)
;   15.07.2008 Roger Roesch    Possibility to reset templates (2 h)
;   19.07.2008 Markus Döbele   New movement routine working, natural mana (3 h)
;   03.08.2008 Markus Döbele   True Light and teleporters working with new light algo (4 h)
;   08.08.2008 Roger Roesch    Improved keyboard handling in title screen (2 h)
;   09.08.2008 Markus Döbele   Dark mana improved (1 h)
;   12.08.2008 Markus Döbele   bugfixing: position when jumping when monster attack from distance again,  pickaxe working again, 
;                              all mercenarys had the same traits, exploding monsters And arrows working again, trader explains items again (2 h)
;   13.08.2008 Markus Döbele   light went around laby boundaries, unarmed combat gave no bonus to attack (1 h)
;   16.08.2008 Roger Roesch    Windowed Screen and saving is working again under Windows
;              Markus Döbele   helpful wizard, routing distance increased by 1 field (2 h)
;   17.08.2008 Markus Döbele   Fireaura and invisble monsters (1 h)
;   18.08.2008 Markus Döbele   trapdoor crash (1 h)
;   23.08.2008 Markus Döbele   creatures life as bottle, monstereye and sight, show last messages (3 h)
;   30.08.2008 Bernd Edler     fixed some spelling errors, southbound "poison" spell
;                              load/save now consider the proper amount of spells
;                              one does no longer need the full mana cost left if "syphon" is on
;                              merchant "haendler4" should work now also (6 h)
;   02.09.2008 Markus Döbele   started to translate variables to english (4 h)
;   02.09.2008 Bernd Edler     fixed name conflict from translation,fixed chance calc. for "show traps", fixed broken spells "Poison","Blind" and "Swarm" (2 h)
;   03.09.2008 Bernd Edler     poison now inhibits monster regeneration (10 min)
;   04.09.2008 Bernd Edler     fixed broken automap for transforming tiles (rising skeletons,mimics etc.)
;                              stopped sleeping monsters from doing ranged attacks
;                              fixed spells : "hurricane","turn to stone","eternal winter", made spell "chaos" more usable
;                              added missing gott_check for some spells (6 h)
;   04.09.2008 Bernd Edler     fixed check wall-type (inadvertly passable walls)
;   06.09.2008 Markus Döbele   freeze water (1 h)
;   06.09.2008 Bernd Edler     List blocking skills in skill selection screen
;                              fixed missing tooltip for skill reset,start and back to menu button
;                              fixed wisdom and udjat message display  (9 h)
;                              removed duration spell display from screens where it does not belong e.g.: automap (2 h)
;   07.09.2008 Bernd Edler     removed double entrys from skill blocking table and re-arranged it
;                              fixed garbage potion mixing (off by one error)  (2 h)
;   07.09.2008 Markus Döbele   creature jump (1 h)
;   07.09.2008 Bernd Edler     Keyboard control upgades for various screens
;   08.09.2008 Bernd Edler     some spelling, char encoding error and , mouse icon and key control upgrades  (10 h)
;   11.09.2008 Bernd Edler     some typos, char encoding added keyboard control for spellscools and spell-weaving
;                              displaying numbers for hunger+thirst (4 h)
;   11.09.2008 Bernd Edler     skill-tweaks for treasure hunter and veteran  + cryslolit bonus for mages (2 h)
;   12.09.2008 Bernd Edler     spell chance change and code cleanup im spell animations
;   13.09.2008 Bernd Edler     big cleanup of spell data initialisation and "animate_projectile()" and all banish type spells (5 h)
;   13.09.2008 Markus Döbele   limited chrysolit help to single mages (1 h)
;   13.09.2008 Bernd Edler     fixed keyboard control for alchemy and weaponsmith, id'd scolls display spell circle and "+" for known spells (1 h)
;   14.09.2008 Bernd Edler     improved controls for help,messages and automap screen (4 h)
;   16.09.2008 Bernd Edler     improved controls for spell select, first step towards number based spells, automap dragging with mouse (6 h)
;   19.09.2008 Bernd Edler     completed number based spells, fixed secret door glitch and added keyboard control for automap (8 h)
;   20.09.2008 Bernd Edler     desintegrate now destroys all content, flying creature immune to nailpit, controls for "sonderlevel"
;                              added "Axe of Light",Weaponsmith cases for it and magical hammers, count display in inventory now right aligned (6 h)
;   21.09.2008 Markus Döbele   animations fixed (1 h)
;   22.09.2008 Bernd Edler     fixed spawning of monsters below players/creatures, added automap access for creatures, creatures pick up with space only (ca 4 h)
;   23.09.2008 Bernd Edler     fixed ligh radius calculation (2 h)
;   25.09.2008 Markus Döbele   banish_monsters, shapechange, attack_spell (3 h)
;   25.09.2008 Bernd Edler     fixed keyboard problems under ms-windows (1 h)
;   27.09.2008 Markus Döbele   attack_area (2 h)
;   27.09.2008 Bernd Edler     every visible tile is marked on the automap, show_automap handles the spell induced maps (2 h)
;   27.09.2008 Bernd Edler     wait for key  on player change, better display for time of meta spells,
;                              added missing checks for "BLAUETRUHE" in lots of places (1 h)
;   28.09.2008 Bernd Edler     made dodging mechanical traps more difficult with level - no longer 100% success with only 10 dex
;                              fixed the vanishing "Fallgrube1" bug (3 h)
;   28.09.2008 Markus Döbele   wirbelwind animation, sorcery + elemental magic fixed (2 h)
;   28.09.2008 Bernd Edler     every visible tile is marked on the automap for creatures too (ca 1 h)
;                              fixed problem with traps concerning fallgrube patch
;   29.09.2008 Bernd Edler     fixed astar routing beyond laby borders
;                              fixed flaschen display for creatures (ca 2 h)
;   02.10.2008 Markus Döbele   helpful wizard fixed, shapechanger fixed (1 h)
;   02.10.2008 Bernd Edler     added flying attrib to hornet+wasp, fixed creature outdoor sight
;                              added astar routing for creatures + made routing work with speeds > 9 (6 h)
;   04.10.2008 Bernd Edler     made number of active spells slots generic, improved controls for character status
;                              partial fix for graphic problems under ms-windows, fixed bard song deleting item effects
;                              empowered bard songs by making them work 100% and reducing their cost to 0
;                              stopped desintegration from removing hydra parts (4 h)
;   05.10.2008 Markus Döbele   open and green chests, starfaerie and walk in walls (1 h)
;   05.10.2008 Bernd Edler     tool-tip info for character status screen (5 h)
;                              fire+poison fields no longer vanish walking over, tidal wave quenches fire (1 h)
;   06.10.2008 Bernd Edler     area_attack now does damage to iceblocks(correctly) and to the hydra also (1 h)
;   07.10.2008 Bernd Edler     fixed most graphic problems under ms-windows (4 h)
;   10.10.2008 Markus Döbele   Max Mana fixed (10 m)
;   11.10.2008 Markus Döbele   Save akt_player and magic_apple (1 h)
;   11.10.2008 Bernd Edler     improved trap handling for creatures, accumulating poison for players and creatures
;                              fixed akt_spieler on load, new spells:destroy golem,dig treasure,cure creature poison (12 h)
;   01.11.2008 Bernd Edler     improved controls for inventory screen (item split,keyboard movement,quick slots etc.)
;                              fixed help screen/oldmessage garbling, savename file location, new spells entered into readme
;                              sorcery skill now working with summoner and warlock                                (26 h)
;   02.11.2008 Markus Döbele   Online Highscore (1 h)
;   02.11.2008 Bernd Edler     fixed skip-turn skip creature bug. ,syphon no longer effects spell-weaving
;                              moved "sense traps" to illusion and "summon dragon" to summoner
;   02.11.2008 Bernd Edler     added delay for lighting torch animation, "destroy trap" now works only for spotted traps
;                              improved controls for highscore screen                                            (3 h)
;   04.11.2008 Bernd Edler     fixed equip bug from inv-update,added missing skills to highscore-upload
;                              build function to export skills data to a csv file                                (3 h)
;   06.11.2008 Bernd Edler     fixed creature damage display,mercenary max LP setting and missing "enchant creature" damage functionality
;                              every 2nd iceblock leaves a wet tile and boulders leave gems/steel/sling stones 1:2:7
;                              fixed "whirling blades" fightin style (gave a much too huge attack bonus)
;                              fixed invisible wall problem for walls different from inhalt(level)
;                              added key control (F-key) to fighting styles                                     (4 h)
;   06.11.2008 Roger Roesch    overworked the doubleClick Procedure (ca 30 min)
;   07.11.2008 Bernd Edler     fixed a typo in traenke.pbi preventing "trap sense" potion from working
;   08.11.2008 Markus Döbele   Invisible items while dragging fixed, can't see maps with sight < 2 (2 h)
;   09.11.2008 Bernd Edler     pushing boulders now preserves the content of the boulder
;                              content of hidden treasure pre-determided on generation (to stop load/save cheating)
;                              mark the rooms fields as unknown on the automap on entering
;                              fixed Invisible items while dragging from body
;                              fixed trap animation for creatures                                                 (5 h)
;   16.11.2008 Bernd Edler     made gold amount a player stat(long) thus allowing more than 32,000 gold
;                              every piece of gold now has a weight of 3g so large amounts will be heavy      (1 h)
;   17.11.2008 Markus Döbele   Udjat eye usage was slightly wrong (1 h)
;   17.11.2008 Bernd Edler     fixed typo in traenke.pbi concerning "view invisible"
;   18.11.2008 Bernd Edler     made the pieces of the staff appear every 10 levels so
;                              1st piece is on level 10-19 2nd on 20-29 etc. last (9th) on 90-99
;                              added missing color mode for skill group 9 in character info screen
;                              made skill triggered curse and trader pre-determined with labyrinth creation (2 h)
;   21.11.2008 Markus Döbele   mks is now also long instead of word (1 h)
;   21.11.2008 Bernd Edler     fixed some un-equip bugs
;                              fixed wrong cost calculation for mana and lifepoint trainers
;   22.11.2008 Markus Döbele   message when we skip a turn (1 h)
;   27.11.2008 Bernd Edler     fixed damage functions concerning dead players and players on other levels in
;                              bogen.pbi,kampf.pbi,sonstige.pbi,zaubertest.pbi
;   16.12.2008 Bernd Edler     fixed reason of death entry for ice_breath monsters (from fireball to frostball)
;                              moved object quality value to attri5 in inventory and to "anzahl" in 
;                              laby items structure to resolve conflict with "status" for items
;                              which can break and still have a quality rating eg.: crowns and robes
;                              fixed typo preventing damage to shields (aktaktarmor)
;                              made merchant items a linked list thus allowing more than 1 merchant per level
;                              improved the handling and the item information display in the trading screen
;                              made it possible to sell equipped items and those on quick-access slots (28 h)
;   03.01.2009 Bernd Edler     made gold display function use long instead of word thus fixing erronous display (1h)
;   11.01.2009 Bernd Edler     removed unused #OBJGRAFIK_UMHANG3 from finden2 and added #OBJGRAFIK_UMHANG_BLAU and
;                              #OBJGRAFIK_UMHANG_GRAU instead - fixing issue 77. (1h)
;   11.01.2009 Bernd Edler     fixed bug allowing to re-light burnt torches / lamps - fixing issue 79 (1h)
;   12.01.2009 Bernd Edler     made "curse of tiamat" working + added it as #17 for cause of death - fixing issue 80
;                              also made "poison weakness" do actually double damage
;                              added waiting for release for level up/down in automap  (1h)
;   17.01.2009 Bernd Edler     removed the status change from "leeren" - that was just wrong
;                              removing one item from a stack should not repair the rest or make them un-identified
;                              creatures now take damage from lava
;                              made spells schools numeric and split up common spell structure and individual spell abilities
;                              scrolls stay known - once learned by optaining an identified scroll
;                              denied learning bard songs through free magic 
;                              filled blank spell No. 69 which caused "empty" spell error on scrolls+free magic
;                              by moving No. 182 there (ca 10h)
;   18.01.2009 Bernd Edler     fixed effect of amulet of luck to 2
;                              "extend" no longer works on meta-magic
;                              mixing potions will never generate "Potion of the Gods" - exactly one potion can become
;                              "Potion of Heroes" and 3 potions will explode on mixing
;                              also stopped load/save cheats with the potion generation from mushrooms (2h)
;   20.01.2009 Markus Döbele   Wrong message when frozen lightning breaks fixed (1 h)
;   20.01.2009 Bernd Edler     stopped ambush spawning on #FELD_WASSER_SKELETT
;                              fixed blue chests and "nimble fingers" feat
;                              stopped friendly (charmed) monsters from doing ranged attacks
;                              improved description for "Ring of the Faery Queen"
;                              allow only one meta-magic spell to be active
;                              fixed access outside laby borders for flameburst
;                              fixed offset issue with new alchemy code (4 h)
;   23.01.2009 Bernd Edler     fixed quick spell loading
;                              quick spell triggered meta-magic no longer ends turn
;                              disintegration no longer destroys entry,exit,lava and fragezeichen fields
;                              made potion effects number based
;                              potions now quench only 10 thirst
;                              potion types stay known once learned
;                              fixed,some bard songs not stopping other songs
;                              denied conjured magic armor as sacrifice
;                              transmigration now requires a sacrifice
;                              raised cost of "remove others curse" to 15
;                              added description for penetration spell not affecting area spells (7 h)
;   24.01.2009 Markus Döbele   Ambush graphics fixed, freeze water text fixed  (1 h)
;   25.01.2009 Markus Döbele   transmigration + healing counter, hydra and no attack  (1 h)
;   25.01.2009 Bernd Edler     made mushroom effects number based
;                              mushroom types stay known once learned 
;                              added missing potion learning (4 h)
;                              stopped misbehaviour of flamebust with tunnel (1 h)
;                              fixed highscore calculation for survivors (1 h)
;   29.01.2009 Markus Döbele   procedure backpackspace to replace all the search for space in inventory code, steal + full backpack,
;                              new counters for ease pain and  heal others (2 h)
;   30.01.2009 Bernd Edler     added missing shared variables spell_x,y to creature_bewegen to fix trap animation
;                              made scrolls use+display their power value
;                              changed staff quality(elder etc) from status to quality (attri5)
;                              thus, the status is preserved, when selling them and merchants have higher quality in stock
;                              added missing new-level reset for new counters ease_pain & heal_others (8h)
;   31.01.2009 Bernd Edler     created an automated function to generate the readme_spells.txt from in-game data (3h)
;   31.01.2009 Markus Döbele   New counter for full healing, message when disarming trap (1h)
;   31.01.2009 Bernd Edler     fixed x,y coordinate typo in "remove traps" spell
;                              fixed invisible wall problem in swamps by removing depricated check in vor_bewegung
;                              removed message+delay for monsters killed off-screen (armageddon)  (7h)
;   31.01.2009 Markus Döbele   Exit Button for option menu (1h)
;   31.01.2009 Bernd Edler     fixed overflow error, which caused an endless loop generating levels with size>127x127 (4h)
;   01.02.2009 Bernd Edler     made flying/waterwalk work with special waterfields(chests/gold/skeleton)
;                              stopped forced auto-pickup for water gold-stack (2h)
;   01.02.2009 Bernd Edler     fixed issue 90 - dual aura bug
;                              fixed issue 69 - roundattack animation (2h)
;   02.02.2009 Bernd Edler     fixed issue 122 - broken wands given initially for thaumathurgists
;                              improved some text descriptions for skills and items 
;                              refined the initial crysolit bonus (4h)
;   03.02.2009 Bernd Edler     fixed x,y coordinate typo in "banish fire" spell
;                              more text tweaks (1h)
;   04.02.2009 Bernd Edler     removed udjat and heartstone from merchant stock
;                              increased udjat cost to 3000
;                              changed the labyrinth array from (x,y)[level] to (level,x,y)  (2h)
;   05.02.2009 Bernd Edler     fixed off-by one error in load/save of potion-mix table
;                              stopped generation of "Potion of Heroes" through alchemy
;                              fixed attri use error for scrolls
;                              removed "status" attrib from labyrinth array
;                              fixed wrong usage of laby\status where monster\status should have been used
;                              renamed remaining laby attributes to stat1 + stat2
;                              upped damage dealt by hydra
;                              fixed map displaying creatures(fire+water elementar) (8h)
;   07.02.2009 Markus Döbele   stealing colors, completed conversion to new damage for spells (1h)
;                              updated readmes (1h)
;   07.02.2009 Bernd Edler     changed amulet of dwarves' effect from "Sense Traps" to "Trap Sense"
;                              armageddon does not cost counter or item if it fails
;                              stopped load/save exploits with traps (2h)
;                              implemented some buffers to reduce load/save abuses (5h)
;   08.02.2009 Bernd Edler     more buffers against load/save abuses
;                              made secret door detection difficulty fixed
;                              gold per stack fixed to max.:45 avg.:15-22.5  (2h)
;   09.02.2009 Bernd Edler     Map no longer breaks and is droppable, but unusable for players without the skill
;                              player dropped moneybags no longer stay although picked up
;   10.02.2009 Bernd Edler     fixed animation of little knight
;                              edited the FAQ ,to get rid of overlong lines. (Those are cut by laby's viewer)
;                              added sound for breaking wands (3 h)
;   13.02.2009 Bernd Edler     added entry in settings.txt for the global key_repeat_delay, new default: 90
;                              added inital 200ms delay before the key repetition starts
;                              prevented spell "chaos" from triggering bard songs
;                              stopped skeletons rising under existing monsters
;                              correctly swap monsters in dimensional swap spell (3h)
;                              displayed, which potions broke(trapdoor), added sound to spear,axe,dart trap (1h)
;   14.02.2009 Bernd Edler     fixed issue 115 (routing for creatures) 
;                              changed text color in highscore uplaod confirmation screen(new background image)(2h)
;   15.02.2009 Bernd Edler     fixed issue 132: Life Bond spell
;                              fixed issue 133: chaos+quickening
;                              ice protection now protects against ice-breath
;                              some more random buffers/buffer usages
;                              repaired luck actually INcreasin chance to get apples etc. (4h)
;   15.02.2009 Bernd Edler     fixed division by zero error for myRand(0) (1h)
;                              fixed gold buff initialization / wrong method for "midas touch"
;                              keyboard access to player made character templates
;   17.02.2009 Markus Döbele   armageddon uses item even if not succesful, no message if monster does not see us (1h)
;   19.02.2009 Bernd Edler     removed redundant an thus error prone attri2-4 from inventory struct 
;                              fixed keyboard triggered program exit not resetting screen resolution (2 h)
;   21.02.2009 Bernd Edler     reduced inventory struct to name,number,status,quality (5 h)
;   22.02.2009 Bernd Edler     some fixes concerning inv struct reduction (3 h)
;                              reduced size of save game files by skipping superflous data (1 h)
;                              fixed gangende to non hidden chests having fixed content
;                              made trap graphics with opaque black to improve drawing on light floor tiles
;                              created samll icons for circles+favourite spells (3 h)
;   23.02.2009 Bernd Edler     spell "earthen strength" now does something
;                              spell "strength" - corrected description
;                              spell "shocking grasp" - effect now visible in character screen  (2 h)
;   25.02.2009 Bernd Edler     fixed issue 139 - routing & water 
;                              some cosmetics for archipel (2 h)
;   26.02.2009 Bernd Edler     fixed issue 141 - infinite spell duration
;                              prepared spell weaving for "weavable flag"
;                              final tweaks for creature routing
;                              added remark in FAQ about unarmed combat
;                              unified item description for inventory+pick_inventory (5 h)
;   27.02.2009 Bernd Edler     creature item pick up on water/grass
;                              level init on load improved (archipel)
;                              Homunculus no longer needs nexus,elemental summons no longer destroy nexus
;                              switched places of "prot:poison" and "summon satyr" spell
;                              unified item description for player inventory in merchant screen (4 h)
;   28.02.2009 Bernd Edler     unified item description for merchant items in merchant screen
;                              skills renamed: weaponsmith->crafting, corpulent->sturdy
;                              broken items can no longer be equipped (3 h)
;                              fixed issue 143: creature+chars invisible in water (2 h)
;                              renamed "Strength" spell to the more fitting "Power Strike"
;                              slowed speed of mouse triggered char rotation in maennchen.pbi
;                              sanctum+nexus now have charges per player exclusively (5 h)
;   28.02.2009 Markus Döbele   release_script improved (checks all settings and compiles windows version using wine) (4h)
;   01.03.2009 Bernd Edler     sanctum+nexus now have only 3 charges regardless of player number (1 h)
;                              starsight now shows monsters again
;                              corrected error in goddess of wisdom code
;                              moved mouseover text for quick inv. up by two rows
;                              added background box for mouseover texts
;                              "enchant creature" spells no longer stay infinitely
;                              angel needs sanctum now
;   01.03.2009 Markus Döbele   release script finished (1h)
;   16.03.2009. Bernd Edler    total change of all monster related code from an array to a list
;                              many procedures changed or removed e.g. istmonster,has_trait -> removed
;                              preliminary version - barely tested, many bugs expected. (35 h)
;   17.03.2009. Bernd Edler    fixed round-attack not being able to attack single monsters (1 h)
;   19.03.2009. Bernd Edler    gave "sword of the Last Knight" the "magic" flag
;                              moved all pointers into a struct - thus now elice and PB should be able to handle
;                              that (2 h)
;   20.03.2009. Bernd Edler    made "monster sense" skill work again
;                              "monster lore" now can detect mimics 
;                              made monsters living (spawning/regeneration) for all level with a
;                              living player on it.
;                              fixed ranged attacks from monsters (3 h)
;   22.03.2009. Bernd Edler    first_monster pointers now get correctly initialized for unreached
;                              levels in load-game procedure
;                              moved actual removal of dead monsters to an extra procedure as we can
;                              avoid stale pointer problems if this happens after damage dealing
;                              made area_attack working 
;                              made crown of the sidhe use its variable power rating
;                              fixed typo preventing spell "extend" from working (13 h)
;   24.03.2009. Bernd Edler    fixed pestilence + songs of sleep/suicide
;                              made nail pits damage boots
;                              fixed banish_monster procedure
;                              made bard songs get 100% success even encumbered
;                              made "geistertanz" work with bow,melee and monsterlore (8 h)
;   28.03.2009 Markus Döbele   save more player information in highscore table (1 h)
;   30.11.2009 Markus Döbele   Changed teleporter.pbi to be a function, furcht fixed (2 h)
;   24.03.2010 Markus Döbele   Released Version 3.5.3 (1 h)
;   09.07.2010 Bernd Edler     stopped secret door special level setting undetectable doors (impossibly high diff ratings removed)
;                              corrected error with ammunition stacking (issue 166)
;                              (elven arrows and steel balls have stack size 20 not 10)
;                              fixed list pointer restoration (issues 160,164,165)
;                              stopped cauldron producing unlimited potions 
;                              corrected message from breaking traptool (nr.254 spanish still missing)
;                              added the missing loading/saving of roomtrader data
;                              set version to 3.5.4 as savegame format has changed (5h)
;   10.07.2010 Bernd Edler     summoned creatures can see monsters again
;                              made monsters attacking creature jump animation working
;                              made monster attack creature even if creature did not attack them (melee only for now)
;                              stopped friendly/sleeping/blind monsters from attacking creatures  (8h)
;   23.07.2010 Markus Döbele   Fear always displayed "destroyed" instead of translation (1 h)
;   04.08.2010 Markus Döbele   Highscore upload php script fixed, Release 3.5.4 (1 h)
;   06.08.2010 Markus Döbele   Flickering for teleporting creatures fixed (1 h)
;   06.08.2010 Bernd Edler     fixed crash in archery triggered by autodelay()
;                              added keys "A" and "F" for select_field() for convinience of archery and mystic users
;                              disallowed dropping items on closed doors
;                              named constants for monster types
;                              changed some monster types
;                              no longer ranged criticals on mosters immune to criticals possible
;                              fixed a bunch of StartDrawing/StopDrawing problems
;                              fixed mix up of status for both amount and poison status of arrows
;                              fixed non-stackable food items
;                              fixed animation for thrown stones (10 h)
;   07.08.2010 Bernd Edler     new spells:Song of Wealth,Remove Runes,Sword to Ploughshare (6 h)
;   08.08.2010 Markus Döbele   Options new (7 h)
;   08.08.2010 Bernd Edler     weight fractions shown in inventory (issue 161)
;                              stop automovement when detecting secret door (issue 145)
;                              prettyfied select item screen (4 h)
;   09.08.2010 Markus Döbele   Choose mousepointers for players (4 h)
;   10.08.2010 Bernd Edler     fixed a bug causing poison arrows to poison monsters already dead from arrow
;                              added generic mouspointer code for automap
;                              moved skill display in skill selestion to the left to reduce collisions with text and buttons
;                              moved summon skeleton to level 1
;   12.08.2010 Markus Döbele   Keep skill selection (2 h)
;   15.08.2010 Markus Döbele   Clear highscores button and smaller issues in highscore screen (3 h)
;   15.08.2010 Bernd Edler     named character templates (24 h)
;   16.08.2010 Bernd Edler     fixed multi [new entry] problem in char templates
;                              added hotkeys 'L'+'S' for character templates
;                              added generalised procedure to draw laby frame elements  (4 h)
;   17.08.2010 Markus Döbele   Debian package no longer requires dev files
;                              messages what we have to do with blue/green chests (2 h)
;   17.08.2010 Bernd Edler     made watermonsters hide and rise like skeletons again
;                              prevented spawning of monsters on waterchests and gold
;                              fixed graphical artifacts in bat animation and plant drawing
;                              improved spell info in spell selection screen (power,duration etc.) (4 h)
;   18.08.2010 Markus Döbele   Linux executable no more ends in .exe
;                              Readmes for Sourcecode rewritten for elice usage (1 h)
;   18.08.2010 Bernd Edler     made lamia look different from banshee by using unsused picture 178
;                              fixed gfx of blood shadow,blowfish,jellyfish
;                              some cleanup in skill display
;                              charname imputscreen,saving etc.(not used yet) (8 h)
;   19.08.2010 Bernd Edler     make use of the charname
;                              removed skill blocking for "no attack" and monster type skills (hunter,paladin etc.)
;                              as those should be available to archery or mystic users too
;                              added skill blocks for "weak arms" (dual wielding,sword fighting etc.)
;                              plate mail as startequip for "fight in armor"
;                              made relevant startequipment being equipped already at start
;                              fixed some icons spell effects: helpful winds/song of travel (4 h)
;                              removed items loitering on questionmark tiles
;                              fixed wait for relase in highscores screen
;                              death message and functionality for winning game screen (3 h)
;   19.08.2010 Markus Döbele   Last words when we die (2 h)
;   20.08.2010 Markus Döbele   Throwing weapons working again (1 h)
;   21.08.2010 Bernd Edler     fixed haggle formula
;                              changed some item prices
;                              renamed local constants so stop conflicts with PB which unlike elice can't handle those
;   21.08.2010 Markus Döbele   Released new windows version because it was still old
;                              Move fields to structure, Part 1 (4 h)
;   22.08.2010 Markus Döbele   Move fields to structure, Part 2 (2 h)
;   22.08.2010 Bernd Edler     enable increased cost for spellweaving only for spells that profit from that (issue 140)
;                              also show in spell screen,which spells are weavable (4 h)
;   23.08.2010 Markus Döbele   Display fieldnames/monsternames on the fly when looking around.
;                              Translate FAQ to german (5 h)
;   23.08.2010 Bernd Edler     added blockspawn info, made use of it (1 h)
;   24.08.2010 Markus Döbele   Translation of FAQ finished, Added unique flag to some items, aufsteigen changed
;                              Display info for summoning spells, infoscreen for creatures, renamed all files to english (8 h)
;   24.08.2010 Bernd Edler     fixed bug in helpful wizard monster removal
;                              free magic now only offer spells of same circle as actual, not those below
;                              also prettyfied the screen
;   25.08.2010 Marcin Bugala   Fixed bug with treasure hunter skill, now monsters are drawn on top of treasures (6 h)
;   25.08.2010 Bernd Edler     allowed picking up stackables even if inventory is full
;                              fixed bug in picking up ammunition (stacking)
;                              fixed bug in splitting ammunition stacks
;                              fixed bug in stacking ammunition
;                              fixed bug in potion generation
;                              fixed bug in 3 column skill display
;                              fixed message bug in new item pick up
;                              added wait release for mouse buttons in spellweaving (5 h)
;   26.08.2010 Markus Döbele   Added field water to fields, animate special success, added new sounds for botch and special success
;                              changed check_spells that special_succes animation always happens before speallanimation, 
;                              drain life+dehydration+mental bolt changed, special success affects attack spells too,
;                              mystic attack now always succeeds and does level to level*5 damage, luck affects chance to cast special,
;                              spell botches implemented (7 h)
;   27.08.2010 Markus Döbele   check_spells transformed to a select. special_success only checked once in the beginning (2 h)
;   27.08.2010 Bernd Edler     restricted scroll lore to allow only a finite number of spells to be learned
;                              put spell failure/success/special success and botches into single procedure
;                              thus keeping fuctionality in one place and preventing double messages
;                              also switched to myRand functions to prevent load/save circumvention of botches (3 h)
;   28.08.2010 Bernd Edler     made oil fill up only 1 lamp (issue 194) (1 h)
;   30.08.2010 Bernd Edler     removed wrong start/stop drawing in sog()
;                              made "monster sense" detect invisible monsters
;                              stopped lore listing invisible monsters on mouse overs 
;                              made icon and split up scroll lore and free magic spells in spell selection screen (3 h)
;   31.08.2010                 -------------------- 4.1.0 Released -----------------------------
;   01.09.2010 Bernd Edler     fixed "show traps" spell which mixed up x and y coordinate
;                              also stopped  that spell from making found traps dodgable without any skill (1 h)
;   04.09.2010 Bernd Edler     fixed segmentation fault caused by faulty logic for monster list in load game 
;                              fixed: disintegration destroys monsters again (did not set monster pointer) (3 h)
;   05.09.2010 Bernd Edler     fixed :spells, special success and botching not using sound wrapper function 
;                              added closeFile call to load/save templates and a safety check for empty file
;                              made monster poison/fire/ice breath use correct monster number again (2 h)
;   06.09.2010 Markus Döbele   transformed cause of death to number (4 h)
;   07.09.2010 Markus Döbele   mingw version (7 h)
;   08.09.2010 Bernd Edler     new/changed sound effects 
;                              made items bought from merchant autostack
;                              prepared trader generation for predefined small traders
;                              made green helmet give only 7 lifepoints like it's description says (12 h)
;   09.09.2010 Markus Döbele   mingw version (7 h)
;   10.09.2010 Bernd Edler     new/changed sound effects (7 h)
;   11.09.2010 Bernd Edler     fixed identified potion marking in advancements
;                              fixed random range for hit sounds
;                              new/changed sound effects (7 h)
;   12.09.2010 Bernd Edler     fixed death cause number for dart trap
;                              new/changed sound effects (4 h)
;   13.09.2010 Bernd Edler     improved look/logic of swimming
;                              new/changed sound effects (5 h)
;   14.09.2010 Bernd Edler     fixed duration calculation for helpful winds spell
;                              new/changed sound effects (3 h)
;   15.09.2010 Markus Döbele   ranged attacks on creatures, legal pictures for end screen, swamp and tavern,
;                              adjusted end screen (5 h)
;   15.09.2010 Bernd Edler     changed los for tombstone
;                              new/changed sound effects (7 h)
;   16.09.2010 Markus Döbele   Legal pictures for Hall of the Undead, Fire Demon, Prison and look around
;                              New sounds for ding, open door and open chest
;                              open laby page on exit (4 h)
;   16.09.2010 Bernd Edler     new/changed sound effects (ding,success,harp) (5 h)
;   16.09.2010                 -------------------- 4.2.0 Released -----------------------------
;   17.09.2010 Markus Döbele   laby icon for windows working in wine, New monsterspell: Firelance, reason of death as constants,
;                              Reason of Death reworked on homepage (10 h)
;   18.09.2010 Markus Döbele   Show number of charges for nexus and altar when looking at them,
;                              explain shapechanging spells, botch damage changed (4 h)
;   18.09.2010 Bernd Edler     added effect of curses/short magic skill/meta magic to shown spell duration
;                              fixed PB problems with NULL pointer generation on load (3 h)
;   19.09.2010 Markus Döbele   Explain spellcasting in FAQ. chances for special success and botch slighty changed
;                              Explain specialities of summoned creatures in info screen and spell menu (2 h)
;   20.09.2010 Bernd Edler     monster lore shows monster's actual HP now
;                              fixed gfx for lamina
;                              fixed bug with learning potion names from merchants
;                              fixed bug with free magic keyboard control
;                              new sound effects (chaos,darkness) (8 h)
;   20.09.2010 Markus Döbele   Explain Monsterstatuses in monsterlore screen, new pictures for throne room, forest and ork village (1 h)
;   20.09.2010 Bernd Edler     made monster lore full screen so all texts will fit
;                              fixed treasure hunter bug v2: items invisible on treasure (4 h)
;   21.09.2010 Markus Döbele   Extralines in monsterlore as the icons overlapped each other, don't explain mushroom when we chose unobservant,
;                              new picture for helpful wizard (2 h)
;   21.09.2010 Bernd Edler     made 2 different tiles of Tombstone (1 for room other as wall for hall of dead special level)
;                              set and used block_walk flag for tiles (2 h)
;   21.09.2010                 -------------------- 4.2.1 Released -----------------------------
;   22.09.2010 Bernd Edler     fixed issue 234 (broken shapeshift) (5 h)
;   23.09.2010 Markus Döbele   Transformed Rooms in a linked list (5 h)
;   24.09.2010 Markus Döbele   Transformed Rooms in a linked list, more rooms per level, improved rooms: first closed and opened later (7 h)
;   24.09.2010 Bernd Edler     fixed: non-animated traps if no wall around
;                              fixed: items under player invisible while aufstehen() animation
;   25.09.2010 Markus Döbele   cancel spells and ranged combat, monsters as constants
;                              set class of golden pike to poleaxe, use server date for online highscore_upload
;                              save level for hourglass, train only once per player per trainer (8 h)
;   25.09.2010 Bernd Edler     allow setting chests,nexus and the like on any floor tile
;                              fixed some animation glitches (10 h)
;   26.09.2010 Markus Döbele   use sound wrapper function when room is opened, traps animation fixed, block spawn for closed portculis
;                              new skills: undead, cannibal, new items: human meat, blood (5 h)
;   26.09.2010 Bernd Edler     made removing chests,nexus and the like restore proper floor tile on removal (3 h)
;                              new ,now versioned templates file format (1 h)
;                              reversed order in templates for new skills to work (1 h)
;   27.09.2010 Markus Döbele   put all joystick commands in a procedure, picture for staff of the last covenant
;                              display staff pieces in body screen, sped up skill selection screen (6 h)
;   28.09.2010 Markus Döbele   improve the staff (5 h)
;   28.09.2010 Bernd Edler     replaced some monster numbers with named constants
;                              made room for it and showed messages in inventory screen
;                              changed formula for Appletree,Library and Laboratory to 20 + luck*5  (5 h)
;   29.09.2010 Markus Döbele   wiki: new button, updated some entries, tried to install new version, new design (3 h)
;   30.09.2010 Markus Döbele   Inserted Comments in Settings file to make clear that its only the default
;                              prevent skipping turn to avoid ambush, solved laggy mouse in vista (hopefully) (3 h)
;   01.10.2010 Bernd Edler     added missing pointer restoration in monsterschaden()
;                              some more replacing numbers with named constants
;                              life/mana shown permanently with flasks too. (issue 197)
;                              draw item under character when attacking
;                              open rooms if monster is killed with spells too 
;                              describe spells in items (scrolls/wands) (issue 202) (7 h)
;   02.10.2010 Markus Döbele   Inverse hunger/dehydration, new ending picture when with staff (2 h)
;   02.10.2010 Bernd Edler     fixed off by one error in myrand() functions
;                              new image for blood (2 h)
;   03.10.2010 Markus Döbele   Black fields in map (Issue 248), change reading settings file to ignore comments, leftover examinejoystick removed,
;                              test with new purebasic compiler 4.51 (3 h)
;   03.10.2010 Bernd Edler     new lightning sound 
;                              put sounds artists into in-game credits
;                              correct floor background for tiles in map view (3 h)
;   04.10.2010 Bernd Edler     moved food value of blood into item data and made describe display it
;                              removed prototype message from the real settings.txt as it should only be in prototype version
;                              made hidden function to create spell-readme.txt anew automatically from help screen
;                              changed text color in okaybox to white 
;                              repaired exorcism and made it kill 100% of undead (4 h)
;   04.10.2010 Markus Döbele   Gametesting, Walls of Firedmon cannot be extinct (1 h)
;   04.10.2010                 -------------------- 4.3.0 Released -----------------------------
;   06.10.2010 Markus Döbele   Skill Menu + Windows XP, unique skills (2 h)
;   06.10.2010                 -------------------- 4.3.1 Released -----------------------------
;   07.10.2010 Markus Döbele   unique items, prevent picking up of already existing items (just to make sure :) ), 
;                              remove items from list when used/destroyed (4 h)
;   07.10.2010 Bernd Edler     fixed start/stop draw in free magic selection screen
;                              increased array dimension of staff piece in player struct and 
;                              only_once in room struct as PB seems not to adhere to it's own definitions
;                              changed specialised room data(staff/merchant) to generalised stat1/stat2
;                              so its not a hack storing data depending on room type in it
;                              also make sure this data is kept with save/load of game
;                              (which was not the case for staff number data before, -
;                              causing problems with staff piece numbers)
;                              made staff piece room actually use staff piece number instead of room number
;                              made hydra tiles show floor below and use roomstat for head count
;                              stopped spawn/items on tree top tiles as they have blockwalk too
;                              made hut tile have transparent background
;                              new tile gfx for pile of items 
;                              stopped Cartograph map showing monsters (10 h)
;   09.10.2010                 -------------------- 4.3.2 Released -----------------------------
;   09.10.2010 Bernd Edler     made items dropped by monsters pre-determined
;                              disable pushing boulders as that only closes paths so nobody does that anyway 
;                              made boulder content buffer
;                              made small traders pre-determined (8 h)
;   09.10.2010 Markus Döbele   Save download info for a statistic (1 h)
;   10.10.2010 Markus Döbele   Graphical download statistic (4 h)
;   10.10.2010 Bernd Edler     allow to make a list of favoured spells (6 h)
;   12.10.2010 Markus Döbele   Research how to improve idle mode, prevent staff pieces from getting robbed, constants for item types
;                              Summon spells cost mana only when cast on right field (3 h)
;   13.10.2010 Markus Döbele   4 new fsi's (f.e. picture for dragon room), ancient vampire black backgound (2 h)
;   13.10.2010                 -------------------- 4.3.3 Released -----------------------------
;   13.10.2010 Bernd Edler     made map (item) non-unique as the skill isn't either
;                              made Libram skill unique because Libram item has unique flag (1 h)
;   14.10.2010 Markus Döbele   Improve idle mode for mainloop (don't use pocessor if nothing happens) (4 h)
;   15.10.2010 Markus Döbele   Improve idle mode for playing_piece, nr_pf_players, monsterlore, options screen (4 h)
;   17.10.2010 Markus Döbele   Improve idle mode for skills, inventory screen (2 h)
;   20.10.2010 Bernd Edler     fixed issue 251 by adding missing clearlist(room_list()) 
;                               so we don't append more and more rooms to it each time a new game is started (4 h)
;   24.10.2010 Bernd Edler     fixed issue 252 by adding missing floortiles to is_floor() procedure 
;                              fixed start/stop drawing issue in helpful wizard procedure
;                              made survivalists get double water portion from puddles
;                              made merchants in levels 1-9 have no waterskins
;                              fixed issue 255 by making use of named constants for creatures (6 h)
;   24.10.2010 Markus Döbele   Main loop + light fixed, select_field fixed, insert name for savegames fixed (3 h)
;   25.10.2010 Bernd Edler     fixed variable name typo in select_field
;                              made survivalists get double water from drinking potions
;                              fixed damage calulation for ice and exploding arrows (2 h)
;   26.10.2010 Bernd Edler     fixed idle mode problems in playing piece selection
;                              stopped "breaking" spell working with non-magical attacks
;                              removed SDL_gfx dependency from elice and made circle drawing work (6 h)
;   27.10.2010 Markus Döbele   skills with new idle loop fixed, generalised routine for keyboard (6 h)
;   28.10.2010 Markus Döbele   added timer to prevent button repeat for mouse, skill menu over limits (4 h)
;   29.10.2010 Bernd Edler     fixed out of range access in select skill procedure
;                              improved visibility of keyboard selected safe-game slot
;                              added constant for delay between mouse/keyboard reading (1/25 s)
;                              made new keyboard routine key release work with PB too
;                              enables key repeat functionality to cursor keys
;                              fixed bug in title screen keyboard usage (7 h)
;   29.10.2010                 -------------------- 4.3.4 Released -----------------------------
;   30.10.2010 Markus Döbele   keyboard handling generalised, title screen + options reworked (new key routine),
;                              new idle mode for help screen (3 h)
;   31.10.2010 Markus Döbele   new keyboard handling bugfixed (save keys when calling subroutines), help screen finished (3 h)
;   01.11.2010 Markus Döbele   cinfo, credits, death, experience, highscore screens adapted to new keyboard routine + idle mode (5 h)
;                              main screen + buttons new keyboard routinen (2 h)
;   01.11.2010 Bernd Edler     changed all those "x per level" variables from player variables to level variables
;                              thus its really "per level" now with global effect like portal,nexus etc. per level
;                              and "local" spells like heal,magic apple etc. counted seperately for each player (4 h)
;                              nerfed charge attack to only allow killing multiple monsters if they are in same row (1 h)
;                              added visible indicator to show if player is in charge mode (2 h)
;                              made charge mode work with mouse controls
;                              prevent charge mode player from casting spells or using items
;                              made charge mode player end turn if trying to move in other direction than charge (2 h)
;   02.11.2010 Markus Döbele   bugfixing new keyboard routine, reworked buttons, inventory new keyboard routine (4 h)
;   03.11.2010 Markus Döbele   bugfixing inventory (1 h)
;   05.11.2010 Markus Döbele   bugfixing keyboard routine (1 h)
;   06.11.2010 Markus Döbele   completed inventory (f-keys were missing+bugfixing), monsterlore new idle mode, 
;                              select field+new keyboard routine (3 h)
;   07.11.2010 Markus Döbele   New keyboard + idle mode for free magic, people, pick_inventory, bugfixing saved keys (5 h)
;   08.11.2010 Markus Döbele   New keyboard + idle mode for player names, players, playing_piece, map (3 h)
;   09.11.2010 Markus Döbele   New keyboard + idle mode for skills, templates (3 h)
;   10.11.2010 Bernd Edler     made wait for release default on init keys
;                              made only certain keys auto repeat per default
;                              very preliminary version of new creature routines (6 h)
;                              repaired controls for templates screens (3 h)
;   10.11.2010 Markus Döbele   New keyboard + idle mode for skills, templates, special_level, the_end, trader (part 1) (4 h)
;   11.11.2010 Markus Döbele   New keyboard + idle mode for trader (part 2), spellcasting, spellweaving, curses, old_messages (5 h)
;   13.11.2010 Markus Döbele   Spellschool icons working again, spellweaving fixed, enter names fixed (2 h)
;   13.11.2010 Bernd Edler     number keys for inventory actions,cursor blinking for input name,proper idling for main loop (3 h)
;                              fixed item description and doubleClick in trader screen (1 h)
;   14.11.2010 Markus Döbele   keyboard settings in new file, replace all save keyboard code with init keyboard routines (2 h)
;   14.11.2010 Bernd Edler     special treatment for creatures (traps,runes,special fields)
;                              some creature special abilities (6 h)
;   15.11.2010 Bernd Edler     made creatures use their min/max damage
;                              stopped creatures activating rooms
;                              made spells enchant creature 1-4 work again (3 h)
;   15.11.2010 Markus Döbele   new picture for desert level, keyboard finished (hopefully), bugfixing keyboard (2 h)
;   16.11.2010 Markus Döbele   bugfixing keyboard, redraw inventory after using things, message when using items in charge,
;                              display last messages in options screen (2 h)
;   16.11.2010 Bernd Edler     stopped using items while in charge with mouse too
;                              show enchant creature spells of owner for creature too
;                              enabled special abilities of star fairy and dragon creature
;                              show creatures correctly on automap
;                              moved keyboard routines from other_procs.pbi to keyboard.pbi
;                              enabled autorepeat for spell selection screen
;                              set proper spell position when changing spell school (4 h)
;   17.11.2010 Markus Döbele   code cleanup. New files: attributes.pbi, map.pbi, tiles.pbi
;                              game speed screen removed and delays reworked, nr_of_players global (5 h)
;   17.11.2010 Bernd Edler     made creature use full attack value even if unarmed
;                              made creature kills count for player
;                              special combat sounds for creatures
;                              made spells for healing creatures work again
;                              removed unused creature procedures (6 h)
;   18.11.2010 Markus Döbele   options bugfixed, animation speed, swarmed fixed, players can enter rooms again (2 h)
;   19.11.2010 Markus Döbele   bugfixing slowdown in win7, bugfixing creature cast screen, functionality for new skills (3 h)
;   20.11.2010 Markus Döbele   give new flaws to creatures, made creatures die again, keyboard bugfixing (3 h)
;   20.11.2010 Bernd Edler     made flaws effective for the remaining items
;                              added the new version of holy,wav and laaa.wav (all clean license now)
;                              made hirelings from tavern use get_creature procedure
;                              made protection against missiles stop dart/spear/axe traps
;                              made amulet of luck use it's power rating (3 h)
;   21.11.2010 Bernd Edler     made unified projectile animation
;                              made manual key release funcionality for main loop walking with global variable
;                              thus player will stop walking when discovering trap/hidden door/hidden treasure
;                              requiring to release cursor key and pressing it again to march on
;                              allow nexus spell on any floor tile
;                              fixed bug in melee attacks on hydra
;                              added sound and damage display for melee on hydra (7 h)
;   21.11.2010 Markus Döbele   keyboard bugfixing (1 h)
;   22.11.2010 Markus Döbele   made sword to ploughshares work on bows, display damage formula for attack spells,
;                              description for teleport fixed, energy of stones and transmigration cost item only when successful,
;                              chaos scroll fixed, thirst counter fixed (4 h)
;   22.11.2010 Bernd Edler     unsummon button for creatures
;                              hide creature skills in skill selection screen 
;                              changed hydra room from 8x9 to standard of 8x8 (4 h)
;   23.11.2010 Bernd Edler     added damage display to hydrazauber procedure
;                              added stats(str,dex..) to creatures
;                              kill creature together with its owner 
;                              initialise all creature variables
;                              removed secret door from swamp level
;                              fixed bug in thrown stones animation
;                              fixed level modifier "extreme hot/cold"
;                              fixed levelmod fierce_traps and magical darkness
;                              no_sneaking creature group flaw (9 h)
;   23.11.2010 Markus Döbele   bugfixing damage spells, set+display all mercenarys attributes (2 h)
;   24.11.2010 Bernd Edler     made creature use their min/max damage only if its stronger than weapon damage (if any) (1 h)
;   24.11.2010                 -------------------- 4.4.0 Released -----------------------------
;   24.11.2010 Bernd Edler     made skill selection screen wait for release of space bar as it's used in next screen
;                              fixed player numbers in player name and playing piece screens
;                              made aufstehen() use measured timing
;                              allow aufstehen() to animate from any tileset
;                              made summon spells use correct animation (3 h)
;   24.11.2010 Markus Döbele   close to all boxes replaced with sprites (2 h)
;   26.11.2010 Markus Döbele   restored code to create spell readme's (1 h)
;   26.11.2010 Bernd Edler     made all backup and ambush monster rise simultaneously
;                              made all monsters regenerate simultaneously (2h)
;   27.11.2010 Markus Döbele   experience+casting screen fixed (1 h)
;   27.11.2010 Bernd Edler     gave summoned dragon the ability to cast dragon fire spell
;                              fixed broken spells: refresh, neutralize poison
;                              enabled wounded hero
;                              removed some warnings from elice -Wall (5 h)
;   28.11.2010 Markus Döbele   fixed rest of elice -Wall warnings (2 h)
;   28.11.2010 Bernd Edler     fixed some start/stop drawing issues (2 h)
;   29.11.2010 Bernd Edler     fixed more start/stop drawing issues 
;                              fixed monsterlore keyboard controls
;                              added number keys to select field accept keys
;                              fixed out of range access from cancel spell casting (8 h)
;   29.11.2010 Markus Döbele   made weak fingers block other bow skills, save keyboard for select_field, earthen strength had no icon,
;                              made wounded hero display correct tile (2 h)
;   30.11.2010                 -------------------- 4.4.1 Released -----------------------------
;   01.12.2010 Markus Döbele   removed constants for keys (only used in keyboard.pbi) (1 h)
;   03.12.2010 Markus Döbele   different highscores for 1,2,3,4 players game, upload real version number to highscore (4 h)
;   03.12.2010 Bernd Edler     fixed issues in ambush/reinforcement animation
;                              put some active water monsters on the water in river levels
;                              allowed for ambushes over water (4 h)
;   04.12.2010 Markus Döbele   prepared homepage for highscores fitting player numbers (2 h)
;   19.12.2010 Bernd Edler     stopped invulnerability working on elemental,magical and poison damage
;                              gave players new stats: resistance: poison,fire,cold,lightning
;                              made protection spells give only power*5 % resistance instead of 100% (4 h)
;                              made magic and poison weakness flaws give -100 as resistance (1 h)
;   09.01.2011 Bernd Edler     fixed variable conflict with goddess of wisdom/healing and sanctuary background
;                              changed boots of fire/ice walking and witch queen amulet to give 20/40/60 resistance (3 h)
;   17.01.2011 Bernd Edler     allowed creatures to inherit many skills from caster if player took summoner skill
;                              made god of war/death/wealth/secrets work through those creatures too (3 h)
;   30.01.2011 Markus Döbele   Display spellschool for scrolls, unified draw_item function (3 h)
;   30.01.2011 Bernd Edler     made mesage log to be same for all players
;                              added missing keyboard_init's after crafting and alchemy
;                              allow options access with esc-key too
;                              replaced neighbour_offset procedure with a global array
;                              allowed neutralize poison spell to clear power*1 tiles (10 h)
;   31.01.2011 Markus Döbele   finished unified draw_item function (2 h)
;   01.02.2011 Bernd Edler     added missing high magic icon for unified item draw
;                              made altar to the gods have only one charge and not push player away
;                              stopped altar losing charges if offering is rejected
;                              allowed quick slot items to be used for offering 
;                              allowed equipped items to be used for offering
;                              made single mage crysolyt bonus work again (4 h)
;   01.02.2011 Markus Döbele   use unified item display for quickslots as well (1 h)
;   01.02.2011 Bernd Edler     removed warning from show_schnellinventory()
;                              made scrolls in merchant stock show spell-school icons too
;                              made options display windowed/fullscreen mode 
;                              (windows requires restart so effect not visible otherwise)
;                              fixed visible player numer in skill selection screen (4 h)
;   03.02.2011 Markus Döbele   lock skills fixed (1 h)
;   03.02.2011                 -------------------- 4.5.0 Released -----------------------------

; To develop and release laby the following packages have to be installed:
; sudo apt-get install rpm debhelper build-essential devscripts fakeroot ruby racc libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-sound1.2-dev libsdl-gfx1.2-dev libsdl-net1.2-dev
; wine has to be installed and purebasic_4.20.exe has to be installed in there


; Markus: 1508 h
; Bernd:   768 h
; Rasmus:   75 h
; Roger:    34 h
; Peter:    33 h
; Marcin:    6 h



; All constants
XIncludeFile "constants.pbi"

; All structures
XIncludeFile "structures.pbi"

; All variables 
XIncludeFile "variables.pbi"

; -------------------------------------------------------------------------

; Arrays
Global Dim spieler.character_data(#nr_of_players)
Global Dim message_text.s (1000,#ANZ_languages)
Global Dim xsprites(20)
Global Dim ysprites(20)
Global Dim fsprites(20)
Global Dim rsprites(20)
Global Dim optionenliste.s(130)
Global Dim quickspells.w (10,#nr_of_players)
Global Dim quickspells2.w (8,#nr_of_players)
Global Dim savenames.s (10+1)
Global Dim savedatum.s (10+1)
Global Dim ADDelay.l (ADMax + 10)
Global Dim ADDelayMax.l (ADMax + 10)
Global Dim matrix.w (14,14)
Global Dim matrix2.w (14,14)
Global Dim school_names.s(#max_icon)
Global Dim school_numbers.w(#max_icon)
Global Dim school_clip_icon_pos(#max_icon)
Global Dim jb.w(12)

Global main_wait_release.w = 1 ;to stop unwanted movements after player change

; -------------------------------------------------------------------------
Declare DrawBitmapFont(s.l, x.l, y.l, w.l, h.l, t.s)
Declare DrawToolTip(s.l, x.l, y.l, w.l, h.l, t.s)
Declare Fenster(typ=0)
Declare ich_trage(was.w)
Declare entdecken()
Declare ausweichen()
Declare naechster()
Declare gen_laby(akt_level.w)
Declare has_trait2(welches.w,eigensch.w)
Declare remove_monster()
Declare cleanup_monsters()
Declare message(text.w, farbe.w)
Declare nachricht3(text1.w,anz.w,text2.w)
Declare.s nachricht4(welche.w)
Declare gold_anzahl()
Declare habich(nr.w)
Declare monsterlore()
Declare laby_screen()
Declare laby_screen2()
Declare laby_screen3()
Declare draw_characters(x_offset.b, y_offset.b)
Declare draw_screen(x_offset.b, y_offset.b)
Declare draw_screen2(x_offset.b, y_offset.b)
Declare draw_screen3(x_offset.b, y_offset.b)
Declare draw_screen4(x_offset.b, y_offset.b)
Declare draw_screen5(x_offset.b, y_offset.b)
Declare draw_screen6(x_offset.b, y_offset.b)
Declare draw_screen7(x_offset.b, y_offset.b)
Declare draw_screen8(x_offset.b, y_offset.b)
Declare draw_screen9(x_offset.b, y_offset.b)
Declare draw_character(face.b, frame.b, offset.w)
Declare select_field(monster_lore.w = 0)
Declare laby_rahmen(skipdiv.w = 0, no_items.w = 0)
Declare show_logo()
Declare show_varys( skip_effects.w = 0, skip_messages.w = 0 )
Declare show_buttons()
Declare tot()
Declare draw_tile(nr.w, x.w, y.w, offset_x.w, offset_y.w, bg.w = 0)
Declare cast_it()
Declare trinken(welchen.w)
Declare eintragen(nr.w,staerke.w,dauer.w,source.w)
Declare pilz_essen(welchen.w)
Declare sonderlevel_text(nr.w)
Declare hater(nr.w,xx)
Declare maxlife()
Declare staerke()
Declare reflexe()
Declare luck()
Declare draw_creature(frame.b,offset.w)
Declare los(no_tunnel.w = 0)
Declare levelmodtext(welcher.w)
Declare animate_projectile(aussehen.w, direction.w = 1)
Declare monsterschaden(schaden.w, magic.w = 1)
Declare load(name.s)
Declare save(name.s)
Declare loading_screen()
Declare saving_screen()
Declare show_buttons2()
Declare merchant(merch_pos.w)
Declare haendler()
Declare haendler_init1(level.w)
Declare haendler_init2(level.w)
Declare haendler_init3(level.w)
Declare haendler_init4(level.w)
Declare haendler_init5(level.w)
Declare ende()
Declare show_schnellinventory()
Declare itemtest()
Declare hinterhalt(welches.w = -1)
Declare fullscreen()
Declare find1()
Declare finden2()
Declare chest(x.w, y.w)
Declare gold(x.w, y.w)
Declare objekt(x.w, y.w)
Declare describe(feld.w,x.w,y.w,sx.w = -1, sy.w = -1)
Declare select_inventory(nachricht.w)
Declare spells_border()
Declare show_sight()
Declare power(spell.w)
Declare save_settings()
Declare.s keyboard_string(text.s,typ.b)
Declare autoDelay(ADInput.l,ADWhat.b ,ADDelayMaxInput.l)
Declare doubleClick()
Declare show_old_messages()
Declare cast_spell()
Declare restaurieren()
Declare restaurieren2()
Declare autopickup()
Declare in_rucksack(was.w, anzahl.w, equip.w = 0)
Declare screen1(i.w)
Declare screen2(no_items.w = 0, skip_messages.w = 0)
Declare blockiert(x.w,y.w,level.w = 0)
Declare blockiert2(x.w,y.w,level.w)
Declare liste_leeren()
Declare zauber_nehmen(i.w)
Declare bubblesort()
Declare credit(nummer,text.s,Abstand=280)
Declare hilfe()
Declare draw_monster(x,y,offset_x.w, offset_y.w)
Declare draw_item(name.w, x.w, y.w, offset_x.w, offset_y.w)
Declare setitem(xx.w, yy.w, level.w, name.w, anzahl.w, status.w)
Declare radius()
Declare kopiere_matrix()
Declare insert_light(radius.w)
Declare draw_movement(x.w,y.w)
Declare vor_bewegung()
Declare falle()
Declare sonderfeld()
Declare erstelle_matrix()
Declare free_for_monster(x.w, y.w, level.w = 0)
Declare show_automap(mode.w = 0)
Declare banish_monster(spell.w, type.w)
Declare shapechange(type.w,spell.w)
Declare angriffsspruch(spell.w, attack_animation.w, spell_sound.w, damage_type.w)
Declare attack_area(spell.w, sound.w, filler.w, destroy_type.w, bereich.w, damage_type.w)
Declare setmonster(xx.w, yy.w, level.w, name.w, graphic.w, lifepoints.w, status.w, duration.w, room.w)
Declare find_trap()
Declare find_treasure()
Declare add_poison(amount.w)
Declare un_equip(slot.w)
Declare Destroy_Boulder(x.w,y.w,level.w)
Declare Destroy_Iceblock(x.w,y.w,level.w)
Declare Dig_Treasure(x.w,y.w,level.w)
Declare Backpackspace()
Declare make_potion(allpotions.w = 0)
Declare hydra_cut_head(act_nr_in_level.w)
Declare hydra_grow_head(act_nr_in_level.w)
Declare damage(spell.w, special.w)
Declare terminate(welchen.w, source.w)
Declare getmonster(xx.w, yy.w, level.w = -1)
Declare teleporter_icon(nr.w)
Declare draw_mousepointer(x.w,y.w)
Declare draw_skill_list(player_num,x,y,maxlines,firstline = 1)
Declare count_skills(player_num)
Declare draw_plain_frame(draw_hline.w = 0)
Declare equip(slot.w)
Declare hydra_zauber(schaden.w)
Declare zauberkosten(spell.w)
Declare creature_info()
Declare animate_special_success()
Declare creature_add_poison(amount.w)
Declare anz_staffpieces()
Declare draw_player(x.w, y.w, player_num.w = -1)
Declare clear_used_keys()
Declare get_enchant_creature()
Declare gewicht()
Declare aus_schule(spell.w)
Declare max(zahl1.w, zahl2.w)
Declare draw_small_tile(nr.w, x.w, y.w, offset_x.b, offset_y.b, map_level.w = 0,  bg.w = 0)
Declare draw_small_monster(nr.w, x.w, y.w, offset_x.b, offset_y.b)
Declare leeren(feld)
Declare draw_item_inventory(x,y,inv_pos,cursor_here,type)


; -------------------------------------------------------------------------
XIncludeFile "keyboard.pbi"           ; keyboard settings for all screens
XIncludeFile "astar.pbi"              ; Router
XIncludeFile "tiles.pbi"              ; routines for tile handling
XIncludeFile "attributes.pbi"         ; character attributes
XIncludeFile "other_procs.pbi"        ; Routinen die sonst nirgends reinpassen
XIncludeFile "map.pbi"                ; automap handling
XIncludeFile "interaction.pbi"        ; Mouse, Keybord, Joystik events
XIncludeFile "messages.pbi"           ; Alle Nachrichten in allen languagen
XIncludeFile "mainscreen.pbi"         ; Routinen zum Zeichnen des Hauptschirms
XIncludeFile "skills.pbi"             ; Screen zum auswaehlen der Eigenschaften
XIncludeFile "highscore_upload.pbi"   ; Highscores uploaden
XIncludeFile "init_skills.pbi"        ; Skills initialisieren
XIncludeFile "highscore.pbi"          ; Highscores anzeigen
XIncludeFile "credits.pbi"            ; Credits anzeigen
XIncludeFile "options.pbi"            ; Zum Spiel verlassen
XIncludeFile "title.pbi"              ; Startscreen
XIncludeFile "trader.pbi"             ; Klein/Grosshaendler
XIncludeFile "buttons.pbi"            ; Routinen fuer alle Buttons
XIncludeFile "quickaccess.pbi"        ; Quickaccess Inventory
XIncludeFile "monsterlore.pbi"        ; Monsterinfo ausgeben
XIncludeFile "monster_random.pbi"     ; Zufaelliges Monster fuer Sonderlevels ermitteln
XIncludeFile "procs_graphics.pbi"     ; Prozeduren fuer die Grafik
XIncludeFile "genlaby.pbi"            ; Labyrinth generieren
XIncludeFile "playing_piece.pbi"      ; Routine fuer Spielfigur
XIncludeFile "cinfo.pbi"              ; Characterinformationen anzeigen
XIncludeFile "curses.pbi"             ; Routinen fuer Flueche
XIncludeFile "gain_experience.pbi"    ; Aufsteigen
XIncludeFile "inventory.pbi"          ; Inventory
XIncludeFile "pick_inventory.pbi"     ; Routinen die Items aus Rucksack auswaehlen
XIncludeFile "init_items.pbi"         ; init items
XIncludeFile "init_fields.pbi"        ; init fields
XIncludeFile "help.pbi"               ; Hilfe
XIncludeFile "death.pbi"              ; Sterben
XIncludeFile "load_sounds.pbi"        ; Gepackte Sounds laden
XIncludeFile "load_graphics.pbi"      ; Gepackte Grafiken laden
XIncludeFile "init_monsters.pbi"      ; Monster initialisieren
XIncludeFile "combat.pbi"             ; Kaempfen
XIncludeFile "special_level.pbi"        ; Titelbilder fuer Sonderlevel
XIncludeFile "advance.pbi"            ; Vor und Nachteile durch Skills
XIncludeFile "rooms.pbi"              ; Alle Raeume
XIncludeFile "cast.pbi"               ; Zaubern
XIncludeFile "people.pbi"             ; Wen man so im Laby treffen kann
XIncludeFile "traps.pbi"              ; Routinen fuer alle Fallen
XIncludeFile "init_spells.pbi"        ; Zauber initialisieren
XIncludeFile "ranged_combat.pbi"      ; Monster Fernkampf
XIncludeFile "bow.pbi"                ; Spieler Fernkampf
XIncludeFile "teleporter.pbi"         ; Sometimes the teleporter icons look different
XIncludeFile "find1.pbi"              ; Normale Gegenstaende
XIncludeFile "find2.pbi"              ; Magische gegenstaende
XIncludeFile "stealing.pbi"
XIncludeFile "potions.pbi"            ; Potions
XIncludeFile "mushrooms.pbi"          ; Mushrooms
XIncludeFile "players.pbi"            ; Anzahl Spieler
XIncludeFile "the_end.pbi"            ; Spielende durch Stab des letzten Buendnisses
XIncludeFile "special_field.pbi"      ; Sonderfelder nach Bewegung behandeln
XIncludeFile "before_movement.pbi"    ; Sonderfelder vor Bewegung behandeln
XIncludeFile "after_turn.pbi"         ; Character Zug fertig
XIncludeFile "button_actions.pbi"     ; Button angeklickt?
XIncludeFile "itemtest.pbi"           ; Gegenstaende benutzen
XIncludeFile "old_messages.pbi"       ; Letzte 25 Nachrichten anzeigen
XIncludeFile "init_creatures.pbi"     ; data for summoned creatures


; Find out users home directory
CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Windows
  environment = GetEnvironmentVariable("HOMEDRIVE")+GetEnvironmentVariable("HOMEPATH") + "\.lostlaby"
  CompilerCase #PB_OS_Linux
  environment = GetEnvironmentVariable("HOME") + "/.lostlaby"
CompilerEndSelect

CreateDirectory(environment)

yplus = 12
yplus2 = 10
akt_zauber_offset = 14
akt_zauber_offset2 = 13
anzz = 26

; --------------------------------------------------------------------------------------
; Screen oeffnen

If InitSprite() = 0
EndIf

load_settings()

If win_mode=2
  windowsfenster=1
EndIf

CompilerSelect #PB_Compiler_OS
CompilerCase #PB_OS_Windows
If win_mode = 1
  If OpenScreen(640,480,32,"Lost Labyrinth") = 0
  EndIf
  screenopen=1
Else
  dummy = OpenWindow(0, 0, 0, 640, 480, "Lost Labyrinth",#PB_Window_SizeGadget|#PB_Window_MaximizeGadget|#PB_Window_MinimizeGadget|#PB_Window_ScreenCentered)
  If OpenWindowedScreen(dummy, 0, 0, 640, 480, 1, 0, 0) = 0
  MessageRequester("Error","Screen could bot be opened!")
  End
  EndIf
  screenopen=2
EndIf
CompilerCase #PB_OS_Linux
If win_mode = 1
  If OpenScreen(640,480,16,"Lost Labyrinth") = 0
  EndIf
  screenopen=1
Else
  If OpenWindowedScreen(0, 0, 0, 640, 480, 1, 0, 0) = 0
  EndIf
  screenopen=1
  SDL_WM_SetCaption_("Lost Labyrinth", "")
EndIf
CompilerEndSelect

If sound = 1 Or music = 1
  If InitSound() = 0
  EndIf

  load_sounds()
EndIf

load_graphics()

ClipSprite(0, spieler(akt_spieler)\face*32*2+frame*32, 0, 32, 32)
DisplayTransparentSprite(0, 5*32, 5*32); Variablen setzen
SetFrameRate(60)
If InitKeyboard() = 0
EndIf

If no_mouse = 0
  result = InitMouse()
  If result = 0
     Print("error:Can't access mouse")
  EndIf
EndIf

; Highscores initialisieren
init_highscores()

; Highscores einlesen
read_highscores()


For akt_spieler = 0 To #nr_of_players
   init_skills()
   spieler(akt_spieler)\skill_points = #ANZ_STARTSKILLS
Next
akt_spieler = 1

If test = 2 Or test = 4
   If test = 2
      Print("CSV:--------------------------------")
      ;this creates a csv with the skill data for the highscore database on 2
      highscore_upload(1,"")
   EndIf
   ;4 will dump a spell table in init spells
EndIf


again:

zw_bild = 0
nr_of_saves = 0

; Initialize the Labyrinth
For i = 1 To #MAX_EBENEN
  ausgangx(i)    = 0
  ausgangy(i)    = 0
  sonderlevel(i) = 0
  levelmod(i)    = 0
  groesse(i)     = 0
  inhalt(i)      = 0
  mit_was(i)     = 0
  spinnenkoenigin(i) = 0
  goblinkoenig(i) = 0
  untotenherr(i) = 0
  portal(i) = 1
  nexus(i) = 1
  spellbook(i) = 1
  cauldron(i) = 1
  armageddon(i) = 1
  pestilence(i) = 1
  For j = 1 To #nr_of_players
     teleport(j,i) = 1
     steal_arr(j,i) = 2
     drachenform(j,i) = 1
     macht(j,i) = 1
     magic_apple(j,i) = 2
     refresh(j,i) = 2
     heal(j,i) = 3
     ease_pain(j,i) = 3
     heal_others(j,i) = 3
     full_healing(j,i) = 3
  Next
Next

mit_was_normal = #FELD_MAUER
inhalt_normal =  #FELD_LEER

; Initialize the characters
For i = 1 To #nr_of_players
  If i % 2 
     spieler(i)\Status = 1 
     spieler(i)\creature_typ = 0
  Else
     spieler(i)\Status = 3 ;even numbers are actually creatures so dead per default
     spieler(i)\creature_typ = 1
  EndIf
  spieler(i)\Level = 1
  spieler(i)\MaxLevel = 1
  spieler(i)\Maennchen = 2
  spieler(i)\Mousepointer = i
  spieler(i)\Lifepoints = 12
  spieler(i)\MaxLifepoints = 12
  spieler(i)\LifeGain = 3
  spieler(i)\Mana = 3
  spieler(i)\MaxMana = 3
  spieler(i)\ManaGain = 3
  spieler(i)\Attack = 1
  spieler(i)\Dexterity = 1
  spieler(i)\Strength = 1
  spieler(i)\MaxSpeed = 7
  spieler(i)\Speed = 7
  spieler(i)\Perception = 1
  spieler(i)\Luck_score = 1
  spieler(i)\Power_score = 1
  spieler(i)\Circle = 0
  spieler(i)\magic_resistance = 0
  spieler(i)\poison_resistance = 0
  spieler(i)\fire_resistance = 0
  spieler(i)\cold_resistance = 0
  spieler(i)\lightning_resistance = 0
  spieler(i)\spellweaving = 1
  spieler(i)\style = 0
  spieler(i)\light = 1
  spieler(i)\hunger = 0
  spieler(i)\durst = 0
  spieler(i)\betrunken = 0
  spieler(i)\mks = 0
  spieler(i)\schleichen = 0
  spieler(i)\fluch = 0
  spieler(i)\fluchdauer = 0
  spieler(i)\krankheit = 0
  spieler(i)\krankheitdauer = 0
  spieler(i)\poison = 0
  spieler(i)\verhungern = 0
  spieler(i)\verdursten = 0
  spieler(i)\weisheit = 0
  spieler(i)\lifepointgegenstand  = 0
  spieler(i)\managegenstand  = 0
  spieler(i)\staerkegegenstand = 0
  spieler(i)\zugweitegegenstand = 0
  spieler(i)\dexteritygegenstand = 0
  spieler(i)\gluecksgegenstand = 0
  spieler(i)\bogentreffergegenstand = 0
  spieler(i)\bogenschadengegenstand = 0
  spieler(i)\powergegenstand = 0
  spieler(i)\perceptiongegenstand = 0
  spieler(i)\attackgegenstand = 0
  spieler(i)\stealthgegenstand = 0
  spieler(i)\damagegegenstand = 0
  spieler(i)\lichtgegenstand = 0
  spieler(i)\diebstahlgegenstand = 0
  spieler(i)\goblinlehre = 0
  spieler(i)\spinnenlehre = 0
  spieler(i)\untotenlehre = 0
  spieler(i)\pflanzenlehre = 0
  spieler(i)\tierkunde = 0
  spieler(i)\fallenlehre = 0
  spieler(i)\giftlehre = 0
  spieler(i)\pos_zaubermenue = 0
  spieler(i)\dumm = 0
  spieler(i)\face = 2
  spieler(i)\hinterhalt = 0
  spieler(i)\udjat_ben = 1
  spieler(i)\akt_zauber = 1
  spieler(i)\schule = #school_all
  spieler(i)\sorting_style = 0
  spieler(i)\udjat_ben = 1
  For act_piece = 1 To 9
   spieler(i)\staff_pieces[act_piece] = 0
  Next
  spieler(i)\character_x = 1
  spieler(i)\character_y = 1
  spieler(i)\moves = 0
  spieler(i)\anker_x = 0
  spieler(i)\anker_y = 0
  spieler(i)\anker_level = 0
  spieler(i)\old_pos_x = spieler(i)\character_x
  spieler(i)\old_pos_y = spieler(i)\character_y
  spieler(i)\old_level = spieler(i)\level
  spieler(i)\old_lp = spieler(i)\lifepoints
  spieler(i)\old_max_lp = spieler(i)\maxlifepoints
  spieler(i)\old_mp = spieler(i)\mana
  spieler(i)\old_max_mp = spieler(i)\maxmana
  spieler(i)\cause_of_death = 0
  spieler(i)\cause_of_death_monster = 0
  spieler(i)\in_water = 0
Next

; Clear active spells
For j = 1 To #nr_of_players
  For i = 1 To #ACTIVE_SLOTS
    aktive (i,j)\nr = 0
    aktive (i,j)\dauer = 0
  Next
Next

; Clear quick spells
For j = 1 To 10
  For i = 1 To #nr_of_players
    quickspells(j,i) = 0
  Next
Next
For j = 1 To 8
  For i = 1 To #nr_of_players
    quickspells2(j,i) = 0
  Next
Next

; Clear inventory
For j = 1 To #nr_of_players
  For i = 1 To #MAX_RUCKSACK
    inventory(i,j)\name = 0
    inventory(i,j)\status = 0
    inventory(i,j)\benutzt = 0
    inventory(i,j)\anzahl = 0
    inventory(i,j)\attri5 = 0
  Next
Next

ClearList(unique_items())

;clear monsters
ClearList(monster_list())
;add dummy elements as a starter and stopper
;these make sure all real elements have a previous and next element
;escpecially deleting elements is dangerous otherwise
AddElement(monster_list())
monster_list()\z = -1
AddElement(monster_list())
monster_list()\z = 9999
For i = 1 To #MAX_EBENEN
  first_monster(i)\p = @monster_list()
Next

;clear merchants
ClearList(Merchants())

;clear rooms
ClearList(room_list())

init_creatures()

anfangszeit.s = FormatDate("%yyyy%mm%dd%hh%ii%ss", Date())

init_spells()
init_traenke()
init_pilze()

; Titelmusic ab
If music = 1
  StopModule(-1)
  PlayModule(#MOD_ARCHONS)
EndIf

; Titelscreen anzeigen
title()

; Anzahl Spieler festlegen
select_spieler()

skill_traders_req.w = 0
For akt_spieler = 1 To nr_of_players - 1 Step 2
  maennchen_auswaehlen()
  ;load last used skill selection as pre-selection
  ClearList(template_list())
  load_templates()
  SelectElement(template_list(), (akt_spieler-1) / 2)
  template_to_player()
  ClearList(template_list())

  select_skills()
  ;set initial spell chance & scroll known status
  For i = 1 To #ANZ_ZAUBER
    If skills(#CE_ZAUBERSCHRIFT,akt_spieler)\gewaehlt = 1 Or skills(#CE_SCROLLORE,akt_spieler)\gewaehlt = 1
      scroll_known.w = #l_scrollname
    Else
      scroll_known.w = 0
    EndIf
    If spells(i)\school = #school_bard
      learned(akt_spieler,i)  = 100 | scroll_known
    Else
      learned(akt_spieler,i)  = 50 | scroll_known
    EndIf
  Next
  ;ask player to input his name
  get_player_name()

  advancements()
  spieler(akt_spieler)\verifikation = ""
  For i = 1 To 30
    spieler(akt_spieler)\verifikation = spieler(akt_spieler)\verifikation + Str(Random(9))
  Next
  If skills(#CE_HAENDLER,akt_spieler)\gewaehlt = 1
    skill_traders_req = 1
  EndIf
Next
;save the actually used skill selection into the 4 special template slots
ClearList(template_list())
load_templates()
For akt_spieler = 1 To nr_of_players - 1 Step 2
   SelectElement(template_list(), (akt_spieler-1) / 2)
   player_to_template()
Next
save_templates()

; Titlemusic off
If music = 1
  StopModule(-1)
EndIf

; Wegen Kundschafter/Lahm/Staemmig neu berechnen
For akt_spieler = 1 To nr_of_players
  spieler(akt_spieler)\speed = maxspeed()
  spieler(akt_spieler)\Lifepoints = maxlife()
Next
akt_spieler = 1

; Init Labyrinth
For akt_level.w = 1 To #MAX_EBENEN

  ; Init Automap
  For i = 1 To #MAX_GROESSE
    For j = 1 To #MAX_GROESSE
      automap(i,j) \feld[akt_level] = 0
    Next
  Next

  ; Levelmodifier?
  levelmod(akt_level) = 0
  If akt_level > 25 And Random(100) > 90
    levelmod(akt_level) = Random(#ANZ_LEVELMODS-1)+1
  EndIf
  If test = 1: levelmod(akt_level)=#LM_GIFTIGER_NEBEL: EndIf

  ; Special level?
  sonderlevel(akt_level) = 0
  If (akt_level > 10 And Random(100) > 80 And levelmod(akt_level) = 0)
    sonderlevel(akt_level) = Random(#ANZ_SONDERLEVEL-1)+1
  EndIf
  ;If test = 1
      ;sonderlevel(akt_level) = #SL_SUMPF
      ;sonderlevel(akt_level) = #SL_ARCHIPEL
  ;EndIf

  ; River?
  fluss(akt_level) = 0
  If (akt_level >= 10 And Random(3) = 0 And sonderlevel(akt_level) = 0)
    fluss(akt_level) = 1
  EndIf

  ; Room?
  If akt_level < #TWO_ROOMS_BORDER
      nr_of_rooms = 1
  ElseIf akt_level < #THREE_ROOMS_BORDER
      nr_of_rooms = 2
  Else
      nr_of_rooms = 3
  EndIf
  
  If test = 1
      nr_of_rooms = 2
  EndIf
  
  For nr_in_level.w = 1 To nr_of_rooms
      If ((akt_level > 3 Or test = 1) And fluss(akt_level) = 0 And sonderlevel(akt_level) = 0)
         Repeat
            setzen.w = 1
            act_room.w = Random(#ANZ_RAEUME-1)+1
            If act_room = #RAUM_STABTEIL
               ;we will set the staff pieces directly
               setzen = 0
            EndIf
            If act_room = #RAUM_HYDRA And akt_level < 10
               setzen = 0
            EndIf
            If act_room = #RAUM_MONSTERFALLE And akt_level < 6
               setzen = 0
            EndIf
            If act_room = #RAUM_FEUERDAEMON And akt_level < 7
               setzen = 0
            EndIf
            If test = 1
               ;act_room = #RAUM_HAENDLER1
               ;act_room = #RAUM_WALD
               ;act_room = #RAUM_PENTAGRAMM
               ;act_room = #RAUM_ALTAR
               ;act_room = #RAUM_BIBLIOTHEK
               ;act_room = #RAUM_ALCHIMIST
               act_room = #RAUM_STATUE
               ;act_room = #RAUM_MONSTERFALLE
               ;act_room = #RAUM_TRUHEN
               ;act_room = #RAUM_GOLD
               ;act_room = #RAUM_FRIEDHOF
               ;act_room = #RAUM_BRUNNEN
               ;act_room = #RAUM_SCHATZ
               ;act_room = #RAUM_FEUERDAEMON
               ;act_room = #RAUM_HAENDLER2
               ;act_room = #RAUM_LEHRER
               ;act_room = #RAUM_DRACHE
               ;act_room = #RAUM_LAVASCHATZ
               ;act_room = #RAUM_STABTEIL
               ;act_room = #RAUM_TAVERNE
               ;act_room = #RAUM_HYDRA
               ;act_room = #RAUM_SCHATZ2
               ;act_room = #RAUM_WIZARD
               ;act_room = #RAUM_SEE
               ;act_room = #RAUM_SCHMIEDE
               ;act_room = #RAUM_FALLEN
               ;act_room = #RAUM_HAENDLER3
               ;act_room = #RAUM_HAENDLER4
               ;act_room = #RAUM_THRONSAAL
               ;act_room = #RAUM_HAENDLER5
               ;act_room = #RAUM_FALLEN_SCHATZ
               ;act_room = #RAUM_GEFAENGNIS
               ;act_room = #RAUM_ORK_DORF
               ;act_room = #RAUM_HEXENHAUS
               setzen = 1
            EndIf
            If setzen = 1
               AddElement(room_list())
               room_list()\level = akt_level
               room_list()\nr_in_level = nr_in_level
               room_list()\type = act_room
               room_list()\visions = 1
               If act_room = #RAUM_LEHRER
                  For i = 1 To #nr_of_players
                     room_list()\only_once[i] = 1
                  Next
               EndIf
            EndIf
         Until setzen = 1
         If act_room = #RAUM_HAENDLER1
            AddElement(Merchants())
            init_merchant(1,akt_level)
            Merchants()\face = #FELD_HAENDLER1
            room_list()\stat1 = CountList(Merchants())-1
         EndIf
         If act_room = #RAUM_HAENDLER2
            AddElement(Merchants())
            init_merchant(2,akt_level)
            Merchants()\face = #FELD_HAENDLER2
            room_list()\stat1 = CountList(Merchants())-1
         EndIf
         If act_room = #RAUM_HAENDLER3
            AddElement(Merchants())
            init_merchant(3,akt_level)
            Merchants()\face = #FELD_HAENDLER3
            room_list()\stat1 = CountList(Merchants())-1
         EndIf
         If act_room = #RAUM_HAENDLER4
            AddElement(Merchants())
            init_merchant(4,akt_level)
            Merchants()\face = #FELD_HAENDLER4
            room_list()\stat1 = CountList(Merchants())-1
         EndIf
         If act_room = #RAUM_HAENDLER5
            AddElement(Merchants())
            init_merchant(5,akt_level)
            Merchants()\face = #FELD_HAENDLER4_4
            room_list()\stat1 = CountList(Merchants())-1
         EndIf
      EndIf
   Next ; nr_of_rooms

   small_trader(akt_level) = -1
Next

;place first 3 small traders extra to reduce needed luck in map generation
For i = 0 To 2
   AddElement(Merchants())
   akt_level = i*3 + 1 + Random(2)
   init_merchant(Random(8)+6,akt_level)
   If Random(1)
      Merchants()\face = #FELD_HAENDLER9
   Else
      Merchants()\face = #FELD_HAENDLER10
   EndIf
   small_trader( akt_level ) = CountList(Merchants())-1
Next

For akt_level.w = 10 To #MAX_EBENEN
   If Random(100) > 68+akt_level And sonderlevel(akt_level) <> #SL_LAVAKAVERNE
      AddElement(Merchants())
      init_merchant(Random(9)+5,akt_level)
      If Random(1)
         Merchants()\face = #FELD_HAENDLER9
      Else
         Merchants()\face = #FELD_HAENDLER10
      EndIf
      small_trader(akt_level) = CountList(Merchants())-1
   EndIf
Next

For i = 1 To 9
  rel_pos.b = Random(9)
  final.b = rel_pos
  While fluss(10*i + rel_pos) = 1 Or sonderlevel(10*i + rel_pos) > 0
    rel_pos = (rel_pos + 1) % 10
    If rel_pos = final
      ;no suitable place found -> ovverride sonderlevel
      fluss(10*i + rel_pos) = 0
      sonderlevel(10*i + rel_pos) = 0
      AddElement(room_list()) ;create room in list
      room_list()\level = 10*i + rel_pos
      room_list()\nr_in_level = 1
      room_list()\visions = 1
      Break
    EndIf
  Wend
  ResetList(room_list())
  Repeat
      NextElement(room_list())
  Until room_list()\level = 10*i + rel_pos
  room_list()\type = #RAUM_STABTEIL
  room_list()\stat1 = i
Next
;ResetList(room_list()) ;roomlist dump for testing
;While NextElement(room_list())
;  print(str(room_list()\level)+"|")
;Wend 
;print("----------------------------------------------------------------")
;place the staff pieces

; Init skill trader + level curses
For akt_level = 1 To #MAX_EBENEN
  skill_trader(akt_level) = Random(24)
  If skill_trader(akt_level) >= 1 And skill_trader(akt_level) <= 5 And skill_traders_req = 1
    AddElement(Merchants())
    init_merchant(skill_trader(akt_level))
    skill_trader(akt_level) = CountList(Merchants()) -1
  Else
    skill_trader(akt_level) = -1
  EndIf
  If Random(99) < min(20+akt_level,90)
    level_curse(akt_level) = Random(#ANZ_FLUECHE-1) + 1
  Else
    level_curse(akt_level) = 0
  EndIf
Next

level = 1
gen_laby(level)

For i = 1 To nr_of_players
  spieler(i)\character_x = eingangx(level)
  spieler(i)\character_y = eingangy(level)
Next

akt_spieler = 1
geladen:

For i = 0 To 25
  old_messages(i)\color     = 0
  old_messages(i)\message = " "
  old_messages(i)\time = ""
  old_messages(i)\player = 0
Next

; erstes Zeichnen des Hauptbildschirms
FlipBuffers()
laby_screen()


; Hintergrundmusik ab
If music = 1
  PlayModule(#MOD_BALLADA)
EndIf


; Mainloop

main_wait_release.w = 1 ;to stop unwanted movements after player change
force.w = 0   ; for astar routing mixed with keyboard movement
      
init_keyboard_main()

Repeat
   
   ; Movement
   xmod = 0
   ymod = 0
   read_keyboard()
   read_joystick()
   read_mouse()

   aktion = 0
   okay = 0
      
   ; #PB_KEY_Right
   If used_keys(1)\pressed And main_wait_release = 0
      used_keys(1)\wait_release = 1
      If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 2
         okay = 1
         spieler(akt_spieler)\face = 1
         xmod = 1
         ymod = 0
         force = 1
      Else
         aktion = 1
      EndIf
   EndIf
   ; #PB_KEY_Left
   If used_keys(2)\pressed And main_wait_release = 0
      used_keys(2)\wait_release = 1
      If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 4
         okay = 1
         spieler(akt_spieler)\face = 3
         xmod = -1
         ymod = 0
         force = 1
      Else
         aktion = 1
      EndIf
   EndIf
   ; #PB_KEY_Up
   If used_keys(3)\pressed And main_wait_release = 0
      used_keys(3)\wait_release = 1
      If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 1
         okay = 1
         spieler(akt_spieler)\face = 0
         xmod = 0
         ymod = -1
         force = 1
      Else
         aktion = 1
      EndIf
   EndIf
   ; #PB_KEY_Down
   If used_keys(4)\pressed And main_wait_release = 0
      used_keys(4)\wait_release = 1
      If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 3
         okay = 1
         spieler(akt_spieler)\face = 2
         xmod = 0
         ymod = 1
         force = 1
      Else
         aktion = 1
      EndIf
   EndIf

   ;wait for release manually in mainloop as it works differently here
   If Not ( used_keys(1)\pressed Or used_keys(2)\pressed Or used_keys(3)\pressed Or used_keys(4)\pressed ) 
      main_wait_release = 0
   EndIf
      
   read_buttons()

   If no_mouse = 0
      If mmouse_links And mmouse_links_wait_release = 0
         mmouse_links_wait_release = 1
          If mmouse_x > 160 And mmouse_x < 192 And mmouse_y >= 160 And mmouse_y <= 192
            autopickup()
            init_keyboard_main()
         ; Right
         ElseIf mmouse_x > 192 And mmouse_x < 224 And mmouse_y >= 160 And mmouse_y <= 192
            If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 2
               okay = 1
               spieler(akt_spieler)\face = 1
               xmod = 1
               ymod = 0
            Else
               aktion = 1
            EndIf
         ; Left
         ElseIf mmouse_x > 128 And mmouse_x < 160 And mmouse_y >= 160 And mmouse_y <= 192
            If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 4
               okay = 1
               spieler(akt_spieler)\face = 3
               xmod = -1
               ymod = 0
            Else
               aktion = 1
            EndIf
         ; Down 
         ElseIf mmouse_x > 160 And mmouse_x < 192 And mmouse_y >= 192 And mmouse_y <= 224
            If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 3
               okay = 1
               spieler(akt_spieler)\face = 2
               xmod = 0
               ymod = 1
            Else
               aktion = 1
            EndIf
         ; Up
         ElseIf mmouse_x > 160 And mmouse_x < 192 And mmouse_y >= 128 And mmouse_y <= 160
            If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 1
               okay = 1
               spieler(akt_spieler)\face = 0
               xmod = 0
               ymod = -1
            Else
               aktion = 1
            EndIf
         EndIf
            
         moved.w = 0
            
         nr_of_steps.w = CountList(movementlist())
         If mmouse_x < 370 And mmouse_y <= 370 And nr_of_steps > 0
            LastElement(movementlist())
            akt_xmod = 7
            akt_ymod = 7
            akt_step.w = 1
            Repeat
               xmod = 0
               ymod = 0
               If movementlist()\x > akt_xmod
                  If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 2
                     spieler(akt_spieler)\face = 1
                     xmod = 1
                     ymod = 0
                  Else
                     Goto nach_zauber
                  EndIf
               ElseIf movementlist()\x < akt_xmod
                  If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 4
                     spieler(akt_spieler)\face = 3
                     xmod = -1
                     ymod = 0
                  Else
                     Goto nach_zauber
                  EndIf
               ElseIf movementlist()\y > akt_ymod
                  If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 3
                     spieler(akt_spieler)\face = 2
                     xmod = 0
                     ymod = 1
                  Else
                     Goto nach_zauber
                  EndIf
               ElseIf movementlist()\y < akt_ymod
                  If spieler(akt_spieler)\charge < 1 Or spieler(akt_spieler)\charge = 1
                     spieler(akt_spieler)\face = 0
                     xmod = 0
                     ymod = -1
                  Else
                     Goto nach_zauber
                  EndIf
               EndIf
               moved = 1
               move()
               If CountList(movementlist()) > 0
                  akt_xmod = movementlist()\x
                  akt_ymod = movementlist()\y
               EndIf
               akt_step+1
            Until PreviousElement(movementlist()) = 0 Or spieler(akt_spieler)\Speed < 1 Or akt_step > nr_of_steps Or (xmod = 0 And ymod = 0)  Or aktion = 1
            show_movement(mmouse_x,mmouse_y,1)
            something_changed = 1
         EndIf
      EndIf ; mouse_links
   EndIf ;  no_mouse
        
   If moved = 0
     move()
   EndIf

   schnelltasten()
   If aktion = 1
      init_keyboard_main()
      Goto nach_zauber
   EndIf
   zwischenbild()
   ftasten()

   ; Auto-Toggle
   ; #PB_KEY_Space
   If (used_keys(23)\pressed And used_keys(23)\wait_release = 0) And autopickup = 0
      used_keys(23)\wait_release = 1
      autopickup()
      init_keyboard_main()
   EndIf
      
   If moved = 0 And okay = 0
      sonderfeld()
   Else
      moved = 0
      okay = 0
   EndIf
         
   If something_changed = 1
      Fenster()
      laby_screen2()
         
      show_buttons()

      If no_mouse = 0
         If moved = 0
            show_movement(mmouse_x,mmouse_y,force)
            force = 0
         EndIf
            
         over_item = 0
         If mmouse_x > 160 And mmouse_x < 192 And mmouse_y >= 160 And mmouse_y <= 192
            ; over an item?
            If laby_item(spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\name[spieler(akt_spieler)\level] > 0
               over_item = 1
            EndIf
            testfeld.w = labyrinth(spieler(akt_spieler)\level,spieler(akt_spieler)\character_x, spieler(akt_spieler)\character_y)\feld
            If (testfeld >= #FELD_BAUM3 And testfeld <= #FELD_BAUM6) Or testfeld = #FELD_GRUENETRUHE2 Or testfeld = #FELD_WIESE_GRUENETRUHE2 Or testfeld = #FELD_BLAUETRUHE2 Or testfeld = #FELD_WASSER_TRUHE Or testfeld = #FELD_WASSER_GRUENE_TRUHE Or testfeld = #FELD_GOLD Or testfeld = #FELD_STABTEIL Or testfeld = #FELD_SANKTUM Or testfeld = #FELD_HAENDLER1 Or testfeld = #FELD_HAENDLER2 Or testfeld = #FELD_HAENDLER3 Or testfeld = #FELD_HAENDLER4_4 Or testfeld = #FELD_HAENDLER9 Or testfeld = #FELD_HAENDLER10 Or testfeld = #FELD_LEHRER1 Or testfeld = #FELD_LEHRER2 Or testfeld = #FELD_LEHRER3 Or testfeld = #FELD_LEHRER4 Or testfeld = #FELD_LEHRER5 Or testfeld = #FELD_LEHRER6 Or testfeld = #FELD_LEHRER7 Or testfeld = #FELD_LEHRER8 Or testfeld = #FELD_LEHRER9 Or testfeld = #FELD_LEHRER10 Or testfeld = #FELD_WOUNDED_HERO1 Or testfeld = #FELD_WOUNDED_HERO2 Or testfeld = #FELD_TRUHE Or testfeld = #FELD_WIESE_TRUHE Or testfeld = #FELD_NEXUS Or testfeld = #FELD_BRUNNEN Or testfeld = #FELD_AMBOSS Or testfeld = #FELD_SCHALTER1 Or testfeld = #FELD_EINGANG Or testfeld = #FELD_AUSGANG Or testfeld = #FELD_RINNSAAL
               over_item = 1
            EndIf
         EndIf
      EndIf ; no_mouse
         
      end_screen(over_item)
   EndIf ; something_changed

   If spieler(akt_spieler)\Speed < 1 Or aktion = 1
      spielerwechsel = 1
nach_zauber:
      init_keyboard_main()
      laby_screen2()
      nach_zug()
      laby_screen()
   EndIf


   ; Are there other players?
   weitere = 0
   For i = 1 To nr_of_players
      If spieler(i)\status = 1
         weitere = weitere + 1
      EndIf
   Next

   If (spielerwechsel = 1 Or aktion = 1) And weitere > 1
      naechster()
      main_wait_release = 1
   EndIf
   
   Delay(#Input_delay)
Until 1=2 ; forever!
End
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 1071
; FirstLine = 1060
; Folding = -
; EnableXP
; UseIcon = laby.ico
; Executable = laby.exe
; DisableDebugger
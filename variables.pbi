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

; Common variables
Global nr_of_players.w = 2
Global environment.s
Global mouse_matrix_x.w
Global mouse_matrix_y.w
Global mouse_matrix_x_old.w
Global mouse_matrix_y_old.w
Global akt_spieler.b = 1
Global test.b = 0         ; Testrun ? (0=no 1=yes 2+=data dump modes 2=skill data,3=potions)
Global xmod.w
Global ymod.w
Global language.b = 0      ; 0 is english, 1 is german, 2 is spanish
Global jax.w
Global jay.w
Global mmouse_x.w
Global mmouse_x_old.w
Global mmouse_y.w
Global mmouse_y_old.w
Global mmouse_links.w
Global mmouse_links_old.w
Global mmouse_links_doubleclick.l
Global mmouse_links_wait_release.w
Global mmouse_rechts.w
Global mmouse_rechts_old.w
Global mmouse_rechts_wait_release.w
Global key_wait_release.w
Global something_changed.w
Global key_repeat_time.w = 3
Global first_key_repeat_time.w = 10
Global key_repeat_counter.w = first_key_repeat_time
Global delay_animation.w = 200  ; one tile
Global delay_animation2.w = 90  ; animation from fx file



gb_CallFromTitleScreen = 0
win_mode.w = 1     ; 1 = Fullscreen, 2 = Fenster
flaschen.w = 1     ; display Mana/Life graphically?
released.w = 1
itemmenue_aktiv.w = 0
joystick_used.w = 0
no_mouse.w = 0
knopf5.w = 0
mit_was_normal.w = #FELD_MAUER
inhalt_normal.w =  #FELD_LEER
bewegen.w = 0
aktuell.w = 0
anz_levels.w = 0
frame.b = 0        ; Animationsframe des Charakters
framestep.b = 0    ; Verzoegerung der Animation des Charakters
zw_bild.b = 0      ; Splash Bilder
benutzen.b         ; Fuer Inventarmenue
ganglaenge.w       ; Fuer laby_gen
sprite_x.w
sprite_y.w
spell_x.w
spell_y.w
blocked.w
nr.w
feld.w
bewegt.b = 0
von_ferne.b = 0
autopickup.w = 1
keydelay = 15    ; typing delay: first letter
keydelay2 = 3    ; typing delay: hold Key
schutz_min.w = 0
schutz_max.w = 0
behinderung.w = 0
anfangszeit.s = " "
skills_menu.w = 1
maennchen_menu.w = 1
cinfo_menu.w = 1
zeit.s
altezeit.s
mauszauber.b
mauszauber2.b
letzter_eintrag.b = 0
anz_zauber.w = 0
akt_option.b = 1
myname.s
do_it.w = 0      ; From Inventory (right)
do_it2.w = 0     ; From Body (left)
sound.w = 1
music.w = 1
klicking.w = 1
ADMax.l = 10
abbrechen.w = 0
no_room_intro.l = 0
monsterauge.w = 0
over_item.w = 0
warten.w = 0
matrix_pos_x.w = 0
matrix_pos_y.w = 0
in_sight.w = 0
min_icon_pos.w
icon_pos.w
nr_of_saves.w

no_mouse_text.s
autopickup_text.s
sound_text.s
music_text.s
klicking_text.s
knopf5_text.s
flaschen_text.s
raushier.w = 0
key_repeat_delay.w = 90

over_rulesbutton.w
over_lookbutton.w
over_sneakbutton.w
over_climbbutton.w
over_theftbutton.w
over_inventorybutton.w
over_attributesbutton.w
over_bowbutton.w
over_spellbutton.w
over_optionsbutton.w
over_skipbutton.w
over_automapbutton.w
over_oldmessagesbutton.w


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 22
; FirstLine = 3
; Folding = -
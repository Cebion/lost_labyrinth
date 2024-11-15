The Lost Labyrinth
------------------------
Release Date: 17.08.2010
Version: 4.0.0
Autor: Markus Doebele
EMail: mar_doe@gmx.de
Homepage: www.lostlabyrinth.com
Language: purebasic (www.purebasic.com)
Licence: GNU GPL Version 2 or (at your option) any later version


Welcome to Lost Labyrinth!

1. How to install the game

There are different releases of this game.
- deb: Use the following command: "sudo dpkg -i lostlabyrinth_{version}.deb".
- rpm:  Use the following command: "rpm -i lostlabyrinth_{version}.rpm"
        Maybe you have to remove an installed version with 
        "rpm -e lostlabyrinth_{version}.rpm"
        You have to be root to do that. "su" gives you root privileges.
- tar.gz: To extract it you can use "ark"
- zip: To extract it you can use "winzip"

2. How to start the game

- deb/rpm (To start it simply execute "laby" or select it in the start menu)
- tar.gz (You have to use the shell. Enter the directory where laby is installed 
e.g. "cd /home/markus/laby".
And execute "./laby.exe")
Maybe you have to make it executable before trying that:
As a superuser enter this command:  "chmod a+x laby.exe"
- zip (Simply doubleklick on the program)

3. What is lost labyrinth?

Its a bit like Roque. You create a character, with a lot of different skills and 
enter a labyrinth.
The goal of the game is to get as deep into the dungeon as possible. Every level, 
every gold coin you find and every monster you kill gets you points.
In the end you can upload your score and skill combination to the online highscore
on the homepage.

4. Requirements

Linux: You have to have "sdl" installed.
       (On debian/ubuntu you achieve this by executing: 
        sudo apt-get install libsdl-image1.2 libsdl-mixer1.2 libsdl-ttf2.0 libsdl-sound1.2 libsdl-gfx1.2 libsdl-net1.2)
Windows: You have to have DirectX 6.0 or higher installed. 
We need them for drawing all this nice little sprites.

5. How to play

The first level is very small (11 on 11 fields). You start in one random corner and your goal is to 
find the exit to the next deeper level (how it looks like you can see in the faq on the homepage).
Every level you get into will be one field larger (up to a maximum of 200 on 200 fields). 
The monsters get tougher the goldcoins you find get more and the traps become more deadly.
Its a round based game (We don't like to hurry). Your character has a movement 
rate per turn (You normally start with 7). After you spent all your movement points a 
new round starts. you get more hungry, more thirsty, your torch burns a bit, your 
find traps spell lasts one round less and a new monster enters the labyrinth 
somewhere. When the lifepoints reach zero you are dead. to restore your lifepoints 
you need to find the sanctum that exists in every level. it looks like a cross. 
with mana you can cast spells. every spell costs mana. to replenish your mana 
you need to find the nexus. It looks like a pentagram and exists in every level.

The keys are like this:
"m"              automap
"i", "r", "b"    inventory
"c", "z", "y"    cast spells menue
"d"              character Datasheet
"p"              pickpocket
"a"              mystic attack
"x"              skip turn
"cursorkeys"     for walking.

6. How to fight

Simply walk against an enemy to attack it with your selected weapon. 
To select it press "i" for the inventory and select the item with the left 
mouse button. You choose an action in the menu, also with the left mousebutton. 
To leave the inventory press i again or click the exit button.

7. About Magic

To cast spells a lot of things are important. The number of spells you know is 
limited by your spell circle rating and the number of circles you have chosen 
(e.g. fire-magic and black-magic). 
Everybody has basic magic which has a lot of useful spells. Most circlelevel 
give you one spell of basic-magic. For chosen circles you often get additional 
spells. a list of the spells you can get in the game by clicking on help and then on spellist.
A hint: When you choose magical training as skill you start with circle
level 3 and you have some spells ready at gamestart. Normally the chance to 
sucessfully cast a spell are 50 percent. Everytime you succeed in casting one 
your chances for this spell are raised by 5 percent.
Another of your attributes is important: power. e.g. The amount of damage a 
fireball deals to an opponent is corresponding to this rating. All active spells 
get terminated when you enter the nexus.
To enter the spellist press "c". Use the up/downkeys for selecting the right spell. 
Then press "return" to cast it.
Some spells need you to select a field where they are cast onto. You navigate the 
Cursor with the Cursorkeys and the press "space" to place the spell.
with the mouse you can simply select the target square. left click there to place the spell.

Quick Keys:
When you press a number key (0-9) while on a spell this one gets saved to this key. 
You can cast it by pressing the same key later. So we can quickly access 10 spells.

When you move the mouse in the mainscreen over a spell and press the right mousebutton 
the spell will be terminated.

8. Fullscreen/Windowed Mode

In the options you can change the mode.
if you want the game to always start in windows more e.g. you can, after changing this, click on "save settings".

9. Language

Some people like to change the language of their games. You can achieve this by clicking on the flag in the mainscreen
and then click on the language you want the game to be in.
Or you can change the settings.txt file with a text editor.

10. Joystick

The joystick has to be turned on in the options menu.
The buttons are like this:
1-return (e.g. to select a spell)
2-space (e.g. to place a spell) or opens options
3-inventory
4-spellmenu
You can save spells to the buttons 5-8 when pressing them while you are in the spellmenu.


Have fun!

Markus

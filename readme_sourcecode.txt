The Lost Labyrinth Sourcecode
------------------------
Release Date: 18.08.2010
Version: 4.0.0
Autor: Markus Doebele
E-Mail: mar_doe@gmx.de
Homepage: www.lostlabyrinth.com
Language: purebasic (www.purebasic.com)
Licence: GNU GPL Version 2 or (at your option) any later version


Requirements
-------------
We need some software packages to successfully compile laby.
in debian/ubuntu you can simply do:
sudo apt-get install rpm debhelper build-essential devscripts fakeroot ruby racc libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-sound1.2-dev libsdl-gfx1.2-dev libsdl-net1.2-dev

Get the sourcecode
-------------------
We get the sourcecode from the subversion directory on sourceforge.
The project page is here: http://sourceforge.net/projects/lostlaby/
In windows we can use tortoisesvn for that: http://tortoisesvn.tigris.org/
In linux we install subversion for that: "sudo apt-get install svn"

Like this we get the sourcecode, the graphics and the sounds:
svn co https://lostlaby.svn.sourceforge.net/svnroot/lostlaby lostlaby

Get the compiler
-----------------
In windows we need the commercial purebasic compiler.
We can buy it here: http://www.purebasic.com

In linux we use the open source elice compiler.
We can get it from sourceforge again. This time its a bazaar archive.
First we have to install bazaar: "sudo apt-get install bzr"
Then we get the compiler source: "bzr co bzr://elice.bzr.sourceforge.net/bzrroot/elice"
then change into the elice directory and do: "make && sudo make install". This should compile and install the compiler.

Compile Laby
-------------
In windows we start purebasic and load laby.pb from the lostlabyrinth/pb directory.
We can just press the run button which will compile the game and then start it.

In linux we change into the laby directory. And then into the pb directory.
Then we execute: "elice laby.pb".
The program we get should be named "laby".
We can then start it with "./laby".


Have fun!
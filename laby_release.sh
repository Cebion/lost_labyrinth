#!/bin/bash

#DO_VERBOSE="-v"
DO_VERBOSE=""

LABY_VERSION=`grep \#PROGRAMMVERSION  pb/constants.pbi | awk '{ print $3 }' | sed "s/\"//"g`


TEST=`grep "Global test.b = 0" pb/variables.pbi`
if [ -z "$TEST" ]
then
	echo "test switch has to be off!"
	exit 1
fi

TEST=`grep "windowed = no" pb/settings.txt`
if [ -z "$TEST" ]
then
	echo "windowed not allowed!"
	exit 1
fi

TEST=`grep "sound = yes" pb/settings.txt`
if [ -z "$TEST" ]
then
	echo "sound is off!"
	exit 1
fi

TEST=`grep "music = yes" pb/settings.txt`
if [ -z "$TEST" ]
then
	echo "music is off!"
	exit 1
fi

TEST=`grep "lostlabyrinth ($LABY_VERSION" debian/changelog`
if [ -z "$TEST" ]
then
	echo "debian changelog needs to be changed!"
	exit 1
fi

TEST=`grep "define version $LABY_VERSION" laby.spec`
if [ -z "$TEST" ]
then
	echo "laby.spec needs to be changed!"
	exit 1
fi

echo "compiling laby using elice"
cd pb
elice laby.pb -o laby
cd ..

echo "packing graphics"
cd pb/Tools
elice PackerGraphics.pb
./PackerGraphics
rm PackerGraphics
cd ../..

echo "packing sounds"
cd pb/Tools
elice PackerSound.pb
./PackerSound
rm PackerSound
cd ../..


FILES_BIN="laby highscores.dat leeme.txt leeme_hechizos.txt liesmich.txt liesmich_zauber.txt readme.txt readme_spells.txt settings.txt laby.xpm sounds.pak graphics.pak FAQ_deu.txt FAQ_esp.txt FAQ_eng.txt archonsoflight.xm ballada.mod licences/*.txt"
FILES_BIN_WIN="laby.exe highscores.dat leeme.txt leeme_hechizos.txt liesmich.txt liesmich_zauber.txt readme.txt readme_spells.txt settings.txt laby.xpm sounds.pak graphics.pak FAQ_deu.txt FAQ_esp.txt FAQ_eng.txt archonsoflight.xm ballada.mod licences/*.txt"
FILES_SRC="*.pb *.pbi laby.ico readme_sourcecode.txt leeme_sourcecode.txt liesmich_sourcecode.txt licences/*.txt"

if [ -z "$LABY_VERSION" ]
then
  echo "No version given as parameter! Exiting..."
  exit 1
fi
#LABY_VERSION="${LABY_VERSION}_64x"
LABY_DIR="pb"
LABY_DIR_BIN="laby_${LABY_VERSION}"
LABY_DIR_SRC="laby_source_${LABY_VERSION}"
LABY_RELEASE_BIN="${LABY_DIR_BIN}.tar.gz"
LABY_RELEASE_SRC="${LABY_DIR_SRC}.tar.gz"

if ! [ -d $LABY_DIR ]
then
  echo "Laby directory not found! Exiting..."
  exit 1
fi

if [ -d $LABY_DIR_BIN ]
then
  echo "A folder $LABY_DIR_BIN already exists.."
  echo "To continue means to DELETE its content."
  
  echo "Continue (y/N) ? "
  read cont
  
  if [ "$cont" = "y" -o "$cont" = "Y" ]
  then
    rm -rf $LABY_DIR_BIN
  else
    exit 1
  fi
fi

echo -n "*** Creating folder $LABY_DIR_BIN"
mkdir -p $LABY_DIR_BIN
if [ $? -ne 0 ]
then
  echo ", failed."
  echo "Something went wrong! Exiting..."
  exit 1
else
  echo ", done."
fi

echo "*** Copying files..."
for file_name in $FILES_BIN
do
  cp $DO_VERBOSE $LABY_DIR/$file_name $LABY_DIR_BIN/
  if [ $? -ne 0 ]
  then
    echo "File $file_name missing! Aborting..."
    exit 1
  fi
done

echo "*** Creating tarball $LABY_RELEASE_BIN (for rpm)..."
tar $DO_VERBOSE -czf $LABY_RELEASE_BIN $LABY_DIR_BIN
if [ $? -ne 0 ]
then
  echo "Creating tarball failed! Aborting..."
  exit 1
fi

echo "*** Copying and calling rpmbuild..."
#cp $LABY_RELEASE_BIN /usr/src/rpm/SOURCES/
cp $LABY_RELEASE_BIN ~/rpmbuild/SOURCES
rpmbuild -ba laby.spec

echo "*** Move rpm in userdirectory ***"
#mv /usr/src/rpm/RPMS/i386/*.rpm $HOME
cp ~/rpmbuild/RPMS/*/*.rpm ~/lostlaby

echo "*** Creating tarball $LABY_RELEASE_BIN (for archive)..."
rm -f $LABY_RELEASE_BIN
tar $DO_VERBOSE -czf $LABY_RELEASE_BIN $LABY_DIR_BIN
if [ $? -ne 0 ]
then
  echo "Creating tarball failed! Aborting..."
  exit 1
fi


if [ -d $LABY_DIR_SRC ]
then
  echo "A folder $LABY_DIR_SRC already exists.."
  echo "To continue means to DELETE its content."
  
  echo "Continue (y/N) ? "
  read cont
  
  if [ "$cont" = "y" -o "$cont" = "Y" ]
  then
    rm -rf $LABY_DIR_SRC
  else
    exit 1
  fi
fi

echo -n "*** Creating folder $LABY_DIR_SRC"
mkdir -p $LABY_DIR_SRC
if [ $? -ne 0 ]
then
  echo ", failed."
  echo "Something went wrong! Exiting..."
  exit 1
else
  echo ", done."
fi

echo "*** Copying files..."
for file_name in $FILES_SRC
do
  cp $DO_VERBOSE $LABY_DIR/$file_name $LABY_DIR_SRC/
  if [ $? -ne 0 ]
  then
    echo "File $file_name missing! Aborting..."
    exit 1
  fi
done

echo "*** Creating tarball $LABY_RELEASE_SRC..."
tar $DO_VERBOSE -czf $LABY_RELEASE_SRC $LABY_DIR_SRC
if [ $? -ne 0 ]
then
  echo "Creating tarball failed! Aborting..."
  exit 1
fi

echo "*** Renaming folder to lostlabyrinth ***"
rm -rf lostlabyrinth
mv $LABY_DIR_BIN lostlabyrinth

echo "*** Creating deb ***"
cd lostlabyrinth
cp -r ../debian .
debuild -S -uc 
dpkg-buildpackage -rfakeroot

echo "*** Renaming files to upload names ***"
cd ~/lostlaby
mv lostlabyrinth_$LABY_VERSION-0ubuntu1_*.deb lostlabyrinth_$LABY_VERSION.deb
mv laby_source_$LABY_VERSION.tar.gz labysource_$LABY_VERSION.tar.gz
mv laby_$LABY_VERSION.tar.gz lostlabyrinth_$LABY_VERSION.tar.gz
cd ~
mv laby-$LABY_VERSION-0.i386.rpm ~/lostlaby/lostlabyrinth_$LABY_VERSION.rpm

echo "Commit to svn? (y/N)"
read cont
if [ "$cont" = "y" -o "$cont" = "Y" ]
then
   echo "*** Committing to svn ***"
   svn commit -m "release version $LABY_VERSION" --force-log
fi

echo "*** Now we create the windows version ***"
echo "*** First we repack the graphics.pak ***"
cd ~/lostlaby/pb/Tools
wine 'C:\\Programme\PureBasic\Compilers\PBCompiler.exe' PackerGraphics.pb
echo "*** Then we create the executable ***"
cd ..
wine 'C:\\Programme\PureBasic\Compilers\PBCompiler.exe' /EXE "laby.exe" /ICON "laby.ico" laby.pb

echo "*** Create folder for windows release ***"

if [ -d laby_$1 ]
then
  echo "A folder laby_$1 already exists.."
  echo "To continue means to DELETE its content."
  
  echo "Continue (y/N) ? "
  read cont
  
  if [ "$cont" = "y" -o "$cont" = "Y" ]
  then
    rm -rf laby_$1
  else
    exit 1
  fi
fi

mkdir -p laby_$1

echo "*** Copy files in laby (windows) directory ***"
for file_name in $FILES_BIN_WIN
do
  cp $DO_VERBOSE $file_name laby_$1/
  if [ $? -ne 0 ]
  then
    echo "File $file_name missing! Aborting..."
    exit 1
  fi
done

echo "*** create laby.zip ***"
zip -r lostlabyrinth_$1.zip laby_$1/

echo "*** Move zip to userdirectory ***"
mv lostlabyrinth_$1.zip ../

echo "Done!"
echo

exit 0


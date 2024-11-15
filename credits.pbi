; Credits anzeigen

Procedure show_credits()

  Shared joystick_used

  Structure credit
    text.s
    max.l
    div.l
    sinstart.f
    fade.l
    y.l
  EndStructure

  Global Dim credits.credit (70)
  credit( 1,"Thanks to the most important people for the project:",400)
  credit( 2,"Martine 'Seedydeedee' Davies - Most of the artwork")
  credit( 3,"J. 'Kythera' Contreras - dragon artwork")
  credit( 4,"Cyril van der Haegen - end screen artwork")
  credit( 5,"Camille Kuo - Dark elf and Lich artwork")
  credit( 6,"Jimmy Gustafsson - Dark Wizard artwork")
  credit( 7,"Caitlin Brenna Johnston - Staff of the last covenant")
  credit( 8,"Frank Malota - For the original Version of this game")
  credit( 9,"Frederik Laboreur - For Purebasic")
  credit(10,"Gabriel Szilagyi - For hosting the game")
  credit(11,"Roger Rösch - For additional programming")
  credit(12,"Rasmus Klette - For improving the skill selection menu")
  credit(13,"Peter Eismann - For conversion to new compiler")
  credit(14,"David Gervais - For all the nice item graphics")
  credit(15,"Patrik Broberg - For all the nice item graphics")
  credit(16,"Massimiliano De Ruvo - border artwork")
  credit(17,"Michael Wieland - For inventing the Labyrinth Algorithm")
  credit(18,"xtd - For the laby ingame song")
  credit(19,"archangel - For the laby title song")
  credit(20,"Dominik Döbele - For helping me with the creatures")
  credit(21,"Marc Vinals - For the Spanish Translation")
  credit(22,"Linus Torvalds - For the best Operating System")
  credit(23,"The whole KDE Team - For the best Desktop")
  credit(24,"Sound artists from www.freesound.org:",100)
  credit(25,"smidoid - cracking.wav",100)
  credit(26,"mad-monkey - power06.wav",100)
  credit(27,"reinsamba - crystal_glass.wav,moan.wav",100)
  credit(28,"Erdie - bow.wav,lightning.wav",100)
  credit(29,"Percy Duke - open.wav",100)
  credit(30,"Syna Max - fall.wav,woman_screaming.wav,blow4.wav-blow13.wav",100)
  credit(31,"Benboncan - buy.wav,metal.wav,wolf.wav,earth.wav",100)
  credit(32,"engreitz - gold.wav,gold1.wav",100)
  credit(33,"Ekokubza123 - blow1.wav",100)
  credit(34,"nextmaking - blow2.wav,blow3.wav",100)
  credit(35,"dobroide - insect.wav",100)
  credit(36,"Sea Fury - roar.wav",100)
  credit(37,"plagasul - jawa.wav",100)
  credit(38,"grunz - huh.wav,deathcry.wav,ow.wav,success.wav,chaos.wav,darkness.wav,harp.wav",100)
  credit(39,"ERH - howl.wav",100)
  credit(40,"axiyee - horse.wav",100)
  credit(41,"Miselaineous - blackcat.wav",100)
  credit(42,"inferno.wav - cannon.wav,cannon2.wav",100)
  credit(43,"Dynamicell - flame2.wav",100)
  credit(44,"homejrande - flame.wav",100)
  credit(45,"wildweasel - fireball.wav",100)
  credit(46,"daveincamas - frog.wav",100)
  credit(47,"timtube - hohoho.wav",100)
  credit(48,"Robinhood76 - chicken.wav,boar.wav,splish.wav",100)
  credit(49,"Timbre - glass.wav",100)
  credit(50,"jaimedaniel - wind.wav",100)
  credit(51,"duckboy80 - splash.wav",100)
  credit(52,"Heigh hoo - fillup.wav",100)
  credit(53,"Pogotron - evasion.wav",100)
  credit(54,"luffy - gulp.wav",100)
  credit(55,"ggctuk - bite.wav",100)
  credit(56,"joedeshon - missed.wav",100)
  credit(57,"junggle - select.wav",100)
  credit(58,"FreqMan - open_door.wav",100)
  credit(59,"pagancow - open_chest.wav",100)
  credit(60,"acclivity - ding.wav",100)
  credit(61,"Sound artists from opengameart.org:",200)
  credit(62,"DoKashiteru - holy.wav",100)
  credit(63,"artisticdude - laaa.wav",100)

  credits=63

  ; Initialisieren
  For a=1 To credits
   If Random(1)
      credits(a)\max=(Random(40)+80)
    Else
      credits(a)\max=-1*(Random(40)+80)
    EndIf
    credits(a)\div=Random(20)+60
    credits(a)\sinstart.f=60/Random(200)
  Next
  
   init_keyboard_credits()

  Repeat
    read_joystick()
    read_mouse()
    read_keyboard()
    
    Fenster()
    i+1
    ClearScreen(RGB(0,0,0))
    
   ; #PB_Key_Escape
   if used_keys(1)\pressed And used_keys(1)\wait_release = 0
      used_keys(1)\wait_release = 1
      break
   endif
    
   ; #PB_Key_Space
   if used_keys(2)\pressed And used_keys(2)\wait_release = 0
      used_keys(2)\wait_release = 1
      break
   endif
    
   ; #PB_Key_Return
   if used_keys(3)\pressed And used_keys(3)\wait_release = 0
      used_keys(3)\wait_release = 1
      break
   endif
    
   If mmouse_links And mmouse_links_wait_release = 0
      mmouse_links_wait_release = 1
      break
   endif

    wohin = ScreenOutput()
    StartDrawing(wohin)
    DrawingMode(1)

    For j=1 To credits

      If credits(j)\y<400 And credits(j)\y>50
        If credits(j)\y>300
          credits(j)\fade=400-credits(j)\y
        ElseIf credits(j)\y<150
          credits(j)\fade=credits(j)\y-50
        Else
          credits(j)\fade=100
        EndIf

        ; Edelsteinchen bei den Credits
        xx = 320-TextWidth(credits(j)\text)/2
        sin=Sin(i/credits(j)\div+credits(j)\sinstart)*credits(j)\max
        yyy=credits(j)\y+TextHeight("JT")/2
        For a=5 To 1 Step -1
          Farbe=255/5*(5-a)/100*credits(j)\fade
          FrontColor(RGB(0,0,Farbe))
          Circle(xx-55+sin,yyy,a)
          FrontColor(RGB(Farbe,Farbe,0))
          Circle(xx-35+sin,yyy,a)
          FrontColor(RGB(0,Farbe,0))
          Circle(xx-15+sin,yyy,a)
          FrontColor(RGB(0,Farbe,0))
          Circle(xx+TextWidth(credits(j)\text)+10+sin,yyy,a)
          FrontColor(RGB(Farbe,Farbe,0))
          Circle(xx+TextWidth(credits(j)\text)+30+sin,yyy,a)
          FrontColor(RGB(0,0,Farbe))
          Circle(xx+TextWidth(credits(j)\text)+50+sin,yyy,a)
        Next

        DrawingMode(1)
        FrontColor(RGB(150,150,150))
        rgb=255/100*credits(j)\fade

        DrawText(xx+sin,credits(j)\y,credits(j)\text,RGB(rgb,rgb,rgb))

      EndIf
      credits(j)\y = credits(j)\y - 1
    Next
    
    If credits(credits)\y<00
      Break
    EndIf


    StopDrawing()

    ; Rahmen zeichnen
    draw_plain_frame(-1)
    
    end_screen()

    Delay(#Input_delay)
  ForEver

  Global Dim credits.credit(0)
EndProcedure

Procedure credit(nummer,text.s,Abstand=280)
   credits(nummer)\text=text
   credits(nummer)\y=credits(nummer-1)\y+Abstand
EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 15
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
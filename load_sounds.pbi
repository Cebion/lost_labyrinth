Procedure load_sounds()

Shared modules

   If OpenPack("sounds.pak")
      
      ; load sounds
      CatchSound(#SOUND_BLOW1, NextPackFile())
      CatchSound(#SOUND_BLOW2, NextPackFile())
      CatchSound(#SOUND_BLOW3, NextPackFile())
      CatchSound(#SOUND_BLOW4, NextPackFile())
      CatchSound(#SOUND_BLOW5, NextPackFile())
      CatchSound(#SOUND_BLOW6, NextPackFile())
      CatchSound(#SOUND_BLOW7, NextPackFile())
      CatchSound(#SOUND_BLOW8, NextPackFile())
      CatchSound(#SOUND_BLOW9, NextPackFile())
      CatchSound(#SOUND_BLOW10, NextPackFile())
      CatchSound(#SOUND_BLOW11, NextPackFile())
      CatchSound(#SOUND_BLOW12, NextPackFile())
      CatchSound(#SOUND_BLOW13, NextPackFile())
      CatchSound(#SOUND_BOW, NextPackFile())
      CatchSound(#SOUND_CHAOS, NextPackFile())
      CatchSound(#SOUND_DARKNESS, NextPackFile())
      CatchSound(#SOUND_DEATH, NextPackFile())
      CatchSound(#SOUND_DING, NextPackFile())
      CatchSound(#SOUND_EVASION, NextPackFile())
      CatchSound(#SOUND_MISSED, NextPackFile())
      CatchSound(#SOUND_FALL, NextPackFile())
      CatchSound(#SOUND_FLAME, NextPackFile())
      CatchSound(#SOUND_FLAME2, NextPackFile())
      CatchSound(#SOUND_GULP, NextPackFile())
      CatchSound(#SOUND_HARP, NextPackFile())
      CatchSound(#SOUND_HOLY, NextPackFile())
      CatchSound(#SOUND_KEY, NextPackFile())
      CatchSound(#SOUND_LAAA, NextPackFile())
      CatchSound(#SOUND_MOAN, NextPackFile())
      CatchSound(#SOUND_OW, NextPackFile())
      CatchSound(#SOUND_SELECT, NextPackFile())
      CatchSound(#SOUND_SPLASH, NextPackFile())
      CatchSound(#SOUND_SPLISH, NextPackFile())
      CatchSound(#SOUND_FILLUP, NextPackFile())
      CatchSound(#SOUND_SUCCESS, NextPackFile())
      CatchSound(#SOUND_WIND, NextPackFile())
      CatchSound(#SOUND_GLASS, NextPackFile())
      CatchSound(#SOUND_CHICKEN, NextPackFile())
      CatchSound(#SOUND_EARTH, NextPackFile())
      CatchSound(#SOUND_HOHOHO, NextPackFile())
      CatchSound(#SOUND_FROGS, NextPackFile())
      CatchSound(#SOUND_CANNON, NextPackFile())
      CatchSound(#SOUND_CANNON2, NextPackFile())
      CatchSound(#SOUND_BLACKCAT, NextPackFile())
      CatchSound(#SOUND_WOLF, NextPackFile())
      CatchSound(#SOUND_JAWA, NextPackFile())
      CatchSound(#SOUND_METAL, NextPackFile())
      CatchSound(#SOUND_HORSE, NextPackFile())
      CatchSound(#SOUND_HOWL, NextPackFile())
      CatchSound(#SOUND_HUH, NextPackFile())
      CatchSound(#SOUND_SCREAMING_WOMAN, NextPackFile())
      CatchSound(#SOUND_ROAR, NextPackFile())      
      CatchSound(#SOUND_BOAR, NextPackFile())   
      CatchSound(#SOUND_BLITZ, NextPackFile())
      CatchSound(#SOUND_INSEKT, NextPackFile())
      CatchSound(#SOUND_CRACK, NextPackFile())
      CatchSound(#SOUND_SPECIAL_SUCCESS, NextPackFile())
      CatchSound(#SOUND_BOTCH, NextPackFile())
      CatchSound(#SOUND_BUY, NextPackFile())
      CatchSound(#SOUND_GOLD, NextPackFile())
      CatchSound(#SOUND_GOLD1, NextPackFile())
      CatchSound(#SOUND_FIREBALL, NextPackFile())
      CatchSound(#SOUND_BITE, NextPackFile())
      CatchSound(#SOUND_OPEN_DOOR, NextPackFile())
      CatchSound(#SOUND_OPEN_CHEST, NextPackFile())
      
      LoadModule(#MOD_ARCHONS, "archonsoflight.xm")
      LoadModule(#MOD_BALLADA, "ballada.mod")
   
   EndIf
   
EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 55
; FirstLine = 11
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
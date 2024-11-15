Procedure load_graphics()
   If OpenPack("graphics.pak") 
       
      UseJPEGImageDecoder()
      UsePNGImageDecoder()
      
      CatchSprite(#SPRITE_TILESET_ANIMATIONEN, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_BUTTONS, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_BUTTONS2, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_BUTTONS3, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_BUTTONS4, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_BUTTONS5, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_BUTTONS_BACK, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_CHARACTER, NextPackFile())   ; ok
      CatchSprite(#SPRITE_TILESET_END, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI0, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI1, NextPackFile()) ; nok!
      CatchSprite(#SPRITE_TILESET_FSI2, NextPackFile())  ; nok!
      CatchSprite(#SPRITE_TILESET_FSI3, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI4, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI5, NextPackFile())  ; ok!
      CatchSprite(#SPRITE_TILESET_FSI6, NextPackFile())  ; nok!
      CatchSprite(#SPRITE_TILESET_FSI7, NextPackFile())  ; nok!
      CatchSprite(#SPRITE_TILESET_FSI8, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI9, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI10, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI11, NextPackFile()) ; nok!
      CatchSprite(#SPRITE_TILESET_FSI12, NextPackFile()) ; nok!
      CatchSprite(#SPRITE_TILESET_FSI13, NextPackFile()) ; nok!
      CatchSprite(#SPRITE_TILESET_FSI14, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI15, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI16, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI17, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI18, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI19, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI20, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_JEWELS, NextPackFile())   ; ok
      CatchSprite(#SPRITE_TILESET_LOGO, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_MONSTER, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_SIGHT, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_SMALLCHARA, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_SMALLMONSTER, NextPackFile())   ; ok
      CatchSprite(#SPRITE_TILESET_SMALLMONSTERANIM, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_SMALLLABYRINTH, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_STARS, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_LABYRINTH, NextPackFile())   ; ok
      CatchSprite(#SPRITE_TILESET_SPLASH1, NextPackFile())     ; nok!
      CatchSprite(#SPRITE_TILESET_SPLASH3, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_ITEMS, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_MONSTERANIM, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_ENCHANTMENTS, NextPackFile())   ; ok
      CatchSprite(#SPRITE_TILESET_FX, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_PROJEKTILE, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_BODY, NextPackFile())  ; ok
      CatchSprite(#SPRITE_TILESET_MONSTERSTATUS, NextPackFile())  ; ok
      CatchSprite(#SPRITE_RAHMEN_OBEN, NextPackFile())   ; ok
      CatchSprite(#SPRITE_RAHMEN_OBEN2, NextPackFile())  ; ok
      CatchSprite(#SPRITE_RAHMEN_LINKS, NextPackFile())  ; ok
      CatchSprite(#SPRITE_RAHMEN_UNTEN, NextPackFile())  ; ok
      CatchSprite(#SPRITE_RAHMEN_UNTEN2, NextPackFile()) ; ok
      CatchSprite(#SPRITE_RAHMEN_RECHTS, NextPackFile()) ; ok
      CatchSprite(#SPRITE_RAHMEN_MITTE, NextPackFile())  ; ok
      CatchSprite(#SPRITE_RAHMEN_SCHMAL1, NextPackFile())   ; ok
      CatchSprite(#SPRITE_RAHMEN_SCHMAL2, NextPackFile())   ; ok
      CatchSprite(#SPRITE_RAHMEN_WAAGRECHT, NextPackFile()) ; ok
      CatchSprite(#SPRITE_ICONS, NextPackFile())   ; ok
      CatchSprite(#SPRITE_TILESET_FSI21, NextPackFile()) ; nok!
      CatchSprite(#SPRITE_MANA, NextPackFile()) ; ok
      CatchSprite(#SPRITE_LEBEN, NextPackFile())   ; ok
      CatchSprite(#SPRITE_ELEMENTS, NextPackFile())   ; ok
      CatchSprite(#SPRITE_FONTS, NextPackFile())   ; ok
      CatchSprite(#SPRITE_SWING, NextPackFile())   ; ok
      CatchSprite(#SPRITE_NUMBERS, NextPackFile()) ; ok
      CatchSprite(#SPRITE_MOUSEPOINTER, NextPackFile())  ; ok
      CatchSprite(#SPRITE_BG_LORE, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI22, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI23, NextPackFile()) ; ok
      CatchSprite(#SPRITE_TILESET_FSI24, NextPackFile()) ; ok
      CatchSprite(#SPRITE_CLEANER, NextPackFile()) ; ok
      CatchSprite(#SPRITE_USED_FIELD, NextPackFile()) ; ok
   Else 
      End
   EndIf 
EndProcedure
; IDE Options = PureBasic 4.10 (Linux - x86)
; CursorPosition = 73
; FirstLine = 24
; Folding = -
; Markers = 8
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
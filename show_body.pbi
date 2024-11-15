   ClipSprite(#SPRITE_CLEANER, 0, 0, 335, 300)
   DisplaySprite(#SPRITE_CLEANER, 15, 15)
   
   ; Body darstellen
   ClipSprite(#SPRITE_TILESET_BODY, 1, 1, 165, 393)
   DisplaySprite(#SPRITE_TILESET_BODY, 90, 15)
   
   ; Helm
   aktuell = 0
   If mmouse_x > #POS_HELM_X And mmouse_x < #POS_HELM_X + 32 And mmouse_y > #POS_HELM_Y And mmouse_y < #POS_HELM_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_HELM_X, #POS_HELM_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_HELM_X, #POS_HELM_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_HELMET And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_HELM_X, #POS_HELM_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
         
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
         
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   ; Maske
   aktuell = 0
   If mmouse_x > #POS_MASKE_X And mmouse_x < #POS_MASKE_X + 32 And mmouse_y > #POS_MASKE_Y And mmouse_y < #POS_MASKE_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_MASKE_X, #POS_MASKE_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_MASKE_X, #POS_MASKE_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_MASK And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_MASKE_X, #POS_MASKE_Y)
         
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
	 
	       ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
               
         
         If mmouse_links = 1 
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   ; Amulett
   aktuell = 0
   If mmouse_x > #POS_AMULETT_X And mmouse_x < #POS_AMULETT_X + 32 And mmouse_y > #POS_AMULETT_Y And mmouse_y < #POS_AMULETT_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_AMULETT_X, #POS_AMULETT_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_AMULETT_X, #POS_AMULETT_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_NECKLACE And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_AMULETT_X, #POS_AMULETT_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
            
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf         

                  
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; Handschuh
   aktuell = 0
   If mmouse_x > #POS_HANDSCHUH_X And mmouse_x < #POS_HANDSCHUH_X + 32 And mmouse_y > #POS_HANDSCHUH_Y And mmouse_y < #POS_HANDSCHUH_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_HANDSCHUH_X, #POS_HANDSCHUH_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_HANDSCHUH_X, #POS_HANDSCHUH_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_GLOVE And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_HANDSCHUH_X, #POS_HANDSCHUH_Y)
          
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
            
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0

         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; Waffe1
   aktuell = 0
   save_waffe.w = 0
   If mmouse_x > #POS_WAFFE1_X And mmouse_x < #POS_WAFFE1_X + 32 And mmouse_y > #POS_WAFFE1_Y And mmouse_y < #POS_WAFFE1_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_WAFFE1_X, #POS_WAFFE1_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_WAFFE1_X, #POS_WAFFE1_Y)
   EndIf
   
   i = 1
   Repeat
      Fenster()
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
         save_waffe = i
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_WAFFE1_X, #POS_WAFFE1_Y)
         
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
            
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf
         
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
      i = i + 1
   Until i > #MAX_RUCKSACK Or save_waffe > 0
   
   
   ; Waffe2
   aktuell = 0
   If mmouse_x > #POS_WAFFE2_X And mmouse_x < #POS_WAFFE2_X + 32 And mmouse_y > #POS_WAFFE2_Y And mmouse_y < #POS_WAFFE2_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_WAFFE2_X, #POS_WAFFE2_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_WAFFE2_X, #POS_WAFFE2_Y)
   EndIf
   
   If save_waffe > 0
      i = save_waffe + 1
      save_waffe = 0
      Repeat
         Fenster()
         If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_WEAPON And inventory(i,akt_spieler)\benutzt = 1
            save_WAFFE = i
            sprite_x.w = inventory(i,akt_spieler)\name
            sprite_y.w = 0
            If sprite_x > 16
               Repeat
                  sprite_y = sprite_y + 1
                  sprite_x = sprite_x - 16
               Until sprite_x < 17
            EndIf
            ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_WAFFE2_X, #POS_WAFFE2_Y)
            
            ;Click
            If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
               feld = 99
               bew_geg = inventory(i,akt_spieler)\name
               bewegen = 2
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0    
               lastSelected = i
            EndIf
            
            ;Doppelclick
            If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
               bewegen = 5
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
            EndIf   
            
            If mmouse_links = 1
               ; Moven?
               If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
                  feld = 99
                  bewegen = 2
                  bew_geg = inventory(i,akt_spieler)\name
                  bew_geg_pos = i
                  bew_geg_x = bew_geg
                  bew_geg_y = 0
                  If bew_geg_x > 16
                     Repeat
                        bew_geg_y = bew_geg_y + 1
                        bew_geg_x = bew_geg_x - 16
                     Until bew_geg_x < 17
                  EndIf
               EndIf
            EndIf
         EndIf
         i = i + 1
      Until i > #MAX_RUCKSACK Or save_waffe > 0
   EndIf 
   
   
   ; Schild
   aktuell = 0
   If mmouse_x > #POS_SCHILD_X And mmouse_x < #POS_SCHILD_X + 32 And mmouse_y > #POS_SCHILD_Y And mmouse_y < #POS_SCHILD_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_SCHILD_X, #POS_SCHILD_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_SCHILD_X, #POS_SCHILD_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_SHIELD And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_SCHILD_X, #POS_SCHILD_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
         
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; Ring1
   aktuell = 0
   save_ring.w = 0
   If mmouse_x > #POS_RING1_X And mmouse_x < #POS_RING1_X + 32 And mmouse_y > #POS_RING1_Y And mmouse_y < #POS_RING1_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING1_X, #POS_RING1_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING1_X, #POS_RING1_Y)
   EndIf
   
   i = 1
   Repeat
      Fenster()
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_RING And inventory(i,akt_spieler)\benutzt = 1
         save_ring = i
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING1_X, #POS_RING1_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
         
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
      i = i + 1
   Until i > #MAX_RUCKSACK Or save_ring > 0
   
   
   ; Ring2
   aktuell = 0
   If mmouse_x > #POS_RING2_X And mmouse_x < #POS_RING2_X + 32 And mmouse_y > #POS_RING2_Y And mmouse_y < #POS_RING2_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING2_X, #POS_RING2_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING2_X, #POS_RING2_Y)
   EndIf
   
   If save_ring > 0
      i = save_ring + 1
      save_ring = 0
      Repeat
         Fenster()
         If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_RING And inventory(i,akt_spieler)\benutzt = 1
            save_ring = i
            sprite_x.w = inventory(i,akt_spieler)\name
            sprite_y.w = 0
            If sprite_x > 16
               Repeat
                  sprite_y = sprite_y + 1
                  sprite_x = sprite_x - 16
               Until sprite_x < 17
            EndIf
            ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING2_X, #POS_RING2_Y)
            
            ;Click
            If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
               feld = 99
               bew_geg = inventory(i,akt_spieler)\name
               bewegen = 2
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0    
               lastSelected = i

            EndIf
            
            ;Doppelclick
            If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
               bewegen = 5
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
            EndIf   
            
            If mmouse_links = 1
               ; Moven?
               If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
                  feld = 99
                  bewegen = 2
                  bew_geg = inventory(i,akt_spieler)\name
                  bew_geg_pos = i
                  bew_geg_x = bew_geg
                  bew_geg_y = 0
                  If bew_geg_x > 16
                     Repeat
                        bew_geg_y = bew_geg_y + 1
                        bew_geg_x = bew_geg_x - 16
                     Until bew_geg_x < 17
                  EndIf
               EndIf
            EndIf
         EndIf
         i = i + 1
      Until i > #MAX_RUCKSACK Or save_ring > 0
   EndIf
   
   
   ; Ring3
   aktuell = 0
   If mmouse_x > #POS_RING3_X And mmouse_x < #POS_RING3_X + 32 And mmouse_y > #POS_RING3_Y And mmouse_y < #POS_RING3_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING3_X, #POS_RING3_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING3_X, #POS_RING3_Y)
   EndIf
   
   If save_ring > 0
      i = save_ring + 1
      save_ring = 0
      Repeat
         Fenster()
         If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_RING And inventory(i,akt_spieler)\benutzt = 1
            save_ring = i
            sprite_x.w = inventory(i,akt_spieler)\name
            sprite_y.w = 0
            If sprite_x > 16
               Repeat
                  sprite_y = sprite_y + 1
                  sprite_x = sprite_x - 16
               Until sprite_x < 17
            EndIf
            ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
            DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RING3_X, #POS_RING3_Y)
            
            ;Click
            If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
               feld = 99
               
               bew_geg = inventory(i,akt_spieler)\name
               bewegen = 2
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0    
               lastSelected = i
            EndIf
            
            ;Doppelclick
            If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
               bewegen = 5
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
            EndIf   
            
            If mmouse_links = 1
               ; Moven?
               If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
                  feld = 99
                  bewegen = 2
                  bew_geg = inventory(i,akt_spieler)\name
                  bew_geg_pos = i
                  bew_geg_x = bew_geg
                  bew_geg_y = 0
                  If bew_geg_x > 16
                     Repeat
                        bew_geg_y = bew_geg_y + 1
                        bew_geg_x = bew_geg_x - 16
                     Until bew_geg_x < 17
                  EndIf
               EndIf
            EndIf
         EndIf
         i = i + 1
      Until i > #MAX_RUCKSACK Or save_ring > 0
   EndIf
   
   
  
   
   ; Ruestung
   aktuell = 0
   If mmouse_x > #POS_RUESTUNG_X And mmouse_x < #POS_RUESTUNG_X + 32 And mmouse_y > #POS_RUESTUNG_Y And mmouse_y < #POS_RUESTUNG_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RUESTUNG_X, #POS_RUESTUNG_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RUESTUNG_X, #POS_RUESTUNG_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_ARMOR And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_RUESTUNG_X, #POS_RUESTUNG_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
            
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; Bogen
   aktuell = 0
   If mmouse_x > #POS_BOGEN_X And mmouse_x < #POS_BOGEN_X + 32 And mmouse_y > #POS_BOGEN_Y And mmouse_y < #POS_BOGEN_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_BOGEN_X, #POS_BOGEN_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_BOGEN_X, #POS_BOGEN_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BOW And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_BOGEN_X, #POS_BOGEN_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i

         EndIf
         
            ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; Munition
   aktuell = 0
   If mmouse_x > #POS_MUNITION_X And mmouse_x < #POS_MUNITION_X + 32 And mmouse_y > #POS_MUNITION_Y And mmouse_y < #POS_MUNITION_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_MUNITION_X, #POS_MUNITION_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_MUNITION_X, #POS_MUNITION_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_AMMUNITION And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_MUNITION_X, #POS_MUNITION_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i

         EndIf
         
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; Guertel
   aktuell = 0
   If mmouse_x > #POS_GUERTEL_X And mmouse_x < #POS_GUERTEL_X + 32 And mmouse_y > #POS_GUERTEL_Y And mmouse_y < #POS_GUERTEL_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_GUERTEL_X, #POS_GUERTEL_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_GUERTEL_X, #POS_GUERTEL_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BELT And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_GUERTEL_X, #POS_GUERTEL_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
         
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; Schuhe
   aktuell = 0
   If mmouse_x > #POS_SCHUHE_X And mmouse_x < #POS_SCHUHE_X + 32 And mmouse_y > #POS_SCHUHE_Y And mmouse_y < #POS_SCHUHE_Y + 32
      ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_SCHUHE_X, #POS_SCHUHE_Y)
      aktuell = 1
   Else
      ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
      DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_SCHUHE_X, #POS_SCHUHE_Y)
   EndIf
   
   For i = 1 To #MAX_RUCKSACK
      If item(inventory(i,akt_spieler)\name)\type = #ITEMTYPE_BOOTS And inventory(i,akt_spieler)\benutzt = 1
         sprite_x.w = inventory(i,akt_spieler)\name
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_SCHUHE_X, #POS_SCHUHE_Y)
         
         ;Click
         If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
            feld = 99
            bew_geg = inventory(i,akt_spieler)\name
            bewegen = 2
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0    
            lastSelected = i
         EndIf
         
         ;Doppelclick
         If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
            bewegen = 5
            bew_geg = inventory(i,akt_spieler)\name
            bew_geg_pos = i
            bew_geg_x = bew_geg
            bew_geg_y = 0
         EndIf   
            
         If mmouse_links = 1
            ; Moven?
            If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
               feld = 99
               bewegen = 2
               bew_geg = inventory(i,akt_spieler)\name
               bew_geg_pos = i
               bew_geg_x = bew_geg
               bew_geg_y = 0
               If bew_geg_x > 16
                  Repeat
                     bew_geg_y = bew_geg_y + 1
                     bew_geg_x = bew_geg_x - 16
                  Until bew_geg_x < 17
               EndIf
            EndIf
         EndIf
      EndIf
   Next
   
   
   ; staff of the last covenant
   for act_staff_piece.w = 1 to 9
      aktuell = 0
      If mmouse_x > #POS_STAFF_X And mmouse_x < #POS_STAFF_X + 32 And mmouse_y > #POS_STAFF_Y+(act_staff_piece*32-32) And mmouse_y < #POS_STAFF_Y+(act_staff_piece*32)
         ClipSprite(#SPRITE_TILESET_ITEMS, 224, 320, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_STAFF_X, #POS_STAFF_Y+(act_staff_piece*32-32))
         aktuell = 1
      Else
         ClipSprite(#SPRITE_TILESET_ITEMS, 480, 64, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_STAFF_X, #POS_STAFF_Y+(act_staff_piece*32-32))
      EndIf
      
      if spieler(akt_spieler)\staff_pieces[act_staff_piece] = 1
         sprite_x.w = #OBJGRAFIK_STAFF_LAST_COVENANT_1-1+act_staff_piece
         sprite_y.w = 0
         If sprite_x > 16
            Repeat
               sprite_y = sprite_y + 1
               sprite_x = sprite_x - 16
            Until sprite_x < 17
         EndIf
         ClipSprite(#SPRITE_TILESET_ITEMS, sprite_x * 32-32, sprite_y * 32, 32, 32)
         DisplayTransparentSprite(#SPRITE_TILESET_ITEMS, #POS_STAFF_X, #POS_STAFF_Y+(act_staff_piece*32-32))
      endif
      
      ;Click
      If bewegen = 0 And doppelklick = 0 And mmouse_links=1 And aktuell = 1
         feld = 99
         bew_geg = #OBJGRAFIK_STAFF_LAST_COVENANT_1-1+act_staff_piece
         bewegen = 3
         bew_geg_pos = act_staff_piece
         bew_geg_x = bew_geg
         bew_geg_y = 0    
         lastSelected = i
      EndIf
      
      ;Doppelclick
      If bewegen = 0  And doppelklick = 1 And lastSelected = i And aktuell = 1
         bewegen = 6
         bew_geg = #OBJGRAFIK_STAFF_LAST_COVENANT_1-1+act_staff_piece
         bew_geg_pos = act_staff_piece
         bew_geg_x = bew_geg
         bew_geg_y = 0
      EndIf   
         
      If mmouse_links = 1
         ; Moven?
         If bewegen = 0 And aktuell = 1 And (mmouse_xdif <  -1 Or mmouse_xdif >  1 Or mmouse_ydif <  -1 Or mmouse_ydif >  1)
            feld = 99
            bewegen = 3
            bew_geg = #OBJGRAFIK_STAFF_LAST_COVENANT_1-1+act_staff_piece
            bew_geg_pos = act_staff_piece
            bew_geg_x = bew_geg
            bew_geg_y = 0
            If bew_geg_x > 16
               Repeat
                  bew_geg_y = bew_geg_y + 1
                  bew_geg_x = bew_geg_x - 16
               Until bew_geg_x < 17
            EndIf
         EndIf
      EndIf
   next
   
   
   ; exit button
   esc_but_x = 350 -31
   esc_but_y = 15
   If mmouse_x >= esc_but_x And mmouse_x <= esc_but_x + 32 And mmouse_y >= esc_but_y And mmouse_y <= esc_but_y + 32
     ClipSprite(#SPRITE_TILESET_BUTTONS5, 3*32, 32, 31, 31)
     If mmouse_links = 1 
       If bewegen = 0
         esc_click.b = 1
       EndIf
     Else
       If esc_click = 1
         get_out = 1
       EndIf
     EndIf 
   Else
     ClipSprite(#SPRITE_TILESET_BUTTONS5, 2*32, 32, 31, 31)
   EndIf
   DisplayTransparentSprite(#SPRITE_TILESET_BUTTONS5, esc_but_x, esc_but_y)

EndJump:
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 1042
; FirstLine = 1027
; Folding = -
; EnableXP
; EnableOnError
; UseMainFile = laby.pb
; Executable = laby.exe
; DisableDebugger
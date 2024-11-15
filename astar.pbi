; --------------------------------------------------------------------------------------

Procedure manhatten(x.w,y.w,target_x.w,target_y.w)
  
  ProcedureReturn Abs(x-target_x) + Abs(y-target_y)

EndProcedure

; --------------------------------------------------------------------------------------

Procedure isinopenlist(x.w, y.w)

  ResetList(openlist())
  While NextElement(openlist())
    If openlist()\x = x And openlist()\y = y
      ProcedureReturn 1
    EndIf
  Wend
  ProcedureReturn 0

EndProcedure

; --------------------------------------------------------------------------------------

Procedure isinclosedlist(x.w, y.w)

  ResetList(closedlist())
  While NextElement(closedlist())
    If closedlist()\x = x And closedlist()\y = y
      ProcedureReturn 1
    EndIf
  Wend
  ProcedureReturn 0

EndProcedure

; --------------------------------------------------------------------------------------

Procedure insert_knot(x.w, y.w, parent_x.w, parent_y.w, cost.w, target_x.w, target_y.w)

  If isinopenlist(x, y) = 0 And isinclosedlist(x, y) = 0
    If AddElement(openlist())
      openlist()\parent_x = parent_x
      openlist()\parent_y = parent_y
      openlist()\x = x
      openlist()\y = y
      openlist()\cost = cost + 1 + manhatten(x, y, target_x, target_y)
     EndIf
  EndIf
              
EndProcedure

; --------------------------------------------------------------------------------------

Procedure insert_knots(x.w, y.w, cost.w, target_x.w, target_y.w)

  akt_radius.w = radius()+1

  ;to check for the border of the labyrinth
  tx.w = spieler(akt_spieler)\character_x-#HALF_MATRIX_SIZE+x
  ty.w = spieler(akt_spieler)\character_y-#HALF_MATRIX_SIZE+y

  For k.w = 1 to 4
    xd.w = neighbour(k)\x
    yd.w = neighbour(k)\y
    If x+xd > 0 And x+xd <= #MATRIX_SIZE And y+yd > 0 And y+yd <= #MATRIX_SIZE And tx+xd > 0 And ty+yd > 0
      If matrix(x+xd,y+yd) <= akt_radius
        insert_knot(x+xd,y+yd,x,y,cost,target_x,target_y)
      EndIf
    EndIf
  Next

EndProcedure

; --------------------------------------------------------------------------------------


Procedure astar(target_x.w, target_y.w)

  If CountList(openlist()) = 0
    ; No route to target
    ProcedureReturn 2
  Else
    FirstElement(openlist())
    
    ; We found the destination?
    If target_x = openlist()\x And target_y = openlist()\y
      If AddElement(closedlist())
        closedlist()\parent_x = openlist()\parent_x
        closedlist()\parent_y = openlist()\parent_y 
        closedlist()\x = openlist()\x
        closedlist()\y = openlist()\y
        closedlist()\cost = openlist()\cost
      EndIf
      ProcedureReturn 1
    EndIf
    
    save_x.w = openlist()\x
    save_y.w = openlist()\y
    save_parent_x.w = openlist()\parent_x
    save_parent_y.w = openlist()\parent_y
    save_cost.w = openlist()\cost
    
    ; move knot to closedlist
    DeleteElement(openlist())
    If AddElement(closedlist())
      closedlist()\parent_x = save_parent_x
      closedlist()\parent_y = save_parent_y
      closedlist()\x = save_x
      closedlist()\y = save_y
      closedlist()\cost = save_cost
    EndIf
      
    insert_knots(save_x, save_y, save_cost, target_x, target_y)
    SortStructuredList(openlist(), 0, OffsetOf(knot\cost), #PB_Sort_Word)
  EndIf
  
  ProcedureReturn 0

EndProcedure
; IDE Options = PureBasic 4.20 (Linux - x86)
; CursorPosition = 56
; FirstLine = 39
; Folding = --
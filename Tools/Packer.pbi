; Make a .pak file
; The program that includes this file should define these variables:
;
; packfile.s = pathname of .pak file
; srcdir.s = pathname of files to pack
;
; In addition, there should be a single DataSection where the names of the
; files to pack are defined as Data.s strings, in order.

haveconsole.b = #False
verbose.b = #False

If OpenConsole()
  haveconsole = #True
EndIf

If haveconsole And #PB_Compiler_OS = #PB_OS_Windows
  verbose = #True
EndIf

If verbose
    PrintN("Packer is starting for " + packfile.s + " ...")
EndIf

If CreatePack(packfile) = 0
  If haveconsole
    PrintN("ERROR: could not create pack file " + packfile)
    PrintN("Working directory: " + GetCurrentDirectory())
  EndIf

  End 1
EndIf

If Right(srcdir.s, 1) <> "/"
  srcdir + "/"
EndIf

filename.s = ""
failed.b = #False

Repeat
  Read filename
  If filename <> ""
    path.s = srcdir + filename
    If AddPackFile(path, 9)
      If verbose
        PrintN(path + " ...successful")
      EndIf
    Else
      PrintN(path + " ...failed")
      failed = #True
    EndIf
  EndIf
Until filename = ""
ClosePack()

If failed
  If haveconsole
    PrintN("ERROR: could not build complete .pak file")
    PrintN("Working directory: " + GetCurrentDirectory())
    PrintN("Source directory: " + srcdir)
    PrintN("Pack file: " + packfile)
  EndIf

  DeleteFile(packfile)
  End 1
EndIf

If verbose
  PrintN(packfile + " was created")
EndIF

If haveconsole And #PB_Compiler_OS = #PB_OS_Windows
  ;Delay(9000)
EndIf

End
; IDE Options = PureBasic 4.10 (Linux - x86)
; Folding = -
; EnableXP
; EnableOnError

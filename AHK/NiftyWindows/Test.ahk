SplitPath, A_ScriptFullPath, SYS_ScriptNameExt, SYS_ScriptDir, SYS_ScriptExt, SYS_ScriptNameNoExt, 

IS_VS(){
    winId:= WinExist("A") ;获取id
    WinGet, winExe, ProcessPath, ahk_id %winId% ;获取该id窗口的path
    SplitPath, winExe,  ExeName
    return (ExeName = "devenv.exe")	
}

^#z::
    UPD_BuildFile = %SYS_ScriptDir%\build.txt
    {
        FileDelete, %UPD_BuildFile%
        If ( ErrorLevel )
            Return
    }
    
     Btns:= {0:"Alt",1:"LCtrl"}
     x:= Btns[IS_VS()] 
 
FileAppend, %x%, %UPD_BuildFile%
    Send ,  { %x% }
    
Return
    
    ; FileAppend, %ExeName%, %UPD_BuildFile%Alt
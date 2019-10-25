; ~/Documents/AutoHotKey.ahk
; -- will be loaded by AutoHotKey if it is started without any args

;; try to emulate the behaviours of KBC Pocker 1st gen's Fn key combinations
;; use ideas from XMonad -- Window environment should be stateful yet predictable

#SingleInstance Force

;; Default working dir is c:\windows\system32
#Include %A_ScriptDir%
#Include AHKCommon.ahk
#Include AHKCursor.ahk


SetWorkingDir, D:\dev\workspace
;; End of Auto Execution Section
return


;; In Case LCtl and CapLock are not switched
; LCtrl::CapsLock
; CapsLock::LCtrl
;; ------------------


^!j::
  LastWinId := Get_LastActiveWinId()
  WinActivate, ahk_id %lastWinId%
return


; ^!t::
;   global LastActiveWinId_Terminal
;   Switch_BackForth("ahk_class moba/x X rl"
;                  , "D:\dev\bin\ohwvm-terminator.lnk"
;                  , LastActiveWinId_Terminal)
; return


;; for things like visual studio
;; 1. window class name is not meaningful
;; 2. there may be mulitple windows for single vs instance
;; 3. you have both 2012 and 2013 installed
;; so it's better to have some mechanize to ``register`` customized keys on the fly?
;; or just cycle through all vs windows ?
; ^!v::
;  global LastActiveWinId_Notepad
;  Switch_BackForth("ahk_class Notepad"
;                 , "Notepad"
;                 , LastActiveWinId_Notepad)
; return


^!w::
  ;; send Alt+F4 to quit current application
  Send !{F4}
return

;----------------------------------------------------- 编辑器

;------------- OneNote
^!n::
  global LastActiveWinId_OneNote
  Switch_BackForth("ahk_class Framework::CFrame"
                 , "onenote"
                 , LastActiveWinId_OneNote)
return



;------------- 为知
;#w::
MButton & w::
  global LastActiveWinId_wiz
  Switch_BackForth("ahk_class WizNoteMainFrame"
                 , "C:\Program Files (x86)\WizNote\Wiz.exe"
                 , LastActiveWinId_wiz)
return


;------------- vs
;#v::
MButton & v::
  global LastActiveWinId_Devenv
  Switch_BackForth("ahk_exe devenv.exe"
                 , "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe"
                 , LastActiveWinId_Devenv)
return


;------------- vscode
^!c::
MButton & c::
  global LastActiveWinId_Code
  Switch_BackForth("ahk_exe Code.exe"
                 , "C:\Users\lol\AppData\Local\Programs\Microsoft VS Code\Code.exe"
                 , LastActiveWinId_Code)
return


;------------- notepad++记事本
#q::
MButton & q::
  global LastActiveWinId_notepad
  Switch_BackForth("ahk_exe notepad++.exe"
                 , "C:\Program Files\Notepad++\notepad++.exe"
                 , LastActiveWinId_notepad)
return

 


;----------------------------------------------------- 浏览器

;------------- 谷歌
#b::
MButton & b::
  global LastActiveWinId_Chrome
  Switch_BackForth("ahk_exe chrome.exe"
                 , "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
                 , LastActiveWinId_Chrome)
return

;------------- vivaldi
#e::
MButton & e::
  global LastActiveWinId_vivaldi
  Switch_BackForth("ahk_exe vivaldi.exe"
                 , "C:\Program Files\Vivaldi\Application\vivaldi.exe"
                 , LastActiveWinId_vivaldi)
return

;----------------------------------------------------- 资源管理器

;------------- 系统
;#p::
MButton & p::
  global LastActiveWinId_Explorer
  Switch_BackForth("ahk_class CabinetWClass"
                 , "Explorer.exe"
                 , LastActiveWinId_Explorer)
return

;------------- Directory Opus
;#d::
MButton & d::
  global LastActiveWinId_Dopus
  Switch_BackForth("ahk_exe dopus.exe"
                 , "C:\Program Files\GPSoftware\Directory Opus\dopus.exe"
                 , LastActiveWinId_Dopus)
return

;------------- 数据库Navicat
#n::
MButton & n::
  global LastActiveWinId_Navicat
  Switch_BackForth("ahk_exe navicat.exe"
                 , "C:\Program Files\PremiumSoft\Navicat Premium 12\navicat.exe"
                 , LastActiveWinId_Navicat)
return



;------------- 切换窗体
^!h::
  Send !{Esc}
  Restore_ActiveWindowIfMinimized()
return

;------------- 查看当前窗口信息 inspect current active window
^#space::
  Inspect_ActiveWindow()
return



;#k::
MButton & k::
  WinGet, CurrentWinId, ID, A
  Toggle_Windows_Set(CurrentWinId)
return

;#g::
MButton & g::
  Toggle_Windows()
return


+^!f::
  ;; Buggy
  Toggle_FullScreen()
return

;------------- 显示当前时间
^!o::
  Show_InfoBoard()
return


;; reload currently used script
+^!p::
  MsgBox, Script __%A_ScriptFullPath%__ will be reloaded
  Reload_CurrentScript()
return

;; paste plain text using Shift+Ctrl+V as in Chrome
+^v::
  Input_ClipBoardAsPlainText()
return
;; TODO: extend the clipboard by, i.e. using multiple buffers just as vim does
;;       or optionally prompt a selection box to choose from latest 10 clipboard content


>!n::
  WinGetClass, winClass, A
  if (winClass == "Notepad++")
  {
    SendInput gt
  }
  else
  {
    SendInput ^{Tab}
  }
return


>!p::
  WinGetClass, winClass, A
  if (winClass == "Notepad++")
  {
    SendInput gT
  }
  else
  {
    SendInput +^{Tab}
  }
return


;; switch to the next/prev window of the __same class__
+!n::
  WinGetClass, winClass, A
  /*
  WinSet, Bottom,, A
  WinActivate, ahk_class %winClass%
  */
  ;; more general ?
  WinGet, oldWinId, ID, A
  WinGet, winList, List, ahk_class %winClass%
  if (winList > 1) {
    WinActivate, ahk_id %winList2%
    Restore_ActiveWindowIfMinimized()
    WinSet, Bottom,, ahk_id %oldWinId%
  }
return


+!p::
  WinGetClass, winClass, A
  WinGet, winList, List, ahk_class %winClass%
  if (winList > 1) {
    lastMatchedWinId := winList%winList%
    ; MsgBox, winList %winList%, lastMatchedWinId %lastMatchedWinId%
    WinActivate, ahk_id %lastMatchedWinId%
    Restore_ActiveWindowIfMinimized()
  }
return

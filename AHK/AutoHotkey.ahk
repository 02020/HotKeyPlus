; ~/Documents/AutoHotKey.ahk
; -- will be loaded by AutoHotKey if it is started without any args

;; try to emulate the behaviours of KBC Pocker 1st gen's Fn key combinations
;; use ideas from XMonad -- Window environment should be stateful yet predictable

#SingleInstance Force

;; Default working dir is c:\windows\system32
;#Include %A_ScriptDir%
; #Include AHKCommon.ahk
;; #Include AHKCursor.ahk

; #Include CapsLockPlus.ahk

;; End of Auto Execution Section
 

;;打开或者隐藏窗口
Switch_BackForth(WinTitle, AppPath, ByRef LastWinId) {
    MsgBox, LastWinId is %WinTitle%
  IfWinExist %WinTitle%
  {
    IfWinActive %WinTitle%
    {
      ;;如果当前窗口处于激活状态
      WinGet, LastWinId, ID, %WinTitle%
      WinMinimize, ahk_id  %LastWinId%
    }
    else
    {
      ;; 激活窗口
      WinGet, LastWinId, ID, A
      WinActivate
    }
  }
  else
  {
    WinGet, LastWinId, ID, A
    Run %AppPath%
  }
}


;; In Case LCtl and CapLock are not switched
; LCtrl::CapsLock
; CapsLock::LCtrl
;; ------------------


;激活上一个窗口
;^!j::
; LastWinId := Get_LastActiveWinId()
;  WinActivate, ahk_id %lastWinId%
;return


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



MButton & w::
  ;; send Alt+F4 to quit current application
  Send !{F4}
return

;----------------------------------------------------- 编辑器

;------------- OneNote
^!o::
  global LastActiveWinId_OneNote
  Switch_BackForth("ahk_class Framework::CFrame"
                 , "onenote"
                 , LastActiveWinId_OneNote)
return


MButton & 3::
  global LastActiveWinId_360
  Switch_BackForth("ahk_class 360se.exe"
                 , "C:\Users\Er\AppData\Roaming\360se6\Application\360se.exe"
                 , LastActiveWinId_360)
return
;------------- 为知


; MButton & w::
;   global LastActiveWinId_wiz
;   Switch_BackForth("ahk_class WizNoteMainFrame"
;                  , "C:\Program Files (x86)\WizNote\Wiz.exe"
;                  , LastActiveWinId_wiz)
; return




;------------- vs
;#v::
; MButton & v::
;   global LastActiveWinId_Devenv
;   Switch_BackForth("ahk_exe devenv.exe"
;                  , "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe"
;                  , LastActiveWinId_Devenv)
; return


;------------- vscode
MButton & v::
MButton & c::
  global LastActiveWinId_Code
  Switch_BackForth("ahk_exe Code.exe"
                 , "C:\Users\Er\AppData\Local\Programs\Microsoft VS Code\Code.exe"
                 , LastActiveWinId_Code)
return

;------------- java IDEA
MButton & a::
  global LastActiveWinId_idea64
  Switch_BackForth("ahk_exe idea64.exe"
                 , "C:\Program Files\JetBrains\IntelliJ IDEA 2019.2\bin\idea64.exe"
                 , LastActiveWinId_idea64)
return

;------------- notepad++记事本
#q::
MButton & q::
  global LastActiveWinId_notepadss
  Switch_BackForth("ahk_exe notepad++.exe"
                 , "C:\Program Files\Notepad++\notepad++.exe"
                 , LastActiveWinId_notepad)
return

;------------- sublime_text
MButton & s::
  global LastActiveWinId_sublime
  Switch_BackForth("ahk_exe sublime_text.exe"
                 , "C:\Program Files\Sublime Text 3\sublime_text.exe"
                 , LastActiveWinId_sublime)
return

;----------------------------------------------------- 浏览器

;------------- 谷歌
MButton & g::
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
MButton & d::
  global LastActiveWinId_Dopus
  Switch_BackForth("ahk_exe dopus.exe"
                 , "C:\Program Files\GPSoftware\Directory Opus\dopus.exe"
                 , LastActiveWinId_Dopus)
return

;------------- 数据库Navicat
MButton & n::
  global LastActiveWinId_Navicat
  Switch_BackForth("ahk_exe navicat.exe"
                 , "C:\Program Files\PremiumSoft\Navicat Premium 12\navicat.exe"
                 , LastActiveWinId_Navicat)
return


;------------- 数据库Navicat
MButton & m::
  global LastActiveWinId_myBase
  Switch_BackForth("ahk_exe myBase.exe"
                 , "D:\Program\nyfedit7pro\myBase.exe"
                 , LastActiveWinId_myBase)
return


; ;------------- 切换窗体
; ^!h::
;   Send !{Esc}
;   Restore_ActiveWindowIfMinimized()
; return

; ;------------- 查看当前窗口信息 inspect current active window
; ^#space::
;   Inspect_ActiveWindow()
; return



; ;#k::
; MButton & k::
;   WinGet, CurrentWinId, ID, A
;   Toggle_Windows_Set(CurrentWinId)
; return

; +^!f::
;   ;; Buggy
;   Toggle_FullScreen()
; return

; ;; Show_InfoBoard()

; ;; reload currently used script
; +^!p::
;   MsgBox, Script __%A_ScriptFullPath%__ will be reloaded
;   Reload_CurrentScript()
; return

; ;; paste plain text using Shift+Ctrl+V as in Chrome
; +^v::
;   Input_ClipBoardAsPlainText()
; return
; ;; TODO: extend the clipboard by, i.e. using multiple buffers just as vim does
; ;;       or optionally prompt a selection box to choose from latest 10 clipboard content


; >!n::
;   WinGetClass, winClass, A
;   if (winClass == "Notepad++")
;   {
;     SendInput gt
;   }
;   else
;   {
;     SendInput ^{Tab}
;   }
; return


; >!p::
;   WinGetClass, winClass, A
;   if (winClass == "Notepad++")
;   {
;     SendInput gT
;   }
;   else
;   {
;     SendInput +^{Tab}
;   }
; return


; ;; switch to the next/prev window of the __same class__
; ^+!n::
;   WinGetClass, winClass, A
;   /*
;   WinSet, Bottom,, A
;   WinActivate, ahk_class %winClass%
;   */
;   ;; more general ?
;   WinGet, oldWinId, ID, A
;   WinGet, winList, List, ahk_class %winClass%
;   if (winList > 1) {
;     WinActivate, ahk_id %winList2%
;     Restore_ActiveWindowIfMinimized()
;     WinSet, Bottom,, ahk_id %oldWinId%
;   }
; return


; ^+!o::
;   WinGetClass, winClass, A
;   WinGet, winList, List, ahk_class %winClass%
;   if (winList > 1) {
;     lastMatchedWinId := winList%winList%
;     ; MsgBox, winList %winList%, lastMatchedWinId %lastMatchedWinId%
;     WinActivate, ahk_id %lastMatchedWinId%
;     Restore_ActiveWindowIfMinimized()
;   }
; return

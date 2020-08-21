/* 
   NiftyWindows 中去掉的代码
*/




; [AOT] toggles always on top

/**
 * Toggles the always-on-top attribute of the selected/active window.
 */

#SC029::
;#LButton::
AOT_SetToggle:
	Gosub, AOT_CheckWinIDs
	SetWinDelay, -1
	
	IfInString, A_ThisHotkey, LButton
	{
		MouseGetPos, , , AOT_WinID
		If ( !AOT_WinID )
			Return
		IfWinNotActive, ahk_id %AOT_WinID%
			WinActivate, ahk_id %AOT_WinID%
	}
	
	IfWinActive, A
	{
		WinGet, AOT_WinID, ID
		If ( !AOT_WinID )
			Return
		WinGetClass, AOT_WinClass, ahk_id %AOT_WinID%
		If ( AOT_WinClass = "Progman" )
			Return
			
		WinGet, AOT_ExStyle, ExStyle, ahk_id %AOT_WinID%
		If ( AOT_ExStyle & 0x8 ) ; 0x8 is WS_EX_TOPMOST
		{
			SYS_ToolTipText = Always on Top: OFF
			Gosub, AOT_SetOff
		}
		Else
		{
			SYS_ToolTipText = Always on Top: ON
			Gosub, AOT_SetOn
		}
		Gosub, SYS_ToolTipFeedbackShow
	}
Return

AOT_SetOn:
	Gosub, AOT_CheckWinIDs
	SetWinDelay, -1
	IfWinNotExist, ahk_id %AOT_WinID%
		Return
	IfNotInString, AOT_WinIDs, |%AOT_WinID%
		AOT_WinIDs = %AOT_WinIDs%|%AOT_WinID%
	WinSet, AlwaysOnTop, On, ahk_id %AOT_WinID%
Return

AOT_SetOff:
	Gosub, AOT_CheckWinIDs
	SetWinDelay, -1
	IfWinNotExist, ahk_id %AOT_WinID%
		Return
	StringReplace, AOT_WinIDs, AOT_WinIDs, |%A_LoopField%, , All
	WinSet, AlwaysOnTop, Off, ahk_id %AOT_WinID%
Return

AOT_SetAllOff:
	Gosub, AOT_CheckWinIDs
	Loop, Parse, AOT_WinIDs, |
		If ( A_LoopField )
		{
			AOT_WinID = %A_LoopField%
			Gosub, AOT_SetOff
		}
Return

#^SC029::
	Gosub, AOT_SetAllOff
	SYS_ToolTipText = Always on Top: ALL OFF
	Gosub, SYS_ToolTipFeedbackShow
Return

AOT_CheckWinIDs:
	DetectHiddenWindows, On
	Loop, Parse, AOT_WinIDs, |
		If ( A_LoopField )
			IfWinNotExist, ahk_id %A_LoopField%
				StringReplace, AOT_WinIDs, AOT_WinIDs, |%A_LoopField%, , All
Return

AOT_ExitHandler:
	Gosub, AOT_SetAllOff
Return




; [MIW {NWD}] minimize/roll on right + left mouse button

/**
 * Minimizes the selected window (if minimizable) to the task bar. If you press 
 * the left button over the titlebar the selected window will be rolled up 
 * instead of being minimized. You have to apply this action again to roll the 
 * window back down.
 */

$LButton::
$^LButton::
	GetKeyState, MIW_RButtonState, RButton, P
	If ( (MIW_RButtonState = "D") and (!NWD_ImmediateDown) and (NWD_WinClass != "Progman") )
	{
		GetKeyState, MIW_CtrlState, Ctrl, P
		WinGet, MIW_WinStyle, Style, ahk_id %NWD_WinID%
		SysGet, MIW_CaptionHeight, 4 ; SM_CYCAPTION
		SysGet, MIW_BorderHeight, 7 ; SM_CXDLGFRAME
		MouseGetPos, , MIW_MouseY

		If ( MIW_MouseY <= MIW_CaptionHeight + MIW_BorderHeight )
		{
			; checks wheter the window has a sizing border (WS_THICKFRAME)
			If ( (MIW_CtrlState = "D") or (MIW_WinStyle & 0x40000) )
			{
				Gosub, NWD_SetAllOff
				ROL_WinID = %NWD_WinID%
				Gosub, ROL_RollToggle
			}
		}
		Else
		{
			; the second condition checks for minimizable window:
			; (WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX)
			If ( (MIW_CtrlState = "D") or (MIW_WinStyle & 0xCA0000 = 0xCA0000) )
			{
				Gosub, NWD_SetAllOff
				WinMinimize, ahk_id %NWD_WinID%
				SYS_ToolTipText = Window Minimize
				Gosub, SYS_ToolTipFeedbackShow
			}
		}
	}
	Else
	{
		; this feature should be implemented by using a timer because 
		; AutoHotkeys threading blocks the first thread if another 
		; one is started (until the 2nd is stopped)
		
		Thread, priority, 1
		MouseClick, LEFT, , , , , D
		KeyWait, LButton
		MouseClick, LEFT, , , , , U
	}
Return



; [ROL] rolls up/down a window to/from its title bar

ROL_RollToggle:
	Gosub, ROL_CheckWinIDs
	SetWinDelay, -1
	IfWinNotExist, ahk_id %ROL_WinID%
		Return
	WinGetClass, ROL_WinClass, ahk_id %ROL_WinID%
	If ( ROL_WinClass = "Progman" )
		Return
	
	IfNotInString, ROL_WinIDs, |%ROL_WinID%
	{
		SYS_ToolTipText = Window Roll: UP
		Gosub, ROL_RollUp
	}
	Else
	{
		WinGetPos, , , , ROL_WinHeight, ahk_id %ROL_WinID%
		If ( ROL_WinHeight = ROL_WinRolledHeight%ROL_WinID% )
		{
			SYS_ToolTipText = Window Roll: DOWN
			Gosub, ROL_RollDown
		}
		Else
		{
			SYS_ToolTipText = Window Roll: UP
			Gosub, ROL_RollUp
		}
	}
	Gosub, SYS_ToolTipFeedbackShow
Return





ROL_RollUp:
	Gosub, ROL_CheckWinIDs
	SetWinDelay, -1
	IfWinNotExist, ahk_id %ROL_WinID%
		Return
	WinGetClass, ROL_WinClass, ahk_id %ROL_WinID%
	If ( ROL_WinClass = "Progman" )
		Return
	
	WinGetPos, , , , ROL_WinHeight, ahk_id %ROL_WinID%
	IfInString, ROL_WinIDs, |%ROL_WinID%
		If ( ROL_WinHeight = ROL_WinRolledHeight%ROL_WinID% ) 
			Return
	SysGet, ROL_CaptionHeight, 4 ; SM_CYCAPTION
	SysGet, ROL_BorderHeight, 7 ; SM_CXDLGFRAME
	If ( ROL_WinHeight > (ROL_CaptionHeight + ROL_BorderHeight) )
	{
		IfNotInString, ROL_WinIDs, |%ROL_WinID%
			ROL_WinIDs = %ROL_WinIDs%|%ROL_WinID%
		ROL_WinOriginalHeight%ROL_WinID% := ROL_WinHeight
		WinMove, ahk_id %ROL_WinID%, , , , , (ROL_CaptionHeight + ROL_BorderHeight)
		WinGetPos, , , , ROL_WinRolledHeight%ROL_WinID%, ahk_id %ROL_WinID%
	}
Return

ROL_RollDown:
	Gosub, ROL_CheckWinIDs
	SetWinDelay, -1
	If ( !ROL_WinID )
		Return
	IfNotInString, ROL_WinIDs, |%ROL_WinID%
		Return
	WinGetPos, , , , ROL_WinHeight, ahk_id %ROL_WinID%
	If( ROL_WinHeight = ROL_WinRolledHeight%ROL_WinID% )
		WinMove, ahk_id %ROL_WinID%, , , , , ROL_WinOriginalHeight%ROL_WinID%
	StringReplace, ROL_WinIDs, ROL_WinIDs, |%ROL_WinID%, , All
	ROL_WinOriginalHeight%ROL_WinID% =
	ROL_WinRolledHeight%ROL_WinID% =
Return

ROL_RollDownAll:
	Gosub, ROL_CheckWinIDs
	Loop, Parse, ROL_WinIDs, |
		If ( A_LoopField )
		{
			ROL_WinID = %A_LoopField%
			Gosub, ROL_RollDown
		}
Return

#^r::
	Gosub, ROL_RollDownAll
	SYS_ToolTipText = Window Roll: ALL DOWN
	Gosub, SYS_ToolTipFeedbackShow
Return

ROL_CheckWinIDs:
	DetectHiddenWindows, On
	Loop, Parse, ROL_WinIDs, |
		If ( A_LoopField )
			IfWinNotExist, ahk_id %A_LoopField%
			{
				StringReplace, ROL_WinIDs, ROL_WinIDs, |%A_LoopField%, , All
				ROL_WinOriginalHeight%A_LoopField% =
				ROL_WinRolledHeight%A_LoopField% =
			}
Return

ROL_ExitHandler:
	Gosub, ROL_RollDownAll
Return



; [CLW {NWD}] close/send bottom on right + middle mouse button || double click on middle mouse button

/**
 * Closes the selected window (if closeable) as if you click the close button 
 * in the titlebar. If you press the middle button over the titlebar the 
 * selected window will be sent to the bottom of the window stack instead of 
 * being closed.
 */
 

$MButton::
$^MButton::
	GetKeyState, CLW_RButtonState, RButton, P
	If ( (CLW_RButtonState = "D") and (!NWD_ImmediateDown) and (NWD_WinClass != "Progman") )
	{
		GetKeyState, CLW_CtrlState, Ctrl, P
		WinGet, CLW_WinStyle, Style, ahk_id %NWD_WinID%
		SysGet, CLW_CaptionHeight, 4 ; SM_CYCAPTION
		SysGet, CLW_BorderHeight, 7 ; SM_CXDLGFRAME
		MouseGetPos, , CLW_MouseY

		If ( CLW_MouseY <= CLW_CaptionHeight + CLW_BorderHeight )
		{
			Gosub, NWD_SetAllOff
			Send, !{Esc}
			SYS_ToolTipText = Window Bottom
			Gosub, SYS_ToolTipFeedbackShow
		}
		Else
		{
			; the second condition checks for closeable window:
			; (WS_CAPTION | WS_SYSMENU)
			If ( (CLW_CtrlState = "D") or (CLW_WinStyle & 0xC80000 = 0xC80000) )
			{
				Gosub, NWD_SetAllOff
				WinClose, ahk_id %NWD_WinID%
				SYS_ToolTipText = Window Close
				Gosub, SYS_ToolTipFeedbackShow
			}
		}
	}
	Else
	{
		; TODO : workaround for "MouseClick, LEFT, , , 2" due to inactive titlebar problem
		; 2002-03-08 关闭鼠标中键模拟左键双击
		Thread, Priority, 1
		CoordMode, Mouse, Screen
		MouseGetPos, CLW_MouseX, CLW_MouseY
		MouseClick, LEFT, %CLW_MouseX%, %CLW_MouseY%
		Sleep, 10
		MouseGetPos, CLW_MouseNewX, CLW_MouseNewY
		MouseClick, LEFT, %CLW_MouseX%, %CLW_MouseY%
		MouseMove, %CLW_MouseNewX%, %CLW_MouseNewY%
	
	}
Return


; [MAW {NWD}] toggles window maximizing || moves window to next display || maximize to multiple windows on the right

/**
 * This additional button is used to toggle the maximize state of the active 
 * window (if maximizable).
 */

 
$XButton2::
$^XButton2::
	If ( NWD_ImmediateDown )
		Return
	
	IfWinActive, A
	{
		WinGet, MAW_WinID, ID
		If ( !MAW_WinID )
			Return
		WinGetClass, MAW_WinClass, ahk_id %MAW_WinID%
		If ( MAW_WinClass = "Progman" )
			Return
		
		GetKeyState, MAW_RButtonState, RButton, P
		If ( MAW_RButtonState = "U" )
		{
			GetKeyState, MAW_CtrlState, Ctrl, P
			WinGet, MAW_WinStyle, Style
			
			; the second condition checks for maximizable window:
			; (WS_CAPTION | WS_SYSMENU | WS_MAXIMIZEBOX)
			If ( (MAW_CtrlState = "D") or (MAW_WinStyle & 0xC90000 = 0xC90000) )
			{
				WinGet, MAW_MinMax, MinMax
				If ( MAW_MinMax = 0 )
				{
					WinMaximize
					SYS_ToolTipText = Window Maximize
					Gosub, SYS_ToolTipFeedbackShow
				}
				Else
					If ( MAW_MinMax = 1 )
					{
						WinRestore
						SYS_ToolTipText = Window Restore
						Gosub, SYS_ToolTipFeedbackShow
					}
			}
		}
		Else
		{
			Gosub, NWD_SetAllOff
			GetKeyState, MAW_CtrlState, Ctrl, P
			If ( MAW_CtrlState = "U" )
			{
				Send, ^>
				SYS_ToolTipText = Window Move: RIGHT
				Gosub, SYS_ToolTipFeedbackShow
			}
			; Else
			; TODO : maximize to multiple displays on the right (planned feature)
		}
	}
Return
 



; [EJC] opens/closes a drive

/**
 * Opens or closes an installed CD/DVD-ROM reader/writer drive tray. The drives 
 * are assigned to their hotkeys by the certain drive number in your system. The 
 * hotkeys are used in the sequence of the key placement on your physical 
 * keyboard from left to right (1 refers to the first and 0 to the tenth drive). 
 * So you are limited to a total number of 10 drives controlled by NiftyWindows.
 */


#MaxThreadsBuffer On
$#0::
$#1::
$#2::
$#3::
$#4::
$#5::
$#6::
$#7::
$#8::
$#9::
	DriveGet, EJC_DriveList, List, CDROM
	StringLen, EJC_DriveListLength, EJC_DriveList
	StringRight, EJC_PressedDrive, A_ThisHotkey, 1
	
	If ( !EJC_PressedDrive )
		EJC_PressedDrive := 10
	
	If ( EJC_PressedDrive <= EJC_DriveListLength )
	{
		StringMid, EJC_DriveLabel, EJC_DriveList, EJC_PressedDrive, 1
		SYS_ToolTipText = Drive Eject: %EJC_DriveLabel%
		Gosub, SYS_ToolTipFeedbackShow
		Gosub, SUS_SuspendSaveState
		Suspend, On
		Drive, Eject, %EJC_DriveLabel%:
		If ( A_TimeSinceThisHotkey < 250 )
			Drive, Eject, %EJC_DriveLabel%:, 1
		Gosub, SUS_SuspendRestoreState
	}
	Else
	{
		Transform, EJC_PressedDrive, Mod, %EJC_PressedDrive%, 10
		Send, #%EJC_PressedDrive%
	}
Return
#MaxThreadsBuffer Off




; [SCR] starts the user defined screensaver

/**
 * Starts the user defined screensaver (password protection aware). 
 */

#s up::
^#s up::
	RegRead, SCR_Saver, HKEY_CURRENT_USER, Control Panel\Desktop, SCRNSAVE.EXE
	If ( !ErrorLevel and SCR_Saver )
	{
		SendMessage, 0x112, 0xF140, 0, , Program Manager ; 0x112 is WM_SYSCOMMAND ; 0xF140 is SC_SCREENSAVE
		
		If ( A_ThisHotkey != "^#s up" )
			Return
		
		SplitPath, SCR_Saver, SCR_SaverFileName
		Process, Wait, %SCR_SaverFileName%, 5
		If ( ErrorLevel )
		{
			Gosub, SUS_SuspendSaveState
			Suspend, On
			Sleep, 5000
			Gosub, SUS_SuspendRestoreState
			Process, Exist, %SCR_SaverFileName%
			If ( ErrorLevel )
				SendMessage, 0x112, 0xF170, 2, , Program Manager ; 0x112 is WM_SYSCOMMAND ; 0xF170 is SC_MONITORPOWER ; (2 = off, 1 = standby, -1 = on)
		}
	}
	Else
	{
		SYS_TrayTipText = No screensaver specified in display settings (control panel).
		SYS_TrayTipOptions = 2
		Gosub, SYS_TrayTipShow
	}
Return




; [MUT] toggles the audio mute

/**
 * Toggles the muteness of an installed audio card.
 */
 
Pause::
	SoundSet, +1, , Mute
	SoundGet, MUT_MuteState, , MUTE
	SYS_ToolTipText = Audio Mute: %MUT_MuteState%
	Gosub, SYS_ToolTipFeedbackShow
Return








/* 修改透明度- win10 不能用
*/
#^LButton::
#^MButton::
	Gosub, TRA_CheckWinIDs
	SetWinDelay, -1
	CoordMode, Mouse, Screen
	CoordMode, Pixel, Screen
	MouseGetPos, TRA_MouseX, TRA_MouseY, TRA_WinID
	If ( !TRA_WinID )
		Return
	WinGetClass, TRA_WinClass, ahk_id %TRA_WinID%
	If ( TRA_WinClass = "Progman" )
		Return
	
	IfWinNotActive, ahk_id %TRA_WinID%
		WinActivate, ahk_id %TRA_WinID%
	IfNotInString, TRA_WinIDs, |%TRA_WinID%
		TRA_WinIDs = %TRA_WinIDs%|%TRA_WinID%
	
	IfInString, A_ThisHotkey, MButton
	{
		AOT_WinID = %TRA_WinID%
		Gosub, AOT_SetOn
		TRA_WinAlpha%TRA_WinID% := 25 * 255 / 100
	}
	
	TRA_WinAlpha := TRA_WinAlpha%TRA_WinID%
	
	; TODO : the transparency must be set off first, 
	; this may be a bug of AutoHotkey
	WinSet, TransColor, OFF, ahk_id %TRA_WinID%
	PixelGetColor, TRA_PixelColor, %TRA_MouseX%, %TRA_MouseY%, RGB
	WinSet, TransColor, %TRA_PixelColor% %TRA_WinAlpha%, ahk_id %TRA_WinID%
	TRA_PixelColor%TRA_WinID% := TRA_PixelColor

	IfInString, A_ThisHotkey, MButton
		SYS_ToolTipText = Transparency: 25 `% + %TRA_PixelColor% color (RGB) + Always on Top
	Else
		SYS_ToolTipText = Transparency: %TRA_PixelColor% color (RGB)
	Gosub, SYS_ToolTipFeedbackShow
Return





; [SYS] provides reversion of all visual effects

/**
 * This powerful hotkey removes all visual effects (like on exit) that have 
 * been made before by NiftyWindows. You can use this action as a fall-back 
 * solution to quickly revert any always-on-top, rolled windows and 
 * transparency features you've set before.
 */

^#BS::
^!BS::
SYS_RevertVisualEffects:
	Gosub, AOT_SetAllOff
	Gosub, ROL_RollDownAll
	Gosub, TRA_TransparencyAllOff
	SYS_TrayTipText = All visual effects (AOT, Roll, Transparency) were reverted.
	Gosub, SYS_TrayTipShow
Return



#MButton::
	Gosub, TRA_CheckWinIDs
	SetWinDelay, -1
	MouseGetPos, , , TRA_WinID
	If ( !TRA_WinID )
		Return
	IfWinNotActive, ahk_id %TRA_WinID%
		WinActivate, ahk_id %TRA_WinID%
	IfNotInString, TRA_WinIDs, |%TRA_WinID%
		Return
	Gosub, TRA_TransparencyOff

	SYS_ToolTipText = Transparency: OFF
	Gosub, SYS_ToolTipFeedbackShow
Return

TRA_TransparencyOff:
	Gosub, TRA_CheckWinIDs
	SetWinDelay, -1
	If ( !TRA_WinID )
		Return
	IfNotInString, TRA_WinIDs, |%TRA_WinID%
		Return
	StringReplace, TRA_WinIDs, TRA_WinIDs, |%TRA_WinID%, , All
	TRA_WinAlpha%TRA_WinID% =
	TRA_PixelColor%TRA_WinID% =
	; TODO : must be set to 255 first to avoid the black-colored-window problem
	WinSet, Transparent, 255, ahk_id %TRA_WinID%
	WinSet, TransColor, OFF, ahk_id %TRA_WinID%
	WinSet, Transparent, OFF, ahk_id %TRA_WinID%
	WinSet, Redraw, , ahk_id %TRA_WinID%
Return

TRA_TransparencyAllOff:
	Gosub, TRA_CheckWinIDs
	Loop, Parse, TRA_WinIDs, |
		If ( A_LoopField )
		{
			TRA_WinID = %A_LoopField%
			Gosub, TRA_TransparencyOff
		}
Return

#^t::
	Gosub, TRA_TransparencyAllOff
	SYS_ToolTipText = Transparency: ALL OFF
	Gosub, SYS_ToolTipFeedbackShow
Return









; [UPD] checks for a new build

UPD_CheckForUpdate:
	UPD_CheckSuccess =
	Random, UPD_Random
	If ( TEMP )
		UPD_BuildFile = %TEMP%\%SYS_ScriptNameNoExt%.%UPD_Random%.tmp
	Else
		UPD_BuildFile = %SYS_ScriptDir%\%SYS_ScriptNameNoExt%.%UPD_Random%.tmp
	Gosub, SUS_SuspendSaveState
	Suspend, On
	URLDownloadToFile, http://www.enovatic.org/products/niftywindows/files/build.txt?random=%UPD_Random%, %UPD_BuildFile%
	Gosub, SUS_SuspendRestoreState
	If ( !ErrorLevel )
	{
		FileReadLine, UPD_Build, %UPD_BuildFile%, 1
		If ( !ErrorLevel )
			If UPD_Build is digit
			{
				UPD_CheckSuccess = 1
				UPD_LastUpdateCheck = %A_MM%
				If ( UPD_Build > SYS_ScriptBuild )
				{
					SYS_TrayTipText = There is a new version available. Please check website.
					SYS_TrayTipOptions = 1
					Run, http://www.enovatic.org/products/niftywindows/
				}
				Else
					SYS_TrayTipText = There is no new version available.
			}
			Else
				SYS_TrayTipText = wrong build pattern in downloaded build file
		Else
			SYS_TrayTipText = downloaded build file couldn't be read
	}
	Else
		SYS_TrayTipText = build file couldn't be downloaded
	FileDelete, %UPD_BuildFile%
	If ( !UPD_CheckSuccess )
	{
		SYS_TrayTipText = Check for update failed:`n%SYS_TrayTipText%
		SYS_TrayTipOptions = 3
	}
	Gosub, SYS_TrayTipShow
Return






UPD_AutoCheckForUpdate:
	If ( UPD_LastUpdateCheck != A_MM )
	{
		Gosub, SUS_SuspendSaveState
		Suspend, On
		MsgBox, 4132, Update Handler - %SYS_ScriptInfo%, You haven't checked for updates for a long period of time (at least one month).`n`nDo you want NiftyWindows to check for a new version now (highly recommended)?
		Gosub, SUS_SuspendRestoreState
		IfMsgBox, Yes
			Gosub, UPD_CheckForUpdate
		Else
			UPD_LastUpdateCheck = %A_MM%
	}
Return








MIR_MirandaFullPath = %ProgramFiles%\Miranda\Miranda32.exe
SplitPath, MIR_MirandaFullPath, , MIR_MirandaDir



; [MIR] toggles the visibility of miranda buddy list

/**
 * Toggles the visibility of the Miranda buddy list (if installed). Currently 
 * Miranda does not provide a hotkey to activate the buddy list if the window 
 * is still visible. Instead the opened (but not activated) buddy list will be 
 * minimized. This is not expected so this NiftyWindows feature provides the 
 * needed service asked by so many people.
 */

^+b::
	IfExist, %MIR_MirandaFullPath%
	{
		SetTitleMatchMode, 3
		DetectHiddenWindows, On
		MIR_MirandaStart = 0
		IfWinNotExist, Miranda IM
		{
			Run, %MIR_MirandaFullPath%, %MIR_MirandaDir%
			WinWait, Miranda IM
			MIR_MirandaStart=1
			Sleep, 500
		}
		DetectHiddenWindows, Off
		IfWinActive, Miranda IM
		{
			If ( !MIR_MirandaStart )
				WinHide
		}
		Else
			IfWinExist, Miranda IM
				WinActivate
			Else
			{
				DetectHiddenWindows, On
				IfWinExist, Miranda IM
				{
					WinShow
					WinActivate
				}
			}
	}
	Else
		Send, ^+b
Return





; [MIR] toggles the visibility of last used miranda message container

/**
 * Toggles the visibility of the last used Miranda message container 
 * (if installed). Currently Miranda does not provide a hotkey to activate the 
 * last used message container if there is no unread message waiting for your 
 * attention. So this hotkey will make a container visible (if it is minimized) 
 * and activate it. If there is no existing message container, this hotkey will 
 * do nothing. 
 */

~^+u::
	IfExist, %MIR_MirandaFullPath%
	{
		Sleep, 500	
		SetTitleMatchMode, 3
		IfWinExist, ahk_class #32770
		{
			WinGetTitle, MIR_Title
			IfNotInString MIR_Title, Mail
				IfWinNotActive
					WinActivate
		}
	}
	Else
		Send, ^+u
Return
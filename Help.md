
## 字符说明
 ```
@ = WIN
+ = SHIFT
^ = CTRL
% = ALT
 ```

## 显示器宽高
-- 1440 3840


## 常用方法

### 1
acSetClipboardText(bottom)
acDisplayBalloonTip(bottom)




```lua
-- 创建一个函数来获取当前值的下一个值
function useCycleList(currentValue, cycleList)
    for i, value in ipairs(cycleList) do
        if  currentValue == value then
            -- 如果当前值等于数组中的某个值，计算下一个索引
            local nextIndex = (i % #cycleList) + 1
            -- 返回数组中的下一个值
            return cycleList[nextIndex]
        end
    end
    error("Current value is not in the rotation list.")
end
```





### Locate Window Actions:

acFindWindow
acFindWindowByTitleRegex
acGetAllWindows
acGetOwnerWindowByPoint
acGetParentWindowByPoint

#### acGetWindowByPoint

acGetForegroundWindow

acGetDesktopWindow


### Window State Actions:

#### acActivateWindow

acPauseResumeThreadList - not

acSetProcessPriority
acTerminateProcess
acCloseApplication


### Window Placement Actions:

#### acMoveWindow
移动

acMinimizeWindow
acRestoreWindow
acMaximizeWindow
acMaximizeOrRestoreWindow
acTileWindows


### Window Size Actions:

acGetWindowLeft
acGetWindowTop
acGetWindowRight
acGetWindowBottom

#### acSetWindowSize 设置窗口大小
acSetWindowSize(hwndTarget, x, y, left, top, width, height)

### Window Order Actions:

acSetTopmost
acClearTopmost
acToggleTopmost

acSendWindowToBottom
#### acPreviousApplication
上一个应用

#### acNextApplication
下一个应用

### Window Transparency and Color Key Actions:
修改样式：透明度、颜色

acGetWindowTransparency
acGetWindowColorKeyR
acGetWindowColorKeyG
acGetWindowColorKeyB
acSetWindowColorKey
acSetWindowTransparencyAndColorKey
acSetWindowTransparency


### Miscellaneous Window Actions:

acGetWindowTitle
acGetClassName
acGetControlID
acGetExecutableName
acGetExecutablePath


### Multiple Monitor Actions:

#### acCenterWindowToScreen

acClipWindowToScreen

#### acFitWindowToScreen 全屏

acMaximizeToAllScreens
acGetMonitorBrightness
acSetMonitorBrightness

acGetMonitorFromPoint
acGetMonitorName
acSendWindowToPreviousMonitor
acSendWindowToMonitorByName
acSendWindowToMonitorByHandle
acSendWindowToNextMonitor
acGetMonitorFromName
acGetMonitorBottom
acGetMonitorTop
acGetMonitorLeft
acGetMonitorRight


### Keyboard Actions:

acSendKeys
acSendKeyDown
acSendKeyUp
acSendWinDown
acSendWinUp
acSendControlDown
acSendControlUp
acSendAltDown
acSendAltUp
acSendShiftDown
acSendShiftUp


### Mouse Actions:

acGetMouseLocationX
acGetMouseLocationY
acMouseMove
acMouseClick
acGetMouseCursorType
acAutoHideMouseCursor
acHideMouseCursor
acShowMouseCursor


### Clipboard Actions:

acGetClipboardText
acSetClipboardText


### Audio Actions:

acSetVolume
acGetVolume
acToggleMute
acGetMute
acSetMute
acPlaySound


### Utility Actions:

acConsumePhysicalInput
acDelay
acGetSystemMetrics
acGetPixelRByPoint
acGetPixelGByPoint
acGetPixelBByPoint
acSetDisplayGamma

#### acMessageBox
弹窗提示

#### acDisplayBalloonTip
系统消息提示

acDisplayText
acEmptyRecycleBins
acKillDisplayText
acGetProcessIDFromPattern
acGetWindowFromProcessID
acIsImmersiveProcess
acGetFileVersion
acGetFileProductVersion
acInputBox
acRunProgram
acShellExecute
acLockWindows
acGetNumber
acSetNumber
acGetNumberVariable
acSetNumberVariable
acGetStringVariable
acSetStringVariable
acExpandEnvironmentString



### Windows Registry Actions:

acRegistryCreateKey
acRegistryDeleteKey
acRegistryDeleteValue
acRegistryGetString
acRegistrySetString
acRegistryGetNumber
acRegistrySetNumber



### Windows Messages Actions:

acSendMessage
acPostMessage


### StrokesPlus Control Actions:

acShowSettings
acShowActions
acShowHotkeys
acShowIgnoreList
acShowPrefs
acShowAbout
acDisable
acDisableNext
acDisableCapture
acEnableCapture
acDisableHotkey
acEnableHotkey

#### acReloadConfig
配置重载

acRelayGesture
acGetDrawColor
acSetDrawColor
acToggleTrayIcon
acExit

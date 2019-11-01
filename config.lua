tWindow = {
    google = {
        file = "chrome.exe",
        className = "Chrome_WidgetWin_1",
        path = "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",
        position = {
            {x = 400, y = 0, w = 1920, h = 1080},
            {x = 800, y = 0, w = 1400, h = 1080}
        },
        type = 1 -- 不能为 1
    },
    vivaldi = {
        title = "Vivaldi",
        file = "vivaldi.exe",
        className = "Chrome_WidgetWin_1",
        path = "C:\\Program Files\\Vivaldi\\Application\\vivaldi.exe",
        type = 1
    },
    ie = {
        file = "iexplore.exe",
        className = "IEFrame",
        path = "C:\\Program Files\\internet explorer\\iexplore.exe",
        type = 1
    },
    notepad = {
        title = "Notepad++",
        className = "Notepad++",
        path = "C:\\Program Files\\Notepad++\\notepad++.exe",
        type = 1
    },
    vs = {
        title = "Microsoft Visual Studio",
        file = "devenv.exe",
        hwnd = 0,
        className = "HwndWrapper%[DefaultDomain;;",
        path = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Enterprise\\Common7\\IDE\\devenv.exe",
        exit = "^{F_4}",
        position = {
            {x = 0, y = 0, w = 1100, h = 1080},
            {x = 0, y = 0, w = 1400, h = 1080}
        }
    },
    vscode = {
        title = "Visual Studio Code",
        file = "Code.exe",
        hwnd = 0,
        className = "Chrome_WidgetWin_1",
        path = "C:\\Users\\lol\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe",
        comment = "不支持acFindWindow方法",
        type = 1,
        position = {
            {x = 0, y = 0, w = 1400, h = 1080},
            {x = 0, y = 0, w = 1000, h = 1080}
        }
    },
    st = {
        title = "Sublime Text ",
        file = "sublime_text.exe",
        hwnd = 0,
        className = "",
        path = "D:\\Program\\Sublime Text\\sublime_text.exe",
        type = 1
    },
    dopus = {
        title = "Directory Opus",
        file = "dopus.exe",
        className = "dopus.lister",
        path = "C:\\Program Files\\GPSoftware\\Directory Opus\\dopus.exe",
        type = 1
    },
    tim = {
        -- 只能使用句柄的方式来调用窗体
        hwnd = sWinTim,
        file = "TIM.exe",
        className = "TXGuiFoundation"
    },
    wx = {
        file = "WeChat.exe",
        className = "WeChatMainWndForPC",
        exit = "%{F_4}"
    },
    yodao = {
        shortcut = "^+Y",
        className = "YdMiniModeWndClassName", --"YodaoMainWndClass",
        path = "C:\\Program Files (x86)\\Youdao\\Dict\\YoudaoDict.exe",
        type = 1
    },
    rolan = {
        --只能使用句柄的方式来调用窗体
        file = "Rolan.exe",
        className = "ThunderRT6FormDC"
    },
    navicat = {
        file = "navicat.exe",
        className = "TNavicatMainForm",
        path = "C:\\Program Files\\PremiumSoft\\Navicat Premium 12\\navicat.exe",
        position = {
            {x = 0, y = 0, w = 900, h = 1080},
            {x = 0, y = 0, w = 1000, h = 1080}
        }
    },
    doc = {
        title = "Word",
        file = "WINWORD.EXE",
        className = "NetUIHWND",
        path = "C:\\Program Files (x86)\\Microsoft Office\\Office16\\WINWORD.EXE",
        type = 1
    },
    cmd = {
        file = "cmd.exe",
        className = "ConsoleWindowClass",
        path = "C:\\Windows\\System32\\cmd.exe",
        exit = "%{F_4}",
        type = 1
    },
    pd = {
        title = "PowerDesigner",
        file = "PdShell16.exe",
        exit = "%{F_4}",
        position = {
            {x = 1800, y = 0, w = 700, h = 1080}
        }
    }
}

-- 手势映射快捷键
-- 调用顺次 hwnd -> shortcut -> file -> className
-- ARTCUR.EXE|Photoshop.exe|EXCEL.EXE|POWERPNT.EXE|WINWORD.EXE|sublime_text.exe|wps.exe|wpp.exe|et.exe|firefox.exe|chrome.exe|iexplore.exe|opera.exe

--[[
title:
PowerDesigner
Sublime Text 
Excel
AutoHotkey
Notepad++
Directory Opus
Navicat Premium
]]

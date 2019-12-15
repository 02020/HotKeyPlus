tWindow = {
    google = {
        file = "chrome",
        className = "Chrome_WidgetWin_1",
        path = "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",
        position = {
            {x = 400, y = 0, w = 1920, h = 1080},
            {x = 800, y = 0, w = 1800, h = 1080}   --看b站视频
        },
        type = 1 -- 不能为 1
    },
    vivaldi = {
        title = "Vivaldi",
        file = "vivaldi",
        className = "Chrome_WidgetWin_1",
        path = "C:\\Program Files\\Vivaldi\\Application\\vivaldi.exe",
        type = 1,
        position = {
            {x = 0, y = 0, w = 1820, h = 1080},
            {x = 1000, y = 0, w = 1400, h = 1080}
        },
    },
    ie = {
        file = "iexplore",
        className = "IEFrame",
        path = "C:\\Program Files\\internet explorer\\iexplore.exe",
        type = 1
    },
    notepad = {
        file = "notepad++",
        title = "Notepad++",
        className = "Notepad++",
        path = "C:\\Program Files\\Notepad++\\notepad++.exe",
        type = 1
    },
    vs = {
        title = "Microsoft Visual Studio",
        file = "devenv",
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
        file = "Code",
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
        file = "sublime_text",
        hwnd = 0,
        className = "",
        path = "D:\\Program\\Sublime Text\\sublime_text.exe",
        type = 1,
           position = {
            {x = 0, y = 0, w = 1200, h = 1080},
            {x = 0, y = 0, w = 1000, h = 1080}
        }
    },
    idea = {
        title = "IntelliJ IDEA",
        file = "idea64",
        hwnd = 0,
        className = "SunAwtFrame",
        path = "C:\\Program Files\\JetBrains\\IntelliJ IDEA 2019.2\\bin\\idea64.exe",
        exit = "^{F_4}",
        position = {
            {x = 0, y = 0, w = 1500, h = 1080},
            {x = 0, y = 0, w = 2000, h = 1080}
        }
    },
    dopus = {
        title = "Directory Opus",
        file = "dopus",
        className = "dopus.lister",
        path = "C:\\Program Files\\GPSoftware\\Directory Opus\\dopus.exe",
        type = 1
    },
        xy = {
        title = "XYplorer",
        file = "XYplorer",
        className = "dopus.lister",
        path = "D:\\Program\\xyplorer20.5\\XYplorer.exe",
        type = 1,
                position = {
            {x = -8, y = -52, w = 1200, h = 480}
        }
    },
    tim = {
        -- 只能使用句柄的方式来调用窗体
        hwnd = sWinTim,
        file = "TIM",
        className = "TXGuiFoundation"
    },
    wx = {
        file = "WeChat",
        className = "WeChatMainWndForPC",
        shortcut = "^+l",
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
        file = "Rolan",
        className = "ThunderRT6FormDC"
    },
    navicat = {
        file = "navicat",
        className = "TNavicatMainForm",
        path = "C:\\Program Files\\PremiumSoft\\Navicat Premium 12\\navicat.exe",
        position = {
            {x = 1000, y = 0, w = 900, h = 1080},
            {x = 1000, y = 0, w = 1000, h = 1080}
        }
    },
    doc = {
        title = "Word",
        file = "WINWORD",
        className = "NetUIHWND",
        path = "C:\\Program Files (x86)\\Microsoft Office\\Office16\\WINWORD.EXE",
        type = 1
    },
    cmd = {
        file = "cmd",
        className = "ConsoleWindowClass",
        path = "C:\\Windows\\System32\\cmd.exe",
        exit = "%{F_4}",
        type = 1
    },
    pd = {
        title = "PowerDesigner",
        file = "PdShell16",
        exit = "%{F_4}",
        position = {
            {x = 1800, y = 0, w = 700, h = 1080}
        }
    },
    myBase = {
        title = "",
        file = "myBase",
        path="D:\\Program\\nyfedit7pro\\myBase.exe",
        position = {
            {x = 1800, y = 0, w = 700, h = 1080},
            {x = 1400, y = 0, w = 1100, h = 1080}
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

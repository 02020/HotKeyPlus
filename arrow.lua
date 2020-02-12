--- 鼠标的四个方向 正

------------------------------------------------------ 向上
funUp = {}
function funUp:top()
    display_message("t", 1, cur.gsx, cur.gsy)
end

function funUp:right()
    display_message("r", 1, cur.gsx, cur.gsy)
end

function funUp:left()
    display_message("l", 1, cur.gsx, cur.gsy)
end

function funUp:bottom()
    display_message("b")
    tip("s")
end

function funUp:mid()
    --显示窗体
    display_message("mid")
    --   acSendKeys("+%q")
    acSendKeys("@g{DELAY 50}q")
   -- acDelay(100)
   -- acMouseMove(cur.gex + 180, cur.gey + 40)
end

------------------------------------------------------ 向下
funDown = {}
function funDown:top()
    display_message("re", 1, gsx, gsy)
    --acSendKeys("{F_5}")
end

function funDown:right()
    display_message("r", 1, cur.gsx, cur.gsy)
end

function funDown:left()
    display_message("l", 1, cur.gsx, cur.gsy)
end

function funDown:bottom()
    display_message("down:bottom")
end
function funDown:mid()
    display_message("ctrl+v", 2, gsx, gsy)
    --  acSendKeys("^v")
end

------------------------------------------------------ 向左
-- 撤销 退格
funLeft = {}
function funLeft:top()
    -- display_message("ctrl + z", 1, gsx, gsy)
    -- acSendKeys("^z")
end

function funLeft:right()
end

function funLeft:left()
    display_message("l")
end

function funLeft:bottom()
    -- acSendKeys("{BACKSPACE}")
end
function funLeft:mid()
    display_message("left")
end

------------------------------------------------------ 向右
--- 粘贴、刷新、全选
funRight = {}
funRightV = {}

----------------------------------- 右侧 A B C D
function funRightV:A()
    activate_window("notepad")
end
function funRightV:B()
    local w = activate_window("vs")
    acMoveWindow(w, 0, 0, 0, 0)
    acSetWindowSize(w, 0, 0, 1000, 1080) --100%
end
function funRightV:C()
    activate_window("vscode")
end
function funRightV:D()
    activate_window("st")
end

function funRight:right()
    local x = get_mouse_position_v()
    message(x)
    funRightV[x]()
end

----------------------------------- 左侧
function funRight:left()
    display_message("l")
end
----------------------------------- 上
function funRight:top()
    display_message("re", 1, gsx, gsy)
    --  acSendKeys("{F_5}")
end
----------------------------------- 下
function funRight:bottom()
    display_message("bottom")
    acPreviousApplication() --切换上一个窗口
end
----------------------------------- 中
function funRight:mid()
    display_message("mid")
    qExecuteToogle()
end

------------------------------------------------------ 上下左右

function qUp()
    funUp[get_mouse_position_h()]()
end

function qDown()
    funUp[get_mouse_position_h()]()
end

function qLeft()
    funLeft[get_mouse_position_h()]()
end

function qRight()
    t, b, l, r = get_window_size()
    if cur.gey < (t + 40) and cur.gey > t then
        funArrow:title()
    else
        funRight[get_mouse_position_h()]()
    end
end

------------------------------------------------------ 八方

funArrow = {}
function funArrow:title()

    iWindow = iWindow + 1

    if iWindow > #tWindowToogle then
        iWindow = 1
    end

    local code = tWindowToogle[iWindow]
   -- log(iWindow.. ":"..code)
    activate_window(code)
end

------------------------------------------------------ 八方
--02.SouthWest 西南 ↙
function funArrow:SouthWest()
    display_message("mini")
    lastHwnd = acGetForegroundWindow()
   -- acMinimizeWindow(nil, cur.gsx, cur.gsy)
   acMinimizeWindow(lastHwnd)
end

--06.NorthWest 西北 ↖
function funArrow:NorthWest()
    --执行关闭窗口- 默认执行 Ctrl+w
    local exit = "^w"
    local win = get_config()
    if win ~= nil and win.exit then
        exit = win.exit
    end

    acSendKeys(exit)
end

--04.SouthEast 东南 ↘
function funArrow:SouthEast()
    -- Delete
    display_message("Delete")
    acSendKeys("{DELETE}")
end

--08.NorthEast 东北 ↗
function funArrow:NorthEast()
    display_message("Max")
    acMaximizeOrRestoreWindow(nil, cur.gsx, cur.gsy)
end

--[[
-------
 退出三种方式
 Alt+F4 %{F_4}
 Ctrl+F4 ^{F_4}
 Ctrl+w ^w
-------
--]]

--[[
    
    NorthEast---东北,
    SouthEast---东南,
    NorthWest---西北,
    SouthWest---西南.

--]]
-----  斜箭头
---  屏幕的四个区域

--- 鼠标的四个方向 正

------------------------------------------------------ 向上

------------------------------------------------------ 向下

------------------------------------------------------ 向左

------------------------------------------------------ 向右

------------------------------------------------------ 上下左右

function qUp()
    acSendKeys("{F12}")
end
-- @`

function qRight()
    --  acSendKeys("+@{F_3}")
    acSendKeys("@{RIGHT}")
end

function qLeft()
    -- acSendKeys("+@{F_7}")
    acSendKeys("@{LEFT}")
end

function qDown()
    -- acSendKeys("@{F12}")
    acSendKeys("@{ESC}")
end

funArrow = {}
------------------------------------------------------ 八方
--02.SouthWest 西南 ↙
function funArrow:SouthWest()
    display_message("mini")
    lastHwnd = acGetForegroundWindow()
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
    -- display_message("Delete")
    -- acSendKeys("{DELETE}")
    acSendKeys("@{F12}")
end

--08.NorthEast 东北 ↗
function funArrow:NorthEast()
    display_message("_08.NorthEast_")
    position_window()
    -- acMaximizeOrRestoreWindow(nil, cur.gsx, cur.gsy)
    --acDisableNext()
end
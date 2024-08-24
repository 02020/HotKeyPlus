-- 鼠标的四个方向 正

require("sp")

log = require "./lib/log"

-- 相对路径 C:\Program Files\StrokesPlus
log.outfile = './log.txt'



local W_SZIE = {

    W = 1420,
    W_1_2 = 700,

    H = 2560,

    H_1_4 = 640,
    H_1_3 = 800,
    H_1_2 = 1280,

    H_2_3 = 1600,
    H_3_4 = 1920,

    X_DIST_MIN = 400,
    X_DIST_MAX = 900,

    Y_DIST_MIN = 400,
    Y_DIST_MAX = 1000,

}

-- 闭包
function heightCycleListLB()

    local index = 1
    local direction = 1  -- 1 表示正向，-1 表示反向
    local values = { W_SZIE.H_1_4, W_SZIE.H_1_2, W_SZIE.H_3_4 }

    return function()
        local currentValue = cur.height
        local value = values[index]
        if (direction == 1 and index == #values) or (direction == -1 and index == 1) then
            -- 达到最大值或最小值时改变方向
            direction = -direction
        end

        index = index + direction
        return value
    end

end


local heightCycleList = heightCycleListLB()

-- exclude allow permission
function permission(cb)
    -- log.info("下一个桌面")
    -- log.debug("下一个桌面")
    -- acSendKeys("^@{RIGHT}") -- 下一个桌面
    -- local hwnd = acGetWindowByPoint(cur.gex, cur.gey)
    -- hwnd = acGetForegroundWindow()
    -- acDisplayBalloonTip()

    acDelay(50)
    -- acDisplayBalloonTip(cur.perH)
    -- log.info("perH: " .. cur.perH)
    -- log.info("X_DIST: " .. cur.distanceX .. " Y_DIST: " .. cur.distanceY)

    if cur.name ~= "WorkerW" and cur.name ~= "YodaoMainWndClass" then
        cb()
    end
end

-- 纵向 - 采用百分比来空置高度
function getHeight()
    local h = W_SZIE.H_2_3

    if cur.perH < 0.3 then
        -- 高度轮切
        h =  heightCycleList()
    elseif cur.perH > 0.8 then
        h = W_SZIE.H * 0.8
    else
    end

    return h
end

-- 横向 - 通过在屏幕上绘制的距离来指定高度
function getHeightFromDistanceX()
    local h = W_SZIE.H_1_2
    --
    if cur.distanceX < W_SZIE.X_DIST_MIN then
        h = heightCycleList()
    elseif cur.distanceX > W_SZIE.X_DIST_MAX then
        h = W_SZIE.H_3_4
    else
    end

    return h
end


------------------------------------------------------ 上下左右

------------------------------------------------------ 向上
function qUp()
    permission(function()
        local h = getHeight()
        acSetWindowSize(cur.hwnd, 0, 0, W_SZIE.W, h - 44)
        acMoveWindow(cur.hwnd, 0, 0, 0, 44)

    end)
end

------------------------------------------------------ 向下
function qDown()
    permission(function()

        -- 移动到另一个屏幕
        if cur.gey > 2600 then
            local h =  cur.gsx < 300 and 800 or 1920
            -- 换屏幕：先移动位置，再修改大小，
            acMoveWindow(cur.hwnd, 0, 0, 0, 3880)
            acSetWindowSize(cur.hwnd, 0, 0, h, 1040)
        else
            local h = getHeight()
            -- 先修改大小，再移动位置
            acSetWindowSize(cur.hwnd, 0, 0, W_SZIE.W, h)
            acMoveWindow(cur.hwnd, 0, 0, 0, 2560 - h)
            --
        end

        -- 隐藏到最后
        -- if cur.distanceX > 400 then
        --     acSendWindowToBottom(cur.hwnd)
        -- end
    end)
end

------------------------------------------------------ 向左
function qLeft()
    if cur.gex < 100  then
        acSendKeys("^@{LEFT}") -- 上一个桌面
    else
        permission(function()
            acSetWindowSize(cur.hwnd, 0, 0, 1400, W_SZIE.H_1_3)
            acMoveWindow(cur.hwnd, 0, 0, 0, cur.top)
        end)
    end
end

------------------------------------------------------ 向右

function qRight()
    if cur.gsx < 100  then
        acSendKeys("^@{RIGHT}") -- 下一个桌面

    else
        permission(function()
            local h = getHeightFromDistanceX()
            acSetWindowSize(cur.hwnd, 0, 0, 1400, h)

            -- 底部对齐
            if cur.top + h > 2560 then
                acMoveWindow(cur.hwnd, 0, 0, 0, 2560 - h)
            else
                acMoveWindow(cur.hwnd, 0, 0, 44, cur.top)
            end

        end)
    end
end


------------------------------------------------------Ctrl

qCtrl = {}
------------------------------------------------------Ctrl 上
function qCtrl:Up()
    -- acSendKeys("^+T")
    -- position_window_ctrl()
    -- acSendKeys("{F12}")
    acSendKeys("^@{LEFT}")
    acDelay(100)
    acSendKeys("^@{LEFT}")
    acDelay(100)
    acSendKeys("^@{LEFT}")
end

------------------------------------------------------Ctrl 下
function qCtrl:Down()
    acSendKeys("^@{RIGHT}")
    acDelay(100)
    acSendKeys("^@{RIGHT}")
    acDelay(100)
    acSendKeys("^@{RIGHT}")
end
------------------------------------------------------Ctrl 左
function qCtrl:Left()
    acSendKeys("^@{LEFT}") -- 上一个桌面


    -- acSendKeys("%+{LEFT}") --  Shift+Alt+LEFT
end
------------------------------------------------------Ctrl 右
function qCtrl:Right()
    -- acSendKeys("@+{RIGHT}") -- 下一个布局
    acSendKeys("%+{RIGHT}") --  Shift+Alt+Right
    acDelay(100)
    acSendKeys("%+{RIGHT}")

end


qShift = {}
------------------------------------------------------ qShift 左

function qShift:Left()
    acSendKeys("%+{LEFT}") --  Shift+Alt+LEFT
end
------------------------------------------------------ qShift 右

function qShift:Right()
    acSendKeys("%+{RIGHT}") --  Shift+Alt+Right
    acDelay(100)
    acSendKeys("%+{RIGHT}")
end


funArrow = {}
------------------------------------------------------ 八方
--02.SouthWest 西南 ↙
function funArrow:SouthWest()
    permission(function()
        lastHwnd = acGetForegroundWindow()
        acMinimizeWindow(lastHwnd)
    end)
end

--06.NorthWest 西北 ↖
function funArrow:NorthWest()
    --执行关闭窗口- 默认执行 Ctrl+w
    local exit = "^w"
    -- local win = get_config()
    -- if win ~= nil and win.exit then
    --     exit = win.exit
    -- end

    acSendKeys(exit)
end

--04.SouthEast 东南 ↘
function funArrow:SouthEast()
    permission(function()
        acSetWindowSize(cur.hwnd, 0, 0, 1400, 400)
        acMoveWindow(cur.hwnd, 0, 0, 0, 2560 - 400)
    end)
end

--08.NorthEast 东北 ↗
function funArrow:NorthEast()
    acSendKeys("{F12}")
    -- acSendKeys("@{END}")
    -- display_message("_08.NorthEast_")
    -- position_window()
    -- acMaximizeOrRestoreWindow(nil, cur.gsx, cur.gsy)
    --acDisableNext()
end


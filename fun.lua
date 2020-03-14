iWindow = 0

function qGetTooleInt()
    for key, value in pairs(tWindow) do
        local w = acFindWindow(value.className, nil)

        if w == nil or w == 0 then
            acRunProgram(value.path, 0, 0, 100, 500, 2)
        else
            acRestoreWindow(w, gsx, gsy)
            acActivateWindow(w, gsx, gsy, 0)
        end
    end
end

-- 轮换窗体
function qExecuteToogle()
    iWindow = iWindow + 1

    if iWindow > #sWindow then
        iWindow = 1
    end

    local code = sWindow[iWindow]

    acSendKeys("^+%@" .. code)

    --activate_window(code)
end

-- 执行窗口定位：根据配置文件
function execute_position(val)
    iWindow = iWindow + 1

    local win = get_config()
    if win ~= nil and win.position ~= nil then
        local posList = win.position

        if iWindow > #posList then
            iWindow = 1
        end
        local pos = posList[iWindow]
        if val == nil or val == 0 then
            -- 向左靠齐
            acMoveWindow(win.hwnd, 0, 0, pos.x, pos.y)
            acSetWindowSize(win.hwnd, pos.x, pos.y, pos.w, pos.h) --100%
        else
            -- 向右靠齐
            acMoveWindow(win.hwnd, 0, 0, 2496 - pos.w, pos.y)
            acSetWindowSize(win.hwnd, 2560 - pos.w, 0, pos.w, pos.h) --100%
        end
    end
end

-- 获取当前窗口信息

function get_info()
    local hwnd = acGetForegroundWindow()
    local s =
        "title:" ..
        acGetWindowTitle(hwnd) ..
            "\nclassName:" ..
                acGetClassName(hwnd) ..
                    "\nid:" ..
                        hwnd .. -- acGetControlID(hwnd) ..
                            "\nname:" .. acGetExecutableName(hwnd)
    -- "path"..   acGetExecutablePath(hwnd)

    return s
end


-- 设置手势经过的两个窗口位置
function position_window()
    -- Define Mouse Gesture direction (\)

    -- Combo - 3in1 Functions

    -- (Single Window Mode)
    -- Gesture Start and End in the single window
    -- (current Window) --> (center window) <--> resize to 1/3 @ corner

    -- (Tile Window Mode, side by side)
    -- Gesture cross two window and make it tile side by side
    -- If both windows are same title, then Switch to single window mode

    -- Get Window Position
    local hFirstWindow = acGetOwnerWindowByPoint(cur.gsx, cur.gsy)
    local hSecondWindow = acGetOwnerWindowByPoint(cur.gex, cur.gey)
    local hFirstWindowLeft = acGetWindowLeft(hFirstWindow)
    local hFirstWindowRight = acGetWindowRight(hFirstWindow)
    local hFirstWindowTitle = acGetWindowTitle(hFirstWindow, 0, 0)
    local hSecondWindowTitle = acGetWindowTitle(hSecondWindow, 0, 0)

    --Get Current Screen Position
    local hScreen = acGetMonitorFromPoint(cur.gsx, cur.gsy)
    local iScreenTop = acGetMonitorTop(hScreen, 1)
    local iScreenBottom = acGetMonitorBottom(hScreen, 1)
    local iScreenRight = acGetMonitorRight(hScreen, 1)
    local iScreenLeft = acGetMonitorLeft(hScreen, 1)
    
    local iScreenHeight = iScreenBottom - iScreenTop
    local iScreenWidth = iScreenRight - iScreenLeft

    acActivateWindow(hFirstWindow, 0, 0, 0)

    if hFirstWindowTitle == hSecondWindowTitle 
    and cur.gsx >= hFirstWindowLeft 
    and cur.gex <= hFirstWindowRight 
    or hSecondWindowTitle == "" 
     then
        -- Toggle Current Windows Position Center or Semi-Minimize
        local nWinPos = iScreenLeft + iScreenWidth / 8

        acRestoreWindow(hFirstWindow, 0, 0)
        if
            hFirstWindowLeft <= iScreenWidth + nWinPos and
                hFirstWindowLeft ~= nWinPos
         then
            -- Center Window Width75% Height90%
            acMoveWindow(
                hFirstWindow,
                0,
                0,
                nWinPos,
                iScreenTop + iScreenHeight / 20
            )
            acSetWindowSize(
                hFirstWindow,
                0,
                0,
                iScreenWidth - iScreenWidth / 4,
                iScreenHeight - iScreenHeight / 10
            )
        else
            -- Semi-Window 1/3 to the right
            acMoveWindow(
                hFirstWindow,
                0,
                0,
                iScreenLeft + iScreenWidth - iScreenWidth / 3,
                iScreenTop
            )
            acSetWindowSize(hFirstWindow, 0, 0, iScreenWidth / 3, iScreenHeight)
        end
    else
        -- Tile Two Windows side by side
        acRestoreWindow(hFirstWindow, 0, 0)
        acRestoreWindow(hSecondWindow, 0, 0)

        --Move to position
        acActivateWindow(hFirstWindow, 0, 0, 0)
        acMoveWindow(hFirstWindow, 0, 0, iScreenLeft, iScreenTop)
        acMoveWindow(
            hSecondWindow,
            0,
            0,
            iScreenLeft + iScreenWidth / 2,
            iScreenTop
        )

        --Size them accordingly
        local iReserveHeight = 20 -- 20pix reserve, personal favor

        acSetWindowSize(
            hFirstWindow,
            0,
            0,
            iScreenWidth / 2,
            iScreenHeight - iReserveHeight
        )
        acSetWindowSize(
            hSecondWindow,
            0,
            0,
            iScreenWidth / 2,
            iScreenHeight - iReserveHeight
        )
    end
end

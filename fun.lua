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
log(code)
    activate_window(code)
end

-- 执行窗口定位：根据配置文件
function execute_position()
    iWindow = iWindow + 1

    local win = get_config_current()
    if win ~= nil and win.position ~= nil then
        local posList = win.position

        if iWindow > #posList then
            iWindow = 1
        end
        local pos = posList[iWindow]
        acMoveWindow(win.hwnd, 0, 0, pos.x, pos.y)
        acSetWindowSize(win.hwnd, pos.x, pos.y, pos.w, pos.h) --100%
    end
end

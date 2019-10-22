-- 获取桌面大小
-- @return 上下左右
function get_desktop_size()
    local point = acGetMonitorFromPoint(cur.gex, cur.gey)
    local t = acGetMonitorTop(point, 1)
    local b = acGetMonitorBottom(point, 1)
    local l = acGetMonitorLeft(point, 1)
    local r = acGetMonitorRight(point, 1)
    return t, b, l, r
end

-- 当前鼠标位置-水平方向
-- @return  r l t b m
function get_mouse_position_h()
    t, b, l, r = get_desktop_size()
    if cur.gex > (r - gLeftRightMargin) then
        -- 右侧 400
        return "right"
    elseif cur.gex < (gLeftRightMargin - l) then
        -- 右侧 400
        return "left"
    elseif cur.gsy < (t + gTopBottomMargin) then
        -- 顶部
        return "top"
    elseif cur.gey > (b - gTopBottomMargin) then
        -- 底部
        return "bottom"
    else
        -- 中间
        return "mid"
    end
end

-- 当前鼠标位置-垂直方向
-- @return  A B C D
function get_mouse_position_v()
    if cur.gey > 900 then
        return "D"
    elseif cur.gey > 550 and cur.gey < 900 then
        return "C"
    elseif cur.gey > 200 and cur.gey < 550 then
        return "B"
    elseif cur.gey < 200 then
        return "A"
    end
end

-- 根据类名获得句柄，遍历当前打开的窗体
-- param 类名
-- @return 句柄
function get_handle_windows(className)
    acGetAllWindows(1)
    local allwindows = sp_all_windows
    local hwnd = 0
    local temp = ""
    for k, v in pairs(allwindows) do
        local name = acGetClassName(v, 0, 0)
        if string.find(name, "Window") == nil then
            temp = temp .. " " .. name .. ":" .. v
        end
        local r = string.find(name, className)
        if r ~= nil then
            hwnd = v
        end
    end
    -- acMessageBox(temp)
    return hwnd
end

function get_handle_window(name)
    if name == nil then
        error("name is empty")
        return
    end

    local w = 0
    if type(name) == "number" then
        return name
    end

    local win = tWindow[name]
    --判断配置文件是否存在
    if win == nil or win.className == nil then
        error(name .. " config is empty")
        return
    end

    local w = win.hwnd
    if w == 0 or w == nil then
        --acMessageBox(win.className)
        w = acFindWindow(win.className, nil)
        if w == 0 then
            w = get_handle_windows(win.className)
        end
    end

    if w == nil or w == 0 then
        -- 若窗体不存在提示 不做error
        acMessageBox(name .. " window is Not Exist")
    else
        win.hwnd = w
        return w
    end
end

-- 激活窗体
function activate_window_by_handle(w)
    acRestoreWindow(w, 0, 0)
    acActivateWindow(w, 0, 0, 0)
end

function activate_window(name)
    activate_window_by_handle(get_handle_window(name))
end

-- 在屏幕显示信息
function display_message(msg)
    t, b, l, r = get_desktop_size()
    if msg == nil then
        acDisplayText("msg is Empty!", "微软雅黑", 40, 255, 128, 0, 2000, r / 2 - 100, b - 100)
        return
    end
    local charwd = 30

    local msgwd = string.len(msg) * charwd

    -- 根据显示信息量控制显示时长，同时越长信息平均每字显示时间越短
    local delay = 500 + string.len(msg) * 200 * 0.7

    local x = r / 2 - msgwd / 2

    -- 修正在超出边界的情况
    if (x + msgwd) > r then
        x = r - msgwd - 20
    end

    if x < 0 then
        x = 20
    end

    local y = b - 100
    if string.len(msg) > 200 then
        y = b / 2 - charwd * 2
    end

    acDisplayText(msg, "微软雅黑", 40, 255, 128, 0, delay, x, y)
end

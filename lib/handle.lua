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

function get_window_size()
    local t = acGetWindowTop(nil, cur.gex, cur.gey)
    local b = acGetWindowBottom(nil, cur.gex, cur.gey)
    local l = acGetWindowLeft(nil, cur.gex, cur.gey)
    local r = acGetWindowRight(nil, cur.gex, cur.gey)
    return t, b, l, r
end

-- 当前鼠标位置-水平方向
-- @return  r l t b m
function get_mouse_position_h()
    t, b, l, r = get_desktop_size()
    if cur.gex > (r - DESKTOP_RIGHT) then
        -- 右侧 400
        return "right"
    elseif cur.gex < (DESKTOP_LEFT - l) then
        -- 左侧 400
        return "left"
    elseif cur.gsy < (t + DESKTOP_TOP) then
        -- 顶部
        return "top"
    elseif cur.gey > (b - DESKTOP_BOTTOM) then
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
-- param 类名dd
-- @return 句柄
function get_handle_windows(className)
    acGetAllWindows(1)
    local allwindows = sp_all_windows
    clip()
    local hwnd = 0
    local temp = ""
    for k, v in pairs(allwindows) do
        local name = acGetClassName(v, 0, 0)
        if string.find(name, "Window") == nil then
            temp = temp .. "\n" .. name .. ":" .. v
        end
        local r = string.find(name, className)
        if r ~= nil then
            hwnd = v
        end
    end
    --  acMessageBox(temp)
    clip(temp)
    return hwnd
end

function get_handles_name_same_class(name, type)
    acGetAllWindows(0)
    local allwindows = sp_all_windows
    local temp = ""
    for k, v in pairs(allwindows) do
        local _name =
            (type == 0 or type == nil) and acGetClassName(v) or
            acGetWindowTitle(v)

        -- if string.find( _name,name) ~= nil then
        temp = temp .. "\n" .. _name .. ":" .. v
        --   end
    end
    return temp
end

function get_handles_all(flag)
    acGetAllWindows(0)
    local allwindows = sp_all_windows
    local temp = ""
    for k, v in pairs(allwindows) do
        local _name = acGetWindowTitle(v)
        if
            string.len(_name) > 0 and not string.find(_name, "Default IME") and
                not string.find(_name, "MSCTFIME UI") and
                not string.find(_name, "CandidateWindow") and
                not string.find(_name, "Mode Indicator") and
                not string.find(_name, "s_szWBCategoryWindowTitle") and
                not string.find(_name, "MediaContextNotificationWindow") and
                not string.find(_name, "SystemResourceNotifyWindow") and
                not string.find(_name, "LangSelectWindow") and
                not string.find(_name, "notify proxy")
         then
            temp = temp .. "\n" .. _name .. ":" .. v
        end
    end
    return temp
end

-- 获取当前类相同的窗体
-- 通过匹配 file, 再匹配 titile 获取同类窗体
--
function get_handles(title)
    acGetAllWindows(0)
    local allwindows = sp_all_windows
    local handles = {}
    local temp = ""
    local i = 1
    for k, v in pairs(allwindows) do
        local _title = acGetWindowTitle(v)
        --  temp = temp .. "\n" .. _title .. " "
        if string.find(_title, title) ~= nil then
            handles[i] = v
            i = i + 1
        end
    end
    if i == 1 then
        tip("get_handles is null")
    end
    return handles
end

-- 判读配置文件是否正确
-- name 自定义的名称
--@return config
function is_config(name)
    if name == nil or name == "" then
        error("name is empty")
        return false
    end

    local win = tWindow[name]
    --判断配置文件是否存在
    if win == nil or win.className == nil then
        error(name .. " config is empty")
        return false
    end
    return win
end

-- 获取当前窗口的配置 get_config_current
function get_config(hwnd)
    if hwnd == nil then
        hwnd = acGetForegroundWindow()
    end

    local name = acGetExecutableName(hwnd)
    name = string.sub(name, 1, string.len(name) - 4)
    --display_message(name)
    local win = tWindowFile[name]
    -- log(hwnd .. name)

    --clip()
    -- PrintTable(win)
    if win ~= nil then
        win.hwnd = hwnd
    else
        -- log(hwnd .. name)
        --   error("config is error:get_config")
    end
    return win
end

-- 根据配置获取句柄
-- @param win
-- @return 句柄
function get_handle_window(win)
    local w = win.hwnd
    if w == nil or w == 0 then
        if win.file ~= nil then
            -- 从进程中获取
            w = get_handle_file(win.file)
        else
            w = acFindWindow(win.className, nil)
        end
    end

    if w == 0 then
        -- 从打开的程序中获取
        w = get_handle_windows(win.className)
    end

    if (w == nil or w == 0) and win.type ~= 1 then
        -- 若窗体不存在提示 不做error
        acMessageBox("[ " .. win.file .. " ] window is Not Exist")
    else
        win.hwnd = w

        return w
    end
end

-- 根据任务管理器中的[名称],返回句柄
function get_handle_file(file)
    if string.find(string.upper(file), ".EXE") then
    else
        file = file .. ".exe"
    end
    local processID = acGetProcessIDFromPattern(file)
    return acGetWindowFromProcessID(processID)
end

-- 判读hwnd值的有效性
function is_valid_hwnd(hwnd)
    if hwnd == nil or hwnd == 0 then
        return false
    end

    local name = acGetClassName(hwnd)
    if name == "" or name == "SysListView32" then
        return false
    else
        return true
    end
end

-- 激活窗体
function activate_window_by_handle(hwnd, win)
    if not is_valid_hwnd(hwnd) then
        if win ~= nil then
            tip("not [ " .. win.file .. " ]")
        else
            tip("handle error [ " .. (hwnd or ".") .. " ]")
        end
        return
    end

    if win ~= nil and
        string.upper(acGetExecutableName(acGetForegroundWindow())) ==
            (string.upper(win.file) .. ".EXE")
     then
        acMinimizeWindow(hwnd, 0, 0)
    else
        acRestoreWindow(hwnd, 0, 0)
        acActivateWindow(hwnd, 0, 0, 0)
    end
end

function activate_key(key)
    local win = tWindowLetter[string.upper(key)]

    if win.shortcut then
        -- 用快捷的方式激活窗口
        display_message(win.file)
        acSendKeys(win.shortcut)
    else
        if win.file ~= nil then
            -- 从进程中获取
            local w = get_handle_file(win.file)

            activate_window_by_handle(w, win)
        end
    end
end

function activate_window(name)
    display_message("[ " .. name .. " ]")
    local w = 0
    if type(name) == "number" and name ~= 0 then
        w = name
        activate_window_by_handle(w)
    else
        local win = is_config(name)
        if win.shortcut then
            -- 用快捷的方式激活窗口
            display_message(win.file)
            acSendKeys(win.shortcut)
        else
            -- if not is_valid_hwnd(w) and win.type == 1 then
            --     acRunProgram(win.path)
            -- else
            -- end
            w = get_handle_window(win)
            --  clip()
            --  PrintTable(win)
            tip(w)
            activate_window_by_handle(w, win)
        end
    end
    return w
end

function activate_window_by_file(file)
    activate_window_by_handle(get_handle_file(name))
end

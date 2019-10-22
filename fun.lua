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

--获取轮换的窗体的句柄
function qGetToogleHandle()
    iWindow = iWindow + 1

    if iWindow > 3 then
        iWindow = 1
    end

    local code = sWindow[iWindow]

    if type(code) == "number" then
        return code
    end
    --判断配置文件是否正确
    local win = tWindow[code]
    if win == nil then
        return qGetToogleHandle()
    end

    local w = acFindWindow(win.className, nil)

    if w == nil or w == 0 or w == "CiceroUIWndFrame" or w == "SysListView32" then
        gShow(win.className)
        return qGetToogleHandle()
    else
        return w
    end
end

function qExecuteToogle()
    iWindow = iWindow + 1

    if iWindow > 3 then
        iWindow = 1
    end

    local code = sWindow[iWindow]

    if type(code) == "number" then
        qActivate(code)
    else
        qActivateWindow(code)
    end
end



--激活窗体
function qActivateWindow(name)
    if name == nil then
        acMessageBox("qActivateWindow：name is empty")
        return
    end

    local w = 0
    if type(name) == "number" then
        qActivateWindowByHandle(name)
        return
    end

    local win = tWindow[name]
    --判断配置文件是否存在
    if win == nil or win.className == nil then
        acMessageBox(name .. " config is empty")
        return
    end

    local w = win.hwnd
    if w == 0 or w == nil then
        -- acMessageBox(win.className)
        w = acFindWindow(win.className, nil)
        if w == 0 then
            w = get_window_handle(win.className)
        end
    end

    if w == nil or w == 0 then
        acMessageBox(name .. " window is Not Exist")
    else
        win.hwnd = w
        qActivateWindowByHandle(w)
    end
end

--激活窗体
-- code : hnwd classname
function qActivate(code)
    local w = 0
    if type(code) ~= "number" then
        w = acFindWindow(code, nil)
    else
        w = code
    end
    if w == nil or w == 0 then
        acMessageBox("qActivate: " .. code .. " window is Not Exist")
    else
        acRestoreWindow(w, 0, 0)
        acActivateWindow(w, 0, 0, 0)
    end
end

function qActivateWindowByHandle(w)
    acRestoreWindow(w, 0, 0)
    acActivateWindow(w, 0, 0, 0)
end

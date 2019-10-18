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

    local win = tWindow[sWindow[iWindow]]
    if win == nil then
        return qGetToogleHandle()
    end

    local w = acFindWindow(win.className, nil)
    if w == nil or w == 0 or w == "CiceroUIWndFrame" or w == "SysListView32" then
        return qGetToogleHandle()
    else
        return w
    end
end

function qExecuteToogle()
    local w = qGetToogleHandle()

    acRestoreWindow(w, gsx, gsy)
    acActivateWindow(w, gsx, gsy, 0)
end

--激活窗体
function qActivateWindow(win)
    local w = acFindWindow(tWindow[win].className, tWindow[win].title)
    if w == nil or w == 0 then
        acMessageBox("window is not")
    else
        acRestoreWindow(w, gsx, gsy)
        acActivateWindow(w, gsx, gsy, 0)
    end
end

--激活窗体
function qActivateWindowByHandle(w)
    acRestoreWindow(w, gsx, gsy)
    acActivateWindow(w, gsx, gsy, 0)
end

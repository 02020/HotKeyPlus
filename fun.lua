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
    local w = qGetToogleHandle()

    acRestoreWindow(w, 0, 0)
    acActivateWindow(w, 0, 0, 0)
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

function d()
    acSendKeys("^c")
    --先复制要搜索的内容，当然你也可以预先复制，只要不选中内容即可
    acDelay(50)
    --延时50ms
    acSendKeys("^f")
    --查找的快捷键
    acSendKeys("^v")
    --此时输入焦点在搜索框中，我们粘贴即可
    acSendKeys("{DELAY=50}%{ENTER}")
end

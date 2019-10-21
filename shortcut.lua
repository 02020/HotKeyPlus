--- 快速打开 Tim
function ggTim()
    qActivateWindowByHandle(sWinTim)
end

--- 快速打开 微信
function ggwx(...)
    qActivateWindow("wx")
end

--- 获取当前窗体ID 只能写在
function qGetHandleID()
    id = acGetWindowByPoint(cur.gsx, cur.gsy)
    --  acMessageBox(id);
    gShowScreenMessage(id, 1, cur.gsx, cur.gsy)
    acSetClipboardText(id)
end

function qGetHandleClass(...)
    id = acGetWindowByPoint(cur.gsx, cur.gsy)
    w = acGetClassName(id, cur.gsx, cur.gsy)

    gShowScreenMessage(w, 1)daiacSetClipboardText(w)
end

function dddd(...)
    -- body
    local tp = acGetWindowTop(nil, gsx, gsy)

    gShowScreenMessage(tp, 1, gsx, gsy)

    if gsy < (tp + gTopBottomMargin) then
        -- 如果是在程序窗口顶栏进行操作
        gShowScreenMessage("重做", 1, gsx, gsy)
        acSendKeys("^y")
    else
        -- 空格
        gShowScreenMessage("空格", 2, gsx, gsy)
        acSendKeys(" ")
    end
end

------------------------------------------------------ vs
-- 粘贴内容到[解决方案管理器]中执行查询
function qvsFindFile()
    acSendKeys("^%l")
    acDelay(100)
    acMouseClick(1200, 140, 2, 1, 1)
    acSendKeys("^v")
    acDelay(50)
    acSendKeys("{ENTER}")
    acDelay(50)
    acMouseMove(cur.gsx, cur.gsy)
end

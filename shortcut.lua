--- 快速打开 Tim
function ggTim()
    qActivateWindowByHandle(sWinTim)
end

--- 快速打开 微信
function ggwx(...)
    qActivateWindow("wx")
end




 

function qGetHandleClass(...)
    -- body

    --gShowScreenMessage("复制", 1, gsx, gsy)
    --acSendKeys("^c")
    id = acGetWindowByPoint(cur.gsx, cur.gsy)
    w = acGetClassName(id, cur.gsx, cur.gsy)

    gShowScreenMessage(id, 1, cur.gsx, cur.gsy)
    acSetClipboardText(id)

    --gShowScreenMessage(w, 1, gsx, gsy)

    --获取当前窗体的类名到剪贴板
    --acSetClipboardText(w)

    --acShowActions()
    --
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

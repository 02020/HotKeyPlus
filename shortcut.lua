--- 快速打开 Tim
function ggTim()
    activate_window(sWinTim)
end

--- 快速打开 微信
function ggwx()
    activate_window("wx")
end

--- 获取当前窗体-句柄ID
function qGetHandleID()
    id = acGetWindowByPoint(cur.gsx, cur.gsy)
    display_message(id, 1, cur.gsx, cur.gsy)
    acSetClipboardText(id)
end
--- 获取当前窗体-类名
function qGetHandleClass()
    id = acGetWindowByPoint(cur.gsx, cur.gsy)
    w = acGetClassName(id, cur.gsx, cur.gsy)
    display_message(w, 1)
    acSetClipboardText(w)
end

function dddd()
  --  acSendKeys("^v")
  acMouseClick(cur.gex, cur.gey, 2, 1, 1)
  acSendKeys("{F_2}")
  acDelay(10)
  acSendKeys("^c")
  local  v = acGetClipboardText()
  display_message(v, 1,cur.gsx, cur.gsy)

  acSendKeys("{ENTER}")
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

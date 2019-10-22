--- 获取桌面大小，返回上下左右
function lGetPosition()
    local point = acGetMonitorFromPoint(cur.gex, cur.gey)
    local b = acGetMonitorBottom(point, 1)
    local t = acGetMonitorTop(point, 1)
    local r = acGetMonitorRight(point, 1)
    local l = acGetMonitorLeft(point, 1)
    return {t = t, b = b, r = r, l = l}
end

function lGetMousePosition()
    local pos = lGetPosition()
    if cur.gex > (pos.r - gLeftRightMargin) then
        -- 右侧 400
        return "right"
    elseif cur.gsy < (pos.t + gTopBottomMargin) then
        -- 顶部
        return "top"
    elseif cur.gey > (pos.b - gTopBottomMargin) then
        -- 底部
        return "bottom"
    else
        -- 中间
        return "mid"
    end
end

--返回当前鼠标垂直方向上的位置
function lGetMousePositionV()
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


-- 根据类名获得句柄
-- param 类名
-- return 句柄
function get_window_handle(className)
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
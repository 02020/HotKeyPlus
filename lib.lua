--- 获取桌面大小，返回上下左右
function lGetPosition()
    local point = acGetMonitorFromPoint(cur.gsx, cur.gsy)
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




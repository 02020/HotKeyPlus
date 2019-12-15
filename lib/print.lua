function clip(param)
    if param == nil or param == 0 then
        acSetClipboardText()
    elseif param == "__" then
    else
        param =  acGetClipboardText() .. param .. "\n"
        acSetClipboardText(param)
    end
    return param
end

-- 调用win10通知
function tip(content, title, level)
    if string.len(content) > 60 then
        content = string.sub(content, 0, 58) .. "..."
        acDisplayBalloonTip(
            title or os.date("%Y-%m-%d %H:%M"),
            content,
            level or 1,
            0
        )
    end
end

-- 在屏幕显示信息
function display_message(msg)
    t, b, l, r = get_desktop_size()
    if msg == nil then
        acDisplayText(
            "msg is Empty!",
            "微软雅黑",
            40,
            255,
            128,
            0,
            2000,
            r / 2 - 100,
            b - 100
        )
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

    local y = b - (string.find(msg, "\n") ~= nil and 100 or 30)
    if string.len(msg) > 200 then
        y = b / 2 - charwd * 2
    end

    acDisplayText(msg, FONT, 30, 255, 128, 0, delay, x, y)
end

---
-- @function: 打印table的内容，递归
-- @param: tbl 要打印的table
-- @param: level 递归的层数，默认不用传值进来
-- @param: filteDefault 是否过滤打印构造函数，默认为是
-- @return: return
function PrintTable(tbl, level, filteDefault)
    local msg = ""
    filteDefault = filteDefault or true --默认过滤关键字（DeleteMe, _class_type）
    level = level or 1
    local indent_str = ""
    for i = 1, level do
        indent_str = indent_str .. "  "
    end

    clip(indent_str .. "{")
    for k, v in pairs(tbl) do
        if filteDefault then
            if k ~= "_class_type" and k ~= "DeleteMe" then
                local item_str =
                    string.format(
                    "%s%s = %s",
                    indent_str .. " ",
                    tostring(k),
                    tostring(v)
                )
                clip(item_str)
                if type(v) == "table" then
                    PrintTable(v, level + 1)
                end
            end
        else
            local item_str =
                string.format(
                "%s%s = %s",
                indent_str .. " ",
                tostring(k),
                tostring(v)
            )
            clip(item_str)
            if type(v) == "table" then
                PrintTable(v, level + 1)
            end
        end
    end
    clip(indent_str .. "}")
end

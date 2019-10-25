office = {}
excel = {}
function excel:top()
    display_message("t")
end
-- 向右
function excel:right()
 
    t, b, l, r = get_window_size()
    if cur.gsy < (t + DESKTOP_TOP) then
        -- 在程序窗口顶栏进行操作，重做
        display_message("again")
        acSendKeys("^y")
    elseif cur.gey > (b - DESKTOP_BOTTOM) then
        --
        -- 在程序窗口底栏进行操作，单元格合并
        display_message("merge")
        acSendKeys("%")
        acSendKeys("hmm")
    elseif cur.gex > (r - DESKTOP_RIGHT) then
        -- 拖到屏幕的右栏，右对齐
        display_message("right align")
        acSendKeys("%h")
        acSendKeys("ar")
    else
        -- 空格
        display_message("space")
        acSendKeys(" ")
    end
end
-- 向左
function excel:left()
 
    t, b, l, r = get_window_size()

    if cur.gsy < (t + DESKTOP_TOP) then
        -- 在程序窗口顶栏进行操作，撤消
        display_message("ctrl+z")
        acSendKeys("^z")
    elseif cur.gey > (b - DESKTOP_BOTTOM) then
        -- 在程序窗口底栏进行操作，取消单元格合并
        display_message("unmerge")
        acSendKeys("%")
        acSendKeys("hmu")
    elseif cur.gex < (l + DESKTOP_LEFT) then
        -- 拖到屏幕的左栏，左对齐
        display_message("left align")
        acSendKeys("%h")
        acSendKeys("al")
    else
        -- 退格
        --  display_message("BACKSPACE")
        acSendKeys("{BACKSPACE}")
    end
end

function excel:bottom()
    display_message("b")
end

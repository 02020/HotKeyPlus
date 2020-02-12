------------------------------------------------------Ctrl

qCtrl = {}
------------------------------------------------------Ctrl 上
function qCtrl:Up()
    acSendKeys("^+T") 
end

------------------------------------------------------Ctrl 下
function qCtrl:Down()
    activate_window("wx")
end
------------------------------------------------------Ctrl 左
function qCtrl:Left()
    display_message("Ctrl:Left")
end
------------------------------------------------------Ctrl 右
function qCtrl:Right()
    display_message("Ctrl:Right")

    t, b, l, r = get_window_size()
    if cur.gey < (t + 40) and cur.gey > t then
        display_message("Ctrl:Right:title")


        local win = get_config()
      
        local w = {}
        if win ~= nil and win.title ~= nil then
            -- clip()
            -- 
            w = get_handles(win.title)
            PrintTable(w)
            local i = #tWindowToogle + 1
            for k, v in pairs(w) do
                tWindowToogle[i] = v
                i = i + 1
            end
        else
            display_message("funArrow:title is null")
        end
    else
       -- local temp = get_handles_all(1)
       -- acSetClipboardText(temp)
    end
end

------------------------------------------------------

------------------------------------------------------Shift

qShift = {}
------------------------------------------------------Shift 上

function qShift:Up()
    display_message("Shift:Up")
end

------------------------------------------------------Shift 下
function qShift:Down()
    display_message("Shift:Down")
end

------------------------------------------------------Shift 左
function qShift:Left()
    display_message("Shift:Left")
end

------------------------------------------------------Shift 右
function qShift:Right()
    display_message("Shift:right")
end

------------------------------------------------------

------------------------------------------------------Alt

qAlt = {}
------------------------------------------------------Alt 上

function qAlt:Up()
    display_message("Alt:Up")
end
------------------------------------------------------Alt 下
function qAlt:Down()
    display_message("Alt:Down")
end
------------------------------------------------------Alt 左
function qAlt:Left()
    display_message("Alt:Left")
end
------------------------------------------------------Alt 右
function qShift:Right()
    qAlt("Alt:right")
end

------------------------------------------------------

------------------------------------------------------CtrlShift

qCtrlShift = {}
------------------------------------------------------CtrlShift 上
function qCtrlShift:Up()
    qGetHandleID()
end

------------------------------------------------------CtrlShift 下
function qCtrlShift:Down()
end
------------------------------------------------------CtrlShift 左
function qCtrlShift:Left()
    display_message("Ctrl:Left")
    execute_position()
end
------------------------------------------------------CtrlShift 右
function qCtrlShift:Right()
    display_message("Ctrl:Right")
            local temp = get_info()
        display_message(temp)
        acSetClipboardText(temp)
end

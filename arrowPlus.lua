------------------------------------------------------Ctrl

qCtrl = {}
------------------------------------------------------Ctrl 上
function qCtrl:Up()
    -- acSendKeys("^+T")
    position_window_ctrl()
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
    acSendKeys("@{F_2}")
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
    local temp = get_info()
    tip(temp)
    acSetClipboardText(temp)
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
    execute_position(1)
end


_MButton={}

function _MButton:Up()
     display_message("_MButton:Up")
       acSendKeys("^@{F_1}")
end

function _MButton:Right()
     display_message("_MButton:Right")
       acSendKeys("^@{F_3}")
end

function _MButton:Left()
     display_message("_MButton:Left")
       acSendKeys("^@{F_7}")
end

function _MButton:Down()
     display_message("_MButton:Down")
       acSendKeys("^@{F_9}")
end


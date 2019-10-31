------------------------------------------------------Ctrl 上
qCtrl = {}

function qCtrl:Up()
    qGetHandleID()
    --  funUp[get_mouse_position_h()]()
end

------------------------------------------------------Ctrl 下
function qCtrl:Down()
    --clip()
    --activate_window(132952)

    -- v = acFindWindowByTitleRegex("[Visual%sStudio%sCode]+")
    -- pair = "name = Anna"
    -- firstidx, lastidx, key, value = string.find(pair, "(%a+)%s*=%s*(%a+)")
    local position = is_config("vs").position
    x, y, w, h = position[1]
    display_message(position[1][1].. position[2][1].. position[3][1])
    --v= string.match('arrowPlus.lua - lua - Visual Studio Code [管理员]:133012', '[Visual Studio Code]+')
    --display_message(firstidx.. "+".. lastidx.. "+".. key.. "+".. value )
    --funUp[get_mouse_position_h()]()
end
------------------------------------------------------Ctrl 左
function qCtrl:Left()
    display_message("Ctrl:Left")
    execute_position() 
end
------------------------------------------------------Ctrl 右
function qCtrl:Right()
    --funRight[get_mouse_position_h()]()

    display_message("Ctrl:Right")
    --  acSendKeys("^{F_6}")

    -- test2()
    local temp = get_handles_all(1)
    acSetClipboardText(temp)
end

------------------------------------------------------Shift 上
qShift = {}

function qShift:Up()
    funUp[get_mouse_position_h()]()
end

function qShift:Down()
    funUp[get_mouse_position_h()]()
end

function qShift:Left()
    display_message("Shift:Left")
    --  funLeft[get_mouse_position_h()]()
end

function qShift:Right()
    display_message("right")
end

function test2()
    -- 获取当前
    local name = acGetExecutableName(acGetForegroundWindow())
    local win = tWindowFile[name]
    local v = win.title
    local handles = get_handles(v)
    local temp = get_handles_name_same_class(v, 1)

    acSetClipboardText(temp)
    iWindow = iWindow + 1
    if iWindow > #handles then
        iWindow = 1
    end

    local code = handles[iWindow]
    local a = acGetExecutableName(code)
    display_message(a)
    activate_window(code)
end

-- HwndWrapper
-- Chrome_RenderWidgetHostHWND

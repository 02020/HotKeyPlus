aliencore = alien.core

user32 = aliencore.load("user32.dll")

gGetAncestor = user32.GetAncestor

gGetAncestor:types {ret = "long", abi = "stdcall", "long", "uint"}

GA_PARENT = 1

GA_ROOT = 2

GA_ROOTOWNER = 3

-- 屏幕信息显示级别

-- 0：都不显示提示

-- 1：显示关键操作提示

-- 2：显示所有操作提示

gScreenMsgLevel = 1

-- 上下边栏高度

gTopBottomMargin = 300

-- 左右边栏宽度

gLeftRightMargin = 400

function sp_init()
    -- code in this function is fired once when the Lua engine is reloaded

    -- which occurs when S+ is started, Ok/Apply is clicked in the settings window

    -- or when Reload Config and Lua Engine is clicked from the tray menu

    gTopBottomMargin = acGetMonitorBottom(acGetMonitorFromPoint(gsx, gsy), 1) / 16

    gLeftRightMargin = acGetMonitorRight(acGetMonitorFromPoint(gsx, gsy), 1) / 16
end

-- 在屏幕显示信息
function gShow(msg)
    gShowScreenMessage(msg, 1, cur.gsx, cur.gsy)
end

function gShowScreenMessage(msg, level, mx, my)
    if type(msg) == nil or type(msg) == "nil" then
        acMessageBox(type(msg))
        -- acDisplayText("nil", "微软雅黑", 40, 255, 128, 0, 600, 1200,600)
        return
    end

    local point = acGetMonitorFromPoint(mx, my)
    local rt = acGetMonitorRight(point, 1)
    local bt = acGetMonitorBottom(point, 1)

    local charwd = 30
    -- local msgwd = 10
    --   local delay = 300

    local msgwd = string.len(msg) * charwd

    -- 根据显示信息量控制显示时长，同时越长信息平均每字显示时间越短
    local delay = string.len(msg) * 200 * 0.7

    if mx == nil then
        mx = 1200
    end
    local tx = mx - msgwd / 2

    local ty = bt / 2 - charwd * 2

    -- 修正在超出边界的情况

    if (tx + msgwd) > rt then
        tx = rt - msgwd - 20
    end

    if tx < 0 then
        tx = 20
    end

    -- 根据显示信息级别显示

    if level <= gScreenMsgLevel then
        acDisplayText(msg, "微软雅黑", 40, 255, 128, 0, delay, tx, ty)
    end
end

function sp_before_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact)
    -- this code is fired before each action (excluding hotkey actions)

    -- 先激活手势开始时所在窗口

    acActivateWindow(aGetAncestor(acGetWindowByPoint(gsx, gsy), GA_ROOT), 0, 0)
end

function aGetAncestor(iWnd, iFlags)
    return gGetAncestor(iWnd, iFlags)
end

function sp_after_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact)
    -- this code is executed after each action (excluding hotkey actions)
    -- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow After Action Script*
end

function sp_middle_mouse_down()
    -- this code is executed whenever you press the middle mouse button down
    -- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow Middle Click Script*
end

function sp_after_release()
    -- this code is executed whenever you release the stroke button
    -- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow After Release Script*
end

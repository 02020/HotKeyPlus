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

function sp_init()
    -- code in this function is fired once when the Lua engine is reloaded
    -- which occurs when S+ is started, Ok/Apply is clicked in the settings window
    -- or when Reload Config and Lua Engine is clicked from the tray menu
end

function aGetAncestor(iWnd, iFlags)
    return gGetAncestor(iWnd, iFlags)
end

function sp_before_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact)
    -- this code is fired before each action (excluding hotkey actions)
    cur = {gsx = gsx, gsy = gsy, gex = gex, gey = gey}
    -- 先激活手势开始时所在窗口
    acActivateWindow(aGetAncestor(acGetWindowByPoint(gsx, gsy), GA_ROOT), 0, 0)
end

function sp_after_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact)
    -- this code is executed after each action (excluding hotkey actions)
    -- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow After Action Script*
end

function sp_middle_mouse_up(x, y, fwKeys)
    -- acSendWinDown()
    -- acSendControlDown()
    -- acSendShiftDown()
    -- acDelay(500)
    -- acSendWinUp()
    -- acSendControlUp()
    -- acSendShiftUp()
    --your code here
    -- x = the x coordinate of the mouse where the middle button was clicked
    -- y = the y coordinate of the mouse where the middle button was clicked
    -- fwKeys = the key state at the time the middle button was pressed
end

mbLastTime = os.time()
function sp_x2_mouse_up(x, y, fwKeys)
    -- mbTime = os.time()
    -- time = mbTime - mbLastTime
    -- message(time)
    -- if time < 1 then
    --     acSendKeys("^")
    --     acDelay(50)
    --     acSendKeys("^")
    -- else
    --     mbLastTime = os.time()
    -- end
end

function sp_after_release()
    -- this code is executed whenever you release the stroke button
    -- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow After Release Script*
end

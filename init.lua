--sWindow = {"notepad", "google", "dopus"}
cur = {} --当前鼠标位置
sWinTim = 661658

--sWindow = {"vscode", "google"}
sWindow = {"g", "f"}

lastHwnd = 0
--招拍挂
--sWindow = {"navicat", "ie"}

DESKTOP_TOP = 200
DESKTOP_BOTTOM = 200
DESKTOP_LEFT = 200
DESKTOP_RIGHT = 400

require("config")
require("sp")
require("lib.handle")
require("lib.print")
require("lib.file")
require("fun")
require("arrow")
require("arrowPlus")
require("office")
require("sign")
require("shortcut")

tWindowFile = {}
tWindowLetter = {}
tWindowHand = {}
tWindowToogle= {}
for key, value in pairs(tWindow) do
    if value.file then
        if tWindowFile[value.file] ~= nil then
            acMessageBox(value.file .. "error")
        else
            tWindowFile[value.file] = value
        end
    end

    -- if value.letter then
    --     tWindowLetter[string.upper(value.letter)] = value
    -- end
end


-- local t0 = socket.gettime()
--  -- do something
--  local t1 = socket.gettime()

--  message(t0)
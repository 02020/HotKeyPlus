--sWindow = {"notepad", "google", "dopus"}
cur = {} --当前鼠标位置
sWinTim = 661658

sWindow = {"vs", "google"}

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
tWindowToogle= {}
for key, value in pairs(tWindow) do
    if value.file then
        if tWindowFile[value.file] ~= nil then
            acMessageBox(value.file .. "error")
        else
            tWindowFile[value.file] = value
        end
    end
end
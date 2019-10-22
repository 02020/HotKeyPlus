

--激活窗体
-- code : hnwd classname
function qActivate(code)
    local w = 0
    if type(code) ~= "number" then
        w = acFindWindow(code, nil)
    else
        w = code
    end
    if w == nil or w == 0 then
        acMessageBox("qActivate: " .. code .. " window is Not Exist")
    else
        acRestoreWindow(w, 0, 0)
        acActivateWindow(w, 0, 0, 0)
    end
end

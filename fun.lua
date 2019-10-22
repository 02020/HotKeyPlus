iWindow = 0

function qGetTooleInt()
    for key, value in pairs(tWindow) do
        local w = acFindWindow(value.className, nil)

        if w == nil or w == 0 then
            acRunProgram(value.path, 0, 0, 100, 500, 2)
        else
            acRestoreWindow(w, gsx, gsy)
            acActivateWindow(w, gsx, gsy, 0)
        end
    end
end

-- 轮换窗体
function qExecuteToogle()
    iWindow = iWindow + 1

    if iWindow > #sWindow then
        iWindow = 1
    end

    local code = sWindow[iWindow]

    activate_window(code)
end
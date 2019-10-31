function qSignA()
    display_message("A")
end

function qSignB()
    display_message("B")
 
end

function qSignC()
    display_message("C")
    activate_window("doc")
 
end

function qSignD()
   -- 不使用
end

function qSignO()
    display_message("O")
     -- 不使用

end

function qSignP()
    display_message("p")
 --   acSendKeys("^p")
    acReloadConfig()
end

function qSignR()
    display_message("R")    
      -- 不使用
end

function qSignS()
    local bt = acGetMonitorBottom(acGetMonitorFromPoint(cur.gsx, cur.gsy), 1)
    local tp = acGetWindowTop(nil, cur.gsx, cur.gsy)

    if cur.gey > (bt - DESKTOP_BOTTOM) then
        -- 拖到屏幕底栏，另存为
        display_message("save as")
        acSendKeys("^+s")
    else
        -- 直接保存
        display_message("save")
        acSendKeys("^s")
    end
end

function qSignV()
    display_message("@V")
 
end


function qSignX()
    display_message("X")
    acDisableNext()
end



------------------------------------------------------ 其他符号

-- ^
function qSignUp()
    display_message("^")
 
end

-- ↓↖
function qSignExit()
    display_message("Exit")
    acSendKeys("%{F_4}")    
end

-- >  
function qSignRightLeft()
    display_message("F")
    display_message("Find", 1, gsx, gsy)
acSendKeys("^+f")

end

function qSignUpRight()
    display_message("剪切", 1, gsx, gsy)
    acSendKeys("^x")
end

--」
function qSignDownLeft()
    display_message("反L")
    display_message("Enter", 2, gsx, gsy)
    acSendKeys("{ENTER}")
end

-- ←↑→↓↔↕↖↗↘↙
--[[
    ∠「
]]
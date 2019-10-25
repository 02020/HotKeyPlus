--- 鼠标的四个方向 正

------------------------------------------------------ 向上
funUp={}
function funUp:top(  )
    display_message("t", 1,cur.gsx, cur.gsy)
end

function funUp:right(  )
    display_message("r", 1,cur.gsx, cur.gsy)
end

function funUp:left(  )
    display_message("l", 1,cur.gsx, cur.gsy)
end

function funUp:bottom(  )
    display_message("b")
end
function funUp:mid( )
  -- qGetHandleID()
    --显示窗体
    acSendKeys("@g")
  --activate_window("rolan")    
  --local hwnd = get_handle_window("rolan");
--   hwnd =1530174
--  name =  acGetClassName(hwnd) 
--  acMessageBox(name)
end

------------------------------------------------------ 向下
funDown={}
function funDown:top(  )
    display_message("re", 1, gsx, gsy)
    --acSendKeys("{F_5}")
end

function funDown:right(  )
    display_message("r", 1,cur.gsx, cur.gsy)
end

function funDown:left(  )
    display_message("l", 1,cur.gsx, cur.gsy)
end

function funDown:bottom(  )
    display_message("select all", 1, gsx, gsy)
     --   acSendKeys("^a")
end
function funDown:mid(  )
    display_message("ctrl+v", 2, gsx, gsy)
  --  acSendKeys("^v")
end

------------------------------------------------------ 向右
--- 粘贴、刷新、全选
funRight={}
funRightV={}
function funRight:top(  )
    display_message("re", 1, gsx, gsy)
  --  acSendKeys("{F_5}")
end

function funRightV:A()
    activate_window("notepad")    
end
function funRightV:B()
    activate_window("vs")
end
function funRightV:C()
    activate_window("vscode")    
end
function funRightV:D()

end
function funRight:right()
   local x =  get_mouse_position_v()
   funRightV[x]()
end



function funRight:left(  )
    display_message("l", 1,cur.gsx, cur.gsy)
end

function funRight:bottom(  )
    display_message("select all", 1, gsx, gsy)
    --    acSendKeys("^a")
end
function funRight:mid(  )
    qExecuteToogle()

end
--五个区域

------------------------------------------------------ 向左  
-- 撤销 退格
funLeft={}
function funLeft:top(  )
    display_message("ctrl + z", 1, gsx, gsy)
    acSendKeys("^z")
end

function funLeft:right(  )
  
 

end

function funLeft:left(  )
    display_message("l", 1,cur.gsx, cur.gsy)
end

function funLeft:bottom(  )
   -- display_message("BACKSPACE", 2, gsx, gsy)
   -- acSendKeys("{BACKSPACE}")
end
function funLeft:mid(  )
 
end


------------------------------------------------------ 

function qUp()
    funUp[get_mouse_position_h()]();
 end
 
 function qDown()
     funUp[get_mouse_position_h()]();
 end
 
function qLeft()
    funLeft[get_mouse_position_h()]();
 end
 
 function qRight()
     funRight[get_mouse_position_h()]();
 end
 





 -----  斜箭头
 ---  屏幕的四个区域
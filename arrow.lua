--- 鼠标的四个方向 正

------------------------------------------------------ 向上
funUp={}
function funUp:top(  )
    gShowScreenMessage("t", 1,cur.gsx, cur.gsy)
end

function funUp:right(  )
    gShowScreenMessage("r", 1,cur.gsx, cur.gsy)
end

function funUp:left(  )
    gShowScreenMessage("l", 1,cur.gsx, cur.gsy)
end

function funUp:bottom(  )
    gShowScreenMessage("b", 1,cur.gsx, cur.gsy)
end
function funUp:mid( )
    qGetHandleID()
    --显示窗体
    acShowActions()
end

------------------------------------------------------ 向下
funDown={}
function funDown:top(  )
    gShowScreenMessage("re", 1, gsx, gsy)
    acSendKeys("{F_5}")
end

function funDown:right(  )
    gShowScreenMessage("r", 1,cur.gsx, cur.gsy)
end

function funDown:left(  )
    gShowScreenMessage("l", 1,cur.gsx, cur.gsy)
end

function funDown:bottom(  )
    gShowScreenMessage("select all", 1, gsx, gsy)
        acSendKeys("^a")
end
function funDown:mid(  )
    gShowScreenMessage("ctrl+v", 2, gsx, gsy)
    acSendKeys("^v")
end

------------------------------------------------------ 向右
--- 粘贴、刷新、全选
funRight={}
funRightV={}
function funRight:top(  )
    gShowScreenMessage("re", 1, gsx, gsy)
    acSendKeys("{F_5}")
end

function funRightV:A()
    qActivateWindow("notepad")    
end
function funRightV:B()
    qActivateWindow("vs")
end
function funRightV:C()
    qActivateWindow("vscode")    
end
function funRightV:D()
end
function funRight:right()
   local x =  lGetMousePositionV()
   funRightV[x]()
end

function funRight:left(  )
    gShowScreenMessage("l", 1,cur.gsx, cur.gsy)
end

function funRight:bottom(  )
    gShowScreenMessage("select all", 1, gsx, gsy)
        acSendKeys("^a")
end
function funRight:mid(  )
    qExecuteToogle()

end
--五个区域

------------------------------------------------------ 向左  
-- 撤销 退格
funLeft={}
function funLeft:top(  )
    gShowScreenMessage("撤消", 1, gsx, gsy)
    acSendKeys("^z")
end

function funLeft:right(  )
  
 

end

function funLeft:left(  )
    gShowScreenMessage("l", 1,cur.gsx, cur.gsy)
end

function funLeft:bottom(  )
    gShowScreenMessage("退格", 2, gsx, gsy)
    acSendKeys("{BACKSPACE}")
end
function funLeft:mid(  )
 
end




function qUp()
    funUp[lGetMousePosition()]();
 end
 
 function qDown()
     funUp[lGetMousePosition()]();
 end
 
function qLeft()
    funLeft[lGetMousePosition()]();
 end
 
 function qRight()
     funRight[lGetMousePosition()]();
 end
 





 -----  斜箭头
 ---  屏幕的四个区域
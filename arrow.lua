--- 鼠标的四个方向 正

--- 向上
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
function funUp:mid(  )
    gShowScreenMessage("m", 1,cur.gsx, cur.gsy)
end

--- 向下
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

--- 向右
funRight={}
function funRight:top(  )
    gShowScreenMessage("re", 1, gsx, gsy)
    acSendKeys("{F_5}")
end

function funRight:right(  )
    gShowScreenMessage("r", 1,cur.gsx, cur.gsy)
end

function funRight:left(  )
    gShowScreenMessage("l", 1,cur.gsx, cur.gsy)
end

function funRight:bottom(  )
    gShowScreenMessage("select all", 1, gsx, gsy)
        acSendKeys("^a")
end
function funRight:mid(  )
    gShowScreenMessage("ctrl+v", 2, gsx, gsy)
    acSendKeys("^v")
end


-- 向左  --五个区域
funLeft={}
function funLeft:top(  )
    gShowScreenMessage("re", 1, gsx, gsy)
    acSendKeys("{F_5}")
end

function funLeft:right(  )
    gShowScreenMessage("r", 1,cur.gsx, cur.gsy)
end

function funLeft:left(  )
    gShowScreenMessage("l", 1,cur.gsx, cur.gsy)
end

function funLeft:bottom(  )
    gShowScreenMessage("select all", 1, gsx, gsy)
        acSendKeys("^a")
end
function funLeft:mid(  )
    gShowScreenMessage("ctrl+v", 2, gsx, gsy)
    acSendKeys("^v")
end




function qUp()
    funUp[lGetMousePosition()]();
 end
 
 function qDown(bt, tp)
     funUp[lGetMousePosition()]();
 end
 
function qLeft()
    funLeft[lGetMousePosition()]();
 end
 
 function qRight(bt, tp)
     funRight[lGetMousePosition()]();
 end
 





 -----  斜箭头
 ---  屏幕的四个区域
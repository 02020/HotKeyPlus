# HotKeyPlus

StrokesPlus.lua 文件格式需要处理 git 支持 UTF-8 格式 
文件尾部空格要删除



`acGetWindowByPoint`  只能写在程序中





在搜狗浏览器中acSendKeys("^{F_4}")一直不成功，换成了 
acSendControlDown() 
acSendKeys("{DELAY=50}{F_4}") 
acSendControlUp() 
就能正常执行了。 
记住,Down之后一定要Up，否则键盘的状态将一直是这个键被按下的状态。 
除了ctrl之外，还有 
acSendAltDown()和acSendAltUp()      Alt键 
acSendShiftDown和acSendShiftUp()   Shift键 
acSendWinDown()和acSendWinUp()   Windows键 




在S+中，是这样表示一些特殊按键的。 
下面是对照表： 
    @ = Windows键 
    + = SHIFT 
    ^ = CTRL 
    % = ALT 
    {F_1}=F1 
    当中类推 
    {F_9}=F9 
    {F10}=F10 
    当中类推 
    {F12}=F12 
    {AT}=@ 
    {PLUS} = + 
    {CARET} = ^ 
    {PERCENT} = % 
    {ENTER}
    
所以ctrl+w就可以表示成^w，整个写法就是acSendKeys("^w")了，ctrl+shift+alt+h就可以表示成(^+%h)了，其他写法类推。 

# HotKeyPlus

StrokesPlus.lua 文件格式需要处理 git 支持 UTF-8 格式 
文件尾部空格要删除

firefox.exe|iexplore.exe|opera.exe|360se.exe|vivaldi.exe

`acGetWindowByPoint`  只能写在程序中

### 常用函数

`acGetClipboardText`
`acSetClipboardText`
`acGetForegroundWindow` 获取当前窗体

`acKillDisplayText`
`acMaximizeWindow`
`acMaximizeOrRestoreWindow`

`acNextApplication`   不生效
`acPreviousApplication`

`acFindWindowByTitleRegex`
`acFindWindow`

`acFitWindowToScreen`
``

`acGetAllWindows`
``
``
`acGetClassName`
``
``
``
``
``
``
``
``
``
``
``
``
``
``
``
``



几种情况
`className` 不固定，可以使用acFindWindow方法
列表：vs

`className` 固定，使用acFindWindow方法，无法返回数据
列表：google, vivaldi, vscode 



``` 代码暂存
(\[\d*\] )*Total Commander .*|.* - Eclipse
```


#### 浏览器
 


https://github.com/wo52616111/capslock-plus

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

acSendKeys("{DELAY 5000}")
acRunProgram

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

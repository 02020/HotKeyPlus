

#### 比较常用的文本操作快捷键如下：
Capslock+E / D / S / F（上 / 下 / 左 / 右）
Capslock+I / K / J / L（上 / 下 / 左 / 右选中文字）
Capslock+w / r（向左 / 右删除文字）
Capslock+A / G（光标向左 / 右跳一个单词，对英文、代码特别有用）
Capslock+; / P（移动光标至行首 / 行末）
Capslock+U / O（选中光标至行首 / 行末文字）
Capslock+Backspace（删除光标所在行所有文字）
Capslock+Enter（无论光标是否在行末都能新起一个换行而不截断原句子）


#### 用键盘控制多个窗口，实现群组切换
1. 切换到你希望要绑定的窗口
1. 按下 Capslock+ Alt + (1~8 / `) 时要「连续按两次」（意思是双击1~8或`之中的任意一键）
1. 换到别的窗口，重复1、2步绑定到同一个按键
1. 通过 Capslock+ (1~8 / `) 来切换或最小化窗口
1. 连续按三次 同一款软件有多个窗口


#### 翻译
Capslock+T 调用了有道翻译的 API，实现了联网翻译的功能：



#Include lib\lib_bindWins.ahk

;winbind-------------
keyFunc_winbind_activate(n){
    global
    activateWinAction(n)
    return
}


keyFunc_winbind_binding(n){
    global
    if(tapTimes[n]=="")
        initWinsInfos(n)
    tapTimes(n)
    return
}


MButton & 1::
  keyFunc_winbind_binding(1)
return


MButton & 2::
  keyFunc_winbind_activate(1)
return

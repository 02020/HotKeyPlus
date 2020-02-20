; if not A_IsAdmin ;running by administrator
; {
;    Run *RunAs "%A_ScriptFullPath%" 
;    ExitApp
; }

IfExist, CapsLockPlusIcon.ico
{
    ;freezing icon
    menu, TRAY, Icon, CapsLockPlusIcon.ico, , 1
}
Menu, Tray, Icon,,, 1

global CLversion:="Version: 1.0.1" 

global CLSets:={} ;保存Capsock+settings.ini的各种设置
global CLUserKeys:={}
CLSets.length:={} ;保存settings.ini中每个字段的关键词数量
sectionValue:="Keys"

IniRead, settingsKeys, CapsLockPlusSettings.ini, %sectionValue%, , %A_Space%
settingsKeys:=RegExReplace(settingsKeys, "m`n)=.*$")
keyArr:=StrSplit(settingsKeys,"`n")
tempLen:=CLSets.length[sectionValue]
if tempLen is not number ;如果还没初始化过
{
    CLSets[sectionValue]:={}
    _clsetsSec:=CLSets[sectionValue]
    CLSets.length[sectionValue]:=0
    
    for key,keyValue in keyArr
    {
        IniRead, setValue, CapsLockPlusSettings.ini, %sectionValue%, %keyValue%, %A_Space%
        
        _clsetsSec[keyValue]:=setValue
        CLUserKeys[keyValue]:=setValue
        CLSets.length[sectionValue]++
    }
}

gosub, bindWinsInit

#include lib
#include lib_keysFunction.ahk
#include lib_keysSet.ahk

;有道翻译
#Include lib_ydTrans.ahk  
#Include lib_functions.ahk 
#Include lib_keysFunLogic.ahk  
;CapsLockPlus` 1~8, windows bind
#Include lib_bindWins.ahk 

;透明度
#Include lib_winTransparent.ahk

#MaxHotkeysPerInterval 500
#NoEnv

;  #WinActivateForce
Process Priority,,High

start:
    
    ;-----------------START-----------------
    global ctrlZ, CapsLock2, CapsLock , CapsLockOpen
    
    CapsLockOpen:=CLSets.Global.CapslockOpen!=""?CLSets.Global.CapslockOpen:true
    
Capslock::
    ;ctrlZ:     CapsLockPlusZ undo / redo flag
    ;Capslock:  Capslock 键状态标记，按下是1，松开是0
    ;Capslock2: 是否使用过 CapsLockPlus 功能标记，使用过会清除这个变量
    ctrlZ:=CapsLock2:=CapsLock:=1
    
    SetTimer, setCapsLock2, -300 ; 300ms 犹豫操作时间
    
    KeyWait, Capslock
    CapsLock:="" ;Capslock最优先置空，来关闭 CapsLockPlus 功能的触发
    if CapsLock2
    {
        if (CapslockOpen)
            SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
    }
    CapsLock2:=""
    
    ;
    if(winTapedX!=-1)
    {
        winsSort(winTapedX)
    }
    
Return

setCapsLock2:
    CapsLock2:=""
return

#if GetKeyState("MButton", "P")
{
    {
        a::
        b::
        c::
        d::
        e::
        f::
        g::
        h::
        i::
        j::
        k::
        l::
        n::
        m::
        o::
        p::
        q::
        r::
        s::
        t::
        u::
        v::
        w::
        x::
        y::
        z::
        1::
        2::
        3::
        4::
        5::
        6::
        7::
        8::
        9::
        0::
        f1::
        f2::
        f3::
        f4::
        f5::
        f6::
        f7::
        f8::
        f9::
        f10::
        f11::
        f12::
            try       
            runFunc(keyset["MButton_" . A_ThisHotkey])
            Capslock2:=""
        Return
    }
    
    return
}

;----------------------------keys-set-start-----------------------------

#if
    
#If CapsLock ;when capslock key press and hold
 
; ================= CapsLock + Key ... Start =================
{
     
    ; =========   A ~ Z，0~9，F1~F12 ... Start
    {
        a::
        b::
        c::
        d::
        e::
        f::
        g::
        h::
        i::
        j::
        k::
        l::
        n::
        m::
        o::
        p::
        q::
        r::
        s::
        t::
        u::
        v::
        w::
        x::
        y::
        z::
        1::
        2::
        3::
        4::
        5::
        6::
        7::
        8::
        9::
        0::
        f1::
        f2::
        f3::
        f4::
        f5::
        f6::
        f7::
        f8::
        f9::
        f10::
        f11::
        f12::
            try       
            runFunc(keyset["caps_" . A_ThisHotkey])
            Capslock2:=""
        Return
    }
    ; ===   A ~ Z，0~9，F1~F12 ... End
    
    ; =========   其他符号 ... Start
    {
        `::
            try
            runFunc(keyset.caps_backquote)
            Capslock2:=""
        return
        
        -::
            try
            runFunc(keyset.caps_minus)
            Capslock2:=""
        return
        
        =::
            try
            runFunc(keyset.caps_equal)
            Capslock2:=""
        Return
        
        backspace::
            try
            runFunc(keyset.caps_backspace)
            Capslock2:=""
        Return
        
        tab::
            try
            runFunc(keyset.caps_tab)
            Capslock2:=""
        Return
        
        [::
            try
            runFunc(keyset.caps_leftSquareBracket)
            Capslock2:=""
        Return
        
        ]::
            try
            runFunc(keyset.caps_rightSquareBracket)
            Capslock2:=""
        Return
        
        \::
            try
            runFunc(keyset.caps_backslash)
            Capslock2:=""
        return
        
        `;::
        try
        runFunc(keyset.caps_semicolon)
        Capslock2:=""
        Return
        
        '::
            try
            runFunc(keyset.caps_quote)
            Capslock2:=""
        return
        
        enter::
            try
            runFunc(keyset.caps_enter)
            Capslock2:=""
        Return
        
        ,::
            try
            runFunc(keyset.caps_comma)
            Capslock2:=""
        Return
        
        .::
            try
            runFunc(keyset.caps_dot)
            Capslock2:=""
        return
        
        /::
            try
            runFunc(keyset.caps_slash)
            Capslock2:=""
        Return
        
        space::
            try
            runFunc(keyset.caps_space)
            Capslock2:=""
        Return
    }
    ; ===   其他符号 ... End
    
    ; =========   鼠标操作 ... Start
    {
        WheelUp::
            try
            runFunc(keyset.caps_wheelUp)
            Capslock2:=""
        return
        
        WheelDown::
            try
            runFunc(keyset.caps_wheelDown)
            Capslock2:=""
        return
        
        MButton::
            try
            runFunc(keyset.caps_midButton)
            Capslock2:=""
        return
        
        ~LButton::
            try
            runFunc(keyset.caps_leftButton)
            Capslock2:=""
        return
        
        ~RButton::
            try
            runFunc(keyset.caps_rightButton)
            Capslock2:=""
        return
    }
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Key ... End =================

; ================= CapsLock + Alt + Key ... Start =================
{
    ; =========   A ~ Z，0~9，F1~F12 ... Start
    {
        !a::
        !b::
        !c::
        !d::
        !e::
        !f::
        !g::
        !h::
        !i::
        !j::
        !k::
        !l::
        !n::
        !m::
        !o::
        !p::
        !q::
        !r::
        !s::
        !t::
        !u::
        !v::
        !w::
        !x::
        !y::
        !z::
        !1::
        !2::
        !3::
        !4::
        !5::
        !6::
        !7::
        !8::
        !9::
        !0::
        !f1::
        !f2::
        !f3::
        !f4::
        !f5::
        !f6::
        !f7::
        !f8::
        !f9::
        !f10::
        !f11::
        !f12::
            try
            StringTrimLeft, OutputVar, A_ThisHotkey, 1 
            runFunc(keyset["caps_alt_" . OutputVar])
            Capslock2:=""
        Return
    }
    ; ===   A ~ Z，0~9，F1~F12 ... End
    
    ; =========   其他符号 ... Start
    {
        !`::
            try
            runFunc(keyset.caps_alt_backquote)
            Capslock2:=""
        return
        
        !-::
            try
            runFunc(keyset.caps_alt_minus)
            Capslock2:=""
        return
        
        !=::
            try
            runFunc(keyset.caps_alt_equal)
            Capslock2:=""
        Return
        
        !backspace::
            try
            runFunc(keyset.caps_alt_backspace)
            Capslock2:=""
        Return
        
        !tab::
            try
            runFunc(keyset.caps_alt_tab)
            Capslock2:=""
        Return
        
        ![::
            try
            runFunc(keyset.caps_alt_leftSquareBracket)
            Capslock2:=""
        Return
        
        !]::
            try
            runFunc(keyset.caps_alt_rightSquareBracket)
            Capslock2:=""
        Return
        
        !\::
            try
            runFunc(keyset.caps_alt_backslash)
            Capslock2:=""
        return
        
        !`;::
        try
        runFunc(keyset.caps_alt_semicolon)
        Capslock2:=""
        Return
        
        !'::
            try
            runFunc(keyset.caps_alt_quote)
            Capslock2:=""
        return
        
        !enter::
            try
            runFunc(keyset.caps_alt_enter)
            Capslock2:=""
        Return
        
        !,::
            try
            runFunc(keyset.caps_alt_comma)
            Capslock2:=""
        Return
        
        !.::
            try
            runFunc(keyset.caps_alt_dot)
            Capslock2:=""
        return
        
        !/::
            try
            runFunc(keyset.caps_alt_slash)
            Capslock2:=""
        Return
        
        !space::
            try
            runFunc(keyset.caps_alt_space)
            Capslock2:=""
        Return
    }
    ; ===   其他符号 ... End
    
    ; =========   鼠标操作 ... Start
    {
        !WheelUp::
            try
            runFunc(keyset.caps_alt_wheelUp)
            Capslock2:=""
        return
        
        !WheelDown::
            try
            runFunc(keyset.caps_alt_wheelDown)
            Capslock2:=""
        return
        
        !MButton::
            try
            runFunc(keyset.caps_alt_midButton)
            Capslock2:=""
        return
        
        !~LButton::
            try
            runFunc(keyset.caps_alt_leftButton)
            Capslock2:=""
        return
        
        !~RButton::
            try
            runFunc(keyset.caps_alt_rightButton)
            Capslock2:=""
        return
    }
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Alt + Key ... End =================

; ================= CapsLock + Shift + Key ... Start =================
{
    ; =========   A ~ Z，0~9，F1~F12 ... Start
    {
        +a::
        +b::
        +c::
        +d::
        +e::
        +f::
        +g::
        +h::
        +i::
        +j::
        +k::
        +l::
        +n::
        +m::
        +o::
        +p::
        +q::
        +r::
        +s::
        +t::
        +u::
        +v::
        +w::
        +x::
        +y::
        +z::
        +1::
        +2::
        +3::
        +4::
        +5::
        +6::
        +7::
        +8::
        +9::
        +0::
        +f1::
        +f2::
        +f3::
        +f4::
        +f5::
        +f6::
        +f7::
        +f8::
        +f9::
        +f10::
        +f11::
        +f12::
            try
            StringTrimLeft, OutputVar, A_ThisHotkey, 1
            runFunc(keyset["caps_shift_" . OutputVar])
                Capslock2:=""
        Return
    }
    ; ===   A ~ Z，0~9，F1~F12 ... End
    
    ; =========   其他符号 ... Start
    {
        +`::
            try
            runFunc(keyset.caps_shift_backquote)
                Capslock2:=""
        return
        
        +-::
            try
            runFunc(keyset.caps_shift_minus)
                Capslock2:=""
        return
        
        +=::
            try
            runFunc(keyset.caps_shift_equal)
                Capslock2:=""
        Return
        
        +backspace::
            try
            runFunc(keyset.caps_shift_backspace)
                Capslock2:=""
        Return
        
        +tab::
            try
            runFunc(keyset.caps_shift_tab)
                Capslock2:=""
        Return
        
        +[::
            try
            runFunc(keyset.caps_shift_leftSquareBracket)
                Capslock2:=""
        Return
        
        +]::
            try
            runFunc(keyset.caps_shift_rightSquareBracket)
                Capslock2:=""
        Return
        
        +\::
            try
            runFunc(keyset.caps_shift_backslash)
                Capslock2:=""
        return
        
        +`;::
        try
        runFunc(keyset.caps_shift_semicolon)
            Capslock2:=""
        Return
        
        +'::
            try
            runFunc(keyset.caps_shift_quote)
                Capslock2:=""
        return
        
        +enter::
            try
            runFunc(keyset.caps_shift_enter)
                Capslock2:=""
        Return
        
        +,::
            try
            runFunc(keyset.caps_shift_comma)
                Capslock2:=""
        Return
        
        +.::
            try
            runFunc(keyset.caps_shift_dot)
                Capslock2:=""
        return
        
        +/::
            try
            runFunc(keyset.caps_shift_slash)
                Capslock2:=""
        Return
        
        +space::
            try
            runFunc(keyset.caps_shift_space)
                Capslock2:=""
        Return
    }
    ; ===   其他符号 ... End
    
    ; =========   鼠标操作 ... Start
    {
        +WheelUp::
            try
            runFunc(keyset.caps_shift_wheelUp)
                Capslock2:=""
        return
        
        +WheelDown::
            try
            runFunc(keyset.caps_shift_wheelDown)
                Capslock2:=""
        return
        
        +MButton::
            try
            runFunc(keyset.caps_shift_midButton)
                Capslock2:=""
        return
        
        +~LButton::
            try
            runFunc(keyset.caps_shift_leftButton)
                Capslock2:=""
        return
        
        +~RButton::
            try
            runFunc(keyset.caps_shift_rightButton)
                Capslock2:=""
        return
    }
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Shift + Key ... End =================

; ================= CapsLock + Ctrl + Key ... Start =================
{
    ; =========   A ~ Z，0~9，F1~F12 ... Start
    {
        ^a::
        ^b::
        ^c::
        ^d::
        ^e::
        ^f::
        ^g::
        ^h::
        ^i::
        ^j::
        ^k::
        ^l::
        ^n::
        ^m::
        ^o::
        ^p::
        ^q::
        ^r::
        ^s::
        ^t::
        ^u::
        ^v::
        ^w::
        ^x::
        ^y::
        ^z::
        ^1::
        ^2::
        ^3::
        ^4::
        ^5::
        ^6::
        ^7::
        ^8::
        ^9::
        ^0::
        ^f1::
        ^f2::
        ^f3::
        ^f4::
        ^f5::
        ^f6::
        ^f7::
        ^f8::
        ^f9::
        ^f10::
        ^f11::
        ^f12::
            try
            StringTrimLeft, OutputVar, A_ThisHotkey, 1
            runFunc(keyset["caps_ctrl_" . OutputVar])
            Capslock2:=""
        Return
    }
    ; ===   A ~ Z，0~9，F1~F12 ... End
    
    ; =========   其他符号 ... Start
    {
        ^`::
            try
            runFunc(keyset.caps_ctrl_backquote)
            Capslock2:=""
        return
        
        ^-::
            try
            runFunc(keyset.caps_ctrl_minus)
            Capslock2:=""
        return
        
        ^=::
            try
            runFunc(keyset.caps_ctrl_equal)
            Capslock2:=""
        Return
        
        ^backspace::
            try
            runFunc(keyset.caps_ctrl_backspace)
            Capslock2:=""
        Return
        
        ^tab::
            try
            runFunc(keyset.caps_ctrl_tab)
            Capslock2:=""
        Return
        
        ^[::
            try
            runFunc(keyset.caps_ctrl_leftSquareBracket)
            Capslock2:=""
        Return
        
        ^]::
            try
            runFunc(keyset.caps_ctrl_rightSquareBracket)
            Capslock2:=""
        Return
        
        ^\::
            try
            runFunc(keyset.caps_ctrl_backslash)
            Capslock2:=""
        return
        
        ^`;::
        try
        runFunc(keyset.caps_ctrl_semicolon)
        Capslock2:=""
        Return
        
        ^'::
            try
            runFunc(keyset.caps_ctrl_quote)
            Capslock2:=""
        return
        
        ^enter::
            try
            runFunc(keyset.caps_ctrl_enter)
            Capslock2:=""
        Return
        
        ^,::
            try
            runFunc(keyset.caps_ctrl_comma)
            Capslock2:=""
        Return
        
        ^.::
            try
            runFunc(keyset.caps_ctrl_dot)
            Capslock2:=""
        return
        
        ^/::
            try
            runFunc(keyset.caps_ctrl_slash)
            Capslock2:=""
        Return
        
        ^space::
            try
            runFunc(keyset.caps_ctrl_space)
            Capslock2:=""
        Return
    }
    ; ===   其他符号 ... End
    
    ; =========   鼠标操作 ... Start
    {
        ^WheelUp::
            try
            runFunc(keyset.caps_ctrl_wheelUp)
            Capslock2:=""
        return
        
        ^WheelDown::
            try
            runFunc(keyset.caps_ctrl_wheelDown)
            Capslock2:=""
        return
        
        ^MButton::
            try
            runFunc(keyset.caps_ctrl_midButton)
            Capslock2:=""
        return
        
        ^~LButton::
            try
            runFunc(keyset.caps_ctrl_leftButton)
            Capslock2:=""
        return
        
        ^~RButton::
            try
            runFunc(keyset.caps_ctrl_rightButton)
            Capslock2:=""
        return
    }
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Ctrl + Key ... End =================

#If
    
GuiClose:
GuiEscape:
    Gui, Cancel
return

 {
        ^+!#a::
        ^+!#b::
        ^+!#c::
        ^+!#d::
        ^+!#e::
        ^+!#f::
        ^+!#g::
        ^+!#h::
        ^+!#i::
        ^+!#j::
        ^+!#k::
        ^+!#l::
        ^+!#n::
        ^+!#m::
        ^+!#o::
        ^+!#p::
        ^+!#q::
        ^+!#r::
        ^+!#s::
        ^+!#t::
        ^+!#u::
        ^+!#v::
        ^+!#w::
        ^+!#x::
        ^+!#y::
        ^+!#z::
        ^+!#1::
        ^+!#2::
        ^+!#3::
        ^+!#4::
        ^+!#5::
        ^+!#6::
        ^+!#7::
        ^+!#8::
        ^+!#9::
        ^+!#0::
        ^+!#f1::
        ^+!#f2::
        ^+!#f3::
        ^+!#f4::
        ^+!#f5::
        ^+!#f6::
        ^+!#f7::
        ^+!#f8::
        ^+!#f9::
        ^+!#f10::
        ^+!#f11::
        ^+!#f12::
            try
            StringTrimLeft, OutputVar, A_ThisHotkey, 4
           ; MsgBox, Script __%OutputVar%__ will be reloaded
            runFunc(keyset["MButton_" . OutputVar])
            Capslock2:=""
        Return
    }



XButton2::Ctrl
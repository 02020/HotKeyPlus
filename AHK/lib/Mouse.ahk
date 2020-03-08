
#if GetKeyState("XButton1", "P")
{    
    {
        1::
        2::
        3::
        4::
        5::
        q::
        w::
        e::
        r::
        t::
        a::
        s::
        d::
        f::
        g::
        z::
        x::
        c::
        v::
        b:: 
        Space::
            try      
            keyTapTimes(A_ThisHotkey)   
            
        Return
    }
    
    return
}

#if GetKeyState("XButton2", "P")
{    
    {
        1::
        2::
        3::
        4::
        5::
            
        q::
        w::
        e::
        r::
        t::
            
        a::
        s::
        d::
        f::
        g::
            
        z::
        x::
        c::
        v::
        b:: 
        Space::
            try      
            btn :="XButton2_" . A_ThisHotkey
            %btn%()  
        Return
    }
    
    return
}

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


XButton2_q(){
    SendInput,{Up}
    return
}

XButton2_w(){
    SendInput,{Up}
    return
}


XButton2_e(){
    SendInput,{Up}
    return
}

XButton2_r(){
    ; SendInput,{Delete} ;删除
    SendInput, ^r 
    return
}

XButton2_t(){
    SendInput,{Up}
    return
}


XButton2_a(){
    SendInput, {Left}
    return
}

XButton2_s(){
    SendInput, {Left}
    return
}


XButton2_d(){
    SendInput,{Down}
    return
}

XButton2_f(){
    SendInput,{right}
    return
}
XButton2_g(){
    SendInput,{LWinDown}{Tab}
    return
}

XButton2_z(){
    SendInput, ^z
    return
}

XButton2_x(){
    SendInput, ^x
    return
}

XButton2_c(){
    SendInput,^c
    return
}

XButton2_v(){
    SendInput, ^v
    return
}


XButton2_b(){
    SendInput,{Backspace}
    return
}





XButton2_Space(){
    SendInput,{Enter}
    return
}








﻿; ================= MButton + Key ... Start =================
{
    ; =========   A ~ Z ... Start
    {
        keyFunc_MButton_a(){
            funcLogic_winbind_activate("a")
            return
        }
        
        keyFunc_MButton_b(){
            funcLogic_winbind_activate("b")
            return
        }
        
        keyFunc_MButton_c(){
            funcLogic_winbind_activate("c")
            return
        }
        
        keyFunc_MButton_d(){
            funcLogic_winbind_activate("d")
            return
        }
        
        keyFunc_MButton_e(){
            funcLogic_winbind_activate("e")
            return
        }
        
        keyFunc_MButton_f(){
            funcLogic_winbind_activate("f")
            return
        }
        
        keyFunc_MButton_g(){
            funcLogic_winbind_activate("g")
            return
        }
        
        keyFunc_MButton_h(){
            funcLogic_winbind_activate("h")
            return
        }
        
        keyFunc_MButton_i(){
             funcLogic_winbind_activate("i")
            return
        }
        
        keyFunc_MButton_j(){
            funcLogic_winbind_activate("j")
            return
        }
        
        keyFunc_MButton_k(){
             funcLogic_winbind_activate("k")
            return
        }
        
        keyFunc_MButton_l(){
             funcLogic_winbind_activate("l")
            return
        }
        
        keyFunc_MButton_m(){
            funcLogic_winbind_activate("m")
            return
        }
        
        keyFunc_MButton_n(){
            funcLogic_winbind_activate("n")
            return
        }
        
        keyFunc_MButton_o(){
               funcLogic_winbind_activate("o")
            return
        }
        
        keyFunc_MButton_p(){
            funcLogic_winbind_activate("p")
            return
        }
        
        keyFunc_MButton_q(){
            funcLogic_winbind_activate("q")
            return
        }
        
        keyFunc_MButton_r(){
            funcLogic_winbind_activate("r")
            return
        }
        
        keyFunc_MButton_s(){
            funcLogic_winbind_activate("s")
            return
        }
        
        keyFunc_MButton_t(){
            funcLogic_winbind_activate("t")
            return
        }
        
        keyFunc_MButton_u(){
             funcLogic_winbind_activate("u")
            return
        }
        
        keyFunc_MButton_v(){
            funcLogic_winbind_activate("v")
            return
        }
        
        keyFunc_MButton_w(){
            funcLogic_winbind_activate("w")
            return
        }
        
        keyFunc_MButton_x(){
            funcLogic_winbind_activate("x")
            return
        }
        
        keyFunc_MButton_y(){
            funcLogic_winbind_activate("y")
            return
        }
        
        keyFunc_MButton_z(){
            funcLogic_winbind_activate("z")
            return
        }
        
    }
    ; ===   A ~ Z ... End
    
    
    ; =========   F1 ~ F12 ... Start
    {
        keyFunc_MButton_f1(){
            funcLogic_winbind_activate("f1")
            return
        }
        
        keyFunc_MButton_f2(){
            funcLogic_winbind_activate("f2")
            return
        }
        
        keyFunc_MButton_f3(){
            funcLogic_winbind_activate("f3")
            return
        }
        
        keyFunc_MButton_f4(){
            funcLogic_winbind_activate("f4")
            return
        }
        
        keyFunc_MButton_f5(){
            funcLogic_winbind_activate("f5")
            return
        }
        
        keyFunc_MButton_f6(){
            funcLogic_winbind_activate("f6")
            return
        }
        
        keyFunc_MButton_f7(){
            funcLogic_winbind_activate("f7")
            return
        }
        
        keyFunc_MButton_f8(){
            funcLogic_winbind_activate("f8")
            return
        }
        
        keyFunc_MButton_f9(){
            
            return
        }
        
        keyFunc_MButton_f10(){
            
            return
        }
        
        keyFunc_MButton_f11(){
            
            return
        }
        
        keyFunc_MButton_f12(){
            
            return
        }
    }
    ; ===   F1 ~ F12 ... End
    
    
    ; =========   0 ~ 9 ... Start
    {
        keyFunc_MButton_0(){         
            funcLogic_winbind_activate(0)
            return
        }
        
        keyFunc_MButton_1(){
            funcLogic_winbind_activate(1)
            return
        }
        
        keyFunc_MButton_2(){
            funcLogic_winbind_activate(2)
            return
        }
        
        keyFunc_MButton_3(){
            funcLogic_winbind_activate(3)
            return
        }
        
        keyFunc_MButton_4(){
            funcLogic_winbind_activate(4)
            return
        }
        
        keyFunc_MButton_5(){
            funcLogic_winbind_activate(5)
            return
        }
        
        keyFunc_MButton_6(){
            funcLogic_winbind_activate(6)
            return
        }
        
        keyFunc_MButton_7(){
            funcLogic_winbind_activate(7)
            return
        }
        
        keyFunc_MButton_8(){
            funcLogic_winbind_activate(8)
            return
        }
        
        keyFunc_MButton_9(){
           funcLogic_winbind_activate(9)
            return
        }
    }
    ; ===   0 ~ 9 ... End
    
    
    ; =========   其他符号 ... Start
    {
        keyFunc_MButton_backquote(){
            funcLogic_winbind_activate(9)
            return
        }
        
        keyFunc_MButton_minus(){
            return
        }
        
        keyFunc_MButton_equal(){
            return
        }
        
        keyFunc_MButton_backspace(){
            return
        }
        
        keyFunc_MButton_tab(){
            return
        }
        
        keyFunc_MButton_leftSquareBracket(){
            funcLogic_doubleChar("{","}")
            return
        }
        
        keyFunc_MButton_rightSquareBracket(){
            funcLogic_doubleChar("[","]")
            return
        }
        
        keyFunc_MButton_backslash(){
            return
        }
        
        keyFunc_MButton_semicolon(){
            funcLogic_jumpRightWord()
            return
        }
        
        keyFunc_MButton_quote(){
            funcLogic_doubleChar("""""""","""""""")
            return
        }
        
        keyFunc_MButton_enter(){
            funcLogic_enterUpWherever()
            return
        }
        
        keyFunc_MButton_comma(){
            funcLogic_doubleAngle()
            return
        }
        
        keyFunc_MButton_dot(){
            return
        }
        
        keyFunc_MButton_slash(){
            return
        }
        
        keyFunc_MButton_space(){
           
            return
        }
    }
    ; ===   其他符号 ... End
}
; ================= MButton + Key ... End =================

; ================= CapsLock + Key ... Start =================
{
    ; =========   A ~ Z ... Start
    {
        keyFunc_a(){
            funcLogic_backspace()
            return
        }
        
        keyFunc_b(){
            funcLogic_drivePop()
            return
        }
        
        keyFunc_c(){
            ;funcLogic_copy1()
            return
        }
        
        keyFunc_d(){
            funcLogic_deleteCurLine()
            return
        }
        
        keyFunc_e(){
            funcLogic_SaveFile()
            return
        }
        
        keyFunc_f(){
            funcLogic_searchFile()
            return
        }
        
        ; 空
        keyFunc_g(){
            return
        }
        
        keyFunc_h(){
            funcLogic_jumpLeftWord()
            return
        }
        
        keyFunc_i(){
            funcLogic_moveUp()
            return
        }
        
        keyFunc_j(){
            funcLogic_moveLeft()
            return
        }
        
        keyFunc_k(){
            funcLogic_moveDown()
            return
        }
        
        keyFunc_l(){
            funcLogic_moveRight()
            return
        }
        
        keyFunc_m(){
            funcLogic_copyLineDown()
            return
        }
        
        keyFunc_n(){
            funcLogic_CopyLineUp()
            return
        }
        
        keyFunc_o(){
            funcLogic_end()
            return
        }
        
        keyFunc_p(){
            funcLogic_esc()
            return
        }
        
        keyFunc_q(){
            funcLogic_OpenTranslatePanel()
            return
        }
        
        keyFunc_r(){
            funcLogic_CommonLine()
            return
        }
        
        keyFunc_s(){
            funcLogic_delete()
            return
        }
        
        keyFunc_t(){
            funcLogic_translateWithClipboard()
            return
        }
        
        keyFunc_u(){
            funcLogic_home()
            return
        }
        
        keyFunc_v(){
            funcLogic_paste1()
            return
        }
        
        keyFunc_w(){
            funcLogic_closeCurWindow()
            return
        }
        
        keyFunc_x(){
            funcLogic_cut1()
            return
        }
        
        keyFunc_y(){
            funcLogic_recover()
            return
        }
        
        keyFunc_z(){
            funcLogic_undoRedo()
            return
        }
        
    }
    ; ===   A ~ Z ... End
    
    
    ; =========   F1 ~ F12 ... Start
    {
        keyFunc_f1(){
            return
        }
        
        keyFunc_f2(){
            return
        }
        
        keyFunc_f3(){
            return
        }
        
        keyFunc_f4(){
            return
        }
        
        keyFunc_f5(){
            return
        }
        
        keyFunc_f6(){
            return
        }
        
        keyFunc_f7(){
            return
        }
        
        keyFunc_f8(){
            return
        }
        
        keyFunc_f9(){
            CreateKeysFile()
            return
        }
        
        keyFunc_f10(){
            funcLogic_capsLockOpen()
            return
        }
        
        keyFunc_f11(){
            funcLogic_reload()
            return
        }
        
        keyFunc_f12(){
            funcLogic_winPin()
            return
        }
    }
    ; ===   F1 ~ F12 ... End
    
    
    ; =========   0 ~ 9 ... Start
    {
        keyFunc_0(){
            funcLogic_winbind_activate(0)
            return
        }
        
        keyFunc_1(){
            funcLogic_winbind_activate(1)
            return
        }
        
        keyFunc_2(){
            funcLogic_winbind_activate(2)
            return
        }
        
        keyFunc_3(){
            funcLogic_winbind_activate(3)
            return
        }
        
        keyFunc_4(){
            funcLogic_winbind_activate(4)
            return
        }
        
        keyFunc_5(){
            funcLogic_winbind_activate(5)
            return
        }
        
        keyFunc_6(){
            funcLogic_winbind_activate(6)
            return
        }
        
        keyFunc_7(){
            funcLogic_winbind_activate(7)
            return
        }
        
        keyFunc_8(){
            funcLogic_winbind_activate(8)
            return
        }
        
        keyFunc_9(){
             funcLogic_winbind_activate(9)
            return
        }
    }
    ; ===   0 ~ 9 ... End
    
    
    ; =========   其他符号 ... Start
    {
        keyFunc_backquote(){
            funcLogic_winbind_activate(9)
            return
        }
        
        keyFunc_minus(){
            return
        }
        
        keyFunc_equal(){
            return
        }
        
        keyFunc_backspace(){       
            return
        }
        
        keyFunc_tab(){
            return
        }
        
        keyFunc_leftSquareBracket(){
            funcLogic_doubleChar("{","}")
            return
        }
        
        keyFunc_rightSquareBracket(){
            funcLogic_doubleChar("[","]")
            return
        }
        
        keyFunc_backslash(){
            return
        }
        
        keyFunc_semicolon(){
            funcLogic_jumpRightWord()
            return
        }
        
        keyFunc_quote(){
            funcLogic_doubleChar("""""""","""""""")
            return
        }
        
        keyFunc_enter(){
            funcLogic_enterUpWherever()
            return
        }
        
        keyFunc_comma(){
            funcLogic_doubleAngle()
            return
        }
        
        keyFunc_dot(){
            return
        }
        
        keyFunc_slash(){
            return
        }
        
        keyFunc_space(){
            SendInput, {Enter}
            return
        }
    }
    ; ===   其他符号 ... End
    
    
    ; =========   鼠标操作 ... Start
    {
        keyFunc_wheelUp(){
            funcLogic_volumeUp()
            return
        }
        
        keyFunc_wheelDown(){
            funcLogic_volumeDown()
            return
        }
        
        keyFunc_midButton(){
            return
        }
        
        keyFunc_leftButton(){
            return
        }
        
        keyFunc_rightButton(){
            return
        }
        
    }
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Key ... End =================

; ================= CapsLock + Alt + Key ... Start =================
{
    ; =========   A ~ Z ... Start
    {
        keyFunc_alt_a(){
            ; funcLogic_jumpBackspace()
            funcLogic_winbind_binding("a")
            return
        }
        
        keyFunc_alt_b(){
            funcLogic_winbind_binding("b")
            return
        }
        
        keyFunc_alt_c(){
            funcLogic_winbind_binding("c")
            return
        }
        
        keyFunc_alt_d(){
            funcLogic_winbind_binding("d")
            return
        }
        
        keyFunc_alt_e(){
            funcLogic_winbind_binding("e")
            return
        }
        
        keyFunc_alt_f(){
            funcLogic_winbind_binding("f")
            return
        }
        
        keyFunc_alt_g(){
            funcLogic_winbind_binding("g")
            return
        }
        
        keyFunc_alt_h(){
            ; funcLogic_selectWordLeft()
            funcLogic_winbind_binding("h")
            return
        }
        
        keyFunc_alt_i(){
            ; funcLogic_UpSelectWord()
            funcLogic_winbind_binding("i")
            return
        }
        
        keyFunc_alt_j(){
            ; funcLogic_LeftSelectWord()
            funcLogic_winbind_binding("j")
            return
        }
        
        keyFunc_alt_k(){
            funcLogic_DownSelectWord()
            
            return
        }
        
        keyFunc_alt_l(){
            funcLogic_RightSelectWord()
            return
        }
        
        keyFunc_alt_m(){
            funcLogic_winbind_binding("m")
            return
        }
        
        keyFunc_alt_n(){            
            funcLogic_winbind_binding("n")
            return
        }
        
        keyFunc_alt_o(){
            funcLogic_selectEnd()
            return
        }
        
        keyFunc_alt_p(){
            return
        }
        
        keyFunc_alt_q(){
            funcLogic_winbind_binding("q")
            return
        }
        
        keyFunc_alt_r(){
            funcLogic_winbind_binding("r")
            return
        }
        
        keyFunc_alt_s(){
            funcLogic_winbind_binding("s")
            return
        }
        
        keyFunc_alt_t(){
            funcLogic_winbind_binding("t")
            return
        }
        
        keyFunc_alt_u(){
            funcLogic_selectHome()
            
            return
        }
        
        keyFunc_alt_v(){
            funcLogic_winbind_binding("v")
            return
        }
        
        keyFunc_alt_w(){
            funcLogic_winbind_binding("w")
            return
        }
        
        keyFunc_alt_x(){
            funcLogic_winbind_binding("x")
            return
        }
        
        keyFunc_alt_y(){
            funcLogic_winbind_binding("y")
            return
        }
        
        keyFunc_alt_z(){
            funcLogic_winbind_binding("z")
            return
        }
        
    }
    ; ===   A ~ Z ... End
    
    ; =========   F1 ~ F12 ... Start
    {
        keyFunc_alt_f1(){
            funcLogic_winbind_binding("f1")
            return
        }
        
        keyFunc_alt_f2(){
            funcLogic_winbind_binding("f2")
            return
        }
        
        keyFunc_alt_f3(){
            funcLogic_winbind_binding("f3")
            return
        }
        
        keyFunc_alt_f4(){ 
            funcLogic_winbind_binding("f4")
            return
        }
        
        keyFunc_alt_f5(){  
            funcLogic_winbind_binding("f5")
            return
        }
        
        keyFunc_alt_f6(){
            funcLogic_winbind_binding("f6")
            return
        }
        
        keyFunc_alt_f7(){
            funcLogic_winbind_binding("f7")
            return
        }
        
        keyFunc_alt_f8(){
            funcLogic_winbind_binding("f8")
            return
        }
        
        keyFunc_alt_f9(){
            return
        }
        
        keyFunc_alt_f10(){
            return
        }
        
        keyFunc_alt_f11(){
            return
        }
        
        keyFunc_alt_f12(){
            return
        }
    }
    ; ===   F1 ~ F12 ... End
    
    ; =========   0 ~ 9 ... Start
    {
        keyFunc_alt_0(){
             funcLogic_winbind_binding(0)
            return
        }
        
        keyFunc_alt_1(){
            funcLogic_winbind_binding(1)
            return
        }
        
        keyFunc_alt_2(){
            funcLogic_winbind_binding(2)
            return
        }
        
        keyFunc_alt_3(){
            funcLogic_winbind_binding(3)
            return
        }
        
        keyFunc_alt_4(){
            funcLogic_winbind_binding(4)
            return
        }
        
        keyFunc_alt_5(){
            funcLogic_winbind_binding(5)
            return
        }
        
        keyFunc_alt_6(){
            funcLogic_winbind_binding(6)
            return
        }
        
        keyFunc_alt_7(){
            funcLogic_winbind_binding(7)
            return
        }
        
        keyFunc_alt_8(){
            funcLogic_winbind_binding(8)
            return
        }
        
        keyFunc_alt_9(){
            funcLogic_winbind_binding(9)
            return
        }
    }
    ; ===   0 ~ 9 ... End
    
    ; =========   其他符号 ... Start
    {
        keyFunc_alt_backquote(){
            funcLogic_winbind_binding(9)
            return
        }
        
        keyFunc_alt_minus(){
            return
        }
        
        keyFunc_alt_equal(){
            return
        }
        
        keyFunc_alt_backspace(){
            return
        }
        
        keyFunc_alt_tab(){
            return
        }
        
        keyFunc_alt_leftSquareBracket(){
            return
        }
        
        keyFunc_alt_rightSquareBracket(){
            return
        }
        
        keyFunc_alt_backslash(){
            return
        }
        
        keyFunc_alt_semicolon(){
            funcLogic_selectWordRight()
            return
        }
        
        keyFunc_alt_quote(){
            return
        }
        
        keyFunc_alt_enter(){
            funcLogic_enterDownWherever()
            return
        }
        
        keyFunc_alt_comma(){
            return
        }
        
        keyFunc_alt_dot(){
            return
        }
        
        keyFunc_alt_slash(){
            return
        }
        
        keyFunc_alt_space(){
            return
        }
        
        
    }
    ; ===   其他符号 ... End
    
    ; =========   鼠标操作 ... Start
    {
        
        keyFunc_alt_wheelUp(){
            funcLogic_mouseSpeedIncrease()
            return
        }
        
        keyFunc_alt_wheelDown(){
            funcLogic_mouseSpeedDecrease()
            return
        }
        
        keyFunc_alt_midButton(){
            funcLogic_mouseSpeedRecord()
            return
        }
        
        keyFunc_alt_leftButton(){
            funcLogic_putTheWindowToOtherScreen()
            return
        }
        
        keyFunc_alt_rightButton(){
            return
        }
        
    }
    
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Alt + Key ... End =================

; ================= CapsLock + Shift + Key ... Start =================
{
    ; =========   A ~ Z ... Start
    {
        keyFunc_shift_a(){
            DeleteCurLineLeftPart()
            return
        }
        
        keyFunc_shift_b(){
            return
        }
        
        keyFunc_shift_c(){
            return
        }
        
        keyFunc_shift_d(){
            return
        }
        
        keyFunc_shift_e(){
            ChangeNextVirtualPanel()
            return
        }
        
        keyFunc_shift_f(){
            return
        }
        
        keyFunc_shift_g(){
            return
        }
        
        keyFunc_shift_h(){
            return
        }
        
        keyFunc_shift_i(){
            TurnPageUp()
            return
        }
        
        keyFunc_shift_j(){
            ChangeWindowLeft()
            return
        }
        
        keyFunc_shift_k(){
            TurnPageDown()
            return
        }
        
        keyFunc_shift_l(){
            ChangeWindowRight()
            return
        }
        
        keyFunc_shift_m(){
            return
        }
        
        keyFunc_shift_n(){
            return
        }
        
        keyFunc_shift_o(){
            return
        }
        
        keyFunc_shift_p(){
            return
        }
        
        keyFunc_shift_q(){
            ChangeLastVirtualPanel()
            return
        }
        
        keyFunc_shift_r(){
            CreateVirtualPanel()
            return
        }
        
        keyFunc_shift_s(){
            DeleteCurLineRightPart()
            return
        }
        
        keyFunc_shift_t(){
            return
        }
        
        keyFunc_shift_u(){
            return
        }
        
        keyFunc_shift_v(){
            return
        }
        
        keyFunc_shift_w(){
            CloseVirtualPanel()
            return
        }
        
        keyFunc_shift_x(){
            return
        }
        
        keyFunc_shift_y(){
            return
        }
        
        keyFunc_shift_z(){
            return
        }
        
    }
    ; ===   A ~ Z ... End
    
    
    ; =========   F1 ~ F12 ... Start
    {
        keyFunc_shift_f1(){
            return
        }
        
        keyFunc_shift_f2(){
            return
        }
        
        keyFunc_shift_f3(){
            return
        }
        
        keyFunc_shift_f4(){
            return
        }
        
        keyFunc_shift_f5(){
            return
        }
        
        keyFunc_shift_f6(){
            return
        }
        
        keyFunc_shift_f7(){
            return
        }
        
        keyFunc_shift_f8(){
            return
        }
        
        keyFunc_shift_f9(){
            return
        }
        
        keyFunc_shift_f10(){
            return
        }
        
        keyFunc_shift_f11(){
            return
        }
        
        keyFunc_shift_f12(){
            return
        }
    }
    ; ===   F1 ~ F12 ... End
    
    
    ; =========   0 ~ 9 ... Start
    {
        keyFunc_shift_0(){
            return
        }
        
        keyFunc_shift_1(){
            return
        }
        
        keyFunc_shift_2(){
            return
        }
        
        keyFunc_shift_3(){
            return
        }
        
        keyFunc_shift_4(){
            return
        }
        
        keyFunc_shift_5(){
            return
        }
        
        keyFunc_shift_6(){
            return
        }
        
        keyFunc_shift_7(){
            return
        }
        
        keyFunc_shift_8(){
            return
        }
        
        keyFunc_shift_9(){
            return
        }
    }
    ; ===   0 ~ 9 ... End
    
    
    ; =========   其他符号 ... Start
    {
        
        keyFunc_shift_backquote(){
            return
        }
        
        keyFunc_shift_minus(){
            return
        }
        
        keyFunc_shift_equal(){
            return
        }
        
        keyFunc_shift_backspace(){
            return
        }
        
        keyFunc_shift_tab(){
            return
        }
        
        keyFunc_shift_leftSquareBracket(){
            return
        }
        
        keyFunc_shift_rightSquareBracket(){
            return
        }
        
        keyFunc_shift_backslash(){
            return
        }
        
        keyFunc_shift_semicolon(){
            return
        }
        
        keyFunc_shift_quote(){
            return
        }
        
        keyFunc_shift_enter(){
            return
        }
        
        keyFunc_shift_comma(){
            return
        }
        
        keyFunc_shift_dot(){
            return
        }
        
        keyFunc_shift_slash(){
            return
        }
        
        keyFunc_shift_space(){
            return
        }
        
    }
    ; ===   其他符号 ... End
    
    
    ; =========   鼠标操作 ... Start
    {
        
        keyFunc_shift_wheelUp(){
            return
        }
        
        keyFunc_shift_wheelDown(){
            return
        }
        
        keyFunc_shift_midButton(){
            return
        }
        
        keyFunc_shift_leftButton(){
            ShowToolTipPanel()
            return
        }
        
        keyFunc_shift_rightButton(){
            return
        }
        
    }
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Shift + Key ... End =================

; ================= CapsLock + Ctrl + Key ... Start =================
{
    ; =========   A ~ Z ... Start
    {
        keyFunc_ctrl_a(){
            return
        }
        
        keyFunc_ctrl_b(){
            return
        }
        
        keyFunc_ctrl_c(){
            return
        }
        
        keyFunc_ctrl_d(){
            return
        }
        
        keyFunc_ctrl_e(){
            return
        }
        
        keyFunc_ctrl_f(){
            return
        }
        
        keyFunc_ctrl_g(){
            return
        }
        
        keyFunc_ctrl_h(){
            return
        }
        
        keyFunc_ctrl_i(){
            return
        }
        
        keyFunc_ctrl_j(){
            return
        }
        
        keyFunc_ctrl_k(){
            return
        }
        
        keyFunc_ctrl_l(){
            return
        }
        
        keyFunc_ctrl_m(){
            return
        }
        
        keyFunc_ctrl_n(){
            return
        }
        
        keyFunc_ctrl_o(){
            return
        }
        
        keyFunc_ctrl_p(){
            return
        }
        
        keyFunc_ctrl_q(){
            return
        }
        
        keyFunc_ctrl_r(){
            return
        }
        
        keyFunc_ctrl_s(){
            return
        }
        
        keyFunc_ctrl_t(){
            return
        }
        
        keyFunc_ctrl_u(){
            return
        }
        
        keyFunc_ctrl_v(){
            return
        }
        
        keyFunc_ctrl_w(){
            return
        }
        
        keyFunc_ctrl_x(){
            return
        }
        
        keyFunc_ctrl_y(){
            return
        }
        
        keyFunc_ctrl_z(){
            return
        }
        
    }
    ; ===   A ~ Z ... End
    
    
    ; =========   F1 ~ F12 ... Start
    {
        keyFunc_ctrl_f1(){
            return
        }
        
        keyFunc_ctrl_f2(){
            return
        }
        
        keyFunc_ctrl_f3(){
            return
        }
        
        keyFunc_ctrl_f4(){
            return
        }
        
        keyFunc_ctrl_f5(){
            return
        }
        
        keyFunc_ctrl_f6(){
            return
        }
        
        keyFunc_ctrl_f7(){
            return
        }
        
        keyFunc_ctrl_f8(){
            return
        }
        
        keyFunc_ctrl_f9(){
            return
        }
        
        keyFunc_ctrl_f10(){
            return
        }
        
        keyFunc_ctrl_f11(){
            return
        }
        
        keyFunc_ctrl_f12(){
            return
        }
    }
    ; ===   F1 ~ F12 ... End
    
    
    ; =========   0 ~ 9 ... Start
    {
        keyFunc_ctrl_0(){
            return
        }
        
        keyFunc_ctrl_1(){
            return
        }
        
        keyFunc_ctrl_2(){
            return
        }
        
        keyFunc_ctrl_3(){
            return
        }
        
        keyFunc_ctrl_4(){
            return
        }
        
        keyFunc_ctrl_5(){
            return
        }
        
        keyFunc_ctrl_6(){
            return
        }
        
        keyFunc_ctrl_7(){
            return
        }
        
        keyFunc_ctrl_8(){
            return
        }
        
        keyFunc_ctrl_9(){
            return
        }
    }
    ; ===   0 ~ 9 ... End
    
    
    ; =========   其他符号 ... Start
    {
        keyFunc_ctrl_backquote(){
            return
        }
        
        keyFunc_ctrl_minus(){
            
            return
        }
        
        keyFunc_ctrl_equal(){
            
            return
        }
        
        keyFunc_ctrl_backspace(){
            
            return
        }
        
        keyFunc_ctrl_tab(){
            
            return
        }
        
        keyFunc_ctrl_leftSquareBracket(){
            
            return
        }
        
        keyFunc_ctrl_rightSquareBracket(){
            
            return
        }
        
        keyFunc_ctrl_backslash(){
            
            return
        }
        
        keyFunc_ctrl_semicolon(){
            
            return
        }
        
        keyFunc_ctrl_quote(){
            
            return
        }
        
        keyFunc_ctrl_enter(){
            
            return
        }
        
        keyFunc_ctrl_comma(){
            
            return
        }
        
        keyFunc_ctrl_dot(){
            
            return
        }
        
        keyFunc_ctrl_slash(){
            
            return
        }
        
        keyFunc_ctrl_space(){
            
            return
        }
        
    }
    ; ===   其他符号 ... End
    
    
    ; =========   鼠标操作 ... Start
    {
        
        keyFunc_ctrl_wheelUp(){
            return
        }
        
        keyFunc_ctrl_wheelDown(){
            return
        }
        
        keyFunc_ctrl_midButton(){
            funcLogic_mouseSpeedRecover()
            return
        }
        
        keyFunc_ctrl_leftButton(){
            return
        }
        
        keyFunc_ctrl_rightButton(){
            return
        }
        
    }
    ; ===   鼠标操作 ... End
}
; ================= CapsLock + Ctrl + Key ... End =================
{
    
    
    
}
/*
Copyright (C) 2024 Міја

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, see
<https://www.gnu.org/licenses/>.
*/

#Requires AutoHotkey >=2.0
#SingleInstance Force
DetectHiddenWindows(true)
A_IconTip := "UniSlav"
TraySetIcon("assets\main.ico",, false)
IniWrite(A_ScriptHwnd, A_Temp "\UniSlav.tmp", "HWND", "ctrl")
SetTimer(ToolTip,-2000)
ToolTip("UniSlav launched.")

ahkPath := A_ScriptDir "\AutoHotkey64_UniSlav.exe"
HKModern := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "HKModern", "^1")
HKChurch := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "HKChurch", "^2")

Hotkey(HKModern,ModernKB,"On")
Hotkey(HKChurch,ChurchKB,"On")
ModernKB(*) {
    global
    checkWin()
    if !thisScript {
        A_IconHidden := 1
        Run(ahkPath " remap\keyboard_cyrl.ahk")
        SetTimer(ToolTip,-1500)
        ToolTip("Slavic Cyrillic")
    }
    else if WinCyrl {
        A_IconHidden := 1
        WinClose("ahk_id " WinCyrl)
        Run(ahkPath " remap\keyboard_latn.ahk")
        SetTimer(ToolTip,-1500)
        ToolTip("Slavic Latin")
    }
    else if WinLatn {
        WinClose("ahk_id" WinLatn)
        A_IconHidden := 0
        SetTimer(ToolTip,-1500)
        ToolTip("Exiting keyboard mode...")
    }
    else {
        switchKeyboard(HKModern,HKChurch)
    }
}
ChurchKB(*) {
    global
    checkWin()
    if !thisScript {
        A_IconHidden := 1
        Run(ahkPath " remap\keyboard_cyrs.ahk")
        SetTimer(ToolTip,-1500)
        ToolTip("Early Cyrillic")
    }
    else if WinCyrs {
        A_IconHidden := 1
        WinClose("ahk_id" WinCyrs)
        Run(ahkPath " remap\keyboard_glag.ahk")
        SetTimer(ToolTip,-1500)
        ToolTip("Glagolitic")
    }
    else if WinGlag {
        WinClose("ahk_id" WinGlag)
        A_IconHidden := 0
        SetTimer(ToolTip,-1500)
        ToolTip("Exiting keyboard mode...")
    }
    else {
        switchKeyboard(HKChurch,HKModern)
    }
}
checkWin() {
    global
    WinCyrl := IniRead(A_Temp "\UniSlav.tmp", "HWND", "cyrl", "")
    WinLatn := IniRead(A_Temp "\UniSlav.tmp", "HWND", "latn", "")
    WinCyrs := IniRead(A_Temp "\UniSlav.tmp", "HWND", "cyrs", "")
    WinGlag := IniRead(A_Temp "\UniSlav.tmp", "HWND", "glag", "")
    if !(WinCyrl || WinLatn || WinCyrs || WinGlag)
        thisScript := false
    else
        thisScript := true
}
switchKeyboard(new,old) {
    global
    if old = HKModern {
        closeCyrl()
        closeLatn()
    }
    else if old = HKChurch {
        closeCyrs()
        closeGlag()
    }
    Sleep 0
    Send(new)
}
;
OnExit cleanUp
cleanUp(*) {
    ToolTip("Exiting UniSlav.")
    checkWin()
    closeCyrl()
    closeLatn()
    closeCyrs()
    closeGlag()
    FileDelete(A_Temp "\UniSlav.tmp")
    Sleep 1500
}

closeCyrl() {
    if WinCyrl
        WinClose("ahk_id" WinCyrl)
}
closeLatn() {
    if WinLatn
        WinClose("ahk_id" WinLatn)
}
closeCyrs() {
    if WinCyrs
        WinClose("ahk_id" WinCyrs)
}
closeGlag() {
    if WinGlag
        WinClose("ahk_id" WinGlag)
}
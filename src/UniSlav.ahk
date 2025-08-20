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
        WinClose("ahk_id " HWND_cyrl)
        Run(ahkPath " remap\keyboard_latn.ahk")
        SetTimer(ToolTip,-1500)
        ToolTip("Slavic Latin")
    }
    else if WinLatn {
        WinClose("ahk_id" HWND_latn)
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
        WinClose("ahk_id" HWND_cyrs)
        Run(ahkPath " remap\keyboard_glag.ahk")
        SetTimer(ToolTip,-1500)
        ToolTip("Glagolitic")
    }
    else if WinGlag {
        WinClose("ahk_id" HWND_glag)
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
    HWND_cyrl := IniRead(A_Temp "\UniSlav.tmp", "HWND", "cyrl", "")
    HWND_latn := IniRead(A_Temp "\UniSlav.tmp", "HWND", "latn", "")
    HWND_cyrs := IniRead(A_Temp "\UniSlav.tmp", "HWND", "cyrs", "")
    HWND_glag := IniRead(A_Temp "\UniSlav.tmp", "HWND", "glag", "")
    WinCyrl := WinExist("ahk_id " HWND_cyrl)
    WinLatn := WinExist("ahk_id " HWND_latn)
    WinCyrs := WinExist("ahk_id " HWND_cyrs)
    WinGlag := WinExist("ahk_id " HWND_glag)
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
    Send new
}

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
        WinClose("ahk_id" HWND_cyrl)
}
closeLatn() {
    if WinLatn
        WinClose("ahk_id" HWND_latn)
}
closeCyrs() {
    if WinCyrs
        WinClose("ahk_id" HWND_cyrs)
}
closeGlag() {
    if WinGlag
        WinClose("ahk_id" HWND_glag)
}
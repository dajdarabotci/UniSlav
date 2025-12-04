/*
Copyright (C) 2024-2025 Міја

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
lastKB := ""

Hotkey(HKModern " Up", ModernKB, "On")
Hotkey(HKChurch " Up", ChurchKB, "On")
ModernKBSet := [["", "cyrl", "Slavic Cyrillic"], ["cyrl", "latn", "Slavic Latin"], ["latn", "", "Exiting keyboard mode..."], ["cyrs", "cyrl", "Slavic Cyrillic"], ["glag", "cyrl", "Slavic Cyrillic"]]
ChurchKBSet := [["", "cyrs", "Early Cyrillic"], ["cyrs", "glag", "Glagolitic"], ["glag", "", "Exiting keyboard mode..."], ["cyrl", "cyrs", "Early Cyrillic"], ["latn", "cyrs", "Early Cyrillic"]]

ModernKB(*) {
    global lastKB
    for i, pair in ModernKBSet {
        if lastKB = pair[1] {
            if i > 1 {
                hwnd := IniRead(A_Temp "\UniSlav.tmp", "HWND", pair[1], "")
                if hwnd
                    WinClose("ahk_id " hwnd)
            }
            A_IconHidden := (i != 3) ? 1 : 0
            if i != 3
                Run(ahkPath " remap\keyboard_" pair[2] ".ahk")
            lastKB := pair[2]
            SetTimer(ToolTip, -1500)
            ToolTip(pair[3])
            break
        }
    }
}
ChurchKB(*) {
    global lastKB
    for i, pair in ChurchKBSet {
        if lastKB = pair[1] {
            if i > 1 {
                hwnd := IniRead(A_Temp "\UniSlav.tmp", "HWND", pair[1], "")
                if hwnd
                    WinClose("ahk_id " hwnd)
            }
            A_IconHidden := (i != 3) ? 1 : 0
            if i != 3
                Run(ahkPath " remap\keyboard_" pair[2] ".ahk")
            lastKB := pair[2]
            SetTimer(ToolTip, -1500)
            ToolTip(pair[3])
            break
        }
    }
}

OnExit cleanUp
cleanUp(*) {
    global
    ToolTip("Exiting UniSlav.")
    WinCyrl := IniRead(A_Temp "\UniSlav.tmp", "HWND", "cyrl", "")
    WinLatn := IniRead(A_Temp "\UniSlav.tmp", "HWND", "latn", "")
    WinCyrs := IniRead(A_Temp "\UniSlav.tmp", "HWND", "cyrs", "")
    WinGlag := IniRead(A_Temp "\UniSlav.tmp", "HWND", "glag", "")
    closeCyrl()
    closeLatn()
    closeCyrs()
    closeGlag()
    FileDelete(A_Temp "\UniSlav.tmp")
    Sleep 1500
}

closeCyrl() {
    if WinCyrl {
        WinClose("ahk_id " WinCyrl)
        WinWaitClose("ahk_id " WinCyrl)
    }
}
closeLatn() {
    if WinLatn {
        WinClose("ahk_id " WinLatn)
        WinWaitClose("ahk_id " WinLatn)
    }
}
closeCyrs() {
    if WinCyrs {
        WinClose("ahk_id " WinCyrs)
        WinWaitClose("ahk_id " WinCyrs)
    }
}
closeGlag() {
    if WinGlag {
        WinClose("ahk_id " WinGlag)
        WinWaitClose("ahk_id " WinGlag)
    }
}
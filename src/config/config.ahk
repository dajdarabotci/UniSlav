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
;@Ahk2Exe-SetMainIcon %A_ScriptDir%\..\assets\main.ico
;@Ahk2Exe-SetCopyright Copyright © 2024-2025 Міја
;@Ahk2Exe-SetDescription UniSlav Manager
;@Ahk2Exe-SetName UniSlav
;@Ahk2Exe-SetVersion 0.2.0
#SingleInstance Force
#NoTrayIcon
TraySetIcon("..\assets\main.ico")
DetectHiddenWindows(True)
A_ScriptName := "UniSlav Manager"
IniWrite(A_ScriptHwnd, A_Temp "\UniSlav.tmp", "HWND", "admin")

Lang := Map(
    "en", {Lang: "English"
    ,Tab: ["Settings","Information"]
    ,Text1: "Set the shortcut keys to launch each keyboard.`nPlease press a combination of Ctrl or Alt with a single key."
    ,Text2: "Modern Slavic keyboard (Slavic Cyrillic, Slavic Latin)"
    ,Text3: "Church Slavonic keyboard (Early Cyrillic, Glagolitic)"
    ,Text4: "This shortcut key cannot be set."
    ,Text5: "Modifier Key (for characters with diacritical marks such as Ў and Ą)"
    ,Modifier: ["Muhenkan (sc07B)","Henkan (sc079)","Alt","AltGr","≣ Menu key"]
    ,StartUp: "Automatically launch UniSlav on PC startup."
    ,Desktop: "Create a desktop shortcut."
    ,Save: "Apply"
    ,Toggle: "Launch / Exit UniSlav"}
    ,"ja", {Lang: "日本語"
    ,Tab: ["設定","情報"]
    ,Text1: "各キーボードを起動するためのショートカットキーを設定します。`nCtrl または Alt と1つのキーの組み合わせを押してください。"
    ,Text2: "現代スラヴ語キーボード (Slavic Cyrillic, Slavic Latin)"
    ,Text3: "教会スラヴ語キーボード (Early Cyrillic, Glagolitic)"
    ,Text4: "このショートカットキーは設定できません。"
    ,Text5: "修飾キー（Ў, Ą などのダイアクリティカル・マーク付き文字用）"
    ,Modifier: ["無変換","変換","Alt","AltGr","≣ メニューキー"]
    ,StartUp: "PC起動時に UniSlav を自動的に立ち上げる。"
    ,Desktop: "デスクトップ上にアイコンを作成する。"
    ,Save: "適用"
    ,Toggle: "UniSlav を起動/終了"}
)
systemLang := A_Language != "0411"||"0011" ? "ja" : "en"
currentLang := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Lang", systemLang)
HKModern := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "HKModern", "^1")
HKChurch := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "HKChurch", "^2")
Modifier := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Modifier", 1)
StartUp := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "StartUp", 0)
Desktop := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Desktop", 0)

createGui()
createGui() {
    global
    admin := Gui()
    admin.SetFont("s10", "Segoe UI")
    admin.SetFont("s10", "MS Pゴシック")
    setLang := admin.Add("DropDownList", , ["日本語","English"])
    setLang.Choose(Lang[currentLang].Lang)
    admin.Add("Tab3","vTab", Lang[currentLang].Tab)
    ;Tab1 settings
    admin.Add("Text",, Lang[currentLang].Text1) ; about settings
    admin.SetFont("bold",)
    admin.Add("Text",, Lang[currentLang].Text2) ; modern slavic keyboard
    admin.Add("Hotkey", "vHKModern Limit3", HKModern)
    admin.Add("Text",, Lang[currentLang].Text3) ; church slavonic keyboard
    admin.Add("Hotkey", "vHKChurch Limit3", HKChurch)
    admin.Add("Text", "w250 h0 0x10",)
    admin.Add("Text",, Lang[currentLang].Text5) ; set modifier key
    admin.Add("DropDownList", "vModifier Choose" Modifier, Lang[currentLang].Modifier)
    admin.SetFont("norm",)
    admin.Add("Checkbox", "vStartUp y+10 Checked" StartUp, Lang[currentLang].StartUp) ; startup setting
    admin.Add("Checkbox", "vDesktop Checked" Desktop, Lang[currentLang].Desktop)
    admin.Add("Button", "vSave Center", Lang[currentLang].Save)
    ;Tab2 info
    admin["Tab"].UseTab(2)
    admin.Add("Text", ,"Version:`n`nSoftware License:`n`n`nGitHub:`n`n`nKeyboard Layouts:")
    admin.Add("Link", "x+10", '0.2.0`n`n'
                            '<a href="https://www.gnu.org/licenses/old-licenses/gpl-2.0.html">GNU General Public License, version 2</a>`n'
                            'Copyright © 2024-2025 <a href="https://github.com/Mijadaj">Міја</a>`n`n'
                            '<a href="https://github.com/Mijadaj/UniSlav">Repository</a>, '
                            '<a href="https://github.com/Mijadaj/UniSlav/releases/latest">Latest release</a>,`n'
                            '<a href="https://github.com/Mijadaj/UniSlav/wiki">Wiki (Key Layouts)</a>,`n`n'
                            '<a href="..\..\README.html">README</a>'
    )
    ;bottom
    admin["Tab"].UseTab(0)
    admin.Add("Button", "vToggle Center", Lang[currentLang].Toggle)
    ;reload Gui
    setLang.OnEvent("Change",lang_change)
    admin.Show("Center")
    ;save settings
    admin["Save"].OnEvent("Click",save_Click)
    admin["Toggle"].OnEvent("Click",toggle_Click)
    admin.Show("Center")

    lang_change(*) {
        if setLang.Text = "日本語"
            currentLang := "ja"
        else if setLang.Text = "English"
            currentLang := "en"
        admin.Destroy
        createGui()
    }
    save_Click(*) {
        HKModern := admin["HKModern"].Value
        HKChurch := admin["HKChurch"].Value
        Modifier := admin["Modifier"].Value
        StartUp := admin["StartUp"].Value
        Desktop := admin["Desktop"].Value
        if !HKModern || !HKChurch {
            admin.Opt("+OwnDialogs")
            MsgBox Lang[currentLang].Text4, A_ScriptName, "48"
            return
        }
        else {
            RegWrite currentLang, "REG_SZ", "HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Lang"
            RegWrite HKModern, "REG_SZ", "HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "HKModern"
            RegWrite HKChurch, "REG_SZ", "HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "HKChurch"
            RegWrite Modifier, "REG_SZ", "HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Modifier"
            RegWrite StartUp, "REG_SZ", "HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "StartUp"
            RegWrite Desktop, "REG_SZ", "HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Desktop"
        }
        if StartUp
            FileCreateShortcut A_ScriptDir "\..\AutoHotkey64_UniSlav.exe", A_Startup "\UniSlav.lnk", A_ScriptDir "\..\", ".\UniSlav.ahk", "Launch UniSlav", A_ScriptDir "\..\assets\main.ico"
        else if FileExist(A_Startup "\UniSlav.lnk")
            FileDelete A_Startup "\UniSlav.lnk"
        if Desktop
            FileCreateShortcut A_ScriptDir "\..\AutoHotkey64_UniSlav.exe", A_Desktop "\UniSlav Manager.lnk", A_ScriptDir "\..\", ".\config\config.ahk", "Launch UniSlav", A_ScriptDir "\..\assets\main.ico"
        else if FileExist(A_Desktop "UniSlav Manager.lnk")
            FileDelete A_Desktop "UniSlav Manager.lnk"
        SetTimer(ToolTip,-2000)
        ToolTip("Saved settings.")
    }

    toggle_Click(*) {
        HWND_Ctrl := IniRead(A_Temp "\UniSlav.tmp", "HWND", "ctrl", "")
        SetTimer(ToolTip,-1500)
        if WinExist("ahk_id " HWND_Ctrl) {
            WinClose("ahk_id " HWND_Ctrl)
            ToolTip()
        }
        else {
            Run A_ScriptDir "\..\AutoHotkey64_UniSlav.exe" " ..\UniSlav.ahk"
        }
    }
}
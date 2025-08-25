config := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Modifier", 1)
x := [["sc07B","sc07B"],["sc079","sc079"],["~*Alt","Alt"],["~*<^>!","RAlt"],["~*AppsKey","AppsKey"]]
Modifier := x[config][1]
Hotkey Modifier, HKMod, "On I1"
HKMod(*) {
    SendEvent("{vk0E down}")
    KeyWait x[config][2]
    SendEvent("{vk0E up}")
}
;
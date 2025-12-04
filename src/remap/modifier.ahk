A_MenuMaskKey := "vkE8"
config := RegRead("HKEY_CURRENT_USER\Software\UniSlav\Hotkey", "Modifier", 1)
x := [["sc07B","sc07B"],["sc079","sc079"],["*LAlt","Alt"],["*<^>!","RAlt"],["*AppsKey","AppsKey"]]
Modifier := x[config][1]
key := x[config][2]
Hotkey Modifier, HKMod, "On I1"
HKMod(*) {
    Send("{vk0E down}")
    KeyWait key
    Send("{vk0E up}")
}
;
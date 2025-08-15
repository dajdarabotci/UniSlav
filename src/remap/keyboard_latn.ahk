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

;Slavic Latin keyboard
#SingleInstance Force
A_IconTip := "UniSlav - Slavic Latin"
TraySetIcon("..\icon\latn.ico",,false)
IniWrite(A_ScriptHwnd, A_Temp "\UniSlav.tmp", "HWND", "latn")
#Include "modifier.ahk"

;row 1
vk0E & 1:: ;-> lengthened & nasalized
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("ː") ; lengthened
}
vk0E & 2:: ;-> кавычки-left
{
   if GetKeyState("Shift")
      Send("«")
   else
      Send("“")
}
vk0E & 3:: ;-> кавычки-right
{
   if GetKeyState("Shift")
      Send("»")
   else
      Send("”")
}
vk0E & 4:: ;-> 
{
   if GetKeyState("Shift")
      Send("ʺ") ; modifier letter double prime
   else
      Send("„") ; 
}
vk0E & 5:: ;-> 
{
   if GetKeyState("Shift")
      Send("") ;
   else
      Send("") ; 
}
vk0E & 6:: ;-> palatalized & velarized
{
   if GetKeyState("Shift")
      Send("ˠ") ; 
   else
      Send("ʲ") ; 
}
vk0E & 7:: ;-> 
{
   if GetKeyState("Shift")
      Send("‹")
   else
      Send("‘") ; LEFT SINGLE QUOTATION MARK
}
vk0E & 8:: ;-> prime & apostrophe
{
   if GetKeyState("Shift")
      Send("›") ; 
   else
      Send("’") ; RIGHT SINGLE QUOTATION MARK
}
vk0E & 9:: ;-> 
{
   if GetKeyState("Shift")
      Send("ʹ") ; modifier letter prime
   else
      Send("‚") ; SINGLE LOW-9 QUOTATION MARK
}
vk0E & 0:: ;-> dotted circle & affricate
{
   if GetKeyState("Shift")
      Send("{U+0361}") ; affricate
   else
      Send("◌") ; dotted circle
 }
;-::Send("{U+2011}") ; non-breaking hyphen
vk0E & sc00C:: ;-> em dash
{
   if GetKeyState("Shift")
      Send("{U+2013}") ; en dash
   else
      Send("{U+2014}") ; em dash
}
vk0E & sc00D:: ; ^
{
   if GetKeyState("Shift")
      Send("Ь")
   else
      Send("ь")
}
vk0E & sc07D:: ; \ (only for JIS keyboard)
{
   if GetKeyState("Shift")
      Send("Ъ")
   else
      Send("ъ")
 }

;row 2
q::Send("ę")
+q::Send("Ę")
vk0E & q::
{
   if GetKeyState("Shift")
      Send("Ą")
   else
      Send("ą")
}
vk0E & w::
{
   if GetKeyState("Shift")
      Send("É")
   else
      Send("é")
}
vk0E & e::
{
   if GetKeyState("Shift")
      Send("Ě")
   else
      Send("ě")
}
vk0E & r::
{
   if GetKeyState("Shift")
      Send("Ř")
   else
      Send("ř")
}
vk0E & t::
{
   if GetKeyState("Shift")
      Send("Ť")
   else
      Send("ť")
}
vk0E & y::
{
   if GetKeyState("Shift")
      Send("Ý")
   else
      Send("ý")
}
vk0E & u::
{
   if GetKeyState("Shift")
      Send("Ú")
   else
      Send("ú")
}
vk0E & i::
{
   if GetKeyState("Shift")
      Send("Í")
   else
      Send("í")
}
vk0E & o::
{
   if GetKeyState("Shift")
      Send("Ó")
   else
      Send("ó")
}
vk0E & p::
{
   if GetKeyState("Shift")
      Send("Ǫ")
   else
      Send("ǫ")
}
sc01A::Send("{U+0301}") ; acute accent
vk0E & sc01A:: ;@
{
   if GetKeyState("Shift")
      Send("Ô")
   else
      Send("ô")
}
vk0E & sc01B:: ;[
{
   if GetKeyState("Shift")
      Send("Ŷ")
   else
      Send("ŷ")
 }

;row 3
vk0E & a::
{
   if GetKeyState("Shift")
      Send("Á")
   else
      Send("á")
}
vk0E & s::
{
   if GetKeyState("Shift")
      Send("Š")
   else
      Send("š")
}
vk0E & d::
{
   if GetKeyState("Shift")
      Send("Ď")
   else
      Send("ď")
}
vk0E & f::
{
   if GetKeyState("Shift")
      Send("Đ")
   else
      Send("đ")
}
vk0E & g::
{
   if GetKeyState("Shift")
      Send("Ǵ")
   else
      Send("ǵ")
}
vk0E & h::
{
   if GetKeyState("Shift")
      Send("Ś")
   else
      Send("ś")
}
vk0E & j::
{
   if GetKeyState("Shift")
      Send("Ů")
   else
      Send("ů")
}
vk0E & k::
{
   if GetKeyState("Shift")
      Send("Ḱ")
   else
      Send("ḱ")
}
vk0E & l::
{
   if GetKeyState("Shift")
      Send("Ł")
   else
      Send("ł")
}
vk0E & sc027:: ; semicolon
{
   if GetKeyState("Shift")
      Send("Ä")
   else
      Send("ä")
}
vk0E & sc028:: ; colon
{
   if GetKeyState("Shift")
      Send("Ë")
   else
      Send("ë")
}
vk0E & sc02B:: ; ]}
{
   if GetKeyState("Shift")
      Send("Ʒ")
   else
      Send("ʒ")
}

;row 4
vk0E & z::
{
   if GetKeyState("Shift")
      Send("Ž")
   else
      Send("ž")
}
vk0E & x::
{
   if GetKeyState("Shift")
      Send("Ż")
   else
      Send("ż")
}
vk0E & c::
{
   if GetKeyState("Shift")
      Send("Č")
   else
      Send("č")
}
vk0E & v::
{
   if GetKeyState("Shift")
      Send("Ć")
   else
      Send("ć")
}
vk0E & b::
{
   if GetKeyState("Shift")
      Send("Ź")
   else
      Send("ź")
}
vk0E & n::
{
   if GetKeyState("Shift")
      Send("Ň")
   else
      Send("ň")
}
vk0E & m::
{
   if GetKeyState("Shift")
      Send("Ń")
   else
      Send("ń")
 }

sc033::Send (",")
vk0E & sc033:: ; comma
{
   if GetKeyState("Shift")
      Send("Ĺ")
   else
      Send("ĺ")
}
vk0E & sc034:: ; period
{
   if GetKeyState("Shift")
      Send("Ľ")
   else
      Send("ľ")
}
vk0E & sc035:: ; slash
{
   if GetKeyState("Shift")
      Send("Ŕ")
   else
      Send("ŕ")
}
vk0E & sc073:: ; back slash (only for JIS keyboard)
{
   if GetKeyState("Shift")
      Send("Î")
   else
      Send("î")
 }

;miscellaneous characters
Ctrl & 0::
{
   if GetKeyState("Shift")
      WaitForAlphabet("ˇ") ; háček
   else
      WaitForAlphabet("0") ; inverted breve
}
Ctrl & sc00C::
{
   if GetKeyState("Shift")
      WaitForAlphabet("=") ; breve
   else
      WaitForAlphabet("-") ; macron
}
Ctrl & sc00D::
{
   if GetKeyState("Shift")
      WaitForAlphabet("~") ; tilde
   else
      WaitForAlphabet("^") ; circumflex
}
Ctrl & sc01A::
{
   if GetKeyState("Shift")
      WaitForAlphabet("``") ; double grave
   else
      WaitForAlphabet("@") ; grave
}
Ctrl & sc01B::WaitForAlphabet("[") ; double accute
Ctrl & sc02B::WaitForAlphabet("]") ; misc.
Ctrl & sc028::WaitForAlphabet(":") ; trema
Ctrl & sc033::WaitForAlphabet(",") ; comma below/cedilla
Ctrl & sc034::WaitForAlphabet(".") ; dot below


;function
CharMap := Map(
   "a0", ["ȃ","Ȃ"], "aˇ", ["ǎ","Ǎ"], "a^", ["â","Â"], "a~", ["ã","Ã"], "a-", ["ā","Ā"], "a=", ["ă","Ă"], "a@", ["à","À"], "a``", ["ȁ","Ȁ"], "a.", ["ạ","Ạ"], "a]", ["æ","Æ"], "a:", ["ä","Ä"]
  ,"e0", ["ȇ","Ȇ"], "eˇ", ["ě","Ě"], "e^", ["ê","Ê"], "e~", ["ẽ","Ẽ"], "e-", ["ē","Ē"], "e=", ["ĕ","Ĕ"], "e@", ["è","È"], "e``", ["ȅ","Ȅ"], "e.", ["ẹ","Ẹ"], "e]", ["ə","Ə"], "e:", ["ë","Ë"]
  ,"i0", ["ȋ","Ȋ"], "iˇ", ["ǐ","Ǐ"], "i^", ["î","Î"], "i~", ["ĩ","Ĩ"], "i-", ["ī","Ī"], "i=", ["ĭ","Ĭ"], "i@", ["ì","Ì"], "i``", ["ȉ","Ȉ"], "i.", ["ị","Ị"], "i]", ["į","Į"], "i:", ["ï","Ï"]
  ,"o0", ["ȏ","Ȏ"], "oˇ", ["ǒ","Ǒ"], "o^", ["ô","Ô"], "o~", ["õ","Õ"], "o-", ["ō","Ō"], "o=", ["ŏ","Ŏ"], "o@", ["ò","Ò"], "o``", ["ȍ","Ȍ"], "o.", ["ọ","Ọ"], "o]", ["œ","Œ"], "o:", ["ö","Ö"]
  ,"u0", ["ȗ","Ȗ"], "uˇ", ["ǔ","Ǔ"], "u^", ["û","Û"], "u~", ["ũ","Ũ"], "u-", ["ū","Ū"], "u=", ["ŭ","Ŭ"], "u@", ["ù","Ù"], "u``", ["ȕ","Ȕ"], "u.", ["ụ","Ụ"], "u]", ["ų","Ų"], "u:", ["ü","Ü"]
  ,"r0", ["ȓ","Ȓ"], "r``", ["ȑ","Ȑ"], "r.", ["ṛ","Ṛ"], "ʒˇ", ["ǯ","Ǯ"]
  ,"c^", ["ĉ","Ĉ"], "g^", ["ĝ","Ĝ"], "h^", ["ĥ","Ĥ"], "j^", ["ĵ","Ĵ"], "s^", ["ŝ","Ŝ"] ; for Esperanto
  ,"o[", ["ő","Ő"], "u[", ["ű","Ű"], "s]", ["ß","ẞ"] ; for Hungarian, German & French
  ,"c,", ["ç","Ç"], "g,", ["ģ","Ģ"], "k,", ["ķ","Ķ"], "l,", ["ļ","Ļ"], "n,", ["ņ","Ņ"], "s,", ["ș","Ș"], "t,", ["ț","Ț"]
  ,"0", "{U+0311}", "ˇ", "", "^", "{U+0302}" , "~", "{U+0303}", "-", "{U+0304}", "=", "{U+0306}", "@", "{U+0300}", "``", "{U+030F}", "[", "", ",", "", ".", "{U+0323}", "]", "", ":", "{U+0308}")

isHotKeyRunning := Map("0", [false, 0], "ˇ", [false, 0], "^", [false, 0], "~", [false, 0], "-", [false, 0], "=", [false, 0], "@", [false, 0], "``", [false, 0], "[", [false, 0], ",", [false, 0], ".", [false, 0], "]", [false, 0])

WaitForAlphabet(diacritic) {
   global isHotKeyRunning, base, combiningMark, result, CharMap
   SetFlags(diacritic)
   for key, value in isHotKeyRunning {
       if (key != diacritic && value[1]) { ; Check if other HotKey is running
           isHotKeyRunning[diacritic][2] := 1 ; a HotKey has been activated before this HotKey
           isHotKeyRunning[key][1] := false ; set prior HotKey to false
           result := true
      }
   }
   ih := InputHook("L1")
   ih.Start()
   ih.Wait()
   char := ih.Input
   if (!isHotKeyRunning[diacritic][1]) { ; overwrite previous HotKey
      if (result) { ; send non-precomposed characters
         SendEvent("{a " isHotKeyRunning[diacritic][2] "}") ; send {a} in order to make ih.EndReason "Max"
         if (isHotKeyRunning[diacritic][2] = 0) { ; this is the first HotKey that is pressed (or the last HotKey in progress)
            SendInput(base)
            Sleep 0
            SendInput(combiningMark)
         }
         isHotKeyRunning[diacritic] := [false, 0]
         return
      }
      else ; send precomposed char
         SendEvent(char)
   }
   else {
      combinedKey := StrLower(char) diacritic
      if CharMap.Has(combinedKey) { ; send precomposed character
         if GetKeyState("Shift")
            SendEvent(CharMap[combinedKey][2]) ; uppercase
         else
            SendEvent(CharMap[combinedKey][1]) ; lowercase
      }
      else {
         combiningMark := CharMap[diacritic], base := char ; send base char + combining mark
         if (result) { ; if other HotKey is running
            SendEvent(char)
            isHotKeyRunning[diacritic][1] := false
            return
         }
         else {
            SendInput(base)
            Sleep 0
            SendInput(combiningMark)
         }
      }
   }
   ResetFlags(diacritic)
}

SetFlags(flag) {
   global
   isHotKeyRunning[flag] := [true, 0]
   result := false
}

ResetFlags(flag) {
   global
   isHotKeyRunning[flag] := [false, 0]
   result := false
}
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

;Slavic Cyrillic keyboard (Modern Slavic languages)
#Requires AutoHotkey >=2.0
#SingleInstance Force
A_IconTip := "UniSlav - Slavic Cyrillic"
TraySetIcon("..\assets\cyrl.ico",,true)
IniWrite(A_ScriptHwnd, A_Temp "\UniSlav.tmp", "HWND", "cyrl")
#Include "modifier.ahk"
OnExit clean
clean(*) {
   IniDelete(A_Temp "\UniSlav.tmp", "HWND", "cyrl")
}

;row 1
~vk0E & 1::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
~vk0E & 2::
{
   if GetKeyState("Shift")
      Send("“") ;  left double quote
   else
      Send("«")
}
~vk0E & 3::
{
   if GetKeyState("Shift")
      Send("”") ;  right double quote
   else
      Send("»")
}
~vk0E & 4::
{
   if GetKeyState("Shift")
      Send("„")
   else
      Send("")
}
~vk0E & 5::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
~vk0E & 6::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
~vk0E & 7::
{
   if GetKeyState("Shift")
      Send("ʹ") ; modifier letter prime
   else
      Send("‘") ; left single quotation
}
~vk0E & 8::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("’") ; right single quotation
}
~vk0E & 9::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("‚")
}
~vk0E & 0::
{
   if GetKeyState("Shift")
      Send("∅")
   else
      Send("◌")
}
~vk0E & sc00C::
{
   if GetKeyState("Shift")
      Send("–") ; en dash
   else
      Send("—") ; em dash
}
sc00D::Send("{U+0301}") ; combining acute accent
~vk0E & sc00D::
{
   if GetKeyState("Shift")
      SendText("~")
   else
      SendText("^")
 
;row 2і
}
q::SendText("й")
+q::SendText("Й")
~vk0E & q::
{
   if GetKeyState("Shift")
      Send("І")
   else
      Send("і")
}
w::SendText("ц")
+w::SendText("Ц")
~vk0E & w::
{
   if GetKeyState("Shift")
      Send("Ї")	
   else
      Send("ї")
}
e::SendText("у")
+e::SendText("У")
~vk0E & e::
{
   if GetKeyState("Shift")
      Send("Ў")
   else
      Send("ў")
}
r::SendText("к")
+r::SendText("К")
~vk0E & r::
{
   if GetKeyState("Shift")
      Send("Ќ")
   else
      Send("ќ")
}
t::SendText("е")
+t::SendText("Е")
~vk0E & t::
{
   if GetKeyState("Shift")
      Send("Ё")
   else
      Send("ё")
}
y::SendText("н")
+y::SendText("Н")
~vk0E & y::
{
   if GetKeyState("Shift")
      Send("Њ")
   else
      Send("њ")
}
u::SendText("г")
+u::SendText("Г")
~vk0E & u::
{
   if GetKeyState("Shift")
      Send("Ѓ")
   else
      Send("ѓ")
}
i::SendText("ш")
+i::SendText("Ш")
~vk0E & i::
{
   if GetKeyState("Shift")
      Send("Ґ")
   else
      Send("ґ")
}
o::SendText("щ")
+o::SendText("Щ")
~vk0E & o::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
p::SendText("з")
+p::SendText("З")
~vk0E & p::
{
   if GetKeyState("Shift")
      Send("Ѕ")
   else
      Send("ѕ")
}
sc01A::Send("х") ;@ mark
+sc01A::Send("Х")
~vk0E & sc01A::
{
   if GetKeyState("Shift")
      Send("``")
   else
      Send("@")
}
sc01B::Send("ъ") ;[
+sc01B::Send("Ъ")
~vk0E & sc01B::
{
   if GetKeyState("Shift")
      SendText("{")
   else
      Send("[")

;row 2
}
a::SendText("ф")
+a::SendText("Ф")
~vk0E & a::
{
   if GetKeyState("Ctrl")
      Send("Ѳ")
   else
      Send("ѳ")
}
s::SendText("ы")
+s::SendText("Ы")
~vk0E & s::
{
   if GetKeyState("Shift")
      Send("Ј")
   else
      Send("ј")
}
d::SendText("в")
+d::SendText("В")
~vk0E & d::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
f::SendText("а")
+f::SendText("А")
~vk0E & f:: 
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
g::SendText("п")
+g::SendText("П")
~vk0E & g::
{
   if GetKeyState("Shift")
      Send("Ѐ")
   else
      Send("ѐ")
}
h::SendText("р")
+h::SendText("Р")
~vk0E & h::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
j::SendText("о")
+j::SendText("О")
~vk0E & j::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
k::SendText("л")
+k::SendText("Л")
~vk0E & k::
{
   if GetKeyState("Shift")
      Send("Љ")
   else
      Send("љ")
}
l::SendText("д")
+l::SendText("Д")
~vk0E & l::
{
   if GetKeyState("Shift")
      Send("Ђ")
   else
      Send("ђ")
}
sc027::Send("ж") ; semicolonй
+sc027::Send("Ж") ; semicolon
~vk0E & sc027:: ;semicolon
{
   if GetKeyState("Shift")
      Send("Џ")
   else
      Send("џ")
}
sc028::Send("э") ; colon
+sc028::Send("Э") ; colon
~vk0E & sc028:: ;colon
{
   if GetKeyState("Shift")
      Send("Ѣ")
   else
      Send("ѣ")
}
sc02B::Send("є") ; right bracket
+sc02B::Send("Є") ; right bracket
~vk0E & sc02B:: ;right bracket
{
   if GetKeyState("Shift")
      SendText("}")
   else
      Send("]")
}
 
;row 3
z::SendText("я")
+z::SendText("Я")
~vk0E & z::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
x::SendText("ч")
+x::SendText("Ч")
~vk0E & x::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
c::SendText("с")
+c::SendText("С")
~vk0E & c::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
v::SendText("м")
+v::SendText("М")
~vk0E & v::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
b::SendText("и")
+b::SendText("И")
~vk0E & b::
{
   if GetKeyState("Shift")
      Send("Ѝ")
   else
      Send("ѝ")
}
n::SendText("т")
+n::SendText("Т")
~vk0E & n::
{
   if GetKeyState("Shift")
      Send("Ћ")
   else
      Send("ћ")
}
m::SendText("ь")
+m::SendText("Ь")
~vk0E & m::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
sc033::Send("б")
+sc033::Send("Б")
~vk0E & sc033::
{
   if GetKeyState("Shift")
      Send(";")
   else
      Send("<")
}
sc034::Send("ю")
+sc034::Send("Ю")
~vk0E & sc034::
{
   if GetKeyState("Shift")
      Send(":")
   else
      Send(">")
}
sc035::Send(",") 
+sc035::Send(".")
~vk0E & sc035::
{
   if GetKeyState("Shift")
      Send("?")
   else
      Send("/")
}

;row 5
Space::Send("{U+0020}") ;space
;phonetic extensions/superscript
sc00D & f:: ;a
{
   if GetKeyState("Shift")
      Send("{U+1E030}") ; cyrilliс
   else
      Send("{U+1D43}") ; latin a
}
sc00D & t:: ;e
{
   if GetKeyState("Shift")
      Send("{U+1E035}") ; cyrillic 
   else
      Send("{U+1D49}") ; latin e
}
sc00D & b:: ;i
{
   if GetKeyState("Shift")
      Send("{U+1E04C}") ; cyrillic 
   else
      Send("{U+2071}") ; latin i
}
sc00D & j:: ;o
{
   if GetKeyState("Shift")
      Send("{U+1E03C}") ; cyrillic 
   else
      Send("{U+1D52}") ; latin o
}
sc00D & s:: ;y
{
   if GetKeyState("Shift")
      Send("{U+1E047}") ; cyrillic ы
   else
      Send("") ; latin 
 
}
sc00D & e:: ;u
{
   if GetKeyState("Shift")
      Send("{U+1E041}") ; cyrillic у
   else
      Send("{U+02B8}") ; latin y
}
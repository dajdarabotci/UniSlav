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

; Early Cyrillic keyboard (Church Slavonic)
#Requires AutoHotkey >=2.0
#SingleInstance Force
A_IconTip := "UniSlav - Early Cyrillic"
TraySetIcon("..\assets\cyrs.ico",,true)
IniWrite(A_ScriptHwnd, A_Temp "\UniSlav.tmp", "HWND", "cyrs")
#Include "modifier.ahk"
OnExit clean
clean(*) {
   IniDelete(A_Temp "\UniSlav.tmp", "HWND", "cyrs")
}

;Basic characters
q::SendText("і")
+q::SendText("І")
w::SendText("ц")
+w::SendText("Ц")
e::SendText("ᲂу")
+e::SendText("Оу")
r::SendText("к")
+r::SendText("К")
t::SendText("е")
+t::SendText("Е")
y::SendText("н")
+y::SendText("Н")
u::SendText("г")
+u::SendText("Г")
i::SendText("ш")
+i::SendText("Ш")
o::SendText("щ")
+o::SendText("Щ")
p::SendText("з")
+p::SendText("З")
sc01A::SendText("х")
+sc01A::SendText("Х")
sc01B::SendText("ъ")
+sc01B::SendText("Ъ")
a::SendText("ф")
+a::SendText("Ф")
s::SendText("ꙑ")
+s::SendText("Ꙑ")
d::SendText("в")
+d::SendText("В")
f::SendText("а")
+f::SendText("А")
g::SendText("п")
+g::SendText("П")
h::SendText("р")
+h::SendText("Р")
j::SendText("о")
+j::SendText("О")
k::SendText("л")
+k::SendText("Л")
l::SendText("д")
+l::SendText("Д")
sc027::SendText("ж")
+sc027::SendText("Ж")
sc028::SendText("ѥ")
+sc028::SendText("Ѥ")
sc02B::SendText("ѣ")
+sc02B::SendText("Ѣ")
z::SendText("ꙗ")
+z::SendText("Ꙗ")
x::SendText("ч")
+x::SendText("Ч")
c::SendText("с")
+c::SendText("С")
v::SendText("м")
+v::SendText("М")
b::SendText("и")
+b::SendText("И")
n::SendText("т")
+n::SendText("Т")
m::SendText("ь")
+m::SendText("Ь")
sc033::SendText("б")
+sc033::SendText("Б")
sc034::SendText("ю")
+sc034::SendText("Ю")
sc035::SendText(",")
+sc035::SendText(".")
sc073::SendText("{U+0483}") ;titlo
+sc073::SendText("{U+0484}") ;soft sign
Space::SendText("{U+0020}") ;space

; secondary keyboard
vk0E & q:: ;-> iota
{
   if GetKeyState("Shift")
      Send("Ꙇ")
   else
      Send("ꙇ")
}
vk0E & w:: ;-> uk(alternative)
{
   if GetKeyState("Shift")
      Send("у")
   else
      Send("ѹ") ; unrecommended character
}
vk0E & e:: ;-> uk(vertical)
{
   if GetKeyState("Shift")
      Send("Ꙋ")
   else
      Send("ꙋ")
}
vk0E & r:: ;-> ksi
{
   if GetKeyState("Shift")
      Send("Ѯ")
   else
      Send("ѯ")
}
vk0E & t:: ;-> little yus
{
   if GetKeyState("Shift")
      Send("Ѧ")
   else
      Send("ѧ")
}
vk0E & y::
{
   if GetKeyState("Shift")
      Send("Ꙙ")
   else
      Send("ꙙ")
}
vk0E & u:: ;-> tshe
{
   if GetKeyState("Shift")
      Send("Ћ")
   else
      Send("ћ")
}
vk0E & i:: ;-> djerv
{
   if GetKeyState("Shift")
      Send("Ꙉ")
   else
      Send("ꙉ")
}
vk0E & o::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & p:: ;-> dze
{
   if GetKeyState("Shift")
      Send("Ѕ")
   else
      Send("ѕ")
}
vk0E & sc01A::
{
   if GetKeyState("Shift")
      Send("Ꙁ")
   else
      Send("ꙁ")
}
vk0E & sc01B::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & a::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & s::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & d::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & f:: 
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & g:: ;-> psi
{
   if GetKeyState("Shift")
      Send("Ѱ")
   else
      Send("ѱ")
}
vk0E & h::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & j:: ;-> big yus
{
   if GetKeyState("Shift")
      Send("Ѫ")
   else
      Send("ѫ")
}
vk0E & k:: ;-> omega
{
   if GetKeyState("Shift")
      Send("Ѡ")
   else
      Send("ѡ")
}
vk0E & l:: ;-> ot
{
   if GetKeyState("Shift")
      Send("Ѿ")
   else
      Send("ѿ")
}
vk0E & sc027::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & sc028:: ;-> iotified little yus
{
   if GetKeyState("Shift")
      Send("Ѩ")
   else
      Send("ѩ")
}
vk0E & sc02B::
{
   if GetKeyState("Shift")
      Send("Ꙝ")
   else
      Send("ꙝ")
}
vk0E & z::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & x:: ;-> koppa
{
   if GetKeyState("Shift")
      Send("Ҁ")
   else
      Send("ҁ")
}
vk0E & c::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & v::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & b:: ;-> izhitsa
{
   if GetKeyState("Shift")
      Send("Ѵ")
   else
      Send("ѵ")
}
vk0E & n:: ;-> fita
{
   if GetKeyState("Shift")
      Send("Ѳ")
   else
      Send("ѳ")
}
vk0E & m::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & sc033::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & sc034:: ;-> iotified big yus
{
   if GetKeyState("Shift")
      Send("Ѭ")
   else
      Send("ѭ")
}
vk0E & sc035::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & sc073::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
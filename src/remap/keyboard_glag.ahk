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

; Glagolitic keyboard
#Requires AutoHotkey >=2.0
#SingleInstance Force
A_IconTip := "UniSlav - Glagolitic"
TraySetIcon("..\assets\glag.ico",,true)
IniWrite(A_ScriptHwnd, A_Temp "\UniSlav.tmp", "HWND", "glag")
#Include "modifier.ahk"
OnExit clean
clean(*) {
   IniDelete(A_Temp "\UniSlav.tmp", "HWND", "glag")
}

;row 1 qwerty
q::Send("ⰹ")
+q::Send("Ⰹ")
w::Send("ⱌ")
+w::Send("Ⱌ")
e::Send("ⱆ")
+e::Send("Ⱆ")
r::Send("ⰽ")
+r::Send("Ⰽ")
t::Send("ⰵ")
+t::Send("Ⰵ")
y::Send("ⱀ")
+y::Send("Ⱀ")
u::Send("ⰳ")
+u::Send("Ⰳ")
i::Send("ⱎ")
+i::Send("Ⱎ")
o::Send("ⱋ")
+o::Send("Ⱋ")
p::Send("ⰸ")
+p::Send("Ⰸ")
sc01A::Send("ⱈ") ;@ mark
+sc01A::Send("Ⱈ") ;@ mark
sc01B::Send("ⱏ") ;[
+sc01B::Send("Ⱏ") ;[

;row 2 asdfg...
a::Send("ⱇ")
+a::Send("Ⱇ")
s::Send("ⱏⰹ")
+s::Send("ⰟⰉ")
d::Send("ⰲ")
+d::Send("Ⰲ")
f::Send("ⰰ")
+f::Send("Ⰰ")
g::Send("ⱂ")
+g::Send("Ⱂ")
h::Send("ⱃ")
+h::Send("Ⱃ")
j::Send("ⱁ")
+j::Send("Ⱁ")
k::Send("ⰾ")
+k::Send("Ⰾ")
l::Send("ⰴ")
+l::Send("Ⰴ")
sc027::Send("ⰶ") ;semicolon
+sc027::Send("Ⰶ") ;semicolon
sc028::Send("") ;colon
+sc028::Send("") ;colon
sc02B::Send("ⱑ") ;]
+sc02B::Send("Ⱑ") ;]

;row 3 zxcv...
z::Send("")
+z::Send("")
x::Send("ⱍ")
+x::Send("Ⱍ")
c::Send("ⱄ")
+c::Send("Ⱄ")
v::Send("ⰿ")
+v::Send("Ⰿ")
b::Send("ⰻ")
+b::Send("Ⰻ")
n::Send("ⱅ")
+n::Send("Ⱅ")
m::Send("ⱐ")
+m::Send("Ⱐ")
sc033::Send("ⰱ") ;comma
+sc033::Send("Ⰱ") ;comma
sc034::Send("ⱓ") ;period
+sc034::Send("Ⱓ") ;period
sc035::Send(",") ;slash
+sc035::Send(".") ;slash
sc073::Send("") ;backslash
+sc073::Send("") ;backslash
Space::Send("{U+0020}") ;space

; secondary keyboard
vk0E & q:: ;-> iota
{
   if GetKeyState("Shift")
      Send("Ⰺ")
   else
      Send("ⰺ")
}
vk0E & w::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & e::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & r::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & t:: ;-> little yus
{
   if GetKeyState("Shift")
      Send("Ⱔ")
   else
      Send("ⱔ")
}
vk0E & y::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & u:: ;-> djerv
{
   if GetKeyState("Shift")
      Send("Ⰼ")
   else
      Send("ⰼ")
}
vk0E & i::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
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
      Send("Ⰷ")
   else
      Send("ⰷ")
}
vk0E & sc01A::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
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
vk0E & g::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
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
      Send("Ⱘ")
   else
      Send("ⱘ")
}
vk0E & k:: ;-> omega
{
   if GetKeyState("Shift")
      Send("Ⱉ")
   else
      Send("ⱉ")
}
vk0E & l::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
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
      Send("Ⱗ")
   else
      Send("ⱗ")
}
vk0E & sc02B::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & z::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
}
vk0E & x::
{
   if GetKeyState("Shift")
      Send("")
   else
      Send("")
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
      Send("Ⱛ")
   else
      Send("ⱛ")
}
vk0E & n:: ;-> fita
{
   if GetKeyState("Shift")
      Send("Ⱚ")
   else
      Send("ⱚ")
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
      Send("Ⱙ")
   else
      Send("ⱙ")
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
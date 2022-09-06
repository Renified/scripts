local a=game:GetService'HttpService'local b=game:GetService'Players'local c=game
:GetService'ProximityPromptService'local d=game:GetService'ReplicatedStorage'
local e=game:GetService'RunService'local f=game:GetService'SoundService'local g=
game:GetService'UserInputService'local h=game:GetService'Workspace'local i=game:
GetService'ContentProvider'local j=game:GetService'CoreGui'do if getgenv().evade
then return end getgenv().evade=true end do local k k=hookfunction(i.
PreloadAsync,function(l,m,n)if table.find(m,j)then local o=function(o,p)if o:
match'^rbxasset://'or o:match'^rbxthumb://'then return n(o,p)end end warn
'Anticheat Check Detected'return k(l,m,o)end return k(l,m,n)end)end local k={
Character='Character',VelocityMover='h',PlayerVel='d'}local l=
[[https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/]]local m=
loadstring(game:HttpGet(l..'Library.lua'))()local n=loadstring(game:HttpGet(l..
'addons/SaveManager.lua'))()local o=loadstring(game:HttpGet(l..
'addons/ThemeManager.lua'))()local p=b.LocalPlayer local q=h.CurrentCamera local
r=h:WaitForChild('Game',5)local s=r:WaitForChild('Players',5)local t={}local u
do u={}u.attached={}u.__index=u local v=Vector3.new(1,0,1)function u.new(w)local
x=setmetatable({instance=w,destructed=false},u)x._destroyListener=x.instance.
AncestryChanged:Connect(function(y,z)if z==nil then x:destroy()end end)return x:
constructor(w)end function u.constructor(w,x)w.root=x:WaitForChild(
'HumanoidRootPart',5)w.humanoid=x:WaitForChild('Humanoid',5)u.attached[x]=w task
.defer(w.onStart,w)return w end function u.onStart(w)w.humanoid.StateChanged:
Connect(function(x,y)w:onStateChange(x,y)end)task.defer(function()repeat task.
wait(0.25)for x,y in ipairs(getgc(true))do if type(y)=='table'then local z=
rawget(y,k.Character)if z==w.instance then local A=rawget(y,k.VelocityMover)if
typeof(A)=='Instance'then local B=rawget(y,k.PlayerVel)if typeof(B)=='Vector3'
then t=y m:Notify'Movement Module Found'break end end end end end until w.
destructed or t[k.Character]==w.instance end)end function u.onStateChange(w,x,y)
if y==Enum.HumanoidStateType.Landed then while Toggles.BHOP_ENABLED.Value and
Options.BHOP_KEYBIND:GetState()do if iswindowactive()then keypress(0x20)task.
wait()keyrelease(0x20)end task.wait()local z=w.humanoid:GetState()if z==Enum.
HumanoidStateType.Freefall or z==Enum.HumanoidStateType.Jumping then if Toggles.
BHOP_NOTIFICATIONS.Value then m:Notify
'[BHOP Assistant]: Jump has been simulated.'end break end end elseif y==Enum.
HumanoidStateType.Jumping then if t[k.Character]==w.instance then local z=
Options.BHOP_CONTROL_ALPHA.Value/100 if Toggles.BHOP_CONTROL.Value and z>0 then
local A=w.humanoid.MoveDirection*v local B=q.CFrame.LookVector*v if A.Magnitude>
0 and B.Magnitude>0 then local C=A.Unit:Lerp(B.Unit,0.75)local D=t[k.PlayerVel]
local E=C.Unit*D.Magnitude*(1+(z/10))t[k.PlayerVel]=D:Lerp(E,z)end end end end
end function u.onPhysics(w,x,y)if t[k.Character]==w.instance then local z=
Options.BOOST_AMOUNT.Value*200 if z>0 and Toggles.BOOST_ENABLED.Value and
Options.BOOST_KEYBIND:GetState()then local A=w.humanoid.MoveDirection*v if A.
Magnitude>0 then local B=k.PlayerVel t[B]=t[B]+(A.Unit*z*y)end end end end
function u.destroy(w)if w.destructed then return else w.destructed=true w.
_destroyListener:Disconnect()end u.attached[w.instance]=nil end end local v do v
={}v.attached={}v.__index=v function v.new(w)local x=setmetatable({instance=w,
destructed=false},v)x._destroyListener=x.instance.AncestryChanged:Connect(
function(y,z)if z==nil then x:destroy()end end)return x:constructor(w)end
function v.constructor(w,x)w.root=x:WaitForChild('HumanoidRootPart',5)w.humanoid
=x:WaitForChild('Humanoid',5)v.attached[x]=w task.defer(w.onStart,w)return w end
function v.onStart(w)end function v.render(w)end function v.destroy(w)if w.
destructed then return else w.destructed=true w._destroyListener:Disconnect()end
v.attached[w.instance]=nil end end local w do w={}w.__index=w function w.new(x)
local y=setmetatable({instance=x,destructed=false},w)y._destroyListener=y.
instance.AncestryChanged:Connect(function(z,A)if A==nil then y:destroy()end end)
return y:constructor(x)end function w.constructor(x,y)task.defer(x.onStart,x)
return x end function w.onStart(x)local y=x.instance y.CharacterAdded:Connect(
function(z)x:onCharacter(z)end)do local z=y.Character if z then x:onCharacter(z)
end end end function w.onCharacter(x,y)v.new(y)end function w.destroy(x)if x.
destructed then return else x.destructed=true x._destroyListener:Disconnect()end
end end local x do x={}x.attached={}x.__index=x local y=q.WorldToViewportPoint
local z,A=Vector2.new,CFrame.new function x.new(B)local C=setmetatable({instance
=B,destructed=false},x)C._destroyListener=C.instance.AncestryChanged:Connect(
function(D,E)if E==nil then C:destroy()end end)return C:constructor(B)end
function x.constructor(B,C)B.root=C:WaitForChild('HumanoidRootPart',5)B.
indicator=Drawing.new'Square'B.nameLabel=Drawing.new'Text'B.distanceLabel=
Drawing.new'Text'x.attached[C]=B task.defer(B.onStart,B)return B end function x.
onStart(B)local C,D,E=B.indicator,B.nameLabel,B.distanceLabel C.Visible=false C.
Filled=true C.Size=Vector2.new(10,10)D.Visible=false D.Text=B.instance.Name D.
Size=20 D.Center=true D.Outline=true E.Visible=false E.Text='000'E.Size=18 E.
Center=true E.Outline=true end function x.render(B)local C=B.root local D,E,F=B.
indicator,B.nameLabel,B.distanceLabel if Toggles.ENTITY_ESP.Value then local G=
y(q,C.Position)if G.Z>0 then F.Text=tostring(math.floor(G.Z))D.Position=z(G.X-5,
G.Y-5)E.Position=z(G.X,G.Y-E.TextBounds.Y-6)F.Position=z(G.X,G.Y+6)D.Color=
Options.ENTITY_ESP_COLOR.Value E.Color=Options.ENTITY_ESP_COLOR.Value F.Color=
Options.ENTITY_ESP_COLOR.Value D.Visible=true E.Visible=true F.Visible=true
return end end D.Visible=false E.Visible=false F.Visible=false end function x.
destroy(B)if B.destructed then return else B.destructed=true B._destroyListener:
Disconnect()end x.attached[B.instance]=nil B.indicator:Remove()B.nameLabel:
Remove()B.distanceLabel:Remove()end end m:SetWatermark
'Linoria Community (OminousVibes)'m:Notify'Loading UI...'do local y=m:
CreateWindow'Evade'do local z=y:AddTab'Gameplay'do local A=z:AddLeftTabbox'BHOP'
local B=A:AddTab'Auto B-hop'B:AddToggle('BHOP_ENABLED',{Text='Enabled',Default=
false,Tooltip='Enables Auto Bhop'}):AddKeyPicker('BHOP_KEYBIND',{Text=
'Auto Bhop',Default='L'})B:AddToggle('BHOP_CONTROL',{Text='Hop Control',Default=
false,Tooltip='Improved direction control during hops.'})B:AddSlider(
'BHOP_CONTROL_ALPHA',{Text='Hop Control Percentage',Min=0,Max=100,Default=0,
Rounding=0,Suffix='%'})B:AddToggle('BOOST_ENABLED',{Text='Sprint Enabled',
Default=false,Tooltip='Enables Sprinting by pressing the Keybind'}):
AddKeyPicker('BOOST_KEYBIND',{Text='Sprint',Default='LeftShift'})B:AddSlider(
'BOOST_AMOUNT',{Text='Sprint Boost (in seconds)',Min=0,Max=100,Default=0,
Rounding=1,Suffix=' studs'})local C=A:AddTab'Advanced'C:AddToggle(
'BHOP_NOTIFICATIONS',{Text='Notifications',Default=true,Tooltip=
'Enables notifications for Auto Bhop'})end do local A=z:AddRightTabbox
'Modifications'local B=A:AddTab'Character Mods'B:AddToggle('MODS_ENABLED',{Text=
'Enabled',Default=false,Tooltip='Character mods Enabled'})local C=A:AddTab
'World Mods'end end do local z=y:AddTab'Blatant'end do local z=y:AddTab'Visuals'
do local A=z:AddLeftTabbox'Visuals'local B=A:AddTab'Entity Visuals'B:AddToggle(
'PLAYER_ESP',{Text='Player ESP',Default=true,Tooltip='ESP for other players'}):
AddColorPicker('PLAYER_ESP_COLOR',{Title='ESP Color',Default=Color3.new(1,1,1)})
B:AddToggle('ENTITY_ESP',{Text='Entity ESP',Default=true,Tooltip=
'ESP for Entities'}):AddColorPicker('ENTITY_ESP_COLOR',{Title='ESP Color',
Default=Color3.new(1,0,0)})local C=A:AddTab'Object Visuals'end end do local z=y:
AddTab'Credits'local A=z:AddLeftGroupbox'Credits'A:AddLabel
'OminousVibes - Creator'A:AddLabel'Inori @v3rm - UI Library'A:AddDivider()A:
AddLabel'Contributors:'A:AddDivider()A:AddLabel'Donators:'A:AddLabel
'> reversing#2937 @Discord'local B=z:AddRightGroupbox'Socials'B:AddButton(
'Discord Server',function()setclipboard'https://discord.gg/8PATx7UKXZ'end)end do
local z=y:AddTab'Settings'o:SetLibrary(m)n:SetLibrary(m)o:SetFolder
'OminousVibes'n:SetFolder'OminousVibes/evade'n:IgnoreThemeSettings()n:
SetIgnoreIndexes{'MenuKeybind'}n:BuildConfigSection(z)o:ApplyToTab(z)local A=z:
AddLeftGroupbox'Menu'A:AddButton('Unload',function()m:Unload()end)A:AddLabel
'Menu bind':AddKeyPicker('MenuKeybind',{Default='End',NoUI=true,Text=
'Menu keybind'})A:AddToggle('Keybinds',{Text='Show Keybinds Menu',Default=true})
:OnChanged(function()m.KeybindFrame.Visible=Toggles.Keybinds.Value end)A:
AddToggle('Watermark',{Text='Show Watermark',Default=true}):OnChanged(function()
m:SetWatermarkVisibility(Toggles.Watermark.Value)end)end end m:Notify
'UI Built! [Right Ctrl or Right Shift]'n:LoadAutoloadConfig()do local y=string.
lower local z z=hookmetamethod(game,'__namecall',function(A,...)if not
checkcaller()then local B=y(getnamecallmethod())end return z(A,...)end)end local
y=function(y,z)for A,B in pairs(u.attached)do B:onPhysics(y,z)end end local z=
function(z)for A,B in pairs(x.attached)do B:render(z)end end local A=function(A)
u.new(A)end local B=function(B)w.new(B)end local C=function(C)if not b:
GetPlayerFromCharacter(C)then x.new(C)end end e.Stepped:Connect(y)e.
RenderStepped:Connect(z)b.PlayerAdded:Connect(B)p.CharacterAdded:Connect(A)s.
ChildAdded:Connect(C)if p.Character then task.defer(A,p.Character)end for D,E in
ipairs(b:GetPlayers())do if E~=p then task.defer(B,E)end end for F,G in ipairs(s
:GetChildren())do task.defer(C,G)end return m:Notify'[Evade] Loaded! (v1)'
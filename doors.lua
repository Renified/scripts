local a=game:GetService'HttpService'local b=game:GetService'Players'local c=game
:GetService'ProximityPromptService'local d=game:GetService'ReplicatedStorage'
local e=game:GetService'RunService'local f=game:GetService'SoundService'local g=
game:GetService'UserInputService'local h=game:GetService'Workspace'local i=game:
GetService'ContentProvider'local j=game:GetService'CoreGui'do if getgenv().doors
then return end getgenv().doors=true end do local k k=hookfunction(i.
PreloadAsync,function(l,m,n)if table.find(m,j)then local o=function(o,p)if o:
match'^rbxasset://'or o:match'^rbxthumb://'then return n(o,p)end end warn
'Anticheat Check Detected'return k(l,m,o)end return k(l,m,n)end)end local k=
[[https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/]]local l=
loadstring(game:HttpGet(k..'Library.lua'))()local m=loadstring(game:HttpGet(k..
'addons/SaveManager.lua'))()local n=loadstring(game:HttpGet(k..
'addons/ThemeManager.lua'))()local o=b.LocalPlayer local p=h.CurrentCamera local
q=Instance.new'Sound'local r=Instance.new'PointLight'local s=Instance.new
'SurfaceLight'local t=d:WaitForChild'GameData'local u=d:WaitForChild'Bricks'
local v={PadlockHint=u:WaitForChild'PadlockHint',EngageMinigame=u:WaitForChild
'EngageMinigame',ClutchHeartbeat=u:WaitForChild'ClutchHeartbeat',Screech=u:
WaitForChild'Screech',Cutscene=u:WaitForChild'Cutscene'}local w={}local x=0
local y={}local z=function(z,A)l:Notify(z)if A and Toggles.SOUND_NOTIFIER.Value
then q.TimePosition=0.25 q:Play()end end local A do A={}A.attached={}A.__index=A
local B=Vector3.new(1,0,1)function A.new(C)local D=setmetatable({instance=C,
destructed=false},A)D._destroyListener=D.instance.AncestryChanged:Connect(
function(E,F)if F==nil then D:destroy()end end)return D:constructor(C)end
function A.constructor(C,D)C.root=D:WaitForChild('HumanoidRootPart',5)C.humanoid
=D:WaitForChild('Humanoid',5)A.attached[D]=C task.defer(C.onStart,C)return C end
function A.onStart(C)C.instance.ChildAdded:Connect(function(D)if D:IsA'Tool'then
C:onToolAdded(D)end end)end function A.onToolAdded(C,D)if D.Name==
'LibraryHintPaper'then if not Toggles.PADLOCK_CODE.Value then return end local E
=D:WaitForChild('UI',1)if E then local F={}for G=1,5 do local H=E:
FindFirstChild(tostring(G),1)if H then local I=w[H.ImageRectOffset.X/50]if I~=
nil then F[G]=I end end end local G=''for H=1,5 do local I=F[H]G=G..(I or'_')end
l:Notify('[Code Parser]: '..G,10)end end end function A.onPhysics(C,D,E)local F=
Options.SPRINT_BOOST.Value if F>0 and Toggles.SPRINT_ENABLED.Value and Options.
SPRINT_KEYBIND:GetState()then local G=C.humanoid.MoveDirection*B if G.Magnitude>
0 then C.instance:TranslateBy(G*F*E)end end end function A.destroy(C)if C.
destructed then return else C.destructed=true C._destroyListener:Disconnect()end
A.attached[C.instance]=nil end end local B do B={}B.attached={}B.__index=B local
C=p.WorldToViewportPoint local D,E=Vector2.new,CFrame.new local F=Vector3.new(
1.2,1.6,0)function B.new(G)local H=setmetatable({instance=G,destructed=false},B)
H._destroyListener=H.instance.AncestryChanged:Connect(function(I,J)if J==nil
then H:destroy()end end)return H:constructor(G)end function B.constructor(G,H)G.
root=H:WaitForChild('HumanoidRootPart',5)G.humanoid=H:WaitForChild('Humanoid',5)
G.quad=Drawing.new'Quad'G.label=Drawing.new'Text'B.attached[H]=G task.defer(G.
onStart,G)return G end function B.onStart(G)if G.destructed then return end
local H,I=G.quad,G.label H.Visible=false H.Transparency=0.6 H.Thickness=2 I.Text
=G.humanoid.DisplayName or G.instance.Name I.Size=20 I.Center=true I.Outline=
true I.Visible=false end function B.render(G)local H=G.root local I,J=G.quad,G.
label if Toggles.PLAYER_ESP.Value then local K=H.CFrame local L=H.Size*F local M
=C(p,(K*E(0,L.Y,0)).Position)local N=C(p,(K*E(L.X,L.Y,0)).Position)local O=C(p,(
K*E(-L.X,L.Y,0)).Position)local P=C(p,(K*E(-L.X,-L.Y,0)).Position)local Q=C(p,(K
*E(L.X,-L.Y,0)).Position)if math.min(N.Z,O.Z,P.Z,Q.Z)>0 then J.Position=D(M.X,M.
Y)-D(0,J.TextBounds.Y)J.Color=Options.PLAYER_ESP_COLOR.Value J.Visible=true I.
PointA=D(O.X,O.Y)I.PointB=D(N.X,N.Y)I.PointC=D(Q.X,Q.Y)I.PointD=D(P.X,P.Y)I.
Color=Options.PLAYER_ESP_COLOR.Value I.Visible=true else J.Visible=false I.
Visible=false end else J.Visible=false I.Visible=false end end function B.
destroy(G)if G.destructed then return else G.destructed=true G._destroyListener:
Disconnect()end B.attached[G.instance]=nil G.quad:Remove()G.label:Remove()end
end local C do C={}C.__index=C function C.new(D)local E=setmetatable({instance=D
,destructed=false},C)E._destroyListener=b.PlayerRemoving:Connect(function(F)if F
==D then E:destroy()end end)return E:constructor(D)end function C.constructor(D,
E)task.defer(D.onStart,D)return D end function C.onStart(D)local E=D.instance E.
CharacterAdded:Connect(function(F)D:onCharacterAdded(F)end)local F=E.Character
if F then D:onCharacterAdded(F)end end function C.onCharacterAdded(D,E)B.new(E)
end function C.destroy(D)if D.destructed then return else D.destructed=true end
end end local D do D={}D.attached={}D.__index=D local E=p.WorldToViewportPoint
local F,G=Vector2.new,CFrame.new local H=G(0,1,0)function D.new(I)local J=
setmetatable({instance=I,destructed=false},D)J._destroyListener=J.instance.
AncestryChanged:Connect(function(K,L)if L==nil then J:destroy()end end)return J:
constructor(I)end function D.constructor(I,J)local K=J local L=K:WaitForChild(
'FigureRagdoll',2.5)I.root=L:WaitForChild('Root',2.5)I.quad=Drawing.new'Quad'
task.defer(function()I:onStart()D.attached[J]=I end)return I end function D.
onStart(I)local J=I.quad J.Visible=false J.Transparency=0.75 J.Color=Color3.new(
1,0,0)J.Thickness=3 end function D.render(I)local J=I.quad local K=I.root if
Toggles.FIGURE_ESP.Value then local L=K.CFrame*H local M=K.Size*1.75 local N=E(p
,(L*G(M.X,M.Y,0)).Position)local O=E(p,(L*G(-M.X,M.Y,0)).Position)local P=E(p,(L
*G(-M.X,-M.Y,0)).Position)local Q=E(p,(L*G(M.X,-M.Y,0)).Position)if math.min(N.Z
,O.Z,P.Z,Q.Z)>0 then J.PointA=F(O.X,O.Y)J.PointB=F(N.X,N.Y)J.PointC=F(Q.X,Q.Y)J.
PointD=F(P.X,P.Y)J.Visible=true else J.Visible=false end else J.Visible=false
end end function D.destroy(I)if I.destructed then return else I.destructed=true
I._destroyListener:Disconnect()end D.attached[I.instance]=nil I.quad:Remove()end
end local E do E={}E.attached={}E.__index=E local F=p.WorldToViewportPoint local
G,H=Vector2.new,CFrame.new local I=Vector3.new(0.4,0.8,0)function E.new(J)local
K=setmetatable({instance=J,destructed=false},E)K._destroyListener=K.instance.
AncestryChanged:Connect(function(L,M)if M==nil then K:destroy()end end)return K:
constructor(J)end function E.constructor(J,K)J.quad=Drawing.new'Quad'J.root=K.
PrimaryPart or K:WaitForChild('RushNew',5)task.defer(function()J:onStart()E.
attached[K]=J end)return J end function E.onStart(J)local K=J.quad K.Visible=
false K.Transparency=0.75 K.Color=Color3.new(1,0,0)K.Thickness=2 end function E.
render(J)local K=J.quad local L=J.root if Toggles.RUSH_ESP.Value then local M=L.
CFrame local N=L.Size*I local O=F(p,(M*H(N.X,N.Y,0)).Position)local P=F(p,(M*H(-
N.X,N.Y,0)).Position)local Q=F(p,(M*H(-N.X,-N.Y,0)).Position)local R=F(p,(M*H(N.
X,-N.Y,0)).Position)if math.min(O.Z,P.Z,Q.Z,R.Z)>0 then K.PointA=G(P.X,P.Y)K.
PointB=G(O.X,O.Y)K.PointC=G(R.X,R.Y)K.PointD=G(Q.X,Q.Y)K.Visible=true else K.
Visible=false end else K.Visible=false end end function E.destroy(J)if J.
destructed then return else J.destructed=true J._destroyListener:Disconnect()end
E.attached[J.instance]=nil J.quad:Remove()end end local F do F={}F.attached={}F.
__index=F local G=p.WorldToViewportPoint local H,I=Vector2.new,CFrame.new
function F.new(J,K)local L=setmetatable({instance=J,destructed=false},F)L.
_destroyListener=L.instance.AncestryChanged:Connect(function(M,N)if N==nil then
L:destroy()end end)return L:constructor(J,K)end function F.constructor(J,K,L)J.
roomNumber=L J.quad=Drawing.new'Quad'task.defer(function()J:onStart()F.attached[
K]=J end)return J end function F.onStart(J)if J.destructed then return end local
K=J.quad K.Visible=false K.Transparency=0.6 K.Thickness=2 end function F.render(
J)local K=J.quad local L=J.instance.Door if t.LatestRoom.Value-J.roomNumber>2
then K.Visible=false return end if Toggles.DOOR_ESP.Value then local M=L.CFrame
local N=L.Size/2 local O=G(p,(M*I(N.X,N.Y,0)).Position)local P=G(p,(M*I(-N.X,N.Y
,0)).Position)local Q=G(p,(M*I(-N.X,-N.Y,0)).Position)local R=G(p,(M*I(N.X,-N.Y,
0)).Position)if math.min(O.Z,P.Z,Q.Z,R.Z)>0 then K.PointA=H(P.X,P.Y)K.PointB=H(O
.X,O.Y)K.PointC=H(R.X,R.Y)K.PointD=H(Q.X,Q.Y)K.Color=Options.DOOR_ESP_COLOR.
Value K.Visible=true else K.Visible=false end else K.Visible=false end end
function F.destroy(J)if J.destructed then return else J.destructed=true J.
_destroyListener:Disconnect()end F.attached[J.instance]=nil J.quad:Remove()end
end local G do G={}G.attached={}G.__index=G local H=p.WorldToViewportPoint local
I,J=Vector2.new,CFrame.new local K=J(0,0,-0.5)function G.new(L,M)local N=
setmetatable({instance=L,destructed=false},G)N._destroyListener=N.instance.
AncestryChanged:Connect(function(O,P)if P==nil then N:destroy()end end)return N:
constructor(L,M)end function G.constructor(L,M,N)L.roomNum=N L.root=M:
WaitForChild('Main',2.5)L.occupied=M:WaitForChild('HiddenPlayer',2.5)L.quad=
Drawing.new'Quad'task.defer(function()L:onStart()G.attached[M]=L end)return L
end function G.onStart(L)if L.destructed then return end local M=L.quad M.
Visible=false M.Thickness=2 end function G.render(L)local M=L.quad local N=L.
root local O=L.occupied.Value if not O and Toggles.WARDROBE_ESP.Value then local
P=N.CFrame*K local Q=N.Size*0.55 local R=H(p,(P*J(Q.X,Q.Y,0)).Position)local S=
H(p,(P*J(-Q.X,Q.Y,0)).Position)local T=H(p,(P*J(-Q.X,-Q.Y,0)).Position)local U=
H(p,(P*J(Q.X,-Q.Y,0)).Position)if math.min(R.Z,S.Z,T.Z,U.Z)>0 then M.PointA=I(S.
X,S.Y)M.PointB=I(R.X,R.Y)M.PointC=I(U.X,U.Y)M.PointD=I(T.X,T.Y)M.Color=Options.
WARDROBE_ESP_COLOR.Value M.Transparency=(t.LatestRoom.Value-L.roomNum>1)and 0.1
or 0.4 M.Visible=true else M.Visible=false end else M.Visible=false end end
function G.destroy(L)if L.destructed then return else L.destructed=true L.
_destroyListener:Disconnect()end G.attached[L.instance]=nil L.quad:Remove()end
end local H do H={}H.attached={}H.__index=H local I=p.WorldToViewportPoint local
J=Vector2.new(0,3)function H.new(K,L)local M=setmetatable({instance=K,destructed
=false},H)M._destroyListener=M.instance.AncestryChanged:Connect(function(N,O)if
O==nil then M:destroy()end end)return M:constructor(K,L)end function H.
constructor(K,L,M)K.name=M or L.Name K.label=Drawing.new'Text'K.indicator=
Drawing.new'Circle'K.outline=Drawing.new'Circle'task.defer(K.onStart,K)if not K.
destructed then H.attached[L]=K end return K end function H.onStart(K)if K.
destructed then return end local L,M,N=K.label,K.indicator,K.outline L.Text=K.
name L.Size=18 L.Center=true L.Outline=true L.Visible=false M.Thickness=1 M.
NumSides=12 M.Radius=5 M.Filled=true M.Visible=false N.Color=Color3.new()N.
Thickness=2 N.NumSides=12 N.Radius=5 N.Filled=false N.Visible=false N.ZIndex=2
end function H.render(K)local L,M,N=K.label,K.indicator,K.outline if Toggles.
OBTAINABLE_ESP.Value then local O,P=I(p,K.instance.Position)local Q=P and O.Z>
2.5 if Q then local R=Vector2.new(O.X,O.Y)L.Position=R+J M.Position=R N.Position
=R local S=Options.OBTAINABLE_ESP_COLOR.Value L.Color=S M.Color=S end L.Visible=
Q M.Visible=Q N.Visible=Q else L.Visible=false M.Visible=false N.Visible=false
end end function H.destroy(K)if K.destructed then return else K.destructed=true
K._destroyListener:Disconnect()end H.attached[K.instance]=nil K.label:Remove()K.
indicator:Remove()K.outline:Remove()end end local I do I={}I.attached={}I.
__index=I local J=p.WorldToViewportPoint local K=Vector2.new(0,3)function I.new(
L,M)local N=setmetatable({instance=L,destructed=false},I)N._destroyListener=N.
instance.AncestryChanged:Connect(function(O,P)if P==nil then N:destroy()end end)
return N:constructor(L,M)end function I.constructor(L,M,N)L.name=N or M.Name L.
label=Drawing.new'Text'L.indicator=Drawing.new'Circle'L.outline=Drawing.new
'Circle'task.defer(L.onStart,L)if not L.destructed then I.attached[M]=L end
return L end function I.onStart(L)if L.destructed then return end local M,N,O=L.
label,L.indicator,L.outline M.Text=L.name M.Size=18 M.Center=true M.Outline=true
M.Visible=false N.Thickness=1 N.NumSides=12 N.Radius=5 N.Filled=true N.Visible=
false O.Color=Color3.new()O.Thickness=2 O.NumSides=12 O.Radius=5 O.Filled=false
O.Visible=false O.ZIndex=2 end function I.render(L)local M,N,O=L.label,L.
indicator,L.outline if Toggles.INTERACTABLE_ESP.Value then local P,Q=J(p,L.
instance.Position)local R=Q and P.Z>2.5 if R then local S=Vector2.new(P.X,P.Y)M.
Position=S+K N.Position=S O.Position=S local T=Options.INTERACTABLE_ESP_COLOR.
Value M.Color=T N.Color=T end M.Visible=R N.Visible=R O.Visible=R else M.Visible
=false N.Visible=false O.Visible=false end end function I.destroy(L)if L.
destructed then return else L.destructed=true L._destroyListener:Disconnect()end
I.attached[L.instance]=nil L.label:Remove()L.indicator:Remove()L.outline:Remove(
)end end local J do J={}J.__index=J function J.new(K)local L=setmetatable({
instance=K,destructed=false},J)L._destroyListener=L.instance.AncestryChanged:
Connect(function(M,N)if N==nil then L:destroy()end end)return L:constructor(K)
end function J.constructor(K,L)task.defer(K.onStart,K)return K end function J.
onStart(K)local L=K.instance if L.Name=='50'then task.defer(K.onLibrary,K)task.
defer(K.onFigure,K)elseif L.Name=='100'then task.defer(K.onFigure,K)end local M=
function(M)K:onDescendant(M)end L.DescendantAdded:Connect(M)for N,O in ipairs(L:
GetDescendants())do M(O)if N%500==0 then task.wait()end end end function J.
onDescendant(K,L)local M=L.Parent if L.Name=='Main'then if M.Name==
'LeverForGate'then I.new(L,'Lever')elseif M.Name=='Lighter'then H.new(L,
'Lighter')elseif M.Name=='Vitamins'then H.new(L,'Vitamins')elseif M.Name==
'Lockpick'then H.new(L,'Lockpicks')elseif M.Name=='Bandage'then H.new(L,
'Bandages')end elseif M.Name=='Door'then if L.Name=='Door'and L:IsA'MeshPart'
then F.new(M,tonumber(K.instance.Name))local N=M:FindFirstChild'Lock'if N then I
.new(N,'Lock')end end elseif M.Name=='KeyObtain'then if L.Name=='Hitbox'then H.
new(L,'Key')end elseif L.Name=='Wardrobe'then G.new(L,tonumber(K.instance.Name))
end end function J.onFigure(K)local L=K.instance local M=L:WaitForChild(
'FigureSetup',2.5)local N=D.new(M)end function J.onLibrary(K)local L=K.instance
local M=function(M)if M.Name=='Super Cool Bookshelf With Hint Book'then local N=
M:WaitForChild('LiveHintBook',2.5)if N then local O=N:WaitForChild('Base',2.5)if
O then H.new(O,'Book')end end end end local N=L:WaitForChild('Assets',5)for O,P
in ipairs(N:GetChildren())do task.defer(M,P)end N.ChildAdded:Connect(M)end
function J.destroy(K)if K.destructed then return else K.destructed=true K.
_destroyListener:Disconnect()end end end local K do K={}K.attached={}K.__index=K
function K.new(L,M)local N=setmetatable({instance=L,destructed=false},K)return N
:constructor(L,M)end function K.constructor(L,M,N)L.door=M:WaitForChild('Door',5
)L.number=N L.avatar=o.Character L.inProgress=true assert(L.door,
'RoomComponent:constructor - Door not found')if L.destructed then return end K.
attached[M]=L task.defer(L.onStart,L)return L end function K.onStart(L)local M=L
.instance local N=L.avatar for O,P in ipairs(M:GetDescendants())do if P.Name==
'KeyObtain'then L:onKey(P)break end end local Q=L.door:WaitForChild('Door',5)
local R=L.door:WaitForChild('ClientOpen',5)repeat N:PivotTo(Q.CFrame)R:
FireServer()task.wait()if L.destructed then L.inProgress=false return end until
t.LatestRoom.Value>L.number L.inProgress=false end function K.onKey(L,M)local N,
O=M:WaitForChild('Hitbox',5),M:WaitForChild('ModulePrompt',5)local P=L.avatar
assert(O,'Key Prompt not found')repeat P:PivotTo(CFrame.new(N.Position+Vector3.
new(0,2,0)))fireproximityprompt(O)task.wait(0.08)if L.destructed then return end
until P:FindFirstChild'Key'local Q=L.door local R=Q:WaitForChild('Lock',5)local
S=R:WaitForChild('UnlockPrompt',5)repeat P:PivotTo(R.CFrame)fireproximityprompt(
S)task.wait()if L.destructed then return end until R.Anchored==false and not P:
FindFirstChild'Key'end function K.destroy(L)if L.destructed then return else L.
destructed=true end K.attached[L.instance]=nil end end l:SetWatermark
'Linoria Community (OminousVibes)'l:Notify'Loading UI...'do local L=l:
CreateWindow'Doors'do local M=L:AddTab'Gameplay'do local N=M:AddLeftTabbox
'Modifications'local O=N:AddTab'Character Mods'O:AddToggle('SPRINT_ENABLED',{
Text='Sprint Enabled',Default=false,Tooltip=
'Enables Sprinting by pressing the Keybind'}):AddKeyPicker('SPRINT_KEYBIND',{
Text='Sprint',Default='LeftShift'})O:AddSlider('SPRINT_BOOST',{Text=
'Sprint Boost (in seconds)',Min=0,Max=40,Default=0,Rounding=1,Suffix=' studs'})O
:AddToggle('GLOW_ENABLED',{Text='Body Glow',Default=false,Tooltip=
'Adds a subtle glow for better vision'})O:AddSlider('GLOW_BRIGHTNESS',{Text=
'Glow Brightness',Min=0,Max=100,Default=0,Rounding=0,Suffix=''})local P=N:AddTab
'World Mods'P:AddToggle('REMOVE_AMBIENCE',{Text='Remove Ambience',Default=false,
Tooltip='Removes the unnecessary sounds from the world'})end do local N=M:
AddLeftTabbox'Assists'local O=N:AddTab'Minigame Assists'O:AddToggle(
'PADLOCK_CODE',{Text='Padlock Parser',Default=true,Tooltip=
'Parses the Padlock code using your Books and Paper'})local P=N:AddTab
'Entity Assists'end do local N=M:AddRightTabbox'Notifiers'local O=N:AddTab
'Alerts'O:AddToggle('EVENT_NOTIFIER',{Text='Event Notifier',Default=true,Tooltip
='Notifies you when certain events occur'})O:AddToggle('DEBUG_NOTIFIER',{Text=
'Debug Notifier',Default=true,Tooltip='Notifies you of certain script changes'})
O:AddButton('Example Alert (Testing)',function()z(
[[[Example Alert]: This is a test alert to get you familiar with the script's notification system!]]
,true)end)local P=N:AddTab'Advanced'P:AddToggle('SOUND_NOTIFIER',{Text=
'Sound Alert',Default=true,Tooltip='Important Alerts will have sound cues!'})end
end do local M=L:AddTab'Blatant'do local N=M:AddLeftTabbox'Clear Room'local O=N:
AddTab'Clear Room'O:AddButton('Skip Room',function()local P=t.LatestRoom.Value
local Q=h.CurrentRooms[tostring(P)]K.new(Q,P)end)local P=N:AddTab'Advanced'P:
AddToggle('SKIP_LEVER',{Text='Flip Lever',Default=false,Tooltip=
'Flips Lever before progressing (Optional)'})end do local N=M:AddRightGroupbox
'Prompts'N:AddToggle('INSTANT_PROMPT',{Text='Instant Interact',Default=true,
Tooltip='Instantly interacts with prompts'})N:AddToggle('AUTO_PROMPT',{Text=
'Automatic Interact',Default=true,Tooltip='Automaticall interacts with prompts'}
):AddKeyPicker('AUTO_PROMPT_KEYBIND',{Text='Auto-Interact',Default='V'})end do
local N=M:AddRightGroupbox'Hooks'N:AddToggle('BREAKER_WIN',{Text=
'Breaker Assist',Default=true,Tooltip=
[[Electrical breaker will be fully completed regardless of the actual state of the switches (Room 100)]]
})N:AddToggle('AUTO_HEARTBEAT',{Text='Always Win Heartbeat Minigame',Default=
true,Tooltip='Always win the heartbeat minigame (Room 50 & 100)'})N:AddToggle(
'AUTO_SCREECH',{Text='Anti-Screech',Default=true,Tooltip=
'Screech attacks no longer damage you.'})N:AddToggle('DISABLE_CUTSCENE',{Text=
'Disable Cutscene',Default=true,Tooltip=
'Cutscenes will no longer move your camera.'})N:AddToggle('STABLE_CAMERA',{Text=
'Disable Camera Shake',Default=true,Tooltip=
'Prevents the camera from moving outside of user input.'})end do local N=M:
AddRightGroupbox'Funny'end end do local M=L:AddTab'Visuals'do local N=M:
AddLeftTabbox'Visuals'local O=N:AddTab'Entity Visuals'O:AddToggle('PLAYER_ESP',{
Text='Player ESP',Default=true,Tooltip='ESP for other players'}):AddColorPicker(
'PLAYER_ESP_COLOR',{Title='ESP Color',Default=Color3.new(1,1,1)})O:AddToggle(
'RUSH_ESP',{Text='Rush/Ambush ESP',Default=true,Tooltip=
'ESP for both Rush and Ambush Entities'})O:AddToggle('FIGURE_ESP',{Text=
'Figure ESP',Default=true,Tooltip="ESP for the entity 'Figure'"})local P=N:
AddTab'Object Visuals'P:AddToggle('DOOR_ESP',{Text='Door ESP',Default=false,
Tooltip='ESP for doors'}):AddColorPicker('DOOR_ESP_COLOR',{Title='ESP Color',
Default=Color3.new(0,0.5,1)})P:AddToggle('WARDROBE_ESP',{Text='Wardrobe ESP',
Default=false,Tooltip='ESP for Wardrobe'}):AddColorPicker('WARDROBE_ESP_COLOR',{
Title='ESP Color',Default=Color3.new(0,1,0.9)})P:AddToggle('OBTAINABLE_ESP',{
Text='Obtainable ESP',Default=true,Tooltip='ESP for items that can be picked up'
}):AddColorPicker('OBTAINABLE_ESP_COLOR',{Title='ESP Color',Default=Color3.new(1
,1,0)})P:AddToggle('INTERACTABLE_ESP',{Text='Interactable ESP',Default=true,
Tooltip='ESP for interactable items'}):AddColorPicker('INTERACTABLE_ESP_COLOR',{
Title='ESP Color',Default=Color3.new(1,1,1)})end do local N=M:AddRightGroupbox
'World Render'end end do local M=L:AddTab'Credits'local N=M:AddLeftGroupbox
'Credits'N:AddLabel'OminousVibes - Creator'N:AddLabel'Inori @v3rm - UI Library'N
:AddLabel'Aztup @v3rm - Breaker Assist'N:AddDivider()N:AddLabel'Contributors:'N:
AddLabel'> IAmAGoodScammer @v3rm'N:AddLabel'> Bob24 @v3rm'N:AddLabel
'> brickmane @v3rm'N:AddLabel'> yuuiz#1336 @Discord'N:AddDivider()N:AddLabel
'Donators:'N:AddLabel'> reversing#2937 @Discord'local O=M:AddRightGroupbox
'Socials'O:AddButton('Discord Server',function()setclipboard
'https://discord.gg/8PATx7UKXZ'end)end do local M=L:AddTab'Settings'n:
SetLibrary(l)m:SetLibrary(l)n:SetFolder'OminousVibes'm:SetFolder
'OminousVibes/doors'm:IgnoreThemeSettings()m:SetIgnoreIndexes{'MenuKeybind'}m:
BuildConfigSection(M)n:ApplyToTab(M)local N=M:AddLeftGroupbox'Menu'N:AddButton(
'Unload',function()l:Unload()end)N:AddLabel'Menu bind':AddKeyPicker(
'MenuKeybind',{Default='End',NoUI=true,Text='Menu keybind'})N:AddToggle(
'Keybinds',{Text='Show Keybinds Menu',Default=true}):OnChanged(function()l.
KeybindFrame.Visible=Toggles.Keybinds.Value end)N:AddToggle('Watermark',{Text=
'Show Watermark',Default=true}):OnChanged(function()l:SetWatermarkVisibility(
Toggles.Watermark.Value)end)end end l:Notify
'UI Built! [Right Ctrl or Right Shift]'m:LoadAutoloadConfig()do local L local M,
N=typeof,unpack local O=game.IsA L=hookmetamethod(game,'__namecall',function(P,
...)if not checkcaller()then if M(P)=='Instance'then if O(P,'RemoteEvent')then
if P==v.ClutchHeartbeat then if Toggles.AUTO_HEARTBEAT.Value then local Q={...}
if not Q[2]then x=(x+1)%2 if x==0 then Q[2]=true else return end end return L(P,
N(Q))end elseif P==v.Screech then if Toggles.AUTO_SCREECH.Value then local Q={
...}Q[1]=true return L(P,N(Q))end end end end end return L(P,...)end)end local L
=function(L,M)for N,O in pairs(A.attached)do O:onPhysics(L,M)end end local M=
function(M)do local N=Toggles.GLOW_ENABLED.Value if N then local O=Options.
GLOW_BRIGHTNESS.Value r.Brightness=O/100 s.Brightness=O/200 local P=p.
CameraSubject.Parent if P then local Q=P.PrimaryPart if Q then r.Parent=Q s.
Parent=Q end end end r.Enabled=N s.Enabled=N end for N,O in pairs(B.attached)do
O:render(M)end for P,Q in pairs(D.attached)do Q:render(M)end for R,S in pairs(E.
attached)do S:render(M)end for T,U in pairs(F.attached)do U:render(M)end for V,W
in pairs(G.attached)do W:render(M)end for X,Y in pairs(I.attached)do Y:render(M)
end for Z,_ in pairs(H.attached)do _:render(M)end end local Z=function(Z)if
Toggles.EVENT_NOTIFIER.Value then local _=t.ChaseStart.Value-Z if 0<_ and _<3
then z("[Event Notifier]: There is an event in '"..tostring(_).."' rooms!",false
)end end end local _=function()if Toggles.EVENT_NOTIFIER.Value then z(
[[[Event Notifier]: Screech spawned, quickly turn around to look at it!]],true)
end end local aa=function(aa)if aa=='ElevatorBreaker'then if Toggles.
DEBUG_NOTIFIER.Value then z('Breaker Switch started, searching...',true)end do
local ab do local ac,ad=type,table.find local ae=is_synapse_function or
iskrnlclosure repeat task.wait(0.5)for af,ag in ipairs(getgc())do if ac(ag)==
'function'and islclosure(ag)and not ae(ag)then local ah=getconstants(ag)if ad(ah
,'BreakerSwitch')and ad(ah,'GetChildren')and ah[9]==1 then if Toggles.
DEBUG_NOTIFIER.Value then z('Breaker Switch Progress Hooked!',false)end ab=ag
break end end if af%500==0 then task.wait()end end until ab~=nil end if not y[ab
]then local ac ac=hookfunction(ab,function(...)if Toggles.BREAKER_WIN.Value then
return 10 end return ac(...)end)end end end end local ab=function(ab)C.new(ab)
end local ac=function(ac)A.new(ac)end local ad=function(ad)if ad.Name==
'RushMoving'then if Toggles.EVENT_NOTIFIER.Value then z(
'[Event Notifier]: Rush spawned, hide quickly!',true)end E.new(ad)elseif ad.Name
=='AmbushMoving'then if Toggles.EVENT_NOTIFIER.Value then z(
[[[Event Notifier]: Ambush spawned, hide quickly! He can return up to 3-4 times!]]
,true)end E.new(ad)elseif ad.Name=='Lookman'then if Toggles.EVENT_NOTIFIER.Value
then z('[Event Notifier]: Eyes spawned, look away!',true)end end end local ae=
function(ae)J.new(ae)end e.Stepped:Connect(L)e.RenderStepped:Connect(M)b.
PlayerAdded:Connect(ab)o.CharacterAdded:Connect(ac)h.ChildAdded:Connect(ad)h.
CurrentRooms.ChildAdded:Connect(ae)t.LatestRoom.Changed:Connect(Z)v.Screech.
OnClientEvent:Connect(_)v.EngageMinigame.OnClientEvent:Connect(aa)v.PadlockHint.
OnClientEvent:Connect(function(af,ag,ah)if af and ag then w[af]=tostring(ag)else
w={}end end)Toggles.DISABLE_CUTSCENE:OnChanged(function()for af,ag in ipairs(
getconnections(v.Cutscene.OnClientEvent))do if Toggles.DISABLE_CUTSCENE.Value
then ag:Disable()else ag:Enable()end end end)if o.Character then task.defer(ac,o
.Character)end for af,ag in ipairs(b:GetPlayers())do if ag~=o then task.defer(ab
,ag)end end for ah,ai in ipairs(h.CurrentRooms:GetChildren())do task.defer(ae,ai
)end for aj,ak in ipairs(getconnections(v.Cutscene.OnClientEvent))do if Toggles.
DISABLE_CUTSCENE.Value then ak:Disable()else ak:Enable()end end h:
GetPropertyChangedSignal'CurrentCamera':Connect(function()local al=h.
CurrentCamera if al then p=al end end)c.PromptButtonHoldBegan:Connect(function(
al,am)if Toggles.INSTANT_PROMPT.Value then task.spawn(fireproximityprompt,al)end
end)c.PromptShown:Connect(function(al,am)if Toggles.AUTO_PROMPT.Value and
Options.AUTO_PROMPT_KEYBIND:GetState()then if al.Name~='HidePrompt'then task.
spawn(fireproximityprompt,al)end end end)q.Name=a:GenerateGUID(false)q.SoundId=
'rbxassetid://6026984224'q.Volume=6 q.Parent=f r.Range=40 s.Range=200 return l:
Notify'[Doors] Loaded! (v4)'
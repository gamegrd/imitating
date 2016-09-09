 unit MY_API;

interface
uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
Dialogs,Lua,MyWindows,ActiveX, MSScriptControl_TLB,MMSystem,ShellAPI;



procedure GetInt2(S:String; var x,y:Integer);
function  CheckExit:boolean;

/////////////////////////////////////////////////////////
function API_stoprun(L: plua_State): Integer; cdecl;
function API_print(L: plua_State): Integer; cdecl;
//==键盘==
function API_KeyPress(L: plua_State): Integer; cdecl;
function API_KeyDown(L: plua_State): Integer; cdecl;
function API_KeyUp(L: plua_State): Integer; cdecl;
//==鼠标==
function API_LeftClick(L: plua_State): Integer; cdecl;
function API_RightClick(L: plua_State): Integer; cdecl;
function API_MiddleClick(L: plua_State): Integer; cdecl;
function API_LeftDoubleClick(L: plua_State): Integer; cdecl;
function API_LeftDown(L: plua_State): Integer; cdecl;
function API_LeftUp(L: plua_State): Integer; cdecl;
function API_RightDown(L: plua_State): Integer; cdecl;
function API_RightUp(L: plua_State): Integer; cdecl;
function API_MoveTo(L: plua_State): Integer; cdecl;
function API_MoveR(L: plua_State): Integer; cdecl;
//==其它===
function API_Sleep(L: plua_State): Integer; cdecl;
function API_Beep(L: plua_State): Integer; cdecl;
function API_messagebox(L: plua_State): Integer; cdecl;
function API_saystring(L: plua_State): Integer; cdecl;
function API_findpic(L: plua_State): Integer; cdecl;
function API_getpixelcolor(L: plua_State): Integer; cdecl;
function API_findcolor(L: plua_State): Integer; cdecl;
function API_findcolorex(L: plua_State): Integer; cdecl;
function API_comparecolore(L: plua_State): Integer; cdecl;   //比较颜色
function API_readmemory(L: plua_State): Integer; cdecl;

//==API========
function API_FindWindow(L: plua_State): Integer; cdecl;
function API_SetWindowPos(L: plua_State): Integer; cdecl;

function API_GetTickCount(L: plua_State): Integer; cdecl;
function API_PlaySound(L: plua_State): Integer; cdecl;

function API_PostMessage(L: plua_State): Integer; cdecl;
function API_SendMessage(L: plua_State): Integer; cdecl;

function API_Execute(L: plua_State): Integer; cdecl;

implementation
uses PopWin,Run_script;

function  CheckExit:boolean;   {退出检测}
begin
   result:=False;
  if ScrLoop.Looptype=cRunTime then
   begin
      if GetTickCount - StartRunTime > ScrLoop.value then  Running:=False;
    end;
  if not Allwindow then
    begin

         while  (EnabledHwnd<>GetForegroundWindow()) or (EnabledHwnd=0) do
          begin
           EnabledHwnd:=FindWindow(nil,PChar(EnabledWin));
           Sleep(1000);
           end;
      end;

  if not Running then
     begin
     lua_error(L);
     result:=True;
  end;
end;


procedure GetInt2(S:String; var x,y:Integer);
var
  i,_pos:Integer;

begin
  _pos:=Pos(',',S);
  i:=strtoint(Copy(s,1,_pos-1));
  x:=i;
  Delete(s,1,(_pos));
  i:=strtoint(s);
  Y:=i;
  end;

//////////////////////////////////////////////
function API_stoprun(L: plua_State): Integer; cdecl;
begin
  Running:=False;
  CheckExit;
  result := 0;
end;


function API_print(L: plua_State): Integer; cdecl;
var
I, N: Integer;
nr:pchar;
begin
  N := lua_gettop(L);
//  for I := 1 to N do
 // log(lua_tostring(L, I),clLime);
  result := 0;
end;


function API_KeyPress(L: plua_State): Integer; cdecl;
var
i,KEY,_count: Integer;
begin
  KEY:=Trunc(lua_tonumber(L,1));
  _count:=Trunc(lua_tonumber(L,2));
  lua_pop(L,2);          //移除栈顶的值。
    for i:=1 to _count  do
      begin
         if CheckExit then exit;
             if Hardwork then
              begin
                 KeyPressH(KEY);
                end
                else
                begin
              keybd_event(KEY,MapVirtualKey(KEY,0),0,0);
              Sleep(30);
              keybd_event(KEY,MapVirtualKey(KEY,0),KEYEVENTF_KEYUP,0);
            end;
        end;
//    log(Format('按键: %d  %d 次',[Key,_count]),clWhite);
  result := 0;
end;


function API_KeyDown(L: plua_State): Integer; cdecl;
var
i,KEY,_count: Integer;
begin
  KEY:=Trunc(lua_tonumber(L,1));
  _count:=Trunc(lua_tonumber(L,2));
  lua_pop(L,2);          //移除栈顶的值。
    if CheckExit then exit;
       if Hardwork then
              begin
                 KeyDownH(KEY);
                end
             else
                begin
                  keybd_event(KEY,MapVirtualKey(KEY,0),0,0);
                  end;
    //log(Format('按住键: %d  %d 次',[Key,_count]),clWhite);
  result := 0;
end;

function API_KeyUp(L: plua_State): Integer; cdecl;
var
i,KEY,_count: Integer;
begin
  KEY:=Trunc(lua_tonumber(L,1));
  _count:=Trunc(lua_tonumber(L,2));
  lua_pop(L,2);          //移除栈顶的值。
    if CheckExit then exit;
     if Hardwork then
              begin
                 KeyUPH(KEY);
                end
             else
                begin
                  keybd_event(KEY,MapVirtualKey(KEY,0),KEYEVENTF_KEYUP,0);
                  end;
    //log(Format('弹起键: %d  %d 次',[Key,_count]),clWhite);
  result := 0;
end;



function API_LeftClick(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin

  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);

    for i:=1 to _count do
    begin
      if CheckExit then exit;
       mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
       mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
       sleep(10);
      end;
    //log(Format('左键单击: %d 次',[_count]),clWhite);
  result := 0;
end;



function API_RightClick(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
   for i:=1 to  _count do
    begin
      if CheckExit then exit;
       mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
       mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
       sleep(10);
      end;
    //log(Format('右键单击: %d 次',[_count]),clWhite);
  result := 0;
end;

function API_MiddleClick(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
     for i:=1 to  _count do
      begin
        if CheckExit then exit;
       mouse_event( MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0);
       mouse_event( MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0);
       sleep(10);
      end;
    //log(Format('中键单击: %d 次',[_count]),clWhite);
  result := 0;
end;



function API_LeftDoubleClick(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
     for i:=1 to  _count do
      begin
        if CheckExit then exit;
       mouse_event( MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
       mouse_event( MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
       mouse_event( MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
       mouse_event( MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
       sleep(10);
      end;
   // log(Format('左键双击: %d 次',[_count]),clWhite);
  result := 0;
end;


function API_LeftDown(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
  if CheckExit then exit;
     mouse_event( MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
   // log(Format('左键按下: %d 次',[_count]),clWhite);
  result := 0;
end;


function API_LeftUp(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
  if CheckExit then exit;
    mouse_event( MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    //log(Format('左键弹起: %d 次',[_count]),clWhite);
  result := 0;
end;


function API_RightDown(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
  if CheckExit then exit;
    mouse_event( MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
    //log(Format('右键按下: %d 次',[_count]),clWhite);
  result := 0;
end;


function API_RightUp(L: plua_State): Integer; cdecl;
var
i,_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
  if CheckExit then exit;
    mouse_event( MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
    //log(Format('右键弹起: %d 次',[_count]),clWhite);
  result := 0;
end;



function API_MoveTo(L: plua_State): Integer; cdecl;
var
 X,Y: Integer;
begin
  x:=Trunc(lua_tonumber(L,1));
  y:=Trunc(lua_tonumber(L,2));
  lua_pop(L,2);
  if CheckExit then exit;
    SetCursorPos(x,y);
   // log(Format('鼠标移到到: %d,%d ',[X,Y]),clWhite);
  result := 0;
end;


function API_MoveR(L: plua_State): Integer; cdecl;
var
_NOWPoint:Tpoint;
 X,Y: Integer;
begin
  x:=Trunc(lua_tonumber(L,1));
  y:=Trunc(lua_tonumber(L,2));
  lua_pop(L, 2);
  if CheckExit then exit;
     GetCursorPos(_NOWPoint);    //得到当前鼠标坐标
     SetCursorPos(_NOWPoint.X+x,_NOWPoint.Y+y);
    //log(Format('相对鼠标移到: %d,%d ',[X,Y]),clWhite);
  result := 0;
end;

function API_Sleep(L: plua_State): Integer; cdecl;
var
_count: Integer;
begin
  _count:=Trunc(lua_tonumber(L,1));
  lua_pop(L, 1);
  if CheckExit then exit;
    sleep(_count);
   // log(Format('延时 %d 毫秒',[_count]),clWhite);
  result := 0;
end;

function API_Beep(L: plua_State): Integer; cdecl;
begin
    if CheckExit then exit;
    Beep;
    result := 0;
end;


function API_messagebox(L: plua_State): Integer; cdecl;
var
_string:string;
i,n:Integer;
begin
  N := lua_gettop(L);
  for I := 1 to N do  _string:=_string+'  '+ lua_tostring(L, I) ;
  if CheckExit then exit;

  // log(Format('显示消息:%s',[_string]),clWhite);
 MessageBox(0, PChar(_string), '提示', MB_OK + MB_ICONINFORMATION + 
   MB_TOPMOST);
   result := 0;
end;





procedure MYvbsInput(nr:string);
var
  scr: TScriptControl;
begin
  if CheckExit then exit;
  CoInitialize(nil) ;
  scr := TScriptControl.Create(nil);
  scr.Language := 'VBScript';
  scr.AddCode('dim obj');
  scr.AddCode('set obj = createobject("WScript.Shell")');
  scr.AddCode(format('call obj.SendKeys("%s")',[nr]));
  CoUninitialize;
end;


function API_saystring(L: plua_State): Integer; cdecl;
var
I, N: Integer;
_string:string;
begin
  N := lua_gettop(L);
  if CheckExit then exit;
  for I := 1 to N do
  begin
     if i=1 then _string:=lua_tostring(L, I) else
    _string:=_string+ lua_tostring(L, I)
    end;
 // MYinput(_string);
// MYvbsInput(_string);
   SendKeys(_string);
  //log(Format('输入:%s',[_string]),clWhite);
   result := 0;
end;



procedure findpic(_string:string);
var
  scr: TScriptControl;
  FoundX,FoundY:integer;
begin
  if CheckExit then exit;
  CoInitialize(nil) ;
  scr := TScriptControl.Create(nil);
  scr.Language := 'VBScript';
  scr.AddCode('dim x');
  scr.AddCode('dim y');
  scr.AddCode('dim obj');
  scr.AddCode('set obj = createobject("QMDispatch.QMFunction")');
  scr.AddCode(format('FoundPixel = obj.FindPic(%s)',[_string]));
  scr.AddCode('x = CInt(FoundPixel / 8192)');
  scr.AddCode('y = FoundPixel Mod 8192');

  FoundX:=(scr.Eval('x'));
  FoundY:=(scr.Eval('y'));
//  showmessage(format('%d,%d',[FoundX,FoundY]))
  // SetCursorPos(FoundX,FoundY);
     lua_pushnumber(L,FoundX);
     lua_pushnumber(L,FoundY);

   CoUninitialize;
end;



function API_findpic(L: plua_State): Integer; cdecl;
var
  scr: TScriptControl;
  FoundX,FoundY:integer;
  iLeft,iTop,iRight,iBottom:Integer;
  szFileName:string;
  fSimilar:Double;
begin
  if CheckExit then exit;
iLeft:=Trunc(lua_tonumber(L,1));
iTop:=Trunc(lua_tonumber(L,2));
iRight:=Trunc(lua_tonumber(L,3));
iBottom:=Trunc(lua_tonumber(L,4));
szFileName:=lua_tostring(L,5);
fSimilar:=lua_tonumber(L,6);

lua_pop(L, 6);

  findpic(Format('%d,%d,%d,%d,"%s",%s',[iLeft,iTop,iRight,iBottom,szFileName,FloatToStr(fSimilar)]));
//   findpic('0,0,1024,768,"C:\神盾.bmp",1');


//  scr.Free;
//  CoUninitialize;
 // log(Format('找图:%s',[_string]),clWhite);
   result := 2;
end;


function API_getpixelcolor(L: plua_State): Integer; cdecl;
var
x,y: Integer;
 DesktopDC:   HDC;
TmpColor: integer;
begin
  x:=Trunc(lua_tonumber(L,1));
  y:=Trunc(lua_tonumber(L,2));
  lua_pop(L,2);          //移除栈顶的值。

  if CheckExit then exit;
  DesktopDC  :=  GetWindowDC(GetDesktopWindow);
  TmpColor   :=   GetPixel(DesktopDC,x,y);
   //log(Format('取色:%s',[_string]),clWhite);
  lua_pushstring(L,pchar(inttohex(TmpColor,6)));
   result := 1;
end;


function API_findcolor(L: plua_State): Integer; cdecl;
var
_string,cmd:string;
  scr: TScriptControl;
  FoundX,FoundY:integer;
  Left,iTop,iRight,iBottom,rnd:Integer;
begin
  CoInitialize(nil) ;

  Left:=Trunc(lua_tonumber(L,1));
  iTop:=Trunc(lua_tonumber(L,2));
  iRight:=Trunc(lua_tonumber(L,3));
  iBottom:=Trunc(lua_tonumber(L,4));
  _string:=lua_tostring(L, 5);
  rnd:=Trunc(lua_tonumber(L,6));
  lua_pop(L, 6);
  
  cmd:=format('%d,%d,%d,%d,"%s",%d',[Left,iTop,iRight,iBottom,_string,rnd]);
  if CheckExit then exit;
  scr := TScriptControl.Create(nil);
  scr.Language := 'VBScript';
  scr.AddCode('dim x');
  scr.AddCode('dim y');
  scr.AddCode('dim obj');
  scr.AddCode('set obj = createobject("QMDispatch.QMFunction")');
  scr.AddCode(format('FoundPixel = obj.FindColor(%s)',[cmd]));
  scr.AddCode('x = CInt(FoundPixel / 8192)');
  scr.AddCode('y = FoundPixel Mod 8192');

  FoundX:=(scr.Eval('x'));
  FoundY:=(scr.Eval('y'));
  lua_pushnumber(L,FoundX);
  lua_pushnumber(L,FoundY);
  scr.Free;

   CoUninitialize;
   //log(Format('找色:%s',[_string]),clWhite);
   result := 2;
end;

function API_findcolorex(L: plua_State): Integer; cdecl;
var
  _string,cmd:string;
  scr: TScriptControl;
  FoundX,FoundY:integer;
  Left,iTop,iRight,iBottom,rnd:Integer;
  fSimilar:Double;
begin
   CoInitialize(nil) ;

      Left:=Trunc(lua_tonumber(L,1));
      iTop:=Trunc(lua_tonumber(L,2));
      iRight:=Trunc(lua_tonumber(L,3));
      iBottom:=Trunc(lua_tonumber(L,4));
      _string:=lua_tostring(L, 5);
      rnd:=Trunc(lua_tonumber(L,6));
      fSimilar:=lua_tonumber(L,7);
      lua_pop(L,7);
  cmd:=format('%d,%d,%d,%d,"%s",%d,%.1f',[Left,iTop,iRight,iBottom,_string,rnd,fSimilar]);
 if CheckExit then exit;
  scr := TScriptControl.Create(nil);
  scr.Language := 'VBScript';
  scr.AddCode('dim x');
  scr.AddCode('dim y');
  scr.AddCode('dim obj');
  scr.AddCode('set obj = createobject("QMDispatch.QMFunction")');
  scr.AddCode(format('FoundPixel = obj.FindColor(%s)',[cmd]));
  scr.AddCode('x = CInt(FoundPixel / 8192)');
  scr.AddCode('y = FoundPixel Mod 8192');

  FoundX:=(scr.Eval('x'));
  FoundY:=(scr.Eval('y'));
  lua_pushnumber(L,FoundX);
  lua_pushnumber(L,FoundY);
  scr.Free;

   CoUninitialize;
   //log(Format('模糊找色:%s',[_string]),clWhite);
   result := 2;
end;


function API_comparecolore(L: plua_State): Integer; cdecl;   //比较颜色
var
  r1,r2,g1,g2,b1,b2:byte;
  Q1:word;
  _string:string ;
  c1,c2:TColor;
begin
   _string:=lua_tostring(L,1) ;
  c1:=StrToInt('$'+_string);
  _string:=lua_tostring(L,2) ;
  c2:=StrToInt('$'+_string);
  lua_pop(L,2);

if CheckExit then exit;  
r1:=GetRValue(c1);
r2:=GetRValue(c2);

g1:=GetGValue(c1);
g2:=GetGValue(c2);

b1:=GetBValue(c1);
b2:=GetBValue(c2);

Q1:=abs(r1-r2)+abs(g1-g2)+abs(b1-b2);
lua_pushnumber(L,Q1);
result := 1;
end;



function API_readmemory(L: plua_State): Integer; cdecl;
var
_string:string;
begin
  _string:=lua_tostring(L, 1);
   lua_pop(L, 1);
   if CheckExit then exit;
   log(Format('读内存:%s',[_string]),clWhite);
   result := 0;
end;


//==============API==================
function API_FindWindow(L: plua_State): Integer; cdecl;
var
AWnd: Integer;
_string:string;
begin
     AWnd:=0;
     _string:=lua_tostring(L, 1);
     lua_pop(L, 1);
    if CheckExit then exit;
    AWnd:=FindWindow(nil,PChar(_string));
    lua_pushnumber(L,AWnd);
    Result:=1;
  end;

function API_SetWindowPos(L: plua_State): Integer; cdecl;
var
x,y: Integer;
AWnd: Integer;
begin
  AWnd:=Trunc(lua_tonumber(L,1));
  x:=Trunc(lua_tonumber(L,2));
  y:=Trunc(lua_tonumber(L,3));
  lua_pop(L,3);          //移除栈顶的值。
  if CheckExit then exit;
  SetWindowPos(AWnd,0,x,y,0,0,1);
  Result:=0;
end;


function API_GetTickCount(L: plua_State): Integer; cdecl;
begin
  if CheckExit then exit;
  lua_pushnumber(L,GetTickCount);
  Result:=1;
end;

function API_PlaySound(L: plua_State): Integer; cdecl;
var
_string:string;
begin
  _string:=lua_tostring(L, 1);
   lua_pop(L, 1);
   if CheckExit then exit;
   sndPlaySound(PChar(_string),SND_ASYNC);
   Result:=0;
end;


function API_PostMessage(L: plua_State): Integer; cdecl;
var
  _hWnd: HWND;
  _Msg: UINT;
  _wParam: WPARAM;
  _lParam: LPARAM;
begin
    _hWnd:=Trunc(lua_tonumber(L,1));
    _Msg:=Trunc(lua_tonumber(L,2));
    _wParam:=Trunc(lua_tonumber(L,3));
    _lParam:=Trunc(lua_tonumber(L,4));
    lua_pop(L,4);          //移除栈顶的值。
    if CheckExit then exit;
    PostMessage(_hWnd,_Msg,_wParam,_lParam);
    Result:=0;
end;

function API_SendMessage(L: plua_State): Integer; cdecl;
var
  _hWnd: HWND;
  _Msg: UINT;
  _wParam: WPARAM;
  _lParam: LPARAM;
begin
    _hWnd:=Trunc(lua_tonumber(L,1));
    _Msg:=Trunc(lua_tonumber(L,2));
    _wParam:=Trunc(lua_tonumber(L,3));
    _lParam:=Trunc(lua_tonumber(L,4));
    lua_pop(L,4);          //移除栈顶的值。
    if CheckExit then exit;
    SendMessage(_hWnd,_Msg,_wParam,_lParam);
    Result:=0;
end;


function API_Execute(L: plua_State): Integer; cdecl;
var
_string:string;
begin
   _string:=lua_tostring(L, 1);
   lua_pop(L, 1);
 // winexec
  ShellExecute(0, pchar('open'), pchar(_string),'','',SW_SHOW);
  if CheckExit then exit;
  result:=0;
  end;
  
end.

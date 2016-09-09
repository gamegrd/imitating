
unit Run_script;

interface
uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs,MY_API, lua, lualib,lauxlib, LuaUtils;

type      //定义线程类
  TScriptThread=class(TThread)
  ExpressionCleck:Boolean;
  protected
  procedure Execute; override;
  procedure Ready;
  procedure OnDead(Sender: TObject);
  function RelaceMSG(s:string):string;
  public
  constructor create(const EXPCleck:boolean=True);
end;

var
  L:Plua_State;
  Running:boolean;
  MI_WINIO:string  ='WinIo.dll';
  _kernel,_U32,_gdi32,_WINIO: THandle;
  Hardwork:Boolean;

    function  luaopen_vcl(L: Plua_State): Integer; cdecl;       external 'vcl.dll';
    //function  luaopen_afx(L: Plua_State): Integer; cdecl;       external 'afx.dll';
    function  luaopen_winreg(L: Plua_State): Integer; cdecl;       external 'winreg.dll';

implementation

  uses Unit1;


constructor TScriptThread.create(const EXPCleck:boolean=True);
begin
  inherited create(false);
  ExpressionCleck:= EXPCleck;
  Ready;
  OnTerminate:=OnDead;
  freeonterminate:=true;//线程终止时自动删除对象
end;



procedure TScriptThread.OnDead(Sender: TObject);
begin
 Running:=False;
 RunScript:=nil;
 FrmMain.ToolButton16.Enabled:=True;
 FrmMain.ToolButton17.Enabled:=False;
end;

function TScriptThread.RelaceMSG(s:string):string;
begin
    if CompareText('unexpected symbol',s) = 0 then
        result :='未知的关键字,正确的关键字应该是黑体的,请您检查是不否有写错字'
      else if  CompareText(s,'to close `while') = 0 then
       result := '应该有一个 end 去关闭 while'
       else if  CompareText(s,'then'' expected') = 0 then
       result := '缺少 那么 关键字'
        else if  CompareText(s,'to close `function') = 0 then
       result := '应该有一个 返回 去关闭一个过程'
       else if  CompareText(s,'<eof> expected near `end') = 0 then
       result := '多写了一个 返回 语句? 请您仔细检查'
      else  result :='';


  end;
procedure TScriptThread.Execute;
begin
if ExpressionCleck then
begin
try
   log('开始语法检查...',clWhite);
   LuaLoadBuffer(L,User_Scr.Text, 'User_Scr');
   except
     on E: ELuaException do
        begin
        if (E.Msg <> 'STOP') then
          begin
           log(Format('[错误]:%s Line:%d',[E.Msg,E.Line]),CLRed);
          // log(Format('第 %d 行发现错误,提示消息[%s]',[E.Line,E.Msg]),CLRed);
           ErrorLine:=e.Line-1;
           FrmMain.SynEditor1.SetLineColor(ErrorLine,clBlack,clRed);
          exit;
         end;
        end;
     end;
     log('语法检查通过...',clLime);
   lua_dobuffer(L,pchar(User_Scr.Text),length(User_Scr.Text),'User_Scr');
end
else
begin
    lua_dobuffer(L,pchar(User_Scr.Text),length(User_Scr.Text),'User_Scr');
  end;
end;



procedure TScriptThread.Ready;
begin
if L<>nil then
begin
lua_close(L);
L:=nil;
end;
L := lua_open();
luaopen_base(L);
luaopen_table(L);
luaopen_string(L);
luaopen_os(L);
luaopen_math(L);
luaopen_vcl(L);
//luaopen_afx(L);
luaopen_winreg(L);
luaopen_debug(L);
lua_settop(L, 0);

//注册函数

lua_register(L,'print',API_print)  ;
lua_register(L,'stoprun',API_stoprun)  ;
//==键盘==
lua_register(L,'keypress',API_KeyPress)  ;
lua_register(L,'keydown',API_KeyDown)  ;
lua_register(L,'keyup',API_KeyUp)  ;
//==鼠标==
lua_register(L,'leftclick',API_LeftClick)  ;
lua_register(L,'rightclick',API_RightClick)  ;
lua_register(L,'middleclick',API_MiddleClick)  ;
lua_register(L,'leftdblick',API_LeftDoubleClick)  ;
lua_register(L,'leftdown',API_LeftDown);
lua_register(L,'leftup',API_LeftUp);
lua_register(L,'rightdown',API_RightDown)  ;
lua_register(L,'rightup',API_RightUp);
lua_register(L,'moveto',API_MoveTo);
lua_register(L,'mover',API_MoveR);
//==其它===
lua_register(L,'sleep',API_Sleep);
lua_register(L,'beep',API_Beep);
lua_register(L,'messagebox',API_messagebox)  ;
lua_register(L,'saystring',API_saystring)  ;
lua_register(L,'findpic',API_findpic)  ;
lua_register(L,'getpixelcolor',API_getpixelcolor)  ;

lua_register(L,'findcolor',API_findcolor)  ;
lua_register(L,'findcolorex',API_findcolorex)  ;
lua_register(L,'comparecolore',API_comparecolore)  ;
lua_register(L,'readmemory',API_readmemory)  ;

//===========系统API================
lua_register(L,'findwindow',API_FindWindow)  ;
lua_register(L,'setwindowpos',API_SetWindowPos)  ;
lua_register(L,'playsound',API_PlaySound)  ;
lua_register(L,'gettickcount',API_GetTickCount)  ;
lua_register(L,'postmessage',API_PostMessage)  ;
lua_register(L,'sendmessage',API_SendMessage)  ;
lua_register(L,'execute',API_Execute)  ;
end;




end.

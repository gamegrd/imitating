
unit Run_script;

interface
uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs,MY_API, lua, lualib,lauxlib, LuaUtils;

type      //定义线程类
  TScriptThread=class(TThread)
  protected
  procedure Execute; override;
  procedure Ready;
  procedure OnDead(Sender: TObject);
  public
  constructor create();
end;

  type
     ScrLooptype = (cRunCount,cRunUntilStop,cRunTime);
     TScrLoop=record
         Looptype:ScrLooptype;
         value:Integer;
    end;

var
  L:Plua_State;
  Running:boolean;
  Hardwork:Boolean=False;
  MI_WINIO:string  ='WinIo.dll';
  _kernel,_U32,_gdi32,_WINIO: THandle;

  ScrLoop:TScrLoop;   //循环执行;
  EnabledHwnd:HWND;    //有效窗体的句柄
  EnabledWin:string;
  Allwindow:Boolean=False;    //启用单一窗口
  RunCount:Integer=1;         //运行
  StartRunTime:Dword;

  restrict:Boolean;   //非管理员模式,不载入驱动库
    function  luaopen_vcl(L: Plua_State): Integer; cdecl;       external 'vcl.dll';
    function  luaopen_afx(L: Plua_State): Integer; cdecl;       external 'afx.dll';
    function  luaopen_winreg(L: Plua_State): Integer; cdecl;       external 'winreg.dll';
implementation
  uses PopWin;


constructor TScriptThread.create();
begin
  inherited create(false);
  Ready;
  freeonterminate:=true;//线程终止时自动删除对象
  OnTerminate:=OnDead;
end;



procedure TScriptThread.OnDead(Sender: TObject);
begin
if Running then
begin
 case ScrLoop.Looptype of
       cRunCount       :
           begin
              if RunCount <= ScrLoop.value then
                begin
                 RunScript:=nil;
                 Inc(RunCount);
                 FrmMain.ReRunscr;
                 Exit;
                end; 
             end;
       cRunUntilStop   :
           begin
                 RunScript:=nil;
                 FrmMain.ReRunscr;
                 Exit;
             end;
       cRunTime        :
           begin
               if GetTickCount - StartRunTime  < ScrLoop.value then
                  begin
                   RunScript:=nil;
                   FrmMain.ReRunscr;
                   Exit;
                  end; 
             end;
     end;
  end;
 FrmMain.Stopscr;
end;

procedure TScriptThread.Execute;
begin
  try
   LuaLoadBuffer(L,User_Scr.Text, 'User_Scr');
   except
     on E: ELuaException do
        begin
        if (E.Msg <> 'STOP') then
          begin
           log(Format('[ERROR]:%s Line:%d',[E.Msg,E.Line]),CLRed);
           ErrorLine:=e.Line-1;
           FrmMain.SynEditor1.SetLineColor(ErrorLine,clBlack,clRed,);
          exit;
         end;
        end;
     end;
    inc(RunCount); 
   lua_dobuffer(L,pchar(User_Scr.Text),length(User_Scr.Text),'User_Scr');
end;



procedure TScriptThread.Ready;
begin
if L<>nil then lua_close(L);
L := lua_open();
luaopen_base(L);
luaopen_table(L);
luaopen_string(L);
luaopen_os(L);
luaopen_math(L);
luaopen_vcl(L);
luaopen_afx(L);
luaopen_winreg(L);
luaopen_debug(L);

//注册函数
lua_register(L,'print',API_print)  ;
lua_register(L,'stoprun',API_stoprun);
//==键盘==
lua_register(L,'keypress',API_KeyPress)  ;
lua_register(L,'keydown',API_KeyDown)  ;
lua_register(L,'keyup',API_KeyUp)  ;
//==鼠标==
lua_register(L,'leftclick',API_LeftClick)  ;
lua_register(L,'rightclick',API_RightClick)  ;
lua_register(L,'middleclick',API_MiddleClick)  ;
lua_register(L,'leftdblick',API_LeftDoubleClick)  ;
lua_register(L,'leftdown',API_LeftDown)  ;
lua_register(L,'leftup',API_LeftUp)  ;
lua_register(L,'rightdown',API_RightDown)  ;
lua_register(L,'rightup',API_RightUp)  ;
lua_register(L,'moveto',API_MoveTo)  ;
lua_register(L,'mover',API_MoveR)  ;
//==其它===
lua_register(L,'sleep',API_Sleep)  ;
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

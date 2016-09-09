program RucScrTool;

uses
  Forms,
  Registry,
  Windows,
  SysUtils,
  Anti_MoreApps,
  PopWin in 'PopWin.pas' {FrmMain},
  JumpHook in 'JumpHook.pas',
  lauxlib in 'lauxlib.pas',
  lua in 'Lua.pas',
  luaconf in 'LuaConf.pas',
  lualib in 'lualib.pas',
  LuaUtils in 'LuaUtils.pas',
  MY_API in 'MY_API.pas',
  MyWindows in 'MyWindows.pas',
  publics in 'publics.pas',
  Run_script in 'Run_script.pas',
  Thread in 'Thread.pas';

{$R *.res}

begin
if ParamCount > 0 then
begin
  if not HasApp('{6F1C389A-125D-49D0-BB6F-4629C918D662}') THEN
  BEGIN
     Application.Initialize;
     Application.CreateForm(TFrmMain, FrmMain);
  SetWindowPos(FrmMain.Handle,   HWND_TOPMOST,   0,   0,   0,   0,   SWP_NOSIZE+SWP_NOMOVE);

      //=============处理参数===================
     // FrmMain.loadscr('D:\delphi7\作品\智能机器人\脚本编辑器\可发布成品\script\mm.txt');
      FrmMain.loadscr(paramstr(1));
      //=======================================
       Application.Run;
  end;
end;  
end.

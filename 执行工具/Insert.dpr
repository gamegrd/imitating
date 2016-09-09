library  Insert;

 // 窗体图标

uses
  Windows,
  Messages,
  SysUtils,
  Registry,
  JumpHook in 'JumpHook.pas',
  Thread in 'Thread.pas',
  publics in 'publics.pas',
  PopWin in 'PopWin.pas' {FrmMain},
  Run_script in 'Run_script.pas';

exports
  JumpHookOn, JumpHookOff;

const
  sFileMap = 'sFileMap_LiuMazi'; // 内存映射文件
  sProcess = 'Audition.exe';     // 插入进程对象


var
  PMainThreadID: PDWORD;
  Dll_kernel: THandle;
  Dll_my_kernel:string;
  MutexHandle, FileHandle, SubThreadID: DWORD;
  ModuleFileName: array [0..MAX_PATH] of Char;
  MYGetModuleFileName : function (hModule: HINST; lpFilename: PChar; nSize: DWORD): DWORD; stdcall;


function ReadDir: string;
var
REG:TRegistry;
keyname:string;
begin
REG:=TRegistry.Create;
keyname:='path';
try
    reg.rootkey:=HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\模拟之星',True);
    result:=reg.readstring(keyname);
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

begin
  Dll_my_kernel:= ReadDir+my_kernel;
  Dll_kernel:=LoadLibrary(pchar(Dll_my_kernel));
  MYGetModuleFileName:=GetProcAddress(Dll_kernel,'GetModuleFileNam_A'); //取得API地址

 // 检查DLL进入的进程
  MYGetModuleFileName(0, @ModuleFileName[0], MAX_PATH);
  if CompareAnsiText(ExtractFileName(ModuleFileName), sProcess) then
  begin
   // 保证只建一个线程
    MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, FALSE, DllMutex);
    if (MutexHandle <> 0) then
    begin
      CloseHandle(MutexHandle)
    end  
    else begin
     // 建sProcess子线程
      CreateThread(nil, 0, @ThreadPro, nil, 0, SubThreadID);
     // 增加自身引用计数
      GetModuleFileName(HInstance, @ModuleFileName[0], MAX_PATH);
      LoadLibrary(@ModuleFileName[0]);
     // 通知Start.exe退出
      FileHandle := OpenFileMapping(FILE_MAP_ALL_ACCESS, False, sFileMap);
      PMainThreadID := MapViewOfFile(FileHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      PostThreadMessage(PMainThreadID^, WM_QUIT, 0, 0);
      UnmapViewOfFile(PMainThreadID);
      CloseHandle(FileHandle);                        
    end;
  end;  
end.


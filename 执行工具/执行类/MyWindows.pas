unit MyWindows;

interface
  uses windows, SysUtils,Registry;

procedure LoadMYFUN ;
procedure MYinput(nr:string);
procedure KeyPressH(VCode: byte);
procedure KeyDownH(VCode: byte);
procedure KeyUPH(VCode: byte);
procedure SetKey(SCanCode: byte);

var
      my_u32:string='MYuser.dll';
      my_kernel:string='MYkernel.dll';
      MI_WINIO:string='WinIo.dll';
      _kernel,_U32,_WINIO: THandle;


//==========================MYuser32.dll==============================
keybd_event: procedure (bVk: Byte; bScan: Byte; dwFlags, dwExtraInfo: DWORD); stdcall;
mouse_event:   procedure (dwFlags, dx, dy, dwData, dwExtraInfo: DWORD); stdcall;
MapVirtualKey:   function (uCode, uMapType: UINT): UINT; stdcall;
SetCursorPos: function (X, Y: Integer): BOOL; stdcall;
GetCursorPos:function (var lpPoint: TPoint): BOOL; stdcall;
GetForegroundWindow: function :HWND;
GetFocus:function :HWND;
AttachThreadInput: function (idAttach, idAttachTo: DWORD; fAttach: BOOL): BOOL;
GetWindowThreadProcessIdA :  function (hWnd: HWND; lpdwProcessId: Pointer = nil): DWORD ;
GetWindowThreadProcessIdB :  function (hWnd: HWND; var dwProcessId: DWORD): DWORD;
SendMessage: function (hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
PostMessage: function (hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
GetWindowDC:function (hWnd: HWND): HDC; stdcall;
//==========================_kernel======================================
GetCurrentThreadId: function :DWORD;

//==========================_winio======================================
InitializeWinIo: function :Boolean;stdcall;
GetPortVal: function (PortAddr:integer;PortVal:PDWORD;bSize:BYTE):Boolean;stdcall;
SetPortVal: function (PortAddr:integer;PortVal:DWORD;bSize:BYTE):Boolean;stdcall;
ShutdownWinIo:function :Boolean;stdcall;

implementation
uses Runscript;

function ReadDir: string;
var
REG:TRegistry;
keyname:string;
begin
REG:=TRegistry.Create;
keyname:='path';
try
    reg.rootkey:=HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\模拟精灵',True);
    result:=reg.readstring(keyname);
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;


procedure LoadMYFUN ;
var
GetDir:string;
begin
  GetDir:=ReadDir;
  my_kernel:= GetDir+my_kernel;
  my_u32  := GetDir+my_u32;
  MI_WINIO:=GetDir+MI_WINIO;
  _kernel:=LoadLibrary(pchar(my_kernel));
  _U32:=LoadLibrary(pchar(my_u32));
  _WINIO:=LoadLibrary(pchar(MI_WINIO));
//==========================MYuser32.dll==============================
keybd_event:=GetProcAddress(_U32, 'keybd_eve_t');
mouse_event:=GetProcAddress(_U32, 'mouse_eve_t');
MapVirtualKey:=GetProcAddress(_U32, 'MapVirtualKe_A');
SetCursorPos:=GetProcAddress(_U32, 'SetCursorP_s');
GetCursorPos:=GetProcAddress(_U32, 'GetCursorP_s');
GetForegroundWindow:=GetProcAddress(_U32, 'GetForegroundWind_w');
GetFocus:=GetProcAddress(_U32, 'GetFoc_s');
AttachThreadInput:=GetProcAddress(_U32, 'AttachThreadInp_t');
GetWindowThreadProcessIdA:= GetProcAddress(_U32, 'GetWindowThreadProcess_d');
GetWindowThreadProcessIdB:= GetProcAddress(_U32, 'GetWindowThreadProcess_d');
SendMessage:= GetProcAddress(_U32, 'SendMessag_A'); //取得API地址}
GetWindowDC:= GetProcAddress(_U32, 'GetWindow_C'); //取得API地址}
PostMessage:= GetProcAddress(_U32, 'PostMessag_A');

//==========================_kernel======================================
GetCurrentThreadId:=GetProcAddress(_kernel, 'GetCurrentThread_d');

//==========================_WinIO======================================
InitializeWinIo:= GetProcAddress(_WINIO, 'InitializeWinIo');
GetPortVal:= GetProcAddress(_WINIO, 'GetPortVal');
SetPortVal:= GetProcAddress(_WINIO, 'SetPortVal');
ShutdownWinIo:= GetProcAddress(_WINIO, 'ShutdownWinIo');

InitializeWinIo;   //载入WINIO.SYS
end;




procedure MYinput(nr:string);
var
  f1,f2,f3,i:longint;
begin
    f1:=GetForegroundWindow;
    f2:=GetWindowThreadProcessId(f1,nil);
    AttachThreadInput(GetCurrentThreadId,f2,true);
    f3:=getfocus;
    AttachThreadInput(GetCurrentThreadId,f3,false);
    i:=1;
        while i <= Length(nr) do
        begin
        if Ord(nr[i])>127 then
        begin
        SendMessage(f3,$0286,(ord(nr[i]) shl 8) + ord(nr[i+1]) , 0);
        inc(i,2);
        end
        else
        begin
          SendMessage(f3,$0286,ord(nr[i]) , 0);
        inc(i,1);
          end;
       end;
   end;




procedure SetKey(SCanCode: byte);
begin
  asm
    //无论向0x60,还是0x64写东西前都要等状态寄存器OBF变0
    @Loop1:
    in al, $64
    and al, 10b
    jnz @Loop1
    //向$64端口写命令
    mov al, $D2//写键盘输出缓存命令    0xD2（写键盘缓冲区），0xD3（写鼠标缓冲区）
    out $64, al

    //无论向0x60,还是0x64写东西前都要等状态寄存器OBF变0
    @Loop2:
    in al, $64
    and al, 10b
    jnz @Loop2
    //向$60端口写参数
    mov al, SCanCode
    out $60, al
  end;
end;

procedure KeyPressH(VCode: byte);
begin
SetKey(MapVirtualKey(Ord(VCode), 0));
Sleep(20) ;
SetKey(MapVirtualKey(Ord(VCode), 0) +$80);
end;

procedure KeyDownH(VCode: byte);
begin
SetKey(MapVirtualKey(ord(VCode), 0));
Sleep(20);
end;

procedure KeyUPH(VCode: byte);
begin
SetKey(MapVirtualKey(ord(VCode), 0) +$80);
Sleep(20) ;
end;

end.


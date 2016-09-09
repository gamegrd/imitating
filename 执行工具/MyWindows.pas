{


  my_u32:string    ='Hook2.dll';
  my_kernel:string ='Hook1.dll';
  my_gdi32:string ='Hook3.dll';
  MI_WINIO:string  ='WinIo.dll';


}

unit MyWindows;

interface
  uses windows, SysUtils,Registry,Messages,Dialogs;

procedure LoadMYFUN ;
procedure MYinput(nr:string);
procedure KeyPressH(VCode: byte);
procedure KeyDownH(VCode: byte);
procedure KeyUPH(VCode: byte);
procedure SetKey(SCanCode: byte);
procedure SendKeys(sSend:string);

var

//==========================_winio======================================
InitializeWinIo: function :Boolean;stdcall;
GetPortVal: function (PortAddr:integer;PortVal:PDWORD;bSize:BYTE):Boolean;stdcall;
SetPortVal: function (PortAddr:integer;PortVal:DWORD;bSize:BYTE):Boolean;stdcall;
ShutdownWinIo:function :Boolean;stdcall;

implementation
uses
   Run_script;

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


procedure LoadMYFUN;
var
GetDir:string;
p:Pointer;
begin

GetDir:=ReadDir();
//==========================_WinIO======================================
if not restrict then
begin
MI_WINIO:=GetDir+MI_WINIO;
_WINIO:=LoadLibrary(pchar(MI_WINIO));
InitializeWinIo:= GetProcAddress(_WINIO, 'InitializeWinIo');
GetPortVal:= GetProcAddress(_WINIO, 'GetPortVal');
SetPortVal:= GetProcAddress(_WINIO, 'SetPortVal');
ShutdownWinIo:= GetProcAddress(_WINIO, 'ShutdownWinIo');

InitializeWinIo;   //载入WINIO.SYS
end;
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



procedure SendKeys(sSend:string);
var
    i:integer;
    Sstr:string;
    focushld,windowhld:hwnd;
    threadld:dword;
    ch: byte;
begin
  windowhld:=GetForegroundWindow;
  threadld:=GetWindowThreadProcessId(Windowhld,nil);
  AttachThreadInput(GetCurrentThreadId,threadld,true);
  Focushld:=getfocus;
  AttachThreadInput(GetCurrentThreadId,threadld,false);
  if focushld = 0 then Exit;
  i := 1;
  while i <= Length(sSend) do
  begin
    ch := byte(sSend[i]);
    if Windows.IsDBCSLeadByte(ch) then
    begin
      Inc(i);
      SendMessage(focushld, WM_IME_CHAR, MakeWord(byte(sSend[i]), ch), 0);
    end
    else
      SendMessage(focushld, WM_IME_CHAR, word(ch), 0);
    Inc(i);
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
Sleep(25);
SetKey(MapVirtualKey(Ord(VCode), 0) +$80);
end;

procedure KeyDownH(VCode: byte);
begin
SetKey(MapVirtualKey(ord(VCode), 0));
Sleep(10);
end;

procedure KeyUPH(VCode: byte);
begin
SetKey(MapVirtualKey(ord(VCode), 0) +$80);
Sleep(10) ;
end;

end.


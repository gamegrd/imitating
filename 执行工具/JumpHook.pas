unit  JumpHook;

interface

procedure JumpHookOn;
procedure JumpHookOff;

implementation

uses
  Windows;

var
  JumpHookHandle: DWORD;
  
function JumpHookPro(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  Result:= CallNextHookEx(JumpHookHandle, nCode, wParam, lParam);  
end;

procedure JumpHookOn;
begin
  JumpHookHandle := SetWindowsHookEx(WH_GETMESSAGE, @JumpHookPro, HInstance, 0);
end;

procedure JumpHookOff;
begin
  UnHookWindowsHookEx(JumpHookHandle);
end;

end.

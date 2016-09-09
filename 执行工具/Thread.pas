unit  Thread;

interface

  // 待插线程回调函数
procedure ThreadPro(X: Integer); stdcall;

implementation

uses Windows, Messages, publics,PopWin,Forms;

  // 待插线程回调函数
procedure ThreadPro(X: Integer); stdcall;
var
  MsgStruct: TMsg;
  hMutexObj: DWORD;
begin
 try
  Application.Initialize;
  Application.CreateForm(TFrmMain,FrmMain);
//  FrmMain.Hide;
  Application.Run;
  FrmMain.Free;

 finally

  CloseHandle(hMutexObj);
  FreeLibraryAndExitThread(HInstance, 0);
  end;
end;

(* 注,这个线程有窗体,也可以用FindWindow来防止重复运行 *)
end.




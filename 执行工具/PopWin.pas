unit PopWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, SynEdit, SynMemo, SynEditor,SynHighlighterIORI,
  Run_script, Spin, ComCtrls,Registry, Menus, ToolWin, ImgList,IniFiles,
  WinSkinData, CoolTrayIcon;
  
procedure Log(str:string;Color: TColor);


type
  HotKey=record
      Key:Word;
      Shift:Word;
      Id:Integer;
end;


type
  TMyHotKey=record
      StarKEy:HotKey;
      StopKey:HotKey
end;

type
  TFrmMain = class(TForm)
    SynEditor1: TSynEditor;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Button1: TToolButton;
    ToolButton3: TToolButton;
    Button2: TToolButton;
    CheckBox1: TCheckBox;
    Memo_debug: TMemo;
    ToolButton2: TToolButton;
    SkinData1: TSkinData;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ReRunscr;
    procedure Runscr;
    procedure Stopscr;
    function  RegKey(var _HotKey:HotKey;_key:string):Boolean;
    procedure GetAttribute(path:string);
    procedure Loadscr(path:string);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
     procedure WMHotKey(var Msg:TMessage);message WM_HOTKEY;
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;
  HL: TSynPasSyn;
  User_Scr:Tstringlist;
  RunScript:TScriptThread;
  ErrorLine:Integer;
  HotkeyList:array [0..254] of TMyHotKey;
  RegCount:Integer=0;   //热键注册的个数
  TOM:ATOM;             //原子表 注册热键用
  Setup:TIniFile;
  function  poweroverwhelming():boolean;       external 'UnNP.dll';
implementation
uses MyWindows;
{$R *.dfm}
procedure Log(str:string;Color: TColor);
begin
 // FrmMain.Memo_debug.Lines.Add(TimeToStr(Time)+'   '+ str) ;
  end;


procedure TFrmMain.WMHotKey(var Msg: TMessage);
var
  i:Integer;
begin
 { if (Msg.LparamLo = Shift) AND (Msg.LParamHi = Key) then
    MessageBox(0, PChar('This is HotKey'), '提示', MB_OK + MB_ICONINFORMATION +
      MB_TOPMOST); }
  for i:=0 to RegCount-1 do
   begin
      if (HotkeyList[i].StarKEy.Shift= Msg.LparamLo) and  (HotkeyList[i].StarKEy.Key= Msg.LParamHi) then Runscr;
      if (HotkeyList[i].StopKey.Shift= Msg.LparamLo) and  (HotkeyList[i].StopKey.Key= Msg.LParamHi) then Stopscr;
     end;
end;


procedure TFrmMain.GetAttribute(path:string);  //取出脚本执行属性
var
  tempini:TIniFile;
  _key:string[50];
begin
   tempini:=TIniFile.Create(Path);

    //循环　
   ScrLoop.Looptype:=ScrLooptype(tempini.ReadInteger('General','Looptype',0));
   ScrLoop.value:=tempini.ReadInteger('General','value',1);

   if ScrLoop.Looptype =cRunTime then  ScrLoop.value:=ScrLoop.value*1000;

    //
   EnabledWin:=tempini.ReadString('General','EnableWindow','当前工作窗口');
   if (EnabledWin='当前工作窗口') or  (EnabledWin='') then
   begin
   Allwindow:=True ;
   end
   else
     begin
      Allwindow:=False;
      EnabledHwnd:=FindWindow(nil,PChar(EnabledWin));
    end;

   _key:=tempini.ReadString('General','BeginHotkey','');
if  not  RegKey(HotkeyList[RegCount].StarKEy,_key) then
       begin
           MessageBox(0, '对不起,注册启动热键失败,' + #13#10 + 
             '请您重新选择启动热键后再运行', '警告', MB_OK +
             MB_ICONINFORMATION + MB_TOPMOST);
           close;  
         end;


   _key:=tempini.ReadString('General','StopHotkey','');
 if not  RegKey(HotkeyList[RegCount].StopKey,_key) then
        begin
           MessageBox(0, '对不起,注册停止热键失败,' + #13#10 +
             '请您重新选择停止热键后再运行', '警告', MB_OK +
             MB_ICONINFORMATION + MB_TOPMOST);
           close;
        end;
  // cbb_cap.Text:=tempini.ReadString('General','EnableWindow','当前工作窗口');
   tempini.Free;
 end;
  

procedure TFrmMain.Loadscr(path:string);
var
  templist:TStringList;
  i:Integer;
  star:Boolean;
begin
  GetAttribute(path);
  FrmMain.SynEditor1.Clear;
  star:=False;
  templist:=TStringList.Create();
  templist.LoadFromFile(path);   //读入当前的文件
    for   i:=0 to templist.Count-1 do
      begin
       if  templist.Strings[i]='[Script]' then
         begin
             star:=True;
             Continue
           end;
           if star then FrmMain.SynEditor1.Lines.Add( templist.Strings[i]);
       end;
  templist.Free;
Button1.Enabled:=True;
end;


procedure TFrmMain.Runscr;
var
  TMPHL: TSynPasSyn;
begin
if Running then Exit;
// FrmMain.CoolTrayIcon1.ShowBalloonHint('提示','脚本已经开始执行', bitInfo, 10);

Button2.Enabled:=True;
Button1.Enabled:=False;
Running:=true;
TMPHL:=TSynPasSyn.Create(Self);
TMPHL.ChangeKegFlag:=True;
SynEditor1.Lines.Add('');                  //加入一行空格
SynEditor1.Highlighter:= TMPHL;
TMPHL.ChangeKegFlag:=False;
SynEditor1.Lines.Delete(SynEditor1.Lines.Count-1); //删除空格
Memo_debug.Text:=TMPHL.CMDLIST.Text;
User_Scr.Clear;
User_Scr:= TMPHL.CMDLIST;  //处理后的脚本

SynEditor1.Highlighter:= HL;
TMPHL.Destroy;
StartRunTime:=GetTickCount;
if RunScript=nil then RunScript:=TScriptThread.create;

end;



procedure TFrmMain.ReRunscr;
begin
if RunScript=nil then RunScript:=TScriptThread.create;
end;


procedure TFrmMain.Stopscr;
begin
  FrmMain.CoolTrayIcon1.ShowBalloonHint('提示','脚本已经停止执行', bitInfo, 10);
  Button1.Enabled:=True;
  Button2.Enabled:=False;
  Running:=False;
  if RunScript<>nil then
  begin
    RunScript.Terminate;
    RunScript:=nil;
  end;
end;


procedure ShortCutToKey(ShortCut: TShortCut; var Key: Word; var Shift: TShiftState);
begin
  Key := ShortCut and not (scShift + scCtrl + scAlt);
  Shift := [];
  if ShortCut and scShift <> 0 then Include(Shift, ssShift);
  if ShortCut and scCtrl <> 0 then Include(Shift, ssCtrl);
  if ShortCut and scAlt <> 0 then Include(Shift, ssAlt);
end;

function ShiftStateToWord(TShift: TShiftState): Word;
begin
  Result := 0;
  if ssShift in TShift then Result := MOD_SHIFT;
  if ssCtrl in TShift then Result := Result or MOD_CONTROL;
  if ssAlt in TShift then Result:= Result or MOD_ALT;
end;

function  TFrmMain.RegKey(var _HotKey:HotKey;_key:string):Boolean;
var
    T: TShiftState;
begin
      if _key='' then
      begin
         MessageBox(0, '您还没有定义 [启动] 或 [停止] 的热键', '警告', MB_OK + 
           MB_ICONSTOP + MB_TOPMOST);
         close;
         Exit;  
        end;

       _HotKey.Id := TOM - $2129+RegCount;
        Inc(RegCount);
       ShortCutToKey( TextToShortCut(_key) , _HotKey.Key, T);
       _HotKey.Shift := ShiftStateToWord(T);
      result:= RegisterHotKey(Handle, _HotKey.Id, _HotKey.Shift, _HotKey.Key);
  end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
Runscr;
end;


procedure WriteDir;
var
REG:TRegistry;
keyname:string;
begin
REG:=TRegistry.Create;
keyname:='path';
try
    reg.rootkey:=HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\模拟精灵',True);
    reg.WriteString(keyname,GetCurrentDir+'\');
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
poweroverwhelming;
Setup:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Setup.ini');
restrict:=Setup.ReadBool('系统设置','非管理员模式',False);
CheckBox1.Enabled:=not restrict;


SetWindowLong(Application.Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);
TOM:=GlobalAddAtom('simulatefairy');  //给原子表增加项目
HL := TSynPasSyn.Create(Self);
SynEditor1.Highlighter := HL;
User_Scr:=Tstringlist.Create;

//WriteDir;
LoadMYFUN ;
end;



procedure TFrmMain.Button2Click(Sender: TObject);
begin
Stopscr;
end;

procedure TFrmMain.CheckBox1Click(Sender: TObject);
begin
Hardwork:= CheckBox1.Checked;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if not restrict then ShutdownWinIo;
end;

procedure TFrmMain.N1Click(Sender: TObject);
begin
 FrmMain.Show;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
var
  i:Integer;
begin
GlobalDeleteAtom(Tom);
for i:=0 to RegCount-1 do
begin
   UnRegisterHotKey(Handle, HotkeyList[i].StarKEy.Id);
   UnRegisterHotKey(Handle, HotkeyList[i].StopKey.Id);
  end;
end;

procedure TFrmMain.N2Click(Sender: TObject);
begin
Stopscr;
close;
end;

end.

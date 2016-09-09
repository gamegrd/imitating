unit Cladmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls,IniFiles, ToolWin, StdCtrls, ImgList,shellapi,
  WinSkinData,Menus,HideProcess, CoolTrayIcon, OleCtrls, SHDocVw;




type
  TForm_Admin = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ListView1: TListView;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    HotKey1: THotKey;
    HotKey2: THotKey;
    cbb_cap: TComboBox;
    GroupBox2: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ImageList1: TImageList;
    SkinData1: TSkinData;
    Button1: TButton;
    AtrbChanged: TButton;
    Label4: TLabel;
    Edit_MS: TEdit;
    Label_filename: TLabel;
    Memo1: TMemo;
    Splitter1: TSplitter;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    CoolTrayIcon1: TCoolTrayIcon;
    N2: TMenuItem;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Timer1: TTimer;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    Label6: TLabel;
    Edit_loop: TEdit;
    Button2: TButton;
    WebBrowser1: TWebBrowser;
    procedure FlashScript;
    procedure GetAttribute(_filename:string);
    procedure SetAttribute(_filename:string);
    procedure EditScr(_filename:string);
    procedure ReadyRunScr(_filename:string);
    procedure Deletescr(_filename:string);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AtrbChangedClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cbb_capSelect(Sender: TObject);
    procedure HotKey1Change(Sender: TObject);
    procedure HotKey2Change(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type
     ScrLooptype = (cRunCount,cRunUntilStop,cRunTime);
     TScrLoop=record
         Looptype:ScrLooptype;
         value:Integer;
    end;


var
  Form_Admin: TForm_Admin;
  ScrLoop:TScrLoop;
  ListView_Now_Select:Integer;
  Setup:TIniFile;
    function  poweroverwhelming():boolean;       external 'UnNP.dll';
implementation

uses Unit1, unitFrmMain, SetLoop, admin_setup;

{$R *.dfm}


function GetAllFileNames(const Path:string):TStrings;
var
 SearchRec: TSearchRec;
 TempList:TStrings;
begin
 TempList:=TStringList.Create;
 TempList.Clear;
 if FindFirst(Path+'\*.txt',faArchive,SearchRec)=0 then
 begin
  TempList.Add(SearchRec.Name);
  while FindNext(SearchRec)=0 do
  begin
   TempList.Add(SearchRec.Name);
  end;
 end;
 FindClose(SearchRec);
 Result:=TempList;
end;


procedure TForm_Admin.FlashScript;
var
  scrlist:TStrings;
  Path:string;
  tempini:TIniFile;
  i:Integer;
  _staykey,_stopkey:string[50];
  Description:string;  //描述
begin
    try
     ListView1.Clear;
     scrlist:=TStrings.Create;
     Path:=ExtractFilePath(Application.ExeName)+'script\';
     scrlist:=GetAllFileNames(Path);
     for i:=0 to scrlist.Count-1 do
       begin
           tempini:=TIniFile.Create(Path+scrlist.Strings[i]);
           _staykey:=tempini.ReadString('General','BeginHotkey','没有设置');
           _stopkey:=tempini.ReadString('General','StopHotkey','没有设置');
           Description:=tempini.ReadString('General','Description','您还没有写脚本描述');
           
           with ListView1.Items.Add do
              begin
                   Caption :=scrlist.Strings[i] ;
                   SubItems.Add(_staykey);
                   SubItems.Add(_stopkey);
                   SubItems.Add(Description);
                end;
           tempini.Free;
         end;

     finally
       scrlist.Free;
      end;
end;

{
procedure TForm_Admin.ToolButton1Click(Sender: TObject);
var
  myini:TStringList;
  i:Integer;
  star:Boolean;
begin
   star:=False;
myini:=TStringList.Create();
myini.LoadFromFile('D:\delphi7\作品\智能机器人\脚本编辑器\可发布成品\script\后台发送键盘消息.txt');
for   i:=0 to myini.Count-1 do
begin
   if  myini.Strings[i]='[Script]' then
     begin
         star:=True;
         Continue
       end;
       if star then Memo1.Lines.Add( myini.Strings[i]);
  end;
end; }


function EnumWndProc(AWnd: HWND; AlParam: LPARAM):Boolean;stdcall;
var
  WndCaption: array[0..254] of Char;
begin
 if IsWindowVisible(AWnd)   then
      begin
         GetWindowText(AWnd, @WndCaption, 254);
         if WndCaption[0]<>chr(0) then
          Form_Admin.cbb_cap.Items.Add(Format('%s',[WndCaption]));
      end;


  Result := True;
end;

procedure TForm_Admin.GetAttribute(_filename:string);
var
  path:string[255];
  tempini:TIniFile;
  _key:string[50];
  sm:string;
begin
   Label_filename.Caption:=_filename;
   Path:=ExtractFilePath(Application.ExeName)+'script\'+_filename ;
   tempini:=TIniFile.Create(Path);
   _key:=tempini.ReadString('General','BeginHotkey','');
   HotKey1.HotKey:=TextToShortCut(_key);
   _key:=tempini.ReadString('General','StopHotkey','');
   HotKey2.HotKey:=TextToShortCut(_key);
    //循环　
   ScrLoop.Looptype:=ScrLooptype(tempini.ReadInteger('General','Looptype',0));
   ScrLoop.value:=tempini.ReadInteger('General','value',1);
   Form_SetLoop.Showme;  //

   Edit_MS.Text:=tempini.ReadString('General','Description','');
   cbb_cap.Text:=tempini.ReadString('General','EnableWindow','当前工作窗口');
   if cbb_cap.Text='' then cbb_cap.Text:= '当前工作窗口';
   sm:=tempini.ReadString('Comment','Content','');
   Memo1.Text:=StrToLines(sm);
   tempini.Free;
  end;

procedure TForm_Admin.SetAttribute(_filename:string);
var
  path:string[255];
  tempini:TIniFile;
  _key:string[50];
  sm:string;
begin
   Path:=ExtractFilePath(Application.ExeName)+'script\'+_filename ;
   tempini:=TIniFile.Create(Path);
   _key:=ShortCutToText(HotKey1.HotKey);
    tempini.WriteString('General','BeginHotkey',_key);
   _key:=ShortCutToText(HotKey2.HotKey);
   tempini.WriteString('General','StopHotkey',_key);
       //循环　
   tempini.WriteInteger('General','Looptype',Ord(ScrLoop.Looptype));
   tempini.WriteInteger('General','value',ScrLoop.value);


   tempini.WriteString('General','Description',Edit_MS.Text);
   tempini.WriteString('General','EnableWindow',cbb_cap.Text);
   sm:=LinesToStr(Memo1.Text);
   tempini.WriteString('Comment','Content',sm);
   tempini.UpdateFile;
   tempini.Free;
  end;


procedure TForm_Admin.EditScr(_filename:string);
var
  path:string[255];
  templist:TStringList;
  i:Integer;
  star:Boolean;
begin
  FrmMain.SynEditor1.Clear;
  scr_head.Clear;
  Path:=ExtractFilePath(Application.ExeName)+'script\'+_filename ;
  NowSCRNAME:=Path;
  star:=False;
  templist:=TStringList.Create();
  templist.LoadFromFile(NowSCRNAME);   //读入当前编辑的文件
for   i:=0 to templist.Count-1 do
  begin
   if  templist.Strings[i]='[Script]' then
     begin
         star:=True;
         Continue
       end;
       if star then FrmMain.SynEditor1.Lines.Add( templist.Strings[i]) else scr_head.Add(templist.Strings[i]);
  end;

  scr_head.Add('[Script]');

  Frmmain.WindowState:=wsMaximized;
  Frmmain.show;
  Form_Admin.Hide;
  templist.Free;
 end;

procedure TForm_Admin.ReadyRunScr(_filename:string);
var
  path:string;
  RunHMutex: THandle;
begin
 Path:=format('"%s"',[ExtractFilePath(Application.ExeName)+'script\'+_filename]) ;

  RunHMutex := OpenMutex(MUTEX_ALL_ACCESS, False, PChar('{6F1C389A-125D-49D0-BB6F-4629C918D662}'));
  if RunHMutex <> 0 then
  BEGIN
     Application.MessageBox('对不起,有脚本正在执行中,' + #13#10 + 
       '暂时不支持同时运行多个脚本.', '提示', MB_OK + MB_ICONINFORMATION +
       MB_TOPMOST);
     Exit;
    end;

    if (HotKey1.HotKey=0) or (HotKey2.HotKey=0) then
     begin
        Application.MessageBox(PChar(Format('对不起,您还没有给脚本 [ %s ] 设置热键,不能载入执行器'
     +#13#10 +'设置热键后,记得按一下 [保存所做的修改] 按钮哦',[Label_filename.caption])),
         '提示', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
         Exit;
       end;
         ShellExecute(handle, pchar('open'), pchar('RucScrTool.exe')
         , pchar(path), pchar(ExtractFilePath(Paramstr(0))),SW_SHOW);
      Form_Admin.Hide;
     Form_Admin.CoolTrayIcon1.ShowBalloonHint('提示','模拟之星被最小化,'
     +#13#10+'为节省系统资源,您可以关闭它', bitInfo, 10);

    end;

procedure TForm_Admin.Deletescr(_filename:string);
var
path:string[255];
begin
   Path:=ExtractFilePath(Application.ExeName)+'script\'+_filename ;
   DeleteFile(path);
  end;


procedure TForm_Admin.FormCreate(Sender: TObject);
begin
poweroverwhelming;
Setup:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Setup.ini');
Randomize;
Button1.Click;  //   刷新当前窗体列表
FlashScript;    //刷新脚本列表
//WebBrowser1.Navigate('http://www.monijl.com/notice.htm');
end;

procedure TForm_Admin.Button1Click(Sender: TObject);
begin
 cbb_cap.Clear ;
 cbb_cap.Items.Add('当前工作窗口') ;
 EnumWindows(@EnumWndProc,0);
end;

procedure TForm_Admin.AtrbChangedClick(Sender: TObject);
begin
{if ListView1.ItemIndex >-1 then
begin
SetAttribute(ListView1.Items[ListView1.ItemIndex].Caption);
end;  }

if (Label_filename.Caption='文件名') then Exit;
SetAttribute(Label_filename.Caption);
FlashScript;    //刷新脚本列表
end;

procedure TForm_Admin.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
ListView_Now_Select:=ListView1.ItemIndex;
if ListView1.ItemIndex >-1 then
begin
GetAttribute(ListView1.Items[ListView1.ItemIndex].Caption);
end;
end;

procedure TForm_Admin.ToolButton2Click(Sender: TObject);
begin
if ListView1.ItemIndex >-1 then
begin
EditScr(ListView1.Items[ListView1.ItemIndex].Caption);
end;
end;

procedure TForm_Admin.ToolButton1Click(Sender: TObject);
var
  ASCR:TStringList;
  i:Integer;
  filname:string;
begin
   try
     ASCR:=TStringList.Create;
     ASCR.Add('[General]');
     ASCR.Add('[Comment]');
     ASCR.Add('[Script]');
     SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName)+'script\';
     SaveDialog1.Title:='保存文件';
     if SaveDialog1.Execute then
        begin
           ASCR.SaveToFile(SaveDialog1.FileName);
             FlashScript;    //刷新脚本列表
             filname:=ExtractFileName(SaveDialog1.FileName);
             GetAttribute(filname);
             EditScr(filname);
          end;

     finally
      ASCR.Free;
    end;


end;

procedure TForm_Admin.ToolButton3Click(Sender: TObject);
begin
  if ListView1.ItemIndex >-1 then
    begin
        if Application.MessageBox('您确定要删除这个脚本吗?' + #13#10 +
          '删除后将无法使用常规手段找回!', '提示', MB_YESNO + MB_ICONWARNING +
          MB_TOPMOST) = IDYES then
         begin
             Deletescr(ListView1.Items[ListView1.ItemIndex].Caption);
             FlashScript;
          end;

      end;
end;

procedure TForm_Admin.ToolButton6Click(Sender: TObject);
begin
ToolButton6.Down:=True;
ToolButton6.Hint:='保护功能已经开启';
Form_adminSetup.caption:='';
Form_Admin.CoolTrayIcon1.ShowBalloonHint('提示',PChar('保护功能已经开启'), bitInfo, 11);
MyHideProcess;

end;

procedure TForm_Admin.ToolButton4Click(Sender: TObject);
begin
  Form_record.Showme;
  Form_Admin.Hide;
end;

procedure TForm_Admin.N1Click(Sender: TObject);
begin
close;
end;

procedure TForm_Admin.N2Click(Sender: TObject);
begin
Form_record.Close;
if changeed then FrmMain.Show else FrmMain.Close;       //关的时候会自动打开主窗体
end;

procedure TForm_Admin.ToolButton5Click(Sender: TObject);
begin
if ListView1.ItemIndex >-1 then
begin
ReadyRunScr(ListView1.Items[ListView1.ItemIndex].Caption);
end
else
begin
   Application.MessageBox('请选择您要执行的脚本', '提示', MB_OK + 
     MB_ICONINFORMATION + MB_TOPMOST);
  end;

end;

procedure TForm_Admin.ListView1DblClick(Sender: TObject);
begin
if ListView1.ItemIndex >-1 then
begin
EditScr(ListView1.Items[ListView1.ItemIndex].Caption);
end;
end;


procedure ClearMemory;
begin
        if Win32Platform = VER_PLATFORM_WIN32_NT then
        begin
                SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
                application.ProcessMessages;
        end;
end;

procedure TForm_Admin.Timer1Timer(Sender: TObject);
begin
 ClearMemory;
end;

procedure TForm_Admin.Button2Click(Sender: TObject);
begin
Form_SetLoop.Showme(True);
end;

procedure TForm_Admin.cbb_capSelect(Sender: TObject);
begin
Form_Admin.CoolTrayIcon1.ShowBalloonHint('提示',PChar('您修改了属性,记得按一下保存哦'), bitInfo, 10);
end;

procedure TForm_Admin.HotKey1Change(Sender: TObject);
begin
Form_Admin.CoolTrayIcon1.ShowBalloonHint('提示',PChar('您修改了属性,记得按一下保存哦'), bitInfo, 10);

end;

procedure TForm_Admin.HotKey2Change(Sender: TObject);
begin
Form_Admin.CoolTrayIcon1.ShowBalloonHint('提示',PChar('您修改了属性,记得按一下保存哦'), bitInfo, 10);

end;

procedure TForm_Admin.ToolButton7Click(Sender: TObject);
begin
Form_adminSetup.ShowModal;
end;

procedure TForm_Admin.ToolButton12Click(Sender: TObject);
begin
 ShellExecute(0, 'open',PChar('http://www.monijl.com'),nil,'', SW_SHOWNORMAL);
end;

initialization  
   SetThreadLocale($0804);
   
end.

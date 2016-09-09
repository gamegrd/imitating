unit Cladmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls,IniFiles, ToolWin, StdCtrls, ImgList,
  WinSkinData,Menus;

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
    Button2: TButton;
    Label4: TLabel;
    Edit_MS: TEdit;
    Label_filename: TLabel;
    Memo1: TMemo;
    Splitter1: TSplitter;
    procedure FlashScript;
    procedure GetAttribute(_filename:string);
    procedure SetAttribute(_filename:string);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Admin: TForm_Admin;
implementation

{$R *.dfm}

const
  csLinesCR = #13#10;
  csStrCR = '\n';
// 多行文本转单行（换行符转'\n'）
function LinesToStr(const Lines: string): string;
var
  i: Integer;
begin
  Result := Lines;
  i := Pos(csLinesCR, Result);
  while i > 0 do
  begin
    system.Delete(Result, i, Length(csLinesCR));
    system.insert(csStrCR, Result, i);
    i := Pos(csLinesCR, Result);
  end;
end;

// 单行文本转多行（'\n'转换行符）
function StrToLines(const Str: string): string;
var
  i: Integer;
begin
  Result := Str;
  i := Pos(csStrCR, Result);
  while i > 0 do
  begin
    system.Delete(Result, i, Length(csStrCR));
    system.insert(csLinesCR, Result, i);
    i := Pos(csStrCR, Result);
  end;
end;


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
     Path:=GetCurrentDir+'\script\';
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
   Path:=GetCurrentDir+'\script\'+_filename ;
   tempini:=TIniFile.Create(Path);
   _key:=tempini.ReadString('General','BeginHotkey','');
   HotKey1.HotKey:=TextToShortCut(_key);
   _key:=tempini.ReadString('General','StopHotkey','');
   HotKey2.HotKey:=TextToShortCut(_key);
   Edit_MS.Text:=tempini.ReadString('General','Description','');
   cbb_cap.Text:=tempini.ReadString('General','EnableWindow','当前工作窗口');
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
   Path:=GetCurrentDir+'\script\'+_filename ;
   tempini:=TIniFile.Create(Path);
   _key:=ShortCutToText(HotKey1.HotKey);
    tempini.WriteString('General','BeginHotkey',_key);
   _key:=ShortCutToText(HotKey2.HotKey);
   tempini.WriteString('General','StopHotkey',_key);
   tempini.WriteString('General','Description',Edit_MS.Text);
   if  cbb_cap.Text='当前工作窗口' then  tempini.WriteString('General','EnableWindow','')
    else  tempini.WriteString('General','EnableWindow',cbb_cap.Text);
   sm:=LinesToStr(Memo1.Text);
   tempini.WriteString('Comment','Content',sm);
   tempini.UpdateFile;
   tempini.Free;
  end;


procedure TForm_Admin.FormCreate(Sender: TObject);
begin
Button1.Click;  //   刷新当前窗体列表
FlashScript;    //刷新脚本列表
end;

procedure TForm_Admin.Button1Click(Sender: TObject);
begin
 cbb_cap.Clear ;
 cbb_cap.Items.Add('当前工作窗口') ;
 EnumWindows(@EnumWndProc,0);
end;

procedure TForm_Admin.ListView1Click(Sender: TObject);
begin
if ListView1.ItemIndex >-1 then
begin
GetAttribute(ListView1.Items[ListView1.ItemIndex].Caption);
end;
end;

procedure TForm_Admin.Button2Click(Sender: TObject);
begin
if ListView1.ItemIndex >-1 then
begin
SetAttribute(ListView1.Items[ListView1.ItemIndex].Caption);
end;
FlashScript;    //刷新脚本列表
end;

end.

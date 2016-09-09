
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditSource, SynEditPrint, ImgList, SynEditActions, ActnList,
  Menus, ComCtrls, ToolWin, SynEdit, SynMemo, SynEditor, StdCtrls, ExtCtrls
  ,Run_script, Spin, SkinCtrls, SkinBoxCtrls,IniFiles, WinSkinData,SynEditCodeFolding,
  SynEditHighlighter, SynHighlighterIORI,Registry,MyWindows;

function LinesToStr(const Lines: string): string;
function StrToLines(const Str: string): string;  

const
  csLinesCR = #13#10;
  csStrCR = '\n';

  type
    grasp=record
      x:integer;
      Y:integer;
      Color:TColor;
end;
    procedure Log(str:string;Color: TColor);

var
    CaPointList:array[0..9]of grasp;
    Setup:TIniFile;



type
  TFrmMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    toolcx: TToolButton;
    ToolButton7: TToolButton;
    toolcut: TToolButton;
    toolcopy: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    mm1: TMainMenu;
    N1: TMenuItem;
    S1: TMenuItem;
    N3: TMenuItem;
    x1: TMenuItem;
    U1: TMenuItem;
    R1: TMenuItem;
    N8: TMenuItem;
    X2: TMenuItem;
    N32: TMenuItem;
    C1: TMenuItem;
    N33: TMenuItem;
    P1: TMenuItem;
    N9: TMenuItem;
    D1: TMenuItem;
    t1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N17: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    aSynClearAll11: TMenuItem;
    N13: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N34: TMenuItem;
    F1: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    aSynReplaceNext11: TMenuItem;
    aSynReplaceLast11: TMenuItem;
    O2: TMenuItem;
    E1: TMenuItem;
    actlst1: TActionList;
    aSynReadOnly1: TaSynReadOnly;
    aSynNormalSelect1: TaSynNormalSelect;
    aSynColumnSelect1: TaSynColumnSelect;
    aSynLineSelect1: TaSynLineSelect;
    aSynUndo1: TaSynUndo;
    aSynRedo1: TaSynRedo;
    aSynCut1: TaSynCut;
    aSynAppendCut1: TaSynAppendCut;
    aSynCopy1: TaSynCopy;
    aSynAppendCopy1: TaSynAppendCopy;
    aSynPaste1: TaSynPaste;
    aSynDeleteNextchar1: TaSynDeleteNextchar;
    aSynDeleteLastChar1: TaSynDeleteLastChar;
    aSynDeleteWordToEnd1: TaSynDeleteWordToEnd;
    aSynDeleteWordToStart1: TaSynDeleteWordToStart;
    aSynDeleteWord1: TaSynDeleteWord;
    aSynDeleteLineToEnd1: TaSynDeleteLineToEnd;
    aSynDeleteLineToStart1: TaSynDeleteLineToStart;
    aSynDeleteLine1: TaSynDeleteLine;
    aSynClearAll1: TaSynClearAll;
    aSynSelectAll1: TaSynSelectAll;
    aSynSelectLine1: TaSynSelectLine;
    aSynSelectNextLine1: TaSynSelectNextLine;
    aSynSelectLastLine1: TaSynSelectLastLine;
    aSynSelectWrod1: TaSynSelectWrod;
    aSynSelectNextWord1: TaSynSelectNextWord;
    aSynSelectLastWord1: TaSynSelectLastWord;
    aSynGotoBookmark1: TaSynGotoBookmark;
    aSynSetBookmark1: TaSynSetBookmark;
    aSynClearBookmark1: TaSynClearBookmark;
    aSynGotoLastChange1: TaSynGotoLastChange;
    aSynMatchBracket1: TaSynMatchBracket;
    aSynCommentBlock1: TaSynCommentBlock;
    aSynFind1: TaSynFind;
    aSynFindNext1: TaSynFindNext;
    aSynFindLast1: TaSynFindLast;
    aSynFindNextWord1: TaSynFindNextWord;
    aSynFindLastWord1: TaSynFindLastWord;
    aSynReplace1: TaSynReplace;
    aSynReplaceNext1: TaSynReplaceNext;
    aSynReplaceLast1: TaSynReplaceLast;
    aSynUpperCase1: TaSynUpperCase;
    aSynLowerCase1: TaSynLowerCase;
    aSynToggleCase1: TaSynToggleCase;
    aSynTitleCase1: TaSynTitleCase;
    aSynBlockIndent1: TaSynBlockIndent;
    aSynBlockUnindent1: TaSynBlockUnindent;
    aSynInsertLine1: TaSynInsertLine;
    aSynLineBreak1: TaSynLineBreak;
    aSynFileFormatDos1: TaSynFileFormatDos;
    aSynFileFormatMac1: TaSynFileFormatMac;
    aSynFileFormatUnix1: TaSynFileFormatUnix;
    aSynPrint1: TaSynPrint;
    aSynQuickPrint1: TaSynQuickPrint;
    aSynExporter1: TaSynExporter;
    aSynExporter2: TaSynExporter;
    aSynExporter3: TaSynExporter;
    aSynSave1: TaSynSave;
    aSynSaveAs1: TaSynSaveAs;
    aSynSaveSel1: TaSynSaveSel;
    aSynNew1: TaSynNew;
    aSynGotoBookmark2: TaSynGotoBookmark;
    aSynSetBookmark2: TaSynSetBookmark;
    aSynGotoBookmark3: TaSynGotoBookmark;
    aSynSetBookmark3: TaSynSetBookmark;
    aSynGotoBookmark4: TaSynGotoBookmark;
    aSynGotoBookmark5: TaSynGotoBookmark;
    aSynSetBookmark5: TaSynSetBookmark;
    aSynGotoBookmark6: TaSynGotoBookmark;
    aSynSetBookmark6: TaSynSetBookmark;
    aSynGotoBookmark7: TaSynGotoBookmark;
    aSynSetBookmark7: TaSynSetBookmark;
    aSynGotoBookmark8: TaSynGotoBookmark;
    aSynSetBookmark8: TaSynSetBookmark;
    aSynGotoBookmark9: TaSynGotoBookmark;
    aSynSetBookmark9: TaSynSetBookmark;
    aSynGotoBookmark10: TaSynGotoBookmark;
    aSynSetBookmark10: TaSynSetBookmark;
    aSynSetBookmark4: TaSynSetBookmark;
    aSynOpen1: TaSynOpen;
    aSynInsertFile1: TaSynInsertFile;
    aSynPageSetup1: TaSynPageSetup;
    aSynPreview1: TaSynPreview;
    aSynClose1: TaSynClose;
    aSynJump1: TaSynJump;
    aSynOptionsSetting1: TaSynOptionsSetting;
    aSynToggleHighlighter1: TaSynToggleHighlighter;
    il1: TImageList;
    SynEditSource1: TSynEditSource;
    ImageList1: TImageList;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    SynEditor1: TSynEditor;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    PageControl1: TPageControl;
    Q1: TMenuItem;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel8: TPanel;
    Splitter3: TSplitter;
    TabSheet4: TTabSheet;
    Memo_help: TMemo;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    SpinEdit2: TSpinEdit;
    Button2: TButton;
    ComboBox2: TComboBox;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Button3: TButton;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    Button4: TButton;
    SpinEdit3: TSpinEdit;
    Label8: TLabel;
    SpinEdit4: TSpinEdit;
    Label9: TLabel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    SpinEdit5: TSpinEdit;
    Button5: TButton;
    ComboBox4: TComboBox;
    GroupBox9: TGroupBox;
    Label14: TLabel;
    Button6: TButton;
    Button7: TButton;
    ComboBox_Mouse: TspSkinColorComboBox;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Edit_Key:TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    N57: TMenuItem;
    N58: TMenuItem;
    ToolButton17: TToolButton;
    Memo_debug: TRichEdit;
    GroupBox10: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label29: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Button8: TButton;
    Edit6: TEdit;
    Button10: TButton;
    Edit13: TEdit;
    GroupBox12: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Button11: TButton;
    ComboBox3: TComboBox;
    ComboBox5: TComboBox;
    ComboBox_findcolo: TspSkinColorComboBox;
    Edit14: TEdit;
    TabSheet1: TTabSheet;
    TreeView1: TTreeView;
    SkinData1: TSkinData;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    GroupBox11: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label31: TLabel;
    Button9: TButton;
    ComboBox6: TComboBox;
    ComboBox_ifPos: TspSkinColorComboBox;
    ComboBox_ifColo: TspSkinColorComboBox;
    SpinEdit6: TSpinEdit;
    procedure CMDialogKey(var Message: TCMDialogKey);
     message CM_DIALOGKEY;
    procedure CreateEditor(Sender: TObject;  var Editor: TCustomSynEditor);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure Q1Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure SynEditor1Click(Sender: TObject);
 //   procedure Edit_KeyKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_KeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button7Click(Sender: TObject);


    procedure GraspCrtl(_pos:integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure ComboBox3Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure SpinEdit6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure SynEditor1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_KeyEnter(Sender: TObject);
    procedure Edit_KeyExit(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox_ifColoMouseEnter(Sender: TObject);
    procedure SpinEdit5Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit_KeyClick(Sender: TObject);
    procedure SpinEdit3Enter(Sender: TObject);
    procedure ComboBox_ifPosMouseEnter(Sender: TObject);
    procedure ComboBox_MouseMouseEnter(Sender: TObject);
    procedure Edit1Click(Sender: TObject);

  private
    { Private declarations }
     procedure GetHelp(key:string);
   public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;
  HL: TSynpasSyn;
  User_Scr:Tstringlist;
  RunScript:TScriptThread;
  ErrorLine:Integer;
  Helpini:TMemIniFile;
  scr_head:TStringList ;
  NowSCRNAME:string;
  changeed:Boolean=False;
  CanChangeKey:Boolean=False;
  NowKey:Word;
implementation

 uses  Cashpoint, WindowTool, Cladmin, about;
{$R *.dfm}

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



procedure TFrmMain.CMDialogKey(var Message: TCMDialogKey);
begin
  //  if message.CharCode=VK_TAB then
     if not CanChangeKey  then exit;
     Edit_Key.Text :=KeyIdToKeyName(message.CharCode);
     NowKey:=message.CharCode;
 //   else
    inherited;
end;

procedure TFrmMain.GetHelp(key:string);
var
  Templist:TStringList;
  i:Integer;
  nr:string;
begin
  Memo_help.Clear;
  try
    Templist:=TStringList.Create;
    Helpini.ReadSection(key,Templist);
    if Templist.Count>=0 then
     for i:=0 to Templist.Count-1 do
     begin
      nr:=Templist.Strings[i];
      Memo_help.Lines.Add(StrToLines(Format('%s %s',[nr,Helpini.ReadString(key,nr,'')])));
     // Helpini.WriteString(key,'脚本',SynEditor1.Text);
     // Helpini.UpdateFile;
      end;
  finally
    Templist.Free;
  end;
end;

procedure Log(str:string;Color: TColor);
begin
  FrmMain.Memo_debug.SelAttributes.Color:=Color;
  FrmMain.Memo_debug.SelText:=str + #10;
//  FrmMain.Memo_debug.Perform(WM_VSCROLL, SB_BOTTOM, 0);
  end;

  
procedure TFrmMain.GraspCrtl(_pos:integer);
begin
ComboBox_Mouse.Items.Objects[_pos]:=TObject(CaPointList[_pos].Color);
ComboBox_Mouse.Items[_pos]:=format('%d,%d',[CaPointList[_pos].x,CaPointList[_pos].Y]);
ComboBox_ifPos.Items.Objects[_pos]:=TObject(CaPointList[_pos].Color);
ComboBox_ifPos.Items[_pos]:=format('%d,%d',[CaPointList[_pos].x,CaPointList[_pos].Y]);

ComboBox_ifPos.Items.Objects[_pos]:=TObject(CaPointList[_pos].Color);
ComboBox_ifPos.Items[_pos]:=format('%d,%d',[CaPointList[_pos].x,CaPointList[_pos].Y]);

ComboBox_ifColo.Items.Objects[_pos]:=TObject(CaPointList[_pos].Color);
ComboBox_ifColo.Items[_pos]:=format('%d,%d',[CaPointList[_pos].x,CaPointList[_pos].Y]);

ComboBox_findcolo.Items.Objects[_pos]:=TObject(CaPointList[_pos].Color);
ComboBox_findcolo.Items[_pos]:=format('%d,%d',[CaPointList[_pos].x,CaPointList[_pos].Y]);

Setup.WriteString((format('点%d',[_pos])),'坐标',format('%d,%d',[CaPointList[_pos].x,CaPointList[_pos].Y]))  ;
Setup.WriteInteger(format('点%d',[_pos]),'颜色',CaPointList[_pos].Color) ;

end;


procedure TFrmMain.Q1Click(Sender: TObject);
begin
close;
end;

procedure TFrmMain.CreateEditor(Sender: TObject;
  var Editor: TCustomSynEditor);
begin
 editor := SynEditor1;
end;



procedure GetInt2(S:String; var x,y:Integer);
var
  i,_pos:Integer;

begin
  _pos:=Pos(',',S);
  i:=strtoint(Copy(s,1,_pos-1));
  x:=i;
  Delete(s,1,(_pos));
  i:=strtoint(s);
  Y:=i;
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
    reg.OpenKey('Software\模拟之星',True);
    reg.WriteString(keyname,GetCurrentDir+'\');
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  i:integer;
  T:TColor;
  _POS:string;
  x,y:Integer;
  FoldRegion: TFoldRegionItem;
begin
  scr_head:=TStringList.Create;  //建立文件头[脚本属性]
  WriteDir;                      //写注册表,写入自己的目录
  LoadMYFUN;

  Setup:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Setup.ini');
  Helpini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'\Help.ini');

  HL := TSynPasSyn.Create(Self);
  SynEditor1.Highlighter := HL;
  User_Scr:=Tstringlist.Create;


  //=============
ComboBox_Mouse.Items.Clear;
ComboBox_ifPos.Items.Clear;
ComboBox_ifColo.Items.Clear;
ComboBox_findcolo.Items.Clear;
T:=clBlack;

for i:=0 to 9 do
begin
   _POS:=Setup.ReadString((format('点%d',[i])),'坐标','0,0')  ;
   T:=Setup.ReadInteger(format('点%d',[i]),'颜色',0) ;
   GetInt2(_Pos,x,y);
   CaPointList[i].x:=x;
   CaPointList[i].Y:=y;
   CaPointList[i].Color:=T;

   ComboBox_Mouse.Items.AddObject(_POS,TObject(T));
   ComboBox_ifPos.Items.AddObject(_POS,TObject(T));
   ComboBox_ifColo.Items.AddObject(_POS,TObject(T));
   ComboBox_findcolo.Items.AddObject(_POS,TObject(T));
  end;

ComboBox_Mouse.ItemIndex:=0;
ComboBox_ifPos.ItemIndex:=0;
ComboBox_ifColo.ItemIndex:=0;
ComboBox_findcolo.ItemIndex:=0;

  //=============

//===========折叠========


end;


procedure TFrmMain.ToolButton16Click(Sender: TObject);
var
  TMPHL: TSynpasSyn;
  i:Integer;
begin
Memo_debug.Clear;
TMPHL:=TSynpasSyn.Create(Self);
TMPHL.ChangeKegFlag:=True;
SynEditor1.Lines.Add('');                  //加入一行空格
SynEditor1.Highlighter:= TMPHL;
TMPHL.ChangeKegFlag:=False;
SynEditor1.Lines.Delete(SynEditor1.Lines.Count-1); //删除空格
//Memo_debug.Text:=TMPHL.CMDLIST.Text;
User_Scr.Clear;
User_Scr:= TMPHL.CMDLIST;  //处理后的脚本

SynEditor1.Highlighter:= hl;
TMPHL.Destroy;
Running:=true;
FrmMain.ToolButton16.Enabled:=False;
FrmMain.ToolButton17.Enabled:=True;
if RunScript=nil then RunScript:=TScriptThread.create;
end;


procedure TFrmMain.ToolButton17Click(Sender: TObject);
begin
//FrmMain.SynEditor1.SetLineColorToDefault(ErrorLine);
FrmMain.ToolButton16.Enabled:=True;
FrmMain.ToolButton17.Enabled:=False;
Running:=False;
if RunScript<>nil then
begin
RunScript.Terminate;
RunScript:=nil;
end;
end;

procedure TFrmMain.SynEditor1Click(Sender: TObject);
begin
if ErrorLine<>0 then
begin
 SynEditor1.SetLineColorToDefault(ErrorLine);
 ErrorLine:=0;
 end;
end;





procedure TFrmMain.Edit_KeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
NowKey:=Key;
if not (Key  in [65..90,48..57]) then
begin
Edit_Key.Text:=KeyIdToKeyName(Key);  // IntToStr(Key);
Key:=0;
end
else
Edit_Key.Text:=(char(Key));


end;

procedure TFrmMain.Button7Click(Sender: TObject);
var
  TmpColor:TColor;
  i:Integer;
  _pos:string;
begin

for i:=0 to 9 do
begin
    _POS:=Setup.ReadString((format('点%d',[i])),'坐标','0,0')  ;
    TmpColor:=Setup.ReadInteger(format('点%d',[i]),'颜色',0) ;
    case i of
      9:
      begin
      Cash_point.edit10.Text:= _pos;
      Cash_point.image10.Canvas.Brush.Color:=TmpColor;
      Cash_point.image10.Canvas.Rectangle(0,0,Cash_point.image10.Width,Cash_point.image10.Height);
      end;
      0:
      begin
      Cash_point.edit1.Text:= _pos;
      Cash_point.image1.Canvas.Brush.Color:=TmpColor;
      Cash_point.image1.Canvas.Rectangle(0,0,Cash_point.image1.Width,Cash_point.image1.Height);
      end;
      1:
      begin
      Cash_point.edit2.Text:= _pos;
      Cash_point.image2.Canvas.Brush.Color:=TmpColor;
      Cash_point.image2.Canvas.Rectangle(0,0,Cash_point.image2.Width,Cash_point.image2.Height);
      end;
      2:
      begin
      Cash_point.edit3.Text:= _pos;
      Cash_point.image3.Canvas.Brush.Color:=TmpColor;
      Cash_point.image3.Canvas.Rectangle(0,0,Cash_point.image3.Width,Cash_point.image3.Height);
      end;
      3:
      begin
      Cash_point.edit4.Text:= _pos;
      Cash_point.image4.Canvas.Brush.Color:=TmpColor;
      Cash_point.image4.Canvas.Rectangle(0,0,Cash_point.image4.Width,Cash_point.image4.Height);
      end;
      4:
      begin
      Cash_point.edit5.Text:= _pos;
      Cash_point.image5.Canvas.Brush.Color:=TmpColor;
      Cash_point.image5.Canvas.Rectangle(0,0,Cash_point.image5.Width,Cash_point.image5.Height);
      end;
      5:
      begin
      Cash_point.edit6.Text:= _pos;
      Cash_point.image6.Canvas.Brush.Color:=TmpColor;
      Cash_point.image6.Canvas.Rectangle(0,0,Cash_point.image6.Width,Cash_point.image6.Height);
      end;
      6:
      begin
      Cash_point.edit7.Text:= _pos;
      Cash_point.image7.Canvas.Brush.Color:=TmpColor;
      Cash_point.image7.Canvas.Rectangle(0,0,Cash_point.image7.Width,Cash_point.image7.Height);
      end;
      7:
      begin
      Cash_point.edit8.Text:= _pos;
      Cash_point.image8.Canvas.Brush.Color:=TmpColor;
      Cash_point.image8.Canvas.Rectangle(0,0,Cash_point.image8.Width,Cash_point.image8.Height);
      end;
      8:
      begin
      Cash_point.edit9.Text:= _pos;
      Cash_point.image9.Canvas.Brush.Color:=TmpColor;
      Cash_point.image9.Canvas.Rectangle(0,0,Cash_point.image9.Width,Cash_point.image9.Height);
      end;
 end;
 end;


FrmMain.Hide;
Cash_point.Timer_cap.Enabled:=True;
Cash_point.ShowModal;
end;


procedure TFrmMain.Button1Click(Sender: TObject);
begin
SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('%s(%d,%d)      //%s %s键' ,[ComboBox1.Text,NowKey,SpinEdit1.Value,ComboBox1.Text,Edit_Key.Text]));
SynEditor1.CaretY:=SynEditor1.CaretY+1;
SpinEdit1.Value:=1;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('%s(%d)次',[ComboBox2.Text,SpinEdit2.Value]));
SynEditor1.CaretY:=SynEditor1.CaretY+1;
SpinEdit2.Value:=1;
end;

procedure TFrmMain.Button3Click(Sender: TObject);
begin
SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('鼠标移到(%d,%d)',[CaPointList[ComboBox_Mouse.ItemIndex].x,CaPointList[ComboBox_Mouse.ItemIndex].y]));
SynEditor1.CaretY:=SynEditor1.CaretY+1;
end;

procedure TFrmMain.Button4Click(Sender: TObject);
begin
SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('相对移动(%d,%d)',[SpinEdit3.Value,SpinEdit3.Value]));
SynEditor1.CaretY:=SynEditor1.CaretY+1;
end;

procedure TFrmMain.Button5Click(Sender: TObject);
begin
  case ComboBox4.ItemIndex of
   0:SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('等待(%d)毫秒',[SpinEdit5.Value*1000,ComboBox4.Text]));
   1:SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('等待(%d)毫秒',[SpinEdit5.Value,ComboBox4.Text]));
  end;
  SynEditor1.CaretY:=SynEditor1.CaretY+1;
end;
procedure TFrmMain.Button6Click(Sender: TObject);
begin
SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('输入("%s")',[Edit1.Text]));
SynEditor1.CaretY:=SynEditor1.CaretY+1;
end;

procedure TFrmMain.Button8Click(Sender: TObject);
begin
SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('%s=找图(%s,%s,%s,%s,[[%s]],%s)',[Edit13.Text,Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,Edit6.Text,Edit7.Text]));
SynEditor1.CaretY:=SynEditor1.CaretY+1;
end;

procedure TFrmMain.Button10Click(Sender: TObject);
begin
  if OpenDialog1.Execute then Edit6.Text:=OpenDialog1.FileName;
end;

procedure TFrmMain.Button9Click(Sender: TObject);
begin
  case ComboBox6.ItemIndex of
  0: SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('如果 取色(%d,%d)=="%s" 那么',[CaPointList[ComboBox_ifPos.ItemIndex].x,CaPointList[ComboBox_ifPos.ItemIndex].Y,IntToHex(ColorToRGB(Tcolor(ComboBox_ifPos.Items.Objects[ComboBox_ifColo.ItemIndex])),6)]));
  1: SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('如果 取色(%d,%d)<>"%s" 那么',[CaPointList[ComboBox_ifPos.ItemIndex].x,CaPointList[ComboBox_ifPos.ItemIndex].Y,IntToHex(ColorToRGB(Tcolor(ComboBox_ifPos.Items.Objects[ComboBox_ifColo.ItemIndex])),6)]));
  2: SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('如果 取色差(取色(%d,%d),"%s") < %d 那么',[CaPointList[ComboBox_ifPos.ItemIndex].x,CaPointList[ComboBox_ifPos.ItemIndex].Y,IntToHex(ColorToRGB(Tcolor(ComboBox_ifPos.Items.Objects[ComboBox_ifColo.ItemIndex])),6),SpinEdit6.Value]));
  end;
SynEditor1.Lines.Insert(SynEditor1.CaretY,'//在这里添加您的代码');
SynEditor1.CaretY:=SynEditor1.CaretY+1;
SynEditor1.Lines.Insert(SynEditor1.CaretY,'');
SynEditor1.CaretY:=SynEditor1.CaretY+1;
SynEditor1.Lines.Insert(SynEditor1.CaretY,'条件结束');
SynEditor1.CaretY:=SynEditor1.CaretY-1;
end;

procedure TFrmMain.Button11Click(Sender: TObject);
begin
  case ComboBox3.ItemIndex of
  0:SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('%s=%s(%s,%s,%s,%s,"%s",%d)',[Edit14.Text,ComboBox3.Text,Edit8.Text,Edit9.Text,Edit10.Text,Edit11.Text,IntToHex(ColorToRGB(Tcolor(ComboBox_ifPos.Items.Objects[ComboBox_findcolo.ItemIndex])),6),ComboBox5.ItemIndex]));
  1:SynEditor1.Lines.Insert(SynEditor1.CaretY-1,format('%s=%s(%s,%s,%s,%s,"%s",%d,%s)',[Edit14.Text,ComboBox3.Text,Edit8.Text,Edit9.Text,Edit10.Text,Edit11.Text,IntToHex(ColorToRGB(Tcolor(ComboBox_ifPos.Items.Objects[ComboBox_findcolo.ItemIndex])),6),ComboBox5.ItemIndex,Edit12.Text]));
  end;
  SynEditor1.CaretY:=SynEditor1.CaretY+1;
end;


procedure TFrmMain.N58Click(Sender: TObject);
begin
Form_WINTOOL.show;
end;

procedure TFrmMain.TreeView1Click(Sender: TObject);
begin
GetHelp(TreeView1.Selected.Text);

end;

procedure TFrmMain.ComboBox1Select(Sender: TObject);
begin
GetHelp(ComboBox1.Text);
end;

procedure TFrmMain.Edit2Click(Sender: TObject);
begin
GetHelp('找图');
end;

procedure TFrmMain.ComboBox3Click(Sender: TObject);
begin
GetHelp('模糊找色');
end;

procedure TFrmMain.TreeView1DblClick(Sender: TObject);
begin
SynEditor1.Lines.Insert(SynEditor1.CaretY-1,TreeView1.Selected.Text);
SynEditor1.CaretY:=SynEditor1.CaretY+1;
end;

procedure TFrmMain.N56Click(Sender: TObject);
var
  FoldRegion: TFoldRegionItem;
begin
  FoldRegion := syneditor1.Highlighter.FoldRegions.Add(rtChar, False, False, False, '{', '}', nil);
  syneditor1.InitCodeFolding;
  syneditor1.Repaint;
end;

procedure TFrmMain.ComboBox6Change(Sender: TObject);
begin
if ComboBox6.ItemIndex=2 then
begin
  Label31.Visible:=True;
  SpinEdit6.Visible:=True;
  GetHelp('色差值');
  end
  else
  begin
      Label31.Visible:=false;
      SpinEdit6.Visible:=false;
      GetHelp('如果');
    end;

end;

procedure TFrmMain.SpinEdit6Click(Sender: TObject);
begin
  GetHelp('色差值');
end;

procedure TFrmMain.ToolButton5Click(Sender: TObject);
var
tempscr:TStringList;
begin
if  not changeed then exit;
tempscr:=TStringList.Create;
tempscr.Text:=scr_head.Text+SynEditor1.Text;
tempscr.SaveToFile(NowSCRNAME);
ToolButton5.Enabled:=False;
changeed:=False;
tempscr.Free;
end;

procedure TFrmMain.SynEditor1Change(Sender: TObject);
begin
changeed:=True;
ToolButton5.Enabled:=True;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if changeed then
begin
   case Application.MessageBox('您修改了这个脚本,要保存您所做的修改吗?', 
     '提示', MB_YESNOCANCEL + MB_ICONQUESTION + MB_TOPMOST) of
     IDCANCEL:
       begin
         Action:=caNone;
       end;
     IDYES:              //保存脚本
       begin
          Action:=caNone;
          scr_head.Text:=scr_head.Text+SynEditor1.Text;
          scr_head.SaveToFile(NowSCRNAME);
          changeed:=False;
          ToolButton5.Enabled:=False;
          FrmMain.Hide;
          Form_Admin.show;
       end;
     IDNO:
       begin
         Action:=caNone;
         FrmMain.Hide;
         Form_Admin.show;
       end;
   end;
   Exit;
  end;
          //==脚本没有被修改,直接退出===
         Action:=caNone;
         FrmMain.Hide;
         Form_Admin.show;  
end;

procedure TFrmMain.Edit_KeyEnter(Sender: TObject);
begin

CanChangeKey:=True;
end;

procedure TFrmMain.Edit_KeyExit(Sender: TObject);
begin
CanChangeKey:=False;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
AboutBox.show;
end;

procedure TFrmMain.ComboBox2Enter(Sender: TObject);
begin
GetHelp(ComboBox2.Text);
end;

procedure TFrmMain.ComboBox_ifColoMouseEnter(Sender: TObject);
begin
GetHelp('如果');
end;

procedure TFrmMain.SpinEdit5Enter(Sender: TObject);
begin
GetHelp('等待');
end;

procedure TFrmMain.Edit1Enter(Sender: TObject);
begin
GetHelp('输入');
end;

procedure TFrmMain.Edit_KeyClick(Sender: TObject);
begin
GetHelp(ComboBox1.Text);
end;

procedure TFrmMain.SpinEdit3Enter(Sender: TObject);
begin
GetHelp('相对移动');
end;

procedure TFrmMain.ComboBox_ifPosMouseEnter(Sender: TObject);
begin
GetHelp('如果');
end;

procedure TFrmMain.ComboBox_MouseMouseEnter(Sender: TObject);
begin
GetHelp('鼠标移到');
end;

procedure TFrmMain.Edit1Click(Sender: TObject);
begin
Edit1.SelectAll;
end;

end.

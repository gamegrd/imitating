unit Cashpoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinCtrls, SkinBoxCtrls, StdCtrls, ExtCtrls, Spin,MyWindows;

type
  TCash_point = class(TForm)
    Timer_cap: TTimer;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Image2: TImage;
    Edit2: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Image3: TImage;
    Edit3: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Image4: TImage;
    Edit4: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Image5: TImage;
    Edit5: TEdit;
    Label13: TLabel;
    Image6: TImage;
    Edit6: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label_NowX: TLabel;
    Label29: TLabel;
    Label_Now_Color: TLabel;
    Edit1: TEdit;
    Image_view: TImage;
    SpinEdit_OFCX: TSpinEdit;
    SpinEdit_ofcY: TSpinEdit;
    Label30: TLabel;
    Label_NowY: TLabel;
    Image11: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_capTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpinEdit_OFCXChange(Sender: TObject);
    procedure SpinEdit_ofcYChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure WMhotkeyhandle(var msg:Tmessage);
     message wm_hotkey;
  end;

var
  Cash_point: TCash_point;
  //临时变量
    DesktopDC:   HDC;
    TmpColor:   TColor;
    CurPoint:   TPoint;
   
 //====
 hotkeyid:array [0..9] of Integer;
 _OFCX,_OFCY:integer;
implementation

uses Unit1;

{$R *.dfm}


procedure TCash_point.Wmhotkeyhandle
(var msg:Tmessage);
var
  i:Integer;
  j:   integer;
  X,Y:integer;
begin
   i:=0;
   j:=0;
   x:=CurPoint.X+_ofcx;
   Y:=CurPoint.Y+_ofcY;
  //判断是否是ctrl+alt+1
  if ((msg.LParamHi-48) in [0..9]) and
     (msg.lparamLo=MOD_CONTROL or mod_Alt) then
  begin
    i:=msg.LParamHi-48 ;
    msg.Result:=1;//正常返回
   if i>0 then
     begin
     CaPointList[i-1].X:=X;
     CaPointList[i-1].Y:=Y;
     CaPointList[i-1].Color:=TmpColor;
     FrmMain.GraspCrtl(i-1);
     end
    else
      begin
       CaPointList[9].X:=x;
       CaPointList[9].Y:=y;
       CaPointList[9].Color:=TmpColor;
       FrmMain.GraspCrtl(9);
      end;
    case i of
      0:
      begin
      edit10.Text:= Format('X=%d Y=%d',[X,Y]);
      image10.Canvas.Brush.Color:=TmpColor;
      image10.Canvas.Rectangle(0,0,image10.Width,image10.Height);
      end;
      1:
      begin
      edit1.Text:= Format('X=%d Y=%d',[X,Y]);
      image1.Canvas.Brush.Color:=TmpColor;
      image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
      end;
      2:
      begin
      edit2.Text:= Format('X=%d Y=%d',[X,Y]);
      image2.Canvas.Brush.Color:=TmpColor;
      image2.Canvas.Rectangle(0,0,image2.Width,image2.Height);
      end;
      3:
      begin
      edit3.Text:= Format('X=%d Y=%d',[X,Y]);
      image3.Canvas.Brush.Color:=TmpColor;
      image3.Canvas.Rectangle(0,0,image3.Width,image3.Height);
      end;
      4:
      begin
      edit4.Text:= Format('X=%d Y=%d',[X,Y]);
      image4.Canvas.Brush.Color:=TmpColor;
      image4.Canvas.Rectangle(0,0,image4.Width,image4.Height);
      end;
      5:
      begin
      edit5.Text:= Format('X=%d Y=%d',[X,Y]);
      image5.Canvas.Brush.Color:=TmpColor;
      image5.Canvas.Rectangle(0,0,image5.Width,image5.Height);
      end;
      6:
      begin
      edit6.Text:= Format('X=%d Y=%d',[X,Y]);
      image6.Canvas.Brush.Color:=TmpColor;
      image6.Canvas.Rectangle(0,0,image6.Width,image6.Height);
      end;
      7:
      begin
      edit7.Text:= Format('X=%d Y=%d',[X,Y]);
      image7.Canvas.Brush.Color:=TmpColor;
      image7.Canvas.Rectangle(0,0,image7.Width,image7.Height);
      end;
      8:
      begin
      edit8.Text:= Format('X=%d Y=%d',[X,Y]);
      image8.Canvas.Brush.Color:=TmpColor;
      image8.Canvas.Rectangle(0,0,image8.Width,image8.Height);
      end;

      9:
      begin
      edit9.Text:= Format('X=%d Y=%d',[X,Y]);
      image9.Canvas.Brush.Color:=TmpColor;
      image9.Canvas.Rectangle(0,0,image9.Width,image9.Height);
      end;
     end;



  //  Image1.Canvas.Brush.Color:= TmpColor;
  end;
end;



procedure TCash_point.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmMain.show;
Cash_point.Timer_cap.Enabled:=False;
end;

procedure TCash_point.Timer_capTimer(Sender: TObject);
begin
    DesktopDC   :=GetWindowDC(GetDesktopWindow);
    GetCursorPos(CurPoint);
    Label_NowX.Caption:=IntToStr(CurPoint.X+_ofcx);
    Label_Nowy.Caption:=IntToStr(CurPoint.Y+_ofcY);
    TmpColor   :=  GetPixel(DesktopDC,   CurPoint.X+_ofcx,   CurPoint.Y+_ofcY);
    Label_Now_Color.Caption   :=IntToHex(ColorToRGB(TmpColor),6);
    StretchBlt(Image_view.Canvas.Handle,0,0,100,100,DesktopDC, CurPoint.X+_ofcx-5,CurPoint.Y+_ofcY-5,10,10,SRCCOPY);

    Image_view.Canvas.MoveTo(50,0);
    Image_view.Canvas.LineTo(50,100);
    Image_view.Canvas.MoveTo(0,50);
    Image_view.Canvas.LineTo(100,50);
    Image_view.Refresh;
end;

procedure TCash_point.FormCreate(Sender: TObject);
var
  i:Byte;
begin
  for i:=0 to 9 do
  begin
  //通过原子表获得一个关于hotkey的唯一标识，注意本文前边提到的范围
  hotkeyid[i]:=GlobalAddAtom(pchar('UserDefineHotKey'))-$C000-i;
  //注册ctrl+alt+1
  registerhotkey(handle,hotkeyid[i],MOD_CONTROL or mod_Alt,48+i);
Image11.Left:=43;
Image11.Top:=124;
 end;

end;

procedure TCash_point.FormDestroy(Sender: TObject);
var
  i:Byte;
begin
  for i:=0 to 9 do
  begin
   unregisterhotkey(handle,hotkeyid[i]);//
   DeleteAtom(HotKeyID[i]);
end;
end;
procedure TCash_point.SpinEdit_OFCXChange(Sender: TObject);
begin
_ofcX:=SpinEdit_OFCX.Value;
end;

procedure TCash_point.SpinEdit_ofcYChange(Sender: TObject);
begin
_ofcY:=SpinEdit_OFCY.Value;
end;

end.

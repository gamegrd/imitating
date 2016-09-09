unit SetLoop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin,CoolTrayIcon;

type
  TForm_SetLoop = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Showme(const needshow:Boolean=False);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_SetLoop: TForm_SetLoop;

implementation
  uses
     Cladmin;
{$R *.dfm}
procedure TForm_SetLoop.Showme(const needshow:Boolean=False);
var
  H,s,m,temp:DWORD;
begin
    case (ScrLoop.Looptype) of
          cRunCount:
              begin
                RadioButton1.Checked:=True;
                SpinEdit1.value:= ScrLoop.Value;
                Form_Admin.Edit_loop.Text:=Format('循环%d次',[ScrLoop.Value]);
               end;
           cRunUntilStop:
                begin
                  RadioButton2.Checked:=True;
                  SpinEdit1.value:= ScrLoop.Value;
                  Form_Admin.Edit_loop.Text:='循环到按终止键';
               end;
          cRunTime:
              begin
                  Form_Admin.Edit_loop.Text:=Format('循环%d秒',[ScrLoop.value]);
                  RadioButton3.Checked:=True;
                  h:=ScrLoop.value div 3600;
                  m:=(ScrLoop.value-(h*3600)) div 60;
                  s:=(ScrLoop.value-(h*3600+m*60));
                  SpinEdit2.Value:=h;
                  SpinEdit3.Value:=m;
                  SpinEdit4.Value:=s;
               end;
      end;
   if needshow then   Form_SetLoop.Show;
end;


procedure TForm_SetLoop.Button1Click(Sender: TObject);
var
  TT:DWORD;
begin
 if RadioButton1.Checked then
 begin
   ScrLoop.Looptype:=cRunCount;
   ScrLoop.value:= SpinEdit1.Value;
 end;

if RadioButton2.Checked then
 begin
   ScrLoop.Looptype:=cRunUntilStop;
   ScrLoop.value:=1;
 end;

if RadioButton3.Checked then
 begin
   TT:=SpinEdit2.Value*3600+SpinEdit3.Value*60+SpinEdit4.Value;
   ScrLoop.Looptype:=cRunTime;
   ScrLoop.value:=TT;
 end;
Form_SetLoop.Showme;
Form_SetLoop.Hide;
Form_Admin.CoolTrayIcon1.ShowBalloonHint('提示',PChar('您修改了属性,记得按一下保存哦'), bitInfo, 10);
end;

procedure TForm_SetLoop.Button2Click(Sender: TObject);
begin
Form_SetLoop.Hide;
end;

end.

unit admin_setup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IniFiles;

type
  TForm_adminSetup = class(TForm)
    GroupBox1: TGroupBox;
    chk_NotAdmin: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    CheckBox_Mouse: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ReadSetup;
    procedure WriteSetup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure chk_NotAdminClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_adminSetup: TForm_adminSetup;
implementation
 uses
 Cladmin;
{$R *.dfm}
procedure TForm_adminSetup.ReadSetup;
begin
    chk_NotAdmin.Checked:=Setup.ReadBool('系统设置','非管理员模式',False);
    CheckBox_Mouse.Checked:=Setup.ReadBool('系统设置','录制鼠标路径',False);
  end;

procedure TForm_adminSetup.WriteSetup;
begin
    Setup.WriteBool('系统设置','非管理员模式',chk_NotAdmin.Checked);
    Setup.WriteBool('系统设置','录制鼠标路径',CheckBox_Mouse.Checked);
  end;

procedure TForm_adminSetup.FormCreate(Sender: TObject);
begin
  ReadSetup;  //读设置
end;

procedure TForm_adminSetup.Button1Click(Sender: TObject);
begin
  WriteSetup;
  Form_adminSetup.Close;
end;

procedure TForm_adminSetup.Button2Click(Sender: TObject);
begin
Form_adminSetup.Close;
end;

procedure TForm_adminSetup.chk_NotAdminClick(Sender: TObject);
begin
if chk_NotAdmin.Checked then
begin
    if Application.MessageBox('使用非管理员启动,您将不能使用硬件模拟功能,' + 
      #13#10 + '只有在您在不能正常启动执行器的情况下,才需要' + #13#10 +
      '使用非管理员模式启动,您确定要这么做吗?', '提示', MB_YESNO +
      MB_ICONQUESTION + MB_TOPMOST) = IDNO then
    begin
      chk_NotAdmin.Checked:=False;
    end;


  end;
end;

end.

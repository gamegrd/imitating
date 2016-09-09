unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SkinCtrls,ShellAPI;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.Label1Click(Sender: TObject);
begin
 ShellExecute(0, 'open',PChar(Label1.Caption),nil,'', SW_SHOWNORMAL);
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
 AboutBox.Hide;
end;

end.
 

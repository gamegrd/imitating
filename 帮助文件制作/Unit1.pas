unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit2: TEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  help:TIniFile;
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


procedure TForm1.FormCreate(Sender: TObject);
begin
help:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\help.ini');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
help.WriteString(Edit2.Text,ComboBox1.Text,LinesToStr(Memo1.Text));
Memo1.Text:='';

end;

end.

unit WindowTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_WINTOOL = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    ListBox1: TListBox;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 function EnumWndProc(AWnd:HWND;AlParam:LPARAM):Boolean;stdcall;

var
  Form_WINTOOL: TForm_WINTOOL;

implementation

{$R *.dfm}
function EnumWndProc(AWnd: HWND; AlParam: LPARAM):Boolean;stdcall;
var
  WndCaption: array[0..254] of Char;
  PID:DWORD;
begin
 if   IsWindowVisible(AWnd)   then
      begin
         GetWindowThreadProcessId(AWnd,@PID);
         GetWindowText(AWnd, @WndCaption, 254);
         if WndCaption[0]<>chr(0) then
         Form_WINTOOL.ListBox1.Items.AddObject(Format('%s',[WndCaption]),TObject(AWnd));
      end;


  Result := True;
end;


procedure TForm_WINTOOL.Button1Click(Sender: TObject);
begin
 ListBox1.Clear ;
 EnumWindows(@EnumWndProc,0);
end;

procedure TForm_WINTOOL.Button2Click(Sender: TObject);
var
AWnd: HWND;
begin
AWnd:=LongWord(ListBox1.Items.Objects[ListBox1.ItemIndex]);
SetWindowPos(AWnd,0,0,0,0,0,1);
end;

procedure TForm_WINTOOL.ListBox1Click(Sender: TObject);
begin
if ListBox1.ItemIndex=-1 then Exit;
Edit1.Text:=ListBox1.Items[ListBox1.ItemIndex];
end;

end.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  PMYPACK=^MYPACK;
    MYPACK = record
       Key:Integer;
       CMD:ShortString;
       s:ShortString;
    end;   

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Panel2: TPanel;
    memo1: TMemo;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Memo_cmd: TMemo;
    Memo_sm: TMemo;
    Memo_dy: TMemo;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ShowData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Identifiers: array[0..65535] of ByteBool;
  mHashTable: array[0..65535] of Integer;
  MYLIST:TList;
implementation

{$R *.dfm}

procedure MakeIdentTable;
var
  I, J: Char;
  A:DWord;
begin
  for I := #0 to #255 do
  begin
    Case I of
      '_', '0'..'9', 'a'..'z', 'A'..'Z': Identifiers[ord(I)] := True;
    else Identifiers[ord(I)] := False;
    end;
    J := UpCase(I);
    Case I of
      'a'..'z', 'A'..'Z', '_': mHashTable[ord(I)] := Ord(J) - 64;
    else mHashTable[ord(I)] := 0;
    end;
  end;

for A:=256 to 65535 do
  begin
     Identifiers[A] := True;
     mHashTable[A] := A;
  end;


end;


function KeyHash(ToHash: PChar): Integer;
begin
  Result := 0;
  while (ToHash^ in ['a'..'z', 'A'..'Z']) or (Ord(ToHash^)>127) do
  begin
    if ToHash^ in ['a'..'z', 'A'..'Z'] then
    inc(Result, mHashTable[ord(ToHash^)])
    else
    inc(Result, ord(ToHash^));
    inc(ToHash);
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
MakeIdentTable;
MYLIST:=TList.Create;
try
Memo_cmd.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'Setup.ini');
except

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  key:Integer;
begin
  Memo1.Clear;
  if Edit1.Text='' then Exit;
  key:=KeyHash(PChar(Edit1.Text));
  Memo1.Lines.Add(Format('function Func%d: TtkTokenKind;',[key])) ;
  Memo1.Lines.Add('') ;
  Memo1.Lines.Add(Format('fIdentFuncTable[%d] := Func%d;',[key,key])) ;
  Memo1.Lines.Add('') ;
  Memo1.Lines.Add(Format('function TSynPasSyn.Func%d: TtkTokenKind;',[key])) ;
  Memo1.Lines.Add('begin') ;
  Memo1.Lines.Add(Format('if KeyComp(''%s'') then Result := tkKey else Result := tkIdentifier;',[Edit1.Text])) ;
  Memo1.Lines.Add('end;') ;

end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
Edit1.SelectAll;
end;



procedure  mYSort  ;            //≈≈–Ú
var
I,J:Integer;
    T:Pointer;  
begin
for  I:=MYLIST.Count-2 downto  0  do
 for  J:=0 to  MYLIST.Count-2  do
if  MYPACK(MYLIST.Items[J]^).Key>MYPACK(MYLIST.Items[J+1]^).KEY then
begin
T:=MYLIST.Items[J];
MYLIST.Items[J]:=MYLIST.Items[J+1];
MYLIST.Items[J+1]:=T;
end;
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  s:TStringList;
  KEY,i:Integer;
  AMYPACK:PMYPACK;
begin
 s:=TStringList.Create;
if MYLIST.Count>0  then for i:=0 to MYLIST.Count-1 do Dispose(MYLIST.Items[i]);
MYLIST.Clear;
Memo_sm.Clear;
Memo_dy.Clear;
Memo1.Clear;


for i:=0 to Memo_cmd.Lines.Count-1 do
  begin
     s.CommaText:= (Memo_cmd.Lines[i]);
     KEY:=KeyHash(PChar(s.Strings[0]));
     New(AMYPACK);
     AMYPACK.Key:=KEY;
     AMYPACK.s:= s.Strings[0];
     AMYPACK.CMD:= s.Strings[1];
     MYLIST.Add(AMYPACK);
   end;

mYSort;   
ShowData;

Memo_cmd.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Setup.ini');
end;



procedure TForm1.ShowData;
var
  KEY,i:Integer;
begin
  for i:=0 to MYLIST.Count-1 do
  begin
    KEY:=MYPACK(MYLIST.Items[i]^).Key;

       Memo_sm.Lines.Add(Format('function Func%d: TtkTokenKind;',[key])) ;

        Memo_dy.Lines.Add(Format('fIdentFuncTable[%d] := Func%d;',[key,key])) ;

        Memo1.Lines.Add(Format('function TSynPasSyn.Func%d: TtkTokenKind;',[key])) ;
        Memo1.Lines.Add('begin') ;
        Memo1.Lines.Add(Format('if KeyComp(''%s'') then',[MYPACK(MYLIST.Items[i]^).s]));
        Memo1.Lines.Add('begin');
        Memo1.Lines.Add('Result := tkKey;');
        Memo1.Lines.Add(Format('KeyChange(''%s'');',[MYPACK(MYLIST.Items[i]^).CMD]));
        Memo1.Lines.Add('end') ;
        Memo1.Lines.Add('else Result := tkIdentifier');
        Memo1.Lines.Add('end;') ;
        Memo1.Lines.Add('') ;
        Memo1.Lines.Add('') ;
  end;
    end;
end.

{
if KeyComp('œµÕ≥œ‘ æ') then
begin
Result := tkKey;
KeyChange_parameter1('print',True);
end
 else Result := tkIdentifier;     }

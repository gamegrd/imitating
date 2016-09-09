{
先建立哈希表   MakeIdentTable
  调用了Creat 方法
Creat -> 初始化函数表   InitIdent
建立方法表,对不同的字符使用不同的 方法处理  MakeMethodTables
设置当前的类型定义为 未知  ResetRange

  SetLine -> Next -> 处理各种类型的函数 [IdentProc ...]  ->通过方法处理表找到对应的 [IdentKind ]
->KeyHash ->KeyComp-GetEOL  ->Next  

AddHighlightToken(sToken, nTokenPos, nTokenLen, attr.Foregroun
                   关键字  开始位置   长度
}

unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEdit,pretreatment;

type
  TForm1 = class(TForm)
    SynEdit1: TSynEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  SynHighlighterSample;

procedure TForm1.FormCreate(Sender: TObject);
var
  HL: TSynSampleSyn;
begin
  HL := TSynSampleSyn.Create(Self);
  SynEdit1.Highlighter := HL;
  
  SynEdit1.ClearAll;
  SynEdit1.Text := HL.SampleSource;
end;

end.

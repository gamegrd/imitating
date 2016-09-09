

{$IFNDEF QSYNHIGHLIGHTERPAS}
unit SynHighlighterIORI;
{$ENDIF}

{$I SynEdit.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditTypes,
  QSynEditHighlighter,
{$ELSE}
  Windows,
  Dialogs,
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
{$ENDIF}
  SysUtils,
  Classes;

function KeyNameToKeyId( s : string ): BYTE;
function KeyIdToKeyName(id: integer ): string;

Type
  PChangeFun=^TChangeFun;
  TChangeFun = record
       S:string[255];
       D:string[255];
  end;

type
  TtkTokenKind = (tkAsm, tkComment, tkIdentifier, tkKey, tkNull, tkNumber,
    tkSpace, tkString, tkSymbol, tkUnknown, tkFloat, tkHex, tkDirec, tkChar,tkvar,tKattribute);

  TRangeState = (rsANil, rsAnsi, rsAnsiAsm, rsAsm, rsBor, rsBorAsm, rsProperty,
    rsExports, rsDirective, rsDirectiveAsm, rsUnKnown);

  TProcTableProc = procedure of object;

  PIdentFuncTableFunc = ^TIdentFuncTableFunc;
  TIdentFuncTableFunc = function: TtkTokenKind of object;

const
 
  MaxKey = $BB8;


type
  TSynPasSyn = class(TSynCustomHighlighter)
 public
    //==========
    ChangeKegFlag:Boolean;
    _offset:Integer;
    MYCommand:string;
    CMDLIST:TStringList;
    //==========
  private
    fAsmStart: Boolean;
    fRange: TRangeState;
    fLine: PChar;              //当前行的字
    fLineNumber: Integer;      //当前行数
    fProcTable: array[0..65535] of TProcTableProc;
    Run: LongInt;              //当前处理的位置
    fStringLen: Integer;       //要处理的长度
    Funlist:TList;
    MYvarList:TList;
    fToIdent: PChar;
    fIdentFuncTable: array[0..MaxKey] of TIdentFuncTableFunc;
    fTokenPos: Integer;
    FTokenID: TtkTokenKind;
    fStringAttri: TSynHighlighterAttributes;
    fCharAttri: TSynHighlighterAttributes;
    fNumberAttri: TSynHighlighterAttributes;
    fFloatAttri: TSynHighlighterAttributes;
    fHexAttri: TSynHighlighterAttributes;
    fKeyAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;
    fAsmAttri: TSynHighlighterAttributes;
    fCommentAttri: TSynHighlighterAttributes;
    fDirecAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fSpaceAttri: TSynHighlighterAttributes;
    fvarAttri: TSynHighlighterAttributes;
    fKattribute:TSynHighlighterAttributes;
    fPackageSource: Boolean;
    procedure KeyChange(aKey: string);
    procedure KeyChange_parameter1(aKey: string;const Del:ByteBool=False);  //只有一个参数
    procedure MYFunProc;                               //处理函数列表
    function KeyHash(ToHash: PChar): Integer;
    function KeyComp(const aKey: string): Boolean;
    function Func15: TtkTokenKind;
    function Func19: TtkTokenKind;
    function Func20: TtkTokenKind;
    function Func21: TtkTokenKind;
    function Func23: TtkTokenKind;
    function Func25: TtkTokenKind;
    function Func27: TtkTokenKind;
    function Func28: TtkTokenKind;
    function Func29: TtkTokenKind;
    function Func32: TtkTokenKind;
    function Func33: TtkTokenKind;
    function Func35: TtkTokenKind;
    function Func37: TtkTokenKind;
    function Func38: TtkTokenKind;
    function Func39: TtkTokenKind;
    function Func40: TtkTokenKind;
    function Func41: TtkTokenKind;
    function Func42: TtkTokenKind;
    function Func44: TtkTokenKind;
    function Func45: TtkTokenKind;
    function Func46: TtkTokenKind;
    function Func47: TtkTokenKind;
    function Func49: TtkTokenKind;
    function Func52: TtkTokenKind;
    function Func54: TtkTokenKind;
    function Func55: TtkTokenKind;
    function Func56: TtkTokenKind;
    function Func57: TtkTokenKind;
    function Func59: TtkTokenKind;
    function Func60: TtkTokenKind;
    function Func61: TtkTokenKind;
    function Func63: TtkTokenKind;
    function Func64: TtkTokenKind;
    function Func65: TtkTokenKind;
    function Func66: TtkTokenKind;
    function Func69: TtkTokenKind;
    function Func71: TtkTokenKind;
    function Func73: TtkTokenKind;
    function Func75: TtkTokenKind;
    function Func76: TtkTokenKind;
    function Func79: TtkTokenKind;
    function Func81: TtkTokenKind;
    function Func84: TtkTokenKind;
    function Func85: TtkTokenKind;
    function Func87: TtkTokenKind;
    function Func88: TtkTokenKind;
    function Func91: TtkTokenKind;
    function Func92: TtkTokenKind;
    function Func94: TtkTokenKind;
    function Func95: TtkTokenKind;
    function Func96: TtkTokenKind;
    function Func97: TtkTokenKind;
    function Func98: TtkTokenKind;
    function Func99: TtkTokenKind;
    function Func100: TtkTokenKind;
    function Func101: TtkTokenKind;
    function Func102: TtkTokenKind;
    function Func103: TtkTokenKind;
    function Func105: TtkTokenKind;
    function Func106: TtkTokenKind;
    function Func108: TtkTokenKind;
    function Func111: TtkTokenKind;
    function Func112: TtkTokenKind;
    function Func117: TtkTokenKind;
    function Func126: TtkTokenKind;
    function Func129: TtkTokenKind;
    function Func132: TtkTokenKind;
    function Func133: TtkTokenKind;
    function Func136: TtkTokenKind;
    function Func139: TtkTokenKind;
    function Func141: TtkTokenKind;
    function Func143: TtkTokenKind;
    function Func166: TtkTokenKind;
    function Func168: TtkTokenKind;
    function Func191: TtkTokenKind;
    //==============中文==============

function Func386: TtkTokenKind;
function Func430: TtkTokenKind;
function Func809: TtkTokenKind;

function Func733: TtkTokenKind;
function Func741: TtkTokenKind;
function Func757: TtkTokenKind;
function Func767: TtkTokenKind;
function Func770: TtkTokenKind;
function Func795: TtkTokenKind;
function Func796: TtkTokenKind;
function Func814: TtkTokenKind;
function Func816: TtkTokenKind;
function Func834: TtkTokenKind;
function Func865: TtkTokenKind;
function Func867: TtkTokenKind;
function Func878: TtkTokenKind;
function Func1149: TtkTokenKind;
function Func1199: TtkTokenKind;
function Func1207: TtkTokenKind;
function Func1520: TtkTokenKind;
function Func1538: TtkTokenKind;
function Func1590: TtkTokenKind;
function Func1593: TtkTokenKind;
function Func1599: TtkTokenKind;
function Func1602: TtkTokenKind;
function Func1618: TtkTokenKind;
function Func1627: TtkTokenKind;
function Func1632: TtkTokenKind;
function Func1634: TtkTokenKind;
function Func1638: TtkTokenKind;
function Func1639: TtkTokenKind;
function Func1641: TtkTokenKind;
function Func1642: TtkTokenKind;
function Func1654: TtkTokenKind;
function Func1655: TtkTokenKind;
function Func1678: TtkTokenKind;
function Func1706: TtkTokenKind;
function Func1755: TtkTokenKind;
function Func2481: TtkTokenKind;




    //===============================
    function AltFunc: TtkTokenKind;
    procedure InitIdent;
    function IdentKind(MayBe: PChar): TtkTokenKind;
    procedure MakeMethodTables;
    procedure AddressOpProc;
    procedure AsciiCharProc;
    procedure AnsiProc;
    procedure BorProc;
    procedure BraceOpenProc;
    procedure ColonOrGreaterProc;
    procedure CRProc;
    procedure IdentProc;
    procedure IntegerProc;
    procedure LFProc;
    procedure LowerProc;
    procedure NullProc;
    procedure NumberProc;
    procedure PointProc;
    procedure RoundOpenProc;
    procedure SemicolonProc;
    procedure SlashProc;
    procedure SpaceProc;
    procedure StringProc;
    procedure varProc;
    procedure AttributeProc;
    procedure SymbolProc;
    procedure UnknownProc;
  protected
    function GetIdentChars: TSynIdentChars; override;
    function GetSampleSource: string; override;
    function IsFilterStored: boolean; override;
  public
    class function GetCapabilities: TSynHighlighterCapabilities; override;
    class function GetLanguageName: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
      override;
    function GetEol: Boolean; override;
    function GetRange: Pointer; override;
    function GetToken: string; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenKind: integer; override;
    function GetTokenPos: Integer; override;
    procedure Next; override;
    procedure ResetRange; override;
    procedure SetLine(NewValue: string; LineNumber:Integer); override;
    procedure SetRange(Value: Pointer); override;
    procedure EnumUserSettings(DelphiVersions: TStrings); override;
    property IdentChars;
  published
    property AsmAttri: TSynHighlighterAttributes read fAsmAttri write fAsmAttri;
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri
      write fCommentAttri;
    property DirectiveAttri: TSynHighlighterAttributes read fDirecAttri
      write fDirecAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri
      write fIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read fKeyAttri write fKeyAttri;
    property NumberAttri: TSynHighlighterAttributes read fNumberAttri
      write fNumberAttri;
    property FloatAttri: TSynHighlighterAttributes read fFloatAttri
      write fFloatAttri;
    property HexAttri: TSynHighlighterAttributes read fHexAttri
      write fHexAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri
      write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri
      write fStringAttri;
    property varAttri: TSynHighlighterAttributes read fvarAttri
      write fvarAttri;
   property vKattribute: TSynHighlighterAttributes read fKattribute
      write fKattribute;
    property CharAttri: TSynHighlighterAttributes read fCharAttri
      write fCharAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri
      write fSymbolAttri;

  end;

var

Identifiers: array[0..65535] of ByteBool;
  mHashTable: array[0..65535] of Integer;

implementation

uses
{$IFDEF SYN_CLX}
  QSynEditStrConst;
{$ELSE}
  SynEditStrConst;
{$ENDIF}


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

for A:=127 to 65535 do
  begin
     Identifiers[A] := True;
     mHashTable[A] := A;
  end;


end;


procedure TSynPasSyn.InitIdent;
var
  I: Integer;
  pF: PIdentFuncTableFunc;
begin
  pF := PIdentFuncTableFunc(@fIdentFuncTable);
  for I := Low(fIdentFuncTable) to High(fIdentFuncTable) do begin
    pF^ := AltFunc;
    Inc(pF);
  end;
  fIdentFuncTable[15] := Func15;
  fIdentFuncTable[19] := Func19;
  fIdentFuncTable[20] := Func20;
  fIdentFuncTable[21] := Func21;
  fIdentFuncTable[23] := Func23;
  fIdentFuncTable[25] := Func25;
  fIdentFuncTable[27] := Func27;
  fIdentFuncTable[28] := Func28;
  fIdentFuncTable[29] := Func29;
  fIdentFuncTable[32] := Func32;
  fIdentFuncTable[33] := Func33;
  fIdentFuncTable[35] := Func35;
  fIdentFuncTable[37] := Func37;
  fIdentFuncTable[38] := Func38;
  fIdentFuncTable[39] := Func39;
  fIdentFuncTable[40] := Func40;
  fIdentFuncTable[41] := Func41;
  fIdentFuncTable[42] := Func42;
  fIdentFuncTable[44] := Func44;
  fIdentFuncTable[45] := Func45;
  fIdentFuncTable[46] := Func46;
  fIdentFuncTable[47] := Func47;
  fIdentFuncTable[49] := Func49;
  fIdentFuncTable[52] := Func52;
  fIdentFuncTable[54] := Func54;
  fIdentFuncTable[55] := Func55;
  fIdentFuncTable[56] := Func56;
  fIdentFuncTable[57] := Func57;
  fIdentFuncTable[59] := Func59;
  fIdentFuncTable[60] := Func60;
  fIdentFuncTable[61] := Func61;
  fIdentFuncTable[63] := Func63;
  fIdentFuncTable[64] := Func64;
  fIdentFuncTable[65] := Func65;
  fIdentFuncTable[66] := Func66;
  fIdentFuncTable[69] := Func69;
  fIdentFuncTable[71] := Func71;
  fIdentFuncTable[73] := Func73;
  fIdentFuncTable[75] := Func75;
  fIdentFuncTable[76] := Func76;
  fIdentFuncTable[79] := Func79;
  fIdentFuncTable[81] := Func81;
  fIdentFuncTable[84] := Func84;
  fIdentFuncTable[85] := Func85;
  fIdentFuncTable[87] := Func87;
  fIdentFuncTable[88] := Func88;
  fIdentFuncTable[91] := Func91;
  fIdentFuncTable[92] := Func92;
  fIdentFuncTable[94] := Func94;
  fIdentFuncTable[95] := Func95;
  fIdentFuncTable[96] := Func96;
  fIdentFuncTable[97] := Func97;
  fIdentFuncTable[98] := Func98;
  fIdentFuncTable[99] := Func99;
  fIdentFuncTable[100] := Func100;
  fIdentFuncTable[101] := Func101;
  fIdentFuncTable[102] := Func102;
  fIdentFuncTable[103] := Func103;
  fIdentFuncTable[105] := Func105;
  fIdentFuncTable[106] := Func106;
  fIdentFuncTable[108] := Func108;
  fIdentFuncTable[111] := Func111;
  fIdentFuncTable[112] := Func112;
  fIdentFuncTable[117] := Func117;
  fIdentFuncTable[126] := Func126;
  fIdentFuncTable[129] := Func129;
  fIdentFuncTable[132] := Func132;
  fIdentFuncTable[133] := Func133;
  fIdentFuncTable[136] := Func136;
  fIdentFuncTable[139] := Func139;
  fIdentFuncTable[141] := Func141;
  fIdentFuncTable[143] := Func143;
  fIdentFuncTable[166] := Func166;
  fIdentFuncTable[168] := Func168;
  fIdentFuncTable[191] := Func191;
//==========中文=====================
fIdentFuncTable[386] := Func386;
fIdentFuncTable[430] := Func430;
fIdentFuncTable[809] := Func809;


fIdentFuncTable[733] := Func733;
fIdentFuncTable[741] := Func741;
fIdentFuncTable[757] := Func757;
fIdentFuncTable[767] := Func767;
fIdentFuncTable[770] := Func770;
fIdentFuncTable[795] := Func795;
fIdentFuncTable[796] := Func796;
fIdentFuncTable[814] := Func814;
fIdentFuncTable[816] := Func816;
fIdentFuncTable[834] := Func834;
fIdentFuncTable[865] := Func865;
fIdentFuncTable[867] := Func867;
fIdentFuncTable[878] := Func878;
fIdentFuncTable[1149] := Func1149;
fIdentFuncTable[1199] := Func1199;
fIdentFuncTable[1207] := Func1207;
fIdentFuncTable[1520] := Func1520;
fIdentFuncTable[1538] := Func1538;
fIdentFuncTable[1590] := Func1590;
fIdentFuncTable[1593] := Func1593;
fIdentFuncTable[1599] := Func1599;
fIdentFuncTable[1602] := Func1602;
fIdentFuncTable[1618] := Func1618;
fIdentFuncTable[1627] := Func1627;
fIdentFuncTable[1632] := Func1632;
fIdentFuncTable[1634] := Func1634;
fIdentFuncTable[1638] := Func1638;
fIdentFuncTable[1639] := Func1639;
fIdentFuncTable[1641] := Func1641;
fIdentFuncTable[1642] := Func1642;
fIdentFuncTable[1654] := Func1654;
fIdentFuncTable[1655] := Func1655;
fIdentFuncTable[1678] := Func1678;
fIdentFuncTable[1706] := Func1706;
fIdentFuncTable[1755] := Func1755;
fIdentFuncTable[2481] := Func2481;


end;


function TSynPasSyn.KeyHash(ToHash: PChar): Integer;
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

 fStringLen := ToHash - fToIdent;
end;

{procedure TSynPasSyn.KeyChange(aKey: string);
begin
  if not ChangeKegFlag then Exit;
   Delete(MYCommand,Run+_offset+1,fStringLen);
   Insert(aKey,MYCommand,Run+_offset+1);
   _offset:=_offset+ (Length(aKey) - fStringLen);

  
  while not (fLine[Run] in [#0,#10,#13,#41]) do
  begin
    Delete(MYCommand,Run+_offset+1,1);
    _offset:=_offset-1;
    inc(Run);
  end;


  end;  }

procedure TSynPasSyn.KeyChange(aKey: string);
begin
  if not ChangeKegFlag then Exit;

   Delete(MYCommand,Run+_offset+1,fStringLen);
   Insert(aKey,MYCommand,Run+_offset+1);
   _offset:=_offset + (Length(aKey) - fStringLen);
   Inc(Run,fStringLen) ;
   fStringLen:=0;

  end;



procedure TSynPasSyn.KeyChange_parameter1(aKey: string;const Del:ByteBool=False);  //只有一个参数
var
  _left,_right:string;
begin
  if not ChangeKegFlag then Exit;
   _left:='("';
   _right:='")';


   Delete(MYCommand,Run+_offset+1,fStringLen);
   Insert(aKey,MYCommand,Run+_offset+1);
   _offset:=_offset + (Length(aKey) - fStringLen);

 Inc(Run);
  while not (fLine[Run] in [#0,#10, #13,#91]) do begin
    Inc(Run);
  end;

    Delete(MYCommand,Run+_offset+1,1);
    Insert(_left,MYCommand,Run+_offset+1);
    _offset:=_offset+(Length(_left) -1);  //  [ 是一字节

  while not (fLine[Run] in [#93]) do begin
    Inc(Run);
  end;
    Delete(MYCommand,Run+_offset+1,1);
    Insert(_right,MYCommand,Run+_offset+1);
    _offset:=_offset + (Length(_right) -1);  //  [ 是一字节
 fStringLen:=0;
 Inc(Run);


  while not (fLine[Run] in [#0,#10,#13,#32]) do
  begin
    Delete(MYCommand,Run+_offset+1,1);
    _offset:=_offset-1;
    inc(Run);
  end;

  if Del then
    begin
      while not (MYCommand[Run + _offset+1] in [#0, #10, #13] ) do
          begin
            Delete(MYCommand,Run+_offset+1,1);
          end;
      end;
      fRange:=rsUnKnown;
  end;




procedure TSynPasSyn.MYFunProc;                               //处理函数列表
var
  i,len:Integer;
  ChangeFun:PChangeFun;
  Changeed:Boolean;
  cmd,tmp:string[255];
begin
  i:=0;
  len:=0;
  Changeed:=False;
{   Delete(MYCommand,Run+_offset+1,fStringLen);
   Insert(aKey,MYCommand,Run+_offset+1);
   _offset:=_offset+ (Length(aKey) - fStringLen);}


New(ChangeFun);
////////////////////////////
   while not  (fLine[Run+len] in [#0, #10, #13,'>']) do
    begin
      Inc(len);
    end;

ChangeFun.S:=Trim(Copy(fLine,Run+1,len+2));   //取出函数名

//==在函数表里面寻找函数名
if Funlist.Count>0 then
    for i:=0 to Funlist.Count-1 do
    begin
       if PChangeFun(Funlist.Items[i]).S=(ChangeFun.S) then
          begin
             Changeed:=True;
             ChangeFun.D:=PChangeFun(Funlist.Items[i]).D;
            end;
      end;




if not Changeed then    //如果没有换过,就自动建立新函数名
begin
   ChangeFun.D:=Format('Fun_%d()',[Funlist.Count]);
   Funlist.Add(ChangeFun);
  end;
tmp:=Trim(fLine);
if Pos('<',tmp) =1  then  cmd:='function '+ ChangeFun.D else  cmd:= ChangeFun.D ;
//==开始换字符串操作

   Delete(MYCommand,Run+_offset+1,Length(ChangeFun.S));
   Insert(cmd,MYCommand,Run+_offset+1);
   _offset:=_offset+ (Length(cmd) -Length(ChangeFun.S));
//
Run:=Run+length(ChangeFun.S);  //处理OK


/////////////////////////

if Changeed then  Dispose(ChangeFun);


 end;



procedure TSynPasSyn.varProc;
var
  i,len:Integer;
  ChangeFun:PChangeFun;
  Changeed:Boolean;
  cmd:string[255];
begin
if not ChangeKegFlag then
begin
  fTokenID := tkvar;
  Inc(Run);
      while not (fLine[Run] in [#0, #10, #13,#16..#47 ,#56..#64,#88..#96,#123..#125]) do begin
        Inc(Run);
      end;
      Exit;
end;

  fTokenID := tkvar;
  i:=0;
  len:=0;
  Changeed:=False;
  New(ChangeFun);
////////////////////////////

   while  not (fLine[Run+len] in [#0, #10, #13,#16..#35,#37..#47 ,#56..#64,#88..#96,#123..#125]) do
    begin
      Inc(len);
    end;

ChangeFun.S:=Trim(Copy(fLine,Run+1,len));   //取出变量名

//==在函数表里面寻找变量名
if MYvarList.Count>0 then
    for i:=0 to MYvarList.Count-1 do
    begin
       if PChangeFun(MYvarList.Items[i]).S=(ChangeFun.S) then
          begin
             Changeed:=True;
             ChangeFun.D:=PChangeFun(MYvarList.Items[i]).D;
            end;
      end;
if not Changeed then    //如果没有换过,就自动建立新名字
begin
   ChangeFun.D:=Format('Autovar%d',[MYvarList.Count]);
   MYvarList.Add(ChangeFun);
  end;

cmd:=ChangeFun.D;
//==开始换字符串操作

   Delete(MYCommand,Run+_offset+1,Length(ChangeFun.S));
   Insert(cmd,MYCommand,Run+_offset+1);
   _offset:=_offset+ (Length(cmd) -Length(ChangeFun.S));
//
Run:=Run+length(ChangeFun.S);  //处理OK


/////////////////////////

if Changeed then  Dispose(ChangeFun);


 end;

{
  fTokenID := tkvar;
  Inc(Run);
  while not (fLine[Run] in [#0, #10, #13,#33..#47 ,#56..#64,#88..#96,#123..#125]) do begin
    Inc(Run);
  end;
end; }

{
function TSynPasSyn.KeyComp(const aKey: String): Boolean;
var
  I: Integer;
  Temp: PChar;
begin
  Temp := fToIdent;
  if  ChangeKegFlag then
      begin
             Delete(MYCommand,Run+_offset+1,Length(aKey));
             Insert(LowerCase(aKey),MYCommand,Run+_offset+1);
       end;
  if Length(aKey) = fStringLen then
  begin
    Result := True;
    for i := 1 to fStringLen do
    begin
      if mHashTable[Ord(UpCase(Temp^))] <> mHashTable[ord(UpCase(aKey[i]))] then
      begin
        Result := False;
        break;
      end;
      inc(Temp);
    end;
  end
  else
    Result := False;
end;   }


function TSynPasSyn.KeyComp(const aKey: string): Boolean;
var
  I: Integer;
  Temp: PChar;
begin
  Temp := fToIdent;
       
  if Length(aKey) = fStringLen then
  begin
    Result := True;
    for i := 1 to fStringLen do
    begin
      if mHashTable[Ord(UpCase(Temp^))] <> mHashTable[ord(UpCase(aKey[i]))] then
      begin
        Result := False;
        break;
      end;
      inc(Temp);
    end;
  end
  else
    Result := False;

 if Result and ChangeKegFlag then
      begin
             Delete(MYCommand,Run+_offset+1,Length(aKey));
             Insert(LowerCase(aKey),MYCommand,Run+_offset+1);
       end;

end; 



function TSynPasSyn.Func15: TtkTokenKind;
begin
  if KeyComp('If') then Result := tkKey else Result := tkIdentifier;
end;

function TSynPasSyn.Func19: TtkTokenKind;
begin
  if KeyComp('Do') then Result := tkKey else
    if KeyComp('And') then Result := tkKey else Result := tkIdentifier;
end;

function TSynPasSyn.Func20: TtkTokenKind;
begin
  if KeyComp('As') then Result := tkKey else Result := tkIdentifier;
end;

function TSynPasSyn.Func21: TtkTokenKind;
begin
  if KeyComp('Of') then Result := tkKey else Result := tkIdentifier;
end;

function TSynPasSyn.Func23: TtkTokenKind;
begin
  if KeyComp('End') then
  begin
    Result := tkKey;
    fRange := rsUnknown;
  end
  else if KeyComp('In') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func25: TtkTokenKind;
begin
  if KeyComp('Far') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func27: TtkTokenKind;
begin
  if  KeyComp('Cdecl') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func28: TtkTokenKind;
begin
  if KeyComp('Is') then
    Result := tkKey
  else if (fRange = rsProperty) and KeyComp('Read') then
    Result := tkKey
  else if KeyComp('Case') then
    Result := tkKey
  else if KeyComp('beep') then
    begin
      KeyChange('beep()');
      Result := tkKey
     end
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func29: TtkTokenKind;
begin
  if KeyComp('on') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func32: TtkTokenKind;
begin
  if KeyComp('Label') then
    Result := tkKey
  else if KeyComp('Mod') then
    Result := tkKey
  else if KeyComp('File') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func33: TtkTokenKind;
begin
  if KeyComp('Or') then
    Result := tkKey
  else if KeyComp('Asm') then
  begin
    Result := tkKey;
    fRange := rsAsm;
    fAsmStart := True;
  end
  else if (fRange = rsExports) and KeyComp('name') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func35: TtkTokenKind;
begin
  if KeyComp('Nil') then
    Result := tkKey
  else if KeyComp('To') then
    Result := tkKey
  else if KeyComp('Div') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func37: TtkTokenKind;
begin
  if KeyComp('Begin') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func38: TtkTokenKind;
begin
  if KeyComp('Near') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func39: TtkTokenKind;
begin
  if KeyComp('For') then
    Result := tkKey
  else if KeyComp('Shl') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func40: TtkTokenKind;
begin
  if KeyComp('Packed') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func41: TtkTokenKind;
begin
  if KeyComp('Else') then
    Result := tkKey
  else if KeyComp('Var') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func42: TtkTokenKind;
begin
  if  KeyComp('Final') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func44: TtkTokenKind;
begin
  if KeyComp('Set') then
    Result := tkKey
end;

function TSynPasSyn.Func45: TtkTokenKind;
begin
  if KeyComp('Shr') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func46: TtkTokenKind;
begin
  if KeyComp('Sealed') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func47: TtkTokenKind;
begin
  if KeyComp('Then') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func49: TtkTokenKind;
begin
  if KeyComp('Not') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func52: TtkTokenKind;
begin
  if KeyComp('Pascal') then
    Result := tkKey
  else if KeyComp('Raise') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func54: TtkTokenKind;
begin
  if KeyComp('Class') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func55: TtkTokenKind;
begin
  if KeyComp('Object') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func56: TtkTokenKind;
begin
  if (fRange in [rsProperty, rsExports]) and KeyComp('Index') then
    Result := tkKey
  else if KeyComp('Out') then
    Result := tkKey
  else if KeyComp('elseif') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;


function TSynPasSyn.Func57: TtkTokenKind;
begin
  if KeyComp('Goto') then
    Result := tkKey
  else if KeyComp('While') then
    Result := tkKey
  else if KeyComp('Xor') then
    Result := tkKey
  else if KeyComp('Sleep') then
      Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func59: TtkTokenKind;
begin
  if  KeyComp('Safecall') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func60: TtkTokenKind;
begin
  if KeyComp('With') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func61: TtkTokenKind;
begin
  if  KeyComp('Dispid') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func63: TtkTokenKind;
begin
  if KeyComp('Public') then
    Result := tkKey
  else if KeyComp('Record') then
    Result := tkKey
  else if KeyComp('Array') then
    Result := tkKey
  else if KeyComp('Try') then
    Result := tkKey
  else if KeyComp('Inline') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func64: TtkTokenKind;
begin
  if KeyComp('Unit') then
    Result := tkKey
  else if KeyComp('Uses') then
    Result := tkKey
  else if KeyComp('Helper') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func65: TtkTokenKind;
begin
  if KeyComp('Repeat') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func66: TtkTokenKind;
begin
  if KeyComp('Type') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func69: TtkTokenKind;
begin
  if KeyComp('Default') then
    Result := tkKey
  else if KeyComp('Dynamic') then
    Result := tkKey
  else if KeyComp('Message') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func71: TtkTokenKind;
begin
  if KeyComp('Stdcall') then
    Result := tkKey
  else if KeyComp('Const') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func73: TtkTokenKind;
begin
  if KeyComp('Except') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func75: TtkTokenKind;
begin
  if (fRange = rsProperty) and KeyComp('Write') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func76: TtkTokenKind;
begin
  if KeyComp('Until') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func79: TtkTokenKind;
begin
  if KeyComp('Finally') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func81: TtkTokenKind;
begin
  if (fRange = rsProperty) and KeyComp('Stored') then
    Result := tkKey
  else if KeyComp('Interface') then
    Result := tkKey
  else if  KeyComp('deprecated') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func84: TtkTokenKind;
begin
  if KeyComp('Abstract') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func85: TtkTokenKind;
begin
  if KeyComp('Forward') then
    Result := tkKey
  else if KeyComp('Library') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func87: TtkTokenKind;
begin
  if KeyComp('String') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func88: TtkTokenKind;
begin
  if KeyComp('Program') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func91: TtkTokenKind;
begin
  if KeyComp('Downto') then
    Result := tkKey
  else if KeyComp('Private') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func92: TtkTokenKind;
begin
  if KeyComp('overload') then
    Result := tkKey
  else if KeyComp('Inherited') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func94: TtkTokenKind;
begin
  if KeyComp('Assembler') then
    Result := tkKey
  else if (fRange = rsProperty) and KeyComp('Readonly') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func95: TtkTokenKind;
begin
  if KeyComp('Absolute') then
    Result := tkKey
end;

function TSynPasSyn.Func96: TtkTokenKind;
begin
  if KeyComp('Published') then
    Result := tkKey
  else if KeyComp('Override') then
    Result := tkKey
     else if KeyComp('return') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func97: TtkTokenKind;
begin
  if KeyComp('Threadvar') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func98: TtkTokenKind;
begin
  if KeyComp('Export') then
    Result := tkKey
  else if (fRange = rsProperty) and KeyComp('Nodefault') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func99: TtkTokenKind;
begin
  if KeyComp('External') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func100: TtkTokenKind;
begin
  if KeyComp('Automated') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func101: TtkTokenKind;
begin
  if KeyComp('Register') then
    Result := tkKey
  else if KeyComp('platform') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func102: TtkTokenKind;
begin
  if KeyComp('Function') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func103: TtkTokenKind;
begin
  if KeyComp('Virtual') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func105: TtkTokenKind;
begin
  if KeyComp('Procedure') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func106: TtkTokenKind;
begin
  if KeyComp('Protected') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func108: TtkTokenKind;
begin
  if  KeyComp('Operator') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func111: TtkTokenKind;
begin
if KeyComp('sendmessage') then
begin
Result := tkKey;
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func112: TtkTokenKind;
begin
  if KeyComp('requires') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func117: TtkTokenKind;
begin
  if KeyComp('Exports') then
  begin
    Result := tkKey;
    fRange := rsExports;
  end
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func126: TtkTokenKind;
begin
  if (fRange = rsProperty) and KeyComp('Implements') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func129: TtkTokenKind;
begin
  if KeyComp('Dispinterface') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func132: TtkTokenKind;
begin
  if KeyComp('Reintroduce') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func133: TtkTokenKind;
begin
  if KeyComp('Property') then
  begin
    Result := tkKey;
    fRange := rsProperty;
  end
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func136: TtkTokenKind;
begin
  if  KeyComp('Finalization') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func139: TtkTokenKind;
begin
if KeyComp('postmessage') then
begin
Result := tkKey;
end
else Result := tkIdentifier
end;




function TSynPasSyn.Func141: TtkTokenKind;
begin
  if (fRange = rsProperty) and KeyComp('Writeonly') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func143: TtkTokenKind;
begin
  if KeyComp('Destructor') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func166: TtkTokenKind;
begin
  if KeyComp('Constructor') then
    Result := tkKey
  else if KeyComp('Implementation') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func168: TtkTokenKind;
begin
  if KeyComp('Initialization') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynPasSyn.Func191: TtkTokenKind;
begin
  if KeyComp('Resourcestring') then
    Result := tkKey
  else if  KeyComp('Stringresource') then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

//===========================中文===============================
function TSynPasSyn.Func386: TtkTokenKind;
begin
if KeyComp('次') then
begin
Result := tkKey;
KeyChange('');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func430: TtkTokenKind;
begin
if KeyComp('秒') then
begin
Result := tkKey;
KeyChange('');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func809: TtkTokenKind;
begin
if KeyComp('毫秒') then
begin
Result := tkKey;
KeyChange('');
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func733: TtkTokenKind;
begin
if KeyComp('取色') then
begin
Result := tkKey;
KeyChange('getpixelcolor');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func741: TtkTokenKind;
begin
if KeyComp('放开') then
begin
Result := tkKey;
KeyChange('keyup');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func757: TtkTokenKind;
begin
if KeyComp('按下') then
begin
Result := tkKey;
KeyChange('keydown');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func767: TtkTokenKind;
begin
if KeyComp('返回') then
begin
Result := tkKey;
KeyChange('end');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func770: TtkTokenKind;
begin
if KeyComp('那么') then
begin
Result := tkKey;
KeyChange('then');
end
else Result := tkIdentifier
end;

function TSynPasSyn.Func795: TtkTokenKind;
begin
if KeyComp('找色') then
begin
Result := tkKey;
KeyChange('findcolor');
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func796: TtkTokenKind;
begin
if KeyComp('按键') then
begin
Result := tkKey;
KeyChange('keypress');

end
else Result := tkIdentifier
end;


function TSynPasSyn.Func814: TtkTokenKind;
begin
if KeyComp('等待') then
begin
Result := tkKey;
KeyChange('sleep');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func816: TtkTokenKind;
begin
if KeyComp('找图') then
begin
Result := tkKey;
KeyChange('findpic');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func834: TtkTokenKind;
begin
if KeyComp('调用') then
begin
Result := tkKey;
KeyChange('');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func865: TtkTokenKind;
begin
if KeyComp('输入') then
begin
Result := tkKey;
KeyChange('saystring');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func867: TtkTokenKind;
begin
if KeyComp('如果') then
begin
Result := tkKey;
KeyChange('if');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func878: TtkTokenKind;
begin
if KeyComp('否则') then
begin
Result := tkKey;
KeyChange('else');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1149: TtkTokenKind;
begin
if KeyComp('取色差') then
begin
Result := tkKey;
KeyChange('comparecolore');
end
else Result := tkIdentifier
end;




function TSynPasSyn.Func1199: TtkTokenKind;
begin
if KeyComp('读内存') then
begin
Result := tkKey;
KeyChange('readmemory');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1207: TtkTokenKind;
begin
if KeyComp('跳转到') then
begin
Result := tkKey;
KeyChange('return ');
end
else Result := tkIdentifier
end;

function TSynPasSyn.Func1520: TtkTokenKind;
begin
if KeyComp('停止脚本') then
begin
Result := tkKey;
KeyChange('stoprun()');
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func1538: TtkTokenKind;
begin
if KeyComp('系统记时') then
begin
Result := tkKey;
KeyChange('gettickcount()');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1590: TtkTokenKind;
begin
if KeyComp('相对移动') then
begin
Result := tkKey;
KeyChange('mover');
end
else Result := tkIdentifier
end;

function TSynPasSyn.Func1593: TtkTokenKind;
begin
if KeyComp('模糊找色') then
begin
Result := tkKey;
KeyChange('findcolorex');
end
else Result := tkIdentifier
end;

function TSynPasSyn.Func1599: TtkTokenKind;
begin
if KeyComp('查找窗口') then
begin
Result := tkKey;
KeyChange('findwindow');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1602: TtkTokenKind;
begin
if KeyComp('右键放开') then
begin
Result := tkKey;
KeyChange('rightup');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1618: TtkTokenKind;
begin
if KeyComp('右键按下') then
begin
Result := tkKey;
KeyChange('rightdown');
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func1627: TtkTokenKind;
begin
if KeyComp('播放声音') then
begin
Result := tkKey;
KeyChange('playsound');
end
else Result := tkIdentifier
end;

function TSynPasSyn.Func1632: TtkTokenKind;
begin
if KeyComp('启动程序') then
begin
Result := tkKey;
KeyChange('execute');
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func1634: TtkTokenKind;
begin
if KeyComp('鼠标移到') then
begin
Result := tkKey;
KeyChange('moveto');
end
else Result := tkIdentifier
end;

function TSynPasSyn.Func1638: TtkTokenKind;
begin
if KeyComp('显示消息') then
begin
Result := tkKey;
KeyChange('messagebox');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1639: TtkTokenKind;
begin
if KeyComp('左键放开') then
begin
Result := tkKey;
KeyChange('leftup');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1641: TtkTokenKind;
begin
if KeyComp('右键单击') then
begin
Result := tkKey;
KeyChange('rightclick');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1642: TtkTokenKind;
begin
if KeyComp('中键单击') then
begin
Result := tkKey;
KeyChange('middleclick');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1654: TtkTokenKind;
begin
if KeyComp('退出过程') then
begin
Result := tkKey;
KeyChange('do return end');
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func1655: TtkTokenKind;
begin
if KeyComp('左键按下') then
begin
Result := tkKey;
KeyChange('leftdown');
end
else Result := tkIdentifier
end;



function TSynPasSyn.Func1678: TtkTokenKind;
begin
if KeyComp('左键单击') then
begin
Result := tkKey;
KeyChange('leftclick');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1706: TtkTokenKind;
begin
if KeyComp('左键双击') then
begin
Result := tkKey;
KeyChange('leftdblick');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func1755: TtkTokenKind;
begin
if KeyComp('条件结束') then
begin
Result := tkKey;
KeyChange('end');
end
else Result := tkIdentifier
end;


function TSynPasSyn.Func2481: TtkTokenKind;
begin
if KeyComp('设置窗口坐标') then
begin
Result := tkKey;
KeyChange('setwindowpos');
end
else Result := tkIdentifier
end;


//===========================中文===============================

function TSynPasSyn.AltFunc: TtkTokenKind;
begin
  Result := tkIdentifier
end;

function TSynPasSyn.IdentKind(MayBe: PChar): TtkTokenKind;
var
  HashKey: Integer;
begin
  fToIdent := MayBe;
  HashKey := KeyHash(MayBe);
  if HashKey <= MaxKey then
    Result := fIdentFuncTable[HashKey]
  else
    Result := tkIdentifier;
end;

procedure TSynPasSyn.MakeMethodTables;
var
  I: Char;
    A:Integer;
begin
  for I := #0 to #255 do
    case I of
      #0: fProcTable[Ord(I)] := NullProc;
      #10: fProcTable[Ord(I)] := LFProc;
      #13: fProcTable[Ord(I)] := CRProc;
      #1..#9, #11, #12, #14..#32:
        fProcTable[Ord(I)] := SpaceProc;
      '#': fProcTable[Ord(I)] := AsciiCharProc;
    //  '$': fProcTable[Ord(I)] := IntegerProc;
      #39,#34,'[': fProcTable[Ord(I)] := StringProc;
    //  '[': fProcTable[Ord(I)] := AttributeProc;    //属性
      '0'..'9': fProcTable[Ord(I)] := NumberProc;
      'A'..'Z', 'a'..'z', '_':
        fProcTable[Ord(I)] := IdentProc;

      '$': fProcTable[Ord(I)] := varProc;   //变量
       '!', '%', '&', '('..'/', ':'..'@', '\','^', '`', '~':
        begin
          case I of
            '(': fProcTable[Ord(I)] := RoundOpenProc;
            '.': fProcTable[Ord(I)] := PointProc;
            ';': fProcTable[Ord(I)] := SemicolonProc;
            '/','-','*': fProcTable[Ord(I)] := SlashProc;   //单行注释
            ':', '>': fProcTable[Ord(I)] := ColonOrGreaterProc;
            '<','!': fProcTable[Ord(I)] := LowerProc;
            '@': fProcTable[Ord(I)] := AddressOpProc;
          else
            fProcTable[Ord(I)] := SymbolProc;
          end;
        end;
    else
      fProcTable[Ord(I)] := UnknownProc;
    end;

      for A:=127 to 65535  do
         begin
           fProcTable[A]:=IdentProc;
         end;
end;

constructor TSynPasSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fPackageSource := True;  
  CMDLIST:=TStringList.Create;
  fAsmAttri := TSynHighlighterAttributes.Create(SYNS_AttrAssembler);
  AddAttribute(fAsmAttri);
 fCommentAttri := TSynHighlighterAttributes.Create(SYNS_AttrComment);
  fCommentAttri.Foreground := clGray;
  fCommentAttri.Style := [fsItalic];
  AddAttribute(fCommentAttri);
  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier);
  AddAttribute(fIdentifierAttri);
  fKeyAttri := TSynHighlighterAttributes.Create(SYNS_AttrReservedWord);
  fKeyAttri.Style := [fsBold];
  AddAttribute(fKeyAttri);
  fNumberAttri := TSynHighlighterAttributes.Create(SYNS_AttrNumber);
  fNumberAttri.Foreground := clRed;
  AddAttribute(fNumberAttri);
  fHexAttri := TSynHighlighterAttributes.Create(SYNS_AttrHexadecimal);
  fHexAttri.Foreground :=clFuchsia;  //函数的颜色
  AddAttribute(fHexAttri);

  fFloatAttri := TSynHighlighterAttributes.Create(SYNS_AttrFloat);
  fFloatAttri.Foreground := clBlue;
  AddAttribute(fFloatAttri);
  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace);
  AddAttribute(fSpaceAttri);
  fStringAttri := TSynHighlighterAttributes.Create(SYNS_AttrString);
  fStringAttri.Foreground := clBlue;
  AddAttribute(fStringAttri);

  fvarAttri := TSynHighlighterAttributes.Create(SYNS_AttrVariable);
  fvarAttri.Foreground :=clGreen;
  AddAttribute(fvarAttri);

  fKattribute := TSynHighlighterAttributes.Create('attribute');
  fKattribute.Foreground :=$00FF8000;   //[]
  AddAttribute(fKattribute);

  fSymbolAttri := TSynHighlighterAttributes.Create(SYNS_AttrSymbol);
  AddAttribute(fSymbolAttri);
   SetAttributesOnChange(DefHighlightChange);

  InitIdent;
  MakeMethodTables;
  fRange := rsUnknown;
  fAsmStart := False;
  fDefaultFilter := SYNS_FilterPascal;
  Funlist:=TList.Create;
  MYvarList:=TList.Create;
end; { Create }


destructor TSynPasSyn.Destroy;
var
  i:Integer;
begin
  inherited Destroy;
  if Funlist.Count>0 then
  for i:=0 to Funlist.Count-1 do
  begin
    Dispose(Funlist.Items[i]);
    end;
     Funlist.Clear;
     Funlist.Free;


  if MYvarList.Count>0 then
  for i:=0 to MYvarList.Count-1 do
  begin
    Dispose(MYvarList.Items[i]);
    end;
     MYvarList.Clear;
     MYvarList.Free;

end;


procedure TSynPasSyn.SetLine(NewValue: string; LineNumber:Integer);
begin
  if ChangeKegFlag then
  begin
        if LineNumber>0 then CMDLIST.Add(MYCommand) else  CMDLIST.Clear;
         MYCommand:=NewValue;
         _offset:=0;
    end;
  fLine := PChar(NewValue);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end; { SetLine }

procedure TSynPasSyn.AddressOpProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
  if fLine[Run] = '@' then inc(Run);
end;

procedure TSynPasSyn.AsciiCharProc;
begin
  fTokenID := tkChar;
  Inc(Run);
  while FLine[Run] in ['0'..'9', '$', 'A'..'F', 'a'..'f'] do
    Inc(Run);
end;

procedure TSynPasSyn.BorProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      if fRange in [rsDirective, rsDirectiveAsm] then
        fTokenID := tkDirec
      else
        fTokenID := tkComment;
      repeat
        if fLine[Run] = '}' then
        begin
          Inc(Run);
          if fRange in [rsBorAsm, rsDirectiveAsm] then
            fRange := rsAsm
          else
            fRange := rsUnKnown;
          break;
        end;
        Inc(Run);
      until fLine[Run] in [#0, #10, #13];
    end;
  end;
end;

procedure TSynPasSyn.BraceOpenProc;
begin
  if (fLine[Run + 1] = '$') then
  begin
    if fRange = rsAsm then
      fRange := rsDirectiveAsm
    else
      fRange := rsDirective;
  end
  else
  begin
    if fRange = rsAsm then
      fRange := rsBorAsm
    else
      fRange := rsBor;
  end;
  BorProc;
end;

procedure TSynPasSyn.ColonOrGreaterProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
  if fLine[Run] = '=' then inc(Run);
end;

procedure TSynPasSyn.CRProc;
begin
  fTokenID := tkSpace;
  inc(Run);
  if fLine[Run] = #10 then
    Inc(Run);
end; { CRProc }


procedure TSynPasSyn.IdentProc;
begin
  fTokenID := IdentKind((fLine + Run));
  inc(Run, fStringLen);
  while Identifiers[ord(fLine[Run])] do
    Inc(Run);
end;


procedure TSynPasSyn.IntegerProc;
begin
  inc(Run);
  fTokenID := tkHex;
  while FLine[Run] in ['0'..'9', 'A'..'F', 'a'..'f'] do
    Inc(Run);
end; { IntegerProc }


procedure TSynPasSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end; { LFProc }



procedure TSynPasSyn.LowerProc;
begin
  fTokenID := tkSymbol;
  if fLine[Run+1] in ['=', '>',#0, #10, #13,#32] then
  begin
      if ChangeKegFlag then
        begin
              if fLine[Run+1] in ['>','='] then
              begin
                   Delete(MYCommand,Run+_offset+1,2);
                   Insert('~=',MYCommand,Run+_offset+1);
               end;
         end;
    Inc(Run,2);
  Exit;
  end;

if Pos('>',fLine)>0 then
begin

if ChangeKegFlag then  MYFunProc
else
begin
  while not  (fLine[Run] in [#0, #10, #13,'>']) do
    begin
      Inc(Run);
    end;
   fTokenID :=tkHex ;
   Inc(Run);
end;
end
else
begin
  fTokenID :=tkUnknown ;
  Inc(Run);
 end;  


end; { LowerProc }


procedure TSynPasSyn.NullProc;
begin
  fTokenID := tkNull;
end; { NullProc }

procedure TSynPasSyn.NumberProc;
begin
  Inc(Run);
  fTokenID := tkNumber;
  while FLine[Run] in ['0'..'9', '.', 'e', 'E', '-', '+'] do
  begin
    case FLine[Run] of
      '.':
        if FLine[Run + 1] = '.' then
          Break
        else
          fTokenID := tkFloat;
      'e', 'E': fTokenID := tkFloat;
      '-', '+':
        begin
          if fTokenID <> tkFloat then // arithmetic
            Break;
          if not (FLine[Run - 1] in ['e', 'E']) then
            Break; //float, but it ends here
        end;
    end;
    Inc(Run);
  end;
end; { NumberProc }



procedure TSynPasSyn.PointProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
  if fLine[Run] in ['.', ')'] then
   begin
    Inc(Run);
    while byte(fLine[Run])>127 do
      Delete(MYCommand,Run+_offset,1);
       _offset:=_offset -1;
   end;
end; { PointProc }

procedure TSynPasSyn.AnsiProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    fTokenID := tkComment;
    repeat
      if (fLine[Run] = '*') and (fLine[Run + 1] = ')') then begin
        Inc(Run, 2);
        if fRange = rsAnsiAsm then
          fRange := rsAsm
        else
          fRange := rsUnKnown;
        break;
      end;
      Inc(Run);
    until fLine[Run] in [#0, #10, #13];
  end;
end;

procedure TSynPasSyn.RoundOpenProc;
begin
  Inc(Run);
  case fLine[Run] of
    '*':
      begin
        Inc(Run);
        if (fLine[Run] in ['*']) then

        if fRange = rsAsm then
          fRange := rsAnsiAsm
        else
          fRange := rsAnsi;
        fTokenID := tkComment;
        if not (fLine[Run] in [#0, #10, #13]) then
          AnsiProc;
      end;
    '.':
      begin
        inc(Run);
        fTokenID := tkSymbol;
      end;
  else
    fTokenID := tkSymbol;
  end;
end;

procedure TSynPasSyn.SemicolonProc;
begin
  Inc(Run);
  fTokenID := tkSymbol;
  if fRange in [rsProperty, rsExports] then
    fRange := rsUnknown;
end;

procedure TSynPasSyn.SlashProc;
begin
  Inc(Run);
  if (fLine[Run] in  ['/','-','*'] )  then
  begin
    fTokenID := tkComment;
   {  if ChangeKegFlag then
      begin
          Delete(MYCommand,Run+_offset,2);
          _offset:=_offset-2;
        end;  }
    repeat
      if ChangeKegFlag then
      begin
        Delete(MYCommand,Run+_offset,1);
        _offset:=_offset-1;
      end;
         Inc(Run);
    until fLine[Run] in [#0, #10, #13];
        Delete(MYCommand,Run+_offset,1);
        _offset:=_offset-1;
  end
  else
    fTokenID := tkSymbol;
end;



procedure TSynPasSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while FLine[Run] in [#1..#9, #11, #12, #14..#32] do inc(Run);
end;

procedure TSynPasSyn.StringProc;
begin
  fTokenID := tkString;
  if  fLine[Run]=#91 then
   begin
     if fLine[Run+1]<>#91 then
    begin
     AttributeProc;
      end;
   end;

  Inc(Run);
  while not (fLine[Run] in [#0, #10, #13]) do begin
    if fLine[Run] in [#34,#39] then
    begin
      Inc(Run);
      if not (fLine[Run] in [#34,#39]) then
        break;
    end;

   {   if ChangeKegFlag then
        begin
              if (fLine[Run] = '\') and  (fLine[Run+1] <> '\') then
              begin
                   Insert('\',MYCommand,Run+_offset+1);
                   _offset:=_offset+1;
               end;
         end;      }

    Inc(Run);
  end;
end;



procedure TSynPasSyn.AttributeProc;
begin
  fTokenID := tKattribute;
  Inc(Run);
  while not (fLine[Run] in [#0, #10, #13,#93]) do begin
    Inc(Run);
  end;
  Inc(Run);
end;

procedure TSynPasSyn.SymbolProc;
begin
  inc(Run);
  fTokenID := tkSymbol;
end;

procedure TSynPasSyn.UnknownProc;
begin
{$IFDEF SYN_MBCSSUPPORT}
  if FLine[Run] in LeadBytes then
    Inc(Run, 2)
  else
{$ENDIF}
  inc(Run);
  fTokenID := tkUnknown;
end;

procedure TSynPasSyn.Next;
begin
  fAsmStart := False;
  fTokenPos := Run;
  case fRange of
    rsAnsi, rsAnsiAsm:
      AnsiProc;
    rsBor, rsBorAsm, rsDirective, rsDirectiveAsm:
      BorProc;
  else
    fProcTable[ord(fLine[Run])];
  end;
end;

function TSynPasSyn.GetDefaultAttribute(Index: integer):
  TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD: Result := fKeyAttri;
    SYN_ATTR_STRING: Result := fStringAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
    SYN_ATTR_SYMBOL: Result := fSymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynPasSyn.GetEol: Boolean;
begin
  Result := fTokenID = tkNull;
end;

function TSynPasSyn.GetToken: string;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  SetString(Result, (FLine + fTokenPos), Len);
end;

function TSynPasSyn.GetTokenID: TtkTokenKind;
begin
  if not fAsmStart and (fRange = rsAsm)
    and not (fTokenId in [tkNull, tkComment, tkDirec, tkSpace])
  then
    Result := tkAsm
  else
    Result := fTokenId;
end;

function TSynPasSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case GetTokenID of
    tkAsm: Result := fAsmAttri;
    tkComment: Result := fCommentAttri;
    tkDirec: Result := fDirecAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey: Result := fKeyAttri;
    tkNumber: Result := fNumberAttri;
    tkFloat: Result := fNumberAttri;//fFloatAttri;
    tkHex: Result := fHexAttri;
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkvar:Result:=fvarAttri;
    tKattribute:Result:=fKattribute;
    tkChar: Result := fCharAttri;
    tkSymbol: Result := fSymbolAttri;
    tkUnknown: Result := fSymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynPasSyn.GetTokenKind: integer;
begin
  Result := Ord(GetTokenID);
end;

function TSynPasSyn.GetTokenPos: Integer;
begin
  Result := fTokenPos;
end;

function TSynPasSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

procedure TSynPasSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

procedure TSynPasSyn.ResetRange;
begin
  fRange:= rsUnknown;
end;

procedure TSynPasSyn.EnumUserSettings(DelphiVersions: TStrings);
begin
  { returns the user settings that exist in the registry }

end; { TSynPasSyn.UseUserSettings }

function TSynPasSyn.GetIdentChars: TSynIdentChars;
begin
  Result := TSynValidStringChars;
end;

function TSynPasSyn.GetSampleSource: string;
begin
  Result := '{ Syntax highlighting }'#13#10 +
             'procedure TForm1.Button1Click(Sender: TObject);'#13#10 +
             'var'#13#10 +
             '  Number, I, X: Integer;'#13#10 +
             'begin'#13#10 +
             '  Number := 123456;'#13#10 +
             '  Caption := ''The Number is'' + #32 + IntToStr(Number);'#13#10 +
             '  for I := 0 to Number do'#13#10 +
             '  begin'#13#10 +
             '    Inc(X);'#13#10 +
             '    Dec(X);'#13#10 +
             '    X := X + 1.0;'#13#10 +
             '    X := X - $5E;'#13#10 +
             '  end;'#13#10 +
             '  {$R+}'#13#10 +
             '  asm'#13#10 +
             '    mov AX, 1234H'#13#10 +
             '    mov Number, AX'#13#10 +
             '  end;'#13#10 +
             '  {$R-}'#13#10 +
             'end;';
end; { GetSampleSource }


class function TSynPasSyn.GetLanguageName: string;
begin
  Result := SYNS_LangPascal;
end;

class function TSynPasSyn.GetCapabilities: TSynHighlighterCapabilities;
begin
  Result := inherited GetCapabilities + [hcUserSettings];
end;

function TSynPasSyn.IsFilterStored: boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterPascal;
end;


function KeyIdToKeyName(id: integer ): string;
begin
  case  id of
      $14:
      result :='<CapsLock>';
      $10:
      result :='<Shift>';
      $11:
      result :='<Ctrl>';
      $12:
      result :='<Alt>';
      $5b:
      result :='<Win>';
      $5c:
      result :='<Win>';
      $26:
      result :='<Up>';
      $28:
      result :='<Down>';
      $25:
      result :='<Left>';
      $27:
      result :='<Right>';
      $2d:
      result :='<Insert>';
      $24:
      result :='<Home>';
      $21:
      result :='<PageUp>';
      $2e:
      result :='<Delete>';
      $23:
      result :='<End>';
      $22:
      result :='<PageDown>';
      $8:
      result :='<BackSpace>';
      $d:
      result :='<Enter>';
      $5d:
      result :='<Right Mouse>';
      $20:
      result :='<Space>';
      $9:
      result :='<Tab>';
      $1b:
      result :='<Esc>';
      $70:
      result :='<F1>';
      $71:
      result :='<F2>';
      $72:
      result :='<F3>';
      $73:
      result :='<F4>';
      $74:
      result :='<F5>';
      $75:
      result :='<F6>';
      $76:
      result :='<F7>';
      $77:
      result :='<F8>';
      $78:
      result :='<F9>';
      $79:
      result :='<F10>';
      $7a:
      result :='<F11>';
      $7b:
      result :='<F12>';
      $91:
      result :='<Scroll Lock>';
      $13:
      result :='<Pause/Break>';
      $90:
      result :='<Num Lock>';
      $6f:
      result :='<Num />';
      $6a:
      result :='<Num *>';
      $6d:
      result :='<Num ->';
      $6b:
      result :='<Num +>';
      $bd:
      result :='-';
      $bb:
      result :='=';
      $dc:
      result :='\';
      $db:
      result :='[';
      $dd:
      result :=']';
      $ba:
      result :=';';
      $de:
      result :='''';
      $bc:
      result :=',';
      $be:
      result :='.';
      $bf:
      result :='/';
      $c0:
      result :='`';
      $67:
      result :='<Num 7>';
      $68:
      result :='<Num 8>';
      $69:
      result :='<Num 9>';
      $64:
      result :='<Num 4>';
      $65:
      result :='<Num 5>';
      $66:
      result :='<Num 6>';
      $61:
      result :='<Num 1>';
      $62:
      result :='<Num 2>';
      $63:
      result :='<Num 3>';
      $60:
      result :='<Num 0>';
      $6e:
      result :='<Num .>';
      $2c:
      result :='<Print Screen>';
      else    result :='';

   end;
end;

function KeyNameToKeyId( s : string ): BYTE;
begin
  if CompareText(s,'<Print Screen>') = 0 then
result :=$2c
 else if CompareText(s,'<Num .>') = 0 then
result :=$6e
 else if CompareText(s,'<Num 0>') = 0 then
result :=$60
 else if CompareText(s,'<Num 3>') = 0 then
result :=$63 
 else if CompareText(s,'<Num 2>') = 0 then 
result :=$62 
 else if CompareText(s,'<Num 1>') = 0 then 
result :=$61 
 else if CompareText(s,'<Num 6>') = 0 then 
result :=$66 
 else if CompareText(s,'<Num 5>') = 0 then 
result :=$65 
 else if CompareText(s,'<Num 4>') = 0 then 
result :=$64
 else if CompareText(s,'<Num 9>') = 0 then 
result :=$69 
 else if CompareText(s,'<Num 8>') = 0 then 
result :=$68 
 else if CompareText(s,'<Num 7>') = 0 then 
result :=$67 
 else if CompareText(s,'`') = 0 then
result :=$c0 
 else if CompareText(s,'/') = 0 then
result :=$bf 
 else if CompareText(s,'.') = 0 then 
result :=$be 
 else if CompareText(s,',') = 0 then 
result :=$bc
 else if CompareText(s,'''') = 0 then
result :=$de 
 else if CompareText(s,' ') = 0 then 
result :=$ba
 else if CompareText(s,']') = 0 then 
result :=$dd 
 else if CompareText(s,'[') = 0 then 
result :=$db 
 else if CompareText(s,'\') = 0 then 
result :=$dc 
 else if CompareText(s,'=') = 0 then 
result :=$bb 
 else if CompareText(s,'-') = 0 then 
result :=$bd
 else if CompareText(s,'<Num +>') = 0 then 
result :=$6b 
 else if CompareText(s,'<Num ->') = 0 then 
result :=$6d 
 else if CompareText(s,'<Num *>') = 0 then 
result :=$6a 
 else if CompareText(s,'<Num />') = 0 then 
result :=$6f 
 else if CompareText(s,'<Num Lock>') = 0 then 
result :=$90
 else if CompareText(s,'<Pause/Break>') = 0 then 
result :=$13 
 else if CompareText(s,'<Scroll Lock>') = 0 then 
result :=$91 
 else if CompareText(s,'<F12>') = 0 then 
result :=$7b 
 else if CompareText(s,'<F11>') = 0 then 
result :=$7a 
 else if CompareText(s,'<F10>') = 0 then 
result :=$79
 else if CompareText(s,'<F9>') = 0 then 
result :=$78 
 else if CompareText(s,'<F8>') = 0 then 
result :=$77 
 else if CompareText(s,'<F7>') = 0 then 
result :=$76 
 else if CompareText(s,'<F6>') = 0 then 
result :=$75 
 else if CompareText(s,'<F5>') = 0 then 
result :=$74
 else if CompareText(s,'<F4>') = 0 then 
result :=$73 
 else if CompareText(s,'<F3>') = 0 then 
result :=$72 
 else if CompareText(s,'<F2>') = 0 then 
result :=$71 
 else if CompareText(s,'<F1>') = 0 then 
result :=$70 
 else if CompareText(s,'<Esc>') = 0 then 
result :=$1b
 else if CompareText(s,'<Tab>') = 0 then 
result :=$9 
 else if CompareText(s,'<Space>') = 0 then 
result :=$20 
 else if CompareText(s,'<Right Mouse>') = 0 then 
result :=$5d 
 else if CompareText(s,'<Enter>') = 0 then 
result :=$d 
 else if CompareText(s,'<BackSpace>') = 0 then 
result :=$8 
 else if CompareText(s,'<PageDown>') = 0 then
result :=$22 
 else if CompareText(s,'<End>') = 0 then 
result :=$23 
 else if CompareText(s,'<Delete>') = 0 then 
result :=$2e 
 else if CompareText(s,'<PageUp>') = 0 then 
result :=$21 
 else if CompareText(s,'<Home>') = 0 then 
result :=$24 
 else if CompareText(s,'<Insert>') = 0 then 
result :=$2d
 else if CompareText(s,'<Right>') = 0 then 
result :=$27 
 else if CompareText(s,'<Left>') = 0 then 
result :=$25 
 else if CompareText(s,'<Down>') = 0 then 
result :=$28 
 else if CompareText(s,'<Up>') = 0 then 
result :=$26 
 else if CompareText(s,'<Win>') = 0 then 
result :=$5c 
 else if CompareText(s,'<Win>') = 0 then
result :=$5b 
 else if CompareText(s,'<Alt>') = 0 then
result :=$12 
 else if CompareText(s,'<Ctrl>') = 0 then 
result :=$11
 else if CompareText(s,'<Shift>') = 0 then 
result :=$10
 else if CompareText(s,'<CapsLock>') = 0 then 
result :=$14
  else result :=0;

end;



initialization
  MakeIdentTable;
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynPasSyn);
{$ENDIF}
end.




unit SynHighlighterSample;

{$I SynEdit.inc}

interface

uses
  SysUtils,
  Classes,
{$IFDEF SYN_CLX}
  QControls,
  QGraphics,
{$ELSE}
  Windows,
  Controls,
  Graphics,
{$ENDIF}
  SynEditTypes,
  SynEditHighlighter;

type
  TtkTokenKind = (
    tkComment,
    tkIdentifier,
    tkKey,
    tkNull,
    tkSpace,
    tkString,
    tkTest,
    tkUnknown);

  TRangeState = (rsUnKnown, rsBraceComment, rsCStyleComment, rsString);

  TProcTableProc = procedure of object;

  PIdentFuncTableFunc = ^TIdentFuncTableFunc;
  TIdentFuncTableFunc = function: TtkTokenKind of object;

const
  MaxKey = $FFFF;

type
  TSynSampleSyn = class(TSynCustomHighlighter)
  private
    fLine: PChar;
    fLineNumber: Integer;
    fProcTable: array[0..65535] of TProcTableProc;
    fRange: TRangeState;
    Run: LongInt;
    fStringLen: Integer;
    fToIdent: PChar;
    fTokenPos: Integer;
    fTokenID: TtkTokenKind;
    fIdentFuncTable: array[0 .. MaxKey] of TIdentFuncTableFunc;
    fCommentAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fKeyAttri: TSynHighlighterAttributes;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fTestAttri: TSynHighlighterAttributes;
    function KeyHash(ToHash: PChar): Integer;
    function KeyComp(const aKey: string): Boolean;
    function Func52: TtkTokenKind;
    function Func53: TtkTokenKind;
    function Func72: TtkTokenKind;
    function Func96: TtkTokenKind;
    //==========中文===============
    function Func867: TtkTokenKind;
   //==========中文===============
    procedure IdentProc;
    procedure UnknownProc;
    function AltFunc: TtkTokenKind;
    procedure InitIdent;
    function IdentKind(MayBe: PChar): TtkTokenKind;
    procedure MakeMethodTables;
    procedure NullProc;
    procedure SpaceProc;
    procedure CRProc;
    procedure LFProc;
    procedure BraceCommentOpenProc;
    procedure BraceCommentProc;
    procedure CStyleCommentOpenProc;
    procedure CStyleCommentProc;
    procedure StringOpenProc;
    procedure StringProc;
  protected
    function GetIdentChars: TSynIdentChars; override;
    function GetSampleSource: string; override;
    function IsFilterStored: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    {$IFNDEF SYN_CPPB_1} class {$ENDIF}
    function GetLanguageName: string; override;
    function GetRange: Pointer; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes; override;
    function GetEOL: Boolean; override;
    function GetKeyWords: string;
    function GetTokenID: TtkTokenKind;
    procedure SetLine(NewValue: String; LineNumber: Integer); override;
    function GetToken: String; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: integer; override;
    function GetTokenPos: Integer; override;
    procedure Next; override;
  published
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read fKeyAttri write fKeyAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property TestAttri: TSynHighlighterAttributes read fTestAttri write fTestAttri;
  end;

implementation

uses
  SynEditStrConst;

{$IFDEF SYN_COMPILER_3_UP}
resourcestring
{$ELSE}
const
{$ENDIF}
  SYNS_FilterSamplelanguage = 'All files (*.*)|*.*';
  SYNS_LangSamplelanguage = 'Sample language';
  SYNS_AttrTest = 'Test';

var
Identifiers: array[0..65535] of ByteBool;
  mHashTable: array[0..65535] of Integer;


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


procedure TSynSampleSyn.InitIdent;
var
  I: Integer;
  pF: PIdentFuncTableFunc;
begin
  pF := PIdentFuncTableFunc(@fIdentFuncTable);
  for I := Low(fIdentFuncTable) to High(fIdentFuncTable) do
  begin
    pF^ := AltFunc;
    Inc(pF);
  end;
  fIdentFuncTable[52] := Func52;
  fIdentFuncTable[53] := Func53;
  fIdentFuncTable[72] := Func72;
  fIdentFuncTable[96] := Func96;
  fIdentFuncTable[867] := Func867;
end;

function TSynSampleSyn.KeyHash(ToHash: PChar): Integer;
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

function TSynSampleSyn.KeyComp(const aKey: String): Boolean;
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
     // if (ord(Temp^) <> ord(aKey[i])) then
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
end;

function TSynSampleSyn.Func52: TtkTokenKind;
begin
  if KeyComp('Hello') then Result := tkKey else Result := tkIdentifier;
end;

function TSynSampleSyn.Func53: TtkTokenKind;
begin
  if KeyComp('Hellp') then Result := tkKey else Result := tkIdentifier;
end;

function TSynSampleSyn.Func72: TtkTokenKind;
begin
  if KeyComp('world') then Result := tkKey else Result := tkIdentifier;
end;

function TSynSampleSyn.Func96: TtkTokenKind;
begin
  if KeyComp('SynEdit') then Result := tkTest else Result := tkIdentifier;
end;

//====================中文====================
function TSynSampleSyn.Func867: TtkTokenKind;
begin
  if KeyComp('如果') then Result := tkKey else Result := tkComment;
end;
//====================中文====================


function TSynSampleSyn.AltFunc: TtkTokenKind;
begin
  Result := tkIdentifier;
end;

function TSynSampleSyn.IdentKind(MayBe: PChar): TtkTokenKind;
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

procedure TSynSampleSyn.MakeMethodTables;
var
  I: Char;
  A:Integer;
begin
  for I := #0 to #255 do
    case I of
      #0: fProcTable[ord(I)] := NullProc;
      #10: fProcTable[ord(I)] := LFProc;
      #13: fProcTable[ord(I)] := CRProc;
      '{': fProcTable[ord(I)] := BraceCommentOpenProc;
      '/': fProcTable[ord(I)] := CStyleCommentOpenProc;
      '"': fProcTable[ord(I)] := StringOpenProc;
      #1..#9,
      #11,
      #12,
      #14..#32 : fProcTable[ord(I)] := SpaceProc;
      'A'..'Z', 'a'..'z', '_': fProcTable[ord(I)] := IdentProc;
    else
       fProcTable[ord(I)] := UnknownProc;
    end;


  for A:=127 to 65535  do
  begin
     fProcTable[A]:=IdentProc;
    end;
    
end;

procedure TSynSampleSyn.SpaceProc;
begin
  fTokenID := tkSpace;
  repeat
    inc(Run);
  until not (fLine[Run] in [#1..#32]);
end;

procedure TSynSampleSyn.NullProc;
begin
  fTokenID := tkNull;
end;

procedure TSynSampleSyn.CRProc;
begin
  fTokenID := tkSpace;
  inc(Run);
  if fLine[Run] = #10 then
    inc(Run);
end;

procedure TSynSampleSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end;

procedure TSynSampleSyn.BraceCommentOpenProc;
begin
  Inc(Run);
  fRange := rsBraceComment;
  BraceCommentProc;
  fTokenID := tkComment;
end;

procedure TSynSampleSyn.BraceCommentProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkComment;
      repeat
        if (fLine[Run] = '}') then
        begin
          Inc(Run, 1);
          fRange := rsUnKnown;
          Break;
        end;
        if not (fLine[Run] in [#0, #10, #13]) then
          Inc(Run);
      until fLine[Run] in [#0, #10, #13];
    end;
  end;
end;

procedure TSynSampleSyn.CStyleCommentOpenProc;
begin
  Inc(Run);
  if (fLine[Run] = '*') then
  begin
    fRange := rsCStyleComment;
    CStyleCommentProc;
    fTokenID := tkComment;
  end
  else
    fTokenID := tkIdentifier;
end;

procedure TSynSampleSyn.CStyleCommentProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkComment;
      repeat
        if (fLine[Run] = '*') and
           (fLine[Run + 1] = '/') then
        begin
          Inc(Run, 2);
          fRange := rsUnKnown;
          Break;
        end;
        if not (fLine[Run] in [#0, #10, #13]) then
          Inc(Run);
      until fLine[Run] in [#0, #10, #13];
    end;
  end;
end;

procedure TSynSampleSyn.StringOpenProc;
begin
  Inc(Run);
  fRange := rsString;
  StringProc;
  fTokenID := tkString;
end;

procedure TSynSampleSyn.StringProc;
begin
  fTokenID := tkString;
  repeat
    if (fLine[Run] = '"') then
    begin
      Inc(Run, 1);
      fRange := rsUnKnown;
      Break;
    end;
    if not (fLine[Run] in [#0, #10, #13]) then
      Inc(Run);
  until fLine[Run] in [#0, #10, #13];
end;

constructor TSynSampleSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fCommentAttri := TSynHighLighterAttributes.Create(SYNS_AttrComment);
  fCommentAttri.Style := [fsItalic];
  fCommentAttri.Foreground := clNavy;
  AddAttribute(fCommentAttri);

  fIdentifierAttri := TSynHighLighterAttributes.Create(SYNS_AttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fKeyAttri := TSynHighlighterAttributes.Create(SYNS_AttrReservedWord);
  fKeyAttri.Foreground:=clLime;
  fKeyAttri.Style:= [fsBold];
  AddAttribute(fKeyAttri);

  fSpaceAttri := TSynHighLighterAttributes.Create(SYNS_AttrSpace);
  AddAttribute(fSpaceAttri);

  fStringAttri := TSynHighLighterAttributes.Create(SYNS_AttrString);
  fStringAttri.Foreground := clRed;
  AddAttribute(fStringAttri);

  fTestAttri := TSynHighLighterAttributes.Create(SYNS_AttrTest);
  fTestAttri.Style := [fsUnderline, fsItalic];
  fTestAttri.Foreground := clBlue;
  fTestAttri.Background := clSilver;
  AddAttribute(fTestAttri);

  SetAttributesOnChange(DefHighlightChange);
  InitIdent;
  MakeMethodTables;
  fDefaultFilter := SYNS_FilterSamplelanguage;
  fRange := rsUnknown;
end;

procedure TSynSampleSyn.SetLine(NewValue: String; LineNumber: Integer);
begin
  fLine := PChar(NewValue);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end;

procedure TSynSampleSyn.IdentProc;
begin
  fTokenID := IdentKind((fLine + Run));
  inc(Run, fStringLen);
  while Identifiers[ord(fLine[Run])] do
    Inc(Run);
end;

procedure TSynSampleSyn.UnknownProc;
begin
{$IFDEF SYN_MBCSSUPPORT}
  if FLine[Run] in LeadBytes then
    Inc(Run,2)
  else
{$ENDIF}
  inc(Run);
  fTokenID := tkUnknown;
end;

procedure TSynSampleSyn.Next;
var
  i:Integer;
begin
  fTokenPos := Run;
  case fRange of
    rsBraceComment: BraceCommentProc;
    rsCStyleComment: CStyleCommentProc;
  else
    begin
      fRange := rsUnknown;
      i:=ord(fLine[Run]);
      fProcTable[i];
    end;
  end;
end;

function TSynSampleSyn.GetDefaultAttribute(Index: integer): TSynHighLighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT    : Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER : Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD    : Result := fKeyAttri;
    SYN_ATTR_STRING     : Result := fStringAttri;
    SYN_ATTR_WHITESPACE : Result := fSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynSampleSyn.GetEOL: Boolean;
begin
  Result := fTokenID = tkNull;
end;

function TSynSampleSyn.GetKeyWords: string;
begin
  Result := 
    'Hello,SynEdit,World';
end;

function TSynSampleSyn.GetToken: String;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  SetString(Result, (FLine + fTokenPos), Len);
end;

function TSynSampleSyn.GetTokenID: TtkTokenKind;
begin
  Result := fTokenId;
end;

function TSynSampleSyn.GetTokenAttribute: TSynHighLighterAttributes;
begin
  case GetTokenID of
    tkComment: Result := fCommentAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey: Result := fKeyAttri;
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkTest: Result := fTestAttri;
    tkUnknown: Result := fIdentifierAttri;
  else
    Result := nil;
  end;
end;

function TSynSampleSyn.GetTokenKind: integer;
begin
  Result := Ord(fTokenId);
end;

function TSynSampleSyn.GetTokenPos: Integer;
begin
  Result := fTokenPos;
end;

function TSynSampleSyn.GetIdentChars: TSynIdentChars;
begin
  Result := ['_', 'a'..'z', 'A'..'Z'];
end;

function TSynSampleSyn.GetSampleSource: string;
begin
  Result :='World  如果 as keywords. It will also highlight "Strings". #13#10';
end;

function TSynSampleSyn.IsFilterStored: Boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterSamplelanguage;
end;

{$IFNDEF SYN_CPPB_1} class {$ENDIF}
function TSynSampleSyn.GetLanguageName: string;
begin
  Result := SYNS_LangSamplelanguage;
end;

procedure TSynSampleSyn.ResetRange;
begin
  fRange := rsUnknown;
end;

procedure TSynSampleSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

function TSynSampleSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

initialization
  MakeIdentTable;
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynSampleSyn);
{$ENDIF}
end.

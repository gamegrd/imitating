//******************************************************************************
//***                     LUA SCRIPT DELPHI UTILITIES                        ***
//***                                                                        ***
//***        (c) 2006 Jean-Fran輟is Goulet,  Massimo Magnano, Kuma           ***
//***                                                                        ***
//***                                                                        ***
//******************************************************************************
//  File        : LuaUtils.pas
//
//  Description : Useful functions to work with Lua in Delphi.
//
//******************************************************************************
//** See Copyright Notice in lua.h

//Revision 1.2
//     MaxM Adds :
//             GetCurrentFuncName, LuaSetTablePropertyFuncs
//
//Revision 1.1
//     MaxM Adds :
//             LuaPCallFunction
//
//Revision 1.0
//     MaxM Adds :
//             LuaPushVariant
//             LuaToVariant
//             LuaGetTableInteger, LuaGet\SetTableTMethod
//             LuaLoadBufferFromFile
//     Solved Bugs : Stack problem in LuaProcessTableName
//                   LuaToInteger why Round?, Trunc is better
unit LuaUtils;

interface

uses
  SysUtils, Classes, ComCtrls, luaconf, lua, lualib, lauxlib, Variants;

const
  ERR_Script = 'Script Error : ';

type
  TOnLuaStdout = procedure(S: PChar; N: Integer);
  TOnLuaStdoutEx = procedure(F, S: PChar; L, N: Integer);
  ELuaException = class(Exception)
    Title: string;
    Line: Integer;
    Msg: string;
    constructor Create(Title: string; Line: Integer; Msg: string);
  end;

  TVariantArray = array of Variant;
  PVariantArray = ^TVariantArray;

function Quote(const Str: string): string;
function Dequote(const QuotedStr: string): string;
function lua_print(L: Plua_State): Integer; cdecl;
function lua_printex(L: Plua_State): Integer; cdecl;
function lua_io_write(L: Plua_State): Integer; cdecl;
function lua_io_writeex(L: Plua_State): Integer; cdecl;

function LuaToPointer(L: Plua_State; Index: Integer): Pointer;
procedure LuaPushPointer(L: Plua_State; P: Pointer);

function LuaToBoolean(L: PLua_State; Index: Integer): Boolean;
procedure LuaPushBoolean(L: PLua_State; B: Boolean);
function LuaToInteger(L: PLua_State; Index: Integer): Integer;
procedure LuaPushInteger(L: PLua_State; N: Integer);
function LuaToVariant(L: Plua_State; Index: Integer): Variant;
procedure LuaPushVariant(L: Plua_State; N: Variant);
function LuaToString(L: PLua_State; Index: Integer): string;
procedure LuaPushString(L: PLua_State; const S: string);
function LuaIncIndex(L: Plua_State; Index: Integer): Integer;
function LuaAbsIndex(L: Plua_State; Index: Integer): Integer;
procedure LuaGetTable(L: Plua_State; TableIndex: Integer; const Key: string);
function LuaGetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string): Boolean;
function LuaGetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string): Double;
function LuaGetTableInteger(L: Plua_State; TableIndex: Integer; const Key: string): Integer;
function LuaGetTableString(L: Plua_State; TableIndex: Integer; const Key: string): string;
function LuaGetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string): lua_CFunction;
function LuaGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;
function LuaGetTableTMethod(L: Plua_State; TableIndex: Integer; const Key: string): TMethod;
procedure LuaRawGetTable(L: Plua_State; TableIndex: Integer; const Key: string);
function LuaRawGetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string): Boolean;
function LuaRawGetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string): Double;
function LuaRawGetTableString(L: Plua_State; TableIndex: Integer; const Key: string): string;
function LuaRawGetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string): lua_CFunction;
function LuaRawGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;
procedure LuaSetTableValue(L: PLua_State; TableIndex: Integer; const Key: string; ValueIndex: Integer);
procedure LuaSetTableNil(L: Plua_State; TableIndex: Integer; const Key: string);
procedure LuaSetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string; B: Boolean);
procedure LuaSetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string; N: Double);
procedure LuaSetTableString(L: Plua_State; TableIndex: Integer; const Key: string; S: string);
procedure LuaSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);
procedure LuaSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
procedure LuaSetTableTMethod(L: Plua_State; TableIndex: Integer; const Key: string; M: TMethod);
procedure LuaSetTableClear(L: Plua_State; TableIndex: Integer);
procedure LuaSetTablePropertyFuncs(L: PLua_State; TableIndex: Integer;
  ReadFunc: lua_CFunction;
  WriteFunc: lua_CFunction = nil);
procedure LuaRawSetTableValue(L: PLua_State; TableIndex: Integer; const Key: string; ValueIndex: Integer);
procedure LuaRawSetTableNil(L: Plua_State; TableIndex: Integer; const Key: string);
procedure LuaRawSetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string; B: Boolean);
procedure LuaRawSetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string; N: Double);
procedure LuaRawSetTableString(L: Plua_State; TableIndex: Integer; const Key: string; S: string);
procedure LuaRawSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);
procedure LuaRawSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
procedure LuaRawSetTableClear(L: Plua_State; TableIndex: Integer);
function LuaGetMetaFunction(L: Plua_State; Index: Integer; Key: string): lua_CFunction;
procedure LuaSetMetaFunction(L: Plua_State; Index: Integer; Key: string; F: lua_CFunction);

procedure LuaShowStack(L: Plua_State; Caption: string = '');
function LuaStackToStr(L: Plua_State; Index: Integer; MaxTable: Integer = -1; SubTableMax: Integer = 99): string;
procedure LuaRegisterCustom(L: PLua_State; TableIndex: Integer; const Name: PChar; F: lua_CFunction);
procedure LuaRegister(L: Plua_State; const Name: PChar; F: lua_CFunction);
procedure LuaRegisterMetatable(L: Plua_State; const Name: PChar; F: lua_CFunction);
procedure LuaRegisterProperty(L: PLua_State; const Name: PChar; ReadFunc, WriteFunc: lua_CFunction);
procedure LuaStackToStrings(L: Plua_State; Lines: TStrings; MaxTable: Integer = -1; SubTableMax: Integer = 99);
procedure LuaLocalToStrings(L: Plua_State; Lines: TStrings; MaxTable: Integer = -1; Level: Integer = 0; SubTableMax: Integer = 99);
procedure LuaGlobalToStrings(L: PLua_State; Lines: TStrings; MaxTable: Integer = -1; SubTableMax: Integer = 99);
procedure LuaTableToStrings(L: Plua_State; Index: Integer; Lines: TStrings; MaxTable: Integer = -1; SubTableMax: Integer = 99);
procedure LuaTableToTreeView(L: Plua_State; Index: Integer; TV: TTreeView; MaxTable: Integer = -1; SubTableMax: Integer = 99);
function LuaGetIdentValue(L: Plua_State; Ident: string; MaxTable: Integer = -1): string;
procedure LuaSetIdentValue(L: Plua_State; Ident, Value: string; MaxTable: Integer = -1);
procedure LuaLoadBuffer(L: Plua_State; const Code: string; const Name: string);
procedure LuaLoadBufferFromFile(L: Plua_State; const Filename: string; const Name: string);
procedure LuaPCall(L: Plua_State; NArgs, NResults, ErrFunc: Integer);
function LuaPCallFunction(L: Plua_State; FunctionName: string;
  const Args: array of Variant;
  Results: PVariantArray;
  ErrFunc: Integer = 0;
  NResults: Integer = LUA_MULTRET): Integer;
procedure LuaError(L: Plua_State; const Msg: string);
procedure LuaErrorFmt(L: Plua_State; const Fmt: string; const Args: array of const);
function LuaDataStrToStrings(const TableStr: string; Strings: TStrings): string;
function LuaDoFile(L: Plua_State): Integer; cdecl;

function LuaGetCurrentFuncName(L: Plua_State): string;
function Lua_VoidFunc(L: Plua_State): Integer; cdecl;
procedure CheckArg(L: Plua_State; N: Integer);

const
  LuaGlobalVariableStr = '[LUA_GLOBALSINDEX]';
var
  OnLuaStdoutEx: TOnLuaStdoutEx;
  OnLuaStdout: TOnLuaStdout;
  DefaultMaxTable: Integer;
  SubTableCount: Integer;

implementation

uses
  Dialogs;

const
  QuoteStr = '"';
  CR = #$0D;
  LF = #$0A;
  CRLF = CR + LF;

procedure CheckArg(L: Plua_State; N: Integer);
var
  lN: Integer;
begin
  lN := lua_gettop(L);
  if (lN <> N) then
    luaL_error(L, 'BAD parameter call!');
end;

function Quote(const Str: string): string;
begin
  Result := AnsiQuotedStr(Str, QuoteStr);
end;

function Dequote(const QuotedStr: string): string;
begin
  Result := AnsiDequotedStr(QuotedStr, QuoteStr);
end;

function fwriteex(F, S: PChar; Un, Len: Integer; L, Dummy: Integer): Integer;

var
  Size: Integer;
begin
  Size := Un * Len;
  if (Assigned(OnLuaStdoutEx)) then
    OnLuaStdoutEx(F, S, L, Size);
  Result := Size;
end;

function fwrite(S: PChar; Un, Len: Integer; Dummy: Integer): Integer;
var
  Size: Integer;
begin
  Size := Un * Len;
  if (Assigned(OnLuaStdout)) then
    OnLuaStdout(S, Size);
  Result := Size;
end;

function fputsex(const F, S: string; L, Dummy: Integer): Integer;
begin
  Result := fwriteex(PChar(F), PChar(S), SizeOf(Char), L, Length(S), Dummy);
end;

function fputs(const S: string; Dummy: Integer): Integer;
begin
  Result := fwrite(PChar(S), SizeOf(Char), Length(S), Dummy);
end;

function lua_printex(L: Plua_State): Integer; cdecl;
const
  TAB = #$08;
  NL = #$0A;
  stdout = 0;
var
  N, I: Integer;
  S: PChar;
  Debug: lua_Debug;
  AR: Plua_Debug;
begin
  AR := @Debug;
  lua_getstack(L, 1, AR); {* stack informations *}
  lua_getinfo(L, 'Snlu', AR); {* debug informations *}

  N := lua_gettop(L); (* number of arguments *)
  lua_getglobal(L, 'tostring');

  for I := 1 to N do
  begin
    lua_pushvalue(L, -1); (* function to be called *)
    lua_pushvalue(L, i); (* value to print *)
    lua_call(L, 1, 1);
    S := lua_tostring(L, -1); (* get result *)
    if (S = nil) then
    begin
      Result := luaL_error(L, '`tostring'' must return a string to `print''');
      Exit;
    end;
    if (I > 1) then fputs(TAB, stdout);
    fputsex(AR.source, S, AR.currentline, stdout);
    lua_pop(L, 1); (* pop result *)
  end;

  fputsex(AR.source, NL, AR.currentline, stdout);
  Result := 0;
end;

function lua_print(L: Plua_State): Integer; cdecl;
const
  TAB = #$08;
  NL = #$0A;
  stdout = 0;
var
  N, I: Integer;
  S: PChar;
begin
  N := lua_gettop(L); (* number of arguments *)
  lua_getglobal(L, 'tostring');
  for I := 1 to N do
  begin
    lua_pushvalue(L, -1); (* function to be called *)
    lua_pushvalue(L, i); (* value to print *)
    lua_call(L, 1, 1);
    S := lua_tostring(L, -1); (* get result *)
    if (S = nil) then
    begin
      Result := luaL_error(L, '`tostring'' must return a string to `print''');
      Exit;
    end;
    if (I > 1) then fputs(TAB, stdout);
    fputs(S, stdout);
    lua_pop(L, 1); (* pop result *)
  end;
  fputs(NL, stdout);
  Result := 0;
end;

function lua_io_writeex(L: Plua_State): Integer; cdecl;

  function pushresult(L: Plua_State; I: Boolean; FileName: PChar): Integer;
  begin
    lua_pushboolean(L, 1);
    Result := 1;
  end;
const
  F = 0;
var
  NArgs: Integer;
  Status: Boolean;
  Arg: Integer;
  Len: Integer;
  S: PChar;
  Debug: lua_Debug;
  AR: Plua_Debug;
begin
  AR := @Debug;
  lua_getstack(L, 1, AR); {* stack informations *}
  lua_getinfo(L, 'Snlu', AR); {* debug informations *}

  Arg := 1;
  NArgs := lua_gettop(L);
  Status := True;

  while (NArgs > 0) do
  begin
    Dec(NArgs);
    if (lua_type(L, Arg) = LUA_TNUMBER) then
    begin
      (* optimization: could be done exactly as for strings *)
      Status := Status and
        (fputsex(AR.source, Format(LUA_NUMBER_FMT, [lua_tonumber(L, Arg)]), AR.currentline, 0) > 0);
    end else
    begin
      S := luaL_checklstring(L, Arg, @Len);
      Status := Status and (fwriteex(AR.source, S, SizeOf(Char), Len, AR.currentline, F) = Len);
    end;
    Inc(Arg);
  end;

  Result := pushresult(L, Status, nil);
end;

function lua_io_write(L: Plua_State): Integer; cdecl;

  function pushresult(L: Plua_State; I: Boolean; FileName: PChar): Integer;
  begin
    lua_pushboolean(L, 1);
    Result := 1;
  end;
const
  F = 0;
var
  NArgs: Integer;
  Status: Boolean;
  Arg: Integer;
  Len: Integer;
  S: PChar;
begin
  Arg := 1;
  NArgs := lua_gettop(L);
  Status := True;
  while (NArgs > 0) do
  begin
    Dec(NArgs);
    if (lua_type(L, Arg) = LUA_TNUMBER) then
    begin
      (* optimization: could be done exactly as for strings *)
      Status := Status and
        (fputs(Format(LUA_NUMBER_FMT, [lua_tonumber(L, Arg)]), 0) > 0);
    end else
    begin
      S := luaL_checklstring(L, Arg, @Len);
      Status := Status and (fwrite(S, SizeOf(Char), Len, F) = Len);
    end;
    Inc(Arg);
  end;
  Result := pushresult(L, Status, nil);
end;

function LuaToBoolean(L: PLua_State; Index: Integer): Boolean;
begin
  Result := (lua_toboolean(L, Index) <> 0);
end;

procedure LuaPushBoolean(L: PLua_State; B: Boolean);
begin
  lua_pushboolean(L, Integer(B));
end;

function LuaToInteger(L: PLua_State; Index: Integer): Integer;
begin
  Result := Trunc(lua_tonumber(L, Index)); //Round(lua_tonumber(L, Index));
end;

procedure LuaPushInteger(L: PLua_State; N: Integer);
begin
  lua_pushnumber(L, N);
end;

function LuaToVariant(L: Plua_State; Index: Integer): Variant;
var
  dataType: Integer;
  dataNum: Double;

begin
  dataType := lua_type(L, Index);
  case dataType of
    LUA_TSTRING: Result := VarAsType(LuaToString(L, Index), varString);
    LUA_TUSERDATA,
      LUA_TLIGHTUSERDATA: Result := VarAsType(Integer(lua_touserdata(L, Index)), varInteger);
    LUA_TNONE,
      LUA_TNIL: Result := varNull;
    LUA_TBOOLEAN: Result := VarAsType(LuaToBoolean(L, Index), varBoolean);
    LUA_TNUMBER: begin
        dataNum := lua_tonumber(L, Index);
        if (Abs(dataNum) > MAXINT)
          then Result := VarAsType(dataNum, varDouble)
        else begin
          if (Frac(dataNum) <> 0)
            then Result := VarAsType(dataNum, varDouble)
          else Result := VarAsType(dataNum, varInteger)
        end;
      end;
  end;
end;

procedure LuaPushVariant(L: Plua_State; N: Variant);
begin
  case VarType(N) of
    varEmpty,
      varNull: lua_pushnil(L);
    varBoolean: LuaPushBoolean(L, N);
    varStrArg,
      varOleStr,
      varString: LuaPushString(L, N);
    varDate: LuaPushString(L, DateTimeToStr(VarToDateTime(N)));
  else lua_pushnumber(L, N);
  end;
end;

function LuaToString(L: PLua_State; Index: Integer): string;
var
  Size: Integer;
begin
  Size := lua_strlen(L, Index);
  SetLength(Result, Size);
  if (Size > 0) then
    Move(lua_tostring(L, Index)^, Result[1], Size);
end;

function LuaToPointer(L: Plua_State; Index: Integer): Pointer;
begin
  Result := lua_touserdata(L, Index);
end;

procedure LuaPushPointer(L: Plua_State; P: Pointer);
begin
  lua_pushlightuserdata(L, P);
end;

procedure LuaPushString(L: PLua_State; const S: string);
begin
  lua_pushstring(L, PChar(S));
end;

function LuaIncIndex(L: Plua_State; Index: Integer): Integer;
// 相対インデックス -1 ～ -N へ変換
begin
  if ((Index = LUA_GLOBALSINDEX) or (Index = LUA_REGISTRYINDEX)) then
  begin
    Result := Index;
    Exit;
  end;

  Result := LuaAbsIndex(L, Index) - lua_gettop(L) - 1;
end;

function LuaAbsIndex(L: Plua_State; Index: Integer): Integer;
// 絶対インデックス 1 ～ N へ変換
begin
  if ((Index = LUA_GLOBALSINDEX) or (Index = LUA_REGISTRYINDEX)) then
  begin
    Result := Index;
    Exit;
  end;

  if (Index < 0) then
    Result := Index + lua_gettop(L) + 1
  else
    Result := Index;
end;

procedure LuaPushKeyString(L: PLua_State; var Index: Integer; const Key: string);
begin
  Index := LuaAbsIndex(L, Index);
  lua_pushstring(L, PChar(Key));
end;

procedure LuaGetTable(L: Plua_State; TableIndex: Integer; const Key: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_gettable(L, TableIndex);
end;

function LuaGetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string): Boolean;
begin
  LuaGetTable(L, TableIndex, Key);
  Result := (lua_toboolean(L, -1) <> 0);
  lua_pop(L, 1);
end;

function LuaGetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string): Double;
begin
  LuaGetTable(L, TableIndex, Key);
  Result := lua_tonumber(L, -1);
  lua_pop(L, 1);
end;

function LuaGetTableInteger(L: Plua_State; TableIndex: Integer; const Key: string): Integer;
begin
  LuaGetTable(L, TableIndex, Key);
  Result := LuaToInteger(L, -1);
  lua_pop(L, 1);
end;

function LuaGetTableString(L: Plua_State; TableIndex: Integer; const Key: string): string;
begin
  LuaGetTable(L, TableIndex, Key);
  Result := lua_tostring(L, -1);
  lua_pop(L, 1);
end;

function LuaGetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string): lua_CFunction;
begin
  LuaGetTable(L, TableIndex, Key);
  Result := lua_tocfunction(L, -1);
  lua_pop(L, 1);
end;

function LuaGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;
begin
  LuaGetTable(L, TableIndex, Key);
  Result := lua_touserdata(L, -1);
  lua_pop(L, 1);
end;

function LuaGetTableTMethod(L: Plua_State; TableIndex: Integer; const Key: string): TMethod;
begin
  Result.Code := LuaGetTableLightUserData(L, TableIndex, Key + '_Code'); //Code is the Method Pointer
  Result.Data := LuaGetTableLightUserData(L, TableIndex, Key + '_Data'); //Data is the object Pointer
end;

procedure LuaRawGetTable(L: Plua_State; TableIndex: Integer; const Key: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_rawget(L, TableIndex);
end;

function LuaRawGetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string): Boolean;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := (lua_toboolean(L, -1) <> 0);
  lua_pop(L, 1);
end;

function LuaRawGetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string): Double;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_tonumber(L, -1);
  lua_pop(L, 1);
end;

function LuaRawGetTableString(L: Plua_State; TableIndex: Integer; const Key: string): string;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_tostring(L, -1);
  lua_pop(L, 1);
end;

function LuaRawGetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string): lua_CFunction;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_tocfunction(L, -1);
  lua_pop(L, 1);
end;

function LuaRawGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_touserdata(L, -1);
  lua_pop(L, 1);
end;

procedure LuaSetTableValue(L: PLua_State; TableIndex: Integer; const Key: string; ValueIndex: Integer);
begin
  TableIndex := LuaAbsIndex(L, TableIndex);
  ValueIndex := LuaAbsIndex(L, ValueIndex);
  lua_pushstring(L, PChar(Key));
  lua_pushvalue(L, ValueIndex);
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableNil(L: Plua_State; TableIndex: Integer; const Key: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushnil(L);
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string; B: Boolean);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushboolean(L, Integer(B));
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string; N: Double);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushnumber(L, N);
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableString(L: Plua_State; TableIndex: Integer; const Key: string; S: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushstring(L, PChar(S));
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushcfunction(L, F);
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushlightuserdata(L, P);
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableTMethod(L: Plua_State; TableIndex: Integer; const Key: string; M: TMethod);
begin
  LuaSetTableLightUserData(L, TableIndex, Key + '_Code', M.Code);
  LuaSetTableLightUserData(L, TableIndex, Key + '_Data', M.Data);
end;

procedure LuaSetTableClear(L: Plua_State; TableIndex: Integer);
begin
  TableIndex := LuaAbsIndex(L, TableIndex);

  lua_pushnil(L);
  while (lua_next(L, TableIndex) <> 0) do
  begin
    lua_pushnil(L);
    lua_replace(L, -1 - 1);
    lua_settable(L, TableIndex);
    lua_pushnil(L);
  end;
end;

procedure LuaSetTablePropertyFuncs(L: PLua_State; TableIndex: Integer;
  ReadFunc: lua_CFunction;
  WriteFunc: lua_CFunction = nil);
begin
  if assigned(ReadFunc)
    then LuaSetMetaFunction(L, TableIndex, '__index', ReadFunc);

  if assigned(WriteFunc)
    then LuaSetMetaFunction(L, TableIndex, '__newindex', WriteFunc);
end;

procedure LuaRawSetTableValue(L: PLua_State; TableIndex: Integer; const Key: string; ValueIndex: Integer);
begin
  TableIndex := LuaAbsIndex(L, TableIndex);
  ValueIndex := LuaAbsIndex(L, ValueIndex);
  lua_pushstring(L, PChar(Key));
  lua_pushvalue(L, ValueIndex);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableNil(L: Plua_State; TableIndex: Integer; const Key: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushnil(L);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string; B: Boolean);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushboolean(L, Integer(B));
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string; N: Double);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushnumber(L, N);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableString(L: Plua_State; TableIndex: Integer; const Key: string; S: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushstring(L, PChar(S));
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushcfunction(L, F);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushlightuserdata(L, P);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableClear(L: Plua_State; TableIndex: Integer);
begin
  TableIndex := LuaAbsIndex(L, TableIndex);

  lua_pushnil(L);
  while (lua_next(L, TableIndex) <> 0) do
  begin
    lua_pushnil(L);
    lua_replace(L, -1 - 1);
    lua_rawset(L, TableIndex);
    lua_pushnil(L);
  end;
end;

function LuaGetMetaFunction(L: Plua_State; Index: Integer; Key: string): lua_CFunction;
// メタ関数の取得
begin
  Result := nil;
  Index := LuaAbsIndex(L, Index);
  if (lua_getmetatable(L, Index) = 0) then
    Exit;

  LuaGetTable(L, -1, Key);
  if lua_iscfunction(L, -1) then
    Result := lua_tocfunction(L, -1);
  lua_pop(L, 2);
end;

procedure LuaSetMetaFunction(L: Plua_State; Index: Integer; Key: string; F: lua_CFunction);
// メタ関数の設定
// Key = __add, __sub, __mul, __div, __pow, __unm, __concat,
//       __eq, __lt, __le, __index, __newindex, __call
// [メモ]
// __newindex は 新規代入時しか呼ばれないので注意
// table をグローバル変数とするとこうなる。
//
// a=1  -- (a=nilなので)メタ関数呼び出される
// a=2  -- メタ関数は呼び出されない
// a=3  -- メタ関数は呼び出されない
// a=nil
// a=4  -- (a=nilなので)メタ関数呼び出される
//
// lua 付属の trace-globals では__newindex と __index をセットで上書きして
// グローバル変数へのアクセスをローカル変数へのアクセスに切り替えてグロー
// バル変数の実体は常に table[key] = nil を保たせて __newindex イベントを
// 発生させている。
begin
  Index := LuaAbsIndex(L, Index);
  if (lua_getmetatable(L, Index) = 0) then
    lua_newtable(L);

  LuaRawSetTableFunction(L, -1, Key, F);
  lua_setmetatable(L, Index);
end;

// Convert the last item at 'Index' from the stack to a string
// nil    : nil
// Number : FloatToStr
// Boolean: True/False
// stirng : "..."
// Table  : { Key1=Value Key2=Value }

function LuaStackToStr(L: Plua_State; Index: Integer; MaxTable: Integer; SubTableMax: Integer): string;
var
  pGLobalsIndexPtr: Pointer;

  function TableToStr(Index: Integer): string;
  var
    Key, Value: string;
    Count: Integer;

  begin
    Result := '{ ';
    Count := 0;
    lua_pushnil(L);

    // Go through the current table
    while (lua_next(L, Index) <> 0) do
    begin
      Inc(Count);
      if (Count > MaxTable) then
      begin
        Result := Result + '... ';
        lua_pop(L, 2);
        Break;
      end;

      // Key to string
      if lua_type(L, -2) = LUA_TNUMBER then
        Key := '[' + Dequote(LuaStackToStr(L, -2, MaxTable, SubTableMax)) + ']'
      else
        Key := Dequote(LuaStackToStr(L, -2, MaxTable, SubTableMax));

      // Value to string...
      if ((Key = '_G') or (lua_topointer(L, -1) = pGLobalsIndexPtr)) then
        Value := LuaGlobalVariableStr
      else
        Value := LuaStackToStr(L, -1, MaxTable, SubTableMax);

      if (lua_type(L, -1) = LUA_TFUNCTION) then
        Result := Result + Format('%s()=%p ', [Key, lua_topointer(L, -1)])
      else
        Result := Result + Format('%s=%s ', [Key, Value]);

      // Pop current value from stack leaving current key on top of the stack for lua_next
      lua_pop(L, 1);
    end;

    Result := Result + '}';
  end;

begin
  if (MaxTable < 0) then
    MaxTable := DefaultMaxTable;

  pGLobalsIndexPtr := lua_topointer(L, LUA_GLOBALSINDEX); // Retrieve globals index poiner for later conditions
  lua_checkstack(L, SubTableMax * 3); // Ensure there is enough space on stack to work with according to user's setting
  Index := LuaAbsIndex(L, Index);

  case (lua_type(L, Index)) of
    LUA_TNIL:
      Result := 'nil';
    LUA_TNUMBER:
      Result := Format('%g', [lua_tonumber(L, Index)]);
    LUA_TBOOLEAN:
      Result := BoolToStr(lua_toboolean(L, Index) <> 0, True);
    LUA_TSTRING:
      Result := '"' + lua_tostring(L, Index) + '"';
    LUA_TTABLE:
      begin
        if SubTableCount < SubTableMax then
        begin
          SubTableCount := SubTableCount + 1;
          Result := TableToStr(Index);
          SubTableCount := SubTableCount - 1;
        end
        else
          Result := '[SUB_TABLE_MAX_LEVEL_HAS_BEEN_REACHED]';
      end;
    LUA_TFUNCTION:
      if lua_iscfunction(L, Index) then
        Result := Format('CFUNC:%p', [Pointer(lua_tocfunction(L, Index))])
      else
        Result := Format('FUNC:%p', [lua_topointer(L, Index)]);
    LUA_TUSERDATA:
      Result := Format('USERDATA:%p', [lua_touserdata(L, Index)]);
    LUA_TTHREAD:
      Result := Format('THREAD:%p', [lua_tothread(L, Index)]);
    LUA_TLIGHTUSERDATA:
      Result := Format('LIGHTUSERDATA:%p', [lua_touserdata(L, Index)]);
  else
    Assert(False);
  end;
end;

procedure LuaShowStack(L: Plua_State; Caption: string);
var
  I, N: Integer;
  S: string;
begin
  N := lua_gettop(L);
  S := '[' + Caption + ']';
  for I := N downto 1 do
  begin
    S := S + CRLF + Format('%3d,%3d:%s', [LuaAbsIndex(L, I), LuaIncIndex(L, I),
      LuaStackToStr(L, I, -1)]);
  end;
  ShowMessage(S);
end;

procedure LuaProcessTableName(L: Plua_State; const Name: PChar;
  var LastName: string; var TableIndex, Count: Integer);
// Name のテーブル要素をスタックに積んで、
// スタックに積んだ数と Name の最終要素の名前とその親テーブルのインデックスを返す
// テーブルが無い場合は作成する
// LuaProcessTableName(L, 'print', S, TI, Count) → S = print, TI = LUA_GLOBALSINDEX, Count = 0
// LuaProcessTableName(L, 'io.write', S, TI, Count) → S = write, TI -> io, Count = 1
// LuaProcessTableName(L, 'a.b.c.func', S, TI, Count) → S = func, TI -> a.b.c, Count = 3

var
  S: string;

  function GetToken: string;
  var
    Index: Integer;
  begin
    Index := Pos('.', S);
    if (Index = 0) then
    begin
      Result := S;
      S := '';
      Exit;
    end;
    Result := Copy(S, 1, Index - 1);
    S := Copy(S, Index + 1, Length(S));
  end;

begin
  S := Name;
  Count := 0;

  LastName := GetToken;
  while (S <> '') do
  begin
    Inc(Count);
    TableIndex := LuaAbsIndex(L, TableIndex);
    LuaGetTable(L, TableIndex, LastName);
    if (lua_type(L, -1) <> LUA_TTABLE) then
    begin
      lua_pop(L, 1);
      lua_pushstring(L, PChar(LastName));
      lua_newtable(L);
      lua_rawset(L, TableIndex);
      LuaGetTable(L, TableIndex, LastName);
    end;
    TableIndex := -1;
    LastName := GetToken;
  end;
end;

procedure LuaRegisterCustom(L: PLua_State; TableIndex: Integer; const Name: PChar; F: lua_CFunction);
var
  Count: Integer;
  S: string;
begin
  LuaProcessTableName(L, Name, S, TableIndex, Count);
  LuaRawSetTableFunction(L, TableIndex, S, F);
  lua_pop(L, Count);
end;

procedure LuaRegister(L: Plua_State; const Name: PChar; F: lua_CFunction);
// 関数の登録
// LuaRegister(L, 'print', lua_print);
// LuaRegister(L, 'io.write', lua_io_write);  // テーブル io が無い場合は作成
// LuaRegister(L, 'a.b.c.func', a_b_c_func);  // テーブル a.b.c が無い場合は作成
begin
  LuaRegisterCustom(L, LUA_GLOBALSINDEX, Name, F);
end;

procedure LuaRegisterMetatable(L: Plua_State; const Name: PChar; F: lua_CFunction);
begin
  LuaRegisterCustom(L, LUA_REGISTRYINDEX, Name, F);
end;

procedure LuaRegisterProperty(L: PLua_State; const Name: PChar; ReadFunc, WriteFunc: lua_CFunction);
var
  Count: Integer;
  TI: Integer;
  S: string;
begin
  TI := LUA_GLOBALSINDEX;
  LuaProcessTableName(L, Name, S, TI, Count);
  TI := LuaAbsIndex(L, TI);

  LuaGetTable(L, TI, S);
  if (lua_type(L, -1) <> LUA_TTABLE) then
  begin
    lua_pop(L, 1);
    lua_pushstring(L, PChar(S));
    lua_newtable(L);
    lua_settable(L, TI);
    LuaGetTable(L, TI, S);
  end;
  if (Assigned(ReadFunc)) then
    LuaSetMetaFunction(L, -1, '__index', ReadFunc);
  if (Assigned(WriteFunc)) then
    LuaSetMetaFunction(L, -1, '__newindex', WriteFunc);
  lua_pop(L, Count + 1);
end;

procedure LuaStackToStrings(L: Plua_State; Lines: TStrings; MaxTable: Integer = -1; SubTableMax: Integer = 99);
var
  I: Integer;
begin
  Lines.Clear;
  for I := lua_gettop(L) downto 1 do
    Lines.Add(LuaStackToStr(L, I, MaxTable, SubTableMax));
end;

procedure LuaLocalToStrings(L: Plua_State; Lines: TStrings; MaxTable: Integer; Level: Integer; SubTableMax: Integer);
var
  Name: PChar;
  Index: Integer;
  Debug: lua_Debug;
  AR: Plua_Debug;
begin
  AR := @Debug;
  Lines.Clear;
  Index := 1;
  if (lua_getstack(L, Level, AR) = 0) then
    Exit;

  Name := lua_getlocal(L, AR, Index);
  while (Name <> nil) do
  begin
    Lines.Values[Name] := LuaStackToStr(L, -1, MaxTable, SubTableMax);
    lua_pop(L, 1);
    Inc(Index);
    Name := lua_getlocal(L, AR, Index);
  end;
end;

procedure LuaGlobalToStrings(L: PLua_State; Lines: TStrings; MaxTable: Integer; SubTableMax: Integer);
begin
  lua_pushvalue(L, LUA_GLOBALSINDEX);
  LuaTableToStrings(L, -1, Lines, MaxTable, SubTableMax);
  lua_pop(L, 1);
end;

procedure LuaTableToStrings(L: Plua_State; Index: Integer; Lines: TStrings; MaxTable: Integer; SubTableMax: Integer);
var
  Key, Value: string;
begin
  Index := LuaAbsIndex(L, Index);
  Lines.Clear;

  lua_pushnil(L);
  while (lua_next(L, Index) <> 0) do
  begin
    Key := Dequote(LuaStackToStr(L, -2, MaxTable, SubTableMax));
    Value := LuaStackToStr(L, -1, MaxTable, SubTableMax);
    Lines.Values[Key] := Value;
    lua_pop(L, 1);
  end;
end;

procedure LuaTableToTreeView(L: Plua_State; Index: Integer; TV: TTreeView; MaxTable: Integer; SubTableMax: Integer);
var
  pGLobalsIndexPtr: Pointer;

  // Go through all child of current table and create nodes
  procedure ParseTreeNode(TreeNode: TTreeNode; Index: Integer);
  var
    Key: string;
  begin
    Index := LuaAbsIndex(L, Index);

    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do
    begin
      Key := Dequote(LuaStackToStr(L, -2, MaxTable, SubTableMax));
      if (lua_type(L, -1) <> LUA_TTABLE) then
        TV.Items.AddChild(TreeNode, Key + '=' + LuaStackToStr(L, -1, MaxTable, SubTableMax))
      else
      begin
        if ((Key = '_G') or (lua_topointer(L, -1) = pGLobalsIndexPtr)) then
        begin
          TV.Items.AddChild(TreeNode, Key + '=[LUA_GLOBALSINDEX]')
        end
        else
        begin
          if SubTableCount < SubTableMax then
          begin
            SubTableCount := SubTableCount + 1;
            ParseTreeNode(TV.Items.AddChild(TreeNode, Key), -1);
            SubTableCount := SubTableCount - 1;
          end;
        end;
      end;
      lua_pop(L, 1);
    end;
  end;
begin
  Assert(lua_type(L, Index) = LUA_TTABLE);
  TV.Items.BeginUpdate;
  TV.Items.Clear;
  try
    ParseTreeNode(nil, Index);
  finally
    TV.Items.EndUpdate;
  end;
end;

function LuaGetIdentValue(L: Plua_State; Ident: string; MaxTable: Integer): string;
const
  DebugValue = '___DEBUG_VALUE___';
var
  Local: TStrings;
  Code: string;
  Hook: lua_Hook;
  Mask: Integer;
  Count: Integer;
begin
  if (Ident = '') then
  begin
    Result := '';
    Exit;
  end;

  Local := TStringList.Create;
  try
    LuaLocalToStrings(L, Local, MaxTable);
    Result := Local.Values[Ident];
    if (Result <> '') then
      Exit;
  finally
    Local.Free;
  end;

  Code := DebugValue + '=' + Ident;
  luaL_loadbuffer(L, PChar(Code), Length(Code), 'debug');
  Hook := lua_gethook(L);
  Mask := lua_gethookmask(L);
  Count := lua_gethookcount(L);
  lua_sethook(L, Hook, 0, Count);
  if (lua_pcall(L, 0, 0, 0) = 0) then
    LuaRawGetTable(L, LUA_GLOBALSINDEX, DebugValue);
  Result := LuaStackToStr(L, -1, MaxTable);
  lua_remove(L, -1);
  lua_dostring(L, DebugValue + '=nil');
  lua_sethook(L, Hook, Mask, Count);
end;

procedure LuaSetIdentValue(L: Plua_State; Ident, Value: string; MaxTable: Integer);
var
  Local: TStrings;
  Code: string;
  Index: Integer;
  Debug: lua_Debug;
  AR: Plua_Debug;
begin
  Local := TStringList.Create;
  try
    AR := @Debug;
    LuaLocalToStrings(L, Local, MaxTable);
    Index := Local.IndexOf(Ident);
    if (Index >= 0) then
    begin
      try
        lua_pushnumber(L, StrToFloat(Value));
      except
        lua_pushstring(L, PChar(Dequote(Value)));
      end;
      lua_getstack(L, 0, AR);
      lua_getinfo(L, 'Snlu', AR);
      lua_setlocal(L, AR, Index + 1);
    end else
    begin
      Code := Ident + '=' + Value;
      luaL_loadbuffer(L, PChar(Code), Length(Code), 'debug');
      if (lua_pcall(L, 0, 0, 0) <> 0) then
        lua_remove(L, -1);
    end;
  finally
    Local.Free;
  end;
end;

procedure LuaProcessErrorMessage(const ErrMsg: string; var Title: string; var Line: Integer; var Msg: string);
const
  Term = #$00;
  function S(Index: Integer): Char;
  begin
    if (Index <= Length(ErrMsg)) then
      Result := ErrMsg[Index]
    else
      Result := Term;
  end;
  function IsDigit(C: Char): Boolean;
  begin
    Result := ('0' <= C) and (C <= '9');
  end;
  function PP(var Index: Integer): Integer;
  begin
    Inc(Index);
    Result := Index;
  end;
var
  I, Start, Stop: Integer;
  LS: string;
  Find: Boolean;
begin
  // ErrMsg = Title:Line:Message
  Title := '';
  Line := 0;
  Msg := ErrMsg;
  Find := False;
  I := 1 - 1;
  Stop := 0;
  // :数値: を探す
  repeat
    while (S(PP(I)) <> ':') do
      if (S(I) = Term) then
        Exit;
    Start := I;
    if (not IsDigit(S(PP(I)))) then
      Continue;
    while (IsDigit(S(PP(I)))) do
      if (S(I - 1) = Term) then
        Exit;
    Stop := I;
    if (S(I) = ':') then
      Find := True;
  until (Find);
  Title := Copy(ErrMsg, 1, Start - 1);
  LS := Copy(ErrMsg, Start + 1, Stop - Start - 1);
  Line := StrToIntDef(LS, 0);
  Msg := Copy(ErrMsg, Stop + 1, Length(ErrMsg));
end;

procedure LuaLoadBuffer(L: Plua_State; const Code: string; const Name: string);
var
  Title, Msg: string;
  Line: Integer;
begin
  if (luaL_loadbuffer(L, PChar(Code), Length(Code), PChar(Name)) = 0) then
    Exit;

  LuaProcessErrorMessage(LuaStackToStr(L, -1, -1), Title, Line, Msg);
  raise ELuaException.Create(Title, Line, Msg);
end;

procedure LuaLoadBufferFromFile(L: Plua_State; const Filename: string; const Name: string);
var
  xCode: string;
  xFile: TStringList;

begin
  xFile := TStringList.Create;
  xFile.LoadFromFile(FileName);
  xCode := xFile.Text;
  xFile.Free;
  LuaLoadBuffer(L, xCode, Name);
end;

procedure LuaPCall(L: Plua_State; NArgs, NResults, ErrFunc: Integer);
var
  Title, Msg: string;
  Line: Integer;
begin
  if (lua_pcall(L, NArgs, NResults, ErrFunc) = 0) then
    Exit;

  LuaProcessErrorMessage(Dequote(LuaStackToStr(L, -1, -1)),
    Title, Line, Msg);
  raise ELuaException.Create(Title, Line, Msg);
end;

function LuaPCallFunction(L: Plua_State; FunctionName: string;
  const Args: array of Variant;
  Results: PVariantArray;
  ErrFunc: Integer = 0;
  NResults: Integer = LUA_MULTRET): Integer;
var
  NArgs, i: Integer;

begin
     //Put Function To Call on the Stack
  luaPushString(L, FunctionName);
  lua_gettable(L, LUA_GLOBALSINDEX);

     //Put Parameters on the Stack
  NArgs := High(Args) + 1;
  for i := 0 to (NArgs - 1) do
    LuaPushVariant(L, Args[i]);

     //Call the Function
  LuaPcall(L, NArgs, NResults, ErrFunc);
  Result := lua_gettop(L); //Get Number of Results

  if (Results <> nil)
    then begin
               //Get Results in the right order
    SetLength(Results^, Result);
    for i := 0 to Result - 1 do
    begin
      Results^[Result - (i + 1)] := LuaToVariant(L, -(i + 1));
    end;
  end;
end;

procedure LuaError(L: Plua_State; const Msg: string);
begin
  luaL_error(L, PChar(Msg));
end;

procedure LuaErrorFmt(L: Plua_State; const Fmt: string; const Args: array of const);
begin
  LuaError(L, Format(Fmt, Args));
end;

{ ELuaException }

constructor ELuaException.Create(Title: string; Line: Integer;
  Msg: string);
var
  LS: string;
begin
  if (Line > 0) then
    LS := Format('(%d)', [Line])
  else
    LS := '';
  inherited Create(Title + LS + Msg);
  Self.Title := Title;
  Self.Line := Line;
  Self.Msg := Msg;
end;

function LuaDataStrToStrings(const TableStr: string; Strings: TStrings): string;
(*
  LuaStackToStr 形式から Strings.Values[Name] 構造へ変換
  TableStr
  { Name = "Lua" Version = 5.0 }
  ↓
  Strings
  Name="Lua"
  Version=5.0

  DataList  : Data DataList
            |

  Data      : Table
            | {グローバル変数}
            | Ident ( )
            | Ident = Value
            | Ident
            |

  Table     : { DataList }
            |

  Value     : "..."
            | Data

*)
const
  EOF = #$00;
var
  Index: Integer;
  Text: string;
  Token: Char;
  function S(Index: Integer): Char;
  begin
    if (Index <= Length(TableStr)) then
      Result := TableStr[Index]
    else
      Result := EOF;
  end;
  function GetString: string;
  var
    SI: Integer;
  begin
    Dec(Index);
    Result := '';
    repeat
      Assert(S(Index) = '"');
      SI := Index;
      Inc(Index);
      while (S(Index) <> '"') do
        Inc(Index);
      Result := Result + Copy(TableStr, SI, Index - SI + 1);
      Inc(Index);
    until (S(Index) <> '"');
  end;
  function GetValue: string;
    function IsIdent(C: Char): Boolean;
    const
      S = ' =(){}' + CR + LF;
    begin
      Result := (Pos(C, S) = 0);
    end;
  var
    SI: Integer;
  begin
    Dec(Index);
    SI := Index;
    while (IsIdent(S(Index))) do
      Inc(Index);
    Result := Copy(TableStr, SI, Index - SI);
  end;
  function GetToken: Char;
    function SkipSpace(var Index: Integer): Integer;
    const
      TAB = #$09;
      CR = #$0D;
      LF = #$0A;
    begin
      while (S(Index) in [' ', TAB, CR, LF]) do
        Inc(Index);
      Result := Index;
    end;
  begin
    SkipSpace(Index);
    Token := S(Index);
    Inc(Index);
    Text := Token;
    case (Token) of
      EOF: ;
      '"': Text := GetString;
      '{':
        if (Copy(TableStr, Index - 1, Length(LuaGlobalVariableStr)) = LuaGlobalVariableStr) then
        begin
          Token := 'G';
          Text := LuaGlobalVariableStr;
          Inc(Index, Length(LuaGlobalVariableStr) - 1);
        end;
      '}': ;
      '(': ;
      ')': ;
      '=': ;
    else Text := GetValue
    end;
    Result := Token;
  end;
  procedure Check(S: string);
  begin
    if (Pos(Token, S) = -1) then
      raise Exception.CreateFmt('Error %s is required :%s', [Copy(TableStr, Index - 1, Length(TableStr))]);
  end;
  function CheckGetToken(S: string): Char;
  begin
    Result := GetToken;
    Check(S);
  end;
  function ParseData: string; forward;
  function ParseTable: string; forward;
  function ParseValue: string; forward;
  function ParseDataList: string;
  begin
    with (TStringList.Create) do
    try
      while not (Token in [EOF, '}']) do
        Add(ParseData);
      Result := Text;
    finally
      Free;
    end;
  end;
  function ParseData: string;
  begin
    if (Token = EOF) then
    begin
      Result := '';
      Exit;
    end;

    case (Token) of
      '{': Result := ParseTable;
      'G':
        begin
          Result := Text;
          GetToken;
        end;
    else
      begin
        Result := Text;
        case (GetToken) of
          '(':
            begin
              CheckGetToken(')');
              Result := Format('%s=()', [Result]);
              GetToken;
            end;
          '=':
            begin
              GetToken;
              Result := Format('%s=%s', [Result, ParseValue]);
            end;
        end;
      end;
    end;
  end;
  function ParseTable: string;
  begin
    if (Token in [EOF]) then
    begin
      Result := '';
      Exit;
    end;
    Check('{');
    GetToken;
    with (TStringList.Create) do
    try
      Text := ParseDataList;
      Result := CommaText;
    finally
      Free;
    end;
    Check('}');
    GetToken;
  end;
  function ParseValue: string;
  begin
    if (Token = EOF) then
    begin
      Result := '';
      Exit;
    end;

    case (Token) of
      '"':
        begin
          Result := Text;
          GetToken;
        end;
    else
      Result := ParseData;
    end;
  end;
begin
  Index := 1;
  GetToken;
  Strings.Text := ParseDataList;
end;

function LuaDoFile(L: Plua_State): Integer; cdecl;
// dofile 引数(arg)戻り値付き
// Lua: DoFile(FileName, Args...)
const
  ArgIdent = 'arg';
var
  FileName: PChar;
  I, N, R: Integer;
  ArgTable, ArgBackup: Integer;
begin
  N := lua_gettop(L);

  // arg, result の保存
  lua_getglobal(L, ArgIdent);
  ArgBackup := lua_gettop(L);

  FileName := luaL_checkstring(L, 1);
  lua_newtable(L);
  ArgTable := lua_gettop(L);
  for I := 2 to N do
  begin
    lua_pushvalue(L, I);
    lua_rawseti(L, ArgTable, I - 1);
  end;
  lua_setglobal(L, ArgIdent);

  Result := lua_gettop(L);
  luaL_loadfile(L, PChar(FileName));
  R := lua_pcall(L, 0, LUA_MULTRET, 0);
  Result := lua_gettop(L) - Result;

  LuaRawSetTableValue(L, LUA_GLOBALSINDEX, ArgIdent, ArgBackup);
  lua_remove(L, ArgBackup);

  if (R <> 0) then
    lua_error(L);
end;

function LuaGetCurrentFuncName(L: Plua_State): string;
var
  ar: lua_Debug;

begin
  FillChar(ar, sizeof(ar), 0);
  Result := '';

  if (lua_getStack(L, 0, @ar) = 1)
    then begin
    lua_getinfo(L, 'n', @ar);
    Result := ar.name;
  end;
end;

function Lua_VoidFunc(L: Plua_State): Integer; cdecl;
begin
  Result := 0;
end;

initialization
  DefaultMaxTable := 256;

end.

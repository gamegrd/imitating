(*
** $Id: lauxlib.pas,v 1.3 2006/11/17 00:02:16 jfgoulet Exp $
** Auxiliary functions for building Lua libraries
** See Copyright Notice in lua.h
**
**   Translation form C and Delphi adaptation of Code : Massimo Magnano 2006
*)
unit lauxlib;

{$IFNDEF lauxlib_h}
{$DEFINE lauxlib_h}
{$ENDIF}

interface

uses lua, luaconf;

{$IFDEF LUA_COMPAT_GETN}
function luaL_getn(L: Plua_State; t: Integer): Integer; cdecl external LUA_DLL;
procedure luaL_setn(L: Plua_State; t: Integer; n: Integer); cdecl external LUA_DLL;
{$ELSE}
function luaL_getn(L: Plua_State; t: Integer): Integer;
procedure luaL_setn(L: Plua_State; t: Integer; n: Integer);
{$ENDIF}

{$IFDEF LUA_COMPAT_OPENLIB}
procedure luaL_openlib(L: Plua_State; libname: PChar;
  R: PluaL_reg; Nup: Integer); cdecl external LUA_DLL name 'luaI_openlib';
{$ENDIF}

const
  LUA_ERRFILE = (LUA_ERRERR + 1);

type
  luaL_Reg = record
    name: PChar;
    func: lua_CFunction;
  end;
  PluaL_Reg = ^luaL_Reg;

procedure luaL_openlib(L: Plua_State; libname: PChar; R: PluaL_reg; nup: Integer); cdecl external LUA_DLL;
procedure luaL_register(L: Plua_State; libname: PChar; const R: PluaL_reg); cdecl external LUA_DLL;
function luaL_getmetafield(L: Plua_State; obj: Integer; const e: PChar): Integer; cdecl external LUA_DLL;
function luaL_callmeta(L: Plua_State; obj: Integer; const e: PChar): Integer; cdecl external LUA_DLL;
function luaL_typerror(L: Plua_State; narg: Integer; const tname: PChar): Integer; cdecl external LUA_DLL;
function luaL_argerror(L: Plua_State; numarg: Integer; const extramsg: PChar): Integer; cdecl external LUA_DLL;
function luaL_checklstring(L: Plua_State; numArg: Integer; s: Psize_t): PChar; cdecl external LUA_DLL;
function luaL_optlstring(L: Plua_State; numArg: Integer;
  const def: PChar; s: Psize_t): PChar; cdecl external LUA_DLL;
function luaL_checknumber(L: Plua_State; numArg: Integer): LUA_NUMBER; cdecl external LUA_DLL;
function luaL_optnumber(L: Plua_State; nArg: Integer; def: LUA_NUMBER): LUA_NUMBER; cdecl external LUA_DLL;

function luaL_checkinteger(L: Plua_State; numArg: Integer): LUA_INTEGER; cdecl external LUA_DLL;
function luaL_optinteger(L: Plua_State; nArg: Integer; def: LUA_INTEGER): LUA_INTEGER; cdecl external LUA_DLL;

procedure luaL_checkstack(L: Plua_State; sz: Integer; const msg: PChar); cdecl external LUA_DLL;
procedure luaL_checktype(L: Plua_State; narg, t: Integer); cdecl external LUA_DLL;
procedure luaL_checkany(L: Plua_State; narg: Integer); cdecl external LUA_DLL;

function luaL_newmetatable(L: Plua_State; const tname: PChar): Integer; cdecl external LUA_DLL;
function luaL_checkudata(L: Plua_State; ud: Integer; const tname: PChar): Pointer; cdecl external LUA_DLL;

procedure luaL_where(L: Plua_State; lvl: Integer); cdecl external LUA_DLL;
function luaL_error(L: Plua_State; const fmt: PChar): Integer; varargs; cdecl external LUA_DLL;

function luaL_checkoption(L: Plua_State; narg: Integer; def: PChar; lst: array of PChar): Integer; cdecl external LUA_DLL;

function luaL_ref(L: Plua_State; t: Integer): Integer; cdecl external LUA_DLL;
procedure luaL_unref(L: Plua_State; t: Integer; ref: Integer); cdecl external LUA_DLL;

function luaL_loadfile(L: Plua_State; const fileName: PChar): Integer; cdecl external LUA_DLL;
function luaL_loadbuffer(L: Plua_State; const buff: PChar; sz: size_t;
  const name: PChar): Integer; cdecl external LUA_DLL;
function luaL_loadstring(L: Plua_State; const s: PChar): Integer; cdecl external LUA_DLL;

function luaL_newstate: Plua_State; cdecl external LUA_DLL;

function luaL_gsub(L: Plua_State; const s, p, r: PChar): PChar; cdecl external LUA_DLL;

function luaL_findtable(L: Plua_State; idx: Integer; const fname: PChar; szhint: Integer): PChar; cdecl external LUA_DLL;

(*
** ===============================================================
** some useful macros
** ===============================================================
*)

function luaL_argcheck(L: Plua_State; Cond: Boolean; NumArg: Integer; const ExtraMsg: PChar): Integer;
function luaL_checkstring(L: Plua_State; N: Integer): PChar;
function luaL_optstring(L: Plua_State; N: Integer; const D: PChar): PChar;
function luaL_checkint(L: Plua_State; narg: Integer): Integer;
function luaL_optint(L: Plua_State; narg: Integer; D: Integer): Integer;
function luaL_checklong(L: Plua_State; narg: Integer): LongInt;
function luaL_optlong(L: Plua_State; narg: Integer; d: Longint): Longint;

function luaL_typename(L: Plua_State; i: Integer): PChar;

function luaL_dofile(L: Plua_State; fn: PChar): Integer;

function luaL_dostring(L: Plua_State; s: PChar): Integer;

procedure luaL_getmetatable(L: Plua_State; const TName: PChar);

type
  luaL_optFunction = function(L: Plua_State; n: Integer): Integer; cdecl;

function luaL_opt(L: Plua_State; f: luaL_optFunction; n, d: Integer): Integer;

(*
** {======================================================
** Generic Buffer manipulation
** =======================================================
*)

type
  luaL_Buffer = record
    p: PChar; (* current position in buffer *)
    lvl: Integer; (* number of strings in the stack(level) *)
    L: Plua_State;
    buffer: array[0..LUAL_BUFFERSIZE - 1] of Char;
  end;
  PluaL_Buffer = ^luaL_Buffer;

procedure luaL_addchar(B: PluaL_Buffer; c: Char);

(* compatibility only *)
procedure luaL_putchar(B: PluaL_Buffer; c: Char);

function luaL_addsize(B: PLuaL_Buffer; N: Integer): PChar;

procedure luaL_buffinit(L: Plua_State; B: PluaL_Buffer); cdecl external LUA_DLL;
function luaL_prepbuffer(B: PluaL_Buffer): PChar; cdecl external LUA_DLL;
procedure luaL_addlstring(B: PluaL_Buffer; const s: PChar; l: size_t); cdecl external LUA_DLL;
procedure luaL_addstring(B: PluaL_Buffer; const s: PChar); cdecl external LUA_DLL;
procedure luaL_addvalue(B: PluaL_Buffer); cdecl external LUA_DLL;
procedure luaL_pushresult(B: PluaL_Buffer); cdecl external LUA_DLL;

function lua_dofile(L: Plua_State; const FileName: PChar): Integer;
function lua_dostring(L: Plua_State; const Str: PChar): Integer;
function lua_dobuffer(L: Plua_State; const Buff: PChar; SZ: size_t;
  const N: PChar): Integer;

(* }====================================================== *)

(* Compatibility with ref system *)
const
  LUA_NOREF = -2;
  LUA_REFNIL = -1;

function lua_ref(L: Plua_State; lock: Boolean): Integer;

procedure lua_unref(L: Plua_State; ref: Integer);

procedure lua_getref(L: Plua_State; ref: Integer);

implementation

{$IFNDEF LUA_COMPAT_GETN}

function luaL_getn(L: Plua_State; t: Integer): Integer;
begin
  Result := lua_objlen(L, t)
end;

procedure luaL_setn(L: Plua_State; t: Integer; n: Integer);
begin
end;
{$ENDIF}

(*
** ===============================================================
** some useful macros
** ===============================================================
*)

function luaL_argcheck(L: Plua_State; Cond: Boolean; NumArg: Integer; const ExtraMsg: PChar): Integer;
begin
  Result := 0;
  if not (Cond)
    then Result := luaL_argerror(L, NumArg, ExtraMsg)
end;

function luaL_checkstring(L: Plua_State; N: Integer): PChar;
begin
  Result := luaL_checklstring(L, N, nil);
end;

function luaL_optstring(L: Plua_State; N: Integer; const D: PChar): PChar;
begin
  Result := luaL_optlstring(L, N, D, nil);
end;

function luaL_checkint(L: Plua_State; narg: Integer): Integer;
begin
  Result := luaL_checkinteger(L, narg);
end;

function luaL_optint(L: Plua_State; narg: Integer; D: Integer): Integer;
begin
  Result := luaL_optinteger(L, narg, D);
end;

function luaL_checklong(L: Plua_State; narg: Integer): Longint;
begin
  Result := LongInt(luaL_checkinteger(L, narg));
  //old code : Result := Trunc(luaL_checknumber(L, narg));
end;

function luaL_optlong(L: Plua_State; narg: Integer; d: Longint): Longint;
begin
  Result := LongInt(luaL_optinteger(L, narg, D));
  //old code : Result := Trunc(luaL_optnumber(L, narg, D));
end;

function luaL_typename(L: Plua_State; i: Integer): PChar;
begin
  Result := lua_typename(L, lua_type(L, i));
end;

function luaL_dofile(L: Plua_State; fn: PChar): Integer;
begin
  Result := luaL_loadfile(L, fn);
  if (Result = 0)
    then Result := lua_pcall(L, 0, LUA_MULTRET, 0);
end;

function luaL_dostring(L: Plua_State; s: PChar): Integer;
begin
  Result := luaL_loadstring(L, s);
  if (Result = 0)
    then Result := lua_pcall(L, 0, LUA_MULTRET, 0);
end;

procedure luaL_getmetatable(L: Plua_State; const TName: PChar);
begin
  lua_getfield(L, LUA_REGISTRYINDEX, TName);
end;

function luaL_opt(L: Plua_State; f: luaL_optFunction; n, d: Integer): Integer;
begin
  if lua_isnoneornil(L, n)
    then Result := d
  else Result := f(L, n);
end;

(*
** {======================================================
** Generic Buffer manipulation
** =======================================================
*)

procedure luaL_addchar(B: PluaL_Buffer; C: Char);
begin
  if ((B.P <= @B.Buffer[High(B.Buffer)]) or (luaL_prepbuffer(B) <> #0)) then
  begin
    B.P^ := C;
    Inc(B.P);
  end;
end;

procedure luaL_putchar(B: PluaL_Buffer; c: Char);
begin
  luaL_addchar(B, C);
end;

function luaL_addsize(B: PLuaL_Buffer; N: Integer): PChar;
begin
  Inc(B.P, N);
  Result := B.P;
end;

function lua_dofile(L: Plua_State; const FileName: PChar): Integer;
begin
  Result := luaL_dofile(L, FileName);
end;

function lua_dostring(L: Plua_State; const Str: PChar): Integer;
begin
  Result := luaL_dostring(L, Str);
end;

function lua_dobuffer(L: Plua_State; const Buff: PChar; SZ: size_t;
  const N: PChar): Integer;
begin
  Result := luaL_loadbuffer(L, Buff, SZ, N);
  if (Result = 0)
    then Result := lua_pcall(L, 0, LUA_MULTRET, 0);
end;

(* compatibility with ref system *)

function lua_ref(L: Plua_State; lock: Boolean): Integer;
begin
  if lock
    then Result := luaL_ref(L, LUA_REGISTRYINDEX)
  else begin
    lua_pushstring(L, 'unlocked references are obsolete');
    lua_error(L);
    Result := 0;
  end;
end;

procedure lua_unref(L: Plua_State; ref: Integer);
begin
  luaL_unref(L, LUA_REGISTRYINDEX, ref);
end;

procedure lua_getref(L: Plua_State; ref: Integer);
begin
  lua_rawgeti(L, LUA_REGISTRYINDEX, ref);
end;

end.

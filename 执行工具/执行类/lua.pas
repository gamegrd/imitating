(*
** $Id: lua.h,v 1.175 2003/03/18 12:31:39 roberto Exp $
** Lua - An Extensible Extension Language
** Tecgraf: Computer Graphics Technology Group, PUC-Rio, Brazil
** http://www.lua.org	mailto:info@lua.org
** See Copyright Notice at the end of this file
*)
unit lua;

{$IFNDEF lua_h}
{$DEFINE lua_h}
{$ENDIF}

interface

const
 CONST_LUA_VERSION = 'Lua 5.0';
 CONST_LUA_COPYRIGHT = 'Copyright (C) 1994-2003 Tecgraf, PUC-Rio';
 CONST_LUA_AUTHORS = 'R. Ierusalimschy, L. H. de Figueiredo & W. Celes';

(* option for multiple returns in `lua_pcall' and `lua_call' *)
 LUA_MULTRET = (-1);


(*
** pseudo-indices
*)
  LUA_REGISTRYINDEX = (-10000);
  LUA_GLOBALSINDEX = (-10001);

  function lua_upvalueindex(I: Integer): Integer;

const

(* error codes for `lua_load' and `lua_pcall' *)
  LUA_ERRRUN = 1;
  LUA_ERRFILE = 2;
  LUA_ERRSYNTAX = 3;
  LUA_ERRMEM = 4;
  LUA_ERRERR = 5;


type
  lua_State = record
  end;
  Plua_State = ^lua_State;

  lua_CFunction = function (L: Plua_State): Integer; cdecl;
  size_t = Integer;
  Psize_t = ^size_t;

(*
** functions that read/write blocks when loading/dumping Lua chunks
*)
  lua_Chunkreader = function (L: Plua_State; UD: Pointer; var SZ: size_t): PChar;
  lua_Chunkwriter = function (L: Plua_State; const P: Pointer; SZ: size_t; UD: Pointer): Integer;

const
(*
** basic types
*)
  LUA_TNONE = (-1);

  LUA_TNIL = 0;
  LUA_TBOOLEAN = 1;
  LUA_TLIGHTUSERDATA = 2;
  LUA_TNUMBER = 3;
  LUA_TSTRING = 4;
  LUA_TTABLE = 5;
  LUA_TFUNCTION = 6;
  LUA_TUSERDATA = 7;
  LUA_TTHREAD = 8;


(* minimum Lua stack available to a C function *)
  LUA_MINSTACK = 20;


(*
** generic extra include file
*)
{$IFDEF LUA_USER_H}
{$INCLUDE} LUA_USER_H
{$ENDIF}


(* type of numbers in Lua *)
type
{$IFNDEF LUA_NUMBER}
  lua_Number = Double;
{$ELSE}
  lua_Number = LUA_NUMBER;
{$ENDIF}


(* mark for all API functions *)


(*
** state manipulation
*)
function lua_open: Plua_State;
  cdecl external 'thook.dll';
procedure lua_close(L: Plua_State);
  cdecl external 'thook.dll';
function lua_newthread(L: Plua_State): Plua_State;
  cdecl external 'thook.dll';

function lua_atpanic(L: Plua_State; Panicf: lua_CFunction): lua_CFunction;
  cdecl external 'thook.dll';


(*
** basic stack manipulation
*)
function lua_gettop(L: Plua_State): Integer;
  cdecl external 'thook.dll';
procedure lua_settop(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_pushvalue(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_remove(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_insert(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_replace(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
function lua_checkstack(L: Plua_State; SZ: Integer): Integer;
  cdecl external 'thook.dll';

procedure lua_xmove (Src, Dst: Plua_State; N: Integer);
  cdecl external 'thook.dll';


(*
** access functions (stack -> C)
*)

function lua_isnumber(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';
function lua_isstring(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';
function lua_iscfunction(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';
function lua_isuserdata(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';
function lua_type(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';
function lua_typename(L: Plua_State; TP: Integer): PChar;
  cdecl external 'thook.dll';

function lua_equal(L: Plua_State; Idx1: Integer; Idx2: Integer): Integer;
  cdecl external 'thook.dll';
function lua_rawequal(L: Plua_State; Idx1: Integer; Idx2: Integer): Integer;
  cdecl external 'thook.dll';
function lua_lessthan(L: Plua_State; Idx1: Integer; Idx2: Integer): Integer;
  cdecl external 'thook.dll';

function lua_tonumber(L: Plua_State; Idx: Integer): lua_Number;
  cdecl external 'thook.dll';
function lua_toboolean(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';
function lua_tostring(L: Plua_State; Idx: Integer): PChar;
  cdecl external 'thook.dll';
function lua_strlen(L: Plua_State; Idx: Integer): size_t;
  cdecl external 'thook.dll';
function lua_tocfunction(L: Plua_State; Idx: Integer): lua_CFunction;
  cdecl external 'thook.dll';
function lua_touserdata(L: Plua_State; Idx: Integer): Pointer;
  cdecl external 'thook.dll';
function lua_tothread(L: Plua_State; Idx: Integer): Plua_State;
  cdecl external 'thook.dll';
function lua_topointer(L: Plua_State; Idx: Integer): Pointer;
  cdecl external 'thook.dll';


(*
** push functions (C -> stack)
*)
procedure lua_pushnil(L: Plua_State);
  cdecl external 'thook.dll';
procedure lua_pushnumber(L: Plua_State; N: lua_Number);
  cdecl external 'thook.dll';
procedure lua_pushlstring(L: Plua_State; const S: PChar; N: size_t);
  cdecl external 'thook.dll';
procedure lua_pushstring(L: Plua_State; const S: PChar);
  cdecl external 'thook.dll';
function lua_pushvfstring(L: Plua_State; const Fmt: PChar; Argp: Pointer): PChar;
  cdecl external 'thook.dll';
function lua_pushfstring(L: Plua_State; const Fmt: PChar): PChar; varargs;
  cdecl external 'thook.dll';
procedure lua_pushcclosure(L: Plua_State; Fn: lua_CFunction; N: Integer);
  cdecl external 'thook.dll';
procedure lua_pushboolean(L: Plua_State; B: Integer);
  cdecl external 'thook.dll';
procedure lua_pushlightuserdata(L: Plua_State; P: Pointer);
  cdecl external 'thook.dll';


(*
** get functions (Lua -> stack)
*)
procedure lua_gettable(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_rawget(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_rawgeti(L: Plua_State; Idx: Integer; N: Integer);
  cdecl external 'thook.dll';
procedure lua_newtable(L: Plua_State);
  cdecl external 'thook.dll';
function lua_newuserdata(L: Plua_State; SZ: size_t): Pointer;
  cdecl external 'thook.dll';
function lua_getmetatable(L: Plua_State; ObjIndex: Integer): Integer;
  cdecl external 'thook.dll';
procedure lua_getfenv(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';


(*
** set functions (stack -> Lua)
*)
procedure lua_settable(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_rawset(L: Plua_State; Idx: Integer);
  cdecl external 'thook.dll';
procedure lua_rawseti(L: Plua_State; Idx: Integer; N: Integer);
  cdecl external 'thook.dll';
function lua_setmetatable(L: Plua_State; ObjIndex: Integer): Integer;
  cdecl external 'thook.dll';
function lua_setfenv(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';


(*
** `load' and `call' functions (load and run Lua code)
*)
procedure lua_call(L: Plua_State; NArgs: Integer; NResults: Integer);
  cdecl external 'thook.dll';
function lua_pcall(L: Plua_State; NArgs: Integer; NResults: Integer; ErrFunc: Integer): Integer;
  cdecl external 'thook.dll';
function lua_cpcall(L: Plua_State; Func: lua_CFunction; UD: Pointer): Integer;
  cdecl external 'thook.dll';
function lua_load(L: Plua_State; Reader: lua_Chunkreader; DT: Pointer;
                        const ChunkName: PChar): Integer;
  cdecl external 'thook.dll';

function lua_dump(L: Plua_State; Writer: lua_Chunkwriter; Data: Pointer): Integer;
  cdecl external 'thook.dll';


(*
** coroutine functions
*)
function lua_yield(L: Plua_State; NResults: Integer): Integer;
  cdecl external 'thook.dll';
function lua_resume(L: Plua_State; NArg: Integer): Integer;
  cdecl external 'thook.dll';

(*
** garbage-collection functions
*)
function lua_getgcthreshold(L: Plua_State): Integer;
  cdecl external 'thook.dll';
function lua_getgccount(L: Plua_State): Integer;
  cdecl external 'thook.dll';
procedure lua_setgcthreshold(L: Plua_State; NewThreshold: Integer);
  cdecl external 'thook.dll';

(*
** miscellaneous functions
*)

function lua_version: PChar;
  cdecl external 'thook.dll';

function lua_error(L: Plua_State): Integer;
  cdecl external 'thook.dll';

function lua_next(L: Plua_State; Idx: Integer): Integer;
  cdecl external 'thook.dll';

procedure lua_concat(L: Plua_State; N: Integer);
  cdecl external 'thook.dll';



(*
** ===============================================================
** some useful macros
** ===============================================================
*)

function lua_boxpointer(L: Plua_State; U: Pointer): Pointer;
function lua_unboxpointer(L: Plua_State; I: Integer): Pointer;
procedure lua_pop(L: Plua_State; N: Integer);
procedure lua_register(L: Plua_State; const N: PChar; F: lua_CFunction);
procedure lua_pushcfunction(L: Plua_State; F: lua_CFunction);
function lua_isfunction(L: Plua_State; N: Integer): Boolean;
function lua_istable(L: Plua_State; N: Integer): Boolean;
function lua_islightuserdata(L: Plua_State; N: Integer): Boolean;
function lua_isnil(L: Plua_State; N: Integer): Boolean;
function lua_isboolean(L: Plua_State; N: Integer): Boolean;
function lua_isnone(L: Plua_State; N: Integer): Boolean;
function lua_isnoneornil(L: Plua_State; N: Integer): Boolean;
procedure lua_pushliteral(L: Plua_State; const S: PChar);

(*
** compatibility macros and functions
*)

function lua_pushupvalues(L: Plua_State): Integer;
  cdecl; external 'thook.dll';

procedure lua_getregistry(L: Plua_State);
procedure lua_setglobal(L: Plua_State; const S: PChar);
procedure lua_getglobal(L: Plua_State; const S: PChar);

(* compatibility with ref system *)

(* pre-defined references *)
const
  LUA_NOREF = (-2);
  LUA_REFNIL = (-1);

procedure lua_ref(L: Plua_State; Lock: Integer);
procedure lua_unref(L: Plua_State; Ref: Integer);
procedure lua_getref(L: Plua_State; Ref: Integer);

(*
** {======================================================================
** useful definitions for Lua kernel and libraries
** =======================================================================
*)

(* formats for Lua numbers *)
{$IFNDEF LUA_NUMBER_SCAN}
const
  LUA_NUMBER_SCAN = '%lf';
{$ENDIF}

{$IFNDEF LUA_NUMBER_FMT}
const
  LUA_NUMBER_FMT = '%.14g';
{$ENDIF}

(* }====================================================================== *)


(*
** {======================================================================
** Debug API
** =======================================================================
*)

const
(*
** Event codes
*)
  LUA_HOOKCALL = 0;
  LUA_HOOKRET = 1;
  LUA_HOOKLINE = 2;
  LUA_HOOKCOUNT = 3;
  LUA_HOOKTAILRET = 4;


(*
** Event masks
*)
  LUA_MASKCALL = (1 shl LUA_HOOKCALL);
  LUA_MASKRET = (1 shl LUA_HOOKRET);
  LUA_MASKLINE = (1 shl LUA_HOOKLINE);
  LUA_MASKCOUNT = (1 shl LUA_HOOKCOUNT);

const
  LUA_IDSIZE = 60;

type
  lua_Debug = record
    event: Integer;
    name: PChar; (* (n) *)
    namewhat: PChar; (* (n) `global', `local', `field', `method' *)
    what: PChar; (* (S) `Lua', `C', `main', `tail' *)
    source: PChar; (* (S) *)
    currentline: Integer;  (* (l) *)
    nups: Integer;   (* (u) number of upvalues *)
    linedefined: Integer;  (* (S) *)
    short_src: array [0..LUA_IDSIZE - 1] of Char; (* (S) *)
    (* private part *)
    i_ci: Integer;  (* active function *)
  end;
  Plua_Debug = ^lua_Debug;

  lua_Hook = procedure (L: Plua_State; AR: Plua_Debug); cdecl;


function lua_getstack(L: Plua_State; Level: Integer; AR: Plua_Debug): Integer;
  cdecl external 'thook.dll';
function lua_getinfo(L: Plua_State; const What: PChar; AR: Plua_Debug): Integer;
  cdecl external 'thook.dll';
function lua_getlocal(L: Plua_State; const AR: Plua_Debug; N: Integer): PChar;
  cdecl external 'thook.dll';
function lua_setlocal(L: Plua_State; const AR: Plua_Debug; N: Integer): PChar;
  cdecl external 'thook.dll';
function lua_getupvalue(L: Plua_State; FuncIndex: Integer; N: Integer): PChar;
  cdecl external 'thook.dll';
function lua_setupvalue(L: Plua_State; FuncIndex: Integer; N: Integer): PChar;
  cdecl external 'thook.dll';

function lua_sethook(L: Plua_State; Func: lua_Hook; Mask: Integer; Count: Integer): Integer;
  cdecl external 'thook.dll';
function lua_gethook(L: Plua_State): lua_Hook;
  cdecl external 'thook.dll';
function lua_gethookmask(L: Plua_State): Integer;
  cdecl external 'thook.dll';
function lua_gethookcount(L: Plua_State): Integer;
  cdecl external 'thook.dll';

(* }====================================================================== *)


(******************************************************************************
* Copyright (C) 1994-2003 Tecgraf, PUC-Rio.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining
* a copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject to
* the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
******************************************************************************)


implementation

uses
  SysUtils, lauxlib;

const
  MAX_SIZE = High(Integer);
  MAX_POINTER_ARRAY = MAX_SIZE div SizeOf(Pointer);

type
  TPointerArray = array [0..MAX_POINTER_ARRAY - 1] of Pointer;
  PPointerArray = ^TPointerArray;

function lua_upvalueindex(I: Integer): Integer;
begin
  Result := LUA_GLOBALSINDEX - I;
end;

function lua_boxpointer(L: Plua_State; U: Pointer): Pointer;
begin
  PPointerArray(lua_newuserdata(L, sizeof(U)))^[0] := U;
  Result := U;
end;

function lua_unboxpointer(L: Plua_State; I: Integer): Pointer;
begin
  Result := PPointerArray(lua_touserdata(L, I))^[0];
end;

procedure lua_pop(L: Plua_State; N: Integer);
begin
  lua_settop(L, -(N)-1);
end;

procedure lua_register(L: Plua_State; const N: PChar; F: lua_CFunction);
begin
  lua_pushstring(L, N);
  lua_pushcfunction(L, F);
  lua_settable(L, LUA_GLOBALSINDEX);
end;

procedure lua_pushcfunction(L: Plua_State; F: lua_CFunction);
begin
  lua_pushcclosure(L, F, 0);
end;

function lua_isfunction(L: Plua_State; N: Integer): Boolean;
begin
  Result := lua_type(L, n) = LUA_TFUNCTION;
end;

function lua_istable(L: Plua_State; N: Integer): Boolean;
begin
  Result := lua_type(L, n) = LUA_TTABLE;
end;

function lua_islightuserdata(L: Plua_State; N: Integer): Boolean;
begin
  Result := lua_type(L, n) = LUA_TLIGHTUSERDATA;
end;

function lua_isnil(L: Plua_State; N: Integer): Boolean;
begin
  Result := lua_type(L, n) = LUA_TNIL;
end;

function lua_isboolean(L: Plua_State; N: Integer): Boolean;
begin
  Result := lua_type(L, n) = LUA_TBOOLEAN;
end;

function lua_isnone(L: Plua_State; N: Integer): Boolean;
begin
  Result := lua_type(L, n) = LUA_TNONE;
end;

function lua_isnoneornil(L: Plua_State; N: Integer): Boolean;
begin
  Result := lua_type(L, n) <= 0;
end;

procedure lua_pushliteral(L: Plua_State; const S: PChar);
begin
  lua_pushlstring(L, S, StrLen(S));
end;

procedure lua_getregistry(L: Plua_State);
begin
  lua_pushvalue(L, LUA_REGISTRYINDEX);
end;

procedure lua_setglobal(L: Plua_State; const S: PChar);
begin
  lua_pushstring(L, S);
  lua_insert(L, -2);
  lua_settable(L, LUA_GLOBALSINDEX);
end;

procedure lua_getglobal(L: Plua_State; const S: PChar);
begin
  lua_pushstring(L, S);
  lua_gettable(L, LUA_GLOBALSINDEX);
end;

procedure lua_ref(L: Plua_State; Lock: Integer);
begin
  if (Lock <> 0) then
  begin
    luaL_ref(L, LUA_REGISTRYINDEX);
  end else
  begin
    lua_pushstring(L, 'unlocked references are obsolete');
    lua_error(L);
  end;
end;

procedure lua_unref(L: Plua_State; Ref: Integer);
begin
  luaL_unref(L, LUA_REGISTRYINDEX, Ref);
end;

procedure lua_getref(L: Plua_State; Ref: Integer);
begin
  lua_rawgeti(L, LUA_REGISTRYINDEX, Ref);
end;

end.

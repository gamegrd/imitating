(*
** $Id: lua.pas,v 1.3 2006/11/17 00:02:17 jfgoulet Exp $
** Lua - An Extensible Extension Language
** Lua.org, PUC-Rio, Brazil (http://www.lua.org)
** See Copyright Notice at the end of this file
**
**   Translation form C and Delphi adaptation of Code :
**     Massimo Magnano, Jean-Francois Goulet 2006
*)
unit lua;

{$IFNDEF lua_h}
{$DEFINE lua_h}
{$ENDIF}

interface

uses luaconf;

const
{$DEFINE LUA51}
  LUA_DLL = 'thook.dll';
  LUA_VERSION = 'Lua 5.1';
  LUA_RELEASE = 'Lua 5.1.1';
  LUA_VERSION_NUM = 501;
  LUA_COPYRIGHT = 'Copyright (C) 1994-2006 Lua.org, PUC-Rio';
  LUA_AUTHORS = 'R. Ierusalimschy, L. H. de Figueiredo & W. Celes';

 // mark for precompiled code (`<esc>Lua')
  LUA_SIGNATURE = #33'Lua';

 // option for multiple returns in `lua_pcall' and `lua_call'
  LUA_MULTRET = -1;

//
// pseudo-indices
//
  LUA_REGISTRYINDEX = -10000;
  LUA_ENVIRONINDEX = -10001;
  LUA_GLOBALSINDEX = -10002;

function lua_upvalueindex(I: Integer): Integer;

const
// thread status; 0 is OK
  LUA_YIELD_ = 1; //lua_yield is a function

// error codes for `lua_load' and `lua_pcall'
  LUA_ERRRUN = 2;
  LUA_ERRSYNTAX = 3;
  LUA_ERRMEM = 4;
  LUA_ERRERR = 5;

type
  //C Types to Delphi Types
  size_t = Integer;
  Psize_t = ^size_t;

  lua_State = record
  end;
  Plua_State = ^lua_State;

  lua_CFunction = function(L: Plua_State): Integer; cdecl;

(*
** functions that read/write blocks when loading/dumping Lua chunks
*)
  lua_Reader = function(L: Plua_State; ud: Pointer; sz: Psize_t): PChar;
  lua_Writer = function(L: Plua_State; const p: Pointer; sz: size_t; ud: Pointer): Integer;

(*
** prototype for memory-allocation functions
*)
  lua_Alloc = function(ud: Pointer; ptr: Pointer; osize: size_t; nsize: size_t): Pointer;

const
(*
** basic types
*)
  LUA_TNONE = -1;

  LUA_TNIL = 0;
  LUA_TBOOLEAN = 1;
  LUA_TLIGHTUSERDATA = 2;
  LUA_TNUMBER = 3;
  LUA_TSTRING = 4;
  LUA_TTABLE = 5;
  LUA_TFUNCTION = 6;
  LUA_TUSERDATA = 7;
  LUA_TTHREAD = 8;

// minimum Lua stack available to a C function
  LUA_MINSTACK = 20;

(*
** generic extra include file
*)
{$IFDEF LUA_USER_H}
{$INCLUDE}LUA_USER_H
{$ENDIF}

//type
  //type of numbers in Lua
  //lua_Number = LUA_NUMBER;  see LuaConf.pas

  // type for integer functions
  //lua_Integer = LUA_INTEGER; see LuaConf.pas

(*
** state manipulation
*)
function lua_newstate(f: lua_Alloc; ud: Pointer): Plua_State; cdecl external LUA_DLL;
procedure lua_close(L: Plua_State); cdecl external LUA_DLL;
function lua_newthread(L: Plua_State): Plua_State; cdecl external LUA_DLL;

function lua_atpanic(L: Plua_State; panicf: lua_CFunction): lua_CFunction; cdecl external LUA_DLL;

(*
** basic stack manipulation
*)
function lua_gettop(L: Plua_State): Integer; cdecl external LUA_DLL;
procedure lua_settop(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_pushvalue(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_remove(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_insert(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_replace(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
function lua_checkstack(L: Plua_State; sz: Integer): Integer; cdecl external LUA_DLL;

procedure lua_xmove(_from, _to: Plua_State; n: Integer); cdecl external LUA_DLL;

(*
** access functions (stack -> C)
*)

function lua_isnumber(L: Plua_State; idx: Integer): LongBool; cdecl external LUA_DLL;
function lua_isstring(L: Plua_State; idx: Integer): LongBool; cdecl external LUA_DLL;
function lua_iscfunction(L: Plua_State; idx: Integer): LongBool; cdecl external LUA_DLL;
function lua_isuserdata(L: Plua_State; idx: Integer): LongBool; cdecl external LUA_DLL;
function lua_type(L: Plua_State; idx: Integer): Integer; cdecl external LUA_DLL;
function lua_typename(L: Plua_State; tp: Integer): PChar; cdecl external LUA_DLL;

function lua_equal(L: Plua_State; idx1, idx2: Integer): Integer; cdecl external LUA_DLL;
function lua_rawequal(L: Plua_State; idx1, idx2: Integer): Integer; cdecl external LUA_DLL;
function lua_lessthan(L: Plua_State; Idx1: Integer; Idx2: Integer): Integer; cdecl external LUA_DLL;

function lua_tonumber(L: Plua_State; idx: Integer): LUA_NUMBER; cdecl external LUA_DLL;
function lua_tointeger(L: Plua_State; idx: Integer): lua_Integer; cdecl external LUA_DLL;
function lua_toboolean(L: Plua_State; idx: Integer): Integer; cdecl external LUA_DLL;
function lua_tolstring(L: Plua_State; idx: Integer; len: Psize_t): PChar; cdecl external LUA_DLL;
function lua_objlen(L: Plua_State; idx: Integer): size_t; cdecl external LUA_DLL;
function lua_tocfunction(L: Plua_State; idx: Integer): lua_CFunction; cdecl external LUA_DLL;
function lua_touserdata(L: Plua_State; idx: Integer): Pointer; cdecl external LUA_DLL;
function lua_tothread(L: Plua_State; idx: Integer): Plua_State; cdecl external LUA_DLL;
function lua_topointer(L: Plua_State; idx: Integer): Pointer; cdecl external LUA_DLL;

(*
** push functions (C -> stack)
*)
procedure lua_pushnil(L: Plua_State); cdecl external LUA_DLL;
procedure lua_pushnumber(L: Plua_State; n: LUA_NUMBER); cdecl external LUA_DLL;
procedure lua_pushinteger(L: Plua_State; n: lua_Integer); cdecl external LUA_DLL;
procedure lua_pushlstring(L: Plua_State; const s: PChar; n: size_t); cdecl external LUA_DLL;
procedure lua_pushstring(L: Plua_State; const s: PChar); cdecl external LUA_DLL;
function lua_pushvfstring(L: Plua_State; const fmt: PChar; Argp: Pointer): PChar; cdecl external LUA_DLL;
function lua_pushfstring(L: Plua_State; const Fmt: PChar): PChar; varargs; cdecl external LUA_DLL;
procedure lua_pushcclosure(L: Plua_State; fn: lua_CFunction; n: Integer); cdecl external LUA_DLL;
procedure lua_pushboolean(L: Plua_State; b: Integer); cdecl external LUA_DLL;
procedure lua_pushlightuserdata(L: Plua_State; p: Pointer); cdecl external LUA_DLL;
function lua_pushthread(L: Plua_State): Integer; cdecl external LUA_DLL;

(*
** get functions (Lua -> stack)
*)
procedure lua_gettable(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_getfield(L: Plua_State; idx: Integer; k: PChar); cdecl external LUA_DLL;
procedure lua_rawget(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_rawgeti(L: Plua_State; idx, n: Integer); cdecl external LUA_DLL;
procedure lua_createtable(L: Plua_State; narr, nrec: Integer); cdecl external LUA_DLL;
function lua_newuserdata(L: Plua_State; sz: size_t): Pointer; cdecl external LUA_DLL;
function lua_getmetatable(L: Plua_State; objindex: Integer): Integer; cdecl external LUA_DLL;
procedure lua_getfenv(L: Plua_State; idx: Integer); cdecl external LUA_DLL;

(*
** set functions (stack -> Lua)
*)
procedure lua_settable(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_setfield(L: Plua_State; idx: Integer; k: PChar); cdecl external LUA_DLL;
procedure lua_rawset(L: Plua_State; idx: Integer); cdecl external LUA_DLL;
procedure lua_rawseti(L: Plua_State; idx, n: Integer); cdecl external LUA_DLL;
function lua_setmetatable(L: Plua_State; objindex: Integer): Integer; cdecl external LUA_DLL;
function lua_setfenv(L: Plua_State; idx: Integer): Integer; cdecl external LUA_DLL;

(*
** `load' and `call' functions (load and run Lua code)
*)
procedure lua_call(L: Plua_State; nargs, nresults: Integer); cdecl external LUA_DLL;
function lua_pcall(L: Plua_State; nargs, nresults, errfunc: Integer): Integer; cdecl external LUA_DLL;
function lua_cpcall(L: Plua_State; func: lua_CFunction; ud: Pointer): Integer; cdecl external LUA_DLL;
function lua_load(L: Plua_State; reader: lua_Reader; dt: Pointer;
  const chunkname: PChar): Integer; cdecl external LUA_DLL;

function lua_dump(L: Plua_State; writer: lua_Writer; data: Pointer): Integer; cdecl external LUA_DLL;

(*
** coroutine functions
*)
function lua_yield(L: Plua_State; nresults: Integer): Integer; cdecl external LUA_DLL;
function lua_resume(L: Plua_State; narg: Integer): Integer; cdecl external LUA_DLL;
function lua_status(L: Plua_State): Integer; cdecl external LUA_DLL;

(*
** garbage-collection functions and options
*)
const
  LUA_GCSTOP = 0;
  LUA_GCRESTART = 1;
  LUA_GCCOLLECT = 2;
  LUA_GCCOUNT = 3;
  LUA_GCCOUNTB = 4;
  LUA_GCSTEP = 5;
  LUA_GCSETPAUSE = 6;
  LUA_GCSETSTEPMUL = 7;

function lua_gc(L: Plua_State; what, data: Integer): Integer; cdecl external LUA_DLL;

(*
** miscellaneous functions
*)

function lua_error(L: Plua_State): Integer; cdecl external LUA_DLL;

function lua_next(L: Plua_State; idx: Integer): Integer; cdecl external LUA_DLL;

procedure lua_concat(L: Plua_State; n: Integer); cdecl external LUA_DLL;

function lua_getallocf(L: Plua_State; ud: PPointer): lua_Alloc; cdecl external LUA_DLL;
procedure lua_setallocf(L: Plua_State; f: lua_Alloc; ud: Pointer); cdecl external LUA_DLL;

(*
** ===============================================================
** some useful macros
** ===============================================================
*)

procedure lua_pop(L: Plua_State; n: Integer);

procedure lua_newtable(L: Plua_State);

procedure lua_register(L: Plua_State; const n: PChar; f: lua_CFunction);

procedure lua_pushcfunction(L: Plua_State; f: lua_CFunction);

function lua_strlen(L: Plua_State; i: Integer): Integer;

function lua_isfunction(L: Plua_State; n: Integer): Boolean;
function lua_istable(L: Plua_State; n: Integer): Boolean;
function lua_islightuserdata(L: Plua_State; n: Integer): Boolean;
function lua_isnil(L: Plua_State; n: Integer): Boolean;
function lua_isboolean(L: Plua_State; n: Integer): Boolean;
function lua_isthread(L: Plua_State; n: Integer): Boolean;
function lua_isnone(L: Plua_State; n: Integer): Boolean;
function lua_isnoneornil(L: Plua_State; n: Integer): Boolean;

procedure lua_pushliteral(L: Plua_State; const s: PChar);

procedure lua_setglobal(L: Plua_State; s: PChar);
procedure lua_getglobal(L: Plua_State; s: PChar);

function lua_tostring(L: Plua_State; i: Integer): PChar;

(*
** compatibility macros and functions
*)

function lua_open: Plua_State;

procedure lua_getregistry(L: Plua_State);

function lua_getgccount(L: Plua_State): Integer;

type
  lua_Chunkreader = lua_Reader;
  lua_Chunkwriter = lua_Writer;

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

type
  lua_Debug = record
    event: Integer;
    name: PChar; (* (n) *)
    namewhat: PChar; (* (n) `global', `local', `field', `method' *)
    what: PChar; (* (S) `Lua', `C', `main', `tail' *)
    source: PChar; (* (S) *)
    currentline: Integer; (* (l) *)
    nups: Integer; (* (u) number of upvalues *)
    linedefined: Integer; (* (S) *)
    short_src: array[0..LUA_IDSIZE - 1] of Char; (* (S) *)
    (* private part *)
    i_ci: Integer; (* active function *)
  end;
  Plua_Debug = ^lua_Debug;

  // Functions to be called by the debuger in specific events
  lua_Hook = procedure(L: Plua_State; ar: Plua_Debug); cdecl;

function lua_getstack(L: Plua_State; level: Integer; ar: Plua_Debug): Integer; cdecl external LUA_DLL;
function lua_getinfo(L: Plua_State; const what: PChar; ar: Plua_Debug): Integer; cdecl external LUA_DLL;
function lua_getlocal(L: Plua_State; const ar: Plua_Debug; n: Integer): PChar; cdecl external LUA_DLL;
function lua_setlocal(L: Plua_State; const ar: Plua_Debug; n: Integer): PChar; cdecl external LUA_DLL;
function lua_getupvalue(L: Plua_State; funcindex: Integer; n: Integer): PChar; cdecl external LUA_DLL;
function lua_setupvalue(L: Plua_State; funcindex: Integer; n: Integer): PChar; cdecl external LUA_DLL;

function lua_sethook(L: Plua_State; func: lua_Hook; mask, count: Integer): Integer; cdecl external LUA_DLL;
function lua_gethook(L: Plua_State): lua_Hook; cdecl external LUA_DLL;
function lua_gethookmask(L: Plua_State): Integer; cdecl external LUA_DLL;
function lua_gethookcount(L: Plua_State): Integer; cdecl external LUA_DLL;

implementation

uses SysUtils, lauxlib;

(*
** pseudo-indices
*)

function lua_upvalueindex(I: Integer): Integer;
begin
  Result := (LUA_GLOBALSINDEX - i);
end;

(*
** ===============================================================
** some useful macros
** ===============================================================
*)

procedure lua_pop(L: Plua_State; n: Integer);
begin
  lua_settop(L, -(n) - 1);
end;

procedure lua_newtable(L: Plua_State);
begin
  lua_createtable(L, 0, 0);
end;

procedure lua_register(L: Plua_State; const n: PChar; f: lua_CFunction);
begin
  lua_pushcfunction(L, f);
  lua_setglobal(L, n);
end;

procedure lua_pushcfunction(L: Plua_State; f: lua_CFunction);
begin
  lua_pushcclosure(L, f, 0);
end;

function lua_strlen(L: Plua_State; i: Integer): Integer;
begin
  Result := lua_objlen(L, i);
end;

function lua_isfunction(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) = LUA_TFUNCTION);
end;

function lua_istable(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) = LUA_TTABLE);
end;

function lua_islightuserdata(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) = LUA_TLIGHTUSERDATA);
end;

function lua_isnil(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) = LUA_TNIL);
end;

function lua_isboolean(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) = LUA_TBOOLEAN);
end;

function lua_isthread(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) = LUA_TTHREAD);
end;

function lua_isnone(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) = LUA_TNONE);
end;

function lua_isnoneornil(L: Plua_State; n: Integer): Boolean;
begin
  Result := (lua_type(L, n) <= 0);
end;

procedure lua_pushliteral(L: Plua_State; const s: PChar);
begin
  lua_pushlstring(L, s, StrLen(s) (* / sizeof(char) *));
end;

procedure lua_setglobal(L: Plua_State; s: PChar);
begin
  lua_setfield(L, LUA_GLOBALSINDEX, s);
end;

procedure lua_getglobal(L: Plua_State; s: PChar);
begin
  lua_getfield(L, LUA_GLOBALSINDEX, s);
end;

function lua_tostring(L: Plua_State; i: Integer): PChar;
begin
  Result := lua_tolstring(L, i, nil);
end;

(*
** compatibility macros and functions
*)

function lua_open: Plua_State;
begin
  Result := luaL_newstate;
end;

procedure lua_getregistry(L: Plua_State);
begin
  lua_pushvalue(L, LUA_REGISTRYINDEX);
end;

function lua_getgccount(L: Plua_State): Integer;
begin
  Result := lua_gc(L, LUA_GCCOUNT, 0);
end;

(* }====================================================================== *)

(******************************************************************************
* Copyright (C) 1994-2006 Lua.org, PUC-Rio.  All rights reserved.
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

end.

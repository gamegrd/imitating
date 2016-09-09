(*
** $Id: lualib.pas,v 1.3 2006/11/17 00:02:17 jfgoulet Exp $
** Lua standard libraries
** See Copyright Notice in lua.h
*)
unit lualib;

{$IFNDEF lualib_h}
{$DEFINE lualib_h}
{$ENDIF}

interface

uses
  lua;

const
  LUA_COLIBNAME = 'coroutine';
  LUA_TABLIBNAME = 'table';
  LUA_IOLIBNAME = 'io';
  LUA_OSLIBNAME = 'os';
  LUA_STRLIBNAME = 'string';
  LUA_MATHLIBNAME = 'math';
  LUA_DBLIBNAME = 'debug';

function luaopen_base(L: Plua_State): Integer;
cdecl external LUA_DLL;

function luaopen_table(L: Plua_State): Integer;
cdecl external LUA_DLL;

function luaopen_os(L: Plua_State): Integer;
cdecl external LUA_DLL;


function luaopen_io(L: Plua_State): Integer;
cdecl external LUA_DLL;

function luaopen_string(L: Plua_State): Integer;
cdecl external LUA_DLL;

function luaopen_math(L: Plua_State): Integer;
cdecl external LUA_DLL;

function luaopen_debug(L: Plua_State): Integer;
cdecl external LUA_DLL;

{$IFDEF LUA51}
const
  LUA_LOADLIBNAME = 'package';
function luaL_openlibs(L: Plua_State): Integer; cdecl external LUA_DLL;
function luaopen_package(L: Plua_State): Integer;
cdecl external LUA_DLL;
{$ELSE}
function luaopen_loadlib(L: Plua_State): Integer;
cdecl external LUA_DLL;
{$ENDIF}

(* to help testing the libraries *)
{$IFNDEF lua_assert}
//#define lua_assert(c)   (* empty *)
{$ENDIF}

(* compatibility code *)
function lua_baselibopen(L: Plua_State): Integer;
function lua_tablibopen(L: Plua_State): Integer;
function lua_iolibopen(L: Plua_State): Integer;
function lua_strlibopen(L: Plua_State): Integer;
function lua_mathlibopen(L: Plua_State): Integer;
function lua_dblibopen(L: Plua_State): Integer;

implementation

function lua_baselibopen(L: Plua_State): Integer;
begin
  Result := luaopen_base(L);
end;

function lua_tablibopen(L: Plua_State): Integer;
begin
  Result := luaopen_table(L);
end;

function lua_iolibopen(L: Plua_State): Integer;
begin
  Result := luaopen_io(L);
end;

function lua_strlibopen(L: Plua_State): Integer;
begin
  Result := luaopen_string(L);
end;

function lua_mathlibopen(L: Plua_State): Integer;
begin
  Result := luaopen_math(L);
end;

function lua_dblibopen(L: Plua_State): Integer;
begin
  Result := luaopen_debug(L);
end;

end.

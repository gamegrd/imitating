(*
** $Id: luaconf.h,v 1.82 2006/04/10 18:27:23 roberto Exp $
** Configuration file for Lua
** See Copyright Notice in lua.h
*)

unit luaconf;

interface

type
  ptrdiff_t = Integer;
(*
@@ LUA_INTEGER is the integral type used by lua_pushinteger/lua_tointeger.
** CHANGE that if ptrdiff_t is not adequate on your machine. (On most
** machines, ptrdiff_t gives a good choice between int or long.)
*)
  LUA_INTEGER = ptrdiff_t;

const
(*
@@ LUA_IDSIZE gives the maximum size for the description of the source
@* of a function in debug information.
** CHANGE it if you want a different size.
*)
  LUA_IDSIZE = 60;

(*
@@ LUA_COMPAT_OPENLIB controls compatibility with old 'luaL_openlib'
@* behavior.
** CHANGE it to undefined as soon as you replace to 'luaL_registry'
** your uses of 'luaL_openlib'
*)
{$DEFINE LUA_COMPAT_OPENLIB}

(*
@@ LUAL_BUFFERSIZE is the buffer size used by the lauxlib buffer system.
*)
  BUFSIZ = 1024;
  LUAL_BUFFERSIZE = BUFSIZ;

(* }================================================================== *)

type
(*
** {==================================================================
@@ LUA_NUMBER is the type of numbers in Lua.
** CHANGE the following definitions only if you want to build Lua
** with a number type different from double. You may also need to
** change lua_number2int & lua_number2integer.
** ===================================================================
*)
{$DEFINE LUA_NUMBER_DOUBLE}
  LUA_NUMBER = Double;

const
(*
@@ LUA_NUMBER_SCAN is the format for reading numbers.
@@ LUA_NUMBER_FMT is the format for writing numbers.
@@ lua_number2str converts a number to a string.
@@ LUAI_MAXNUMBER2STR is maximum size of previous conversion.
@@ lua_str2number converts a string to a number.
*)
  LUA_NUMBER_SCAN = '%lf';
  LUA_NUMBER_FMT = '%.14g';

implementation

end.

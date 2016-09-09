unit uHookLib;

interface
uses
  Windows, SysUtils;

type
  PBytes = ^Byte;
  TMaskTable = array [0..517] of LongWord;

var
  MaskTable: TMaskTable = (
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000000, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000000, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000000, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000000, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000008, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000008, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000008, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00008000, $00008000, $00000008, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00004000, $00004000,
    $00000008, $00000008, $00001008, $00000018,
    $00002000, $00006000, $00000100, $00004100,
    $00000000, $00000000, $00000000, $00000000,
    $00000100, $00000100, $00000100, $00000100,
    $00000100, $00000100, $00000100, $00000100,
    $00000100, $00000100, $00000100, $00000100,
    $00000100, $00000100, $00000100, $00000100,
    $00004100, $00006000, $00004100, $00004100,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00002002, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000020, $00000020, $00000020, $00000020,
    $00000000, $00000000, $00000000, $00000000,
    $00000100, $00002000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000100, $00000100, $00000100, $00000100,
    $00000100, $00000100, $00000100, $00000100,
    $00002000, $00002000, $00002000, $00002000,
    $00002000, $00002000, $00002000, $00002000,
    $00004100, $00004100, $00000200, $00000000,
    $00004000, $00004000, $00004100, $00006000,
    $00000300, $00000000, $00000200, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00000100, $00000100, $00000000, $00000000,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00000100, $00000100, $00000100, $00000100,
    $00000100, $00000100, $00000100, $00000100,
    $00002000, $00002000, $00002002, $00000100,
    $00000000, $00000000, $00000000, $00000000,
    $00000008, $00000000, $00000008, $00000008,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $FFFFFFFF, $FFFFFFFF, $00000000, $FFFFFFFF,
    $00000000, $00000000, $00000000, $00000000,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $00002000, $00002000, $00002000, $00002000,
    $00002000, $00002000, $00002000, $00002000,
    $00002000, $00002000, $00002000, $00002000,
    $00002000, $00002000, $00002000, $00002000,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00000000, $00000000, $00000000, $00004000,
    $00004100, $00004000, $FFFFFFFF, $FFFFFFFF,
    $00000000, $00000000, $00000000, $00004000,
    $00004100, $00004000, $FFFFFFFF, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $FFFFFFFF, $FFFFFFFF, $00004100, $00004000,
    $00004000, $00004000, $00004000, $00004000,
    $00004000, $00004000, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $00000000, $00000000, $00000000, $00000000,
    $00000000, $00000000, $00000000, $00000000,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $00000000, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF,
    $FFFFFFFF, $FFFFFFFF
  );

function SetOnBefore(const DllName: string; const ApiName: string;
  HookProc: Pointer): Boolean;
function SetOnAfter(const DllName: string; const ApiName: string;
  HookProc: Pointer): Boolean;
  
function GetOpCodeSize(Start: Pointer; Tlb: TMaskTable): integer; stdcall;

implementation

var
  JMPGate: array [0..4] of byte = (
    $E9, $00, $00, $00, $00       // JMP XXXXXXXX
  );

  // HookProc offset is 36
  // HookApi offset is  82
  BeforeStub: array [0..93] of byte = (
    $58,                            // 0 pop     eax
    $EB, $08,                       // 1 jmp     short 0040100B
    $00, $00, $00, $00,             // 3 dd      00000000
    $00, $00, $00, $00,             // 7 dd      00000000
    $E8, $00, $00, $00, $00,        // 11 call    00401010
    $59,                            // 16 pop     ecx
    $81, $E9, $10, $10, $40, $00,   // 17 sub     ecx, 00401010
    $89, $A1, $03, $10, $40, $00,   // 23 mov     [ecx+401003], esp
    $89, $81, $07, $10, $40, $00,   // 29 mov     [ecx+401007], eax
    $E8, $36, $01, $00, $00,        // 35 call    HookProc
    $8B, $44, $24, $FC,             // 40 mov     eax, [esp - 4]
    $E8, $00, $00, $00, $00,        // 44 call    0040102D
    $59,                            // 49 pop     ecx
    $89, $44, $24, $FC,             // 50 mov [esp - 4], eax
    $81, $E9, $31, $10, $40, $00,   // 54 sub     ecx, 0040102D
    $8B, $A1, $03, $10, $40, $00,   // 60 mov     esp, [ecx+401003]
    $8B, $81, $07, $10, $40, $00,   // 66 mov     eax, [ecx+401007]
    $50,                            // 72 push    eax
    $90, $90, $90, $90,             // 73
    $90, $90, $90, $90,
    $90, $90, $90, $90,
    $90, $90, $90, $90,   
    $E9, $18, $01, $00, $00         // 89 jmp     HookedApi
  );

  AfterStub: array [0..129] of Byte = (
    $58,                            // 00   pop     eax
    $EB, $0C,                       // 01   jmp     short 0040100F
    $00, $00, $00, $00,             // 03   dd      00000000
    $00, $00, $00, $00,             // 07   add     [eax], al
    $00, $00, $00, $00,             // 0B   add     [eax], al
    $E8, $00, $00, $00, $00,        // 0F   call    00401014
    $59,                            // 14   pop     ecx
    $81, $E9, $14, $10, $40, $00,   // 15   sub     ecx, 00401014
    $89, $A1, $03, $10, $40, $00,   // 1B   mov     [ecx+401003], esp
    $89, $81, $07, $10, $40, $00,   // 21   mov     [ecx+401007], eax
    $8D, $89, $43, $10, $40, $00,   // 27   lea     ecx, [ecx+401043]
    $51,                            // 2D   push    ecx
    $90,                            // 2E   nop
    $90,                            // 2F   nop
    $90,                            // 30   nop
    $90,                            // 31   nop
    $90,                            // 32   nop
    $90,                            // 33   nop
    $90,                            // 34   nop
    $90,                            // 35   nop
    $90,                            // 36   nop
    $90,                            // 37   nop
    $90,                            // 38   nop
    $90,                            // 39   nop
    $90,                            // 3A   nop
    $90,                            // 3B   nop
    $90,                            // 3C   nop
    $90,                            // 3D   nop
    $E9, $57, $01, $00, $00,        // 3E   jmp     0040119A
    $8B, $5C, $24, $FC,             // 43   mov     ebx, [esp-4]
    $E8, $00, $00, $00, $00,        // 47   call    0040104C
    $59,                            // 4C   pop     ecx
    $89, $5C, $24, $FC,             // 4D   mov     [esp-4], ebx
    $81, $E9, $4C, $10, $40, $00,   // 51   sub     ecx, 0040104C
    $89, $81, $0B, $10, $40, $00,   // 57   mov     [ecx+40100B], eax
    $8B, $A1, $03, $10, $40, $00,   // 5D   mov     esp, [ecx+401003]
    $E8, $32, $01, $00, $00,        // 63   call    0040119A
    $E8, $00, $00, $00, $00,        // 68   call    0040106D
    $59,                            // 6D   pop     ecx
    $81, $E9, $6D, $10, $40, $00,   // 6E   sub     ecx, 0040106D
    $8B, $81, $07, $10, $40, $00,   // 74   mov     eax, [ecx+401007]
    $50,                            // 7A   push    eax
    $8B, $81, $0B, $10, $40, $00,   // 7B   mov     eax, [ecx+40100B]
    $C3                             // 81   retn
  );

function GetOpCodeSize(Start: Pointer; Tlb: TMaskTable): integer;
var
  pOPCode: PBytes;
  t, c: LongWord;
  dh, dl, al: byte;
begin
  result := -1;
  t := 0;
  pOPCode := Start;

  repeat
    t := t and $F7;
    c := pOPCode^;
    pOpCode := Pointer((DWORD(pOpCode) + 1));
    t := t or Tlb[c];
  until ((t and $000000FF) and 8) = 0;

  if (c = $0F6) or (c = $0F7) then
  begin
    t := t or $00004000;
    if (pOpCode^ and $38) = 0 then
      t := t or $00008000;
  end
  else if (c = $0CD) then
  begin
    t := t or $00000100;
    if pOpCode^ = $20 then
      t := t or $00000400;
  end
  else if (c = $0F) then
  begin
    al := pOpCode^;
    pOpCode := Pointer((DWORD(pOpCode) + 1));
    t := t or Tlb[al + $100];
    if t = $FFFFFFFF then
      Exit;
  end;

  if (((t and $0000FF00) shr 8) and $80) <> 0 then
  begin
    dh := (t and $0000FF00) shr 8;
    dh := dh xor $20;
    if (c and 1) = 0 then
      dh := dh xor $21;
    t := t and $FFFF00FF;
    t := t or (dh shl 8);
  end;

  if (((t and $0000FF00) shr 8) and $40) <> 0 then
  begin
    al := pOpCode^;
    pOpCode := Pointer((DWORD(pOpCode) + 1));
    c := al;
    c := c or (al shl 8);
    c := c and $C007;
    if (c and $0000FF00) <> $C000 then
    begin
      if ((t and $000000FF) and $10) = 0 then
      begin
        if (c and $000000FF) = 4 then
        begin
          al := pOpCode^;
          pOpCode := Pointer((DWORD(pOpCode) + 1));
          al := al and 7;
          c := c and $0000FF00;
          c := c or al;
        end;
        if (c and $0000FF00) <> $4000 then
        begin
          if (c and $0000FF00) = $8000 then
          begin
            t := t or 4;
          end
          else if c = 5 then
            t := t or 4;
        end
        else
        begin
          t := t or 1;
        end;
      end
      else
      begin
        if (c <> 6) then
        begin
          if (c and $0000FF00) = $4000 then
            t := t or 1
          else if (c and $0000FF00) = $8000 then
            t := t or 2;
        end
        else
          t := t or 2;
      end;
    end;
  end;
  
  if (((t and $000000FF)) and $20) <> 0 then
  begin
    dl := (t and $000000FF);
    dl := dl xor 2;
    t := t and $FFFFFF00;
    t := t or dl;
    if (dl and $10) = 0 then
    begin
      dl := dl xor 6;
      t := t and $FFFFFF00;
      t := t or dl;
    end;
  end;

  if (((t and $0000FF00) shr 8) and $20) <> 0 then
  begin
    dh := (t and $0000FF00) shr 8;
    dh := dh xor 2;
    t := t and $FFFF00FF;
    t := t or (dh shl 8);
    if (dh and $10) = 0 then
    begin
      dh := dh xor 6;
      t := t and $FFFFFF00;
      t := t or dh;
    end;
  end;

  result := DWORD(pOPCode) - DWORD(Start);
  t := t and $707;
  result := result + (t and $000000FF);         //１条指令不可能大过255个字节
  result := result + ((t and $0000FF00) shr 8);
end;

function HookCode(const DllName: string; const ApiName: string;
  HookProc: Pointer): Boolean;
begin
end;

function SetOnBefore(const DllName: string; const ApiName: string;
  HookProc: Pointer): Boolean;
var
  ApiEntry: Pointer;
  DllHandle: THandle;
  ReplaceCodeSize: Integer;
  OpCode: array [0..15] of byte;
  StubPtr: Pointer;
  Addr: LongWord;
  RetSize: LongWord;
  
begin
  Result := False;
  DllHandle := GetModuleHandle(PChar(DllName));
  if DllHandle = 0 then
  begin
    DllHandle := LoadLibrary(PChar(DllName));

    if DllHandle = 0 then Exit;
  end;

  ApiEntry := GetProcAddress(DllHandle, PChar(ApiName));
  if ApiEntry = nil then Exit;

  ReplaceCodeSize := GetOpCodeSize(ApiEntry, MaskTable);

  while ReplaceCodeSize < 5 do
  begin
    ReplaceCodeSize := ReplaceCodeSize +
      GetOpCodeSize(Pointer(LongWord(ApiEntry) + ReplaceCodeSize), MaskTable);
  end;

  if ReplaceCodeSize > 16 then Exit;

  if VirtualProtect(ApiEntry, ReplaceCodeSize, PAGE_READWRITE, nil) then
    Exit;

  CopyMemory(@OpCode, ApiEntry, ReplaceCodeSize);

  StubPtr := VirtualAlloc(nil, SizeOf(BeforeStub), MEM_COMMIT, PAGE_EXECUTE_READWRITE);
  if StubPtr = nil then Exit;

  CopyMemory(StubPtr, @BeforeStub, SizeOf(BeforeStub));

  // 求HookProc的地址  
  Addr := LongWord(HookProc) - LongWord(StubPtr) - 35 - 5;
  // 写入HookProc的地址
  PDWORD(LongWord(StubPtr) + 36)^ := Addr;

  // 求HookedApi的地址  
  Addr := LongWord(ApiEntry) + ReplaceCodeSize - LongWord(StubPtr) - 89 - 5;
  // 写入HookedApi的地址
  PDWORD(LongWord(StubPtr) + 90)^ := Addr;

  // 写入被Hook掉的OpCode
  CopyMemory(Pointer(LongWord(StubPtr) + 73), @OpCode, ReplaceCodeSize);

  // 改写Api入口地址
  Addr := LongWord(StubPtr) - LongWord(ApiEntry) - 5;
  PDWORD(LongWord(@JMPGate) + 1)^ := Addr;
  WriteProcessMemory(GetCurrentProcess, ApiEntry, @JMPGate, SizeOf(JMPGate), RetSize);
//  CopyMemory(ApiEntry, @JMPGate, SizeOf(JMPGate));

  Result := True;
end;

function SetOnAfter(const DllName: string; const ApiName: string;
  HookProc: Pointer): Boolean;
var
  ApiEntry: Pointer;
  DllHandle: THandle;
  ReplaceCodeSize: Integer;
  OpCode: array [0..15] of byte;
  StubPtr: Pointer;
  Addr: LongWord;
  RetSize: LongWord;
  
begin
  Result := False;
  DllHandle := GetModuleHandle(PChar(DllName));
  if DllHandle = 0 then
  begin
    DllHandle := LoadLibrary(PChar(DllName));

    if DllHandle = 0 then Exit;
  end;

  ApiEntry := GetProcAddress(DllHandle, PChar(ApiName));
  if ApiEntry = nil then Exit;

  ReplaceCodeSize := GetOpCodeSize(ApiEntry, MaskTable);

  while ReplaceCodeSize < 5 do
  begin
    ReplaceCodeSize := ReplaceCodeSize +
      GetOpCodeSize(Pointer(LongWord(ApiEntry) + ReplaceCodeSize), MaskTable);
  end;

  if ReplaceCodeSize > 16 then Exit;

  if VirtualProtect(ApiEntry, ReplaceCodeSize, PAGE_READWRITE, nil) then
    Exit;

  CopyMemory(@OpCode, ApiEntry, ReplaceCodeSize);

  StubPtr := VirtualAlloc(nil, SizeOf(AfterStub), MEM_COMMIT, PAGE_EXECUTE_READWRITE);
  if StubPtr = nil then Exit;

  CopyMemory(StubPtr, @AfterStub, SizeOf(AfterStub));

  // 求HookProc的地址  
  Addr := LongWord(HookProc) - LongWord(StubPtr) - $63 - 5;
  // 写入HookProc的地址
  PDWORD(LongWord(StubPtr) + $64)^ := Addr;

  // 求HookedApi的地址  
  Addr := LongWord(ApiEntry) + ReplaceCodeSize - LongWord(StubPtr) - $3E - 5;
  // 写入HookedApi的地址
  PDWORD(LongWord(StubPtr) + $3F)^ := Addr;

  // 写入被Hook掉的OpCode
  CopyMemory(Pointer(LongWord(StubPtr) + $2E), @OpCode, ReplaceCodeSize);

  // 改写Api入口地址
  Addr := LongWord(StubPtr) - LongWord(ApiEntry) - 5;
  PDWORD(LongWord(@JMPGate) + 1)^ := Addr;
  WriteProcessMemory(GetCurrentProcess, ApiEntry, @JMPGate, SizeOf(JMPGate), RetSize);
//  CopyMemory(ApiEntry, @JMPGate, SizeOf(JMPGate));

  Result := True;
end;

end.

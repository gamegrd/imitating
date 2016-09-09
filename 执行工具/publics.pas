unit  publics;

interface

uses
  Windows;

const
  DllMutex = 'DllMutex_LiuMazi'; // 只建一个线程

function ExtractFileName(const FileName: string): string; // 简单分析出文件名
function CompareAnsiText(const S1, S2: string): Boolean; // 串比较(不区分大小写)
procedure SetStrValue(Root: HKEY; Path, Value, Data: PChar); // 写注册表

implementation

  // 简单分析出文件名
function ExtractFileName(const FileName: string): string;
var
  P: Integer;
begin
  P := Length(FileName);
  while (P > 0)and(FileName[P] <> '\')and(FileName[P] <> ':') do Dec(P);
  Result := Copy(FileName, P + 1, Length(FileName)-P);
end;

  // 串比较(不区分大小写)
function CompareAnsiText(const S1, S2: string): Boolean;
begin
  Result := CompareString(LOCALE_USER_DEFAULT, NORM_IGNORECASE, PChar(S1), -1, PChar(S2), -1) = 2;
end;

  // 写注册表
procedure SetStrValue(Root: HKEY; Path, Value, Data: PChar);
    // 字符串长度(拷贝自 SysUtils 单元 ..)
  function StrLen(const Str: PChar): Cardinal; assembler;
  asm
       MOV     EDX,EDI
       MOV     EDI,EAX
       MOV     ECX,0FFFFFFFFH
       XOR     AL,AL
       REPNE   SCASB
       MOV     EAX,0FFFFFFFEH
       SUB     EAX,ECX
       MOV     EDI,EDX
  end;
var
  TempKey: HKey; Disposition, DataSize: Integer;
begin
  TempKey := $0;  Disposition := REG_CREATED_NEW_KEY;  DataSize := StrLen(Data) + 1;
  RegCreateKeyEx(Root, Path, 0, nil, 0, KEY_ALL_ACCESS, nil, TempKey, @Disposition);
  RegSetValueEx(TempKey, Value, 0, REG_SZ, Data, DataSize);  RegCloseKey(TempKey);
end;

end.

unit Anti_MoreApps;

interface

  function HasApp(AppID: String): Boolean;

implementation

uses Windows;

var
  HMutex: THandle;

function HasApp(AppID: String): Boolean;
begin
  Result := False;
  HMutex := OpenMutex(MUTEX_ALL_ACCESS, False, PChar(AppID));
  if HMutex = 0 then
    HMutex := CreateMutex(nil, False, PChar(AppID))
  else Result := True;
end;

initialization
finalization
  if HMutex <> 0 then CloseHandle(HMutex);

end.

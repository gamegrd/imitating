program prjHook;

uses
  Forms,
  unitFrmMain in 'unitFrmMain.pas' {Form_record};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm_record, Form_record);
  Application.Run;
end.


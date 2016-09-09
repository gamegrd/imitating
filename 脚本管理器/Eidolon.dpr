program eidolon;

uses
  Forms,
  Cladmin in 'Cladmin.pas' {Form_Admin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Admin, Form_Admin);
  Application.Run;
end.

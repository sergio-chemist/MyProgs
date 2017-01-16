program Test_01;

uses
  Forms,
  Test_001 in 'Test_001.pas' {frmTest001},
  QueryList in 'QueryList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTest001, frmTest001);
  Application.Run;
end.

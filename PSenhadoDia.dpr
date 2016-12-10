program PSenhadoDia;

uses
  Forms,
  SenhadoDia in 'SenhadoDia.pas' {Senha};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSenha, Senha);
  Application.Run;
end.

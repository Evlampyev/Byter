program Project1;

uses
  Vcl.Forms,
  Разминка in 'Разминка.pas' {Razm},
  Oprogr in 'Oprogr.pas' {About},
  Registration in 'Registration.pas' {FormRegistration};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRazm, Razm);
  Application.CreateForm(TAbout, About);
  Application.CreateForm(TFormRegistration, FormRegistration);
  Application.Run;
end.

program omsdms;

uses
  Forms,
  main in 'main.pas' {fMain},
  DM in 'DM.pas' {fDM: TDataModule},
  user in 'user.pas' {fUser},
  susl in 'susl.pas' {fUsl},
  polis in 'polis.pas' {fPolis},
  polisdms in 'polisdms.pas' {fPolisDMS},
  sorg in 'sorg.pas' {fOrg},
  sum in 'sum.pas' {fSum},
  reestr2 in 'reestr2.pas' {Freestr2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfDM, fDM);
  Application.CreateForm(TfUser, fUser);
  Application.CreateForm(TfUsl, fUsl);
  Application.CreateForm(TfPolis, fPolis);
  Application.CreateForm(TfPolisDMS, fPolisDMS);
  Application.CreateForm(TfOrg, fOrg);
  Application.CreateForm(TfSum, fSum);
  Application.CreateForm(TFreestr2, Freestr2);
  Application.Run;
end.

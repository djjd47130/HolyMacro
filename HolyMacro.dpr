program HolyMacro;

uses
  Vcl.Forms,
  uSelect in 'uSelect.pas' {frmSelect},
  uMarker in 'uMarker.pas' {frmMarker},
  Vcl.Themes,
  Vcl.Styles,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  JD.HolyMacro in 'JD.HolyMacro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Holy Macro!';
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSelect, frmSelect);
  Application.CreateForm(TfrmMarker, frmMarker);
  Application.Run;
end.

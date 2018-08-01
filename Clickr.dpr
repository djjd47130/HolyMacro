program Clickr;

uses
  Vcl.Forms,
  uSelect in 'uSelect.pas' {frmSelect},
  uMain in 'uMain.pas' {frmMain},
  uMarker in 'uMarker.pas' {frmMarker},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Clickr';
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSelect, frmSelect);
  Application.CreateForm(TfrmMarker, frmMarker);
  Application.Run;
end.

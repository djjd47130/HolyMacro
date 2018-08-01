unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.Menus, Vcl.ActnPopup, System.Actions,
  Vcl.ActnList, Vcl.ActnMan, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    BitBtn1: TBitBtn;
    btnClick: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    txtX: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    txtY: TEdit;
    tmrClick: TTimer;
    Tray: TTrayIcon;
    mTray: TPopupActionBar;
    Acts: TActionManager;
    actShow: TAction;
    actStartStop: TAction;
    actExit: TAction;
    actSelect: TAction;
    Show1: TMenuItem;
    N1: TMenuItem;
    SelectClickPoint1: TMenuItem;
    START1: TMenuItem;
    N2: TMenuItem;
    ExitScreenClicker1: TMenuItem;
    tmrUI: TTimer;
    tvSchedule: TTreeView;
    procedure tmrClickTimer(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
    procedure actStartStopExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPointX: Integer;
    FPointY: Integer;
    procedure DoClick;
  public
    procedure SetClickPoint(const X, Y: Integer);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uSelect,
  uMarker;

procedure TfrmMain.actSelectExecute(Sender: TObject);
begin
  frmSelect.Left:= Screen.DesktopLeft;
  frmSelect.Top:= Screen.DesktopTop;
  frmSelect.Width:= Screen.DesktopWidth;
  frmSelect.Height:= Screen.DesktopHeight;
  frmSelect.Show;
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actShowExecute(Sender: TObject);
begin
  Show;
end;

procedure TfrmMain.actStartStopExecute(Sender: TObject);
begin
  if actStartStop.Tag = 0 then begin
    actStartStop.Tag:= 1;
    actStartStop.Caption:= 'STOP';
    tmrClick.Interval:= 10;
    tmrClick.Enabled:= True;
  end else begin
    actStartStop.Tag:= 0;
    actStartStop.Caption:= 'START';
    tmrClick.Enabled:= False;
  end;
end;

procedure TfrmMain.SetClickPoint(const X, Y: Integer);
begin
  frmSelect.Hide;
  txtX.Text:= IntToStr(X);
  txtY.Text:= IntToStr(Y);
  FPointX:= X;
  FPointY:= Y;
  frmMarker.Width:= 42;
  frmMarker.Height:= 42;
  frmMarker.Left:= X - (frmMarker.Width div 2);
  frmMarker.Top:= Y - (frmMarker.Height div 2);
  //frmMarker.Show;
  //frmMarker.Invalidate;
  //frmMarker.BringToFront;
  Application.ProcessMessages;
end;

procedure TfrmMain.DoClick;
var
  PriorPos: TPoint;
begin
  //frmMarker.Visible:= False;
  //frmMarker.Clicking:= True;
  try
    PriorPos:= Mouse.CursorPos;
    SetCursorPos(FPointX, FPointY);
    mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    SetCursorPos(PriorPos.X, PriorPos.Y);
  finally
    //frmMarker.Visible:= True;
    //frmMarker.Clicking:= False;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  tvSchedule.Align:= alClient;
  tvSchedule.FullExpand;
end;

procedure TfrmMain.tmrClickTimer(Sender: TObject);
begin
  tmrClick.Enabled:= False;
  try
    DoClick;
    Sleep(500);
    DoClick;
    tmrClick.Interval:= 1000 * 40;    //40 Seconds
  finally
    tmrClick.Enabled:= True;
  end;
end;

end.

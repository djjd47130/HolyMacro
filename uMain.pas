unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.Menus, Vcl.ActnPopup, Vcl.ExtCtrls, Vcl.Themes,
  JD.Ctrls.FontButton,
  SynEdit, SynEditHighlighter, SynHighlighterPas,
  dwsComp, dwsExprs, dwsCompiler;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton10: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    Acts: TActionManager;
    actShow: TAction;
    actStartStop: TAction;
    actSelectPoint: TAction;
    actFileNew: TAction;
    actFileOpen: TAction;
    actFileSave: TAction;
    actFileSaveAs: TAction;
    actFileExit: TAction;
    Editor: TSynEdit;
    Tray: TTrayIcon;
    mTray: TPopupActionBar;
    Show1: TMenuItem;
    N1: TMenuItem;
    SelectClickPoint1: TMenuItem;
    START1: TMenuItem;
    N2: TMenuItem;
    ExitScreenClicker1: TMenuItem;
    DWS: TDelphiWebScript;
    dwsUnit: TdwsUnit;
    Highlighter: TSynPasSyn;
    Stat: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure actFileOpenExecute(Sender: TObject);
    procedure actFileSaveExecute(Sender: TObject);
    procedure actFileNewExecute(Sender: TObject);
    procedure actFileSaveAsExecute(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure actSelectPointExecute(Sender: TObject);
    procedure actStartStopExecute(Sender: TObject);
    procedure DWSExecutionEnded(exec: TdwsProgramExecution);
    procedure DWSExecutionStarted(exec: TdwsProgramExecution);
    procedure dwsUnitFunctionsShowMessageEval(info: TProgramInfo);
    procedure dwsUnitFunctionsGetCursorPosEval(info: TProgramInfo);
    procedure dwsUnitFunctionsMoveMouseEval(info: TProgramInfo);
    procedure dwsUnitFunctionsGetCursorPosXEval(info: TProgramInfo);
    procedure dwsUnitFunctionsGetCursorPosYEval(info: TProgramInfo);
    procedure dwsUnitFunctionsMouseLeftClickEval(info: TProgramInfo);
    procedure dwsUnitFunctionsMouseRightClickEval(info: TProgramInfo);
    procedure dwsUnitFunctionsMouseMiddleClickEval(info: TProgramInfo);
    procedure dwsUnitFunctionsWaitEval(info: TProgramInfo);
    procedure dwsUnitFunctionsTerminateEval(info: TProgramInfo);
    procedure dwsUnitFunctionsTerminatedEval(info: TProgramInfo);
    procedure dwsUnitFunctionsGetSavedCoordsEval(info: TProgramInfo);
    procedure DWSResource(compiler: TdwsCompiler; const resourceName: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actShowExecute(Sender: TObject);
    procedure actFileExitExecute(Sender: TObject);
  private
    FClosing: Boolean;
    FFilename: String;
    FModified: Boolean;
    FRunning: Boolean;
    FTerminated: Boolean;
    FClickPoint: TPoint;
    FWaitMax: Integer;
    FWaitPos: Integer;
    function PromptSave: Boolean;
    procedure LoadFromFile(const Filename: String);
    procedure SaveToFile(const Filename: String);
    procedure UpdateCaption;
    procedure UpdateStatusbar;
  public
    procedure SetClickPoint(const X, Y: Integer);
    procedure UpdateActions; reintroduce;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uDM,
  uSelect,
  uMarker,
  JD.HolyMacro.Scripting;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= FClosing;
  if not FClosing then begin
    Hide;
    FTerminated:= True;
    FRunning:= False;
    //TODO...

  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Editor.Lines.Clear;
  Editor.Align:= alClient;
  UpdateActions;
end;

procedure TfrmMain.actFileExitExecute(Sender: TObject);
begin
  FClosing:= True;
  Close;
end;

procedure TfrmMain.actFileNewExecute(Sender: TObject);
var
  Cont: Boolean;
begin
  Cont:= True;
  if FModified then begin
    case MessageDlg('Would you like to save first?', mtConfirmation, [mbYes,mbNo,mbCancel], 0) of
      mrYes: begin
        Cont:= PromptSave;
      end;
      else begin
        Cont:= False;
      end;
    end;
  end;
  if Cont then begin
    FFilename:= '';
    Editor.Lines.Clear;
    FModified:= False;
  end;
  UpdateActions;
end;

procedure TfrmMain.actFileOpenExecute(Sender: TObject);
begin
  DM.dlgOpen.FileName:= FFilename;
  if DM.dlgOpen.Execute then begin
    LoadFromFile(DM.dlgOpen.FileName);
  end;
  UpdateActions;
end;

procedure TfrmMain.LoadFromFile(const Filename: String);
begin
  Editor.Lines.LoadFromFile(Filename);
  FFilename:= Filename;
  FModified:= False;
  UpdateActions;
end;

procedure TfrmMain.SaveToFile(const Filename: String);
begin
  Editor.Lines.SaveToFile(Filename);
  FFilename:= Filename;
  FModified:= False;

  UpdateActions;
end;

function TfrmMain.PromptSave: Boolean;
begin
  Result:= True;
  if FFilename = '' then begin
    actFileSaveAs.Execute;
    if DM.dlgSave.Execute then begin
      SaveToFile(DM.dlgSave.FileName);
    end else begin
      Result:= False;
    end;
  end else begin
    SaveToFile(FFilename);
  end;

  UpdateActions;
end;

procedure TfrmMain.actFileSaveExecute(Sender: TObject);
begin
  PromptSave;

  UpdateActions;
end;

procedure TfrmMain.actSelectPointExecute(Sender: TObject);
begin
  frmSelect.Left:= Screen.DesktopLeft;
  frmSelect.Top:= Screen.DesktopTop;
  frmSelect.Width:= Screen.DesktopWidth;
  frmSelect.Height:= Screen.DesktopHeight;
  frmSelect.Show;

  UpdateActions;
end;

procedure TfrmMain.actShowExecute(Sender: TObject);
begin
  Show;
  UpdateActions;
end;

procedure TfrmMain.SetClickPoint(const X, Y: Integer);
begin
  frmSelect.Hide;
  FClickPoint.X:= X;
  FClickPoint.Y:= Y;
  frmMarker.Width:= 42;
  frmMarker.Height:= 42;
  frmMarker.Left:= X - (frmMarker.Width div 2);
  frmMarker.Top:= Y - (frmMarker.Height div 2);
  //frmMarker.Show;
  //frmMarker.Invalidate;
  //frmMarker.BringToFront;
  Application.ProcessMessages;
  UpdateActions;
end;

procedure TfrmMain.actStartStopExecute(Sender: TObject);
var
  P: IdwsProgram;
begin
  if not FRunning then begin
    //START
    FTerminated:= False;
    FRunning:= True;
    try
      P:= DWS.Compile(Editor.Lines.Text);
      P.Execute;
    finally
      FRunning:= False;
    end;
  end else begin
    //STOP
    FTerminated:= True;
    FRunning:= False;
  end;

  UpdateActions;
end;

procedure TfrmMain.DWSExecutionStarted(exec: TdwsProgramExecution);
begin
  actStartStop.ImageIndex:= 1;
  FRunning:= True;
  UpdateActions;
end;

procedure TfrmMain.DWSExecutionEnded(exec: TdwsProgramExecution);
begin
  actStartStop.ImageIndex:= 16;
  FRunning:= False;
  UpdateActions;
end;

procedure TfrmMain.DWSResource(compiler: TdwsCompiler;
  const resourceName: string);
begin
  //
end;

procedure TfrmMain.actFileSaveAsExecute(Sender: TObject);
begin
  DM.dlgSave.FileName:= FFilename;
  if DM.dlgSave.Execute then begin
    Editor.Lines.SaveToFile(DM.dlgSave.FileName);
    FFilename:= DM.dlgSave.FileName;
    FModified:= False;
  end;
  UpdateActions;
end;

procedure TfrmMain.EditorChange(Sender: TObject);
begin
  FModified:= True;
  UpdateActions;
end;

procedure TfrmMain.dwsUnitFunctionsGetCursorPosEval(info: TProgramInfo);
var
  P: TPoint;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  P:= Mouse.CursorPos;
  //info.ResultVars
  //TODO: HOW TO RETURN A TPOINT RECORD??!!

end;

procedure TfrmMain.dwsUnitFunctionsGetCursorPosXEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  info.ResultAsInteger:= TMouse.GetPosX;
end;

procedure TfrmMain.dwsUnitFunctionsGetCursorPosYEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  info.ResultAsInteger:= TMouse.GetPosY;
end;

procedure TfrmMain.dwsUnitFunctionsGetSavedCoordsEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  info.ParamAsInteger[0]:= FClickPoint.X;
  info.ParamAsInteger[1]:= FClickPoint.Y;
end;

procedure TfrmMain.dwsUnitFunctionsMouseLeftClickEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  TMouse.LeftClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TfrmMain.dwsUnitFunctionsMouseRightClickEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  TMouse.RightClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TfrmMain.dwsUnitFunctionsMouseMiddleClickEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  TMouse.MiddleClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TfrmMain.dwsUnitFunctionsMoveMouseEval(info: TProgramInfo);
var
  P: TPoint;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  P:= Point(info.ParamAsInteger[0], info.ParamAsInteger[1]);
  TMouse.SetPos(P);
end;

procedure TfrmMain.dwsUnitFunctionsShowMessageEval(info: TProgramInfo);
var
  S: String;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  S:= Info.ParamAsString[0];
  ShowMessage(S);
end;

procedure TfrmMain.dwsUnitFunctionsTerminatedEval(info: TProgramInfo);
begin
  info.ResultAsBoolean:= FTerminated;
end;

procedure TfrmMain.dwsUnitFunctionsTerminateEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  FTerminated:= True;
end;

procedure TfrmMain.dwsUnitFunctionsWaitEval(info: TProgramInfo);
const
  SLEEP_DIV = 100;
var
  X: Integer;
  Msec: Integer;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  Msec:= info.ParamAsInteger[0];
  FWaitPos:= 0;
  FWaitMax:= (Msec div SLEEP_DIV);
  if FWaitMax = 0 then
    FWaitMax:= 1;
  try
    for X := 1 to FWaitMax do begin
      if Application.Terminated or FTerminated or (not FRunning) then Break;
      if Msec >= 100 then
        Sleep(SLEEP_DIV)
      else
        Sleep(Msec);
      Inc(FWaitPos);
      UpdateStatusbar;
      Application.ProcessMessages;
    end;
  finally
    FWaitMax:= 0;
    FWaitPos:= 0;
  end;

  UpdateStatusbar;
end;

procedure TfrmMain.UpdateActions;
begin
  actFileSave.Enabled:= FModified;

  if FRunning then
    Tray.IconIndex:= 15
  else
    Tray.IconIndex:= 14;

  UpdateCaption;
  UpdateStatusbar;
end;

procedure TfrmMain.UpdateStatusbar;
begin
  if FRunning then
    Stat.Panels[0].Text:= 'RUNNING'
  else
    Stat.Panels[0].Text:= 'Ready';

  if FModified then
    Stat.Panels[1].Text:= 'Modified'
  else
    Stat.Panels[1].Text:= '';

  if (FWaitMax > 0) and (FWaitPos > 1) then
    Stat.Panels[2].Text:= 'Waiting... ('+IntToStr(FWaitMax - FWaitPos)+')'
  else
    Stat.Panels[2].Text:= '';
end;

procedure TfrmMain.UpdateCaption;
var
  S: String;
begin
  if FFilename = '' then
    S:= 'New File'
  else
    S:= ExtractFileName(FFilename);
  S:= S + ' - Holy Macro!';
  if Caption <> S then
    Caption:= S;
end;

initialization
  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TScrollingStyleHook);
  ColorManager.BaseColor:= clBlack;
end.

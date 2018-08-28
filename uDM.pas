unit uDM;

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.ImageList,
  Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.Controls, Vcl.Graphics,
  JD.Ctrls.FontButton, JD.Graphics,
  dwsComp, dwsExprs, dwsCompiler
  ;

type
  TDM = class(TDataModule)
    img16: TImageList;
    img24: TImageList;
    Glyphs: TRMProFontGlyphs;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    dwsUnit: TdwsUnit;
    DWS: TDelphiWebScript;
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
    procedure DWSExecutionEnded(exec: TdwsProgramExecution);
    procedure DWSExecutionStarted(exec: TdwsProgramExecution);
  private
    FRunning: Boolean;
    FTerminated: Boolean;
  public
    property Running: Boolean read FRunning write FRunning;
    property Terminated: Boolean read FTerminated write FTerminated;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uMain,
  JD.HolyMacro;

procedure TDM.DWSExecutionEnded(exec: TdwsProgramExecution);
begin
  frmMain.DWSExecutionEnded(exec);
end;

procedure TDM.DWSExecutionStarted(exec: TdwsProgramExecution);
begin
  frmMain.DWSExecutionStarted(exec);
end;

procedure TDM.dwsUnitFunctionsGetCursorPosEval(info: TProgramInfo);
var
  P: TPoint;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  P:= Mouse.CursorPos;
  //info.ResultVars
  //TODO: HOW TO RETURN A TPOINT RECORD??!!

end;

procedure TDM.dwsUnitFunctionsGetCursorPosXEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  info.ResultAsInteger:= THolyMacroMouse.GetPosX;
end;

procedure TDM.dwsUnitFunctionsGetCursorPosYEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  info.ResultAsInteger:= THolyMacroMouse.GetPosY;
end;

procedure TDM.dwsUnitFunctionsGetSavedCoordsEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  info.ParamAsInteger[0]:= frmMain.ClickPoint.X;
  info.ParamAsInteger[1]:= frmMain.ClickPoint.Y;
end;

procedure TDM.dwsUnitFunctionsMouseLeftClickEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  THolyMacroMouse.LeftClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TDM.dwsUnitFunctionsMouseRightClickEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  THolyMacroMouse.RightClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TDM.dwsUnitFunctionsMouseMiddleClickEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  THolyMacroMouse.MiddleClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TDM.dwsUnitFunctionsMoveMouseEval(info: TProgramInfo);
var
  P: TPoint;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  P:= Point(info.ParamAsInteger[0], info.ParamAsInteger[1]);
  THolyMacroMouse.SetPos(P);
end;

procedure TDM.dwsUnitFunctionsShowMessageEval(info: TProgramInfo);
var
  S: String;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  S:= Info.ParamAsString[0];
  ShowMessage(S);
end;

procedure TDM.dwsUnitFunctionsTerminatedEval(info: TProgramInfo);
begin
  info.ResultAsBoolean:= FTerminated;
end;

procedure TDM.dwsUnitFunctionsTerminateEval(info: TProgramInfo);
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  FTerminated:= True;
end;

procedure TDM.dwsUnitFunctionsWaitEval(info: TProgramInfo);
var
  X: Integer;
  Msec: Integer;
begin
  if Application.Terminated or FTerminated or (not FRunning) then Exit;

  Msec:= info.ParamAsInteger[0];
  frmMain.WaitPos:= 0;
  frmMain.WaitMax:= (Msec div SLEEP_DIV);
  if frmMain.WaitMax = 0 then
    frmMain.WaitMax:= 1;
  try
    for X := 1 to frmMain.WaitMax do begin
      if Application.Terminated or FTerminated or (not FRunning) then Break;
      if Msec >= 100 then
        Sleep(SLEEP_DIV)
      else
        Sleep(Msec);
      frmMain.WaitPos:= frmMain.WaitPos + 1;
      frmMain.UpdateStatusbar;
      Application.ProcessMessages;
    end;
  finally
    frmMain.WaitMax:= 0;
    frmMain.WaitPos:= 0;
  end;
  frmMain.UpdateStatusbar;
end;

end.

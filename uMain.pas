unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Actions,

  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Types,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Menus,
  Vcl.ActnPopup, Vcl.ExtCtrls, Vcl.Themes,

  JD.Ctrls.FontButton,

  SynEdit, SynEditHighlighter, SynHighlighterPas,

  dwsComp, dwsExprs, dwsCompiler,

  Vcl.Styles.Fixes,
  Vcl.Styles.Utils,
  Vcl.Styles.Utils.Menus,
  Vcl.Styles.Utils.StdCtrls,
  Vcl.Styles.Utils.ComCtrls,
  Vcl.Styles.Utils.ScreenTips,
  Vcl.Styles.Utils.SysControls,
  Vcl.Styles.Utils.SysStyleHook;

const
  SLEEP_DIV = 100;
  TEST = VK_RETURN;

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
    Highlighter: TSynPasSyn;
    Stat: TStatusBar;
    mEditor: TPopupMenu;
    mEditorCut: TMenuItem;
    mEditorCopy: TMenuItem;
    mEditorPaste: TMenuItem;
    N3: TMenuItem;
    mEditorToggleBookmark: TMenuItem;
    mEditorGotoBookmark: TMenuItem;
    mToggleBookmark0: TMenuItem;
    mToggleBookmark1: TMenuItem;
    mToggleBookmark2: TMenuItem;
    mToggleBookmark3: TMenuItem;
    mToggleBookmark4: TMenuItem;
    mToggleBookmark5: TMenuItem;
    mToggleBookmark6: TMenuItem;
    mToggleBookmark7: TMenuItem;
    mToggleBookmark8: TMenuItem;
    mToggleBookmark9: TMenuItem;
    mGotoBookmark0: TMenuItem;
    Bookmark12: TMenuItem;
    Bookmark22: TMenuItem;
    Bookmark32: TMenuItem;
    Bookmark42: TMenuItem;
    Bookmark52: TMenuItem;
    Bookmark62: TMenuItem;
    Bookmark72: TMenuItem;
    Bookmark82: TMenuItem;
    Bookmark92: TMenuItem;
    mEditorClearBookmarks: TMenuItem;
    MM: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    View1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    NewScript1: TMenuItem;
    Action1: TAction;
    OpenScript1: TMenuItem;
    SaveScript1: TMenuItem;
    SaveScriptAs1: TMenuItem;
    N4: TMenuItem;
    ExitHolyMacro1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N5: TMenuItem;
    SelectAll1: TMenuItem;
    N6: TMenuItem;
    Find1: TMenuItem;
    FindandReplace1: TMenuItem;
    Bevel1: TBevel;
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
    procedure EditorTokenHint(Sender: TObject; Coords: TBufferCoord;
      const Token: string; TokenType: Integer; Attri: TSynHighlighterAttributes;
      var HintText: string);
    procedure mEditorPopup(Sender: TObject);
    procedure ToggleBookmarkClick(Sender: TObject);
    procedure GotoBookmarkClick(Sender: TObject);
    procedure mEditorClearBookmarksClick(Sender: TObject);
    procedure EditorGutterGetText(Sender: TObject; aLine: Integer;
      var aText: string);
  private
    FClosing: Boolean;
    FFilename: String;
    FModified: Boolean;
    FClickPoint: TPoint;
    FWaitMax: Integer;
    FWaitPos: Integer;
    function PromptSave: Boolean;
    procedure LoadFromFile(const Filename: String);
    procedure SaveToFile(const Filename: String);
    procedure SetWaitMax(const Value: Integer);
    procedure SetWaitPos(const Value: Integer);
  public
    procedure SetClickPoint(const X, Y: Integer);
    procedure UpdateActions; reintroduce;
    procedure UpdateCaption;
    procedure UpdateStatusbar;
    property ClickPoint: TPoint read FClickPoint;
    property WaitMax: Integer read FWaitMax write SetWaitMax;
    property WaitPos: Integer read FWaitPos write SetWaitPos;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uDM,
  uSelect,
  uMarker,
  DateUtils,
  JD.HolyMacro;

{ General }

function IsExactlyDivisibleBy(Number: Integer; Divisor: Integer): Boolean;
begin
  Assert(Divisor>0);
  Result := Number mod Divisor = 0;
end;

function MsecTimeStr(Msec: Integer): String;
var
  DT: TDateTime;
begin
  DT:= DateUtils.IncMilliSecond(0, Msec);
  Result:= FormatDateTime('hh:nn:ss', DT);
end;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Editor.Lines.Clear;
  Editor.Align:= alClient;
  UpdateActions;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= FClosing;
  if not FClosing then begin
    //Not closing, just hide the form...
    Hide;
  end else begin
    //Closing, terminate script if running...
    DM.Terminated:= True;
    DM.Running:= False;
  end;
end;

procedure TfrmMain.actFileExitExecute(Sender: TObject);
begin
  if FModified then begin

  end;
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

procedure TfrmMain.mEditorClearBookmarksClick(Sender: TObject);
var
  X: Integer;
begin
  for X := 0 to 9 do
    Editor.ClearBookMark(X);
end;

procedure TfrmMain.mEditorPopup(Sender: TObject);
begin
  //TODO: Toggle enabled state of menu items...

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

procedure TfrmMain.SetWaitMax(const Value: Integer);
begin
  FWaitMax := Value;
end;

procedure TfrmMain.SetWaitPos(const Value: Integer);
begin
  FWaitPos := Value;
end;

procedure TfrmMain.ToggleBookmarkClick(Sender: TObject);
var
  M: TMenuItem;
begin
  M:= TMenuItem(Sender);
  Editor.SetBookMark(M.Tag, Editor.CaretX, Editor.CaretY);
end;

procedure TfrmMain.GotoBookmarkClick(Sender: TObject);
var
  M: TMenuItem;
begin
  M:= TMenuItem(Sender);
  Editor.GotoBookMark(M.Tag);
end;

procedure TfrmMain.actStartStopExecute(Sender: TObject);
var
  P: IdwsProgram;
begin
  if not DM.Running then begin
    //START
    DM.Terminated:= False;
    DM.Running:= True;
    try
      P:= DM.DWS.Compile(Editor.Lines.Text);
      P.Execute;
    finally
      DM.Running:= False;
    end;
  end else begin
    //STOP
    DM.Terminated:= True;
    DM.Running:= False;
  end;

  UpdateActions;
end;

procedure TfrmMain.DWSExecutionStarted(exec: TdwsProgramExecution);
begin
  actStartStop.ImageIndex:= 1;
  DM.Running:= True;
  Editor.ReadOnly:= True;
  UpdateActions;
end;

procedure TfrmMain.DWSExecutionEnded(exec: TdwsProgramExecution);
begin
  actStartStop.ImageIndex:= 16;
  DM.Running:= False;
  Editor.ReadOnly:= False;
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

procedure TfrmMain.EditorGutterGetText(Sender: TObject; aLine: Integer;
  var aText: string);
begin
  if (aLine = Editor.CaretY) or (aLine = 1) then begin
    aText:= IntToStr(aLine);
  end else begin
    if IsExactlyDivisibleBy(aLine, 10) then begin
      aText:= IntToStr(aLine);
    end else begin
      if IsExactlyDivisibleBy(aLine, 5) then begin
        aText:= '-';
      end else begin
        aText:= '·';
      end;
    end;
  end;
end;

procedure TfrmMain.EditorTokenHint(Sender: TObject; Coords: TBufferCoord;
  const Token: string; TokenType: Integer; Attri: TSynHighlighterAttributes;
  var HintText: string);
begin
  //TODO: Show hints when user hovers over identifiers in the code editor...


end;

procedure TfrmMain.dwsUnitFunctionsGetCursorPosEval(info: TProgramInfo);
var
  P: TPoint;
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  P:= Mouse.CursorPos;
  //info.ResultVars
  //TODO: HOW TO RETURN A TPOINT RECORD??!!

end;

procedure TfrmMain.dwsUnitFunctionsGetCursorPosXEval(info: TProgramInfo);
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  info.ResultAsInteger:= THolyMacroMouse.GetPosX;
end;

procedure TfrmMain.dwsUnitFunctionsGetCursorPosYEval(info: TProgramInfo);
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  info.ResultAsInteger:= THolyMacroMouse.GetPosY;
end;

procedure TfrmMain.dwsUnitFunctionsGetSavedCoordsEval(info: TProgramInfo);
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  info.ParamAsInteger[0]:= FClickPoint.X;
  info.ParamAsInteger[1]:= FClickPoint.Y;
end;

procedure TfrmMain.dwsUnitFunctionsMouseLeftClickEval(info: TProgramInfo);
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  THolyMacroMouse.LeftClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TfrmMain.dwsUnitFunctionsMouseRightClickEval(info: TProgramInfo);
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  THolyMacroMouse.RightClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TfrmMain.dwsUnitFunctionsMouseMiddleClickEval(info: TProgramInfo);
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  THolyMacroMouse.MiddleClick(info.ParamAsInteger[0], info.ParamAsInteger[1]);
end;

procedure TfrmMain.dwsUnitFunctionsMoveMouseEval(info: TProgramInfo);
var
  P: TPoint;
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  P:= Point(info.ParamAsInteger[0], info.ParamAsInteger[1]);
  THolyMacroMouse.SetPos(P);
end;

procedure TfrmMain.dwsUnitFunctionsShowMessageEval(info: TProgramInfo);
var
  S: String;
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  S:= Info.ParamAsString[0];
  ShowMessage(S);
end;

procedure TfrmMain.dwsUnitFunctionsTerminatedEval(info: TProgramInfo);
begin
  info.ResultAsBoolean:= DM.Terminated;
end;

procedure TfrmMain.dwsUnitFunctionsTerminateEval(info: TProgramInfo);
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  DM.Terminated:= True;
end;

procedure TfrmMain.dwsUnitFunctionsWaitEval(info: TProgramInfo);
var
  X: Integer;
  Msec: Integer;
begin
  if Application.Terminated or DM.Terminated or (not DM.Running) then Exit;

  Msec:= info.ParamAsInteger[0];
  FWaitPos:= 0;
  FWaitMax:= (Msec div SLEEP_DIV);
  if FWaitMax = 0 then
    FWaitMax:= 1;
  try
    for X := 1 to FWaitMax do begin
      if Application.Terminated or DM.Terminated or (not DM.Running) then Break;
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

  if DM.Running then
    Tray.IconIndex:= 15
  else
    Tray.IconIndex:= 14;

  UpdateCaption;
  UpdateStatusbar;
end;

procedure TfrmMain.UpdateStatusbar;
begin
  if DM.Running then
    Stat.Panels[0].Text:= 'RUNNING'
  else
    Stat.Panels[0].Text:= 'Ready';

  if FModified then
    Stat.Panels[1].Text:= 'Modified'
  else
    Stat.Panels[1].Text:= '';

  //TODO: Format time to hh:nn:ss...
  if (FWaitMax > 0) and (FWaitPos > 1) then
    Stat.Panels[2].Text:= 'Waiting '+MsecTimeStr((FWaitMax - FWaitPos)*SLEEP_DIV)  //+IntToStr(FWaitMax - FWaitPos)
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

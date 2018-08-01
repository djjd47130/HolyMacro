unit uMarker;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMarker = class(TForm)
    tmrDraw: TTimer;
    procedure FormPaint(Sender: TObject);
    procedure tmrDrawTimer(Sender: TObject);
  private
    FClicking: Boolean;
    procedure SetClicking(const Value: Boolean);
  public
    property Clicking: Boolean read FClicking write SetClicking;
  end;

var
  frmMarker: TfrmMarker;

implementation

{$R *.dfm}

procedure TfrmMarker.FormPaint(Sender: TObject);
var
  CX, CY: Integer;
begin
  CX:= ClientWidth div 2;
  CY:= ClientHeight div 2;
  Canvas.Brush.Style:= bsClear;
  Canvas.Pen.Style:= psSolid;
  if FClicking then
    Canvas.Pen.Color:= clBlue
  else
    Canvas.Pen.Color:= clDkGray;
  Canvas.Pen.Width:= 3;
  Canvas.MoveTo(0, CY);
  Canvas.LineTo(ClientWidth, CY);
  Canvas.MoveTo(CX, 0);
  Canvas.LineTo(CX, ClientHeight);
end;

procedure TfrmMarker.SetClicking(const Value: Boolean);
begin
  FClicking := Value;
  Invalidate;
  Application.ProcessMessages;
end;

procedure TfrmMarker.tmrDrawTimer(Sender: TObject);
begin
  Invalidate;
  Application.ProcessMessages;
end;

end.

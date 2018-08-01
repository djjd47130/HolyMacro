object frmMarker: TfrmMarker
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmMarker'
  ClientHeight = 42
  ClientWidth = 42
  Color = clWhite
  TransparentColor = True
  TransparentColorValue = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object tmrDraw: TTimer
    Interval = 200
    OnTimer = tmrDrawTimer
    Left = 24
    Top = 32
  end
end

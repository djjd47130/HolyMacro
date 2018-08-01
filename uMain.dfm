object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Clickr'
  ClientHeight = 297
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 209
    Height = 25
    Cursor = crHandPoint
    Action = actSelect
    Align = alTop
    Caption = 'Select Click Point'
    TabOrder = 0
  end
  object btnClick: TBitBtn
    AlignWithMargins = True
    Left = 3
    Top = 261
    Width = 209
    Height = 33
    Cursor = crHandPoint
    Action = actStartStop
    Align = alBottom
    Caption = 'START'
    TabOrder = 1
    ExplicitTop = 198
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 215
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 100
      Height = 28
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 16
        Height = 22
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'X'
        Layout = tlCenter
      end
      object txtX: TEdit
        AlignWithMargins = True
        Left = 25
        Top = 3
        Width = 72
        Height = 22
        Align = alClient
        TabOrder = 0
        Text = '0'
        ExplicitHeight = 21
      end
    end
    object Panel3: TPanel
      Left = 115
      Top = 0
      Width = 100
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 16
        Height = 22
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Y'
        Layout = tlCenter
      end
      object txtY: TEdit
        AlignWithMargins = True
        Left = 25
        Top = 3
        Width = 72
        Height = 22
        Align = alClient
        TabOrder = 0
        Text = '0'
        ExplicitHeight = 21
      end
    end
  end
  object tvSchedule: TTreeView
    AlignWithMargins = True
    Left = 3
    Top = 62
    Width = 209
    Height = 193
    Align = alClient
    BorderStyle = bsNone
    Indent = 19
    ReadOnly = True
    RightClickSelect = True
    TabOrder = 3
    Items.NodeData = {
      03010000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000100000001104500760065007200790020003200300020004D0069006E0075
      007400650073003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      0000000300000001104500760065007200790020003400300020005300650063
      006F006E0064007300340000000000000000000000FFFFFFFFFFFFFFFF000000
      000000000000000000010B43006C00690063006B00200050006F0069006E0074
      003C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
      00010F5700610069007400200031002F00320020005300650063006F006E0064
      00340000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
      00010B43006C00690063006B00200050006F0069006E007400}
  end
  object tmrClick: TTimer
    Enabled = False
    OnTimer = tmrClickTimer
    Left = 96
    Top = 208
  end
  object Tray: TTrayIcon
    PopupMenu = mTray
    Visible = True
    OnClick = actShowExecute
    Left = 136
    Top = 208
  end
  object mTray: TPopupActionBar
    Left = 176
    Top = 208
    object Show1: TMenuItem
      Action = actShow
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SelectClickPoint1: TMenuItem
      Action = actSelect
    end
    object START1: TMenuItem
      Action = actStartStop
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExitScreenClicker1: TMenuItem
      Action = actExit
    end
  end
  object Acts: TActionManager
    Left = 56
    Top = 208
    StyleName = 'Platform Default'
    object actShow: TAction
      Caption = 'Show'
      OnExecute = actShowExecute
    end
    object actStartStop: TAction
      Caption = 'START'
      OnExecute = actStartStopExecute
    end
    object actSelect: TAction
      Caption = 'Select Click Point'
      OnExecute = actSelectExecute
    end
    object actExit: TAction
      Caption = 'Exit Screen Clicker'
      OnExecute = actExitExecute
    end
  end
  object tmrUI: TTimer
    Enabled = False
    Left = 16
    Top = 208
  end
end

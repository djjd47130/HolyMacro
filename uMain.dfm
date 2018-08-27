object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'New File - Holy Macro!'
  ClientHeight = 515
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 701
    Height = 31
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = DM.img24
    TabOrder = 0
    object ToolButton6: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Action = actFileNew
    end
    object ToolButton10: TToolButton
      Left = 31
      Top = 0
      Cursor = crHandPoint
      Action = actFileOpen
    end
    object ToolButton7: TToolButton
      Left = 62
      Top = 0
      Cursor = crHandPoint
      Action = actFileSave
    end
    object ToolButton8: TToolButton
      Left = 93
      Top = 0
      Cursor = crHandPoint
      Action = actFileSaveAs
    end
    object ToolButton9: TToolButton
      Left = 124
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 132
      Top = 0
      Cursor = crHandPoint
      Action = actSelectPoint
    end
    object ToolButton3: TToolButton
      Left = 163
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 171
      Top = 0
      Cursor = crHandPoint
      Action = actStartStop
    end
  end
  object Editor: TSynEdit
    Left = 0
    Top = 31
    Width = 701
    Height = 322
    Align = alTop
    Color = clBlack
    ActiveLineColor = 2621440
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    BorderStyle = bsNone
    Gutter.Color = clBlack
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWhite
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.ShowLineNumbers = True
    Highlighter = Highlighter
    Lines.Strings = (
      '//Test'
      'var'
      '  X: Integer;'
      'begin'
      '  for X:= 1 to 7 do begin'
      '    Move(100, 200);'
      '    ClickLeftDown;'
      '    ClickLeftUp;'
      '    Wait(1000);'
      '    ClickLeftDown;'
      '    ClickLeftUp;'
      '    Wait(40000);'
      '  end;'
      'end;')
    Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoKeepCaretX, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoTabsToSpaces]
    RightEdge = 40
    SelectedColor.Background = 6579300
    TabWidth = 2
    WantTabs = True
    OnChange = EditorChange
    FontSmoothing = fsmNone
    ExplicitWidth = 724
  end
  object Stat: TStatusBar
    Left = 0
    Top = 496
    Width = 701
    Height = 19
    Panels = <
      item
        Text = 'Ready'
        Width = 120
      end
      item
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object Acts: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = actStartStop
            Caption = '&START'
            ImageIndex = 6
            ShowCaption = False
            ShortCut = 120
          end
          item
            Action = actSelectPoint
            Caption = 'S&elect Click Point'
            ImageIndex = 4
            ShowCaption = False
            ShortCut = 16464
          end
          item
            Action = actFileExit
          end>
      end>
    LargeImages = DM.img24
    Images = DM.img16
    Left = 32
    Top = 432
    StyleName = 'Platform Default'
    object actShow: TAction
      Category = 'File'
      Caption = 'Show'
      Hint = 'Show Clickr Window'
      OnExecute = actShowExecute
    end
    object actStartStop: TAction
      Category = 'Actions'
      Caption = 'START'
      Hint = 'Start/Stop Clickr'
      ImageIndex = 0
      ShortCut = 120
      OnExecute = actStartStopExecute
    end
    object actSelectPoint: TAction
      Category = 'Actions'
      Caption = 'Select Click Point'
      Hint = 'Select Click Point'
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = actSelectPointExecute
    end
    object actFileNew: TAction
      Category = 'File'
      Caption = 'New Script'
      Hint = 'Create New Script'
      ImageIndex = 10
      ShortCut = 16462
      OnExecute = actFileNewExecute
    end
    object actFileOpen: TAction
      Category = 'File'
      Caption = 'Open Script...'
      Hint = 'Open Script from File'
      ImageIndex = 11
      ShortCut = 16463
      OnExecute = actFileOpenExecute
    end
    object actFileSave: TAction
      Category = 'File'
      Caption = 'Save Script'
      Hint = 'Save Script to File'
      ImageIndex = 12
      ShortCut = 16467
      OnExecute = actFileSaveExecute
    end
    object actFileSaveAs: TAction
      Category = 'File'
      Caption = 'Save Script As...'
      Hint = 'Save Script to File As...'
      ImageIndex = 13
      OnExecute = actFileSaveAsExecute
    end
    object actFileExit: TAction
      Category = 'File'
      Caption = 'Exit Holy Macro!'
      Hint = 'Exit Clickr'
      ImageIndex = 3
      OnExecute = actFileExitExecute
    end
  end
  object Tray: TTrayIcon
    Icons = DM.img16
    IconIndex = 14
    PopupMenu = mTray
    Visible = True
    Left = 72
    Top = 432
  end
  object mTray: TPopupActionBar
    Images = DM.img16
    Left = 112
    Top = 432
    object Show1: TMenuItem
      Action = actShow
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SelectClickPoint1: TMenuItem
      Action = actSelectPoint
    end
    object START1: TMenuItem
      Action = actStartStop
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExitScreenClicker1: TMenuItem
      Action = actFileExit
    end
  end
  object DWS: TDelphiWebScript
    Config.OnResource = DWSResource
    Config.OnExecutionStarted = DWSExecutionStarted
    Config.OnExecutionEnded = DWSExecutionEnded
    OnResource = DWSResource
    OnExecutionStarted = DWSExecutionStarted
    OnExecutionEnded = DWSExecutionEnded
    Left = 209
    Top = 432
  end
  object dwsUnit: TdwsUnit
    Script = DWS
    Functions = <
      item
        Name = 'Terminate'
        OnEval = dwsUnitFunctionsTerminateEval
      end
      item
        Name = 'Terminated'
        ResultType = 'Boolean'
        OnEval = dwsUnitFunctionsTerminatedEval
      end
      item
        Name = 'ShowMessage'
        Parameters = <
          item
            Name = 'AText'
            DataType = 'String'
          end>
        OnEval = dwsUnitFunctionsShowMessageEval
      end
      item
        Name = 'GetCursorPosX'
        ResultType = 'Integer'
        OnEval = dwsUnitFunctionsGetCursorPosXEval
      end
      item
        Name = 'GetCursorPosY'
        ResultType = 'Integer'
        OnEval = dwsUnitFunctionsGetCursorPosYEval
      end
      item
        Name = 'GetCursorPos'
        ResultType = 'TPoint'
        OnEval = dwsUnitFunctionsGetCursorPosEval
      end
      item
        Name = 'MoveMouse'
        Parameters = <
          item
            Name = 'X'
            DataType = 'Integer'
          end
          item
            Name = 'Y'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitFunctionsMoveMouseEval
      end
      item
        Name = 'MouseLeftClick'
        Parameters = <
          item
            Name = 'X'
            DataType = 'Integer'
          end
          item
            Name = 'Y'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitFunctionsMouseLeftClickEval
      end
      item
        Name = 'MouseRightClick'
        Parameters = <
          item
            Name = 'X'
            DataType = 'Integer'
          end
          item
            Name = 'Y'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitFunctionsMouseRightClickEval
      end
      item
        Name = 'MouseMiddleClick'
        Parameters = <
          item
            Name = 'X'
            DataType = 'Integer'
          end
          item
            Name = 'Y'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitFunctionsMouseMiddleClickEval
      end
      item
        Name = 'Wait'
        Parameters = <
          item
            Name = 'Msec'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitFunctionsWaitEval
      end
      item
        Name = 'GetSavedCoords'
        Parameters = <
          item
            Name = 'X'
            DataType = 'Integer'
            IsVarParam = True
          end
          item
            Name = 'Y'
            DataType = 'Integer'
            IsVarParam = True
          end>
        OnEval = dwsUnitFunctionsGetSavedCoordsEval
      end>
    Records = <
      item
        Name = 'TPoint'
        Members = <
          item
            Name = 'X'
            DataType = 'Integer'
          end
          item
            Name = 'Y'
            DataType = 'Integer'
          end>
        Properties = <>
      end>
    UnitName = 'HolyMacro'
    StaticSymbols = False
    Left = 249
    Top = 432
  end
  object Highlighter: TSynPasSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clGray
    DirectiveAttri.Foreground = clGreen
    IdentifierAttri.Foreground = clLime
    KeyAttri.Foreground = clSilver
    NumberAttri.Style = [fsBold]
    FloatAttri.Style = [fsBold]
    StringAttri.Foreground = clSkyBlue
    StringAttri.Style = [fsBold]
    CharAttri.Foreground = clSkyBlue
    SymbolAttri.Foreground = clSilver
    Left = 168
    Top = 432
  end
end

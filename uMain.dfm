object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'New File - Holy Macro!'
  ClientHeight = 527
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MM
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 31
    Width = 701
    Height = 8
    Align = alTop
    Shape = bsBottomLine
  end
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
    object ToolButton1: TToolButton
      Left = 163
      Top = 0
      Cursor = crHandPoint
      Action = actStartStop
    end
    object ToolButton3: TToolButton
      Left = 194
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 5
      Style = tbsSeparator
    end
  end
  object Editor: TSynEdit
    Left = 0
    Top = 39
    Width = 701
    Height = 378
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBlack
    ActiveLineColor = 2621440
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentShowHint = False
    PopupMenu = mEditor
    ShowHint = False
    TabOrder = 1
    BorderStyle = bsNone
    Gutter.AutoSize = True
    Gutter.Color = clBlack
    Gutter.BorderColor = 5395026
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clSilver
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.RightOffset = 5
    Gutter.ShowLineNumbers = True
    Highlighter = Highlighter
    Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoKeepCaretX, eoRightMouseMovesCursor, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoTabsToSpaces, eoTrimTrailingSpaces]
    RightEdge = 50
    RightEdgeColor = 5395026
    SelectedColor.Background = 6579300
    SelectedColor.Foreground = clWhite
    TabWidth = 2
    WantTabs = True
    OnChange = EditorChange
    OnGutterGetText = EditorGutterGetText
    OnTokenHint = EditorTokenHint
    FontSmoothing = fsmNone
    ExplicitTop = 31
  end
  object Stat: TStatusBar
    Left = 0
    Top = 508
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
    ExplicitLeft = -96
    ExplicitTop = 456
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
    object Action1: TAction
      Caption = 'Action1'
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
    Left = 240
    Top = 432
  end
  object mEditor: TPopupMenu
    OnPopup = mEditorPopup
    Left = 416
    Top = 432
    object mEditorCut: TMenuItem
      Caption = 'Cut'
    end
    object mEditorCopy: TMenuItem
      Caption = 'Copy'
    end
    object mEditorPaste: TMenuItem
      Caption = 'Paste'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mEditorToggleBookmark: TMenuItem
      Caption = 'Toggle Bookmark'
      object mToggleBookmark0: TMenuItem
        Caption = 'Bookmark 0'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark1: TMenuItem
        Tag = 1
        Caption = 'Bookmark 1'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark2: TMenuItem
        Tag = 2
        Caption = 'Bookmark 2'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark3: TMenuItem
        Tag = 3
        Caption = 'Bookmark 3'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark4: TMenuItem
        Tag = 4
        Caption = 'Bookmark 4'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark5: TMenuItem
        Tag = 5
        Caption = 'Bookmark 5'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark6: TMenuItem
        Tag = 6
        Caption = 'Bookmark 6'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark7: TMenuItem
        Tag = 7
        Caption = 'Bookmark 7'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark8: TMenuItem
        Tag = 8
        Caption = 'Bookmark 8'
        OnClick = ToggleBookmarkClick
      end
      object mToggleBookmark9: TMenuItem
        Tag = 9
        Caption = 'Bookmark 9'
        OnClick = ToggleBookmarkClick
      end
    end
    object mEditorGotoBookmark: TMenuItem
      Caption = 'Goto Bookmark'
      object mGotoBookmark0: TMenuItem
        Caption = 'Bookmark 0'
        OnClick = GotoBookmarkClick
      end
      object Bookmark12: TMenuItem
        Tag = 1
        Caption = 'Bookmark 1'
        OnClick = GotoBookmarkClick
      end
      object Bookmark22: TMenuItem
        Tag = 2
        Caption = 'Bookmark 2'
        OnClick = GotoBookmarkClick
      end
      object Bookmark32: TMenuItem
        Tag = 3
        Caption = 'Bookmark 3'
        OnClick = GotoBookmarkClick
      end
      object Bookmark42: TMenuItem
        Tag = 4
        Caption = 'Bookmark 4'
        OnClick = GotoBookmarkClick
      end
      object Bookmark52: TMenuItem
        Tag = 5
        Caption = 'Bookmark 5'
        OnClick = GotoBookmarkClick
      end
      object Bookmark62: TMenuItem
        Tag = 6
        Caption = 'Bookmark 6'
        OnClick = GotoBookmarkClick
      end
      object Bookmark72: TMenuItem
        Tag = 7
        Caption = 'Bookmark 7'
        OnClick = GotoBookmarkClick
      end
      object Bookmark82: TMenuItem
        Tag = 8
        Caption = 'Bookmark 8'
        OnClick = GotoBookmarkClick
      end
      object Bookmark92: TMenuItem
        Tag = 9
        Caption = 'Bookmark 9'
        OnClick = GotoBookmarkClick
      end
    end
    object mEditorClearBookmarks: TMenuItem
      Caption = 'Clear Bookmarks'
      OnClick = mEditorClearBookmarksClick
    end
  end
  object MM: TMainMenu
    Images = DM.img16
    Left = 176
    Top = 432
    object File1: TMenuItem
      Caption = 'File'
      object NewScript1: TMenuItem
        Action = actFileNew
      end
      object OpenScript1: TMenuItem
        Action = actFileOpen
      end
      object SaveScript1: TMenuItem
        Action = actFileSave
      end
      object SaveScriptAs1: TMenuItem
        Action = actFileSaveAs
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object ExitHolyMacro1: TMenuItem
        Action = actFileExit
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Undo1: TMenuItem
        Caption = 'Undo'
      end
      object Redo1: TMenuItem
        Caption = 'Redo'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Caption = 'Cut'
      end
      object Copy1: TMenuItem
        Caption = 'Copy'
      end
      object Paste1: TMenuItem
        Caption = 'Paste'
      end
      object SelectAll1: TMenuItem
        Caption = 'Select All'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = 'Find'
      end
      object FindandReplace1: TMenuItem
        Caption = 'Find and Replace'
      end
    end
    object View1: TMenuItem
      Caption = 'View'
    end
    object Options1: TMenuItem
      Caption = 'Options'
    end
    object Help1: TMenuItem
      Caption = 'Help'
    end
  end
end

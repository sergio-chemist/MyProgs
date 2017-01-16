object frmTest001: TfrmTest001
  Left = 409
  Top = 263
  Width = 594
  Height = 450
  Caption = 'MLK Trade Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object sbStatus: TStatusBar
    Left = 0
    Top = 372
    Width = 578
    Height = 19
    Panels = <>
  end
  object pcPageControl: TPageControl
    Left = 0
    Top = 144
    Width = 578
    Height = 228
    ActivePage = tsQuery
    Align = alBottom
    TabOrder = 1
    object tsCoworkers: TTabSheet
      Caption = 'Coworkers'
      object dbgTest: TDBGridEh
        Left = 0
        Top = 0
        Width = 536
        Height = 200
        Align = alClient
        DataSource = mdsTest
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object tsQuery: TTabSheet
      Caption = 'Query'
      ImageIndex = 1
      object meQuery: TMemo
        Left = 0
        Top = 0
        Width = 570
        Height = 200
        Align = alClient
        Color = clMenu
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object gbControls: TGroupBox
    Left = 0
    Top = 0
    Width = 578
    Height = 97
    Align = alTop
    Caption = 'Controls'
    TabOrder = 2
    object lblServer: TLabel
      Left = 19
      Top = 40
      Width = 34
      Height = 13
      Caption = 'Server:'
    end
    object lblTitle: TLabel
      Left = 24
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Titles:'
    end
    object lblPassword: TLabel
      Left = 446
      Top = 21
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object lblPswdValue: TLabel
      Left = 448
      Top = 40
      Width = 44
      Height = 13
      Caption = '***********'
    end
    object lblSrvValue: TLabel
      Left = 58
      Top = 40
      Width = 124
      Height = 13
      Caption = 'IP_Address\Server_Name'
    end
    object sbnConnect: TSpeedButton
      Left = 408
      Top = 24
      Width = 23
      Height = 22
      Action = acConnectWithServer
      Enabled = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0FBFFF0FB
        FFFF00FFFF00FFFF00FF69696969696969696969696969696969696969696969
        6969696969696969696969FBFBFBFBFBFB696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0FBFFC08040F0CA
        A6FF00FFFF00FFFF00FF69696969696969696969696969696969696969696969
        6969696969696969FBFBFB747474C3C3C3696969696969696969FF00FFC0DCC0
        404040404040404040404040404040404040404040C0DCC0C08040C08020C0A0
        40C0A060C0A060C0C080696969D1D1D140404040404040404040404040404040
        4040404040D1D1D17474746A6A6A878787909090909090ADADADFF00FFC0C0C0
        40202000FF0000FF0000FF0000FF0000FF00C0DCC0C08040C08020C08020C080
        20C08020C08020C0A060696969C0C0C024242496969696969696969696969696
        9696D1D1D17474746A6A6A6A6A6A6A6A6A6A6A6A6A6A6A909090FF00FFC0C0C0
        40202000FF0000FF0000FF0000FF0000FF00F0CAA6C08020C08020C08020C080
        20C08020C08020C0A060696969C0C0C024242496969696969696969696969696
        9696C3C3C36A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A909090FF00FFC0DCC0
        404040402020404040404040404040404040A4A0A0C0C080C08020C08020C080
        20C08020C08020C0A060696969D1D1D140404024242440404040404040404040
        4040A0A0A0ADADAD6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A909090FF00FFC0DCC0
        404040402020404040404040404040404040404040808080C0C080C08020F0CA
        A6C0C0C0C0DCC0F0FBFF696969D1D1D140404024242440404040404040404040
        4040404040808080ADADAD6A6A6AC3C3C3C0C0C0D1D1D1FBFBFBFF00FFC0C0C0
        40202000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF00FFC0C080F0CA
        A6402020C0C0C0FF00FF696969C0C0C024242496969696969696969696969696
        9696969696969696696969ADADADC3C3C3242424C0C0C0696969FF00FFC0C0C0
        40202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00402020C0C0C0FF00FF696969C0C0C024242496969696969696969696969696
        9696969696969696969696969696969696242424C0C0C0696969FF00FFC0DCC0
        4040404020204020204040404040404040404040404040404040404020204020
        20404040C0DCC0FF00FF696969D1D1D140404024242424242440404040404040
        4040404040404040404040242424242424404040D1D1D1696969FF00FFF0FBFF
        4060604020204040404040404040404040404040404040404040404040404020
        20406060F0FBFFFF00FF696969FBFBFB5C5C5C24242440404040404040404040
        40404040404040404040404040402424245C5C5CFBFBFB696969FF00FFC0C0C0
        40202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00402020C0C0C0FF00FF696969C0C0C024242496969696969696969696969696
        9696969696969696969696969696969696242424C0C0C0696969FF00FFC0C0C0
        40202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00402020C0C0C0FF00FF696969C0C0C024242496969696969696969696969696
        9696969696969696969696969696969696242424C0C0C0696969FF00FFC0DCC0
        4020204020204020204020204020204020204020204020204020204020204020
        20402020C0DCC0FF00FF696969D1D1D124242424242424242424242424242424
        2424242424242424242424242424242424242424D1D1D1696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF69696969696969696969696969696969696969696969
        6969696969696969696969696969696969696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF69696969696969696969696969696969696969696969
        6969696969696969696969696969696969696969696969696969}
      NumGlyphs = 2
    end
    object lblQueries: TLabel
      Left = 8
      Top = 72
      Width = 36
      Height = 13
      Caption = 'Queries'
    end
    object cmbServers: TComboBox
      Left = 56
      Top = 16
      Width = 345
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cmbServersChange
    end
    object cmbQueries: TComboBox
      Left = 56
      Top = 64
      Width = 345
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cmbQueriesChange
    end
    object cbxAllContents: TCheckBox
      Left = 408
      Top = 72
      Width = 81
      Height = 17
      Caption = 'All Contents'
      TabOrder = 2
      OnClick = cbxAllContentsClick
    end
  end
  object sbQueries: TStatusBar
    Left = 0
    Top = 125
    Width = 578
    Height = 19
    Panels = <>
  end
  object mmMain: TMainMenu
    Left = 192
    Top = 136
    object mnuFile: TMenuItem
      Caption = 'File'
      object mnuLoadQueries: TMenuItem
        Action = acLoadQueries
      end
      object mnuSaveQueries: TMenuItem
        Action = acSaveQueries
      end
      object mnuExit: TMenuItem
        Caption = 'Exit'
        OnClick = mnuExitClick
      end
    end
    object mnuTask: TMenuItem
      Caption = 'Task'
      object mnuShowCoworkers: TMenuItem
        Action = acShowCoworkers
      end
    end
    object mnuConnection: TMenuItem
      Caption = 'Connection'
      object mnuGetServerListFast: TMenuItem
        Action = acGetServerListFast
      end
      object mnuConnectWithMLKTradeTest: TMenuItem
        Action = acConnectWithServer
      end
      object mnuSaveAsQueries: TMenuItem
        Action = acSaveAsQueries
      end
    end
  end
  object aclActions: TActionList
    Left = 388
    Top = 97
    object acShowCoworkers: TAction
      Category = 'Task'
      Caption = 'Show Coworkers'
      OnExecute = acShowCoworkersExecute
    end
    object acConnectWithServer: TAction
      Category = 'Connection'
      Caption = 'Connect with Server'
      OnExecute = acConnectWithServerExecute
    end
    object acGetServerListFast: TAction
      Category = 'Connection'
      Caption = 'Get Server List Fast'
      OnExecute = acGetServerListFastExecute
    end
    object acLoadQueries: TAction
      Category = 'File'
      Caption = 'Load Queries ...'
      OnExecute = acLoadQueriesExecute
    end
    object acSaveQueries: TAction
      Category = 'File'
      Caption = 'Save Queries ...'
      OnExecute = acSaveQueriesExecute
    end
    object acSaveAsQueries: TAction
      Category = 'Connection'
      Caption = 'Save as Queries'
      OnExecute = acSaveAsQueriesExecute
    end
  end
  object MSConnection: TMSConnection
    Database = 'work'
    Options.Provider = prSQL
    Username = 'sa'
    Password = 'logist'
    Server = '192.168.0.5\LOGIST'
    AfterConnect = MSConnectionAfterConnect
    OnError = MSConnectionError
    LoginPrompt = False
    Left = 356
    Top = 97
  end
  object msqTest: TMSQuery
    Connection = MSConnection
    Left = 408
    Top = 136
  end
  object mdsTest: TMSDataSource
    DataSet = msqTest
    Left = 448
    Top = 128
  end
  object dlgOpenQueries: TOpenDialog
    DefaultExt = 'qrs'
    Filter = 'Queries (*.qrs)|*.qrs'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 60
    Top = 193
  end
  object dlgSaveQueries: TSaveDialog
    DefaultExt = 'qrs'
    Filter = 'Queries (*.qrs)|*.qrs'
    Left = 140
    Top = 193
  end
end

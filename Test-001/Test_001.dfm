object frmTest001: TfrmTest001
  Left = 531
  Top = 299
  Width = 594
  Height = 450
  Caption = 'MLK Trade Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object sbStatus: TStatusBar
    Left = 0
    Top = 372
    Width = 578
    Height = 19
    Panels = <>
  end
  object pcPageControl: TPageControl
    Left = 0
    Top = 100
    Width = 578
    Height = 272
    ActivePage = tsQuery
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object tsTest: TTabSheet
      Caption = 'Test'
      object dbgTest: TDBGridEh
        Left = 0
        Top = 0
        Width = 570
        Height = 241
        Align = alClient
        DataSource = mdsTest
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ParentFont = False
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
        Height = 241
        Align = alClient
        Color = clMenu
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnExit = meQueryExit
      end
    end
  end
  object gbControls: TGroupBox
    Left = 0
    Top = 0
    Width = 578
    Height = 81
    Align = alTop
    Caption = 'Controls'
    TabOrder = 2
    object lblTitle: TLabel
      Left = 38
      Top = 24
      Width = 36
      Height = 16
      Caption = 'Titles:'
    end
    object sbnConnect: TSpeedButton
      Left = 432
      Top = 19
      Width = 23
      Height = 22
      Hint = 'Try connection to server'
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
      ParentShowHint = False
      ShowHint = True
    end
    object lblQueries: TLabel
      Left = 8
      Top = 56
      Width = 47
      Height = 16
      Caption = 'Queries'
    end
    object sbnExecute: TSpeedButton
      Left = 8
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Execute Query'
      Enabled = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000074120000741200000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFE3F9E6EAF7FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF69696969696969696969696969696969696969696969
        6969E9E9E9EDEDED696969696969696969696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFA7B4F45E78EB516CEC6D83EC3E62D24365D0839AE0FF00
        FFFF00FFFF00FFFF00FF696969696969696969696969696969C6C6C69898988F
        8F8FA0A0A0808080818181ACACAC696969696969696969696969FF00FFFF00FF
        FF00FFFF00FF6F85EC516CEC516CEC516CEC6D83EC3E62D23E62D23E62D24C6D
        D2D7DEF4FF00FFFF00FF696969696969696969696969A1A1A18F8F8F8F8F8F8F
        8F8FA0A0A0808080808080808080888888E4E4E4696969696969FF00FFFF00FF
        FF00FF738AEE516CEC516CEC516CEC516CEC6D83EC3E62D23E62D23E62D23E62
        D24C6DD2FF00FFFF00FF696969696969696969A5A5A58F8F8F8F8F8F8F8F8F8F
        8F8FA0A0A0808080808080808080808080888888696969696969FF00FFFF00FF
        D5DBF9516CEC516CEC516CEC5970E95E78EB6D83EC3E62D23E62D23E62D23E62
        D23E62D298AAE5FF00FF696969696969E3E3E38F8F8F8F8F8F8F8F8F92929298
        9898A0A0A0808080808080808080808080808080BABABA696969FF00FFFF00FF
        C6CEF7516CEC516CEC6E84EDBFC9F6516CEC6D83EC3E62D23E62D23E62D23E62
        D23E62D26E89DCFF00FF696969696969D9D9D98F8F8F8F8F8FA1A1A1D5D5D58F
        8F8FA0A0A08080808080808080808080808080809F9F9F696969FF00FFFF00FF
        FF00FF4F69E85871EBFF00FF8799EF516CEC6D83EC3E62D23E62D23E62D23E62
        D23E62D27F97E0FF00FF6969696969696969698C8C8C939393696969B1B1B18F
        8F8FA0A0A0808080808080808080808080808080AAAAAA696969FF00FFFF00FF
        FF00FF8C9EF19DADF2FF00FF5571EB516CEC6D83EC3E62D23E62D23E62D23E62
        D24164CFD6DCF4FF00FF696969696969696969B5B5B5C0C0C06969699393938F
        8F8FA0A0A0808080808080808080808080808080E3E3E3696969FF00FFFF00FF
        FF00FFFF00FFDEE2FAE4E8FA516CEC516CEC6D83EC3E62D23E62D2A0B1E73D61
        CE9FAFE7FF00FFFF00FF696969696969696969696969E9E9E9EDEDED8F8F8F8F
        8F8FA0A0A0808080808080BFBFBF7E7E7EBEBEBE696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF516CEC516CEC6D83EC3E62D28EA2E2FF00FF496B
        D1FF00FFFF00FFFF00FF6969696969696969696969696969696969698F8F8F8F
        8F8FA0A0A0808080B3B3B3696969868686696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF6980ED516CEC6D83EC4668D2FF00FFFF00FFABB9
        EAFF00FFFF00FFFF00FF6969696969696969696969696969696969699E9E9E8F
        8F8FA0A0A0848484696969696969C6C6C6696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB0BBF5516CEC6D83EC899EE2FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF696969696969696969696969696969696969CBCBCB8F
        8F8FA0A0A0B0B0B0696969696969696969696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF637CEB6D83ECB7C4EDFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF6969696969696969696969696969696969696969699B
        9B9BA0A0A0CFCFCF696969696969696969696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFCFD7F86F85E9D2D9F3FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF696969696969696969696969696969696969696969E0
        E0E0A1A1A1E0E0E0696969696969696969696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3BFF1DAE1F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF69696969696969696969696969696969696969696969
        6969CDCDCDE6E6E6696969696969696969696969696969696969FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF69696969696969696969696969696969696969696969
        6969696969696969696969696969696969696969696969696969}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbnExecuteClick
    end
    object sbnEditQueries: TSpeedButton
      Left = 472
      Top = 19
      Width = 23
      Height = 22
      Hint = 'Edit Queries'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFEDF0DEC7D291ABBE5D9EB242A0B443ACBE5CC6D290ECF0DDFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6D2909DB13D9EB33D9EB33D9E
        B33D9EB33D9EB33D9EB33D9DB13DC4D18DFF00FFFF00FFFF00FFFF00FFFF00FF
        B6C56F9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB3
        3DB4C36CFF00FFFF00FFFF00FFC5D18E9EB33D9EB33D9EB33D9EB33D9EB33D9E
        B33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33DC3D089FF00FFEDF0DC9DB13D
        9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB3
        3D9EB33D9AAF3CEBEFD8C5D18E9EB33D9EB33D9EB33D9EB33D6877CC9FAEE199
        A9C898AA789EB33D9EB33D9EB33D9EB33D9EB33D9EB33DC4D08BACBE5C9EB33D
        9EB33D9EB33D9EB33DAFBDE0BBCAFEB1C0F37684D35F6F7D9EB33D9EB33D9EB3
        3D9EB33D9EB33DA8BA55A0B4439EB33D9EB33D9EB33D9EB33DA3B2B4C8D4FF71
        80DE303EBE2834AD5F6E7C9EB33D9EB33D9EB33D9EB33D9DB03CA0B4439EB33D
        9EB33D9EB33D9EB33D9DB0588F9CE43B48C42B39BF2A38BC2833AE5F6E7C9EB3
        3D9EB33D9EB33D9BB23CACBC5A9EB33D9EB33D9EB33D9EB33D9EB33D7C8D6D49
        54C73341C22B39BF2A38BC2834AD5F6E7C9EB33D9EB33DA8BB56C5D18C9EB33D
        9EB33D9EB33D9EB33D9EB33D9EB33D7C8E6C4954C73341C22B39BF2A38BC2834
        AD5F707D9EB33DC3CF8AECEFDA9AAF3C9EB33D9EB33D9EB33D9EB33D9EB33D9E
        B33D7C8E6C4855C73441C22B39BF2A38BC2834AD5F707DEAEED6FF00FFC3D089
        9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D7C8D6D4954C73341C22B39
        BF2A38BC414EA8FF00FFFF00FFFF00FFB4C36C9EB33D9EB33D9EB33D9EB33D9E
        B33D9EB33D9EB33D7C8D6D4855C73441C24856A8FF00FFFF00FFFF00FFFF00FF
        FF00FFC3CF8A9AAF3C9EB33D9EB33D9EB33D9EB33D9EB33D9EB33D7C8E6C5763
        B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEBEFDAC4D08AAABB589C
        B3409CB340A8BA55C3CF8AEAEED7FF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbnEditQueriesClick
    end
    object cmbServers: TComboBox
      Left = 72
      Top = 16
      Width = 345
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
      OnChange = cmbServersChange
    end
    object cmbQueries: TComboBox
      Left = 56
      Top = 48
      Width = 345
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 1
      OnChange = cmbQueriesChange
    end
    object cbxAllContents: TCheckBox
      Left = 408
      Top = 56
      Width = 81
      Height = 17
      Caption = 'All Contents'
      TabOrder = 2
      OnClick = cbxAllContentsClick
    end
  end
  object sbQueries: TStatusBar
    Left = 0
    Top = 81
    Width = 578
    Height = 19
    Align = alTop
    Panels = <>
    SimplePanel = True
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
    object mnuQueries: TMenuItem
      Caption = 'Queries'
      object mnuEditQueries: TMenuItem
        Action = acEditQueries
        Caption = 'Edit ...'
      end
      object mnuExecuteQuery: TMenuItem
        Action = acExecQuery
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
    object acExecQuery: TAction
      Category = 'Query'
      Caption = 'Execute'
      OnExecute = acExecQueryExecute
    end
    object acEditQueries: TAction
      Category = 'Query'
      OnExecute = acEditQueriesExecute
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
    DefaultExt = 'sql'
    Filter = 'Queries (*.sql)|*.sql'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 60
    Top = 193
  end
  object dlgSaveQueries: TSaveDialog
    DefaultExt = 'sql'
    Filter = 'Queries (*.sql)|*.sql'
    Left = 140
    Top = 193
  end
end

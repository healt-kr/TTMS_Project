object frmTouristStatus: TfrmTouristStatus
  Left = 0
  Top = 0
  Caption = #47784#44061' '#54788#54889
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #46027#50880
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 257
    Width = 784
    Height = 304
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #46027#50880
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 257
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 45
      Height = 15
      Caption = #45812#45817#51088
    end
    object Label2: TLabel
      Left = 40
      Top = 53
      Width = 45
      Height = 15
      Caption = #54665#49324#47749
    end
    object Label7: TLabel
      Left = 53
      Top = 91
      Width = 30
      Height = 15
      Caption = #44592#44036
    end
    object Label29: TLabel
      Left = 127
      Top = 91
      Width = 15
      Height = 15
      Caption = #45380
    end
    object Label30: TLabel
      Left = 179
      Top = 91
      Width = 15
      Height = 15
      Caption = #50900
    end
    object Label31: TLabel
      Left = 231
      Top = 91
      Width = 15
      Height = 15
      Caption = #51068
    end
    object Label24: TLabel
      Left = 260
      Top = 91
      Width = 11
      Height = 15
      Caption = '~'
    end
    object Label32: TLabel
      Left = 332
      Top = 91
      Width = 15
      Height = 15
      Caption = #45380
    end
    object Label33: TLabel
      Left = 384
      Top = 91
      Width = 15
      Height = 15
      Caption = #50900
    end
    object Label34: TLabel
      Left = 436
      Top = 91
      Width = 15
      Height = 15
      Caption = #51068
    end
    object cbxManager: TComboBox
      Left = 85
      Top = 21
      Width = 145
      Height = 23
      TabOrder = 0
    end
    object btnPost: TButton
      Left = 646
      Top = 57
      Width = 120
      Height = 36
      Caption = #51221'    '#49328
      TabOrder = 1
      TabStop = False
    end
    object cbxEvent: TComboBox
      Left = 85
      Top = 50
      Width = 145
      Height = 23
      TabOrder = 2
    end
    object edtFromYear: TEdit
      Left = 85
      Top = 88
      Width = 38
      Height = 23
      TabOrder = 3
    end
    object edtFromMonth: TEdit
      Left = 146
      Top = 88
      Width = 27
      Height = 23
      TabOrder = 4
    end
    object edtFromDay: TEdit
      Left = 198
      Top = 88
      Width = 27
      Height = 23
      TabOrder = 5
    end
    object edtToYear: TEdit
      Left = 288
      Top = 88
      Width = 38
      Height = 23
      TabOrder = 6
    end
    object edtToMonth: TEdit
      Left = 351
      Top = 88
      Width = 27
      Height = 23
      TabOrder = 7
    end
    object edtToDay: TEdit
      Left = 403
      Top = 88
      Width = 27
      Height = 23
      TabOrder = 8
    end
    object RadioGroup1: TRadioGroup
      Left = 85
      Top = 127
      Width = 140
      Height = 84
      Caption = #44160#49353' '#44396#48516
      ItemIndex = 0
      Items.Strings = (
        #52636#48156#51068#51088
        #51217#49688#51068#51088)
      TabOrder = 9
    end
    object Button2: TButton
      Left = 646
      Top = 15
      Width = 120
      Height = 36
      Caption = #44160'    '#49353
      TabOrder = 10
      TabStop = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 646
      Top = 99
      Width = 120
      Height = 36
      Caption = #51077'    '#44552
      TabOrder = 11
      TabStop = False
      OnClick = Button3Click
    end
  end
  object FDQuery1: TFDQuery
    Filtered = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'SELECT serial, from_date, customer_name,'
      '  event_name, manager_name, created_at'
      'FROM events'
      '')
    Left = 272
    Top = 280
    object FDQuery1serial: TStringField
      FieldName = 'serial'
      Required = True
      FixedChar = True
      Size = 11
    end
    object FDQuery1from_date: TDateField
      FieldName = 'from_date'
    end
    object FDQuery1customer_name: TStringField
      FieldName = 'customer_name'
    end
    object FDQuery1event_name: TStringField
      FieldName = 'event_name'
      Required = True
      Size = 40
    end
    object FDQuery1manager_name: TStringField
      FieldName = 'manager_name'
      Required = True
      Size = 10
    end
    object FDQuery1created_at: TSQLTimeStampField
      FieldName = 'created_at'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 384
    Top = 280
  end
  object FDQueryManager: TFDQuery
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'SELECT name'
      'FROM manager')
    Left = 288
    Top = 24
  end
end

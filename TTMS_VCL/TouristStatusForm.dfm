object frmTouristStatus: TfrmTouristStatus
  Left = 0
  Top = 0
  Caption = #47784#44061' '#54788#54889
  ClientHeight = 517
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 201
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 39
      Height = 18
      Caption = #45812#45817#51088
    end
    object Label2: TLabel
      Left = 40
      Top = 53
      Width = 39
      Height = 18
      Caption = #54665#49324#47749
    end
    object Label7: TLabel
      Left = 53
      Top = 91
      Width = 26
      Height = 18
      Caption = #44592#44036
    end
    object Label24: TLabel
      Left = 260
      Top = 91
      Width = 11
      Height = 18
      Caption = '~'
    end
    object Label29: TLabel
      Left = 127
      Top = 91
      Width = 13
      Height = 18
      Caption = #45380
    end
    object Label30: TLabel
      Left = 179
      Top = 91
      Width = 13
      Height = 18
      Caption = #50900
    end
    object Label31: TLabel
      Left = 231
      Top = 91
      Width = 13
      Height = 18
      Caption = #51068
    end
    object Label32: TLabel
      Left = 332
      Top = 91
      Width = 13
      Height = 18
      Caption = #45380
    end
    object Label33: TLabel
      Left = 384
      Top = 91
      Width = 13
      Height = 18
      Caption = #50900
    end
    object Label34: TLabel
      Left = 436
      Top = 91
      Width = 13
      Height = 18
      Caption = #51068
    end
    object cbxEvent: TComboBox
      Left = 85
      Top = 50
      Width = 145
      Height = 26
      TabOrder = 1
    end
    object RadioGroup1: TRadioGroup
      Left = 476
      Top = 78
      Width = 218
      Height = 84
      Caption = #44160#49353' '#44396#48516
      ItemIndex = 0
      Items.Strings = (
        #52636#48156#51068#51088
        #51217#49688#51068#51088)
      TabOrder = 0
    end
    object edtFromYear: TEdit
      Left = 85
      Top = 88
      Width = 38
      Height = 26
      TabOrder = 2
    end
    object edtFromMonth: TEdit
      Left = 146
      Top = 88
      Width = 27
      Height = 26
      TabOrder = 3
    end
    object edtFromDay: TEdit
      Left = 198
      Top = 88
      Width = 27
      Height = 26
      TabOrder = 4
    end
    object edtToYear: TEdit
      Left = 288
      Top = 88
      Width = 38
      Height = 26
      TabOrder = 5
    end
    object edtToMonth: TEdit
      Left = 351
      Top = 88
      Width = 27
      Height = 26
      TabOrder = 6
    end
    object edtToDay: TEdit
      Left = 403
      Top = 88
      Width = 27
      Height = 26
      TabOrder = 7
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 201
    Width = 740
    Height = 316
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'event_start_date'
        Title.Caption = #52636#48156#51068
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reservation_date'
        Title.Caption = #51217#49688#51068
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customer_name'
        Title.Caption = #44256#44061#47749
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tourist_total'
        Title.Caption = #51064#50896
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'event_name'
        Title.Caption = #54665#49324#47749
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manager_name'
        Title.Caption = #45812#45817#51088
        Visible = True
      end>
  end
  object cbxManager: TComboBox
    Left = 85
    Top = 21
    Width = 145
    Height = 26
    TabOrder = 0
  end
  object Button1: TButton
    Left = 85
    Top = 137
    Width = 75
    Height = 25
    Caption = #44160#49353
    TabOrder = 3
    OnClick = Button1Click
  end
  object FDQuery1: TFDQuery
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'SELECT reservation_date, event_start_date, customer_name,'
      
        '  (adult_total + child_total) as tourist_total, event_name, mana' +
        'ger_name'
      'FROM event'
      '')
    Left = 272
    Top = 280
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

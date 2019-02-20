object frmIncome: TfrmIncome
  Left = 0
  Top = 0
  Caption = #51077#44552#45236#50669
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #46027#50880
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 129
    Align = alTop
    TabOrder = 0
    object edtEvent: TLabeledEdit
      AlignWithMargins = True
      Left = 75
      Top = 8
      Width = 350
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = #54665#49324#47749
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object edtCustomer: TLabeledEdit
      Left = 75
      Top = 37
      Width = 149
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = #44256#44061#47749
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object edtTotal: TLabeledEdit
      AlignWithMargins = True
      Left = 276
      Top = 37
      Width = 27
      Height = 23
      Alignment = taRightJustify
      EditLabel.Width = 30
      EditLabel.Height = 15
      EditLabel.Caption = #51064#50896
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 2
    end
    object LabeledEdit1: TLabeledEdit
      Left = 75
      Top = 66
      Width = 149
      Height = 23
      EditLabel.Width = 60
      EditLabel.Height = 15
      EditLabel.Caption = #54665#49324#44592#44036
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object LabeledEdit3: TLabeledEdit
      Left = 75
      Top = 95
      Width = 149
      Height = 23
      EditLabel.Width = 60
      EditLabel.Height = 15
      EditLabel.Caption = #54665#49324#44552#50529
      LabelPosition = lpLeft
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 265
    Width = 784
    Height = 296
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #46027#50880
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'type'
        Title.Alignment = taCenter
        Title.Caption = #44396#48516
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date'
        Title.Alignment = taCenter
        Title.Caption = #51077#44552#51068
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Alignment = taCenter
        Title.Caption = #51077#44552#50529
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'details'
        Title.Alignment = taCenter
        Title.Caption = #51077#44552#51088
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'account'
        Title.Alignment = taCenter
        Title.Caption = #44228#51340
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remarks'
        Title.Alignment = taCenter
        Title.Caption = #48708#44256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'updated_at'
        Title.Alignment = taCenter
        Title.Caption = #49688#51221#51068
        Visible = True
      end>
  end
  object LabeledEdit2: TLabeledEdit
    Left = 276
    Top = 66
    Width = 149
    Height = 23
    EditLabel.Width = 16
    EditLabel.Height = 15
    EditLabel.Caption = '~ '
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 784
    Height = 136
    Align = alTop
    TabOrder = 3
    object LabeledEdit4: TLabeledEdit
      Left = 75
      Top = 38
      Width = 149
      Height = 23
      EditLabel.Width = 30
      EditLabel.Height = 15
      EditLabel.Caption = #44396#48516
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object LabeledEdit5: TLabeledEdit
      Left = 276
      Top = 38
      Width = 149
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = #51077#44552#51068
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object LabeledEdit6: TLabeledEdit
      Left = 484
      Top = 38
      Width = 149
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = #51077#44552#50529
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object LabeledEdit7: TLabeledEdit
      Left = 75
      Top = 67
      Width = 149
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = #51077#44552#51088
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object LabeledEdit8: TLabeledEdit
      Left = 276
      Top = 67
      Width = 149
      Height = 23
      EditLabel.Width = 30
      EditLabel.Height = 15
      EditLabel.Caption = #44228#51340
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object LabeledEdit9: TLabeledEdit
      Left = 484
      Top = 67
      Width = 149
      Height = 23
      EditLabel.Width = 30
      EditLabel.Height = 15
      EditLabel.Caption = #48708#44256
      LabelPosition = lpLeft
      TabOrder = 5
    end
    object Button1: TButton
      Left = 75
      Top = 7
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 6
    end
    object Button2: TButton
      Left = 75
      Top = 96
      Width = 75
      Height = 25
      Caption = #51200#51109
      TabOrder = 7
    end
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'id'
    Connection = DataModule1.FDConnection1
    UpdateOptions.UpdateTableName = 'incomes'
    TableName = 'incomes'
    Left = 400
    Top = 336
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 496
    Top = 336
  end
end

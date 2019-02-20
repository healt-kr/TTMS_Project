object frmBank: TfrmBank
  Left = 0
  Top = 0
  Caption = #51077#52636#44552' '#44228#51340' '#44288#47532
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
    Height = 73
    Align = alTop
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 16
      Top = 24
      Width = 25
      Height = 23
      Alignment = taRightJustify
      EditLabel.Width = 15
      EditLabel.Height = 15
      EditLabel.Caption = #45380
      LabelPosition = lpRight
      TabOrder = 0
      Text = '19'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 64
      Top = 24
      Width = 25
      Height = 23
      Alignment = taRightJustify
      EditLabel.Width = 15
      EditLabel.Height = 15
      EditLabel.Caption = #50900
      LabelPosition = lpRight
      TabOrder = 1
      Text = '1'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 112
      Top = 24
      Width = 25
      Height = 23
      Alignment = taRightJustify
      EditLabel.Width = 15
      EditLabel.Height = 15
      EditLabel.Caption = #51068
      LabelPosition = lpRight
      TabOrder = 2
      Text = '1'
    end
    object Button4: TButton
      Left = 504
      Top = 23
      Width = 161
      Height = 25
      Caption = #50641#49472' '#54028#51068' '#48520#47084#50724#44592
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 784
    Height = 488
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #51008#54665' '#44228#51340' '#44288#47532
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 441
        Height = 457
        Align = alLeft
        DataSource = DataSource1
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #46027#50880
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'date'
            Title.Caption = #45216#51676
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'details'
            Title.Caption = #45236#50669
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'deposit'
            Title.Caption = #51077#44552#50529
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'withdraw'
            Title.Caption = #52636#44552#50529
            Visible = True
          end>
      end
      object Button2: TButton
        Left = 569
        Top = 124
        Width = 75
        Height = 25
        Caption = #52628#44032
        TabOrder = 1
      end
      object LabeledEdit7: TLabeledEdit
        Left = 488
        Top = 8
        Width = 121
        Height = 23
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = #45216#51676
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object LabeledEdit8: TLabeledEdit
        Left = 488
        Top = 37
        Width = 121
        Height = 23
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = #45236#50669
        LabelPosition = lpLeft
        TabOrder = 3
      end
      object LabeledEdit9: TLabeledEdit
        Left = 488
        Top = 66
        Width = 121
        Height = 23
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = #51077#44552
        LabelPosition = lpLeft
        TabOrder = 4
      end
      object LabeledEdit10: TLabeledEdit
        Left = 488
        Top = 95
        Width = 121
        Height = 23
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = #52636#44552
        LabelPosition = lpLeft
        TabOrder = 5
      end
      object Button3: TButton
        Left = 488
        Top = 124
        Width = 75
        Height = 25
        Caption = #51200#51109
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = #51077#44552' '#44288#47532
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = #52636#44552' '#44288#47532
      ImageIndex = 2
    end
  end
  object Button1: TButton
    Left = 328
    Top = 23
    Width = 75
    Height = 25
    Caption = #51312#54924
    TabOrder = 2
  end
  object LabeledEdit4: TLabeledEdit
    Left = 176
    Top = 24
    Width = 25
    Height = 23
    Alignment = taRightJustify
    EditLabel.Width = 15
    EditLabel.Height = 15
    EditLabel.Caption = #45380
    LabelPosition = lpRight
    TabOrder = 3
    Text = '19'
  end
  object LabeledEdit5: TLabeledEdit
    Left = 224
    Top = 24
    Width = 25
    Height = 23
    Alignment = taRightJustify
    EditLabel.Width = 15
    EditLabel.Height = 15
    EditLabel.Caption = #50900
    LabelPosition = lpRight
    TabOrder = 4
    Text = '3'
  end
  object LabeledEdit6: TLabeledEdit
    Left = 272
    Top = 24
    Width = 25
    Height = 23
    Alignment = taRightJustify
    EditLabel.Width = 15
    EditLabel.Height = 15
    EditLabel.Caption = #51068
    LabelPosition = lpRight
    TabOrder = 5
    Text = '31'
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = DataModule1.FDConnection1
    UpdateOptions.UpdateTableName = 'banking'
    TableName = 'banking'
    Left = 88
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 208
    Top = 216
  end
end

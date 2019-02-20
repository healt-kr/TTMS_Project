object frmReservation: TfrmReservation
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #50668#54665' '#50696#50557' '
  ClientHeight = 631
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #46027#50880
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  object PanelBottom: TPanel
    Left = 0
    Top = 552
    Width = 794
    Height = 79
    Align = alBottom
    TabOrder = 1
    TabStop = True
    object Label10: TLabel
      Left = 6
      Top = 14
      Width = 73
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #47700#47784
    end
    object Memo1: TMemo
      Left = 85
      Top = 6
      Width = 574
      Height = 67
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 361
    Width = 794
    Height = 191
    Align = alClient
    TabOrder = 0
    TabStop = True
    object Label17: TLabel
      Left = 7
      Top = 16
      Width = 72
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = #44204#51201' '
      ParentBiDiMode = False
    end
    object PanelEstimate: TPanel
      Left = 85
      Top = 6
      Width = 698
      Height = 179
      TabOrder = 0
      OnExit = PanelEstimateExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 361
    Align = alTop
    TabOrder = 2
    object MonthCalendar1: TMonthCalendar
      Left = 441
      Top = 56
      Width = 218
      Height = 160
      MultiSelect = True
      Date = 43511.000000000000000000
      EndDate = 43511.000000000000000000
      TabOrder = 5
      OnClick = MonthCalendar1Click
    end
    object PanelEvent: TPanel
      Left = 8
      Top = 47
      Width = 427
      Height = 102
      TabOrder = 1
      object Label7: TLabel
        Left = 7
        Top = 46
        Width = 62
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = #54665#49324#44592#44036
      end
      object Label24: TLabel
        Left = 59
        Top = 72
        Width = 16
        Height = 15
        Alignment = taRightJustify
        Caption = '~ '
      end
      object edtEvent: TLabeledEdit
        AlignWithMargins = True
        Left = 75
        Top = 8
        Width = 342
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #54665#49324#47749
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtFromYear: TLabeledEdit
        AlignWithMargins = True
        Left = 75
        Top = 37
        Width = 43
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #45380
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 1
        OnChange = EditPeriodChange
      end
      object edtFromMonth: TLabeledEdit
        AlignWithMargins = True
        Left = 145
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #50900
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 2
        OnChange = EditPeriodChange
      end
      object edtFromDay: TLabeledEdit
        AlignWithMargins = True
        Left = 197
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #51068
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 3
        OnChange = EditPeriodChange
      end
      object edtDay: TLabeledEdit
        AlignWithMargins = True
        Left = 342
        Top = 66
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #51068
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 8
      end
      object edtNight: TLabeledEdit
        AlignWithMargins = True
        Left = 276
        Top = 66
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #48149
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 7
      end
      object edtToDay: TLabeledEdit
        AlignWithMargins = True
        Left = 197
        Top = 66
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #51068
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 6
        OnChange = EditPeriodChange
      end
      object edtToMonth: TLabeledEdit
        AlignWithMargins = True
        Left = 145
        Top = 66
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #50900
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 5
        OnChange = EditPeriodChange
      end
      object edtToYear: TLabeledEdit
        AlignWithMargins = True
        Left = 75
        Top = 66
        Width = 43
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #45380
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 4
        OnChange = EditPeriodChange
      end
    end
    object PanelHotel: TPanel
      Left = 8
      Top = 313
      Width = 651
      Height = 42
      TabOrder = 4
      object edtHotel: TLabeledEdit
        Left = 75
        Top = 8
        Width = 267
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #49689#49548#47749
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtRoomType: TLabeledEdit
        Left = 433
        Top = 8
        Width = 100
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #44061#49892#54805
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtRoomAmount: TLabeledEdit
        Left = 608
        Top = 8
        Width = 31
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #44061#49892#49688
        LabelPosition = lpLeft
        NumbersOnly = True
        TabOrder = 2
        OnExit = edtRoomAmountExit
      end
    end
    object PanelCustomer: TPanel
      Left = 8
      Top = 155
      Width = 427
      Height = 72
      TabOrder = 2
      object edtCustomer: TLabeledEdit
        Left = 75
        Top = 8
        Width = 149
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #44256#44061#47749
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtContact: TLabeledEdit
        Left = 75
        Top = 37
        Width = 149
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #50672#46973#52376
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtTotal: TLabeledEdit
        AlignWithMargins = True
        Left = 276
        Top = 8
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
      object edtAdult: TLabeledEdit
        AlignWithMargins = True
        Left = 276
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = #45824#51064
        LabelPosition = lpLeft
        NumbersOnly = True
        TabOrder = 3
      end
      object edtChild: TLabeledEdit
        AlignWithMargins = True
        Left = 342
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = #49548#51064
        LabelPosition = lpLeft
        NumbersOnly = True
        TabOrder = 4
      end
    end
    object PanelHeader: TPanel
      Left = 8
      Top = 4
      Width = 649
      Height = 37
      TabOrder = 0
      DesignSize = (
        649
        37)
      object lblHeader: TLabel
        Left = 219
        Top = 12
        Width = 271
        Height = 15
        Caption = #51217#49688' : 2019-01-01 '#51652#54665' : 2019-01-01'
      end
      object edtPartner: TLabeledEdit
        Left = 75
        Top = 8
        Width = 121
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #44144#47000#52376
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtManager: TLabeledEdit
        AlignWithMargins = True
        Left = 568
        Top = 8
        Width = 74
        Height = 23
        Anchors = [akTop, akRight]
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #45812#45817#51088
        LabelPosition = lpLeft
        TabOrder = 1
      end
    end
    object btnPost: TButton
      Left = 663
      Top = 5
      Width = 120
      Height = 36
      Caption = #51200'    '#51109
      TabOrder = 6
      TabStop = False
      OnClick = btnPostClick
    end
    object Button1: TButton
      Left = 663
      Top = 49
      Width = 120
      Height = 36
      Caption = #52636'    '#47141
      TabOrder = 7
      TabStop = False
    end
    object Button2: TButton
      Left = 663
      Top = 94
      Width = 120
      Height = 36
      Caption = #51068' '#51221' '#54364
      TabOrder = 8
      TabStop = False
    end
    object btnNameList: TButton
      Left = 663
      Top = 139
      Width = 120
      Height = 36
      Caption = #51064#50896#54788#54889
      TabOrder = 9
      TabStop = False
      OnClick = btnNameListClick
    end
    object Button4: TButton
      Left = 663
      Top = 184
      Width = 120
      Height = 36
      Caption = #51221' '#49328' '#49436
      TabOrder = 10
      TabStop = False
    end
    object Button5: TButton
      Left = 663
      Top = 229
      Width = 120
      Height = 36
      Caption = #47784#44061#54788#54889
      TabOrder = 11
      TabStop = False
    end
    object Button6: TButton
      Left = 663
      Top = 274
      Width = 120
      Height = 36
      Caption = #44256#44061#44288#47532
      TabOrder = 12
      TabStop = False
    end
    object Button7: TButton
      Left = 665
      Top = 319
      Width = 120
      Height = 36
      Caption = #52286#44592
      TabOrder = 13
      TabStop = False
    end
    object Panel5: TPanel
      Left = 6
      Top = 233
      Width = 651
      Height = 74
      TabOrder = 3
      object Label11: TLabel
        Left = 9
        Top = 12
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Caption = #52636#48156#51068#49884
      end
      object Label13: TLabel
        Left = 9
        Top = 40
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Caption = #54788#51648#52636#48156
      end
      object edtDepartHour: TLabeledEdit
        AlignWithMargins = True
        Left = 177
        Top = 8
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #49884
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 2
      end
      object edtDepartMinute: TLabeledEdit
        AlignWithMargins = True
        Left = 223
        Top = 8
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #48516
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 3
      end
      object edtDepartDay: TLabeledEdit
        AlignWithMargins = True
        Left = 124
        Top = 8
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #51068
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 1
      end
      object edtDepartMonth: TLabeledEdit
        AlignWithMargins = True
        Left = 75
        Top = 8
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #50900
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 0
      end
      object edtReturnMonth: TLabeledEdit
        AlignWithMargins = True
        Left = 75
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #50900
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 6
      end
      object edtReturnDay: TLabeledEdit
        AlignWithMargins = True
        Left = 124
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #51068
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 7
      end
      object edtReturnHour: TLabeledEdit
        AlignWithMargins = True
        Left = 177
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #49884
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 8
      end
      object edtReturnMInute: TLabeledEdit
        AlignWithMargins = True
        Left = 223
        Top = 37
        Width = 27
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = #48516
        LabelPosition = lpRight
        NumbersOnly = True
        TabOrder = 9
      end
      object edtDepartAirline: TEdit
        Left = 278
        Top = 8
        Width = 70
        Height = 23
        TabOrder = 4
      end
      object edtReturnAirline: TEdit
        Left = 278
        Top = 37
        Width = 70
        Height = 23
        TabOrder = 10
      end
      object edtDepartPlace: TLabeledEdit
        Left = 433
        Top = 8
        Width = 206
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #51665#44208#51648
        LabelPosition = lpLeft
        TabOrder = 5
      end
      object edtReturnPlace: TLabeledEdit
        Left = 433
        Top = 37
        Width = 206
        Height = 23
        EditLabel.Width = 45
        EditLabel.Height = 15
        EditLabel.Caption = #51665#44208#51648
        LabelPosition = lpLeft
        TabOrder = 11
      end
    end
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'serial'
    Connection = DataModule1.FDConnection1
    UpdateOptions.UpdateTableName = 'event'
    TableName = 'event'
    Left = 712
    Top = 376
  end
  object DataSource1: TDataSource
    DataSet = qrySelectReservation
    Left = 712
    Top = 424
  end
  object qrySelectReservation: TFDQuery
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM events'
      'WHERE serial = :serial')
    Left = 232
    Top = 392
    ParamData = <
      item
        Name = 'SERIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = '20190130301'
      end>
  end
  object qryUpdate: TFDQuery
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'UPDATE events'
      'SET'
      'partner_name = :partner_name,'
      'manager_name = :manager_name,'
      'event_name = :event_name,'
      'from_date = :from_date,'
      'to_date = :to_date,'
      'customer_name = :customer_name,'
      'customer_contact = :customer_contact,'
      'tourists_total = :tourists_total,'
      'memo = :memo,'
      'json = :json,'
      'updated_at = CURRENT_TIMESTAMP'
      'WHERE'
      'serial = :serial')
    Left = 360
    Top = 392
    ParamData = <
      item
        Name = 'PARTNER_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #44144#47000#52376
      end
      item
        Name = 'MANAGER_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #47588#45768#51200
      end
      item
        Name = 'EVENT_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #54665#49324#47749
      end
      item
        Name = 'FROM_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = 43466d
      end
      item
        Name = 'TO_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = 43468d
      end
      item
        Name = 'CUSTOMER_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #44256#44061#47749
      end
      item
        Name = 'CUSTOMER_CONTACT'
        DataType = ftString
        ParamType = ptInput
        Value = #50672#46973#52376
      end
      item
        Name = 'TOURISTS_TOTAL'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MEMO'
        DataType = ftMemo
        ParamType = ptInput
        Value = #47700#47784
      end
      item
        Name = 'JSON'
        DataType = ftString
        ParamType = ptInput
        Value = 'json'
      end
      item
        Name = 'SERIAL'
        DataType = ftString
        ParamType = ptInput
        Value = '20190130301'
      end>
  end
  object qryInsert: TFDQuery
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'UPDATE events'
      'SET'
      'serial = :serial,'
      'partner_name = :partner_name,'
      'manager_name = :manager_name,'
      'event_name = :event_name,'
      'from_date = :from_date,'
      'to_date = :to_date,'
      'customer_name = :customer_name,'
      'customer_contact = :customer_contact,'
      'tourists_total = :tourists_total,'
      'memo = :memo,'
      'json = :json,'
      'updated_at = CURRENT_TIMESTAMP'
      'WHERE'
      'serial = :serial')
    Left = 464
    Top = 392
    ParamData = <
      item
        Name = 'SERIAL'
        DataType = ftString
        ParamType = ptInput
        Value = '20190130302'
      end
      item
        Name = 'PARTNER_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #44144#47000#52376
      end
      item
        Name = 'MANAGER_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #47588#45768#51200
      end
      item
        Name = 'EVENT_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #54665#49324#47749
      end
      item
        Name = 'FROM_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = 43466d
      end
      item
        Name = 'TO_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = 43468d
      end
      item
        Name = 'CUSTOMER_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = #44256#44061#47749
      end
      item
        Name = 'CUSTOMER_CONTACT'
        DataType = ftString
        ParamType = ptInput
        Value = #50672#46973#52376
      end
      item
        Name = 'TOURISTS_TOTAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'MEMO'
        DataType = ftMemo
        ParamType = ptInput
        Value = #47700#47784
      end
      item
        Name = 'JSON'
        DataType = ftString
        ParamType = ptInput
        Value = 'json'
      end>
  end
end

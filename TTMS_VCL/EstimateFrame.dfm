object fraEstimate: TfraEstimate
  Left = 0
  Top = 0
  Width = 555
  Height = 165
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #46027#50880
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object PanelBottom: TPanel
    Left = 0
    Top = 141
    Width = 555
    Height = 24
    Align = alBottom
    TabOrder = 0
    object Label7: TLabel
      Left = 534
      Top = 1
      Width = 20
      Height = 22
      Align = alRight
      AutoSize = False
      ExplicitLeft = 510
    end
    object edtSumPrice: TEdit
      Left = 448
      Top = 1
      Width = 86
      Height = 22
      TabStop = False
      Align = alRight
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 0
      ExplicitHeight = 23
    end
  end
  object PanelHeader: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 20
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 127
      Height = 18
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = #44396#48516
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #46027#50880
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 9
      ExplicitTop = 2
      ExplicitHeight = 17
    end
    object Label2: TLabel
      Left = 128
      Top = 1
      Width = 167
      Height = 18
      Align = alClient
      Alignment = taCenter
      Caption = #45236#50669
      ExplicitWidth = 30
      ExplicitHeight = 15
    end
    object Label3: TLabel
      Left = 295
      Top = 1
      Width = 107
      Height = 18
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      Caption = #45800#44032
      ExplicitLeft = 315
    end
    object Label4: TLabel
      Left = 402
      Top = 1
      Width = 46
      Height = 18
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      Caption = #49688#47049
      ExplicitLeft = 371
    end
    object Label5: TLabel
      Left = 448
      Top = 1
      Width = 86
      Height = 18
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      Caption = #44552#50529
      ExplicitLeft = 511
    end
    object Label6: TLabel
      Left = 534
      Top = 1
      Width = 20
      Height = 18
      Align = alRight
      AutoSize = False
      ExplicitLeft = 528
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 20
    Width = 555
    Height = 121
    Align = alClient
    TabOrder = 2
    object Panel0: TPanel
      Left = 0
      Top = 0
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel0'
      TabOrder = 0
      object edtDivision0: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice0: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity0: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice0: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails0: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 23
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel9'
      TabOrder = 1
      object edtDivision1: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice1: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity1: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice1: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails1: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 46
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel9'
      TabOrder = 2
      object edtDivision2: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice2: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity2: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice2: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails2: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 69
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel9'
      TabOrder = 3
      object edtDivision3: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice3: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity3: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice3: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails3: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 92
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel4'
      TabOrder = 4
      object edtDivision4: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice4: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity4: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice4: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails4: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 115
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel5'
      TabOrder = 5
      OnClick = Panel5Click
      object edtDivision5: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice5: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity5: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice5: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails5: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 138
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel9'
      TabOrder = 6
      object edtDivision6: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice6: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity6: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice6: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails6: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 161
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel9'
      TabOrder = 7
      object edtDivision7: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice7: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity7: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice7: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails7: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = 184
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel9'
      TabOrder = 8
      object edtDivision8: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice8: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity8: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice8: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails8: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 207
      Width = 534
      Height = 23
      Align = alTop
      Caption = 'Panel9'
      TabOrder = 9
      object edtDivision9: TEdit
        Left = 1
        Top = 1
        Width = 127
        Height = 21
        TabStop = False
        Align = alLeft
        AutoSize = False
        TabOrder = 0
      end
      object edtPrice9: TEdit
        Left = 447
        Top = 1
        Width = 86
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edtQuantity9: TEdit
        Left = 401
        Top = 1
        Width = 46
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtUnitPrice0Change
        ExplicitHeight = 23
      end
      object edtUnitPrice9: TEdit
        Left = 313
        Top = 1
        Width = 88
        Height = 21
        TabStop = False
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        NumbersOnly = True
        TabOrder = 3
        OnChange = edtUnitPrice0Change
      end
      object edtDetails9: TEdit
        Left = 128
        Top = 1
        Width = 185
        Height = 21
        TabStop = False
        Align = alClient
        TabOrder = 4
        ExplicitHeight = 23
      end
    end
  end
end
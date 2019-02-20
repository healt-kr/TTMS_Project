object frmRoomingList: TfrmRoomingList
  Left = 0
  Top = 0
  Caption = 'Rooming List'
  ClientHeight = 542
  ClientWidth = 834
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
    Width = 834
    Height = 97
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #46027#50880
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Bevel2: TBevel
      Left = 16
      Top = 11
      Width = 633
      Height = 78
    end
    object LabeledEdit1: TLabeledEdit
      Left = 88
      Top = 24
      Width = 161
      Height = 23
      EditLabel.Width = 60
      EditLabel.Height = 15
      EditLabel.Caption = #54665#49324#48264#54840
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object LabeledEdit2: TLabeledEdit
      Left = 352
      Top = 24
      Width = 285
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = #54665#49324#47749
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object btnPost: TButton
      Left = 655
      Top = 11
      Width = 120
      Height = 36
      Caption = #51200'    '#51109
      TabOrder = 2
      TabStop = False
    end
    object Button4: TButton
      Left = 655
      Top = 53
      Width = 120
      Height = 36
      Caption = #52636'    '#47141
      TabOrder = 3
      TabStop = False
    end
    object LabeledEdit3: TLabeledEdit
      Left = 88
      Top = 53
      Width = 161
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = #54840#53588#47749
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object LabeledEdit4: TLabeledEdit
      Left = 352
      Top = 53
      Width = 161
      Height = 23
      EditLabel.Width = 30
      EditLabel.Height = 15
      EditLabel.Caption = #51064#50896
      LabelPosition = lpLeft
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 834
    Height = 445
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -279
    ExplicitTop = -145
    ExplicitWidth = 784
    ExplicitHeight = 376
    object ScrollBox1: TScrollBox
      Left = 16
      Top = 6
      Width = 809
      Height = 427
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 805
        Height = 23
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 755
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 22
          Height = 21
          Align = alLeft
          Alignment = taCenter
          Caption = 'NO'
          ExplicitHeight = 15
        end
        object Label3: TLabel
          Left = 87
          Top = 1
          Width = 340
          Height = 21
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = #50689' '#47928' '#47749
          ExplicitLeft = 97
          ExplicitWidth = 158
        end
        object Label4: TLabel
          Left = 23
          Top = 1
          Width = 64
          Height = 21
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #49457#47749
          ExplicitLeft = 41
          ExplicitTop = 2
        end
        object Label6: TLabel
          Left = 427
          Top = 1
          Width = 136
          Height = 21
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = #51452#48124#48264#54840
          ExplicitLeft = 240
          ExplicitTop = -2
        end
        object Label7: TLabel
          Left = 683
          Top = 1
          Width = 121
          Height = 21
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = #48708'    '#44256
          ExplicitLeft = 413
          ExplicitTop = -2
        end
        object Label1: TLabel
          Left = 563
          Top = 1
          Width = 53
          Height = 21
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = #44061#49892#54805
          ExplicitLeft = 572
        end
        object Label5: TLabel
          Left = 616
          Top = 1
          Width = 67
          Height = 21
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = 'Room NO'
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 23
        Width = 805
        Height = 23
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 755
        object Label8: TLabel
          Left = 599
          Top = 24
          Width = 15
          Height = 15
          Align = alLeft
          Caption = #45380
          ExplicitLeft = 595
        end
        object Label9: TLabel
          Left = 561
          Top = 24
          Width = 15
          Height = 15
          Align = alLeft
          Caption = #45380
        end
        object SpeedButton2: TSpeedButton
          Left = 781
          Top = 24
          Width = 23
          Height = 22
          Align = alRight
          Caption = #49325#51228
          ExplicitLeft = 368
          ExplicitTop = 0
        end
        object Edit1: TEdit
          Left = 1
          Top = 24
          Width = 32
          Height = 23
          Align = alLeft
          TabOrder = 0
          Text = '01'
        end
        object Edit2: TEdit
          Left = 33
          Top = 24
          Width = 64
          Height = 23
          Align = alLeft
          TabOrder = 1
          Text = #54861#44600#46041
        end
        object Edit3: TEdit
          Left = 97
          Top = 24
          Width = 184
          Height = 23
          Align = alLeft
          TabOrder = 2
          Text = 'HONG.GIL.DONG'
        end
        object Edit4: TEdit
          Left = 281
          Top = 24
          Width = 64
          Height = 23
          Align = alLeft
          TabOrder = 3
          Text = '123456'
        end
        object Edit5: TEdit
          Left = 345
          Top = 24
          Width = 72
          Height = 23
          Align = alLeft
          TabOrder = 4
          Text = '1234567'
        end
        object Edit6: TEdit
          Left = 417
          Top = 24
          Width = 121
          Height = 23
          Align = alLeft
          TabOrder = 5
          Text = 'TJ021510'
        end
        object Edit7: TEdit
          Left = 576
          Top = 24
          Width = 23
          Height = 23
          Align = alLeft
          TabOrder = 6
          Text = '22'
        end
        object Edit8: TEdit
          Left = 538
          Top = 24
          Width = 23
          Height = 23
          Align = alLeft
          TabOrder = 7
          Text = '22'
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 803
          Height = 23
          Align = alTop
          TabOrder = 8
          ExplicitWidth = 753
          object Edit9: TEdit
            Left = 1
            Top = 1
            Width = 32
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '01'
            ExplicitHeight = 23
          end
          object Edit10: TEdit
            Left = 33
            Top = 1
            Width = 64
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = #54861#44600#46041
            ExplicitHeight = 23
          end
          object Edit11: TEdit
            Left = 97
            Top = 1
            Width = 207
            Height = 21
            Align = alClient
            TabOrder = 2
            Text = 'HONG.GIL.DONG'
            ExplicitWidth = 252
            ExplicitHeight = 23
          end
          object Edit12: TEdit
            Left = 304
            Top = 1
            Width = 64
            Height = 21
            Align = alRight
            TabOrder = 3
            Text = '123456'
            ExplicitLeft = 349
            ExplicitHeight = 23
          end
          object Edit13: TEdit
            Left = 368
            Top = 1
            Width = 72
            Height = 21
            Align = alRight
            TabOrder = 4
            Text = '1234567'
            ExplicitLeft = 413
            ExplicitHeight = 23
          end
          object Edit14: TEdit
            Left = 440
            Top = 1
            Width = 121
            Height = 21
            Align = alRight
            TabOrder = 5
            Text = 'TJ021510'
            ExplicitLeft = 485
            ExplicitHeight = 23
          end
          object Edit15: TEdit
            Left = 681
            Top = 1
            Width = 121
            Height = 21
            Align = alRight
            TabOrder = 6
            Text = 'Edit15'
            ExplicitLeft = 696
            ExplicitTop = -4
          end
          object Edit16: TEdit
            Left = 561
            Top = 1
            Width = 53
            Height = 21
            Align = alRight
            TabOrder = 7
            Text = 'TWIN'
            ExplicitLeft = 478
          end
          object Edit17: TEdit
            Left = 614
            Top = 1
            Width = 67
            Height = 21
            Align = alRight
            TabOrder = 8
            Text = '1B305'
            ExplicitLeft = 624
          end
        end
      end
    end
  end
end

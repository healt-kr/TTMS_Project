object frmHotel: TfrmHotel
  Left = 0
  Top = 0
  Caption = #49689#49548#44288#47532
  ClientHeight = 512
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    Left = 0
    Top = 241
    Width = 605
    Height = 180
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 421
    Width = 605
    Height = 91
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 326
    ExplicitWidth = 478
    object DBNavigator1: TDBNavigator
      Left = 112
      Top = 32
      Width = 240
      Height = 22
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 241
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 31
      Width = 49
      Height = 18
      Caption = #49689#49548#47749' :'
    end
    object DBEdit1: TDBEdit
      Left = 63
      Top = 28
      Width = 121
      Height = 26
      DataField = 'name'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edtRoomType1: TEdit
      Left = 304
      Top = 64
      Width = 121
      Height = 26
      TabOrder = 1
    end
    object edtRoomCharge1: TEdit
      Left = 448
      Top = 64
      Width = 121
      Height = 26
      TabOrder = 2
    end
    object edtRoomType2: TEdit
      Left = 304
      Top = 96
      Width = 121
      Height = 26
      TabOrder = 3
    end
    object edtRoomCharge2: TEdit
      Left = 448
      Top = 96
      Width = 121
      Height = 26
      TabOrder = 4
    end
    object edtRoomType3: TEdit
      Left = 304
      Top = 128
      Width = 121
      Height = 26
      TabOrder = 5
    end
    object edtRoomCharge3: TEdit
      Left = 448
      Top = 128
      Width = 121
      Height = 26
      TabOrder = 6
    end
    object edtRoomType4: TEdit
      Left = 304
      Top = 160
      Width = 121
      Height = 26
      TabOrder = 7
    end
    object edtRoomCharge4: TEdit
      Left = 448
      Top = 160
      Width = 121
      Height = 26
      TabOrder = 8
    end
    object edtRoomType5: TEdit
      Left = 304
      Top = 192
      Width = 121
      Height = 26
      TabOrder = 9
    end
    object edtRoomCharge5: TEdit
      Left = 448
      Top = 192
      Width = 121
      Height = 26
      TabOrder = 10
    end
  end
  object FDTable1: TFDTable
    BeforePost = FDTable1BeforePost
    AfterScroll = FDTable1AfterScroll
    IndexFieldNames = 'serial'
    Connection = DataModule1.FDConnection1
    UpdateOptions.UpdateTableName = 'hotel'
    TableName = 'hotel'
    Left = 232
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 312
    Top = 296
  end
end

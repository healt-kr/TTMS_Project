object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 463
  Width = 530
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\TTMS_Project\ttms.sdb'
      'ConnectionDef=TTMS_SQLite')
    Connected = True
    LoginPrompt = False
    Left = 216
    Top = 48
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM event')
    Left = 104
    Top = 120
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 216
    Top = 120
  end
  object qryPartnerList: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT serial, name'
      'FROM partner')
    Left = 96
    Top = 240
  end
  object PartnerListProvider: TDataSetProvider
    DataSet = qryPartnerList
    Left = 224
    Top = 240
  end
  object qryPartnerDetail: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM partner'
      'WHERE serial = :serial')
    Left = 96
    Top = 320
    ParamData = <
      item
        Name = 'SERIAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object PartnerDetailProvider: TDataSetProvider
    DataSet = qryPartnerDetail
    Left = 232
    Top = 320
  end
end

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
end

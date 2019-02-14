object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 169
  Width = 294
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\TTMS_Project\ttms.sdb'
      'ConnectionDef=TTMS_SQLite')
    LoginPrompt = False
    Left = 47
    Top = 48
  end
  object FDQueryManager: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * '
      'FROM manager'
      'WHERE pass = :pass')
    Left = 159
    Top = 46
    ParamData = <
      item
        Name = 'PASS'
        DataType = ftString
        ParamType = ptInput
        Value = '1234'
      end>
  end
end

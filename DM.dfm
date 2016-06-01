object fDM: TfDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 748
  Width = 916
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\'#1080#1089 +
      #1093#1086#1076#1085#1080#1082#1080'\ishodniki\Debug\Win32\db.mdb;Mode=Share Deny None;Persis' +
      't Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Reg' +
      'istry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Ty' +
      'pe=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial ' +
      'Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Da' +
      'tabase Password="";Jet OLEDB:Create System Database=False;Jet OL' +
      'EDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compac' +
      't=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB' +
      ':SFP=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 96
    Top = 8
  end
  object TBase: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = TBaseAfterInsert
    CommandText = 'select * from Base'
    IndexFieldNames = 'id'
    Parameters = <
      item
        Name = 'user'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'date'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        Value = Null
      end>
    Left = 48
    Top = 72
    object TBaseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object TBaseserOMS: TWideStringField
      FieldName = 'serOMS'
      Size = 10
    end
    object TBasePolisOMS: TWideStringField
      FieldName = 'PolisOMS'
      OnChange = TBasePolisOMSChange
      Size = 255
    end
    object TBaseFAM: TWideStringField
      FieldName = 'FAM'
      Size = 255
    end
    object TBaseIM: TWideStringField
      FieldName = 'IM'
      Size = 255
    end
    object TBaseOt: TWideStringField
      FieldName = 'Ot'
      Size = 255
    end
    object TBaseDR: TDateTimeField
      FieldName = 'DR'
      OnChange = TBaseDRChange
    end
    object TBaseserDMS: TWideStringField
      FieldName = 'serDMS'
      Size = 10
    end
    object TBasePolisDMS: TWideStringField
      FieldName = 'PolisDMS'
      OnChange = TBasePolisDMSChange
      Size = 255
    end
    object TBaseD_Zap: TDateTimeField
      FieldName = 'D_Zap'
    end
    object TBaseUser: TWideStringField
      FieldName = 'User'
      Size = 25
    end
    object TBaseny: TWideStringField
      FieldName = 'ny'
      Size = 255
    end
    object TBaselookNy: TStringField
      FieldKind = fkLookup
      FieldName = 'lookNy'
      LookupDataSet = TRZD
      LookupKeyFields = 'ny'
      LookupResultField = 'Name'
      KeyFields = 'ny'
      Lookup = True
    end
  end
  object DSBase: TDataSource
    DataSet = TBase
    Left = 128
    Top = 72
  end
  object TUsl: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Uslugy'
    DataSource = DSBase
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'Base_id'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'KodUSL'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Kol'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'Price'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'D_okaz'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'Diag'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'K_vr'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'K_ss'
        DataType = ftWideString
        Size = 50
      end>
    IndexFieldNames = 'Base_id'
    MasterFields = 'id'
    Parameters = <>
    StoreDefs = True
    Left = 48
    Top = 128
    object atncfldTUslid: TAutoIncField
      DisplayWidth = 10
      FieldName = 'id'
      ReadOnly = True
    end
    object intgrfldTUslBase_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'Base_id'
    end
    object wdstrngfldTUslKodUSL: TWideStringField
      DisplayWidth = 15
      FieldName = 'KodUSL'
      OnChange = wdstrngfldTUslKodUSLChange
      Size = 255
    end
    object intgrfldTUslKol: TIntegerField
      DisplayWidth = 10
      FieldName = 'Kol'
      OnChange = intgrfldTUslKolChange
    end
    object intgrfldTUslPrice: TIntegerField
      DisplayWidth = 10
      FieldName = 'Price'
    end
    object dtmfldTUslD_okaz: TDateTimeField
      DisplayWidth = 18
      FieldName = 'D_okaz'
    end
    object wdstrngfldTUslDiag: TWideStringField
      DisplayWidth = 8
      FieldName = 'Diag'
      Size = 255
    end
    object wdstrngfldTUslK_vr: TWideStringField
      DisplayWidth = 8
      FieldName = 'K_vr'
      Size = 50
    end
    object wdstrngfldTUslK_ss: TWideStringField
      DisplayWidth = 8
      FieldName = 'K_ss'
      Size = 50
    end
  end
  object DSUsl: TDataSource
    DataSet = TUsl
    Left = 128
    Top = 128
  end
  object QDMS: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'fam'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'name'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'fath'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'dr'
        DataType = ftDateTime
        Value = Null
      end>
    Left = 320
    Top = 280
  end
  object QCena: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'codeUSL'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 320
    Top = 344
  end
  object TUser: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 248
  end
  object DSUser: TDataSource
    DataSet = TUser
    Left = 128
    Top = 248
  end
  object QUser: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'user'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 400
    Top = 208
  end
  object TSMKB: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from mkb10'
    Parameters = <>
    Left = 48
    Top = 304
  end
  object DSSMKB: TDataSource
    DataSet = TSMKB
    Left = 128
    Top = 304
  end
  object QStat: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM BSunionSTOneDMS')
    Left = 320
    Top = 56
  end
  object QSum: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'date'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        Value = Null
      end>
    Left = 320
    Top = 136
  end
  object TRZD: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from RZD'
    Parameters = <>
    Left = 48
    Top = 360
    object TRZDny: TWideStringField
      FieldName = 'ny'
      Size = 255
    end
    object TRZDName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object DSTRZD: TDataSource
    DataSet = TRZD
    Left = 128
    Top = 360
  end
  object QSumma: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'date1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        Value = Null
      end>
    Left = 320
    Top = 552
  end
  object DSSumma: TDataSource
    DataSet = QSumma
    Left = 400
    Top = 552
  end
  object con1: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=TGA378Lm'
      'Protocol=TCPIP'
      'Server=172.31.8.123'
      'Database=C:\NUZService\Sprav.fdb'
      'RoleName=ROOT'
      'CharacterSet=WIN1251'
      'DriverID=FB')
    LoginPrompt = False
    Left = 736
    Top = 80
  end
  object fdphysfbdrvrlnk1: TFDPhysFBDriverLink
    VendorLib = 'C:\'#1080#1089#1093#1086#1076#1085#1080#1082#1080'\ishodniki\Debug\Win32\fbclient\fbclient.dll'
    Embedded = True
    Left = 736
    Top = 16
  end
  object fdtrnsctn1: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.ReadOnly = True
    Connection = con1
    Left = 664
    Top = 120
  end
  object fdqryRead: TFDQuery
    Connection = con1
    Transaction = fdtrnsctn1
    Left = 728
    Top = 193
    ParamData = <
      item
        Name = 'ser'
      end
      item
        Name = 'num'
      end>
  end
  object tblPrice: TADOTable
    Connection = ADOConnection1
    CursorLocation = clUseServer
    Filtered = True
    TableName = 'Price'
    Left = 48
    Top = 424
  end
  object fdqryDMS: TFDQuery
    FilterOptions = [foCaseInsensitive]
    Connection = con1
    Transaction = fdtrnsctn1
    Left = 730
    Top = 263
    ParamData = <
      item
        Name = 'FAM'
      end
      item
        Name = 'IM'
      end
      item
        Name = 'OT'
      end
      item
        Name = 'DR'
      end>
  end
end

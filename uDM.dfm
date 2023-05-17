object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 280
  Top = 174
  Height = 433
  Width = 653
  object Conexao: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1/3064:E:\Delphi\DB\cadastros.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 304
    Top = 168
  end
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = Conexao
    AutoStopAction = saNone
    Left = 232
    Top = 168
  end
  object IBDatabase: TIBDatabase
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 232
    Top = 88
  end
  object IBTransacTeste: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 312
    Top = 88
  end
  object SQLConnect: TSQLConnection
    ConnectionName = 'ExtractFilePath(Application.ExeName) +'#39'DB\CADASTROS.GDB'#39
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    VendorLib = 'gds32.dll'
    Left = 96
    Top = 64
  end
end

unit uDM;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IniFiles, IBCustomDataSet, IBQuery,
  DBClient, DBXpress, SqlExpr;

type
  TDM = class(TDataModule)
    Conexao: TIBDatabase;
    IBTransaction: TIBTransaction;
    IBDatabase: TIBDatabase;
    IBTransacTeste: TIBTransaction;
    SQLConnect: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    arqIni: TIniFile;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}



procedure TDM.DataModuleCreate(Sender: TObject);
var
  servidor, local, porta, login, senha: string;
begin

  arqIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+'\Configuracao.ini');

  local    := arqIni.ReadString('PARAMETROS','LOCAL','');
  servidor := arqIni.ReadString('PARAMETROS','SERVIDOR','');
  porta    := arqIni.ReadString('PARAMETROS','PORTA','');
  login    := arqIni.ReadString('PARAMETROS','LOGIN','');
  senha    := arqIni.ReadString('PARAMETROS','SENHA','');

  Conexao.Connected := false;

  Conexao.Params.Clear;
  Conexao.Params.Add('user_name='+login);
  Conexao.Params.Add('password='+senha);
  Conexao.DatabaseName := servidor+'/'+PORTA+':'+local;

  Conexao.LoginPrompt := false;

  Conexao.Connected := true;
end;

end.

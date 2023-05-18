unit uConfigBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, IniFiles, uDM, DB, IBCustomDataSet,
  IBQuery;

type
  TformConfigBanco = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel2: TPanel;
    editCaminhoDB: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    editPortaDB: TEdit;
    Label5: TLabel;
    editServidorDB: TEdit;
    Label6: TLabel;
    editLoginDB: TEdit;
    Label7: TLabel;
    editSenhaDB: TEdit;
    btnTeste: TSpeedButton;
    SpeedButton1: TSpeedButton;
    IBQTeste: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    arqIni: TIniFile;
  public
    { Public declarations }
  end;

var
  formConfigBanco: TformConfigBanco;

implementation

uses IBDatabase;

{$R *.dfm}



procedure TformConfigBanco.FormCreate(Sender: TObject);
begin
  arqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Configuracao.ini');

  editCaminhoDB.Text := arqIni.ReadString('PARAMETROS','LOCAL','');
  editServidorDB.Text := arqIni.ReadString('PARAMETROS','SERVIDOR','');
  editPortaDB.Text := arqIni.ReadString('PARAMETROS','PORTA','');
  editLoginDB.Text := arqIni.ReadString('PARAMETROS','LOGIN','');
  editSenhaDB.Text := arqIni.ReadString('PARAMETROS','SENHA','');
end;

procedure TformConfigBanco.btnTesteClick(Sender: TObject);
begin
  dm.IBDatabase.Connected := false;

  dm.IBDatabase.Params.Clear;
  dm.IBDatabase.Params.Add('user_name='+editLoginDB.Text);
  dm.IBDatabase.Params.Add('password='+editSenhaDB.Text);
  DM.IBDatabase.DatabaseName := editServidorDB.Text +'/'+editPortaDB.Text+':'+editCaminhoDB.Text;


  dm.IBDatabase.Connected := true;

  if(dm.Conexao.Connected = true) then
    begin
      ShowMessage('Banco de dados Conectado');
    end
  else
    begin
      ShowMessage('Banco NÃO Conectado');        
    end

end;

procedure TformConfigBanco.btnGravarClick(Sender: TObject);
begin

  dm.Conexao.Connected := false;

  dm.Conexao.Params.Clear;
  dm.Conexao.Params.Add('user_name='+editLoginDB.Text);
  dm.Conexao.Params.Add('password='+editSenhaDB.Text);
  DM.Conexao.DatabaseName := editServidorDB.Text +'/'+editPortaDB.Text+':'+editCaminhoDB.Text;


  dm.Conexao.Connected := true;

  arqIni.WriteString('PARAMETROS','LOCAL',editCaminhoDB.Text);
  arqIni.WriteString('PARAMETROS','SERVIDOR',editServidorDB.Text);
  arqIni.WriteString('PARAMETROS','PORTA',editPortaDB.Text);
  arqIni.WriteString('PARAMETROS','LOGIN',editLoginDB.Text);
  arqIni.WriteString('PARAMETROS','SENHA',editSenhaDB.Text);

end;

procedure TformConfigBanco.btnCancelarClick(Sender: TObject);
begin

  if(editCaminhoDB.Text = arqIni.ReadString('PARAMETROS','LOCAL',''))then
    begin
      formConfigBanco.Close;
    end
  else
    begin
      editCaminhoDB.Text := arqIni.ReadString('PARAMETROS','LOCAL','');
      editServidorDB.Text := arqIni.ReadString('PARAMETROS','SERVIDOR','');
      editPortaDB.Text := arqIni.ReadString('PARAMETROS','PORTA','');
      editLoginDB.Text := arqIni.ReadString('PARAMETROS','LOGIN','');
      editSenhaDB.Text := arqIni.ReadString('PARAMETROS','SENHA','');
    end

end;

procedure TformConfigBanco.SpeedButton1Click(Sender: TObject);
begin

  if (MessageDlg('Deseja realmente criar um novo banco ?', mtConfirmation, [mbYes, mbNo], 0) = 6) then
    begin

      with DM.IBDatabase do
        begin

          if not DirectoryExists(ExtractFilePath(Application.ExeName) +'\DB') then
            begin
              ForceDirectories(ExtractFilePath(Application.ExeName) +'\DB');
            end;

          DM.IBDatabase.SQLDialect := 3;
          DM.IBDatabase.DatabaseName := ExtractFilePath(Application.ExeName) +'DB\CADASTROS.GDB';
          DM.IBDatabase.Params.Clear;
          DM.IBDatabase.Params.Add('USER ''SYSDBA''');
          DM.IBDatabase.Params.Add('PASSWORD ''masterkey''');
          DM.IBDatabase.Params.Add('PAGE_SIZE 4096');
          DM.IBDatabase.Params.Add('DEFAULT CHARACTER SET ISO8859_1');
          DM.IBDatabase.CreateDatabase;

          dm.IBDatabase.Connected := false;

          dm.IBDatabase.Params.Clear;
          dm.IBDatabase.Params.Add('user_name='+editLoginDB.Text);
          dm.IBDatabase.Params.Add('password='+editSenhaDB.Text);
          DM.IBDatabase.DatabaseName := editServidorDB.Text +'/'+editPortaDB.Text+':'+ExtractFilePath(Application.ExeName) +'DB\CADASTROS.GDB';

          dm.IBDatabase.Connected := true;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;

          IBQTeste.SQL.Add('CREATE TABLE PESSOAS (');
          IBQTeste.SQL.Add('    CHAVE_PESSOAS      NUMERIC(12,2) NOT NULL,');
          IBQTeste.SQL.Add('    CPF                VARCHAR(14),');
          IBQTeste.SQL.Add('    NOME               VARCHAR(120),');
          IBQTeste.SQL.Add('    DOCUMENTO          VARCHAR(80),');
          IBQTeste.SQL.Add('    ENDERECO           VARCHAR(200),');
          IBQTeste.SQL.Add('    BAIRRO             VARCHAR(50),');
          IBQTeste.SQL.Add('    CIDADE             VARCHAR(40),');
          IBQTeste.SQL.Add('    UF                 VARCHAR(2),');
          IBQTeste.SQL.Add('    TELEFONE           VARCHAR(40),');
          IBQTeste.SQL.Add('    TELEFONE1          VARCHAR(40),');
          IBQTeste.SQL.Add('    DATA_NASCIMENTO    TIMESTAMP,');
          IBQTeste.SQL.Add('    CHAVE_CONJUGE      NUMERIC(12,2),');
          IBQTeste.SQL.Add('    SEXO               VARCHAR(1),');
          IBQTeste.SQL.Add('    CEP                VARCHAR(12),');
          IBQTeste.SQL.Add('    EMAIL              VARCHAR(50),');
          IBQTeste.SQL.Add('    NOME_PAI           VARCHAR(120),');
          IBQTeste.SQL.Add('    NOME_MAE           VARCHAR(120),');
          IBQTeste.SQL.Add('    OBSERVACAO         VARCHAR(2000),');
          IBQTeste.SQL.Add('    NATURALIDADE       VARCHAR(80),');
          IBQTeste.SQL.Add('    PAIS               VARCHAR(60),');
          IBQTeste.SQL.Add('    ORGAO_EMISSOR      VARCHAR(20),');
          IBQTeste.SQL.Add('    UF_NASCIMENTO      VARCHAR(2),');
          IBQTeste.SQL.Add('    CIDADE_NASCIMENTO  VARCHAR(40),');
          IBQTeste.SQL.Add('    PAIS_RESIDENCIA    VARCHAR(100),');
          IBQTeste.SQL.Add('    NACIONALIDADE      VARCHAR(50)');
          IBQTeste.SQL.Add(');');

          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;

          IBQTeste.SQL.Add('CREATE TABLE PESSOAS_JURIDICAS (');
          IBQTeste.SQL.Add('    CHAVE_PESSOAS_JURIDICAS  NUMERIC(12,2) NOT NULL,');
          IBQTeste.SQL.Add('    SITUACAO                 VARCHAR(20),');
          IBQTeste.SQL.Add('    CNPJ                     VARCHAR(16),');
          IBQTeste.SQL.Add('    RAZAO_SOCIAL             VARCHAR(120),');
          IBQTeste.SQL.Add('    NOME_FANTASIA            VARCHAR(120),');
          IBQTeste.SQL.Add('    NATUREZA_JURIDICA        VARCHAR(100),');
          IBQTeste.SQL.Add('    CNAE                     VARCHAR(150),');
          IBQTeste.SQL.Add('    ENDERECO                 VARCHAR(200),');
          IBQTeste.SQL.Add('    BAIRRO                   VARCHAR(50),');
          IBQTeste.SQL.Add('    CIDADE                   VARCHAR(40),');
          IBQTeste.SQL.Add('    UF                       VARCHAR(2),');
          IBQTeste.SQL.Add('    CEP                      VARCHAR(12),');
          IBQTeste.SQL.Add('    EMAIL                    VARCHAR(50),');
          IBQTeste.SQL.Add('    TELEFONE                 VARCHAR(40),');
          IBQTeste.SQL.Add('    TELEFONE1                VARCHAR(40),');
          IBQTeste.SQL.Add('    DATA_ABERTURA            TIMESTAMP,');
          IBQTeste.SQL.Add('    OBSERVACAO               VARCHAR(2000),');
          IBQTeste.SQL.Add('    NUMERO_ALTER_CONTRATO    VARCHAR(30)');
          IBQTeste.SQL.Add(');');

          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;

          IBQTeste.SQL.Add('CREATE TABLE PESSOAS_VINCULOS (');
          IBQTeste.SQL.Add('    CHAVE_PESSOAS_VINCULOS   NUMERIC(12,2) NOT NULL,');
          IBQTeste.SQL.Add('    CHAVE_PESSOAS_JURIDICAS  NUMERIC(12,2),');
          IBQTeste.SQL.Add('    CHAVE_PESSOAS            NUMERIC(12,2),');
          IBQTeste.SQL.Add('    FUNCAO                   VARCHAR(50)');
          IBQTeste.SQL.Add(');');
//          IBQTeste.SQL.Add('COMMIT WORK');

          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;

          IBQTeste.SQL.Add('ALTER TABLE PESSOAS ADD PRIMARY KEY (CHAVE_PESSOAS);');
          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;
          IBQTeste.SQL.Add('ALTER TABLE PESSOAS_JURIDICAS ADD CONSTRAINT PESSOAS_JURIDICAS_PK PRIMARY KEY (CHAVE_PESSOAS_JURIDICAS);');
          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;
          IBQTeste.SQL.Add('ALTER TABLE PESSOAS_VINCULOS ADD CONSTRAINT PESSOAS_VINCULOS_PK PRIMARY KEY (CHAVE_PESSOAS_VINCULOS);');
          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;
          IBQTeste.SQL.Add('ALTER TABLE PESSOAS ADD CONSTRAINT PESSOAS_CONJUGE_FK FOREIGN KEY (CHAVE_CONJUGE) REFERENCES PESSOAS (CHAVE_PESSOAS);');
          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;
          IBQTeste.SQL.Add('ALTER TABLE PESSOAS_VINCULOS ADD CONSTRAINT PESSOAS_VINCULOS_JURIDICAS_FK FOREIGN KEY (CHAVE_PESSOAS_JURIDICAS) REFERENCES PESSOAS_JURIDICAS (CHAVE_PESSOAS_JURIDICAS);');
          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          DM.IBDatabase.Close;
          IBQTeste.SQL.Clear;
          IBQTeste.SQL.Add('ALTER TABLE PESSOAS_VINCULOS ADD CONSTRAINT PESSOAS_VINCULOS_PESSOAS_FK FOREIGN KEY (CHAVE_PESSOAS) REFERENCES PESSOAS (CHAVE_PESSOAS);');

          IBQTeste.ExecSQL;
          DM.IBTransacTeste.Commit;

          if (MessageDlg('Banco de dados criados, Deseja aplicar como padrão ?', mtConfirmation, [mbYes, mbNo], 0) = 6) then
            begin
            
              editCaminhoDB.Text  := ExtractFilePath(Application.ExeName) +'DB\CADASTROS.GDB';
              editServidorDB.Text := '127.0.0.1';
              editPortaDB.Text    := '3064';
              editLoginDB.Text    := 'SYSDBA';
              editSenhaDB.Text    := 'masterkey';

              arqIni.WriteString('PARAMETROS','LOCAL',editCaminhoDB.Text);
              arqIni.WriteString('PARAMETROS','SERVIDOR',editServidorDB.Text);
              arqIni.WriteString('PARAMETROS','PORTA',editPortaDB.Text);
              arqIni.WriteString('PARAMETROS','LOGIN',editLoginDB.Text);
              arqIni.WriteString('PARAMETROS','SENHA',editSenhaDB.Text);
              
            end;
        end;

    end;



end;

end.

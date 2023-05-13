unit uPJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, uPesquisaReceitaCnpj, uDM, DB,
  IBCustomDataSet, IBQuery, xmldom, XMLIntf, msxmldom, XMLDoc, Mask, uPesquisaCNPJ;

type
  TformPessoaJuridica = class(TForm)
    btnGravar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btPesquisaPessoa: TSpeedButton;
    gpPesquisa: TGroupBox;
    btnBuscaCNPJ: TSpeedButton;
    editRazaoSocial: TEdit;
    gpPessoa: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    editDataAbertura: TEdit;
    editNomeFantasia: TEdit;
    editNumContrato: TEdit;
    editNatJuridica: TEdit;
    editCnae: TEdit;
    gpEndereco: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    editEndereco: TEdit;
    editCep: TEdit;
    btnPesquisaCep: TButton;
    editBairro: TEdit;
    cbxEstadoEndereco: TComboBox;
    editCidadeEndereco: TEdit;
    editTelefone: TEdit;
    editTelefone2: TEdit;
    editEmail: TEdit;
    gpObservacoes: TGroupBox;
    editObs: TMemo;
    Label4: TLabel;
    gpxPessoasVinculadas: TGroupBox;
    DBGrid1: TDBGrid;
    editCpfPessoaVinculada: TEdit;
    btnBuscaPessoaVinculada: TSpeedButton;
    editNomePessoaVinculada: TEdit;
    Label2: TLabel;
    editFuncaoPessoaVinculada: TEdit;
    btnIncluiPessoaVinculada: TSpeedButton;
    btnCancelaPessoaVinculada: TSpeedButton;
    IdHttp: TIdHTTP;
    editStatusCnpjs: TEdit;
    IBQuery: TIBQuery;
    lblChavePessoaJuridica: TLabel;
    IBPessoasVinculadas: TIBQuery;
    DSPessoasVinculadas: TDataSource;
    lblChavePessoas: TLabel;
    lblchavePessoasVinculos: TLabel;
    XMLBuscaCep: TXMLDocument;
    editCnpj: TMaskEdit;
    procedure btnBuscaCNPJClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscaPessoaVinculadaClick(Sender: TObject);
    procedure btnIncluiPessoaVinculadaClick(Sender: TObject);
    procedure btnCancelaPessoaVinculadaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnPesquisaCepClick(Sender: TObject);
    procedure btPesquisaPessoaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPessoaJuridica: TformPessoaJuridica;
  TSConsulta: TStringList;

implementation

uses Math;

{$R *.dfm}


procedure TformPessoaJuridica.btnBuscaCNPJClick(Sender: TObject);
begin

    editNomePessoaVinculada.Text := '';
    editFuncaoPessoaVinculada.Text := '';
    editCpfPessoaVinculada.Text :=  '';

    editFuncaoPessoaVinculada.ReadOnly := true;
    editFuncaoPessoaVinculada.Color    := cl3DLight;

    editCpfPessoaVinculada.ReadOnly := false;
    editCpfPessoaVinculada.Color    := clWindow;

    btnBuscaPessoaVinculada.Enabled := true;

    IBQuery.Close;
    IBQuery.SQL.Clear;
    IBQuery.SQL.Add('select chave_pessoas_juridicas, razao_social, data_abertura, situacao, nome_fantasia, natureza_juridica, CNAE, endereco, bairro, cidade, UF, cep, email, telefone, telefone1, observacao, numero_alter_contrato from pessoas_juridicas where CNPJ = '+ QuotedStr(editCnpj.Text));
    IBQuery.Open;

    editRazaoSocial.Text :=  varToStr(IBQuery.FieldValues['razao_social']);
    lblChavePessoaJuridica.Caption := varToStr(IBQuery.FieldValues['chave_pessoas_juridicas']);

    if (editRazaoSocial.Text = '') then
      begin

        if (MessageDlg('CNPJ não encontrado em cadastro, deseja pesquisar na receita ?', mtConfirmation, [mbYes, mbNo], 0) = 6) then
          begin

            formPesquisaReceitaCnpj := TformPesquisaReceitaCnpj.Create(Application);
            formPesquisaReceitaCnpj.Show;
            formPesquisaReceitaCnpj.EditCNPJ.clear;
            formPesquisaReceitaCnpj.EditCNPJ.Text := formPessoaJuridica.editCnpj.Text;
            
          end;

      end
    else if (lblChavePessoaJuridica.Caption <> '') then
      begin
        editRazaoSocial.Text      := varToStr(IBQuery.FieldValues['razao_social']);
        editDataAbertura.Text     := varToStr(IBQuery.FieldValues['data_abertura']);
        editStatusCnpjs.Text      := varToStr(IBQuery.FieldValues['situacao']);
        editNomeFantasia.Text     := varToStr(IBQuery.FieldValues['nome_fantasia']);
        editNatJuridica.Text      := varToStr(IBQuery.FieldValues['natureza_juridica']);
        editCnae.Text             := varToStr(IBQuery.FieldValues['CNAE']);
        editEndereco.Text         := varToStr(IBQuery.FieldValues['endereco']);
        editBairro.Text           := varToStr(IBQuery.FieldValues['bairro']);
        editCidadeEndereco.Text   := varToStr(IBQuery.FieldValues['cidade']);
        editCep.Text   := varToStr(IBQuery.FieldValues['cep']);

        cbxEstadoEndereco.ItemIndex := cbxEstadoEndereco.Items.IndexOf(varToStr(IBQuery.FieldValues['UF']));

        editEmail.Text       := varToStr(IBQuery.FieldValues['email']);
        editTelefone.Text    := varToStr(IBQuery.FieldValues['telefone']);
        editTelefone2.Text   := varToStr(IBQuery.FieldValues['telefone1']);
        editObs.Text         := varToStr(IBQuery.FieldValues['observacao']);
        editNumContrato.Text := varToStr(IBQuery.FieldValues['numero_alter_contrato']);


        IBPessoasVinculadas.Close;
        IBPessoasVinculadas.SQL.Clear;
        IBPessoasVinculadas.SQL.Add('select p.nome, p.cpf, pj.RAZAo_SOCIAL, pj.CNPJ, pv.funcao, pv.CHAVE_PESSOAS_VINCULOS from pessoas_vinculos pv inner join pessoas p ');
        IBPessoasVinculadas.SQL.Add('on p.chave_pessoas = pv.chave_pessoas inner join pessoas_juridicas pj ');
        IBPessoasVinculadas.SQL.Add('on pv.chave_pessoas_juridicas = pj.chave_pessoas_juridicas ');
        IBPessoasVinculadas.SQL.Add('where pv.chave_pessoas_juridicas = '+QuotedStr(lblChavePessoaJuridica.Caption));
        IBPessoasVinculadas.Open;

        btnAlterar.Enabled := true;
        btnExcluir.Enabled := true;

      end;

end;

procedure TformPessoaJuridica.btnGravarClick(Sender: TObject);
begin

  IBQuery.Close;
  IBQuery.SQL.Clear;
  IBQuery.SQL.Add('select chave_pessoas_juridicas from pessoas_juridicas where CNPJ = '+QuotedStr(editCnpj.Text));
  IBQuery.Open;

  lblChavePessoaJuridica.Caption := varToStr(IBQuery.FieldValues['chave_pessoas_juridicas']);

  //verifica se retornou algo para escolher entre insert ou update
  if(lblChavePessoaJuridica.Caption = '') then
    begin

      IBQuery.Close;
      IBQuery.SQL.Clear;
      IBQuery.SQL.Add('INSERT INTO PESSOAS_JURIDICAS (CHAVE_PESSOAS_JURIDICAS, SITUACAO, CNPJ, RAZAO_SOCIAL, NOME_FANTASIA, NATUREZA_JURIDICA,');
      IBQuery.SQL.Add('CNAE, ENDERECO, BAIRRO, CIDADE, UF, CEP, EMAIL, TELEFONE, TELEFONE1, DATA_ABERTURA, OBSERVACAO, NUMERO_ALTER_CONTRATO)');
      IBQuery.SQL.Add('values ((SELECT  COALESCE(max(CHAVE_PESSOAS_JURIDICAS), 0) +1 FROM PESSOAS_JURIDICAS), :SITUACAO, :CNPJ, :RAZAO_SOCIAL, :NOME_FANTASIA, :NATUREZA_JURIDICA, :CNAE, :ENDERECO, :BAIRRO, :CIDADE, :UF,');
      IBQuery.SQL.Add(' :CEP, :EMAIL, :TELEFONE, :TELEFONE1, :DATA_ABERTURA, :OBSERVACAO, :NUMERO_ALTER_CONTRATO)');
      IBQuery.ParamByName('SITUACAO').AsString := editStatusCnpjs.Text;
      IBQuery.ParamByName('CNPJ').AsString := editCnpj.Text;
      IBQuery.ParamByName('RAZAO_SOCIAL').AsString := editRazaoSocial.Text;
      IBQuery.ParamByName('NOME_FANTASIA').AsString := editNomeFantasia.Text;
      IBQuery.ParamByName('NATUREZA_JURIDICA').AsString := editNatJuridica.Text;
      IBQuery.ParamByName('CNAE').AsString := editCnae.Text;
      IBQuery.ParamByName('ENDERECO').AsString := editEndereco.Text;
      IBQuery.ParamByName('BAIRRO').AsString := editBairro.Text;
      IBQuery.ParamByName('CIDADE').AsString := editCidadeEndereco.Text;
      IBQuery.ParamByName('UF').AsString := varToStr(cbxEstadoEndereco.Text);
      //IBQuery1.ParamByName('chave_conjuge').AsString := editc.Text;
      IBQuery.ParamByName('CEP').AsString := editCep.Text;
      IBQuery.ParamByName('EMAIL').AsString := editEmail.Text;
      IBQuery.ParamByName('TELEFONE').AsString := editTelefone.Text;
      IBQuery.ParamByName('TELEFONE1').AsString := editTelefone2.Text;
      IBQuery.ParamByName('DATA_ABERTURA').AsDate := strToDate(varToStr(editDataAbertura.Text));
      IBQuery.ParamByName('OBSERVACAO').AsString := editObs.Text;
      IBQuery.ParamByName('NUMERO_ALTER_CONTRATO').AsString := editNumContrato.Text;

      IBQuery.ExecSQL;
      DM.IBTransaction.Commit;
      ShowMessage('CNPJ Gravado!');
      formPessoaJuridica.btnCancelarClick(Sender);

    end
  else if (lblChavePessoaJuridica.Caption <> '') then
    begin

      IBQuery.Close;
      IBQuery.SQL.Clear;
      IBQuery.SQL.Add('update PESSOAS_JURIDICAS set SITUACAO = :SITUACAO, CNPJ = :CNPJ, RAZAO_SOCIAL = :RAZAO_SOCIAL, NOME_FANTASIA = :NOME_FANTASIA, NATUREZA_JURIDICA = :NATUREZA_JURIDICA,');
      IBQuery.SQL.Add('CNAE = :CNAE, ENDERECO = :ENDERECO, BAIRRO = :BAIRRO, CIDADE = :CIDADE, UF = :UF, CEP = :CEP, EMAIL = :EMAIL, TELEFONE = :TELEFONE, TELEFONE1 = :TELEFONE1, DATA_ABERTURA = :DATA_ABERTURA, ');
      IBQuery.SQL.Add('OBSERVACAO = :OBSERVACAO, NUMERO_ALTER_CONTRATO = :NUMERO_ALTER_CONTRATO where CNPJ = '+ QuotedStr(editCnpj.Text));
      IBQuery.ParamByName('SITUACAO').AsString := editStatusCnpjs.Text;
      IBQuery.ParamByName('CNPJ').AsString := editCnpj.Text;
      IBQuery.ParamByName('RAZAO_SOCIAL').AsString := editRazaoSocial.Text;
      IBQuery.ParamByName('NOME_FANTASIA').AsString := editNomeFantasia.Text;
      IBQuery.ParamByName('NATUREZA_JURIDICA').AsString := editNatJuridica.Text;
      IBQuery.ParamByName('CNAE').AsString := editCnae.Text;
      IBQuery.ParamByName('ENDERECO').AsString := editEndereco.Text;
      IBQuery.ParamByName('BAIRRO').AsString := editBairro.Text;
      IBQuery.ParamByName('CIDADE').AsString := editCidadeEndereco.Text;
      IBQuery.ParamByName('UF').AsString := varToStr(cbxEstadoEndereco.Text);
      //IBQuery1.ParamByName('chave_conjuge').AsString := editc.Text;
      IBQuery.ParamByName('CEP').AsString := editCep.Text;
      IBQuery.ParamByName('EMAIL').AsString := editEmail.Text;
      IBQuery.ParamByName('TELEFONE').AsString := editTelefone.Text;
      IBQuery.ParamByName('TELEFONE1').AsString := editTelefone2.Text;
      IBQuery.ParamByName('DATA_ABERTURA').AsDate := strToDate(varToStr(editDataAbertura.Text));
      IBQuery.ParamByName('OBSERVACAO').AsString := editObs.Text;
      IBQuery.ParamByName('NUMERO_ALTER_CONTRATO').AsString := editNumContrato.Text;

      IBQuery.ExecSQL;
      DM.IBTransaction.Commit;
      ShowMessage('CNPJ Alterado!');
      formPessoaJuridica.btnCancelarClick(Sender);

    end;
  
end;

procedure TformPessoaJuridica.btnAlterarClick(Sender: TObject);
begin

  editRazaoSocial.ReadOnly      := false;
  editDataAbertura.ReadOnly     := false;
  editStatusCnpjs.ReadOnly      := false;
  editNomeFantasia.ReadOnly     := false;
  editNatJuridica.ReadOnly      := false;
  editCnae.ReadOnly             := false;
  editEndereco.ReadOnly         := false;
  editBairro.ReadOnly           := false;
  editCidadeEndereco.ReadOnly   := false;
  editCep.ReadOnly              := false;
  cbxEstadoEndereco.Enabled     := true;
  editEmail.ReadOnly            := false;
  editTelefone.ReadOnly         := false;
  editTelefone2.ReadOnly        := false;
  editObs.ReadOnly              := false;
  editNumContrato.ReadOnly      := false;

  editRazaoSocial.Color     := clWindow;
  editDataAbertura.Color     := clWindow;
  editStatusCnpjs.Color      := clWindow;
  editNomeFantasia.Color     := clWindow;
  editNatJuridica.Color      := clWindow;
  editCnae.Color             := clWindow;
  editEndereco.Color         := clWindow;
  editBairro.Color           := clWindow;
  editCidadeEndereco.Color   := clWindow;
  editCep.Color              := clWindow;
  cbxEstadoEndereco.Color    := clWindow;
  editEmail.Color            := clWindow;
  editTelefone.Color         := clWindow;
  editTelefone2.Color        := clWindow;
  editObs.Color              := clWindow;
  editNumContrato.Color      := clWindow;

  btnCancelar.Enabled    := true;
  btnGravar.Enabled      := true;
  btnExcluir.Enabled     := false;
  btnAlterar.Enabled     := false;
  btnPesquisaCep.Enabled := true;
end;

procedure TformPessoaJuridica.btnCancelarClick(Sender: TObject);
begin

  editRazaoSocial.ReadOnly      := true;
  editDataAbertura.ReadOnly     := true;
  editStatusCnpjs.ReadOnly      := true;
  editNomeFantasia.ReadOnly     := true;
  editNatJuridica.ReadOnly      := true;
  editCnae.ReadOnly             := true;
  editEndereco.ReadOnly         := true;
  editBairro.ReadOnly           := true;
  editCidadeEndereco.ReadOnly   := true;
  editCep.ReadOnly              := true;
  cbxEstadoEndereco.Enabled     := true;
  editEmail.ReadOnly            := true;
  editTelefone.ReadOnly         := true;
  editTelefone2.ReadOnly        := true;
  editObs.ReadOnly              := true;
  editNumContrato.ReadOnly      := true;

  editRazaoSocial.Color      := cl3DLight;
  editDataAbertura.Color     := cl3DLight;
  editStatusCnpjs.Color      := cl3DLight;
  editNomeFantasia.Color     := cl3DLight;
  editNatJuridica.Color      := cl3DLight;
  editCnae.Color             := cl3DLight;
  editEndereco.Color         := cl3DLight;
  editBairro.Color           := cl3DLight;
  editCidadeEndereco.Color   := cl3DLight;
  editCep.Color              := cl3DLight;
  cbxEstadoEndereco.Color    := cl3DLight;
  editEmail.Color            := cl3DLight;
  editTelefone.Color         := cl3DLight;
  editTelefone2.Color        := cl3DLight;
  editObs.Color              := cl3DLight;
  editNumContrato.Color      := cl3DLight;

  btnCancelar.Enabled := false;
  btnGravar.Enabled   := false;
  btnExcluir.Enabled  := true;
  btnAlterar.Enabled  := true;

  formPessoaJuridica.btnBuscaCNPJClick(Sender);

end;

procedure TformPessoaJuridica.btnBuscaPessoaVinculadaClick(
  Sender: TObject);
begin

  IBQuery.Close;
  IBQuery.SQL.Clear;
  IBQuery.SQL.Add('select chave_pessoas, cpf, nome, chave_conjuge from pessoas where cpf = '+editCpfPessoaVinculada.Text);
  IBQuery.Open;

  editNomePessoaVinculada.Text := varToStr(IBQuery.FieldValues['nome']);
  lblChavePessoas.Caption      := varToStr(IBQuery.FieldValues['chave_pessoas']);

  editFuncaoPessoaVinculada.ReadOnly := false;
  editFuncaoPessoaVinculada.Color    := clWindow;
  
end;

procedure TformPessoaJuridica.btnIncluiPessoaVinculadaClick(
  Sender: TObject);
begin

  if (lblChavePessoas.Caption = '') then
    begin
      ShowMessage('Pessoa não cadastrada ou já vinculada!');
    end
  else if (editFuncaoPessoaVinculada.Text = '' ) then
    begin
      ShowMessage('Preencha a função desta pessoa!');
    end
  else if(lblChavePessoas.Caption <> '' ) and (editFuncaoPessoaVinculada.Text <> '' ) then
    begin

      IBQuery.Close;
      IBQuery.SQL.Clear;
      IBQuery.SQL.Add('insert into pessoas_vinculos (CHAVE_PESSOAS_VINCULOS, CHAVE_PESSOAS_JURIDICAS, CHAVE_PESSOAS, FUNCAO)');
      IBQuery.SQL.Add('VALUES ((SELECT COALESCE(max(CHAVE_PESSOAS_VINCULOS), 0) +1 FROM pessoas_vinculos), :CHAVE_PESSOAS_JURIDICAS, :CHAVE_PESSOAS, :FUNCAO)');
      IBQuery.ParamByName('CHAVE_PESSOAS_JURIDICAS').AsString := lblChavePessoaJuridica.Caption;
      IBQuery.ParamByName('CHAVE_PESSOAS').AsString := lblChavePessoas.Caption;
      IBQuery.ParamByName('FUNCAO').AsString := editFuncaoPessoaVinculada.Text;
      IBQuery.ExecSQL;
      DM.IBTransaction.Commit;

      ShowMessage('Pessoa Vinculada');

//      btnIncluiPessoaVinculada.Enabled := false;
      btnBuscaPessoaVinculada.Enabled := true;

      editFuncaoPessoaVinculada.ReadOnly := true;
      editFuncaoPessoaVinculada.Color    := cl3DLight;

      formPessoaJuridica.btnBuscaCNPJClick(Sender);

    end;

end;

procedure TformPessoaJuridica.btnCancelaPessoaVinculadaClick(
  Sender: TObject);
begin
  if (editCpfPessoaVinculada.Text <> '') and (btnBuscaPessoaVinculada.Enabled = false) then
    begin

      if(MessageDlg('Deseja desvincular pessoa selecionada ?', mtConfirmation, [mbYes, mbNo], 0) = 6) then
        begin

          IBQuery.Close;
          IBQuery.SQL.Clear;
          IBQuery.SQL.Add('delete from pessoas_vinculos where CHAVE_PESSOAS_VINCULOS = ' + QuotedStr(lblchavePessoasVinculos.Caption));
          IBQuery.ExecSQL;
          DM.IBTransaction.Commit;

          ShowMessage('Pessoa desvinculada');

          editNomePessoaVinculada.Text := '';
          editFuncaoPessoaVinculada.Text := '';
          editCpfPessoaVinculada.Text :=  '';

          editFuncaoPessoaVinculada.ReadOnly := true;
          editFuncaoPessoaVinculada.Color    := cl3DLight;

          editCpfPessoaVinculada.ReadOnly := false;
          editCpfPessoaVinculada.Color    := clWindow;

          btnBuscaPessoaVinculada.Enabled := true;
        end
      else
        begin

          ShowMessage('Operação Cancelada!');

          editNomePessoaVinculada.Text := '';
          editFuncaoPessoaVinculada.Text := '';
          editCpfPessoaVinculada.Text :=  '';

          editFuncaoPessoaVinculada.ReadOnly := true;
          editFuncaoPessoaVinculada.Color    := cl3DLight;

          editCpfPessoaVinculada.ReadOnly := false;
          editCpfPessoaVinculada.Color    := clWindow;

          btnBuscaPessoaVinculada.Enabled := true;

        end


    end;
  //else if (
end;

procedure TformPessoaJuridica.DBGrid1DblClick(Sender: TObject);
var
  chave_vinculos: String;
begin

  chave_vinculos := DSPessoasVinculadas.DataSet.FieldValues['CHAVE_PESSOAS_VINCULOS'];

  IBQuery.Close;
  IBQuery.SQL.Clear;
  IBQuery.SQL.Add('select p.NOME, p.CPF, pv.FUNCAO, pv.CHAVE_PESSOAS_VINCULOS from PESSOAS_VINCULOS pv');
  IBQuery.SQL.Add('inner join pessoas p');
  IBQuery.SQL.Add('on p.chave_pessoas = pv.chave_pessoas');
  IBQuery.SQL.Add('WHERE PV.CHAVE_PESSOAS_VINCULOS = :chave_pessoas_vinculos');
  IBQuery.Params.ParamByName('chave_pessoas_vinculos').Value := chave_vinculos;
  IBQuery.Open;

  lblchavePessoasVinculos.Caption  := varToStr(IBQuery.FieldValues['CHAVE_PESSOAS_VINCULOS']);
  editNomePessoaVinculada.Text     := varToStr(IBQuery.FieldValues['NOME']);
  editFuncaoPessoaVinculada.Text   := varToStr(IBQuery.FieldValues['FUNCAO']);
  editCpfPessoaVinculada.Text      := varToStr(IBQuery.FieldValues['CPF']);

  editCpfPessoaVinculada.ReadOnly  := true;
  editCpfPessoaVinculada.Color     := cl3DLight;

  btnBuscaPessoaVinculada.Enabled  := false;
  
end;

procedure TformPessoaJuridica.btnPesquisaCepClick(Sender: TObject);
var
  //Consulta: String;
  Resposta: TStringStream;
  posicao: Integer;
begin

  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create();
  IDHttp.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV2';
  TSConsulta.Values['&cep'] := editCep.Text;
  TSConsulta.Values['&formato'] := 'xml';

  IDHttp.Post('http://cep.republicavirtual.com.br/web_cep.php?', TSConsulta, Resposta);
  XMLBuscaCep.Active := true;
  XMLBuscaCep.Encoding := 'iso-8858-1';
  XMLBuscaCep.LoadFromStream(Resposta);

  editEndereco.Text := XMLBuscaCep.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue + ' ' +XMLBuscaCep.DocumentElement.ChildNodes['logradouro'].NodeValue;
  editBairro.Text := XMLBuscaCep.DocumentElement.ChildNodes['bairro'].NodeValue;
  editCidadeEndereco.Text := XMLBuscaCep.DocumentElement.ChildNodes['cidade'].NodeValue;
  cbxEstadoEndereco.ItemIndex := cbxEstadoEndereco.Items.IndexOf(XMLBuscaCep.DocumentElement.ChildNodes['uf'].NodeValue);

end;

procedure TformPessoaJuridica.btPesquisaPessoaClick(Sender: TObject);
begin
  formPesquisaCNPJ := TformPesquisaCNPJ.Create(Application);
  formPesquisaCNPJ.Show;
end;

procedure TformPessoaJuridica.btnExcluirClick(Sender: TObject);
begin
  if(lblChavePessoaJuridica.Caption = '') then
    begin
      ShowMessage('Pessoa não encontrada!');
    end
  else
    begin
      if(lblChavePessoaJuridica.Caption <> '') then
        begin
          if(lblchavePessoasVinculos.Caption <> '') then
            begin
              if(MessageDlg('Este cadastro contem pessoas vinculadas, deseja realmente excluir ?', mtConfirmation, [mbYes, mbNo], 0) = 6) then
                begin

                    IBPessoasVinculadas.Close;
                    IBPessoasVinculadas.SQL.Clear;
                    IBPessoasVinculadas.SQL.Add('delete from pessoas_vinculos where chave_pessoas_juridicas = '+lblChavePessoaJuridica.Caption);
                    IBPessoasVinculadas.ExecSQL;
                    DM.IBTransaction.Commit;


                    IBQuery.Close;
                    IBQuery.SQL.Clear;
                    IBQuery.SQL.Add('delete from pessoas_juridicas where chave_pessoas_juridicas = '+lblChavePessoaJuridica.Caption);
                    IBQuery.Open;

                    editRazaoSocial.ReadOnly      := true;
                    editDataAbertura.ReadOnly     := true;
                    editStatusCnpjs.ReadOnly      := true;
                    editNomeFantasia.ReadOnly     := true;
                    editNatJuridica.ReadOnly      := true;
                    editCnae.ReadOnly             := true;
                    editEndereco.ReadOnly         := true;
                    editBairro.ReadOnly           := true;
                    editCidadeEndereco.ReadOnly   := true;
                    editCep.ReadOnly              := true;
                    cbxEstadoEndereco.Enabled     := true;
                    editEmail.ReadOnly            := true;
                    editTelefone.ReadOnly         := true;
                    editTelefone2.ReadOnly        := true;
                    editObs.ReadOnly              := true;
                    editNumContrato.ReadOnly      := true;

                    editRazaoSocial.Text      := '';
                    editDataAbertura.Text     := '';
                    editStatusCnpjs.Text      := '';
                    editNomeFantasia.Text     := '';
                    editNatJuridica.Text      := '';
                    editCnae.Text             := '';
                    editEndereco.Text         := '';
                    editBairro.Text           := '';
                    editCidadeEndereco.Text   := '';
                    editCep.Text              := '';
                    cbxEstadoEndereco.Text    := '';
                    editEmail.Text            := '';
                    editTelefone.Text         := '';
                    editTelefone2.Text        := '';
                    editObs.Text              := '';
                    editNumContrato.Text      := '';

                    editRazaoSocial.Color      := cl3DLight;
                    editDataAbertura.Color     := cl3DLight;
                    editStatusCnpjs.Color      := cl3DLight;
                    editNomeFantasia.Color     := cl3DLight;
                    editNatJuridica.Color      := cl3DLight;
                    editCnae.Color             := cl3DLight;
                    editEndereco.Color         := cl3DLight;
                    editBairro.Color           := cl3DLight;
                    editCidadeEndereco.Color   := cl3DLight;
                    editCep.Color              := cl3DLight;
                    cbxEstadoEndereco.Color    := cl3DLight;
                    editEmail.Color            := cl3DLight;
                    editTelefone.Color         := cl3DLight;
                    editTelefone2.Color        := cl3DLight;
                    editObs.Color              := cl3DLight;
                    editNumContrato.Color      := cl3DLight;

                    btnCancelar.Enabled := false;
                    btnGravar.Enabled   := false;
                    btnExcluir.Enabled  := true;
                    btnAlterar.Enabled  := true;

                    IBPessoasVinculadas.Active := false;
                    IBPessoasVinculadas.Active := true;

                end
            end
          else
            begin
              if(MessageDlg('Deseja realmente excluir este cadastro ?', mtConfirmation, [mbYes, mbNo], 0) = 6) then
                begin
                    IBQuery.Close;
                    IBQuery.SQL.Clear;
                    IBQuery.SQL.Add('delete from pessoas_juridicas where chave_pessoas_juridicas = '+lblChavePessoaJuridica.Caption);
                    IBQuery.Open;

                    editRazaoSocial.ReadOnly      := true;
                    editDataAbertura.ReadOnly     := true;
                    editStatusCnpjs.ReadOnly      := true;
                    editNomeFantasia.ReadOnly     := true;
                    editNatJuridica.ReadOnly      := true;
                    editCnae.ReadOnly             := true;
                    editEndereco.ReadOnly         := true;
                    editBairro.ReadOnly           := true;
                    editCidadeEndereco.ReadOnly   := true;
                    editCep.ReadOnly              := true;
                    cbxEstadoEndereco.Enabled     := true;
                    editEmail.ReadOnly            := true;
                    editTelefone.ReadOnly         := true;
                    editTelefone2.ReadOnly        := true;
                    editObs.ReadOnly              := true;
                    editNumContrato.ReadOnly      := true;

                    editRazaoSocial.Text      := '';
                    editDataAbertura.Text     := '';
                    editStatusCnpjs.Text      := '';
                    editNomeFantasia.Text     := '';
                    editNatJuridica.Text      := '';
                    editCnae.Text             := '';
                    editEndereco.Text         := '';
                    editBairro.Text           := '';
                    editCidadeEndereco.Text   := '';
                    editCep.Text              := '';
                    cbxEstadoEndereco.Text    := '';
                    editEmail.Text            := '';
                    editTelefone.Text         := '';
                    editTelefone2.Text        := '';
                    editObs.Text              := '';
                    editNumContrato.Text      := '';

                    editRazaoSocial.Color      := cl3DLight;
                    editDataAbertura.Color     := cl3DLight;
                    editStatusCnpjs.Color      := cl3DLight;
                    editNomeFantasia.Color     := cl3DLight;
                    editNatJuridica.Color      := cl3DLight;
                    editCnae.Color             := cl3DLight;
                    editEndereco.Color         := cl3DLight;
                    editBairro.Color           := cl3DLight;
                    editCidadeEndereco.Color   := cl3DLight;
                    editCep.Color              := cl3DLight;
                    cbxEstadoEndereco.Color    := cl3DLight;
                    editEmail.Color            := cl3DLight;
                    editTelefone.Color         := cl3DLight;
                    editTelefone2.Color        := cl3DLight;
                    editObs.Color              := cl3DLight;
                    editNumContrato.Color      := cl3DLight;

                    btnCancelar.Enabled := false;
                    btnGravar.Enabled   := false;
                    btnExcluir.Enabled  := true;
                    btnAlterar.Enabled  := true;
                end

            end
        end

    end;

end;

end.



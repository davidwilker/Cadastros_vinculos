unit uPessoasF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, uDM, DB, IBCustomDataSet, IBQuery,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  xmldom, XMLIntf, msxmldom, XMLDoc, uPesquisaPessoa, uFormatacao, Mask, DateUtils;

type
  TformPessoasF = class(TForm)
    gpPesquisa: TGroupBox;
    editPassNome: TEdit;
    btnPessBuscaCpf: TSpeedButton;
    gpPessoa: TGroupBox;
    Label1: TLabel;
    editIdade: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbxSexo: TComboBox;
    editEstadoCivil: TEdit;
    Label4: TLabel;
    editDocumento: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    editTipoDocumento: TEdit;
    Label7: TLabel;
    editOrgEmissor: TEdit;
    editNacionalidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    cbxEstadoNascido: TComboBox;
    editNaturalidade: TEdit;
    Label10: TLabel;
    gpFiliacao: TGroupBox;
    Edit6: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    gpEndereco: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    editEndereco: TEdit;
    btnPesquisaCep: TButton;
    Label15: TLabel;
    editBairro: TEdit;
    Label16: TLabel;
    cbxEstadoEndereco: TComboBox;
    Label17: TLabel;
    editCidadeEndereco: TEdit;
    editTelefone: TEdit;
    Label18: TLabel;
    editTelefone2: TEdit;
    Label19: TLabel;
    editEmail: TEdit;
    Label20: TLabel;
    Label22: TLabel;
    editPaisEndereco: TEdit;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    Label23: TLabel;
    editPai: TEdit;
    editMae: TEdit;
    gpConjuge: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    editCpfConjuge: TEdit;
    editNomeConjuge: TEdit;
    gpObservacoes: TGroupBox;
    editObs: TMemo;
    btnGravar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btPesquisaPessoa: TSpeedButton;
    IBQuery1: TIBQuery;
    lblChavePessoa: TLabel;
    IDHttp: TIdHTTP;
    XMLBuscaCep: TXMLDocument;
    btnAlterConjuge: TSpeedButton;
    btnIncluiConjuge: TSpeedButton;
    btnCancelaConjuge: TSpeedButton;
    editCpf: TMaskEdit;
    editCep: TMaskEdit;
    editDataNascimento: TMaskEdit;
    procedure btnPessBuscaCpfClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure editCpfCorretoChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisaCepClick(Sender: TObject);
    procedure btPesquisaPessoaClick(Sender: TObject);
    procedure btnAlterConjugeClick(Sender: TObject);
    procedure btnIncluiConjugeClick(Sender: TObject);
    procedure btnCancelaConjugeClick(Sender: TObject);
    procedure editCpfCorretoExit(Sender: TObject);
    procedure editDataNascimentoExit(Sender: TObject);
    procedure editDataNascimentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPessoasF: TformPessoasF;
  resultadoCadastro: integer;
  //resultadoExclusao: integer;
  TSConsulta: TStringList;

implementation

{$R *.dfm}

procedure TformPessoasF.btnPessBuscaCpfClick(Sender: TObject);
begin

  IBQuery1.Close;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select p.chave_pessoas, p.cpf, p.nome, p.documento, p.endereco, p.bairro, p.cidade, p.uf, p.telefone, p.telefone1, p.data_nascimento,');
  IBQuery1.SQL.Add('p.chave_conjuge, p.sexo, p.cep, p.email, p.NOME_PAI, p.NOME_MAE, p.observacao, p.naturalidade, p.nacionalidade, p.PAIS, p.orgao_emissor, p.uf_nascimento,');
  IBQuery1.SQL.Add('p.CIDADE_NASCIMENTO, p.PAIS_RESIDENCIA, pc.cpf as cpf_conjuge, pc.nome as nome_conjuge');
  IBQuery1.SQL.Add('from pessoas p left join pessoas pc on p.chave_pessoas = pc.chave_conjuge where p.cpf = '+ editCpf.Text);
  IBQuery1.Open;

  editPassNome.Text       := varToStr(IBQuery1.FieldValues['nome']);
  lblChavePessoa.Caption  := varToStr(IBQuery1.FieldValues['chave_pessoas']);

  if (editCpf.Text = '') then
    begin
      ShowMessage('Preencha o campo CPF antes de prosseguir!');
    end
  else if (lblChavePessoa.Caption <> '') then
    begin

      //lblChavePessoa.Caption  := varToStr(IBQuery1.FieldValues['chave_pessoas']);
      editPassNome.Text := varToStr(IBQuery1.FieldValues['nome']);
      editPassNome.Text       := varToStr(IBQuery1.FieldValues['nome']);
      editDataNascimento.Text := varToStr(IBQuery1.FieldValues['data_nascimento']);

      cbxSexo.ItemIndex       := cbxSexo.Items.IndexOf(varToStr(IBQuery1.FieldValues['sexo']));

      editDocumento.Text      := varToStr(IBQuery1.FieldValues['documento']);
      editOrgEmissor.Text     := varToStr(IBQuery1.FieldValues['orgao_emissor']);
      editNacionalidade.Text  := varToStr(IBQuery1.FieldValues['nacionalidade']);

      cbxEstadoNascido.ItemIndex := cbxEstadoNascido.Items.IndexOf(varToStr(IBQuery1.FieldValues['uf_nascimento']));

      editNaturalidade.Text   := varToStr(IBQuery1.FieldValues['naturalidade']);
      editPai.Text            := varToStr(IBQuery1.FieldValues['nome_pai']);
      editMae.Text            := varToStr(IBQuery1.FieldValues['nome_mae']);
      editEndereco.Text       := varToStr(IBQuery1.FieldValues['endereco']);
      editCep.Text            := varToStr(IBQuery1.FieldValues['cep']);
      editBairro.Text         := varToStr(IBQuery1.FieldValues['bairro']);
      editCidadeEndereco.Text := varToStr(IBQuery1.FieldValues['cidade']);

      cbxEstadoEndereco.ItemIndex := cbxEstadoEndereco.Items.IndexOf(varToStr(IBQuery1.FieldValues['uf']));

      editTelefone.Text       := varToStr(IBQuery1.FieldValues['telefone']);
      editTelefone2.Text      := varToStr(IBQuery1.FieldValues['telefone1']);
      editPaisEndereco.Text   := varToStr(IBQuery1.FieldValues['pais']);
      editEmail.Text          := varToStr(IBQuery1.FieldValues['email']);
      editObs.Text            := varToStr(IBQuery1.FieldValues['observacao']);
      editCpfConjuge.Text     := varToStr(IBQuery1.FieldValues['cpf_conjuge']);
      editNomeConjuge.Text    := varToStr(IBQuery1.FieldValues['nome_conjuge']);

      btnAlterar.Enabled      := true;
      btnExcluir.Enabled      := true;
      btnPessBuscaCpf.Enabled := false;

    end
  else if (lblChavePessoa.Caption = '') then
    begin

      resultadoCadastro :=  MessageDlg('CPF não encontrador, deseja incluir?', mtConfirmation, [mbYes, mbNo], 0);

      if (resultadoCadastro = 6) then
        begin
            editPassNome.ReadOnly           := false;
            editDataNascimento.ReadOnly     := false;
            cbxSexo.enabled                 := true;
            editDocumento.ReadOnly          := false;
            editOrgEmissor.ReadOnly         := false;
            editNacionalidade.ReadOnly      := false;
            cbxEstadoNascido.enabled        := true;
            editNaturalidade.ReadOnly       := false;
            editPai.ReadOnly                := false;
            editMae.ReadOnly                := false;
            editEndereco.ReadOnly           := false;
            editCep.ReadOnly                := false;
            editBairro.ReadOnly             := false;
            editCidadeEndereco.ReadOnly     := false;
            cbxEstadoEndereco.enabled       := true;
            editTelefone.ReadOnly           := false;
            editTelefone2.ReadOnly          := false;
            editPaisEndereco.ReadOnly       := false;
            editEmail.ReadOnly              := false;
            editObs.ReadOnly                := false;

            editPassNome.Color           := clWindow;
            editDataNascimento.Color     := clWindow;
            cbxSexo.Color                := clWindow;
            editDocumento.Color          := clWindow;
            editOrgEmissor.Color         := clWindow;
            editNacionalidade.Color      := clWindow;
            cbxEstadoNascido.Color       := clWindow;
            editNaturalidade.Color       := clWindow;
            editPai.Color                := clWindow;
            editMae.Color                := clWindow;
            editEndereco.Color           := clWindow;
            editCep.Color                := clWindow;
            editBairro.Color             := clWindow;
            editCidadeEndereco.Color     := clWindow;
            cbxEstadoEndereco.Color      := clWindow;
            editTelefone.Color           := clWindow;
            editTelefone2.Color          := clWindow;
            editPaisEndereco.Color       := clWindow;
            editEmail.Color              := clWindow;
            editObs.Color                := clWindow;

            btnGravar.Enabled            := true;
            btnCancelar.Enabled          := true;
            btnPesquisaCep.Enabled       := true;
            btnAlterar.Enabled           := false;
            btnPessBuscaCpf.Enabled      := false;
            btnExcluir.Enabled           := false;
            lblChavePessoa.Caption       := '';

        end
      else
        begin
          
        end;
    end;

end;

procedure TformPessoasF.btnAlterarClick(Sender: TObject);
begin

  editPassNome.ReadOnly           := false;
  editDataNascimento.ReadOnly     := false;
  cbxSexo.enabled                 := true;
  editDocumento.ReadOnly          := false;
  editOrgEmissor.ReadOnly         := false;
  editNacionalidade.ReadOnly      := false;
  cbxEstadoNascido.enabled        := true;
  editNaturalidade.ReadOnly       := false;
  editPai.ReadOnly                := false;
  editMae.ReadOnly                := false;
  editEndereco.ReadOnly           := false;
  editCep.ReadOnly                := false;
  editBairro.ReadOnly             := false;
  editCidadeEndereco.ReadOnly     := false;
  cbxEstadoEndereco.enabled       := true;
  editTelefone.ReadOnly           := false;
  editTelefone2.ReadOnly          := false;
  editPaisEndereco.ReadOnly       := false;
  editEmail.ReadOnly              := false;
  editObs.ReadOnly                := false;

  editPassNome.Color           := clWindow;
  editDataNascimento.Color     := clWindow;
  cbxSexo.Color                := clWindow;
  editDocumento.Color          := clWindow;
  editOrgEmissor.Color         := clWindow;
  editNacionalidade.Color      := clWindow;
  cbxEstadoNascido.Color       := clWindow;
  editNaturalidade.Color       := clWindow;
  editPai.Color                := clWindow;
  editMae.Color                := clWindow;
  editEndereco.Color           := clWindow;
  editCep.Color                := clWindow;
  editBairro.Color             := clWindow;
  editCidadeEndereco.Color     := clWindow;
  cbxEstadoEndereco.Color      := clWindow;
  editTelefone.Color           := clWindow;
  editTelefone2.Color          := clWindow;
  editPaisEndereco.Color       := clWindow;
  editEmail.Color              := clWindow;
  editObs.Color                := clWindow;

  btnGravar.Enabled            := true;
  btnCancelar.Enabled          := true;
  btnPesquisaCep.Enabled       := true;
  btnAlterar.Enabled           := false;
  btnPessBuscaCpf.Enabled      := false;
  btnExcluir.Enabled           := false;



end;

procedure TformPessoasF.btnExcluirClick(Sender: TObject);
var
  resultadoExclusao: integer;
begin
  resultadoExclusao :=  MessageDlg('Deseja realmente excluir esse cadastro ?', mtConfirmation, [mbYes, mbNo], 0);

  if (resultadoExclusao = 6) then
    begin

      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('delete from pessoas where chave_pessoas = '+lblChavePessoa.Caption);

      lblChavePessoa.Caption  := '';
      editCpf.Text            := '';
      editPassNome.Text       := '';
      editDataNascimento.Text := '';
      cbxSexo.Text            := '';
      editDocumento.Text      := '';
      editOrgEmissor.Text     := '';
      editNacionalidade.Text  := '';
      cbxEstadoNascido.Text   := '';
      editNaturalidade.Text   := '';
      editPai.Text            := '';
      editMae.Text            := '';
      editEndereco.Text       := '';
      editCep.Text            := '';
      editBairro.Text         := '';
      editCidadeEndereco.Text := '';
      cbxEstadoEndereco.Text  := '';
      editTelefone.Text       := '';
      editTelefone2.Text      := '';
      editPaisEndereco.Text   := '';
      editEmail.Text          := '';
      editObs.Text            := '';

      IBQuery1.ExecSQL;
      btnExcluir.Enabled := false;
      btnAlterar.Enabled := false;
      ShowMessage('Cadastro Excluso');
    end
  else
    begin
      ShowMessage('Exclusão Cancelada');
    end;
end;

procedure TformPessoasF.btnCancelarClick(Sender: TObject);
begin

  editPassNome.ReadOnly           := true;
  editDataNascimento.ReadOnly     := true;
  cbxSexo.enabled                 := false;
  editDocumento.ReadOnly          := true;
  editOrgEmissor.ReadOnly         := true;
  editNacionalidade.ReadOnly      := true;
  cbxEstadoNascido.enabled        := false;
  editNaturalidade.ReadOnly       := true;
  editPai.ReadOnly                := true;
  editMae.ReadOnly                := true;
  editEndereco.ReadOnly           := true;
  editCep.ReadOnly                := true;
  editBairro.ReadOnly             := true;
  editCidadeEndereco.ReadOnly     := true;
  cbxEstadoEndereco.enabled       := true;
  editTelefone.ReadOnly           := true;
  editTelefone2.ReadOnly          := true;
  editPaisEndereco.ReadOnly       := true;
  editEmail.ReadOnly              := true;
  editObs.ReadOnly                := true;

  editPassNome.Color           := cl3DLight;
  editDataNascimento.Color     := cl3DLight;
  cbxSexo.Color                := cl3DLight;
  editDocumento.Color          := cl3DLight;
  editOrgEmissor.Color         := cl3DLight;
  editNacionalidade.Color      := cl3DLight;
  cbxEstadoNascido.Color       := cl3DLight;
  editNaturalidade.Color       := cl3DLight;
  editPai.Color                := cl3DLight;
  editMae.Color                := cl3DLight;
  editEndereco.Color           := cl3DLight;
  editCep.Color                := cl3DLight;
  editBairro.Color             := cl3DLight;
  editCidadeEndereco.Color     := cl3DLight;
  cbxEstadoEndereco.Color      := cl3DLight;
  editTelefone.Color           := cl3DLight;
  editTelefone2.Color          := cl3DLight;
  editPaisEndereco.Color       := cl3DLight;
  editEmail.Color              := cl3DLight;
  editObs.Color                := cl3DLight;

  btnGravar.Enabled            := false;
  btnCancelar.Enabled          := false;
  btnAlterar.Enabled           := true;
  btnPessBuscaCpf.Enabled      := true;
  btnExcluir.Enabled           := true;

  IBQuery1.Close;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select p.chave_pessoas, p.cpf, p.nome, p.documento, p.endereco, p.bairro, p.cidade, p.uf, p.telefone, p.telefone1, p.data_nascimento,');
  IBQuery1.SQL.Add('p.chave_conjuge, p.sexo, p.cep, p.email, p.NOME_PAI, p.NOME_MAE, p.observacao, p.naturalidade, p.nacionalidade, p.PAIS, p.orgao_emissor, p.uf_nascimento,');
  IBQuery1.SQL.Add('p.CIDADE_NASCIMENTO, p.PAIS_RESIDENCIA, pc.cpf as cpf_conjuge, pc.nome as nome_conjuge');
  IBQuery1.SQL.Add('from pessoas p left join pessoas pc on p.chave_pessoas = pc.chave_conjuge where p.cpf = '+ editCpf.Text);
  IBQuery1.Open;

  editPassNome.Text := varToStr(IBQuery1.FieldValues['nome']);

  lblChavePessoa.Caption  := varToStr(IBQuery1.FieldValues['chave_pessoas']);
  editPassNome.Text       := varToStr(IBQuery1.FieldValues['nome']);
  editDataNascimento.Text := varToStr(IBQuery1.FieldValues['data_nascimento']);
  cbxSexo.Text            := varToStr(IBQuery1.FieldValues['sexo']);
  editDocumento.Text      := varToStr(IBQuery1.FieldValues['documento']);
  editOrgEmissor.Text     := varToStr(IBQuery1.FieldValues['orgao_emissor']);
  editNacionalidade.Text  := varToStr(IBQuery1.FieldValues['nacionalidade']);
  cbxEstadoNascido.Text   := varToStr(IBQuery1.FieldValues['uf_nascimento']);
  editNaturalidade.Text   := varToStr(IBQuery1.FieldValues['naturalidade']);
  editPai.Text            := varToStr(IBQuery1.FieldValues['nome_pai']);
  editMae.Text            := varToStr(IBQuery1.FieldValues['nome_mae']);
  editEndereco.Text       := varToStr(IBQuery1.FieldValues['endereco']);
  editCep.Text            := varToStr(IBQuery1.FieldValues['cep']);
  editBairro.Text         := varToStr(IBQuery1.FieldValues['bairro']);
  editCidadeEndereco.Text := varToStr(IBQuery1.FieldValues['cidade']);
  cbxEstadoEndereco.Text  := varToStr(IBQuery1.FieldValues['uf']);
  editTelefone.Text       := varToStr(IBQuery1.FieldValues['telefone']);
  editTelefone2.Text      := varToStr(IBQuery1.FieldValues['telefone1']);
  editPaisEndereco.Text   := varToStr(IBQuery1.FieldValues['pais']);
  editEmail.Text          := varToStr(IBQuery1.FieldValues['email']);
  editObs.Text            := varToStr(IBQuery1.FieldValues['observacao']);
  editCpfConjuge.Text     := varToStr(IBQuery1.FieldValues['cpf_conjuge']);
  editNomeConjuge.Text    := varToStr(IBQuery1.FieldValues['nome_conjuge']);

end;

procedure TformPessoasF.FormShow(Sender: TObject);
begin
  if (Length(editCpf.Text) >= 11) then
    begin
      btnPessBuscaCpf.Enabled := false;
    end;
end;

procedure TformPessoasF.editCpfCorretoChange(Sender: TObject);
begin
  if (Length(editCpf.Text) >= 11) then
    begin
      btnPessBuscaCpf.Enabled := true;
    end
  else if (Length(editCpf.Text) < 11) then
    begin
      btnPessBuscaCpf.Enabled := false;
    end;
end;

procedure TformPessoasF.btnGravarClick(Sender: TObject);
begin

  if (lblChavePessoa.Caption = '') then
    begin
        IBQuery1.Close;
        IBQuery1.SQL.Clear;

        

        IBQuery1.SQL.Add('insert into pessoas (chave_pessoas, cpf, nome, documento, endereco, bairro, cidade, uf, telefone, telefone1, data_nascimento,');
        IBQuery1.SQL.Add(' sexo, cep, email, NOME_PAI, NOME_MAE, observacao, naturalidade, nacionalidade, PAIS, orgao_emissor, uf_nascimento,');
        IBQuery1.SQL.Add('CIDADE_NASCIMENTO, PAIS_RESIDENCIA)');
        IBQuery1.SQL.Add('values ((SELECT  COALESCE(max(CHAVE_PESSOAS), 0) +1 FROM PESSOAS), :cpf, :nome, :documento, :endereco, :bairro, :cidade, :uf, :telefone, :telefone1, :data_nascimento,');
        IBQuery1.SQL.Add(' :sexo, :cep, :email, :NOME_PAI, :NOME_MAE, :observacao, :naturalidade, :nacionalidade, :PAIS, :orgao_emissor, :uf_nascimento,');
        IBQuery1.SQL.Add(':CIDADE_NASCIMENTO, :PAIS_RESIDENCIA)');
        IBQuery1.ParamByName('cpf').AsString := editCpf.Text;
        IBQuery1.ParamByName('nome').AsString := editPassNome.Text;
        IBQuery1.ParamByName('documento').AsString := editDocumento.Text;
        IBQuery1.ParamByName('endereco').AsString := editEndereco.Text;
        IBQuery1.ParamByName('bairro').AsString := editBairro.Text;
        IBQuery1.ParamByName('cidade').AsString := editCidadeEndereco.Text;
        IBQuery1.ParamByName('uf').AsString := varToStr(cbxEstadoEndereco.Text);
        IBQuery1.ParamByName('telefone').AsString := editTelefone.Text;
        IBQuery1.ParamByName('telefone1').AsString := editTelefone2.Text;
        IBQuery1.ParamByName('data_nascimento').AsDate := StrToDate(editDataNascimento.Text);
        //IBQuery1.ParamByName('chave_conjuge').AsString := editc.Text;
        IBQuery1.ParamByName('sexo').AsString := cbxSexo.Text;
        IBQuery1.ParamByName('cep').AsString := editCep.Text;
        IBQuery1.ParamByName('email').AsString := editEmail.Text;
        IBQuery1.ParamByName('NOME_PAI').AsString := editPai.Text;
        IBQuery1.ParamByName('NOME_MAE').AsString := editMae.Text;
        IBQuery1.ParamByName('observacao').AsString := editObs.Text;
        IBQuery1.ParamByName('naturalidade').AsString := editNaturalidade.Text;
        IBQuery1.ParamByName('nacionalidade').AsString := editNacionalidade.Text;
        IBQuery1.ParamByName('PAIS').AsString := editPaisEndereco.Text;
        IBQuery1.ParamByName('orgao_emissor').AsString := editOrgEmissor.Text;
        IBQuery1.ParamByName('uf_nascimento').AsString := cbxEstadoNascido.Text;
        IBQuery1.ParamByName('CIDADE_NASCIMENTO').AsString := editNaturalidade.Text;
        IBQuery1.ParamByName('PAIS_RESIDENCIA').AsString := editPaisEndereco.Text;

        IBQuery1.ExecSQL;
        DM.IBTransaction.Commit;
        formPessoasF.btnCancelarClick(Sender);
    end
  else if (lblChavePessoa.Caption <> '') then
    begin
        IBQuery1.Close;
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('update pessoas set cpf = :cpf, nome = :nome, documento = :documento, endereco = :endereco, bairro = :bairro, cidade = :cidade, uf = :uf, telefone = :telefone, telefone1 = :telefone1, data_nascimento = :data_nascimento,');
        IBQuery1.SQL.Add(' sexo = :sexo, cep = :cep, email = :email, NOME_PAI = :NOME_PAI, NOME_MAE = :NOME_MAE, observacao = :observacao, naturalidade = :naturalidade, nacionalidade = :nacionalidade, PAIS = :PAIS, orgao_emissor = :orgao_emissor, uf_nascimento = :uf_nascimento,');
        IBQuery1.SQL.Add('CIDADE_NASCIMENTO = :CIDADE_NASCIMENTO, PAIS_RESIDENCIA = :PAIS_RESIDENCIA where chave_pessoas = '+lblChavePessoa.Caption);
        IBQuery1.ParamByName('cpf').AsString := editCpf.Text;
        IBQuery1.ParamByName('nome').AsString := editPassNome.Text;
        IBQuery1.ParamByName('documento').AsString := editDocumento.Text;
        IBQuery1.ParamByName('endereco').AsString := editEndereco.Text;
        IBQuery1.ParamByName('bairro').AsString := editBairro.Text;
        IBQuery1.ParamByName('cidade').AsString := editCidadeEndereco.Text;
        IBQuery1.ParamByName('uf').AsString := varToStr(cbxEstadoEndereco.Text);
        IBQuery1.ParamByName('telefone').AsString := editTelefone.Text;
        IBQuery1.ParamByName('telefone1').AsString := editTelefone2.Text;
        IBQuery1.ParamByName('data_nascimento').AsDate := StrToDate(editDataNascimento.Text);
        //IBQuery1.ParamByName('chave_conjuge').AsString := editc.Text;
        IBQuery1.ParamByName('sexo').AsString := cbxSexo.Text;
        IBQuery1.ParamByName('cep').AsString := editCep.Text;
        IBQuery1.ParamByName('email').AsString := editEmail.Text;
        IBQuery1.ParamByName('NOME_PAI').AsString := editPai.Text;
        IBQuery1.ParamByName('NOME_MAE').AsString := editMae.Text;
        IBQuery1.ParamByName('observacao').AsString := editObs.Text;
        IBQuery1.ParamByName('naturalidade').AsString := editNaturalidade.Text;
        IBQuery1.ParamByName('nacionalidade').AsString := editNacionalidade.Text;
        IBQuery1.ParamByName('PAIS').AsString := editPaisEndereco.Text;
        IBQuery1.ParamByName('orgao_emissor').AsString := editOrgEmissor.Text;
        IBQuery1.ParamByName('uf_nascimento').AsString := cbxEstadoNascido.Text;
        IBQuery1.ParamByName('CIDADE_NASCIMENTO').AsString := editNaturalidade.Text;
        IBQuery1.ParamByName('PAIS_RESIDENCIA').AsString := editPaisEndereco.Text;

        IBQuery1.ExecSQL;
        DM.IBTransaction.Commit;
        formPessoasF.btnCancelarClick(Sender);
    end;


end;

procedure TformPessoasF.btnPesquisaCepClick(Sender: TObject);
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

procedure TformPessoasF.btPesquisaPessoaClick(Sender: TObject);
begin
    formPesquisaPessoa := TformPesquisaPessoa.Create(Application);
    formPesquisaPessoa.Show;
end;

procedure TformPessoasF.btnAlterConjugeClick(Sender: TObject);
begin
  editCpfConjuge.Enabled  := true;
  editCpfConjuge.Color    := clWindow;
  editCpfConjuge.ReadOnly := false;
  btnAlterConjuge.Enabled := false;
  btnIncluiConjuge.Enabled := true;
end;

procedure TformPessoasF.btnIncluiConjugeClick(Sender: TObject);
begin

  IBQuery1.Close;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select chave_pessoas, cpf, nome, chave_conjuge from pessoas where cpf = '+editCpfConjuge.Text);
  IBQuery1.Open;

  if(varToStr(IBQuery1.FieldValues['nome']) = '' ) then
    begin
      ShowMessage('CPF não cadastrado!');

      editCpfConjuge.Text := '';
      btnAlterConjuge.Enabled := true;
      editCpfConjuge.ReadOnly := true;
      editCpfConjuge.Color    := cl3DLight;

    end
  else if(varToStr(IBQuery1.FieldValues['chave_conjuge']) <> '') then
    begin
      ShowMessage('Cadastro vinculado, exclua o vinculo de conjuge para continuar');

      editCpfConjuge.Text := '';
      btnAlterConjuge.Enabled := true;
      editCpfConjuge.ReadOnly := true;
      editCpfConjuge.Color    := cl3DLight;
    end
  else if(varToStr(IBQuery1.FieldValues['nome']) <> '' ) then
    begin

      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('update pessoas set chave_conjuge = (select chave_pessoas from pessoas where cpf = '+ editCpfConjuge.Text +') where chave_pessoas = '+ lblChavePessoa.Caption);
      IBQuery1.Open;
      DM.IBTransaction.Commit;

      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('update pessoas set chave_conjuge = '+ lblChavePessoa.Caption +' where cpf = '+ editCpfConjuge.Text);
      IBQuery1.Open;
      DM.IBTransaction.Commit;

      editCpfConjuge.ReadOnly := true;
      btnAlterConjuge.Enabled := true;
      editCpfConjuge.Color    := cl3DLight;
      formPessoasF.btnCancelarClick(Sender);
      btnIncluiConjuge.Enabled := false;

    end;

end;

procedure TformPessoasF.btnCancelaConjugeClick(Sender: TObject);
var
  resultadoExclusao: integer;
begin

  resultadoExclusao := 1;

  if(editCpfConjuge.ReadOnly = false) then
    begin
        IBQuery1.Close;
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('select cpf from pessoas where chave_pessoas in (select chave_conjuge from pessoas where chave_pessoas = '+ lblChavePessoa.Caption+')');
        IBQuery1.Open;

        editCpfConjuge.Text     := varToStr(IBQuery1.FieldValues['cpf']);
        editCpfConjuge.ReadOnly := true;
        editCpfConjuge.Color    := cl3DLight;
        btnAlterConjuge.Enabled := true;
        resultadoExclusao       := 2;
    end;
  if (editCpfConjuge.ReadOnly = true) and (resultadoExclusao = 1) and (editCpfConjuge.Text <> '') then
    begin

      if (MessageDlg('Deseja realmente excluir esse conjuge ?', mtConfirmation, [mbYes, mbNo], 0) = 6) then
        begin
          IBQuery1.Close;
          IBQuery1.SQL.Clear;
          IBQuery1.SQL.Add('update pessoas set chave_conjuge = null where chave_pessoas = '+lblChavePessoa.Caption);
          IBQuery1.Open;
          DM.IBTransaction.Commit;

          IBQuery1.Close;
          IBQuery1.SQL.Clear;
          IBQuery1.SQL.Add('update pessoas set chave_conjuge = null where cpf = '+ editCpfConjuge.Text);
          IBQuery1.Open;
          DM.IBTransaction.Commit;

          editCpfConjuge.ReadOnly := true;
          btnAlterConjuge.Enabled := true;
          editCpfConjuge.Color    := cl3DLight;
          formPessoasF.btnCancelarClick(Sender);
        end;

  btnAlterConjuge.Enabled := true;

    end;

end;

procedure TformPessoasF.editCpfCorretoExit(Sender: TObject);
begin
  editCpf.Text := formacpf(editCpf.Text);
end;

function CalcAnos(const Data1, Data2: TDateTime): integer;
var
  D1, M1, A1,
  D2, M2, A2: Word;
begin
  DecodeDate(Data1, A1, M1, D1);
  DecodeDate(Data2, A2, M2, D2);

  Result := A2 - A1;

  if (M1 > M2) or ((M1 = M2) and (D1 > D2)) then
    Dec(Result);
end;

function ValidarData(const S: string): Boolean;
begin
  try
    StrToDate(S);
    Result := true;
  except
    Result := false;
  end;
end;


procedure TformPessoasF.editDataNascimentoExit(Sender: TObject);
var
  dataNascimento: TDateTime;
begin
  if(editDataNascimento.Text <> '') then
    begin

      if(Length(editDataNascimento.Text) > 9) then
        begin
          try
            if(ValidarData(editDataNascimento.Text))then
              begin
                dataNascimento := StrToDate(editDataNascimento.Text);
                editIdade.Text := IntToStr(CalcAnos(dataNascimento, Date)) + ' anos';
              end;
          except
          end;
        end;

    end;
end;

procedure TformPessoasF.editDataNascimentoChange(Sender: TObject);
var
  dataNascimento: TDateTime;
begin
  if(editDataNascimento.Text <> '') then
    begin

      if(Length(editDataNascimento.Text) > 9) then
        begin
          try
            if(ValidarData(editDataNascimento.Text))then
              begin
                dataNascimento := StrToDate(editDataNascimento.Text);
                editIdade.Text := IntToStr(CalcAnos(dataNascimento, Date)) + ' anos';
              end;
          except
          end;
        end;

    end;

end;

end.

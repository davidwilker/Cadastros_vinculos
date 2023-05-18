unit uPesquisaPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery;

type
  TformPesquisaPessoa = class(TForm)
    IBQuery: TIBQuery;
    dsPesquisaPessoa: TDataSource;
    DBGrid1: TDBGrid;
    editPesquisa: TEdit;
    Label1: TLabel;
    rdbNome: TRadioButton;
    rdbCpf: TRadioButton;
    procedure editPesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPesquisaPessoa: TformPesquisaPessoa;

implementation

uses
  uPessoasF;

{$R *.dfm}

procedure TformPesquisaPessoa.editPesquisaChange(Sender: TObject);
begin

  if(rdbCpf.Checked = true) then
    begin
        IBQuery.Close;
        IBQuery.SQL.Clear;
        IBQuery.SQL.Add('select chave_pessoas, cpf, nome ');
        IBQuery.SQL.Add('from pessoas where cpf like ''%'+editPesquisa.Text+'%'' order by nome');
        IBQuery.Open;
    end
  else
    begin
        IBQuery.Close;
        IBQuery.SQL.Clear;
        IBQuery.SQL.Add('select chave_pessoas, cpf, nome ');
        IBQuery.SQL.Add('from pessoas where nome like '''+editPesquisa.Text+'%'' order by nome');
        IBQuery.Open;
    end

end;

procedure TformPesquisaPessoa.DBGrid1DblClick(Sender: TObject);
var
  cpf_result: String;
begin

  cpf_result := dsPesquisaPessoa.DataSet.FieldValues['cpf'];

  IBQuery.Close;
  IBQuery.SQL.Clear;
  IBQuery.SQL.Add('select p.chave_pessoas, p.cpf, p.nome, p.documento, p.endereco, p.bairro, p.cidade, p.uf, p.telefone, p.telefone1, p.data_nascimento,');
  IBQuery.SQL.Add('p.chave_conjuge, p.sexo, p.cep, p.email, p.NOME_PAI, p.NOME_MAE, p.observacao, p.naturalidade, p.nacionalidade, p.PAIS, p.orgao_emissor, p.uf_nascimento,');
  IBQuery.SQL.Add('p.CIDADE_NASCIMENTO, p.PAIS_RESIDENCIA, pc.cpf as cpf_conjuge, pc.nome as nome_conjuge');
  IBQuery.SQL.Add('from pessoas p left join pessoas pc on p.chave_pessoas = pc.chave_conjuge where p.cpf = :cpf_result');
  IBQuery.Params.ParamByName('cpf_result').Value := cpf_result;
  IBQuery.Open;

  formPessoasF.editPassNome.Text := varToStr(IBQuery.FieldValues['nome']);
  formPessoasF.editCpf.Text := varToStr(IBQuery.FieldValues['cpf']);

  formPessoasF.lblChavePessoa.Caption  := varToStr(IBQuery.FieldValues['chave_pessoas']);
  formPessoasF.editPassNome.Text       := varToStr(IBQuery.FieldValues['nome']);
  formPessoasF.editDataNascimento.Text := varToStr(IBQuery.FieldValues['data_nascimento']);
  formPessoasF.cbxSexo.ItemIndex                    := formPessoasF.cbxSexo.Items.IndexOf(varToStr(IBQuery.FieldValues['sexo']));
  formPessoasF.editDocumento.Text      := varToStr(IBQuery.FieldValues['documento']);
  formPessoasF.editOrgEmissor.Text     := varToStr(IBQuery.FieldValues['orgao_emissor']);
  formPessoasF.editNacionalidade.Text  := varToStr(IBQuery.FieldValues['nacionalidade']);
  formPessoasF.cbxEstadoNascido.ItemIndex           := formPessoasF.cbxEstadoNascido.Items.IndexOf(varToStr(IBQuery.FieldValues['uf_nascimento']));
  formPessoasF.editNaturalidade.Text   := varToStr(IBQuery.FieldValues['naturalidade']);
  formPessoasF.editPai.Text            := varToStr(IBQuery.FieldValues['nome_pai']);
  formPessoasF.editMae.Text            := varToStr(IBQuery.FieldValues['nome_mae']);
  formPessoasF.editEndereco.Text       := varToStr(IBQuery.FieldValues['endereco']);
  formPessoasF.editCep.Text            := varToStr(IBQuery.FieldValues['cep']);
  formPessoasF.editBairro.Text         := varToStr(IBQuery.FieldValues['bairro']);
  formPessoasF.editCidadeEndereco.Text := varToStr(IBQuery.FieldValues['cidade']);
  formPessoasF.cbxEstadoEndereco.ItemIndex          := formPessoasF.cbxEstadoEndereco.Items.IndexOf(varToStr(IBQuery.FieldValues['uf']));
  formPessoasF.editTelefone.Text       := varToStr(IBQuery.FieldValues['telefone']);
  formPessoasF.editTelefone2.Text      := varToStr(IBQuery.FieldValues['telefone1']);
  formPessoasF.editPaisEndereco.Text   := varToStr(IBQuery.FieldValues['pais']);
  formPessoasF.editEmail.Text          := varToStr(IBQuery.FieldValues['email']);
  formPessoasF.editObs.Text            := varToStr(IBQuery.FieldValues['observacao']);
  formPessoasF.editCpfConjuge.Text     := varToStr(IBQuery.FieldValues['cpf_conjuge']);
  formPessoasF.editNomeConjuge.Text    := varToStr(IBQuery.FieldValues['nome_conjuge']);

  formPessoasF.btnAlterar.Enabled      := true;
  formPessoasF.btnExcluir.Enabled      := true;

  formPesquisaPessoa.Close;

  formPessoasF.imgFotoCadastroF.Enabled := true;

  if  FileExists(ExtractFilePath(Application.ExeName)+'\GED\PESSOASF\'+formPessoasF.lblChavePessoa.Caption+ 'F.bmp') then
    begin
      formPessoasF.imgFotoCadastroF.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GED\PESSOASF\'+formPessoasF.lblChavePessoa.Caption+ 'F.bmp')
    end
  else
    begin
      formPessoasF.imgFotoCadastroF.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\embranco.bmp');
    end;
end;

procedure TformPesquisaPessoa.FormCreate(Sender: TObject);
begin
  IBQuery.Active := true;
end;

end.

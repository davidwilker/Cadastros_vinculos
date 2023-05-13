unit uPesquisaCnpj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Grids, DBGrids, uDM;

type
  TformPesquisaCNPJ = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    editPesquisaCnpj: TEdit;
    IBQuery: TIBQuery;
    dsPesquisaCNPJ: TDataSource;
    procedure editPesquisaCnpjChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPesquisaCNPJ: TformPesquisaCNPJ;

implementation

uses
  uPJ, uPessoasF;

{$R *.dfm}

procedure TformPesquisaCNPJ.editPesquisaCnpjChange(Sender: TObject);
begin
  IBQuery.Close;
  IBQuery.SQL.Clear;
  IBQuery.SQL.Add('select chave_pessoas_juridicas, CNPJ, razao_social ');
  IBQuery.SQL.Add('from pessoas_juridicas where razao_social like '''+editPesquisaCnpj.Text+'%'' order by razao_social');
  IBQuery.Open;
end;

procedure TformPesquisaCNPJ.FormCreate(Sender: TObject);
begin
  IBQuery.Active := true;
end;

procedure TformPesquisaCNPJ.DBGrid1DblClick(Sender: TObject);
var
  cnpj_result: String;
begin

  cnpj_result := dsPesquisaCNPJ.DataSet.FieldValues['CNPJ'];

  IBQuery.Close;
  IBQuery.SQL.Clear;
  IBQuery.SQL.Add('select chave_pessoas_juridicas, CNPJ, razao_social, data_abertura, situacao, nome_fantasia, ');
  IBQuery.SQL.Add('natureza_juridica, CNAE, endereco, bairro, cidade, UF, cep, email, telefone, telefone1, observacao, numero_alter_contrato from pessoas_juridicas where CNPJ = :cnpj_result');
  IBQuery.Params.ParamByName('cnpj_result').Value := cnpj_result;
  IBQuery.Open;

  formPessoaJuridica.lblChavePessoaJuridica.Caption := VarToStr(IBQuery.FieldValues['chave_pessoas_juridicas']);
  formPessoaJuridica.editRazaoSocial.Text           := varToStr(IBQuery.FieldValues['razao_social']);
  formPessoaJuridica.editCnpj.Text                  := varToStr(IBQuery.FieldValues['cnpj']);

  formPessoaJuridica.editNomeFantasia.Text       := varToStr(IBQuery.FieldValues['nome_fantasia']);
  formPessoaJuridica.editDataAbertura.Text       := varToStr(IBQuery.FieldValues['data_abertura']);
  formPessoaJuridica.editStatusCnpjs.Text        := VarToStr(IBQuery.FieldValues['situacao']);
  formPessoaJuridica.editNatJuridica.Text        := VarToStr(IBQuery.FieldValues['natureza_juridica']);
  formPessoaJuridica.editCnae.Text               := VarToStr(IBQuery.FieldValues['CNAE']);
  formPessoaJuridica.editEndereco.Text           := VarToStr(IBQuery.FieldValues['endereco']);
  formPessoaJuridica.editBairro.Text             := VarToStr(IBQuery.FieldValues['bairro']);
  formPessoaJuridica.editCidadeEndereco.Text     := VarToStr(IBQuery.FieldValues['cidade']);
  formPessoaJuridica.cbxEstadoEndereco.ItemIndex := formPessoaJuridica.cbxEstadoEndereco.Items.IndexOf(varToStr(IBQuery.FieldValues['UF']));
  formPessoaJuridica.editCep.Text                := VarToStr(IBQuery.FieldValues['cep']);
  formPessoaJuridica.editEmail.Text              := VarToStr(IBQuery.FieldValues['email']);
  formPessoaJuridica.editTelefone.Text           := VarToStr(IBQuery.FieldValues['telefone']);
  formPessoaJuridica.editTelefone2.Text          := VarToStr(IBQuery.FieldValues['telefone1']);
  formPessoaJuridica.editObs.Text                := VarToStr(IBQuery.FieldValues['observacao']);
  formPessoaJuridica.editNumContrato.Text        := VarToStr(IBQuery.FieldValues['numero_alter_contrato']);

  formPessoaJuridica.IBPessoasVinculadas.Close;
  formPessoaJuridica.IBPessoasVinculadas.SQL.Clear;
  formPessoaJuridica.IBPessoasVinculadas.SQL.Add('select p.nome, p.cpf, pj.RAZAo_SOCIAL, pj.CNPJ, pv.funcao, pv.CHAVE_PESSOAS_VINCULOS from pessoas_vinculos pv inner join pessoas p ');
  formPessoaJuridica.IBPessoasVinculadas.SQL.Add('on p.chave_pessoas = pv.chave_pessoas inner join pessoas_juridicas pj ');
  formPessoaJuridica.IBPessoasVinculadas.SQL.Add('on pv.chave_pessoas_juridicas = pj.chave_pessoas_juridicas ');
  formPessoaJuridica.IBPessoasVinculadas.SQL.Add('where pv.chave_pessoas_juridicas = '+QuotedStr(VarToStr(IBQuery.FieldValues['chave_pessoas_juridicas'])));
  formPessoaJuridica.IBPessoasVinculadas.Open;

  formPessoaJuridica.lblchavePessoasVinculos.Caption := VarToStr(formPessoaJuridica.IBPessoasVinculadas.FieldValues['CHAVE_PESSOAS_VINCULOS']);

  formPessoaJuridica.btnAlterar.Enabled      := true;
  formPessoaJuridica.btnExcluir.Enabled      := true;

  formPesquisaCNPJ.Close;

//  formPessoasF.btnAlterar.Enabled      := true;
//  formPessoasF.btnExcluir.Enabled      := true;

//  formPesquisaPessoa.Close;
end;

end.

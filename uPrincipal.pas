unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uPessoasF, uPJ, uConfigBanco, uDM, IniFiles, DB,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, uSobre, VFrames;

type
  TformMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    PessoaFsica1: TMenuItem;
    PessoaJuridica1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Sistemas1: TMenuItem;
    ConfigBancoDeDados: TMenuItem;

    Conjuges1: TMenuItem;
    PessoasVinculadas1: TMenuItem;
    Relatorio: TfrxReport;
    frxCadastro: TfrxDBDataset;
    IBQueryRelatorios: TIBQuery;
    Pessoas1: TMenuItem;
    PessoaseConjuges1: TMenuItem;
    PessoasJuridicas1: TMenuItem;
    FuncionriosVinculados1: TMenuItem;
    frxPessoasJuridicas: TfrxDBDataset;
    procedure PessoaFsica1Click(Sender: TObject);
    procedure PessoaJuridica1Click(Sender: TObject);
    procedure ConfigBancoDeDadosClick(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure PessoaseConjuges1Click(Sender: TObject);
    procedure PessoasJuridicas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMenuPrincipal: TformMenuPrincipal;

implementation


{$R *.dfm}

procedure TformMenuPrincipal.PessoaFsica1Click(Sender: TObject);
begin
    formPessoasF := TformPessoasF.Create(Application);
    formPessoasF.Show;
end;

procedure TformMenuPrincipal.PessoaJuridica1Click(Sender: TObject);
begin
    formPessoaJuridica := TformPessoaJuridica.Create(Application);
    formPessoaJuridica.Show;
end;

procedure TformMenuPrincipal.ConfigBancoDeDadosClick(Sender: TObject);
begin
    formConfigBanco := TformConfigBanco.Create(Application);
    formConfigBanco.Show;
end;

procedure TformMenuPrincipal.Pessoas1Click(Sender: TObject);
begin
  IBQueryRelatorios.Close;
  IBQueryRelatorios.SQL.Clear;
  IBQueryRelatorios.SQL.Add('select p.chave_pessoas, p.cpf, p.nome, p.documento, p.endereco, p.bairro, p.cidade, p.uf, p.telefone, p.telefone1, p.data_nascimento,');
  IBQueryRelatorios.SQL.Add('p.chave_conjuge, p.sexo, p.cep, p.email, p.NOME_PAI, p.NOME_MAE, p.observacao, p.naturalidade, p.nacionalidade, p.PAIS, p.orgao_emissor, p.uf_nascimento,');
  IBQueryRelatorios.SQL.Add('p.CIDADE_NASCIMENTO, p.PAIS_RESIDENCIA, pc.cpf as cpf_conjuge, pc.nome as nome_conjuge');
  IBQueryRelatorios.SQL.Add('from pessoas p left join pessoas pc on p.chave_pessoas = pc.chave_conjuge order by p.nome');
  IBQueryRelatorios.Open;

  Relatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Templates\PESSOAS.fr3');
  Relatorio.ShowReport();
end;

procedure TformMenuPrincipal.Sobre1Click(Sender: TObject);
begin
  formSobre := TformSobre.Create(Application);
  formSobre.Show;
end;

procedure TformMenuPrincipal.PessoaseConjuges1Click(Sender: TObject);
begin
  IBQueryRelatorios.Close;
  IBQueryRelatorios.SQL.Clear;
  IBQueryRelatorios.SQL.Add('select p.chave_pessoas, p.cpf, p.nome, p.documento, p.endereco, p.bairro, p.cidade, p.uf, p.telefone, p.telefone1, p.data_nascimento,');
  IBQueryRelatorios.SQL.Add('p.chave_conjuge, p.sexo, p.cep, p.email, p.NOME_PAI, p.NOME_MAE, p.observacao, p.naturalidade, p.nacionalidade, p.PAIS, p.orgao_emissor, p.uf_nascimento,');
  IBQueryRelatorios.SQL.Add('p.CIDADE_NASCIMENTO, p.PAIS_RESIDENCIA, pc.cpf as cpf_conjuge, pc.nome as nome_conjuge');
  IBQueryRelatorios.SQL.Add('from pessoas p left join pessoas pc on p.chave_pessoas = pc.chave_conjuge where p.chave_conjuge is not null order by p.nome');
  IBQueryRelatorios.Open;

  Relatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Templates\PESSOAS_CONJUGES.fr3');
  Relatorio.ShowReport();
end;

procedure TformMenuPrincipal.PessoasJuridicas1Click(Sender: TObject);
begin
  IBQueryRelatorios.Close;
  IBQueryRelatorios.SQL.Clear;
  IBQueryRelatorios.SQL.Add('select chave_pessoas_juridicas, CNPJ, razao_social, data_abertura, situacao, nome_fantasia, natureza_juridica, CNAE, endereco, bairro, cidade, UF, cep, email, telefone, telefone1, observacao, numero_alter_contrato from pessoas_juridicas');
  IBQueryRelatorios.Open;

  Relatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Templates\PESSOAS_JURIDICAS.fr3');
  Relatorio.ShowReport();
end;

end.

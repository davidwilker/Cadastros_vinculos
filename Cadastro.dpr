program Cadastro;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {formMenuPrincipal},
  uPessoasF in 'uPessoasF.pas' {formPessoasF},
  uDM in 'uDM.pas' {DM: TDataModule},
  uPesquisaPessoa in 'uPesquisaPessoa.pas' {formPesquisaPessoa},
  uPJ in 'uPJ.pas' {formPessoaJuridica},
  uPesquisaReceitaCnpj in 'uPesquisaReceitaCnpj.pas' {formPesquisaReceitaCnpj},
  uConfigBanco in 'uConfigBanco.pas' {formConfigBanco},
  uFormatacao in 'uFormatacao.pas',
  uPesquisaCnpj in 'uPesquisaCnpj.pas' {formPesquisaCNPJ},
  uSobre in 'uSobre.pas' {formSobre},
  uTiraFoto in 'uTiraFoto.pas' {formTirarFoto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMenuPrincipal, formMenuPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

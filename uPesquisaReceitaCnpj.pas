unit uPesquisaReceitaCnpj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons, ACBrBase, ACBrSocket,
  ACBrConsultaCNPJ;

{$IFDEF CONDITIONALEXPRESSIONS}
   {$IF CompilerVersion >= 20.0}
     {$DEFINE DELPHI2009_UP}
   {$IFEND}
{$ENDIF}

// Remova o Ponto do DEFINE abaixo, se seu Delphi suporta PNG. 
//    - Se n�o suportar (D7), 
//  	- Acesse: https://sourceforge.net/projects/pngdelphi/
//      - Instale o projeto e depois remova o Ponto da Linha abaixo

{$DEFINE SUPPORT_PNG}  

{$IFDEF DELPHI2009_UP}
  {$DEFINE SUPPORT_PNG}
{$ENDIF}

type
  TformPesquisaReceitaCnpj = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label14: TLabel;
    ButBuscar: TBitBtn;
    EditCaptcha: TEdit;
    EditCNPJ: TMaskEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPesquisaReceitaCnpj: TformPesquisaReceitaCnpj;
  //troquei a mascara para n�o salvar os caracteres de mascara do CNPJ na tela formPesquisaReceitaCnpj

implementation

uses
  uPJ ,
  JPEG
{$IFDEF SUPPORT_PNG}
  , pngimage
{$ENDIF}
  ;

{$R *.dfm}

procedure TformPesquisaReceitaCnpj.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
//  Jpg: TJPEGImage;
{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ELSE}
  ImgArq: String;
{$ENDIF}
begin
  {$IFNDEF SUPPORT_PNG}
    ShowMessage('Aten��o: Seu Delphi n�o d� suporte nativo a imagens PNG. Queira verificar o c�digo fonte deste exemplo para saber como proceder.');
    Exit;
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, voc� pode utilizar o c�digo comentado abaixo.
    //    * Comente ou apague o c�digo que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declara��o da vari�vel jpg
    //    * descomente o c�digo abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, voc� ter� que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementa��o. Algumas sugest�es:
    //    * Procure no F�rum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples est� no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - V�rias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

  Stream:= TMemoryStream.Create;
  try
    formPesquisaReceitaCnpj.ACBrConsultaCNPJ1.Captcha(Stream);

   {$IFDEF DELPHI2009_UP}
    //Use esse c�digo quando a imagem do site for do tipo PNG
    png:= TPngImage.Create;
    try
      png.LoadFromStream(Stream);
      Image1.Picture.Assign(png);
    finally
      png.Free;
    end;
    { //Use esse c�digo quando a imagem do site for do tipo JPG
      Jpg:= TJPEGImage.Create;
      try
        Jpg.LoadFromStream(Stream);
        Image1.Picture.Assign(Jpg);
      finally
        Jpg.Free;
      end;
    }
   {$ELSE}
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    formPesquisaReceitaCnpj.Image1.Picture.LoadFromFile( ImgArq );
   {$ENDIF}

    formPesquisaReceitaCnpj.EditCaptcha.Clear;
    formPesquisaReceitaCnpj.EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TformPesquisaReceitaCnpj.FormShow(Sender: TObject);
begin
  formPesquisaReceitaCnpj.LabAtualizarCaptchaClick(Sender);
end;



procedure TformPesquisaReceitaCnpj.ButBuscarClick(Sender: TObject);
var
  I: Integer;
begin
  if EditCaptcha.Text <> '' then
  begin
    if ACBrConsultaCNPJ1.Consulta(
      EditCNPJ.Text,
      EditCaptcha.Text,
      false
    ) then
    begin
      formPessoaJuridica.editRazaoSocial.Text     := ACBrConsultaCNPJ1.RazaoSocial;
      formPessoaJuridica.editDataAbertura.Text    := DateToStr( ACBrConsultaCNPJ1.Abertura );
      formPessoaJuridica.editNomeFantasia.Text    := ACBrConsultaCNPJ1.Fantasia;
      formPessoaJuridica.editEndereco.Text        := ACBrConsultaCNPJ1.Endereco +' '+ACBrConsultaCNPJ1.Complemento;
      formPessoaJuridica.EditBairro.Text          := ACBrConsultaCNPJ1.Bairro;
      formPessoaJuridica.editCidadeEndereco.Text  := ACBrConsultaCNPJ1.Cidade;

      formPessoaJuridica.cbxEstadoEndereco.ItemIndex := formPessoaJuridica.cbxEstadoEndereco.Items.IndexOf(varToStr(ACBrConsultaCNPJ1.UF));

      formPessoaJuridica.EditCEP.Text             := ACBrConsultaCNPJ1.CEP;
      formPessoaJuridica.editStatusCnpjs.Text     := ACBrConsultaCNPJ1.Situacao;
      formPessoaJuridica.editCnae.Text            := ACBrConsultaCNPJ1.CNAE1;
      formPessoaJuridica.EditEmail.Text           := ACBrConsultaCNPJ1.EndEletronico;
      formPessoaJuridica.editTelefone.Text        := ACBrConsultaCNPJ1.Telefone;
      formPessoaJuridica.editNatJuridica.Text     := ACBrConsultaCNPJ1.NaturezaJuridica;

      formPessoaJuridica.btnGravar.Enabled  := true;
      formPessoaJuridica.btnAlterar.Enabled := true;

     // ListCNAE2.Clear;
      //for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
       // ListCNAE2.Items.Add(ACBrConsultaCNPJ1.CNAE2[I]);

       if (formPessoaJuridica.editRazaoSocial.Text <> '') then
        begin
           //ShowMessage('CNPJ Encontrado!);
          formPesquisaReceitaCnpj.Close;
        end;

    end;
  end
  else
  begin
    ShowMessage('� necess�rio digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

end.

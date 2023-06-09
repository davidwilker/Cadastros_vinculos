unit uTiraFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  VFrames, ExtCtrls, Buttons, ExtDlgs;

type
  TformTirarFoto = class(TForm)
    pbxImage: TPaintBox;
    Panel1: TPanel;
    Label1: TLabel;
    cbxCameras: TComboBox;
    btnInicia: TBitBtn;
    btnParar: TBitBtn;
    btnConfig: TButton;
    btnSalvar: TBitBtn;
    cbxResolucao: TComboBox;
    SavePictureDialog1: TSavePictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnIniciaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    fActivated  : boolean;
    fVideoImage : TVideoImage;
    fVideoBitmap: TBitmap;
  public
    { Public declarations }
  end;

var
  formTirarFoto: TformTirarFoto;

implementation

uses
  uPessoasF;

{$R *.dfm}

procedure TformTirarFoto.FormCreate(Sender: TObject);
begin
  pbxImage.Align := alClient;
  fActivated      := false;
  fVideoBitmap    := TBitmap.create;

  // Cria inst�ncia de nossa classe de imagem de v�deo.
  fVideoImage     := TVideoImage.Create;
  // Diz ao fVideoImage onde pintar as imagens que recebe da c�mera
  // (Apenas no caso de n�o querermos modificar as imagens por n�s mesmos)
  fVideoImage.SetDisplayCanvas(pbxImage.Canvas);

  Caption := 'Camera';
end;

procedure TformTirarFoto.FormActivate(Sender: TObject);
var
  DeviceList : TStringList;
begin
  IF fActivated then
    exit;
  fActivated := true;


  // pega lista de cameras disponiveis
  DeviceList := TStringList.Create;
  fVideoImage.GetListOfDevices(DeviceList);

  IF DeviceList.Count < 1 then
    begin
      // caso n�o tenha nenhumna camera disponivel
      Caption := '[Camera n�o encontrada]';
      MessageDlg('Camera n�o conectada.'#10'', mtError, [mbOK], 0);
      Application.Terminate;
      exit;
    end
    else begin
      // se ao menos uma camera for encontrada
      cbxCameras.items.Assign(DeviceList);
      cbxCameras.ItemIndex := 0;
      btnInicia.Enabled := true;
    end;
end;

procedure TformTirarFoto.btnIniciaClick(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  btnInicia.Enabled := false;
  Application.ProcessMessages;

  fVideoImage.VideoStart(cbxCameras.Items[cbxCameras.itemindex]);

  //controla a resolu��o de partida
  fVideoImage.SetResolutionByIndex(4);

  btnParar.Enabled  := true;
  btnConfig.Enabled := true;
  Screen.Cursor := crDefault;

end;

procedure TformTirarFoto.btnConfigClick(Sender: TObject);
begin
  FVideoImage.ShowProperty_Stream;
end;

procedure TformTirarFoto.btnPararClick(Sender: TObject);
begin
  FVideoImage.VideoStop;
  btnInicia.Enabled := true;
  btnConfig.Enabled := false;
  btnParar.Enabled  := false;
  btnSalvar.Enabled := true;
  fVideoImage.GetBitmap(fVideoBitmap);
end;

procedure TformTirarFoto.btnSalvarClick(Sender: TObject);
VAR
  BMP : TBitmap;
begin
  BMP := TBitmap.Create;
  BMP.Assign(fVideoBitmap);

  try

    if not DirectoryExists(ExtractFilePath(Application.ExeName) +'\GED\PESSOASF') then
    begin
      ForceDirectories(ExtractFilePath(Application.ExeName) +'\GED\PESSOASF');
    end;

    BMP.SaveToFile(ExtractFilePath(Application.ExeName)+'\GED\PESSOASF\'+formPessoasF.lblChavePessoa.Caption+ 'F.bmp');
    if  FileExists(ExtractFilePath(Application.ExeName)+'\GED\PESSOASF\'+formPessoasF.lblChavePessoa.Caption+ 'F.bmp') then
      begin
        formPessoasF.imgFotoCadastroF.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GED\PESSOASF\'+formPessoasF.lblChavePessoa.Caption+ 'F.bmp');
      end
    else
      begin
        formPessoasF.imgFotoCadastroF.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\embranco.bmp');
      end;

    formTirarFoto.Close;

  except
    MessageDlg('N�o foi poss�vel salvar a imagem ' + ExtractFilePath(Application.ExeName)+'GED\PESSOASF\', mterror, [mbOK], 0);
  end;
  
  BMP.Free;

end;

end.

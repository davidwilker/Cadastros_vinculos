object formTirarFoto: TformTirarFoto
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tirar Foto'
  ClientHeight = 311
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pbxImage: TPaintBox
    Left = 0
    Top = 72
    Width = 681
    Height = 385
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 43
      Width = 41
      Height = 13
      Caption = 'Cameras'
    end
    object cbxCameras: TComboBox
      Left = 56
      Top = 40
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object btnInicia: TBitBtn
      Left = 9
      Top = 6
      Width = 60
      Height = 30
      Caption = 'INICIAR'
      Enabled = False
      TabOrder = 1
      OnClick = btnIniciaClick
      NumGlyphs = 3
    end
    object btnParar: TBitBtn
      Left = 86
      Top = 6
      Width = 60
      Height = 30
      Caption = 'PARAR'
      Enabled = False
      TabOrder = 2
      OnClick = btnPararClick
      NumGlyphs = 3
    end
    object btnConfig: TButton
      Left = 229
      Top = 6
      Width = 83
      Height = 54
      Caption = 'Config'
      Enabled = False
      TabOrder = 3
      OnClick = btnConfigClick
    end
    object btnSalvar: TBitBtn
      Left = 162
      Top = 6
      Width = 60
      Height = 30
      Caption = 'SALVAR'
      Enabled = False
      TabOrder = 4
      OnClick = btnSalvarClick
      NumGlyphs = 3
    end
    object cbxResolucao: TComboBox
      Left = 392
      Top = 40
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 176
    Top = 104
  end
end

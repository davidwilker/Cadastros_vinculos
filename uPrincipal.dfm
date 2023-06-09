object formMenuPrincipal: TformMenuPrincipal
  Left = 280
  Top = 174
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Engegraph'
  ClientHeight = 246
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 200
    Top = 136
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object PessoaFsica1: TMenuItem
        Caption = 'Pessoa F'#237'sica'
        OnClick = PessoaFsica1Click
      end
      object PessoaJuridica1: TMenuItem
        Caption = 'Pessoa Juridica'
        OnClick = PessoaJuridica1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Conjuges1: TMenuItem
        Caption = 'Pessoas F'#237'sicas'
        object Pessoas1: TMenuItem
          Caption = 'Pessoas'
          OnClick = Pessoas1Click
        end
        object PessoaseConjuges1: TMenuItem
          Caption = 'Pessoas e Conjuges'
          OnClick = PessoaseConjuges1Click
        end
      end
      object PessoasVinculadas1: TMenuItem
        Caption = 'Pessoas Jur'#237'dicas'
        object PessoasJuridicas1: TMenuItem
          Caption = 'Pessoas Juridicas'
          OnClick = PessoasJuridicas1Click
        end
        object FuncionriosVinculados1: TMenuItem
          Caption = 'Funcion'#225'rios Vinculados'
          OnClick = FuncionriosVinculados1Click
        end
      end
    end
    object Sistemas1: TMenuItem
      Caption = 'Sistemas'
      object ConfigBancoDeDados: TMenuItem
        Caption = 'Config. Banco de dados'
        OnClick = ConfigBancoDeDadosClick
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
        OnClick = Sobre1Click
      end
    end
  end
  object Relatorio: TfrxReport
    Version = '6.8.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45060.997142534700000000
    ReportOptions.LastChange = 45063.956396793980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 48
    Top = 40
    Datasets = <
      item
        DataSet = frxPessoasVinculos
        DataSetName = 'frxPessoasVinculos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 34.015770000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8 = (
            'FUNCIONARIOS VINCULADOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 79.370130000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'RAZAO SOCIAL')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 246.488250000000000000
          Top = 79.370130000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            'NOME FUNCIONARIO')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 492.937230000000000000
          Top = 79.370130000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            'CARGO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 578.086890000000000000
          Top = 79.370130000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'CPF')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        DataSet = frxPessoasJuridicas
        DataSetName = 'frxPessoasJuridicas'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxPessoasVinculos."RAZAO_SOCIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 245.488250000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxPessoasVinculos."NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 492.937230000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxPessoasVinculos."FUNCAO"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 578.086890000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxPessoasVinculos."CPF"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
  object frxCadastro: TfrxDBDataset
    UserName = 'frxCadastro'
    CloseDataSource = False
    DataSet = IBQueryRelatorios
    BCDToCurrency = False
    Left = 112
    Top = 40
  end
  object IBQueryRelatorios: TIBQuery
    Database = DM.Conexao
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 40
  end
  object frxPessoasJuridicas: TfrxDBDataset
    UserName = 'frxPessoasJuridicas'
    CloseDataSource = False
    DataSet = IBQueryRelatorios
    BCDToCurrency = False
    Left = 112
    Top = 88
  end
  object frxPessoasVinculos: TfrxDBDataset
    UserName = 'frxPessoasVinculos'
    CloseDataSource = False
    DataSet = IBQueryRelatorios
    BCDToCurrency = False
    Left = 112
    Top = 136
  end
end

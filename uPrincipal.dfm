object formMenuPrincipal: TformMenuPrincipal
  Left = 278
  Top = 173
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
    ReportOptions.LastChange = 45061.022919884260000000
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
        DataSet = frxCadastro
        DataSetName = 'frxCadastro'
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
        Height = 105.826840000000000000
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
            'PESSOAS CONJUGES')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 79.370130000000000000
          Width = 94.488250000000000000
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
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
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
            'NOME')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 341.937230000000000000
          Top = 79.370130000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            'UF')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 79.370130000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'EMAIL')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 79.370130000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'TELEFONE:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = frxCadastro
        DataSetName = 'frxCadastro'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxCadastro."CPF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxCadastro."NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 341.937230000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxCadastro."UF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxCadastro."EMAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxCadastro."TELEFONE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 342.157700000000000000
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            'CPF:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            'NOME:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 342.157700000000000000
          Top = 18.897650000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxCadastro."CPF_CONJUGE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxCadastro."NOME_CONJUGE"]')
          ParentFont = False
          VAlign = vaBottom
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
    SQL.Strings = (
      
        'select p.chave_pessoas, p.cpf, p.nome, p.documento, p.endereco, ' +
        'p.bairro, p.cidade, p.uf, p.telefone, p.telefone1, p.data_nascim' +
        'ento,'
      
        'p.chave_conjuge, p.sexo, p.cep, p.email, p.NOME_PAI, p.NOME_MAE,' +
        ' p.observacao, p.naturalidade, p.nacionalidade, p.PAIS, p.orgao_' +
        'emissor, p.uf_nascimento,'
      
        'p.CIDADE_NASCIMENTO, p.PAIS_RESIDENCIA, pc.cpf as cpf_conjuge, p' +
        'c.nome as nome_conjuge'
      
        'from pessoas p left join pessoas pc on p.chave_pessoas = pc.chav' +
        'e_conjuge where p.chave_conjuge is not null')
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
end

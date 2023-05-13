object formPesquisaCNPJ: TformPesquisaCNPJ
  Left = 195
  Top = 128
  Width = 520
  Height = 557
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa Pessoa Jur'#237'dica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 93
    Height = 13
    Caption = 'Pesquisa por nome:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 69
    Width = 489
    Height = 441
    DataSource = dsPesquisaCNPJ
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CNPJ'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZAO_SOCIAL'
        Width = 356
        Visible = True
      end>
  end
  object editPesquisaCnpj: TEdit
    Left = 8
    Top = 40
    Width = 489
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = editPesquisaCnpjChange
  end
  object IBQuery: TIBQuery
    Database = DM.Conexao
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select CNPJ, RAZAO_SOCIAL from PESSOAS_JURIDICAS order by RAZAO_' +
        'SOCIAL')
    Left = 424
    Top = 8
  end
  object dsPesquisaCNPJ: TDataSource
    DataSet = IBQuery
    Left = 464
    Top = 8
  end
end

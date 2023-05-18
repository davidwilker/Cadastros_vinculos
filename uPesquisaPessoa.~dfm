object formPesquisaPessoa: TformPesquisaPessoa
  Left = 202
  Top = 132
  Width = 516
  Height = 562
  BorderIcons = [biSystemMenu]
  Caption = 'formPesquisaPessoa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 25
    Width = 90
    Height = 16
    Caption = 'Pesquisas por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 77
    Width = 489
    Height = 441
    DataSource = dsPesquisaPessoa
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
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
  object editPesquisa: TEdit
    Left = 8
    Top = 48
    Width = 489
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = editPesquisaChange
  end
  object rdbNome: TRadioButton
    Left = 107
    Top = 28
    Width = 62
    Height = 14
    Caption = 'NOME'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object rdbCpf: TRadioButton
    Left = 171
    Top = 28
    Width = 46
    Height = 14
    Caption = 'CPF'
    TabOrder = 3
  end
  object IBQuery: TIBQuery
    Database = DM.Conexao
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CPF, NOME from PESSOAS order by nome')
    Left = 424
    Top = 16
  end
  object dsPesquisaPessoa: TDataSource
    DataSet = IBQuery
    Left = 464
    Top = 16
  end
end

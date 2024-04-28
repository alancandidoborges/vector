object F_CAD_FORN: TF_CAD_FORN
  Left = 412
  Top = 213
  Width = 495
  Height = 252
  Caption = 'F_CAD_FORN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 36
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object edtCodigo: TEdit
    Left = 48
    Top = 16
    Width = 65
    Height = 21
    MaxLength = 5
    ReadOnly = True
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 48
    Top = 40
    Width = 153
    Height = 21
    MaxLength = 20
    TabOrder = 1
  end
  object RG_ESTADO: TRadioGroup
    Left = 8
    Top = 72
    Width = 89
    Height = 73
    Caption = 'Estado atual'
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Parado'
      'Inclus'#227'o'
      'Altera'#231#227'o')
    TabOrder = 2
  end
  object btnIncluir: TButton
    Left = 104
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Inclui'
    TabOrder = 3
    OnClick = btnIncluirClick
  end
  object btnAlterar: TButton
    Left = 104
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Altera'
    TabOrder = 4
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 104
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Exclui'
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object DBGrid1: TDBGrid
    Left = 216
    Top = 16
    Width = 265
    Height = 193
    DataSource = dsFornec
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object btnOK: TButton
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 7
    OnClick = btnOKClick
  end
  object btnCancelar: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 8
    OnClick = btnCancelarClick
  end
  object qryFornerc: TQuery
    DatabaseName = 'DB_TESTE'
    Left = 304
    Top = 48
  end
  object dsFornec: TDataSource
    DataSet = qryFornerc
    OnDataChange = dsFornecDataChange
    Left = 264
    Top = 48
  end
  object QueryTemp: TQuery
    DatabaseName = 'DB_TESTE'
    Left = 424
    Top = 32
  end
end

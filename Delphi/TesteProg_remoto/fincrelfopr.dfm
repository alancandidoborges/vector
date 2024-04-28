object F_INC_REL_FOPR: TF_INC_REL_FOPR
  Left = 213
  Top = 96
  Width = 991
  Height = 544
  Caption = 'F_INC_REL_FOPR'
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
  object DbGridFornec: TDBGrid
    Left = 16
    Top = 8
    Width = 441
    Height = 345
    DataSource = DsFornecedor
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DbGridFornecCellClick
  end
  object DbGridProd: TDBGrid
    Left = 472
    Top = 8
    Width = 497
    Height = 345
    DataSource = DsProduto
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DbGridProdCellClick
  end
  object btnIncluir: TButton
    Left = 16
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object btnCancelar: TButton
    Left = 96
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 360
    Width = 441
    Height = 89
    Caption = 'Registro Selecionado'
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 41
      Height = 15
      Caption = 'Codigo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 36
      Height = 15
      Caption = 'Nome:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCodFornec: TLabel
      Left = 72
      Top = 32
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNomeFornec: TLabel
      Left = 72
      Top = 56
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 472
    Top = 360
    Width = 497
    Height = 89
    Caption = 'Registro Selecionado'
    TabOrder = 5
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 41
      Height = 15
      Caption = 'Codigo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCodProd: TLabel
      Left = 72
      Top = 32
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 36
      Height = 15
      Caption = 'Nome:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNomeProd: TLabel
      Left = 72
      Top = 56
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object DsFornecedor: TDataSource
    DataSet = QryFornec
    Left = 248
    Top = 48
  end
  object DsProduto: TDataSource
    DataSet = QryProd
    Left = 616
    Top = 64
  end
  object QryFornec: TQuery
    DatabaseName = 'DB_TESTE'
    Left = 152
    Top = 56
  end
  object QryProd: TQuery
    DatabaseName = 'DB_TESTE'
    Left = 536
    Top = 64
  end
  object QryForPro: TQuery
    DatabaseName = 'DB_TESTE'
    Left = 152
    Top = 96
  end
  object QueryTemp: TQuery
    DatabaseName = 'DB_TESTE'
    Left = 240
    Top = 96
  end
end

object F_MENU: TF_MENU
  Left = 120
  Top = 162
  Width = 193
  Height = 178
  Caption = 'F_MENU'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 169
    Height = 25
    Caption = 'Cadastro de Fornecedores'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 48
    Width = 169
    Height = 25
    Caption = 'Cadastro de Produtos'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 80
    Width = 169
    Height = 25
    Caption = 'Relac Fornecedor x Produto'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 112
    Width = 169
    Height = 25
    Caption = 'Relat'#243'rio'
    TabOrder = 3
    OnClick = Button4Click
  end
  object DB_TESTE: TDatabase
    AliasName = 'DB_TESTE'
    DatabaseName = 'DB_TESTE'
    LoginPrompt = False
    Params.Strings = (
      '')
    SessionName = 'Default'
    Left = 104
    Top = 8
  end
end

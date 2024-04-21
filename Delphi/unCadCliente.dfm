object frmCadCliente: TfrmCadCliente
  Left = 797
  Top = 436
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Cadastrar Cliente'
  ClientHeight = 142
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object edtDataNascimento: TMaskEdit
    Left = 297
    Top = 56
    Width = 116
    Height = 23
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
    OnExit = edtExit
  end
  object stcDataNascimento: TStaticText
    Left = 300
    Top = 37
    Width = 111
    Height = 19
    Caption = 'Data de Nascimento'
    TabOrder = 3
  end
  object edtCpf: TMaskEdit
    Left = 173
    Top = 56
    Width = 114
    Height = 23
    EditMask = '!999.999.999-99;1;_'
    MaxLength = 14
    TabOrder = 1
    Text = '   .   .   -  '
    OnExit = edtExit
  end
  object stcCpf: TStaticText
    Left = 175
    Top = 37
    Width = 25
    Height = 19
    Caption = 'CPF'
    TabOrder = 4
  end
  object btnCadCliente: TButton
    Left = 192
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 5
    OnClick = btnCadClienteClick
  end
  object stcNome: TStaticText
    Left = 51
    Top = 37
    Width = 37
    Height = 19
    Caption = 'Nome'
    TabOrder = 6
  end
  object edtNome: TEdit
    Left = 48
    Top = 56
    Width = 119
    Height = 23
    TabOrder = 0
    OnExit = edtExit
    OnKeyPress = edtNomeKeyPress
  end
end

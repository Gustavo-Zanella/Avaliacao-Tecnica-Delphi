object frmCadCarro: TfrmCadCarro
  Left = 878
  Top = 457
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Cadastrar Carro'
  ClientHeight = 129
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object edtDataLancamento: TMaskEdit
    Left = 149
    Top = 40
    Width = 115
    Height = 23
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
    OnExit = edtExit
  end
  object stcDataLancamento: TStaticText
    Left = 149
    Top = 21
    Width = 113
    Height = 19
    Caption = 'Data de Lan'#231'amento'
    TabOrder = 3
  end
  object btnCadCliente: TButton
    Left = 104
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnCadClienteClick
  end
  object stcModelo: TStaticText
    Left = 27
    Top = 21
    Width = 45
    Height = 19
    Caption = 'Modelo'
    TabOrder = 4
  end
  object edtModelo: TEdit
    Left = 24
    Top = 40
    Width = 119
    Height = 23
    TabOrder = 0
    OnExit = edtExit
    OnKeyPress = edtModeloKeyPress
  end
end

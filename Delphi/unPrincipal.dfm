object frmPrincipal: TfrmPrincipal
  Left = 674
  Top = 312
  Caption = 'TAIF'
  ClientHeight = 406
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object btnCadastro: TBitBtn
    Left = 24
    Top = 192
    Width = 129
    Height = 73
    Caption = 'Cadastro'
    TabOrder = 0
    OnClick = btnCadastroClick
  end
  object stcTitulo: TStaticText
    Left = 240
    Top = 8
    Width = 140
    Height = 90
    Caption = 'TAIF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 168
    Top = 104
    Width = 465
    Height = 265
    DataSource = dsCliente
    ImeName = 'Portuguese (Brazilian ABNT)'
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Venda'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cliente'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Modelo Carro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lancamento do Modelo'
        Width = 140
        Visible = True
      end>
  end
  object dsCliente: TDataSource
    DataSet = DM.qryGeral
    Left = 504
    Top = 24
  end
end

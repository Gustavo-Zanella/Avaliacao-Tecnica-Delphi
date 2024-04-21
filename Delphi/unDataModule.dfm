object DM: TDM
  OnCreate = DataModuleCreate
  Height = 175
  Width = 215
  object conDB: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=postgres'
      'Database=local'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    Left = 16
    Top = 16
  end
  object qryGeral: TFDQuery
    Connection = conDB
    SQL.Strings = (
      'SELECT VENCODIGO AS "Venda",'
      '       VENDATA AS "Data Venda",'
      #9'   CLINOME AS "Cliente",'
      #9'   CLICPF AS "CPF Cliente",'
      #9'   CARMODELO AS "Modelo Carro",'
      #9'   CARDATALANCAMENTO AS "Lancamento do Modelo"'
      '  FROM TAIF.TBVENDA'
      '  JOIN TAIF.TBCLIENTE'
      ' USING (CLICODIGO)'
      '  JOIN TAIF.TBCARRO'
      ' USING (CARCODIGO)')
    Left = 72
    Top = 16
  end
  object PgDriverLink: TFDPhysPgDriverLink
    Left = 144
    Top = 16
  end
end

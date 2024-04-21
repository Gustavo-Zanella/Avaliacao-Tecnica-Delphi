unit unClasseBanco;

interface
uses
  StrUtils, SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, unDataModule;

type
  TBanco = class
  private
    fSql_: string;

  public
    property Sql_ : string read fSql_ write fSql_;
    Function ExecutarSql : TFDQuery;
    Procedure InserirDadosBD;
    Procedure Clear;
  end;

implementation

{ TBanco }

procedure TBanco.Clear;
begin
  fSql_ := '';
end;

function TBanco.ExecutarSql: TFDQuery;
begin
  DM.qryGeral.SQL.Text := fSql_;
  result := DM.qryGeral;
  Clear;
end;

procedure TBanco.InserirDadosBD;
begin
  Try
    DM.qryGeral.SQL.Text := fSql_;
    DM.qryGeral.ExecSQL;
    Clear;
  except
    on E:Exception do
      raise Exception.Create(E.Message + 'TBanco.ExecutarSql');
  End;
end;

end.

unit unClasseVenda;

interface
uses
  StrUtils, SysUtils, unClasseCarro, unClasseCliente;

type
  TVenda = class
  private
    FCodigo: Integer;
    FData: string;
    FCarro: TCarro;
    FCliente: TCliente;

  public
    property Codigo : Integer read FCodigo write FCodigo;
    property Data : string read FData write FData;
    property Cliente : TCliente read FCliente write FCliente;
    property Carro : TCarro read FCarro write FCarro;
    function Inserir : String;
    procedure Clear;
  end;

implementation

{ TVenda }

//Limpa Propriedades
procedure TVenda.Clear;
begin
  FCodigo := 0;
  FData := '';
  FCliente := nil;
  FCarro := nil;
end;

//Cria Scrip de Insert
function TVenda.Inserir: string;
begin
  Result :=
    'INSERT INTO taif.tbvenda (vendata, clicodigo, carcodigo)'+
    'VALUES ('+QuotedStr(FData)+', '+IntToStr(FCliente.Codigo)+', '+IntToStr(FCarro.Codigo)+')';

  Clear;
end;

end.

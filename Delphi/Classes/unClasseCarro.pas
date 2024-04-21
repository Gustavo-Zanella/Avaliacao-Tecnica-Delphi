unit unClasseCarro;

interface

uses
  StrUtils, SysUtils;

type
  TCarro = class
  private
    FCodigo: Integer;
    FModelo: string;
    FDataLancamento: String;

  public
    property Codigo : Integer read FCodigo write FCodigo;
    property Modelo : string read FModelo write FModelo;
    property DataLancamento : String read FDataLancamento write FDataLancamento;
    function Inserir : String;
    procedure Clear;
  end;

implementation

{ TCarro }

procedure TCarro.Clear;
begin
  FCodigo := 0;
  FModelo := '';
  FDataLancamento := '';
end;

function TCarro.Inserir: String;
begin
  Result := 'INSERT INTO taif.tbcarro (carmodelo, cardatalancamento)'+
            ' Values('+QuotedStr(FModelo)+','+QuotedStr(FDataLancamento)+')';

  Clear;
end;

end.

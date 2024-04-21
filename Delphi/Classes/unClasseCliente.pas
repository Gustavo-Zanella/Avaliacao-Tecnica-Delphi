unit unClasseCliente;

interface

uses
  StrUtils, SysUtils;

type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: string;
    FCpf: String;
    FDataNascimento : String;
  public
    property Codigo : Integer read FCodigo write FCodigo;
    property Nome : string read FNome write FNome;
    property Cpf : String read FCpf write FCpf;
    property DataNascimento : String read FDataNascimento write FDataNascimento;
    function Inserir : String;
    procedure Clear;
  end;


implementation

{ TCliente }

procedure TCliente.Clear;
begin
  FCodigo := 0;
  FNome := '';
  FCpf := '';
  FDataNascimento := '';
end;

function TCliente.Inserir: String;
begin
  Result := 'INSERT INTO taif.tbcliente (clinome, clicpf, clidatanascimento)'+
            ' Values('+QuotedStr(Nome)+', '+QuotedStr(Cpf)+', '+QuotedStr(DataNascimento)+')';

  Clear;
end;

end.

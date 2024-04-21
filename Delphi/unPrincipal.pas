unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, unClasseBanco, unClasseVenda, unClasseCarro, unClasseCliente,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    btnCadastro: TBitBtn;
    stcTitulo: TStaticText;
    DBGrid1: TDBGrid;
    dsCliente: TDataSource;
    procedure btnCadastroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FBanco: TBanco;
    FVenda: TVenda;
    FCarro: TCarro;
    FCliente: TCliente;
    function GetBanco: TBanco;
    procedure CarregaDadosCliente;
    function GetVenda: TVenda;
    Procedure CadastraVenda;
    function GetCarro: TCarro;
    function GetCliente: TCliente;
  public
    property oBanco : TBanco read GetBanco write FBanco;
    property oVenda : TVenda read GetVenda write FVenda;
    property oCarro : TCarro read GetCarro write FCarro;
    property oCliente : TCliente read GetCliente write FCliente;
  end;

var
  frmPrincipal: TfrmPrincipal;
  aClientesInseridos : array[0..4] of integer;
  aCarrosInseridos   : array[0..4] of integer;

implementation

uses unCadCliente, unCadCarro, unDataModule;

{$R *.dfm}

//Cadastrar 5 Cliente, Carros e Vendas
procedure TfrmPrincipal.btnCadastroClick(Sender: TObject);
var
  i : integer;
  oQuery : TFDQuery;
begin
  for i := 0 to 4 do
  begin
    frmCadCliente.ShowModal;
    oBanco.Sql_ := 'SELECT MAX(CLICODIGO) AS CLICODIGO FROM TAIF.TBCLIENTE';
    oQuery := oBanco.ExecutarSql;
    with oQuery do
    begin
      Open;
      aClientesInseridos[i] := FieldByName('CLICODIGO').AsInteger;
      Close;
    end;
    CarregaDadosCliente;
  end;

  for i := 0 to 4 do
  begin
    frmCadCarro.ShowModal;
    oBanco.Sql_ := 'SELECT MAX(CARCODIGO) AS CARCODIGO FROM TAIF.TBCARRO';
    oQuery := oBanco.ExecutarSql;
    with oQuery do
    begin
      Open;
      aCarrosInseridos[i] := FieldByName('CARCODIGO').AsInteger;
      Close;
    end;
    CarregaDadosCliente;
  end;

  CadastraVenda;
  CarregaDadosCliente;

  ShowMessage('Registros Inseridos com Sucesso');
end;

//Cadsatar 5 vendas
procedure TfrmPrincipal.CadastraVenda;
var
  i: Integer;
  oVenda_ : TVenda;
begin
  for i := Low(aClientesInseridos) to High(aClientesInseridos) do
  begin
    oCliente.Codigo := aClientesInseridos[i];
    oCarro.Codigo := aCarrosInseridos[i];

    oVenda_ := oVenda;

    oVenda_.Data := DateToStr(Now);
    oVenda_.Cliente := oCliente;
    oVenda_.Carro := oCarro;

    oBanco.Sql_ := oVenda_.Inserir;
    oBanco.InserirDadosBD;
  end;
end;
//Carregar os dados dos cliente do DataSource
procedure TfrmPrincipal.CarregaDadosCliente;
begin
  oBanco.Sql_ :=
      'SELECT VENCODIGO AS "Venda",'+
      '       VENDATA AS "Data Venda",'+
      '	   CLINOME AS "Cliente",'+
      '	   CLICPF AS "CPF Cliente",'+
      '	   CARMODELO AS "Modelo Carro",'+
      '	   CARDATALANCAMENTO AS "Lancamento do Modelo"'+
      '  FROM TAIF.TBVENDA'+
      '  JOIN TAIF.TBCLIENTE'+
      ' USING (CLICODIGO)'+
      '  JOIN TAIF.TBCARRO'+
      ' USING (CARCODIGO)';

  oBanco.ExecutarSql.Open;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  CarregaDadosCliente;
end;

function TfrmPrincipal.GetBanco: TBanco;
begin
  if not Assigned(FBanco) then
    FBanco := TBanco.Create;
  Result := FBanco;
end;

function TfrmPrincipal.GetCarro: TCarro;
begin
  if not Assigned(FCarro) then
    FCarro := TCarro.Create;
  Result := FCarro;
end;

function TfrmPrincipal.GetCliente: TCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCliente.Create;
  Result := FCliente;
end;

function TfrmPrincipal.GetVenda: TVenda;
begin
  if not Assigned(FVenda) then
    FVenda := TVenda.Create;
  Result := FVenda;
end;

end.

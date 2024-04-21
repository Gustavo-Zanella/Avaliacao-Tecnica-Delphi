unit unCadCarro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, unClasseEdit, unClasseCarro,
  unClasseBanco;

type
  TfrmCadCarro = class(TForm)
    edtDataLancamento: TMaskEdit;
    stcDataLancamento: TStaticText;
    btnCadCliente: TButton;
    stcModelo: TStaticText;
    edtModelo: TEdit;
    procedure btnCadClienteClick(Sender: TObject);
    procedure edtModeloKeyPress(Sender: TObject; var Key: Char);
    procedure edtExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FBanco: TBanco;
    FCarrro: TCarro;
    FoEdit: TClasseEdit;
    function GetBanco: TBanco;
    function GetCliente: TCarro;
    function GetoEdit: TClasseEdit;
    { Private declarations }
  public
    property oEdit : TClasseEdit read GetoEdit write FoEdit;
    property oCarro: TCarro read GetCliente write FCarrro;
    property oBanco : TBanco read GetBanco write FBanco;
  end;

var
  frmCadCarro: TfrmCadCarro;

implementation

{$R *.dfm}

procedure TfrmCadCarro.btnCadClienteClick(Sender: TObject);
var
  oControle: TControl;
  i : Integer;
  oCarro_ : TCarro;
begin
  for i := 0 to frmCadCarro.ControlCount-1 do
  begin
    oControle := frmCadCarro.Controls[i];

    if oControle is TEdit then
    begin
      oEdit.Edit := TEdit(oControle);
      if oEdit.EditVazio then
        Exit;
    end;
  end;

  oCarro_ := oCarro;
  oCarro_.Modelo := edtModelo.Text;
  oCarro_.DataLancamento := edtDataLancamento.Text;

  oBanco.Sql_ := oCarro_.Inserir;
  oBanco.InserirDadosBD;

  Close;
end;

procedure TfrmCadCarro.edtModeloKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['A' .. 'Z','a'..'z',#8]) and (Length(edtModelo.Text) < 255)) then
  begin
   if (Key <> #8) then
     Key := #0;
   end;
end;

procedure TfrmCadCarro.FormShow(Sender: TObject);
begin
  edtModelo.Clear;
  edtDataLancamento.Clear;
end;

procedure TfrmCadCarro.edtExit(Sender: TObject);
var
  dData : TDate;
begin
  oEdit.Edit := TEdit(Sender);

  if pos('/', oEdit.Edit.Text) > 0 then
    Try
      dData := StrToDate(edtDataLancamento.Text);
    except
      on E:Exception do
        oEdit.Edit.Clear;
    End;

 oEdit.EditVazio;
end;

function TfrmCadCarro.GetBanco: TBanco;
begin
  if not Assigned(FBanco) then
    FBanco := TBanco.Create;
  Result := FBanco;
end;

function TfrmCadCarro.GetCliente: TCarro;
begin
  if not Assigned(FCarrro) then
    FCarrro := TCarro.Create;
  Result := FCarrro;
end;

function TfrmCadCarro.GetoEdit: TClasseEdit;
begin
  if not Assigned(FoEdit) then
    FoEdit := TClasseEdit.Create;
  Result := FoEdit;
end;

end.

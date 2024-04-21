unit unCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls, unClasseEdit, unClasseCliente,
  unClasseBanco;

type
  TfrmCadCliente = class(TForm)
    edtDataNascimento: TMaskEdit;
    stcDataNascimento: TStaticText;
    edtCpf: TMaskEdit;
    stcCpf: TStaticText;
    btnCadCliente: TButton;
    stcNome: TStaticText;
    edtNome: TEdit;
    procedure btnCadClienteClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FoEdit: TClasseEdit;
    FCliente: TCliente;
    FBanco: TBanco;
    function GetoEdit: TClasseEdit;
    function GetCliente: TCliente;
    function GetBanco: TBanco;
  public
    property oEdit : TClasseEdit read GetoEdit write FoEdit;
    property oCliente : TCliente read GetCliente write FCliente;
    property oBanco : TBanco read GetBanco write FBanco;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.btnCadClienteClick(Sender: TObject);
var
  oControle: TControl;
  i : Integer;
  oCliente_ : TCliente;
begin
  for i := 0 to frmCadCliente.ControlCount-1 do
  begin
    oControle := frmCadCliente.Controls[i];

    if oControle is TEdit then
    begin
      oEdit.Edit := TEdit(oControle);
      if oEdit.EditVazio then
        Exit;
    end;
  end;

  oCliente_ := oCliente;
  oCliente_.Nome := edtNome.Text;
  oCliente_.Cpf  := edtCpf.Text;
  oCliente_.DataNascimento := edtDataNascimento.Text;

  oBanco.Sql_ := oCliente_.Inserir;
  oBanco.InserirDadosBD;

  Close;
end;

procedure TfrmCadCliente.edtExit(Sender: TObject);
var
  dData : TDate;
begin
  oEdit.Edit := TEdit(Sender);

  if pos('/', oEdit.Edit.Text) > 0 then
    Try
      dData := StrToDate(edtDataNascimento.Text);
    except
      on E:Exception do
        oEdit.Edit.Clear;
    End;

  oEdit.EditVazio;
end;

procedure TfrmCadCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if not ((CharInSet(Key, ['A'..'Z', 'a'..'z', #8, ' '])) and (Length(edtNome.Text) < 255)) then
  begin
    if not (Key in [#8, ' ']) then
      Key := #0;
  end;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  edtCpf.Clear;
  edtNome.Clear;
  edtDataNascimento.Clear;
  edtNome.SetFocus;
end;

function TfrmCadCliente.GetBanco: TBanco;
begin
  if not Assigned(FBanco) then
    FBanco := TBanco.Create;
  Result := FBanco;
end;

function TfrmCadCliente.GetCliente: TCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCliente.Create;
  Result := FCliente;
end;

function TfrmCadCliente.GetoEdit: TClasseEdit;
begin
  if not Assigned(FoEdit) then
    FoEdit := TClasseEdit.Create;
  Result := FoEdit;
end;

end.

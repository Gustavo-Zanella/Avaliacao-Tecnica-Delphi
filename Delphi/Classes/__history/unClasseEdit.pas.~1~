unit unClasseEdit;

interface
uses
  StrUtils, SysUtils, Vcl.StdCtrls, Vcl.Dialogs;

type
  TClasseEdit = class
  private
    FEdit: TEdit;

  public
    property Edit : TEdit read FEdit write FEdit;
    function EditVazio: Boolean;
    procedure Clear;
  end;

implementation

{ TCliente }

function TClasseEdit.EditVazio: Boolean;
const
  aValoresFixos: array[0..3] of Char = ('-', '_', '.', '/');
var
  sTextoEdt: string;
  i: Integer;
begin
  sTextoEdt := FEdit.Text;
  Result := False;

  for i := Low(aValoresFixos) to High(aValoresFixos) do
    sTextoEdt := StringReplace(sTextoEdt, aValoresFixos[i], '', [rfReplaceAll]);

  if sTextoEdt = '' then
  begin
    Result := True;
    ShowMessage('Valor Inválido');
    FEdit.SetFocus;
  end;

  Clear;
end;

procedure TClasseEdit.Clear;
begin
  FEdit := Nil;
end;

end.

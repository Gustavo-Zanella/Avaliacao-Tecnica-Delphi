unit unDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Dialogs, IniFiles, ExtCtrls, StdCtrls, vcl.Forms;

type
  TDM = class(TDataModule)
    conDB: TFDConnection;
    qryGeral: TFDQuery;
    PgDriverLink: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Function ConectaBanco: Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.ConectaBanco: Boolean;
var
  oArquivoINI : TIniFile;
Begin
  Result := False;

  oArquivoINI := Tinifile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');

  With conDB do
  begin
    Params.Clear;
    Params.Values['DriverID'] := oArquivoINI.ReadString('BANCO','DATABASE', '');
    Params.Values['Password'] := oArquivoINI.ReadString('BANCO','PASSWORD', '');
    Params.Values['User_name'] := oArquivoINI.ReadString('BANCO','USER_NAME', '');
    Params.Values['Database'] := oArquivoINI.ReadString('BANCO','DATABASE', '');
    Params.Values['Server'] := oArquivoINI.ReadString('BANCO','SERVER', '');
    Connected := True;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if not ConectaBanco then
    Application.Terminate;
end;

end.

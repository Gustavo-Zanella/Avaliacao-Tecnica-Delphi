unit unDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Dialogs, IniFiles, ExtCtrls, StdCtrls;

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

end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  With conDB do
  begin
    Params.Clear;
    Params.Values['DriverID'] := 'PG';
    Params.Values['Password'] := 'postgres';
    Params.Values['User_name'] := 'postgres';
    Params.Values['Database'] := 'local';
    Params.Values['Server'] := '127.0.0.1';
    Connected := True;
  end;
end;

end.

program Taif;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unCadCliente in 'unCadCliente.pas' {frmCadCliente},
  unCadCarro in 'unCadCarro.pas' {frmCadCarro},
  unClasseCliente in 'Classes\unClasseCliente.pas',
  unDataModule in 'unDataModule.pas' {DM: TDataModule},
  unClasseEdit in 'Classes\unClasseEdit.pas',
  unClasseBanco in 'Classes\unClasseBanco.pas',
  unClasseCarro in 'Classes\unClasseCarro.pas',
  unClasseVenda in 'Classes\unClasseVenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TfrmCadCarro, frmCadCarro);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

program PrjOrcamento;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, MenuPrincipal, unitModelo, DataModule
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TCadCategoriasF, CadCategoriasF);
  Application.CreateForm(TFormPadraoF2, FormPadraoF2);
  Application.Run;
end.


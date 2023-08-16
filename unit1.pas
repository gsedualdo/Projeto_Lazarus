unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  unitModelo;

type

  { TcadClientesF }

  TcadClientesF = class(TFormPadraoF)
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    labTitulo: TLabel;
    labCpfCliente: TLabel;
    labTipoCliente: TLabel;
    labID: TLabel;
    Label6: TLabel;
  private

  public

  end;

var
  cadClientesF: TcadClientesF;

implementation

{$R *.lfm}

end.


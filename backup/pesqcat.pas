unit pesquisa;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Buttons, DataModule;

type

  { TFormPesquisaPadraoF }

  TFormPesquisaPadraoF = class(TForm)
    btnPesq: TBitBtn;
    DBGrid1: TDBGrid;
    edtReferencia: TEdit;
    labReferencia: TLabel;
    paneltopcat: TPanel;
    panelleftcat: TPanel;
    panelrightcat: TPanel;
    panelbottomcat: TPanel;
  private

  public

  end;

var
  FormPesquisaPadraoF: TFormPesquisaPadraoF;

implementation

{$R *.lfm}

end.


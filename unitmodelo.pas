unit unitModelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, DBGrids,
  ExtCtrls, StdCtrls, DBCtrls, Buttons, DBExtCtrls, DataModule;

type

  { TFormPadraoF }

  TFormPadraoF = class(TForm)
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnNovo: TBitBtn;
    btnFechar: TBitBtn;
    btnPesquisar: TBitBtn;
    DBGrid1: TDBGrid;
    edtRefM: TEdit;
    labCod: TLabel;
    PageControl1: TPageControl;
    panelcenter: TPanel;
    PanelBottomCad: TPanel;
    panelleft1: TPanel;
    panelleft2: TPanel;
    panelright1: TPanel;
    panelright2: TPanel;
    PanelTop: TPanel;
    PanelBottom: TPanel;
    paneltop2: TPanel;
    TelaCadastro: TTabSheet;
    TelaConsulta: TTabSheet;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);

  private

  public

  end;

var
  FormPadraoF: TFormPadraoF;

implementation

{$R *.lfm}

{ TFormPadraoF }

procedure TFormPadraoF.btnNovoClick(Sender: TObject);
begin
    PageControl1.TabIndex:= 1;
end;


procedure TFormPadraoF.btnFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFormPadraoF.btnEditarClick(Sender: TObject);
begin
end;

procedure TFormPadraoF.btnCancelarClick(Sender: TObject);
begin
    PageControl1.TabIndex:= 0;
end;

procedure TFormPadraoF.btnExcluirClick(Sender: TObject);
begin
end;

procedure TFormPadraoF.btnGravarClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
end;

procedure TFormPadraoF.btnPesquisarClick(Sender: TObject);
begin
end;

procedure TFormPadraoF.DBGrid1DblClick(Sender: TObject);
begin

end;

procedure TFormPadraoF.FormShow(Sender: TObject);
begin
       PageControl1.TabIndex:= 0;
end;
end.


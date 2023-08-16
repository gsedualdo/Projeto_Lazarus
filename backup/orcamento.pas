unit orcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  DBExtCtrls, unitModelo, DB, DataModule;

type

  { TorcamentoF }

  TorcamentoF = class(TFormPadraoF)
    edtNomeCli: TDBEdit;
    edtRefOrc: TEdit;
    edtData: TDBDateEdit;
    edtDataVal: TDBDateEdit;
    edtIDCliente: TDBEdit;
    edtIDOrc: TDBEdit;
    edtValor: TDBEdit;
    dsOrcamento: TDataSource;
    labNomeCli: TLabel;
    labIDCliente: TLabel;
    labIDOrc: TLabel;
    labData: TLabel;
    labDataVal: TLabel;
    labValor: TLabel;
    labTitulo: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private

  public

  end;

var
  orcamentoF: TorcamentoF;

implementation

{$R *.lfm}

{ TorcamentoF }

procedure TorcamentoF.btnNovoClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 1;
  dsOrcamento.DataSet.Insert;
  inherited;
end;

procedure TorcamentoF.btnPesquisarClick(Sender: TObject);
var
  AuxWhere : String;

begin
  //Esta procedure irá executar a pesquisa da Categoria
  if edtRefOrc.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'ORCAMENTOID = '+edtRefOrc.Text;

  DataModuleF.qryOrcamento.Close;
  DataModuleF.qryOrcamento.SQL.Text :=
            'SELECT '+
            'ORCAMENTOID, '+
            'CLIENTEID, '+
            'DT_ORCAMENTO, '+
            'DT_VALIDADE_ORCAMENTO, '+
            'VL_TOTAL_ORCAMENTO, '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY ORCAMENTOID';
  DataModuleF.qryOrcamento.Open;
  inherited;
end;

procedure TorcamentoF.btnFecharClick(Sender: TObject);
begin
  if  MessageDlg('Você deseja fechar o programa?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    Application.Terminate;
  end;
  inherited;
end;

procedure TorcamentoF.btnEditarClick(Sender: TObject);
begin
  DataModuleF.qryOrcamento.Edit;
  inherited;
end;

procedure TorcamentoF.btnCancelarClick(Sender: TObject);
begin
  DataModuleF.qryOrcamento.Cancel;
  inherited;
end;

procedure TorcamentoF.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    dsOrcamento.DataSet.Delete;
  end;
end;

procedure TorcamentoF.btnGravarClick(Sender: TObject);
begin
  DataModuleF.qryOrcamento.Post;
  DataModuleF.qryOrcamento.ApplyUpdates;
  PageControl1.TabIndex:= 0;
  inherited;
end;

end.


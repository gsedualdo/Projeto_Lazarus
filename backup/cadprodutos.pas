unit cadProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  DBExtCtrls, unitModelo, DataModule;

type

  { TCadProdutosF }

  TCadProdutosF = class(TFormPadraoF)
    dsProduto: TDataSource;
    edtRefProd: TEdit;
    edtValor: TDBEdit;
    edtCategoria: TDBEdit;
    edtData: TDBDateEdit;
    edtDesc: TDBEdit;
    edtID: TDBEdit;
    edtObs: TDBEdit;
    edtStatus: TDBEdit;
    labCategoria: TLabel;
    labData: TLabel;
    labDesc: TLabel;
    Label9: TLabel;
    labID: TLabel;
    labObs: TLabel;
    labStatus: TLabel;
    labTitulo: TLabel;
    labValor: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadProdutosF: TCadProdutosF;

implementation

{$R *.lfm}

{ TCadProdutosF }

procedure TCadProdutosF.btnNovoClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 1;
  dsProduto.DataSet.Insert;
  edtData.setfocus;
  inherited;
end;

procedure TCadProdutosF.btnPesquisarClick(Sender: TObject);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if edtRefProd.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'PRODUTOID = '+edtRefProd.Text;

  DataModuleF.qryProduto.Close;
  DataModuleF.qryProduto.SQL.Text :=
            'SELECT '+
            'PRODUTOID, '+
            'CATEGORIAPRODUTOID, '+
            'DS_PRODUTO, '+
            'OBS_PRODUTO, '+
            'VL_VENDA_PRODUTO, '+
            'DT_CADASTRO_PRODUTO, '+
            'STATUS_PRODUTO '+
            'FROM PRODUTO '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY PRODUTOID';
  DataModuleF.qryProduto.Open;
  inherited;
end;

procedure TCadProdutosF.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  dsProduto.DataSet.Edit;
end;



procedure TCadProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  inherited;
  dsProduto.DataSet.Close;
end;


procedure TCadProdutosF.btnFecharClick(Sender: TObject);
begin
  if  MessageDlg('Você deseja fechar o programa?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    Application.Terminate;
  end;
  inherited;
end;

procedure TCadProdutosF.btnEditarClick(Sender: TObject);
begin
  DataModuleF.qryProduto.Edit;
  inherited;
end;

procedure TCadProdutosF.btnCancelarClick(Sender: TObject);
begin
  inherited;
  DataModuleF.qryProduto.Cancel;
end;

procedure TCadProdutosF.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    dsProduto.DataSet.Delete;
  end;
end;

procedure TCadProdutosF.btnGravarClick(Sender: TObject);
begin
  DataModuleF.qryProduto.Post;
  DataModuleF.qryProduto.ApplyUpdates;
  PageControl1.TabIndex:= 0;
  inherited;
end;

end.


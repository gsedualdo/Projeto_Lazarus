unit cadcategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  unitModelo, DB, DataModule;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TFormPadraoF)
    dsCategoria: TDataSource;
    edtRefCat: TEdit;
    edtID: TDBEdit;
    edtDesc: TDBEdit;
    labTitulo: TLabel;
    labID: TLabel;
    labDesc: TLabel;
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
  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

{ TCadCategoriaF }

procedure TCadCategoriaF.btnPesquisarClick(Sender: TObject);
var
  AuxWhere : String;

begin
  //Esta procedure irá executar a pesquisa da Categoria
  if edtRefCat.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CATEGORIAPRODUTOID = '+edtRefCat.Text;

  DataModuleF.qryCategoria.Close;
  DataModuleF.qryCategoria.SQL.Text :=
            'SELECT '+
            'CATEGORIAPRODUTOID, '+
            'DS_CATEGORIA_PRODUTO, '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY CATEGORIAPRODUTOID';
  DataModuleF.qryCategoria.Open;
  inherited;
end;

procedure TCadCategoriaF.btnNovoClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 1;
  dsCategoria.DataSet.Insert;
  inherited;
end;

procedure TCadCategoriaF.btnFecharClick(Sender: TObject);
begin
  if  MessageDlg('Você deseja fechar o programa?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    Application.Terminate;
  end;
  inherited;
end;

procedure TCadCategoriaF.btnEditarClick(Sender: TObject);
begin
  DataModuleF.qryCategoria.Edit;
  inherited;
end;

procedure TCadCategoriaF.btnCancelarClick(Sender: TObject);
begin
  DataModuleF.qryCategoria.Cancel;
  inherited;
end;

procedure TCadCategoriaF.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    dsCategoria.DataSet.Delete;
  end;
end;

procedure TCadCategoriaF.btnGravarClick(Sender: TObject);
begin
  DataModuleF.qryCategoria.Post;
  DataModuleF.qryCategoria.ApplyUpdates;
  PageControl1.TabIndex:= 0;
  inherited;
end;

end.


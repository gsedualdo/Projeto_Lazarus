unit pesquisacategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, pesquisa, DataModule, CadProdutos;

type

  { TPesquisaCatF }

  TPesquisaCatF = class(TFormPesquisaPadraoF)
    dsPesqCat: TDataSource;
    procedure btnPesqClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private

  public

  end;

var
  PesquisaCatF: TPesquisaCatF;

implementation

{$R *.lfm}

{ TPesquisaCatF }

procedure TPesquisaCatF.btnPesqClick(Sender: TObject);
  var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if edtReferencia.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CATEGORIAPRODUTOID = '+edtReferencia.Text;

  DataModuleF.qryCategoria.Close;
  DataModuleF.qryCategoria.SQL.Text :=
        'SELECT ' +
        'CATEGORIAPRODUTOID, ' +
        'DS_CATEGORIA_PRODUTO ' +
        'FROM CATEGORIA_PRODUTO ' +
        'WHERE '+AuxWhere+' '+
        'ORDER BY CATEGORIAPRODUTOID';
  DataModuleF.qryCategoria.Open;
end;

procedure TPesquisaCatF.DBGrid1DblClick(Sender: TObject);
begin
  DataModuleF.qryProduto..AsInteger := DataModuleF.qryCategoria.categoriaprodutoid.AsInteger;
   CadProdutosF.Label9.Caption := DataModuleF.qryCategoria.ds_categoria_produto.AsString;
end;

end.


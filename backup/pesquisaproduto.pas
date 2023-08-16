unit pesquisaproduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, pesquisa, DataModule;

type

  { TPesquisaProdF }

  TPesquisaProdF = class(TFormPesquisaPadraoF)
    dsPesqProd: TDataSource;
    procedure btnPesqClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private

  public

  end;

var
  PesquisaProdF: TPesquisaProdF;

implementation

{$R *.lfm}

{ TPesquisaProdF }

procedure TPesquisaProdF.btnPesqClick(Sender: TObject);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa do produto
  if edtReferencia.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'PRODUTOID = '+edtReferencia.Text;

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

end;

procedure TPesquisaProdF.DBGrid1DblClick(Sender: TObject);
begin
    DataModuleF.qryOrcamentoItemprodutoid.AsInteger  := DataModuleF.qryProdutoprodutoid.AsInteger;
    DataModuleF.qryOrcamentoItemprodutodesc.AsString := DataModuleF.qryProdutods_produto.AsString;
    DataModuleF.qryOrcamentoItemvl_unitario.AsFloat  := DataModuleF.qryProdutovl_venda_produto.AsFloat;
    Close;
end;

end.


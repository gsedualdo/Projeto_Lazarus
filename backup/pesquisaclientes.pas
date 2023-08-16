unit pesquisaclientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, pesquisa, DataModule;

type

  { TPesquisaClientesF }

  TPesquisaClientesF = class(TFormPesquisaPadraoF)
    procedure btnPesqClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private

  public

  end;

var
  PesquisaClientesF: TPesquisaClientesF;

implementation

{$R *.lfm}

{ TPesquisaClientesF }

procedure TPesquisaClientesF.btnPesqClick(Sender: TObject);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa do produto
  if edtReferencia.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'clienteid = '+edtReferencia.Text;

  DataModuleF.qryCliente.Close;
  DataModuleF.qryCliente.SQL.Text :=
               'SELECT '+
               'clienteid, '+
               'tipo_cliente, '+
               'cpf_cnpj_cliente, '+
               'nome_cliente '+
               'FROM CLIENTE '+
               'WHERE '+AuxWhere+' '+
               'ORDER BY clienteid';
  DataModuleF.qryCliente.Open

end;

procedure TPesquisaClientesF.DBGrid1DblClick(Sender: TObject);
begin
  DataModuleF.qryOrcamentoclienteid.AsInteger:=DataModuleF.qryClienteclienteid.AsInteger;
  orcamentoF.labNomeCli.Caption := DataModuleF.qryClientenome_cliente.AsString;
  Close;

end;

end.


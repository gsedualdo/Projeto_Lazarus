unit cadclientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  unitModelo, DB, DataModule;

type

  { TCadClientesF }

  TCadClientesF = class(TFormPadraoF)
    edtRefCli: TEdit;
    edtTipo: TDBEdit;
    edtNome: TDBEdit;
    edtID: TDBEdit;
    edtCPF: TDBEdit;
    dsClientes: TDataSource;
    labTitulo: TLabel;
    Label2: TLabel;
    labTipo: TLabel;
    labCPF: TLabel;
    labNome: TLabel;
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
  CadClientesF: TCadClientesF;

implementation

{$R *.lfm}

{ TCadClientesF }

procedure TCadClientesF.btnNovoClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 1;
  dsClientes.DataSet.Insert;
  inherited;
end;

procedure TCadClientesF.btnPesquisarClick(Sender: TObject);
var
  AuxWhere : String;

begin
  //Esta procedure irá executar a pesquisa da Categoria
  if edtRefCli.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CLIENTEID = '+edtRefCli.Text;

  DataModuleF.qryCliente.Close;
  DataModuleF.qryCliente.SQL.Text :=
            'SELECT '+
            'CLIENTEID, '+
            'TIPO_CLIENTE, '+
            'CPF_CNPJ_CLIENTE, '+
            'NOME_CLIENTE, '+
            'WHERE '+AuxWhere+' '+
            'ORDER BY CLIENTEID';
  DataModuleF.qryCliente.Open;
  inherited;
end;

procedure TCadClientesF.btnFecharClick(Sender: TObject);
begin
  if  MessageDlg('Você deseja fechar o programa?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    Application.Terminate;
  end;
  inherited;
end;

procedure TCadClientesF.btnEditarClick(Sender: TObject);
begin
  DataModuleF.qryCliente.Edit;
  inherited;;
end;

procedure TCadClientesF.btnCancelarClick(Sender: TObject);
begin
  DataModuleF.qryCliente.Cancel;
  inherited;
end;

procedure TCadClientesF.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    dsClientes.DataSet.Delete;
  end;
end;

procedure TCadClientesF.btnGravarClick(Sender: TObject);
begin
  DataModuleF.qryCliente.Post;
  DataModuleF.qryCliente.ApplyUpdates;
  PageControl1.TabIndex:= 0;
  inherited;
end;

end.


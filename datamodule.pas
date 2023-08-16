unit DataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModuleF }

  TDataModuleF = class(TDataModule)
    ZConnection1: TZConnection;
    qryCategoria: TZQuery;
    updCategoria: TZUpdateSQL;
    qryProduto: TZQuery;
    updProduto: TZUpdateSQL;
    qryCliente: TZQuery;
    updCliente: TZUpdateSQL;
    qryModelo: TZQuery;
    updModelo: TZUpdateSQL;
    qryOrcamento: TZQuery;
    updOrcamento: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  DataModuleF: TDataModuleF;

implementation

{$R *.lfm}

{ TDataModuleF }

procedure TDataModuleF.DataModuleCreate(Sender: TObject);
begin
  ZConnection1.HostName := 'localhost';
  ZConnection1.DataBase := 'postgres';
  ZConnection1.User     := 'postgres';
  ZConnection1.Password := '1234';
  ZConnection1.Port     := 5432;
  ZConnection1.Protocol := 'postgresql';
  ZConnection1.Connected := True;
end;

procedure TDataModuleF.ZConnection1AfterConnect(Sender: TObject);
begin

end;

end.


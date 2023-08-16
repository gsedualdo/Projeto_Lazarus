unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  CadProdutos, cadclientes, cadcategoria, orcamento;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    imgFundo: TImage;
    MainMenu1: TMainMenu;
    menuCad: TMenuItem;
    menuCliente: TMenuItem;
    menuCat: TMenuItem;
    submOrc: TMenuItem;
    menuVendas: TMenuItem;
    menuRel: TMenuItem;
    menuSobre: TMenuItem;
    menuSair: TMenuItem;
    menuProd: TMenuItem;
    procedure menuCatClick(Sender: TObject);
    procedure menuClienteClick(Sender: TObject);
    procedure menuProdClick(Sender: TObject);
    procedure menuSairClick(Sender: TObject);
    procedure submOrcClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

procedure TMenuPrincipalF.menuProdClick(Sender: TObject);
begin
  CadProdutosF := TCadProdutosF.Create(Self);
	CadProdutosF.Show

end;

procedure TMenuPrincipalF.menuSairClick(Sender: TObject);
begin
    if  MessageDlg('Você deseja fechar o programa?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    Application.Terminate;
  end;
end;

procedure TMenuPrincipalF.submOrcClick(Sender: TObject);
begin
   orcamentoF := TorcamentoF.Create(Self);
	orcamentoF.Show;
end;

procedure TMenuPrincipalF.menuClienteClick(Sender: TObject);
begin
   CadClientesF := TCadClientesF.Create(Self);
	CadClientesF.Show
end;

procedure TMenuPrincipalF.menuCatClick(Sender: TObject);
begin
   CadCategoriaF := TCadCategoriaF.Create(Self);
	CadCategoriaF.Show
end;

end.


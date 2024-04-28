unit fincrelfopr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DBTables, ADODB, StdCtrls;

type
  TF_INC_REL_FOPR = class(TForm)
    DbGridFornec: TDBGrid;
    DbGridProd: TDBGrid;
    DsFornecedor: TDataSource;
    DsProduto: TDataSource;
    QryFornec: TQuery;
    QryProd: TQuery;
    btnIncluir: TButton;
    btnCancelar: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblCodFornec: TLabel;
    lblNomeFornec: TLabel;
    Label3: TLabel;
    lblCodProd: TLabel;
    Label5: TLabel;
    lblNomeProd: TLabel;
    QryForPro: TQuery;
    QueryTemp: TQuery;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DbGridFornecCellClick(Column: TColumn);
    procedure DbGridProdCellClick(Column: TColumn);
    procedure btnIncluirClick(Sender: TObject);
  private
    StrSql   : String;
    mensagem : String;

    procedure CarregaFornecedores();
    procedure CarregaProdutos();
    procedure CarregaDados();
    function ValidaInclusao: Boolean;

    procedure GravaRegistro();
  public
    { Public declarations }
  end;

var
  F_INC_REL_FOPR: TF_INC_REL_FOPR;

implementation

{$R *.dfm}

{ TF_INC_REL_FOPR }

procedure TF_INC_REL_FOPR.CarregaDados;
begin
  CarregaFornecedores();
  CarregaProdutos();
 end;

procedure TF_INC_REL_FOPR.CarregaFornecedores;
begin
  StrSql := 'select cod_for as "Codigo", nome as "Nome" from tbl_fornec order by cod_for' ;
  QryFornec.Close;
  QryFornec.SQL.Clear;
  QryFornec.SQL.Add(StrSql);
  QryFornec.Open;
end;

procedure TF_INC_REL_FOPR.CarregaProdutos;
begin
  StrSql := 'select cod_pro as "Codigo", nome as "Nome", valor as "Valor" from tbl_produto order by cod_pro';
  QryProd.Close;
  QryProd.SQL.Clear;
  QryProd.SQL.Add(StrSql);
  QryProd.Open;
end;

procedure TF_INC_REL_FOPR.FormShow(Sender: TObject);
begin
  CarregaDados();
end;

procedure TF_INC_REL_FOPR.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TF_INC_REL_FOPR.DbGridFornecCellClick(Column: TColumn);
begin
  if (QryFornec.Active) or (QryFornec.RecordCount > 0) then
  begin
    lblCodFornec.Caption  := QryFornec.FieldByName('Codigo').AsString;
    lblNomeFornec.Caption := QryFornec.FieldByName('nome').AsString;
  end;
end;

procedure TF_INC_REL_FOPR.DbGridProdCellClick(Column: TColumn);
begin
  if (QryProd.Active) or (QryProd.RecordCount > 0) then
  begin
    lblCodProd.Caption  := QryProd.FieldByName('Codigo').AsString;
    lblNomeProd.Caption := QryProd.FieldByName('nome').AsString;
  end;
end;

procedure TF_INC_REL_FOPR.GravaRegistro;
begin
  if ValidaInclusao then
  begin
    StrSql := 'insert into tbl_forpro(cod_for, cod_pro) values (';
    StrSql := StrSql + QryFornec.FieldByName('Codigo').AsString + ', ';
    StrSql := StrSql + QuotedStr(QryProd.FieldByName('Codigo').AsString) + ');';
    QryForPro.Close;
    QryForPro.SQL.Clear;
    QryForPro.SQL.Add(StrSql);
    QryForPro.ExecSQL;
  end;
end;

procedure TF_INC_REL_FOPR.btnIncluirClick(Sender: TObject);
var
  confExcl : integer;
begin
  beep;
  confExcl:= Application.MessageBox('Confima a Grava��o ?','Aten��o',MB_YESNO + MB_DEFBUTTON1 + MB_ICONINFORMATION);
  if confExcl = IDYES then
  begin
    GravaRegistro;
    Close;
  end;
end;

function TF_INC_REL_FOPR.ValidaInclusao: Boolean;
begin
  Result := True;
  if  (not QryProd.Active) or (QryProd.RecordCount = 0) or (lblCodProd.Caption = EmptyStr) then
  begin
    mensagem:='� necess�rio selecionar um Produto.';
    Application.MessageBox(PChar(mensagem),'Informa��o',MB_OK + MB_ICONERROR);
    Result := False;
    Exit;
  end;

  if  (not QryFornec.Active) or (QryFornec.RecordCount = 0) or (lblCodFornec.Caption = EmptyStr) then
  begin
    mensagem:='� necess�rio selecionar um Fornecedor.';
    Application.MessageBox(PChar(mensagem),'Informa��o',MB_OK + MB_ICONERROR);
    Result := False;
    Exit;
  end;

  StrSql := 'select * from tbl_forpro';
  StrSql := StrSql + ' where cod_pro = ' + QuotedStr(lblCodProd.Caption);
  StrSql := StrSql + ' and cod_for = ' + lblCodFornec.Caption;

  QueryTemp.Close;
  QueryTemp.SQL.Clear;
  QueryTemp.SQL.Add(StrSql);
  QueryTemp.Open;

  if (QueryTemp.RecordCount > 0) then
  begin
    mensagem:='Registro j� incluido, selecione outro produto ou fornecedor.';
    Application.MessageBox(PChar(mensagem),'Informa��o',MB_OK + MB_ICONERROR);
    Result := False;
    Exit;
  end;

  StrSql := 'select count(cod_for) as "quantidade" from tbl_forpro';
  StrSql := StrSql + ' where cod_for = ' + lblCodFornec.Caption;
  StrSql := StrSql + ' group by cod_for';

  QueryTemp.Close;
  QueryTemp.SQL.Clear;
  QueryTemp.SQL.Add(StrSql);
  QueryTemp.Open;

  if (QueryTemp.FieldByName('quantidade').AsInteger = 3) then
  begin
    mensagem:='Fornecedor j� esta no limite de registro cadastrado .';
    Application.MessageBox(PChar(mensagem),'Informa��o',MB_OK + MB_ICONERROR);
    Result := False;
    Exit;
  end;

  StrSql := 'select sum(prod.valor) as "total"';
  StrSql := StrSql + ' from tbl_forpro rel, tbl_fornec forn, tbl_produto prod';
  StrSql := StrSql + ' where rel.cod_for = forn.cod_for';
  StrSql := StrSql + ' and rel.cod_pro = prod.cod_pro';
  StrSql := StrSql + ' and rel.cod_for = ' + lblCodFornec.Caption;
  StrSql := StrSql + ' group by rel.cod_for';

  QueryTemp.Close;
  QueryTemp.SQL.Clear;
  QueryTemp.SQL.Add(StrSql);
  QueryTemp.Open;

  if (QueryTemp.FieldByName('total').AsFloat + QryProd.FieldByName('valor').AsFloat)  > 1000 then
  begin
    mensagem:='Valor total excedido .';
    Application.MessageBox(PChar(mensagem),'Informa��o',MB_OK + MB_ICONERROR);
    Result := False;
    Exit;
  end;
end;

end.

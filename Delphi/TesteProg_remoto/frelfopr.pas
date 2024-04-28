unit frelfopr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables;

type
  TF_REL_FOPR = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DSLista: TDataSource;
    QueryLista: TQuery;
    QueryTemp: TQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    StrSql  : String;
    mensagem: string;

    Procedure ListaTodos();
  public
    { Public declarations }
  end;

var
  F_REL_FOPR: TF_REL_FOPR;

implementation

uses fincrelfopr;

{$R *.DFM}

procedure TF_REL_FOPR.ListaTodos;
begin
  StrSql := 'select rel.cod_for as "Codigo Fornecedor",  forn.nome as "Nome Fornecedor", rel.cod_pro as "Codigo Produto" , prod.nome as "Nome Produto"';
  StrSql := StrSql + ' from tbl_forpro rel, tbl_fornec forn, tbl_produto prod ';
  StrSql := StrSql + ' where rel.cod_for = forn.cod_for';
  StrSql := StrSql + ' and rel.cod_pro = prod.cod_pro';
  StrSql := StrSql +' order by rel.cod_for, rel.cod_pro';

  QueryLista.Close;
  QueryLista.SQL.Clear;
  QueryLista.SQL.Add(StrSql);
  QueryLista.Open;
end;

procedure TF_REL_FOPR.FormShow(Sender: TObject);
begin
  ListaTodos;
end;

procedure TF_REL_FOPR.Button1Click(Sender: TObject);
begin
  if application.FindComponent('F_INC_REL_FOPR') = nil then
    Application.CreateForm(TF_INC_REL_FOPR, F_INC_REL_FOPR);
  try
    F_INC_REL_FOPR.ShowModal;
  finally
    ListaTodos;
    F_INC_REL_FOPR.Free;
  end;
end;

procedure TF_REL_FOPR.Button2Click(Sender: TObject);
var
  confExcl : integer;
begin
  beep;
  confExcl:= Application.MessageBox('Confima a Exclus�o ?','Aten��o',MB_YESNO + MB_DEFBUTTON1 + MB_ICONINFORMATION);
  if confExcl = IDYES then
  begin
    StrSql := 'delete from tbl_forpro';
    StrSql := StrSql + ' where cod_pro = ' + QuotedStr(QueryLista.FieldByName('Codigo Produto').AsString);
    StrSql := StrSql + ' and cod_for = ' + QueryLista.FieldByName('Codigo Fornecedor').AsString;

    QueryTemp.Close;
    QueryTemp.SQL.Clear;
    QueryTemp.SQL.Add(StrSql);
    QueryTemp.ExecSQL;
  end;
end;

end.

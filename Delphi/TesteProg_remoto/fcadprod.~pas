unit fcadprod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Db, DBTables;

type
  TF_CAD_PROD = class(TForm)
    Label1: TLabel;
    EdtCodigo: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    RG_ESTADO: TRadioGroup;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    btnOK: TButton;
    btnCancelar: TButton;
    EdtValor: TEdit;
    Label3: TLabel;
    QryProd: TQuery;
    DsProd: TDataSource;
    QueryTemp: TQuery;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    StrSql   : String;
    mensagem : String;

    procedure ListaTodos();
    procedure PopulaComponentes();
    procedure LimpaTela();
    procedure IncluiRegistro;
    procedure AlteraRegistro;
    procedure ExcluiRegistro;
    procedure ExecutaSqlTemp(AValue: String);
    procedure ExecutaSql(AValue: String);
    procedure HabilitaBotoes();
    procedure DesabilitaBotoes();

    function ValidaCampos: Boolean;
    function ValidaInclusao(ACodigo: String): Boolean;
    function ValidaExclusao(ACodigo: String): Boolean;
  end;

var
  F_CAD_PROD: TF_CAD_PROD;

implementation

{$R *.DFM}

procedure TF_CAD_PROD.AlteraRegistro;
begin
  StrSql := 'update tbl_prooduto set nome = ' + QuotedStr(edtNome.Text) + ', ';
  StrSql := StrSql + ' valor = ' + QuotedStr(EdtValor.Text);
  StrSql := StrSql + ' where cod_pro = ' + edtCodigo.Text;
  ExecutaSqlTemp(StrSql);
  ListaTodos;
  HabilitaBotoes;
end;

procedure TF_CAD_PROD.DesabilitaBotoes;
begin
  DBGrid1.Enabled     := False;
  EdtCodigo.Enabled   := True;
  EdtNome.Enabled     := True;
  EdtValor.Enabled    := True;
  btnIncluir.Enabled  := False;
  btnAlterar.Enabled  := False;
  btnExcluir.Enabled  := False;
  btnOK.Enabled       := True;
  btnCancelar.Enabled := True;
end;

procedure TF_CAD_PROD.ExcluiRegistro;
begin
 RG_ESTADO.ItemIndex := 0;
 StrSql := 'delete from tbl_produto';
 StrSql := StrSql + ' where cod_pro = ' + edtCodigo.Text;
 ExecutaSqlTemp(StrSql);
end;

procedure TF_CAD_PROD.ExecutaSql(AValue: String);
begin
  QryProd.Close;
  QryProd.SQL.Clear;
  QryProd.SQL.Add(StrSql);
  QryProd.Open;
end;

procedure TF_CAD_PROD.ExecutaSqlTemp(AValue: String);
begin
  QueryTemp.Close;
  QueryTemp.SQL.Clear;
  QueryTemp.SQL.Add(StrSql);
  QueryTemp.ExecSQL;
end;

procedure TF_CAD_PROD.HabilitaBotoes;
begin
  RG_ESTADO.ItemIndex := 1;
  EdtCodigo.Enabled   := False;
  EdtNome.Enabled     := False;
  EdtValor.Enabled    := False;
  DBGrid1.Enabled     := True;
  btnIncluir.Enabled  := True;
  btnAlterar.Enabled  := True;
  btnExcluir.Enabled  := True;
  btnOK.Enabled       := False;
  btnCancelar.Enabled := False;
end;

procedure TF_CAD_PROD.IncluiRegistro;
begin
  if ValidaInclusao(edtCodigo.Text) then
  begin
    StrSql := 'insert into TBL_PRODUTO(COD_PRO, NOME, VALOR) values (';
    StrSql := StrSql + QuotedStr(edtCodigo.Text) + ', ';
    StrSql := StrSql + QuotedStr(edtNome.Text) + ', ';
    StrSql := StrSql + EdtValor.Text + ');';
    ExecutaSqlTemp(StrSql);
    ListaTodos;
    HabilitaBotoes;
  end;
end;

procedure TF_CAD_PROD.LimpaTela;
begin
  edtCodigo.Text := EmptyStr;
  edtNome.Text   := EmptyStr;
  EdtValor.Text  := '0,00';
end;

procedure TF_CAD_PROD.ListaTodos;
begin
  StrSql := 'select * from tbl_produto order by cod_pro';
  ExecutaSql(StrSql);
  LimpaTela;
end;

procedure TF_CAD_PROD.PopulaComponentes;
begin
  if (QryProd.Active) and (QryProd.RecordCount  > 0) then
  begin
    edtCodigo.Text := IntToStr(QryProd.FieldByName('cod_pro').AsInteger);
    edtNome.Text   := QryProd.FieldByName('nome').AsString;
    EdtValor.Text  := FormatFloat('#,##0.00', QryProd.FieldByName('valor').AsFloat);
  end;
end;

function TF_CAD_PROD.ValidaCampos: Boolean;
begin
  if Trim(edtCodigo.Text) = EmptyStr then
  begin
    mensagem:='o campo [Código] deve ser preenchido.';
    Application.MessageBox(PChar(mensagem),'Informação',MB_OK + MB_ICONERROR);
    edtCodigo.SetFocus;
    Result := False;
  end;

  if Trim(edtNome.Text) = EmptyStr then
  begin
    mensagem:='o campo [Nome] deve ser preenchido.';
    Application.MessageBox(PChar(mensagem),'Informação',MB_OK + MB_ICONERROR);
    edtNome.SetFocus;
    Result := False;
  end;

  if StrToFloatDef(EdtValor.Text, 0) <= 0 then
  begin
    mensagem:='o campo [Valor] deve ser preenchido.';
    Application.MessageBox(PChar(mensagem),'Informação',MB_OK + MB_ICONERROR);
    EdtValor.SetFocus;
    Result := False;
  end;
end;

function TF_CAD_PROD.ValidaExclusao(ACodigo: String): Boolean;
begin
  StrSql := 'select * from tbl_forpro where cod_pro = ' + QuotedStr(ACodigo);
  ExecutaSql(StrSql);

  if (QueryTemp.RecordCount > 0) then
  begin
    mensagem:='Fornecedor possui produtos relacionados. Exclusao não permitida.';
    Application.MessageBox(PChar(mensagem),'Informação',MB_OK + MB_ICONERROR);
    edtCodigo.SetFocus;
    ListaTodos;
    Result := False;
  end;
end;

function TF_CAD_PROD.ValidaInclusao(ACodigo: String): Boolean;
begin
  if (not ValidaCampos) then
  begin
    Result := False;
    Exit;
  end;

  StrSql := 'select * from tbl_produto where cod_pro = ' + QuotedStr(ACodigo);
  ExecutaSql(StrSql);

  if (QryProd.RecordCount > 0) then
  begin
    mensagem:='Ja possui um produto com esse codigo informado.';
    Application.MessageBox(PChar(mensagem),'Informação',MB_OK + MB_ICONERROR);
    edtCodigo.SetFocus;
    Result := False;
  end;
end;

procedure TF_CAD_PROD.btnIncluirClick(Sender: TObject);
begin
  LimpaTela();
  RG_ESTADO.ItemIndex := 1;
  DesabilitaBotoes;
  FocusControl(EdtCodigo);
end;

procedure TF_CAD_PROD.btnAlterarClick(Sender: TObject);
begin
  RG_ESTADO.ItemIndex := 2;
  DesabilitaBotoes;
  FocusControl(edtNome);
end;

procedure TF_CAD_PROD.btnExcluirClick(Sender: TObject);
var
  confExcl : integer;
begin
  beep;
  confExcl:= Application.MessageBox('Confima a Exclusão ?','Atenção',MB_YESNO + MB_DEFBUTTON1 + MB_ICONINFORMATION);
  if confExcl = IDYES then
  begin
    ExcluiRegistro;
    ListaTodos;
  end;
end;

procedure TF_CAD_PROD.btnOKClick(Sender: TObject);
begin
  if RG_ESTADO.ItemIndex = 0 then
  begin
    Abort;
  end;

  if RG_ESTADO.ItemIndex = 1 then
  begin
    IncluiRegistro;
  end;
  if RG_ESTADO.ItemIndex = 2 then
  begin
    AlteraRegistro;
  end;
end;

procedure TF_CAD_PROD.btnCancelarClick(Sender: TObject);
begin
  RG_ESTADO.ItemIndex := 0;
  LimpaTela;
  HabilitaBotoes;
end;

procedure TF_CAD_PROD.FormShow(Sender: TObject);
begin
  ListaTodos();
  HabilitaBotoes;
end;

end.

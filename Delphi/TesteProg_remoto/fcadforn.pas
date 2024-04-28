unit fcadforn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Db, DBTables;

type
  TF_CAD_FORN = class(TForm)
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    RG_ESTADO: TRadioGroup;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    btnOK: TButton;
    btnCancelar: TButton;
    qryFornerc: TQuery;
    dsFornec: TDataSource;
    QueryTemp: TQuery;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure dsFornecDataChange(Sender: TObject; Field: TField);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
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

    function GeraID: Integer;
    function ValidaCampos: Boolean;
    function ValidaInclusao(ACodigo: Integer): Boolean;
    function ValidaExclusao(ACodigo: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  F_CAD_FORN: TF_CAD_FORN;

implementation

{$R *.DFM}

procedure TF_CAD_FORN.ExecutaSqlTemp(AValue: String);
begin
  QueryTemp.Close;
  QueryTemp.SQL.Clear;
  QueryTemp.SQL.Add(StrSql);
  QueryTemp.ExecSQL;
end;

procedure TF_CAD_FORN.ExecutaSql(AValue: String);
begin
  qryFornerc.Close;
  qryFornerc.SQL.Clear;
  qryFornerc.SQL.Add(StrSql);
  qryFornerc.Open;
end;

procedure TF_CAD_FORN.ListaTodos;
begin
  StrSql := 'select * from tbl_fornec order by cod_for';
  ExecutaSql(StrSql);
  LimpaTela;
end;

procedure TF_CAD_FORN.PopulaComponentes;
begin
  if (qryFornerc.Active) and (qryFornerc.RecordCount  > 0) then
  begin
    edtCodigo.Text := IntToStr(qryFornerc.FieldByName('cod_for').AsInteger);
    edtNome.Text   := qryFornerc.FieldByName('nome').AsString;
  end;
end;
procedure TF_CAD_FORN.FormShow(Sender: TObject);
begin
  ListaTodos;
end;

procedure TF_CAD_FORN.DBGrid1CellClick(Column: TColumn);
begin
  PopulaComponentes;
end;

procedure TF_CAD_FORN.dsFornecDataChange(Sender: TObject; Field: TField);
begin
  btnIncluir.enabled := qryFornerc.Active;
  btnAlterar.enabled := (qryFornerc.Active) and (qryFornerc.RecordCount > 0);
  btnExcluir.enabled := (qryFornerc.Active) and (qryFornerc.RecordCount > 0);
end;

procedure TF_CAD_FORN.LimpaTela;
begin
  edtCodigo.Text := EmptyStr;
  edtNome.Text   := EmptyStr;
end;

function TF_CAD_FORN.GeraID: Integer;
begin
  StrSql := 'select max(cod_for) as id from tbl_fornec';
  QueryTemp.Close;
  QueryTemp.SQL.Clear;
  QueryTemp.SQL.Add(StrSql);
  QueryTemp.Open;
  Result := QueryTemp.FieldByName('id').AsInteger  + 1;
end;


function TF_CAD_FORN.ValidaInclusao(ACodigo: Integer): Boolean;
begin
  if (not ValidaCampos) then
  begin
    Result := False;
    Exit;
  end;

  StrSql := 'select * from tbl_fornec where cod_for = ' + IntToStr(ACodigo);
  ExecutaSql(StrSql);

  if (qryFornerc.RecordCount > 0) then
  begin
    mensagem:='Ja possui um fonecedor com esse codigo informado.';
    Application.MessageBox(PChar(mensagem),'Informação',MB_OK + MB_ICONERROR);
    edtCodigo.SetFocus;
    ListaTodos;
    Result := False;
  end;
end;

function TF_CAD_FORN.ValidaCampos: Boolean;
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
end;

procedure TF_CAD_FORN.btnIncluirClick(Sender: TObject);
begin
  edtCodigo.Text      := IntToStr(GeraID);
  edtNome.Text        :=  EmptyStr;
  RG_ESTADO.ItemIndex := 1;
  DesabilitaBotoes;
  FocusControl(edtNome);
end;

procedure TF_CAD_FORN.IncluiRegistro;
begin
  if ValidaInclusao(StrToIntDef(edtCodigo.Text, 0)) then
  begin
    StrSql := 'insert into TBL_FORNEC(COD_FOR, NOME) values (';
    StrSql := StrSql + edtCodigo.Text + ', ' ;
    StrSql := StrSql + QuotedStr(edtNome.Text) + ');';
    ExecutaSqlTemp(StrSql);
    ListaTodos;
    HabilitaBotoes;
  end;
end;

procedure TF_CAD_FORN.btnAlterarClick(Sender: TObject);
begin
  RG_ESTADO.ItemIndex := 2;
  DesabilitaBotoes;
  FocusControl(edtNome);
end;

procedure TF_CAD_FORN.AlteraRegistro;
begin
 StrSql := 'update TBL_FORNEC set nome = ' + QuotedStr(edtNome.Text);
 StrSql := StrSql + ' where COD_FOR = ' + edtCodigo.Text;
 ExecutaSqlTemp(StrSql);
 ListaTodos;
 HabilitaBotoes;
end;

procedure TF_CAD_FORN.ExcluiRegistro;
begin
 RG_ESTADO.ItemIndex := 0;
 StrSql := 'delete from TBL_FORNEC';
 StrSql := StrSql + ' where COD_FOR = ' + edtCodigo.Text;
 ExecutaSqlTemp(StrSql);
end;

procedure TF_CAD_FORN.btnExcluirClick(Sender: TObject);
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

procedure TF_CAD_FORN.Habilitabotoes;
begin
  RG_ESTADO.ItemIndex := 1;
  EdtCodigo.Enabled   := False;
  EdtNome.Enabled     := False;
  DBGrid1.Enabled     := True;
  btnIncluir.Enabled  := True;
  btnAlterar.Enabled  := True;
  btnExcluir.Enabled  := True;
  btnOK.Enabled       := False;
  btnCancelar.Enabled := False;
end;

procedure TF_CAD_FORN.DesabilitaBotoes;
begin
  DBGrid1.Enabled     := False;
  EdtCodigo.Enabled   := True;
  EdtNome.Enabled     := True;
  btnIncluir.Enabled  := False;
  btnAlterar.Enabled  := False;
  btnExcluir.Enabled  := False;
  btnOK.Enabled       := True;
  btnCancelar.Enabled := True;
end;

procedure TF_CAD_FORN.btnCancelarClick(Sender: TObject);
begin
  RG_ESTADO.ItemIndex := 0;
  LimpaTela;
  HabilitaBotoes;
end;

procedure TF_CAD_FORN.btnOKClick(Sender: TObject);
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

function TF_CAD_FORN.ValidaExclusao(ACodigo: Integer): Boolean;
begin
  StrSql := 'select * from tbl_forpro where cod_for = ' + IntToStr(ACodigo);
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

end.

unit FMENURLFOPR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TF_MENU_RL_FOPR = class(TForm)
    btnGerarRelatorio: TButton;
    procedure btnGerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_MENU_RL_FOPR: TF_MENU_RL_FOPR;

implementation

uses frlfopr;

{$R *.dfm}

procedure TF_MENU_RL_FOPR.btnGerarRelatorioClick(Sender: TObject);
var
  StrSql: String;
begin
  if application.FindComponent('F_RL_FOPR') = nil then
      Application.CreateForm(TF_RL_FOPR, F_RL_FOPR);
  try
    StrSql := ' select rel.cod_for,  forn.nome';
    StrSql := StrSql + ' from tbl_forpro rel, tbl_fornec forn';
    StrSql := StrSql + ' where rel.cod_for = forn.cod_for';
    StrSql := StrSql + ' group by rel.cod_for, forn.nome';

    F_RL_FOPR.QryFornec.Close;
    F_RL_FOPR.QryFornec.SQL.Clear;
    F_RL_FOPR.QryFornec.SQL.Add(StrSql);
    F_RL_FOPR.QryFornec.Open;

    F_RL_FOPR.QuickRep1.Preview;
  finally
    F_RL_FOPR.Free;
  end;
end;

end.

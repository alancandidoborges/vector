program TesteProg;

uses
  Forms,
  fmenu in 'fmenu.pas' {F_MENU},
  fcadforn in 'fcadforn.pas' {F_CAD_FORN},
  fcadprod in 'fcadprod.pas' {F_CAD_PROD},
  frelfopr in 'frelfopr.pas' {F_REL_FOPR},
  frlfopr in 'frlfopr.pas' {F_RL_FOPR},
  fincrelfopr in 'fincrelfopr.pas' {F_INC_REL_FOPR},
  FMENURLFOPR in 'FMENURLFOPR.pas' {F_MENU_RL_FOPR};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TF_MENU, F_MENU);

  Application.Run;
end.

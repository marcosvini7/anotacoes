program Project1;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {form_principal},
  uAnotacao in 'uAnotacao.pas' {form_anotacao},
  uPesquisa in 'uPesquisa.pas' {form_pesquisa},
  uAnotacaoClass in 'classes\uAnotacaoClass.pas',
  uConfirmar in 'uConfirmar.pas' {form_confirmar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tform_principal, form_principal);
  Application.Run;
end.

unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tform_pesquisa = class(TForm)
    edit_pesquisa: TEdit;
    Label1: TLabel;
    btn_pesquisa: TButton;
    procedure btn_pesquisaClick(Sender: TObject);
    procedure edit_pesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_pesquisa: Tform_pesquisa;

implementation

{$R *.dfm}

uses uPrincipal;

procedure Tform_pesquisa.edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Mgs: TMsg;
begin
  case Key of
    VK_RETURN :
    begin
      PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
      btn_pesquisa.Click;
    end;
  end;
end;

procedure Tform_pesquisa.btn_pesquisaClick(Sender: TObject);
var i : integer;
var quantidade, index : integer;
var decrementar : boolean;
begin
  form_principal.memo_anotacoes.Clear;
  quantidade := 0;
  decrementar := true;
  index := form_principal.posicao - 1;
  for i := form_principal.posicao - 1 downto 0 do
  begin
    if(form_principal.anotacoes[i].Contains(edit_pesquisa.Text)) then
    begin
      form_principal.memo_anotacoes.Lines.Add(form_principal.anotacoes[i]);
      inc(quantidade);
      decrementar := false;
    end;
    if(decrementar) then
      dec(index);
  end;

  if(quantidade = 1) then
  begin
    form_principal.Image6.Enabled := true;
    form_principal.Image7.Enabled := true;
    form_principal.indice := index;
  end
  else
  begin
    form_principal.Image6.Enabled := false;
    form_principal.Image7.Enabled := false;
  end;

  close;
end;

end.

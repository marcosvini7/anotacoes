unit uConfirmar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tform_confirmar = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_confirmar: Tform_confirmar;

implementation

{$R *.dfm}

uses uPrincipal;

procedure Tform_confirmar.Button1Click(Sender: TObject);
var f : TextFile;
var i : integer;
begin

  AssignFile(f, 'C:\Anotacoes\dados.txt');
  Rewrite(f);
  Append(f);
  if (Label1.Caption = 'Deseja realmente apagar todas as anotações?') then
  begin
    for i := 0 to form_principal.posicao - 1 do
    begin
      form_principal.anotacoes[i] := '';
    end;
  end
  else
    form_principal.anotacoes[form_principal.indice] := '';
    for i := 0 to form_principal.posicao - 1 do
    begin
      if (form_principal.anotacoes[i] <> '') then
      begin
        Writeln(f, form_principal.anotacoes[i]);
        Writeln(f, '-----');
      end;
    end;
  begin

  end;

  form_principal.memo_anotacoes.Clear;
  closeFile(f);
  close;
end;

procedure Tform_confirmar.Button2Click(Sender: TObject);
begin
  close;
end;

end.

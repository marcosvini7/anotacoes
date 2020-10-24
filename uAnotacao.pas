unit uAnotacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAnotacaoClass;

type
  Tform_anotacao = class(TForm)
    Label1: TLabel;
    edit_titulo: TEdit;
    Label3: TLabel;
    btn_salvar: TButton;
    memo_anotacao: TMemo;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_anotacao: Tform_anotacao;
  anotacao : TAnotacao;
implementation

{$R *.dfm}

uses uPrincipal;

procedure Tform_anotacao.btn_salvarClick(Sender: TObject);
  var f : TextFile;
  a : Integer;
  var anotacao : TAnotacao;
begin
  if(Trim(edit_titulo.Text) <> '') and (Trim(memo_anotacao.Text) <> '') then
    begin
    anotacao := TAnotacao.Create();
    anotacao.titulo := edit_titulo.Text;
    anotacao.anotacao := memo_anotacao.Text;
    AssignFile(f,'c:\Anotacoes\dados.txt');

    if(form_principal.indice = - 1) then
    begin
      Append(f);
      Writeln(f, anotacao.estruturar());
      Writeln(f, '-----');
      form_principal.anotacoes[form_principal.posicao] := anotacao.estruturar();
      form_principal.memo_anotacoes.Clear;
      form_principal.memo_anotacoes.Lines.Insert(0, anotacao.estruturar());
      inc(form_principal.posicao);
    end
    else
    begin
      form_principal.anotacoes[form_principal.indice] := anotacao.estruturar();
      rewrite(f);
      Append(f);
      for a := 0 to form_principal.posicao - 1 do
      begin
        Writeln(f, form_principal.anotacoes[a]);
        Writeln(f, '-----');
      end;
      form_principal.memo_anotacoes.Clear;
      form_principal.memo_anotacoes.Lines.Insert(0, anotacao.estruturar());

    end;

    anotacao.Free;
    Closefile(f);
    close;
    end;
end;

procedure Tform_anotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form_principal.indice := -1;
end;

procedure Tform_anotacao.FormCreate(Sender: TObject);
var n : integer;
var text : string;
begin
  if(form_principal.indice <> -1) then
  begin
    n :=  form_principal.anotacoes[form_principal.indice].Length - 116 - 113;
    text := form_principal.anotacoes[form_principal.indice].subString(0, n);
    self.caption := 'Editando Anotação';
    self.memo_anotacao.Lines.Add(text);
  end;
end;

end.

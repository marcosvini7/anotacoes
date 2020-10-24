unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uAnotacao, Vcl.DBCtrls, Vcl.Imaging.pngimage;

type
  Tform_principal = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    memo_anotacoes: TMemo;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Image7MouseEnter(Sender: TObject);
    procedure Image8MouseEnter(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    anotacoes : array[0..999] of string;
    posicao : integer;
    indice : integer;
  end;

var
  form_principal: Tform_principal;
  form_anotacao : Tform_anotacao;

implementation

{$R *.dfm}

uses uPesquisa, uConfirmar;

procedure ScrollMemo(Memo: TMemo; Direction: Integer);
var
  ScrollMessage: TWMVScroll;
  I: Integer;
begin
  ScrollMessage.Msg := WM_VSCROLL;
  Memo.Lines.BeginUpdate;
  try
    for I := 0 to Memo.Lines.Count do
    begin
     ScrollMessage.ScrollCode := Direction;
     ScrollMessage.Pos := 0;
     Memo.Dispatch(ScrollMessage);
    end;
  finally
    Memo.Lines.EndUpdate;
  end;
end;

procedure Tform_principal.FormCreate(Sender: TObject);
var
  f : TextFile;
  linha, prox: string;
  existe : boolean;
  i : integer;
begin
  existe := true;
  posicao := 0;
  indice := -1;
  try
    if not FileExists('C:\Anotacoes\dados.txt') then
    begin
      createDir('C:\Anotacoes');
      rewrite(f, 'C:\Anotacoes\dados.txt');
      existe := false;
    end
  Finally
  end;

  if(existe) then
  begin
    AssignFile(f, 'C:\Anotacoes\dados.txt');
    Reset(f);
    while not eof(f) do
    begin
      readln(f, linha);

      if(linha <> '-----') then
      begin
        anotacoes[posicao] := anotacoes[posicao] + linha;
      end
      else
        inc(posicao);
        anotacoes[posicao] := Trim(anotacoes[posicao]) + #13#10;
    end;

    for i := posicao - 1 downto 0 do
    begin
      memo_anotacoes.lines.Add(anotacoes[i]);
    end;
  end;

  freeAndNil(anotacao);
  closeFile(f);
end;

procedure Tform_principal.Image1Click(Sender: TObject);
begin
  indice := -1;
  form_anotacao := Tform_anotacao.Create(self);
  form_anotacao.ShowModal;
  form_anotacao.Release;
  Image6.Enabled := false;
  Image7.Enabled := false;
end;

procedure Tform_principal.Image1MouseEnter(Sender: TObject);
begin
  Image1.ShowHint := true;
end;

procedure Tform_principal.Image2Click(Sender: TObject);
begin
  form_pesquisa := Tform_pesquisa.Create(self);
  form_pesquisa.ShowModal;
  form_pesquisa.Release;

end;

procedure Tform_principal.Image2MouseEnter(Sender: TObject);
begin
  Image2.ShowHint := true;
end;

procedure Tform_principal.Image3Click(Sender: TObject);
var i : integer;
begin
  memo_anotacoes.Clear;
  for i := posicao - 1 downto 0 do
  begin
    if(anotacoes[i] <> '') then
      memo_anotacoes.lines.Add(Trim(anotacoes[i]) + #13#10);
  end;
  ScrollMemo(memo_anotacoes, SB_LINEUP);

  Image6.Enabled := false;
  Image7.Enabled := false;
end;

procedure Tform_principal.Image3MouseEnter(Sender: TObject);
begin
  Image3.ShowHint := true;
end;

procedure Tform_principal.Image4Click(Sender: TObject);
begin
    ScrollMemo(memo_anotacoes, SB_LINEUP);
end;

procedure Tform_principal.Image4MouseEnter(Sender: TObject);
begin
  Image4.ShowHint := true;
end;

procedure Tform_principal.Image5Click(Sender: TObject);
begin
   ScrollMemo(memo_anotacoes, SB_LINEDOWN);
end;

procedure Tform_principal.Image5MouseEnter(Sender: TObject);
begin
  Image5.ShowHint := true;
end;

procedure Tform_principal.Image6Click(Sender: TObject);
begin
  form_anotacao := Tform_anotacao.Create(self);
  form_anotacao.ShowModal;
  form_anotacao.Release;
end;

procedure Tform_principal.Image6MouseEnter(Sender: TObject);
begin
  Image6.ShowHint := true;
end;

procedure Tform_principal.Image7Click(Sender: TObject);
begin
  form_confirmar := Tform_confirmar.create(self);
  form_confirmar.Label1.Caption := 'Deseja realmente apagar esta anotação?';
  form_confirmar.showModal;
  form_confirmar.Release;
end;

procedure Tform_principal.Image7MouseEnter(Sender: TObject);
begin
  Image7.ShowHint := true;
end;

procedure Tform_principal.Image8Click(Sender: TObject);
begin
  if anotacoes[posicao - 1] <> '' then
  begin
    form_confirmar := Tform_confirmar.create(self);
    form_confirmar.Label1.Caption := 'Deseja realmente apagar todas as anotações?';
    form_confirmar.showModal;
    form_confirmar.Release;
  end;
end;

procedure Tform_principal.Image8MouseEnter(Sender: TObject);
begin
  Image8.ShowHint := true;
end;

end.



object form_pesquisa: Tform_pesquisa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pesquisar Anota'#231#227'o'
  ClientHeight = 121
  ClientWidth = 403
  Color = 13619199
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 332
    Height = 23
    Caption = 'Pesquise por trechos de anota'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object edit_pesquisa: TEdit
    Left = 8
    Top = 60
    Width = 289
    Height = 27
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = edit_pesquisaKeyDown
  end
  object btn_pesquisa: TButton
    Left = 310
    Top = 60
    Width = 75
    Height = 29
    Caption = 'Buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_pesquisaClick
  end
end

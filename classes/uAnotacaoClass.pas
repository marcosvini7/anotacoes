unit uAnotacaoClass;

interface
  uses System.SysUtils;

  type
    TAnotacao = class
  public
    titulo : string;
    anotacao : string;
    function estruturar() : string;
  end;

implementation
  {
  function TAnotacao.estruturar() : string;
  begin
    estruturar := '_______________ ' + titulo + ' _______________' +
      #13#10 + anotacao + #13#10;
  end;
  }
  function TAnotacao.estruturar() : string;
  begin
    titulo := Trim(titulo);
    anotacao := Trim(anotacao);
    estruturar := titulo + #13#10#13#10 + anotacao + #13#10 +
    '                                          ' +
    '                                          Em ' + DateToStr(Date) +
    ' às ' + TimeToStr(Time) + #13#10 +
    ' - - - - - - - - - - - - - - - - - - - - -'
    + ' - - - - - - - - - - - - - - - - - - - - - - - - - - -'
    + ' - - - - - - - - - -';
  end;
end.

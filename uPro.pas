unit uPro;

interface
  uses
    uFrmPrincipal, uInter, uPais;
  type
    Programa = class
  private
    umFrmPrincipal: TFrmPrincipal;
    umaInter: Interfaces;
    umPais: Pais;
  public
    constructor crieObjeto;
    destructor destruaSe;
    
    procedure executeSe;
  end;
implementation

{ Programa }

constructor Programa.crieObjeto;
begin
  self.umFrmPrincipal := TFrmPrincipal.Create(nil);
  self.umaInter       := Interfaces.crieObjeto;
  self.umPais         := Pais.crieObjeto;
end;

destructor Programa.destruaSe;
begin
  self.umFrmPrincipal.FreeOnRelease;
  self.umaInter.destruaSe;
  self.umPais.destruaSe;
end;

procedure Programa.executeSe;
begin
  umFrmPrincipal.conhecaObjeto(umaInter, umPais);
  umFrmPrincipal.ShowModal;
end;

end.

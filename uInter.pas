unit uInter;

interface
  uses
    uController, uFrmConsultarPais, uPais;
  type
    Interfaces = class
  private
    umaController: Controller;
    umFrmConsultarPais: TFrmConsultarPais;
  public
    constructor crieObjeto;
    destructor destruaSe;
    
    procedure pesquisarPais(vPais: Pais);
  end;
implementation

{ Interfaces }

constructor Interfaces.crieObjeto;
begin
  self.umaController      := Controller.crieObjeto;
  self.umFrmConsultarPais := TFrmConsultarPais.Create(nil);
end;

destructor Interfaces.destruaSe;
begin
  self.umFrmConsultarPais.FreeOnRelease;
  
  if Assigned(umaController) then
    self.umaController.destruaSe;
end;

procedure Interfaces.pesquisarPais(vPais: Pais);
begin
  umFrmConsultarPais.Caption := 'Pesquisar País';
  umFrmConsultarPais.conhecaObjeto(umaController, vPais);
  umFrmConsultarPais.ShowModal;
end;

end.

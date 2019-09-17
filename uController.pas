unit uController;

interface
  uses
    Data.DB, uDAOPais, uDM, uPais;
  type
    Controller = class
  private
    umDM: TDM;
    umaDAOPais: DAOPais;
  public
    constructor crieObjeto;
    destructor destruaSe;
    
    function carregarPais(vPais: Pais): Boolean;
    function excluirPais(vPais: Pais): Boolean;
    function getDataSource_Pais: TDataSource;
    function salvarPais(vPais: Pais): Boolean;
    procedure pesquisarPais(vChave: String);
  end;
implementation

{ Controller }

constructor Controller.crieObjeto;
begin
  self.umDM       := TDM.Create(nil);
  self.umaDAOPais := DAOPais.crieObjeto(umDM);
end;

destructor Controller.destruaSe;
begin
  self.umaDAOPais.destruaSe;
  
  if Assigned(umDM) then
    self.umDM.FreeOnRelease;
end;

function Controller.carregarPais(vPais: Pais): Boolean;
begin
  umaDAOPais.setUmDM(umDM);
  result := umaDAOPais.carregarObjeto(vPais);
end;

function Controller.excluirPais(vPais: Pais): Boolean;
begin
  umaDAOPais.setUmDM(umDM);
  result := umaDAOPais.excluirPais(vPais);
end;

function Controller.getDataSource_Pais: TDataSource;
begin
  result := umDM.DataSource_Pais;
end;

function Controller.salvarPais(vPais: Pais): Boolean;
begin
  umaDAOPais.setUmDM(umDM);
  result := umaDAOPais.salvarPais(vPais);
end;

procedure Controller.pesquisarPais(vChave: String);
begin
  umaDAOPais.setUmDM(umDM);
  umaDAOPais.pesquisarObjeto(vChave);
end;

end.

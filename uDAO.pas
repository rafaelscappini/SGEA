unit uDAO;

interface
  uses
    uDM;
  type
    DAO = class
  private
    umDM: TDM;
  public
    constructor crieObjeto(vUmDM: TDM);
    destructor destruaSe;
    
    function getUmDM: TDM;
    
    procedure setUmDM(vUmDM: TDM);
  end;
implementation

{ DAO }

constructor DAO.crieObjeto(vUmDM: TDM);
begin
  if Assigned(vUmDM) then
    self.umDM := vUmDM
  else
    self.umDM := TDM.Create(nil);
end;

destructor DAO.destruaSe;
begin
  if Assigned(umDM) then
    self.umDM.FreeOnRelease;
end;

function DAO.getUmDM: TDM;
begin
  result := umDM;
end;

procedure DAO.setUmDM(vUmDM: TDM);
begin
  self.umDM := vUmDM;
end;

end.

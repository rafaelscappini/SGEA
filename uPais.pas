unit uPais;

interface
  uses
    uPai;
  type
    Pais = class(Pai)
  private
    nome, sigla: String;
    ddi: Integer;
  public
    constructor crieObjeto;
    destructor destruaSe;
    
    function getDDI: Integer;
    function getNome: String;
    function getSigla: String;
    
    procedure setDDI(vDDI: Integer);
    procedure setNome(vNome: String);
    procedure setSigla(vSigla: String);
  end;
implementation

{ Pais }

constructor Pai.crieObjeto;
begin
  inherited;
    self.nome  := '';
    self.sigla := '';
    self.ddi   := 0;
end;

destructor destruaSe;
begin
  // Nada a implementar
  inherited;
end;

function Pai.getDDI: Integer;
begin
  result := ddi;
end;

function Pai.getNome: String;
begin
  result := nome;
end;

function Pai.getSigla: String;
begin
  result := sigla;
end;

procedure Pai.setDDI(vDDI: Integer);
begin
  self.ddi := vDDI;
end;

procedure Pai.setNome(vNome: String);
begin
  self.nome := vNome;
end;

procedure Pai.setSigla(vSigla: String);
begin
  self.sigla := vSigla;
end;

end.

unit uEstado;

interface
  uses
    uPai, uPais;
  type
    Estado = class(Pai)
  private
    nome, uf: String;
    umPais: Pais;
  public
    constructor crieObjeto;
    destructor destruaSe;
    
    function getNome: String;
    function getUF: String;
    function getUmPais: Pais;
    
    procedure setNome(vNome: String);
    procedure setUF(vUF: String);
    procedure setUmPais(vUmPais: Pais);
  end;
implementation

{ Estado }

constructor Estado.crieObjeto;
begin
  inherited;
    self.nome   := '';
    self.uf     := '';
    self.umPais := Pais.crieObjeto;
end;

destructor Estado.destruaSe;
begin
  if Assigned(umPais) then
    self.umPais.destruaSe;
  inherited;
end;

function Estado.getNome: String;
begin
  result := nome;
end;

function Estado.getUF: String;
begin
  result := uf;
end;

function Estado.getUmPais: Pais;
begin
  result := umPais;
end;

procedure Estado.setNome(vNome: String);
begin
  self.nome := vNome;
end;

procedure Estado.setUF(vUF: String);
begin
  self.uf := vUF;
end;

procedure Estado.setUmPais(vUmPais: Pais);
begin
  self.umPais := vUmPais;
end;

end.

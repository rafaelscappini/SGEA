unit uPai;

interface
  uses
    System.SysUtils;
  type
    Pai = class
  private
    codigo: Integer;
    data_cadastro, data_alteracao: TDateTime;
  public
    constructor crieObjeto;
    destructor destruaSe;
    
    function getCodigo: Integer;
    function getData_Alteracao: TDateTime;
    function getData_Cadastro: TDateTime;
    
    procedure setCodigo(vCodigo: Integer);
    procedure setData_Alteracao(vData_Alteracao: TDateTime);
    procedure setData_Cadastro(vData_Cadastro: TDateTime);
  end;
implementation

{ Pai }

constructor Pai.crieObjeto;
begin
  self.codigo         := 0;
  self.data_cadastro  := now;
  self.data_alteracao := now;
end;

destructor Pai.destruaSe;
begin
  // Nada a implementar
end;

function Pai.getCodigo: Integer;
begin
  result := codigo;
end;

function Pai.getData_Alteracao: TDateTime;
begin
  result := data_alteracao;
end;

function Pai.getData_cadastro: TDateTime;
begin
  result := data_cadastro;
end;

procedure Pai.setCodigo(vCodigo: Integer);
begin
  self.codigo := vCodigo;
end;

procedure Pai.setData_Alteracao(vData_Alteracao: TDateTime);
begin
  self.data_alteracao := vData_Alteracao;
end;

procedure Pai.setData_Cadastro(vData_Cadastro: TDateTime);
begin
  self.data_cadastro := vData_Cadastro;
end;

end.

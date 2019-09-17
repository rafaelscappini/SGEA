unit uDAOPais;

interface
  uses
    System.SysUtils, uDAO, uDM, uPais, VCL.Dialogs;
  type
    DAOPais = class(DAO)
  private
    // Nada a declarar
  public
    constructor crieObjeto(vUmDM: TDM);
    destructor destruaSe;
    
    function carregarObjeto(var vPais: Pais): Boolean;
    function excluirObjeto(vPais: Pais): Boolean;
    function salvarObjeto(vPais: Pais): Boolean;
    function validarObjeto(vPais: Pais; vMensagem: Boolean): Boolean;
    
    procedure pesquisarObjeto(vChave: String);
  end;
implementation

{ DAOPais }

constructor DAOPais.crieObjeto(vUmDM: TDM);
begin
  inherited;
    // Nada a implementar
end;

destructor DAOPais.destruaSe;
begin
  // Nada a implementar
  inherited;
end;

function DAOPais.carregarObjeto(var vPais: Pais): Boolean;
begin
  result := false;

  try
    if (vPais.getCodigo <> 0) then begin
      getUmDM.IBDataSet_Pais.Close;
      getUmDM.IBDataSet_Pais.SelectSQL.Clear;
      getUmDM.IBDataSet_Pais.SelectSQL.Add('SELECT * FROM PAIS');
    end;
    
    if not (getUmDM.IBDataSet_Pais.Active) then
      getUmDM.IBDataSet_Pais.Open;
    
    vPais.setCodigo(getUmDM.IBDataSet_PaisIDPAIS.AsInteger);
    vPais.setNome(getUmDM.IBDataSet_PaisNOME.AsString);
    vPais.setSigla(getUmDM.IBDataSet_PaisSIGLA.AsString);
    vPais.setDDI(getUmDM.IBDataSet_PaisDDI.AsInteger);
    vPais.setData_Cadastro(getUmDM.IBDataSet_PaisDATA_CADASTRO.AsDateTime);
    vPais.setData_Alteracao(getUmDM.IBDataSet_PaisDATA_ALTERACAO.AsDateTime);
    
    result := true;
  except
    on E: Exception do begin
      ShowMessage('Erro ao carregar o país: ' + E.Message);
      result := false;
    end;
  end;
end;

function DAOPais.excluirObjeto(vPais: Pais): Boolean;
begin
  result := false;

  try
    if not (getUmDM.IBTransaction.Active) then
      getUmDM.IBTransaction.StartTransaction;
      
    if not (getUmDM.IBDataSet_Pais.Active) then
      getUmDM.IBDataSet_Pais.Open;
      
    if ((vPais.getCodigo > 0) and (self.validarObjeto(vPais, false) = true)) then
      getUmDM.IBDataSet_Pais.Delete;
    
    getUmDM.IBTransaction.CommitRetaining;
    
    result := true;
  except
    on E: Exception do begin
      getUmDM.IBTransaction.Rollback;
      ShowMessage('Erro ao excluir o país: ' + E.Message);
      result := false;
    end;
  end;
end;

function DAOPais.salvarObjeto(vPais: Pais): Boolean;
begin
  result := false;
  
  try
    if not (getUmDM.IBTransaction.Active) then
      getUmDM.IBTransaction.StartTransaction;
      
    if not (getUmDM.IBDataSet_Pais.Active) then
      getUmDM.IBDataSet_Pais.Open;
      
    if ((vPais.getCodigo = 0) and (self.validarObjeto(vPais, true) = false)) then
      getUmDM.IBDataSet_Pais.Insert
    else if ((vPais.getCodigo > 0) and (self.validarObjeto(vPais, false) = true)) then
      getUmDM.IBDataSet_Pais.Edit;
    
    getUmDM.IBDataSet_PaisNOME.AsString             := vPais.getNome;
    getUmDM.IBDataSet_PaisSIGLA.AsString            := vPais.getSigla;
    getUmDM.IBDataSet_PaisDDI.AsInteger             := vPais.getDDI;
    getUmDM.IBDataSet_PaisDATA_CADASTRO.AsDateTime  := vPais.getData_Cadastro;
    getUmDM.IBDataSet_PaisDATA_ALTERACAO.AsDateTime := vPais.getData_Alteracao;
    
    getUmDM.IBDataSet_Pais.Post;
    getUmDM.IBTransaction.CommitRetaining;
    
    result := true;
  except
    on E: Exception do begin
      getUmDM.IBTransaction.Rollback;
      ShowMessage('Erro ao salvar o país: ' + E.Message);
      result := false;
    end;
  end;
end;

function DAOPais.validarObjeto(vPais: Pais; vMensagem: Boolean): Boolean;
begin
  result := false;
  
  try
    if not (getUmDM.IBDataSet_Pais.Active) then
      getUmDM.IBDataSet_Pais.Open;
      
    if (getUmDM.IBDataSet_Pais.Locate('NOME', vPais.getNome, [])) then begin
      if (vMensagem = true) then
        ShowMessage('Já existe um país cadastrado com o nome ' + vPais.getNome);
      result := true;
    end else if (getUmDM.IBDataSet_Pais.Locate('SIGLA', vPais.getSigla, [])) then begin
      if (vMensagem = true) then
        ShowMessage('Já existe um país cadastrado com a sigla ' + vPais.getSigla);
      result := true;
    end else if (getUmDM.IBDataSet_Pais.Locate('DDI', IntToStr(vPais.getDDI), []) then begin
      if (vMensagem = true) then
        ShowMessage('Já existe um país cadastrado com o DDI ' + IntToStr(vPais.getDDI));
      result := true;
    end;
    
    result := false;
  except
    on E: Exception do begin
      ShowMessage('Erro ao validar o país: ' + E.Message);
      result := false;
    end;
  end;
end;

procedure DAOPais.pesquisarObjeto(vChave: String);
begin
  try
    getUmDM.IBDataSet_Pais.Close;
    getUmDM.IBDataSet_Pais.SelectSQL.Clear;
    getUmDM.IBDataSet_Pais.SelectSQL.Add('SELECT * FROM PAIS');
    
    if (Length(vChave) > 0) then
      getUmDM.IBDataSet_Pais.SelectSQL.Add('WHERE NOME LIKE ' + QuotedStr(vChave + '%'));
    
    getUmDM.IBDataSet_Pais.SelectSQL.Add('ORDER BY NOME');
    getUmDM.IBDataSet_Pais.Open;
  except
    on E: Exception do begin
      ShowMessage('Erro ao pesquisar o país: ' + E.Message);
    end;
  end;
end;

end.

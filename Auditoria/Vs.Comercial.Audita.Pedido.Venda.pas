unit Vs.Comercial.Audita.Pedido.Venda;

interface

uses
  Vs.Pedido.Venda.Entidade;

type

  IComercialAuditaPedidoVenda = interface
    ['{CE767378-C6F3-4500-A51F-62E24E65C44B}']
    function Executar(APedidoVenda: TPedidoVenda): Boolean;
  end;

function ComercialAuditaPedidoVenda: IComercialAuditaPedidoVenda;

implementation

type

  TComercialAuditaPedidoVenda = class(TInterfacedObject, IComercialAuditaPedidoVenda)
  public
    constructor Create;
    destructor Destroy; override;
    class function Instancia: IComercialAuditaPedidoVenda;
    function Executar(APedidoVenda: TPedidoVenda): Boolean;
  end;

function ComercialAuditaPedidoVenda: IComercialAuditaPedidoVenda;
begin
  Result := TComercialAuditaPedidoVenda.Instancia;
end;

{ TComercialAuditaPedidoVenda }

constructor TComercialAuditaPedidoVenda.Create;
begin

end;

destructor TComercialAuditaPedidoVenda.Destroy;
begin

  inherited;
end;

function TComercialAuditaPedidoVenda.Executar(
  APedidoVenda: TPedidoVenda): Boolean;
begin
  { todo: implementar as regras de negócio aqui }
  Result := True;
end;

class function TComercialAuditaPedidoVenda.Instancia: IComercialAuditaPedidoVenda;
begin
  Result := Self.Create;
end;

end.

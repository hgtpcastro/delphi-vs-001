unit Vs.Auditor.Pedido.Venda;

interface

uses
  // Vs
  Vs.Pedido.Venda.Salvar.Eventos;

type

  IAuditorPedidoVenda = interface
    ['{B811DCBA-A2F7-413A-B85F-27CBEEF57E73}']
    function ExecutarAuditoriaPeloComercial(APedidoVendaSalvoEvento: IPedidoVendaSalvoEvento): Boolean;
  end;

function AuditorPedidoVenda: IAuditorPedidoVenda;

implementation

uses
  // Deb
  EventBus,
  // Vs
  Vs.Comercial.Audita.Pedido.Venda;

type

  TAuditorPedidoVenda = class(TInterfacedObject, IAuditorPedidoVenda)
  strict private
    constructor Create;
  public
    destructor Destroy; override;
    class function Instancia: IAuditorPedidoVenda;
    [Subscribe]
    function ExecutarAuditoriaPeloComercial(APedidoVendaSalvoEvento: IPedidoVendaSalvoEvento): Boolean;
    procedure RegistrarAssinantes;
  end;

function AuditorPedidoVenda: IAuditorPedidoVenda;
begin
  Result := TAuditorPedidoVenda.Instancia;
end;

{ TAuditorPedidoVenda }

constructor TAuditorPedidoVenda.Create;
begin
  inherited Create;
  Self.RegistrarAssinantes;
end;

destructor TAuditorPedidoVenda.Destroy;
begin

  inherited;
end;

function TAuditorPedidoVenda.ExecutarAuditoriaPeloComercial(APedidoVendaSalvoEvento: IPedidoVendaSalvoEvento): Boolean;
begin
  { todo: implementar eventos }
  Result := ComercialAuditaPedidoVenda.Executar(APedidoVendaSalvoEvento.oQue);
  if Result then
    // Publica o evento de pedido de venda auditado pelo comercial
    //GlobalEventBus.Post(EventoPedidoVendaAuditadoEeLiberadoPeloComercial(APedidoVendaSalvoEvento.oQue), '');
  else
    //GlobalEventBus.Post(EventoPedidoVendaAuditadoEeBloqueadoPeloComercial(APedidoVendaSalvoEvento.oQue), '');
end;

class function TAuditorPedidoVenda.Instancia: IAuditorPedidoVenda;
begin
  Result := Self.Create;
end;

procedure TAuditorPedidoVenda.RegistrarAssinantes;
begin
  GlobalEventBus.RegisterSubscriberForEvents(Self);
end;

end.

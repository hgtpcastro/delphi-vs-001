unit Vs.Pedido.Venda.Salvar;

interface

uses
  // Vs
  Vs.Pedido.Venda.Repositorio;

type

  IPedidoVendaSalvar = interface
    ['{4C2732CB-EDEC-42B6-B525-FDA5696DCF10}']
    function Executar(ACliente: string; AValor: Double): Integer;
  end;

function PedidoVendaSalvar(APedidoVendaRepositorio: IPedidoVendaRepositorio): IPedidoVendaSalvar;

implementation

uses
  // Deb
  EventBus,
  // Vs
  Vs.Pedido.Venda.Entidade,
  Vs.Pedido.Venda.Salvar.Eventos;

type

  TPedidoVendaSalvar = class(TInterfacedObject, IPedidoVendaSalvar)
  strict private
    FPedidoVendaRepositorio: IPedidoVendaRepositorio;
  public
    constructor Create(APedidoVendaRepositorio: IPedidoVendaRepositorio);
    destructor Destroy; override;
    class function Instancia(APedidoVendaRepositorio: IPedidoVendaRepositorio): IPedidoVendaSalvar;
    function Executar(ACliente: string; AValor: Double): Integer;
  end;

function PedidoVendaSalvar(APedidoVendaRepositorio: IPedidoVendaRepositorio): IPedidoVendaSalvar;
begin
  Result := TPedidoVendaSalvar.Instancia(APedidoVendaRepositorio);
end;

{ TPedidoVendaSalvar }

constructor TPedidoVendaSalvar.Create(APedidoVendaRepositorio: IPedidoVendaRepositorio);
begin
  inherited Create;
  FPedidoVendaRepositorio := APedidoVendaRepositorio;
end;

destructor TPedidoVendaSalvar.Destroy;
begin

  inherited;
end;

function TPedidoVendaSalvar.Executar(ACliente: string; AValor: Double): Integer;
var
  LPedidoVenda: TPedidoVenda;
begin
  LPedidoVenda := TPedidoVenda.Instancia(-1, ACliente, AValor);
  try
    Result := FPedidoVendaRepositorio.Salvar(LPedidoVenda);
    // Publica o evento de pedido de venda salvo
    GlobalEventBus.Post(EventoPedidoVendaSalvo(LPedidoVenda), '');
  finally
    LPedidoVenda.Free;
  end;
end;

class function TPedidoVendaSalvar.Instancia(APedidoVendaRepositorio: IPedidoVendaRepositorio): IPedidoVendaSalvar;
begin
  Result := Self.Create(APedidoVendaRepositorio);
end;

end.

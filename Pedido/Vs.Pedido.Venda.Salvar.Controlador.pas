unit Vs.Pedido.Venda.Salvar.Controlador;

interface

uses
  // Vs
  Vs.Pedido.Venda.Salvar;

type

  IPedidoVendaSalvarControlador = interface
    ['{B9EF4DB9-4567-4341-9415-871C7E677575}']
    function Executar(ACliente: string; AValor: Double): Integer;
  end;

function PedidoVendaSalvarControlador: IPedidoVendaSalvarControlador; overload;

implementation

uses
  // Vs
  Vs.Pedido.Venda.Repositorio,
  Vs.Pedido.Venda.Repositorio.Memoria;

type

  TPedidoVendaControllador = class(TInterfacedObject, IPedidoVendaSalvarControlador)
  strict private
    FPedidoVendaSalvar: IPedidoVendaSalvar;
  public
    constructor Create(APedidoVendaSalvar: IPedidoVendaSalvar);
    destructor Destroy; override;
    class function Instancia(APedidoVendaSalvar: IPedidoVendaSalvar): IPedidoVendaSalvarControlador;
    function Executar(ACliente: string; AValor: Double): Integer;
  end;

function PedidoVendaSalvarControlador: IPedidoVendaSalvarControlador;
var
  LPedidoVendaRepositorioMemoria: IPedidoVendaRepositorio;
  LPedidoVendaSalvar: IPedidoVendaSalvar;
begin
  LPedidoVendaRepositorioMemoria := PedidoVendaRepositorioMemoria;
  LPedidoVendaSalvar := PedidoVendaSalvar(LPedidoVendaRepositorioMemoria);
  Result := TPedidoVendaControllador.Instancia(LPedidoVendaSalvar);
end;

{ TPedidoVendaControllador }

constructor TPedidoVendaControllador.Create(APedidoVendaSalvar: IPedidoVendaSalvar);
begin
  inherited Create;
  FPedidoVendaSalvar := APedidoVendaSalvar;
end;

destructor TPedidoVendaControllador.Destroy;
begin

  inherited;
end;

class function TPedidoVendaControllador.Instancia(APedidoVendaSalvar: IPedidoVendaSalvar): IPedidoVendaSalvarControlador;
begin
  Result := Self.Create(APedidoVendaSalvar);
end;

function TPedidoVendaControllador.Executar(ACliente: string; AValor: Double): Integer;
begin
  Result := FPedidoVendaSalvar.Executar(ACliente, AValor);
end;

end.

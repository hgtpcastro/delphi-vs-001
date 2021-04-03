unit Vs.Pedido.Venda.Repositorio.Memoria;

interface

uses
  // Vs
  Vs.Pedido.Venda.Repositorio;

function PedidoVendaRepositorioMemoria: IPedidoVendaRepositorio;

implementation

uses
  System.Generics.Collections,
  // Vs
  Vs.Pedido.Venda.Entidade;

type

  TPedidoVendaRepositorioMemoria = class(TInterfacedObject, IPedidoVendaRepositorio)
  strict private
    FListaPedidoVenda: TList<TPedidoVenda>;
  public
    constructor Create;
    destructor Destroy; override;
    class function Instancia: IPedidoVendaRepositorio;
    function Salvar(APedidoVenda: TPedidoVenda): Integer;
  end;

function PedidoVendaRepositorioMemoria: IPedidoVendaRepositorio;
begin
  Result := TPedidoVendaRepositorioMemoria.Instancia;
end;

{ TPedidoVendaRepositorioMemoria }

constructor TPedidoVendaRepositorioMemoria.Create;
begin
  inherited Create;
  FListaPedidoVenda := TList<TPedidoVenda>.Create;
end;

destructor TPedidoVendaRepositorioMemoria.Destroy;
begin
  FListaPedidoVenda.Free;
  inherited;
end;

class function TPedidoVendaRepositorioMemoria.Instancia: IPedidoVendaRepositorio;
begin
  Result := Self.Create;
end;

function TPedidoVendaRepositorioMemoria.Salvar(APedidoVenda: TPedidoVenda): Integer;
begin
  FListaPedidoVenda.Add(APedidoVenda);
  Result := FListaPedidoVenda.Count;
end;

end.

unit Vs.Pedido.Venda.Repositorio;

interface

uses
  // Vs
  Vs.Pedido.Venda.Entidade;

type

  IPedidoVendaRepositorio = interface
    ['{085ECED1-32F3-4B86-A531-C25E174D9FE7}']
    function Salvar(APedidoVenda: TPedidoVenda): Integer;
  end;

implementation

end.

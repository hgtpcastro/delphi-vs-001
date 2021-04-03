unit Vs.Pedido.Venda.Testes.Unitarios;

interface

uses
  DUnitX.TestFramework,
  // Vs
  Vs.Pedido.Venda.Entidade;

type

  [TestFixture]
  TPedidoVendaTestesUnitarios = class
  public
    [Test]
    procedure DeveSalvarUmPedidoDeVenda(APedidoVenda: TPedidoVenda);
  end;

implementation

uses
  // Vs
  Vs.Pedido.Venda.Repositorio,
  Vs.Pedido.Venda.Repositorio.Memoria,
  Vs.Pedido.Venda.Salvar.Controlador;


const
  MSG_FALHA = 'Teste Falhou!!!';

{ TPedidoVendaTestesUnitarios }

procedure TPedidoVendaTestesUnitarios.DeveSalvarUmPedidoDeVenda(APedidoVenda: TPedidoVenda);
var
  LCodigoPedidoVenda: Integer;
  LPedidoVendaRepositorioMemoria: IPedidoVendaRepositorio;
begin
  LPedidoVendaRepositorioMemoria := PedidoVendaRepositorioMemoria;
  LCodigoPedidoVenda := LPedidoVendaRepositorioMemoria.Salvar(APedidoVenda);
  Assert.IsTrue(LCodigoPedidoVenda = 1, MSG_FALHA);
end;

initialization
  TDUnitX.RegisterTestFixture(TPedidoVendaTestesUnitarios);

end.


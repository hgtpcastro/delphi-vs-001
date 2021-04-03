unit Vs.Pedido.Venda.Testes.Integracao;

interface

uses
  DUnitX.TestFramework,
  // Vs
  Vs.Auditor.Pedido.Venda,
  Vs.Pedido.Venda.Salvar.Controlador;

type

  [TestFixture]
  TPedidoVendaTestesIntegracao = class
  strict private
    FAuditorPedidoVenda: IAuditorPedidoVenda;
    FPedidoVendaSalvarControlador: IPedidoVendaSalvarControlador;
  public
    [SetupFixture]
    procedure Setup;
  public
    [Test]
    [TestCase('Pedido de Venda - 1','CLIENTE PADRAO,180.50')]
    [TestCase('Pedido de Venda - 2','CLIENTE PADRAO,389.99')]
    procedure DeveSalvarUmPedidoDeVenda(ACliente: string; AValor: Double);
  end;

implementation

const
  MSG_FALHA = 'Teste Falhou!!!';

{ TPedidoVendaTestesIntegracao }

procedure TPedidoVendaTestesIntegracao.DeveSalvarUmPedidoDeVenda(ACliente: string; AValor: Double);
var
  LCodigoPedidoVenda: Integer;
begin
  LCodigoPedidoVenda := FPedidoVendaSalvarControlador.Executar(ACliente, AValor);
  Assert.IsTrue(LCodigoPedidoVenda > 0, MSG_FALHA);
end;

procedure TPedidoVendaTestesIntegracao.Setup;
begin
  FAuditorPedidoVenda := AuditorPedidoVenda;
  FPedidoVendaSalvarControlador := PedidoVendaSalvarControlador;
end;

initialization
  TDUnitX.RegisterTestFixture(TPedidoVendaTestesIntegracao);

end.

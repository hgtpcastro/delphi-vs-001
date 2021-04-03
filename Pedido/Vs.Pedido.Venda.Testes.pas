unit Vs.Pedido.Venda.Testes;

interface

uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TPedidoVendaTeste = class
  public
    [Test]
    procedure DeveSalvarUmPedidoDeVenda;
  end;

implementation

{ TPedidoVendaTeste }

procedure TPedidoVendaTeste.DeveSalvarUmPedidoDeVenda;
begin
  Assert.Fail('Teste falhou...');
end;

initialization
  TDUnitX.RegisterTestFixture(TPedidoVendaTeste);

end.

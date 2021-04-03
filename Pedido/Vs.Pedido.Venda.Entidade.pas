unit Vs.Pedido.Venda.Entidade;

interface

type

  TPedidoVenda = class
  strict private
    FCodigo: Integer;
    FCliente: string;
    FValor: Double;
    FLiberadoParaFaturamento: Boolean;
    constructor Create(ACodigo: Integer; ACliente: string; AValor: Double);
  public
    class function Instancia(ACodigo: Integer; ACliente: string; AValor: Double): TPedidoVenda;
    property Codigo: Integer read FCodigo;
    property Cliente: string read FCliente;
    property Valor: Double read FValor;
    property LiberadoParaFaturamento: Boolean read FLiberadoParaFaturamento;
  end;

implementation

{ TPedidoVenda }

constructor TPedidoVenda.Create(ACodigo: Integer; ACliente: string;
  AValor: Double);
begin
  inherited Create;
  FCodigo := ACodigo;
  FCliente := ACliente;
  FValor := AValor;
  FLiberadoParaFaturamento := False;
end;

class function TPedidoVenda.Instancia(ACodigo: Integer; ACliente: string;
  AValor: Double): TPedidoVenda;
begin
  Result := Self.Create(ACodigo, ACliente, AValor);
end;

end.

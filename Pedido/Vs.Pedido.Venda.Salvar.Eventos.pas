unit Vs.Pedido.Venda.Salvar.Eventos;

interface

uses
  // Vs
  Vs.Pedido.Venda.Entidade;

type

  IPedidoVendaSalvoEvento = interface
    ['{633625B9-937F-422C-A55A-236C1E5C0136}']
    function Quem: string;
    function Quando: TDateTime;
    function oQue: TPedidoVenda;
  end;

function EventoPedidoVendaSalvo(APedidoVenda: TPedidoVenda): IPedidoVendaSalvoEvento;

implementation

uses
  System.SysUtils;

type

  TPedidoVendaSalvoEvento = class(TInterfacedObject, IPedidoVendaSalvoEvento)
  strict private
    FQuem: string;
    FQuando: TDateTime;
    FoQue: TPedidoVenda;
    constructor Create(APedidoVenda: TPedidoVenda);
  public
    destructor Destroy; override;
    class function Instancia(APedidoVenda: TPedidoVenda): IPedidoVendaSalvoEvento;
    function Quem: string;
    function Quando: TDateTime;
    function oQue: TPedidoVenda;
  end;

function EventoPedidoVendaSalvo(APedidoVenda: TPedidoVenda): IPedidoVendaSalvoEvento;
begin
  Result := TPedidoVendaSalvoEvento.Instancia(APedidoVenda);
end;

{ TPedidoVendaSalvoEvento }

constructor TPedidoVendaSalvoEvento.Create(APedidoVenda: TPedidoVenda);
begin
  inherited Create;
  FQuem := 'USUARIO_LOGADO';
  FQuando := now;
  FoQue := APedidoVenda;
end;

destructor TPedidoVendaSalvoEvento.Destroy;
begin

  inherited;
end;

class function TPedidoVendaSalvoEvento.Instancia(
  APedidoVenda: TPedidoVenda): IPedidoVendaSalvoEvento;
begin
  Result := Self.Create(APedidoVenda);
end;

function TPedidoVendaSalvoEvento.oQue: TPedidoVenda;
begin
  Result := FoQue;
end;

function TPedidoVendaSalvoEvento.Quando: TDateTime;
begin
  Result := FQuando;
end;

function TPedidoVendaSalvoEvento.Quem: string;
begin
  Result := FQuem;
end;

end.

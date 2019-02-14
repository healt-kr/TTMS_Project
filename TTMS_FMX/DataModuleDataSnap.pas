unit DataModuleDataSnap;

interface

uses
  System.SysUtils, System.Classes, Data.DbxDatasnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Comp.Client;

type
  TDMDataSnap = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDataSnap: TDMDataSnap;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.

unit HotelForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Grids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids, JSON;

type
  TfrmHotel = class(TForm)
    DBGrid1: TDBGrid;
    FDTable1: TFDTable;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    edtRoomType1: TEdit;
    edtRoomCharge1: TEdit;
    edtRoomType2: TEdit;
    edtRoomCharge2: TEdit;
    edtRoomType3: TEdit;
    edtRoomCharge3: TEdit;
    edtRoomType4: TEdit;
    edtRoomCharge4: TEdit;
    edtRoomType5: TEdit;
    edtRoomCharge5: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FDTable1BeforePost(DataSet: TDataSet);
    procedure FDTable1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    function GetJSONRoom(RoomType, RoomCharge: string): TJSONObject;
  public
    { Public declarations }
  end;

var
  frmHotel: TfrmHotel;

implementation

{$R *.dfm}

function TfrmHotel.GetJSONRoom(RoomType, RoomCharge: string): TJSONObject;
var
  JSONRoom: TJSONObject;
begin
  if RoomType <> '' then
  begin
    JSONRoom := TJSONObject.Create;
    JSONRoom.AddPair('type',     RoomType);
    JSONRoom.AddPair('charge',   RoomCharge);
    result := JSONRoom;
  end else
  begin
    result := nil;
  end;
end;

procedure TfrmHotel.FDTable1AfterScroll(DataSet: TDataSet);
var
  JSONData: TJSONObject;
begin
  JSONData := TJSONObject.ParseJSONValue(FDTable1.FieldByName('json_data').AsString)
    as TJSONObject;

  if JSONData.FindValue('rooms[0].type') <> nil then
  begin
    edtRoomType1.Text   := JSONData.GetValue<string>('rooms[0].type');
    edtRoomCharge1.Text := JSONData.GetValue<string>('rooms[0].charge');
  end else
  begin
    edtRoomType1.Text   := '';
    edtRoomCharge1.Text := '';
  end;

  if JSONData.FindValue('rooms[1].type') <> nil then
  begin
    edtRoomType2.Text   := JSONData.GetValue<string>('rooms[1].type');
    edtRoomCharge2.Text := JSONData.GetValue<string>('rooms[1].charge');
  end else
  begin
    edtRoomType2.Text   := '';
    edtRoomCharge2.Text := '';
  end;

  if JSONData.FindValue('rooms[2].type') <> nil then
  begin
    edtRoomType3.Text   := JSONData.GetValue<string>('rooms[2].type');
    edtRoomCharge3.Text := JSONData.GetValue<string>('rooms[2].charge');
  end else
  begin
    edtRoomType3.Text   := '';
    edtRoomCharge3.Text := '';
  end;

  if JSONData.FindValue('rooms[3].type') <> nil then
  begin
    edtRoomType4.Text   := JSONData.GetValue<string>('rooms[3].type');
    edtRoomCharge4.Text := JSONData.GetValue<string>('rooms[3].charge');
  end else
  begin
    edtRoomType4.Text   := '';
    edtRoomCharge4.Text := '';
  end;

  if JSONData.FindValue('rooms[4].type') <> nil then
  begin
    edtRoomType5.Text   := JSONData.GetValue<string>('rooms[4].type');
    edtRoomCharge5.Text := JSONData.GetValue<string>('rooms[4].charge');
  end else
  begin
    edtRoomType5.Text   := '';
    edtRoomCharge5.Text := '';
  end;
end;

procedure TfrmHotel.FDTable1BeforePost(DataSet: TDataSet);
var
  JSONRooms: TJSONArray;
  JSONData: TJSONObject;
begin
  JSONRooms := TJSONArray.Create;
  if edtRoomType1.Text <> '' then
    JSONRooms.Add(GetJSONRoom(edtRoomType1.Text, edtRoomCharge1.Text));
  if edtRoomType2.Text <> '' then
    JSONRooms.Add(GetJSONRoom(edtRoomType2.Text, edtRoomCharge2.Text));
  if edtRoomType3.Text <> '' then
    JSONRooms.Add(GetJSONRoom(edtRoomType3.Text, edtRoomCharge3.Text));
  if edtRoomType4.Text <> '' then
    JSONRooms.Add(GetJSONRoom(edtRoomType4.Text, edtRoomCharge4.Text));
  if edtRoomType5.Text <> '' then
    JSONRooms.Add(GetJSONRoom(edtRoomType5.Text, edtRoomCharge5.Text));

  JSONData := TJSONObject.Create;
  JSONData.AddPair('rooms', JSONRooms);
  FDTable1.FieldByName('json_data').AsString := JSONData.ToString;

  JSONRooms.Free;
end;

procedure TfrmHotel.FormActivate(Sender: TObject);
begin
  FDTable1.Open;
end;

procedure TfrmHotel.FormDeactivate(Sender: TObject);
begin
  FDTable1.Close;
end;

end.

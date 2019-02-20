unit TouristStatusForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmTouristStatus = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    Label1: TLabel;
    cbxManager: TComboBox;
    Label2: TLabel;
    cbxEvent: TComboBox;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    DataSource1: TDataSource;
    Label7: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtFromYear: TEdit;
    edtFromMonth: TEdit;
    edtFromDay: TEdit;
    edtToYear: TEdit;
    edtToMonth: TEdit;
    edtToDay: TEdit;
    FDQueryManager: TFDQuery;
    FDQuery1serial: TStringField;
    FDQuery1from_date: TDateField;
    FDQuery1customer_name: TStringField;
    FDQuery1event_name: TStringField;
    FDQuery1manager_name: TStringField;
    FDQuery1created_at: TSQLTimeStampField;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTouristStatus: TfrmTouristStatus;

implementation

{$R *.dfm}

uses DataModule, MyLib, ReservationForm;


procedure TfrmTouristStatus.DBGrid1DblClick(Sender: TObject);
begin
  frmReservation.ShowWithSerial(FDQuery1.FieldByName('serial').AsString);
end;

procedure TfrmTouristStatus.FormActivate(Sender: TObject);
begin
  with FDQueryManager do
  begin
    Open;
    cbxManager.Items.Clear;
    while not Eof do
    begin
      cbxManager.Items.Add(FieldByName('name').AsString);
      Next;
    end;
    Close;
  end;

  FDQuery1.Active := True;
end;

procedure TfrmTouristStatus.FormDeactivate(Sender: TObject);
begin
//  FDQuery1.Active := False;
end;

procedure TfrmTouristStatus.Button1Click(Sender: TObject);
var
  DateField: string;
  FromDate, ToDate: TDate;
begin
  with FDQuery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT serial, reservation_date, event_start_date, customer_name, (adult_total + child_total) as tourist_total, event_name, manager_name');
    SQL.Add('FROM event');
    SQL.Add('WHERE 1');

    if cbxManager.Text <> '' then
      SQL.Add('AND manager_name like "%' + cbxManager.Text + '%"');

    if cbxEvent.Text <> '' then
      SQL.Add('AND event_name like "%' + cbxEvent.Text + '%"');

    if RadioGroup1.ItemIndex = 0 then
    begin
      DateField := 'reservation_date';
    end else
    begin
      DateField := 'event_start_date';
    end;

    if Convert3TextToDate(FromDate, edtFromYear.Text, edtFromMonth.Text, edtFromDay.Text) then
      SQL.Add('AND ' + DateField + ' >= "'
        + FormatDateTime('yyyy-mm-dd', FromDate) + '"');

    if Convert3TextTodate(ToDate, edtToYear.Text, edtToMonth.Text, edtToDay.Text) then
      SQL.Add('AND ' + DateField + ' >= "'
        + FormatDateTime('yyyy-mm-dd', ToDate) + '"');

    Open;
  end;
end;

end.

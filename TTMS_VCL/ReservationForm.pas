unit ReservationForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  EstimateFrame, JSON;

type
  TfrmReservation = class(TForm)
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    Panel5: TPanel;
    Label11: TLabel;
    Label13: TLabel;
    PanelBottom: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    MonthCalendar1: TMonthCalendar;
    PanelEvent: TPanel;
    Label7: TLabel;
    Label24: TLabel;
    PanelHotel: TPanel;
    PanelCustomer: TPanel;
    PanelHeader: TPanel;
    btnPost: TButton;
    Button1: TButton;
    Button2: TButton;
    btnNameList: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label17: TLabel;
    Label10: TLabel;
    PanelEstimate: TPanel;
    edtPartner: TLabeledEdit;
    edtManager: TLabeledEdit;
    edtEvent: TLabeledEdit;
    edtFromYear: TLabeledEdit;
    edtFromMonth: TLabeledEdit;
    edtFromDay: TLabeledEdit;
    edtCustomer: TLabeledEdit;
    edtContact: TLabeledEdit;
    edtTotal: TLabeledEdit;
    edtAdult: TLabeledEdit;
    edtChild: TLabeledEdit;
    edtDepartHour: TLabeledEdit;
    edtDepartMinute: TLabeledEdit;
    edtDepartDay: TLabeledEdit;
    edtDepartMonth: TLabeledEdit;
    edtReturnMonth: TLabeledEdit;
    edtReturnDay: TLabeledEdit;
    edtReturnHour: TLabeledEdit;
    edtReturnMInute: TLabeledEdit;
    edtDepartAirline: TEdit;
    edtReturnAirline: TEdit;
    edtDepartPlace: TLabeledEdit;
    edtReturnPlace: TLabeledEdit;
    edtHotel: TLabeledEdit;
    edtRoomType: TLabeledEdit;
    edtRoomAmount: TLabeledEdit;
    qrySelectReservation: TFDQuery;
    qryUpdate: TFDQuery;
    Memo1: TMemo;
    edtDay: TLabeledEdit;
    edtNight: TLabeledEdit;
    edtToDay: TLabeledEdit;
    edtToMonth: TLabeledEdit;
    edtToYear: TLabeledEdit;
    lblHeader: TLabel;
    qryInsert: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PanelEstimateExit(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure edtRoomAmountExit(Sender: TObject);
    procedure EditPeriodChange(Sender: TObject);
    procedure btnNameListClick(Sender: TObject);
//    procedure edtDepartHourChange(Sender: TObject);
  private
    { Private declarations }
    Serial: string;
    Estimate: TfraEstimate;
    procedure SetDate2Edit(Date: TDate;
      edtYear, edtMonth, edtDay: TLabeledEdit);
    procedure SetTime2edit(Time: TDateTime;
      edtMonth, edtDay, edtHour, edtMinute: TLabeledEdit);
    procedure SetPeriodEdit(FromDate, ToDate: TDate);

    function GetEventFromDate: Tdate;
    function GetEventToDate: Tdate;

    procedure GetEventPeriod(var FromDate, ToDate: TDate);
    procedure SetEventPeriod(FromDate, ToDate: TDate);
    procedure ClearEventPeriod;

    function GetNightDay: TJSONObject;
    function GetTourist: TJSONObject;
    function GetAirlines: TJSONArray;
    function GetHotels: TJSONArray;

    procedure SetNightDay(JSONObject: TJSONObject);
    procedure SetTourist(JSON: TJSONObject);
    procedure SetAirlines(JSON: TJSONObject);
    procedure SetHotels(JSON: TJSONObject);

    procedure ClearNIghtDay;
    procedure ClearTourist;
    procedure ClearAirlines;
    procedure ClearHotels;

    function GetEstimates: TJSONArray;

    function GetJSONNumber(Text: TCaption): TJSONNUmber;

    function GetDepartDate: string;
    function GetReturnDate: string;
  public
    { Public declarations }
    procedure InsertMode;
    procedure ShowWithSerial(serial: string);
    procedure SetAirline(DepartTime, ReturnTime: TDateTime);
  end;

var
  frmReservation: TfrmReservation;

implementation

{$R *.dfm}

uses
  DateUtils, MyLib, NameListForm;

{****************** public *****************************}

procedure TfrmReservation.InsertMode;
begin
  edtPartner.Text := '';
  edtManager.Text := '';
  lblHeader.Caption := '���� : ' + FormatDateTime('yyyy-mm-dd', Now)
    + '  ���� : ' + FormatDateTime('yyyy-mm-dd', Now);

  // ��� ����
  edtEvent.Text   := '';
  ClearEventPeriod;
  ClearNightDay;

  // �� ����
  edtCustomer.Text  := '';
  edtContact.Text   := '';

  // ���ఴ ����
  ClearTourist;

  // �װ� ����
  ClearAirlines;

  // ȣ��
  ClearHotels;

  Memo1.Clear;

  Estimate.Initialize;

  Caption := '���� ���� �ű� ����';

  Self.Show;
end;

procedure TfrmReservation.ShowWithSerial(serial: string);
var
  JSON: TJSONOBject;
begin
  Self.Serial := serial;
  with qrySelectReservation do
  begin
    Close;
    ParamByName('serial').AsString := serial;
    Open;

    // ��� �κ�
    edtPartner.Text := FieldByName('partner_name').AsString;
    edtManager.Text := FieldByName('manager_name').AsString;
    lblHeader.Caption := '���� : ' + DateToStr(FieldByName('created_at').AsDateTime)
      + '  ���� : ' + DateToStr(FieldByName('updated_at').AsDateTime);

    // ��� ����
    edtEvent.Text   := FieldByName('event_name').AsString;
    SetEventPeriod(FieldByName('from_date').AsDateTime,
      FieldByName('to_date').AsDateTime);

    // �� ����
    edtCustomer.Text  := FieldByName('customer_name').AsString;
    edtContact.Text   := FieldByName('customer_contact').AsString;
    edtTotal.Text     := FieldByName('tourists_total').AsString;

    Caption := '���� ���� (��ȸ/����) - ����ȣ : ' + FieldByName('serial').AsString;

    Memo1.Text := FieldByName('memo').AsString;
    JSON := TJSONObject.ParseJSONValue(FieldByName('JSON').AsString) as TJSONObject;
    SetNightDay(JSON);
    SetTourist(JSON);
    SetAirlines(JSON);
    SetHotels(JSON);
    Memo1.Text := FieldByName('json').AsString;

  end;

  btnPost.Caption := '��    ��';
  Show;
end;


procedure TfrmReservation.btnPostClick(Sender: TObject);
var
  JSON: TJSONObject;
  FromDate, ToDate: TDate;
begin
  with qryUpdate do
  begin
    ParamByName('serial').AsString := Self.Serial;

    // ���
    ParamByName('manager_name').AsString := edtManager.Text;
    ParamByName('partner_name').AsString := edtPartner.Text;

    // ��� ����
    GetEventPeriod(FromDate, ToDate);
    ParamByName('event_name').AsString  := edtEvent.Text;
    ParamByName('from_date').AsDate     := FromDate;
    ParamByName('to_date').AsDate       := ToDate;

    // �� �� ���ఴ
    ParamByName('customer_name').AsString     := edtCustomer.Text;
    ParamByName('customer_contact').AsString  := edtContact.Text;
    ParamByName('tourists_total').AsString    := edtTotal.Text;

    ParamByName('memo').AsString := Memo1.Text;

    JSON := TJSONObject.Create;
    JSON.AddPair('period',    GetNightDay);
    JSON.AddPair('tourist',   GetTourist);
    JSON.AddPair('airlines',  GetAirlines);
    JSON.AddPair('hotels',    GetHotels);
    JSON.AddPair('estimates', Estimate.JSONArray);

    ParamByName('json').AsString := JSON.ToString;
    Memo1.Text := JSON.ToString;

    ExecSQL;
  end;

  JSON.Free;
end;





procedure TfrmReservation.SetEventPeriod(FromDate, ToDate: TDate);
begin
  // DB�� ���Ⱓ�� TEdit.Text�� �ݿ�
  SetPeriodEdit(FromDate, ToDate);

  // TMonthCalendar�� �ݿ�
  // ǥ�õǴ� ���� �޶��� �� "failed to set calendar selected range" ������ �߻��Ͽ�
  // �ε����ϰ� ������ ���� �Ͽ���.
  with MonthCalendar1 do
  begin
    MultiSelect := False;
    Date := FromDate;
    MultiSelect := True;
    EndDate := ToDate;
  end;
end;

procedure TfrmReservation.ClearEventPeriod;
begin
  edtFromYear.Text  := '';
  edtFRomMonth.Text := '';
  edtFromDay.Text   := '';
  edtToYear.Text    := '';
  edtToMonth.Text   := '';
  edtToDay.Text     := '';

  MonthCalendar1.MultiSelect := False;
  MonthCalendar1.Date := Now;
  MonthCalendar1.MultiSelect := True;
  MonthCalendar1.EndDate := Now;
end;

procedure TfrmReservation.GetEventPeriod(var FromDate: TDate; var ToDate: TDate);
begin

end;


procedure TfrmReservation.SetAirline(DepartTime, ReturnTime: TDateTime);
begin
     // DB�� �װ� ��߽ð��� TEdit.Text�� �ݿ�
    SetTime2Edit(DepartTime,
      edtDepartMonth, edtDepartDay, edtDepartHour, edtDepartMinute);

    // DB�� ���� ��߽ð��� TEdit.Text�� �ݿ�
    SetTime2Edit(ReturnTime,
      edtReturnMonth, edtReturnDay, edtReturnHour, edtReturnMinute);
end;


{************************ private *************************************}


{*************** JSON ���ϱ� ******************************************}

{** ��� �Ⱓ **}
function TfrmReservation.GetNightDay: TJSONObject;
var
  night, day: Integer;
  JSONOBject: TJSONObject;
begin
  if edtNight.Text = '' then
    night := 0
  else
    night := StrToInt(edtNight.Text);

  if edtDay.Text = '' then
    day := 0
  else
    day := StrToInt(edtday.Text);

  JSONObject := TJSONObject.Create;
  JSONObject.AddPair('night', TJSONNumber.Create(night));
  JSONObject.AddPair('day', TJSONNumber.Create(day));

  result := JSONObject;
end;

procedure TfrmReservation.SetNightDay(JSONObject: TJSONObject);
var
  Night, Day: Integer;
begin
  try
    Night := JSONObject.GetValue<Integer>('period.night');
    Day   := JSONObject.GetValue<Integer>('period.day');
  except
    Night := 0;
    Day := 0;
  end;

  if Night = 0 then
    edtNight.Text := ''
  else
    edtNight.Text := IntToStr(Night);

  if Day = 0 then
    edtDay.Text := ''
  else
    edtDay.Text := IntToStr(Day);
end;

procedure TfrmReservation.ClearNightDay;
begin
  edtNight.Text := '';
  edtDay.Text   := '';
end;

{** ���ఴ ���� *}
function TfrmReservation.GetTourist;
var
  JSONTourist: TJSONObject;
begin
  JSONTourist := TJSONObject.Create;
  JSONTourist.AddPair('total', GetJSONNumber(edtTotal.Text));
  JSONTourist.AddPair('adult', GetJSONNumber(edtAdult.Text));
  JSONTourist.AddPair('child', GetJSONNumber(edtChild.Text));

  result := JSONTourist;
end;

procedure TfrmReservation.SetTourist(JSON: TJSONObject);
begin
  edtTotal.Text := NumberToString(JSON.GetValue<Integer>('tourist.total'));
  edtAdult.Text := NumberToString(JSON.GetValue<Integer>('tourist.adult'));
  edtChild.Text := NumberToString(JSON.GetValue<Integer>('tourist.child'));
end;

procedure TfrmReservation.ClearTourist;
begin
  edtTotal.Text     := '';
  edtAdult.Text     := '';
  edtChild.Text     := '';
end;



{** �װ� ���� *}
function TfrmReservation.GetAirlines;
var
  JSONAirlines: TJSONArray;
  JSONAirline: TJSONObject;
begin
  JSONAirlines := TJSONArray.Create;

  JSONAirline := TJSONObject.Create;
  JSONAirline.AddPair('month',  edtDepartMonth.Text);
  JSONAirline.AddPair('day',    edtDepartDay.Text);
  JSONAirline.AddPair('hour',   edtDepartHour.Text);
  JSONAirline.AddPair('minute', edtDepartMinute.Text);
  JSONAirline.AddPair('name',   edtDepartAirline.Text);
  JSONAirline.AddPair('place',  edtDepartPlace.Text);
  JSONAirlines.AddElement(JSONAirline);
//  JSONAirline.Free;

  JSONAirline := TJSONObject.Create;
  JSONAirline.AddPair('month',  edtReturnMonth.Text);
  JSONAirline.AddPair('day',    edtReturnDay.Text);
  JSONAirline.AddPair('hour',   edtReturnHour.Text);
  JSONAirline.AddPair('minute', edtReturnMinute.Text);
  JSONAirline.AddPair('name',   edtReturnAirline.Text);
  JSONAirline.AddPair('place',  edtReturnPlace.Text);
  JSONAirlines.AddElement(JSONAirline);
//  JSONAirline.Free;

  result := JSONAirlines;
end;

procedure TfrmReservation.SetAirlines(JSON: TJSONObject);
begin
  edtDepartAirline.Text := JSON.GetValue<string>('airlines[0].name');
  edtReturnAirline.Text := JSON.GetValue<string>('airlines[1].name');

  edtDepartPlace.Text := JSON.GetValue<string>('airlines[0].place');
  edtReturnPlace.Text := JSON.GetValue<string>('airlines[1].place');

  edtDepartMonth.Text := JSON.GetValue<string>('airlines[0].month');
  edtReturnMonth.Text := JSON.GEtValue<string>('airlines[1].month');

  edtDepartDay.Text := JSON.GetValue<string>('airlines[0].day');
  edtReturnDay.Text := JSON.GEtValue<string>('airlines[1].day');

  edtDepartHour.Text := JSON.GetValue<string>('airlines[0].hour');
  edtReturnHour.Text := JSON.GetValue<string>('airlines[1].hour');

  edtDepartMinute.Text := JSON.GetValue<string>('airlines[0].minute');
  edtReturnMinute.Text := JSON.GEtValue<string>('airlines[1].minute');
end;

procedure TfrmReservation.btnNameListClick(Sender: TObject);
begin
  frmNameList.Show;
end;

procedure TfrmReservation.ClearAirlines;
begin
  edtDepartAirline.Text := '';
  edtReturnAirline.Text := '';
  edtDepartPlace.Text := '';
  edtReturnPlace.Text := '';
  edtDepartMonth.Text := '';
  edtReturnMonth.Text := '';
  edtDepartDay.Text := '';
  edtReturnDay.Text := '';
  edtDepartHour.Text := '';
  edtReturnHour.Text := '';
  edtDepartMinute.Text := '';
  edtReturnMinute.Text := '';
end;

{** ȣ�� ���� ���ϱ� *}
function TfrmReservation.GetHotels: TJSONArray;
var
  JSONHotels: TJSONArray;
  JSONHotel: TJSONObject;
  JSONRooms: TJSONArray;
  JSONRoom: TJSONObject;
begin
  JSONRooms := TJSONArray.Create;
  JSONRoom := TJSONObject.Create;
  with JSONRoom do
  begin
    AddPair('type',     edtRoomType.Text);
    AddPair('amount',   edtRoomAmount.Text);
  end;
  JSONRooms.AddElement(JSONRoom);

  JSONHotel := TJSONObject.Create;
  JSONHotel.AddPair('name',   edtHotel.Text);
  JSONHotel.AddPair('rooms',  JSONRooms);


  JSONHotels := TJSONArray.Create;
  JSONHotels.AddElement(JSONHotel);

  result := JSONHotels;
end;

procedure TfrmReservation.SetHotels(JSON: TJSONObject);
begin
  edtHotel.Text       := JSON.GetValue<string>('hotels[0].name');
  edtRoomType.Text    := JSON.GetValue<string>('hotels[0].rooms[0].type');
  edtRoomAmount.Text  := JSON.GetValue<string>('hotels[0].rooms[0].amount');
end;

procedure TfrmReservation.ClearHotels;
begin
  edtHotel.Text       := '';
  edtRoomType.Text    := '';
  edtRoomAmount.Text  := '';
end;

function TfrmReservation.GetEstimates: TJSONArray;
begin

end;

function TfrmReservation.GetJSONNumber(Text: TCaption): TJSONNumber;
var
  n: Integer;
begin
  if Text = '' then
    n := 0
  else
    n := StrToInt(edtday.Text);

  result := TJSONNumber.Create(n);
end;


{******************************* ��¥/�ð� ���� ***********************}

{** ��� ��¥ ���ڿ� ���ϱ� *}
function TfrmReservation.GetDepartDate: string;
var
  time: TDateTime;
begin
  time := EncodeDate(
    StrToInt(edtFromYear.Text),
    StrToInt(edtDepartMonth.Text),
    StrToInt(edtDepartDay.Text));

  result := DateToStr(time);
end;


{** ���� ��¥ ���ڿ� ���ϱ� *}
function TfrmReservation.GetReturnDate: string;
var
  time: TDateTime;
begin
  time := EncodeDate(
    StrToInt(edtToYear.Text),
    StrToInt(edtReturnMonth.Text),
    StrToInt(edtReturnDay.Text));

  result := DateToStr(time);
end;


{** �����(TDate)�� ������ TEdit.Text������
  @param Date �����
  @param Year �⵵ TEdit
  @param Month ��  TEdit
  @param Day ��    TEdit
*}
procedure TfrmReservation.SetDate2Edit(Date: TDate; edtYear: TLabeledEdit;
  edtMonth: TLabeledEdit; edtDay: TLabeledEdit);
var
  Year, Month, Day: Word;
begin
    if Date = 0 then
    begin
      edtYear.Clear;
      edtMonth.Clear;
      edtDay.Clear;
    end  else
    begin
      DecodeDate(Date, Year, Month, Day);
      edtYear.Text := IntToStr(Year);
      edtMonth.Text := IntToStr(Month);
      edtDay.Text := IntToStr(Day);
    end;
end;

{**
  ��� ���� ����Ʈ���� TDate�� ��ȯ
*}
function TfrmReservation.GetEventFromDate: Tdate;
begin
  result := EncodeDate(
    StrToInt(edtFromYear.Text),
    StrToInt(edtFromMonth.Text),
    StrToInt(edtFromDay.Text));
end;

{**
  ��� ���� ����Ʈ���� TDate�� ��ȯ
*}
function TfrmReservation.GetEventToDate: Tdate;
begin
  result := EncodeDate(
    StrToInt(edtToYear.Text),
    StrToInt(edtToMonth.Text),
    StrToInt(edtToDay.Text));
end;


{** ���Ͻú��� �װ��� TEdit�� �Է�
  @param Time     TDateTime
  @param Month �� TEdit
  @param Day ��   TEdit
  @param Hour ��  TEdit
  @param Minute ��
+}
procedure TfrmReservation.SetTime2edit(Time: TDateTime;
  edtMonth, edtDay, edtHour, edtMinute: TLabeledEdit);
var
  Year, Month, Day, Hour, Minute, Second, Mili: Word;
begin
  if Time = 0 then
  begin
    edtMonth.Clear;
    edtDay.Clear;
    edtHour.Clear;
    edtMinute.Clear;
  end
  else begin
    DecodeDateTime(Time, Year, Month, Day, Hour, Minute, Second, Mili);
    edtMonth.Text   := IntToStr(Month);
    edtDay.Text     := IntToStr(Day);
    edtHour.Text    := IntToStr(Hour);
    edtMinute.Text  := IntToStr(Minute);
  end;
end;

{** ���Ⱓ ���� �ش� TEdit�� �ݿ�
  @param FromDate ��������
  @param ToDate ��������
*}
procedure TfrmReservation.SetPeriodEdit(FromDate, ToDate: TDate);
begin
  SetDate2Edit(FromDate, edtFromYear, edtFromMonth, edtFromDay);
  SetDate2Edit(ToDate,   edtToYear, edtToMonth, edtToDay);
end;

procedure TfrmReservation.FormCreate(Sender: TObject);
begin
  Estimate := TfraEstimate.Create(Self);
  Estimate.Parent := PanelEstimate;
  Estimate.Align := TAlign.alClient;
  Estimate.Initialize;
end;

procedure TfrmReservation.FormDestroy(Sender: TObject);
begin
  Estimate.Free;
end;

procedure TfrmReservation.MonthCalendar1Click(Sender: TObject);
begin
  SetPeriodEdit(MonthCalendar1.Date, MonthCalendar1.EndDate);
  edtNight.Text := IntToStr(DaysBetween(MonthCalendar1.EndDate, MonthCalendar1.Date));
  edtDay.Text := IntToStr(DaysBetween(MonthCalendar1.EndDate, MonthCalendar1.Date) + 1);
end;


{*************** ����/�� Ű ������ �� �̵� ���� *****************************}

procedure TfrmReservation.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(Activecontrol, True, True);
end;

procedure TfrmReservation.PanelEstimateExit(Sender: TObject);
begin
  Memo1.SetFocus;
end;

{** ��� �Ⱓ �Է°��� �ٲ���� �� *}
procedure TfrmReservation.EditPeriodChange(Sender: TObject);
var
  fromDate, toDate : TDate;
  Night: Integer;
begin
  Convert3TextToDate(fromDate, edtFromYear.Text, edtFromMonth.Text, edtFromDay.Text);
  Convert3TextToDate(ToDate, edtToYear.Text, edtToMonth.Text, edtToDay.Text);

  if (toDate <> 0) and (fromDate <> 0) then
  begin
    Night := DaysBetween(toDate, fromDate);
    edtNight.Text := IntToStr(Night);
    edtDay.Text   := IntToStr(Night + 1);
  end;

  with MonthCalendar1 do
  begin
    MultiSelect := False;
    Date := fromDate;
    MultiSelect := True;
    EndDate := ToDate;
  end;
end;

procedure TfrmReservation.edtRoomAmountExit(Sender: TObject);
begin
  Estimate.edtDivision0.SetFocus;
end;

end.

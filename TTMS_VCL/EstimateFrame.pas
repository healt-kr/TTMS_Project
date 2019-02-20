unit EstimateFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.ExtCtrls,
  JSON;

type
  TfraEstimate = class(TFrame)
    PanelBottom: TPanel;
    edtSumPrice: TEdit;
    PanelHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ScrollBox1: TScrollBox;
    Panel0: TPanel;
    edtDivision0: TEdit;
    edtPrice0: TEdit;
    edtQuantity0: TEdit;
    edtUnitPrice0: TEdit;
    edtDetails0: TEdit;
    Panel1: TPanel;
    edtDivision1: TEdit;
    edtPrice1: TEdit;
    edtQuantity1: TEdit;
    edtUnitPrice1: TEdit;
    edtDetails1: TEdit;
    Panel2: TPanel;
    edtDivision2: TEdit;
    edtPrice2: TEdit;
    edtQuantity2: TEdit;
    edtUnitPrice2: TEdit;
    edtDetails2: TEdit;
    Panel3: TPanel;
    edtDivision3: TEdit;
    edtPrice3: TEdit;
    edtQuantity3: TEdit;
    edtUnitPrice3: TEdit;
    edtDetails3: TEdit;
    Panel4: TPanel;
    edtDivision4: TEdit;
    edtPrice4: TEdit;
    edtQuantity4: TEdit;
    edtUnitPrice4: TEdit;
    edtDetails4: TEdit;
    Panel5: TPanel;
    edtDivision5: TEdit;
    edtPrice5: TEdit;
    edtQuantity5: TEdit;
    edtUnitPrice5: TEdit;
    edtDetails5: TEdit;
    Panel6: TPanel;
    edtDivision6: TEdit;
    edtPrice6: TEdit;
    edtQuantity6: TEdit;
    edtUnitPrice6: TEdit;
    edtDetails6: TEdit;
    Panel7: TPanel;
    edtDivision7: TEdit;
    edtPrice7: TEdit;
    edtQuantity7: TEdit;
    edtUnitPrice7: TEdit;
    edtDetails7: TEdit;
    Panel8: TPanel;
    edtDivision8: TEdit;
    edtPrice8: TEdit;
    edtQuantity8: TEdit;
    edtUnitPrice8: TEdit;
    edtDetails8: TEdit;
    Panel9: TPanel;
    edtDivision9: TEdit;
    edtPrice9: TEdit;
    edtQuantity9: TEdit;
    edtUnitPrice9: TEdit;
    edtDetails9: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure edtUnitPrice0Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
    UnitPriceEdit: array[0..9] of TEdit;
    QuantityEdit: array[0..9] of TEdit;
    PriceEdit: array[0..9] of TEdit;
    DivisionEdit: array[0..9] of TEdit;
    DetailsEdit: array[0..9] of TEdit;
  public
    { Public declarations }
    procedure Initialize;
    function JSONArray: TJSONArray;
  end;

implementation

{$R *.dfm}

uses DataModule;

procedure TfraEstimate.Initialize;
var
  I: Integer;
begin
  Panel0.TabOrder := 0;
  Panel1.TabOrder := 1;
  Panel2.TabOrder := 2;
  Panel3.TabOrder := 3;
  Panel4.TabOrder := 4;
  Panel5.TabOrder := 5;
  Panel6.TabOrder := 6;
  Panel7.TabOrder := 7;
  Panel8.TabOrder := 8;
  Panel9.TabOrder := 9;

  UnitPriceEdit[0] := edtUnitPrice0;
  UnitPriceEdit[1] := edtUnitPrice1;
  UnitPriceEdit[2] := edtUnitPrice2;
  UnitPriceEdit[3] := edtUnitPrice3;
  UnitPriceEdit[4] := edtUnitPrice4;
  UnitPriceEdit[5] := edtUnitPrice5;
  UnitPriceEdit[6] := edtUnitPrice6;
  UnitPriceEdit[7] := edtUnitPrice7;
  UnitPriceEdit[8] := edtUnitPrice8;
  UnitPriceEdit[9] := edtUnitPrice9;

  QuantityEdit[0] := edtQuantity0;
  QuantityEdit[1] := edtQuantity1;
  QuantityEdit[2] := edtQuantity2;
  QuantityEdit[3] := edtQuantity3;
  QuantityEdit[4] := edtQuantity4;
  QuantityEdit[5] := edtQuantity5;
  QuantityEdit[6] := edtQuantity6;
  QuantityEdit[7] := edtQuantity7;
  QuantityEdit[8] := edtQuantity8;
  QuantityEdit[9] := edtQuantity9;

  PriceEdit[0] := edtPrice0;
  PriceEdit[1] := edtPrice1;
  PriceEdit[2] := edtPrice2;
  PriceEdit[3] := edtPrice3;
  PriceEdit[4] := edtPrice4;
  PriceEdit[5] := edtPrice5;
  PriceEdit[6] := edtPrice6;
  PriceEdit[7] := edtPrice7;
  PriceEdit[8] := edtPrice8;
  PriceEdit[9] := edtPrice9;

  DetailsEdit[0] := edtDetails0;
  DetailsEdit[1] := edtDetails1;
  DetailsEdit[2] := edtDetails2;
  DetailsEdit[3] := edtDetails3;
  DetailsEdit[4] := edtDetails4;
  DetailsEdit[5] := edtDetails5;
  DetailsEdit[6] := edtDetails6;
  DetailsEdit[7] := edtDetails7;
  DetailsEdit[8] := edtDetails8;
  DetailsEdit[9] := edtDetails9;

  DivisionEdit[0] := edtDivision0;
  DivisionEdit[1] := edtDivision1;
  DivisionEdit[2] := edtDivision2;
  DivisionEdit[3] := edtDivision3;
  DivisionEdit[4] := edtDivision4;
  DivisionEdit[5] := edtDivision5;
  DivisionEdit[6] := edtDivision6;
  DivisionEdit[7] := edtDivision7;
  DivisionEdit[8] := edtDivision8;
  DivisionEdit[9] := edtDivision9;

  for I := 0 to 9 do
  begin
    DivisionEdit[I].TabStop   := True;
    DetailsEdit[I].TabStop    := True;
    UnitPriceEdit[I].TabStop  := True;
    QuantityEdit[I].TabStop   := True;

    DivisionEdit[I].TabOrder  := I * 10;
    DetailsEdit[I].TabOrder   := I * 10 + 1;
    UnitPriceEdit[I].TabOrder := I * 10 + 2;
    QuantityEdit[I].TabOrder  := I * 10 + 3;

    DivisionEdit[I].Text  := '';
    DetailsEdit[I].Text   := '';
    UnitPriceEdit[I].Text := '';
    QuantityEdit[I].Text  := '';
    QuantityEdit[I].Text  := '';
    PriceEdit[I].Text     := '';
  end;

  edtSumPrice.Text := '';
end;


function TfraEstimate.JSONArray: TJSONArray;
var
  I: Integer;
  JSONEstimate, JSONLine: TJSONObject;
  JSONArray: TJSONArray;
begin
  JSONArray := TJSONArray.Create;

  for I := 0 to 9 do
  begin
    JSONLine := TJSONObject.Create;

    JSONLine.AddPair('line',        TJSONNumber.Create(I));   // 구분
    JSONLine.AddPair('division',    DivisionEdit[I].Text);    // 구분
    JSONLine.AddPair('details',     DetailsEdit[I].Text);     // 내역
    JSONLine.AddPair('unit_price',  UnitPriceEdit[I].Text);   // 단가
    JSONLine.AddPair('quantity',    QuantityEdit[I].Text);    // 수량
    JSONLine.AddPair('price',       PriceEdit[I].Text);       // 금액

    JSONArray.Add(JSONLine);
  end;

  result := JSONArray;
end;

procedure TfraEstimate.Panel5Click(Sender: TObject);
begin

end;

{** 단가나 수량 입력시 금액 자동 계산
*}
procedure TfraEstimate.Button1Click(Sender: TObject);
var
  JSONEstimate: TJSONArray;
begin
  JSONEstimate := Self.JSONArray;
  ShowMessage(JSONEstimate.ToString);
end;

procedure TfraEstimate.edtUnitPrice0Change(Sender: TObject);
var
  I: Integer;
  UnitPrice, Quantity, SumPrice: Integer;
begin
  for I := 0 to 9 do
  begin
    // 단가가 입력되지 않았으면 넘어가고 아니면 Integer로 변환
    if UnitPriceEdit[I].Text = '' then
      Continue
    else
      UnitPrice := StrToInt(UnitPriceEdit[I].Text);

    // 수량이 입력되지 않았으면 1로 계산
    if QuantityEdit[I].Text = '' then
      Quantity := 1
    else
      Quantity := StrToInt(QuantityEdit[I].Text);

    SumPrice := SumPrice + (UnitPrice * Quantity);
    PriceEdit[I].Text := Format('%.0n', [UnitPrice * Quantity + 0.0]);
  end;

  edtSumPrice.Text := Format('%.0n', [SumPrice + 0.0]);
end;

end.

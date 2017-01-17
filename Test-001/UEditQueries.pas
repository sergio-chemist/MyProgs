unit UEditQueries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, QueryList, ExtCtrls, Buttons, ToolWin, ImgList;

type
  TfrmEditQueries = class(TForm)
    lvQueries: TListView;
    spl1: TSplitter;
    meQueries: TMemo;
    sbStatus: TStatusBar;
    imlmages: TImageList;
    tlbButtons: TToolBar;
    btnNew: TToolButton;
    btnMoveUp: TToolButton;
    btnMoveDown: TToolButton;
    btnDelete: TToolButton;
    btnSep1: TToolButton;
    btnSep2: TToolButton;
    btnSep3: TToolButton;
    btnSep4: TToolButton;
    btnOK: TToolButton;
    btnSep5: TToolButton;
    btnCancel: TToolButton;
    btnSep0: TToolButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure lvQueriesDeletion(Sender: TObject; Item: TListItem);
    procedure meQueriesExit(Sender: TObject);
  private
    procedure AcceptQueryList(QList: TQueryList);
    procedure UpdateQueryList(QList: TQueryList);
    function GetNewItemCaption(Mask: string): string;
    procedure UpdateSelectedItem;
    procedure AcceptSelectedItem;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure EditQueriesDialog(QList: TQueryList);

var
  frmEditQueries: TfrmEditQueries;

implementation

{$R *.dfm}

var
  Modal_Result: Integer;

procedure EditQueriesDialog(QList: TQueryList);
begin
  if not Assigned(frmEditQueries) then
    Application.CreateForm(TfrmEditQueries, frmEditQueries);
  frmEditQueries.AcceptQueryList(QList);
  frmEditQueries.ShowModal;
  if (Modal_Result = mrOK) then
    frmEditQueries.UpdateQueryList(QList);
end;

procedure TfrmEditQueries.AcceptQueryList(QList: TQueryList);
var
  i: Integer;
  Item: TListItem;
begin
  lvQueries.Items.BeginUpdate;
  lvQueries.Items.Clear;
  try
    for i := 0 to QList.Count - 1 do
    begin
      Item := lvQueries.Items.Add;
      Item.Caption := QList[i];
      Item.Data := QList.Objects[i];
    end;
  finally
    lvQueries.Items.EndUpdate;
  end;
end;

procedure TfrmEditQueries.UpdateQueryList(QList: TQueryList);
var
  Item: TListItem;
begin
//  Item := lvQueries.Items.Add;
//  Item.Caption:= 'NewQueryTitle';
end;

procedure TfrmEditQueries.btnOKClick(Sender: TObject);
begin
  Modal_Result := mrOk;
  Close;
end;

procedure TfrmEditQueries.btnCancelClick(Sender: TObject);
begin
  Modal_Result := mrCancel;
  Close;
end;

function TfrmEditQueries.GetNewItemCaption(Mask: string): string;
var
  Item: TListItem;
  i: Integer;
begin
  i := 1;
  repeat
    Result := Mask + IntToStr(i);
    Item := lvQueries.FindCaption(0, Result, False, True, True);
    Inc(i);
  until Item = nil;
end;

procedure TfrmEditQueries.UpdateSelectedItem();
var
  Item: TListItem;
begin
  Item := lvQueries.Selected;
  if (Item <> nil) and (Item.Data <> nil) then
    TStrings(Item.Data).Assign(meQueries.Lines);
end;

procedure TfrmEditQueries.AcceptSelectedItem();
var
  Item: TListItem;
begin
  Item := lvQueries.Selected;
  if (Item <> nil) and (Item.Data <> nil) then
    meQueries.Lines.Assign(TStrings(Item.Data));
end;

procedure TfrmEditQueries.btnNewClick(Sender: TObject);
var
  Item, Found: TListItem;
begin
  UpdateSelectedItem();
  Item := lvQueries.Items.Add;
  Item.Caption := GetNewItemCaption('NewQueryTitle');
  Item.Focused := True;
  lvQueries.Selected := Item;
  Item.Data := TStringList.Create;
  meQueries.Lines.Clear;
end;

procedure TfrmEditQueries.lvQueriesDeletion(Sender: TObject; Item: TListItem);
begin
  if (Item.Data <> nil) then
    TObject(Item.Data).Free();
end;

procedure TfrmEditQueries.meQueriesExit(Sender: TObject);
begin
  UpdateSelectedItem();
end;

end.



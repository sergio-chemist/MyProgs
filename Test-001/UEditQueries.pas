unit UEditQueries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, QueryList, ExtCtrls, Buttons, ToolWin, ImgList;

const
  StdSqlName = 'Queries.sql';

type
  TfrmEditQueries = class(TForm)
    lvQueries: TListView;
    spl1: TSplitter;
    meQueries: TMemo;
    sbQueries: TStatusBar;
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
    btnSep6: TToolButton;
    btnLoad: TToolButton;
    btnSep7: TToolButton;
    btnSave: TToolButton;
    btnSep8: TToolButton;
    btnFind: TToolButton;
    btnSep9: TToolButton;
    btnClear: TToolButton;
    dlgOpenQueries: TOpenDialog;
    dlgSaveQueries: TSaveDialog;
    sbChosen: TStatusBar;
    btnSep10: TToolButton;
    btnSaveSelected: TToolButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure lvQueriesDeletion(Sender: TObject; Item: TListItem);
    procedure meQueriesExit(Sender: TObject);
    procedure lvQueriesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure btnMoveUpClick(Sender: TObject);
    procedure btnMoveDownClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveSelectedClick(Sender: TObject);
  private
    DisableLevel: Integer;
    QryList: TQueryList;
    procedure AcceptQueryList(QList: TQueryList);
    procedure UpdateQueryList(QList: TQueryList);
    function GetNewItemCaption(Mask: string): string;
    procedure UpdateSelectedItem;
    procedure AcceptSelectedItem;
    procedure CheckButtonsState(Item: TListItem; InitAtZero: Boolean = false);
    procedure SelectItem(Item: TListItem);
    procedure MoveSelectedItem(Direction: Integer);
    procedure SelectItemByIndex(Index: Integer);
    procedure DeleteItem;
    procedure SaveQueries;
    procedure LoadQueries;
    procedure ClearQueryData;
    procedure ShowInfoAboutfItem(Item: TListItem);
    procedure UpdateSelectedIndex(var SelectedIndex: Integer; var IsChanged: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

function EditQueriesDialog(QList: TQueryList; var SelectedIndex: Integer; var IsChanged: Boolean): Boolean;

var
  frmEditQueries: TfrmEditQueries;

implementation

{$R *.dfm}

var
  Modal_Result: Integer;

procedure ClearStatusBarPanels(StatusBar: TStatusBar);
var
  i: Integer;
begin
  for i := 0 to StatusBar.Panels.Count - 1 do
    StatusBar.Panels[i].Text := '';
end;

procedure ShowMsgInStatusBar(StatusBar: TStatusBar; Index: Integer; Msg: string);
begin
  if (Index >= 0) and (Index < StatusBar.Panels.Count) then
    StatusBar.Panels[Index].Text := Msg;
end;

procedure ExportItemsToQueryList(Items: TListItems; QList: TQueryList);
var
  i: Integer;
  Item: TListItem;
begin
  QList.Clear;
  for i := 0 to Items.Count - 1 do
  begin
    Item := Items[i];
    QList.AddItem(Item.Caption, TStrings(Item.Data));
  end;
end;

procedure ImportItemsFromQueryList(Items: TListItems; QList: TQueryList);
var
  i: Integer;
  Child, Data: TStringList;
  Item: TListItem;
begin
  Items.BeginUpdate;
  try
    Items.Clear;
  finally
    for i := 0 to QList.Count - 1 do
    begin
      Item := Items.Add;
      Item.Caption := QList[i];
      Data := TStringList.Create;
      Item.Data := Data;
      Child := TStringList(QList.Objects[i]);
      if Child <> nil then
        Data.Assign(Child);
    end;
    Items.EndUpdate;
  end;
end;

function EditQueriesDialog(QList: TQueryList; var SelectedIndex: Integer; var IsChanged: Boolean): Boolean;
begin
  if not Assigned(frmEditQueries) then
    Application.CreateForm(TfrmEditQueries, frmEditQueries);
  frmEditQueries.AcceptQueryList(QList);
  frmEditQueries.SelectItemByIndex(SelectedIndex);
  frmEditQueries.CheckButtonsState(nil, True);
  frmEditQueries.ShowModal;
  Result := (Modal_Result = mrOK);
  if Result then
  begin
    frmEditQueries.UpdateSelectedIndex(SelectedIndex, IsChanged);
    frmEditQueries.UpdateQueryList(QList);
  end;
end;

procedure CheckItemIndex(Item: TListItem; Count, Direction: Integer; Control: TControl);
var
  Index: Integer;
begin
  if (Count = 0) then
    Control.Enabled := False
  else if (Item <> nil) then
  begin
    Index := Item.Index;
    if (Direction <> 0) then
      case Direction of
        -1:
          Control.Enabled := (Index > 0);
        1:
          Control.Enabled := (Index < Count - 1);
      end
    else
      Control.Enabled := True;
  end;
end;

function GetIndexAfterDeletion(Index, Count: Integer): Integer;
begin
  Result := -1;
  if (Index >= 0) and (Index < Count) then
  begin
    Result := Index;
    if (Result = Count - 1) then
      Dec(Result);
  end;
end;

procedure TfrmEditQueries.SaveQueries();
begin
  if sbQueries.SimpleText <> '' then
    dlgSaveQueries.FileName := sbQueries.SimpleText
  else
    dlgSaveQueries.FileName := ExtractFilePath(Application.ExeName) + StdSqlName;
  if dlgSaveQueries.Execute then
  begin
    ExportItemsToQueryList(lvQueries.Items, QryList);
    QryList.SaveToFile(dlgSaveQueries.FileName);
    sbQueries.SimpleText := dlgSaveQueries.FileName;
  end;
end;

procedure TfrmEditQueries.LoadQueries();
begin
  if sbQueries.SimpleText <> '' then
    dlgOpenQueries.FileName := sbQueries.SimpleText
  else
    dlgOpenQueries.FileName := ExtractFilePath(Application.ExeName) + StdSqlName;
  if dlgOpenQueries.Execute then
  begin
    QryList.LoadFromFile(dlgOpenQueries.FileName);
    Inc(DisableLevel);
    ImportItemsFromQueryList(lvQueries.Items, QryList);
    Dec(DisableLevel);
    SelectItemByIndex(0);
    sbQueries.SimpleText := dlgOpenQueries.FileName;
  end;
end;

procedure TfrmEditQueries.AcceptQueryList(QList: TQueryList);
begin
  ImportItemsFromQueryList(lvQueries.Items, QList);
end;

procedure TfrmEditQueries.UpdateQueryList(QList: TQueryList);
begin
  ExportItemsToQueryList(lvQueries.Items, QList);
end;

procedure TfrmEditQueries.btnOKClick(Sender: TObject);
begin
  UpdateSelectedItem();
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
  if (DisableLevel = 0) then
  begin
    Item := lvQueries.Selected;
    if (Item <> nil) and (Item.Data <> nil) then
      TStrings(Item.Data).Assign(meQueries.Lines);
  end;
end;

procedure TfrmEditQueries.AcceptSelectedItem();
var
  Item: TListItem;
begin
  if (DisableLevel = 0) then
  begin
    Item := lvQueries.Selected;
    if (Item <> nil) and (Item.Data <> nil) then
      meQueries.Lines.Assign(TStrings(Item.Data));
  end;
end;

procedure TfrmEditQueries.CheckButtonsState(Item: TListItem; InitAtZero: Boolean = false);
var
  Count: Integer;
begin
  if (DisableLevel = 0) then
  begin
    Count := lvQueries.Items.Count;
    if (Item = nil) and InitAtZero and (Count > 0) then
      Item := lvQueries.Items[0];
    CheckItemIndex(Item, Count, -1, btnMoveUp);
    CheckItemIndex(Item, Count, 1, btnMoveDown);
    CheckItemIndex(Item, Count, 0, btnDelete);
    CheckItemIndex(Item, Count, 0, btnSave);
    CheckItemIndex(Item, Count, 0, btnFind);
    CheckItemIndex(Item, Count, 0, btnClear);
    ShowInfoAboutfItem(Item);
  end;
end;

procedure TfrmEditQueries.SelectItem(Item: TListItem);
begin
  lvQueries.Selected := Item;
  AcceptSelectedItem();
  Item.Focused := True;
  CheckButtonsState(Item);
end;

procedure TfrmEditQueries.btnNewClick(Sender: TObject);
var
  Item: TListItem;
begin
  UpdateSelectedItem();
  Inc(DisableLevel);
  Item := lvQueries.Items.Add;
  Item.Caption := GetNewItemCaption('NewQueryTitle');
  Item.Data := TStringList.Create;
  SelectItem(Item);
  Dec(DisableLevel);
  meQueries.Lines.Clear;
  CheckButtonsState(Item);
end;

procedure TfrmEditQueries.lvQueriesDeletion(Sender: TObject; Item: TListItem);
begin
  if (DisableLevel = 0) then
  begin
    if (Item.Data <> nil) then
      TObject(Item.Data).Free();
  end;
end;

procedure TfrmEditQueries.meQueriesExit(Sender: TObject);
begin
  UpdateSelectedItem();
end;

procedure TfrmEditQueries.ShowInfoAboutfItem(Item: TListItem);
begin
  if (Item = nil) then
    ClearStatusBarPanels(sbChosen)
  else
  begin
    ShowMsgInStatusBar(sbChosen, 0, IntToStr(Item.Index + 1));
    ShowMsgInStatusBar(sbChosen, 1, IntToStr(lvQueries.Items.Count));
    ShowMsgInStatusBar(sbChosen, 2, Item.Caption);
  end;
end;

procedure TfrmEditQueries.lvQueriesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if (DisableLevel = 0) then
  begin
    AcceptSelectedItem();
    CheckButtonsState(Item);
    ShowInfoAboutfItem(Item);
  end;
end;

procedure TfrmEditQueries.SelectItemByIndex(Index: Integer);
begin
  if (Index >= 0) and (Index < lvQueries.Items.Count) then
    SelectItem(lvQueries.Items[Index]);
end;

procedure TfrmEditQueries.ClearQueryData();
begin
  meQueries.Clear;
  CheckButtonsState(nil);
  ClearStatusBarPanels(sbChosen);
end;

procedure TfrmEditQueries.DeleteItem();
var
  Item: TListItem;
  Index, Count: Integer;
begin
  Item := lvQueries.Selected;
  if (Item <> nil) then
  begin
    lvQueries.Items.BeginUpdate;
    Index := Item.Index;
    Count := lvQueries.Items.Count;
    Index := GetIndexAfterDeletion(Index, Count);
    Item.Free;
    if (Index >= 0) then
      SelectItem(lvQueries.Items[Index])
    else
      ClearQueryData;
    lvQueries.Items.EndUpdate;
  end;
end;

procedure TfrmEditQueries.UpdateSelectedIndex(var SelectedIndex: Integer; var IsChanged: Boolean);
var
  Item: TListItem;
begin
  IsChanged:= False;
  if btnSaveSelected.Down then
  begin
    Item := lvQueries.Selected;
    if (Item <> nil) then
    begin
      IsChanged:= True;
      SelectedIndex := Item.Index;
    end;
  end;
end;

procedure TfrmEditQueries.MoveSelectedItem(Direction: Integer);
var
  Item, NewItem: TListItem;
  Index: Integer;
begin
  Item := lvQueries.Selected;
  if (Item <> nil) then
  begin
    Index := Item.Index;
    if (Direction > 0) then
      Inc(Index);
    begin
      Inc(DisableLevel);
      lvQueries.Items.BeginUpdate;
      NewItem := lvQueries.Items.AddItem(nil, Index + Direction);
      NewItem.Caption := Item.Caption;
      NewItem.Data := Item.Data;
      Item.Free;
      SelectItem(NewItem);
      lvQueries.Items.EndUpdate;
      Dec(DisableLevel);
      CheckButtonsState(NewItem);
    end;
  end;
end;

procedure TfrmEditQueries.btnMoveUpClick(Sender: TObject);
begin
  MoveSelectedItem(-1);
end;

procedure TfrmEditQueries.btnMoveDownClick(Sender: TObject);
begin
  MoveSelectedItem(1);
end;

procedure TfrmEditQueries.btnDeleteClick(Sender: TObject);
begin
  DeleteItem();
end;

procedure TfrmEditQueries.btnClearClick(Sender: TObject);
begin
  lvQueries.Items.Clear;
  ClearQueryData;
end;

procedure TfrmEditQueries.FormCreate(Sender: TObject);
begin
  QryList := TQueryList.Create;
end;

procedure TfrmEditQueries.FormDestroy(Sender: TObject);
begin
  QryList.Free;
end;

procedure TfrmEditQueries.btnSaveClick(Sender: TObject);
begin
  SaveQueries();
end;

procedure TfrmEditQueries.btnLoadClick(Sender: TObject);
begin
  LoadQueries();
end;

procedure TfrmEditQueries.btnSaveSelectedClick(Sender: TObject);
begin
  if btnSaveSelected.Down then
    btnSaveSelected.Hint := 'Save Selected Index'
  else
    btnSaveSelected.Hint := 'Do not save Selected Index';
end;

end.



unit QueryList;

interface

uses
  Classes;

type
  TQueryList = class(TStringList)
  private
    Free_Obj: Boolean;
    procedure FreeObjects;
    procedure SaveToStr(var Str: string);
    procedure AddStringsByIndex(Index: Integer; AStrings: TStrings);
    function FindIndexOfItem(Item: string; var Index: Integer): Boolean;
  public
    constructor Create();
    destructor Destroy; override;
    procedure AddItem(Item: string; AStrings: TStrings);
    procedure AssignToStrings(AStrings: TStrings);
    procedure SaveToStrings(AStrings: TStrings);
    procedure SaveToStream(Stream: TStream);
    procedure Clear;
    procedure ClearStrObjects;
  end;

implementation

const
  LeftChars = '--|';
  RightChars = '|--';
  EndOfLine = #13#10;

function DecorateStr(const Str: string): string;
begin
  Result := LeftChars + Str + RightChars;
end;

{ TQueryList }

procedure TQueryList.FreeObjects();
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Objects[i].Free;
end;

constructor TQueryList.Create();
begin
  inherited Create;
  Free_Obj := True;
end;

destructor TQueryList.Destroy;
begin
  if Free_Obj then
    FreeObjects();
  inherited;
end;

procedure TQueryList.SaveToStr(var Str: string);
var
  i: Integer;
  s: string;
  Child: TStringList;
begin
  Str := '';
  for i := 0 to Count - 1 do
  begin
    Str := Str + DecorateStr(Strings[i]) + EndOfLine;
    Child := TStringList(Objects[i]);
    if (Child <> nil) and (Child.Count > 0) then
      Str := Str + Child.Text + EndOfLine;
  end;
end;

procedure TQueryList.AddStringsByIndex(Index: Integer; AStrings: TStrings);
var
  Child: TStringList;
begin
  if (Index < 0) or (Index >= Count) then
    Exit;
  Child := TStringList(Objects[Index]);
  if (Child = nil) then
  begin
    Child := TStringList.Create;
    Objects[Index] := Child;
  end;
  Child.AddStrings(AStrings);
end;

function TQueryList.FindIndexOfItem(Item: string; var Index: Integer): Boolean;
begin
  Result := Find(DecorateStr(Item), Index);
end;

procedure TQueryList.AddItem(Item: string; AStrings: TStrings);
var
  i: Integer;
begin
  if not Find(Item, i) then
    //i := Add(DecorateStr(Item));
    i:= Add(Item);
  AddStringsByIndex(i, AStrings)
end;

procedure TQueryList.SaveToStrings(AStrings: TStrings);
var
  S: string;
begin
  if Count > 0 then
  begin
    SaveToStr(S);
    AStrings.Text := S;
  end
  else
    AStrings.Clear;
end;

procedure TQueryList.AssignToStrings(AStrings: TStrings);
var
  i: Integer;
begin
//  AStrings.Assign(Self);
  AStrings.BeginUpdate;
  try
    AStrings.Clear;
  for i := 0 to Count-1 do
    begin
      AStrings.AddObject(Strings[i], Objects[i]);
    end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TQueryList.SaveToStream(Stream: TStream);
var
  S: string;
begin
  if Count > 0 then
  begin
    SaveToStr(S);
    Stream.Write(Pointer(S)^, Length(S));
  end;
end;

{
procedure TTreeStrings.SaveTreeToStream(Stream: TStream);
const
  TabChar = #9;
  EndOfLine = #13#10;
var
  i: Integer;
  ANode: TTreeNode;
  NodeStr: string;
begin
  if Count > 0 then
  begin
    ANode := Owner[0];
    while ANode <> nil do
    begin
      NodeStr := '';
      for i := 0 to ANode.Level - 1 do NodeStr := NodeStr + TabChar;
      NodeStr := NodeStr + ANode.Text + EndOfLine;
      Stream.Write(Pointer(NodeStr)^, Length(NodeStr));
      ANode := ANode.GetNext;
    end;
  end;
end;
}

procedure TQueryList.Clear();
begin
  if Free_Obj then
    FreeObjects();
  inherited Clear;
end;

procedure TQueryList.ClearStrObjects();
var
  Obj: TObject;
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Obj := Objects[i];
    if (Obj is TQueryList) then
      (Obj as TQueryList).Clear;
  end;
end;

end.



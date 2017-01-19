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
    procedure AssignFromStrings(AStrings: TStrings);
    procedure AssignToStrings(AStrings: TStrings; NewData: Boolean = False);
    procedure ImportFromStrings(Source: TStrings);
    procedure ExportToStrings(AStrings: TStrings);
    procedure SaveToStream(Stream: TStream);
    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    procedure Clear;
    procedure ClearStrObjects;
  end;

implementation

uses
  SysUtils, StrUtils;

const
  LeftChars = '--|';
  RightChars = '|--';
  EndOfLine = #13#10;

function DecorateStr(const Str: string): string;
begin
  Result := LeftChars + Str + RightChars;
end;

function UnDecorateStr(const Str: string): string;
begin
  Result := Copy(Str, Length(LeftChars) + 1, Length(Str) - Length(LeftChars) -
    Length(RightChars));
end;

function IsDecorated(const Str: string): Boolean;
begin
  Result := AnsiStartsStr(LeftChars, Str) and AnsiEndsStr(RightChars, Str);
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
  if (AStrings <> nil) then
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
    i := Add(Item);
  AddStringsByIndex(i, AStrings)
end;

procedure TQueryList.ExportToStrings(AStrings: TStrings);
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

procedure TQueryList.AssignToStrings(AStrings: TStrings; NewData: Boolean = False);
var
  i: Integer;
  Data: TStrings;
begin
//  AStrings.Assign(Self);
  AStrings.BeginUpdate;
  try
    AStrings.Clear;
    for i := 0 to Count - 1 do
    begin
      if NewData then
      begin
        Data := TStringList.Create;
        Data.Assign(TStrings(Objects[i]));
      end
      else
        Data := TStrings(Objects[i]);
      AStrings.AddObject(Strings[i], Data);
    end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TQueryList.AssignFromStrings(AStrings: TStrings);
var
  i: Integer;
begin
  Clear();
    for i := 0 to AStrings.Count - 1 do
      AddItem(AStrings[i], TStrings(AStrings.Objects[i]));
end;

procedure DeleteLastEmptyItems(Source: TStrings);
var
  i, n: Integer;
begin
  if Source <> nil then
  begin
    repeat
      i := Source.Count - 1;
      if (i >= 0) and (Trim(Source[i]) = '') then
        Source.Delete(i)
      else
        Break;
    until True;
  end;
end;

procedure TQueryList.ImportFromStrings(Source: TStrings);
var
  i: Integer;
  S: string;
  Data: TStrings;
begin
  Clear;
  Data := nil;
  for i := 0 to Source.Count - 1 do
  begin
    S := Source[i];
    if IsDecorated(S) then
    begin
      DeleteLastEmptyItems(Data);
      Data := TStringList.Create;
      AddObject(UnDecorateStr(S), Data);
    end
    else if (Data <> nil) then
      Data.Add(S);
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

procedure TQueryList.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TQueryList.LoadFromFile(const FileName: string);
var
  AStrings: TStrings;
begin
  AStrings := TStringList.Create();
  try
    AStrings.LoadFromFile(FileName);
    ImportFromStrings(AStrings);
  finally
    AStrings.Free;
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



unit ObjStrList;

interface
uses Classes;

type

  TObjStringList = class(TStringList)
  private
    FOwner: TObjStringList;
    Free_Obj: Boolean;
    procedure FreeObjects;
    procedure SaveToStr(var Str: String; Depth: Integer = 0);
  public
  constructor Create( AOwner: TObjStringList = nil; FreeObj: Boolean = true);
  destructor Destroy; override;
  procedure SaveToStrings(AStrings: TStrings; Depth: Integer = 0);
  procedure SaveToStream(Stream: TStream);
  procedure Clear;
  procedure ClearStrObjects;
  end;

implementation

{ TObjStringList }

procedure TObjStringList.FreeObjects();
var i: Integer;
begin
for i := 0 to Count-1 do
    Objects[i].Free;
end;

constructor TObjStringList.Create( AOwner: TObjStringList = nil;
                                   FreeObj: Boolean = true);
begin
inherited Create;
FOwner:= AOwner;
Free_Obj:= FreeObj;
end;

destructor TObjStringList.Destroy;
begin
if Free_Obj then FreeObjects();
  inherited;
end;

procedure TObjStringList.SaveToStr(var Str: String; Depth: Integer = 0);
const
  TabChar = #9;
  EndOfLine = #13#10;
var i: Integer;
    s: String;
    Child: TObjStringList;
begin
  if (Depth=0) then Str:= '';
  S:= StringOfChar(TabChar, Depth);
  for i := 0 to Count-1 do
  begin
    Str:= Str + S + Strings[i] + EndOfLine;
    Child:= TObjStringList(Objects[i]);
    if (Child<>nil) and (Child.Count>0) then
      Child.SaveToStr(Str, Depth+1);
  end;
end;

procedure TObjStringList.SaveToStrings(AStrings: TStrings; Depth: Integer = 0);
var S: String;
begin
  if Count > 0 then
  begin
    SaveToStr(S, 0);
    AStrings.Text:= S;
  end else
    AStrings.Clear;
end;

procedure TObjStringList.SaveToStream(Stream: TStream);
var S: String;
begin
  if Count > 0 then
  begin
    SaveToStr(S, 0);
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

procedure TObjStringList.Clear();
begin
if Free_Obj then FreeObjects();
inherited Clear;
end;

procedure TObjStringList.ClearStrObjects();
var Obj: TObject; i: Integer;
begin
for i := 0 to Count-1 do
    begin
    Obj:= Objects[i];
    if (Obj is TObjStringList) then
       (Obj as TObjStringList).Clear;
    end;
end;

end.
 
unit Test_001;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ComCtrls, StdCtrls, Menus, DB, DBAccess, MSAccess, ImgList,
  Buttons, IniFiles, MemDS, GridsEh, DBGridEh, NonVisual, QueryList;

type
  TfrmTest001 = class(TForm)
    sbStatus: TStatusBar;
    pcPageControl: TPageControl;
    mmMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuExit: TMenuItem;
    gbControls: TGroupBox;
    tsTest: TTabSheet;
    mnuTask: TMenuItem;
    mnuShowCoworkers: TMenuItem;
    aclActions: TActionList;
    acShowCoworkers: TAction;
    mnuConnection: TMenuItem;
    mnuConnectWithMLKTradeTest: TMenuItem;
    acConnectWithServer: TAction;
    MSConnection: TMSConnection;
    cmbServers: TComboBox;
    mnuGetServerListFast: TMenuItem;
    acGetServerListFast: TAction;
    lblTitle: TLabel;
    sbnConnect: TSpeedButton;
    dbgTest: TDBGridEh;
    msqTest: TMSQuery;
    tsQuery: TTabSheet;
    meQuery: TMemo;
    mdsTest: TMSDataSource;
    lblQueries: TLabel;
    cmbQueries: TComboBox;
    mnuLoadQueries: TMenuItem;
    acLoadQueries: TAction;
    acSaveQueries: TAction;
    dlgOpenQueries: TOpenDialog;
    dlgSaveQueries: TSaveDialog;
    mnuSaveQueries: TMenuItem;
    sbQueries: TStatusBar;
    acSaveAsQueries: TAction;
    mnuSaveAsQueries: TMenuItem;
    cbxAllContents: TCheckBox;
    mnuQueries: TMenuItem;
    mnuEditQueries: TMenuItem;
    mnuExecuteQuery: TMenuItem;
    acExecQuery: TAction;
    acEditQueries: TAction;
    sbnExecute: TSpeedButton;
    sbnEditQueries: TSpeedButton;
    procedure mnuExitClick(Sender: TObject);
    procedure acShowCoworkersExecute(Sender: TObject);
    procedure acConnectWithServerExecute(Sender: TObject);
    procedure acGetServerListFastExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MSConnectionAfterConnect(Sender: TObject);
    procedure cmbServersChange(Sender: TObject);
    procedure MSConnectionError(Sender: TObject; E: EDAError; var Fail: Boolean);
    procedure acLoadQueriesExecute(Sender: TObject);
    procedure acSaveQueriesExecute(Sender: TObject);
    procedure acSaveAsQueriesExecute(Sender: TObject);
    procedure cmbQueriesChange(Sender: TObject);
    procedure cbxAllContentsClick(Sender: TObject);
    procedure acExecQueryExecute(Sender: TObject);
    procedure acEditQueriesExecute(Sender: TObject);
    procedure sbnExecuteClick(Sender: TObject);
    procedure sbnEditQueriesClick(Sender: TObject);
    procedure meQueryExit(Sender: TObject);
  private
    ProgramPath, ProgIniPath: string;
    Sections, Servers, Passwords, Queries, TmpList: TStringList;
    QList: TQueryList;
    IniFile, ProgIniFile: TMemIniFile;
    IniFileName: string;
    procedure ShowCoworkers;
    procedure ShowStatus(Status: string; Index: Integer = -1);
    procedure ConnectWithServer;
    procedure GetServerListFast;
    procedure GetServerInfo;
    procedure LoadQueries;
    procedure SaveQueries;
    procedure SaveIniFileAsQueries;
    procedure EditQueries;
    procedure AcceptQueryList(LastItem: string; LastIndex: Integer);
    procedure ExecuteQuery;
    procedure ReadSettings;
    procedure WriteSettings;
    procedure CheckDBDBParamFiles;
    procedure GetServerInfoFast;
    procedure LoadQueryFile(FileName: TFileName);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest001: TfrmTest001;

implementation

uses
  UEditQueries;

{$R *.dfm}

const
  //DBParamIni = 'DbParam.ini';
  DBParamIni: string = 'DbPrm.ini';
  idSettings = 'Settings';
  idDBParam = 'DBParamFile';
  idDBServer = 'DBServer';
  idDBQueryFile = 'DBQFile';
  idDBQuery = 'DBQuery';

type
  TSettingsRec = record
    DBParamFile: string;
    QueryFile: string;
    DBParamServer: string;
    SelectedQuery: string;
    DBParamFileExists: Boolean;
    DBQueryFileExists: Boolean;
    JustLoaded: Boolean;
  end;

var
  Settings: TSettingsRec;

procedure ClearStringsWithObjects(AStrings: TStrings);
var
  i: Integer;
begin
  for i := 0 to AStrings.Count - 1 do
    if (AStrings.Objects[i] <> nil) then
      AStrings.Objects[i].Free;
  AStrings.Clear;
end;

procedure ExtractServerList(IniFile: TCustomIniFile; Servers, Passwords, Titles:
  TStrings; Login: ShortString = 'SA');
var
  i, n: Integer;
  lgn, srv: string;
begin
  Servers.BeginUpdate;
  try
    Servers.Clear;
    Titles.Clear;
    Passwords.Clear;
    IniFile.ReadSections(Servers);
    n := Servers.Count;
    i := 0;
    Login := UpperCase(Login);
    while (i < n) do
    begin
      srv := Servers[i];
      lgn := IniFile.ReadString(srv, 'SysLogin', '');
      if (UpperCase(lgn) = Login) then
      begin
        Titles.Add(IniFile.ReadString(srv, 'Title', ''));
        Passwords.Add(IniFile.ReadString(srv, 'SysPwd', ''));
        Servers[i] := IniFile.ReadString(srv, 'SysHost', '');
        Inc(i);
      end
      else
      begin
        Servers.Delete(i);
        Dec(n);
      end;
    end;
  finally
    Servers.EndUpdate;
  end;
end;

procedure SaveIniFileAsQueryList(IniFile: TMemIniFile; Dest: TStrings; Sections:
  TStrings = nil; Queries: TStrings = nil);
var
  i: Integer;
begin
  IniFile.ReadSections(Sections);
  for i := 0 to Sections.Count - 1 do
  begin

  end;

end;

procedure TfrmTest001.SaveIniFileAsQueries();
const
  Login = 'SA';
var
  i, k: Integer;
  Item, s: string;
begin
  QList.Clear;
  IniFile.ReadSections(Sections);
  for i := 0 to Sections.Count - 1 do
  begin
    Item := Sections[i];
    s := IniFile.ReadString(Item, 'SysLogin', '');
    if (UpperCase(s) = Login) then
    begin
      IniFile.ReadSectionValues(Item, TmpList);
      QList.AddItem(Item, TmpList);
    end;
  end;
  ClearStringsWithObjects(cmbQueries.Items);
  QList.AssignToStrings(cmbQueries.Items, True);
  //QList.ExportToStrings(cmbQueries.Items);
  if QList.Count > 0 then
  begin
    cmbQueries.ItemIndex := 0;
    cmbQueriesChange(cmbQueries);
  end;  
//  if cbxAllContents.Checked then
//    QList.ExportToStrings(meQuery.Lines);
end;

procedure TfrmTest001.WriteSettings();
begin
  with Settings do
  begin
    ProgIniFile.WriteString(idSettings, idDBParam, DBParamFile);
    ProgIniFile.WriteString(idSettings, idDBServer, DBParamServer);
    ProgIniFile.WriteString(idSettings, idDBQueryFile, QueryFile);
    ProgIniFile.WriteString(idSettings, idDBQuery, cmbQueries.Text);
  end;
  ProgIniFile.UpdateFile();
end;

procedure TfrmTest001.CheckDBDBParamFiles();
begin
  with Settings do
  begin
    DBParamFileExists := (DBParamFile <> '') and FileExists(DBParamFile);
    DBQueryFileExists := (QueryFile <> '') and FileExists(QueryFile);
  end;
end;

procedure TfrmTest001.ReadSettings();
begin
  with Settings do
  begin
    DBParamFile := ProgIniFile.ReadString(idSettings, idDBParam, '');
    DBParamServer := ProgIniFile.ReadString(idSettings, idDBServer, '');
    QueryFile := ProgIniFile.ReadString(idSettings, idDBQueryFile, '');
    SelectedQuery := ProgIniFile.ReadString(idSettings, idDBQuery, '');
  end;
  CheckDBDBParamFiles();
  if Settings.DBParamFileExists then
  begin
    GetServerInfoFast();
    ConnectWithServer();
  end;
  if Settings.DBQueryFileExists then
  begin
    Settings.JustLoaded := True;
    LoadQueryFile(Settings.QueryFile);
  end;
end;

procedure TfrmTest001.FormCreate(Sender: TObject);
begin
  ProgramPath := ExtractFilePath(Application.ExeName);
  ProgIniPath := ChangeFileExt(Application.ExeName, '.ini');
  Servers := TStringList.Create();
  Passwords := TStringList.Create();
  IniFile := TMemIniFile.Create('');
  ProgIniFile := TMemIniFile.Create(ProgIniPath);
  Sections := TStringList.Create();
  TmpList := TStringList.Create();
  QList := TQueryList.Create();
  mnuEditQueries.Caption := 'Edit ...';
  sbnConnect.Caption := '';
  ReadSettings();
end;

procedure TfrmTest001.FormDestroy(Sender: TObject);
begin
  WriteSettings();
  ClearStringsWithObjects(cmbQueries.Items);
  Sections.Free();
  TmpList.Free();
  QList.Free();
  ProgIniFile.Free;
  IniFile.Free();
  Servers.Free();
  Passwords.Free();
  MSConnection.Connected := False;
end;

procedure TfrmTest001.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTest001.ShowStatus(Status: string; Index: Integer = -1);
begin
  if (Index < 0) then
    sbStatus.SimpleText := Status;
end;

procedure TfrmTest001.ShowCoworkers();
begin
  ShowStatus('Task ''' + acShowCoworkers.Caption + ''' was executed');
end;

procedure TfrmTest001.acShowCoworkersExecute(Sender: TObject);
begin
  ShowCoworkers();
end;

procedure TfrmTest001.MSConnectionAfterConnect(Sender: TObject);
begin
  ShowStatus('Connection is successful');
end;

procedure TfrmTest001.ConnectWithServer();
var
  i: Integer;
begin
  i := cmbServers.ItemIndex;
  if (i >= 0) then
  begin
    MSConnection.Server := Servers[i];
    MSConnection.Username := 'sa';
    MSConnection.Password := Passwords[i];
    MSConnection.Database := 'work';
    MSConnection.LoginPrompt := False;
    MSConnection.Connected := True;
    //if MSConnection.Connected:=
    //ShowStatus('Connection with MLKTrade Test server is successful');
  end;
end;

procedure TfrmTest001.acConnectWithServerExecute(Sender: TObject);
begin
  ConnectWithServer();
end;

procedure TfrmTest001.GetServerInfo();
begin
  if (cmbServers.ItemIndex > 0) then
  begin
//    lblSrvValue.Caption := Servers[cmbServers.ItemIndex];
//    lblPswdValue.Caption := Passwords[cmbServers.ItemIndex];
//    Settings.DBParamServer := cmbServers.Text;
    msqTest.Close;
  end;
end;

procedure TfrmTest001.GetServerListFast();
var
  i: Integer;
begin
  if Settings.DBParamFileExists then
    IniFileName := Settings.DBParamFile
  else
    IniFileName := ProgramPath + DBParamIni;
  if FileExists(IniFileName) then
  begin
    Servers.LoadFromFile(IniFileName);
    Settings.DBParamFile := IniFileName;
    IniFile.SetStrings(Servers);
    ExtractServerList(IniFile, Servers, Passwords, cmbServers.Items);
    ShowStatus('Found ' + IntToStr(Servers.Count) + ' servers');
    if (Servers.Count > 0) then
    begin
      i := cmbServers.Items.IndexOf(Settings.DBParamServer);
      if (i < 0) then
        i := 0;
      cmbServers.ItemIndex := i;
      sbnConnect.Enabled := True;
    end;
  end
  else
    ShowStatus('[Error] File not found: ' + IniFileName);
end;

procedure TfrmTest001.GetServerInfoFast();
begin
  GetServerListFast();
  GetServerInfo();
end;

procedure TfrmTest001.acGetServerListFastExecute(Sender: TObject);
begin
  GetServerInfoFast();
end;

procedure TfrmTest001.cmbServersChange(Sender: TObject);
begin
  GetServerInfo();
end;

procedure TfrmTest001.MSConnectionError(Sender: TObject; E: EDAError; var Fail: Boolean);
begin
  ShowStatus('Connection is failed');
  Fail := False;
end;

procedure TfrmTest001.LoadQueryFile(FileName: TFileName);
begin
  QList.LoadFromFile(FileName);
  if Settings.JustLoaded and (Settings.SelectedQuery <> '') then
  begin
    AcceptQueryList(Settings.SelectedQuery, -1);
    Settings.JustLoaded := False;
  end
  else
    AcceptQueryList('', -1);
  Settings.QueryFile := FileName;
  sbQueries.SimpleText := FileName;
end;

procedure TfrmTest001.LoadQueries();
begin
  if sbQueries.SimpleText <> '' then
    dlgOpenQueries.FileName := sbQueries.SimpleText
  else
    dlgOpenQueries.FileName := ProgramPath + StdSqlName;
  if dlgOpenQueries.Execute then
    LoadQueryFile(dlgOpenQueries.FileName);
end;

procedure TfrmTest001.SaveQueries();
begin
  if sbQueries.SimpleText <> '' then
    dlgSaveQueries.FileName := sbQueries.SimpleText
  else
    dlgSaveQueries.FileName := ProgramPath + StdSqlName;
  if dlgSaveQueries.Execute then
  begin
    meQuery.Lines.SaveToFile(dlgSaveQueries.FileName);
    sbQueries.SimpleText := dlgSaveQueries.FileName;
  end;
end;

procedure TfrmTest001.acLoadQueriesExecute(Sender: TObject);
begin
  LoadQueries();
end;

procedure TfrmTest001.acSaveQueriesExecute(Sender: TObject);
begin
  SaveQueries();
end;

procedure TfrmTest001.acSaveAsQueriesExecute(Sender: TObject);
begin
  SaveIniFileAsQueries();
end;

procedure TfrmTest001.cmbQueriesChange(Sender: TObject);
var
  Child: TStringList;
  Items: TStrings;
  Index: Integer;
begin
  if cbxAllContents.Checked then
    QList.ExportToStrings(meQuery.Lines)
  else
  begin
    Index := cmbQueries.ItemIndex;
    Items := cmbQueries.Items;
    if (Index < 0) or (Index >= Items.Count) then
      Exit;
    Child := TStringList(Items.Objects[Index]);
    if (Child <> nil) then
      meQuery.Lines.Assign(Child)
    else
      meQuery.Clear;
    sbnExecute.Enabled := MSConnection.Connected and (meQuery.Lines.Count > 0);
    Settings.SelectedQuery := cmbQueries.Text;
  end;
end;

procedure TfrmTest001.cbxAllContentsClick(Sender: TObject);
begin
  cmbQueries.Enabled := not cbxAllContents.Checked;
  cmbQueriesChange(Self);
end;

procedure TfrmTest001.AcceptQueryList(LastItem: string; LastIndex: Integer);
begin
  ClearStringsWithObjects(cmbQueries.Items);
  QList.AssignToStrings(cmbQueries.Items, True);
  if (QList.Count > 0) then
  begin
    if (LastItem <> '') then
      LastIndex := cmbQueries.Items.IndexOf(LastItem);
    if (LastIndex < 0) then
      LastIndex := 0;
    cmbQueries.ItemIndex := LastIndex;
    cmbQueriesChange(Self);
  end
  else
    meQuery.Clear;

end;

procedure TfrmTest001.EditQueries();
var
  LastItem: string;
  LastIndex: Integer;
  IsChanged: Boolean;
begin
  LastIndex := cmbQueries.ItemIndex;
  if (LastIndex >= 0) then
  begin
    LastItem := cmbQueries.Items[LastIndex];
    meQueryExit(Self);
  end
  else
    LastItem := '';
  QList.AssignFromStrings(cmbQueries.Items);
  if EditQueriesDialog(QList, LastIndex, IsChanged) then
  begin
    if IsChanged then
      LastItem := '';
    AcceptQueryList(LastItem, LastIndex);
  end;
end;

procedure TfrmTest001.ExecuteQuery();
begin
  msqTest.Close;
  msqTest.SQL.Clear;
  msqTest.SQL.Assign(meQuery.Lines);
  msqTest.Open;
  msqTest.First;
  pcPageControl.ActivePage := tsTest;
end;

procedure TfrmTest001.acExecQueryExecute(Sender: TObject);
begin
  ExecuteQuery();
end;

procedure TfrmTest001.acEditQueriesExecute(Sender: TObject);
begin
  EditQueries();
end;

procedure TfrmTest001.sbnExecuteClick(Sender: TObject);
begin
  ExecuteQuery();
end;

procedure TfrmTest001.sbnEditQueriesClick(Sender: TObject);
begin
  EditQueries();
end;

procedure TfrmTest001.meQueryExit(Sender: TObject);
var
  Child: TStringList;
  Items: TStrings;
  Index: Integer;
begin
  begin
    Index := cmbQueries.ItemIndex;
    Items := cmbQueries.Items;
    if (Index < 0) or (Index >= Items.Count) then
      Exit;
    Child := TStringList(Items.Objects[Index]);
    if (Child <> nil) then
      Child.Assign(meQuery.Lines);
  end;
end;

end.



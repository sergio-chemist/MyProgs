unit Test_001;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ComCtrls, StdCtrls, Menus, DB, DBAccess, MSAccess,
  ImgList, Buttons, IniFiles, MemDS, GridsEh, DBGridEh, NonVisual;

type
  TfrmTest001 = class(TForm)
    sbStatus: TStatusBar;
    pcPageControl: TPageControl;
    mmMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuExit: TMenuItem;
    gbControls: TGroupBox;
    tsCoworkers: TTabSheet;
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
    lblServer: TLabel;
    lblTitle: TLabel;
    lblPassword: TLabel;
    lblPswdValue: TLabel;
    lblSrvValue: TLabel;
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
    procedure mnuExitClick(Sender: TObject);
    procedure acShowCoworkersExecute(Sender: TObject);
    procedure acConnectWithServerExecute(Sender: TObject);
    procedure acGetServerListFastExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MSConnectionAfterConnect(Sender: TObject);
    procedure cmbServersChange(Sender: TObject);
    procedure MSConnectionError(Sender: TObject; E: EDAError;
      var Fail: Boolean);
    procedure acLoadQueriesExecute(Sender: TObject);
    procedure acSaveQueriesExecute(Sender: TObject);
    procedure acSaveAsQueriesExecute(Sender: TObject);
  private
    ProgramPath: String;
    Sections, Servers, Passwords, Queries: TStringList;
    IniFile: TMemIniFile;
    IniFileName: String;
    procedure ShowCoworkers;
    procedure ShowStatus(Status: String; Index: Integer = -1);
    procedure ConnectWithServer;
    procedure GetServerListFast;
    procedure GetServerInfo;
    procedure LoadQueries;
    procedure SaveQueries;
    procedure SaveIniFileAsQueries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest001: TfrmTest001;

implementation

{$R *.dfm}

const
  DBParamIni = 'DbParam.ini';

procedure ExtractServerList( IniFile: TCustomIniFile;
          Servers, Passwords, Titles: TStrings; Login: ShortString = 'SA');
var i, n: Integer; lgn, srv: String;
begin
  Servers.BeginUpdate;
  try
  Servers.Clear;
  Titles.Clear;
  Passwords.Clear;
  IniFile.ReadSections(Servers);
  n:= Servers.Count;
  i:= 0; Login:= UpperCase(Login);
  while (i<n) do
  begin
    srv:= Servers[i];
    lgn:= IniFile.ReadString(srv, 'SysLogin', '');
    if (UpperCase(lgn)= Login) then
       begin
         Titles.Add(IniFile.ReadString(srv, 'Title', ''));
         Passwords.Add(IniFile.ReadString(srv, 'SysPwd', ''));
         Servers[i]:= IniFile.ReadString(srv, 'SysHost', '');
         Inc(i);
       end else
       begin
         Servers.Delete(i);
         Dec(n);
       end;  
  end;
  finally
  Servers.EndUpdate;
  end;
end;

procedure TfrmTest001.SaveIniFileAsQueries();
begin

end;

procedure TfrmTest001.FormCreate(Sender: TObject);
begin
  ProgramPath:= ExtractFilePath(Application.ExeName);
  Servers:= TStringList.Create();
  Passwords:= TStringList.Create();
  IniFile:= TMemIniFile.Create('');
  sbnConnect.Caption:= '';
end;

procedure TfrmTest001.FormDestroy(Sender: TObject);
begin
  IniFile.Free();
  Servers.Free();
  Passwords.Free();
  MSConnection.Connected:= False;
end;

procedure TfrmTest001.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTest001.ShowStatus(Status: String; Index: Integer = -1);
begin
  if (Index<0) then
  sbStatus.SimpleText:= Status;
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
var i: Integer;
begin
  i:= cmbServers.ItemIndex;
  if (i>=0) then
  begin
    MSConnection.Server:= Servers[i];
    MSConnection.Username:= 'sa';
    MSConnection.Password:= Passwords[i];
    MSConnection.Database:= 'work';
    MSConnection.LoginPrompt:= False;
    MSConnection.Connected:= True;
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
  if (cmbServers.ItemIndex>0) then
  begin
    lblSrvValue.Caption:= Servers[cmbServers.ItemIndex];
    lblPswdValue.Caption:= Passwords[cmbServers.ItemIndex];
  end;
end;


procedure TfrmTest001.GetServerListFast();
begin
  IniFileName:= ProgramPath + DBParamIni;
  if FileExists(IniFileName) then
     begin
        Servers.LoadFromFile(IniFileName);
        IniFile.SetStrings(Servers);
          ExtractServerList(IniFile, Servers, Passwords, cmbServers.Items);
          ShowStatus('Found ' + IntToStr(Servers.Count) + ' servers');
          if (Servers.Count>0) then
          begin
            cmbServers.ItemIndex:= 0;
            sbnConnect.Enabled:= True;
          end;
     end;
end;


procedure TfrmTest001.acGetServerListFastExecute(Sender: TObject);
begin
  GetServerListFast();
  GetServerInfo();
end;


procedure TfrmTest001.cmbServersChange(Sender: TObject);
begin
  GetServerInfo()
end;

procedure TfrmTest001.MSConnectionError(Sender: TObject; E: EDAError;
  var Fail: Boolean);
begin
 ShowStatus('Connection is failed');
 Fail:= False;
end;

procedure TfrmTest001.LoadQueries();
begin
    if sbQueries.SimpleText <>'' then
     dlgOpenQueries.FileName:= sbQueries.SimpleText else
     dlgOpenQueries.FileName:= ProgramPath + 'Queries.qrs';
  if dlgOpenQueries.Execute then
     begin
       meQuery.Lines.LoadFromFile(dlgOpenQueries.FileName);
       sbQueries.SimpleText:= dlgOpenQueries.FileName;
     end;
end;


procedure TfrmTest001.SaveQueries();
begin
    if sbQueries.SimpleText <>'' then
     dlgSaveQueries.FileName:= sbQueries.SimpleText else
     dlgSaveQueries.FileName:= ProgramPath + 'Queries.qrs';
  if dlgSaveQueries.Execute then
     begin
       meQuery.Lines.SaveToFile(dlgSaveQueries.FileName);
       sbQueries.SimpleText:= dlgSaveQueries.FileName;
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

end.

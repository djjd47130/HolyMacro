unit JD.Clickr;

(*
  JD Clickr
  Automate UI actions
*)

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections,
  SuperObject;

type
  TClickrTaskType = (
    ctLoop,
    ctWait,
    ctMove,
    ctClick,
    ctType
    );

  TClickrMouseBtn = (cmLeft, cmRight, cmMiddle);

  TClickrDownUp = (cdDown, cdUp, cdClick);

  TClickrTask = class(TObject)
  private
    FOwner: TClickrTask;
    FTaskType: TClickrTaskType;
    FData1: Integer;
    FData2: Integer;
    FItems: TObjectList<TClickrTask>;
    procedure SetData1(const Value: Integer);
    procedure SetData2(const Value: Integer);
    procedure SetTaskType(const Value: TClickrTaskType);
    function GetItem(const Index: Integer): TClickrTask;
  public
    constructor Create(AOwner: TClickrTask);
    destructor Destroy; override;
    procedure SetLoop(const ACount: Integer);
    procedure SetWait(const AMsec: Integer);
    procedure SetMove(const AX, AY: Integer);
    procedure SetClick(const ABtn: TClickrMouseBtn; const ADownUp: TClickrDownUp);
    procedure SetType(const AKey: Word; const ADownUp: TClickrDownUp);

    property TaskType: TClickrTaskType read FTaskType write SetTaskType;
    property Data1: Integer read FData1 write SetData1;
    property Data2: Integer read FData2 write SetData2;

    function DisplayName: String;

    function Add: TClickrTask;
    procedure Delete(const Index: Integer);
    function Count: Integer;
    procedure Clear;
    property Items[const Index: Integer]: TClickrTask read GetItem; default;
  end;

  TClickr = class(TComponent)
  private
    FTasks: TClickrTask;
    procedure LoadNode(ATask: TClickrTask; AObj: ISuperObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromFile(const Filename: String);
    procedure SaveToFile(const Filename: String);
    property Tasks: TClickrTask read FTasks;
  published

  end;

implementation

function msToHourMinSec(AMilliseconds: Integer): String;
var
  t: Double;
begin
  t := AMilliseconds/ MSecsPerDay;
  Result := FormatDateTime('h:nn:ss.zzz', t);

  {
  // or: if you want to split off full days
  if t < 1 then
    Result := FormatDateTime('h:nn:ss.zzz', t)
  else
    Result := IntToStr(trunc(t)) + ' days ' + FormatDateTime('h:nn:ss.zzz', t);
  }
end;

{ TClickrTask }

constructor TClickrTask.Create(AOwner: TClickrTask);
begin
  FOwner:= AOwner;
  FItems:= TObjectList<TClickrTask>.Create(True);
end;

destructor TClickrTask.Destroy;
begin
  FItems.Clear;
  FItems.Free;
  inherited;
end;

function IntToStrDef(const I: Integer; const Def: String): String;
begin
  if I = 0 then
    Result:= Def
  else
    Result:= IntToStr(I);
end;

function TClickrTask.DisplayName: String;
begin
  case FTaskType of
    ctLoop:   Result:= 'Loop '+IntToStrDef(FData1, 'infinite')+' times';
    ctWait:   Result:= 'Wait '+msToHourMinSec(FData1); //+' msec';
    ctMove:   Result:= 'Move to '+IntToStr(FData1)+' x '+IntToStr(FData2);
    ctClick:  begin
      Result:= 'Click ';
      case TClickrMouseBtn(FData1) of
        cmLeft:   Result:= Result + 'Left';
        cmRight:  Result:= Result + 'Right';
        cmMiddle: Result:= Result + 'Middle';
      end;
      Result:= Result + ' Btn ';
      case TClickrDownUp(FData2) of
        cdDown:   Result:= Result + 'Down';
        cdUp:     Result:= Result + 'Up';
        cdCLick:  Result:= Result + 'Down and Up';
      end;
    end;
    ctType:   begin
      Result:= 'Type '+Chr(FData1);
      case TClickrDownUp(FData2) of
        cdDown:   Result:= Result + 'Down';
        cdUp:     Result:= Result + 'Up';
        cdCLick:  Result:= Result + 'Down and Up';
      end;
    end;
  end;
end;

procedure TClickrTask.SetTaskType(const Value: TClickrTaskType);
begin
  FTaskType := Value;
end;

procedure TClickrTask.SetData1(const Value: Integer);
begin
  FData1 := Value;
end;

procedure TClickrTask.SetData2(const Value: Integer);
begin
  FData2 := Value;
end;

procedure TClickrTask.SetLoop(const ACount: Integer);
begin
  FTaskType:= ctLoop;
  FData1:= ACount;
end;

procedure TClickrTask.SetMove(const AX, AY: Integer);
begin
  FTaskType:= ctMove;
  FData1:= AX;
  FData2:= AY;
end;

procedure TClickrTask.SetClick(const ABtn: TClickrMouseBtn;
  const ADownUp: TClickrDownUp);
begin
  FTaskType:= ctClick;
  FData1:= Integer(ABtn);
  FData2:= Integer(ADownUp);
end;

procedure TClickrTask.SetType(const AKey: Word; const ADownUp: TClickrDownUp);
begin
  FTaskType:= ctType;
  FData1:= AKey;
  FData2:= Integer(ADownUp);
end;

procedure TClickrTask.SetWait(const AMsec: Integer);
begin
  FTaskType:= ctWait;
  FData2:= AMsec;
end;

function TClickrTask.Add: TClickrTask;
begin
  Result:= TClickrTask.Create(Self);
  FItems.Add(Result);
end;

procedure TClickrTask.Clear;
begin
  FItems.Clear;
end;

function TClickrTask.Count: Integer;
begin
  Result:= FItems.Count;
end;

procedure TClickrTask.Delete(const Index: Integer);
begin
  FItems.Delete(Index);
end;

function TClickrTask.GetItem(const Index: Integer): TClickrTask;
begin
  Result:= FItems[Index];
end;

{ TClickr }

constructor TClickr.Create(AOwner: TComponent);
begin
  inherited;
  FTasks:= TClickrTask.Create(nil);

end;

destructor TClickr.Destroy;
begin

  FTasks.Free;
  inherited;
end;

procedure TCLickr.LoadNode(ATask: TClickrTask; AObj: ISuperObject);
var
  A: TSuperArray;
  X: Integer;
  O: ISuperObject;
  T: TClickrTask;
begin
  ATask.FTaskType:= TClickrTaskType(AObj.I['type']);
  ATask.FData1:= AObj.I['data1'];
  ATask.FData2:= AObj.I['data2'];
  A:= AObj.A['items'];
  if A <> nil then begin
    for X := 0 to A.Length-1 do begin
      O:= A.O[X];
      T:= ATask.Add;
      LoadNode(T, O);
    end;
  end;
end;

procedure TClickr.LoadFromFile(const Filename: String);
var
  F: ISuperObject;
  L: TStringList;
begin
  FTasks.Clear;
  L:= TStringList.Create;
  try
    L.LoadFromFile(Filename);
    F:= SO(L.Text);
    if Assigned(F) then begin
      LoadNode(FTasks, F);
    end else begin
      raise Exception.Create('Not a valid JSON file.');
    end;
  finally
    L.Free;
  end;
end;

procedure TClickr.SaveToFile(const Filename: String);
begin

end;

end.

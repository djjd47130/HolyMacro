unit JD.HolyMacro.Scripting;

interface

uses
  Winapi.Windows,
  System.Classes, System.SysUtils, System.Types,
  Vcl.Forms, Vcl.Controls;

const
  KEYEVENTF_KEYDOWN = 0;

type
  TMouse = class
  public
    class function GetPos: TPoint;
    class function GetPosX: Integer;
    class function GetPosY: Integer;
    class procedure SetPosX(const Value: Integer);
    class procedure SetPosY(const Value: Integer);
    class procedure SetPos(const X, Y: Integer); overload;
    class procedure SetPos(const P: TPoint); overload;

    class procedure LeftDown; overload;
    class procedure LeftUp; overload;
    class procedure LeftClick; overload;
    class procedure RightDown; overload;
    class procedure RightUp; overload;
    class procedure RightClick; overload;
    class procedure MiddleDown; overload;
    class procedure MiddleUp; overload;
    class procedure MiddleClick; overload;

    class procedure LeftDown(const X, Y: Integer); overload;
    class procedure LeftUp(const X, Y: Integer); overload;
    class procedure LeftClick(const X, Y: Integer); overload;
    class procedure RightDown(const X, Y: Integer); overload;
    class procedure RightUp(const X, Y: Integer); overload;
    class procedure RightClick(const X, Y: Integer); overload;
    class procedure MiddleDown(const X, Y: Integer); overload;
    class procedure MiddleUp(const X, Y: Integer); overload;
    class procedure MiddleClick(const X, Y: Integer); overload;

    class procedure LeftDown(const P: TPoint); overload;
    class procedure LeftUp(const P: TPoint); overload;
    class procedure LeftClick(const P: TPoint); overload;
    class procedure RightDown(const P: TPoint); overload;
    class procedure RightUp(const P: TPoint); overload;
    class procedure RightClick(const P: TPoint); overload;
    class procedure MiddleDown(const P: TPoint); overload;
    class procedure MiddleUp(const P: TPoint); overload;
    class procedure MiddleClick(const P: TPoint); overload;

    class procedure KeyDown(const AKey: WORD);
    class procedure KeyUp(const AKey: WORD);
    class procedure KeyPress(const AKey: WORD);

  end;

implementation

{ TMouse }

class function TMouse.GetPos: TPoint;
begin
  Result:= Mouse.CursorPos;
end;

class function TMouse.GetPosX: Integer;
begin
  Result:= Mouse.CursorPos.X;
end;

class function TMouse.GetPosY: Integer;
begin
  Result:= Mouse.CursorPos.Y;
end;

class procedure TMouse.SetPosX(const Value: Integer);
begin
  SetCursorPos(Value, GetPosY);
end;

class procedure TMouse.SetPosY(const Value: Integer);
begin
  SetCursorPos(GetPosX, Value);
end;

class procedure TMouse.SetPos(const X, Y: Integer);
begin
  SetCursorPos(X, Y);
end;

class procedure TMouse.SetPos(const P: TPoint);
begin
  SetCursorPos(P.X, P.Y);
end;





class procedure TMouse.LeftClick;
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

class procedure TMouse.LeftDown;
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
end;

class procedure TMouse.LeftUp;
begin
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

class procedure TMouse.RightClick;
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
end;

class procedure TMouse.RightDown;
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
end;

class procedure TMouse.RightUp;
begin
  mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
end;

class procedure TMouse.MiddleClick;
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0);
end;

class procedure TMouse.MiddleDown;
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0);
end;

class procedure TMouse.MiddleUp;
begin
  mouse_event(MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0);
end;





class procedure TMouse.LeftClick(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, X, Y, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, X, Y, 0, 0);
end;

class procedure TMouse.LeftDown(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, X, Y, 0, 0);
end;

class procedure TMouse.LeftUp(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_LEFTUP, X, Y, 0, 0);
end;

class procedure TMouse.RightClick(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, X, Y, 0, 0);
  mouse_event(MOUSEEVENTF_RIGHTUP, X, Y, 0, 0);
end;

class procedure TMouse.RightDown(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, X, Y, 0, 0);
end;

class procedure TMouse.RightUp(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_RIGHTUP, X, Y, 0, 0);
end;

class procedure TMouse.MiddleClick(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, X, Y, 0, 0);
  mouse_event(MOUSEEVENTF_MIDDLEUP, X, Y, 0, 0);
end;

class procedure TMouse.MiddleDown(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, X, Y, 0, 0);
end;

class procedure TMouse.MiddleUp(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_MIDDLEUP, X, Y, 0, 0);
end;





class procedure TMouse.LeftClick(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, P.X, P.Y, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, P.X, P.Y, 0, 0);
end;

class procedure TMouse.LeftDown(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, P.X, P.Y, 0, 0);
end;

class procedure TMouse.LeftUp(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_LEFTUP, P.X, P.Y, 0, 0);
end;

class procedure TMouse.RightClick(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, P.X, P.Y, 0, 0);
  mouse_event(MOUSEEVENTF_RIGHTUP, P.X, P.Y, 0, 0);
end;

class procedure TMouse.RightDown(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, P.X, P.Y, 0, 0);
end;

class procedure TMouse.RightUp(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_RIGHTUP, P.X, P.Y, 0, 0);
end;

class procedure TMouse.MiddleClick(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, P.X, P.Y, 0, 0);
  mouse_event(MOUSEEVENTF_MIDDLEUP, P.X, P.Y, 0, 0);
end;

class procedure TMouse.MiddleDown(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, P.X, P.Y, 0, 0);
end;

class procedure TMouse.MiddleUp(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_MIDDLEUP, P.X, P.Y, 0, 0);
end;





class procedure TMouse.KeyDown(const AKey: WORD);
begin
  keybd_event(AKey, 0, KEYEVENTF_KEYDOWN, 0);
end;

class procedure TMouse.KeyUp(const AKey: WORD);
begin
  keybd_event(AKey, 0, KEYEVENTF_KEYUP, 0);
end;

class procedure TMouse.KeyPress(const AKey: WORD);
begin
  keybd_event(AKey, 0, KEYEVENTF_KEYDOWN, 0);
  keybd_event(AKey, 0, KEYEVENTF_KEYUP, 0);
end;

end.

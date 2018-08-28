unit JD.HolyMacro;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.SysUtils, System.Types,
  Vcl.Forms, Vcl.Controls;

{ Mouse Controls }

type
  THolyMacroMouse = class
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
  end;

{ Keyboard Controls }

const
  KEYEVENTF_KEYDOWN = 0;

type
  THolyMacroKeyboard = class
    class procedure KeyDown(const AKey: WORD);
    class procedure KeyUp(const AKey: WORD);
    class procedure KeyPress(const AKey: WORD);
  end;

implementation

{ THolyMacroMouse }

class function THolyMacroMouse.GetPos: TPoint;
begin
  Result:= Mouse.CursorPos;
end;

class function THolyMacroMouse.GetPosX: Integer;
begin
  Result:= Mouse.CursorPos.X;
end;

class function THolyMacroMouse.GetPosY: Integer;
begin
  Result:= Mouse.CursorPos.Y;
end;

class procedure THolyMacroMouse.SetPosX(const Value: Integer);
begin
  SetCursorPos(Value, GetPosY);
end;

class procedure THolyMacroMouse.SetPosY(const Value: Integer);
begin
  SetCursorPos(GetPosX, Value);
end;

class procedure THolyMacroMouse.SetPos(const X, Y: Integer);
begin
  SetCursorPos(X, Y);
end;

class procedure THolyMacroMouse.SetPos(const P: TPoint);
begin
  SetCursorPos(P.X, P.Y);
end;

class procedure THolyMacroMouse.LeftClick;
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.LeftDown;
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.LeftUp;
begin
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.RightClick;
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.RightDown;
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.RightUp;
begin
  mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.MiddleClick;
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.MiddleDown;
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.MiddleUp;
begin
  mouse_event(MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0);
end;

class procedure THolyMacroMouse.LeftClick(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, X, Y, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.LeftDown(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.LeftUp(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_LEFTUP, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.RightClick(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, X, Y, 0, 0);
  mouse_event(MOUSEEVENTF_RIGHTUP, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.RightDown(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.RightUp(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_RIGHTUP, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.MiddleClick(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, X, Y, 0, 0);
  mouse_event(MOUSEEVENTF_MIDDLEUP, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.MiddleDown(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.MiddleUp(const X, Y: Integer);
begin
  mouse_event(MOUSEEVENTF_MIDDLEUP, X, Y, 0, 0);
end;

class procedure THolyMacroMouse.LeftClick(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, P.X, P.Y, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.LeftDown(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.LeftUp(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_LEFTUP, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.RightClick(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, P.X, P.Y, 0, 0);
  mouse_event(MOUSEEVENTF_RIGHTUP, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.RightDown(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.RightUp(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_RIGHTUP, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.MiddleClick(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, P.X, P.Y, 0, 0);
  mouse_event(MOUSEEVENTF_MIDDLEUP, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.MiddleDown(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_MIDDLEDOWN, P.X, P.Y, 0, 0);
end;

class procedure THolyMacroMouse.MiddleUp(const P: TPoint);
begin
  mouse_event(MOUSEEVENTF_MIDDLEUP, P.X, P.Y, 0, 0);
end;

{ THolyMacroKeyboard }

class procedure THolyMacroKeyboard.KeyDown(const AKey: WORD);
begin
  keybd_event(AKey, 0, KEYEVENTF_KEYDOWN, 0);
end;

class procedure THolyMacroKeyboard.KeyUp(const AKey: WORD);
begin
  keybd_event(AKey, 0, KEYEVENTF_KEYUP, 0);
end;

class procedure THolyMacroKeyboard.KeyPress(const AKey: WORD);
begin
  keybd_event(AKey, 0, KEYEVENTF_KEYDOWN, 0);
  keybd_event(AKey, 0, KEYEVENTF_KEYUP, 0);
end;

end.

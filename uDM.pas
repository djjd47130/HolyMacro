unit uDM;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs, JD.Ctrls.FontButton,
  JD.Graphics, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TDM = class(TDataModule)
    img16: TImageList;
    img24: TImageList;
    Glyphs: TRMProFontGlyphs;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

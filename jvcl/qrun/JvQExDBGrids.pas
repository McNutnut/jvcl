{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExDBGrids.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

unit JvQExDBGrids;

{$I jvcl.inc}
{MACROINCLUDE JvQExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExCLX/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

interface

uses
  Classes, SysUtils,
  QGraphics, QControls, QForms, QExtCtrls, QDBGrids,
  Qt, QWindows, QMessages,
  JvQTypes, JvQThemes, JVCLXVer, JvQExControls;

type
  { QControl begin }
  TJvExCustomDBGrid = class(TCustomDBGrid)
  { QControl }
  private
    FAboutJVCL: TJVCLAboutInfo;
    FDesktopFont: Boolean;
    FDragCursor: TCursor;
    FDragKind: TDragKind;
    FHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
    FWindowProc: TWndMethod;
    procedure SetDesktopFont(Value: Boolean);
    procedure CMHitTest(var Mesg: TJvMessage); message CM_HITTEST;
    procedure CMHintShow(var Mesg: TJvMessage); message CM_HINTSHOW;
    procedure CMSysFontChanged(var Mesg: TMessage); message CM_SYSFONTCHANGED;
  protected
    procedure ColorChanged; override;
    procedure EnabledChanged; override;
    procedure FocusChanged; dynamic;
    function HitTest(X, Y: integer): Boolean; override;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure ParentColorChanged; override;
    procedure TextChanged; override;
    procedure VisibleChanged; override;
    function HintShow(var HintInfo : THintInfo): Boolean; override;
    procedure WndProc(var Mesg: TMessage); dynamic;
    property DragCursor: TCursor read FDragCursor write FDragCursor stored False; { not implemented }
    property DragKind: TDragKind read FDragKind write FDragKind stored false; { not implemented }
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
    property DesktopFont: Boolean read FDesktopFont write SetDesktopFont default false;
  public
    procedure Dispatch(var Mesg); override;
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
    property WindowProc: TWndMethod read FWindowProc write FWindowProc;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
    property HintColor: TColor read FHintColor write FHintColor default clDefault;
  protected
    procedure FontChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  
  { QControl begin }
  TJvExDBGrid = class(TDBGrid)
  { QControl }
  private
    FAboutJVCL: TJVCLAboutInfo;
    FDesktopFont: Boolean;
    FDragCursor: TCursor;
    FDragKind: TDragKind;
    FHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
    FWindowProc: TWndMethod;
    procedure SetDesktopFont(Value: Boolean);
    procedure CMHitTest(var Mesg: TJvMessage); message CM_HITTEST;
    procedure CMHintShow(var Mesg: TJvMessage); message CM_HINTSHOW;
    procedure CMSysFontChanged(var Mesg: TMessage); message CM_SYSFONTCHANGED;
  protected
    procedure ColorChanged; override;
    procedure EnabledChanged; override;
    procedure FocusChanged; dynamic;
    function HitTest(X, Y: integer): Boolean; override;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure ParentColorChanged; override;
    procedure TextChanged; override;
    procedure VisibleChanged; override;
    function HintShow(var HintInfo : THintInfo): Boolean; override;
    procedure WndProc(var Mesg: TMessage); dynamic;
    property DragCursor: TCursor read FDragCursor write FDragCursor stored False; { not implemented }
    property DragKind: TDragKind read FDragKind write FDragKind stored false; { not implemented }
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
    property DesktopFont: Boolean read FDesktopFont write SetDesktopFont default false;
  public
    procedure Dispatch(var Mesg); override;
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
    property WindowProc: TWndMethod read FWindowProc write FWindowProc;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
    property HintColor: TColor read FHintColor write FHintColor default clDefault;
  protected
    procedure FontChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  

implementation

{$IFDEF UNITVERSIONING}
uses
  JclUnitVersioning;
{$ENDIF UNITVERSIONING}

{ QControl Create }
constructor TJvExCustomDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHintColor := clDefault;
  FWindowProc := WndProc;
  
end;

destructor TJvExCustomDBGrid.Destroy;
begin
  
  inherited Destroy;
end;
 
procedure TJvExCustomDBGrid.WndProc(var Mesg: TMessage);
begin
  //OutputDebugString(PAnsiChar(Format('JV_CONTROL %s: %s Msg $%x',[Name, ClassName, Mesg.Msg])));
  with TJvMessage(Mesg) do
  begin
    case Msg of
      { Control Messages }
      CM_FOCUSCHANGED: FocusChanged;
      CM_MOUSEENTER: FMouseOver := True;
      CM_MOUSELEAVE: FMouseOver := False;
      CM_HINTSHOW:
        case FHintColor of
          clNone   : HintInfo^.HintColor := Application.HintColor;
          clDefault: HintInfo^.HintColor := GetHintColor(Parent);
        else
          HintInfo^.HintColor := FHintcolor;
        end;

    end;
  end;
  inherited Dispatch(Mesg);
end;

procedure TJvExCustomDBGrid.CMHitTest(var Mesg: TJvMessage);
begin
  with Mesg do
  begin
    Handled := inherited HitTest(XPos, YPos);
    if Handled then
      Result := HTCLIENT;
  end;
end;

procedure TJvExCustomDBGrid.ColorChanged;
begin
  Perform(CM_COLORCHANGED, 0, 0);
  inherited ColorChanged;
end;

procedure TJvExCustomDBGrid.FontChanged;
begin
  Perform(CM_FONTCHANGED, 0, 0);
  inherited FontChanged;
end;

procedure TJvExCustomDBGrid.FocusChanged;
begin
  { notification }
end;
 
{ QControl Common}

function TJvExCustomDBGrid.HitTest(X, Y: integer): Boolean;
begin
   Result := Perform(CM_HITTEST, 0, 0) <> HTNOWHERE;
end;

procedure TJvExCustomDBGrid.CMHintShow(var Mesg: TJvMessage);
begin
  with Mesg do
  begin
    Handled := inherited HintShow(HintInfo^);
  end;
end;

procedure TJvExCustomDBGrid.CMSysFontChanged(var Mesg: TMessage);
begin
  if FDesktopFont then
  begin
    Font.Assign(Application.Font);
    FDesktopFont := True;
  end;
end;

procedure TJvExCustomDBGrid.EnabledChanged;
begin
  Perform(CM_ENABLEDCHANGED, 0, 0);
  inherited EnabledChanged;
end;

procedure TJvExCustomDBGrid.TextChanged;
begin
  Perform(CM_TEXTCHANGED, 0, 0);
  inherited TextChanged;
end;

procedure TJvExCustomDBGrid.VisibleChanged;
begin
  Perform(CM_VISIBLECHANGED, 0, 0);
  inherited VisibleChanged;
end;

function TJvExCustomDBGrid.HintShow(var HintInfo : THintInfo): Boolean;
begin
  Result := Perform(CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

procedure TJvExCustomDBGrid.MouseEnter(AControl: TControl);
begin
  Perform(CM_MOUSEENTER, 0, 0);
  inherited MouseEnter(AControl);
end;

procedure TJvExCustomDBGrid.MouseLeave(AControl: TControl);
begin
  Perform(CM_MOUSELEAVE, 0, 0);
  inherited MouseLeave(AControl);
end;

procedure TJvExCustomDBGrid.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

procedure TJvExCustomDBGrid.SetDesktopFont(Value: Boolean);
begin
  if FDesktopFont <> Value then
  begin
    FDesktopFont := Value;
    Perform(CM_SYSFONTCHANGED, 0, 0);
  end;
end;

procedure TJvExCustomDBGrid.Dispatch(var Mesg);
begin
  if Assigned(FWindowProc) then
    FWindowProc(TMessage(Mesg))
  else
    inherited Dispatch(Mesg);
end;

function TJvExCustomDBGrid.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Msg := Msg;
  Mesg.WParam := WParam;
  Mesg.LParam := LParam;
  Mesg.Result := 0;
  Dispatch(Mesg);
  Result := Mesg.Result;
end;

function TJvExCustomDBGrid.IsRightToLeft: Boolean;
begin
  Result := False;
end;
  
{ QControl Create }
constructor TJvExDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHintColor := clDefault;
  FWindowProc := WndProc;
  
end;

destructor TJvExDBGrid.Destroy;
begin
  
  inherited Destroy;
end;
 
procedure TJvExDBGrid.WndProc(var Mesg: TMessage);
begin
  //OutputDebugString(PAnsiChar(Format('JV_CONTROL %s: %s Msg $%x',[Name, ClassName, Mesg.Msg])));
  with TJvMessage(Mesg) do
  begin
    case Msg of
      { Control Messages }
      CM_FOCUSCHANGED: FocusChanged;
      CM_MOUSEENTER: FMouseOver := True;
      CM_MOUSELEAVE: FMouseOver := False;
      CM_HINTSHOW:
        case FHintColor of
          clNone   : HintInfo^.HintColor := Application.HintColor;
          clDefault: HintInfo^.HintColor := GetHintColor(Parent);
        else
          HintInfo^.HintColor := FHintcolor;
        end;

    end;
  end;
  inherited Dispatch(Mesg);
end;

procedure TJvExDBGrid.CMHitTest(var Mesg: TJvMessage);
begin
  with Mesg do
  begin
    Handled := inherited HitTest(XPos, YPos);
    if Handled then
      Result := HTCLIENT;
  end;
end;

procedure TJvExDBGrid.ColorChanged;
begin
  Perform(CM_COLORCHANGED, 0, 0);
  inherited ColorChanged;
end;

procedure TJvExDBGrid.FontChanged;
begin
  Perform(CM_FONTCHANGED, 0, 0);
  inherited FontChanged;
end;

procedure TJvExDBGrid.FocusChanged;
begin
  { notification }
end;
 
{ QControl Common}

function TJvExDBGrid.HitTest(X, Y: integer): Boolean;
begin
   Result := Perform(CM_HITTEST, 0, 0) <> HTNOWHERE;
end;

procedure TJvExDBGrid.CMHintShow(var Mesg: TJvMessage);
begin
  with Mesg do
  begin
    Handled := inherited HintShow(HintInfo^);
  end;
end;

procedure TJvExDBGrid.CMSysFontChanged(var Mesg: TMessage);
begin
  if FDesktopFont then
  begin
    Font.Assign(Application.Font);
    FDesktopFont := True;
  end;
end;

procedure TJvExDBGrid.EnabledChanged;
begin
  Perform(CM_ENABLEDCHANGED, 0, 0);
  inherited EnabledChanged;
end;

procedure TJvExDBGrid.TextChanged;
begin
  Perform(CM_TEXTCHANGED, 0, 0);
  inherited TextChanged;
end;

procedure TJvExDBGrid.VisibleChanged;
begin
  Perform(CM_VISIBLECHANGED, 0, 0);
  inherited VisibleChanged;
end;

function TJvExDBGrid.HintShow(var HintInfo : THintInfo): Boolean;
begin
  Result := Perform(CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

procedure TJvExDBGrid.MouseEnter(AControl: TControl);
begin
  Perform(CM_MOUSEENTER, 0, 0);
  inherited MouseEnter(AControl);
end;

procedure TJvExDBGrid.MouseLeave(AControl: TControl);
begin
  Perform(CM_MOUSELEAVE, 0, 0);
  inherited MouseLeave(AControl);
end;

procedure TJvExDBGrid.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

procedure TJvExDBGrid.SetDesktopFont(Value: Boolean);
begin
  if FDesktopFont <> Value then
  begin
    FDesktopFont := Value;
    Perform(CM_SYSFONTCHANGED, 0, 0);
  end;
end;

procedure TJvExDBGrid.Dispatch(var Mesg);
begin
  if Assigned(FWindowProc) then
    FWindowProc(TMessage(Mesg))
  else
    inherited Dispatch(Mesg);
end;

function TJvExDBGrid.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Msg := Msg;
  Mesg.WParam := WParam;
  Mesg.LParam := LParam;
  Mesg.Result := 0;
  Dispatch(Mesg);
  Result := Mesg.Result;
end;

function TJvExDBGrid.IsRightToLeft: Boolean;
begin
  Result := False;
end;
  

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$RCSfile$';
    Revision: '$Revision$';
    Date: '$Date$';
    LogPath: 'JVCL\qrun'
  );

initialization
  RegisterUnitVersion(HInstance, UnitVersioning);

finalization
  UnregisterUnitVersion(HInstance);
{$ENDIF UNITVERSIONING}

end.

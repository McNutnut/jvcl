{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExStdCtrls.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas.Hausladen@gmx.de]
Portions created by Andreas Hausladen are Copyright (C) 2003 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

Last Modified: 2004-01-13

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
{$I jvcl.inc}

unit JvExStdCtrls;
interface
uses
  {$IFDEF VCL}
  Windows, Messages, Graphics, Controls, Forms, StdCtrls,
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  Qt, QGraphics, QControls, QForms, QStdCtrls,
  {$ENDIF VisualCLX}
  Classes, SysUtils,
  JvThemes, JvExControls;

{$IFDEF VCL}
 {$DEFINE NeedMouseEnterLeave}
{$ELSE}
 {$IF not declared(PatchedVCLX)}
  {$DEFINE NeedMouseEnterLeave}
 {$IFEND}
{$ENDIF VCL}

type
  TJvExCustomGroupBox = class(TCustomGroupBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExGroupBox = class(TGroupBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
{$DEFINE HASAUTOSIZE}
  TJvExCustomLabel = class(TCustomLabel, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  
  end;
  
  TJvExLabel = class(TLabel, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  
  end;
  
{$UNDEF HASAUTOSIZE}
  TJvExCustomEdit = class(TCustomEdit, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExEdit = class(TEdit, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExCustomMemo = class(TCustomMemo, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExMemo = class(TMemo, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
{$IFDEF VCL}
 {$IFDEF COMPILER6_UP}
  TJvExCustomCombo = class(TCustomCombo, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
 {$ENDIF COMPILER6_UP}
{$ENDIF VCL}
  TJvExCustomComboBox = class(TCustomComboBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExComboBox = class(TComboBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExButtonControl = class(TButtonControl, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExButton = class(TButton, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExCustomCheckBox = class(TCustomCheckBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExCheckBox = class(TCheckBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExRadioButton = class(TRadioButton, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExCustomListBox = class(TCustomListBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExListBox = class(TListBox, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExScrollBar = class(TScrollBar, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
{$IFDEF VCL}
  TJvExCustomStaticText = class(TCustomStaticText, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
  TJvExStaticText = class(TStaticText, IJvWinControlEvents, IJvControlEvents)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  protected
   {$IF not declared(PatchedVCLX)}
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
   {$IFEND}
  protected
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  {$IFDEF NeedMouseEnterLeave}
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  end;
  
{$ENDIF VCL}

implementation

{$IFDEF VCL}
procedure TJvExCustomGroupBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomGroupBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomGroupBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomGroupBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomGroupBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomGroupBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomGroupBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomGroupBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomGroupBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomGroupBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomGroupBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomGroupBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomGroupBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomGroupBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomGroupBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomGroupBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomGroupBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomGroupBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomGroupBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomGroupBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomGroupBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomGroupBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomGroupBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomGroupBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomGroupBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomGroupBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomGroupBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomGroupBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomGroupBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomGroupBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomGroupBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomGroupBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomGroupBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomGroupBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomGroupBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExGroupBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExGroupBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExGroupBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExGroupBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExGroupBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExGroupBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExGroupBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExGroupBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExGroupBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExGroupBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExGroupBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExGroupBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExGroupBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExGroupBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExGroupBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExGroupBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExGroupBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExGroupBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExGroupBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExGroupBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExGroupBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExGroupBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExGroupBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExGroupBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExGroupBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExGroupBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExGroupBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExGroupBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExGroupBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExGroupBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExGroupBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExGroupBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExGroupBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExGroupBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExGroupBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$DEFINE HASAUTOSIZE}
{$IFDEF VCL}
procedure TJvExCustomLabel.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomLabel.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomLabel.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomLabel.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomLabel.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomLabel.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomLabel.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomLabel.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomLabel.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomLabel.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomLabel.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomLabel.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomLabel.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomLabel.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomLabel.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomLabel.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomLabel.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
{$ENDIF VisualCLX}
procedure TJvExCustomLabel.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomLabel.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomLabel.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;

constructor TJvExCustomLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomLabel.Destroy;
begin
  
  inherited Destroy;
end;
{$IFDEF VCL}
procedure TJvExLabel.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExLabel.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExLabel.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExLabel.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExLabel.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExLabel.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExLabel.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExLabel.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExLabel.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExLabel.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExLabel.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExLabel.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExLabel.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExLabel.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExLabel.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExLabel.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExLabel.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
{$ENDIF VisualCLX}
procedure TJvExLabel.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExLabel.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExLabel.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;

constructor TJvExLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExLabel.Destroy;
begin
  
  inherited Destroy;
end;
{$UNDEF HASAUTOSIZE}
{$IFDEF VCL}
procedure TJvExCustomEdit.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomEdit.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomEdit.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomEdit.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomEdit.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomEdit.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomEdit.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomEdit.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomEdit.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomEdit.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomEdit.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomEdit.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomEdit.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomEdit.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomEdit.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomEdit.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomEdit.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomEdit.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomEdit.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomEdit.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomEdit.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomEdit.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomEdit.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomEdit.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomEdit.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomEdit.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomEdit.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExEdit.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExEdit.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExEdit.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExEdit.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExEdit.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExEdit.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExEdit.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExEdit.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExEdit.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExEdit.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExEdit.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExEdit.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExEdit.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExEdit.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExEdit.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExEdit.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExEdit.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExEdit.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExEdit.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExEdit.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExEdit.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExEdit.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExEdit.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExEdit.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExEdit.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExEdit.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExEdit.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExCustomMemo.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomMemo.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomMemo.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomMemo.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomMemo.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomMemo.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomMemo.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomMemo.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomMemo.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomMemo.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomMemo.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomMemo.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomMemo.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomMemo.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomMemo.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomMemo.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomMemo.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomMemo.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomMemo.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomMemo.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomMemo.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomMemo.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomMemo.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomMemo.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomMemo.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomMemo.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomMemo.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomMemo.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomMemo.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomMemo.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomMemo.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomMemo.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomMemo.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomMemo.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomMemo.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExMemo.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExMemo.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExMemo.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExMemo.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExMemo.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExMemo.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExMemo.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExMemo.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExMemo.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExMemo.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExMemo.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExMemo.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExMemo.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExMemo.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExMemo.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExMemo.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExMemo.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExMemo.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExMemo.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExMemo.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExMemo.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExMemo.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExMemo.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExMemo.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExMemo.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExMemo.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExMemo.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExMemo.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExMemo.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExMemo.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExMemo.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExMemo.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExMemo.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExMemo.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExMemo.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
 {$IFDEF COMPILER6_UP}
{$IFDEF VCL}
procedure TJvExCustomCombo.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomCombo.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomCombo.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomCombo.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomCombo.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomCombo.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomCombo.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomCombo.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomCombo.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomCombo.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomCombo.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomCombo.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomCombo.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomCombo.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomCombo.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomCombo.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomCombo.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomCombo.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomCombo.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomCombo.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomCombo.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomCombo.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomCombo.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomCombo.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomCombo.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomCombo.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomCombo.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomCombo.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomCombo.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomCombo.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomCombo.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomCombo.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomCombo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomCombo.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomCombo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomCombo.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomCombo.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
 {$ENDIF COMPILER6_UP}
{$ENDIF VCL}
{$IFDEF VCL}
procedure TJvExCustomComboBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomComboBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomComboBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomComboBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomComboBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomComboBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomComboBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomComboBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomComboBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomComboBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomComboBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomComboBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomComboBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomComboBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomComboBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomComboBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomComboBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomComboBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomComboBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomComboBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomComboBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomComboBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomComboBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomComboBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomComboBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomComboBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomComboBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomComboBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomComboBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomComboBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomComboBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomComboBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomComboBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomComboBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomComboBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExComboBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExComboBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExComboBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExComboBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExComboBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExComboBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExComboBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExComboBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExComboBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExComboBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExComboBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExComboBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExComboBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExComboBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExComboBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExComboBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExComboBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExComboBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExComboBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExComboBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExComboBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExComboBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExComboBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExComboBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExComboBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExComboBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExComboBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExComboBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExComboBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExComboBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExComboBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExComboBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExComboBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExComboBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExComboBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExButtonControl.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExButtonControl.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExButtonControl.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExButtonControl.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExButtonControl.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExButtonControl.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExButtonControl.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExButtonControl.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExButtonControl.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExButtonControl.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExButtonControl.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExButtonControl.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExButtonControl.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExButtonControl.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExButtonControl.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExButtonControl.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExButtonControl.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExButtonControl.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExButtonControl.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExButtonControl.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExButtonControl.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExButtonControl.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExButtonControl.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExButtonControl.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExButtonControl.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExButtonControl.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExButtonControl.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExButtonControl.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExButtonControl.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExButtonControl.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExButtonControl.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExButtonControl.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExButtonControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExButtonControl.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExButtonControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExButtonControl.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExButtonControl.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExButton.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExButton.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExButton.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExButton.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExButton.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExButton.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExButton.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExButton.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExButton.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExButton.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExButton.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExButton.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExButton.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExButton.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExButton.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExButton.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExButton.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExButton.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExButton.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExButton.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExButton.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExButton.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExButton.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExButton.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExButton.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExButton.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExButton.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExButton.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExButton.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExButton.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExButton.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExButton.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExButton.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExButton.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExButton.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExCustomCheckBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomCheckBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomCheckBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomCheckBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomCheckBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomCheckBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomCheckBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomCheckBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomCheckBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomCheckBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomCheckBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomCheckBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomCheckBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomCheckBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomCheckBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomCheckBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomCheckBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomCheckBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomCheckBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomCheckBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomCheckBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomCheckBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomCheckBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomCheckBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomCheckBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomCheckBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomCheckBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomCheckBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomCheckBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomCheckBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomCheckBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomCheckBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomCheckBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomCheckBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomCheckBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExCheckBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCheckBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCheckBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCheckBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCheckBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCheckBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCheckBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCheckBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCheckBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCheckBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCheckBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCheckBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCheckBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCheckBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCheckBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCheckBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCheckBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCheckBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCheckBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCheckBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCheckBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCheckBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCheckBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCheckBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCheckBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCheckBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCheckBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCheckBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCheckBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCheckBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCheckBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCheckBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCheckBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCheckBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCheckBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExRadioButton.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExRadioButton.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExRadioButton.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExRadioButton.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExRadioButton.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExRadioButton.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExRadioButton.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExRadioButton.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExRadioButton.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExRadioButton.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExRadioButton.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExRadioButton.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExRadioButton.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExRadioButton.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExRadioButton.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExRadioButton.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExRadioButton.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExRadioButton.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExRadioButton.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExRadioButton.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExRadioButton.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExRadioButton.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExRadioButton.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExRadioButton.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExRadioButton.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExRadioButton.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExRadioButton.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExRadioButton.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExRadioButton.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExRadioButton.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExRadioButton.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExRadioButton.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExRadioButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExRadioButton.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExRadioButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExRadioButton.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExRadioButton.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExCustomListBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomListBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomListBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomListBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomListBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomListBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomListBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomListBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomListBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomListBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomListBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomListBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomListBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomListBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomListBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomListBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomListBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomListBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomListBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomListBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomListBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomListBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomListBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomListBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomListBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomListBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomListBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomListBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomListBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomListBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomListBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomListBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomListBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomListBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomListBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExListBox.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExListBox.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExListBox.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExListBox.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExListBox.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExListBox.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExListBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExListBox.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExListBox.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExListBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExListBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExListBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExListBox.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExListBox.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExListBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExListBox.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExListBox.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExListBox.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExListBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExListBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExListBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExListBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExListBox.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExListBox.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExListBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExListBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExListBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExListBox.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExListBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExListBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExListBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExListBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExListBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExListBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExListBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExScrollBar.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExScrollBar.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExScrollBar.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExScrollBar.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExScrollBar.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExScrollBar.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExScrollBar.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExScrollBar.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExScrollBar.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExScrollBar.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExScrollBar.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExScrollBar.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExScrollBar.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExScrollBar.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExScrollBar.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExScrollBar.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExScrollBar.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExScrollBar.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExScrollBar.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExScrollBar.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExScrollBar.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExScrollBar.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExScrollBar.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExScrollBar.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExScrollBar.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExScrollBar.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExScrollBar.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExScrollBar.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExScrollBar.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExScrollBar.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExScrollBar.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExScrollBar.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExScrollBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExScrollBar.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExScrollBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExScrollBar.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExScrollBar.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
{$IFDEF VCL}
procedure TJvExCustomStaticText.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExCustomStaticText.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExCustomStaticText.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExCustomStaticText.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExCustomStaticText.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExCustomStaticText.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExCustomStaticText.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExCustomStaticText.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExCustomStaticText.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCustomStaticText.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomStaticText.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomStaticText.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomStaticText.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomStaticText.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomStaticText.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomStaticText.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExCustomStaticText.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExCustomStaticText.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExCustomStaticText.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExCustomStaticText.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomStaticText.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCustomStaticText.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExCustomStaticText.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCustomStaticText.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExCustomStaticText.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCustomStaticText.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExCustomStaticText.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomStaticText.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExCustomStaticText.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExCustomStaticText.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomStaticText.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomStaticText.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExCustomStaticText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExCustomStaticText.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCustomStaticText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomStaticText.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomStaticText.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$IFDEF VCL}
procedure TJvExStaticText.Dispatch(var Msg);
begin
  DispatchMsg(Self, Msg);
end;

procedure TJvExStaticText.VisibleChanged;
begin
  InheritMsg(Self, CM_VISIBLECHANGED);
end;

procedure TJvExStaticText.EnabledChanged;
begin
  InheritMsg(Self, CM_ENABLEDCHANGED);
end;

procedure TJvExStaticText.TextChanged;
begin
  InheritMsg(Self, CM_TEXTCHANGED);
end;

procedure TJvExStaticText.FontChanged;
begin
  InheritMsg(Self, CM_FONTCHANGED);
end;

procedure TJvExStaticText.ColorChanged;
begin
  InheritMsg(Self, CM_COLORCHANGED);
end;

procedure TJvExStaticText.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
end;

procedure TJvExStaticText.ParentFontChanged;
begin
  InheritMsg(Self, CM_PARENTFONTCHANGED);
end;

procedure TJvExStaticText.ParentShowHintChanged;
begin
  InheritMsg(Self, CM_PARENTSHOWHINTCHANGED);
end;

function TJvExStaticText.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsg(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExStaticText.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsg(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExStaticText.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsg(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExStaticText.MouseEnter(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExStaticText.MouseLeave(Control: TControl);
begin
  InheritMsg(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExStaticText.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExStaticText.CursorChanged;
begin
  InheritMsg(Self, CM_CURSORCHANGED);
end;

procedure TJvExStaticText.ShowHintChanged;
begin
  InheritMsg(Self, CM_SHOWHINTCHANGED);
end;

procedure TJvExStaticText.ShowingChanged;
begin
  InheritMsg(Self, CM_SHOWINGCHANGED);
end;

procedure TJvExStaticText.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanging(Self, Control, Inserting);
end;

procedure TJvExStaticText.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  Control_ControlsListChanged(Self, Control, Inserting);
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExStaticText.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExStaticText.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
{$IF not declared(PatchedVCLX)}
procedure TJvExStaticText.MouseEnter(Control: TControl);
begin
  inherited MouseEnter(Control);
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExStaticText.MouseLeave(Control: TControl);
begin
  inherited MouseLeave(Control);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
 {$IFEND}
procedure TJvExStaticText.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExStaticText.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;
{$ENDIF VisualCLX}
procedure TJvExStaticText.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExStaticText.DoFocusChanged(Control: TWinControl);
begin
end;

function TJvExStaticText.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  {$IFDEF VCL}
  Result := InheritMsg(Self, WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
  {$ELSE}
  Result := False; // Qt allways paints the background
  {$ENDIF VCL}
end;
procedure TJvExStaticText.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExStaticText.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExStaticText.DoKillFocus(FocusedWnd: HWND);
begin
end;

{$IFDEF VCL}
constructor TJvExStaticText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
end;

destructor TJvExStaticText.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExStaticText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExStaticText.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExStaticText.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}
{$ENDIF VCL}

end.

﻿object Form1: TForm1
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Left = 8
  Margins.Top = 8
  Margins.Right = 8
  Margins.Bottom = 8
  Caption = 'Form1'
  ClientHeight = 562
  ClientWidth = 804
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 820
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    804
    562)
  PixelsPerInch = 96
  TextHeight = 13
  object ResultTable: TStringGrid
    Left = 10
    Top = 10
    Width = 474
    Height = 542
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alLeft
    ColCount = 6
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDrawCell = ResultTableDrawCell
    ColWidths = (
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24
      24)
  end
  object PanelOption: TPanel
    Left = 64
    Top = 337
    Width = 300
    Height = 200
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'PanelOption'
    ShowCaption = False
    TabOrder = 1
    Visible = False
    DesignSize = (
      300
      200)
    object Port: TLabel
      Left = 13
      Top = 20
      Width = 40
      Height = 23
      Caption = 'Port'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object IPAdress: TLabel
      Left = 13
      Top = 57
      Width = 85
      Height = 23
      Caption = 'IPAdress'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 13
      Top = 94
      Width = 115
      Height = 23
      Caption = #1059#1095#1072#1089#1090#1085#1080#1082#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 141
      Top = 17
      Width = 145
      Height = 31
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '1234'
    end
    object Edit2: TEdit
      Left = 141
      Top = 54
      Width = 145
      Height = 31
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '192.168.3.12'
    end
    object OptionApplyBtn: TButton
      Left = 168
      Top = 144
      Width = 115
      Height = 36
      Cursor = crHandPoint
      Anchors = [akTop]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = OptionApplyBtnClick
    end
    object Edit3: TEdit
      Left = 141
      Top = 91
      Width = 145
      Height = 31
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '10'
    end
    object BreakChampionButton: TBitBtn
      Left = 13
      Top = 131
      Width = 115
      Height = 62
      Cursor = crHandPoint
      Hint = #1053#1072#1078#1084#1080#1090#1077' '#1076#1083#1103' '#1091#1085#1080#1095#1090#1086#1078#1077#1085#1080#1103' '#1092#1072#1081#1083#1086#1074
      Anchors = [akTop]
      Caption = #1059#1085#1080#1095#1090#1086#1078#1080#1090#1100' '#1088#1077#1082#1086#1088#1076#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      WordWrap = True
      OnClick = BreakChampionButtonClick
    end
  end
  object Memo1: TMemo
    Left = 495
    Top = 337
    Width = 302
    Height = 100
    Anchors = [akLeft, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object ChampionPanel: TPanel
    Left = 495
    Top = 10
    Width = 302
    Height = 318
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelEdges = [beLeft, beTop, beRight]
    Caption = 'ChampionPanel'
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 3
    DesignSize = (
      302
      318)
    object Panel3: TPanel
      Left = 11
      Top = 11
      Width = 280
      Height = 53
      Align = alTop
      Caption = #1056#1077#1082#1086#1088#1076#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object ChampionGrid: TStringGrid
      Left = 11
      Top = 120
      Width = 280
      Height = 187
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelEdges = [beLeft, beTop, beRight]
      DefaultDrawing = False
      FixedCols = 0
      TabOrder = 1
      OnDrawCell = championGridDrawCell
      ColWidths = (
        64
        64
        64
        64
        64)
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object ButLev1: TBitBtn
      Left = 12
      Top = 71
      Width = 63
      Height = 36
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1077#1088#1077#1090#1077' '#1091#1088#1086#1074#1077#1085#1100
      Anchors = [akTop]
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButLev1Click
    end
    object ButLev2: TBitBtn
      Left = 84
      Top = 71
      Width = 63
      Height = 36
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1077#1088#1077#1090#1077' '#1091#1088#1086#1074#1077#1085#1100
      Anchors = [akTop]
      Caption = 'II'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButLev2Click
    end
    object ButLev3: TBitBtn
      Left = 156
      Top = 71
      Width = 63
      Height = 36
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1077#1088#1077#1090#1077' '#1091#1088#1086#1074#1077#1085#1100
      Anchors = [akTop]
      Caption = 'III'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButLev3Click
    end
    object ButLev4: TBitBtn
      Left = 228
      Top = 71
      Width = 63
      Height = 36
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1077#1088#1077#1090#1077' '#1091#1088#1086#1074#1077#1085#1100
      Anchors = [akTop]
      Caption = 'IV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ButLev4Click
    end
  end
  object ResetBitBtn: TBitBtn
    Left = 529
    Top = 451
    Width = 113
    Height = 36
    Cursor = crHandPoint
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1086#1085#1083#1072#1081#1085' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099
    Anchors = [akBottom]
    Caption = #1057#1073#1088#1086#1089' '#1086#1085#1083#1072#1081#1085
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ResetBitBtnClick
  end
  object ExitPanel: TPanel
    AlignWithMargins = True
    Left = 701
    Top = 448
    Width = 92
    Height = 102
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Anchors = [akRight, akBottom]
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'ExitPanel'
    ShowCaption = False
    TabOrder = 5
    object ExitImage: TImage
      Left = 2
      Top = 1
      Width = 87
      Height = 98
      Cursor = crHandPoint
      Hint = #1042#1099#1093#1086#1076
      ParentShowHint = False
      Proportional = True
      ShowHint = True
      OnClick = ВыходClick
    end
  end
  object BtnOption: TBitBtn
    Left = 529
    Top = 508
    Width = 113
    Height = 36
    Cursor = crHandPoint
    Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1077#1088#1074#1077#1088#1072
    Anchors = [akBottom]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BtnOptionClick
  end
  object IdTCPServer1: TIdTCPServer
    Active = True
    Bindings = <>
    DefaultPort = 12345
    OnExecute = IdTCPServer1Execute
    Left = 656
    Top = 456
  end
end

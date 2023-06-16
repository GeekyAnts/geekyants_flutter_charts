import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that represents the axes labels of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes labels of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartAxis extends LeafRenderObjectWidget {
  final double xAxisRulerHeight;
  final double yAxisRulerHeight;
  final double xAxisRulerThickness;
  final double yAxisRulerThickness;
  final Color xAxisRulerColor;
  final Color yAxisRulerColor;
  final double xAxisMainThickness;
  final double yAxisMainThickness;
  final Color xAxisMainColor;
  final Color yAxisMainColor;
  final StrokeCap xAxisMainStrokeType;
  final StrokeCap yAxisMainStrokeType;
  final double xAxisGridRulerThickness;
  final double yAxisGridRulerThickness;
  final Color xAxisGridRulerColor;
  final Color yAxisGridRulerColor;
  final double xAxisStartPoint;
  final double xAxisEndPoint;
  final double yAxisStartPoint;
  final double yAxisEndPoint;
  final double xAxisSteps;
  final double yAxisSteps;
  final double xAxisRulerOffset;
  final double xAxisLabelOffset;
  final double yAxisRulerOffset;
  final double yAxisLabelOffset;
  final TextStyle xAxisLabelTextStyle;
  final TextStyle yAxisLabelTextStyle;
  final bool showXAxisGridRuler;
  final bool showYAxisGridRuler;
  final Color verticalBarColor;
  final List<double> yAxisData;

  /// Creates a [BarChartAxis] widget.
  ///

  const BarChartAxis({
    Key? key,
    this.xAxisRulerHeight = 10,
    this.yAxisRulerHeight = 10,
    this.xAxisRulerThickness = 0.2,
    this.yAxisRulerThickness = 0.2,
    this.xAxisRulerColor = Colors.black,
    this.yAxisRulerColor = Colors.black,
    this.xAxisMainThickness = 0.5,
    this.yAxisMainThickness = 0.5,
    this.xAxisMainColor = Colors.black,
    this.yAxisMainColor = Colors.black,
    this.xAxisMainStrokeType = StrokeCap.round,
    this.yAxisMainStrokeType = StrokeCap.round,
    this.xAxisGridRulerThickness = 0.5,
    this.yAxisGridRulerThickness = 0.5,
    this.xAxisGridRulerColor = Colors.grey,
    this.yAxisGridRulerColor = Colors.grey,
    this.xAxisStartPoint = 0.0,
    this.xAxisEndPoint = 5.5,
    this.yAxisStartPoint = 0.0,
    this.yAxisEndPoint = 5.5,
    this.xAxisSteps = 100,
    this.yAxisSteps = 100,
    this.xAxisRulerOffset = 0,
    this.xAxisLabelOffset = 0,
    this.yAxisRulerOffset = 0,
    this.yAxisLabelOffset = 0,
    this.xAxisLabelTextStyle =
        const TextStyle(color: Colors.black, fontSize: 10),
    this.yAxisLabelTextStyle =
        const TextStyle(color: Colors.black, fontSize: 10),
    this.showXAxisGridRuler = true,
    this.showYAxisGridRuler = true,
    this.yAxisData = const [],
    this.verticalBarColor = Colors.blue,
  })  : assert(xAxisStartPoint < xAxisEndPoint,
            "X-Axis start point should be always lesser than end point"),
        assert(yAxisStartPoint < yAxisEndPoint,
            "Y-Axis start point should be always lesser than end point"),
        super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartAxis(
      xAxisRulerHeight: xAxisRulerHeight,
      yAxisRulerHeight: yAxisRulerHeight,
      xAxisRulerThickness: xAxisRulerThickness,
      yAxisRulerThickness: yAxisRulerThickness,
      xAxisRulerColor: xAxisRulerColor,
      yAxisRulerColor: yAxisRulerColor,
      xAxisMainThickness: xAxisMainThickness,
      yAxisMainThickness: yAxisMainThickness,
      xAxisMainColor: xAxisMainColor,
      yAxisMainColor: yAxisMainColor,
      xAxisMainStrokeType: xAxisMainStrokeType,
      yAxisMainStrokeType: yAxisMainStrokeType,
      xAxisGridRulerThickness: xAxisGridRulerThickness,
      yAxisGridRulerThickness: yAxisGridRulerThickness,
      xAxisGridRulerColor: xAxisGridRulerColor,
      yAxisGridRulerColor: yAxisGridRulerColor,
      xAxisStartPoint: xAxisStartPoint,
      xAxisEndPoint: xAxisEndPoint,
      yAxisStartPoint: yAxisStartPoint,
      yAxisEndPoint: yAxisEndPoint,
      xAxisSteps: xAxisSteps,
      yAxisSteps: yAxisSteps,
      xAxisRulerOffset: xAxisRulerOffset,
      xAxisLabelOffset: xAxisLabelOffset,
      yAxisRulerOffset: yAxisRulerOffset,
      yAxisLabelOffset: yAxisLabelOffset,
      xAxisLabelTextStyle: xAxisLabelTextStyle,
      yAxisLabelTextStyle: yAxisLabelTextStyle,
      showXAxisGridRuler: showXAxisGridRuler,
      showYAxisGridRuler: showYAxisGridRuler,
      yAxisData: yAxisData,
      verticalBarColor: verticalBarColor,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartAxis renderObject) {
    renderObject
      ..xAxisRulerHeight = xAxisRulerHeight
      ..yAxisRulerHeight = yAxisRulerHeight
      ..xAxisRulerThickness = xAxisRulerThickness
      ..yAxisRulerThickness = yAxisRulerThickness
      ..xAxisRulerColor = xAxisRulerColor
      ..yAxisRulerColor = yAxisRulerColor
      ..xAxisMainThickness = xAxisMainThickness
      ..yAxisMainThickness = yAxisMainThickness
      ..xAxisMainColor = xAxisMainColor
      ..yAxisMainColor = yAxisMainColor
      ..xAxisMainStrokeType = xAxisMainStrokeType
      ..yAxisMainStrokeType = yAxisMainStrokeType
      ..xAxisGridRulerThickness = xAxisGridRulerThickness
      ..yAxisGridRulerThickness = yAxisGridRulerThickness
      ..xAxisGridRulerColor = xAxisGridRulerColor
      ..yAxisGridRulerColor = yAxisGridRulerColor
      ..xAxisStartPoint = xAxisStartPoint
      ..xAxisEndPoint = xAxisEndPoint
      ..yAxisStartPoint = yAxisStartPoint
      ..yAxisEndPoint = yAxisEndPoint
      ..xAxisSteps = xAxisSteps
      ..yAxisSteps = yAxisSteps
      ..xAxisRulerOffset = xAxisRulerOffset
      ..xAxisLabelOffset = xAxisLabelOffset
      ..yAxisRulerOffset = yAxisRulerOffset
      ..yAxisLabelOffset = yAxisLabelOffset
      ..xAxisLabelTextStyle = xAxisLabelTextStyle
      ..yAxisLabelTextStyle = yAxisLabelTextStyle
      ..showXAxisGridRuler = showXAxisGridRuler
      ..showYAxisGridRuler = showYAxisGridRuler
      ..yAxisData = yAxisData
      ..verticalBarColor = verticalBarColor;
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartAxis extends RenderBox {
  /// Paints the axes of the bar chart.
  ///
  /// The [context] parameter provides the painting context, and the [offset]
  /// parameter specifies the offset at which to paint the axes.
  double renderXAxisRulerHeight;
  double renderYAxisRulerHeight;
  TextStyle renderXAxisLabelTextStyle;
  TextStyle renderYAxisLabelTextStyle;
  bool renderShowXAxisGridRuler = true;
  bool renderShowYAxisGridRuler = true;
  double renderXAxisRulerThickness;
  double renderYAxisRulerThickness;
  Color renderXAxisRulerColor;
  Color renderYAxisRulerColor;
  double renderXAxisMainThickness;
  double renderYAxisMainThickness;
  Color renderXAxisMainColor;
  Color renderYAxisMainColor;
  StrokeCap renderXAxisMainStrokeType;
  StrokeCap renderYAxisMainStrokeType;
  double renderXAxisGridRulerThickness;
  double renderYAxisGridRulerThickness;
  Color renderXAxisGridRulerColor;
  Color renderYAxisGridRulerColor;
  double renderXAxisStartPoint;
  double renderXAxisEndPoint;
  double renderYAxisStartPoint;
  double renderYAxisEndPoint;
  double renderXAxisSteps;
  double renderYAxisSteps;
  double renderXAxisRulerOffset;
  double renderXAxisLabelOffset;
  double renderYAxisRulerOffset;
  double renderYAxisLabelOffset;
  List<double> renderYAxisData;
  Color renderVerticalBarColor;
  RenderBarChartAxis({
    required double xAxisRulerHeight,
    required double yAxisRulerHeight,
    required double xAxisRulerThickness,
    required double yAxisRulerThickness,
    required Color xAxisRulerColor,
    required Color yAxisRulerColor,
    required double xAxisMainThickness,
    required double yAxisMainThickness,
    required Color xAxisMainColor,
    required Color yAxisMainColor,
    required StrokeCap xAxisMainStrokeType,
    required StrokeCap yAxisMainStrokeType,
    required double xAxisGridRulerThickness,
    required double yAxisGridRulerThickness,
    required Color xAxisGridRulerColor,
    required Color yAxisGridRulerColor,
    required double xAxisStartPoint,
    required double xAxisEndPoint,
    required double yAxisStartPoint,
    required double yAxisEndPoint,
    required TextStyle xAxisLabelTextStyle,
    required TextStyle yAxisLabelTextStyle,
    required double xAxisRulerOffset,
    required double xAxisLabelOffset,
    required double yAxisRulerOffset,
    required double yAxisLabelOffset,
    required bool showXAxisGridRuler,
    required bool showYAxisGridRuler,
    required double xAxisSteps,
    required double yAxisSteps,
    required List<double> yAxisData,
    required Color verticalBarColor,
  })  : renderXAxisRulerHeight = xAxisRulerHeight,
        renderYAxisRulerHeight = yAxisRulerHeight,
        renderXAxisRulerThickness = xAxisRulerThickness,
        renderYAxisRulerThickness = yAxisRulerThickness,
        renderXAxisRulerColor = xAxisRulerColor,
        renderYAxisRulerColor = yAxisRulerColor,
        renderXAxisMainThickness = xAxisMainThickness,
        renderYAxisMainThickness = yAxisMainThickness,
        renderXAxisMainColor = xAxisMainColor,
        renderYAxisMainColor = yAxisMainColor,
        renderXAxisMainStrokeType = xAxisMainStrokeType,
        renderYAxisMainStrokeType = yAxisMainStrokeType,
        renderXAxisGridRulerThickness = xAxisGridRulerThickness,
        renderYAxisGridRulerThickness = yAxisGridRulerThickness,
        renderXAxisGridRulerColor = xAxisGridRulerColor,
        renderYAxisGridRulerColor = yAxisGridRulerColor,
        renderXAxisStartPoint = xAxisStartPoint,
        renderXAxisEndPoint = xAxisEndPoint,
        renderYAxisStartPoint = yAxisStartPoint,
        renderYAxisEndPoint = yAxisEndPoint,
        renderXAxisSteps = xAxisSteps,
        renderYAxisSteps = yAxisSteps,
        renderXAxisRulerOffset = xAxisRulerOffset,
        renderXAxisLabelOffset = xAxisLabelOffset,
        renderYAxisRulerOffset = yAxisRulerOffset,
        renderYAxisLabelOffset = yAxisLabelOffset,
        renderXAxisLabelTextStyle = xAxisLabelTextStyle,
        renderYAxisLabelTextStyle = yAxisLabelTextStyle,
        renderShowXAxisGridRuler = showXAxisGridRuler,
        renderShowYAxisGridRuler = showYAxisGridRuler,
        renderYAxisData = yAxisData,
        renderVerticalBarColor = verticalBarColor,
        super();
  double _thicknessOfYAxis = 0;
  Size sizeOfXAxisLabel = Size.zero;
  double extendXAxisStart = 0;
  double? legendWidth = 0;

  double get xAxisRulerHeight => renderXAxisRulerHeight;
  set xAxisRulerHeight(double value) {
    if (renderXAxisRulerHeight != value) {
      renderXAxisRulerHeight = value;
      markNeedsLayout();
    }
  }

  double get yAxisRulerHeight => renderYAxisRulerHeight;
  set yAxisRulerHeight(double value) {
    if (renderYAxisRulerHeight != value) {
      renderYAxisRulerHeight = value;
      markNeedsLayout();
    }
  }

  double get xAxisRulerThickness => renderXAxisRulerThickness;
  set xAxisRulerThickness(double value) {
    if (renderXAxisRulerThickness != value) {
      renderXAxisRulerThickness = value;
      markNeedsPaint();
    }
  }

  double get yAxisRulerThickness => renderYAxisRulerThickness;
  set yAxisRulerThickness(double value) {
    if (renderYAxisRulerThickness != value) {
      renderYAxisRulerThickness = value;
      markNeedsPaint();
    }
  }

  Color get xAxisRulerColor => renderXAxisRulerColor;
  set xAxisRulerColor(Color value) {
    if (renderXAxisRulerColor != value) {
      renderXAxisRulerColor = value;
      markNeedsPaint();
    }
  }

  Color get yAxisRulerColor => renderYAxisRulerColor;
  set yAxisRulerColor(Color value) {
    if (renderYAxisRulerColor != value) {
      renderYAxisRulerColor = value;
      markNeedsPaint();
    }
  }

  double get xAxisMainThickness => renderXAxisMainThickness;
  set xAxisMainThickness(double value) {
    if (renderXAxisMainThickness != value) {
      renderXAxisMainThickness = value;
      markNeedsPaint();
    }
  }

  double get yAxisMainThickness => renderYAxisMainThickness;
  set yAxisMainThickness(double value) {
    if (renderYAxisMainThickness != value) {
      renderYAxisMainThickness = value;
      markNeedsPaint();
    }
  }

  Color get xAxisMainColor => renderXAxisMainColor;
  set xAxisMainColor(Color value) {
    if (renderXAxisMainColor != value) {
      renderXAxisMainColor = value;
      markNeedsPaint();
    }
  }

  Color get yAxisMainColor => renderYAxisMainColor;
  set yAxisMainColor(Color value) {
    if (renderYAxisMainColor != value) {
      renderYAxisMainColor = value;
      markNeedsPaint();
    }
  }

  StrokeCap get xAxisMainStrokeType => renderXAxisMainStrokeType;
  set xAxisMainStrokeType(StrokeCap value) {
    if (renderXAxisMainStrokeType != value) {
      renderXAxisMainStrokeType = value;
      markNeedsPaint();
    }
  }

  StrokeCap get yAxisMainStrokeType => renderYAxisMainStrokeType;
  set yAxisMainStrokeType(StrokeCap value) {
    if (renderYAxisMainStrokeType != value) {
      renderYAxisMainStrokeType = value;
      markNeedsPaint();
    }
  }

  double get xAxisGridRulerThickness => renderXAxisGridRulerThickness;
  set xAxisGridRulerThickness(double value) {
    if (renderXAxisGridRulerThickness != value) {
      renderXAxisGridRulerThickness = value;
      markNeedsPaint();
    }
  }

  double get yAxisGridRulerThickness => renderYAxisGridRulerThickness;
  set yAxisGridRulerThickness(double value) {
    if (renderYAxisGridRulerThickness != value) {
      renderYAxisGridRulerThickness = value;
      markNeedsPaint();
    }
  }

  Color get xAxisGridRulerColor => renderXAxisGridRulerColor;
  set xAxisGridRulerColor(Color value) {
    if (renderXAxisGridRulerColor != value) {
      renderXAxisGridRulerColor = value;
      markNeedsPaint();
    }
  }

  Color get yAxisGridRulerColor => renderYAxisGridRulerColor;
  set yAxisGridRulerColor(Color value) {
    if (renderYAxisGridRulerColor != value) {
      renderYAxisGridRulerColor = value;
      markNeedsPaint();
    }
  }

  TextStyle get xAxisLabelTextStyle => renderXAxisLabelTextStyle;
  set xAxisLabelTextStyle(TextStyle value) {
    if (renderXAxisLabelTextStyle != value) {
      renderXAxisLabelTextStyle = value;
      markNeedsLayout();
    }
  }

  TextStyle get yAxisLabelTextStyle => renderYAxisLabelTextStyle;
  set yAxisLabelTextStyle(TextStyle value) {
    if (renderYAxisLabelTextStyle != value) {
      renderYAxisLabelTextStyle = value;
      markNeedsLayout();
    }
  }

  bool get showXAxisGridRuler => renderShowXAxisGridRuler;
  set showXAxisGridRuler(bool value) {
    if (renderShowXAxisGridRuler != value) {
      renderShowXAxisGridRuler = value;
      markNeedsLayout();
    }
  }

  bool get showYAxisGridRuler => renderShowYAxisGridRuler;
  set showYAxisGridRuler(bool value) {
    if (renderShowYAxisGridRuler != value) {
      renderShowYAxisGridRuler = value;
      markNeedsLayout();
    }
  }

  double get xAxisStartPoint => renderXAxisStartPoint;
  set xAxisStartPoint(double value) {
    if (renderXAxisStartPoint != value) {
      renderXAxisStartPoint = value;
      markNeedsLayout();
    }
  }

  double get xAxisEndPoint => renderXAxisEndPoint;
  set xAxisEndPoint(double value) {
    if (renderXAxisEndPoint != value) {
      renderXAxisEndPoint = value;
      markNeedsLayout();
    }
  }

  double get yAxisStartPoint => renderYAxisStartPoint;
  set yAxisStartPoint(double value) {
    if (renderYAxisStartPoint != value) {
      renderYAxisStartPoint = value;
      markNeedsLayout();
    }
  }

  double get yAxisEndPoint => renderYAxisEndPoint;
  set yAxisEndPoint(double value) {
    if (renderYAxisEndPoint != value) {
      renderYAxisEndPoint = value;
      markNeedsLayout();
    }
  }

  double get xAxisSteps => renderXAxisSteps;
  set xAxisSteps(double value) {
    if (renderXAxisSteps != value) {
      renderXAxisSteps = value;
      markNeedsLayout();
    }
  }

  double get yAxisSteps => renderYAxisSteps;
  set yAxisSteps(double value) {
    if (renderYAxisSteps != value) {
      renderYAxisSteps = value;
      markNeedsLayout();
    }
  }

  double get xAxisRulerOffset => renderXAxisRulerOffset;
  set xAxisRulerOffset(double value) {
    if (renderXAxisRulerOffset != value) {
      renderXAxisRulerOffset = value;
      markNeedsLayout();
    }
  }

  double get xAxisLabelOffset => renderXAxisLabelOffset;
  set xAxisLabelOffset(double value) {
    if (renderXAxisLabelOffset != value) {
      renderXAxisLabelOffset = value;
      markNeedsLayout();
    }
  }

  double get yAxisRulerOffset => renderYAxisRulerOffset;
  set yAxisRulerOffset(double value) {
    if (renderYAxisRulerOffset != value) {
      renderYAxisRulerOffset = value;
      markNeedsLayout();
    }
  }

  double get yAxisLabelOffset => renderYAxisLabelOffset;
  set yAxisLabelOffset(double value) {
    if (renderYAxisLabelOffset != value) {
      renderYAxisLabelOffset = value;
      markNeedsLayout();
    }
  }

  List<double> get yAxisData => renderYAxisData;
  set yAxisData(List<double> value) {
    if (renderYAxisData != value) {
      renderYAxisData = value;
      markNeedsLayout();
    }
  }

  Color get verticalBarColor => renderVerticalBarColor;
  set verticalBarColor(Color value) {
    if (renderVerticalBarColor != value) {
      renderVerticalBarColor = value;
      markNeedsPaint();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final double graphWidth = size.width;
    final double graphHeight = size.height - offset.dy;
    double yAxisMainLabelOffset = 0;
    List<AxesLabel> xAxesLabel = [];
    List<AxesLabel> yAxesLabel = [];
    calculateLabelValues(xAxisStartPoint, xAxisEndPoint, graphWidth, xAxisSteps,
        xAxesLabel, "x");
    sizeOfXAxisLabel = getLabelSize(
        textStyle: xAxisLabelTextStyle, value: xAxesLabel.first.text);

    calculateLabelValues(yAxisStartPoint, yAxisEndPoint, graphHeight * 3,
        yAxisSteps, yAxesLabel, "y");
    final Paint xAxisRulerPaint = Paint()
      ..color = xAxisRulerColor
      ..strokeWidth = xAxisRulerThickness
      ..strokeCap = StrokeCap.round;
    final Paint yAxisRulerPaint = Paint()
      ..color = yAxisRulerColor
      ..strokeWidth = yAxisRulerThickness
      ..strokeCap = StrokeCap.round;
    final Paint xAxisMainPaint = Paint()
      ..color = xAxisMainColor
      ..strokeWidth = xAxisMainThickness
      ..strokeCap = xAxisMainStrokeType;
    final Paint yAxisMainPaint = Paint()
      ..color = yAxisMainColor
      ..strokeWidth = yAxisMainThickness
      ..strokeCap = yAxisMainStrokeType;
    final Paint xAxisGridRulerPaint = Paint()
      ..color = xAxisGridRulerColor
      ..strokeWidth = xAxisGridRulerThickness
      ..strokeCap = StrokeCap.round;
    final Paint yAxisGridRulerPaint = Paint()
      ..color = yAxisGridRulerColor
      ..strokeWidth = yAxisGridRulerThickness
      ..strokeCap = StrokeCap.round;
    Size yStartLabelSize = getLabelSize(
      textStyle: yAxisLabelTextStyle,
      value: yAxesLabel.first.value.toString(),
    );
    var yEndLabelSize = getLabelSize(
      textStyle: yAxisLabelTextStyle,
      value: yAxesLabel.last.value.toString(),
    );
    paintYAxisLabels(
        graphHeight,
        graphWidth,
        yAxisMainLabelOffset,
        yAxisLabelOffset,
        yAxisRulerOffset,
        offset,
        yEndLabelSize,
        sizeOfXAxisLabel,
        yAxesLabel,
        canvas,
        yAxisRulerPaint,
        yAxisMainPaint,
        yAxisGridRulerPaint,
        showYAxisGridRuler);
    paintXAxisLabels(
        graphWidth,
        graphHeight,
        xAxesLabel,
        canvas,
        yStartLabelSize,
        xAxisRulerPaint,
        xAxisMainPaint,
        xAxisGridRulerPaint,
        offset,
        showXAxisGridRuler,
        yAxesLabel);
  }

  void paintXAxisLabels(
      double graphWidth,
      double graphHeight,
      List<AxesLabel> xAxesLabel,
      Canvas canvas,
      Size yStartLabelSize,
      Paint xAxisRulerPaint,
      Paint xAxisMainPaint,
      Paint xAxisGridRulerPaint,
      Offset offset,
      bool showXAxisGridRuler,
      List<AxesLabel> yAxesLabel) {
    var starLabelSize = getLabelSize(
        textStyle: xAxisLabelTextStyle,
        value: xAxesLabel.first.value.toString());
    final barWidth = yAxisData.isNotEmpty
        ? ((graphWidth - (yAxisData.length - 1) * (starLabelSize.width / 2)) /
            yAxisData.length)
        : 0;
    Offset a = Offset(
        _thicknessOfYAxis -
            (starLabelSize.width / 2) +
            yAxisRulerOffset +
            (barWidth / 2),
        size.height - starLabelSize.height - (yStartLabelSize.height / 2));
    Offset b = Offset(graphWidth - starLabelSize.width - (barWidth / 2),
        size.height - starLabelSize.height - (yStartLabelSize.height / 2));

    for (int i = 0; i < xAxesLabel.length; i++) {
      double x = a.dx * (1 - (i / (xAxesLabel.length - 1))) +
          b.dx * (i / (xAxesLabel.length - 1));
      double y = a.dy * (1 - (i / (xAxesLabel.length - 1))) +
          b.dy * (i / (xAxesLabel.length - 1));
      final TextSpan span = TextSpan(
        text: xAxesLabel[i].value.toString(),
        style: xAxisLabelTextStyle,
      );
      final TextPainter tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout();

      tp.paint(canvas, Offset(x, y));

      if (yAxisData.isNotEmpty) {
        canvas.drawLine(
          Offset(x + starLabelSize.width / 2 + (barWidth / 2),
              y - xAxisLabelOffset),
          Offset(x + starLabelSize.width / 2 + (barWidth / 2),
              (y - xAxisLabelOffset) - xAxisRulerHeight),
          xAxisRulerPaint,
        );
      } else {
        canvas.drawLine(
          Offset(x + starLabelSize.width / 2, y - xAxisLabelOffset),
          Offset(x + starLabelSize.width / 2,
              (y - xAxisLabelOffset) - xAxisRulerHeight),
          xAxisRulerPaint,
        );
      }
      // To Draw Grid rulers from x-axis
      if (showXAxisGridRuler) {
        final double xPosition = x + (starLabelSize.width / 2);
        final double yPosition = y -
            ((size.height -
                (starLabelSize.height) -
                offset.dy -
                yStartLabelSize.height));
        final double yEndPosition = y - xAxisRulerHeight - xAxisRulerOffset;

        canvas.drawLine(
          Offset(xPosition + (barWidth / 2), yPosition),
          Offset(xPosition + (barWidth / 2), yEndPosition),
          xAxisGridRulerPaint,
        );
      }

      /// To Draw Vertical Bars
      if (yAxisData.isNotEmpty && i < xAxesLabel.length) {
        double currentY = yAxisData[i].toDouble();
        final barHeight = (currentY - yAxisStartPoint) *
            (offset.dy -
                (y -
                    xAxisRulerHeight -
                    xAxisRulerOffset -
                    (yStartLabelSize.height / 2))) /
            (yAxisEndPoint - yAxisStartPoint);

        // Calculate the top-left and bottom-right coordinates of the bar
        final barTop = barHeight + (y - (xAxisRulerHeight) - xAxisRulerOffset);
        final barBottom = y - (xAxisRulerOffset + xAxisRulerHeight);

        // Calculate the left and right coordinates of the bar
        double barLeft = x + (starLabelSize.width) - (barWidth / 2);
        double barRight = barLeft + barWidth - (starLabelSize.width);
        // Draw the bar rectangle
        final Rect barRect =
            Rect.fromLTRB(barLeft, barTop, barRight, barBottom);
        canvas.drawRect(barRect, Paint()..color = verticalBarColor);
      }
    }

    canvas.drawLine(
      Offset(a.dx + (starLabelSize.width / 2) - (barWidth / 2),
          a.dy - xAxisRulerHeight - xAxisRulerOffset),
      Offset(b.dx + (starLabelSize.width / 2) + (barWidth / 2),
          b.dy - xAxisRulerHeight - xAxisRulerOffset),
      xAxisMainPaint,
    );
  }

  void paintYAxisLabels(
      double graphHeight,
      double graphWidth,
      double yAxisMainLabelOffset,
      double yAxisLabelOffset,
      double yAxisRulerOffset,
      Offset offset,
      Size yEndLabelSize,
      Size xEndLabelSize,
      List<AxesLabel> yAxesLabel,
      Canvas canvas,
      Paint yAxisRulerPaint,
      Paint yAxisMainPaint,
      Paint yAxisGridRulerPaint,
      bool showYAxisGridRuler) {
    Offset a, b;

    a = Offset(yAxisMainLabelOffset, offset.dy);
    b = Offset(
        yAxisMainLabelOffset,
        ((graphHeight) + offset.dy) -
            yEndLabelSize.height -
            sizeOfXAxisLabel.height -
            xAxisRulerHeight -
            xAxisRulerOffset);

    Offset temp = a;
    a = b;
    b = temp;
    for (int i = 0; i < yAxesLabel.length; i++) {
      double x = a.dx * (1 - (i / (yAxesLabel.length - 1))) +
          b.dx * (i / (yAxesLabel.length - 1));
      double y = a.dy * (1 - (i / (yAxesLabel.length - 1))) +
          b.dy * (i / (yAxesLabel.length - 1));
      final TextSpan span = TextSpan(
        text: yAxesLabel[i].value.toString(),
        style: yAxisLabelTextStyle,
      );
      final TextPainter tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(x, y));

      /// To Draw Ruler Offsets
      canvas.drawLine(
        Offset(x + yEndLabelSize.width + yAxisLabelOffset,
            y + yEndLabelSize.height / 2),
        Offset(x + yEndLabelSize.width + yAxisRulerHeight + yAxisLabelOffset,
            y + yEndLabelSize.height / 2),
        yAxisRulerPaint,
      );

      // To Draw Grid rulers from y-axis
      if (showYAxisGridRuler) {
        canvas.drawLine(
          Offset(
              x + (yEndLabelSize.width + yAxisRulerHeight) + yAxisRulerOffset,
              y + yEndLabelSize.height / 2),
          Offset(graphWidth - (xEndLabelSize.width / 2),
              y + yEndLabelSize.height / 2),
          yAxisGridRulerPaint,
        );
      }
    }
    temp = b;
    b = a;
    a = temp;
    canvas.drawLine(
        Offset(a.dx + yEndLabelSize.width + yAxisRulerHeight + yAxisRulerOffset,
            a.dy + yEndLabelSize.height / 2),
        Offset(b.dx + yEndLabelSize.width + yAxisRulerHeight + yAxisRulerOffset,
            b.dy + yEndLabelSize.height / 2),
        yAxisMainPaint);
    _thicknessOfYAxis = a.dx + yEndLabelSize.width + yAxisRulerHeight;
  }

  void calculateLabelValues(double getStart, double getEnd, double sizeValue,
      double intervalSize, List<AxesLabel> label, String axisName) {
    final double count = math.max(sizeValue / intervalSize, 1.0);
    double interval = (getEnd - getStart) / (sizeValue / intervalSize);
    final List<double> intervalDivisions = [10, 5, 2, 1];
    late double currentInterval;
    num v = math.pow(10, (math.log(interval) / math.log(10)).floor());
    for (final double intervalDivision in intervalDivisions) {
      currentInterval = v * intervalDivision;

      if (count < ((getEnd - getStart) / currentInterval)) {
        break;
      }
      interval = currentInterval;
    }
    if (yAxisData.isNotEmpty && axisName == "x") {
      /// TODO: To Map the X Axis Values as pet the yAxisData.length

      for (int i = getStart.toInt(); i < yAxisData.length; i++) {
        double value = yAxisData[i].toDouble();
        label.add(AxesLabel(text: value.toString(), value: i.toDouble()));
      }
    } else {
      for (double i = getStart; i <= getEnd; i += interval) {
        label.add(AxesLabel(text: i.toString(), value: i));
      }
    }
  }

  Size getLabelSize({required TextStyle textStyle, required String? value}) {
    final TextSpan textSpan = TextSpan(text: value!, style: textStyle);
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    textPainter.text = textSpan;
    textPainter.layout();

    return Size(textPainter.width, textPainter.height);
  }

  @override
  void performLayout() {
    final double chartWidth = constraints.maxWidth;
    final double chartHeight = constraints.maxHeight;
    size = Size(chartWidth, chartHeight);
  }
}

class AxesLabel {
  String? text;
  double? value;

  AxesLabel({
    this.text,
    this.value,
  });
}

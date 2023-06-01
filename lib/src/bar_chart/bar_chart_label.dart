import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that represents the axes labels of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes labels of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartLabel extends LeafRenderObjectWidget {
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
  final double xAxisStartPoint;
  final double xAxisEndPoint;
  final double yAxisStartPoint;
  final double yAxisEndPoint;
  final double xAxisSteps;
  final double yAxisSteps;
  final TextStyle labelTextStyle;
  final bool showRulerGrid;

  /// Creates a [BarChartLabel] widget.
  ///
  /// The [textStyle] parameter specifies the style of the label text.

  const BarChartLabel({
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
    this.xAxisStartPoint = 0.0,
    this.xAxisEndPoint = 5.5,
    this.yAxisStartPoint = 0.0,
    this.yAxisEndPoint = 5.5,
    this.xAxisSteps = 100,
    this.yAxisSteps = 100,
    this.labelTextStyle = const TextStyle(color: Colors.black, fontSize: 10),
    this.showRulerGrid = true,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel(
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
        xAxisStartPoint: xAxisStartPoint,
        xAxisEndPoint: xAxisEndPoint,
        yAxisStartPoint: yAxisStartPoint,
        yAxisEndPoint: yAxisEndPoint,
        xAxisSteps: xAxisSteps,
        yAxisSteps: yAxisSteps,
        labelTextStyle: labelTextStyle,
        showRulerGrid: showRulerGrid);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartLabel renderObject) {
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
      ..xAxisStartPoint = xAxisStartPoint
      ..xAxisEndPoint = xAxisEndPoint
      ..yAxisStartPoint = yAxisStartPoint
      ..yAxisEndPoint = yAxisEndPoint
      ..xAxisSteps = xAxisSteps
      ..yAxisSteps = yAxisSteps
      ..labelTextStyle = labelTextStyle
      ..showRulerGrid = showRulerGrid;
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartLabel extends RenderBox {
  /// Paints the axes of the bar chart.
  ///
  /// The [context] parameter provides the painting context, and the [offset]
  /// parameter specifies the offset at which to paint the axes.
  double renderXAxisRulerHeight;
  double renderYAxisRulerHeight;
  TextStyle renderLabelTextStyle;
  bool renderShowRulerGrid = true;
  double renderXAxisRulerThickness;
  double renderYAxisRulerThickness;
  Color renderXAxisRulerColor;
  Color renderYAxisRulerColor;
  double renderXAxisMainThickness;
  double renderYAxisMainThickness;
  Color renderXAxisMainColor;
  Color renderYAxisMainColor;
  double renderXAxisStartPoint;
  double renderXAxisEndPoint;
  double renderYAxisStartPoint;
  double renderYAxisEndPoint;
  double renderXAxisSteps;
  double renderYAxisSteps;
  RenderBarChartLabel({
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
    required double xAxisStartPoint,
    required double xAxisEndPoint,
    required double yAxisStartPoint,
    required double yAxisEndPoint,
    required TextStyle labelTextStyle,
    required bool showRulerGrid,
    required double xAxisSteps,
    required double yAxisSteps,
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
        renderXAxisStartPoint = xAxisStartPoint,
        renderXAxisEndPoint = xAxisEndPoint,
        renderYAxisStartPoint = yAxisStartPoint,
        renderYAxisEndPoint = yAxisEndPoint,
        renderXAxisSteps = xAxisSteps,
        renderYAxisSteps = yAxisSteps,
        renderLabelTextStyle = labelTextStyle,
        renderShowRulerGrid = showRulerGrid,
        super();

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

  TextStyle get labelTextStyle => renderLabelTextStyle;
  set labelTextStyle(TextStyle value) {
    if (renderLabelTextStyle != value) {
      renderLabelTextStyle = value;
      markNeedsLayout();
    }
  }

  bool get showRulerGrid => renderShowRulerGrid;
  set showRulerGrid(bool value) {
    if (renderShowRulerGrid != value) {
      renderShowRulerGrid = value;
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

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final double graphWidth = size.width;
    final double graphHeight = size.height - offset.dy;
    double heightOfYAxisLabel = 0;
    double heightOfXAxisLabel = 0;
    double widthOfXAxisLabel = 0;
    double widthOfYAxisLabel = 0;
    double xAxisLabelOffset = 0;
    List<AxesLabel> xAxesLabel = [];
    List<AxesLabel> yAxesLabel = [];
    calculateLabelValues(
        xAxisStartPoint, xAxisEndPoint, graphWidth, xAxisSteps, xAxesLabel);
    calculateLabelValues(yAxisStartPoint, yAxisEndPoint, graphHeight * 3,
        yAxisSteps, yAxesLabel);
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
      ..strokeCap = StrokeCap.round;
    final Paint yAxisMainPaint = Paint()
      ..color = yAxisMainColor
      ..strokeWidth = yAxisMainThickness
      ..strokeCap = StrokeCap.round;

    // To Find X Axis Beginning and end points
    var starLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: xAxesLabel.first.value.toString());
    var endLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: xAxesLabel.last.value.toString());

    // To Draw X Axis Label points
    Offset a = Offset((starLabelSize.width / 2) + yAxisRulerHeight,
        size.height - starLabelSize.height);
    Offset b = Offset((size.width - (endLabelSize.width)),
        size.height - starLabelSize.height);

    for (int i = 0; i < xAxesLabel.length; i++) {
      double x = a.dx * (1 - (i / (xAxesLabel.length - 1))) +
          b.dx * (i / (xAxesLabel.length - 1));
      double y = a.dy * (1 - (i / (xAxesLabel.length - 1))) +
          b.dy * (i / (xAxesLabel.length - 1));
      final TextSpan span = TextSpan(
        text: xAxesLabel[i].value.toString(),
        style: labelTextStyle,
      );
      final TextPainter tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(x, y));
      heightOfXAxisLabel = tp.height;
      widthOfXAxisLabel = tp.width;
      // To Draw x axis ruler scale offset
      canvas.drawLine(Offset(x + (widthOfXAxisLabel / 2), y - xAxisRulerHeight),
          Offset(x + (widthOfXAxisLabel / 2), y), xAxisRulerPaint);
      // To Draw x axis rulers
      if (showRulerGrid) {
        canvas.drawLine(
            Offset(x + (widthOfXAxisLabel / 2),
                (size.height - heightOfXAxisLabel) - (xAxisRulerHeight)),
            Offset(x + (widthOfXAxisLabel / 2),
                offset.dy + (heightOfXAxisLabel / 2)),
            Paint()..color = Colors.grey);
      }
    }
    // To draw Y Axis
    canvas.drawLine(
        Offset(
            a.dx +
                yAxisRulerHeight -
                (yAxisRulerHeight - (widthOfXAxisLabel / 2)),
            offset.dy + (heightOfXAxisLabel / 2)),
        Offset(
            a.dx +
                yAxisRulerHeight -
                (yAxisRulerHeight - (widthOfXAxisLabel / 2)),
            size.height - heightOfXAxisLabel),
        yAxisMainPaint);

    starLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: yAxesLabel.first.value.toString());
    endLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: yAxesLabel.last.value.toString());

    // To Draw Y Axis Label points
    a = Offset(xAxisLabelOffset, offset.dy);
    b = Offset(
        xAxisLabelOffset,
        (graphHeight + offset.dy - (heightOfXAxisLabel * 2)) -
            xAxisRulerHeight +
            (heightOfXAxisLabel / 2));

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
        style: labelTextStyle,
      );
      final TextPainter tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(x, y));
      widthOfYAxisLabel = tp.width;
      heightOfYAxisLabel = tp.height;
      // To Draw Y axis ruler scale offset
      canvas.drawLine(
          Offset(x + widthOfYAxisLabel + yAxisRulerHeight,
              y + (heightOfYAxisLabel / 2)),
          Offset(x + widthOfYAxisLabel, y + (heightOfYAxisLabel / 2)),
          yAxisRulerPaint);

      // To Draw Y axis rulers
      if (showRulerGrid) {
        canvas.drawLine(
            Offset(x + yAxisRulerHeight + (widthOfYAxisLabel),
                y + (heightOfYAxisLabel / 2)),
            Offset(size.width - (widthOfXAxisLabel / 2),
                y + (heightOfYAxisLabel / 2)),
            Paint()..color = Colors.grey);
      }
    }
    // To Draw X Axis
    canvas.drawLine(
        Offset(
            a.dx + widthOfYAxisLabel,
            a.dy -
                (xAxisRulerHeight -
                    (xAxisRulerHeight + (heightOfYAxisLabel / 2)))),
        Offset(
            size.width - (widthOfYAxisLabel / 2),
            a.dy -
                (xAxisRulerHeight -
                    (xAxisRulerHeight + (heightOfYAxisLabel / 2)))),
        xAxisMainPaint);
  }

  void calculateLabelValues(double getStart, double getEnd, double sizeValue,
      double intervalSize, List<AxesLabel> label) {
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

    for (double i = getStart; i <= getEnd; i += interval) {
      label.add(AxesLabel(text: i.toString(), value: i));
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
  Size computeDryLayout(BoxConstraints constraints) {
    final double chartWidth = constraints.maxWidth;
    final double chartHeight = constraints.maxHeight;
    return Size(chartWidth, chartHeight);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
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

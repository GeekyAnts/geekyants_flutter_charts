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

  /// Creates a [BarChartLabel] widget.
  ///
  /// The [textStyle] parameter specifies the style of the label text.

  const BarChartLabel({
    Key? key,
    this.xAxisRulerHeight = 5,
    this.yAxisRulerHeight = 5,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel(
        xAxisRulerHeight: xAxisRulerHeight, yAxisRulerHeight: yAxisRulerHeight);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartLabel renderObject) {
    renderObject
      ..xAxisRulerHeight = xAxisRulerHeight
      ..yAxisRulerHeight = yAxisRulerHeight;
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
  RenderBarChartLabel(
      {required double xAxisRulerHeight, required double yAxisRulerHeight})
      : renderXAxisRulerHeight = xAxisRulerHeight,
        renderYAxisRulerHeight = yAxisRulerHeight,
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
    calculateLabelValues(0.0, 5.5, graphWidth, 100, xAxesLabel);
    calculateLabelValues(0.0, 5.5, graphHeight * 3, 100, yAxesLabel);

    // To Find X Axis Beginning and end points
    const labelTextStyle = TextStyle(
      color: Colors.black,
    );
    var starLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: xAxesLabel.first.value.toString());
    var endLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: xAxesLabel.last.value.toString());

    // To Draw X Axis Label points
    Offset a = Offset(starLabelSize.width, size.height);
    Offset b = Offset(size.width - (endLabelSize.width), size.height);

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
      tp.paint(canvas, Offset(x - 5, y - tp.height));
      heightOfXAxisLabel = tp.height;
      widthOfXAxisLabel = tp.width;

      // To Draw x axis ruler offset
      // TODO: Setting up offset
      canvas.drawLine(
          Offset(x + yAxisRulerHeight, y - tp.height - 8),
          Offset(x + yAxisRulerHeight, y - tp.height + 2),
          Paint()..color = Colors.blue);
    }
    // To draw Y-axis

    canvas.drawLine(
        Offset(a.dx + xAxisRulerHeight, offset.dy),
        Offset(a.dx + xAxisRulerHeight, size.height - heightOfXAxisLabel),
        Paint()..color = Colors.deepOrangeAccent);

    starLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: yAxesLabel.first.value.toString());
    endLabelSize = getLabelSize(
        textStyle: labelTextStyle, value: yAxesLabel.last.value.toString());

    // To Draw Y Axis Label points
    a = Offset(xAxisLabelOffset, offset.dy);
    b = Offset(
        xAxisLabelOffset, graphHeight + offset.dy - (heightOfXAxisLabel * 2));

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

      // To Draw Y axis ruler offset

      canvas.drawLine(
          Offset(x + widthOfXAxisLabel + xAxisRulerHeight,
              y + (heightOfXAxisLabel / 2)),
          Offset(x + widthOfXAxisLabel, y + (heightOfXAxisLabel / 2)),
          Paint()..color = Colors.orange);

      widthOfYAxisLabel = tp.width;
      heightOfYAxisLabel = tp.height;
    }
    // To draw X-axis
    canvas.drawLine(
        Offset(a.dx + widthOfYAxisLabel + xAxisRulerHeight,
            a.dy + (heightOfYAxisLabel / 2)),
        Offset(size.width - (widthOfYAxisLabel / 2),
            a.dy + (heightOfYAxisLabel / 2)),
        Paint()..color = Colors.grey);
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

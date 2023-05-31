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
  final TextStyle labelTextStyle;

  /// Creates a [BarChartLabel] widget.
  ///
  /// The [textStyle] parameter specifies the style of the label text.

  const BarChartLabel({
    Key? key,
    this.xAxisRulerHeight = 10,
    this.yAxisRulerHeight = 10,
    this.labelTextStyle = const TextStyle(color: Colors.black, fontSize: 10),
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel(
        xAxisRulerHeight: xAxisRulerHeight,
        yAxisRulerHeight: yAxisRulerHeight,
        labelTextStyle: labelTextStyle);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartLabel renderObject) {
    renderObject
      ..xAxisRulerHeight = xAxisRulerHeight
      ..yAxisRulerHeight = yAxisRulerHeight
      ..labelTextStyle = labelTextStyle;
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
  RenderBarChartLabel(
      {required double xAxisRulerHeight,
      required double yAxisRulerHeight,
      required TextStyle labelTextStyle})
      : renderXAxisRulerHeight = xAxisRulerHeight,
        renderYAxisRulerHeight = yAxisRulerHeight,
        renderLabelTextStyle = labelTextStyle,
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

  TextStyle get labelTextStyle => renderLabelTextStyle;
  set labelTextStyle(TextStyle value) {
    if (renderLabelTextStyle != value) {
      renderLabelTextStyle = value;
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
      canvas.drawLine(
          Offset(x + (widthOfXAxisLabel / 2), y - xAxisRulerHeight),
          Offset(x + (widthOfXAxisLabel / 2), y),
          Paint()..color = Colors.black);
      // To Draw x axis rulers
      canvas.drawLine(
          Offset(x + (widthOfXAxisLabel / 2),
              (size.height - heightOfXAxisLabel) - (yAxisRulerHeight)),
          Offset(x + (widthOfXAxisLabel / 2),
              offset.dy + (heightOfXAxisLabel / 2)),
          Paint()..color = Colors.grey);
    }
    // To draw Y Axis
    canvas.drawLine(
        Offset(
            a.dx +
                xAxisRulerHeight -
                (xAxisRulerHeight - (widthOfXAxisLabel / 2)),
            offset.dy + (heightOfXAxisLabel / 2)),
        Offset(
            a.dx +
                xAxisRulerHeight -
                (xAxisRulerHeight - (widthOfXAxisLabel / 2)),
            size.height - heightOfXAxisLabel),
        Paint()..color = Colors.black);

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
          Paint()..color = Colors.black);

      // To Draw Y axis rulers
      canvas.drawLine(
          Offset(x + xAxisRulerHeight + (widthOfYAxisLabel),
              y + (heightOfYAxisLabel / 2)),
          Offset(size.width - (widthOfXAxisLabel / 2),
              y + (heightOfYAxisLabel / 2)),
          Paint()..color = Colors.grey);
    }
    // To Draw X Axis
    canvas.drawLine(
        Offset(
            a.dx + widthOfYAxisLabel,
            a.dy -
                (yAxisRulerHeight -
                    (yAxisRulerHeight + (heightOfYAxisLabel / 2)))),
        Offset(
            size.width - (widthOfYAxisLabel / 2),
            a.dy -
                (yAxisRulerHeight -
                    (yAxisRulerHeight + (heightOfYAxisLabel / 2)))),
        Paint()..color = Colors.black);
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

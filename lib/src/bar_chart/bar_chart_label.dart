import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that represents the axes labels of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes labels of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartLabel extends LeafRenderObjectWidget {
  /// TextStyle for label text
  final TextStyle textStyle;

  /// Creates a [BarChartLabel] widget.
  ///
  /// The [textStyle] parameter specifies the style of the label text.

  const BarChartLabel({
    Key? key,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 12),
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel(
      textStyle: textStyle,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartLabel renderObject) {
    renderObject.textStyle = textStyle;
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartLabel extends RenderBox {
  TextStyle rendertextStyle;
  RenderBarChartLabel({
    required TextStyle textStyle,
  })  : rendertextStyle = textStyle,
        super();

  /// The text styles for label text

  TextStyle get textStyle => rendertextStyle;

  set textStyle(TextStyle value) {
    if (rendertextStyle != value) {
      rendertextStyle = value;
      markNeedsPaint();
    }
  }

  /// Paints the axes of the bar chart.
  ///
  /// The [context] parameter provides the painting context, and the [offset]
  /// parameter specifies the offset at which to paint the axes.
  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final double chartWidth = size.width - 10.0 * 6;
    final double chartHeight = size.height - offset.dy;
    final double chartTop = offset.dy;
    final double chartLeft = (size.width - chartWidth) / 2;
    final List<double> axesValue =
        calculateLabelValues(0, 5.5, chartWidth, 100);
    final int numAxisPoints = axesValue.length;
    final double barWidth = chartWidth / numAxisPoints;

    // Draw x-axis points
    for (int i = 0; i < numAxisPoints; i++) {
      final double x = chartLeft + i * barWidth;
      TextSpan span = TextSpan(
        text: axesValue[i].toString(),
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();

      // calculate position of ruler text
      double rulerTextTop = chartTop + chartHeight + 8;
      double rulerTextLeft = x - tp.width / 2;

      // adjust position of ruler text if it is too close to y-axis
      if (rulerTextLeft < chartLeft) {
        rulerTextLeft = chartLeft;
      }

      tp.paint(canvas, Offset(rulerTextLeft, rulerTextTop));
    }

    // Draw y-axis points
    for (int i = 0; i < numAxisPoints; i++) {
      final double y = chartTop + chartHeight - i * chartHeight / numAxisPoints;
      TextSpan span = TextSpan(
        text: axesValue[i].toString(),
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(chartLeft - tp.width - 8, y - tp.height / 2));
    }
  }

  /// Calculates the label values for the chart.
  ///
  /// The [getStart] parameter specifies the start value,
  /// the [getEnd] parameter specifies the end value,
  /// the [sizeValue] parameter specifies the size value,
  /// and the [intervalSize] parameter specifies the interval size.
  ///
  /// Returns a list of calculated label values. Note: getStart and getEnd should have atleast difference of 3
  List<double> calculateLabelValues(
      double getStart, double getEnd, double sizeValue, double intervalSize) {
    final List<double> labelValues = [];
    // final double count = (sizeValue / intervalSize);
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
      labelValues.add(i);
    }

    return labelValues;
  }

  /// Computes the size of the render box.
  ///
  /// The [constraints] parameter represents the layout constraints
  /// used to constrain the size of the render box.
  ///
  /// Returns the computed size of the render box.
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

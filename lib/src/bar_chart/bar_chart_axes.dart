import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that represents the axes of a bar chart.
///
/// This widget draws the horizontal and vertical axes of a bar chart. It takes
/// parameters such as the number of axis points, the width and height of the
/// bar chart, and renders the axes accordingly.
class BarChartAxes extends LeafRenderObjectWidget {
  /// Creates a [BarChartAxes] widget.
  ///
  const BarChartAxes({
    Key? key,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartAxes();
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartAxes renderObject) {
    renderObject;
  }
}

/// The render object for the bar chart axes.
///
/// This render object is responsible for painting the horizontal and vertical
/// axes of the bar chart. It calculates the positions of the axes based on the
/// provided parameters and paints them on the canvas.
class RenderBarChartAxes extends RenderBox {
  /// Creates a [RenderBarChartAxes] object.
  ///

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    double dx = size.width;
    double dy = size.height;
    final double chartWidth = dx - 10.0 * 6;
    final double chartHeight = dy - 10.0;
    final double chartTop = (dy - chartHeight) / 2 + 10.0;
    final double chartLeft = (dx - chartWidth) / 2;

    final List<double> labelX = calculateLabelValues(0, 5.5, dx, 100);
    final int numAxisPoints = labelX.length;

    final List<double> labelY = calculateLabelValues(0, 5.5, dx, 100);
    final int numAxisPointsY = labelY.length;

    final Paint axisPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 1; i++) {
      final double x = chartLeft + i * chartWidth / numAxisPoints;
      canvas.drawLine(
        Offset(x, chartTop + chartHeight + 5),
        Offset(x, chartTop + (chartHeight / numAxisPointsY)),
        axisPaint,
      );
    }

    for (int i = 0; i < 1; i++) {
      final double y =
          chartTop + chartHeight - i * chartHeight / numAxisPointsY;
      canvas.drawLine(
        Offset(chartLeft - 5, y),
        Offset(chartLeft + chartWidth, y),
        axisPaint,
      );
    }
  }

  /// Calculates the label values for the chart axes.
  ///
  /// This method takes the start and end values of the axis, the size of the
  /// axis value, and the interval size between the labels. It calculates the
  /// appropriate label values based on these parameters and returns them as a
  /// list of doubles.
  List<double> calculateLabelValues(
      double getStart, double getEnd, double sizeValue, double intervalSize) {
    final List<double> labelValues = [];
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

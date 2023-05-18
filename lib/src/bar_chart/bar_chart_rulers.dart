import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that displays rulers for a bar chart.
///
/// The rulers are used to draw horizontal and vertical axis lines
/// on a bar chart. The number of axis points, the width, and height
/// of the bar chart can be customized.
class BarChartRulers extends LeafRenderObjectWidget {
  /// Creates a [BarChartRulers] widget.
  ///
  const BarChartRulers({
    Key? key,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartRulers();
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartRulers renderObject) {
    renderObject;
  }
}

/// A render object that handles the rendering of rulers for a bar chart.
class RenderBarChartRulers extends RenderBox {
  /// Creates a [RenderBarChartRulers] object.
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

    for (int i = 1; i <= numAxisPoints; i++) {
      final double x = chartLeft + i * chartWidth / numAxisPoints;
      canvas.drawLine(
        Offset(x, chartTop + chartHeight + 5),
        Offset(x, chartTop + (chartHeight / numAxisPointsY)),
        axisPaint,
      );
    }

    for (int i = 1; i <= numAxisPointsY; i++) {
      final double y =
          chartTop + chartHeight - i * chartHeight / numAxisPointsY;
      canvas.drawLine(
        Offset(chartLeft - 5, y),
        Offset(chartLeft + chartWidth, y),
        axisPaint,
      );
    }
  }

  /// Calculates the label values for the axis based on the given parameters.
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

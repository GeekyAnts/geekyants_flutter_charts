import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'bar_chart_axes.dart';
import 'bar_chart_label.dart';

/// A render object that displays a horizontal bar chart with axes and labels.
class RenderRBarChart extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _BarChartParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _BarChartParentData> {
  /// Creates a new instance of [RenderRBarChart].
  ///
  /// The chart can be customized with the following parameters:
  ///
  /// * [chartWidth]: The width of the chart.
  /// * [chartHeight]: The height of the chart.
  /// * [chartTop]: The top position of the chart.
  /// * [chartLeft]: The left position of the chart.
  /// * [barWidth]: The width of each bar in the chart.
  /// * [numAxisPoints]: The number of axis points in the chart.
  RenderRBarChart({
    this.chartWidth = 200,
    this.chartHeight = 100,
    this.chartTop = 0,
    this.chartLeft = 0,
    this.barWidth = 10,
    this.numAxisPoints = 4,
  }) : super();

  /// The width of the chart.
  final double chartWidth;

  /// The height of the chart.
  final double chartHeight;

  /// The top position of the chart.
  final double chartTop;

  /// The left position of the chart.
  final double chartLeft;

  /// The width of each bar in the chart.
  final double barWidth;

  /// The number of axis points in the chart.
  final int numAxisPoints;

  @override
  void paint(PaintingContext context, Offset offset) {
    visitChildren((child) {
      final childParentData = child.parentData as _BarChartParentData;
      context.paintChild(child, childParentData.offset + offset);

      // Paint the child based on the child's type
      if (child is RenderBarChartLabel) {
        // Paint the label of the child
        final textPainter = TextPainter(
          text: TextSpan(text: child.label, style: child.style),
          textDirection: TextDirection.ltr,
        )..layout();

        textPainter.paint(
          context.canvas,
          childParentData.offset + offset + Offset(child.left, child.top),
        );
      } else if (child is RenderBarChartAxes) {
        // Paint the axes of the child
        final canvas = context.canvas;

        final axisPaint = Paint()
          ..color = Colors.grey
          ..strokeWidth = 0.5
          ..strokeCap = StrokeCap.round;

        final chartWidth = child.chartWidth;
        final chartHeight = child.chartHeight;
        final chartTop = child.chartTop;
        final chartLeft = child.chartLeft;
        final barWidth = child.barWidth;
        final numAxisPoints = child.numAxisPoints;

        // Draw x-axis points
        for (int i = 0; i <= numAxisPoints; i++) {
          final double x = chartLeft + i * barWidth;
          canvas.drawLine(
            Offset(x, chartTop + chartHeight),
            Offset(x, chartTop),
            axisPaint,
          );
          final textSpan = TextSpan(
            text: (i * 0.5).toStringAsFixed(1),
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          );
          final textPainter = TextPainter(
            text: textSpan,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          )..layout();
          final textOffset =
              Offset(x - textPainter.width / 2, chartTop + chartHeight + 5);
          textPainter.paint(canvas, textOffset);
        }

        // Draw y-axis points
        for (int i = 0; i <= numAxisPoints; i++) {
          final double y = chartTop + i * chartHeight / numAxisPoints;
          canvas.drawLine(
            Offset(chartLeft, y),
            Offset(chartLeft + chartWidth, y),
            axisPaint,
          );
          final textSpan = TextSpan(
            text: (numAxisPoints - i).toString(),
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          );
          final textPainter = TextPainter(
            text: textSpan,
            textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
          )..layout();
          final textOffset = Offset(
              chartLeft - 5 - textPainter.width, y - textPainter.height / 2);
          textPainter.paint(canvas, textOffset);
        }
      }
    });
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    // This render object does not have a size, so return Size.zero
    return Size.zero;
  }
}

/// The parent data for the child render objects of [RenderRBarChart].
class _BarChartParentData extends ContainerBoxParentData<RenderBox> {}

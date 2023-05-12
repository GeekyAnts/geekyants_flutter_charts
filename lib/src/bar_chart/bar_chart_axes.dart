import 'package:flutter/material.dart';

/// A widget that represents the axes of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartAxes extends LeafRenderObjectWidget {
  /// The number of axis points to be displayed on both axes.
  final int numAxisPoints;

  /// The width of each bar in the chart.
  final double barWidth;

  /// The width of the chart.
  final double chartWidth;

  /// The height of the chart.
  final double chartHeight;

  /// The top margin of the chart.
  final double chartTop;

  /// The left margin of the chart.
  final double chartLeft;

  const BarChartAxes({
    Key? key,
    this.numAxisPoints = 10,
    this.barWidth = 0.0,
    this.chartWidth = double.infinity,
    this.chartHeight = double.infinity,
    this.chartTop = 0.0,
    this.chartLeft = 0.0,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartAxes()
      ..numAxisPoints = numAxisPoints
      ..barWidth = barWidth
      ..chartWidth = chartWidth
      ..chartHeight = chartHeight
      ..chartTop = chartTop
      ..chartLeft = chartLeft;
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartAxes extends RenderBox {
  late int numAxisPoints;
  late double barWidth;
  late double chartWidth;
  late double chartHeight;
  late double chartTop;
  late double chartLeft;

  Paint axisPaint = Paint()
    ..color = Colors.grey
    ..strokeWidth = 0.5
    ..strokeCap = StrokeCap.round;

  RenderBarChartAxes()
      : numAxisPoints = 10,
        super();

  @override
  void performLayout() {
    // Set the size and layout of the chart.
    chartWidth = size.width - 10.0 * 6;
    chartHeight = size.height;
    chartTop = (size.height - chartHeight) / 2;
    chartLeft = (size.width - chartWidth) / 2;
    barWidth = chartWidth / numAxisPoints;

    // Constrain the size of the render box to match the layout constraints.
    size = constraints.constrain(Size(chartWidth, chartHeight));
  }
}

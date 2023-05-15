import 'package:flutter/material.dart';

/// A widget that represents the axes labels of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes labels of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartLabel extends LeafRenderObjectWidget {
  /// The number of axis points on the chart.
  final int numAxisPoints;

  /// The width of each bar on the chart.
  final double barWidth;

  /// TextStyle for label text
  final TextStyle labelTextStyle;

  /// The width of the entire bar chart.
  final double barChartWidth;

  /// The height of the entire bar chart.
  final double barChartHeight;

  /// The value of the x-axis label.
  final double xAxisLabelValue;

  /// The value of the y-axis label.
  final double yAxisLabelValue;

  /// Creates a [BarChartLabel] widget.
  ///
  /// The [numAxisPoints] parameter specifies the number of axis points on the chart.
  /// The [barWidth] parameter specifies the width of each bar on the chart.
  /// The [labelTextStyle] parameter specifies the style of the label text.
  /// The [barChartWidth] parameter specifies the width of the entire bar chart.
  /// The [barChartHeight] parameter specifies the height of the entire bar chart.
  /// The [xAxisLabelValue] parameter specifies the value of the x-axis label.
  /// The [yAxisLabelValue] parameter specifies the value of the y-axis label.

  const BarChartLabel(
      {Key? key,
      this.numAxisPoints = 10,
      this.labelTextStyle = const TextStyle(color: Colors.black, fontSize: 12),
      this.xAxisLabelValue = 0.5,
      this.yAxisLabelValue = 0.5,
      this.barChartHeight = 600,
      this.barChartWidth = 1500})
      : barWidth = (barChartWidth) / numAxisPoints,
        super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel(
        numAxisPoints: numAxisPoints,
        barWidth: barWidth,
        labelTextStyle: labelTextStyle,
        barChartHeight: barChartHeight,
        barChartWidth: barChartWidth,
        xAxisLabelValue: xAxisLabelValue,
        yAxisLabelValue: yAxisLabelValue);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartLabel renderObject) {
    renderObject
      ..numAxisPoints = numAxisPoints
      ..barWidth = barWidth
      ..labelTextStyle = labelTextStyle
      ..barChartHeight = barChartHeight
      ..barChartWidth = barChartWidth
      ..xAxisLabelValue = xAxisLabelValue
      ..yAxisLabelValue = yAxisLabelValue;
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartLabel extends RenderBox {
  int renderNumAxisPoints;
  double renderBarWidth;
  TextStyle renderLabelTextStyle;
  double renderBarChartWidth;
  double renderBarChartHeight;
  double renderXAxisLabelValue;
  double renderYAxisLabelValue;
  RenderBarChartLabel(
      {required int numAxisPoints,
      required double barWidth,
      required TextStyle labelTextStyle,
      required double barChartHeight,
      required double barChartWidth,
      required double xAxisLabelValue,
      required double yAxisLabelValue})
      : renderNumAxisPoints = numAxisPoints,
        renderBarWidth = barWidth,
        renderLabelTextStyle = labelTextStyle,
        renderBarChartWidth = barChartWidth,
        renderBarChartHeight = barChartHeight,
        renderXAxisLabelValue = xAxisLabelValue,
        renderYAxisLabelValue = yAxisLabelValue,
        super();

  /// The number of axis points.

  int get numAxisPoints => renderNumAxisPoints;

  set numAxisPoints(int value) {
    if (renderNumAxisPoints != value) {
      renderNumAxisPoints = value;
      markNeedsPaint();
    }
  }

  /// The width of the bars.

  double get barWidth => renderBarWidth;

  set barWidth(double value) {
    if (renderBarWidth != value) {
      renderBarWidth = value;
      markNeedsPaint();
    }
  }

  /// The text styles for label text

  TextStyle get labelTextStyle => renderLabelTextStyle;

  set labelTextStyle(TextStyle value) {
    if (renderLabelTextStyle != value) {
      renderLabelTextStyle = value;
      markNeedsPaint();
    }
  }

  /// The width of the bar chart.

  double get barChartWidth => renderBarChartWidth;

  set barChartWidth(double value) {
    if (renderBarChartWidth != value) {
      renderBarChartWidth = value;
      markNeedsLayout();
    }
  }

  /// The height of the bar chart.

  double get barChartHeight => renderBarChartHeight;

  set barChartHeight(double value) {
    if (renderBarChartHeight != value) {
      renderBarChartHeight = value;
      markNeedsLayout();
    }
  }

  /// The value of the x-axis label.

  double get xAxisLabelValue => renderXAxisLabelValue;

  set xAxisLabelValue(double value) {
    if (renderXAxisLabelValue != value) {
      renderXAxisLabelValue = value;
      markNeedsPaint();
    }
  }

  /// The value of the y-axis label.

  double get yAxisLabelValue => renderYAxisLabelValue;

  set yAxisLabelValue(double value) {
    if (renderYAxisLabelValue != value) {
      renderYAxisLabelValue = value;
      markNeedsPaint();
    }
  }

  /// Paints the axes of the bar chart.
  ///
  /// The `context` parameter provides the painting context, and the `offset`
  /// parameter specifies the offset at which to paint the axes.
  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    final double chartWidth = size.width - 10.0 * 6;
    final double chartHeight = size.height - 10.0;
    final double chartTop = (size.height - chartHeight) / 2 + 10.0;
    final double chartLeft = (size.width - chartWidth) / 2;

    // Draw x-axis points
    for (int i = 0; i <= numAxisPoints; i++) {
      final double x = chartLeft + i * barWidth;
      TextSpan span = TextSpan(
        text: '${i * xAxisLabelValue}',
        style: labelTextStyle,
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
    for (int i = 0; i <= numAxisPoints; i++) {
      final double y = chartTop + chartHeight - i * chartHeight / numAxisPoints;
      TextSpan span = TextSpan(
        text: '${i * yAxisLabelValue}',
        style: labelTextStyle,
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

  /// Sets the size of the render box.
  ///
  /// The layout constraints are used to constrain the size of the render box.
  @override
  void performLayout() {
    size = constraints.constrain(Size(barChartWidth, barChartHeight));
  }
}

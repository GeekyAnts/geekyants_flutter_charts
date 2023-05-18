import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that represents the axes labels of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes labels of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartLabel extends LeafRenderObjectWidget {
  /// The number of axis points on the chart.
  final int numAxisPoints;

  /// TextStyle for label text
  final TextStyle labelTextStyle;

  /// The width of the entire bar chart.
  final double barChartWidth;

  /// The height of the entire bar chart.
  final double barChartHeight;

  /// Creates a [BarChartLabel] widget.
  ///
  /// The [numAxisPoints] parameter specifies the number of axis points on the chart.
  /// The [labelTextStyle] parameter specifies the style of the label text.
  /// The [barChartWidth] parameter specifies the width of the entire bar chart.
  /// The [barChartHeight] parameter specifies the height of the entire bar chart.

  const BarChartLabel(
      {Key? key,
      this.numAxisPoints = 10,
      this.labelTextStyle = const TextStyle(color: Colors.black, fontSize: 12),
      this.barChartHeight = 600,
      this.barChartWidth = 1500})
      :
        // barWidth = (barChartWidth) / numAxisPoints,
        super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel(
        numAxisPoints: numAxisPoints,
        labelTextStyle: labelTextStyle,
        barChartHeight: barChartHeight,
        barChartWidth: barChartWidth);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartLabel renderObject) {
    renderObject
      ..numAxisPoints = numAxisPoints
      ..labelTextStyle = labelTextStyle
      ..barChartHeight = barChartHeight
      ..barChartWidth = barChartWidth;
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartLabel extends RenderBox {
  int renderNumAxisPoints;
  TextStyle renderLabelTextStyle;
  double renderBarChartWidth;
  double renderBarChartHeight;
  RenderBarChartLabel(
      {required int numAxisPoints,
      required TextStyle labelTextStyle,
      required double barChartHeight,
      required double barChartWidth})
      : renderNumAxisPoints = numAxisPoints,
        renderLabelTextStyle = labelTextStyle,
        renderBarChartWidth = barChartWidth,
        renderBarChartHeight = barChartHeight,
        super();

  /// The number of axis points.

  int get numAxisPoints => renderNumAxisPoints;

  set numAxisPoints(int value) {
    if (renderNumAxisPoints != value) {
      renderNumAxisPoints = value;
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

  /// Paints the axes of the bar chart.
  ///
  /// The [context] parameter provides the painting context, and the [offset]
  /// parameter specifies the offset at which to paint the axes.
  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    double dx = size.width;
    double dy = size.height;
    final double chartWidth = dx - 10.0 * 6;
    final double chartHeight = dy - 10.0;
    final double chartTop = (dy - chartHeight) / 2 + 10.0;
    final double chartLeft = (dx - chartWidth) / 2;

    final List<double> labelX = calculateLabelValues(0, 5.5, chartWidth, 100);
    final int numAxisPoints = labelX.length;

    for (int i = 0; i < numAxisPoints; i++) {
      final double x = chartLeft + i * chartWidth / numAxisPoints;
      _paintLabel(
          canvas,
          labelTextStyle,
          labelX[i].toString(),
          TextAlign.center,
          x - labelTextStyle.fontSize! / 2,
          chartTop + chartHeight + 8,
          chartWidth);
    }

    final List<double> labelY = calculateLabelValues(0, 5.5, chartWidth, 100);
    final int numAxisPointsY = labelY.length;

    for (int i = 0; i < numAxisPointsY; i++) {
      final double y =
          chartTop + chartHeight - i * chartHeight / numAxisPointsY;
      _paintLabel(
          canvas,
          labelTextStyle,
          labelY[i].toString(),
          TextAlign.center,
          chartLeft - labelTextStyle.fontSize! - 8,
          y - labelTextStyle.fontSize! / 2,
          chartLeft);
    }
  }

  /// Calculates the label values for the chart.
  ///
  /// The [getStart] parameter specifies the start value,
  /// the [getEnd] parameter specifies the end value,
  /// the [sizeValue] parameter specifies the size value,
  /// and the [intervalSize] parameter specifies the interval size.
  ///
  /// Returns a list of calculated label values.
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

  /// Paints a label on the canvas.
  ///
  /// The [canvas] parameter represents the canvas to paint on,
  /// the [style] parameter specifies the text style,
  /// the [text] parameter is the label text to paint,
  /// the [align] parameter specifies the text alignment,
  /// the [x] parameter specifies the x-coordinate of the label's position,
  /// and the [y] parameter specifies the y-coordinate of the label's position.
  void _paintLabel(Canvas canvas, TextStyle style, String text, TextAlign align,
      double x, double y, double width) {
    final TextSpan span = TextSpan(
      text: text,
      style: style,
    );
    final TextPainter tp = TextPainter(
      text: span,
      textAlign: align,
      textDirection: TextDirection.ltr,
    );
    tp.layout(maxWidth: width); // Use maxWidth to restrict the label's width
    tp.paint(canvas, Offset(x, y));
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

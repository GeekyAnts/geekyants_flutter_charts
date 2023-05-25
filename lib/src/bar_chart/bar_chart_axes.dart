import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that represents the axes labels of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes labels of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartAxes extends LeafRenderObjectWidget {
  /// TextStyle for label text
  final TextStyle textStyle;

  /// Creates a [BarChartAxes] widget.
  ///
  /// The [textStyle] parameter specifies the style of the label text.

  const BarChartAxes({
    Key? key,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 12),
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartAxes(
      textStyle: textStyle,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderBarChartAxes renderObject) {
    renderObject.textStyle = textStyle;
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartAxes extends RenderBox {
  TextStyle rendertextStyle;
  RenderBarChartAxes({
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
    final double chartWidth = size.width;
    final double chartHeight = size.height - offset.dy - 30;

    double xAxisPadding = 10;

    // To draw x axes

    Offset a = Offset(40, size.height - xAxisPadding - 12);
    Offset b = Offset(chartWidth - 10, size.height - xAxisPadding - 12);
    Offset newLinePointA = Offset(a.dx - 20, a.dy);
    canvas.drawLine(newLinePointA, b, Paint()..color = Colors.blueAccent);

    // To draw y axes

    a = Offset(xAxisPadding, offset.dy);
    b = Offset(xAxisPadding, chartHeight + offset.dy - xAxisPadding);
    Offset newLinePointBForY = Offset(a.dx + 20, a.dy + 7);
    canvas.drawLine(newLinePointBForY, Offset(b.dx + 20, b.dy + 28),
        Paint()..color = Colors.blueAccent);
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

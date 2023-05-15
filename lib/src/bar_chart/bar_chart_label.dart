import 'package:flutter/material.dart';

/// A widget that represents the axes labels of a bar chart.
///
/// This widget is used to draw the horizontal and vertical axes labels of a bar chart.
/// It takes several parameters that define the size and layout of the chart, as
/// well as the number of axis points and the bar width.
class BarChartLabel extends LeafRenderObjectWidget {
  const BarChartLabel({
    Key? key,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel();
  }
}

/// A render object that draws the axes of a bar chart.
///
/// This render object takes several parameters that define the size and layout of
/// the chart, as well as the number of axis points and the bar width. It then draws
/// the horizontal and vertical axes of the chart.
class RenderBarChartLabel extends RenderBox {
  RenderBarChartLabel() : super();

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
    const int numAxisPoints = 10;
    final double barWidth = chartWidth / numAxisPoints;

    // Draw x-axis points
    for (int i = 0; i <= numAxisPoints; i++) {
      final double x = chartLeft + i * barWidth;
      TextSpan span = TextSpan(
        text: '${i * 0.5}',
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
    for (int i = 0; i <= numAxisPoints; i++) {
      final double y = chartTop + chartHeight - i * chartHeight / numAxisPoints;
      TextSpan span = TextSpan(
        text: '${i * 0.5}',
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

  /// Sets the size of the render box.
  ///
  /// The layout constraints are used to constrain the size of the render box.
  @override
  void performLayout() {
    size = constraints.constrain(const Size(1500, 600));
  }
}

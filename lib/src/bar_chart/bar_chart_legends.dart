import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget for displaying legends in a bar chart.
class BarChartLegends extends LeafRenderObjectWidget {
  /// The text to be displayed for the X-axis legend.
  final String legendTextXAxis;

  /// The text to be displayed for the Y-axis legend.
  final String legendTextYAxis;

  /// The style of the X-axis legend text.
  final TextStyle legendTextXAxisStyle;

  /// The style of the Y-axis legend text.
  final TextStyle legendTextYAxisStyle;

  /// The color of the X-axis legend.
  final Color legendXAxisColor;

  /// The color of the Y-axis legend.
  final Color legendYAxisColor;

  /// The radius of the legend pointer.
  final double legendPointerRadius;

  /// Creates a BarChartLegends widget.
  const BarChartLegends({
    Key? key,
    this.legendTextXAxis = "X-Axis",
    this.legendTextYAxis = "Y-Axis",
    this.legendTextXAxisStyle =
        const TextStyle(color: Colors.black, fontSize: 10),
    this.legendTextYAxisStyle =
        const TextStyle(color: Colors.black, fontSize: 10),
    this.legendXAxisColor = Colors.black,
    this.legendYAxisColor = Colors.black,
    this.legendPointerRadius = 3,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return BarChartLegendsRenderObject(
      renderLegendTextXAxis: legendTextXAxis,
      renderLegendTextYAxis: legendTextYAxis,
      renderLegendTextXAxisStyle: legendTextXAxisStyle,
      renderLegendTextYAxisStyle: legendTextYAxisStyle,
      renderLegendXAxisColor: legendXAxisColor,
      renderLegendYAxisColor: legendYAxisColor,
      renderLegendPointerRadius: legendPointerRadius,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, BarChartLegendsRenderObject renderObject) {
    renderObject
      ..legendTextXAxis = legendTextXAxis
      ..legendTextYAxis = legendTextYAxis
      ..legendTextXAxisStyle = legendTextXAxisStyle
      ..legendTextYAxisStyle = legendTextYAxisStyle
      ..legendXAxisColor = legendXAxisColor
      ..legendYAxisColor = legendYAxisColor
      ..legendPointerRadius = legendPointerRadius;
  }
}

/// The render object for the BarChartLegends widget.
class BarChartLegendsRenderObject extends RenderBox {
  String renderLegendTextXAxis;
  String renderLegendTextYAxis;
  TextStyle renderLegendTextXAxisStyle;
  TextStyle renderLegendTextYAxisStyle;
  Color renderLegendXAxisColor;
  Color renderLegendYAxisColor;
  double renderLegendPointerRadius;
  double legendWidth = 0;

  /// Creates a BarChartLegendsRenderObject.
  BarChartLegendsRenderObject({
    required this.renderLegendTextXAxis,
    required this.renderLegendTextYAxis,
    required this.renderLegendTextXAxisStyle,
    required this.renderLegendTextYAxisStyle,
    required this.renderLegendXAxisColor,
    required this.renderLegendYAxisColor,
    required this.renderLegendPointerRadius,
  });

  String get legendTextXAxis => renderLegendTextXAxis;
  set legendTextXAxis(String value) {
    if (renderLegendTextXAxis != value) {
      renderLegendTextXAxis = value;
      markNeedsLayout();
    }
  }

  String get legendTextYAxis => renderLegendTextYAxis;
  set legendTextYAxis(String value) {
    if (renderLegendTextYAxis != value) {
      renderLegendTextYAxis = value;
      markNeedsLayout();
    }
  }

  TextStyle get legendTextXAxisStyle => renderLegendTextXAxisStyle;
  set legendTextXAxisStyle(TextStyle value) {
    if (renderLegendTextXAxisStyle != value) {
      renderLegendTextXAxisStyle = value;
      markNeedsLayout();
    }
  }

  TextStyle get legendTextYAxisStyle => renderLegendTextYAxisStyle;
  set legendTextYAxisStyle(TextStyle value) {
    if (renderLegendTextYAxisStyle != value) {
      renderLegendTextYAxisStyle = value;
      markNeedsLayout();
    }
  }

  Color get legendXAxisColor => renderLegendXAxisColor;
  set legendXAxisColor(Color value) {
    if (renderLegendXAxisColor != value) {
      renderLegendXAxisColor = value;
      markNeedsPaint();
    }
  }

  Color get legendYAxisColor => renderLegendYAxisColor;
  set legendYAxisColor(Color value) {
    if (renderLegendYAxisColor != value) {
      renderLegendYAxisColor = value;
      markNeedsPaint();
    }
  }

  double get legendPointerRadius => renderLegendPointerRadius;
  set legendPointerRadius(double value) {
    if (renderLegendPointerRadius != value) {
      renderLegendPointerRadius = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    final List<String> legendTexts = [legendTextXAxis, legendTextYAxis];
    final List<TextStyle> legendTextStyles = [
      legendTextXAxisStyle,
      legendTextYAxisStyle
    ];
    double maxWidth = 0;

    for (int i = 0; i < legendTexts.length; i++) {
      textPainter.text =
          TextSpan(text: legendTexts[i], style: legendTextStyles[i]);
      textPainter.layout();

      double width = textPainter.width;
      if (width > maxWidth) {
        maxWidth = width;
      }
    }

    // Formula to find diameter of the circle
    final circleWidth = 2 * math.pi * legendPointerRadius;
    final legendWidthX = maxWidth + circleWidth;
    final legendWidthY = maxWidth + circleWidth;

    legendWidth = legendWidthX > legendWidthY ? legendWidthX : legendWidthY;
    size = Size(legendWidth - (circleWidth / 2), textPainter.height * 2);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final circlePaint = Paint();
    final List<String> legendTexts = [legendTextXAxis, legendTextYAxis];
    final List<TextStyle> legendTextStyles = [
      legendTextXAxisStyle,
      legendTextYAxisStyle
    ];
    double maxWidth = 0;

    for (int i = 0; i < legendTexts.length; i++) {
      textPainter.text =
          TextSpan(text: legendTexts[i], style: legendTextStyles[i]);
      textPainter.layout();

      double width = textPainter.width;
      if (width > maxWidth) {
        maxWidth = width;
      }
    }

    paintLegends(
      canvas,
      legendTextXAxis,
      legendTextXAxisStyle,
      Offset(
          offset.dx + legendPointerRadius * 2, offset.dy - legendPointerRadius),
      legendXAxisColor,
      textPainter,
      circlePaint,
      legendPointerRadius,
      Offset(offset.dx + legendPointerRadius,
          offset.dy + (textPainter.height / 2) - legendPointerRadius),
    );

    paintLegends(
      canvas,
      legendTextYAxis,
      legendTextYAxisStyle,
      Offset(offset.dx + legendPointerRadius * 2,
          offset.dy + textPainter.height + legendPointerRadius),
      legendYAxisColor,
      textPainter,
      circlePaint,
      legendPointerRadius,
      Offset(offset.dx + legendPointerRadius,
          offset.dy + (textPainter.height * 1.5) + legendPointerRadius),
    );
  }

  void paintLegends(
      Canvas canvas,
      String text,
      TextStyle textStyle,
      Offset textOffset,
      Color circleColor,
      TextPainter textPainter,
      Paint circlePaint,
      double radius,
      Offset circleOffset) {
    textPainter.text = TextSpan(text: text, style: textStyle);
    textPainter.layout();
    textPainter.paint(canvas, textOffset);
    circlePaint.color = circleColor;
    canvas.drawCircle(circleOffset, radius, circlePaint);
  }
}

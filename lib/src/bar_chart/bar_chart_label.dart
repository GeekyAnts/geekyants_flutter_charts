import 'package:flutter/material.dart';

/// A widget that represents a label on a bar chart.
class BarChartLabel extends LeafRenderObjectWidget {
  /// The text to be displayed as the label.
  final String label;

  /// The style of the label text.
  final TextStyle style;

  /// The top position of the label.
  final double top;

  /// The left position of the label.
  final double left;

  /// Creates a new instance of [BarChartLabel].
  const BarChartLabel({
    Key? key,
    required this.label,
    required this.style,
    required this.top,
    required this.left,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel()
      ..label = label
      ..style = style
      ..top = top
      ..left = left;
  }
}

/// The render object for [BarChartLabel].
class RenderBarChartLabel extends RenderBox {
  late String label;
  late TextStyle style;
  late double top;
  late double left;

  /// Sets the top position of the label and marks the widget for layout.
  set setTop(double top) {
    this.top = top;
    markNeedsLayout();
  }

  /// Sets the left position of the label and marks the widget for layout.
  set setLeft(double left) {
    this.left = left;
    markNeedsLayout();
  }

  /// Sets the text of the label and marks the widget for layout.
  set setLabel(String label) {
    this.label = label;
    markNeedsLayout();
  }

  /// Sets the style of the label text and marks the widget for layout.
  set setStyle(TextStyle style) {
    this.style = style;
    markNeedsLayout();
  }

  /// Creates a new instance of [RenderBarChartLabel].
  RenderBarChartLabel() : super();

  @override
  void performLayout() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: label, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    size = constraints.constrain(textPainter.size);
  }
}

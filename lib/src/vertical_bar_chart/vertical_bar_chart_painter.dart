import 'package:flutter/rendering.dart';

/// A render object that displays a horizontal bar chart with axes and labels.
class RenderRVerticalBarChart extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData>,
        DebugOverflowIndicatorMixin {
  /// Creates a new instance of [RenderRVerticalBarChart].
  ///
  /// The chart can be customized with the following parameters:
  ///
  /// None of the parameters are required. However, if no children are added to
  /// the chart, it will be empty and not visible.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// RenderRVerticalBarChart(
  ///   children: [
  ///     // Add children widgets here
  ///   ],
  /// )
  /// ```
  ///
  /// The children widgets can be any widgets that extend [RenderBox] and can be
  /// rendered inside the bar chart. For example, you can use [RenderBox] widgets
  /// such as [RenderRect] or [RenderParagraph] to display bars or labels.
  ///
  /// The bar chart will automatically layout and position the children according
  /// to its own constraints and layout rules.

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    // This render object does not have a size, so return Size.zero

    final double actualParentWidth = constraints.maxWidth;
    final double actualParentHeight = constraints.maxHeight;
    return Size(actualParentWidth, actualParentHeight);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);

    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as MultiChildLayoutParentData;
      child
          .layout(BoxConstraints(maxHeight: size.height, maxWidth: size.width));

      childParentData.offset = const Offset(0, 0);

      child = childParentData.nextSibling;
    }
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! MultiChildLayoutParentData) {
      child.parentData = MultiChildLayoutParentData();
    }
  }
}

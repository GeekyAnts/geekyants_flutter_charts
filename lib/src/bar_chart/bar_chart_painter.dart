import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_charts/geekyants_flutter_charts.dart';

/// A render object that displays a horizontal bar chart with axes and labels.
class RenderRBarChart extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, BarChartParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, BarChartParentData>,
        DebugOverflowIndicatorMixin {
  /// Creates a new instance of [RenderRBarChart].
  ///
  /// The chart can be customized with the following parameters:
  ///
  /// None of the parameters are required. However, if no children are added to
  /// the chart, it will be empty and not visible.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// RenderRBarChart(
  ///   children: [
  ///     // Add children widgets here
  ///   ],
  /// )
  /// ```
  ///
  Color? yAxisColor = const Color(0x00000000);
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
    double barChartOffset = 0;
    double barChartLegendOffset = 0;

    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as BarChartParentData;
      BarChartTextTitleRenderObject? containerRef;
      child.layout(
        BoxConstraints(maxHeight: size.height, maxWidth: size.width),
        parentUsesSize: true,
      );

      switch (child.runtimeType) {
        case BarChartTextTitleRenderObject:
          containerRef = child as BarChartTextTitleRenderObject;
          yAxisColor = containerRef.renderTextStyle.color;
          childParentData.yAxisColor = yAxisColor;
          barChartOffset = child.size.height;
          final double textOffset = size.width / 2 + child.size.width / 2;
          childParentData.offset = Offset((size.width - textOffset), 0);
          break;
        case BarChartLegendsRenderObject:
          childParentData.yAxisColor = yAxisColor;
          barChartLegendOffset = child.size.width;
          childParentData.offset =
              Offset(size.width - barChartLegendOffset, size.height / 2);
          break;
        case RenderBarChartAxis:
          child.layout(BoxConstraints(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth - barChartLegendOffset));
          childParentData.offset = Offset(0, barChartOffset);
          break;
      }
      child = childParentData.nextSibling;
    }
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! BarChartParentData) {
      child.parentData = BarChartParentData();
    }
  }
}

class BarChartParentData extends MultiChildLayoutParentData {
  Color? yAxisColor;
}

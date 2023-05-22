import 'package:flutter/material.dart';
import 'package:geekyants_flutter_charts/src/vertical_bar_chart/vertical_bar_chart_scope.dart';

import 'vertical_bar_chart_label.dart';
import 'vertical_bar_chart_axes.dart';
import 'vertical_bar_chart_rulers.dart';
import 'vertical_bar_chart_painter.dart';

/// A widget that displays a bar chart.
///
/// The `VerticalBarChart` widget is used to render a bar chart. It takes a [VerticalBarChartLabel]
/// as a parameter, which is an optional [VerticalBarChartLabel] widget used to display
/// labels on the chart. The chart itself is rendered using the [RVerticalBarChartRenderer]
/// widget.
///
/// Example usage:
///
/// ```dart
/// VerticalBarChart(
///   VerticalBarChartLabel: VerticalBarChartLabel(),
/// )
/// ```
class VerticalBarChart extends StatefulWidget {
  /// Creates a bar chart.
  ///
  /// The [verticalBarChartLabel] parameter is optional and defaults to [VerticalBarChartLabel()].
  /// The [verticalBarChartAxes] and [verticalBarChartRulers] parameters are optional and can be used to customize the chart's axes and rulers.
  const VerticalBarChart({
    Key? key,
    this.verticalBarChartLabel = const VerticalBarChartLabel(),
    this.verticalBarChartAxes = const VerticalBarChartAxes(),
    this.verticalBarChartRulers = const VerticalBarChartRulers(),
  }) : super(key: key);

  /// The label widget to display on the bar chart.
  final VerticalBarChartLabel verticalBarChartLabel;

  /// The axes to display on the bar chart.
  final VerticalBarChartAxes verticalBarChartAxes;

  /// The rulers to display on the bar chart.
  final VerticalBarChartRulers verticalBarChartRulers;

  @override
  State<VerticalBarChart> createState() => _VerticalBarChartState();
}

class _VerticalBarChartState extends State<VerticalBarChart> {
  late List<Widget> _verticalBarChartWidgets;

  /// Initializes the state of the bar chart.
  @override
  void initState() {
    super.initState();
    _verticalBarChartWidgets = <Widget>[];
  }

  /// Adds a child widget to the bar chart.
  void _addChild(Widget child) {
    _verticalBarChartWidgets.add(VerticalBarChartScope(child: child));
  }

  /// Builds the child widgets of the bar chart.
  List<Widget> _buildChildWidgets(BuildContext context) {
    _verticalBarChartWidgets.clear();
    _addChild(widget.verticalBarChartLabel);
    _addChild(widget.verticalBarChartAxes);
    _addChild(widget.verticalBarChartRulers);
    return _verticalBarChartWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return RVerticalBarChartRenderer(
      verticalBarChart: widget,
      children: _buildChildWidgets(context),
    );
  }
}

/// A render object widget for rendering the bar chart.
class RVerticalBarChartRenderer extends MultiChildRenderObjectWidget {
  /// Creates a render object for the bar chart.
  ///
  /// The [VerticalBarChart] parameter is the corresponding [VerticalBarChart] widget.
  /// The [children] parameter is a list of child widgets to render.
  const RVerticalBarChartRenderer({
    Key? key,
    this.verticalBarChart,
    required List<Widget> children,
  }) : super(key: key, children: children);

  /// The corresponding bar chart widget.
  final VerticalBarChart? verticalBarChart;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRVerticalBarChart();
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderRVerticalBarChart renderObject) {
    super.updateRenderObject(context, renderObject);
  }
}

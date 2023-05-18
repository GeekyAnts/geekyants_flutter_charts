import 'package:flutter/material.dart';
import 'package:geekyants_flutter_charts/src/bar_chart/bar_chart_scope.dart';

import 'bar_chart_label.dart';
import 'bar_chart_axes.dart';
import 'bar_chart_rulers.dart';
import 'bar_chart_painter.dart';

/// A widget that displays a bar chart.
///
/// The `BarChart` widget is used to render a bar chart. It takes a [barChartLabel]
/// as a parameter, which is an optional [BarChartLabel] widget used to display
/// labels on the chart. The chart itself is rendered using the [RBarChartRenderer]
/// widget.
///
/// Example usage:
///
/// ```dart
/// BarChart(
///   barChartLabel: BarChartLabel(),
/// )
/// ```
class BarChart extends StatefulWidget {
  /// Creates a bar chart.
  ///
  /// The [barChartLabel] parameter is optional and defaults to [BarChartLabel()].
  /// The [barChartAxes] and [barChartRulers] parameters are optional and can be used to customize the chart's axes and rulers.
  const BarChart({
    Key? key,
    this.barChartLabel = const BarChartLabel(),
    this.barChartAxes = const BarChartAxes(),
    this.barChartRulers = const BarChartRulers(),
  }) : super(key: key);

  /// The label widget to display on the bar chart.
  final BarChartLabel barChartLabel;

  /// The axes to display on the bar chart.
  final BarChartAxes barChartAxes;

  /// The rulers to display on the bar chart.
  final BarChartRulers barChartRulers;

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late List<Widget> _barChartWidgets;

  /// Initializes the state of the bar chart.
  @override
  void initState() {
    super.initState();
    _barChartWidgets = <Widget>[];
  }

  /// Adds a child widget to the bar chart.
  void _addChild(Widget child) {
    _barChartWidgets.add(BarChartScope(child: child));
  }

  /// Builds the child widgets of the bar chart.
  List<Widget> _buildChildWidgets(BuildContext context) {
    _barChartWidgets.clear();
    _addChild(widget.barChartLabel);
    _addChild(widget.barChartAxes);
    _addChild(widget.barChartRulers);
    return _barChartWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return RBarChartRenderer(
      barChart: widget,
      children: _buildChildWidgets(context),
    );
  }
}

/// A render object widget for rendering the bar chart.
class RBarChartRenderer extends MultiChildRenderObjectWidget {
  /// Creates a render object for the bar chart.
  ///
  /// The [barChart] parameter is the corresponding [BarChart] widget.
  /// The [children] parameter is a list of child widgets to render.
  const RBarChartRenderer({
    Key? key,
    this.barChart,
    required List<Widget> children,
  }) : super(key: key, children: children);

  /// The corresponding bar chart widget.
  final BarChart? barChart;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRBarChart();
  }

  @override
  void updateRenderObject(BuildContext context, RenderRBarChart renderObject) {
    super.updateRenderObject(context, renderObject);
  }
}

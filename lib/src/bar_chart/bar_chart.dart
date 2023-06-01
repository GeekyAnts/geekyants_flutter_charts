import 'package:flutter/material.dart';
import 'package:geekyants_flutter_charts/src/bar_chart/bar_chart_scope.dart';

import 'bar_chart_label.dart';
import 'bar_chart_painter.dart';
import 'bar_chart_title.dart';

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
  const BarChart({
    Key? key,
    this.barChartLabel = const BarChartLabel(),
    this.title = const BarChartTextTitle(
        text: 'Flutter Chart Base',
        textStyle: TextStyle(fontSize: 100, color: Colors.black)),
  }) : super(key: key);

  /// The label widget to display on the bar chart.
  final BarChartLabel barChartLabel;

  /// The title widget to display on the bar chart.
  final BarChartTextTitle title;

  /// Widget to display X and Y axes on the bar chart.
  // final BarChartAxes barChartAxes;

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
  ///
  /// The [child] parameter is the widget to be added.
  /// The [fontSize] parameter is the font size for the child widget.
  void _addChild(Widget child) {
    _barChartWidgets.add(BarChartScope(
      child: child,
    ));
  }

  /// Builds the child widgets of the bar chart.
  ///
  /// The [context] parameter is the build context.
  List<Widget> _buildChildWidgets(BuildContext context) {
    _barChartWidgets.clear();
    _addChild(widget.title);
    _addChild(widget.barChartLabel);
    return _barChartWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RBarChartRenderer(
          barChart: widget,
          children: _buildChildWidgets(context),
        ),
      ],
    );
  }
}

/// A render object widget for rendering the bar chart.
class RBarChartRenderer extends MultiChildRenderObjectWidget {
  /// Creates a render object for the bar chart.
  ///
  /// The [barChart] parameter is the corresponding [BarChart] widget.
  /// The [children] parameter is a list of child widgets to render.
  RBarChartRenderer({
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
